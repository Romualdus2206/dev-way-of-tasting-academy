#!/usr/bin/env python3
"""Merge Port premium repair data into content/archive/legacy/PORT_MODULES.md and rebuild seed."""

from __future__ import annotations

import importlib.util
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MODULES_PATH = ROOT / "content/archive/legacy/PORT_MODULES.md"

CONTENT_SECTIONS = (
    "Leerdoel",
    "Theorie",
    "Wist-je-dat",
    "Samenvatting",
    "Praktijkopdracht",
)

OPTIONAL_SECTIONS = ("Food pairing", "Pro insight")

SECTION_INSERT_ANCHORS: dict[str, list[str]] = {
    "Leerdoel": ["Metadata"],
    "Theorie": ["Leerdoel"],
    "Wist-je-dat": ["Theorie"],
    "Samenvatting": ["Wist-je-dat", "Theorie"],
    "Praktijkopdracht": ["Samenvatting", "Wist-je-dat", "Theorie", "Leerdoel"],
    "Food pairing": ["Samenvatting", "Theorie"],
    "Pro insight": ["Food pairing", "Samenvatting", "Theorie"],
}

MINI_TOETS_NUM = 15
THEORY_EXAM_NUM = 40

KC_STOP = r"(?=\n\n(?:---|# )|\Z)"

VALID_LESSON_SECTIONS = frozenset(
    {
        "Metadata",
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Praktijkopdracht",
        "Food pairing",
        "Pro insight",
        "Quiz",
        "Quiz-feedback",
        "Examen-feedback",
        "Kernbegrippen (DB field)",
    }
)

PORT_MARKER_RE = re.compile(
    r"\n# (?:(?:[A-Z0-9_]+MODULE_\d+)|(?:PORT_\d+))\.md[^\n]*\n+",
    re.M,
)


def cleanup_lesson_body(body: str) -> str:
    body = PORT_MARKER_RE.sub("\n\n", body)
    parts = re.split(r"(?=^## )", body, flags=re.M)
    kept: list[str] = []
    for part in parts:
        if not part.strip():
            continue
        m = re.match(r"^## ([^\n]+)", part)
        if not m:
            kept.append(part)
            continue
        if m.group(1).strip() in VALID_LESSON_SECTIONS:
            kept.append(part)
    return "".join(kept)


