#!/usr/bin/env python3
"""Generate content/BIO_FINAL_CONTENT.md — final micro-polish pass."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from bio_gold_master_locked_data import (  # noqa: E402
    EXAM_QUIZ_PATCH,
    GOLD_KEY_CONCEPTS_PATCHES,
    PRAKTIJK_OVERRIDES,
    QUIZ_FEEDBACK_PATCHES,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN_PATCHES,
    SLUG_OVERRIDES,
    STANDARD_CHECKLIST,
    TYPO_REPLACEMENTS,
)

SOURCE = ROOT / "content/pipeline/BIO_PIPELINE_CONTENT.md"
OUT = ROOT / "content/BIO_FINAL_CONTENT.md"

MODULE_TRAILER = re.compile(
    r"\n+# Way of Tasting Academy\s*\n## Biodynamic Track[^\n]*\n(### Module \d+ —[^\n]+\n.*)",
    re.S,
)
MODULE_TRAILER_BARE = re.compile(
    r"\n+(### Module \d+ —[^\n]+\n.*)",
    re.S,
)

OBSERVATION_TERMS = frozenset(
    {
        "fruit",
        "tannine",
        "lengte",
        "balans",
        "drinkbaarheid",
        "serveertemperatuur",
        "pairing",
        "decanteertijd",
        "temperatuurtrend",
        "kans op neerslag",
        "weersstabiliteit",
        "luchtdruktrend",
        "hoge luchtdruk",
        "lage luchtdruk",
        "geurintensiteit",
        "openheid",
        "focus",
        "precisie",
        "fruitintensiteit",
        "aromatische openheid",
        "zuurgraad",
        "structuur",
        "groenheid",
        "frisheid",
        "zuren",
        "aromatische spanning",
        "finesse",
        "elegantie",
        "mousse",
        "complexiteit",
        "actief dagtype",
        "wisselmomenten",
        "eventuele nodes",
        "stabielste tijdsblok",
        "hoparoma",
        "bitterheid",
        "body",
    }
)


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"\.{2,}", ".", text)
    text = re.sub(r"[ \t]+$", "", text, flags=re.M)
    text = re.sub(r"  +", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def apply_typos(text: str) -> str:
    for pat, repl in TYPO_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    return text


def polish_display_text(text: str) -> str:
    return apply_typos(micro_format(text))


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def strip_reflectie_from_praktijk(praktijk: str) -> str:
    return re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()


def checklist_items(text: str) -> list[str]:
    return [
        ln.strip()[2:].strip()
        for ln in text.splitlines()
        if ln.strip().startswith("- ")
    ]


def is_observation_checklist(items: list[str]) -> bool:
    if not items:
        return False
    normalized = {re.sub(r"^\[ \] ", "", item).strip().lower() for item in items}
    if normalized <= OBSERVATION_TERMS:
        return True
    return all(
        not item.lower().startswith("ik ")
        and len(item) < 45
        and not item.endswith("?")
        for item in items
    )


def fix_praktijk_prose(text: str) -> str:
    text = re.sub(r"([a-zà-ü])\n(?=[A-Z])", r"\1. ", text)
    text = re.sub(r"\nVergelijk:\s*\n", "\nVergelijk ", text)
    text = re.sub(r"\nAnalyseer:\s*\n", ". Analyseer ", text)
    text = re.sub(r"\nBepaal daarna of je opent of wacht\.?\s*\n", ". Bepaal daarna of je opent of wacht. ", text)
    text = re.sub(r"\nControleer voor je volgende fles:\s*\n", "Controleer vóór je volgende fles ", text)
    text = re.sub(r"\nKies vier dranken:\s*\n", "Kies vier dranken ", text)
    text = re.sub(r"\nKoppel hier één fles uit je voorraad aan\.\s*\n", ". Koppel één fles uit je voorraad aan. ", text)
    text = re.sub(r"\nGebruik hiervoor de biodynamische kalender\.\s*\n", " met de biodynamische kalender. ", text)
    text = re.sub(
        r"(Vergelijk een proefmoment op:)\s*\n\nAnalyseer:",
        "Proef dezelfde wijn op twee momenten met verschillende luchtdruk en analyseer",
        text,
    )
    text = re.sub(
        r"(- [^\n]+)\n(?![-#\n])([A-Z])",
        r"\1\n\n\2",
        text,
    )
    text = re.sub(r"- \[ \] ", "- ", text)
    return text


def normalize_praktijk(num: int, raw: str) -> str:
    if num in PRAKTIJK_OVERRIDES:
        return polish_display_text(PRAKTIJK_OVERRIDES[num])

    text = strip_reflectie_from_praktijk(raw)
    text = fix_praktijk_prose(text)

    if "### Opdracht" not in text:
        text = f"### Opdracht\n\n{text}"

    opdracht_m = re.search(r"(### Opdracht\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if not opdracht_m:
        return polish_display_text(text.rstrip() + "\n\n" + STANDARD_CHECKLIST)

    opdracht_body = opdracht_m.group(2).strip()
    tail = text[opdracht_m.end() :]

    checklist_m = re.search(r"### Checklist\s*\n(.*?)(?=\n### |\Z)", tail, re.S)
    if checklist_m:
        items = checklist_items(checklist_m.group(1))
        if is_observation_checklist(items):
            clean_items = [re.sub(r"^\[ \] ", "", item).strip() for item in items]
            if "noteer" not in opdracht_body.lower() and "analyseer" not in opdracht_body.lower():
                opdracht_body = (
                    f"{opdracht_body.rstrip('.')}. Noteer: {', '.join(clean_items)}."
                )
            elif not opdracht_body.endswith("."):
                opdracht_body = f"{opdracht_body.rstrip('.')}: {', '.join(clean_items)}."
            tail = tail[: checklist_m.start()] + tail[checklist_m.end() :]

    rebuilt = f"### Opdracht\n\n{opdracht_body.strip()}"
    if "### Checklist" not in tail:
        rebuilt = f"{rebuilt}\n\n{STANDARD_CHECKLIST}"
    else:
        checklist_rest = re.search(r"(### Checklist\s*\n.*?)(?=\n### |\Z)", tail, re.S)
        if checklist_rest:
            rebuilt = f"{rebuilt}\n\n{checklist_rest.group(1).strip()}"
        else:
            rebuilt = f"{rebuilt}\n\n{STANDARD_CHECKLIST}"

    return polish_display_text(rebuilt)


def patch_quiz(text: str, lesson_num: int) -> str:
    patches = QUIZ_PATCHES.get(lesson_num)
    if patches:
        for block in re.split(r"(?=### Vraag \d+)", patches):
            m = re.match(r"### Vraag (\d+)\s*\n(.*)", block, re.S)
            if not m:
                continue
            qnum = m.group(1)
            replacement = f"### Vraag {qnum}\n\n{m.group(2).strip()}\n"
            text = re.sub(
                rf"### Vraag {qnum}\s*\n.*?(?=\n### Vraag |\n## |\Z)",
                replacement,
                text,
                count=1,
                flags=re.S,
            )
    if lesson_num == 45:
        for block in re.split(r"(?=### Vraag \d+)", EXAM_QUIZ_PATCH):
            m = re.match(r"### Vraag (\d+)\s*\n(.*)", block, re.S)
            if not m:
                continue
            qnum = m.group(1)
            replacement = f"### Vraag {qnum}\n\n{m.group(2).strip()}\n"
            text = re.sub(
                rf"### Vraag {qnum}\s*\n.*?(?=\n### Vraag |\n## |\Z)",
                replacement,
                text,
                count=1,
                flags=re.S,
            )
    return polish_display_text(text)


def emit_kernbegrippen(terms: list[str]) -> str:
    if len(terms) != 5:
        raise ValueError(f"Expected 5 kernbegrippen, got {len(terms)}: {terms}")
    return "\n".join(f"- {t}" for t in terms)


def peel_trailing_module(body: str) -> tuple[str, str]:
    for pat in (MODULE_TRAILER, MODULE_TRAILER_BARE):
        m = pat.search(body)
        if m:
            return body[: m.start()], m.group(1)
    return body, ""


def polish_module_block(block: str) -> str:
    return polish_display_text(block)


def polish_lesson(num: int, header: str, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)
    header = polish_display_text(header)

    if num in SLUG_OVERRIDES:
        header = re.sub(r" — [^\n]+$", f" — Dynamisch versus strategisch advies", header)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)

    slug = SLUG_OVERRIDES.get(num, slug_m.group(1) if slug_m else "")
    quiz_count = int(quiz_m.group(1)) if quiz_m else 5

    sections: dict[str, str] = {}
    for sec in (
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Drinkmoment & advies",
        "Pro insight",
        "Reflectievraag",
        "Quiz",
        "Quiz-feedback",
    ):
        raw = extract_section(body, sec)
        if raw:
            sections[sec] = polish_display_text(raw)

    praktijk_raw = extract_section(body, "Praktijkopdracht")
    if praktijk_raw:
        sections["Praktijkopdracht"] = normalize_praktijk(num, praktijk_raw)

    if num in REFLECTIEVRAGEN_PATCHES:
        sections["Reflectievraag"] = polish_display_text(REFLECTIEVRAGEN_PATCHES[num])

    if num in QUIZ_FEEDBACK_PATCHES:
        sections["Quiz-feedback"] = polish_display_text(QUIZ_FEEDBACK_PATCHES[num])

    if sections.get("Quiz"):
        sections["Quiz"] = patch_quiz(sections["Quiz"], num)

    if num in GOLD_KEY_CONCEPTS_PATCHES:
        sections["Kernbegrippen (DB field)"] = emit_kernbegrippen(GOLD_KEY_CONCEPTS_PATCHES[num])
    else:
        kc = extract_section(body, "Kernbegrippen (DB field)")
        if kc:
            items = [
                polish_display_text(ln.strip()[2:])
                for ln in kc.splitlines()
                if ln.strip().startswith("- ")
            ]
            if len(items) == 5:
                sections["Kernbegrippen (DB field)"] = emit_kernbegrippen(items)

    lines = [
        header.rstrip(),
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug}",
        f"**Duration:** {dur_m.group(1) if dur_m else '8'} min",
        f"**Quiz questions:** {quiz_count}",
        "",
        "---",
        "",
    ]

    order = [
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Drinkmoment & advies",
        "Pro insight",
        "Praktijkopdracht",
        "Reflectievraag",
        "Quiz",
        "Quiz-feedback",
        "Kernbegrippen (DB field)",
    ]

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            if sec == "Wist-je-dat":
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines), trailer


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les].rstrip()
    header = re.sub(
        r"## Biodynamic Track V2 — Gold Master\n.*?\n---\n",
        "## Biodynamic Track V2 — Gold Master LOCKED\n"
        "### 45 lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master LOCKED (leidende versie)\n"
        "**Bron:** `BIO_TRACK_V2_GOLD_MASTER.md` → `python3 scripts/polish_bio_gold_master_locked.py`\n\n"
        "---\n",
        header,
        count=1,
        flags=re.S,
    )
    mod_m = re.search(r"(### Module 1 —.*)", header, re.S)
    if mod_m:
        header = header[: mod_m.start()] + polish_module_block(mod_m.group(1))
    return header.rstrip() + "\n\n"


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"([^\n])\n(### Wanneer wachten)", r"\1\n\n\2", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 45:
        raise SystemExit("Expected 45 lessons")
    if re.search(r"contentReference|oaicite|TODO|FIXME|repair|placeholder", text, re.I):
        raise SystemExit("Artifacts remain")
    if re.search(r"\bDynamic advice\b|\bStrategic advice\b|dynamic-vs-strategic|\bDynamic en\b|\bStrategic planning\b|\btasting notes\b", text, re.I):
        raise SystemExit("English slug/terminology remains")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")
    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Expected 9 module headers")
    if "dynamisch-vs-strategisch-advies" not in slugs:
        raise SystemExit("LES 20 slug not updated")
    for num in range(1, 46):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if "## Drinkmoment & advies" not in chunk:
            raise SystemExit(f"LES {num}: missing Drinkmoment & advies")
        if "## Pro insight" not in chunk:
            raise SystemExit(f"LES {num}: missing Pro insight")
        praktijk = re.search(r"## Praktijkopdracht\s*\n(.*?)(?=\n## |\Z)", chunk, re.S)
        if not praktijk or "### Opdracht" not in praktijk.group(1):
            raise SystemExit(f"LES {num}: Praktijkopdracht missing ### Opdracht")
        if "### Checklist" not in praktijk.group(1):
            raise SystemExit(f"LES {num}: Praktijkopdracht missing ### Checklist")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if kc:
            items = [ln for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
            if len(items) != 5:
                raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")


def build() -> str:
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        polished, trailer = polish_lesson(les_num, les_header, les_body)
        out_parts.append(polished)
        if trailer:
            out_parts.append("\n" + polish_module_block(trailer) + "\n")
        j += 3

    result = normalize_output("".join(out_parts))
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
