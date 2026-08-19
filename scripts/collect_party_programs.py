#!/usr/bin/env python3
"""Collect party election-programme texts for thematic analysis.

Seven parties, six different retrieval routes — there is no central source,
because the programme is **not** among the documents parties file with the CEC
(see HANDOFF). So each party needs its own path:

  adilet      official PDF linked from /ru/kurultai/program (the page itself is a summary)
  ak_zhol     server-rendered HTML
  auyl        .docx, Russian edition
  osdp, npk, respublica, baitaq   PDF, text extracted with ghostscript

Four of the seven documents are reachable only by their direct URL — nothing on
the party site links to them, and for NPK and Respublica the on-site programme
page is empty or client-rendered, so probing the sites finds nothing at all.

**Texts are cached to data/work/programs/, which is gitignored, and never
committed or loaded into the database.** We publish counts derived from them and
link to the source; reproducing the documents is not ours to do.

Two traps this script exists to avoid:

* **Soft 200s.** auyl/program and three of osdp's five candidate URLs return the
  homepage with status 200. Length and keyword checks catch that; a status check
  would not.
* **Excerpt vs document.** osdp's HTML page carries a 4k excerpt of a 34k
  programme. Analysing the page would have made it the shortest programme in the
  comparison, which is an artefact of collection, not a fact about the party.

    python3 scripts/collect_party_programs.py
"""

import csv
import hashlib
import json
import re
import subprocess
import tempfile
import urllib.request
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
CACHE = WORK / "programs"
MANIFEST = WORK / "party_programs.tsv"
UA = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) "
                    "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126 Safari/537.36"}
# A real programme mentions most of these. Used to reject soft-404 pages, not to
# classify anything — the thematic dictionary is a separate, documented step.
SANITY_TERMS = ("налог", "образован", "здравоохран", "экономик", "социальн",
                "регион", "инфраструктур", "поддержк", "разви")
MIN_CHARS = 8000


def fetch(url, timeout=60):
    request = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(request, timeout=timeout) as response:
        return response.read()


BLOCK_TAGS = r"p|div|br|li|tr|h[1-6]|section|article|header|footer|blockquote"


def strip_html(html):
    """Keep block structure: offsets and page/section fields depend on it, and
    collapsing everything to one line throws away the paragraph boundaries the
    segmenter needs."""
    html = re.sub(r"(?is)<(script|style|noscript)[^>]*>.*?</\1>", " ", html)
    html = re.sub(rf"(?i)</?({BLOCK_TAGS})\b[^>]*>", "\n", html)
    # Inline tags are removed WITHOUT a space. An inline boundary is not a word
    # break, and Word's HTML export splits words and numbers across <span> runs —
    # substituting a space turned the heading "6. Отношения с недропользователями"
    # into "6 . Отношения…", which stopped matching the numbered-heading rule and
    # left every ak_zhol section title classified as a substantive statement.
    text = re.sub(r"(?s)<[^>]+>", "", html)
    text = re.sub(r"&nbsp;", " ", text)
    text = re.sub(r"&[a-z]+;|&#\d+;", " ", text)
    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r" ?\n ?", "\n", text)
    return re.sub(r"\n{3,}", "\n\n", text).strip()


def from_adilet():
    """The page at /ru/kurultai/program renders four summary chapters and links the
    real document. Take the document: the API's chapters are 24k characters against
    the PDF's 157k, and the difference is the entire policy content — 41 mentions of
    образование against 6, 37 of налог against 5. Analysing the page would have
    under-counted this party on every theme.
    """
    payload = json.loads(fetch("https://adilet-partiyasy.kz/api/kurultai/program"))
    document = payload.get("file_url") or ""
    if document.startswith("/"):
        document = "https://adilet-partiyasy.kz" + document
    if not document:
        raise RuntimeError("no file_url on /api/kurultai/program")
    text, spans = pdf_pages(fetch(document))
    return text, dict(
        page_spans=spans,
        source_url="https://adilet-partiyasy.kz/ru/kurultai/program",
        document_url=document, language="ru",
        method="PDF text layer via ghostscript",
        detail=f"official programme document linked from the page; "
               f"the page itself renders {len(payload['chapters'])} summary chapters")


