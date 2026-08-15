#!/usr/bin/env python3
"""Fill missing Kazakh title drafts with Google Translate.

This script only fills empty ``position_kk`` cells. It deliberately marks each
result ``KK_MACHINE_DRAFT`` and records its provenance, so no machine output is
mistaken for an approved official translation.
"""
import argparse
import csv
import html
import json
import os
import time
from concurrent.futures import ThreadPoolExecutor
from html.parser import HTMLParser
from tempfile import NamedTemporaryFile
from urllib.parse import urlencode
from urllib.error import HTTPError, URLError
from urllib.request import urlopen

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH = os.path.join(ROOT, "data", "work", "position_translations.tsv")
FIELDS = [
    "id", "position_raw", "position_kk", "position_ru", "status",
    "source_url", "review_notes",
]


class Paragraphs(HTMLParser):
    def __init__(self):
        super().__init__()
        self.current_id = None
        self.parts = {}

    def handle_starttag(self, tag, attrs):
        if tag == "p":
            self.current_id = dict(attrs).get("data-id")
            self.parts[self.current_id] = []

    def handle_data(self, data):
        if self.current_id is not None:
            self.parts[self.current_id].append(data)

    def handle_endtag(self, tag):
        if tag == "p":
            self.current_id = None


def translate_batch(rows):
    # HTML paragraphs preserve per-title boundaries in the otherwise single-text
    # public Google endpoint, avoiding hundreds of individual requests.
    text = "".join(
        f'<p data-id="{row["id"]}">{html.escape(row["position_raw"])}</p>'
        for row in rows
    )
    query = urlencode({"client": "gtx", "sl": "ru", "tl": "kk", "dt": "t", "q": text})
    url = "https://translate.googleapis.com/translate_a/single?" + query
    for attempt in range(3):
        try:
            with urlopen(url, timeout=20) as response:
                payload = json.load(response)
            break
        except (HTTPError, URLError, TimeoutError):
            if attempt == 2:
                raise
            time.sleep(1 + attempt)
    parser = Paragraphs()
    parser.feed("".join(part[0] for part in payload[0] if part[0]))
    translated = {key: "".join(value).strip() for key, value in parser.parts.items()}
    missing = [
        row["id"] for row in rows
        if not translated.get(row["id"]) or "data-id=" in translated[row["id"]]
    ]
    if missing:
        # The public endpoint occasionally rewrites HTML boundaries. Retrying
        # smaller groups preserves the per-title mapping without accepting a
        # malformed result.
        if len(rows) == 1:
            raise RuntimeError(f"translation response missing ID: {missing[0]}")
        midpoint = len(rows) // 2
        translated.update(translate_batch(rows[:midpoint]))
        translated.update(translate_batch(rows[midpoint:]))
    return translated


def translate_single(row):
    query = urlencode({"client": "gtx", "sl": "ru", "tl": "kk", "dt": "t", "q": row["position_raw"]})
    url = "https://translate.googleapis.com/translate_a/single?" + query
    for attempt in range(3):
        try:
            with urlopen(url, timeout=20) as response:
                payload = json.load(response)
            return row["id"], "".join(part[0] for part in payload[0] if part[0])
        except (HTTPError, URLError, TimeoutError):
            if attempt == 2:
                raise
            time.sleep(1 + attempt)


def save(rows):
    with NamedTemporaryFile("w", newline="", encoding="utf-8", delete=False, dir=os.path.dirname(PATH)) as f:
        writer = csv.DictWriter(f, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
        temp_path = f.name
    os.replace(temp_path, PATH)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=75)
    parser.add_argument("--batch-size", type=int, default=20)
    parser.add_argument("--workers", type=int, default=8)
    args = parser.parse_args()

    with open(PATH, newline="", encoding="utf-8") as f:
        rows = list(csv.DictReader(f, delimiter="\t"))

    todo = [row for row in rows if not row["position_kk"]][:args.limit]
    for start in range(0, len(todo), args.batch_size):
        batch = todo[start:start + args.batch_size]
        with ThreadPoolExecutor(max_workers=args.workers) as executor:
            translated = dict(executor.map(translate_single, batch))
        for row in batch:
            row["position_kk"] = translated[row["id"]]
            row["status"] = "KK_MACHINE_DRAFT"
            row["source_url"] = "machine:google-translate"
        save(rows)
        print(f"{min(start + len(batch), len(todo))}/{len(todo)} drafted", flush=True)
        time.sleep(0.2)

    print(f"Drafted {len(todo)} titles.")


if __name__ == "__main__":
    main()
