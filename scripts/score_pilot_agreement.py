#!/usr/bin/env python3
"""Score inter-annotator agreement on the pilot.

Krippendorff's alpha (nominal) per field, plus one-vs-rest alpha per topic,
percent agreement, confusion matrices and the full disagreement list. The
thresholds it reports against are the ones fixed in codebook §8 before any
coding started.

Two honest limits on what this measures:

* Annotator A is Claude and annotator B is gpt-5.5. Agreement between two models
  says the codebook is machine-followable — not that it is reliable for humans.
  A human pair is still required before any of these numbers are published.
* Neither annotator is a gold standard, so this reports agreement, not accuracy.
  Anything phrased as precision or recall would imply one of them is right.

    python3 scripts/score_pilot_agreement.py
"""

import csv
import itertools
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PILOT = ROOT / "data" / "work" / "pilot"
FIELDS = ["unit_kind_check", "topic_primary", "statement_type", "unclear"]
# Codebook §8.
ALPHA_PUBLISH = 0.80
ALPHA_TENTATIVE = 0.667
SKEW_LIMIT = 0.90  # §8: alpha is not reported for a field this lopsided.


def alpha(pairs):
    """Krippendorff's alpha for nominal data, two coders, no missing values."""
    coincidence = defaultdict(float)
    for left, right in pairs:
        coincidence[(left, right)] += 1
        coincidence[(right, left)] += 1
    total = sum(coincidence.values())
    if total == 0:
        return None
    marginal = defaultdict(float)
    for (left, right), count in coincidence.items():
        marginal[left] += count
    observed = sum(c for (l, r), c in coincidence.items() if l != r) / total
    expected = sum(marginal[l] * marginal[r]
                   for l, r in itertools.product(marginal, repeat=2)
                   if l != r) / (total * (total - 1))
    if expected == 0:
        return 1.0 if observed == 0 else 0.0
    return 1 - observed / expected


def verdict(value):
    if value is None:
        return "—"
    if value >= ALPHA_PUBLISH:
        return "публиковать числом"
    if value >= ALPHA_TENTATIVE:
        return "только приблизительно"
    return "НЕ публиковать"


def load(sheet):
    path = PILOT / f"pilot_sheet_{sheet}.tsv"
    return {r["pilot_id"]: r for r in csv.DictReader(path.open(encoding="utf-8"), delimiter="\t")}


def main():
    a, b = load("a"), load("b")
    key = {r["pilot_id"]: r for r in
           csv.DictReader((PILOT / "pilot_key.tsv").open(encoding="utf-8"), delimiter="\t")}
    ids = [i for i in a if i in b and b[i].get("unit_kind_check")]
    print(f"единиц с разметкой обоих: {len(ids)} из {len(a)}\n")

    print(f"{'поле':18} {'совпало':>9} {'alpha':>7}  вывод")
    for field in FIELDS:
        pairs = [(a[i].get(field, "").strip(), b[i].get(field, "").strip()) for i in ids]
        # Blank means "not applicable" (non-substantive units); keep it as its own
        # category rather than dropping it, or the topic field is scored only on
        # the units both happened to call substantive.
        pairs = [(l or "—", r or "—") for l, r in pairs]
        same = sum(1 for l, r in pairs if l == r)
        value = alpha(pairs)
        share = Counter(v for pair in pairs for v in pair).most_common(1)[0][1] / (2 * len(pairs))
        if share > SKEW_LIMIT:
            # Codebook §8: one value holds more than 90% of cases, so chance
            # agreement is already near 1 and alpha measures the skew, not the
            # coding. Report prevalence and raw disagreements instead.
            differing = len(pairs) - same
            print(f"{field:18} {same/len(pairs):8.0%} {'—':>7}  перекос {share:.0%}: "
                  f"альфа не применяется, расхождений {differing}")
            continue
        print(f"{field:18} {same/len(pairs):8.0%} {value:7.3f}  {verdict(value)}")

    print("\nalpha по каждой теме (одна против всех):")
    topics = sorted({v for i in ids for v in (a[i].get("topic_primary", ""),
                                              b[i].get("topic_primary", "")) if v})
    for topic in topics:
        pairs = [((a[i].get("topic_primary") == topic), (b[i].get("topic_primary") == topic))
                 for i in ids]
        n = sum(1 for l, r in pairs if l or r)
        if n < 3:
            continue
        value = alpha([(str(l), str(r)) for l, r in pairs])
        print(f"  {topic}  n={n:3}  alpha {value:6.3f}  {verdict(value)}")

    print("\nсамые частые расхождения по теме:")
    confusion = Counter((a[i].get("topic_primary", "—"), b[i].get("topic_primary", "—"))
                        for i in ids if a[i].get("topic_primary") != b[i].get("topic_primary"))
    for (left, right), count in confusion.most_common(8):
        print(f"  A={left or '—':4} B={right or '—':4}  {count}")

    print("\nдоля unclear:")
    for name, sheet in (("A (Claude)", a), ("B (gpt-5.5)", b)):
        flagged = sum(1 for i in ids if str(sheet[i].get("unclear", "")).strip() == "1")
        print(f"  {name:12} {flagged:3} из {len(ids)} ({flagged/len(ids):.0%})")

    out = PILOT / "pilot_disagreements.tsv"
    with out.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
        writer.writerow(["pilot_id", "party", "field", "a", "b", "text", "note_a", "note_b"])
        for i in ids:
            for field in FIELDS:
                left, right = a[i].get(field, "").strip(), b[i].get(field, "").strip()
                if left != right:
                    writer.writerow([i, key[i]["party_id"], field, left, right,
                                     a[i]["text"][:160], a[i].get("notes", ""),
                                     b[i].get("notes", "")])
    print(f"\nразногласия построчно: {out.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
