#!/usr/bin/env python3
"""Generate content/PORT_CURRICULUM_OVERZICHT.md from supabase/seed/academy_port.sql."""

import json
import re
from collections import defaultdict
from pathlib import Path
from typing import Dict, List, Optional, Tuple

ROOT = Path(__file__).resolve().parents[1]
SQL_PATH = ROOT / "supabase/seed/academy_port.sql"
QUIZ_FEEDBACK_PATH = ROOT / "web/src/lib/quizFeedback.ts"
GLOSSARY_PATH = ROOT / "web/src/lib/glossaryTerms.ts"
OUT_PATH = ROOT / "content/PORT_CURRICULUM_OVERZICHT.md"


def skip_ws(s: str, i: int) -> int:
    while i < len(s) and s[i] in " \t\n\r,":
        i += 1
    return i


def parse_sql_string(s: str, i: int) -> Tuple[str, int]:
    i = skip_ws(s, i)
    if i >= len(s) or s[i] != "'":
        raise ValueError(f"Expected string at {i!r}: {s[i : i + 40]!r}")
    i += 1
    chars: List[str] = []
    while i < len(s):
        if s[i] == "'":
            if i + 1 < len(s) and s[i + 1] == "'":
                chars.append("'")
                i += 2
            else:
                return "".join(chars), i + 1
        chars.append(s[i])
        i += 1
    raise ValueError("Unterminated SQL string")


def parse_int(s: str, i: int) -> Tuple[int, int]:
    i = skip_ws(s, i)
    m = re.match(r"-?\d+", s[i:])
    if not m:
        raise ValueError(f"Expected int at {i}: {s[i : i + 20]!r}")
    return int(m.group()), i + m.end()


def parse_lesson_tuple(s: str, i: int) -> Tuple[Optional[dict], int]:
    i = skip_ws(s, i)
    if i >= len(s) or s[i] != "(":
        return None, i
    i += 1
    try:
        slug, i = parse_sql_string(s, i)
        title, i = parse_sql_string(s, i)
        objective, i = parse_sql_string(s, i)
        theory, i = parse_sql_string(s, i)
        key_concepts, i = parse_sql_string(s, i)
        did_you_know, i = parse_sql_string(s, i)
        summary, i = parse_sql_string(s, i)
        practice, i = parse_sql_string(s, i)
        duration, i = parse_int(s, i)
        sort_order, i = parse_int(s, i)
    except ValueError:
        return None, i
    i = skip_ws(s, i)
    if i < len(s) and s[i] == ")":
        i += 1
    return {
        "slug": slug,
        "title": title,
        "objective": objective,
        "theory": theory,
        "key_concepts": key_concepts,
        "did_you_know": did_you_know,
        "summary": summary,
        "practice": practice,
        "duration": duration,
        "sort_order": sort_order,
    }, i


def parse_quiz_feedback() -> Dict[str, str]:
    text = QUIZ_FEEDBACK_PATH.read_text(encoding="utf-8")
    block = re.search(r"const LESSON_FEEDBACK[^=]*=\s*\{([^}]+)\}", text, re.S)
    if not block:
        return {}
    feedback: Dict[str, str] = {}
    for m in re.finditer(
        r"'((?:[^'\\]|\\.)*)':\s*(?:\n\s*)?'((?:[^'\\]|\\.)*)'",
        block.group(1),
    ):
        slug = m.group(1).replace("\\'", "'")
        message = m.group(2).replace("\\'", "'")
        feedback[slug] = message
    return feedback


def parse_modules(sql: str) -> List[dict]:
    """Parse module rows from the track seed insert."""
    start = sql.find("insert into academy.modules")
    if start < 0:
        return []
    values_idx = sql.find("cross join (values", start)
    if values_idx < 0:
        return []
    sub = sql[values_idx + len("cross join (values") :]
    end = sub.find(") as v(level")
    if end < 0:
        return []
    sub = sub[:end]
    modules: List[dict] = []
    pos = 0
    while pos < len(sub):
        pos = skip_ws(sub, pos)
        if pos >= len(sub) or sub[pos] != "(":
            break
        pos += 1
        try:
            level, pos = parse_sql_string(sub, pos)
            slug, pos = parse_sql_string(sub, pos)
            title, pos = parse_sql_string(sub, pos)
            sort_order, pos = parse_int(sub, pos)
        except ValueError:
            break
        pos = skip_ws(sub, pos)
        if pos < len(sub) and sub[pos] == ")":
            pos += 1
        modules.append(
            {"level": level, "slug": slug, "title": title, "sort_order": sort_order}
        )
    return modules


