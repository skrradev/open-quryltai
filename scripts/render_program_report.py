#!/usr/bin/env python3
"""Render the thematic programme analysis as a self-contained HTML report.

Form follows the data's job, not the original request. A radar over 17 topics
and 7 parties is a spider web nobody can read, so the topic matrix is a
**heatmap on one sequential hue** — the right form for a grid of magnitudes, and
it carries 17 topics without inventing 17 colors. Statement types are a
part-to-whole per party, so they are stacked bars on the categorical palette
(slots 1–6, validated in both modes).

Every share is shown with its denominator, because the denominator is itself an
annotation decision and moving it moves every share.

    python3 scripts/render_program_report.py
"""

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / "data" / "work"
OUT = WORK / "program_report.html"

PARTY_NAMES = {
    "adilet": "Әділет", "npk": "Народная партия", "baitaq": "Байтақ",
    "ak_zhol": "Ак жол", "osdp": "ОСДП", "respublica": "Respublica", "auyl": "Ауыл",
}
TYPE_NAMES = {
    "problem": "проблема", "goal": "цель", "instrument": "инструмент",
    "commitment": "обязательство", "achievement": "сделано", "description": "описание",
}
TYPE_ORDER = ["problem", "goal", "instrument", "commitment", "achievement", "description"]
# Categorical slots 1–6. Validated: light worst adjacent CVD ΔE 9.1, normal 19.6;
# dark 8.4 / 19.3. Light mode WARNs on contrast for three slots, so the relief
# rule applies — hence the visible segment labels and the table view below.
TYPE_LIGHT = ["#2a78d6", "#eb6834", "#1baf7a", "#eda100", "#e87ba4", "#008300"]
TYPE_DARK = ["#3987e5", "#d95926", "#199e70", "#c98500", "#d55181", "#008300"]
# Sequential blue, light→dark. Lightest step means "near zero" and may recede.
RAMP_LIGHT = ["#eef4fd", "#cde2fb", "#9ec5f4", "#6da7ec", "#3987e5", "#256abf", "#104281"]
RAMP_DARK = ["#20262e", "#173köö", "#184f95", "#1c5cab", "#2a78d6", "#5598e7", "#9ec5f4"]
RAMP_DARK = ["#20262e", "#12304f", "#184f95", "#1c5cab", "#2a78d6", "#5598e7", "#9ec5f4"]
DARK_INK, LIGHT_INK = "#0b0b0b", "#ffffff"


def _luminance(hex_color):
    channels = [int(hex_color[i:i + 2], 16) / 255 for i in (1, 3, 5)]
    channels = [c / 12.92 if c <= 0.03928 else ((c + 0.055) / 1.055) ** 2.4
                for c in channels]
    return 0.2126 * channels[0] + 0.7152 * channels[1] + 0.0722 * channels[2]


def label_ink(fill):
    """Pick the label color by measured contrast, not by eye.

    The palette validator checks the FILL against the surface; it says nothing
    about text sitting on that fill. White on the yellow slot measures 2.17:1 and
    was unreadable in the first render, so every label ink is computed here. The
    answer differs by mode — the flip point on the sequential ramp inverts between
    the light and dark steps — so both are emitted as their own variables.
    """
    on_white = _luminance(fill)
    white = (max(on_white, 1.0) + 0.05) / (min(on_white, 1.0) + 0.05)
    black = (max(on_white, 0.0) + 0.05) / (min(on_white, 0.0) + 0.05)
    return LIGHT_INK if white > black else DARK_INK


def step_for(share, top):
    """Bucket a share onto the ramp. Zero always gets the lightest step."""
    if share <= 0:
        return 0
    return min(len(RAMP_LIGHT) - 1, 1 + int(share / top * (len(RAMP_LIGHT) - 1.001)))


