#!/usr/bin/env python3
"""Generate content/BIER_0_0_FINAL_CONTENT.md — final harmonization pass."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from bier_0_0_gold_master_locked_data import (  # noqa: E402
    FOOD_PAIRING,
    FOOD_PAIRING_WAAROM,
    GISTING_TERMS,
    GOLD_KEY_CONCEPTS,
    PRO_INSIGHTS,
    QUIZ_FEEDBACK,
    THEORY_OVERRIDES,
    TYPO_REPLACEMENTS,
    merge_locked_part2,
)
from bier_0_0_gold_master_data import QUIZ_COUNT_OVERRIDES  # noqa: E402
from polish_port_track_v2_perfect import premium_smooth_prose  # noqa: E402

SOURCE = ROOT / "content/pipeline/BIER_0_0_PIPELINE_CONTENT.md"
OUT = ROOT / "content/BIER_0_0_FINAL_CONTENT.md"

MODULE_INSERT_AT = {6, 11, 16, 21, 26, 31, 36, 41}


def is_theory_exam(num: int) -> bool:
    return num == 44


def needs_premium_sections(num: int) -> bool:
    return 1 <= num <= 43


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


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
    return normalize_gisting_terms(apply_typos(micro_format(text)))


def fix_theory_format(text: str) -> str:
    text = micro_format(text)
    merges = [
        (r"(reverse osmosis)\s+Bij", r"\1\n\nBij"),
        (r"(herstel)\s+Het", r"\1\n\nHet"),
        (r"(frisheid)\s+Maar", r"\1\n\nMaar"),
        (r"(schuim)\s+Je ruikt", r"\1\n\nJe ruikt"),
        (r"(kruiden)\s+Je proeft", r"\1\n\nJe proeft"),
        (r"(balans)\s+Dit vormt", r"\1\n\nDit vormt"),
        (r"(lengte)\s+Bij 0\.0", r"\1\n\nBij 0.0"),
        (r"(technieken zijn:)\s*\n\n", r"\1\n"),
    ]
    for pat, repl in merges:
        text = re.sub(pat, repl, text)
    text = re.sub(r"^(- .+)\n\n(?=- )", r"\1\n", text, flags=re.M)
    blocks = re.split(r"\n\n", text)
    out: list[str] = []
    for block in blocks:
        lines = [ln.strip() for ln in block.splitlines() if ln.strip()]
        if all(ln.startswith("- ") for ln in lines) and len(lines) > 1:
            out.append("\n".join(lines))
        elif lines:
            if len(lines) == 1:
                out.append(lines[0])
            else:
                bullet_lines = [ln for ln in lines if ln.startswith("- ")]
                if bullet_lines and len(bullet_lines) == len(lines):
                    out.append("\n".join(lines))
                else:
                    out.append(" ".join(lines))
    return polish_display_text("\n\n".join(out))


def polish_theory(num: int, text: str) -> str:
    if num in THEORY_OVERRIDES:
        return polish_display_text(THEORY_OVERRIDES[num])
    return fix_theory_format(premium_smooth_prose(text))


def patch_food_waarom(text: str, lesson_num: int) -> str:
    override = FOOD_PAIRING_WAAROM.get(lesson_num)
    if not override:
        return text
    m = re.search(r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if not m:
        return text
    return text[: m.start(2)] + polish_display_text(override) + text[m.end(2) :]


def emit_kernbegrippen(terms: list[str]) -> str:
    if len(terms) != 5:
        raise ValueError(f"Expected 5 kernbegrippen, got {len(terms)}: {terms}")
    return "\n".join(f"- {t}" for t in terms)


def polish_lesson(num: int, header: str, body: str) -> str:
    header = polish_display_text(header)
    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_count = QUIZ_COUNT_OVERRIDES.get(
        num,
        int(re.search(r"\*\*Quiz questions:\*\* (\d+)", meta).group(1))
        if re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
        else 5,
    )

    sections: dict[str, str] = {}

    for sec in ("Leerdoel", "Wist-je-dat", "Samenvatting", "Praktijkopdracht", "Reflectievraag", "Quiz", "Quiz-feedback"):
        raw = extract_section(body, sec)
        if raw:
            if sec == "Praktijkopdracht":
                raw = re.sub(r"\n### Reflectievraag\s*\n.*", "", raw, flags=re.S).strip()
            sections[sec] = polish_display_text(raw)

    if num in QUIZ_FEEDBACK:
        sections["Quiz-feedback"] = polish_display_text(QUIZ_FEEDBACK[num])

    theory_raw = extract_section(body, "Theorie")
    if theory_raw:
        sections["Theorie"] = polish_theory(num, theory_raw)

    if needs_premium_sections(num):
        if num in FOOD_PAIRING:
            fp = FOOD_PAIRING[num]
        else:
            fp = extract_section(body, "Food pairing")
            if fp:
                fp = patch_food_waarom(fp, num)
        if fp:
            sections["Food pairing"] = polish_display_text(fp)

        if num in PRO_INSIGHTS:
            sections["Pro insight"] = polish_display_text(PRO_INSIGHTS[num])
        else:
            raw = extract_section(body, "Pro insight")
            if raw:
                sections["Pro insight"] = polish_display_text(raw)

    if is_theory_exam(num):
        examen = extract_section(body, "Examenonderdelen")
        if examen:
            sections["Examenonderdelen"] = polish_display_text(examen)

    if num in GOLD_KEY_CONCEPTS:
        sections["Kernbegrippen (DB field)"] = emit_kernbegrippen(GOLD_KEY_CONCEPTS[num])
    else:
        kc = extract_section(body, "Kernbegrippen (DB field)")
        if kc:
            items = [polish_display_text(ln.strip()[2:]) for ln in kc.splitlines() if ln.strip().startswith("- ")]
            if len(items) == 5:
                sections["Kernbegrippen (DB field)"] = emit_kernbegrippen(items)

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

    if is_theory_exam(num):
        order = [
            "Leerdoel", "Theorie", "Samenvatting", "Examenonderdelen",
            "Praktijkopdracht", "Reflectievraag", "Quiz-feedback", "Kernbegrippen (DB field)",
        ]
    else:
        order = [
            "Leerdoel", "Theorie", "Wist-je-dat", "Samenvatting", "Food pairing", "Pro insight",
            "Praktijkopdracht", "Reflectievraag", "Quiz", "Quiz-feedback", "Kernbegrippen (DB field)",
        ]

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec in ("Wist-je-dat", "Food pairing", "Pro insight", "Quiz"):
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines)


def polish_module_block(block: str) -> str:
    return polish_display_text(block)


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les].rstrip()
    header = re.sub(
        r"## Bier 0\.0 Track V2 — Gold Master\n",
        "## Bier 0.0 Track V2 — Gold Master Locked\n",
        header,
        count=1,
    )
    header = re.sub(
        r"\*\*Versie:\*\* V2 Gold Master \(leidende versie\)\n\*\*Bron:\*\*[^\n]+\n",
        "**Versie:** V2 Gold Master Locked (leidende versie)\n"
        "**Bron:** `BIER_0_0_TRACK_V2_GOLD_MASTER.md` → "
        "`python3 scripts/polish_bier_0_0_gold_master_locked.py`\n",
        header,
        count=1,
    )
    mod_m = re.search(r"(### Module 1 —.*)", header, re.S)
    if mod_m:
        header = header[: mod_m.start()] + polish_module_block(mod_m.group(1))
    return header.rstrip() + "\n\n"


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 45:
        raise SystemExit("Expected 45 lessons")
    if re.search(r"contentReference|repair|TODO|FIXME|Vermelding:", text, re.I):
        raise SystemExit("Artifacts remain")
    if re.search(r"\bis gezond\b|\bgezonder dan\b", text, re.I):
        raise SystemExit("Health marketing language remains")
    if re.search(r"reverse osmosis Bij|schuim Je ruikt|balans Dit vormt", text):
        raise SystemExit("Theory formatting corruption remains")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")
    for num in range(1, 44):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if "## Food pairing" not in chunk or "## Pro insight" not in chunk:
            raise SystemExit(f"LES {num}: missing Food pairing or Pro insight")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if kc:
            items = [ln for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
            if len(items) != 5:
                raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")
            generic = {"geschiedenis", "premium", "balans", "markt", "groei"}
            for item in items:
                term = item.strip()[2:].strip().lower()
                if term in generic:
                    raise SystemExit(f"LES {num}: generic kernbegrip '{term}'")


def build() -> str:
    merge_locked_part2()
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        if les_num in MODULE_INSERT_AT:
            mod_num = (les_num - 1) // 5 + 1
            mod_m = re.search(
                rf"(### Module {mod_num} —.*?)(?=\n# LES |\Z)",
                raw,
                re.S,
            )
            if mod_m:
                out_parts.append(polish_module_block(mod_m.group(1).strip()) + "\n\n")
        out_parts.append(polish_lesson(les_num, les_header, les_body))
        j += 3

    result = normalize_output("".join(out_parts))
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
