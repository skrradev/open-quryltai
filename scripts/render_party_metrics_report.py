#!/usr/bin/env python3
"""Render data/work/party_metrics.json as a self-contained review report.

Form choices follow the project's dataviz method, and two of them are deliberate
departures from what was originally asked for:

* **No spider/radar chart.** Seven overlapping polygons on thirteen axes is an
  all-pairs form, which caps at three series before colours stop being separable —
  and radar hides exactly what this comparison is for, since area depends on the
  arbitrary order of the axes. The same data is a **heatmap**: parties x sectors,
  one sequential hue, every cell readable and directly labelled.
* **Party brand colours are not used as series colours.** Four of the seven are
  blue or violet; the palette validator fails them on four checks, including a
  normal-vision separation of 13.3 between Ak Zhol and Auyl. Brand colours stay on
  the logo chips where identity is the job.

Most metrics are one measure across seven parties, so they are single-hue bars
with direct labels — no categorical palette needed at all. Every chart ships a
table view, because a colour-encoded cell must never be the only way to read a
number.

    python3 scripts/render_party_metrics_report.py
"""

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
OUTPUT = ROOT / ".scratch" / "party-metrics.html"

# Sequential blue, 100 -> 700, from the reference palette.
RAMP = ["#cde2fb", "#b7d3f6", "#9ec5f4", "#86b6ef", "#6da7ec", "#5598e7",
        "#3987e5", "#2a78d6", "#256abf", "#1c5cab", "#184f95", "#104281", "#0d366b"]
PARTY_LABELS = {
    "adilet": "Әділет", "respublica": "Respublica", "npk": "НПК", "auyl": "Ауыл",
    "ak_zhol": "Ақ жол", "baitaq": "Байтақ", "osdp": "ОСДП",
}
SECTOR_LABELS = {
    "GOVERNMENT": "Госуправление", "BUSINESS": "Бизнес", "PARTY_APPARATUS": "Партаппарат",
    "LEGISLATOR": "Депутаты", "EDUCATION_AND_SCIENCE": "Образование и наука",
    "HEALTHCARE": "Здравоохранение", "CULTURE": "Культура", "SPORT": "Спорт",
    "CIVIL_SOCIETY": "Гражданский сектор", "LAW": "Право", "MEDIA": "Медиа",
    "AGRICULTURE": "АПК", "OTHER_OR_UNCLEAR": "Прочее",
}


def esc(text):
    return (str(text).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
            .replace('"', "&quot;"))


def ramp_color(value, peak):
    if peak <= 0:
        return RAMP[0]
    index = round((value / peak) * (len(RAMP) - 1))
    return RAMP[max(0, min(len(RAMP) - 1, index))]


def readable_on(hexcolor):
    r, g, b = (int(hexcolor[i:i + 2], 16) / 255 for i in (1, 3, 5))
    luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
    return "#0b0b0b" if luminance > 0.55 else "#ffffff"


def card_head(title, lede, explain):
    """Title plus a "?" disclosure. <details> is deliberate: it opens on click and
    from the keyboard, and needs no JavaScript, so the explanation is reachable on
    touch too — a hover-only tooltip would hide the method from half the readers."""
    return (f'<details class="explain"><summary><h3>{esc(title)}</h3>'
            f'<span class="qm" aria-hidden="true">?</span>'
            f'<span class="sr">Как считается</span></summary>'
            f'<div class="exp">{explain}</div></details>'
            f'<p class="note">{lede}</p>')


def bar_chart(title, lede, explain, rows, fmt=lambda v: f"{v:.0%}", peak=None):
    """rows: [(label, value, tooltip)] — one measure, one hue, direct labels."""
    peak = peak if peak is not None else max((v for _, v, _ in rows), default=1) or 1
    body = []
    for label, value, tip in rows:
        width = max(0.6, value / peak * 100)
        body.append(
            f'<div class="row"><span class="rl">{esc(label)}</span>'
            f'<span class="track"><span class="bar" style="width:{width:.1f}%" '
            f'data-tip="{esc(tip)}"></span><b class="val">{esc(fmt(value))}</b></span></div>')
    table = "".join(f"<tr><th>{esc(l)}</th><td>{esc(fmt(v))}</td></tr>" for l, v, _ in rows)
    return f"""<section class="card">
{card_head(title, lede, explain)}
<div class="bars">{''.join(body)}</div>
<details><summary>Таблица</summary><table>{table}</table></details></section>"""


