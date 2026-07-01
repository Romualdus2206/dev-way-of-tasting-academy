#!/usr/bin/env python3
"""Generate content/pipeline/BIER_FINAL_PIPELINE_CONTENT.md — Final polish op Gold Master."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from bier_gold_master_final_data import (
    FOOD_PAIRING_WAAROM as _FP1,
    GOLD_KEY_CONCEPTS as _KC1,
    PRO_INSIGHTS as _PI1,
    REFLECTIEVRAGEN as _RF1,
    TERMINOLOGY_LOCK,
    THEORY_PREMIUM as _TH1,
)
from bier_gold_master_final_data_part2 import (
    FOOD_PAIRING_WAAROM_21_40,
    GOLD_KEY_CONCEPTS_21_40,
    PRO_INSIGHTS_21_40,
    REFLECTIEVRAGEN_21_40,
    THEORY_PREMIUM_21_40,
)

THEORY_PREMIUM = {k: v for k, v in _TH1.items() if k <= 20} | THEORY_PREMIUM_21_40
PRO_INSIGHTS = {k: v for k, v in _PI1.items() if k <= 20} | PRO_INSIGHTS_21_40
FOOD_PAIRING_WAAROM = {k: v for k, v in _FP1.items() if k <= 20} | FOOD_PAIRING_WAAROM_21_40
REFLECTIEVRAGEN = {k: v for k, v in _RF1.items() if k <= 20} | REFLECTIEVRAGEN_21_40
GOLD_KEY_CONCEPTS = {k: v for k, v in _KC1.items() if k <= 20} | GOLD_KEY_CONCEPTS_21_40

SOURCE = ROOT / "content/pipeline/BIER_PIPELINE_CONTENT.md"
OUT = ROOT / "content/pipeline/BIER_FINAL_PIPELINE_CONTENT.md"

MODULE_TRAILER = re.compile(
    r"\n+# Way of Tasting Academy\s*\n## Beer Track\s*\n### Module \d+ —[^\n]+\n.*",
    re.S,
)

SECTIONS_ORDER_BASE = [
    "Leerdoel",
    "Theorie",
    "Wist-je-dat",
    "Samenvatting",
    "Food pairing",
    "Pro insight",
    "Praktijkopdracht",
    "Reflectievraag",
]


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


def apply_terminology_lock(text: str) -> str:
    if not text:
        return ""
    placeholders: dict[str, str] = {}
    preserve = (
        "Ondergisting",
        "Bovengisting",
        "Mondgevoel",
        "IBU",
        "NEIPA",
        "IPA",
        "ITA",
        "CO2",
    )
    for i, term in enumerate(preserve):
        token = f"__LOCK_{i}__"
        text = re.sub(re.escape(term), token, text, flags=re.I)
        placeholders[token] = term
    for pat, repl in TERMINOLOGY_LOCK:
        text = re.sub(pat, repl, text)
    for token, term in placeholders.items():
        text = text.replace(token, term)
    return text


def polish_food_pairing_waarom(text: str, lesson_num: int) -> str:
    override = FOOD_PAIRING_WAAROM.get(lesson_num)
    if not override:
        return apply_terminology_lock(micro_format(text))
    m = re.search(r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if not m:
        return apply_terminology_lock(micro_format(text))
    new_waarom = apply_terminology_lock(micro_format(override))
    return text[: m.start(2)] + new_waarom + text[m.end(2) :]


def emit_kernbegrippen(terms: list[str]) -> str:
    if len(terms) != 5:
        raise ValueError(f"Expected 5 kernbegrippen, got {len(terms)}: {terms}")
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
    quiz_name = "Voorbeeldvragen" if is_exam else "Quiz"
    quiz_raw = extract_section(body, quiz_name) or extract_section(body, "Quiz")
    examen = extract_section(body, "Examenonderdelen") if is_exam else ""

    sections: dict[str, str] = {
        "Leerdoel": apply_terminology_lock(micro_format(extract_section(body, "Leerdoel"))),
        "Theorie": apply_terminology_lock(micro_format(THEORY_PREMIUM[num])),
        "Wist-je-dat": apply_terminology_lock(micro_format(extract_section(body, "Wist-je-dat"))),
        "Samenvatting": apply_terminology_lock(micro_format(extract_section(body, "Samenvatting"))),
        "Food pairing": polish_food_pairing_waarom(
            micro_format(extract_section(body, "Food pairing")), num
        ),
        "Pro insight": apply_terminology_lock(micro_format(PRO_INSIGHTS[num])),
        "Praktijkopdracht": apply_terminology_lock(
            micro_format(extract_section(body, "Praktijkopdracht"))
        ),
        "Reflectievraag": REFLECTIEVRAGEN[num],
        "Quiz-feedback": apply_terminology_lock(micro_format(extract_section(body, "Quiz-feedback"))),
        "Kernbegrippen (DB field)": emit_kernbegrippen(GOLD_KEY_CONCEPTS[num]),
    }

    if examen:
        sections["Examenonderdelen"] = apply_terminology_lock(micro_format(examen))

    if quiz_raw:
        key = "Voorbeeldvragen" if is_exam else "Quiz"
        sections[key] = apply_terminology_lock(micro_format(quiz_raw))

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
    order.extend(SECTIONS_ORDER_BASE[2:])
    order.append("Voorbeeldvragen" if is_exam else "Quiz")
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
    if re.search(r"contentReference|oaicite|repair|TODO|FIXME", text, re.I):
        raise SystemExit("Artifacts or repair markers remain")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")
    for num in range(1, 41):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        kc = re.findall(r"^## Kernbegrippen.*?\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if kc:
            bullets = [ln for ln in kc[0].splitlines() if ln.strip().startswith("-")]
            if len(bullets) != 5:
                raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(bullets)}")


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les].rstrip()
    # Strip oude versie/bronregels; behoud module-intro
    header = re.sub(
        r"## Beer Track V2 — Gold Master\n### 40 lessen · 9 modules\n\n\*\*Versie:\*\*[^\n]+\n\*\*Bron:\*\*[^\n]+\n\n---\n\n",
        "",
        header,
    )
    header = re.sub(
        r"^# Way of Tasting Academy\n",
        (
            "# Way of Tasting Academy\n"
            "## Beer Track V2 — Gold Master Final\n"
            "### 40 lessen · 9 modules · unieke slugs\n\n"
            "**Versie:** V2 Gold Master Final (leidende versie, locked)\n"
            "**Bron:** `BIER_TRACK_V2_GOLD_MASTER.md` → "
            "`python3 scripts/polish_bier_gold_master_final.py`\n\n"
            "---\n\n"
        ),
        header,
        count=1,
    )
    return header.rstrip() + "\n\n"


def build() -> str:
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
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
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
