#!/usr/bin/env python3
"""Generate content/pipeline/WHITE_PIPELINE_CONTENT.md from WIT_MODULES.md + premium data."""

from __future__ import annotations

import importlib.util
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

SOURCE = ROOT / "content/archive/legacy/WIT_MODULES.md"
OUT = ROOT / "content/pipeline/WHITE_PIPELINE_CONTENT.md"

DATA_MODULES = (
    "wit_v2_gold_master_data_m1_m2",
    "wit_v2_gold_master_data_m3_m5",
    "wit_v2_gold_master_data_m6_m9",
)

SECTION_INSERT_AFTER = {
    "Samenvatting": ["Wist-je-dat", "Theorie"],
    "Food pairing": ["Samenvatting", "Wist-je-dat", "Theorie"],
    "Pro insight": ["Food pairing", "Samenvatting", "Wist-je-dat", "Theorie"],
    "Theorie": ["Leerdoel"],
    "Wist-je-dat": ["Theorie", "Leerdoel"],
    "Reflectievraag": ["Praktijkopdracht", "Pro insight", "Food pairing", "Samenvatting"],
    "Quiz": ["Reflectievraag", "Praktijkopdracht"],
    "Quiz-feedback": ["Quiz", "Reflectievraag", "Praktijkopdracht"],
}

MODULE_TRAILER = re.compile(
    r"\n+(### Module \d+ —[^\n]+\n.*)",
    re.S,
)

GENERIC_KERNBEGRIPPEN = frozenset(
    {
        "wijn",
        "smaak",
        "goed",
        "stijl",
        "balans",
        "fris",
        "rijk",
        "zuur",
        "aroma",
        "proeven",
        "analyseren",
        "integratie",
    }
)

ARTIFACT_SECTIONS = (
    "Toetsvragen",
    "Theorie-examen",
    "Praktijkexamen",
    "Eindcertificering",
)