MIN_SAMPLE = 10


def heatmap(title, lede, explain, columns, rows, fmt=lambda v: f"{v:.0%}", peak=None):
    """rows: [(row_label, [(value, tooltip)])] or [(row_label, [(value, tooltip, n)])].

    A share over a handful of people is noise, so cells with n < MIN_SAMPLE are
    muted and carry their n on the face of the cell. Without that, a 9-person tail
    at 89% reads exactly like a 126-person band, which is how a chart lies.
    """
    rows = [(label, [(cell + (None,))[:3] for cell in cells]) for label, cells in rows]
    reliable = [v for _, cells in rows for v, _, n in cells
                if v is not None and (n is None or n >= MIN_SAMPLE)]
    values = [v for _, cells in rows for v, _, _ in cells if v is not None]
    # Scale on the reliable cells: one 9-person outlier must not set the ramp.
    peak = peak if peak is not None else (max(reliable) if reliable else (max(values) if values else 1))
    head = "".join(f"<div class='hh'>{esc(c)}</div>" for c in columns)
    body = []
    for label, cells in rows:
        body.append(f"<div class='rh'>{esc(label)}</div>")
        for value, tip, n in cells:
            if value is None:
                body.append(f"<div class='cell none' data-tip="
                            f"'{esc(tip or 'нет данных')}'>—</div>")
                continue
            if n is not None and n < MIN_SAMPLE:
                body.append(f"<div class='cell low' data-tip='{esc(tip)} — выборка мала, "
                            f"доля ненадёжна'>{esc(fmt(value))}<i>n={n}</i></div>")
                continue
            colour = ramp_color(value, peak)
            body.append(f"<div class='cell' style='background:{colour};color:{readable_on(colour)}' "
                        f"data-tip='{esc(tip)}'>{esc(fmt(value))}</div>")
    has_low = any(n is not None and n < MIN_SAMPLE
                  for _, cells in rows for v, _, n in cells if v is not None)
    low_key = (f'<span class="lowkey">штриховка — выборка меньше {MIN_SAMPLE}</span>'
               if has_low else "")
    table_head = "".join(f"<th>{esc(c)}</th>" for c in columns)
    table_body = "".join(
        f"<tr><th>{esc(label)}</th>" + "".join(
            f"<td>{'—' if v is None else esc(fmt(v)) + (f' (n={n})' if n is not None else '')}</td>"
            for v, _, n in cells) + "</tr>"
        for label, cells in rows)
    return f"""<section class="card">
{card_head(title, lede, explain)}
<div class="heat" style="grid-template-columns:minmax(9rem,auto) repeat({len(columns)},1fr)">
<div class="rh"></div>{head}{''.join(body)}</div>
<div class="scale"><span>0</span><span class="ramp"></span><span>{esc(fmt(peak))}</span>
{low_key}</div>
<details><summary>Таблица</summary><table><tr><th></th>{table_head}</tr>{table_body}</table></details>
</section>"""


