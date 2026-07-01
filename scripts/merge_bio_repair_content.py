#!/usr/bin/env python3
"""Merge content/archive/repair/BIO_REPAIR_CONTENT.md into content/archive/legacy/BIO_MODULES.md."""

from __future__ import annotations

import importlib.util
import re
import subprocess
import unicodedata
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
REPAIR_PATH = ROOT / "content/archive/repair/BIO_REPAIR_CONTENT.md"
MODULES_PATH = ROOT / "content/archive/legacy/BIO_MODULES.md"

CONTENT_SECTIONS = (
    "Leerdoel",
    "Theorie",
    "Wist-je-dat",
    "Samenvatting",
    "Praktijkopdracht",
)

TITLE_OVERRIDE: dict[int, str] = {
    34: "Voorraadstrategie voor topflessen",
    35: "Reserves en lange termijn denken",
    36: "Vertical tasting en biodynamiek",
    37: "Blindproeven en timing",
    38: "Grote flessen en biodynamiek",
    39: "Pairing en dagtypes",
    40: "Je eigen biodynamische systeem bouwen",
    41: "Het perfecte drinkmoment herkennen",
    42: "Timing versus kwaliteit",
    43: "Jouw persoonlijke voorkeurspatronen",
    44: "Open examen",
    45: "Biodynamisch meesterschap",
}

SLUG_OVERRIDE: dict[int, str] = {
    34: "voorraadstrategie-topflessen",
    35: "reserves-lange-termijn",
    36: "vertical-tasting-biodynamiek",
    37: "blindproeven-timing",
    38: "grote-flessen-biodynamiek",
    39: "pairing-dagtypes",
    40: "eigen-biodynamisch-systeem",
    41: "perfect-drinkmoment-herkennen",
    42: "timing-versus-kwaliteit",
    43: "persoonlijke-voorkeurspatronen",
    44: "open-examen-biodynamisch",
    45: "biodynamisch-meesterschap",
}

QUIZ_LESSON_41 = """### Vraag 1

Wat kenmerkt een perfect drinkmoment?

A. Meerdere factoren vallen samen ✅  
B. Alleen een hoge prijs  
C. Willekeurige timing  
D. Alleen het juiste glas

### Vraag 2

Welke factor hoort niet bij een topmoment?

A. Alleen etiketkleur ✅  
B. Drinkvenster  
C. Dagtype  
D. Weersstabiliteit

### Vraag 3

Waarom is context belangrijk?

A. Expressie hangt ook van moment af ✅  
B. Wijn verandert nooit  
C. Alleen pairing telt  
D. Kalender is optioneel

### Vraag 4

Wat doen ervaren sommeliers vooral goed?

A. Herkennen wannér iets op zijn best is ✅  
B. Alleen veel flessen kopen  
C. Altijd direct openen  
D. Dagtypes negeren

### Vraag 5

Wat is het doel van deze les?

A. Topmomenten herkennen en plannen ✅  
B. Alleen theorie-examen halen  
C. Blindproeven vermijden  
D. Voorraad minimaliseren"""

QUIZ_LESSON_42 = """### Vraag 1

Wat doet timing met kwaliteit?

A. Ontsluit potentieel ✅  
B. Vervangt kwaliteit  
C. Maakt wijn zoeter  
D. Verlaagt altijd tannine

### Vraag 2

Wat kan op een minder gunstig moment gebeuren?

A. Topwijn presteert onder verwachting ✅  
B. Wijn wordt permanent slecht  
C. Alcohol verdwijnt  
D. Kurk breekt altijd

### Vraag 3

Wat is de juiste houding?

A. Kwaliteit en moment zijn verbonden ✅  
B. Alleen prijs telt  
C. Timing is onbelangrijk  
D. Alleen blindproeven telt

### Vraag 4

Wat analyseer je in de praktijkopdracht?

A. Balans, plezier en expressie ✅  
B. Alleen alcoholpercentage  
C. Alleen flesvorm  
D. Alleen jaartal

### Vraag 5

Wat is memorabiliteit?

A. Hoe onvergetelijk een ervaring voelt ✅  
B. Het etiketontwerp  
C. De kurklengte  
D. De glasvorm"""