def load_repairs() -> dict[int, dict]:
    repairs: dict[int, dict] = {}
    for name in DATA_MODULES:
        path = ROOT / "scripts" / f"{name}.py"
        spec = importlib.util.spec_from_file_location(name, path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        repairs.update(getattr(mod, "REPAIRS"))
    return repairs


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"\.{2,}", ".", text)
    text = re.sub(r"[ \t]+$", "", text, flags=re.M)
    text = re.sub(r"  +", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    text = re.sub(r"✅[ \t]+", "✅", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    if not m:
        return ""
    content = m.group(1).strip()
    return re.sub(r"\n---\s*$", "", content).strip()


def replace_section(body: str, name: str, content: str) -> str:
    block = f"## {name}\n\n{content.strip()}\n"
    if re.search(rf"## {re.escape(name)}\s*\n", body):
        return re.sub(
            rf"## {re.escape(name)}\s*\n.*?(?=\n## |\Z)",
            block,
            body,
            count=1,
            flags=re.S,
        )
    for anchor in SECTION_INSERT_AFTER.get(name, []):
        m = re.search(rf"(## {re.escape(anchor)}\s*\n.*?)(?=\n## |\Z)", body, re.S)
        if m:
            return body[: m.end(1)] + "\n\n---\n\n" + block + body[m.end(1) :]
    raise ValueError(f"Cannot insert section {name}")


def patch_quiz(text: str, patches: str | dict[int, str]) -> str:
    if isinstance(patches, dict):
        blocks = patches.values()
    else:
        blocks = re.split(r"(?=### Vraag \d+)", patches)
    for block in blocks:
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
    return micro_format(text)


def strip_reflectie_from_praktijk(praktijk: str) -> str:
    return re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()


def normalize_praktijk(praktijk: str, leerdoel: str) -> str:
    text = praktijk.strip()
    if not text:
        return text
    if re.search(r"^### Examenonderdeel", text, re.M):
        if "### Checklist" not in text:
            checklist = (
                "- Ik heb alle drie examenonderdelen volledig afgerond\n"
                "- Ik documenteerde mijn blindhypotheses vóór de onthulling\n"
                "- Ik motiveerde elk pairing via zuur, vet of capsaïcine\n"
                "- Ik noteerde mijn score en zwakste onderdeel\n"
                "- Ik kan mijn keuzes mondeling verdedigen"
            )
            text = f"{text.rstrip()}\n\n### Checklist\n\n{checklist}"
        return re.sub(r"\n---\s*$", "", text.rstrip())
    if "### Opdracht" not in text:
        lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
        body = "\n\n".join(lines[1:]) if len(lines) > 1 else ""
        text = f"### Opdracht\n\n{lines[0]}"
        if body and "### Checklist" not in body:
            text += f"\n\n{body}"
    if "### Checklist" in text:
        return text
    opdracht_m = re.search(r"### Opdracht\s*\n+(.*?)(?=\n### |\Z)", text, re.S)
    opdracht = opdracht_m.group(1).strip() if opdracht_m else leerdoel
    items: list[str] = []
    if re.search(r"\b(drie|3|twee|2|vier|4|vijf|5)\b", opdracht, re.I):
        n = re.search(r"\b(drie|3|twee|2|vier|4|vijf|5)\b", opdracht, re.I)
        label = n.group(1).lower() if n else "drie"
        if label in {"3", "drie"}:
            label = "drie"
        elif label in {"2", "twee"}:
            label = "twee"
        items.append(f"Ik heb minstens {label} concrete punten genoteerd")
    if re.search(r"\b(blind|vergelijk|naast elkaar)\b", opdracht, re.I):
        items.extend(
            [
                "Ik proefde zonder etiket of met afgeschermde flessen",
                "Ik noteerde zuur, body en aroma vóór mijn conclusie",
            ]
        )
    if re.search(r"\b(noteer|analyseer|beschrijf|leg uit)\b", opdracht, re.I):
        items.append("Ik schreef mijn observaties gestructureerd op")
    if re.search(r"\b(server|serveer|temperatuur|glas)\b", opdracht, re.I):
        items.append("Ik koppelde mijn keuze aan servicecontext (glas en temperatuur)")
    if re.search(r"\b(pair|eten|gerecht|menu)\b", opdracht, re.I):
        items.append("Ik motiveerde de pairing via zuur, textuur of ziltigheid")
    if not items:
        items = [
            "Ik voerde de opdracht volledig uit",
            "Ik koppelde mijn bevindingen aan het leerdoel van deze les",
            "Ik kan mijn keuze mondeling verdedigen",
        ]
    checklist = "\n".join(f"- {item}" for item in items[:5])
    text = re.sub(r"\n---\s*$", "", text.rstrip())
    return f"{text}\n\n### Checklist\n\n{checklist}"


def strip_repair_artifacts(body: str) -> str:
    body = re.sub(
        r"\n# WHITE_MODULE_\d+\.md\s*\n.*?(?=\n### Module \d+ —|\Z)",
        "\n",
        body,
        flags=re.S,
    )
    for sec in ARTIFACT_SECTIONS:
        body = re.sub(
            rf"\n## {re.escape(sec)}\s*\n.*?(?=\n## |\Z)",
            "\n",
            body,
            flags=re.S,
        )
    body = re.sub(r":contentReference\[.*?\]", "", body)
    return body


def peel_trailing_module(body: str) -> tuple[str, str]:
    m = MODULE_TRAILER.search(body)
    if m:
        return body[: m.start()], m.group(1)
    return body, ""


def build_header(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    pre = raw[:first_les]
    mod_m = re.search(r"(### Module 1 —.*)", pre, re.S)
    module_block = micro_format(mod_m.group(1)) if mod_m else ""
    return (
        "# Way of Tasting Academy\n\n"
        "---\n\n"
        "## White Wine Track V2 — Gold Master\n"
        "### 40 lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master (leidende versie)\n"
        "**Bron:** `WIT_MODULES.md` → "
        "`python3 scripts/build_white_track_v2_gold_master.py`\n\n"
        "---\n\n"
        f"{module_block}\n"
    )


def apply_repair(body: str, repair: dict) -> str:
    out = strip_repair_artifacts(body)
    if repair.get("theorie"):
        out = replace_section(out, "Theorie", repair["theorie"])
    if repair.get("wist_je_dat"):
        out = replace_section(out, "Wist-je-dat", repair["wist_je_dat"])
    if repair.get("samenvatting"):
        out = replace_section(out, "Samenvatting", repair["samenvatting"])
    if repair.get("food_pairing"):
        out = replace_section(out, "Food pairing", repair["food_pairing"])
    if repair.get("pro_insight"):
        out = replace_section(out, "Pro insight", repair["pro_insight"])
    if repair.get("praktijk"):
        out = replace_section(out, "Praktijkopdracht", repair["praktijk"])
    if repair.get("quiz_full"):
        out = replace_section(out, "Quiz", repair["quiz_full"])
    elif repair.get("quiz_patches"):
        quiz = extract_section(out, "Quiz")
        if quiz:
            out = replace_section(out, "Quiz", patch_quiz(quiz, repair["quiz_patches"]))
    if repair.get("quiz_feedback"):
        out = replace_section(out, "Quiz-feedback", repair["quiz_feedback"])
    if repair.get("kernbegrippen"):
        kc = "\n".join(f"- {t}" for t in repair["kernbegrippen"])
        out = replace_section(out, "Kernbegrippen (DB field)", kc)
    return out


def rebuild_lesson(num: int, header: str, body: str, repair: dict) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)
    body = apply_repair(body, repair)

    reflectie = repair.get("reflectievraag") or extract_section(body, "Reflectievraag")
    if not reflectie:
        praktijk_raw = extract_section(body, "Praktijkopdracht")
        refl_m = re.search(r"### Reflectievraag\s*\n+(.*?)(?=\n---|\n## |\Z)", praktijk_raw, re.S)
        reflectie = refl_m.group(1).strip() if refl_m else ""

    leerdoel = extract_section(body, "Leerdoel")
    praktijk = extract_section(body, "Praktijkopdracht")
    if praktijk:
        praktijk = normalize_praktijk(strip_reflectie_from_praktijk(praktijk), leerdoel)
        body = replace_section(body, "Praktijkopdracht", praktijk)
    if reflectie:
        body = replace_section(body, "Reflectievraag", reflectie)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)

    sections_order = [
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
    ]
    optional = {"Wist-je-dat", "Food pairing", "Quiz"}

    lines = [
        header.rstrip(),
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug_m.group(1) if slug_m else ''}",
        f"**Duration:** {dur_m.group(1) if dur_m else '8'} min",
        f"**Quiz questions:** {quiz_m.group(1) if quiz_m else '5'}",
        "",
        "---",
        "",
    ]

    for sec in sections_order:
        content = extract_section(body, sec)
        if not content:
            if sec in optional:
                continue
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec}")
        lines.extend([f"## {sec}", "", micro_format(content), "", "---", ""])

    return "\n".join(lines), trailer