# ak_zhol is the only party with no document file, and that was checked, not
# assumed: the two PDFs on the site (/ru/library, storage/media/9948 and /9950) are
# both the same 336-page, 582k-character bilingual archive "Партия «Ак жол» в
# документах, том II" — party history, not a programme. The HTML page is the
# programme, and it is the current one: it opens on the 2026 Народная Конституция.
#
# akzhol.kz/ru/program renders the programme inside the full site layout, so the
# document carries chrome at BOTH ends: a navigation menu and contact block before
# it, a search box, a "Последние новости" feed and a footer after it. Left in, the
# nav items appeared as programme headings ("Инициированные законопроекты") and 13
# news headlines plus a copyright line entered the corpus as policy text. This is
# the only party where that can happen — every other source is a document file.
#
# The title slogan repeats: once in the site header, then again immediately above
# the programme. The last occurrence before the body is therefore the boundary.
AK_ZHOL_HEAD = "ПЕРЕМЕНЫ НЕИЗБЕЖНЫ"
AK_ZHOL_HEAD_WINDOW = 3000
# "Депутатские запросы" is deliberately NOT a tail marker: it is also a nav item at
# character 474, and cutting there removed 99% of the programme.
AK_ZHOL_TAIL = ("\nПоиск\n", "\nПоследние новости\n")


def _trim(text, cut, low, high, label):
    """Cut chrome, refusing any slice outside the plausible range."""
    removed = cut if label == "head" else len(text) - cut
    if not low <= removed <= high:
        raise RuntimeError(f"ak_zhol: {label} cut of {removed} chars is outside "
                           f"[{low}, {high}] — the page layout changed, inspect it "
                           f"before trusting the text")
    return text[cut:] if label == "head" else text[:cut].rstrip()


def from_ak_zhol():
    text = strip_html(fetch("https://akzhol.kz/ru/program").decode("utf-8", "replace"))
    full = len(text)
    head = text.rfind(AK_ZHOL_HEAD, 0, AK_ZHOL_HEAD_WINDOW)
    if head <= 0:
        raise RuntimeError("ak_zhol: title slogan not found in the head window")
    text = _trim(text, head, 1, 0.05 * full, "head")

    cuts = [text.find(marker) for marker in AK_ZHOL_TAIL]
    cuts = [c for c in cuts if c > 0]
    if not cuts:
        raise RuntimeError("ak_zhol: no tail marker found — check what now follows "
                           "the programme before trusting the text")
    trimmed = _trim(text, min(cuts), 1, 0.1 * full, "tail")
    return trimmed, dict(
        source_url="https://akzhol.kz/ru/program", document_url="", language="ru",
        method="server-rendered HTML",
        detail=f"site chrome trimmed: {head} chars of nav/contacts before the "
               f"programme, {len(text) - len(trimmed)} of news feed and footer after")


def from_osdp():
    url = "https://osdp.kz/storage/app/media/programma-rus-na-sayt.pdf"
    text, spans = pdf_pages(fetch(url))
    return text, dict(page_spans=spans,
        source_url="https://osdp.kz/programma", document_url=url, language="ru",
        method="PDF text layer via ghostscript",
        detail="HTML page carries only a 4k excerpt")


def from_auyl():
    # Russian edition, so the whole comparison runs in one language. The site also
    # publishes a Kazakh .docx and a 36-page PDF that is scans with no text layer.
    url = "https://auyl.kz/docs/programma-ru.docx"
    raw = fetch(url)
    with tempfile.TemporaryDirectory() as workdir:
        path = Path(workdir) / "p.docx"
        path.write_bytes(raw)
        with zipfile.ZipFile(path) as archive:
            document = archive.read("word/document.xml").decode("utf-8", "replace")
    text = re.sub(r"</w:p>", "\n", document)
    text = strip_html(text)
    # Word leaves field codes in the extracted text; they are markup, not prose.
    text = re.sub(r"\s*PAGEREF\s+_\S+\s+\\h\s*", " ", text)
    text = re.sub(r'\s*TOC\s+\\o\s+"[^"]*"(\s+\\[a-z])*\s*', " ", text)
    return text, dict(
        source_url="https://auyl.kz/", document_url=url, language="ru",
        method=".docx", detail="Russian edition; a Kazakh .docx is also published")


