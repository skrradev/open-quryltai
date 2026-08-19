#!/usr/bin/env python3
"""Delete alternative-role objects that are byte-identical to a candidate's primary.

`parliament_primary_photo_promotions.tsv` promoted Parliament portraits by
*copying* them to the primary key instead of referencing them, so
candidates/<party>/<order>.jpg and candidates/<party>/<order>/parliament.jpg are
the same file under two keys. The alternative then carries no information: the
primary row already records source_kind = MAZHILIS.

Only byte-identical pairs are touched, compared by sha256 of the actual objects.
Alternatives whose bytes differ are genuinely different photos and are left alone.

Deletion is irreversible, so this refuses to delete anything it cannot first
verify it holds a local copy of, under data/work/photos/_bucket_cache. Run the
seed generator first if the cache is cold.

    python3 scripts/prune_duplicate_assets.py              # report only
    python3 scripts/prune_duplicate_assets.py --apply      # actually delete
"""

import argparse
import csv
import hashlib
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from upload_r2_assets import ASSET_PREFIX, delete_object, get_object, list_objects

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
CACHE = WORK / "photos" / "_bucket_cache"
PROFILES = WORK / "parliament_incumbent_profiles.tsv"

MAIN_KEY = re.compile(rf"^{ASSET_PREFIX}/(?P<party>[a-z_]+)/(?P<order>\d+)\.(?P<ext>jpg|jpeg|png|webp)$")
ALT_KEY = re.compile(rf"^{ASSET_PREFIX}/(?P<party>[a-z_]+)/(?P<order>\d+)/"
                     r"(?P<variant>parliament|npk-team|wikimedia)\.(?P<ext>jpg|jpeg|png|webp)$")
PRUNED_NOTE = ("Alternative object deleted as byte-identical to the primary photo; "
               "see primary_r2_key.")


def cached_or_fetch(key):
    """Return object bytes, filling the local cache so a deletion stays recoverable."""
    target = CACHE / key.replace("/", "__")
    if target.exists():
        return target.read_bytes()
    data = get_object(key)
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
    return data


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true", help="delete; without it, only report")
    args = parser.parse_args()

    objects = dict(list_objects(f"{ASSET_PREFIX}/"))
    primaries = {}
    alternatives = {}
    for key in sorted(objects):
        match = MAIN_KEY.match(key)
        if match:
            primaries.setdefault((match.group("party"), match.group("order")), []).append(key)
            continue
        match = ALT_KEY.match(key)
        if match:
            alternatives.setdefault((match.group("party"), match.group("order")), []).append(key)

    redundant = []
    kept = 0
    for slot, alts in sorted(alternatives.items(), key=lambda item: (item[0][0], int(item[0][1]))):
        digests = {hashlib.sha256(cached_or_fetch(key)).hexdigest() for key in primaries.get(slot, [])}
        for alt in alts:
            if hashlib.sha256(cached_or_fetch(alt)).hexdigest() in digests:
                redundant.append((slot, alt, objects[alt]))
            else:
                kept += 1

    freed = sum(size for _, _, size in redundant)
    for slot, alt, size in redundant:
        print(f"  {alt:48} {size / 1024:8.0f} KB  (identical to primary of {slot[0]}/{slot[1]})")
    print(f"\n{len(redundant)} redundant, {freed / 1048576:.1f} MB; "
          f"{kept} alternatives have distinct bytes and stay")
    if not redundant:
        return
    if not args.apply:
        print("report only — pass --apply to delete")
        return

    for _, alt, _ in redundant:
        if not (CACHE / alt.replace("/", "__")).exists():
            raise SystemExit(f"refusing to delete {alt}: no local copy cached")
    for _, alt, _ in redundant:
        delete_object(alt)
        print(f"deleted {alt}")

    # The profiles TSV pointed at the objects just removed; leave the row but
    # stop advertising a key that no longer resolves.
    pruned = {alt for _, alt, _ in redundant}
    with PROFILES.open(encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        fields = list(reader.fieldnames)
        rows = list(reader)
    if "photo_status" in fields:
        touched = 0
        for row in rows:
            if (row.get("r2_key") or "").strip() in pruned:
                row["r2_key"] = ""
                row["public_photo_url"] = ""
                row["photo_status"] = "PRUNED_DUPLICATE_OF_PRIMARY"
                row["asset_rights_note"] = PRUNED_NOTE
                touched += 1
        with PROFILES.open("w", encoding="utf-8", newline="") as handle:
            writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
            writer.writeheader()
            writer.writerows(rows)
        print(f"updated {touched} rows in {PROFILES.relative_to(ROOT)}")
    print("\nregenerate the seed so the removed rows leave the migration:")
    print("  python3 scripts/generate_candidate_photo_seed.py --publish")


if __name__ == "__main__":
    main()