def normalize_output(text: str) -> str:
    text = re.sub(r"(\n---\n)+", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str, repairs: dict[int, dict]) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 40:
        raise SystemExit("Expected 40 lessons")

    banned = r"NOTE:|TODO|FIXME|placeholder|repair|contentReference|oaicite|WHITE_MODULE"
    if re.search(banned, text, re.I):
        raise SystemExit("Banned patterns remain")

    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")

    if len(re.findall(r"^### Module \d+ — ", text, re.M)) != 9:
        raise SystemExit("Expected 9 module headers")

    if set(repairs.keys()) != set(range(1, 41)):
        missing = set(range(1, 41)) - set(repairs.keys())
        raise SystemExit(f"Missing repair data for lessons: {sorted(missing)}")

    for num in range(1, 41):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if "## Pro insight" not in chunk:
            raise SystemExit(f"LES {num}: missing Pro insight")
        if num >= 16 and "## Food pairing" not in chunk:
            raise SystemExit(f"LES {num}: missing Food pairing")
        praktijk = re.search(r"## Praktijkopdracht\s*\n(.*?)(?=\n## |\Z)", chunk, re.S)
        if not praktijk or "### Opdracht" not in praktijk.group(1):
            if "### Examenonderdeel" not in (praktijk.group(1) if praktijk else ""):
                raise SystemExit(f"LES {num}: Praktijkopdracht incomplete")
        if "### Checklist" not in (praktijk.group(1) if praktijk else ""):
            if num != 40 or "### Examenonderdeel" not in praktijk.group(1):
                raise SystemExit(f"LES {num}: missing Checklist")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if not kc:
            raise SystemExit(f"LES {num}: missing Kernbegrippen")
        items = [ln.strip()[2:] for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
        if len(items) != 5:
            raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")
        if any(i.lower() in GENERIC_KERNBEGRIPPEN for i in items):
            raise SystemExit(f"LES {num}: generic kernbegrip: {items}")
        if num == 15:
            quiz = extract_section(chunk, "Quiz")
            if len(re.findall(r"^### Vraag \d+", quiz, re.M)) != 10:
                raise SystemExit("LES 15: expected 10 quiz questions")
        if num == 40:
            if chunk.count("### Examenonderdeel") < 3:
                raise SystemExit("LES 40: exam praktijk incomplete")
            quiz = extract_section(chunk, "Quiz")
            if len(re.findall(r"^### Vraag \d+", quiz, re.M)) != 20:
                raise SystemExit("LES 40: expected 20 quiz questions")


def build() -> str:
    repairs = load_repairs()
    raw = SOURCE.read_text(encoding="utf-8")
    les_start = raw.find("# LES 1 —")
    out_parts = [build_header(raw[:les_start])]

    parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw[les_start:], flags=re.M)
    j = 1
    while j < len(parts):
        header = parts[j]
        num = int(parts[j + 1])
        body = parts[j + 2] if j + 2 < len(parts) else ""
        if num not in repairs:
            raise SystemExit(f"No repair data for LES {num}")
        polished, trailer = rebuild_lesson(num, header, body, repairs[num])
        out_parts.append(polished)
        if trailer:
            mod_block = re.search(r"(### Module \d+ —.*)", trailer, re.S)
            if mod_block:
                out_parts.append("\n" + micro_format(mod_block.group(1)) + "\n")
        j += 3

    result = normalize_output("".join(out_parts))
    validate(result, repairs)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
