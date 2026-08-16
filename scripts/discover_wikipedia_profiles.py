#!/usr/bin/env python3
"""Discover Russian and Kazakh Wikipedia profiles for candidate review.

This script never marks a match as verified. It searches the official MediaWiki
API, scores the returned pages using candidate identity signals, and writes a
review queue to data/work/wikipedia_profiles.tsv.

Examples:
    python3 scripts/discover_wikipedia_profiles.py --limit 20
    python3 scripts/discover_wikipedia_profiles.py --resume
"""

import argparse
import csv
import json
import os
import re
import time
import unicodedata
from urllib.parse import urlencode, quote
from urllib.error import HTTPError
from urllib.request import Request, urlopen


ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
INPUT = os.path.join(ROOT, "data", "candidates_classified.csv")
OUTPUT = os.path.join(ROOT, "data", "work", "wikipedia_profiles.tsv")
LANGUAGES = ("ru", "kk")
USER_AGENT = "OpenQuryltai/0.1 (https://github.com/skrradev/open-quryltai)"
OUTPUT_FIELDS = (
    "party_id", "list_order", "candidate_name", "birth_year", "wiki_language",
    "rank", "page_title", "page_url", "page_id", "wikidata_id", "score",
    "signals", "extract", "review_status", "review_note",
)


def normalize(value):
    value = unicodedata.normalize("NFKC", value).casefold().replace("ё", "е")
    return " ".join(re.findall(r"[\wәғқңөұүһі]+", value, flags=re.UNICODE))


def tokens(value):
    return set(normalize(value).split())


def mediawiki_search(language, query, limit=5, retries=4):
    params = {
        "action": "query",
        "generator": "search",
        "gsrsearch": query,
        "gsrnamespace": 0,
        "gsrlimit": limit,
        "prop": "extracts|pageprops|info",
        "exintro": 1,
        "explaintext": 1,
        "exchars": 700,
        "inprop": "url",
        "redirects": 1,
        "format": "json",
        "formatversion": 2,
        "utf8": 1,
    }
    url = f"https://{language}.wikipedia.org/w/api.php?{urlencode(params)}"
    request = Request(url, headers={"User-Agent": USER_AGENT, "Accept": "application/json"})
    for attempt in range(retries + 1):
        try:
            with urlopen(request, timeout=30) as response:
                payload = json.load(response)
            break
        except HTTPError as error:
            if error.code != 429 or attempt == retries:
                raise
            retry_after = error.headers.get("Retry-After")
            wait = float(retry_after) if retry_after else 2 ** (attempt + 1)
            print(f"RATE LIMITED {language}; retrying in {wait:.1f}s")
            time.sleep(wait)
    return payload.get("query", {}).get("pages", [])


def score_page(candidate, page):
    full_name = f"{candidate['surname']} {candidate['given_names']}"
    title = page.get("title", "")
    extract = page.get("extract", "")
    name_tokens = tokens(full_name)
    title_tokens = tokens(title)
    extract_tokens = tokens(extract)
    signals = []
    score = 0

    # A Wikipedia biography title must contain the candidate's surname. This
    # prevents matching a different person whose surname happens to equal one
    # of the candidate's given names.
    if normalize(candidate["surname"]) not in normalize(title):
        return 0, ["surname-missing-from-title"]

    if normalize(title) == normalize(full_name):
        score += 55
        signals.append("exact-title")
    elif normalize(candidate["surname"]) in normalize(title):
        score += 25
        signals.append("surname-in-title")

    overlap = name_tokens & (title_tokens | extract_tokens)
    name_score = round(25 * len(overlap) / max(1, len(name_tokens)))
    score += name_score
    if overlap:
        signals.append(f"name-tokens:{len(overlap)}/{len(name_tokens)}")

    birth_patterns = (
        r"(?:\bрод(?:\.|ился|илась)|\bрожд[её]н(?:а)?).{0,50}?(19\d{2}|20\d{2})",
        r"(19\d{2}|20\d{2})\s*жылы\s*туған",
        r"(19\d{2}|20\d{2})\s*ж\.\s*т\.",
    )
    article_birth_year = None
    for pattern in birth_patterns:
        match = re.search(pattern, extract[:300], flags=re.IGNORECASE)
        if match:
            article_birth_year = match.group(1)
            break
    if article_birth_year == candidate["birth_year"]:
        score += 20
        signals.append("birth-year-match")
    elif article_birth_year:
        score -= 40
        signals.append(f"birth-year-conflict:{article_birth_year}")

    context = tokens(
        f"{candidate['position_raw']} {candidate['position_ru']} "
        f"{candidate['place']} Казахстан Қазақстан депутат партия"
    )
    context_overlap = context & extract_tokens
    context_score = min(15, len(context_overlap) * 3)
    score += context_score
    if context_overlap:
        signals.append("context:" + ",".join(sorted(context_overlap)[:5]))

    return min(score, 100), signals


