#!/usr/bin/env python3
"""Attach occupation classifications to candidates.

The labels themselves are produced by Claude (me) reading each unique
`position_raw` and recording a judgment in data/work/labels.tsv, keyed by the
same id as data/work/positions_unique.tsv. This script expands the short audit
codes to stable, frontend-localizable English enum codes and joins them onto
every candidate row — so the classification is auditable (open labels.tsv) and
reproducible (re-running this never changes a label; only editing labels.tsv
does).

Output: data/candidates_classified.csv = original columns + sector,
employer_type, is_party_insider, seniority, is_incumbent.
"""
import csv
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IN_CSV = os.path.join(ROOT, "data", "candidates.csv")
UNIQ = os.path.join(ROOT, "data", "work", "positions_unique.tsv")
LABELS = os.path.join(ROOT, "data", "work", "labels.tsv")
OUT_CSV = os.path.join(ROOT, "data", "candidates_classified.csv")

# Short audit code -> stable output enum. Display translations belong in the UI.
SECTOR = {
    "GOV": "GOVERNMENT", "BUS": "BUSINESS", "PARTY": "PARTY_APPARATUS",
    "LEG": "LEGISLATOR", "EDU": "EDUCATION_AND_SCIENCE", "HLTH": "HEALTHCARE",
    "CULT": "CULTURE", "SPORT": "SPORT", "CIV": "CIVIL_SOCIETY", "LAW": "LAW",
    "MEDIA": "MEDIA", "AGRI": "AGRICULTURE", "OTH": "OTHER_OR_UNCLEAR",
}
EMPLOYER = {
    "PRIV": "PRIVATE_COMPANY", "STATE": "STATE_BODY",
    "QUASI": "QUASI_GOVERNMENTAL", "POL": "POLITICAL_PARTY", "NGO": "NGO",
    "SELF": "SELF_EMPLOYED", "UNCL": "UNCLEAR",
}
SENIORITY = {
    "TOP": "TOP_EXECUTIVE", "SEN": "SENIOR_MANAGEMENT", "SPEC": "SPECIALIST",
    "LEG": "LEGISLATOR", "ENT": "ENTREPRENEUR", "UNCL": "UNCLEAR",
}
BOOLEAN = {"Y": "true", "N": "false"}

NEW_COLS = ["sector", "employer_type", "is_party_insider", "seniority", "is_incumbent"]


def load_position_ids():
    """position_raw text -> id (same mapping the dump script produced)."""
    m = {}
    with open(UNIQ, encoding="utf-8") as f:
        r = csv.DictReader(f, delimiter="\t")
        for row in r:
            m[row["position_raw"]] = row["id"]
    return m


def load_labels():
    """id -> dict of expanded English labels. Fails loudly on bad codes."""
    out = {}
    with open(LABELS, encoding="utf-8") as f:
        r = csv.DictReader(f, delimiter="\t")
        for row in r:
            out[row["id"]] = {
                "sector": SECTOR[row["sector"]],
                "employer_type": EMPLOYER[row["employer"]],
                "is_party_insider": BOOLEAN[row["insider"]],
                "seniority": SENIORITY[row["seniority"]],
                "is_incumbent": BOOLEAN[row["incumbent"]],
            }
    return out


def main():
    pos_id = load_position_ids()
    labels = load_labels()

    rows = list(csv.DictReader(open(IN_CSV, encoding="utf-8")))
    fieldnames = list(rows[0].keys()) + NEW_COLS

    missing = []
    for r in rows:
        pid = pos_id.get(r["position_raw"])
        lab = labels.get(pid) if pid is not None else None
        if lab is None:
            missing.append(r["position_raw"])
            for c in NEW_COLS:
                r[c] = ""
        else:
            r.update(lab)

    with open(OUT_CSV, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        w.writerows(rows)

    # sanity: every unique position must be labeled
    unlabeled = [p for p, i in pos_id.items() if i not in labels]
    print(f"Wrote {len(rows)} rows -> {OUT_CSV}")
    print(f"unique positions: {len(pos_id)} | labeled: {len(labels)} | "
          f"unlabeled: {len(unlabeled)} | rows missing label: {len(missing)}")
    for p in unlabeled[:20]:
        print("  UNLABELED:", p)

    # distributions
    def dist(col):
        c = {}
        for r in rows:
            c[r[col]] = c.get(r[col], 0) + 1
        return dict(sorted(c.items(), key=lambda kv: -kv[1]))

    for col in NEW_COLS:
        print(f"\n== {col} ==")
        for k, v in dist(col).items():
            print(f"  {v:4}  {k}")

    # sector x party cross-tab
    parties = sorted({r["party_id"] for r in rows})
    sectors = list(SECTOR.values())
    print("\n== sector x party (row counts) ==")
    print("sector".ljust(20) + "".join(p[:9].rjust(10) for p in parties))
    for s in sectors:
        line = s.ljust(20)
        for p in parties:
            n = sum(1 for r in rows if r["party_id"] == p and r["sector"] == s)
            line += (str(n) if n else "·").rjust(10)
        print(line)


if __name__ == "__main__":
    main()
