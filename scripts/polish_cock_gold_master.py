#!/usr/bin/env python3
"""Generate content/pipeline/COCK_PIPELINE_CONTENT.md — Gold Master upgrade op COCK_MODULES."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from cock_gold_master_data import (  # noqa: E402
    FOOD_PAIRING,
    GOLD_KEY_CONCEPTS,
    LEERDOELEN,
    MODULE_GOALS,
    MODULE_KERNBEGRIPPEN,
    PRO_INSIGHTS,
    QUIZ_FULL,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN,
    SUMMARIES,
    TERMINOLOGY_REPLACEMENTS,
    THEORY_MENTIONS,
    THEORY_OVERRIDES,
    fix_artifacts,
    merge_part2,
)
from polish_port_track_v2_perfect import premium_smooth_prose  # noqa: E402

SOURCE = ROOT / "content/archive/legacy/COCK_MODULES.md"
OUT = ROOT / "content/pipeline/COCK_PIPELINE_CONTENT.md"

NESTED_FRAGMENT_HEADERS = frozenset(
    {
        "SAZERAC",
        "VIEUX CARRÉ",
        "NAKED & FAMOUS",
        "PENICILLIN",
        "SEIZOENSCOCKTAILS",
        "GUEST PSYCHOLOGY",
        "LOW-ABV COCKTAILS",
        "BOULEVARDIER VARIATIONS",
        "ESPRESSO MARTINI",
        "FINAL PRACTICAL EXAM",
    }
)

MODULE_TRAILER = re.compile(
    r"\n+# COCK_MODULE_\d+\.md\s*\n# Way of Tasting Academy\s*\n## Cocktail Track\s*\n(### Module \d+ —[^\n]+\n.*)",
    re.S,
)
MODULE_TRAILER_ALT = re.compile(
    r"\n+# Way of Tasting Academy\s*\n## Cocktail Track\s*\n(### Module \d+ —[^\n]+\n.*)",
    re.S,
)


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def micro_format(text: str) -> str:
    if not text:
        return ""
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = re.sub(r"\.{2,}", ".", text)
    text = re.sub(r"  +", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def is_nested_header(header: str) -> bool:
    h = header.strip()
    if h in NESTED_FRAGMENT_HEADERS:
        return True
    if h in ("Opdracht", "Checklist", "Reflectievraag", "Beste pairing", "Waarom dit werkt", "Vermijd"):
        return False
    if re.match(r"^Vraag \d+$", h):
        return False
    return bool(re.match(r"^[A-Z][A-Z0-9 &'\-–]+$", h)) and len(h) > 4


def strip_nested_fragments(text: str) -> str:
    if not text:
        return ""
    out: list[str] = []
    skip = False
    for line in text.splitlines():
        m = re.match(r"^### (.+)$", line)
        if m:
            if is_nested_header(m.group(1)):
                skip = True
                continue
            skip = False
        if not skip:
            out.append(line)
    return "\n".join(out).strip()


def apply_terminology(text: str) -> str:
    if not text:
        return ""
    for pat, repl in TERMINOLOGY_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    return text


def polish_pro_insight_bullets(text: str) -> str:
    text = strip_nested_fragments(text)
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    if not lines:
        return ""
    if all(ln.startswith("- ") for ln in lines):
        parts = [ln[2:].strip() for ln in lines]
        return apply_terminology(". ".join(p.rstrip(".") for p in parts) + ".")
    return apply_terminology(micro_format(text))


def clean_section(text: str) -> str:
    return re.sub(r"\n---\s*$", "", text.strip())


def polish_theory(num: int, text: str) -> str:
    text = fix_artifacts(strip_nested_fragments(clean_section(micro_format(text))), num)
    if num in THEORY_OVERRIDES:
        theory = THEORY_OVERRIDES[num]
    else:
        theory = premium_smooth_prose(text)
    if num in THEORY_MENTIONS:
        theory = f"{theory.rstrip()}\n\n{THEORY_MENTIONS[num]}".strip()
    return apply_terminology(fix_artifacts(theory, num))


def patch_quiz(text: str, lesson_num: int) -> str:
    if lesson_num in QUIZ_FULL:
        return micro_format(QUIZ_FULL[lesson_num])
    patches = QUIZ_PATCHES.get(lesson_num)
    if not patches:
        return micro_format(text)
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
    return micro_format(text)


def emit_summary(lines: list[str]) -> str:
    return "\n".join(f"- {ln}" for ln in lines)


def emit_kernbegrippen(terms: list[str]) -> str:
    if len(terms) != 5:
        raise ValueError(f"Expected 5 kernbegrippen, got {len(terms)}: {terms}")
    return "\n".join(f"- {t}" for t in terms)


def peel_trailing_module(body: str) -> tuple[str, str]:
    for pat in (MODULE_TRAILER, MODULE_TRAILER_ALT):
        m = pat.search(body)
        if m:
            return body[: m.start()], m.group(1)
    return body, ""


def polish_module_block(block: str) -> str:
    m = re.search(r"### Module (\d+) — ([^\n]+)", block)
    if not m:
        return block
    num = int(m.group(1))
    title = m.group(2).strip()
    goal = MODULE_GOALS.get(num, "")
    if not goal:
        gm = re.search(r"\*\*Module goal:\*\* (.+)", block)
        goal = gm.group(1).strip() if gm else ""

    level_m = re.search(r"\*\*Level:\*\* ([^\n]+)", block)
    pillar_m = re.search(r"\*\*Framework pillar:\*\* ([^\n]+)", block)
    kc = MODULE_KERNBEGRIPPEN.get(num, [])

    lines = [
        f"### Module {num} — {title}",
        "",
        f"**Level:** {level_m.group(1).strip() if level_m else 'Explorer'}",
        f"**Framework pillar:** {pillar_m.group(1).strip() if pillar_m else ''}",
        f"**Module goal:** {apply_terminology(micro_format(goal))}",
        "",
        "---",
        "",
        "## Module kernbegrippen (DB field)",
        "",
    ]
    lines.extend(f"- {t}" for t in kc)
    lines.extend(["", "---", ""])
    return "\n".join(lines)


def polish_lesson_body(num: int, body: str) -> tuple[str, str]:
    body, trailer = peel_trailing_module(body)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)

    praktijk = strip_nested_fragments(clean_section(extract_section(body, "Praktijkopdracht")))
    praktijk = re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()

    quiz_raw = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")

    sections: dict[str, str] = {
        "Leerdoel": apply_terminology(micro_format(LEERDOELEN[num])),
        "Theorie": polish_theory(num, extract_section(body, "Theorie")),
        "Wist-je-dat": apply_terminology(
            fix_artifacts(micro_format(clean_section(extract_section(body, "Wist-je-dat"))), num)
        ),
        "Samenvatting": emit_summary(SUMMARIES[num]),
        "Food pairing": apply_terminology(micro_format(FOOD_PAIRING[num])),
        "Pro insight": apply_terminology(micro_format(PRO_INSIGHTS[num])),
        "Praktijkopdracht": apply_terminology(micro_format(praktijk)),
        "Reflectievraag": REFLECTIEVRAGEN[num],
        "Quiz-feedback": apply_terminology(
            micro_format(clean_section(strip_nested_fragments(extract_section(body, "Quiz-feedback"))))
        ),
        "Kernbegrippen (DB field)": emit_kernbegrippen(GOLD_KEY_CONCEPTS[num]),
    }

    if quiz_raw or num in QUIZ_FULL:
        sections["Quiz"] = apply_terminology(patch_quiz(quiz_raw or "", num))

    lines = [
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

    order = [
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
    header = raw[:first_les]
    header = re.sub(r"^# COCK_MODULE_\d+\.md\s*\n", "", header)
    header = re.sub(
        r"# Way of Tasting Academy\s*\n## Cocktail Track\s*\n### Module 1",
        "# Way of Tasting Academy\n"
        "## Cocktail Track V2 — Gold Master\n"
        "### 41 lessen · 9 modules · unieke slugs\n\n"
        "**Versie:** V2 Gold Master (leidende versie)\n"
        "**Bron:** `COCK_MODULES.md` → `python3 scripts/polish_cock_gold_master.py`\n\n"
        "---\n\n"
        "### Module 1",
        header,
        count=1,
    )
    mod_m = re.search(r"(### Module 1 —.*)", header, re.S)
    if mod_m:
        header = header[: mod_m.start()] + polish_module_block(mod_m.group(1))
    return header.rstrip() + "\n\n"


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", r"\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"# COCK_MODULE_\d+\.md\s*\n", "", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 41:
        raise SystemExit("Expected 41 lessons")
    if re.search(r"contentReference|oaicite|TODO|FIXME|repair", text, re.I):
        raise SystemExit("Artifacts remain")
    if re.search(r"^### (SAZERAC|VIEUX CARRÉ|NAKED & FAMOUS|PENICILLIN)\b", text, re.M):
        raise SystemExit("Nested subcocktail fragments remain")
    if re.search(r"^De student ", text, re.M):
        raise SystemExit("Non-Port leerdoel format remains")
    if "### Reflectievraag" in text.split("## Praktijkopdracht")[1:]:
        pass  # reflectie standalone is OK
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")
    for num in range(1, 42):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if "## Food pairing" not in chunk:
            raise SystemExit(f"LES {num}: missing Food pairing")
        if "## Pro insight" not in chunk:
            raise SystemExit(f"LES {num}: missing Pro insight")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if kc:
            items = [ln for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
            if len(items) != 5:
                raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")


def build() -> str:
    merge_part2()
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        polished, trailer = polish_lesson_body(les_num, les_body)
        out_parts.append(les_header + polished)
        if trailer:
            out_parts.append("\n" + polish_module_block(trailer) + "\n")
        j += 3

    result = normalize_output("".join(out_parts))
    result = fix_artifacts(result)
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