def load_merge_helpers():
    spec = importlib.util.spec_from_file_location(
        "merge_academy_add", ROOT / "scripts/merge_academy_add.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_repairs_by_lesson() -> dict[int, dict]:
    repairs: dict[int, dict] = {}
    for name, attr in (
        ("port_repair_m1_3", "REPAIRS_M1_3"),
        ("port_repair_m4_6", "REPAIRS_M4_6"),
        ("port_repair_m7_9", "REPAIRS_M7_9"),
        ("port_repair_m10", "REPAIRS_M10"),
    ):
        path = ROOT / "scripts" / f"{name}.py"
        if not path.exists():
            continue
        spec = importlib.util.spec_from_file_location(name, path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        data = getattr(mod, attr, {})
        for key, entry in data.items():
            if isinstance(key, int):
                repairs[key] = entry
            elif isinstance(key, str) and key.isdigit():
                repairs[int(key)] = entry
    return repairs


def lesson_numbers(modules_text: str) -> dict[int, str]:
    out: dict[int, str] = {}
    for m in re.finditer(r"^# LES (\d+) — .+?\n(.*?)(?=^# LES \d+ —|\Z)", modules_text, re.S | re.M):
        num = int(m.group(1))
        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", m.group(2))
        if slug_m:
            out[num] = slug_m.group(1)
    return out


def slug_to_lesson_index(lessons: list[tuple[str, str]]) -> dict[int, int]:
    idx: dict[int, int] = {}
    for i, (title, _) in enumerate(lessons):
        m = re.match(r"# LES (\d+) — ", title)
        if m:
            idx[int(m.group(1))] = i
    return idx


def replace_key_concepts(body: str, terms: list[str]) -> str:
    block = "## Kernbegrippen (DB field)\n\n" + "\n".join(f"- {t}" for t in terms) + "\n"
    if re.search(r"## Kernbegrippen \(DB field\)", body):
        return re.sub(
            rf"## Kernbegrippen \(DB field\)\s*\n.*?{KC_STOP}",
            block,
            body,
            count=1,
            flags=re.S,
        )
    return body.rstrip() + "\n\n---\n\n" + block


def repair_to_sections(entry: dict) -> dict[str, str]:
    sections = {
        "Leerdoel": entry["leerdoel"].strip(),
        "Theorie": entry["theorie"].strip(),
        "Wist-je-dat": entry["wist_je_dat"].strip(),
        "Samenvatting": entry["samenvatting"].strip(),
        "Praktijkopdracht": entry["praktijk"].strip(),
        "_key_concepts": entry["key_concepts"],
    }
    if entry.get("food_pairing"):
        sections["Food pairing"] = entry["food_pairing"].strip()
    if entry.get("pro_insight"):
        sections["Pro insight"] = entry["pro_insight"].strip()
    if entry.get("quiz"):
        sections["Quiz"] = entry["quiz"].strip()
    if entry.get("quiz_feedback"):
        sections["Quiz-feedback"] = entry["quiz_feedback"].strip()
    return sections


def apply_repair_to_lesson(body: str, repair: dict[str, str], helpers, *, lesson_num: int) -> str:
    core, tail = helpers.split_body_tail(body)

    for section in CONTENT_SECTIONS + OPTIONAL_SECTIONS:
        content = repair.get(section, "")
        if not content:
            continue
        if re.search(rf"^## {re.escape(section)}\s*\n", core, re.M):
            core = helpers.replace_section(core, section, content)
        else:
            core = helpers.insert_after_any(
                core,
                SECTION_INSERT_ANCHORS.get(section, ["Theorie"]),
                section,
                content,
            )

    terms = repair.get("_key_concepts")
    if terms:
        core = replace_key_concepts(core, terms)

    skip_quiz = lesson_num in (MINI_TOETS_NUM, THEORY_EXAM_NUM)
    if not skip_quiz and repair.get("Quiz"):
        quiz = helpers.normalize_quiz(repair["Quiz"])
        if re.search(r"^## Quiz\s*\n", core, re.M):
            core = helpers.replace_section(core, "Quiz", quiz)
        else:
            core = helpers.insert_after_section(core, "Praktijkopdracht", "Quiz", quiz)

    if repair.get("Quiz-feedback"):
        core = helpers.replace_section(core, "Quiz-feedback", repair["Quiz-feedback"])
        if not re.search(r"^## Quiz-feedback\s*\n", core, re.M):
            anchor = "Quiz" if re.search(r"^## Quiz\s*\n", core, re.M) else "Praktijkopdracht"
            core = helpers.insert_after_section(core, anchor, "Quiz-feedback", repair["Quiz-feedback"])

    if skip_quiz:
        core = helpers.remove_section(core, "Quiz")

    return core + tail


def validate_repairs(repairs: dict[int, dict]) -> None:
    errors: list[str] = []
    for num, entry in repairs.items():
        theory = entry["theorie"]
        for term in entry["key_concepts"]:
            escaped = re.escape(term.strip())
            if not re.search(rf"(?<![\wÀ-ÿ-])({escaped})(?![\wÀ-ÿ-])", theory, re.I | re.U):
                errors.append(f"LES {num}: '{term}' niet in theorie")
    if errors:
        print("Validatiefouten:")
        for err in errors:
            print(f"  - {err}")
        raise SystemExit(1)


def main() -> int:
    helpers = load_merge_helpers()
    repairs = load_repairs_by_lesson()
    if len(repairs) != 40:
        raise SystemExit(f"Expected 40 repair entries, found {len(repairs)}")

    validate_repairs(repairs)

    text = MODULES_PATH.read_text(encoding="utf-8")
    header, lessons = helpers.split_lessons(text)
    lesson_idx = slug_to_lesson_index(lessons)
    merged = 0

    for num in range(1, 41):
        if num not in repairs or num not in lesson_idx:
            continue
        sections = repair_to_sections(repairs[num])
        i = lesson_idx[num]
        title, body = lessons[i]
        body = apply_repair_to_lesson(body, sections, helpers, lesson_num=num)
        lessons[i] = (title, cleanup_lesson_body(body))
        merged += 1

    header = PORT_MARKER_RE.sub("\n\n", header)

    MODULES_PATH.write_text(helpers.join_lessons(header, lessons), encoding="utf-8")
    md = MODULES_PATH.read_text(encoding="utf-8")
    md = re.sub(r"^- \[ \] ", "- ", md, flags=re.M)
    MODULES_PATH.write_text(md, encoding="utf-8")

    les_count = len(re.findall(r"^# LES \d+ — ", md, flags=re.M))
    if les_count != 40:
        raise SystemExit(f"Expected 40 lessons after merge, found {les_count}")

    print(f"Merged {merged} lessons into {MODULES_PATH.name}")

    align = ROOT / "scripts/align_port_key_concepts.py"
    if align.exists():
        subprocess.run([sys.executable, str(align), "--check"], cwd=ROOT, check=True)

    subprocess.run([sys.executable, str(ROOT / "scripts/rebuild_port_track.py")], cwd=ROOT, check=True)
    subprocess.run([sys.executable, str(ROOT / "scripts/audit_academy_gaps.py")], cwd=ROOT, check=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
