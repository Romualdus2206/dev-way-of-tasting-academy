#!/usr/bin/env python3
"""Merge content/archive/repair/COCK_ADD_REPAIR_CONTENT.md into content/archive/legacy/COCK_MODULES.md."""

from __future__ import annotations

import importlib.util
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADD_PATH = ROOT / "content/archive/repair/COCK_ADD_REPAIR_CONTENT.md"
MODULES_PATH = ROOT / "content/archive/legacy/COCK_MODULES.md"

MINI_TOETS_SLUG = "mini-toets-cocktails"

# ADD lesnummer (in patch-bestand) → doel-slug(s): (slug, quiz vervangen?)
REDISTRIBUTE: dict[int, list[tuple[str, bool]]] = {
    26: [("cocktails-als-digestief", False)],  # Boulevardier
    27: [("old-fashioned", True)],  # Sazerac
    28: [("manhattan", True)],  # Vieux Carré
    29: [("cocktails-als-digestief", False)],  # Boulevardier variations
    30: [("cocktails-als-digestief", False)],  # Spirit-forward mastery
    31: [("cocktails-als-digestief", False)],  # Espresso Martini
    32: [("cocktails-als-aperitief", False)],  # Pornstar Martini
    33: [("margarita", True)],  # Tommy's Margarita
    34: [("whiskey-sour", False)],  # Penicillin — pairing/pro insight only
    35: [("negroni", False)],  # Naked & Famous
    36: [("cocktails-bij-foodpairing", True)],  # Twist bouwen
    37: [("theorie-praktijkexamen", False)],  # Eigen signature cocktail
    38: [("cocktails-als-aperitief", False)],  # Seizoenscocktails
    39: [("cocktails-als-aperitief", False), ("aperol-spritz", False)],  # Low-ABV
    40: [("cocktails-bij-foodpairing", True)],  # Pairing-first
    41: [("serveertechniek", True)],  # Service under pressure
    42: [("cocktails-als-aperitief", False)],  # Guest psychology
    43: [("spirit-blind-herkennen", True), ("cocktailstructuren-blind", False)],
    # 44 Menu engineering — bewust overgeslagen (Bar Pro v2)
    45: [("theorie-praktijkexamen", False)],  # Final practical exam
}


