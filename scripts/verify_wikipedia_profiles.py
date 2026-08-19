#!/usr/bin/env python3
"""Re-fetch and verify identity for discovered Wikipedia candidate profiles.

A profile is automatically marked VERIFIED only when the current page title
matches the candidate's complete name, the extract contains the candidate's
birth year in a biographical context, and the extract contains a Kazakhstan
signal. A conflicting birth year or foreign-only context is REJECTED; remaining
valid-looking matches are retained as NEEDS_REVIEW.
"""

import argparse
import csv
import json
import os
import re
import time
import unicodedata
from pathlib import Path
from urllib.parse import urlencode, quote
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
CANDIDATES = ROOT / "data" / "candidates_classified.csv"
INPUT = ROOT / "data" / "work" / "wikipedia_profiles.tsv"
OUTPUT = ROOT / "data" / "work" / "wikipedia_profile_verification.tsv"
USER_AGENT = "OpenQuryltai/0.1 (candidate profile verification)"
FIELDS = (
    "party_id", "list_order", "candidate_name", "birth_year", "wiki_language",
    "page_id", "page_title", "page_url", "wikidata_id", "verification_status",
    "evidence", "country_context", "current_extract", "verified_at",
)


def normalize(value):
    value = unicodedata.normalize("NFKC", value).casefold().replace("ё", "е")
    return " ".join(re.findall(r"[\wәғқңөұүһі]+", value, flags=re.UNICODE))


def fetch_page(language, page_id):
    params = {
        "action": "query",
        "pageids": page_id,
        "prop": "extracts|pageprops|info",
        "exintro": 1,
        "explaintext": 1,
        "exchars": 1000,
        "inprop": "url",
        "format": "json",
        "formatversion": 2,
    }
    request = Request(
        f"https://{language}.wikipedia.org/w/api.php?{urlencode(params)}",
        headers={"User-Agent": USER_AGENT, "Accept": "application/json"},
    )
    with urlopen(request, timeout=30) as response:
        pages = json.load(response).get("query", {}).get("pages", [])
    if len(pages) != 1 or pages[0].get("missing"):
        raise RuntimeError("page is missing")
    return pages[0]


def extract_birth_year(extract):
    patterns = (
        r"(?:\bрод(?:\.|ился|илась)|\bрожд[её]н(?:а)?).{0,60}?\b(19\d{2}|20\d{2})\b",
        r"\b(19\d{2}|20\d{2})\b\s*жылы\s*туған",
        r"\b(19\d{2}|20\d{2})\b\s*ж\.\s*т\.",
    )
    for pattern in patterns:
        match = re.search(pattern, extract, flags=re.IGNORECASE)
        if match:
            return match.group(1)
    return None


def country_context(extract):
    normalized = normalize(extract)
    kazakhstan_signals = ("казахстан", "казах", "қазақстан", "қазақ")
    foreign_signals = (
        "росси", "российск", "украин", "белорус", "узбекистан",
        "кыргыз", "киргиз", "таджикистан", "азербайджан",
    )
    has_kazakhstan = any(signal in normalized for signal in kazakhstan_signals)
    has_foreign = any(signal in normalized for signal in foreign_signals)
    if has_kazakhstan:
        return "KAZAKHSTAN"
    if has_foreign:
        return "FOREIGN_ONLY"
    return "UNKNOWN"


def load_candidates():
    with CANDIDATES.open(encoding="utf-8", newline="") as source:
        return {(row["party_id"], row["order"]): row for row in csv.DictReader(source)}


def load_suggestions():
    with INPUT.open(encoding="utf-8", newline="") as source:
        return [row for row in csv.DictReader(source, delimiter="\t") if row["review_status"] == "SUGGESTED"]


def load_completed():
    if not OUTPUT.exists():
        return set(), []
    with OUTPUT.open(encoding="utf-8", newline="") as source:
        rows = list(csv.DictReader(source, delimiter="\t"))
    return {(row["party_id"], row["list_order"], row["wiki_language"], row["page_id"]) for row in rows}, rows


def write_rows(rows):
    temporary = OUTPUT.with_suffix(".tmp")
    with temporary.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    temporary.replace(OUTPUT)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int)
    parser.add_argument("--delay", type=float, default=0.25)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()

    candidates = load_candidates()
    suggestions = load_suggestions()
    if args.limit is not None:
        suggestions = suggestions[:args.limit]
    completed, rows = load_completed() if args.resume else (set(), [])
    processed = 0

    for suggestion in suggestions:
        key = (
            suggestion["party_id"], suggestion["list_order"], suggestion["wiki_language"],
            suggestion["page_id"],
        )
        if key in completed:
            continue
        candidate = candidates[(suggestion["party_id"], suggestion["list_order"])]
        candidate_name = f"{candidate['surname']} {candidate['given_names']}"
        evidence = []
        try:
            page = fetch_page(suggestion["wiki_language"], suggestion["page_id"])
            title = page.get("title", "")
            extract = " ".join(page.get("extract", "").split())
            title_match = normalize(title) == normalize(candidate_name)
            page_birth_year = extract_birth_year(extract)
            year_match = page_birth_year == candidate["birth_year"]
            context = country_context(extract)
            if title_match:
                evidence.append("exact-current-title")
            if year_match:
                evidence.append("birth-year-match")
            elif page_birth_year:
                evidence.append(f"birth-year-conflict:{page_birth_year}")
            evidence.append(f"country-context:{context.lower()}")
            if page_birth_year and not year_match:
                status = "REJECTED"
            elif context == "FOREIGN_ONLY":
                status = "REJECTED"
            elif title_match and year_match and context == "KAZAKHSTAN":
                status = "VERIFIED"
            else:
                status = "NEEDS_REVIEW"
            url = page.get("fullurl") or f"https://{suggestion['wiki_language']}.wikipedia.org/wiki/{quote(title.replace(' ', '_'))}"
            wikidata_id = page.get("pageprops", {}).get("wikibase_item", "")
        except Exception as error:
            title = suggestion["page_title"]
            extract = ""
            url = suggestion["page_url"]
            wikidata_id = suggestion["wikidata_id"]
            status = "NEEDS_REVIEW"
            evidence.append(f"fetch-error:{type(error).__name__}")
            context = "UNKNOWN"

        rows.append({
            "party_id": suggestion["party_id"], "list_order": suggestion["list_order"],
            "candidate_name": candidate_name, "birth_year": candidate["birth_year"],
            "wiki_language": suggestion["wiki_language"], "page_id": suggestion["page_id"],
            "page_title": title, "page_url": url, "wikidata_id": wikidata_id,
            "verification_status": status, "evidence": ",".join(evidence),
            "country_context": context, "current_extract": extract,
            "verified_at": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()),
        })
        completed.add(key)
        processed += 1
        write_rows(rows)
        print(f"{suggestion['candidate_name']} [{suggestion['wiki_language']}]: {status}")
        time.sleep(args.delay)

    print(f"Wrote {len(rows)} profile verification rows from {processed} checks -> {OUTPUT}")


if __name__ == "__main__":
    main()
