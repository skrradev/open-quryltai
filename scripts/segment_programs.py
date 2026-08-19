#!/usr/bin/env python3
"""Split the collected programmes into annotation units, per the codebook.

A unit is one atomic political statement. The segmenter is deterministic and
does no interpretation beyond three mechanical distinctions the codebook defines:

  substantive  a statement that can carry a topic and a stance
  rhetorical   an address or slogan with no policy content
  structural   headings, tables of contents, page furniture

Only `substantive` units form the denominator of any share, so this split is not
cosmetic: counting headings would credit a party for its typography.

Every unit records char offsets into the collected text whose sha256 is in
party_programs.tsv, plus its page and the heading path above it. That is what
makes a published number checkable — a reader fetches the document, verifies the
hash, applies the offsets and sees the same sentence.

Two outputs:
  data/work/programs/units_<party>.tsv   with text, for annotators (gitignored)
  data/work/program_units.tsv            offsets and labels only, publishable

    python3 scripts/segment_programs.py
"""

import csv
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
CACHE = WORK / "programs"
MANIFEST = WORK / "party_programs.tsv"
PUBLIC = WORK / "program_units.tsv"

# A line is a heading if it is short, has no terminal punctuation, and is either
# numbered or upper-case. Deliberately conservative: a missed heading costs one
# section path, a false one silently removes a real statement from the counts.
# The delimiter is REQUIRED for a plain integer. With it optional, every sentence
# that merely began with a figure ("30 млн тонн в год.", "400 тысяч тенге это…")
# was read as a numbered heading, so flow() kept the newline before it and the
# wrapped sentence above was published truncated — "расширены с 18 до почти".
# Multi-level numbers ("2.1 Название") stay headings without a delimiter, and
# adilet's "1 ЗАКОН И ПОРЯДОК" is still caught, by the upper-case ratio.
NUMBERED = re.compile(r"^\s*((?:[IVXL]+|\d+)(?:\.\d+)*)[.)]\s+\S"
                      r"|^\s*((?:[IVXL]+|\d+)(?:\.\d+)+)\s+\S")
# A line holding nothing but a section number ("V.6.", "3."). ak_zhol puts these
# on their own line above the title, so the title arrives with no number and was
# read as a statement. Joining the two is length-preserving, so offsets hold.
# The delimiter is required: a bare "23" on its own line is a page number, and
# joining it to the next line destroyed npk's contents page and turned 14 of its
# entries into statements.
SECTION_NUMBER = re.compile(r"^\s*(?:[IVXL]+|\d+)(?:\.\d+)*[.)]\s*$")
# A contents line with no dot leaders: a bullet or number, then a title, then the
# page. Anchored at both ends so a sentence that happens to end in a figure cannot
# match — it would have to also start with a bullet and stay under 80 characters.
TOC_TAIL = re.compile(r"^\s*(?:[•●▪·]|\d+)\s+\S.{0,78}\s\d{1,3}\s*$")
BULLET = re.compile(r"^\s*([•●▪·—–*]|[-–—]\s|\d+[.)]\s|[а-яa-z][.)]\s)")
TOC_DOTS = re.compile(r"\.{4,}\s*\d+\s*$")
PAGE_ONLY = re.compile(r"^\s*(стр\.?\s*)?\d{1,3}\s*$")
RHETORIC = re.compile(
    r"^(дорогие|уважаемые|соотечественники|казахстанцы|друзья|товарищи)\b|"
    r"^(вместе|мы верим|мы убеждены)\b.{0,60}[!]$|[!]\s*$", re.I)
# Not after an initial: "Академии имени Ы. Алтынсарина" is one name, and the
# splitter used to cut the unit at "Ы.".
SENTENCE_END = re.compile(
    r"(?<=[.!?])\s+(?=[«\"(]?[А-ЯЁA-ZӘҚҒҮҰӨҺІ])(?<![ ][А-ЯЁA-ZӘҚҒҮҰӨҺІ][.]\s)")
# Independent clauses inside one sentence. Only ";" — an em dash in Russian
# usually stands in for the verb ("«Әділет» — политическая опора курса"), so
# splitting on it produced 180 units that began mid-predicate.
CLAUSE_SPLIT = re.compile(r"\s*;\s+")
MIN_UNIT_CHARS = 25
ELECTION_YEAR = 2026
# Codebook §3.1: derived, never annotated. Manual coding of has_number agreed
# with a bare digit check 93% of the time, so this is measurement, not judgement.
HAS_NUMBER = re.compile(
    r"\d|\b(процент|тенге|МРП|кубометр|гектар|миллион|миллиард|тысяч)\w*", re.I)
