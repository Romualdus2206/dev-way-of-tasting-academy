#!/usr/bin/env python3
"""Generate content/WHITE_FINAL_CONTENT.md — final elite polish."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from white_gold_master_locked_data_l1_20 import (  # noqa: E402
    FOOD_PAIRING_OVERRIDES as FP_L1,
    PRO_INSIGHT_OVERRIDES as PI_L1,
    QUIZ_FEEDBACK_OVERRIDES as QF_L1,
    THEORY_LEAD_OVERRIDES as TL_L1,
    WIST_JE_DAT_OVERRIDES as WJD_L1,
)
from white_gold_master_locked_data_l21_40 import (  # noqa: E402
    FOOD_PAIRING_OVERRIDES as FP_L2,
    MODULE_KERNBEGRIPPEN,
    PRO_INSIGHT_OVERRIDES as PI_L2,
    QUIZ_FEEDBACK_OVERRIDES as QF_L2,
    THEORY_LEAD_OVERRIDES as TL_L2,
    WIST_JE_DAT_OVERRIDES as WJD_L2,
)

SOURCE = ROOT / "content/pipeline/WHITE_PIPELINE_CONTENT.md"
OUT = ROOT / "content/WHITE_FINAL_CONTENT.md"

THEORY_LEAD_OVERRIDES = {**TL_L1, **TL_L2}
PRO_INSIGHT_OVERRIDES = {**PI_L1, **PI_L2}
QUIZ_FEEDBACK_OVERRIDES = {**QF_L1, **QF_L2}
WIST_JE_DAT_OVERRIDES = {**WJD_L1, **WJD_L2}
FOOD_PAIRING_OVERRIDES = {**FP_L1, **FP_L2}

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bfoodpairing\b", "food pairing"),
    (r"✅[ \t]+", "✅"),
    (r"(\d)°C", r"\1 °C"),
    (r" {2,}", " "),
    (r"\.{2,}", "."),
    (r" +([,.;:!?])", r"\1"),
    (r"\n{3,}", "\n\n"),
    (r"’", "'"),
]

MODULE_TRAILER = re.compile(
    r"\n+(### Module \d+ —[^\n]+\n.*)",
    re.S,
)

GENERIC_KERNBEGRIPPEN = frozenset(
    {
        "wijn",
        "smaak",
        "goed",
        "stijl",
        "balans",
        "fris",
        "frisheid",
        "rijk",
        "zuur",
        "aroma",
        "proeven",
        "analyseren",
        "integratie",
        "fruitig",
        "licht",
        "droog",
        "elegant",
        "pairing",
        "harmonie",
        "body",
        "kleur",
    }
)

PRO_INSIGHT_MARKERS = (
    "gast",
    "serveer",
    "temperatuur",
    "glas",
    "fout",
    "advies",
    "blind",
    "pairing",
    "verwachting",
    "menu",
    "kaart",
    "reductie",
    "decanter",
    "kwaliteit",
    "schenk",
    "proef",
    "verkoop",
    "test",
    "positioneer",
)


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"[ \t]+$", "", text, flags=re.M)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def apply_typos(text: str) -> str:
    for pat, repl in TYPO_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    return text


def polish_display_text(text: str) -> str:
    return apply_typos(micro_format(text))


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    if not m:
        return ""
    content = m.group(1).strip()
    return re.sub(r"\n---\s*$", "", content).strip()


def patch_theory_lead(theory: str, lead: str) -> str:
    paragraphs = [p.strip() for p in theory.split("\n\n") if p.strip()]
    if not paragraphs:
        return polish_display_text(lead)
    paragraphs[0] = lead.strip()
    return polish_display_text("\n\n".join(paragraphs))


def normalize_quiz(text: str) -> str:
    text = re.sub(r"\n---\n+(?=### Vraag )", "\n\n", text)
    return polish_display_text(text)


def strip_reflectie_from_praktijk(praktijk: str) -> str:
    return re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()


def peel_trailing_module(body: str) -> tuple[str, str]:
    m = MODULE_TRAILER.search(body)
    if m:
        return body[: m.start()], m.group(1)
    return body, ""


def polish_module_block(block: str) -> str:
    m = re.search(r"### Module (\d+) — ([^\n]+)", block)
    if not m:
        return polish_display_text(block)
    num = int(m.group(1))
    title = m.group(2).strip()
    level_m = re.search(r"\*\*Level:\*\* ([^\n]+)", block)
    pillar_m = re.search(r"\*\*Framework pillar:\*\* ([^\n]+)", block)
    goal_m = re.search(r"\*\*Module goal:\*\* (.+)", block)
    kc = MODULE_KERNBEGRIPPEN.get(num, [])
    if not kc:
        kc_m = re.search(
            r"## Module kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)",
            block,
            re.S,
        )
        if kc_m:
            kc = [ln.strip()[2:] for ln in kc_m.group(1).splitlines() if ln.strip().startswith("- ")]

    lines = [
        f"### Module {num} — {title}",
        "",
        f"**Level:** {level_m.group(1).strip() if level_m else 'Explorer'}",
        f"**Framework pillar:** {pillar_m.group(1).strip() if pillar_m else ''}",
        f"**Module goal:** {polish_display_text(goal_m.group(1)) if goal_m else ''}",
        "",
        "---",
        "",
        "## Module kernbegrippen (DB field)",
        "",
    ]
    lines.extend(f"- {t}" for t in kc)
    lines.extend(["", "---", ""])
    return "\n".join(lines)


def polish_lesson(num: int, header: str, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)
    header = polish_display_text(header)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    quiz_count = int(quiz_m.group(1)) if quiz_m else 0

    sections: dict[str, str] = {}

    raw_theory = extract_section(body, "Theorie")
    if raw_theory:
        if num in THEORY_LEAD_OVERRIDES:
            sections["Theorie"] = patch_theory_lead(raw_theory, THEORY_LEAD_OVERRIDES[num])
        else:
            sections["Theorie"] = polish_display_text(raw_theory)

    for sec in ("Leerdoel", "Samenvatting", "Praktijkopdracht", "Reflectievraag"):
        raw = extract_section(body, sec)
        if raw:
            sections[sec] = polish_display_text(raw)

    if num in FOOD_PAIRING_OVERRIDES:
        sections["Food pairing"] = polish_display_text(FOOD_PAIRING_OVERRIDES[num])
    else:
        raw_fp = extract_section(body, "Food pairing")
        if raw_fp:
            sections["Food pairing"] = polish_display_text(raw_fp)

    sections["Wist-je-dat"] = polish_display_text(WIST_JE_DAT_OVERRIDES[num])
    sections["Pro insight"] = polish_display_text(PRO_INSIGHT_OVERRIDES[num])
    sections["Quiz-feedback"] = polish_display_text(QUIZ_FEEDBACK_OVERRIDES[num])

    praktijk = sections.get("Praktijkopdracht", "")
    if praktijk:
        sections["Praktijkopdracht"] = polish_display_text(strip_reflectie_from_praktijk(praktijk))

    quiz_raw = extract_section(body, "Quiz")
    if quiz_raw and quiz_count > 0:
        sections["Quiz"] = normalize_quiz(quiz_raw)

    kc = extract_section(body, "Kernbegrippen (DB field)")
    if kc:
        kc_lines = [
            f"- {polish_display_text(ln.strip()[2:])}"
            for ln in kc.splitlines()
            if ln.strip().startswith("- ")
        ]
        if kc_lines:
            sections["Kernbegrippen (DB field)"] = "\n".join(kc_lines)

    lines = [
        header.rstrip(),
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug_m.group(1) if slug_m else ''}",
        f"**Duration:** {dur_m.group(1) if dur_m else '8'} min",
        f"**Quiz questions:** {quiz_count}",
        "",
        "---",
        "",
    ]

    order = [
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Food pairing",
        "Pro insight",
        "Praktijkopdracht",
        "Reflectievraag",
        "Quiz",
        "Quiz-feedback",
        "Kernbegrippen (DB field)",
    ]
    optional = {"Food pairing", "Quiz"}
    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec in optional:
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines), trailer


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    pre = raw[:first_les]
    mod_m = re.search(r"(### Module 1 —.*)", pre, re.S)
    module_block = polish_module_block(mod_m.group(1)) if mod_m else ""
    return (
        "# Way of Tasting Academy\n\n"
        "---\n\n"
        "## White Wine Track V2 — Gold Master LOCKED\n"
        "### 40 lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master LOCKED (leidende versie)\n"
        "**Bron:** `WHITE_TRACK_V2_GOLD_MASTER.md` → "
        "`python3 scripts/polish_white_gold_master_locked.py`\n\n"
        "---\n\n"
        f"{module_block}\n"
    )


def normalize_output(text: str) -> str:
    text = re.sub(r"(\n---\n)+", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 40:
        raise SystemExit("Expected 40 lessons")

    banned = r"NOTE:|TODO|FIXME|placeholder|contentReference|oaicite|\bfoodpairing\b"
    if re.search(banned, text, re.I):
        raise SystemExit("Banned patterns remain")

    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")

    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Expected 9 module headers")

    for num in range(1, 41):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        for sec in (
            "Leerdoel",
            "Theorie",
            "Wist-je-dat",
            "Samenvatting",
            "Pro insight",
            "Praktijkopdracht",
            "Reflectievraag",
            "Quiz-feedback",
            "Kernbegrippen (DB field)",
        ):
            if f"## {sec}" not in chunk:
                raise SystemExit(f"LES {num}: missing {sec}")
        if num >= 16 and "## Food pairing" not in chunk:
            raise SystemExit(f"LES {num}: missing Food pairing")

        pi = extract_section(chunk, "Pro insight").lower()
        if not any(m in pi for m in PRO_INSIGHT_MARKERS):
            raise SystemExit(f"LES {num}: pro insight missing practical marker")

        qf = extract_section(chunk, "Quiz-feedback")
        if "leeranker" not in qf.lower():
            raise SystemExit(f"LES {num}: quiz-feedback missing leerankers")

        kc = extract_section(chunk, "Kernbegrippen (DB field)")
        items = [ln.strip()[2:] for ln in kc.splitlines() if ln.strip().startswith("- ")]
        if len(items) != 5:
            raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")
        if any(i.lower() in GENERIC_KERNBEGRIPPEN for i in items):
            raise SystemExit(f"LES {num}: generic kernbegrip: {items}")

        praktijk = extract_section(chunk, "Praktijkopdracht")
        if "### Opdracht" not in praktijk and "### Examenonderdeel" not in praktijk:
            raise SystemExit(f"LES {num}: praktijk incomplete")
        if "### Checklist" not in praktijk and "### Examenonderdeel" not in praktijk:
            raise SystemExit(f"LES {num}: missing checklist")


def build() -> str:
    if set(PRO_INSIGHT_OVERRIDES) != set(range(1, 41)):
        missing = set(range(1, 41)) - set(PRO_INSIGHT_OVERRIDES)
        raise SystemExit(f"Missing pro insight overrides: {sorted(missing)}")
    if set(QUIZ_FEEDBACK_OVERRIDES) != set(range(1, 41)):
        missing = set(range(1, 41)) - set(QUIZ_FEEDBACK_OVERRIDES)
        raise SystemExit(f"Missing quiz feedback overrides: {sorted(missing)}")
    if set(WIST_JE_DAT_OVERRIDES) != set(range(1, 41)):
        missing = set(range(1, 41)) - set(WIST_JE_DAT_OVERRIDES)
        raise SystemExit(f"Missing wist-je-dat overrides: {sorted(missing)}")

    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        polished, trailer = polish_lesson(les_num, les_header, les_body)
        out_parts.append(polished)
        if trailer:
            mod_block = re.search(r"(### Module \d+ —.*)", trailer, re.S)
            if mod_block:
                out_parts.append("\n" + polish_module_block(mod_block.group(1)) + "\n")
        j += 3

    result = normalize_output("".join(out_parts))
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
