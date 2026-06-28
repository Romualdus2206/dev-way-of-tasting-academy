#!/usr/bin/env python3
"""Apply content/PORT_MODULE_XX.md to supabase/seed/academy_port.sql."""

from __future__ import annotations

import importlib.util
import re
import sys
from pathlib import Path
from typing import List, Set

ROOT = Path(__file__).resolve().parents[1]

# Slugs removed when replacing soorten-port → productie-port
SOORTEN_PORT_REMOVED: Set[str] = {
    "ruby-port",
    "tawny-port",
    "ruby-karakter",
    "tawny-oxidatie",
    "tawny-leeftijd",
}

# Duplicates removed from oorsprong-port (now in productie-port)
OORSPRONG_REMOVED: Set[str] = {
    "druiven-van-port",
    "douro-vallei",
    "klimaat-terroir",
}


def load_importer():
    spec = importlib.util.spec_from_file_location(
        "import_port_module_md", ROOT / "scripts/import_port_module_md.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def count_lessons(sql: str) -> int:
    return len(re.findall(r"\n  \(\n    '[a-z0-9-]+',\n    '", sql))


def remove_module_lesson_blocks(sql: str, module_slug: str) -> str:
    while True:
        idx = sql.find(f"m.slug = '{module_slug}'")
        if idx < 0:
            break
        start = sql.rfind("\n--", 0, idx)
        if start < 0:
            start = 0
        end_m = re.search(r"\) as v\([^)]+\);\n", sql[idx:])
        if not end_m:
            break
        end = idx + end_m.end()
        sql = sql[:start] + sql[end:]
    return sql


def apply_module(md_path: Path) -> None:
    imp = load_importer()
    data = imp.parse_module_md(md_path)
    module_slug = data["module_slug"]
    module_title = data["module_title"]
    lessons = data["lessons"]
    lesson_slugs = {les["slug"] for les in lessons}

    seed_path = ROOT / "supabase/seed/academy_port.sql"
    sql = seed_path.read_text(encoding="utf-8")

    # Module 2 replaces legacy soorten-port
    if module_slug == "productie-port":
        sql = sql.replace(
            "('explorer', 'soorten-port', 'Portstijlen', 2),",
            "('explorer', 'productie-port', 'Productie', 2),",
        )
        sql = remove_module_lesson_blocks(sql, "soorten-port")
        sql = remove_module_lesson_blocks(sql, "productie-port")

        # oorsprong-port: drop moved lessons
        sql = re.sub(
            r"-- Les 15–16: oorsprong-port \(vervolg\)\n.*?\) as v\(slug, title, objective, theory, did_you_know, summary, practice, duration, sort_order\);\n",
            "",
            sql,
            flags=re.S,
        )
        # druiven-van-port tuple from Les 11–12 block
        sql = re.sub(
            r",\n  \(\n    'druiven-van-port',.*?\n    8, 2\n  \)",
            "",
            sql,
            flags=re.S,
        )

        quiz_remove = SOORTEN_PORT_REMOVED | OORSPRONG_REMOVED | lesson_slugs | {"klimaat-en-terroir"}
    elif module_slug == "intro-port":
        sql = remove_module_lesson_blocks(sql, module_slug)
        if module_title:
            sql = sql.replace(
                "('explorer', 'intro-port', 'Fundament', 1),",
                f"('explorer', 'intro-port', '{module_title}', 1),",
            )
        quiz_remove = lesson_slugs
    else:
        sql = remove_module_lesson_blocks(sql, module_slug)
        quiz_remove = lesson_slugs

    lessons_sql = imp.emit_lessons_sql(lessons, module_slug).replace(
        f"-- Generated from PORT_MODULE MD ({len(lessons)} lessons)\n",
        f"-- {module_slug} ({len(lessons)} lessons)\n",
    )

    if module_slug == "productie-port":
        anchor = "-- Les 5: proeven-port"
    elif module_slug == "intro-port":
        anchor = "-- Les 3–4: soorten-port"
        anchor = "-- Les 5: proeven-port" if "-- Les 5: proeven-port" in sql else "-- productie-port"
        # after module 1, before proeven
        anchor = "-- Les 5: proeven-port"
        if "productie-port" in sql and module_slug == "intro-port":
            anchor = "-- productie-port"
    else:
        anchor = "-- Les 5: proeven-port"

    if module_slug == "intro-port":
        anchor = "-- productie-port" if "-- productie-port" in sql else "-- Les 5: proeven-port"
    if module_slug == "productie-port":
        anchor = "-- Les 5: proeven-port"

    if anchor not in sql:
        raise SystemExit(f"Anchor not found: {anchor}")
    sql = sql.replace(anchor, lessons_sql + anchor, 1)

    # quiz rows
    lines = []
    for line in sql.splitlines():
        m = re.match(r"\s+\('([a-z0-9-]+)',\s*\d+,", line)
        if m and m.group(1) in quiz_remove:
            continue
        lines.append(line)
    sql = "\n".join(lines)

    quiz_sql = imp.emit_quiz_sql(lessons, module_slug)
    marker = f"  ({imp.sql_str(module_slug)}, {imp.sql_str(lessons[0]['slug'])}, 1,"
    if marker not in sql:
        marker = "  ('intro-port', 'wat-is-port', 1,"
    sql = sql.replace(marker, quiz_sql + ",\n" + marker, 1)

    total = count_lessons(sql)
    sql = re.sub(
        r"-- 1 track · 8 modules · \d+ lessons",
        f"-- 1 track · 8 modules · {total} lessons",
        sql,
    )

    seed_path.write_text(sql, encoding="utf-8")
    print(f"Applied {md_path.name} → module {module_slug} ({len(lessons)} lessons)")
    print(f"Seed lessons inserts: {total}")


def update_quiz_feedback(md_path: Path) -> None:
    imp = load_importer()
    data = imp.parse_module_md(md_path)
    fb_path = ROOT / "web/src/lib/quizFeedback.ts"
    text = fb_path.read_text(encoding="utf-8")

    for les in data["lessons"]:
        if not les["quiz_feedback"]:
            continue
        slug = les["slug"]
        msg = les["quiz_feedback"].replace("\n", " ").strip()
        msg = re.sub(r"\s*---\s*$", "", msg)
        msg = msg.replace("\\", "\\\\").replace("'", "\\'")
        key = f"'{slug}'" if "-" in slug else slug
        pattern = rf"({re.escape(key)}:\s*)'[^']*'(,|\s*\n\s*')"
        if re.search(pattern, text):
            text = re.sub(pattern, rf"\1'{msg}'\2", text, count=1)
        else:
            insert_after = "const LESSON_FEEDBACK: Record<string, string> = {\n"
            text = text.replace(
                insert_after,
                insert_after + f"  {key}: '{msg}',\n",
                1,
            )

    fb_path.write_text(text, encoding="utf-8")
    print(f"Updated quiz feedback for {len(data['lessons'])} lessons")


if __name__ == "__main__":
    path = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "content/PORT_MODULE_02.md"
    apply_module(path)
    update_quiz_feedback(path)
