#!/usr/bin/env python3
"""Apply Global QA Repair Pass per Way_of_Tasting_Academy_QA_Rapport.pdf."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from qa_repair_data import (  # noqa: E402
    BIER_0_0_LEGAL_NEW,
    BIER_0_0_LEGAL_OLD,
    BIER_0_0_QUIZ_NEW,
    BIER_0_0_QUIZ_OLD,
    BIO_FEEDBACK_HEDGING,
    PORT_LESSON_REPAIRS,
    PORT_MODULE_META,
    QUIZ_REPLACEMENTS,
    WINE_L21_SUMMARY_NEW,
    WINE_L21_SUMMARY_OLD,
    WINE_L21_THEORY_NEW,
    WINE_L21_THEORY_OLD,
)

CONTENT = ROOT / "content"


def read_track(prefix: str) -> str:
    return (CONTENT / f"{prefix}_FINAL_CONTENT.md").read_text(encoding="utf-8")


def write_track(prefix: str, text: str) -> None:
    path = CONTENT / f"{prefix}_FINAL_CONTENT.md"
    path.write_text(text.rstrip() + "\n", encoding="utf-8")
    print(f"  wrote {path.relative_to(ROOT)} ({path.stat().st_size // 1024} KB)")


def format_port_module(num: int) -> str:
    m = PORT_MODULE_META[num]
    lines = [
        f"### Module {num} — {m['title']}",
        "",
        f"**Level:** {m['level']}",
        f"**Framework pillar:** {m['pillar']}",
        f"**Module goal:** {m['goal']}",
        "",
        "---",
        "",
        "## Module kernbegrippen (DB field)",
        "",
    ]
    lines.extend(f"- {k}" for k in m["kernbegrippen"])
    lines.extend(["", "---", ""])
    return "\n".join(lines)


def repair_port_schema(text: str) -> str:
    text = re.sub(r"^- \[ \] ", "- ", text, flags=re.M)
    text = re.sub(r"\*\*Module slug:\*\*[^\n]+\n", "", text)

    # Insert module 1 block before first lesson if missing kernbegrippen at top
    if "## Module kernbegrippen (DB field)" not in text.split("# LES 1 —")[0]:
        first_les = text.find("# LES 1 —")
        header = text[:first_les].rstrip()
        header = re.sub(r"# MODULE 1 — Fundament.*", format_port_module(1), header, flags=re.S)
        text = header + "\n\n" + text[first_les:]

    for num in range(9, 0, -1):
        title = PORT_MODULE_META[num]["title"]
        pattern = rf"# MODULE {num} — {re.escape(title)}\s*\n.*?(?=\n# LES \d+ — )"
        if num == 1:
            continue  # handled in header
        text, n = re.subn(pattern, format_port_module(num), text, count=1, flags=re.S)
        if n == 0 and num > 1:
            # already converted or missing — try ### without slug block
            pattern2 = rf"(?:# MODULE|### Module) {num} — {re.escape(title)}.*?(?=\n# LES \d+ — )"
            text, _ = re.subn(pattern2, format_port_module(num), text, count=1, flags=re.S)

    return text


def repair_port_lessons_41_45(text: str) -> str:
    for les_num, repairs in PORT_LESSON_REPAIRS.items():
        marker = f"# LES {les_num} — "
        start = text.find(marker)
        if start < 0:
            raise SystemExit(f"Port LES {les_num} not found")
        end = text.find("\n# LES ", start + 10)
        chunk = text[start:end] if end > 0 else text[start:]

        chunk = re.sub(
            r"## Wist-je-dat\s*\n\n.*?(?=\n## )",
            f"## Wist-je-dat\n\n{repairs['wist_je_dat']}\n\n",
            chunk,
            count=1,
            flags=re.S,
        )
        chunk = re.sub(
            r"## Samenvatting\s*\n\n.*?(?=\n## )",
            f"## Samenvatting\n\n{repairs['samenvatting']}\n\n",
            chunk,
            count=1,
            flags=re.S,
        )
        chunk = re.sub(
            r"(### Checklist\s*\n\n)(.*?)(?=\n---|\n## )",
            lambda m: m.group(1) + repairs["praktijk_checklist"] + "\n\n",
            chunk,
            count=1,
            flags=re.S,
        )
        text = text[:start] + chunk + (text[end:] if end > 0 else "")
    return text


def replace_quiz_question(text: str, les: int, qnum: int, body: str) -> str:
    marker = f"# LES {les} — "
    start = text.find(marker)
    if start < 0:
        raise SystemExit(f"Lesson {les} not found for quiz repair")
    end = text.find("\n# LES ", start + 10)
    chunk = text[start:end] if end > 0 else text[start:]
    pattern = rf"(### Vraag {qnum}\s*\n\n).*?(?=\n### Vraag |\n## Quiz-feedback|\n---\n\n## Quiz-feedback)"
    new_chunk, n = re.subn(pattern, rf"\1{body}\n\n", chunk, count=1, flags=re.S)
    if n != 1:
        raise SystemExit(f"Quiz LES {les} V{qnum}: expected 1 replace, got {n}")
    return text[:start] + new_chunk + (text[end:] if end > 0 else "")


def repair_quizzes(text: str, prefix: str) -> str:
    for (les, qnum), body in QUIZ_REPLACEMENTS.get(prefix, {}).items():
        text = replace_quiz_question(text, les, qnum, body)
    return text


def repair_rose_lesson_numbers(text: str) -> str:
    replacements = [
        ("# LES 38 — Provence vs Tavel blind", "# LES 41 — Provence vs Tavel blind"),
        ("# LES 39 — Rosé vs lichte rode wijn blind", "# LES 42 — Rosé vs lichte rode wijn blind"),
        ("# LES 40 — Theorie- en praktijkexamen", "# LES 43 — Theorie- en praktijkexamen"),
    ]
    for old, new in replacements:
        if old not in text:
            raise SystemExit(f"Rose renumber missing: {old}")
        text = text.replace(old, new, 1)

    text = text.replace(
        "Volgende les: Les 40 sluit Module 8 af met fine dining",
        "Volgende les: Les 41 opent Module 9 met Provence vs Tavel blind",
    )
    text = text.replace(
        "Volgende les: Les 42 verlegt de vergelijking naar rosé tegenover lichte rode wijn",
        "Volgende les: Les 42 verlegt de vergelijking naar rosé tegenover lichte rode wijn",
    )
    # fix bridge before exam that referenced wrong numbering
    text = text.replace(
        "Volgende les: Les 43 — het Theorie- en praktijkexamen",
        "Volgende les: Les 43 — het Theorie- en praktijkexamen",
    )
    return text


def repair_wine_les_21(text: str) -> str:
    text = text.replace(WINE_L21_THEORY_OLD, WINE_L21_THEORY_NEW)
    text = text.replace(WINE_L21_SUMMARY_OLD, WINE_L21_SUMMARY_NEW)
    marker = "# LES 21 — "
    start = text.find(marker)
    end = text.find("\n# LES ", start + 10)
    chunk = text[start:end]
    if "- Ik vond Pinot Grigio" not in chunk:
        chunk = chunk.replace(
            "- Ik vond Riesling\n",
            "- Ik vond Riesling\n- Ik vond Pinot Grigio\n",
        )
        text = text[:start] + chunk + text[end:]
    return text


def repair_bier_0_0_les_1(text: str) -> str:
    text = text.replace(BIER_0_0_LEGAL_OLD, BIER_0_0_LEGAL_NEW)
    text = text.replace(
        "- 0.0 betekent maximaal 0,05% alcohol in de EU-context",
        "- In Nederland geldt maximaal 0,1% alcohol voor het label alcoholvrij; andere EU-landen hanteren grenzen tussen 0,5% en 1,2%\n"
        "- Het label 0.0 verwijst in de praktijk naar afgerond 0,00%",
    )
    text = text.replace(BIER_0_0_QUIZ_OLD, BIER_0_0_QUIZ_NEW)
    return text


def repair_bio_feedback(text: str) -> str:
    for old, new in BIO_FEEDBACK_HEDGING:
        text = text.replace(old, new)
    # Broader hedging in quiz-feedback only
    parts = text.split("## Quiz-feedback")
    out = [parts[0]]
    for part in parts[1:]:
        fb, _, rest = part.partition("\n## ")
        fb = re.sub(r"\bwerkt\b", "kan werken", fb)
        fb = fb.replace("Je begrijpt nu waarom biodynamische ", "Je ziet nu waarom biodynamische ")
        fb = fb.replace("Je beheerst nu", "Je ziet nu hoe je")
        out.append("## Quiz-feedback" + fb + ("\n## " + rest if rest else ""))
    return "".join(out)


def validate_quiz_options(text: str, prefix: str, lessons: list[int] | None = None) -> None:
    for m in re.finditer(r"^# LES (\d+) — ", text, re.M):
        les = int(m.group(1))
        if lessons and les not in lessons:
            continue
        chunk = text[m.start() :]
        nxt = re.search(r"^# LES \d+ — ", chunk[10:], re.M)
        chunk = chunk[: nxt.start() + 10] if nxt else chunk
        if "## Quiz" not in chunk:
            continue
        for qm in re.finditer(r"### Vraag (\d+)", chunk):
            qchunk = chunk[qm.start() :]
            nq = re.search(r"### Vraag \d+|## Quiz-feedback", qchunk[10:], re.M)
            qtext = qchunk[: nq.start() + 10] if nq else qchunk
            opts = re.findall(r"^[A-D]\.", qtext, re.M)
            if opts and len(opts) < 4:
                raise SystemExit(f"{prefix} LES {les} V{qm.group(1)}: {len(opts)} options")


def validate_rose_numbers(text: str) -> None:
    nums = [int(m.group(1)) for m in re.finditer(r"^# LES (\d+) — ", text, re.M)]
    if len(nums) != len(set(nums)):
        dupes = {n for n in nums if nums.count(n) > 1}
        raise SystemExit(f"Rose duplicate lesson numbers: {dupes}")
    if max(nums) != 43:
        raise SystemExit(f"Rose expected max LES 43, got {max(nums)}")


def validate_port_schema(text: str) -> None:
    if re.search(r"^# MODULE \d+", text, re.M):
        raise SystemExit("Port still has # MODULE headers")
    if re.search(r"^- \[ \] ", text, re.M):
        raise SystemExit("Port still has checkbox syntax")
    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Port expected 9 ### Module headers")
    if len(re.findall(r"^## Module kernbegrippen", text, re.M)) != 9:
        raise SystemExit("Port expected 9 module kernbegrippen blocks")


def validate_cock_modules(text: str) -> None:
    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Cocktail expected 9 modules")


def main() -> None:
    print("QA Global Repair Pass")

    # P0-1 Cocktail — verify only (fixed in prior polish pass)
    cock = read_track("COCK")
    validate_cock_modules(cock)
    print("  COCK: module structure OK (9 modules)")

    # P0-2 Rose renumber
    rose = read_track("ROSE")
    rose = repair_rose_lesson_numbers(rose)
    validate_rose_numbers(rose)
    write_track("ROSE", rose)

    # P0-3 Quiz expansion
    for prefix in ("MOUS", "WINE", "ROSE"):
        text = read_track(prefix)
        if prefix == "ROSE":
            text = rose  # already repaired
        text = repair_quizzes(text, prefix)
        lessons = list({k[0] for k in QUIZ_REPLACEMENTS.get(prefix, {})})
        validate_quiz_options(text, prefix, lessons)
        write_track(prefix, text)
        if prefix == "ROSE":
            rose = text

    # P0-4 Port schema
    port = read_track("PORT")
    port = repair_port_schema(port)
    port = repair_port_lessons_41_45(port)
    validate_port_schema(port)
    write_track("PORT", port)

    # P1 Wine 21
    wine = read_track("WINE")
    wine = repair_wine_les_21(wine)
    write_track("WINE", wine)

    # P1 Bier 0.0
    bier0 = read_track("BIER_0_0")
    bier0 = repair_bier_0_0_les_1(bier0)
    write_track("BIER_0_0", bier0)

    # P1 Bio hedging
    bio = read_track("BIO")
    bio = repair_bio_feedback(bio)
    write_track("BIO", bio)

    print("Done.")


if __name__ == "__main__":
    main()
