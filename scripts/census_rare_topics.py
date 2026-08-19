#!/usr/bin/env python3
"""Exhaustive census of the rare topic codes T15 and T16.

These two codes entered the codebook after the pilot, so no agreement was ever
measured for them, and with one annotator none can be: Krippendorff's alpha needs
two coders. Rather than publish a share nobody checked, this drops sampling
entirely — the themes are rare enough to **enumerate**.

The method is recall-first. Patterns here are deliberately over-broad and expected
to produce mostly false positives; every candidate is then decided by hand and the
decision recorded with its reason, so the output is an audit trail rather than a
keyword count. A pattern that only matched true cases would be the thing to
distrust: it would mean the pattern, not a coder, did the coding.

What this buys, given one annotator: every unit is published by offset, so a
reader opens the source document and checks the call. That is a weaker guarantee
than intersubjective agreement and must be labelled as such — see codebook §4.2.

    python3 scripts/census_rare_topics.py          # list candidates for coding
    python3 scripts/census_rare_topics.py --apply  # write the coded census
"""

import argparse
import csv
import glob
import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CACHE = ROOT / "data" / "work" / "programs"
OUT = ROOT / "data" / "work" / "rare_topic_census.tsv"

# Over-broad on purpose: "животн" alone drags in the whole livestock sector, which
# is exactly the boundary T16 has to be tested against.
NETS = {
    # The first version keyed on "насил" and missed respublica-0218 entirely —
    # "сталкинг, похищения с целью заключения брака, угрозах и причинении вреда
    # женщинам, старикам и детям" names the acts without ever using the word. Found
    # by annotating the party in full, which is the argument for reading a corpus
    # rather than only querying it.
    "T15": r"насил|жесток\w* обращени\w* с (детьми|женщ)|фемицид|побо[иея]|"
           r"буллинг|травл|кризисн\w* центр|пострадавш|сталкинг|домогательств|"
           r"похищени\w*( \w+){0,3} брак|кража невест|вред\w*( \w+){0,2} женщин|"
           r"защит\w*( \w+){0,3} женщин|против\w*( \w+){0,2} женщин",
    "T16": r"животн|питомц|собак|кошк|зоопарк|приют|фаун|бездомн",
}

# Hand decisions are keyed by a hash of the unit's normalised text, NOT by unit_id.
# Ids are positional: fixing the segmenter renumbered every unit after the edit and
# silently detached all 22 decisions from their units. The text is what was judged,
# so the text is what the decision is filed under.
DECISIONS_PATH = ROOT / "data" / "work" / "rare_topic_decisions.tsv"


def load_units():
    units = []
    for path in sorted(glob.glob(str(CACHE / "units_*.tsv"))):
        with open(path, encoding="utf-8", newline="") as handle:
            units.extend(list(csv.DictReader(handle, delimiter="\t")))
    return units


def text_key(text):
    return hashlib.sha1(re.sub(r"\s+", " ", text).strip().encode()).hexdigest()[:12]


def load_decisions():
    if not DECISIONS_PATH.exists():
        return {}
    with DECISIONS_PATH.open(encoding="utf-8", newline="") as handle:
        return {row["text_key"]: row for row in csv.DictReader(handle, delimiter="\t")}


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()

    units = load_units()
    decisions = load_decisions()
    candidates = []
    for code, net in NETS.items():
        pattern = re.compile(net, re.I)
        for unit in units:
            if unit["unit_kind"] != "substantive":
                continue
            if pattern.search(unit["text"]):
                candidates.append((code, unit))

    print(f"{len(units)} units, {len(candidates)} candidates from the wide nets\n")
    for code, unit in candidates:
        decision = decisions.get(text_key(unit["text"]), {})
        verdict = decision.get("decision", "—")
        mark = {"accept": "✓", "reject": "✗"}.get(verdict, "?")
        text = re.sub(r"\s+", " ", unit["text"])
        print(f"{mark} {code} {unit['unit_id']:22} {unit['party_id']:11} {text[:96]}")
        if decision.get("reason"):
            print(f"      → {decision['reason']}")

    undecided = [u for _, u in candidates if text_key(u["text"]) not in decisions]
    if undecided:
        print(f"\n{len(undecided)} candidates still undecided — code them in "
              f"{DECISIONS_PATH.relative_to(ROOT)} before --apply")

    if not args.apply:
        return
    if undecided:
        raise SystemExit("refusing to write a census with undecided candidates")

    accepted = [(c, u) for c, u in candidates
                if decisions[text_key(u["text"])]["decision"] == "accept"
                and decisions[text_key(u["text"])]["code"] == c]
    fields = ["topic", "unit_id", "party_id", "char_start", "char_end", "page", "reason"]
    with OUT.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
        writer.writerow(fields)
        for code, unit in sorted(accepted, key=lambda item: (item[0], item[1]["party_id"])):
            writer.writerow([code, unit["unit_id"], unit["party_id"], unit["char_start"],
                             unit["char_end"], unit["page"],
                             decisions[text_key(unit["text"])]["reason"]])
    by_code = {c: sum(1 for k, _ in accepted if k == c) for c in NETS}
    print(f"\ncensus written: {OUT.relative_to(ROOT)}  {by_code}")
    print("counts are exact (full enumeration); no alpha — single annotator, see §4.2")


if __name__ == "__main__":
    main()
