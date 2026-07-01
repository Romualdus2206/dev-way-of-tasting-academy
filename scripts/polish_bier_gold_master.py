#!/usr/bin/env python3
"""Generate content/pipeline/BIER_PIPELINE_CONTENT.md — Gold Master upgrade op BIER_MODULES."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from bier_gold_master_data import (  # noqa: E402
    FOOD_PAIRING,
    GOLD_KEY_CONCEPTS,
    LEERDOELEN,
    PRO_INSIGHTS,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN,
    TERMINOLOGY_REPLACEMENTS,
    THEORY_OVERRIDES,
    fix_artifacts,
)
from polish_port_track_v2_perfect import premium_smooth_prose  # noqa: E402

SOURCE = ROOT / "content/archive/legacy/BIER_MODULES.md"
OUT = ROOT / "content/pipeline/BIER_PIPELINE_CONTENT.md"

MODULE_TRAILER = re.compile(
    r"\n+# Way of Tasting Academy\s*\n## Beer Track\s*\n### Module \d+ —[^\n]+\n.*",
    re.S,
)


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
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
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def apply_terminology(text: str) -> str:
    if not text:
        return ""
    placeholders: dict[str, str] = {}
    for i, term in enumerate(("mondgevoel", "ondergisting", "bovengisting", "IBU")):
        token = f"__PRESERVE_{i}__"
        text = re.sub(re.escape(term), token, text, flags=re.I)
        placeholders[token] = term
    for pat, repl in TERMINOLOGY_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    for token, term in placeholders.items():
        text = text.replace(token, term)
    return text


def polish_theory(num: int, text: str) -> str:
    text = fix_artifacts(micro_format(text), num)
    if num in THEORY_OVERRIDES:
        return apply_terminology(fix_artifacts(THEORY_OVERRIDES[num], num))
    smoothed = premium_smooth_prose(text)
    return apply_terminology(fix_artifacts(smoothed, num))


def strip_reflectie_from_praktijk(praktijk: str) -> str:
    return re.sub(
        r"\n### Reflectievraag\s*\n.*",
        "",
        praktijk,
        flags=re.S,
    ).strip()


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


def peel_trailing_module(body: str) -> tuple[str, str]:
    m = MODULE_TRAILER.search(body)
    if not m:
        return body, ""
    return body[: m.start()], body[m.start() :].lstrip("\n")


def polish_lesson_body(num: int, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)

    is_exam = num == 40
    quiz_section_name = "Voorbeeldvragen" if is_exam else "Quiz"
    quiz_raw = extract_section(body, quiz_section_name)
    if not quiz_raw and not is_exam:
        quiz_raw = extract_section(body, "Quiz")

    praktijk = strip_reflectie_from_praktijk(extract_section(body, "Praktijkopdracht"))
    examen = extract_section(body, "Examenonderdelen") if is_exam else ""

    sections: dict[str, str] = {
        "Leerdoel": LEERDOELEN[num],
        "Theorie": polish_theory(num, extract_section(body, "Theorie")),
        "Wist-je-dat": apply_terminology(
            fix_artifacts(micro_format(extract_section(body, "Wist-je-dat")), num)
        ),
        "Samenvatting": apply_terminology(micro_format(extract_section(body, "Samenvatting"))),
        "Food pairing": apply_terminology(micro_format(FOOD_PAIRING[num])),
        "Pro insight": apply_terminology(micro_format(PRO_INSIGHTS[num])),
        "Praktijkopdracht": apply_terminology(micro_format(praktijk)),
        "Reflectievraag": REFLECTIEVRAGEN[num],
        "Quiz-feedback": apply_terminology(micro_format(extract_section(body, "Quiz-feedback"))),
        "Kernbegrippen (DB field)": emit_kernbegrippen(GOLD_KEY_CONCEPTS[num]),
    }

    if examen:
        sections["Examenonderdelen"] = apply_terminology(micro_format(examen))

    if quiz_raw and not is_exam:
        sections["Quiz"] = apply_terminology(patch_quiz(quiz_raw, num))
    elif quiz_raw and is_exam:
        sections["Voorbeeldvragen"] = apply_terminology(micro_format(quiz_raw))

    if sections.get("Samenvatting"):
        lines = [ln for ln in sections["Samenvatting"].splitlines() if ln.strip() not in ("-", "–")]
        sections["Samenvatting"] = "\n".join(lines)

    lines = [
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug_m.group(1) if slug_m else ''}",
        f"**Duration:** {dur_m.group(1) if dur_m else '8'} min",
        f"**Quiz questions:** {quiz_m.group(1) if quiz_m else '5'}",
        "",
        "---",
        "",
    ]

    order: list[str] = ["Leerdoel", "Theorie"]
    if is_exam:
        order.append("Examenonderdelen")
    order.extend(
        [
            "Wist-je-dat",
            "Samenvatting",
            "Food pairing",
            "Pro insight",
            "Praktijkopdracht",
            "Reflectievraag",
        ]
    )
    if is_exam:
        order.append("Voorbeeldvragen")
    else:
        order.append("Quiz")
    order.extend(["Quiz-feedback", "Kernbegrippen (DB field)"])

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec == "Wist-je-dat":
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines), trailer


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", "\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"(### Waarom dit werkt\n)\n+", r"\1\n", text)
    text = re.sub(r"([^\n])\n(### Vermijd)", r"\1\n\n\2", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 40:
        raise SystemExit("Expected 40 lessons")
    if re.search(r"contentReference|oaicite", text):
        raise SystemExit("contentReference artifacts remain")
    if re.search(r"### Reflectievraag", text):
        raise SystemExit("Reflectievraag still inside Praktijkopdracht")
    if re.search(r"Welke bierstijl heb jij gekozen", text):
        raise SystemExit("Weak template reflectievraag remaining")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")
    for num in range(1, 41):
        if f"## Food pairing" not in text.split(f"# LES {num} —")[1].split("# LES ")[0]:
            raise SystemExit(f"LES {num}: missing Food pairing")


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les].rstrip()
    header = re.sub(
        r"## Beer Track\s*\n### Module 1",
        "## Beer Track V2 — Gold Master\n### 40 lessen · 9 modules\n\n**Versie:** V2 Gold Master (leidende versie, locked)\n"
        "**Bron:** `BIER_MODULES.md` → `python3 scripts/polish_bier_gold_master.py`\n\n---\n\n"
        "### Module 1",
        header,
        count=1,
    )
    return header + "\n\n"


def build() -> str:
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    # lesson_parts[0] is header (already emitted)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        polished, trailer = polish_lesson_body(les_num, les_body)
        out_parts.append(les_header + polished)
        if trailer:
            out_parts.append("\n" + trailer.rstrip() + "\n\n")
        j += 3

    result = normalize_output("".join(out_parts))
    result = fix_artifacts(result)
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