def parse_glossary_terms() -> List[Dict[str, str]]:
    text = GLOSSARY_PATH.read_text(encoding="utf-8")
    terms: List[Dict[str, str]] = []
    for m in re.finditer(r"term:\s*'((?:[^'\\]|\\.)*)'", text):
        term = m.group(1).replace("\\'", "'")
        rest = text[m.end() :]
        dm = re.search(r"definition:\s*(?:\n\s*)?'((?:[^'\\]|\\.)*)'", rest)
        if not dm:
            continue
        definition = re.sub(r"\s+", " ", dm.group(1).replace("\\'", "'").strip())
        terms.append({"term": term, "definition": definition})
    return terms


def glossary_in_lesson(lesson: dict, glossary_terms: List[Dict[str, str]]) -> List[Dict[str, str]]:
    haystack = "\n".join(
        [
            lesson["theory"],
            lesson["did_you_know"],
            lesson["summary"],
            lesson["practice"],
            lesson["objective"],
            lesson.get("key_concepts") or "",
        ]
    ).lower()
    found: List[Dict[str, str]] = []
    for entry in glossary_terms:
        if entry["term"].lower() in haystack:
            found.append(entry)
    return found


def main() -> None:
    sql = SQL_PATH.read_text(encoding="utf-8")

    modules = parse_modules(sql)

    module_lessons: Dict[str, List[dict]] = defaultdict(list)
    blocks = re.split(r"where t\.slug = 'port' and m\.slug = '([^']+)'", sql)
    for i in range(1, len(blocks), 2):
        mod_slug = blocks[i]
        block = blocks[i + 1]
        marker = "cross join (values"
        idx = block.find(marker)
        if idx < 0:
            continue
        sub = block[idx + len(marker) :]
        end = sub.find(") as v(slug")
        if end < 0:
            continue
        sub = sub[:end]
        pos = 0
        while pos < len(sub):
            pos = skip_ws(sub, pos)
            if pos >= len(sub) or sub[pos] != "(":
                break
            lesson, pos = parse_lesson_tuple(sub, pos)
            if lesson:
                module_lessons[mod_slug].append(lesson)

    for mod_slug in module_lessons:
        seen = {les["slug"]: les for les in module_lessons[mod_slug]}
        module_lessons[mod_slug] = sorted(seen.values(), key=lambda x: x["sort_order"])

    quiz_by_lesson: Dict[Tuple[str, str], List[dict]] = defaultdict(list)
    qi = sql.find("insert into academy.quiz_questions")
    quiz_block = sql[qi:]
    vj = quiz_block.find("join (values")
    quiz_values = quiz_block[vj + len("join (values") :]
    quiz_values = quiz_values[: quiz_values.find(") as v(")]

    pos = 0
    while pos < len(quiz_values):
        pos = skip_ws(quiz_values, pos)
        if pos >= len(quiz_values) or quiz_values[pos] != "(":
            if pos >= len(quiz_values):
                break
            pos += 1
            continue
        pos += 1
        try:
            module_slug, pos = parse_sql_string(quiz_values, pos)
            slug, pos = parse_sql_string(quiz_values, pos)
            sort_order, pos = parse_int(quiz_values, pos)
            prompt, pos = parse_sql_string(quiz_values, pos)
            options_raw, pos = parse_sql_string(quiz_values, pos)
            correct_index, pos = parse_int(quiz_values, pos)
            explanation, pos = parse_sql_string(quiz_values, pos)
        except ValueError:
            break
        pos = skip_ws(quiz_values, pos)
        if pos < len(quiz_values) and quiz_values[pos] == ")":
            pos += 1
        try:
            options = json.loads(options_raw)
        except json.JSONDecodeError:
            options = [options_raw]
        quiz_by_lesson[(module_slug, slug)].append(
            {
                "sort_order": sort_order,
                "prompt": prompt,
                "options": options,
                "correct_index": correct_index,
                "explanation": explanation,
            }
        )

    for key in quiz_by_lesson:
        quiz_by_lesson[key].sort(key=lambda q: q["sort_order"])

    quiz_feedback = parse_quiz_feedback()
    glossary_terms = parse_glossary_terms()

    lines: List[str] = []
    lines.append("# Port-track — curriculumoverzicht (volledige tekst)")
    lines.append("")
    lines.append("**Bronnen:**")
    lines.append(f"- [`supabase/seed/academy_port.sql`](../supabase/seed/academy_port.sql) — lessen en quiz")
    lines.append(f"- [`web/src/lib/quizFeedback.ts`](../web/src/lib/quizFeedback.ts) — quiz-feedback")
    lines.append(f"- [`web/src/lib/glossaryTerms.ts`](../web/src/lib/glossaryTerms.ts) — woordenlijst")
    lines.append("")
    lines.append("**Doel:** inhoud doorlopen, annoteren en wijzigingen doorgeven.")
    lines.append("")
    total_lessons = sum(len(module_lessons.get(m["slug"], [])) for m in modules)
    lines.append(f"**Totaal:** 1 track (`port`) · {len(modules)} modules · {total_lessons} lessen")
    lines.append("")
    lines.append("---")
    lines.append("")

    lines.append("## Inhoudsopgave")
    lines.append("")
    track_order = 1
    toc_entries = []
    for mod in sorted(modules, key=lambda m: m["sort_order"]):
        for les in module_lessons.get(mod["slug"], []):
            toc_entries.append((track_order, les["title"], les["slug"], mod["title"]))
            track_order += 1
    for n, title, anchor, mod_title in toc_entries:
        lines.append(f"{n}. [{title}](#les-{anchor}) — *{mod_title}*")
    lines.append("")
    lines.append("---")
    lines.append("")

    track_order = 1
    for mod in sorted(modules, key=lambda m: m["sort_order"]):
        lines.append(f"# Module {mod['sort_order']}: {mod['title']}")
        lines.append("")
        lines.append(f"- **Slug:** `{mod['slug']}`")
        lines.append(f"- **Niveau:** {mod['level']}")
        lines.append("- **Framework 2.0 pijler:** *(invullen bij review)*")
        lines.append("- **Module review / opmerking:**")
        lines.append("")
        lines.append("---")
        lines.append("")

        for les in module_lessons.get(mod["slug"], []):
            slug = les["slug"]
            feedback_key = f"{mod['slug']}:{slug}"
            quiz = quiz_by_lesson.get((mod["slug"], slug), [])
            lines.append(f"## Les {track_order}: {les['title']} {{#les-{slug}}}")
            lines.append("")
            lines.append("| Eigenschap | Waarde |")
            lines.append("|------------|--------|")
            lines.append(f"| Slug | `{slug}` |")
            lines.append(f"| Module | {mod['title']} (`{mod['slug']}`) |")
            lines.append(f"| Niveau | {mod['level']} |")
            lines.append(f"| Duur | {les['duration']} min |")
            lines.append(f"| Quizvragen | {len(quiz) if quiz else '—'} |")
            lines.append("| Review | |")
            lines.append("| Opmerking | |")
            lines.append("")

            lines.append("### Leerdoel")
            lines.append("")
            lines.append(les["objective"])
            lines.append("")

            lines.append("### Theorie")
            lines.append("")
            lines.append(les["theory"])
            lines.append("")

            lines.append("### Kernbegrippen")
            lines.append("")
            if les.get("key_concepts"):
                lines.append(les["key_concepts"])
            else:
                lines.append("*(nog niet ingevuld — kolom `key_concepts_markdown`)*")
            lines.append("")

            lines.append("### Wist je dat?")
            lines.append("")
            lines.append(les["did_you_know"])
            lines.append("")

            lines.append("### Samenvatting")
            lines.append("")
            lines.append(les["summary"])
            lines.append("")

            lines.append("### Praktijkopdracht")
            lines.append("")
            lines.append(les["practice"])
            lines.append("")

            lines.append("### Quiz")
            lines.append("")
            if quiz:
                letters = "ABCD"
                for q in quiz:
                    lines.append(f"**Vraag {q['sort_order']}.** {q['prompt']}")
                    lines.append("")
                    for idx, opt in enumerate(q["options"]):
                        mark = " ✓" if idx == q["correct_index"] else ""
                        lines.append(f"- {letters[idx]}) {opt}{mark}")
                    lines.append("")
                    lines.append(f"*Toelichting:* {q['explanation']}")
                    lines.append("")
            else:
                lines.append("*(geen quiz)*")
                lines.append("")

            lines.append("### Quiz-feedback (app)")
            lines.append("")
            if feedback_key in quiz_feedback:
                lines.append(f"**Bij score >= 60%:** {quiz_feedback[feedback_key]}")
            elif slug in quiz_feedback:
                lines.append(f"**Bij score >= 60%:** {quiz_feedback[slug]}")
            elif quiz:
                lines.append(
                    "**Bij score >= 60%:** *(geen specifieke tekst — fallback in app:* "
                    "*Goed gedaan! Je kennis groeit met elke les.*)"
                )
            else:
                lines.append("*(geen quiz)*")
            lines.append("")
            lines.append("**Bij score < 60%:** Herlees de les en probeer de fouten opnieuw.")
            lines.append("")

            lesson_glossary = glossary_in_lesson(les, glossary_terms)
            lines.append("### Woordenlijst (termen in deze les)")
            lines.append("")
            if lesson_glossary:
                for entry in lesson_glossary:
                    lines.append(f"- **{entry['term']}** — {entry['definition']}")
                lines.append("")
            else:
                lines.append("*(geen woordenlijst-termen herkend in leerdoel/theorie/samenvatting/praktijk)*")
                lines.append("")

            lines.append("---")
            lines.append("")
            track_order += 1

    lines.append("## Bijlage: voltooiingsregels")
    lines.append("")
    lines.append("- Theorie gelezen + praktijk afgevinkt + quiz >= 70%")
    lines.append("- `theorie-examen-port` heeft geen multiple-choice quiz in de app (open examen in de les)")
    lines.append("- Correct antwoord in quiz hierboven gemarkeerd met ✓")
    lines.append("")
    lines.append("## Bijlage: woordenlijst (volledig)")
    lines.append("")
    lines.append(
        "Alle termen uit de app-woordenlijst. In de lessecties hierboven staan alleen termen "
        "die in die les voorkomen."
    )
    lines.append("")
    for entry in glossary_terms:
        lines.append(f"- **{entry['term']}** — {entry['definition']}")
    lines.append("")
    lines.append("## Bijlage: quiz-feedback (volledig)")
    lines.append("")
    lines.append("Tekst die de app toont na een geslaagde quiz (score >= 60%).")
    lines.append("")
    all_lesson_keys = []
    for mod in sorted(modules, key=lambda m: m["sort_order"]):
        for les in module_lessons.get(mod["slug"], []):
            all_lesson_keys.append((mod["slug"], les["slug"], les["title"]))
    for mod_slug, slug, title in all_lesson_keys:
        feedback_key = f"{mod_slug}:{slug}"
        quiz = quiz_by_lesson.get((mod_slug, slug), [])
        if feedback_key in quiz_feedback:
            lines.append(f"- **`{mod_slug}:{slug}`** ({title}): {quiz_feedback[feedback_key]}")
        elif slug in quiz_feedback:
            lines.append(f"- **`{slug}`** ({title}): {quiz_feedback[slug]}")
        elif quiz:
            lines.append(
                f"- **`{mod_slug}:{slug}`** ({title}): *(fallback)* Goed gedaan! Je kennis groeit met elke les."
            )
    lines.append("")

    OUT_PATH.write_text("\n".join(lines), encoding="utf-8")
    print(f"Written: {OUT_PATH}")
    print(f"Lessons: {total_lessons}")
    print(f"Size: {OUT_PATH.stat().st_size // 1024} KB")


if __name__ == "__main__":
    main()