def grouped_bars(title, lede, explain, categories, series, fmt=lambda v: f"{v:.0%}"):
    """Two series max — legend plus direct labels, so identity is never colour alone."""
    peak = max(v for _, values, _ in series for v in values if v is not None) or 1
    legend = "".join(f"<span class='lg'><i style='background:{colour}'></i>{esc(name)}</span>"
                     for name, _, colour in series)
    cols = []
    for index, category in enumerate(categories):
        bars = "".join(
            f"<span class='gb' style='height:{(values[index] / peak * 100):.1f}%;background:{colour}' "
            f"data-tip='{esc(name)}, {esc(category)}: {esc(fmt(values[index])) }'>"
            f"<b>{esc(fmt(values[index]))}</b></span>"
            for name, values, colour in series)
        cols.append(f"<div class='gcol'><div class='gbars'>{bars}</div>"
                    f"<span class='gcl'>{esc(category)}</span></div>")
    table = "".join(
        f"<tr><th>{esc(name)}</th>" + "".join(f"<td>{esc(fmt(v))}</td>" for v in values) + "</tr>"
        for name, values, _ in series)
    return f"""<section class="card wide">
{card_head(title, lede, explain)}
<div class="legend">{legend}</div>
<div class="grouped">{''.join(cols)}</div>
<details><summary>Таблица</summary><table><tr><th></th>
{''.join(f'<th>{esc(c)}</th>' for c in categories)}</tr>{table}</table></details></section>"""


