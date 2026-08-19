#!/usr/bin/env python3
"""Re-encode the PNG candidate photos as JPEG, and relocate the Wikimedia ones.

PNG is a poor container for a photograph: after the 1024 px normalisation the
remaining PNGs were still the largest objects in the bucket, ~1 MB each against
~120 KB for a comparable JPEG. Converting changes the object key, so every
reference has to move with it — that is the point of doing it in a script.

The conversion collides with four `respublica` candidates that have **two**
photographs: the party-site one as `.png` and a Wikimedia one already sitting at
`<order>.jpg`. The party photo is the chosen primary, so it takes `<order>.jpg`,
and the Wikimedia photo moves to `<order>/wikimedia.jpg` as its own role rather
than being overwritten. That also removes the long-standing "two sources, one key
slot" ambiguity: afterwards each candidate has exactly one main-photo object.

Order matters — Wikimedia objects are relocated before the converted party photos
are written to the keys they used to occupy.

    python3 scripts/convert_png_photos.py            # report only
    python3 scripts/convert_png_photos.py --apply
"""

import argparse
import csv
import glob
import re
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from imagetools import has_jpeg_metadata, image_size, strip_jpeg_metadata
from upload_r2_assets import ASSET_PREFIX, delete_object, get_object, list_objects, put_object

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
CACHE = WORK / "photos" / "_bucket_cache"
ORIGINALS = WORK / "photos" / "_bucket_originals"
PUBLIC_BASE = "https://assets.open-quryltai.org"
QUALITY = 85
PNG_KEY = re.compile(
    rf"^{ASSET_PREFIX}/(?P<party>[a-z_]+)/(?P<order>\d+)(?P<variant>\.|/(?:parliament|npk-team)\.)png$")
WIKIMEDIA_DATASET = "verified_candidate_biographies.tsv"


def cached(key):
    target = CACHE / key.replace("/", "__")
    if target.exists():
        return target.read_bytes()
    data = get_object(key)
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
    return data


def to_jpeg(data, quality, workdir):
    source = workdir / "in.png"
    target = workdir / "out.jpg"
    source.write_bytes(data)
    subprocess.run(["sips", "-s", "format", "jpeg", "-s", "formatOptions", str(quality),
                    str(source), "--out", str(target)],
                   check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not target.exists():
        raise RuntimeError("sips produced no JPEG")
    result = target.read_bytes()
    if has_jpeg_metadata(result):
        result = strip_jpeg_metadata(result)
    if image_size(result) != image_size(data):
        raise RuntimeError("conversion changed the pixel dimensions")
    source.unlink()
    target.unlink()
    return result


def wikimedia_keys():
    """r2_keys that came from the Wikimedia dataset."""
    path = WORK / WIKIMEDIA_DATASET
    keys = set()
    for row in csv.DictReader(path.open(encoding="utf-8"), delimiter="\t"):
        key = (row.get("r2_key") or "").strip()
        if key:
            keys.add(key)
    return keys


def retarget_tsvs(moves, apply):
    """Rewrite r2_key / public_photo_url wherever they point at a moved object."""
    touched = 0
    for path in sorted(glob.glob(str(WORK / "*.tsv"))):
        with open(path, encoding="utf-8", newline="") as handle:
            reader = csv.DictReader(handle, delimiter="\t")
            fields = reader.fieldnames
            rows = list(reader)
        columns = [c for c in ("r2_key", "primary_r2_key") if c in (fields or [])]
        if not columns:
            continue
        changed = 0
        for row in rows:
            for column in columns:
                old = (row.get(column) or "").strip()
                if old in moves:
                    row[column] = moves[old]
                    url_column = column.replace("r2_key", "public_photo_url")
                    if url_column in fields and (row.get(url_column) or "").strip():
                        row[url_column] = f"{PUBLIC_BASE}/{moves[old]}"
                    changed += 1
        if changed and apply:
            with open(path, "w", encoding="utf-8", newline="") as handle:
                writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
                writer.writeheader()
                writer.writerows(rows)
        if changed:
            print(f"  {Path(path).name}: {changed} references")
            touched += changed
    return touched


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true")
    parser.add_argument("--quality", type=int, default=QUALITY)
    args = parser.parse_args()

    objects = dict(list_objects(f"{ASSET_PREFIX}/"))
    from_wikimedia = wikimedia_keys()

    relocations = []
    conversions = []
    with tempfile.TemporaryDirectory() as raw:
        workdir = Path(raw)
        for key in sorted(objects):
            match = PNG_KEY.match(key)
            if not match:
                continue
            target = key[: -len("png")] + "jpg"
            if target in objects:
                if target not in from_wikimedia:
                    raise SystemExit(
                        f"{target} already exists and is not a known Wikimedia object; "
                        "resolve by hand before converting")
                moved = f"{ASSET_PREFIX}/{match.group('party')}/{match.group('order')}/wikimedia.jpg"
                relocations.append((target, moved, objects[target]))
            data = cached(key)
            jpeg = to_jpeg(data, args.quality, workdir)
            conversions.append(dict(png=key, jpg=target, before=objects[key],
                                    after=len(jpeg), data=jpeg,
                                    dim="x".join(map(str, image_size(jpeg)))))

        print("relocations (Wikimedia photo makes way for the party primary):")
        for old, new, size in relocations:
            print(f"  {old:34} -> {new:44} {size / 1024:6.0f} KB")
        print("\nconversions:")
        for item in conversions:
            print(f"  {item['png']:34} -> {item['jpg']:44}"
                  f" {item['before'] / 1024:6.0f} KB -> {item['after'] / 1024:5.0f} KB  {item['dim']}")
        before = sum(item["before"] for item in conversions)
        after = sum(item["after"] for item in conversions)
        print(f"\n{len(conversions)} conversions: {before / 1048576:.1f} MB -> {after / 1048576:.1f} MB"
              f" ({after / before:.1%}), {len(relocations)} relocations")

        moves = {old: new for old, new, _ in relocations}
        moves.update({item["png"]: item["jpg"] for item in conversions})
        print("\nreferences to retarget:")
        retarget_tsvs(moves, apply=False)

        if not args.apply:
            print("\nreport only — pass --apply to rewrite the bucket")
            return

        ORIGINALS.mkdir(parents=True, exist_ok=True)
        # 1. Move the Wikimedia objects out of the primary key slot first.
        for old, new, _ in relocations:
            data = cached(old)
            put_object(new, data, "image/jpeg")
            (CACHE / new.replace("/", "__")).write_bytes(data)
            (ORIGINALS / old.replace("/", "__")).write_bytes(data)
            delete_object(old)
            (CACHE / old.replace("/", "__")).unlink(missing_ok=True)
            print(f"moved {old} -> {new}")
        # 2. Then write the converted party photos, and drop the PNGs.
        for item in conversions:
            (ORIGINALS / item["png"].replace("/", "__")).write_bytes(cached(item["png"]))
            put_object(item["jpg"], item["data"], "image/jpeg")
            (CACHE / item["jpg"].replace("/", "__")).write_bytes(item["data"])
            delete_object(item["png"])
            (CACHE / item["png"].replace("/", "__")).unlink(missing_ok=True)
            print(f"converted {item['png']} -> {item['jpg']}")

    print("\nretargeting references:")
    retarget_tsvs(moves, apply=True)
    print("\nregenerate the seed:")
    print("  python3 scripts/generate_candidate_photo_seed.py --publish")


if __name__ == "__main__":
    main()
