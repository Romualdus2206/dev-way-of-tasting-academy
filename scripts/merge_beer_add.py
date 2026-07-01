#!/usr/bin/env python3
"""Merge content/archive/legacy/ADD_BIER_MODULES.md quiz-feedback into content/archive/legacy/BIER_MODULES.md."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "content/archive/legacy/BIER_MODULES.md"
ADD = ROOT / "content/archive/legacy/ADD_BIER_MODULES.md"


def parse_add_feedback(text: str) -> dict[int, str]:
    """Return {lesson_num: feedback_body} from ADD file."""
    feedback: dict[int, str] = {}
    parts = re.split(r"^## LES (\d+) — ", text, flags=re.M)
    for i in range(1, len(parts), 2):
        num = int(parts[i])
        body = parts[i + 1]
        body = re.split(r"^# MODULE ", body, flags=re.M)[0]
        body = re.split(r"^## RESULTAAT", body, flags=re.M)[0]
        m = re.search(r"^## Quiz-feedback\s*\n(.*?)(?=^---|\Z)", body, flags=re.M | re.S)
        if m:
            feedback[num] = m.group(1).strip()
    return feedback


def section_block(name: str, body: str) -> str:
    return f"## {name}\n\n{body.strip()}\n\n---\n\n"


def insert_feedback_after_quiz(body: str, content: str) -> str:
    if re.search(r"^## Quiz-feedback\s*\n", body, flags=re.M):
        pattern = r"^## Quiz-feedback\s*\n.*?(?=^## |\Z)"
        block = section_block("Quiz-feedback", content)
        return re.sub(pattern, block.rstrip() + "\n\n", body, count=1, flags=re.M | re.S)

    quiz_pattern = r"(^## Quiz\s*\n.*?(?=^## |\Z))"
    m = re.search(quiz_pattern, body, flags=re.M | re.S)
    if not m:
        return body
    insert_at = m.end()
    block = section_block("Quiz-feedback", content)
    return body[:insert_at] + "\n" + block + body[insert_at:].lstrip("\n")


def merge_main() -> int:
    add_feedback = parse_add_feedback(ADD.read_text(encoding="utf-8"))
    main_text = MAIN.read_text(encoding="utf-8")

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

        if lesson_num in add_feedback:
            body = insert_feedback_after_quiz(body, add_feedback[lesson_num])
            merged += 1

        out.append(title_line)
        out.append(body.lstrip("\n") if body else "")
        i += 2

    MAIN.write_text("\n".join(out).rstrip() + "\n", encoding="utf-8")
    return merged


if __name__ == "__main__":
    n = merge_main()
    print(f"Merged quiz-feedback into {MAIN.name} ({n} lessons patched)")
