#!/usr/bin/env python3
"""Merge content/archive/legacy/ADD_BIER_0_0_MODULES.md repairs into content/archive/legacy/BIER_0_0_MODULES.md."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "content/archive/legacy/BIER_0_0_MODULES.md"
ADD = ROOT / "content/archive/legacy/ADD_BIER_0_0_MODULES.md"

SECTION_NAMES = ("Praktijkopdracht", "Quiz", "Quiz-feedback")


def parse_add_blocks(text: str) -> dict[int, dict[str, str]]:
    blocks: dict[int, dict[str, str]] = {}
    parts = re.split(r"^# (ZERO-\d+) — ", text, flags=re.M)
    for i in range(1, len(parts), 2):
        num = int(parts[i].split("-")[1])
        body = parts[i + 1]
        body = re.split(r"^# Expected audit improvement", body, flags=re.M)[0]
        body = re.split(r"^# ZERO_MODULE_\d+_REPAIR", body, flags=re.M)[0]
        body = re.split(r"^# FULL TRACK RESULT", body, flags=re.M)[0]

        sections: dict[str, str] = {}
        for m in re.finditer(r"^## ([^\n]+)\s*\n(.*?)(?=^## |\Z)", body, flags=re.M | re.S):
            name = m.group(1).strip()
            if name.startswith("Quiz") and name != "Quiz-feedback":
                name = "Quiz"
            if name in SECTION_NAMES:
                sections[name] = m.group(2).strip()
        if sections:
            blocks[num] = sections
    return blocks


def section_block(name: str, body: str) -> str:
    return f"## {name}\n\n{body.strip()}\n\n---\n\n"


def replace_section(body: str, name: str, new_content: str) -> str:
    pattern = rf"^## {re.escape(name)}\s*\n.*?(?=^## |\Z)"
    block = section_block(name, new_content)
    if re.search(pattern, body, flags=re.M | re.S):
        return re.sub(pattern, block.rstrip() + "\n\n", body, count=1, flags=re.M | re.S)
    return body


def insert_after_section(body: str, after: str, name: str, content: str) -> str:
    if re.search(rf"^## {re.escape(name)}\s*\n", body, flags=re.M):
        return body
    pattern = rf"(^## {re.escape(after)}\s*\n.*?(?=^## |\Z))"
    block = section_block(name, content)
    m = re.search(pattern, body, flags=re.M | re.S)
    if not m:
        return body
    insert_at = m.end()
    return body[:insert_at] + "\n" + block + body[insert_at:].lstrip("\n")


def patch_metadata_block(body: str, lesson_num: int, has_quiz: bool) -> str:
    def repl(m: re.Match[str]) -> str:
        block = m.group(0)
        if lesson_num == 44:
            block = re.sub(
                r"\*\*Quiz questions:\*\*.*",
                "**Quiz questions:** 0 (open examen)",
                block,
            )
        elif lesson_num == 45 and has_quiz:
            block = re.sub(r"\*\*Quiz questions:\*\*\s*\d+", "**Quiz questions:** 5", block)
        return block

    if re.search(r"^## Metadata\s*\n", body, flags=re.M):
        return re.sub(r"^## Metadata\s*\n.*?(?=\n---|\n## |\Z)", repl, body, count=1, flags=re.M | re.S)

    # Bare slug lines after title (repair legacy corruption)
    def bare_repl(m: re.Match[str]) -> str:
        meta = m.group(0)
        if lesson_num == 44:
            meta = re.sub(
                r"\*\*Quiz questions:\*\*.*",
                "**Quiz questions:** 0 (open examen)",
                meta,
            )
        elif lesson_num == 45 and has_quiz:
            meta = re.sub(r"\*\*Quiz questions:\*\*\s*\d+", "**Quiz questions:** 5", meta)
        return "## Metadata\n\n" + meta

    return re.sub(
        r"^\*\*Slug:\*\*.*?(?=\n---|\n## |\Z)",
        bare_repl,
        body,
        count=1,
        flags=re.M | re.S,
    )


def apply_add_to_lesson(body: str, lesson_num: int, add: dict[str, str]) -> str:
    out = body

    if "Praktijkopdracht" in add:
        out = replace_section(out, "Praktijkopdracht", add["Praktijkopdracht"])
        if not re.search(r"^## Praktijkopdracht\s*\n", out, flags=re.M):
            out = insert_after_section(out, "Samenvatting", "Praktijkopdracht", add["Praktijkopdracht"])

    if "Quiz" in add:
        out = replace_section(out, "Quiz", add["Quiz"])
        if not re.search(r"^## Quiz\s*\n", out, flags=re.M):
            anchor = "Praktijkopdracht" if re.search(r"^## Praktijkopdracht\s*\n", out, flags=re.M) else "Samenvatting"
            out = insert_after_section(out, anchor, "Quiz", add["Quiz"])

    if "Quiz-feedback" in add:
        out = replace_section(out, "Quiz-feedback", add["Quiz-feedback"])
        if not re.search(r"^## Quiz-feedback\s*\n", out, flags=re.M):
            anchor = "Quiz" if re.search(r"^## Quiz\s*\n", out, flags=re.M) else "Praktijkopdracht"
            out = insert_after_section(out, anchor, "Quiz-feedback", add["Quiz-feedback"])

    has_quiz = bool(re.search(r"^## Quiz\s*\n", out, flags=re.M))
    out = patch_metadata_block(out, lesson_num, has_quiz)
    return out


def repair_structure(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", "\n---\n", text)
    text = re.sub(
        r"(^# LES \d+ — [^\n]+\n)(\*\*Slug:\*\*)",
        r"\1## Metadata\n\n\2",
        text,
        flags=re.M,
    )
    return text


def merge_main() -> int:
    add_blocks = parse_add_blocks(ADD.read_text(encoding="utf-8"))
    main_text = repair_structure(MAIN.read_text(encoding="utf-8"))

    parts = re.split(r"(^# LES \d+ — .+$)", main_text, flags=re.M)
    out = [parts[0].rstrip()]
    if out[0]:
        out.append("")

    merged = 0
    i = 1
    while i < len(parts):
        title_line = parts[i]
        body = parts[i + 1] if i + 1 < len(parts) else ""
        num_m = re.match(r"# LES (\d+)", title_line)
        lesson_num = int(num_m.group(1)) if num_m else 0

        if lesson_num in add_blocks:
            body = apply_add_to_lesson(body, lesson_num, add_blocks[lesson_num])
            merged += 1
        elif lesson_num in (44, 45):
            has_quiz = bool(re.search(r"^## Quiz\s*\n", body, flags=re.M))
            body = patch_metadata_block(body, lesson_num, has_quiz)

        out.append(title_line)
        out.append(body.lstrip("\n") if body else "")
        i += 2

    MAIN.write_text("\n".join(out).rstrip() + "\n", encoding="utf-8")
    return merged


if __name__ == "__main__":
    n = merge_main()
    print(f"Merged repairs into {MAIN.name} ({n} lessons patched)")
