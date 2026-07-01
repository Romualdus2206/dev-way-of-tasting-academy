#!/usr/bin/env python3
"""Build content/archive/intermediate/PORT_TRACK_V2_CANONICAL.md — schone referentiemodel-bron uit ADD + V2-data."""

from __future__ import annotations

import importlib.util
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ADD_PATH = ROOT / "content/archive/repair/PORT_ADD_REPAIR_CONTENT.md"
OUT_PATH = ROOT / "content/archive/intermediate/PORT_TRACK_V2_CANONICAL.md"

from port_v2_curriculum import KEY_CONCEPTS, LEERDOEL_OVERRIDES, LESSONS, MODULES, QUIZ_SUPPLEMENTS  # noqa: E402
from port_v2_custom_lessons import CUSTOM_LESSONS, EXAM_LESSONS  # noqa: E402

CANONICAL_SECTIONS = (
    "Leerdoel",
    "Theorie",
    "Wist-je-dat",
    "Samenvatting",
    "Food pairing",
    "Pro insight",
    "Praktijkopdracht",
    "Reflectievraag",
    "Quiz",
    "Quiz-feedback",
    "Kernbegrippen (DB field)",
)

FORBIDDEN_PATTERNS = (
    r"PORT_MODULE_\d+",
    r"Nieuwe quizvraag",
    r"Nieuwe scenario-vraag",
    r"Vervang quizvraag",
    r"Premium repair",
    r"^TOEVOEGEN:",
)


def load_repairs() -> dict[int, dict]:
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
        for k, v in getattr(mod, attr, {}).items():
            repairs[int(k)] = v
    return repairs