def load_helpers():
    spec = importlib.util.spec_from_file_location(
        "merge_academy_add", ROOT / "scripts/merge_academy_add.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def parse_add_lessons(text: str) -> dict[int, dict]:
    """Parse ADD file keyed by LES number."""
    parts = re.split(r"(^# LES (\d+) — .+$)", text, flags=re.M)
    out: dict[int, dict] = {}
    i = 1
    while i < len(parts):
        if i + 2 >= len(parts):
            break
        num = int(parts[i + 1])
        title_line = parts[i]
        body = parts[i + 2]
        title = title_line.split("—", 1)[1].strip() if "—" in title_line else ""
        out[num] = {
            "title": title,
            "food_pairing": extract_block(body, r"## TOEVOEGEN — Food Pairing"),
            "pro_insight": extract_block(body, r"## TOEVOEGEN — Pro Insight"),
            "quiz": extract_block(body, r"## QUIZ REPAIR"),
            "quiz_feedback": extract_block(body, r"## Quiz-feedback"),
        }
        i += 3
    return out


def extract_block(body: str, header: str) -> str:
    m = re.search(
        rf"{re.escape(header)}\s*\n(.*?)(?=\n## |\n# |\Z)",
        body,
        re.S,
    )
    if not m:
        return ""
    text = m.group(1).strip()
    text = re.sub(r"(?:\n---\s*)+$", "", text)
    return text.strip()


def lesson_slugs_by_number(modules_text: str) -> dict[int, str]:
    slugs: dict[int, str] = {}
    for m in re.finditer(r"^# LES (\d+) — .+?\n(.*?)(?=^# LES \d+ —|\Z)", modules_text, re.S | re.M):
        num = int(m.group(1))
        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", m.group(2))
        if slug_m:
            slugs[num] = slug_m.group(1)
    return slugs


def slug_to_lesson_index(lessons: list[tuple[str, str]]) -> dict[str, int]:
    idx: dict[str, int] = {}
    for i, (_, body) in enumerate(lessons):
        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", body)
        if slug_m:
            idx[slug_m.group(1)] = i
    return idx


def append_subsection(existing: str, add_title: str, new_content: str) -> str:
    if not new_content.strip():
        return existing
    block = f"### {add_title}\n\n{new_content.strip()}"
    if not existing.strip():
        return block
    return existing.rstrip() + "\n\n" + block + "\n"


def merge_section(body: str, section_name: str, content: str, add_title: str, helpers) -> str:
    if not content.strip():
        return body
    pattern = rf"^## {re.escape(section_name)}\s*\n"
    if re.search(pattern, body, re.M):
        m = re.search(
            rf"^## {re.escape(section_name)}\s*\n(.*?)(?=^## |\Z)",
            body,
            re.S | re.M,
        )
        existing = m.group(1).strip() if m else ""
        merged = append_subsection(existing, add_title, content)
        return helpers.replace_section(body, section_name, merged)
    return helpers.insert_after_section(body, "Samenvatting", section_name, content)


def apply_patch(
    body: str,
    patch: dict,
    *,
    add_title: str,
    include_quiz: bool,
    include_feedback: bool,
    helpers,
) -> str:
    core, tail = helpers.split_body_tail(body)

    if patch.get("food_pairing"):
        core = merge_section(core, "Food pairing", patch["food_pairing"], add_title, helpers)
    if patch.get("pro_insight"):
        core = merge_section(core, "Pro insight", patch["pro_insight"], add_title, helpers)

    if include_quiz and patch.get("quiz"):
        quiz = helpers.normalize_quiz(patch["quiz"])
        core = helpers.replace_section(core, "Quiz", quiz)
        if not re.search(r"^## Quiz\s*\n", core, re.M):
            core = helpers.insert_after_section(core, "Praktijkopdracht", "Quiz", quiz)

    if include_feedback and patch.get("quiz_feedback"):
        core = helpers.replace_section(core, "Quiz-feedback", patch["quiz_feedback"])
        if not re.search(r"^## Quiz-feedback\s*\n", core, re.M):
            anchor = "Quiz" if re.search(r"^## Quiz\s*\n", core, re.M) else "Praktijkopdracht"
            core = helpers.insert_after_section(core, anchor, "Quiz-feedback", patch["quiz_feedback"])

    return core + tail


def main() -> int:
    helpers = load_helpers()
    add_lessons = parse_add_lessons(ADD_PATH.read_text(encoding="utf-8"))
    modules_text = MODULES_PATH.read_text(encoding="utf-8")
    num_to_slug = lesson_slugs_by_number(modules_text)
    header, lessons = helpers.split_lessons(modules_text)
    slug_index = slug_to_lesson_index(lessons)

    direct_merged = 0
    redistributed = 0

    # Fase 1: direct LES 1–25
    for num in range(1, 26):
        if num not in add_lessons or num not in num_to_slug:
            continue
        slug = num_to_slug[num]
        idx = slug_index.get(slug)
        if idx is None:
            continue
        patch = add_lessons[num]
        title, body = lessons[idx]
        is_mini_toets = slug == MINI_TOETS_SLUG
        body = apply_patch(
            body,
            patch,
            add_title=patch["title"] or f"LES {num}",
            include_quiz=not is_mini_toets,
            include_feedback=True,
            helpers=helpers,
        )
        lessons[idx] = (title, body)
        direct_merged += 1

    # Fase 2: herverdeling ADD 26–45
    for add_num, targets in REDISTRIBUTE.items():
        if add_num not in add_lessons:
            continue
        patch = add_lessons[add_num]
        add_title = patch["title"] or f"ADD LES {add_num}"
        for slug, include_quiz in targets:
            idx = slug_index.get(slug)
            if idx is None:
                print(f"Warning: slug not found: {slug} (ADD {add_num})")
                continue
            title, body = lessons[idx]
            body = apply_patch(
                body,
                patch,
                add_title=add_title,
                include_quiz=include_quiz,
                include_feedback=False,
                helpers=helpers,
            )
            lessons[idx] = (title, body)
            redistributed += 1

    MODULES_PATH.write_text(helpers.join_lessons(header, lessons), encoding="utf-8")

    final_text = MODULES_PATH.read_text(encoding="utf-8")
    les_count = len(re.findall(r"^# LES \d+ — ", final_text, flags=re.M))
    if les_count != 41:
        raise SystemExit(f"Expected 41 lessons after merge, found {les_count}")

    print(f"Direct merged: {direct_merged} lessons (1–25)")
    print(f"Redistributed blocks: {redistributed}")
    print(f"Updated {MODULES_PATH.name}")

    rebuild = ROOT / "scripts/rebuild_cocktails_track.py"
    subprocess.run([sys.executable, str(rebuild)], cwd=ROOT, check=True)

    audit = ROOT / "scripts/audit_academy_gaps.py"
    if audit.exists():
        subprocess.run([sys.executable, str(audit)], cwd=ROOT, check=True)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
