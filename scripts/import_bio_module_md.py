#!/usr/bin/env python3
"""
Parse content/BIO_MODULES.md and emit lesson/quiz SQL fragments.
Handles Praktijkopdracht, Eindopdracht, Checklist, Reflectievraag and Beoordeling.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path
from typing import Dict, List

ROOT = Path(__file__).resolve().parents[1]


def sql_str(value: str) -> str:
    return "'" + value.replace("'", "''") + "'"


def parse_quiz_block(block: str) -> List[Dict]:
    questions = []
    for chunk in re.split(r"### Vraag \d+\s*\n", block):
        chunk = chunk.strip()
        if not chunk or chunk.startswith("## "):
            continue
        lines = [ln.rstrip() for ln in chunk.splitlines() if ln.strip()]
        prompt = lines[0]
        options: List[str] = []
        correct = 0
        for line in lines[1:]:
            m = re.match(r"^[A-D]\.\s*(.+?)(?:\s*✅)?\s*$", line)
            if not m:
                continue
            text = m.group(1).strip()
            if "✅" in line:
                correct = len(options)
            options.append(text)
        if prompt and len(options) == 4:
            questions.append({"prompt": prompt, "options": options, "correct_index": correct})
    return questions


def section(body: str, name: str) -> str:
    sm = re.search(rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\Z)", body, re.S)
    if not sm:
        return ""
    return re.sub(r"\n---\s*$", "", sm.group(1).strip())


def build_practice(body: str) -> str:
    parts: List[str] = []
    for name in ("Praktijkopdracht", "Eindopdracht"):
        content = section(body, name)
        if content:
            parts.append(content)

    checklist = section(body, "Checklist")
    if checklist and not any("Checklist" in p for p in parts):
        parts.append(f"### Checklist\n\n{checklist}")

    reflect = section(body, "Reflectievraag")
    if reflect:
        parts.append(f"### Reflectievraag\n\n{reflect}")

    beoord = section(body, "Beoordeling")
    if beoord:
        parts.append(f"### Beoordeling\n\n{beoord}")

    examen = section(body, "Examenstructuur")
    if examen and not parts:
        parts.append(examen)

    return "\n\n---\n\n".join(parts)


def parse_module_text(text: str, default_module_slug: str = "intro-biodynamic") -> Dict:
    module_slug_m = re.search(r"\*\*Module slug:\*\*\s*(\S+)", text)
    module_slug = module_slug_m.group(1) if module_slug_m else default_module_slug
    module_title_m = re.search(r"### Module \d+ — (.+)", text)
    module_title = module_title_m.group(1).strip() if module_title_m else None

    lessons: List[Dict] = []
    for m in re.finditer(r"# LES \d+ — (.+?)\n(.*?)(?=\n# LES \d+ —|\Z)", text, re.S):
        title = m.group(1).strip()
        body = m.group(2)

        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", body)
        dur_m = re.search(r"\*\*Duration:\*\*\s*(\d+)", body)
        feedback_m = re.search(
            r"## (?:Quiz-feedback|Examen-feedback)\s*\n+(.+?)(?=\n## |\Z)", body, re.S
        )

        feedback = ""
        if feedback_m:
            feedback = re.sub(r"\n---\s*$", "", feedback_m.group(1).strip())

        lessons.append(
            {
                "title": title,
                "slug": slug_m.group(1) if slug_m else "",
                "duration": int(dur_m.group(1)) if dur_m else 8,
                "objective": section(body, "Leerdoel"),
                "theory": section(body, "Theorie"),
                "did_you_know": section(body, "Wist-je-dat"),
                "summary": section(body, "Samenvatting"),
                "practice": build_practice(body),
                "key_concepts": section(body, "Kernbegrippen (DB field)"),
                "quiz": parse_quiz_block(section(body, "Quiz")),
                "quiz_feedback": feedback,
            }
        )

    return {"module_slug": module_slug, "module_title": module_title, "lessons": lessons}


def parse_module_md(path: Path, default_module_slug: str = "intro-biodynamic") -> Dict:
    return parse_module_text(path.read_text(encoding="utf-8"), default_module_slug)


def emit_lessons_sql(lessons: List[Dict], module_slug: str, track_slug: str) -> str:
    lines = [
        f"-- Generated from BIO module MD ({len(lessons)} lessons)",
        "with m as (",
        "  select m.id from academy.modules m",
        "  join academy.tracks t on t.id = m.track_id",
        f"  where t.slug = '{track_slug}' and m.slug = '{module_slug}'",
        ")",
        "insert into academy.lessons (",
        "  module_id, slug, title, learning_objective, theory_markdown,",
        "  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,",
        "  duration_minutes, sort_order, is_published",
        ")",
        "select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true",
        "from m",
        "cross join (values",
    ]
    tuples = []
    for i, les in enumerate(lessons, 1):
        tuples.append(
            "  (\n    "
            + ",\n    ".join(
                [
                    sql_str(les["slug"]),
                    sql_str(les["title"]),
                    sql_str(les["objective"]),
                    sql_str(les["theory"]),
                    sql_str(les["key_concepts"]),
                    sql_str(les["did_you_know"]),
                    sql_str(les["summary"]),
                    sql_str(les["practice"]),
                    str(les["duration"]),
                    str(i),
                ]
            )
            + "\n  )"
        )
    lines.append(",\n".join(tuples))
    lines.append(
        ") as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);"
    )
    return "\n".join(lines) + "\n"


def emit_quiz_sql(lessons: List[Dict], module_slug: str) -> str:
    rows = []
    for les in lessons:
        for n, q in enumerate(les["quiz"], 1):
            opts_json = ", ".join(f'"{o.replace(chr(34), chr(92)+chr(34))}"' for o in q["options"])
            expl = f"Correct: {q['options'][q['correct_index']]}"
            rows.append(
                f"  ({sql_str(module_slug)}, {sql_str(les['slug'])}, {n}, {sql_str(q['prompt'])}, "
                f"'[{opts_json}]', {q['correct_index']}, {sql_str(expl)})"
            )
    return ",\n".join(rows)


def emit_quiz_block_sql(all_modules: List[tuple[str, List[Dict]]], track_slug: str) -> str:
    rows = []
    for module_slug, lessons in all_modules:
        chunk = emit_quiz_sql(lessons, module_slug)
        if chunk:
            rows.append(chunk)
    if not rows:
        return ""
    values = ",\n".join(rows)
    return f"""-- Quizvragen
with l as (
  select l.id, m.slug as module_slug, l.slug as lesson_slug
  from academy.lessons l
  join academy.modules m on m.id = l.module_id
  join academy.tracks t on t.id = m.track_id
  where t.slug = '{track_slug}'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
{values}
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
"""


if __name__ == "__main__":
    path = Path(sys.argv[1]) if len(sys.argv) > 1 else ROOT / "content/BIO_MODULES.md"
    data = parse_module_md(path)
    print(emit_lessons_sql(data["lessons"], "intro-biodynamic", "biodynamic"))