def scrub_artifacts(text: str) -> str:
    if not text:
        return ""
    text = re.sub(r"^# PORT_MODULE[^\n]*\n+", "", text, flags=re.M)
    text = re.sub(
        r"^# Way of Tasting Academy\s*\n## Port Track[^\n]*\n(?:### [^\n]+\n+)?",
        "",
        text,
        flags=re.M,
    )
    text = re.sub(r"^## Premium repair:?\s*\n", "", text, flags=re.M)
    text = re.sub(r"^### Theorie (?:vervangen|verdieping)[^\n]*\n", "", text, flags=re.M)
    text = re.sub(r"^TOEVOEGEN:\s*\n", "", text, flags=re.M)
    text = re.sub(
        r"^Vervang quizvraag[^\n]*\n.*?(?=\n## |\n# |\Z)",
        "",
        text,
        flags=re.S | re.M,
    )
    text = re.sub(
        r"^Nieuwe (?:quiz|scenario)-?vraag:.*?(?=\n## |\n# |\Z)",
        "",
        text,
        flags=re.S | re.M,
    )
    text = re.sub(
        r"^## Exam tip\s*\n.*?(?=\n## |\n# |\Z)",
        "",
        text,
        flags=re.S | re.M,
    )
    text = re.sub(r"\n---\s*$", "", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def parse_add_file(text: str) -> dict[int, str]:
    text = scrub_artifacts(text)
    out: dict[int, str] = {}
    parts = re.split(r"(^# LES (\d+) — .+$)", text, flags=re.M)
    i = 1
    while i < len(parts):
        if i + 2 >= len(parts):
            break
        num = int(parts[i + 1])
        out[num] = scrub_artifacts(parts[i + 2])
        i += 3
    return out


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    if not m:
        return ""
    return scrub_artifacts(m.group(1))


def extract_exam_tip_inline(body: str) -> str:
    m = re.search(
        r"## Exam tip\s*\n(.*?)(?=\n## |\n# |\nNieuwe |\nVervang |\Z)",
        body,
        re.S,
    )
    return scrub_artifacts(m.group(1)) if m else ""


def parse_add_lesson(body: str) -> dict[str, str]:
    body = scrub_artifacts(body)
    data: dict[str, str] = {}
    for sec in CANONICAL_SECTIONS:
        val = extract_section(body, sec)
        if val:
            data[sec] = val

    exam = extract_exam_tip_inline(body)
    if exam:
        pi = data.get("Pro insight", "")
        anchor = normalize_pro_insight(f"**Examenanker:** {exam}")
        data["Pro insight"] = f"{pi}\n\n{anchor}".strip() if pi else anchor

    if not data.get("Quiz"):
        quiz = extract_section(body, "Quiz")
        if quiz:
            data["Quiz"] = quiz

    return data


def repair_to_sections(entry: dict) -> dict[str, str]:
    out: dict[str, str] = {}
    mapping = {
        "leerdoel": "Leerdoel",
        "theorie": "Theorie",
        "wist_je_dat": "Wist-je-dat",
        "samenvatting": "Samenvatting",
        "praktijk": "Praktijkopdracht",
        "quiz": "Quiz",
        "quiz_feedback": "Quiz-feedback",
    }
    for src, dst in mapping.items():
        if entry.get(src):
            out[dst] = scrub_artifacts(entry[src])
    if entry.get("food_pairing"):
        out["Food pairing"] = scrub_artifacts(entry["food_pairing"])
    if entry.get("pro_insight"):
        out["Pro insight"] = scrub_artifacts(entry["pro_insight"])
    return out


def split_praktijk_reflectie(praktijk: str) -> tuple[str, str]:
    praktijk = scrub_artifacts(praktijk)
    m = re.search(r"(### Reflectievraag\s*\n)(.+?)(?=\n### |\Z)", praktijk, re.S)
    if not m:
        return praktijk.strip(), ""
    reflectie = m.group(2).strip()
    praktijk_clean = praktijk[: m.start()].strip()
    return praktijk_clean, reflectie


def quiz_question_count(quiz: str) -> int:
    return len(re.findall(r"^### Vraag", quiz, re.M))


def pick_quiz(*candidates: str) -> str:
    best, best_n = "", 0
    for c in candidates:
        if not c:
            continue
        n = quiz_question_count(c)
        if n > best_n:
            best, best_n = c, n
    return scrub_artifacts(best)


def merge_add_repair(add: dict[str, str], repair: dict[str, str]) -> dict[str, str]:
    merged = dict(repair)
    for key in ("Theorie", "Leerdoel", "Food pairing", "Pro insight", "Quiz-feedback"):
        if add.get(key):
            merged[key] = add[key]
    for key in ("Wist-je-dat", "Samenvatting", "Praktijkopdracht"):
        if add.get(key):
            merged[key] = add[key]
        elif not merged.get(key) and repair.get(key):
            merged[key] = repair[key]
    merged["Quiz"] = pick_quiz(add.get("Quiz", ""), repair.get("Quiz", ""))
    return merged


def custom_to_sections(entry: dict) -> dict[str, str]:
    return {
        k: scrub_artifacts(v)
        for k, v in {
            "Leerdoel": entry.get("leerdoel", ""),
            "Theorie": entry.get("theorie", ""),
            "Wist-je-dat": entry.get("wist_je_dat", ""),
            "Samenvatting": entry.get("samenvatting", ""),
            "Food pairing": entry.get("food_pairing", ""),
            "Pro insight": entry.get("pro_insight", ""),
            "Praktijkopdracht": entry.get("praktijk", ""),
            "Reflectievraag": entry.get("reflectie", ""),
            "Quiz": entry.get("quiz", ""),
            "Quiz-feedback": entry.get("quiz_feedback", ""),
        }.items()
        if v
    }


def normalize_flowing_prose(text: str) -> str:
    """Choppy ADD-lines → doorlopende premium-alinea's."""
    text = scrub_artifacts(text)
    if not text or text.strip().startswith("-"):
        return text
    if "### Beste pairing" in text or "### Opdracht" in text:
        return text

    blocks = re.split(r"\n\n+", text)
    out: list[str] = []
    buf: list[str] = []

    def flush_buf() -> None:
        if not buf:
            return
        sentence = " ".join(s.strip() for s in buf if s.strip())
        if sentence:
            out.append(sentence)
        buf.clear()

    for block in blocks:
        block = block.strip()
        if not block:
            continue
        if block.startswith("**") or block.startswith("#") or block.startswith("-"):
            flush_buf()
            out.append(block)
            continue
        lines = [ln.strip() for ln in block.splitlines() if ln.strip()]
        if len(lines) == 1:
            flush_buf()
            out.append(lines[0])
            continue
        for ln in lines:
            if ln.endswith("?") and len(ln) < 60:
                flush_buf()
                out.append(ln)
            elif len(ln) < 70 and not ln.endswith((".", ":", "?", "!", "»")):
                buf.append(ln)
            else:
                if buf:
                    buf.append(ln)
                    flush_buf()
                else:
                    out.append(ln)
    flush_buf()
    return "\n\n".join(out)


def normalize_pro_insight(text: str) -> str:
    text = scrub_artifacts(text)
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    if not lines:
        return text
    merged: list[str] = []
    buf: list[str] = []
    for ln in lines:
        if ln.startswith("**"):
            if buf:
                merged.append(" ".join(buf))
                buf = []
            merged.append(ln)
            continue
        if len(ln) < 55 and ("=" in ln or ln.endswith("?")):
            buf.append(ln.rstrip("."))
        else:
            buf.append(ln)
    if buf:
        merged.append(". ".join(s.rstrip(".") for s in buf) + ".")
    return "\n\n".join(normalize_flowing_prose(p) for p in merged)


def normalize_quiz(text: str) -> str:
    text = scrub_artifacts(text)
    text = re.sub(r"^#### Vraag", "### Vraag", text, flags=re.M)
    text = re.sub(r"\n---\n(?=### Vraag )", "\n", text)
    return text.strip()


def bullets_from_theory(theory: str) -> str:
    parts = [p.strip() for p in re.split(r"\n\n+", theory) if p.strip() and not p.startswith("**")]
    lines: list[str] = []
    for p in parts[:5]:
        line = re.sub(r"\s+", " ", p)
        if len(line) > 110:
            line = line[:107] + "..."
        if not line.startswith("-"):
            line = f"- {line}"
        lines.append(line)
    while len(lines) < 5:
        lines.append(f"- Kernpunt uit deze les ({len(lines) + 1}/5)")
    return "\n".join(lines[:5])


def default_leerdoel(title: str) -> str:
    return (
        f"Na deze les kun jij {title.lower()} uitleggen en toepassen "
        f"in proef, service of gastadvies."
    )


def default_praktijk(title: str) -> str:
    return (
        f"### Opdracht\n\n"
        f"Pas de kennis uit «{title}» toe op een fles uit je kelder of een kaart. "
        f"Noteer je bevindingen in de Way of Tasting-app.\n\n"
        f"### Checklist\n\n"
        f"- [ ] Ik kan de kern van deze les samenvatten\n"
        f"- [ ] Ik heb een praktisch voorbeeld geanalyseerd\n"
        f"- [ ] Ik kan een onderbouwd advies geven"
    )


def default_food_pairing() -> str:
    return (
        "### Beste pairing\n\n"
        "Kies op basis van stijl en moment uit deze les.\n\n"
        "### Waarom dit werkt\n\n"
        "Port vraagt om zoet-zout- of structuurmatch — niet willekeur.\n\n"
        "### Vermijd\n\n"
        "Pairing zonder stijlkeuze of serveertemperatuur."
    )


def default_pro_insight() -> str:
    return (
        "Professioneel adviseren begint bij context: moment, gerecht en ervaring van de gast — "
        "niet bij je eigen favoriete fles."
    )


def polish_sections(sections: dict[str, str], *, no_quiz: bool) -> dict[str, str]:
    out = {k: scrub_artifacts(v) for k, v in sections.items() if v}

    if out.get("Praktijkopdracht"):
        p, r = split_praktijk_reflectie(out["Praktijkopdracht"])
        out["Praktijkopdracht"] = p
        if r and not out.get("Reflectievraag"):
            out["Reflectievraag"] = r
        elif r and out.get("Reflectievraag"):
            pass  # keep standalone Reflectievraag; drop duplicate in praktijk

    if out.get("Theorie"):
        out["Theorie"] = normalize_flowing_prose(out["Theorie"])
    if out.get("Pro insight"):
        out["Pro insight"] = normalize_pro_insight(out["Pro insight"])
    if out.get("Quiz"):
        out["Quiz"] = normalize_quiz(out["Quiz"])

    return out


def emit_lesson(
    num: int,
    title: str,
    slug: str,
    duration: int,
    sections: dict[str, str],
    *,
    no_quiz: bool,
) -> str:
    terms = KEY_CONCEPTS.get(num, [])
    if not sections.get("Samenvatting") and sections.get("Theorie"):
        sections["Samenvatting"] = bullets_from_theory(sections["Theorie"])

    sections.setdefault("Wist-je-dat", "De Douro is sinds 1756 een van 's werelds eerste beschermde wijnregio's.")
    sections.setdefault("Food pairing", default_food_pairing())
    sections.setdefault("Pro insight", default_pro_insight())

    quiz_n = 0 if no_quiz else 5

    lines = [
        f"# LES {num} — {title}",
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug}",
        f"**Duration:** {duration} min",
        f"**Quiz questions:** {quiz_n}",
        "",
        "---",
        "",
    ]

    order: tuple[str, ...] = (
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Food pairing",
        "Pro insight",
        "Praktijkopdracht",
        "Reflectievraag",
    )
    if not no_quiz:
        order += ("Quiz",)
    order += ("Quiz-feedback", "Kernbegrippen (DB field)")

    for name in order:
        content = sections.get(name, "").strip()
        if not content and name == "Kernbegrippen (DB field)":
            content = "\n".join(f"- {t}" for t in terms)
        if not content:
            raise SystemExit(f"LES {num}: ontbrekende sectie {name}")
        lines.extend([f"## {name}", "", content, "", "---", ""])

    return "\n".join(lines).rstrip() + "\n\n"


