#!/usr/bin/env python3
"""Parse CEC RK party-list appendices (.docx) into data/candidates.csv.

The .docx files live in list/. Each is a single table with rows:
    № | "Surname \n Given Names" | free text ("1984 г.р., <position>, проживает в <place>")
Some parties leave the № column empty (order = running index).

No external deps: .docx is unzipped and its XML walked with the stdlib.
Nothing is fabricated — if a field cannot be parsed it is left empty and the
row is logged to stderr.
"""
import csv
import glob
import os
import re
import sys
import zipfile
from xml.etree import ElementTree as ET

W = "{http://schemas.openxmlformats.org/wordprocessingml/2006/main}"

# filename (basename, stripped) -> (stable party ID, official count)
PARTY = {
    "Әділет": ("adilet", 186),
    "Respublica": ("respublica", 75),
    "Народная партия Казахстана": ("npk", 72),
    "Ауыл": ("auyl", 69),
    "Ак жол": ("ak_zhol", 63),
    "Байтақ": ("baitaq", 47),
    "ОСДП": ("osdp", 33),
}

# --- place gazetteer (nominative, reference data — not invented per-row) ---
CITIES = {
    "Астана", "Алматы", "Шымкент", "Караганда", "Атырау", "Актау", "Актобе",
    "Кокшетау", "Тараз", "Костанай", "Петропавловск", "Уральск", "Семей",
    "Кызылорда", "Павлодар", "Талдыкорган", "Усть-Каменогорск", "Жезказган",
    "Косшы", "Конаев", "Шу", "Талгар", "Арыс", "Экибастуз", "Сатпаев",
    "Кентау", "Сарыагаш", "Туркестан", "Текели", "Темиртау", "Курчатов",
    "Аркалык", "Каскелен",
}
# common OCR/case slips seen in the source, mapped to canonical nominative
CITY_FIXES = {
    "Кызыорде": "Кызылорда",
    "Усть-Каменагорске": "Усть-Каменогорск",
}


def cell_text(tc):
    """All paragraphs of a table cell, joined by newline (preserves structure)."""
    return "\n".join(
        "".join(n.text or "" for n in p.iter(W + "t")) for p in tc.iter(W + "p")
    )


def squash(s):
    """Collapse in-cell line breaks and repeated whitespace."""
    return " ".join(s.split())


def normalize_city(word):
    """Prepositional/genitive city form -> nominative, validated against gazetteer."""
    word = word.strip(" .,")
    if word in CITY_FIXES:
        return CITY_FIXES[word]
    if word in CITIES:
        return word
    # try stripping the case ending and re-forming the nominative
    cands = []
    if word.endswith("е"):
        stem = word[:-1]
        cands += [stem, stem + "й", stem + "а"]      # Павлодаре, Семее, Караганде
    if word.endswith("ы"):
        cands += [word[:-1] + "а"]                    # Астаны -> Астана
    for c in cands:
        if c in CITIES:
            return c
    return None  # unresolved -> caller leaves place empty + logs


def normalize_region(word):
    """'Павлодарской области' adjective -> 'Павлодарская область'."""
    adj = word.strip()
    if adj.endswith("ой"):
        adj = adj[:-2] + "ая"
    elif adj.endswith("ей"):
        adj = adj[:-2] + "яя"
    return adj + " область"


def parse_place(tail):
    """Return (place_type, place) from the text after the last 'проживает в'.

    Only the primary locality is normalized; a failure returns ('', '')."""
    t = squash(tail).strip(" .,")
    t = re.sub(r"^городе\.\s*", "городе ", t)  # 'городе. Астана' hiccup

    # Specific locality prefixes are matched before the region fallback, so a
    # "село X ... области" row is keyed on its primary locality, not the region.
    m = re.match(r"(сел[еоа]|аул[еа]?)\s+([^\s,]+)", t)
    if m:
        return "село", m.group(2)
    m = re.match(r"поселк[еа]?\s+([^\s,]+)", t)
    if m:
        return "поселок", m.group(1)
    # city: "городе <Name>" (name may be followed by район/область — take first)
    m = re.match(r"город[еа]?\s+([^\s,]+)", t)
    if m:
        city = normalize_city(m.group(1))
        return ("город", city) if city else ("город", "")
    m = re.match(r"(\S+ском)\s+районе\b", t)
    if m:
        return "район", m.group(1)[:-2] + "ий район"
    # region: "<Adj>ой области" (anchored — no leading locality left by now)
    m = re.match(r"(\S+(?:ой|ей))\s+области\b", t)
    if m:
        return "область", normalize_region(m.group(1))
    # region named form: "области Жетісу"
    m = re.match(r"области\s+(\S+)", t)
    if m:
        return "область", "область " + m.group(1)
    # bare city with no "городе" prefix, e.g. "проживает в Астане"
    m = re.match(r"([А-ЯЁA-ZӘҒҚҢӨҰҮҺІ][^\s,]+)$", t)
    if m:
        city = normalize_city(m.group(1))
        if city:
            return "город", city
    return "", ""


PATRO_M = ("ович", "евич", "улы", "ұлы")
PATRO_F = ("овна", "евна", "қызы", "кызы")


def guess_gender(surname, given_names):
    """By patronymic ending only; no patronymic -> '' (do not guess).

    The Russian -ович/-овна appears as a trailing given-name token, while the
    Kazakh -ұлы/-қызы is often written in the surname slot; both are checked."""
    toks = [t.lower() for t in (surname + " " + given_names).split()]
    if any(t.endswith(PATRO_M) for t in toks):
        return "M"
    if any(t.endswith(PATRO_F) for t in toks):
        return "F"
    return "?"  # undetermined — marked so it can be found and filled by hand


