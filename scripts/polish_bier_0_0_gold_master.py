#!/usr/bin/env python3
"""Generate content/pipeline/BIER_0_0_PIPELINE_CONTENT.md — Gold Master discipline pass."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from bier_0_0_gold_master_data import (  # noqa: E402
    EXAMENONDERDELEN,
    FOOD_PAIRING,
    GOLD_KEY_CONCEPTS,
    LEERDOELEN,
    MODULE_GOALS,
    MODULE_KERNBEGRIPPEN,
    MODULE_META,
    PRO_INSIGHTS,
    QUIZ_COUNT_OVERRIDES,
    QUIZ_FEEDBACK,
    QUIZ_FULL,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN,
    SUMMARIES,
    TERMINOLOGY_REPLACEMENTS,
    THEORY_OVERRIDES,
    THEORY_MENTIONS,
    fix_artifacts,
    merge_part2,
)
from polish_port_track_v2_perfect import premium_smooth_prose  # noqa: E402

SOURCE = ROOT / "content/archive/legacy/BIER_0_0_MODULES.md"
OUT = ROOT / "content/pipeline/BIER_0_0_PIPELINE_CONTENT.md"

MODULE_INSERT_AT = {6, 11, 16, 21, 26, 31, 36, 41}

MODULE_TRAILER = re.compile(
    r"\n+# ZERO_MODULE_\d+\.md\s*\n# Way of Tasting Academy\s*\n(### Module \d+ —[^\n]+\n.*)",
    re.S,
)
MODULE_TRAILER_ALT = re.compile(
    r"\n+# Way of Tasting Academy\s*\n## Bier 0\.0 Track\s*\n(### Module \d+ —[^\n]+\n.*)",
    re.S,
)


def lesson_module(num: int) -> int:
    return (num - 1) // 5 + 1


def needs_food_pairing(num: int) -> bool:
    return 16 <= num <= 43


def needs_pro_insight(num: int) -> bool:
    return 16 <= num <= 43


def is_theory_exam(num: int) -> bool:
    return num == 44


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
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def apply_terminology(text: str) -> str:
    if not text:
        return ""
    for pat, repl in TERMINOLOGY_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    return text


def compact_explorer_theory(text: str) -> str:
    text = micro_format(text)
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    out: list[str] = []
    for ln in lines:
        if ln.startswith("- "):
            out.append(ln)
        elif out and not out[-1].endswith((".", ":", "?", "!")):
            out[-1] = f"{out[-1]} {ln}"
        else:
            out.append(ln)
    merged = "\n\n".join(out)
    if len(merged) > 1200:
        parts = merged.split("\n\n")
        merged = "\n\n".join(parts[:6])
    return merged


def polish_theory(num: int, text: str) -> str:
    text = fix_artifacts(micro_format(text), num)
    if num in THEORY_OVERRIDES:
        theory = THEORY_OVERRIDES[num]
    elif lesson_module(num) <= 3:
        theory = compact_explorer_theory(text)
    else:
        theory = premium_smooth_prose(text)
    if num in THEORY_MENTIONS:
        theory = f"{theory.rstrip()}\n\n{THEORY_MENTIONS[num]}".strip()
    return apply_terminology(fix_artifacts(theory, num))


def strip_reflectie_from_praktijk(praktijk: str) -> str:
    return re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()


def patch_quiz(text: str, lesson_num: int) -> str:
    if lesson_num in QUIZ_FULL:
        return micro_format(QUIZ_FULL[lesson_num])
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


def emit_summary(lines: list[str]) -> str:
    return "\n".join(f"- {ln}" for ln in lines)


def emit_kernbegrippen(terms: list[str]) -> str:
    if len(terms) != 5:
        raise ValueError(f"Expected 5 kernbegrippen, got {len(terms)}: {terms}")
    return "\n".join(f"- {t}" for t in terms)


def peel_trailing_module(body: str) -> tuple[str, str]:
    for pat in (MODULE_TRAILER, MODULE_TRAILER_ALT):
        m = pat.search(body)
        if m:
            return body[: m.start()], m.group(1)
    return body, ""


def polish_module_block(module_num: int) -> str:
    meta = MODULE_META[module_num]
    title = meta["title"]
    goal = MODULE_GOALS[module_num]
    kc = MODULE_KERNBEGRIPPEN[module_num]
    lines = [
        f"### Module {module_num} — {title}",
        "",
        f"**Level:** {meta['level']}",
        f"**Framework pillar:** {meta['pillar']}",
        f"**Module goal:** {apply_terminology(micro_format(goal))}",
        "",
        "---",
        "",
        "## Module kernbegrippen (DB field)",
        "",
    ]
    lines.extend(f"- {t}" for t in kc)
    lines.extend(["", "---", ""])
    return "\n".join(lines)


def polish_lesson_body(num: int, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    quiz_count = QUIZ_COUNT_OVERRIDES.get(
        num,
        int(quiz_m.group(1)) if quiz_m and quiz_m.group(1).isdigit() else 5,
    )

    praktijk = strip_reflectie_from_praktijk(
        fix_artifacts(micro_format(extract_section(body, "Praktijkopdracht")), num)
    )
    quiz_raw = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")

    sections: dict[str, str] = {
        "Leerdoel": apply_terminology(micro_format(LEERDOELEN[num])),
        "Theorie": polish_theory(num, extract_section(body, "Theorie")),
        "Samenvatting": emit_summary(SUMMARIES[num]),
        "Praktijkopdracht": apply_terminology(micro_format(praktijk)),
        "Reflectievraag": REFLECTIEVRAGEN[num],
        "Quiz-feedback": apply_terminology(
            micro_format(
                QUIZ_FEEDBACK.get(
                    num,
                    fix_artifacts(
                        extract_section(body, "Quiz-feedback").replace("---", "").strip(),
                        num,
                    ),
                )
            )
        ),
        "Kernbegrippen (DB field)": emit_kernbegrippen(GOLD_KEY_CONCEPTS[num]),
    }

    wist = fix_artifacts(micro_format(extract_section(body, "Wist-je-dat")), num)
    if wist and not is_theory_exam(num):
        sections["Wist-je-dat"] = apply_terminology(wist)

    if needs_food_pairing(num):
        sections["Food pairing"] = apply_terminology(micro_format(FOOD_PAIRING[num]))
        sections["Pro insight"] = apply_terminology(micro_format(PRO_INSIGHTS[num]))

    if is_theory_exam(num):
        sections["Examenonderdelen"] = apply_terminology(micro_format(EXAMENONDERDELEN[num]))

    if quiz_count > 0 and (quiz_raw or num in QUIZ_FULL):
        sections["Quiz"] = apply_terminology(patch_quiz(quiz_raw or "", num))

    lines = [
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
            "Leerdoel",
            "Theorie",
            "Samenvatting",
            "Examenonderdelen",
            "Praktijkopdracht",
            "Reflectievraag",
            "Quiz-feedback",
            "Kernbegrippen (DB field)",
        ]
    else:
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

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec in ("Wist-je-dat", "Food pairing", "Pro insight", "Quiz"):
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines), trailer


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les]
    header = re.sub(r"^# ZERO_MODULE_\d+\.md\s*\n", "", header)
    header = re.sub(
        r"# Way of Tasting Academy\s*\n## Bier 0\.0 Track\s*\n### Module 1",
        "# Way of Tasting Academy\n"
        "## Bier 0.0 Track V2 — Gold Master\n"
        "### 45 lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master (leidende versie)\n"
        "**Bron:** `BIER_0_0_MODULES.md` → `python3 scripts/polish_bier_0_0_gold_master.py`\n\n"
        "---\n\n"
        "### Module 1",
        header,
        count=1,
    )
    mod_m = re.search(r"(### Module 1 —.*)", header, re.S)
    if mod_m:
        header = header[: mod_m.start()] + polish_module_block(1)
    return header.rstrip() + "\n\n"


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"# ZERO_MODULE_\d+\.md\s*\n", "", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 45:
        raise SystemExit("Expected 45 lessons")
    if re.search(r"contentReference|oaicite|TODO|FIXME|repair|ZERO_MODULE", text, re.I):
        raise SystemExit("Artifacts remain")
    if re.search(r"^### Reflectievraag", text, re.M):
        raise SystemExit("Reflectievraag still inside Praktijkopdracht")
    if re.search(r"\bis gezond\b|\bgezonder dan\b", text, re.I):
        raise SystemExit("Health marketing language remains")
    if re.search(r"^Na deze les begrijp je\b|^Na deze les herken je\b", text, re.M):
        raise SystemExit("Niet-normatief leerdoel format remains")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")
    for num in range(1, 46):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if needs_food_pairing(num):
            if "## Food pairing" not in chunk:
                raise SystemExit(f"LES {num}: missing Food pairing")
            if "## Pro insight" not in chunk:
                raise SystemExit(f"LES {num}: missing Pro insight")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if kc:
            items = [ln for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
            if len(items) != 5:
                raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")
        if num == 15:
            qs = len(re.findall(r"^### Vraag \d+", chunk, re.M))
            if qs != 10:
                raise SystemExit(f"LES 15: expected 10 quiz questions, got {qs}")
        if num == 44:
            if re.search(r"^## Quiz\s*$", chunk, re.M):
                raise SystemExit("LES 44: exam should not have Quiz section")
        elif num != 44:
            qs = len(re.findall(r"^### Vraag \d+", chunk, re.M))
            meta = re.search(r"\*\*Quiz questions:\*\* (\d+)", chunk)
            expected = int(meta.group(1)) if meta else 5
            if expected > 0 and qs != expected:
                raise SystemExit(f"LES {num}: expected {expected} quiz questions, got {qs}")


def build() -> str:
    merge_part2()
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        if les_num in MODULE_INSERT_AT:
            out_parts.append(polish_module_block(lesson_module(les_num)) + "\n")
        polished, trailer = polish_lesson_body(les_num, les_body)
        out_parts.append(les_header + polished)
        if trailer:
            out_parts.append("\n" + polish_module_block(lesson_module(les_num)) + "\n")
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