def build() -> str:
    add_text = ADD_PATH.read_text(encoding="utf-8")
    add_bodies = parse_add_file(add_text)
    repairs = load_repairs()

    header = """# Way of Tasting Academy
## Port Track V2 — Referentiemodel
### 45 lessen · 9 modules · unieke slugs

**Versie:** V2 Referentiemodel  
**Rebuild:** `python3 scripts/build_port_track_v2_final.py`

---

"""
    chunks = [header]

    for mod in MODULES:
        chunks.append(
            f"# MODULE {mod['num']} — {mod['title']}\n\n"
            f"**Module slug:** `{mod['slug']}`  \n"
            f"**Level:** {mod['level'].title()}  \n"
            f"**Module goal:** {mod['goal']}\n\n"
            "---\n\n"
        )
        for les in [l for l in LESSONS if mod["start"] <= l["num"] <= mod["end"]]:
            num = les["num"]
            sections: dict[str, str] = {}

            if les.get("custom"):
                sections = custom_to_sections(CUSTOM_LESSONS[num])
            elif les.get("add_merge"):
                sections = custom_to_sections(CUSTOM_LESSONS[28])
            else:
                add_num = les.get("add", num)
                add_parsed = parse_add_lesson(add_bodies.get(add_num, ""))
                repair_parsed = repair_to_sections(repairs.get(num, {}))
                if num == 1 and add_parsed.get("Theorie"):
                    sections = add_parsed
                elif add_parsed.get("Theorie"):
                    sections = dict(add_parsed)
                    rq = repair_parsed.get("Quiz", "")
                    if quiz_question_count(rq) > quiz_question_count(sections.get("Quiz", "")):
                        sections["Quiz"] = rq
                    for key in ("Samenvatting", "Wist-je-dat", "Praktijkopdracht", "Quiz-feedback"):
                        if not sections.get(key) and repair_parsed.get(key):
                            sections[key] = repair_parsed[key]
                elif repair_parsed:
                    sections = merge_add_repair(add_parsed, repair_parsed)
                elif add_parsed:
                    sections = add_parsed

            if num in EXAM_LESSONS:
                ex = EXAM_LESSONS[num]
                if ex.get("leerdoel"):
                    sections["Leerdoel"] = ex["leerdoel"]
                if ex.get("theorie"):
                    sections["Theorie"] = ex["theorie"]
                if ex.get("praktijk"):
                    sections["Praktijkopdracht"] = ex["praktijk"]
                if ex.get("reflectie"):
                    sections["Reflectievraag"] = ex["reflectie"]
                if ex.get("quiz_feedback"):
                    sections["Quiz-feedback"] = ex["quiz_feedback"]

            if not sections.get("Theorie") and repairs.get(num):
                sections = merge_add_repair(sections, repair_to_sections(repairs[num]))

            sections["Leerdoel"] = (
                LEERDOEL_OVERRIDES.get(num)
                or sections.get("Leerdoel")
                or default_leerdoel(les["title"])
            )
            sections.setdefault("Praktijkopdracht", default_praktijk(les["title"]))
            sections.setdefault(
                "Reflectievraag",
                f"Hoe pas jij «{les['title']}» morgen toe in een echt proef- of serveermoment?",
            )
            sections.setdefault(
                "Quiz-feedback",
                f"Sterk. Je beheerst een essentieel onderdeel van {les['title'].lower()} — "
                f"de volgende les bouwt hierop voort.",
            )

            if not les.get("no_quiz"):
                if quiz_question_count(sections.get("Quiz", "")) < 5:
                    if num in QUIZ_SUPPLEMENTS:
                        sections["Quiz"] = QUIZ_SUPPLEMENTS[num]
                    elif repairs.get(num, {}).get("quiz"):
                        sections["Quiz"] = repairs[num]["quiz"]
                if quiz_question_count(sections.get("Quiz", "")) < 5:
                    raise SystemExit(f"LES {num}: quiz heeft minder dan 5 vragen")

            sections = polish_sections(sections, no_quiz=bool(les.get("no_quiz")))

            chunks.append(
                emit_lesson(
                    num,
                    les["title"],
                    les["slug"],
                    les["duration"],
                    sections,
                    no_quiz=bool(les.get("no_quiz")),
                )
            )

    return "\n".join(chunks)


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 45:
        raise SystemExit("Expected 45 lessons")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit(f"Duplicate slugs: {[s for s in slugs if slugs.count(s) > 1]}")

    for pat in FORBIDDEN_PATTERNS:
        if re.search(pat, text, re.M):
            raise SystemExit(f"Forbidden pattern still present: {pat}")

    for m in re.finditer(r"^# LES (\d+) — .+?\n(.*?)(?=^# LES \d+ —|^# MODULE |\Z)", text, re.S | re.M):
        num = m.group(1)
        body = m.group(2)
        if body.count("## Reflectievraag") > 1:
            raise SystemExit(f"LES {num}: dubbele Reflectievraag-sectie")
        if "### Reflectievraag" in extract_section(body, "Praktijkopdracht"):
            raise SystemExit(f"LES {num}: Reflectievraag nog in Praktijkopdracht")
        headers = re.findall(r"^## ([^\n]+)", body, re.M)
        expected = [
            "Metadata",
            "Leerdoel",
            "Theorie",
            "Wist-je-dat",
            "Samenvatting",
            "Food pairing",
            "Pro insight",
            "Praktijkopdracht",
            "Reflectievraag",
        ]
        if num not in ("15", "42", "45"):
            expected += ["Quiz"]
        expected += ["Quiz-feedback", "Kernbegrippen (DB field)"]
        if headers != expected:
            raise SystemExit(f"LES {num}: structuur afwijkend\n  got: {headers}\n  exp: {expected}")


def main() -> int:
    out = build()
    validate(out)
    OUT_PATH.write_text(out, encoding="utf-8")
    print(f"Wrote {OUT_PATH.name} ({len(out.splitlines())} lines, 45 lessons)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
