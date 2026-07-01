#!/usr/bin/env python3
"""Generate content/ROSE_FINAL_CONTENT.md — final precision lock pass."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from rose_gold_master_locked_data_l1_22 import QUIZ_FEEDBACK_OVERRIDES as QF_L1  # noqa: E402
from rose_gold_master_locked_data_l23_43 import (  # noqa: E402
    MODULE_KERNBEGRIPPEN,
    QUIZ_FEEDBACK_OVERRIDES as QF_L2,
)

SOURCE = ROOT / "content/pipeline/ROSE_PIPELINE_CONTENT.md"
OUT = ROOT / "content/ROSE_FINAL_CONTENT.md"
LESSON_COUNT = 43

QUIZ_FEEDBACK_OVERRIDES = {**QF_L1, **QF_L2}

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bfoodpairing\b", "food pairing"),
    (r"✅[ \t]+", "✅"),
    (r"(\d)°C", r"\1 °C"),
    (r"\bfrisheid\b", "zuurspanning"),
    (r"(?<!aromatische )\bfinesse\b", "aromatische finesse"),
    (r"(?<!fenolische )\bgrip\b", "fenolische grip"),
    (r" {2,}", " "),
    (r"\.{2,}", "."),
    (r" +([,.;:!?])", r"\1"),
    (r"\n{3,}", "\n\n"),
    (r"’", "'"),
]

BANNED_FEEDBACK = re.compile(
    r"^(Goed gedaan|Perfect|Mooi|Goed|Sterk)\.?\s*$",
    re.I | re.M,
)

MODULE_TRAILER = re.compile(
    r"\n+(### Module \d+ —[^\n]+\n.*)",
    re.S,
)

GENERIC_LESSON_KERNBEGRIPPEN = frozenset(
    {
        "wijn",
        "smaak",
        "goed",
        "stijl",
        "balans",
        "fris",
        "frisheid",
        "aroma",
        "proeven",
        "fruitig",
        "licht",
        "droog",
        "elegant",
        "rosé",
        "rose",
        "kleur",
        "body",
        "pairing",
        "harmonie",
    }
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
    kc = MODULE_KERNBEGRIPPEN[num]

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


def polish_lesson(build_idx: int, header: str, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)
    header = polish_display_text(header)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    quiz_count = int(quiz_m.group(1)) if quiz_m else 0

    sections: dict[str, str] = {}

    for sec in (
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Food pairing",
        "Pro insight",
        "Praktijkopdracht",
        "Reflectievraag",
    ):
        raw = extract_section(body, sec)
        if raw:
            sections[sec] = polish_display_text(raw)

    sections["Quiz-feedback"] = polish_display_text(QUIZ_FEEDBACK_OVERRIDES[build_idx])

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
    optional = {"Wist-je-dat", "Food pairing", "Quiz"}
    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec in optional:
                continue
            raise SystemExit(f"Build index {build_idx}: ontbrekende sectie {sec}")
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
        "## Rosé Track V2 — Gold Master LOCKED\n"
        f"### {LESSON_COUNT} lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master LOCKED (leidende versie)\n"
        "**Bron:** `ROSE_TRACK_V2_GOLD_MASTER.md` → "
        "`python3 scripts/polish_rose_gold_master_locked.py`\n\n"
        "---\n\n"
        f"{module_block}\n"
    )


def normalize_output(text: str) -> str:
    text = re.sub(r"(\n---\n)+", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != LESSON_COUNT:
        raise SystemExit(f"Expected {LESSON_COUNT} lessons")

    banned = r"NOTE:|TODO|FIXME|placeholder|contentReference|oaicite|\bfoodpairing\b"
    if re.search(banned, text, re.I):
        raise SystemExit("Banned patterns remain")

    if BANNED_FEEDBACK.search(text):
        raise SystemExit("Weak quiz-feedback phrase remains")

    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")

    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Expected 9 module headers")

    build_idx = 0
    for m in re.finditer(r"^# LES (\d+) — ", text, re.M):
        build_idx += 1
        chunk = text[m.start() :].split("\n# LES ")[0]
        qf = extract_section(chunk, "Quiz-feedback")
        if "leeranker" not in qf.lower():
            raise SystemExit(f"Build index {build_idx}: quiz-feedback missing leerankers")
        kc = extract_section(chunk, "Kernbegrippen (DB field)")
        items = [ln.strip()[2:] for ln in kc.splitlines() if ln.strip().startswith("- ")]
        if len(items) != 5:
            raise SystemExit(f"Build index {build_idx}: expected 5 kernbegrippen, got {len(items)}")
        if any(i.lower() in GENERIC_LESSON_KERNBEGRIPPEN for i in items):
            raise SystemExit(f"Build index {build_idx}: generic lesson kernbegrip: {items}")


def build() -> str:
    if set(QUIZ_FEEDBACK_OVERRIDES) != set(range(1, LESSON_COUNT + 1)):
        missing = set(range(1, LESSON_COUNT + 1)) - set(QUIZ_FEEDBACK_OVERRIDES)
        raise SystemExit(f"Missing quiz feedback: {sorted(missing)}")
    if set(MODULE_KERNBEGRIPPEN) != set(range(1, 10)):
        raise SystemExit("MODULE_KERNBEGRIPPEN must cover modules 1-9")

    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    build_idx = 0
    while j < len(lesson_parts):
        build_idx += 1
        les_header = lesson_parts[j]
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        polished, trailer = polish_lesson(build_idx, les_header, les_body)
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
