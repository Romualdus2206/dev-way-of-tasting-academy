#!/usr/bin/env python3
"""Generate content/PORT_FINAL_CONTENT.md — Gold Master QA op PERFECT."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from port_v2_gold_master_data import (  # noqa: E402
    FOOD_PAIRING_WAAROM,
    GOLD_KEY_CONCEPTS,
    PRO_INSIGHTS,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN,
    TERMINOLOGY_REPLACEMENTS,
)

PERFECT = ROOT / "content/archive/intermediate/PORT_TRACK_V2_PERFECT.md"
OUT = ROOT / "content/PORT_FINAL_CONTENT.md"

SECTIONS = (
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
)

WEAK_WAAROM_PATTERNS = (
    r"^Elke stijl vraagt",
    r"^Zoet en zout bouwen",
    r"^Krachtige tannines vragen",
    r"^Blendcomplexiteit vraagt",
    r"^Fruit, bitters en tannine bouwen",
    r"^Oxidatie spiegelt",
    r"^Karamel in het dessert",
    r"^Concentratie en suikers",
    r"^Pairing begint bij",
    r"^Structuurcomponenten",
    r"^Aroma-families",
    r"^Ruby: primair fruit",
    r"^Beschermde herkomst",
    r"^Historische export",
    r"^Gereduceerde Port",
)


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"\.{2,}", ".", text)
    text = re.sub(r"  +", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    text = re.sub(r"([a-zA-Z]) \.", r"\1.", text)
    text = re.sub(r'"\s+', '"', text)
    text = re.sub(r'\s+"', '"', text)
    text = re.sub(r"«\s+", "«", text)
    text = re.sub(r"\s+»", "»", text)
    text = re.sub(r" — — ", " — ", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def apply_terminology(text: str) -> str:
    if not text:
        return ""
    placeholders: dict[str, str] = {}
    for i, term in enumerate(("flesrijping", "glasrijping", "oxidatieve rijping", "mondgevoel")):
        token = f"__PRESERVE_{i}__"
        text = re.sub(re.escape(term), token, text, flags=re.I)
        placeholders[token] = term
    for pat, repl in TERMINOLOGY_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    for token, term in placeholders.items():
        text = text.replace(token, term)
    return text


def polish_food_pairing(text: str, lesson_num: int) -> str:
    text = micro_format(text)
    m = re.search(r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if not m:
        return text
    current = m.group(2).strip()
    override = FOOD_PAIRING_WAAROM.get(lesson_num)
    if override:
        new_waarom = override
    elif len(current) < 120 or any(re.match(p, current) for p in WEAK_WAAROM_PATTERNS):
        new_waarom = FOOD_PAIRING_WAAROM.get(lesson_num, current)
    else:
        new_waarom = current
    new_waarom = apply_terminology(micro_format(new_waarom))
    return text[: m.start(2)] + new_waarom + text[m.end(2) :]


def patch_quiz(text: str, lesson_num: int) -> str:
    patches = QUIZ_PATCHES.get(lesson_num)
    if not patches:
        return micro_format(text)
    for block in re.split(r"(?=### Vraag \d+)", patches):
        m = re.match(r"### Vraag (\d+)\s*\n(.*)", block, re.S)
        if not m:
            continue
        qnum = m.group(1)
        replacement = f"### Vraag {qnum}\n\n{m.group(2).strip()}\n"
        text = re.sub(
            rf"### Vraag {qnum}\s*\n.*?(?=\n### Vraag |\n## |\Z)",
            replacement,
            text,
            count=1,
            flags=re.S,
        )
    return micro_format(text)


def emit_kernbegrippen(terms: list[str]) -> str:
    return "\n".join(f"- {t}" for t in terms)


def polish_lesson_body(num: int, body: str) -> str:
    sections: dict[str, str] = {sec: extract_section(body, sec) for sec in SECTIONS}

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    no_quiz = num in (15, 42, 45)

    for sec in ("Leerdoel", "Theorie", "Wist-je-dat", "Samenvatting", "Praktijkopdracht", "Quiz-feedback"):
        if sections.get(sec):
            sections[sec] = apply_terminology(micro_format(sections[sec]))

    if sections.get("Samenvatting"):
        lines = [ln for ln in sections["Samenvatting"].splitlines() if ln.strip() not in ("-", "–")]
        sections["Samenvatting"] = "\n".join(lines)

    sections["Reflectievraag"] = REFLECTIEVRAGEN[num]
    sections["Pro insight"] = apply_terminology(micro_format(PRO_INSIGHTS[num]))

    if sections.get("Food pairing"):
        sections["Food pairing"] = apply_terminology(
            polish_food_pairing(sections["Food pairing"], num)
        )

    if sections.get("Quiz") and not no_quiz:
        sections["Quiz"] = apply_terminology(patch_quiz(sections["Quiz"], num))

    sections["Kernbegrippen (DB field)"] = emit_kernbegrippen(GOLD_KEY_CONCEPTS[num])

    lines = [
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug_m.group(1) if slug_m else ''}",
        f"**Duration:** {dur_m.group(1) if dur_m else '8'} min",
        f"**Quiz questions:** {'0' if no_quiz else (quiz_m.group(1) if quiz_m else '5')}",
        "",
        "---",
        "",
    ]

    order: list[str] = [
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Food pairing",
        "Pro insight",
        "Praktijkopdracht",
        "Reflectievraag",
    ]
    if not no_quiz:
        order.append("Quiz")
    order.extend(["Quiz-feedback", "Kernbegrippen (DB field)"])

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines)


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", "\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"(### Waarom dit werkt\n)\n+", r"\1\n", text)
    text = re.sub(r"([^\n])\n(### Vermijd)", r"\1\n\n\2", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 45:
        raise SystemExit("Expected 45 lessons")
    if re.search(r"[^.\n]\.\.(?!\.)", text):
        raise SystemExit("Double-period artifacts remain")
    if re.search(r"Hoe pas jij .+ morgen toe", text):
        raise SystemExit("Template reflectievraag remaining")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")


def build() -> str:
    raw = PERFECT.read_text(encoding="utf-8")
    header = raw.split("# MODULE 1")[0]
    header = re.sub(
        r"## Port Track V2 — Perfect.*\n",
        "## Port Track V2 — Gold Master\n",
        header,
    )
    header = re.sub(
        r"\*\*Versie:\*\* V2 Perfect.*\n",
        "**Versie:** V2 Gold Master (leidende versie, locked)\n",
        header,
    )
    header = re.sub(
        r"\*\*Bron:\*\*[^\n]+\n",
        "**Bron:** `PORT_TRACK_V2_PERFECT.md` → `python3 scripts/polish_port_track_v2_gold_master.py`\n",
        header,
    )

    out_parts = [header.rstrip(), "\n\n"]
    module_chunks = re.split(r"(^# MODULE \d+ — .+$)", raw, flags=re.M)[1:]

    for i in range(0, len(module_chunks), 2):
        mod_header = module_chunks[i]
        mod_body = module_chunks[i + 1] if i + 1 < len(module_chunks) else ""
        out_parts.append(mod_header + mod_body.split("# LES ")[0])

        lesson_parts = re.split(r"(^# LES (\d+) — .+$)", mod_body, flags=re.M)
        j = 1
        while j < len(lesson_parts):
            les_header = lesson_parts[j]
            les_num = int(lesson_parts[j + 1])
            les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
            out_parts.append(les_header + polish_lesson_body(les_num, les_body))
            j += 3

    result = normalize_output("".join(out_parts))
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
