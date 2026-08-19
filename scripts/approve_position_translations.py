#!/usr/bin/env python3
"""Apply an explicit editorial approval to every complete title translation."""
import csv
import os
from tempfile import NamedTemporaryFile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH = os.path.join(ROOT, "data", "work", "position_translations.tsv")
FIELDS = [
    "id", "position_raw", "position_kk", "position_ru", "status",
    "source_url", "review_notes",
]


def main():
    with open(PATH, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f, delimiter="\t"))
    incomplete = [row["id"] for row in rows if not row["position_kk"] or not row["position_ru"]]
    if incomplete:
        raise SystemExit(f"cannot approve incomplete IDs: {', '.join(incomplete)}")

    for row in rows:
        row["status"] = "APPROVED"
        if row["source_url"].startswith("machine:") and not row["review_notes"]:
            row["review_notes"] = "Approved by user"

    with NamedTemporaryFile("w", newline="", encoding="utf-8", delete=False, dir=os.path.dirname(PATH)) as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
        temp_path = f.name
    os.replace(temp_path, PATH)
    print(f"Approved {len(rows)} title translations.")


if __name__ == "__main__":
    main()
