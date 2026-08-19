#!/usr/bin/env python3
"""Harness for annotating one party's programme in full, by one annotator.

Reliability for the piloted codes was established the proper way — two coders on a
175-unit sample, alpha 0.827 and 0.852 — so a single coder may now code the corpus.
That is the standard content-analysis sequence, not a shortcut. It does NOT extend
to T15/T16, which entered the codebook after the pilot; see codebook §4.2.

The harness exists because of a specific past failure: in pilot round 2 a
column-shift silently read `unclear` from the wrong field and produced alpha
-0.142. So every label is validated against the codebook vocabulary here, and a row
with the wrong column count is refused rather than parsed into whatever lines up.

    python3 scripts/annotate_party.py respublica --next 40   # emit a batch to code
    python3 scripts/annotate_party.py respublica --check     # validate + progress
"""

import argparse
import csv
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
UNITS = ROOT / "data" / "work" / "programs"
OUT = ROOT / "data" / "work" / "annotations"

TOPICS = {f"T{n:02d}" for n in range(17)} | {"T99"}
TYPES = {"problem", "goal", "instrument", "commitment", "achievement", "description"}
KINDS = {"substantive", "rhetorical", "structural", "lead_in", "fragment"}
FIELDS = ["unit_id", "unit_kind_check", "topic_primary", "topic_secondary",
          "statement_type", "unclear", "notes"]


def load_units(party):
    path = UNITS / f"units_{party}.tsv"
    with path.open(encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle, delimiter="\t"))


def load_done(party):
    path = OUT / f"{party}.tsv"
    if not path.exists():
        return {}
    with path.open(encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle, delimiter="\t"))
    return {row["unit_id"]: row for row in rows}


def validate(row, unit):
    """Return a list of problems. Empty means the row is usable."""
    problems = []
    if set(row) != set(FIELDS):
        return [f"columns are {sorted(row)}, expected {FIELDS}"]
    if row["unit_kind_check"] not in KINDS:
        problems.append(f"unit_kind_check={row['unit_kind_check']!r}")
    if row["unclear"] not in {"0", "1"}:
        problems.append(f"unclear={row['unclear']!r} (must be 0 or 1)")
    # Codebook §1: only substantive units form the denominator of the topic
    # shares. rhetorical is counted separately as its own quantity and carries no
    # topic, so a topic on it would leak into a share it is excluded from.
    coded = row["unit_kind_check"] == "substantive"
    if coded:
        if row["topic_primary"] not in TOPICS:
            problems.append(f"topic_primary={row['topic_primary']!r}")
        if row["statement_type"] not in TYPES:
            problems.append(f"statement_type={row['statement_type']!r}")
    else:
        # Codebook §1: these kinds carry no statement to attribute to a topic.
        if row["topic_primary"] or row["statement_type"]:
            problems.append("topic/type set on a unit that is outside the denominator")
    if row["topic_secondary"] and row["topic_secondary"] not in TOPICS:
        problems.append(f"topic_secondary={row['topic_secondary']!r}")
    if row["topic_secondary"] and row["topic_secondary"] == row["topic_primary"]:
        problems.append("topic_secondary repeats topic_primary")
    return problems


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("party")
    parser.add_argument("--next", type=int, default=0, help="emit this many uncoded units")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    units = load_units(args.party)
    done = load_done(args.party)
    index = {u["unit_id"]: u for u in units}

    if args.check:
        bad = 0
        for unit_id, row in done.items():
            if unit_id not in index:
                print(f"  {unit_id}: no such unit — was the corpus re-segmented?")
                bad += 1
                continue
            for problem in validate(row, index[unit_id]):
                print(f"  {unit_id}: {problem}")
                bad += 1
        print(f"{args.party}: {len(done)}/{len(units)} coded, {bad} problems")
        if not bad and done:
            kinds = {}
            for row in done.values():
                kinds[row["unit_kind_check"]] = kinds.get(row["unit_kind_check"], 0) + 1
            print("  по видам:", kinds)
            changed = [u for u, r in done.items()
                       if r["unit_kind_check"] != index[u]["unit_kind"]]
            print(f"  расходится с сегментатором по unit_kind: {len(changed)}")
        return

    todo = [u for u in units if u["unit_id"] not in done]
    print(f"{args.party}: {len(done)}/{len(units)} закодировано, осталось {len(todo)}\n")
    for unit in todo[:args.next or 25]:
        lead = re.sub(r"\s+", " ", unit["context_lead"]).strip()
        text = re.sub(r"\s+", " ", unit["text"]).strip()
        print(f"--- {unit['unit_id']}  [сегментатор: {unit['unit_kind']}]"
              f"{'  lead: ' + lead if lead else ''}")
        print(text)


if __name__ == "__main__":
    main()
