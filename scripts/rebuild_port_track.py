#!/usr/bin/env python3
"""Rebuild supabase/seed/academy_port.sql from content/archive/intermediate/PORT_TRACK_V2_PERFECT.md."""

from __future__ import annotations

import importlib.util
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "content/PORT_FINAL_CONTENT.md"
SOURCE_FALLBACKS = (
    ROOT / "content/PORT_FINAL_CONTENT.md",
    ROOT / "content/archive/intermediate/PORT_TRACK_V2_PERFECT.md",
    ROOT / "content/archive/intermediate/PORT_TRACK_V2_CANONICAL.md",
    ROOT / "content/archive/intermediate/PORT_TRACK_V2_FINAL.md",
    ROOT / "content/archive/legacy/PORT_MODULES.md",
)

MODULE_REGISTRY: dict[int, dict[str, str]] = {
    1: {"slug": "intro-port", "title": "Fundament", "level": "explorer"},
    2: {"slug": "productie-port", "title": "Productie & Terroir", "level": "explorer"},
    3: {"slug": "proeven-port", "title": "Proeven & Analyse", "level": "explorer"},
    4: {"slug": "oorsprong-port", "title": "Oorsprong & Identiteit", "level": "specialist"},
    5: {"slug": "portstijlen", "title": "Specialist Styles I", "level": "specialist"},
    6: {"slug": "portstijlen-verdiept", "title": "Specialist Styles II", "level": "specialist"},
    7: {"slug": "service-port", "title": "Service & Bewaren", "level": "master"},
    8: {"slug": "pairing-port", "title": "Food Pairing & Gastronomie", "level": "master"},
    9: {"slug": "examen-port", "title": "Integratie & Mastery", "level": "master"},
}


def load_importer():
    spec = importlib.util.spec_from_file_location(
        "import_port_module_md", ROOT / "scripts/import_port_module_md.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def ts_feedback_line(key: str, message: str) -> str:
    msg = message.replace("\n", " ").strip()
    msg = re.sub(r"\s*---\s*$", "", msg)
    msg = msg.replace("\\", "\\\\").replace("'", "\\'")
    ts_key = f"'{key}'"
    return f"  {ts_key}: '{msg}',"


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
    source = next((p for p in SOURCE_FALLBACKS if p.exists()), SOURCE_FALLBACKS[-1])
    grouped = imp.split_port_track(source.read_text(encoding="utf-8"))
    all_modules: list[tuple[str, list]] = []
    lesson_count = 0
    lesson_blocks: list[str] = []
    feedback_lines: list[str] = []

    for num in sorted(MODULE_REGISTRY):
        cfg = MODULE_REGISTRY[num]
        if num not in grouped:
            raise SystemExit(f"Missing module {num} in PORT_MODULES.md")
        module_slug = cfg["slug"]
        lessons = grouped[num]
        lesson_count += len(lessons)
        all_modules.append((module_slug, lessons))

        block = imp.emit_lessons_sql(lessons, module_slug).replace(
            f"-- Generated from PORT_MODULE MD ({len(lessons)} lessons)\n",
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

    header = f"""-- Port track seed V2 (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · {len(MODULE_REGISTRY)} modules · {lesson_count} lessons · quizvragen per les
-- Bron: content/PORT_FINAL_CONTENT.md

delete from academy.tracks where slug = 'port';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'port',
  'Port',
  'Leer Port van Fundament tot Master: productie, proeven, stijlen, service, pairing en integratie.',
  1,
  now()
);

with t as (select id from academy.tracks where slug = 'port')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
{module_rows}
) as v(level, slug, title, sort_order);

"""

    quiz_sql = imp.emit_quiz_block_sql(all_modules)
    seed = header + "\n".join(lesson_blocks) + "\n" + quiz_sql

    seed_path = ROOT / "supabase/seed/academy_port.sql"
    seed_path.write_text(seed, encoding="utf-8")
    merge_quiz_feedback(feedback_lines)

    quiz_lessons = sum(len([l for l in les if l["quiz"]]) for _, les in all_modules)
    print(f"Rebuilt seed: {seed_path.name}")
    print(f"Modules: {len(MODULE_REGISTRY)}, lessons: {lesson_count}, with quiz: {quiz_lessons}")
    print(f"New feedback entries: {len(feedback_lines)}")


if __name__ == "__main__":
    rebuild()
