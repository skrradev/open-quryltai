#!/usr/bin/env python3
"""Create or synchronize the reviewed title-translation worksheet.

Existing review work is preserved when the source position list is regenerated.
Only the stable position ID and the exact source title are authoritative inputs.
"""
import csv
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
POSITIONS = os.path.join(ROOT, "data", "work", "positions_unique.tsv")
OUT = os.path.join(ROOT, "data", "work", "position_translations.tsv")
FIELDS = [
    "id", "position_raw", "position_kk", "position_ru", "status",
    "source_url", "review_notes",
]


def load_existing():
    if not os.path.exists(OUT):
        return {}
    with open(OUT, newline="", encoding="utf-8") as f:
        return {row["id"]: row for row in csv.DictReader(f, delimiter="\t")}


def main():
    existing = load_existing()
    with open(POSITIONS, newline="", encoding="utf-8") as f:
        positions = list(csv.DictReader(f, delimiter="\t"))

    rows = []
    for position in positions:
        old = existing.get(position["id"], {})
        # Do not carry a translation over if an ID ever gets a different title.
        if old.get("position_raw") != position["position_raw"]:
            old = {}
        rows.append({
            "id": position["id"],
            "position_raw": position["position_raw"],
            "position_kk": old.get("position_kk", ""),
            # Source titles are Russian-language official-list text. Preserve
            # them in the Russian public field until a reviewer records a
            # necessary correction or an official alternative.
            "position_ru": old.get("position_ru") or position["position_raw"],
            "status": (old.get("status") if old.get("status") not in (None, "", "TODO")
                       else "RU_READY"),
            "source_url": old.get("source_url", ""),
            "review_notes": old.get("review_notes", ""),
        })

    with open(OUT, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    print(f"Wrote {len(rows)} rows -> {OUT}")


if __name__ == "__main__":
    main()
