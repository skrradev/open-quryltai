#!/usr/bin/env python3
"""Check the codebook's topic scheme against socially significant subjects.

The scheme was written from the corpus, which biases it toward what parties chose
to write about. This runs the opposite check: take subjects that matter to the
public whether or not a party raised them, and see whether the corpus mentions
them and whether a code exists to hold them.

Two distinct outcomes, and they must not be confused:

* **mentioned but uncoded** — a real gap; the codebook needs a rule or a code, or
  the annotator's judgement decides silently.
* **absent from every programme** — not a coding gap. You cannot code what is not
  there, and a code that is never applied adds nothing to the annotation. This
  belongs in a published "searched for, not found" list instead, which is a
  finding about the parties rather than a defect in the scheme.

Counts are raw keyword hits for triage only — not the thematic measurement, which
comes from unit-level annotation.

    python3 scripts/check_topic_coverage.py
"""

import collections
import glob
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CACHE = ROOT / "data" / "work" / "programs"

# subject -> (pattern, codebook status)
SUBJECTS = {
    "Насилие в семье и гендерное насилие":
        (r"семейн\w* насил|бытов\w* насил|домашн\w* насил|фемицид|насили\w* в отношении женщин", "T15"),
    "Защита животных":
        (r"жесток\w* обращени\w* с животн|защит\w* животн|приют\w* для животн|бездомн\w* животн|"
         r"содержани\w* животн", "T16"),
    "Государственный язык":
        (r"государственн\w* язык|казахск\w* язык|языков\w* политик|латиниц", "T12"),
    "Охрана природы":
        (r"охран\w* природ|заповедн|биоразнообраз|краснокнижн|особо охраняем", "T06"),
    "Часовой пояс":
        (r"часов\w* пояс|часов\w* зон|поясн\w* врем", "—"),
    "Смертная казнь":
        (r"смертн\w* казн|мораторий на казн", "T02"),
    "Ядерная энергетика":
        (r"атомн\w* (энерг|станц)|АЭС|ядерн\w* энерг", "T05"),
    "Права заключённых и пытки":
        (r"пытк|заключённ|осуждённ|тюрьм|пенитенциар", "T02"),
    "Свобода собраний и митингов":
        (r"свобод\w* собран|митинг|мирн\w* собран", "T01"),
    "Свобода слова и цензура":
        (r"свобод\w* слова|цензур|свобод\w* СМИ|независим\w* СМИ", "T12"),
    "Люди с инвалидностью":
        (r"инвалидност|лиц\w* с инвалидн|доступн\w* сред", "T09"),
    "Наркополитика":
        (r"наркотик|наркомани|наркополитик|психоактивн", "T02"),
    "Буллинг в школе":
        (r"буллинг|травл\w* в школ", "T11"),
    "Изменение климата":
        (r"климат|парников|углеродн\w* нейтраль|декарбониз", "T06"),
    "Миграция и репатрианты":
        (r"мигрант|кандас|репатриант|миграционн", "T13"),
    "Жилищное неравенство":
        (r"аварийн\w* жиль|очеред\w* на жиль|ипотек|арендн\w* жиль", "T08"),
}


def main():
    texts = {Path(f).stem: Path(f).read_text(encoding="utf-8")
             for f in sorted(glob.glob(str(CACHE / "*.txt")))}
    rows = []
    for subject, (pattern, code) in SUBJECTS.items():
        hits = collections.Counter()
        for party, text in texts.items():
            found = len(re.findall(pattern, text, re.I))
            if found:
                hits[party] = found
        rows.append((subject, code, sum(hits.values()), len(hits), sorted(hits)))

    rows.sort(key=lambda r: -r[2])
    print(f"{'тема':38} {'код':5} {'упом.':>6} {'партий':>7}  где")
    for subject, code, total, parties, where in rows:
        mark = " ⚠" if total and code == "—" else ""
        print(f"{subject:38} {code:5} {total:6} {parties:7}  {','.join(where)[:44]}{mark}")

    uncoded = [r for r in rows if r[2] and r[1] == "—"]
    absent = [r for r in rows if not r[2]]
    print(f"\nупоминается, но кода нет: {len(uncoded)}"
          f"{' — ' + ', '.join(r[0] for r in uncoded) if uncoded else ''}")
    print(f"не встречается ни в одной программе: {len(absent)}"
          f"{' — ' + ', '.join(r[0] for r in absent) if absent else ''}")
    print("\nОтсутствие — не пробел схемы, а результат о партиях: показывать как "
          "«искали, не нашли», а не заводить код, который никогда не применится.")


if __name__ == "__main__":
    main()