QUIZ_LESSON_43 = """### Vraag 1

Waarom verschillen voorkeuren per proever?

A. Smaak en dagtype-respons zijn persoonlijk ✅  
B. Iedereen proeft identiek  
C. Alleen prijs verschilt  
D. Kalender is voor iedereen gelijk

### Vraag 2

Wat helpt bij persoonlijke stijl?

A. Eigen patronen herkennen ✅  
B. Alleen scores van anderen volgen  
C. Nooit vergelijken  
D. Dagtypes vermijden

### Vraag 3

Wat noteer je in de praktijkopdracht?

A. Favoriete en minst favoriete dagtype ✅  
B. Alleen kurkleverancier  
C. Alleen serveertemperatuur  
D. Alleen winkelprijs

### Vraag 4

Wat betekent individuele stijl hier?

A. Theorie toegepast op jouw smaak ✅  
B. Blind kopiëren van experts  
C. Geen observatie  
D. Alleen wiskunde

### Vraag 5

Wat is het einddoel?

A. Bewuster kiezen op basis van eigen patronen ✅  
B. Minder proeven  
C. Geen voorraad bijhouden  
D. Kalender negeren"""


def load_merge_helpers():
    spec = importlib.util.spec_from_file_location(
        "merge_academy_add", ROOT / "scripts/merge_academy_add.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_theory_exam_quiz_from_git() -> str:
    try:
        text = subprocess.check_output(
            ["git", "show", "HEAD:content/archive/legacy/BIO_MODULES.md"],
            cwd=ROOT,
            text=True,
            stderr=subprocess.DEVNULL,
        )
    except (subprocess.CalledProcessError, FileNotFoundError):
        return ""
    for chunk in re.split(r"(?=^# LES \d+ — )", text, flags=re.M):
        if chunk.startswith("# LES 41 — Theorie-examen"):
            return extract_section(chunk, "Quiz")
    return ""


SECTION_INSERT_ANCHORS: dict[str, list[str]] = {
    "Leerdoel": ["Metadata"],
    "Theorie": ["Leerdoel"],
    "Wist-je-dat": ["Theorie"],
    "Samenvatting": ["Wist-je-dat", "Theorie"],
    "Praktijkopdracht": ["Samenvatting", "Wist-je-dat", "Theorie", "Leerdoel"],
}


def slugify(title: str) -> str:
    text = unicodedata.normalize("NFKD", title).encode("ascii", "ignore").decode()
    text = re.sub(r"[^a-z0-9]+", "-", text.lower())
    return text.strip("-")[:64]


def extract_section(body: str, name: str) -> str:
    m = re.search(rf"^## {re.escape(name)}\s*\n(.*?)(?=^## |\Z)", body, re.M | re.S)
    if not m:
        return ""
    text = m.group(1).strip()
    text = re.sub(r"(?:\n---\s*)+$", "", text)
    return text.strip()


def parse_repair_lessons(text: str) -> dict[int, dict[str, str]]:
    header, lessons = load_merge_helpers().split_lessons(text)
    out: dict[int, dict[str, str]] = {}
    for title, body in lessons:
        m = re.match(r"# LES (\d+) — ", title)
        if not m:
            continue
        num = int(m.group(1))
        sections = {name: extract_section(body, name) for name in CONTENT_SECTIONS}
        sections["_title"] = title.split("—", 1)[1].strip()
        out[num] = sections
    return out


def patch_lesson_title(title_line: str, num: int, repair_title: str) -> str:
    new_title = TITLE_OVERRIDE.get(num, repair_title)
    return f"# LES {num} — {new_title}"


def patch_metadata(body: str, num: int) -> str:
    slug = SLUG_OVERRIDE.get(num)
    if not slug:
        return body

    duration = "8 min"
    quiz_count = "5"
    if num == 44:
        duration = "20 min"
        quiz_count = "20"
    elif num == 45:
        duration = "15 min"
        quiz_count = "0"
    elif num in (42, 43):
        duration = "8 min"
        quiz_count = "5"

    def repl(_: re.Match[str]) -> str:
        return (
            "## Metadata\n\n"
            f"**Slug:** {slug}  \n"
            f"**Duration:** {duration}  \n"
            f"**Quiz questions:** {quiz_count}\n"
        )

    return re.sub(r"^## Metadata\s*\n.*?(?=\n---|\n## |\Z)", repl, body, count=1, flags=re.M | re.S)


def remove_section(body: str, name: str) -> str:
    pattern = rf"^## {re.escape(name)}\s*\n.*?(?=^## |\Z)"
    return re.sub(pattern, "", body, count=1, flags=re.M | re.S)


def apply_repair_to_lesson(
    title: str,
    body: str,
    num: int,
    repair: dict[str, str],
    helpers,
) -> tuple[str, str]:
    core, tail = helpers.split_body_tail(body)
    new_title = patch_lesson_title(title, num, repair["_title"])

    for section in CONTENT_SECTIONS:
        if not repair.get(section):
            continue
        if re.search(rf"^## {re.escape(section)}\s*\n", core, re.M):
            core = helpers.replace_section(core, section, repair[section])
        else:
            core = helpers.insert_after_any(
                core,
                SECTION_INSERT_ANCHORS.get(section, ["Theorie"]),
                section,
                repair[section],
            )

    if num in TITLE_OVERRIDE:
        core = patch_metadata(core, num)

    if num == 41:
        core = remove_section(core, "Examenstructuur")
        core = helpers.replace_section(core, "Quiz", QUIZ_LESSON_41)

    if num in (42, 43):
        for orphan in ("Checklist", "Reflectievraag", "Beoordeling"):
            if re.search(rf"^## {orphan}\s*\n", core, re.M):
                core = remove_section(core, orphan)
        quiz = QUIZ_LESSON_42 if num == 42 else QUIZ_LESSON_43
        if re.search(r"^## Quiz\s*\n", core, re.M):
            core = helpers.replace_section(core, "Quiz", quiz)
        else:
            core = helpers.insert_after_section(core, "Praktijkopdracht", "Quiz", quiz)

    if num == 44:
        for orphan in ("Reflectievraag", "Beoordeling"):
            if re.search(rf"^## {orphan}\s*\n", core, re.M):
                core = remove_section(core, orphan)
        exam = repair.get("Quiz") or load_theory_exam_quiz_from_git()
        if exam:
            if re.search(r"^## Quiz\s*\n", core, re.M):
                core = helpers.replace_section(core, "Quiz", exam)
            else:
                core = helpers.insert_after_section(core, "Praktijkopdracht", "Quiz", exam)

    return new_title, core + tail


def main() -> int:
    helpers = load_merge_helpers()
    repair = parse_repair_lessons(REPAIR_PATH.read_text(encoding="utf-8"))
    if len(repair) != 45:
        raise SystemExit(f"Expected 45 repair lessons, found {len(repair)}")

    header, lessons = helpers.split_lessons(MODULES_PATH.read_text(encoding="utf-8"))
    merged = 0
    new_lessons: list[tuple[str, str]] = []
    theory_exam_quiz = load_theory_exam_quiz_from_git()

    for idx, (title, body) in enumerate(lessons, start=1):
        if idx not in repair:
            new_lessons.append((title, body))
            continue
        patch = dict(repair[idx])
        if idx == 44 and theory_exam_quiz:
            patch["Quiz"] = theory_exam_quiz
        new_title, new_body = apply_repair_to_lesson(title, body, idx, patch, helpers)
        new_lessons.append((new_title, new_body))
        merged += 1

    MODULES_PATH.write_text(helpers.join_lessons(header, new_lessons), encoding="utf-8")
    print(f"Merged {merged} lessons into {MODULES_PATH.name}")

    rebuild = ROOT / "scripts/rebuild_bio_track.py"
    if rebuild.exists():
        subprocess.run(["python3", str(rebuild)], cwd=ROOT, check=True)
        print("Rebuilt supabase/seed/academy_biodynamic.sql")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
