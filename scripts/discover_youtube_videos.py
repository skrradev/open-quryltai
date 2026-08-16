#!/usr/bin/env python3
"""Discover public YouTube videos for candidate-review queues.

The script uses one ``search.list`` request per candidate and one ``videos.list``
request per candidate with results. Entries are suggestions, never automatic
identity verification. Progress is persisted after every candidate.

Examples:
    python3 scripts/discover_youtube_videos.py --limit 1
    python3 scripts/discover_youtube_videos.py --limit 100 --resume
"""

import argparse
import csv
import json
import os
import re
import time
import unicodedata
from pathlib import Path
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "data" / "candidates_classified.csv"
OUTPUT = ROOT / "data" / "work" / "youtube_videos.tsv"
API_BASE = "https://www.googleapis.com/youtube/v3"
USER_AGENT = "OpenQuryltai/0.1 (candidate research)"
OUTPUT_FIELDS = (
    "party_id", "list_order", "candidate_name", "birth_year", "position_ru",
    "search_query", "rank", "video_id", "video_url", "title", "description",
    "channel_id", "channel_title", "published_at", "duration", "view_count",
    "like_count", "comment_count", "score", "signals", "review_status",
    "review_note", "collected_at",
)


def load_api_key():
    """Read the key without ever logging it."""
    key = os.environ.get("YOUTUBE_API_KEY")
    if key:
        return key.strip().strip('"\'')

    env_file = ROOT / ".env"
    if env_file.exists():
        for raw_line in env_file.read_text(encoding="utf-8").splitlines():
            line = raw_line.strip()
            if not line or line.startswith("#"):
                continue
            name, separator, value = line.partition("=")
            if separator and name.strip().removeprefix("export ").strip() == "YOUTUBE_API_KEY":
                return value.strip().strip('"\'')
    raise SystemExit("YOUTUBE_API_KEY is missing; add it to the root .env file")


def normalize(value):
    value = unicodedata.normalize("NFKC", value).casefold().replace("ё", "е")
    return " ".join(re.findall(r"[\wәғқңөұүһі]+", value, flags=re.UNICODE))


def tokens(value):
    return set(normalize(value).split())


def api_get(path, params, api_key):
    query = urlencode({**params, "key": api_key})
    request = Request(f"{API_BASE}/{path}?{query}", headers={"User-Agent": USER_AGENT})
    try:
        with urlopen(request, timeout=30) as response:
            return json.load(response)
    except HTTPError as error:
        try:
            detail = json.load(error).get("error", {})
            message = detail.get("message", error.reason)
        except Exception:
            message = error.reason
        raise RuntimeError(f"YouTube API request failed ({error.code}): {message}") from error
    except URLError as error:
        raise RuntimeError(f"YouTube API connection failed: {error.reason}") from error


def search_videos(candidate, api_key, max_results):
    name = f"{candidate['surname']} {candidate['given_names']}"
    query = f'"{name}" Казахстан'
    payload = api_get("search", {
        "part": "snippet",
        "type": "video",
        "q": query,
        "maxResults": max_results,
        "relevanceLanguage": "ru",
    }, api_key)
    return query, payload.get("items", [])


def video_details(video_ids, api_key):
    if not video_ids:
        return {}
    payload = api_get("videos", {
        "part": "snippet,contentDetails,statistics",
        "id": ",".join(video_ids),
        "maxResults": len(video_ids),
    }, api_key)
    return {item["id"]: item for item in payload.get("items", [])}


def score_video(candidate, item):
    name = f"{candidate['surname']} {candidate['given_names']}"
    snippet = item.get("snippet", {})
    title = snippet.get("title", "")
    description = snippet.get("description", "")
    title_normalized = normalize(title)
    text_normalized = normalize(f"{title} {description}")
    name_tokens = tokens(name)
    score = 0
    signals = []

    surname = normalize(candidate["surname"])
    if surname in title_normalized:
        score += 45
        signals.append("surname-in-title")
    elif surname in text_normalized:
        score += 25
        signals.append("surname-in-metadata")

    overlap = name_tokens & tokens(f"{title} {description}")
    if overlap:
        score += round(35 * len(overlap) / max(1, len(name_tokens)))
        signals.append(f"name-tokens:{len(overlap)}/{len(name_tokens)}")

    context_words = tokens(f"{candidate['position_ru']} {candidate['party_id']} депутат мажилис партия")
    context_overlap = context_words & tokens(f"{title} {description}")
    if context_overlap:
        score += min(20, len(context_overlap) * 4)
        signals.append("context:" + ",".join(sorted(context_overlap)[:5]))

    return min(score, 100), ",".join(signals) or "no-identity-signals"