def from_npk():
    url = "https://halykpartiyasy.kz/documents/program-ru.pdf"
    text, spans = pdf_pages(fetch(url))
    return text, dict(page_spans=spans,
        source_url="https://halykpartiyasy.kz/", document_url=url, language="ru",
        method="PDF text layer via ghostscript",
        detail="Direct document link; the site's /api/v1/pages/program is published but empty")


def from_respublica():
    url = ("https://api.respublica-partiyasy.kz/uploads/2026/07/23/"
           "fbd38a6f0354877f9dadd35d01642993_141304.pdf")
    text, spans = pdf_pages(fetch(url))
    return text, dict(page_spans=spans,
        source_url="https://respublica-partiyasy.kz/", document_url=url, language="ru",
        method="PDF text layer via ghostscript",
        detail="Served from the API host; nothing links to it from the SPA HTML")


def from_baitaq():
    url = ("https://baytaq.kz/docs/Baytaq%20%D0%9F%D0%BB%D0%B0%D1%82%D1%84%D0%BE%D1%80%D0%BC"
           "%D0%B0%202026%20%D0%A0%D1%83%D1%81.pdf")
    text, spans = pdf_pages(fetch(url))
    return text, dict(page_spans=spans,
        source_url="https://baytaq.kz/program", document_url=url, language="ru",
        method="PDF text layer via ghostscript",
        detail="2026 platform. NOT the gov.kz /uploads/2023/ document, which is the "
               "2023 programme: it mentions 2023-2025 and never 2026")


def running_furniture(pages, threshold=0.4):
    """Lines that repeat across pages: running headers and footers.

    These are worse than clutter. Ghostscript emits them in reading order, so a
    header lands **inside** the sentence that spans the page break — "сельское
    хозяйство по-прежнему / ПРЕДВЫБОРНАЯ ПРОГРАММА ПАРТИИ «ƏДІЛЕТ» · 2026—2031 30 /
    сталкивается с нестабильностью цен" — and the sentence is then published in two
    truncated halves. Dropping the page number alone did not help, because the rest
    of the header still cut the line.

    Detected by repetition rather than by pattern: each party words its header
    differently, and a pattern would need updating per document. Digits are
    normalised so the page number inside the header does not make every copy unique.
    A real programme line does not recur on 40% of pages.
    """
    import collections
    seen = collections.Counter()
    for chunk in pages:
        for line in {l.strip() for l in chunk.split("\n") if len(l.strip()) > 8}:
            seen[re.sub(r"\d+", "#", line)] += 1
    repeated = {norm for norm, count in seen.items() if count >= threshold * len(pages)}
    if not repeated:
        return []
    out = []
    for chunk in pages:
        for line in chunk.split("\n"):
            if re.sub(r"\d+", "#", line.strip()) in repeated and line.strip():
                out.append(line.strip())
    return sorted(set(out), key=len, reverse=True)


