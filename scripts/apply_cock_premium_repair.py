#!/usr/bin/env python3
"""Merge COCK premium repair data into content/archive/legacy/COCK_MODULES.md and rebuild seed."""

from __future__ import annotations

import importlib.util
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MODULES_PATH = ROOT / "content/archive/legacy/COCK_MODULES.md"

CONTENT_SECTIONS = (
    "Leerdoel",
    "Theorie",
    "Wist-je-dat",
    "Samenvatting",
    "Praktijkopdracht",
)

SECTION_INSERT_ANCHORS: dict[str, list[str]] = {
    "Leerdoel": ["Metadata"],
    "Theorie": ["Leerdoel"],
    "Wist-je-dat": ["Theorie"],
    "Samenvatting": ["Wist-je-dat", "Theorie"],
    "Praktijkopdracht": ["Samenvatting", "Wist-je-dat", "Theorie", "Leerdoel"],
}

KC_STOP = r"(?=\n\n(?:---|# )|\Z)"


def load_merge_helpers():
    spec = importlib.util.spec_from_file_location(
        "merge_academy_add", ROOT / "scripts/merge_academy_add.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_repairs() -> dict[str, dict]:
    repairs: dict[str, dict] = {}
    for name, attr in (
        ("cock_repair_m1_3", "REPAIRS_M1_3"),
        ("cock_repair_m4_6", "REPAIRS_M4_6"),
        ("cock_repair_m7_9", "REPAIRS_M7_9"),
    ):
        path = ROOT / "scripts" / f"{name}.py"
        if not path.exists():
            raise SystemExit(f"Missing repair data: {path}")
        spec = importlib.util.spec_from_file_location(name, path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        repairs.update(getattr(mod, attr))
    return repairs


def format_key_concepts(terms: list[str]) -> str:
    return "\n".join(f"- {t}" for t in terms)


def replace_key_concepts(body: str, terms: list[str]) -> str:
    block = "## Kernbegrippen (DB field)\n\n" + format_key_concepts(terms) + "\n"
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
    return {
        "Leerdoel": entry["leerdoel"].strip(),
        "Theorie": entry["theorie"].strip(),
        "Wist-je-dat": entry["wist_je_dat"].strip(),
        "Samenvatting": entry["samenvatting"].strip(),
        "Praktijkopdracht": entry["praktijk"].strip(),
        "_key_concepts": entry["key_concepts"],
    }


def apply_repair_to_lesson(body: str, repair: dict[str, str], helpers) -> str:
    core, tail = helpers.split_body_tail(body)

    for section in CONTENT_SECTIONS:
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

    return core + tail


def validate_repairs(repairs: dict[str, dict]) -> None:
    errors: list[str] = []
    for slug, entry in repairs.items():
        theory = entry["theorie"]
        for term in entry["key_concepts"]:
            escaped = re.escape(term.strip())
            if not re.search(rf"(?<![\wÀ-ÿ-])({escaped})(?![\wÀ-ÿ-])", theory, re.I | re.U):
                errors.append(f"{slug}: '{term}' niet in theorie")
    if errors:
        print("Validatiefouten:")
        for err in errors:
            print(f"  - {err}")
        raise SystemExit(1)


def main() -> int:
    helpers = load_merge_helpers()
    repairs = load_repairs()
    if len(repairs) != 41:
        raise SystemExit(f"Expected 41 repair entries, found {len(repairs)}")

    validate_repairs(repairs)

    text = MODULES_PATH.read_text(encoding="utf-8")
    header, lessons = helpers.split_lessons(text)
    merged = 0
    new_lessons: list[tuple[str, str]] = []

    for title, body in lessons:
        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", body)
        if not slug_m:
            new_lessons.append((title, body))
            continue
        slug = slug_m.group(1)
        if slug not in repairs:
            new_lessons.append((title, body))
            continue
        sections = repair_to_sections(repairs[slug])
        new_body = apply_repair_to_lesson(body, sections, helpers)
        new_lessons.append((title, new_body))
        merged += 1

    MODULES_PATH.write_text(helpers.join_lessons(header, new_lessons), encoding="utf-8")
    # Checklist-stijl: plain bullets (BIO-parity), geen markdown checkboxes
    md = MODULES_PATH.read_text(encoding="utf-8")
    md = re.sub(r"^- \[ \] ", "- ", md, flags=re.M)
    MODULES_PATH.write_text(md, encoding="utf-8")
    print(f"Merged {merged} lessons into {MODULES_PATH.name}")

    align = ROOT / "scripts/align_cock_key_concepts.py"
    if align.exists():
        subprocess.run([sys.executable, str(align), "--check"], cwd=ROOT, check=True)

    rebuild = ROOT / "scripts/rebuild_cocktails_track.py"
    subprocess.run([sys.executable, str(rebuild)], cwd=ROOT, check=True)
    print("Rebuilt supabase/seed/academy_cocktails.sql")

    audit = ROOT / "scripts/audit_academy_gaps.py"
    if audit.exists():
        subprocess.run([sys.executable, str(audit)], cwd=ROOT, check=True)

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
