#!/usr/bin/env python3
"""Aggregate the seven parties' annotations into the publishable measurement.

Every share here has a visible denominator, because the denominator is itself an
annotation decision: `structural`, `lead_in`, `fragment` and `rhetorical` units are
excluded per codebook §1, and where that boundary falls moves every share. A share
shown without its denominator hides the most uncertain part of the method.

Reliability: the codes were piloted by two annotators (alpha 0.827 topic, 0.852
statement type on a 175-unit sample), then the corpus was coded by one annotator —
the standard content-analysis sequence. This does NOT extend to T15/T16, which
entered the codebook after the pilot; see codebook §4.2 and the census.

    python3 scripts/aggregate_annotations.py
"""

import collections
import csv
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ANN = ROOT / "data" / "work" / "annotations"
OUT = ROOT / "data" / "work"
UNPILOTED = {"T15", "T16"}

TOPIC_NAMES = {
    "T00": "о самой партии и программе", "T01": "политические институты",
    "T02": "право и правопорядок", "T03": "макроэкономика, бюджет, налоги",
    "T04": "бизнес, труд, доходы", "T05": "недра, промышленность, энергетика",
    "T06": "экология и климат", "T07": "село и продовольствие",
    "T08": "инфраструктура, ЖКХ, жильё", "T09": "социальная защита и демография",
    "T10": "здравоохранение", "T11": "образование, наука, молодёжь",
    "T12": "культура, язык, идентичность", "T13": "внешняя политика и безопасность",
    "T14": "цифровизация", "T15": "насилие в семье и гендерное насилие",
    "T16": "защита животных", "T99": "прочее",
}


def main():
    parties, per_party = {}, {}
    for path in sorted(ANN.glob("*.tsv")):
        party = path.stem
        with path.open(encoding="utf-8", newline="") as handle:
            rows = list(csv.DictReader(handle, delimiter="\t"))
        parties[party] = rows
        sub = [r for r in rows if r["unit_kind_check"] == "substantive"]
        kinds = collections.Counter(r["unit_kind_check"] for r in rows)
        topics = collections.Counter(r["topic_primary"] for r in sub)
        types = collections.Counter(r["statement_type"] for r in sub)
        secondary = collections.Counter(
            r["topic_secondary"] for r in sub if r["topic_secondary"])
        per_party[party] = dict(
            units_total=len(rows),
            denominator=len(sub),
            unit_kinds=dict(kinds),
            topic_counts={t: topics[t] for t in sorted(topics)},
            topic_shares={t: topics[t] / len(sub) for t in sorted(topics)},
            # Secondary topics are additional context, NOT part of the shares:
            # a unit contributes to exactly one denominator slot.
            topic_secondary_counts={t: secondary[t] for t in sorted(secondary)},
            type_counts={t: types[t] for t in sorted(types)},
            type_shares={t: types[t] / len(sub) for t in sorted(types)},
            unpiloted_counts={t: topics[t] for t in sorted(UNPILOTED) if topics[t]},
        )

    payload = dict(
        method=dict(
            codebook="data/work/program_codebook.md (v1.7, frozen during coding)",
            precedents="data/work/annotation_precedents.md (П-01…П-15)",
            reliability=("Two annotators on a 175-unit pilot: Krippendorff alpha "
                         "0.827 (topic), 0.852 (statement type). Corpus then coded "
                         "by one annotator."),
            denominator="substantive units only, per codebook §1",
            unpiloted=("T15 and T16 entered the codebook after the pilot. Publish "
                       "counts and units, never shares; see codebook §4.2."),
            secondary_topics="context only, excluded from shares",
        ),
        totals=dict(
            units=sum(len(r) for r in parties.values()),
            denominator=sum(p["denominator"] for p in per_party.values()),
            parties=len(parties),
        ),
        topic_names=TOPIC_NAMES,
        per_party=per_party,
    )
    (OUT / "program_topic_metrics.json").write_text(
        json.dumps(payload, ensure_ascii=False, indent=1), encoding="utf-8")

    order = sorted(per_party, key=lambda p: -per_party[p]["denominator"])
    fields = ["party_id", "units_total", "denominator"] + \
             [f"share_{t}" for t in sorted(TOPIC_NAMES)] + \
             [f"type_{t}" for t in ("problem", "goal", "instrument",
                                    "commitment", "achievement", "description")]
    with (OUT / "program_topic_metrics.tsv").open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
        writer.writerow(fields)
        for party in order:
            row = per_party[party]
            writer.writerow(
                [party, row["units_total"], row["denominator"]]
                + [f"{row['topic_shares'].get(t, 0):.4f}" for t in sorted(TOPIC_NAMES)]
                + [f"{row['type_shares'].get(t, 0):.4f}" for t in
                   ("problem", "goal", "instrument", "commitment",
                    "achievement", "description")])

    print(f"{payload['totals']['units']} units, denominator "
          f"{payload['totals']['denominator']}, {len(parties)} parties")
    for party in order:
        row = per_party[party]
        top = max(row["topic_shares"].items(), key=lambda kv: kv[1])
        print(f"  {party:11} {row['denominator']:5} / {row['units_total']:5}  "
              f"крупнейшая тема {top[0]} {TOPIC_NAMES[top[0]][:28]:28} {top[1]:5.1%}"
              f"   T15/T16: {row['unpiloted_counts'] or '—'}")
    print("\nwrote program_topic_metrics.json and .tsv")
    print("доли по T15/T16 не публиковать — коды не проходили пилот (кодбук §4.2)")


if __name__ == "__main__":
    main()
