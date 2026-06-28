#!/usr/bin/env python3
"""Rebuild supabase/seed/academy_port.sql from content/PORT_MODULES.md."""

from __future__ import annotations

import importlib.util
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

MODULE_REGISTRY: dict[int, dict[str, str]] = {
    1: {"slug": "intro-port", "title": "Fundament", "level": "explorer"},
    2: {"slug": "productie-port", "title": "Productie", "level": "explorer"},
    3: {"slug": "proeven-port", "title": "Proeven", "level": "explorer"},
    4: {"slug": "oorsprong-port", "title": "Regio's van Port", "level": "explorer"},
    5: {"slug": "portstijlen", "title": "Portstijlen", "level": "explorer"},
    6: {"slug": "portstijlen-verdiept", "title": "Portstijlen verdiept", "level": "specialist"},
    7: {"slug": "port-premium", "title": "Colheita & Garrafeira", "level": "specialist"},
    8: {"slug": "praktijk-port", "title": "Service, Pairing & Praktijk", "level": "master"},
    9: {"slug": "examen-port", "title": "Blindproeven & Examen", "level": "master"},
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
    source = ROOT / "content/PORT_MODULES.md"
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

    header = f"""-- Port track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · {len(MODULE_REGISTRY)} modules · {lesson_count} lessons · quizvragen per les

delete from academy.tracks where slug = 'port';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'port',
  'Port',
  'Leer Port van Fundament tot Master: productie, proeven, regio''s, stijlen, service en examen.',
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