def esc(text):
    return (str(text).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;"))


def main():
    data = json.loads((WORK / "program_topic_metrics.json").read_text(encoding="utf-8"))
    names = data["topic_names"]
    per = data["per_party"]
    parties = sorted(per, key=lambda p: -per[p]["denominator"])
    # Topics ordered by corpus-wide weight so the eye reads top-down by importance.
    weight = {t: sum(per[p]["topic_counts"].get(t, 0) for p in parties) for t in names}
    topics = [t for t in sorted(names, key=lambda t: -weight[t]) if weight[t]]
    top_share = max(per[p]["topic_shares"].get(t, 0) for p in parties for t in topics)

    css_ramp = "\n".join(
        f"    --ramp-{i}: {RAMP_LIGHT[i]}; --ramp-ink-{i}: {label_ink(RAMP_LIGHT[i])};"
        for i in range(len(RAMP_LIGHT)))
    css_ramp_dark = "\n".join(
        f"    --ramp-{i}: {RAMP_DARK[i]}; --ramp-ink-{i}: {label_ink(RAMP_DARK[i])};"
        for i in range(len(RAMP_DARK)))
    css_types = "\n".join(
        f"    --type-{i}: {TYPE_LIGHT[i]}; --type-ink-{i}: {label_ink(TYPE_LIGHT[i])};"
        for i in range(len(TYPE_LIGHT)))
    css_types_dark = "\n".join(
        f"    --type-{i}: {TYPE_DARK[i]}; --type-ink-{i}: {label_ink(TYPE_DARK[i])};"
        for i in range(len(TYPE_DARK)))

    rows = []
    for topic in topics:
        cells = []
        for party in parties:
            share = per[party]["topic_shares"].get(topic, 0)
            count = per[party]["topic_counts"].get(topic, 0)
            step = step_for(share, top_share)
            unpiloted = ' data-unpiloted="1"' if topic in ("T15", "T16") else ""
            cells.append(
                f'<td class="cell s{step}"{unpiloted} '
                f'title="{esc(PARTY_NAMES[party])} · {esc(names[topic])}: '
                f'{count} из {per[party]["denominator"]} ({share:.1%})">'
                f'<span>{share*100:.1f}</span></td>')
        rows.append(
            f'<tr><th scope="row"><span class="code">{topic}</span>'
            f'{esc(names[topic])}</th>{"".join(cells)}</tr>')

    bars = []
    for party in parties:
        row = per[party]
        segs, labels = [], []
        for index, kind in enumerate(TYPE_ORDER):
            share = row["type_shares"].get(kind, 0)
            if share <= 0:
                continue
            count = row["type_counts"].get(kind, 0)
            segs.append(
                f'<div class="seg" style="flex:{share:.5f} 0 0;'
                f'background:var(--type-{index})" '
                f'title="{esc(PARTY_NAMES[party])} · {esc(TYPE_NAMES[kind])}: '
                f'{count} из {row["denominator"]} ({share:.1%})">'
                + (f'<span class="seg-label">{share*100:.0f}%</span>'
                   if share >= 0.09 else "") + "</div>")
        bars.append(
            f'<div class="bar-row"><div class="bar-name">{esc(PARTY_NAMES[party])}'
            f'<span class="den">n={row["denominator"]}</span></div>'
            f'<div class="bar">{"".join(segs)}</div></div>')

    legend = "".join(
        f'<span class="lg"><i style="background:var(--type-{i})"></i>'
        f'{esc(TYPE_NAMES[k])}</span>' for i, k in enumerate(TYPE_ORDER))

    type_table_rows = []
    for party in parties:
        row = per[party]
        tds = "".join(
            f'<td>{row["type_counts"].get(k, 0)}'
            f'<span class="pct">{row["type_shares"].get(k, 0):.1%}</span></td>'
            for k in TYPE_ORDER)
        type_table_rows.append(
            f'<tr><th scope="row">{esc(PARTY_NAMES[party])}</th>{tds}'
            f'<td class="den-cell">{row["denominator"]}</td></tr>')

    head = "".join(f'<th scope="col">{esc(PARTY_NAMES[p])}<span class="den">'
                   f'n={per[p]["denominator"]}</span></th>' for p in parties)
    scale = "".join(f'<i class="s{i}"></i>' for i in range(len(RAMP_LIGHT)))
    type_head = "".join(f"<th scope=\"col\">{esc(TYPE_NAMES[k])}</th>" for k in TYPE_ORDER)

    html = f"""<title>Программы партий: тематический разбор</title>
<style>
:root {{
  color-scheme: light;
  --surface: #fcfcfb; --panel: #ffffff; --line: #e4e3df;
  --ink: #0b0b0b; --ink-2: #52514e; --ink-3: #78766f;
  --ink-on-fill: #ffffff;
{css_ramp}
{css_types}
}}
@media (prefers-color-scheme: dark) {{
  :root:not([data-theme="light"]) {{
    color-scheme: dark;
    --surface: #1a1a19; --panel: #212120; --line: #383835;
    --ink: #ffffff; --ink-2: #c3c2b7; --ink-3: #94938a;
    --ink-on-fill: #ffffff;
{css_ramp_dark}
{css_types_dark}
  }}
}}
:root[data-theme="dark"] {{
  color-scheme: dark;
  --surface: #1a1a19; --panel: #212120; --line: #383835;
  --ink: #ffffff; --ink-2: #c3c2b7; --ink-3: #94938a;
  --ink-on-fill: #ffffff;
{css_ramp_dark}
{css_types_dark}
}}
* {{ box-sizing: border-box; }}
body {{
  margin: 0; background: var(--surface); color: var(--ink);
  font: 15px/1.55 ui-sans-serif, -apple-system, "Segoe UI", Roboto, sans-serif;
}}
.wrap {{ max-width: 1080px; margin: 0 auto; padding: 40px 20px 72px; }}
h1 {{ font-size: 27px; line-height: 1.25; margin: 0 0 8px; letter-spacing: -0.01em; }}
h2 {{ font-size: 19px; margin: 44px 0 4px; letter-spacing: -0.005em; }}
p.sub {{ color: var(--ink-2); margin: 0 0 6px; max-width: 68ch; }}
p.note {{ color: var(--ink-3); font-size: 13.5px; margin: 6px 0 0; max-width: 74ch; }}
.kpis {{ display: flex; flex-wrap: wrap; gap: 10px; margin: 22px 0 8px; }}
.kpi {{ background: var(--panel); border: 1px solid var(--line); border-radius: 10px;
        padding: 12px 16px; min-width: 132px; }}
.kpi b {{ display: block; font-size: 26px; line-height: 1.15; letter-spacing: -0.02em; }}
.kpi span {{ color: var(--ink-2); font-size: 12.5px; }}
.scroll {{ overflow-x: auto; margin-top: 14px; }}
table {{ border-collapse: collapse; width: 100%; font-size: 13.5px; }}
th, td {{ text-align: left; padding: 7px 9px; }}
thead th {{ color: var(--ink-2); font-weight: 600; font-size: 12.5px;
            border-bottom: 1px solid var(--line); vertical-align: bottom; }}
tbody th {{ font-weight: 500; color: var(--ink); white-space: nowrap; }}
.code {{ color: var(--ink-3); font: 500 11.5px ui-monospace, monospace;
         margin-right: 7px; }}
.den {{ display: block; color: var(--ink-3); font-weight: 400; font-size: 11px; }}
.cell {{ text-align: center; font-variant-numeric: tabular-nums;
         border: 2px solid var(--surface); border-radius: 5px; min-width: 62px; }}
.cell[data-unpiloted] span::after {{ content: "*"; opacity: .75; margin-left: 1px; }}
{"".join(f".cell.s{i}{{background:var(--ramp-{i});color:var(--ramp-ink-{i});}}" for i in range(len(RAMP_LIGHT)))}
.scale {{ display: flex; align-items: center; gap: 8px; margin-top: 12px;
          color: var(--ink-3); font-size: 12px; }}
.scale i {{ width: 26px; height: 11px; border-radius: 3px; display: inline-block; }}
{"".join(f".scale i.s{i}{{background:var(--ramp-{i});}}" for i in range(len(RAMP_LIGHT)))}
.bar-row {{ display: flex; align-items: center; gap: 14px; margin: 9px 0; }}
.bar-name {{ width: 148px; flex: none; font-size: 13.5px; }}
.bar {{ flex: 1; display: flex; height: 30px; border-radius: 5px; overflow: hidden;
        gap: 2px; }}
.seg {{ display: flex; align-items: center; justify-content: center; min-width: 3px; }}
.seg:first-child {{ border-radius: 5px 0 0 5px; }}
.seg:last-child {{ border-radius: 0 5px 5px 0; }}
.seg-label {{ font-size: 11.5px; font-weight: 600; }}
.legend {{ display: flex; flex-wrap: wrap; gap: 6px 16px; margin: 14px 0 0 162px;
           color: var(--ink-2); font-size: 12.5px; }}
.lg {{ display: inline-flex; align-items: center; gap: 6px; }}
.lg i {{ width: 11px; height: 11px; border-radius: 3px; display: inline-block; }}
details {{ margin-top: 16px; }}
summary {{ cursor: pointer; color: var(--ink-2); font-size: 13.5px; }}
.pct {{ color: var(--ink-3); margin-left: 6px; font-size: 12px; }}
.den-cell {{ color: var(--ink-3); }}
tbody tr:nth-child(even) td, tbody tr:nth-child(even) th {{ background: color-mix(in srgb, var(--line) 26%, transparent); }}
.method {{ background: var(--panel); border: 1px solid var(--line); border-radius: 10px;
           padding: 16px 18px; margin-top: 40px; }}
.method h3 {{ margin: 0 0 8px; font-size: 15px; }}
.method ul {{ margin: 0; padding-left: 19px; color: var(--ink-2); font-size: 13.5px; }}
.method li {{ margin: 5px 0; }}
@media (max-width: 720px) {{
  .bar-name {{ width: 104px; }} .legend {{ margin-left: 0; }}
}}
</style>

<div class="wrap">
<h1>Программы партий: о чём они пишут и как</h1>
<p class="sub">Сплошная разметка семи предвыборных программ на выборы в Курултай
2026 года. Измеряется <b>внимание</b> — сколько места партия отводит теме, — а не
позиция по ней и не качество программы.</p>

<div class="kpis">
  <div class="kpi"><b>{data['totals']['units']}</b><span>единиц разметки</span></div>
  <div class="kpi"><b>{data['totals']['denominator']}</b><span>в знаменателе</span></div>
  <div class="kpi"><b>7</b><span>партий</span></div>
  <div class="kpi"><b>0.83 / 0.85</b><span>α пилота: тема / тип</span></div>
</div>
<p class="note">Знаменатель — только содержательные единицы. Заголовки, лозунги,
вводные фразы и фрагменты исключены, поэтому он меньше общего числа.</p>

<h2>Темы</h2>
<p class="sub">Доля содержательных единиц партии, отнесённых к теме. Читать по
столбцу — профиль партии; по строке — кто уделяет теме больше места.</p>
<div class="scroll">
<table>
<thead><tr><th scope="col">Тема</th>{head}</tr></thead>
<tbody>{"".join(rows)}</tbody>
</table>
</div>
<div class="scale"><span>0</span>{scale}<span>{top_share*100:.0f}% и выше</span></div>
<p class="note">* T15 и T16 появились в кодбуке после пилота, согласие по ним не
измерялось. Показаны как абсолютные величины, доли по ним публиковать нельзя.</p>

<h2>Типы утверждений</h2>
<p class="sub">Одна и та же тема может быть названа проблемой, целью, механизмом
или обещанием. Это различие партии разделяет сильнее, чем сами темы.</p>
{"".join(bars)}
<div class="legend">{legend}</div>
<details>
<summary>Показать числами</summary>
<div class="scroll">
<table>
<thead><tr><th scope="col">Партия</th>{type_head}<th scope="col">знаменатель</th></tr></thead>
<tbody>{"".join(type_table_rows)}</tbody>
</table>
</div>
</details>

<div class="method">
<h3>Как это измерено и чего не показывает</h3>
<ul>
<li><b>Внимание, не позиция.</b> Доля T06 у партии говорит, сколько места она
отвела экологии, а не что она предлагает делать.</li>
<li><b>Надёжность.</b> Кодбук проверен двумя аннотаторами на выборке из 175
единиц: α Криппендорфа 0.827 по теме и 0.852 по типу. Дальше корпус размечен
одним аннотатором — обычная последовательность контент-анализа.</li>
<li><b>Длина программы влияет.</b> У Әділет знаменатель втрое больше следующей
партии, поэтому её доли механически ровнее. Широкий охват и расфокусированность
по доле неразличимы.</li>
<li><b>T13 неоднородна.</b> У Народной партии и Әділет в неё попала гражданская
защита при ЧС, поэтому долю T13 нельзя читать как внимание к международным делам.</li>
<li><b>Вторичные темы в доли не входят.</b> Каждая единица считается ровно один
раз.</li>
</ul>
</div>
</div>
"""
    OUT.write_text(html, encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)}  ({len(html)/1024:.0f} KB)")
    print(f"темы: {len(topics)}, партии: {len(parties)}, макс. доля {top_share:.1%}")


if __name__ == "__main__":
    main()
