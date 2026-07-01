#!/usr/bin/env python3
"""Generate content/BIER_FINAL_CONTENT.md — micro-pass (normbestand)."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from bier_gold_master_locked_data import (  # noqa: E402
    FOOD_PAIRING_WAAROM,
    MODULE_GOALS,
    PRO_INSIGHTS,
    QUIZ_COUNT_OVERRIDES,
    SUMMARIES,
    TYPO_REPLACEMENTS,
)

SOURCE = ROOT / "content/pipeline/BIER_FINAL_PIPELINE_CONTENT.md"
OUT = ROOT / "content/BIER_FINAL_CONTENT.md"

GISTING_TERMS = ("mondgevoel", "ondergisting", "bovengisting")
MODULE_TRAILER = re.compile(
    r"\n+# Way of Tasting Academy\s*\n## Beer Track\s*\n(### Module \d+ —[^\n]+\n.*)",
    re.S,
)


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"\.{2,}", ".", text)
    text = re.sub(r"  +", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def apply_typos(text: str) -> str:
    for pat, repl in TYPO_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    return text


def is_sentence_start(text: str, pos: int) -> bool:
    prefix = text[:pos].rstrip()
    if not prefix:
        return True
    if re.search(r"[-•]\s*$", prefix):
        return True
    return bool(re.search(r'[.!?]["\']?\s*$', prefix))


def normalize_gisting_terms(text: str) -> str:
    if not text:
        return text

    def sub_fn(term: str):
        def repl(m: re.Match[str]) -> str:
            if is_sentence_start(text, m.start()) and m.group(0)[0].isupper():
                return m.group(0)
            return term

        return repl

    for term in GISTING_TERMS:
        text = re.sub(rf"\b{term}\b", sub_fn(term), text, flags=re.I)
    return text


def polish_display_text(text: str) -> str:
    text = micro_format(text)
    text = apply_typos(text)
    text = normalize_gisting_terms(text)
    return text


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def emit_summary(lines: list[str]) -> str:
    return "\n".join(f"- {ln}" for ln in lines)


def patch_food_waarom(text: str, lesson_num: int) -> str:
    override = FOOD_PAIRING_WAAROM.get(lesson_num)
    if not override:
        return text
    m = re.search(r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if not m:
        return text
    return text[: m.start(2)] + polish_display_text(override) + text[m.end(2) :]


def count_quiz_questions(body: str) -> int:
    quiz = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")
    if not quiz:
        return 0
    return len(re.findall(r"^### Vraag \d+", quiz, re.M))


def polish_kernbegrip(item: str) -> str:
    item = polish_display_text(item)
    if len(item.split()) == 1:
        for term in GISTING_TERMS:
            if item.lower() == term:
                return term
    for term in GISTING_TERMS:
        item = re.sub(rf"^{term}\b", term, item, flags=re.I)
    return item


def polish_checklist_line(line: str) -> str:
    content = line.strip()[2:]
    for term in GISTING_TERMS:
        content = re.sub(rf"^{term}\b", term, content, flags=re.I)
    return f"- {content}"


def polish_lesson(num: int, header: str, body: str) -> str:
    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    is_exam = num == 40
    quiz_name = "Voorbeeldvragen" if is_exam else "Quiz"

    quiz_count = QUIZ_COUNT_OVERRIDES.get(num, count_quiz_questions(body))

    sections: dict[str, str] = {}
    for sec in (
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Praktijkopdracht",
        "Reflectievraag",
        "Quiz-feedback",
    ):
        raw = extract_section(body, sec)
        if raw:
            if sec == "Praktijkopdracht":
                raw = "\n".join(
                    polish_checklist_line(ln) if ln.strip().startswith("- ") else ln
                    for ln in raw.splitlines()
                )
            sections[sec] = polish_display_text(raw)

    if num in SUMMARIES:
        sections["Samenvatting"] = emit_summary(SUMMARIES[num])
    else:
        raw = extract_section(body, "Samenvatting")
        if raw:
            sections["Samenvatting"] = polish_display_text(raw)

    fp = extract_section(body, "Food pairing")
    if fp:
        patched = patch_food_waarom(fp, num)
        patched = re.sub(r"\n(### Vermijd)", r"\n\n\1", patched)
        sections["Food pairing"] = polish_display_text(patched)

    if num in PRO_INSIGHTS:
        sections["Pro insight"] = polish_display_text(PRO_INSIGHTS[num])
    else:
        raw = extract_section(body, "Pro insight")
        if raw:
            sections["Pro insight"] = polish_display_text(raw)

    if is_exam:
        examen = extract_section(body, "Examenonderdelen")
        if examen:
            sections["Examenonderdelen"] = polish_display_text(examen)

    quiz_raw = extract_section(body, quiz_name)
    if quiz_raw:
        sections[quiz_name] = polish_display_text(quiz_raw)

    kc = extract_section(body, "Kernbegrippen (DB field)")
    if kc:
        kc_lines = []
        for ln in kc.splitlines():
            ln = ln.strip()
            if ln.startswith("- "):
                kc_lines.append(f"- {polish_kernbegrip(ln[2:])}")
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

    order: list[str] = ["Leerdoel", "Theorie"]
    if is_exam:
        order.append("Examenonderdelen")
    order.extend(
        ["Wist-je-dat", "Samenvatting", "Food pairing", "Pro insight", "Praktijkopdracht", "Reflectievraag"]
    )
    order.append(quiz_name)
    order.extend(["Quiz-feedback", "Kernbegrippen (DB field)"])

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec == "Wist-je-dat":
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines)


def polish_module_block(module_num: int, block: str) -> str:
    m = re.search(r"### Module (\d+) — ([^\n]+)", block)
    if not m:
        return block
    num = int(m.group(1))
    title = m.group(2).strip()
    goal = MODULE_GOALS.get(num, "")
    if not goal:
        goal_m = re.search(r"\*\*Module goal:\*\* (.+)", block)
        goal = goal_m.group(1).strip() if goal_m else ""

    level_m = re.search(r"\*\*Level:\*\* ([^\n]+)", block)
    pillar_m = re.search(r"\*\*Framework pillar:\*\* ([^\n]+)", block)
    kc_m = re.search(r"(## Module kernbegrippen \(DB field\)\s*\n.*?)(?=\n# LES |\Z)", block, re.S)

    lines = [
        f"### Module {num} — {title}",
        "",
        f"**Level:** {level_m.group(1).strip() if level_m else 'Explorer'}",
        f"**Framework pillar:** {pillar_m.group(1).strip() if pillar_m else ''}",
        f"**Module goal:** {polish_display_text(goal)}",
        "",
        "---",
        "",
    ]
    if kc_m:
        kc_block = kc_m.group(1).strip()
        kc_lines = []
        for ln in kc_block.splitlines():
            if ln.startswith("- "):
                kc_lines.append(f"- {polish_display_text(ln[2:])}")
            else:
                kc_lines.append(ln)
        lines.append("\n".join(kc_lines))
        lines.append("")
    return "\n".join(lines)


def peel_trailing_module(body: str) -> tuple[str, str]:
    m = MODULE_TRAILER.search(body)
    if not m:
        return body, ""
    return body[: m.start()], m.group(1)


def build_header_from_raw(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les].rstrip()
    header = re.sub(
        r"## Beer Track V2 — Gold Master Final\n",
        "## Beer Track V2 — Gold Master Locked\n",
        header,
        count=1,
    )
    header = re.sub(
        r"\*\*Versie:\*\* V2 Gold Master Final[^\n]*\n\*\*Bron:\*\*[^\n]+\n",
        "**Versie:** V2 Gold Master Locked (leidende versie)\n"
        "**Bron:** `BIER_TRACK_V2_GOLD_MASTER_FINAL.md` → "
        "`python3 scripts/polish_bier_gold_master_locked.py`\n",
        header,
        count=1,
    )
    mod_m = re.search(r"(### Module 1 —.*)", header, re.S)
    if mod_m:
        polished_mod = polish_module_block(1, mod_m.group(1))
        header = header[: mod_m.start()] + polished_mod
    return header.rstrip() + "\n\n"


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 40:
        raise SystemExit("Expected 40 lessons")

    def mid_sentence_caps(line: str, term: str) -> bool:
        for m in re.finditer(rf"\b{term}\b", line, re.I):
            if m.group(0)[0].isupper() and not is_sentence_start(line, m.start()):
                return True
        return False

    for line in text.splitlines():
        if line.startswith("# LES "):
            continue
        for term in ("mondgevoel", "ondergisting", "bovengisting"):
            if mid_sentence_caps(line, term.capitalize()):
                raise SystemExit(f"Mid-sentence {term} capitalization: {line[:80]}")

    if re.search(r"contentReference|repair|TODO|FIXME", text, re.I):
        raise SystemExit("Artifacts remain")
    if re.search(r"\bbeinvloedt\b|\bcategorieen\b", text, re.I):
        raise SystemExit("Typo patterns remain")
    if re.search(r"vITAliteit|ITAlië", text):
        raise SystemExit("ITA substring corruption remains")
    if "**Quiz questions:** 10" in text:
        raise SystemExit("LES 15 quiz metadata not fixed")
    if "**Quiz questions:** 20" in text:
        raise SystemExit("LES 40 quiz metadata not fixed")


def build() -> str:
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header_from_raw(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        peeled, trailer = peel_trailing_module(les_body)
        out_parts.append(polish_lesson(les_num, les_header, peeled))
        if trailer:
            mod_num = int(re.search(r"### Module (\d+)", trailer).group(1))
            out_parts.append("\n" + polish_module_block(mod_num, trailer) + "\n")
        j += 3

    result = normalize_output("".join(out_parts))
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
