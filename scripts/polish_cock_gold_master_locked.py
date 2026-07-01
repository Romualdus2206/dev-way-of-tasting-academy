#!/usr/bin/env python3
"""Generate content/COCK_FINAL_CONTENT.md — micro-pass (normbestand)."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from cock_gold_master_locked_data import (  # noqa: E402
    BODY_REPLACEMENTS,
    FOOD_PAIRING_WAAROM,
    GISTING_TERMS,
    KERNBEGRIP_FIXES,
    PRO_INSIGHTS,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN,
    THEORY_OVERRIDES,
    TYPO_REPLACEMENTS,
)

SOURCE = ROOT / "content/pipeline/COCK_PIPELINE_CONTENT.md"
OUT = ROOT / "content/COCK_FINAL_CONTENT.md"

MODULE_TRAILER = re.compile(
    r"\n+(### Module \d+ —[^\n]+\n.*)",
    re.S,
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
        text = re.sub(pat, repl, text, flags=re.M if pat.startswith("#") or pat.startswith(r"\n") else 0)
    for pat, repl in BODY_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    return text


def is_sentence_start(text: str, pos: int) -> bool:
    prefix = text[:pos].rstrip()
    if not prefix:
        return True
    if re.search(r"[-•]\s*$", prefix):
        return True
    return bool(re.search(r'[.!?]["\']?\s*$', prefix))


def normalize_gisting_terms(text: str) -> str:
    if not text:
        return text

    def sub_fn(term: str):
        def repl(m: re.Match[str]) -> str:
            if is_sentence_start(text, m.start()) and m.group(0)[0].isupper():
                return m.group(0)
            return term

        return repl

    for term in GISTING_TERMS:
        text = re.sub(rf"\b{term}\b", sub_fn(term), text, flags=re.I)
    return text


def polish_display_text(text: str) -> str:
    text = micro_format(text)
    text = apply_typos(text)
    text = normalize_gisting_terms(text)
    return text


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}(?: \(selectie\))?\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def patch_food_waarom(text: str, lesson_num: int) -> str:
    override = FOOD_PAIRING_WAAROM.get(lesson_num)
    if not override:
        return text
    m = re.search(r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if not m:
        return text
    return text[: m.start(2)] + polish_display_text(override) + text[m.end(2) :]


def patch_quiz(text: str, lesson_num: int) -> str:
    patches = QUIZ_PATCHES.get(lesson_num)
    if not patches:
        return polish_display_text(text)
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
    return polish_display_text(text)


def count_quiz_questions(body: str) -> int:
    quiz = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")
    if not quiz:
        return 0
    return len(re.findall(r"^### Vraag \d+", quiz, re.M))


def polish_kernbegrip(item: str) -> str:
    return polish_display_text(item)


def polish_lesson(num: int, header: str, body: str) -> str:
    header = polish_display_text(header)
    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    quiz_count = int(quiz_m.group(1)) if quiz_m else count_quiz_questions(body)

    sections: dict[str, str] = {}
    for sec in (
        "Leerdoel",
        "Wist-je-dat",
        "Praktijkopdracht",
        "Quiz-feedback",
    ):
        raw = extract_section(body, sec)
        if raw:
            sections[sec] = polish_display_text(raw)

    if num in THEORY_OVERRIDES:
        sections["Theorie"] = polish_display_text(THEORY_OVERRIDES[num])
    else:
        raw = extract_section(body, "Theorie")
        if raw:
            sections["Theorie"] = polish_display_text(raw)

    raw_sum = extract_section(body, "Samenvatting")
    if raw_sum:
        sections["Samenvatting"] = polish_display_text(raw_sum)

    fp = extract_section(body, "Food pairing")
    if fp:
        patched = patch_food_waarom(fp, num)
        patched = re.sub(r"\n(### Vermijd)", r"\n\n\1", patched)
        sections["Food pairing"] = polish_display_text(patched)

    if num in PRO_INSIGHTS:
        sections["Pro insight"] = polish_display_text(PRO_INSIGHTS[num])
    else:
        raw = extract_section(body, "Pro insight")
        if raw:
            sections["Pro insight"] = polish_display_text(raw)

    if num in REFLECTIEVRAGEN:
        sections["Reflectievraag"] = polish_display_text(REFLECTIEVRAGEN[num])
    else:
        raw = extract_section(body, "Reflectievraag")
        if raw:
            sections["Reflectievraag"] = polish_display_text(raw)

    praktijk = sections.get("Praktijkopdracht", "")
    if praktijk:
        sections["Praktijkopdracht"] = polish_display_text(
            re.sub(r"\n### Reflectievraag\s*\n.*", "", praktijk, flags=re.S).strip()
        )

    quiz_raw = extract_section(body, "Quiz") or extract_section(body, "Voorbeeldvragen")
    if quiz_raw:
        sections["Quiz"] = patch_quiz(quiz_raw, num)

    kc = extract_section(body, "Kernbegrippen (DB field)")
    if kc:
        if num in KERNBEGRIP_FIXES:
            kc_lines = [f"- {t}" for t in KERNBEGRIP_FIXES[num]]
        else:
            kc_lines = []
            for ln in kc.splitlines():
                ln = ln.strip()
                if ln.startswith("- "):
                    kc_lines.append(f"- {polish_kernbegrip(ln[2:])}")
        sections["Kernbegrippen (DB field)"] = "\n".join(kc_lines)

    lines = [
        header.rstrip(),
        "",
        "## Metadata",
        "",
        f"**Slug:** {slug_m.group(1) if slug_m else ''}",
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

    return "\n".join(lines)


def polish_module_block(block: str) -> str:
    block = polish_display_text(block)
    kc_m = re.search(r"(## Module kernbegrippen \(DB field\)\s*\n)(.*?)(?=\n---|\n# LES |\Z)", block, re.S)
    if not kc_m:
        return block
    kc_lines = []
    for ln in kc_m.group(2).splitlines():
        if ln.strip().startswith("- "):
            kc_lines.append(f"- {polish_kernbegrip(ln.strip()[2:])}")
        elif ln.strip():
            kc_lines.append(ln)
    return block[: kc_m.start(2)] + "\n".join(kc_lines) + block[kc_m.end(2) :]


def peel_trailing_module(body: str) -> tuple[str, str]:
    m = MODULE_TRAILER.search(body)
    if m:
        return body[: m.start()], m.group(1)
    return body, ""


def build_header_from_raw(raw: str) -> str:
    first_les = raw.find("# LES 1 —")
    header = raw[:first_les].rstrip()
    header = re.sub(
        r"## Cocktail Track V2 — Gold Master\n",
        "## Cocktail Track V2 — Final Content\n",
        header,
        count=1,
    )
    header = re.sub(
        r"\*\*Versie:\*\* V2 Gold Master \(leidende versie\)\n\*\*Bron:\*\*[^\n]+\n",
        "**Versie:** V2 Final Content (leidende versie)\n"
        "**Bron:** `pipeline/COCK_PIPELINE_CONTENT.md` → "
        "`python3 scripts/polish_cock_gold_master_locked.py`\n",
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
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 41:
        raise SystemExit("Expected 41 lessons")

    banned = (
        r"oplogtijd|pepperige|forwardere|sweetener|vermoutintegration|alkoholwarmte|"
        r"shaak|temperatuuras|Vermelding:|contentReference|repair|TODO|FIXME"
    )
    if re.search(banned, text, re.I):
        raise SystemExit("Banned patterns remain")

    if re.search(r"\bdilutie\b", text, re.I):
        raise SystemExit("dilutie should be verdunning")

    if re.search(r"\bacidity tension\b|\bacidity attack\b", text, re.I):
        raise SystemExit("English acidity phrases remain")

    for line in text.splitlines():
        if line.startswith("# LES "):
            continue
        for term in GISTING_TERMS:
            for m in re.finditer(rf"\b{term}\b", line, re.I):
                if m.group(0)[0].isupper() and not is_sentence_start(line, m.start()):
                    raise SystemExit(f"Mid-sentence {term} caps: {line[:80]}")

    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        raise SystemExit("Duplicate slugs")

    for num in range(1, 42):
        chunk = text.split(f"# LES {num} —")[1].split("# LES ")[0]
        if "## Food pairing" not in chunk or "## Pro insight" not in chunk:
            raise SystemExit(f"LES {num}: missing Food pairing or Pro insight")
        kc = re.search(r"## Kernbegrippen \(DB field\)\s*\n(.*?)(?=\n---|\Z)", chunk, re.S)
        if kc:
            items = [ln for ln in kc.group(1).splitlines() if ln.strip().startswith("- ")]
            if len(items) != 5:
                raise SystemExit(f"LES {num}: expected 5 kernbegrippen, got {len(items)}")


def build() -> str:
    raw = SOURCE.read_text(encoding="utf-8")
    out_parts = [build_header_from_raw(raw)]

    lesson_parts = re.split(r"(^# LES (\d+) — [^\n]+$)", raw, flags=re.M)
    j = 1
    while j < len(lesson_parts):
        les_header = lesson_parts[j]
        les_num = int(lesson_parts[j + 1])
        les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
        peeled, trailer = peel_trailing_module(les_body)
        out_parts.append(polish_lesson(les_num, les_header, peeled))
        if trailer:
            mod_num = int(re.search(r"### Module (\d+)", trailer).group(1))
            mod_block = re.search(r"(### Module \d+ —.*)", trailer, re.S)
            if mod_block:
                out_parts.append("\n" + polish_module_block(mod_block.group(1)) + "\n")
        j += 3

    result = normalize_output("".join(out_parts))
    validate(result)
    return result.rstrip() + "\n"


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
