#!/usr/bin/env python3
"""Rebuild supabase/seed/academy_cocktails.sql from content/COCK_MODULES.md."""

from __future__ import annotations

import importlib.util
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TRACK_SLUG = "cocktails"

MODULE_REGISTRY: dict[int, dict[str, str]] = {
    1: {"slug": "intro-cocktails", "title": "Fundament", "level": "explorer"},
    2: {"slug": "technieken-cocktails", "title": "Technieken", "level": "explorer"},
    3: {"slug": "ingredienten-cocktails", "title": "Ingrediënten", "level": "explorer"},
    4: {"slug": "klassiek-cocktails", "title": "Klassieke cocktails", "level": "specialist"},
    5: {"slug": "sour-family-cocktails", "title": "Sour Family", "level": "specialist"},
    6: {"slug": "highballs-cocktails", "title": "Highballs & Longdrinks", "level": "specialist"},
    7: {"slug": "service-cocktails", "title": "Service", "level": "master"},
    8: {"slug": "pairing-cocktails", "title": "Pairing & Gastronomie", "level": "master"},
    9: {"slug": "examen-cocktails", "title": "Blindproeven & Examen", "level": "master"},
}


def load_importer():
    spec = importlib.util.spec_from_file_location(
        "import_module_md", ROOT / "scripts/import_module_md.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def split_cock_modules(text: str) -> list[str]:
    parts = re.split(r"# COCK_MODULE_\d+\.md\s*\n", text)
    return [p.strip() for p in parts if p.strip()]


def ts_feedback_line(key: str, message: str) -> str:
    msg = message.replace("\n", " ").strip()
    msg = re.sub(r"\s*---\s*$", "", msg)
    msg = msg.replace("\\", "\\\\").replace("'", "\\'")
    return f"  '{key}': '{msg}',"


def merge_quiz_feedback(new_lines: list[str]) -> None:
    fb_path = ROOT / "web/src/lib/quizFeedback.ts"
    text = fb_path.read_text(encoding="utf-8")
    block = re.search(r"(const LESSON_FEEDBACK[^=]*=\s*\{)([\s\S]*?)(\};)", text)
    if not block:
        raise SystemExit("Could not parse quizFeedback.ts")

    existing: dict[str, str] = {}
    for m in re.finditer(r"'((?:[^'\\]|\\.)*)':\s*'((?:[^'\\]|\\.)*)'", block.group(2)):
        existing[m.group(1).replace("\\'", "'")] = m.group(2).replace("\\'", "'")

    for line in new_lines:
        m = re.match(r"\s+'((?:[^'\\]|\\.)*)':\s*'((?:[^'\\]|\\.)*)',", line)
        if m:
            existing[m.group(1).replace("\\'", "'")] = m.group(2).replace("\\'", "'")

    merged_body = "\n".join(
        ts_feedback_line(k, v) for k, v in sorted(existing.items(), key=lambda x: x[0])
    )

    fb_path.write_text(
        text[: block.start(2)] + "\n" + merged_body + "\n" + text[block.start(3) :],
        encoding="utf-8",
    )


def rebuild() -> None:
    imp = load_importer()
    source = ROOT / "content/COCK_MODULES.md"
    modules_text = split_cock_modules(source.read_text(encoding="utf-8"))
    if len(modules_text) != len(MODULE_REGISTRY):
        raise SystemExit(f"Expected {len(MODULE_REGISTRY)} modules, found {len(modules_text)}")

    all_modules: list[tuple[str, list]] = []
    lesson_count = 0
    lesson_blocks: list[str] = []
    feedback_lines: list[str] = []

    for num, part in enumerate(modules_text, 1):
        cfg = MODULE_REGISTRY[num]
        data = imp.parse_module_text(part, cfg["slug"])
        module_slug = cfg["slug"]
        lessons = data["lessons"]
        lesson_count += len(lessons)
        all_modules.append((module_slug, lessons))

        block = imp.emit_lessons_sql(lessons, module_slug, TRACK_SLUG).replace(
            f"-- Generated from module MD ({len(lessons)} lessons)\n",
            f"-- {module_slug} ({len(lessons)} lessons)\n",
        )
        lesson_blocks.append(block)

        for les in lessons:
            if les.get("quiz_feedback"):
                key = f"{module_slug}:{les['slug']}"
                feedback_lines.append(ts_feedback_line(key, les["quiz_feedback"]))

    module_rows = ",\n".join(
        f"  ('{cfg['level']}', '{cfg['slug']}', '{cfg['title'].replace(chr(39), chr(39)*2)}', {num})"
        for num, cfg in sorted(MODULE_REGISTRY.items())
    )

    header = f"""-- Cocktails track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · {len(MODULE_REGISTRY)} modules · {lesson_count} lessons · quizvragen per les

delete from academy.tracks where slug = '{TRACK_SLUG}';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  '{TRACK_SLUG}',
  'Cocktails',
  'Leer cocktails van Fundament tot Master: technieken, ingrediënten, klassiekers, service, pairing en examen.',
  9,
  now()
);

with t as (select id from academy.tracks where slug = '{TRACK_SLUG}')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
{module_rows}
) as v(level, slug, title, sort_order);

"""

    quiz_sql = imp.emit_quiz_block_sql(all_modules, TRACK_SLUG)
    seed = header + "\n".join(lesson_blocks) + "\n" + quiz_sql

    seed_path = ROOT / "supabase/seed/academy_cocktails.sql"
    seed_path.write_text(seed, encoding="utf-8")
    merge_quiz_feedback(feedback_lines)

    quiz_lessons = sum(len([l for l in les if l["quiz"]]) for _, les in all_modules)
    print(f"Rebuilt seed: {seed_path.name}")
    print(f"Modules: {len(MODULE_REGISTRY)}, lessons: {lesson_count}, with quiz: {quiz_lessons}")
    print(f"New feedback entries: {len(feedback_lines)}")


if __name__ == "__main__":
    rebuild()
