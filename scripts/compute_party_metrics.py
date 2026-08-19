#!/usr/bin/env python3
"""Compute comparative party metrics from the candidate registry.

Every number here is a **count or a share of official registry fields** — never a
judgement. That is the whole design constraint: an axis a reader cannot re-derive
from the migration is an opinion wearing a chart's clothes. Inputs are
V3__create_candidate.sql (the CEC appendix, field for field) and V2 for place
types; nothing is inferred about a candidate that the registry does not state.

Deliberately absent: anything scoring a party's quality, realism or sincerity, and
anything inferring ethnicity or language from names. Both are computable and both
would turn a reference into a commentator.

Outputs data/work/party_metrics.json (for charts) and data/work/party_metrics.tsv
(one row per party, for review).

    python3 scripts/compute_party_metrics.py
"""

import collections
import json
import math
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MIGRATIONS = ROOT / "backend" / "src" / "main" / "resources" / "db" / "migration"
WORK = ROOT / "data" / "work"
ELECTION_YEAR = 2026
YOUTH_MAX_AGE = 35
# Cities of republican significance: the comparison the geography metric is about.
REPUBLICAN_CITIES = ("astana", "almaty", "shymkent")
STATE_EMPLOYERS = ("STATE_BODY", "QUASI_GOVERNMENTAL")
POSITION_BUCKETS = ((1, 10, "1-10"), (11, 30, "11-30"), (31, 60, "31-60"), (61, 10**6, "61+"))

CANDIDATE = re.compile(
    r"\('(?P<party>[a-z_]+)', (?P<order>\d+), '(?P<surname>(?:[^']|'')*)', "
    r"'(?P<given>(?:[^']|'')*)', (?P<year>\d+), '(?P<sex>[MF])', "
    r"'(?P<position>(?:[^']|'')*)', '(?:[^']|'')*', '(?:[^']|'')*', "
    r"'(?:[^']|'')*', '(?P<place>[a-z_]+)', '(?P<sector>[A-Z_]+)', "
    r"'(?P<employer>[A-Z_]+)', (?P<insider>TRUE|FALSE), '(?P<seniority>[A-Z_]+)', "
    r"(?P<incumbent>TRUE|FALSE)\)")


def load_candidates():
    sql = (MIGRATIONS / "V3__create_candidate.sql").read_text(encoding="utf-8")
    rows = []
    for match in CANDIDATE.finditer(sql):
        rows.append(dict(
            party=match["party"], order=int(match["order"]),
            name=f"{match['surname']} {match['given']}".replace("''", "'"),
            age=ELECTION_YEAR - int(match["year"]), sex=match["sex"],
            position=match["position"], place=match["place"], sector=match["sector"],
            employer=match["employer"], insider=match["insider"] == "TRUE",
            seniority=match["seniority"], incumbent=match["incumbent"] == "TRUE"))
    if not rows:
        raise SystemExit("parsed no candidates — has the migration format changed?")
    return rows


def load_asset_coverage():
    """How many candidates each party has a photo for, from the research TSVs.

    This measures **what we managed to find**, not how open the party is. Label it
    that way wherever it is shown, or it becomes an unfair accusation.
    """
    import csv
    import glob
    found = collections.defaultdict(set)
    for path in glob.glob(str(WORK / "*.tsv")):
        with open(path, encoding="utf-8", newline="") as handle:
            reader = csv.DictReader(handle, delimiter="\t")
            columns = [c for c in ("photo_source_url", "primary_public_photo_url",
                                   "public_photo_url") if c in (reader.fieldnames or [])]
            if not columns or "list_order" not in (reader.fieldnames or []):
                continue
            for row in reader:
                if any((row.get(c) or "").strip() for c in columns):
                    found[row["party_id"]].add(row["list_order"])
    return {party: len(orders) for party, orders in found.items()}


def share(subset, whole):
    return len(subset) / len(whole) if whole else 0.0


def herfindahl(counts, total):
    """Concentration of a list across sectors: 1/n (even) .. 1 (single sector)."""
    return sum((value / total) ** 2 for value in counts.values()) if total else 0.0


def cosine(left, right):
    dot = sum(a * b for a, b in zip(left, right))
    norms = math.sqrt(sum(a * a for a in left)) * math.sqrt(sum(b * b for b in right))
    return dot / norms if norms else 0.0


def bucket_of(order):
    for low, high, label in POSITION_BUCKETS:
        if low <= order <= high:
            return label
    return POSITION_BUCKETS[-1][2]


