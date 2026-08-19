#!/usr/bin/env python3
"""Draw the pilot annotation sample defined in the codebook (§9).

175 units, 25 per party, so every party's writing style is tested rather than
the corpus being dominated by the longest programme — Әділет alone is 41% of all
units, and a proportional pilot would tell us little about how the codebook
survives the other six.

Units are spread across each document by dividing it into as many position bands
as units drawn and taking one from each: consecutive units share a topic and
would flatter inter-annotator agreement.

Roughly one unit in six is `rhetorical` or `structural`, so the pilot also checks
the segmenter's mechanical unit_kind rather than only the human-coded fields.

Blinding is partial and honestly so: `party_id` is withheld from the annotator
sheet, but a programme names itself — a unit reading "«Әділет» — политическая
опора курса" identifies its party whatever we do. The point is to remove the
default cue, not to claim blindness we do not have.

Outputs (all gitignored, they carry programme text):
  pilot/pilot_sheet_a.tsv, pilot_sheet_b.tsv   empty forms, one per annotator
  pilot/pilot_key.tsv                          pilot_id -> unit_id, party
Run with the same seed to reproduce the identical draw.

    python3 scripts/make_pilot_sample.py [--seed 20260818] [--per-party 25]
"""

import argparse
import csv
import random
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CACHE = ROOT / "data" / "work" / "programs"
PILOT = ROOT / "data" / "work" / "pilot"
NON_SUBSTANTIVE_SHARE = 1 / 6

# Filled in by the annotator. Kept short: a pilot form with thirty columns gets
# filled carelessly, and every extra field is another source of disagreement.
ANNOTATION_FIELDS = [
    "unit_kind_check",   # substantive / rhetorical / structural / lead_in / fragment
    "topic_primary",     # T01..T14, T99
    "topic_secondary",   # optional
    "statement_type",    # problem/goal/instrument/commitment/achievement/description
    "unclear",           # 1 if the codebook does not decide this case
    "notes",             # what was ambiguous — this is what fixes the codebook
]
# has_number and has_deadline left the sheet at codebook 1.2: they are derived by
# script, so asking two annotators to agree about them measured nothing.


def spread(units, count, rng):
    """One unit per position band, so the draw covers the whole document."""
    if len(units) <= count:
        return list(units)
    edges = [round(index * len(units) / count) for index in range(count + 1)]
    return [rng.choice(units[edges[i]:edges[i + 1]] or units) for i in range(count)]


def main():
    parser = argparse.ArgumentParser()
    # Round 2 draws a fresh sample: codebook 1.2 changed the rules, and reusing
    # round 1's units would report agreement on rules that no longer apply.
    parser.add_argument("--seed", type=int, default=20260819)
    parser.add_argument("--per-party", type=int, default=25)
    args = parser.parse_args()
    rng = random.Random(args.seed)

    sampled = []
    for path in sorted(CACHE.glob("units_*.tsv")):
        party = path.name[len("units_"):-len(".tsv")]
        rows = list(csv.DictReader(path.open(encoding="utf-8"), delimiter="\t"))
        other = [r for r in rows if r["unit_kind"] != "substantive"]  # incl. lead_in, fragment
        substantive = [r for r in rows if r["unit_kind"] == "substantive"]
        want_other = min(len(other), round(args.per_party * NON_SUBSTANTIVE_SHARE))
        picked = spread(substantive, args.per_party - want_other, rng)
        picked += spread(other, want_other, rng)
        sampled.extend(picked)

    rng.shuffle(sampled)
    PILOT.mkdir(parents=True, exist_ok=True)
    key_fields = ["pilot_id", "unit_id", "party_id", "page", "section_path", "unit_kind"]
    sheet_fields = ["pilot_id", "context_lead", "text"] + ANNOTATION_FIELDS

    with (PILOT / "pilot_key.tsv").open("w", encoding="utf-8", newline="") as handle:
        key = csv.DictWriter(handle, fieldnames=key_fields, delimiter="\t",
                             lineterminator="\n", extrasaction="ignore")
        key.writeheader()
        for index, unit in enumerate(sampled, start=1):
            key.writerow({"pilot_id": f"P-{index:03d}", **unit})

    for sheet in ("a", "b"):
        with (PILOT / f"pilot_sheet_{sheet}.tsv").open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=sheet_fields, delimiter="\t",
                                    lineterminator="\n", extrasaction="ignore")
            writer.writeheader()
            for index, unit in enumerate(sampled, start=1):
                writer.writerow({"pilot_id": f"P-{index:03d}",
                                 "context_lead": unit["context_lead"],
                                 "text": unit["text"]})

    parties = {}
    kinds = {}
    for unit in sampled:
        parties[unit["party_id"]] = parties.get(unit["party_id"], 0) + 1
        kinds[unit["unit_kind"]] = kinds.get(unit["unit_kind"], 0) + 1
    print(f"выборка: {len(sampled)} единиц, seed {args.seed}")
    print("по партиям:", dict(sorted(parties.items())))
    print("по типу:   ", dict(sorted(kinds.items())))
    print(f"\nформы для разметчиков: {(PILOT / 'pilot_sheet_a.tsv').relative_to(ROOT)}, "
          f"{(PILOT / 'pilot_sheet_b.tsv').relative_to(ROOT)}")
    print(f"ключ (не открывать до сведения результатов): "
          f"{(PILOT / 'pilot_key.tsv').relative_to(ROOT)}")


if __name__ == "__main__":
    main()