def load_completed():
    if not OUTPUT.exists():
        return set(), []
    with OUTPUT.open(encoding="utf-8", newline="") as source:
        rows = list(csv.DictReader(source, delimiter="\t"))
    return {(row["party_id"], row["list_order"]) for row in rows}, rows


def write_rows(rows):
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    temporary = OUTPUT.with_suffix(".tmp")
    with temporary.open("w", encoding="utf-8", newline="") as target:
        writer = csv.DictWriter(target, fieldnames=OUTPUT_FIELDS, delimiter="\t")
        writer.writeheader()
        writer.writerows(rows)
    temporary.replace(OUTPUT)


def priority_key(candidate):
    return (
        candidate["is_incumbent"].lower() != "true",
        candidate["is_party_insider"].lower() != "true",
        candidate["seniority"] not in {"TOP_EXECUTIVE", "LEGISLATOR"},
        candidate["party_id"],
        int(candidate["order"]),
    )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=100,
                        help="maximum candidates to select (default: 100, matching search quota)")
    parser.add_argument("--max-results", type=int, default=5)
    parser.add_argument("--delay", type=float, default=0.25)
    parser.add_argument("--resume", action="store_true")
    args = parser.parse_args()
    if not 1 <= args.max_results <= 50:
        raise SystemExit("--max-results must be between 1 and 50")

    api_key = load_api_key()
    with INPUT.open(encoding="utf-8", newline="") as source:
        candidates = list(csv.DictReader(source))
    candidates.sort(key=priority_key)
    candidates = candidates[:args.limit]

    completed, rows = load_completed() if args.resume else (set(), [])
    processed = 0
    for candidate in candidates:
        identity = (candidate["party_id"], candidate["order"])
        if identity in completed:
            continue
        name = f"{candidate['surname']} {candidate['given_names']}"
        collected_at = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        try:
            query, search_results = search_videos(candidate, api_key, args.max_results)
            ids = [item.get("id", {}).get("videoId") for item in search_results]
            details = video_details([video_id for video_id in ids if video_id], api_key)
        except RuntimeError as error:
            write_rows(rows)
            raise SystemExit(f"Stopped after {processed} candidates: {error}")

        if not details:
            rows.append({
                "party_id": candidate["party_id"], "list_order": candidate["order"],
                "candidate_name": name, "birth_year": candidate["birth_year"],
                "position_ru": candidate["position_ru"], "search_query": query, "rank": 0,
                "video_id": "", "video_url": "", "title": "", "description": "",
                "channel_id": "", "channel_title": "", "published_at": "", "duration": "",
                "view_count": "", "like_count": "", "comment_count": "", "score": 0,
                "signals": "no-video-results", "review_status": "NO_RESULT",
                "review_note": "", "collected_at": collected_at,
            })
        else:
            ranked = []
            for item in details.values():
                score, signals = score_video(candidate, item)
                ranked.append((score, signals, item))
            ranked.sort(key=lambda entry: (-entry[0], entry[2]["id"]))
            for rank, (score, signals, item) in enumerate(ranked, start=1):
                snippet = item.get("snippet", {})
                statistics = item.get("statistics", {})
                rows.append({
                    "party_id": candidate["party_id"], "list_order": candidate["order"],
                    "candidate_name": name, "birth_year": candidate["birth_year"],
                    "position_ru": candidate["position_ru"], "search_query": query, "rank": rank,
                    "video_id": item["id"], "video_url": f"https://www.youtube.com/watch?v={item['id']}",
                    "title": snippet.get("title", ""), "description": snippet.get("description", ""),
                    "channel_id": snippet.get("channelId", ""), "channel_title": snippet.get("channelTitle", ""),
                    "published_at": snippet.get("publishedAt", ""),
                    "duration": item.get("contentDetails", {}).get("duration", ""),
                    "view_count": statistics.get("viewCount", ""), "like_count": statistics.get("likeCount", ""),
                    "comment_count": statistics.get("commentCount", ""), "score": score,
                    "signals": signals, "review_status": "SUGGESTED",
                    "review_note": "", "collected_at": collected_at,
                })

        completed.add(identity)
        processed += 1
        write_rows(rows)
        print(f"{identity}: {len(details)} video suggestion(s)")
        time.sleep(args.delay)

    print(f"Wrote {len(rows)} rows from {processed} candidates -> {OUTPUT}")


if __name__ == "__main__":
    main()