# birth year: 4 digits + tolerant "г.р." ("1980 .р.", "1988 г.р", "1988г.р.")
YEAR_RE = re.compile(r"\b(19\d\d|20\d\d)\s*[гГ]?\s*\.?\s*р\.?", re.UNICODE)


def parse_freetext(raw):
    """-> (birth_year, position_raw, residence_raw). Un-anchored parts stay ''."""
    text = squash(raw)
    birth_year = ""
    position = ""
    residence = ""

    ym = YEAR_RE.search(text)
    body = text
    if ym:
        birth_year = ym.group(1)
        body = text[ym.end():].lstrip(" ,")

    # last 'проживает в' splits position from residence
    idx = body.rfind("проживает в")
    if idx >= 0:
        position = body[:idx].strip(" ,")
        residence = body[idx + len("проживает в"):].strip(" ,")
    else:
        position = body.strip(" ,")
    return birth_year, position, residence


def parse_name(raw):
    """Surname = first token, given names = the rest (collapsing line breaks)."""
    s = squash(raw)
    toks = s.split()
    if not toks:
        return "", ""
    return toks[0], " ".join(toks[1:])


def iter_rows(path):
    root = ET.fromstring(zipfile.ZipFile(path).read("word/document.xml"))
    for tbl in root.iter(W + "tbl"):
        for tr in tbl.iter(W + "tr"):
            cells = [cell_text(tc) for tc in tr.iter(W + "tc")]
            if len(cells) >= 3:
                yield cells


def party_for(path):
    base = os.path.splitext(os.path.basename(path))[0].strip()
    if base in PARTY:
        return PARTY[base]
    raise SystemExit(f"unknown party file: {base!r}")


# `place` preserves the parser's normalized source-language value.  The UI must
# use place_id to obtain the reviewed Kazakh/Russian display names from
# data/places.csv.
PLACE_TYPE_CODES = {
    "город": "CITY", "область": "REGION", "район": "DISTRICT",
    "село": "VILLAGE", "поселок": "SETTLEMENT",
}


def load_place_ids(path):
    """Map (English place-type enum, source canonical name) to stable ID."""
    result = {}
    with open(path, newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f):
            result[(row["place_type"], row["name_source"])] = row["place_id"]
    return result


FIELDS = ["party_id", "order", "surname", "given_names", "birth_year", "age_2026",
          "gender_guess", "position_raw", "residence_raw", "place_type", "place",
          "place_id"]


def main():
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    out_dir = os.path.join(root, "data")
    os.makedirs(out_dir, exist_ok=True)
    out_path = os.path.join(out_dir, "candidates.csv")
    place_ids = load_place_ids(os.path.join(out_dir, "places.csv"))

    all_rows = []
    per_party = {}   # label -> list of row dicts
    empties = []     # rows with any empty field, for reporting

    for path in sorted(glob.glob(os.path.join(root, "list", "*.docx"))):
        party_id, _ = party_for(path)
        per_party.setdefault(party_id, [])
        for i, cells in enumerate(iter_rows(path), start=1):
            num = squash(cells[0])
            order = num if num.isdigit() else str(i)
            surname, given = parse_name(cells[1])
            byear, pos, res = parse_freetext(cells[2])
            ptype_source, place = parse_place(res) if res else ("", "")
            ptype = PLACE_TYPE_CODES.get(ptype_source, "")
            place_id = place_ids.get((ptype, place), "") if place else ""
            age = str(2026 - int(byear)) if byear else ""
            row = {
                "party_id": party_id, "order": order,
                "surname": surname, "given_names": given,
                "birth_year": byear, "age_2026": age,
                "gender_guess": guess_gender(surname, given),
                "position_raw": pos, "residence_raw": res,
                "place_type": ptype, "place": place, "place_id": place_id,
            }
            all_rows.append(row)
            per_party[party_id].append(row)

    with open(out_path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=FIELDS)
        w.writeheader()
        w.writerows(all_rows)

    # ---- per-party diagnostics ----
    log = sys.stderr
    print(f"\nWrote {len(all_rows)} rows -> {out_path}\n", file=log)
    print(f"{'party':<12} {'rows':>5} {'no_year':>8} {'no_place':>9} {'no_gender':>10}",
          file=log)
    for party_id in sorted(per_party):
        rows = per_party[party_id]
        no_year = sum(1 for r in rows if not r["birth_year"])
        no_place = sum(1 for r in rows if not r["place"])
        no_gender = sum(1 for r in rows if r["gender_guess"] == "?")
        print(f"{party_id:<12} {len(rows):>5} {no_year:>8} {no_place:>9} {no_gender:>10}",
              file=log)

    # ---- rows with any empty field ----
    for r in all_rows:
        empty_fields = [k for k in FIELDS if r[k] == "" or (k == "gender_guess" and r[k] == "?")]
        if empty_fields:
            empties.append((r, empty_fields))
    print(f"\n{len(empties)} rows have at least one empty field:", file=log)
    for r, ef in empties:
        print(f"  [{r['party_id']}] #{r['order']} {r['surname']} {r['given_names']} "
              f"-> empty: {','.join(ef)} | res={r['residence_raw']!r}", file=log)

    # ---- reconcile against official counts ----
    print("\nCount reconciliation vs official:", file=log)
    ok = True
    for party_id, (_, expected) in {v[0]: (None, v[1]) for v in PARTY.values()}.items():
        got = len(per_party.get(party_id, []))
        mark = "OK" if got == expected else "MISMATCH"
        if got != expected:
            ok = False
        print(f"  {party_id:<12} parsed={got:>4} official={expected:>4}  {mark}", file=log)
    print(("\nAll parties match official counts."
           if ok else "\nMISMATCH found — data left as-is (not patched)."), file=log)


if __name__ == "__main__":
    main()