def suggestions(candidate, language, max_results):
    full_name = f"{candidate['surname']} {candidate['given_names']}"
    pages = mediawiki_search(language, full_name)
    ranked = []
    for page in pages:
        score, signals = score_page(candidate, page)
        if score < 45:
            continue
        ranked.append((score, signals, page))
    ranked.sort(key=lambda item: (-item[0], item[2].get("title", "")))

    rows = []
    for rank, (score, signals, page) in enumerate(ranked[:max_results], start=1):
        title = page.get("title", "")
        rows.append({
            "party_id": candidate["party_id"],
            "list_order": candidate["order"],
            "candidate_name": full_name,
            "birth_year": candidate["birth_year"],
            "wiki_language": language,
            "rank": rank,
            "page_title": title,
            "page_url": page.get("fullurl") or
                f"https://{language}.wikipedia.org/wiki/{quote(title.replace(' ', '_'))}",
            "page_id": page.get("pageid", ""),
            "wikidata_id": page.get("pageprops", {}).get("wikibase_item", ""),
            "score": score,
            "signals": ",".join(signals),
            "extract": " ".join(page.get("extract", "").split()),
            "review_status": "SUGGESTED",
            "review_note": "",
        })
    return rows


def load_completed():
    if not os.path.exists(OUTPUT):
        return set(), []
    with open(OUTPUT, newline="", encoding="utf-8") as source:
        rows = list(csv.DictReader(source, delimiter="\t"))
    keys = {(row["party_id"], row["list_order"], row["wiki_language"]) for row in rows}
    return keys, rows


def write_rows(rows):
    temporary = OUTPUT + ".tmp"
    with open(temporary, "w", newline="", encoding="utf-8") as target:
        writer = csv.DictWriter(target, fieldnames=OUTPUT_FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    os.replace(temporary, OUTPUT)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, help="process only this many candidates")
    parser.add_argument("--max-results", type=int, default=3)
    parser.add_argument("--delay", type=float, default=1.0, help="seconds between API calls")
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()

    with open(INPUT, newline="", encoding="utf-8") as source:
        candidates = list(csv.DictReader(source))
    if args.limit is not None:
        candidates = candidates[:args.limit]

    completed, output_rows = load_completed() if args.resume else (set(), [])
    processed = 0
    for candidate in candidates:
        for language in LANGUAGES:
            key = (candidate["party_id"], candidate["order"], language)
            if key in completed:
                continue
            try:
                found = suggestions(candidate, language, args.max_results)
            except Exception as error:
                print(f"ERROR {key}: {error}")
                continue
            if found:
                output_rows.extend(found)
            else:
                output_rows.append({
                    "party_id": candidate["party_id"],
                    "list_order": candidate["order"],
                    "candidate_name": f"{candidate['surname']} {candidate['given_names']}",
                    "birth_year": candidate["birth_year"],
                    "wiki_language": language,
                    "rank": 0,
                    "page_title": "",
                    "page_url": "",
                    "page_id": "",
                    "wikidata_id": "",
                    "score": 0,
                    "signals": "no-suggestion-above-threshold",
                    "extract": "",
                    "review_status": "NO_SUGGESTION",
                    "review_note": "",
                })
            completed.add(key)
            processed += 1
            print(f"{key}: {len(found)} suggestion(s)")
            write_rows(output_rows)
            time.sleep(args.delay)

    print(f"Wrote {len(output_rows)} suggestions from {processed} searches -> {OUTPUT}")


if __name__ == "__main__":
    main()
