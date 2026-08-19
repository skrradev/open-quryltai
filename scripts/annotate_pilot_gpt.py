#!/usr/bin/env python3
"""Annotator B for the pilot: gpt-5.5, given the same codebook as annotator A.

The model receives exactly what a human annotator receives — the codebook and the
one-page instruction, nothing else. No extra hints, no examples we did not also
give the human, or the agreement figure measures our prompt engineering rather
than the codebook.

The pinned model id is used, not the floating alias: codebook §3 requires the
annotator to be identifiable, and "gpt-5.5" will mean something different later.

Raw responses are kept alongside the sheet. Temperature 0 does not make an API
model reproducible, so reproducibility rests on the stored annotations, exactly as
recorded in HANDOFF.

    python3 scripts/annotate_pilot_gpt.py [--limit 3] [--model gpt-5.5-2026-04-23]
"""

import argparse
import csv
import json
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from upload_r2_assets import dotenv_value

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
PILOT = WORK / "pilot"
CODEBOOK = WORK / "program_codebook.md"
GUIDE = PILOT / "README.md"
SHEET = PILOT / "pilot_sheet_b.tsv"
RAW = PILOT / "pilot_b_raw.jsonl"
ENDPOINT = "https://api.openai.com/v1/chat/completions"

FIELDS = ["unit_kind_check", "topic_primary", "topic_secondary", "statement_type",
          "unclear", "notes"]

TASK = """Ты — разметчик Б в пилоте кодирования предвыборных программ.

Выше даны кодбук и памятка разметчика. Действуй строго по ним и ни по чему ещё.

Тебе даётся одна единица разметки. Верни JSON с полями:
  unit_kind_check  — substantive | rhetorical | structural | lead_in | fragment
  topic_primary    — T01..T14 или T99; пусто, если не substantive
  topic_secondary  — то же или пустая строка
  statement_type   — problem | goal | instrument | commitment | achievement | description; пусто, если не substantive
  unclear          — 1, если кодбук НЕ решает этот случай, иначе 0
  notes            — чем именно кодбук не помог; пусто, если помог

Ставь unclear=1 свободно: цель пилота — найти места, где кодбук молчит или
противоречит себе, а не проставить как можно больше кодов.
Верни только JSON, без пояснений."""


def ask(key, model, system, unit, attempt=0):
    lead = f"Вводная фраза списка: {unit['context_lead']}\n" if unit["context_lead"] else ""
    body = {
        "model": model,
        "messages": [
            {"role": "system", "content": system},
            {"role": "user", "content": f"{lead}Единица: {unit['text']}"},
        ],
        "response_format": {"type": "json_object"},
    }
    request = urllib.request.Request(
        ENDPOINT, data=json.dumps(body).encode(),
        headers={"Authorization": f"Bearer {key}", "Content-Type": "application/json"})
    try:
        with urllib.request.urlopen(request, timeout=180) as response:
            return json.load(response)
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", "replace")[:200]
        if error.code in (429, 500, 502, 503) and attempt < 4:
            time.sleep(2 ** attempt * 3)
            return ask(key, model, system, unit, attempt + 1)
        raise RuntimeError(f"HTTP {error.code}: {detail}") from error


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", default="gpt-5.5-2026-04-23")
    parser.add_argument("--limit", type=int)
    args = parser.parse_args()

    key = dotenv_value("OPENAI_API_KEY")
    system = (f"# КОДБУК\n\n{CODEBOOK.read_text(encoding='utf-8')}\n\n"
              f"# ПАМЯТКА РАЗМЕТЧИКА\n\n{GUIDE.read_text(encoding='utf-8')}\n\n"
              f"# ЗАДАЧА\n\n{TASK}")

    units = list(csv.DictReader(SHEET.open(encoding="utf-8"), delimiter="\t"))
    if args.limit:
        units = units[:args.limit]

    done = {}
    if RAW.exists():
        for line in RAW.read_text(encoding="utf-8").splitlines():
            record = json.loads(line)
            if record.get("model") == args.model:
                done[record["pilot_id"]] = record["fields"]
        print(f"уже размечено ранее: {len(done)}")

    with RAW.open("a", encoding="utf-8") as raw:
        for index, unit in enumerate(units, start=1):
            if unit["pilot_id"] in done:
                continue
            response = ask(key, args.model, system, unit)
            content = response["choices"][0]["message"]["content"]
            try:
                parsed = json.loads(content)
            except json.JSONDecodeError:
                parsed = {"unclear": 1, "notes": "модель вернула не-JSON"}
            fields = {name: str(parsed.get(name, "")).strip() for name in FIELDS}
            done[unit["pilot_id"]] = fields
            raw.write(json.dumps({"pilot_id": unit["pilot_id"], "model": args.model,
                                  "usage": response.get("usage"), "raw": content,
                                  "fields": fields}, ensure_ascii=False) + "\n")
            raw.flush()
            if index % 20 == 0 or index == len(units):
                print(f"  {index}/{len(units)}")

    rows = list(csv.DictReader(SHEET.open(encoding="utf-8"), delimiter="\t"))
    header = list(rows[0].keys()) if rows else []
    for row in rows:
        row.update(done.get(row["pilot_id"], {}))
    with SHEET.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=header, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)
    filled = sum(1 for r in rows if r.get("unit_kind_check"))
    print(f"\nзаполнено {filled}/{len(rows)} единиц моделью {args.model}")
    print(f"сырые ответы: {RAW.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