def pdf_pages(raw):
    """Extract page by page, so every character knows which page it came from.

    Ghostscript's txtwrite emits no page separator, and the codebook requires a
    page for each unit — a reader must be able to open the PDF and find the
    sentence a number rests on. Running it per page is the only way to get that
    mapping without guessing.
    """
    with tempfile.TemporaryDirectory() as workdir:
        source = Path(workdir) / "in.pdf"
        source.write_bytes(raw)
        count = int(subprocess.run(
            ["gs", "-q", "-dNODISPLAY", "-dNOSAFER", "-c",
             f"({source}) (r) file runpdfbegin pdfpagecount = quit"],
            capture_output=True, text=True).stdout.strip() or 0)
        pages = []
        for page in range(1, count + 1):
            target = Path(workdir) / f"p{page}.txt"
            subprocess.run(["gs", "-q", "-dNOPAUSE", "-dBATCH", "-sDEVICE=txtwrite",
                            f"-dFirstPage={page}", f"-dLastPage={page}",
                            "-o", str(target), str(source)],
                           check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
            chunk = target.read_text(errors="replace")
            chunk = re.sub(r"[ \t]+", " ", chunk)
            chunk = re.sub(r" ?\n ?", "\n", chunk)
            chunk = re.sub(r"\n{3,}", "\n\n", chunk).strip()
            # A line that is nothing but this page's own number is page furniture.
            # Ghostscript emits it in reading order, so it lands mid-paragraph —
            # "приоритет охраны\n21\nприроды". Narrow on purpose: a bare line, and
            # only the page's own number, so content like "2,5% ЦЕЛЬ 5" survives.
            chunk = "\n".join(line for line in chunk.split("\n")
                              if line.strip() != str(page))
            pages.append(chunk)

        for line in running_furniture(pages):
            pages = [p.replace(line + "\n", "").replace("\n" + line, "") for p in pages]

        parts, spans, cursor = [], [], 0
        for page, chunk in enumerate(pages, start=1):
            chunk = chunk.strip()
            if not chunk:
                continue
            if parts:
                cursor += 1  # the "\n" joining pages
            spans.append(dict(page=page, start=cursor, end=cursor + len(chunk)))
            cursor += len(chunk)
            parts.append(chunk)
        return "\n".join(parts), spans


def pdf_text(raw):
    return pdf_pages(raw)[0]


COLLECTORS = {
    "adilet": from_adilet,
    "ak_zhol": from_ak_zhol,
    "osdp": from_osdp,
    "auyl": from_auyl,
    "npk": from_npk,
    "respublica": from_respublica,
    "baitaq": from_baitaq,
}
def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--only", help="collect just this party; the manifest keeps "
                                       "the others' rows from the previous run")
    args = parser.parse_args()

    CACHE.mkdir(parents=True, exist_ok=True)
    rows = []
    if args.only:
        with MANIFEST.open(encoding="utf-8", newline="") as handle:
            rows = [r for r in csv.DictReader(handle, delimiter="\t")
                    if r["party_id"] != args.only]
    selected = {args.only: COLLECTORS[args.only]} if args.only else COLLECTORS
    for party, collector in selected.items():
        try:
            text, meta = collector()
        except Exception as error:
            print(f"{party:11} FAILED  {type(error).__name__}: {error}")
            rows.append(dict(party_id=party, status="FETCH_FAILED", chars=0,
                             sanity_terms=0, language="", source_url="",
                             document_url="", method="", detail=str(error),
                             content_sha256="", local_text=""))
            continue
        hits = sum(1 for term in SANITY_TERMS if term in text.lower())
        # Kazakh text will not match Russian stems; only gate Russian sources.
        ok = len(text) >= MIN_CHARS and (meta["language"] != "ru" or hits >= 5)
        path = CACHE / f"{party}.txt"
        path.write_text(text, encoding="utf-8")
        (CACHE / f"{party}.pages.json").write_text(
            json.dumps(meta.get("page_spans", []), ensure_ascii=False), encoding="utf-8")
        rows.append(dict(party_id=party, status="COLLECTED" if ok else "SUSPECT",
                         chars=len(text), sanity_terms=hits, language=meta["language"],
                         source_url=meta["source_url"], document_url=meta["document_url"],
                         method=meta["method"], detail=meta["detail"],
                         content_sha256=hashlib.sha256(text.encode()).hexdigest(),
                         local_text=str(path.relative_to(ROOT))))
        print(f"{party:11} {rows[-1]['status']:9} {len(text):7} знаков  "
              f"термины {hits}/{len(SANITY_TERMS)}  {meta['language'] or '—'}  {meta['method']}")

    fields = ["party_id", "status", "chars", "sanity_terms", "language", "source_url",
              "document_url", "method", "detail", "content_sha256", "local_text"]
    with MANIFEST.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(sorted(rows, key=lambda r: (r["status"], r["party_id"])))
    collected = sum(1 for r in rows if r["status"] == "COLLECTED")
    print(f"\ncollected {collected}/7; manifest: {MANIFEST.relative_to(ROOT)}")
    print("texts cached in data/work/programs/ (gitignored — never commit or publish them)")


if __name__ == "__main__":
    main()