def main():
    candidates = load_candidates()
    coverage = load_asset_coverage()
    parties = sorted({c["party"] for c in candidates},
                     key=lambda p: -sum(1 for c in candidates if c["party"] == p))
    sectors = sorted({c["sector"] for c in candidates})

    per_party = {}
    for party in parties:
        group = [c for c in candidates if c["party"] == party]
        women = [c for c in group if c["sex"] == "F"]
        top10 = [c for c in group if c["order"] <= 10]
        sector_counts = collections.Counter(c["sector"] for c in group)
        per_party[party] = dict(
            candidates=len(group),
            women=len(women),
            women_share=share(women, group),
            women_top10=sum(1 for c in top10 if c["sex"] == "F"),
            top10_size=len(top10),
            median_age=sorted(c["age"] for c in group)[len(group) // 2],
            mean_age=sum(c["age"] for c in group) / len(group),
            youth_share=share([c for c in group if c["age"] < YOUTH_MAX_AGE], group),
            incumbent_share=share([c for c in group if c["incumbent"]], group),
            insider_share=share([c for c in group if c["insider"]], group),
            state_share=share([c for c in group if c["employer"] in STATE_EMPLOYERS], group),
            top_executive_share=share([c for c in group if c["seniority"] == "TOP_EXECUTIVE"], group),
            capital_share=share([c for c in group if c["place"] in REPUBLICAN_CITIES], group),
            places=len({c["place"] for c in group}),
            sector_hhi=herfindahl(sector_counts, len(group)),
            sector_shares={s: sector_counts[s] / len(group) for s in sectors},
            median_position_chars=sorted(len(c["position"]) for c in group)[len(group) // 2],
            photos_found=coverage.get(party, 0),
        )
        # Women's share within each list-position band, plus the youth control:
        # if youth shows the same tail-loading, the gender finding is just a
        # generic quota-category effect rather than a gender one.
        by_bucket = {}
        for _, _, label in POSITION_BUCKETS:
            band = [c for c in group if bucket_of(c["order"]) == label]
            by_bucket[label] = dict(
                size=len(band),
                women_share=share([c for c in band if c["sex"] == "F"], band) if band else None,
                youth_share=share([c for c in band if c["age"] < YOUTH_MAX_AGE], band) if band else None)
        per_party[party]["by_position"] = by_bucket

    overall_buckets = {}
    for _, _, label in POSITION_BUCKETS:
        band = [c for c in candidates if bucket_of(c["order"]) == label]
        overall_buckets[label] = dict(
            size=len(band),
            women_share=share([c for c in band if c["sex"] == "F"], band),
            youth_share=share([c for c in band if c["age"] < YOUTH_MAX_AGE], band),
            # Which parties even reach this band — long lists dominate the tail,
            # so the aggregate must never be read without this.
            parties=sorted({c["party"] for c in band}))

    vectors = {p: [per_party[p]["sector_shares"][s] for s in sectors] for p in parties}
    similarity = [
        dict(a=a, b=b, cosine=cosine(vectors[a], vectors[b]))
        for index, a in enumerate(parties) for b in parties[index + 1:]]
    similarity.sort(key=lambda item: -item["cosine"])

    duplicates = [name for name, count
                  in collections.Counter(c["name"] for c in candidates).items() if count > 1]

    places = collections.Counter(c["place"] for c in candidates)
    payload = dict(
        generated_from="V3__create_candidate.sql (CEC decision appendices)",
        election_year=ELECTION_YEAR,
        method=dict(
            youth_max_age=YOUTH_MAX_AGE,
            republican_cities=list(REPUBLICAN_CITIES),
            state_employers=list(STATE_EMPLOYERS),
            position_buckets=[label for _, _, label in POSITION_BUCKETS],
            note=("Every value is a count or share of an official registry field. "
                  "No axis scores a party."),
        ),
        totals=dict(
            candidates=len(candidates),
            parties=len(parties),
            women_share=share([c for c in candidates if c["sex"] == "F"], candidates),
            capital_share=share([c for c in candidates if c["place"] in REPUBLICAN_CITIES], candidates),
            distinct_places=len(places),
            duplicate_names=duplicates,
        ),
        sectors=sectors,
        parties=parties,
        per_party=per_party,
        by_position_overall=overall_buckets,
        similarity=similarity,
        top_places=places.most_common(10),
    )

    (WORK / "party_metrics.json").write_text(
        json.dumps(payload, ensure_ascii=False, indent=1), encoding="utf-8")

    import csv
    columns = ["party_id", "candidates", "women_share", "women_top10", "median_age",
               "youth_share", "incumbent_share", "insider_share", "state_share",
               "top_executive_share", "capital_share", "places", "sector_hhi",
               "median_position_chars", "photos_found"]
    with (WORK / "party_metrics.tsv").open("w", encoding="utf-8", newline="") as handle:
        writer = csv.writer(handle, delimiter="\t", lineterminator="\n")
        writer.writerow(columns)
        for party in parties:
            row = per_party[party]
            writer.writerow([party] + [
                (f"{row[c]:.3f}" if isinstance(row[c], float) else row[c])
                for c in columns[1:]])

    print(f"{len(candidates)} candidates, {len(parties)} parties")
    print(f"women overall {payload['totals']['women_share']:.0%}, "
          f"in republican cities {payload['totals']['capital_share']:.0%}")
    print("women by list position:", {k: f"{v['women_share']:.0%}"
                                      for k, v in overall_buckets.items()})
    print("youth  by list position:", {k: f"{v['youth_share']:.0%}"
                                       for k, v in overall_buckets.items()})
    print(f"most similar: {similarity[0]['a']}~{similarity[0]['b']} "
          f"{similarity[0]['cosine']:.3f}; least: {similarity[-1]['a']}~"
          f"{similarity[-1]['b']} {similarity[-1]['cosine']:.3f}")
    print(f"duplicate names across lists: {len(duplicates)}")
    print(f"wrote party_metrics.json and party_metrics.tsv")


if __name__ == "__main__":
    main()
