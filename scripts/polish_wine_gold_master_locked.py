#!/usr/bin/env python3
"""Generate content/pipeline/WINE_LOCKED_CONTENT.md — micro-pass (normbestand)."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from wine_gold_master_locked_data import (  # noqa: E402
    FOOD_PAIRING_OVERRIDES,
    KERNBEGRIP_FIXES,
    REFLECTIEVRAGEN,
    TYPO_REPLACEMENTS,
)

SOURCE = ROOT / "content/pipeline/WINE_PIPELINE_CONTENT.md"
OUT = ROOT / "content/pipeline/WINE_LOCKED_CONTENT.md"

MODULE_TRAILER = re.compile(
    r"\n+(### Module \d+ —[^\n]+\n.*)",
    re.S,
)

GENERIC_KERNBEGRIPPEN = frozenset(
    {"wijn", "smaak", "goed", "stijl", "balans", "proeven", "analyseren", "conclusie", "integratie", "harmonie"}
)


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"\.{2,}", ".", text)
    text = re.sub(r"[ \t]+$", "", text, flags=re.M)
    text = re.sub(r"  +", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
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
    return m.group(1).strip() if m else ""


def normalize_quiz(text: str) -> str:
    text = re.sub(r"\n---\n+(?=### Vraag )", "\n\n", text)
    return polish_display_text(text)


def strip_reflectie_from_praktijk(praktijk: str) -> str:
    return re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()


def count_quiz_questions(body: str) -> int:
    quiz = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")
    if not quiz:
        return 0
    return len(re.findall(r"^### Vraag \d+", quiz, re.M))


def peel_trailing_module(body: str) -> tuple[str, str]:
    m = MODULE_TRAILER.search(body)
    if m:
        return body[: m.start()], m.group(1)
    return body, ""


def polish_kernbegrip(item: str) -> str:
    return polish_display_text(item)


def polish_lesson(num: int, header: str, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)
    header = polish_display_text(header)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    quiz_count = int(quiz_m.group(1)) if quiz_m else count_quiz_questions(body)

    sections: dict[str, str] = {}
    for sec in ("Leerdoel", "Wist-je-dat", "Quiz-feedback"):
        raw = extract_section(body, sec)
        if raw:
            sections[sec] = polish_display_text(raw)

    raw_theory = extract_section(body, "Theorie")
    if raw_theory:
        sections["Theorie"] = polish_display_text(raw_theory)

    raw_sum = extract_section(body, "Samenvatting")
    if raw_sum:
        sections["Samenvatting"] = polish_display_text(raw_sum)

    if num in FOOD_PAIRING_OVERRIDES:
        sections["Food pairing"] = polish_display_text(FOOD_PAIRING_OVERRIDES[num])
    else:
        raw_fp = extract_section(body, "Food pairing")
        if raw_fp:
            sections["Food pairing"] = polish_display_text(raw_fp)

    raw_pi = extract_section(body, "Pro insight")
    if raw_pi:
        sections["Pro insight"] = polish_display_text(raw_pi)

    praktijk_raw = extract_section(body, "Praktijkopdracht")
    if praktijk_raw:
        sections["Praktijkopdracht"] = polish_display_text(strip_reflectie_from_praktijk(praktijk_raw))

    if num in REFLECTIEVRAGEN:
        sections["Reflectievraag"] = polish_display_text(REFLECTIEVRAGEN[num])
    else:
        raw_refl = extract_section(body, "Reflectievraag")
        if not raw_refl and praktijk_raw:
            refl_m = re.search(r"### Reflectievraag\s*\n+(.*?)(?=\n---|\n## |\Z)", praktijk_raw, re.S)
            raw_refl = refl_m.group(1).strip() if refl_m else ""
        if raw_refl:
            sections["Reflectievraag"] = polish_display_text(raw_refl)

    quiz_raw = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")
    if quiz_raw and quiz_count > 0:
        sections["Quiz"] = normalize_quiz(quiz_raw)

    if num in KERNBEGRIP_FIXES:
        sections["Kernbegrippen (DB field)"] = "\n".join(f"- {t}" for t in KERNBEGRIP_FIXES[num])
    else:
        kc = extract_section(body, "Kernbegrippen (DB field)")
        if kc:
            kc_lines = []
            for ln in kc.splitlines():
                ln = ln.strip()
                if ln.startswith("- "):
                    kc_lines.append(f"- {polish_kernbegrip(ln[2:])}")
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
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines), trailer


def polish_module_block(block: str) -> str:
    return polish_display_text(block)


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    pre = raw[:first_les]
    mod_m = re.search(r"(### Module 1 —.*)", pre, re.S)
    module_block = polish_module_block(mod_m.group(1)) if mod_m else ""
    return (
        "# Way of Tasting Academy\n\n"
        "---\n\n"
        "## Wine Foundation Track V2 — Gold Master LOCKED\n"
        "### 40 lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master LOCKED (leidende versie)\n"
        "**Bron:** `WINE_TRACK_V2_GOLD_MASTER.md` → "
        "`python3 scripts/polish_wine_gold_master_locked.py`\n\n"
        "---\n\n"
        f"{module_block}\n"
    )


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 40:
        raise SystemExit("Expected 40 lessons")

    banned = r"NOTE:|TODO|FIXME|placeholder|contentReference|oaicite|\bfoodpairing\b|\bCO2\b"
    if re.search(banned, text, re.I):
        raise SystemExit("Banned patterns remain")

    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")

    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Expected 9 module headers")

    for num in range(1, 41):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if "## Pro insight" not in chunk:
            raise SystemExit(f"LES {num}: missing Pro insight")
        if num >= 16 and "## Food pairing" not in chunk:
            raise SystemExit(f"LES {num}: missing Food pairing")
        if "## Reflectievraag" not in chunk:
            raise SystemExit(f"LES {num}: missing Reflectievraag")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if not kc:
            raise SystemExit(f"LES {num}: missing Kernbegrippen")
        items = [ln.strip()[2:] for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
        if len(items) != 5:
            raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")
        if any(i.lower() in GENERIC_KERNBEGRIPPEN for i in items):
            raise SystemExit(f"LES {num}: generic kernbegrip: {items}")

        praktijk = re.search(r"## Praktijkopdracht\s*\n(.*?)(?=\n## |\Z)", chunk, re.S)
        if not praktijk or "### Opdracht" not in praktijk.group(1):
            raise SystemExit(f"LES {num}: Praktijkopdracht missing ### Opdracht")
        if "### Checklist" not in praktijk.group(1):
            raise SystemExit(f"LES {num}: Praktijkopdracht missing ### Checklist")
        if "### Reflectievraag" in praktijk.group(1):
            raise SystemExit(f"LES {num}: reflectievraag still in praktijk")

        if num in (15, 40):
            quiz = extract_section(chunk, "Quiz")
            if quiz and re.search(r"\n---\n", quiz):
                raise SystemExit(f"LES {num}: quiz contains internal --- separators")


def build() -> str:
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