def main():
    data = json.loads((WORK / "party_metrics.json").read_text(encoding="utf-8"))
    parties = data["parties"]
    per = data["per_party"]
    name = lambda p: PARTY_LABELS.get(p, p)
    buckets = data["method"]["position_buckets"]
    overall = data["by_position_overall"]

    tiles = [
        ("545", "кандидатов в 7 списках", "Официальный реестр ЦИК"),
        (f"{data['totals']['women_share']:.0%}", "женщин в списках", "Всего по всем партиям"),
        (f"{overall['1-10']['women_share']:.0%}", "женщин в первой десятке",
         f"{sum(1 for p in parties if per[p]['women_top10'] <= 2)} партии из 7 — не больше двух"),
        (f"{data['totals']['capital_share']:.0%}", "живут в Астане, Алматы, Шымкенте",
         "Три города республиканского значения"),
    ]
    kpi = "".join(f"<div class='tile'><b>{esc(v)}</b><span>{esc(l)}</span>"
                  f"<i>{esc(s)}</i></div>" for v, l, s in tiles)

    blocks = []
    adilet_tail = (per["adilet"]["by_position"]["61+"]["size"]
                   / overall["61+"]["size"]) if overall["61+"]["size"] else 0

    blocks.append(grouped_bars(
        "Женщины и молодёжь по позиции в списке",
        "Мандаты получают первые номера. В первой тридцатке женщин 27–29%, а в "
        "интервале 31–60 доля падает до 22%. Молодёжь до 35 лет — <b>контрольный "
        "расчёт</b>: она распределена ровно, значит смещение специфично для женщин, "
        "а не общий эффект квотных категорий.<br><b>Интервал 61+ читать нельзя как "
        f"вывод обо всех партиях:</b> до него доходят {len(overall['61+']['parties'])} "
        f"партии из 7, и {adilet_tail:.0%} этого интервала — один список «Әділет». "
        "Разбивку по партиям смотрите ниже.",
        '<dl><dt>Что измеряет</dt><dd>Долю женщин и долю людей младше 35 лет в четырёх интервалах позиций партийного списка.</dd><dt>Как считается</dt><dd>Каждый кандидат попадает в интервал по своему номеру в списке (<code>list_order</code>): 1–10, 11–30, 31–60, 61 и далее. Внутри интервала — доля от всех кандидатов этого интервала. Возраст: <code>2026 минус год рождения</code>, порог «молодёжи» — строго меньше 35.</dd><dt>Как читать</dt><dd>Выборы идут по партийным спискам, поэтому мандаты достаются первым номерам. Если доля в начале списка ниже, чем в конце, значит категория присутствует в списке, но не в проходной его части. Молодёжь здесь — <b>контрольный расчёт</b>: она распределена ровно, и это исключает объяснение «вниз задвигают все квотные категории».</dd><dt>Что говорит закон</dt><dd>Отдельной квоты для женщин нет: по перечню документов ЦИК женщины, молодёжь и лица с инвалидностью <b>по совокупности</b> должны составлять не менее 30% списка — и эта норма выполняется с запасом. При этом «политические партии самостоятельно определяют порядок размещения лиц в партийном списке», то есть позиция в списке — решение партии, а не следствие процедуры.</dd><dt>Оговорка</dt><dd>Интервал 61+ есть только у пяти списков из семи, и три четверти его — один «Әділет». Как вывод обо всех партиях он не читается.</dd></dl>',
        buckets,
        [("Женщины", [overall[b]["women_share"] for b in buckets], "#2a78d6"),
         ("До 35 лет", [overall[b]["youth_share"] for b in buckets], "#eb6834")]))

    blocks.append(heatmap(
        "Женщины по позиции, по партиям",
        "Та же картина в разрезе партий. Прочерк — у партии нет позиций в этом интервале.",
        '<dl><dt>Что измеряет</dt><dd>Ту же долю женщин по интервалам позиций, но отдельно для каждой партии.</dd><dt>Как считается</dt><dd>Доля женщин внутри каждого интервала каждого списка. Прочерк — у партии нет позиций в этом интервале, потому что её список короче.</dd><dt>Как читать</dt><dd>Строка — партия, столбец — интервал позиций. Чем темнее, тем выше доля. Это основной вид: сводный график по всем партиям смешивает списки очень разной длины.</dd><dt>Оговорка</dt><dd>Клетки со штриховкой опираются на выборку меньше 10 человек — доля там ненадёжна, и такие клетки исключены из расчёта шкалы. Их <code>n</code> подписан на клетке.</dd></dl>',
        buckets,
        [(name(p), [(per[p]["by_position"][b]["women_share"],
                     f"{name(p)}, позиции {b}: "
                     + (f"{per[p]['by_position'][b]['women_share']:.0%} из "
                        f"{per[p]['by_position'][b]['size']}"
                        if per[p]["by_position"][b]["women_share"] is not None else "нет позиций"),
                     per[p]["by_position"][b]["size"])
                    for b in buckets]) for p in parties]))

    blocks.append(bar_chart(
        "Женщин в первой десятке", "Из десяти первых номеров — тех, кто реально проходит.",
        '<dl><dt>Что измеряет</dt><dd>Сколько женщин среди первых десяти номеров списка.</dd><dt>Как считается</dt><dd>Простой подсчёт: кандидаты с <code>list_order</code> от 1 до 10, из них с полом F.</dd><dt>Как читать</dt><dd>Абсолютное число из десяти. Первая десятка — это грубый ориентир проходной части списка, поэтому здесь состав важнее, чем в списке целиком.</dd><dt>Оговорка</dt><dd>Десять — условная граница, а не прогноз числа мандатов. Сколько мест получит партия, зависит от результата выборов, и мы это не предсказываем.</dd></dl>',
        [(name(p), per[p]["women_top10"], f"{name(p)}: {per[p]['women_top10']} из 10")
         for p in sorted(parties, key=lambda p: -per[p]["women_top10"])],
        fmt=lambda v: f"{v:.0f} из 10", peak=10))

    blocks.append(heatmap(
        "Состав списков по сферам деятельности",
        "Это замена паучьей диаграммы: 7 партий на 13 сфер — теплокарта, где каждое "
        "значение подписано. Семь наложенных полигонов были бы нечитаемы, а площадь "
        "фигуры на радаре зависит от произвольного порядка осей.",
        '<dl><dt>Что измеряет</dt><dd>Из каких сфер деятельности партия набирает кандидатов.</dd><dt>Как считается</dt><dd>Поле <code>sector</code> из реестра — сфера основной деятельности кандидата, 13 значений. Показана доля кандидатов партии в каждой сфере; сумма по строке — 100%.</dd><dt>Как читать</dt><dd>Строка — партия, столбец — сфера. Тёмная клетка означает, что партия опирается на эту сферу. Сравнивайте строки между собой: похожие строки — похожие по составу партии.</dd><dt>Оговорка</dt><dd>Сфера берётся из официального описания должности и разметки исходных данных, а не из нашей оценки. Спорные случаи попадают в «Прочее».</dd></dl>',
        [SECTOR_LABELS.get(s, s) for s in data["sectors"]],
        [(name(p), [(per[p]["sector_shares"][s],
                     f"{name(p)}, {SECTOR_LABELS.get(s, s)}: {per[p]['sector_shares'][s]:.0%}")
                    for s in data["sectors"]]) for p in parties]))

    blocks.append(bar_chart(
        "Концентрация списка (индекс HHI по сферам)",
        "Одно число: 0 — список разнороден, 1 — весь из одной сферы.",
        '<dl><dt>Что измеряет</dt><dd>Насколько список сосредоточен в одной сфере, одним числом.</dd><dt>Как считается</dt><dd>Индекс Херфиндаля: сумма квадратов долей по сферам. При равномерном распределении по 13 сферам вышло бы около 0.08, при списке целиком из одной сферы — ровно 1.</dd><dt>Как читать</dt><dd>Чем выше, тем однороднее список. Удобно, когда надо сравнить партии одним числом вместо чтения всей теплокарты.</dd><dt>Оговорка</dt><dd>Индекс ничего не говорит о том, <i>какая</i> сфера доминирует, — только о степени концентрации. Смотрите вместе с теплокартой выше.</dd></dl>',
        [(name(p), per[p]["sector_hhi"], f"{name(p)}: HHI {per[p]['sector_hhi']:.2f}, "
          f"{per[p]['candidates']} кандидатов")
         for p in sorted(parties, key=lambda p: -per[p]["sector_hhi"])],
        fmt=lambda v: f"{v:.2f}", peak=1.0))

    blocks.append(bar_chart(
        "Живут в Астане, Алматы или Шымкенте",
        '<dl><dt>Что измеряет</dt><dd>Долю кандидатов, живущих в трёх городах республиканского значения.</dd><dt>Как считается</dt><dd>Поле <code>place_id</code> из реестра равно <code>astana</code>, <code>almaty</code> или <code>shymkent</code>. Это заявленное место проживания кандидата, а не место рождения.</dd><dt>Как читать</dt><dd>Высокая доля означает, что список набран преимущественно в столице и двух крупнейших городах. Рядом полезно смотреть число разных мест проживания в списке.</dd><dt>Оговорка</dt><dd>Мы <b>не</b> сравниваем это с распределением населения — для честного вывода о перепредставленности нужны данные о численности по регионам, их в проекте пока нет.</dd></dl>',
        "В трёх городах республиканского значения. По всем партиям — "
        f"{data['totals']['capital_share']:.0%}, одна Астана даёт "
        f"{dict(data['top_places'])['astana'] / data['totals']['candidates']:.0%}.",
        [(name(p), per[p]["capital_share"],
          f"{name(p)}: {per[p]['capital_share']:.0%}, мест проживания — {per[p]['places']}")
         for p in sorted(parties, key=lambda p: -per[p]["capital_share"])]))

    blocks.append(bar_chart(
        "Работают в госорганах или квазигосструктурах",
        '<dl><dt>Что измеряет</dt><dd>Долю кандидатов, чей работодатель — государство или квазигосударственная структура.</dd><dt>Как считается</dt><dd>Поле <code>employer_type</code> равно <code>STATE_BODY</code> или <code>QUASI_GOVERNMENTAL</code> (нацкомпании, институты развития и подобное).</dd><dt>Как читать</dt><dd>Показывает, насколько список состоит из людей, зависящих от государства как работодателя. Разброс между партиями здесь один из самых больших.</dd><dt>Оговорка</dt><dd>Тип работодателя — разметка исходных данных по официальной должности. Она огрубляет: например, вуз может быть государственным, но попасть в образование.</dd></dl>',
        "Тип работодателя из реестра: <code>STATE_BODY</code> или "
        "<code>QUASI_GOVERNMENTAL</code>.",
        [(name(p), per[p]["state_share"], f"{name(p)}: {per[p]['state_share']:.0%}")
         for p in sorted(parties, key=lambda p: -per[p]["state_share"])]))

    blocks.append(bar_chart(
        "Представители партийного аппарата",
        '<dl><dt>Что измеряет</dt><dd>Долю кандидатов, для которых партия и есть место работы или основная роль.</dd><dt>Как считается</dt><dd>Признак <code>is_party_insider</code> из разметки исходных данных.</dd><dt>Как читать</dt><dd>Высокая доля означает список, собранный из собственного аппарата, а не из внешних профессионалов.</dd><dt>Оговорка</dt><dd>У ОСДП значение 88%. Для списка из 33 человек это правдоподобно, но признак проставлен разметкой, а не взят из реестра напрямую, поэтому перед публикацией стоит выборочно сверить его с текстом должностей.</dd></dl>',
        "Признак <code>is_party_insider</code>. У ОСДП — 88%: для списка из 33 человек "
        "правдоподобно, но эту цифру стоит выборочно сверить с должностями перед публикацией.",
        [(name(p), per[p]["insider_share"], f"{name(p)}: {per[p]['insider_share']:.0%}")
         for p in sorted(parties, key=lambda p: -per[p]["insider_share"])]))

    blocks.append(bar_chart(
        "Действующие депутаты в списке",
        '<dl><dt>Что измеряет</dt><dd>Долю кандидатов, которые сейчас являются депутатами.</dd><dt>Как считается</dt><dd>Признак <code>is_incumbent</code>. Учитываются и Мажилис, и Сенат — четыре сенатора в списке «Әділет» тоже попадают сюда.</dd><dt>Как читать</dt><dd>Низкая доля означает список из новых лиц, высокая — ставку на действующих депутатов. Ноль означает, что в списке нет ни одного нынешнего депутата.</dd><dt>Оговорка</dt><dd>Признак говорит только о текущем мандате. Депутаты прошлых созывов здесь не учитываются, хотя в описании должности они иногда упомянуты.</dd></dl>',
        "Обновление состава: у «Ауыл» и «Байтак» — ни одного действующего депутата.",
        [(name(p), per[p]["incumbent_share"], f"{name(p)}: {per[p]['incumbent_share']:.0%}")
         for p in sorted(parties, key=lambda p: -per[p]["incumbent_share"])]))

    sim = {(s["a"], s["b"]): s["cosine"] for s in data["similarity"]}
    def pair(a, b):
        if a == b:
            return None
        return sim.get((a, b)) or sim.get((b, a))
    blocks.append(heatmap(
        "Насколько похожи составы списков",
        '<dl><dt>Что измеряет</dt><dd>Насколько два списка похожи друг на друга по профилю сфер деятельности.</dd><dt>Как считается</dt><dd>Для каждой партии берётся вектор из 13 долей по сферам (строка теплокарты выше) и считается косинусная близость между парами: 1 — векторы совпадают по направлению, 0 — не пересекаются.</dd><dt>Как читать</dt><dd>Отвечает на вопрос «есть ли между партиями реальная разница в том, кого они выдвигают». Значения выше 0.95 означают практически неотличимые по профилю списки.</dd><dt>Оговорка</dt><dd>Сравнивается только профиль сфер — не программы, не идеология и не качество кандидатов. Две партии могут выдвигать похожих людей и предлагать разное.</dd></dl>',
        "Косинусная близость по профилю сфер: 1 — партии выдвигают статистически "
        "неотличимых людей. Пять партий из семи держатся выше 0.95. Реальных полюсов "
        "два — «Әділет» и ОСДП (0.24).",
        [name(p) for p in parties],
        [(name(a), [((pair(a, b)),
                     f"{name(a)} ~ {name(b)}: {pair(a, b):.3f}" if pair(a, b) is not None
                     else "та же партия") for b in parties]) for a in parties],
        fmt=lambda v: f"{v:.2f}", peak=1.0))

    page = f"""<!doctype html><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Метрики партий — Quryltai 2026</title>
<style>
.viz-root, body {{ color-scheme: light;
  --surface-1:#fcfcfb; --surface-2:#f3f2ef; --line:#e2e0da;
  --text-primary:#0b0b0b; --text-secondary:#52514e; --text-muted:#7c7a73; }}
@media (prefers-color-scheme: dark) {{ :root:where(:not([data-theme="light"])) body {{
  color-scheme: dark; --surface-1:#1a1a19; --surface-2:#242422; --line:#38382f;
  --text-primary:#fff; --text-secondary:#c3c2b7; --text-muted:#9a9890; }} }}
:root[data-theme="dark"] body {{ color-scheme: dark;
  --surface-1:#1a1a19; --surface-2:#242422; --line:#38382f;
  --text-primary:#fff; --text-secondary:#c3c2b7; --text-muted:#9a9890; }}
* {{ box-sizing:border-box }}
body {{ margin:0; padding:28px 20px 60px; background:var(--surface-1); color:var(--text-primary);
  font:14px/1.5 -apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif; }}
.wrap {{ max-width:1140px; margin:0 auto }}
h1 {{ font-size:26px; margin:0 0 4px; letter-spacing:-.02em }}
.sub {{ color:var(--text-secondary); margin:0 0 22px }}
.kpi {{ display:grid; grid-template-columns:repeat(auto-fit,minmax(210px,1fr)); gap:12px; margin-bottom:26px }}
.tile {{ background:var(--surface-2); border:1px solid var(--line); border-radius:10px; padding:14px 16px }}
.tile b {{ display:block; font-size:34px; line-height:1.05; letter-spacing:-.03em }}
.tile span {{ display:block; margin-top:4px; color:var(--text-secondary) }}
.tile i {{ display:block; margin-top:6px; font-size:11px; font-style:normal; color:var(--text-muted) }}
.card {{ background:var(--surface-2); border:1px solid var(--line); border-radius:10px;
  padding:16px 18px 12px; margin-bottom:16px }}
h3 {{ margin:0; font-size:16px }}
.explain {{ margin:0 }}
.explain > summary {{ list-style:none; cursor:pointer; display:flex; align-items:center; gap:8px }}
.explain > summary::-webkit-details-marker {{ display:none }}
.qm {{ flex:none; width:18px; height:18px; border-radius:50%; border:1px solid var(--line);
  background:var(--surface-1); color:var(--text-muted); font-size:11px; font-weight:600;
  display:grid; place-items:center }}
.explain > summary:hover .qm, .explain[open] .qm {{ color:var(--text-primary);
  border-color:var(--text-muted) }}
.explain[open] .qm::after {{ content:"" }}
.sr {{ position:absolute; width:1px; height:1px; overflow:hidden; clip-path:inset(50%) }}
.exp {{ margin:10px 0 0; padding:12px 14px; background:var(--surface-1);
  border:1px solid var(--line); border-radius:8px; font-size:12.5px;
  color:var(--text-secondary); max-width:80ch }}
.exp dt {{ font-weight:600; color:var(--text-primary); margin-top:8px }}
.exp dt:first-child {{ margin-top:0 }}
.exp dd {{ margin:2px 0 0 }}
.exp code {{ background:var(--surface-2); padding:1px 4px; border-radius:3px; font-size:11.5px }}
.note {{ margin:0 0 14px; color:var(--text-secondary); font-size:12.5px; max-width:75ch }}
.note code {{ background:var(--surface-1); padding:1px 4px; border-radius:3px; font-size:11.5px }}
.bars .row {{ display:grid; grid-template-columns:minmax(6.5rem,9rem) 1fr; gap:10px;
  align-items:center; margin-bottom:7px }}
.rl {{ color:var(--text-secondary); font-size:12.5px; text-align:right }}
.track {{ display:flex; align-items:center; gap:8px; min-width:0 }}
.bar {{ height:14px; background:#2a78d6; border-radius:0 4px 4px 0; min-width:2px }}
.val {{ font-variant-numeric:tabular-nums; font-size:12px; color:var(--text-primary); white-space:nowrap }}
.heat {{ display:grid; gap:2px; overflow-x:auto }}
.hh {{ font-size:10.5px; color:var(--text-muted); text-align:center; padding:0 2px 4px;
  writing-mode:vertical-rl; transform:rotate(180deg); max-height:8rem; justify-self:center }}
.rh {{ font-size:12px; color:var(--text-secondary); padding-right:8px; text-align:right;
  align-self:center; white-space:nowrap }}
.cell {{ min-height:30px; display:grid; place-items:center; font-size:11px;
  font-variant-numeric:tabular-nums; border-radius:3px }}
.cell.none {{ background:var(--surface-1); color:var(--text-muted) }}
.cell.low {{ color:var(--text-muted); border:1px dashed var(--line); position:relative;
  background:repeating-linear-gradient(135deg,var(--surface-1) 0 4px,transparent 4px 8px) }}
.cell.low i {{ font-style:normal; font-size:9px; opacity:.8; margin-left:4px }}
.lowkey {{ margin-left:auto }}
.scale {{ display:flex; align-items:center; gap:8px; margin-top:10px; font-size:11px;
  color:var(--text-muted) }}
.ramp {{ flex:1; height:8px; border-radius:4px;
  background:linear-gradient(90deg,{RAMP[0]},{RAMP[len(RAMP)//2]},{RAMP[-1]}) }}
.legend {{ display:flex; gap:14px; margin:0 0 12px; font-size:12px; color:var(--text-secondary) }}
.lg i {{ display:inline-block; width:10px; height:10px; border-radius:2px; margin-right:5px }}
.grouped {{ display:flex; gap:18px; align-items:flex-end; height:190px; padding-top:8px }}
.gcol {{ flex:1; display:flex; flex-direction:column; justify-content:flex-end; height:100% }}
.gbars {{ display:flex; gap:6px; align-items:flex-end; height:100% }}
.gb {{ flex:1; border-radius:4px 4px 0 0; position:relative; min-height:3px; display:flex;
  justify-content:center }}
.gb b {{ position:absolute; top:-17px; font-size:11px; font-weight:600;
  color:var(--text-primary); font-variant-numeric:tabular-nums }}
.gcl {{ text-align:center; font-size:11.5px; color:var(--text-secondary); padding-top:7px;
  border-top:1px solid var(--line); margin-top:6px }}
details {{ margin-top:10px; font-size:12px; color:var(--text-secondary) }}
summary {{ cursor:pointer; color:var(--text-muted) }}
table {{ border-collapse:collapse; margin-top:8px; font-size:11.5px; width:100% }}
th,td {{ border:1px solid var(--line); padding:3px 7px; text-align:right;
  font-variant-numeric:tabular-nums }}
th:first-child {{ text-align:left; color:var(--text-secondary); font-weight:500 }}
[data-tip] {{ position:relative }}
[data-tip]:hover::after {{ content:attr(data-tip); position:absolute; left:50%; bottom:calc(100% + 6px);
  transform:translateX(-50%); background:var(--text-primary); color:var(--surface-1);
  padding:5px 8px; border-radius:5px; font-size:11px; white-space:nowrap; z-index:9;
  pointer-events:none }}
footer {{ color:var(--text-muted); font-size:11.5px; margin-top:22px; max-width:80ch }}
</style>
<div class="wrap">
<h1>Сравнение партийных списков</h1>
<p class="sub">Все значения — доли и количества полей официального реестра.
Ни одна ось не оценивает партию.</p>
<div class="kpi">{kpi}</div>
{''.join(blocks)}
<footer>Источник: приложения к постановлениям ЦИК, перенесённые в
<code>V3__create_candidate.sql</code> — 545 кандидатов, 7 партий. Метод:
молодёжь — до 35 лет на {data['election_year']} год; города республиканского
значения — Астана, Алматы, Шымкент; «гос» — работодатель
<code>STATE_BODY</code> или <code>QUASI_GOVERNMENTAL</code>. Пересчитывается
скриптом <code>compute_party_metrics.py</code>. Фирменные цвета партий
сознательно не используются как цвета серий: четыре из семи — синие и
фиолетовые, валидатор палитры отклоняет их по четырём проверкам.</footer>
</div>"""
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    OUTPUT.write_text(page, encoding="utf-8")
    print(f"wrote {OUTPUT.relative_to(ROOT)} ({len(page) / 1024:.0f} KB), "
          f"{len(blocks)} charts")


if __name__ == "__main__":
    main()