FUTURE_YEAR = re.compile(r"\b(20[2-4]\d)\b")
DEADLINE_PHRASE = re.compile(r"\b(к|до)\s+20[2-4]\d|в течение\s+\d+\s+(лет|года|месяц)", re.I)


def derived_flags(text):
    has_number = "1" if HAS_NUMBER.search(text) else "0"
    years = [int(y) for y in FUTURE_YEAR.findall(text)]
    # A past date is a report, not a commitment: "с 24 мая 2025 года передали".
    future = any(year > ELECTION_YEAR for year in years)
    has_deadline = "1" if (future or DEADLINE_PHRASE.search(text)) else "0"
    return has_number, has_deadline


def load_pages(party):
    path = CACHE / f"{party}.pages.json"
    return json.loads(path.read_text(encoding="utf-8")) if path.exists() else []


def page_of(spans, position):
    for span in spans:
        if span["start"] <= position < span["end"]:
            return span["page"]
    return ""


def is_heading(line):
    stripped = line.strip()
    if not stripped or len(stripped) > 120:
        return False
    if TOC_DOTS.search(stripped) or PAGE_ONLY.match(stripped):
        return False
    if TOC_TAIL.match(stripped):
        return True
    if stripped.endswith((".", "!", "?", ":", ";", ",")):
        return False
    letters = [c for c in stripped if c.isalpha()]
    if not letters:
        return False
    upper_ratio = sum(1 for c in letters if c.isupper()) / len(letters)
    return upper_ratio > 0.7 or bool(NUMBERED.match(stripped))


def _heading_depth(stripped):
    """Nesting level of a numbered heading: "2.1 …" is depth 2."""
    match = NUMBERED.match(stripped)
    if not match:
        return 1
    return len((match.group(1) or match.group(2)).split("."))


def classify(text, is_item=False, has_lead=False):
    """unit_kind per codebook §1. lead_in and fragment stay out of the denominator:
    a lead-in's content is repeated in each item's context_lead, and a fragment
    has no meaning of its own to attribute to a topic."""
    stripped = text.strip()
    if stripped.endswith(":") and len(stripped) < 200 and not is_item:
        return "lead_in"
    # Starts mid-thought and has no lead-in to complete it.
    if stripped[:1].islower() and not is_item and not has_lead:
        return "fragment"
    if TOC_DOTS.search(stripped) or PAGE_ONLY.match(stripped) or TOC_TAIL.match(stripped):
        return "structural"
    letters = [c for c in stripped if c.isalpha()]
    if len(letters) < 12:
        return "structural"
    if RHETORIC.search(stripped) and len(stripped) < 120:
        return "rhetorical"
    return "substantive"


def split_line(line):
    """Sentences, then independent clauses. Yields (offset_in_line, text)."""
    for sentence in _spans(line, SENTENCE_END):
        start, text = sentence
        if len(text) <= 200:
            yield start, text
            continue
        for offset, clause in _spans(text, CLAUSE_SPLIT):
            yield start + offset, clause


def _spans(text, pattern):
    out, cursor = [], 0
    for match in pattern.finditer(text):
        piece = text[cursor:match.start()]
        if piece.strip():
            out.append((cursor, piece))
        cursor = match.end()
    tail = text[cursor:]
    if tail.strip():
        out.append((cursor, tail))
    return out


def flow(text):
    """Undo hard line wrapping inside paragraphs, preserving every offset.

    Ghostscript emits one line per *visual* line of the PDF, so sentences arrive
    chopped at the right margin — the first run of this produced units like
    "переменах и сосредоточиться на главном — созидательной", which is a line
    fragment, not a statement. Replacing an intra-paragraph newline with a space
    is length-preserving, so offsets still index the collected text exactly.

    A newline is kept as a boundary when the next line starts a heading or a
    bullet, when the previous line ends a sentence, or when the line is blank.
    """
    lines = text.split("\n")
    out = []
    for index, line in enumerate(lines):
        out.append(line)
        if index == len(lines) - 1:
            break
        nxt = lines[index + 1]
        # A heading wraps like any other line. Keeping the newline left the tail
        # ("политика и модернизация промышленности") standing alone as a statement.
        # A lower-case start with no bullet is the continuation signal.
        if (is_heading(line) and nxt.strip()[:1].islower()
                and not BULLET.match(nxt.strip())):
            out.append(" ")
            continue
        if SECTION_NUMBER.match(line) and nxt.strip():
            out.append(" ")
            continue
        boundary = (not line.strip() or not nxt.strip()
                    or is_heading(line) or is_heading(nxt)
                    or BULLET.match(nxt.strip())
                    or line.rstrip().endswith((".", "!", "?", ":", ";")))
        out.append("\n" if boundary else " ")
    return "".join(out)


