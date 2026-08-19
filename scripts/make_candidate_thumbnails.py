#!/usr/bin/env python3
"""Generate list-view thumbnails for the candidate portraits already in R2.

Source objects are the main candidate photos, `candidates/<party_id>/<order>.<ext>`.
Alternatives such as `<order>/parliament.<ext>` are skipped: list views show one
avatar per candidate, and the alternatives are not it.

Each thumbnail is written to `candidates/<party_id>/<order>/thumb.jpg`, which
follows the existing convention of keeping per-candidate variants under
`<order>/`. Thumbnails are **always JPEG regardless of the source format**, so a
client can build the URL from party and list_order alone without knowing whether
the original was JPEG, PNG or WebP:

    https://assets.open-quryltai.org/candidates/<party_id>/<order>/thumb.jpg

Resizing uses `sips`, which is macOS-only but already a dependency of
`crop_ak_zhol_portraits.py`; it reads WebP fine but cannot write it, hence JPEG.
Credentials come from the root .env and are never printed.

    python3 scripts/make_candidate_thumbnails.py --dry-run
    python3 scripts/make_candidate_thumbnails.py --party adilet
    python3 scripts/make_candidate_thumbnails.py --force
"""

import argparse
import re
import subprocess
import sys
import tempfile
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from imagetools import image_size, strip_jpeg_metadata
from upload_r2_assets import ASSET_PREFIX, get_object, list_objects, put_object

MAIN_KEY = re.compile(rf"^{ASSET_PREFIX}/(?P<party>[a-z_]+)/(?P<order>\d+)\.(?P<ext>jpg|jpeg|png|webp)$")
THUMB_NAME = "thumb.jpg"
MAX_EDGE = 320
QUALITY = 70
# Which source wins when one candidate has several main-photo objects. `png`
# leads because that is what the TSVs record as public_photo_url for the only
# known collisions; see the warning this script prints.
EXT_PRECEDENCE = ("png", "webp", "jpg", "jpeg")


RETRIES = 3


def thumb_key(party, order):
    return f"{ASSET_PREFIX}/{party}/{order}/{THUMB_NAME}"


def with_retries(action, what):
    """Some originals run to several MB and the connection occasionally stalls;
    a transient read timeout should not abandon the whole run."""
    for attempt in range(1, RETRIES + 1):
        try:
            return action()
        except (RuntimeError, OSError) as error:
            if attempt == RETRIES:
                raise
            print(f"  retry {attempt}/{RETRIES - 1} for {what}: {error}")
            time.sleep(2 * attempt)


def make_thumbnail(source_bytes, suffix, max_edge, quality, workdir):
    """Return JPEG bytes scaled so the long edge is at most `max_edge`.

    Never upscales: a source already within `max_edge` is only re-encoded.
    Metadata is stripped afterwards because sips copies EXIF and XMP from the
    source into the thumbnail and adds a Photoshop IRB block of its own — that
    would republish photographer and copyright tags on every list avatar.
    """
    source = workdir / f"in{suffix}"
    target = workdir / "out.jpg"
    source.write_bytes(source_bytes)
    resize = ["-Z", str(max_edge)] if max(image_size(source_bytes)) > max_edge else []
    subprocess.run(
        ["sips", "-s", "format", "jpeg", "-s", "formatOptions", str(quality),
         *resize, str(source), "--out", str(target)],
        check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL,
    )
    if not target.exists():
        raise RuntimeError(f"sips produced no output for {suffix} source")
    data = target.read_bytes()
    if data[:2] != b"\xff\xd8":
        raise RuntimeError("sips output is not a JPEG")
    source.unlink()
    target.unlink()
    return strip_jpeg_metadata(data)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true", help="report what would be built, upload nothing")
    parser.add_argument("--force", action="store_true", help="rebuild thumbnails that already exist")
    parser.add_argument("--party", help="restrict to one party_id")
    parser.add_argument("--max-edge", type=int, default=MAX_EDGE, help=f"long edge in px (default {MAX_EDGE})")
    parser.add_argument("--quality", type=int, default=QUALITY, help=f"JPEG quality (default {QUALITY})")
    args = parser.parse_args()

    sizes = dict(list_objects(f"{ASSET_PREFIX}/"))

    # A few candidates have their main photo stored under two extensions at once
    # (respublica 43/55/60/66 are both .jpg and .png). Both match MAIN_KEY, so
    # group by candidate and choose deterministically instead of letting key
    # order decide which one the thumbnail is built from.
    variants = {}
    for key, size in sorted(sizes.items()):
        match = MAIN_KEY.match(key)
        if not match:
            continue
        variants.setdefault((match.group("party"), match.group("order")), []).append(
            (EXT_PRECEDENCE.index(match.group("ext")), key, size, "." + match.group("ext")))

    sources = []
    collisions = []
    for (party, order), found in sorted(variants.items(), key=lambda item: (item[0][0], int(item[0][1]))):
        if args.party and party != args.party:
            continue
        found.sort()
        _, key, size, suffix = found[0]
        if len(found) > 1:
            collisions.append(f"{party}/{order}: " + ", ".join(entry[3] for entry in found)
                              + f" -> using {suffix}")
        destination = thumb_key(party, order)
        if destination in sizes and not args.force:
            continue
        sources.append((key, size, destination, suffix))

    if collisions:
        print(f"warning: {len(collisions)} candidates have more than one main photo object:")
        for line in collisions:
            print(f"  {line}")

    existing = sum(1 for key in sizes if key.endswith("/" + THUMB_NAME))
    print(f"{len(sizes)} objects under {ASSET_PREFIX}/, {existing} thumbnails already present")
    if not sources:
        print("nothing to build")
        return
    print(f"to build: {len(sources)}")
    if args.dry_run:
        for key, size, destination, _ in sources[:10]:
            print(f"  {key} ({size / 1024:.0f} KB) -> {destination}")
        if len(sources) > 10:
            print(f"  ... and {len(sources) - 10} more")
        print("dry run: nothing uploaded")
        return

    built = 0
    source_bytes = thumb_bytes = 0
    with tempfile.TemporaryDirectory() as raw:
        workdir = Path(raw)
        for key, size, destination, suffix in sources:
            original = with_retries(lambda: get_object(key), f"GET {key}")
            data = make_thumbnail(original, suffix, args.max_edge, args.quality, workdir)
            with_retries(lambda: put_object(destination, data, "image/jpeg"), f"PUT {destination}")
            built += 1
            source_bytes += size
            thumb_bytes += len(data)
            print(f"{destination:42} {len(data) / 1024:6.1f} KB  (from {size / 1024:8.0f} KB)")

    print(f"\nbuilt {built} thumbnails: {thumb_bytes / 1048576:.2f} MB "
          f"from {source_bytes / 1048576:.1f} MB of originals "
          f"({thumb_bytes / source_bytes:.1%})")


if __name__ == "__main__":
    main()
