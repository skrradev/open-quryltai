#!/usr/bin/env python3
"""Downscale oversized candidate photos already in R2, in place.

The older importers uploaded camera originals without resizing, so the bucket
holds portraits up to 5504x8256 / 6 MB that are never displayed above ~200 px.
This rewrites each oversized object under its own key, so nothing that references
it has to change: r2_key, public_photo_url and the thumbnails all stay valid.

Format is preserved deliberately. Converting the PNGs to JPEG would save more,
but it would change the object key and break every reference to it. sips also
cannot write WebP — which costs nothing here, since no WebP object is oversized.

Objects are overwritten, so the previous bytes are copied to
data/work/photos/_bucket_originals first and the working cache in
data/work/photos/_bucket_cache is updated to the new bytes, keeping
generate_candidate_photo_seed.py honest.

Re-run the seed generator afterwards: width, height, byte_size and content_hash
all change.

    python3 scripts/normalise_bucket_photos.py            # report only
    python3 scripts/normalise_bucket_photos.py --apply
"""

import argparse
import re
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from imagetools import has_jpeg_metadata, image_size, strip_jpeg_metadata
from upload_r2_assets import ASSET_PREFIX, get_object, list_objects, put_object

ROOT = Path(__file__).resolve().parents[1]
CACHE = ROOT / "data" / "work" / "photos" / "_bucket_cache"
ORIGINALS = ROOT / "data" / "work" / "photos" / "_bucket_originals"
PHOTO_KEY = re.compile(
    rf"^{ASSET_PREFIX}/[a-z_]+/\d+(?:\.|/(?:parliament|npk-team|wikimedia)\.)(?P<ext>jpg|jpeg|png|webp)$")
MAX_EDGE = 1024
QUALITY = 85
CONTENT_TYPES = {"jpg": "image/jpeg", "jpeg": "image/jpeg", "png": "image/png", "webp": "image/webp"}


def cached(key):
    target = CACHE / key.replace("/", "__")
    if target.exists():
        return target.read_bytes()
    data = get_object(key)
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
    return data


def downscale(data, ext, max_edge, quality, workdir):
    """Resize in the source format. Returns the new bytes."""
    source = workdir / f"in.{ext}"
    target = workdir / f"out.{ext}"
    source.write_bytes(data)
    command = ["sips", "-Z", str(max_edge)]
    if ext in {"jpg", "jpeg"}:
        command += ["-s", "format", "jpeg", "-s", "formatOptions", str(quality)]
    command += [str(source), "--out", str(target)]
    subprocess.run(command, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not target.exists():
        raise RuntimeError(f"sips produced no output for .{ext}")
    result = target.read_bytes()
    if ext in {"jpg", "jpeg"} and has_jpeg_metadata(result):
        result = strip_jpeg_metadata(result)
    width, height = image_size(result)
    if max(width, height) > max_edge:
        raise RuntimeError(f"resize did not take: still {width}x{height}")
    source.unlink()
    target.unlink()
    return result


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--apply", action="store_true", help="rewrite objects; without it, only report")
    parser.add_argument("--max-edge", type=int, default=MAX_EDGE)
    parser.add_argument("--quality", type=int, default=QUALITY)
    args = parser.parse_args()

    objects = dict(list_objects(f"{ASSET_PREFIX}/"))
    planned = []
    with tempfile.TemporaryDirectory() as raw:
        workdir = Path(raw)
        for key, size in sorted(objects.items()):
            match = PHOTO_KEY.match(key)
            if not match:
                continue
            data = cached(key)
            width, height = image_size(data)
            if max(width, height) <= args.max_edge:
                continue
            ext = match.group("ext")
            if ext == "webp":
                print(f"  SKIP {key}: sips cannot write WebP, resize it by other means")
                continue
            resized = downscale(data, ext, args.max_edge, args.quality, workdir)
            planned.append(dict(key=key, ext=ext, before=size, after=len(resized),
                                dim=f"{width}x{height}",
                                new_dim="x".join(map(str, image_size(resized))),
                                data=resized))
            print(f"  {key:46} {width}x{height} {size / 1048576:5.2f} MB"
                  f" -> {planned[-1]['new_dim']:>9} {len(resized) / 1024:6.0f} KB")

        before = sum(item["before"] for item in planned)
        after = sum(item["after"] for item in planned)
        print(f"\n{len(planned)} objects: {before / 1048576:.1f} MB -> {after / 1048576:.1f} MB"
              f" ({after / before:.1%})" if planned else "nothing oversized")
        if not planned or not args.apply:
            if planned:
                print("report only — pass --apply to rewrite")
            return

        ORIGINALS.mkdir(parents=True, exist_ok=True)
        for item in planned:
            flat = item["key"].replace("/", "__")
            # Keep the pre-resize bytes: the object is about to be overwritten.
            (ORIGINALS / flat).write_bytes(cached(item["key"]))
            put_object(item["key"], item["data"], CONTENT_TYPES[item["ext"]])
            (CACHE / flat).write_bytes(item["data"])
            print(f"rewrote {item['key']}")

    print(f"\noriginals kept in {ORIGINALS.relative_to(ROOT)}")
    print("regenerate the seed — width, height, byte_size and content_hash all changed:")
    print("  python3 scripts/generate_candidate_photo_seed.py --publish")


if __name__ == "__main__":
    main()