def segment(party, text, spans):
    units, section, lead, sequence = [], [], "", 0
    position = 0
    for line in text.split("\n"):
        line_start = position
        position += len(line) + 1
        stripped = line.strip()
        if not stripped:
            continue
        indent = len(line) - len(line.lstrip())
        if is_heading(line):
            depth = _heading_depth(stripped)
            section = section[:depth - 1] + [stripped]
            lead = ""
            sequence += 1
            units.append(dict(
                unit_id=f"{party}-{sequence:04d}", party_id=party,
                char_start=line_start + indent, char_end=line_start + indent + len(stripped),
                page=page_of(spans, line_start), section_path=" / ".join(section),
                unit_kind="structural", context_lead="", text=stripped))
            continue
        # A colon-terminated line opens a list; following items belong to it. The
        # items often carry no bullet character at all — .docx keeps numbering in
        # the styles, not the text — so an item is recognised by starting
        # lower-case, which is how a continuation of the lead-in reads.
        is_item = bool(BULLET.match(stripped)) or stripped[:1].islower()
        if not is_item:
            lead = stripped if stripped.endswith(":") and len(stripped) < 200 else ""
        for offset, piece in split_line(line):
            body = piece.strip()
            if len(body) < MIN_UNIT_CHARS:
                continue
            start = line_start + offset + (len(piece) - len(piece.lstrip()))
            sequence += 1
            units.append(dict(
                unit_id=f"{party}-{sequence:04d}", party_id=party,
                char_start=start, char_end=start + len(body),
                page=page_of(spans, start), section_path=" / ".join(section),
                unit_kind=classify(body, is_item, bool(lead)),
                context_lead=lead if is_item else "",
                text=body))
    seen = {}
    for unit in units:
        if unit["unit_kind"] != "substantive":
            continue
        key = unit["text"]
        if key in seen:
            # Repeated verbatim inside one document: page furniture, not a second
            # statement. Counting it twice would inflate that party's totals.
            unit["unit_kind"] = "structural"
        seen[key] = True
    return units


def main():
    rows = {r["party_id"]: r for r in csv.DictReader(MANIFEST.open(encoding="utf-8"), delimiter="\t")}
    public_rows, summary = [], []
    for party, row in sorted(rows.items()):
        if row["status"] != "COLLECTED":
            continue
        text = (CACHE / f"{party}.txt").read_text(encoding="utf-8")
        flowed = flow(text)
        if len(flowed) != len(text):
            sys.exit(f"{party}: flow() changed the length, offsets would be wrong")
        units = segment(party, flowed, load_pages(party))
        for unit in units:
            # Offsets index the collected text; only intra-paragraph newlines
            # differ, so compare with those normalised.
            snippet = text[unit["char_start"]:unit["char_end"]].replace("\n", " ")
            if snippet != unit["text"]:
                sys.exit(f"{unit['unit_id']}: offsets do not round-trip\n"
                         f"  file: {snippet[:80]!r}\n  unit: {unit['text'][:80]!r}")
        for unit in units:
            unit["has_number"], unit["has_deadline"] = derived_flags(unit["text"])
        fields = ["unit_id", "party_id", "char_start", "char_end", "page",
                  "section_path", "unit_kind", "has_number", "has_deadline",
                  "context_lead", "text"]
        with (CACHE / f"units_{party}.tsv").open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
            writer.writeheader()
            writer.writerows([{k: str(u[k]).replace("\t", " ") for k in fields} for u in units])
        for unit in units:
            public_rows.append({k: unit[k] for k in fields if k != "text"} |
                               {"doc_sha256": row["content_sha256"]})
        kinds = {k: sum(1 for u in units if u["unit_kind"] == k)
                 for k in ("substantive", "rhetorical", "structural",
                           "lead_in", "fragment")}
        summary.append((party, len(units), kinds, len(text)))

    fields = ["unit_id", "party_id", "doc_sha256", "char_start", "char_end",
              "page", "section_path", "unit_kind", "has_number", "has_deadline",
              "context_lead"]
    with PUBLIC.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t",
                                lineterminator="\n", extrasaction="ignore")
        writer.writeheader()
        writer.writerows(public_rows)

    print(f"{'партия':11} {'всего':>6} {'содерж.':>8} {'вводных':>8} {'фрагм.':>7} "
          f"{'риторич.':>9} {'структ.':>8}")
    for party, total, kinds, chars in summary:
        print(f"{party:11} {total:6} {kinds['substantive']:8} {kinds['lead_in']:8} "
              f"{kinds['fragment']:7} {kinds['rhetorical']:9} {kinds['structural']:8}")
    print(f"\nвсего единиц: {len(public_rows)}; публикуемая таблица: {PUBLIC.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
