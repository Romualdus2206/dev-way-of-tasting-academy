#!/usr/bin/env python3
"""Generate content/archive/intermediate/PORT_TRACK_V2_PERFECT.md — redactionele polish op referentiemodel."""

from __future__ import annotations

import importlib.util
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "scripts"))

from port_v2_perfect_data import (  # noqa: E402
    FOOD_PAIRING_WAAROM_OVERRIDES,
    LESSON_PATCHES,
    PERFECT_LEERDOELEN,
    PRO_INSIGHT_OVERRIDES,
    REPAIR_THEORY_LESSONS,
)

CANONICAL = ROOT / "content/archive/intermediate/PORT_TRACK_V2_CANONICAL.md"
OUT = ROOT / "content/archive/intermediate/PORT_TRACK_V2_PERFECT.md"

SECTIONS = (
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


def load_repairs() -> dict[int, dict]:
    repairs: dict[int, dict] = {}
    for name, attr in (
        ("port_repair_m1_3", "REPAIRS_M1_3"),
        ("port_repair_m4_6", "REPAIRS_M4_6"),
        ("port_repair_m7_9", "REPAIRS_M7_9"),
        ("port_repair_m10", "REPAIRS_M10"),
    ):
        path = ROOT / "scripts" / f"{name}.py"
        spec = importlib.util.spec_from_file_location(name, path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        for k, v in getattr(mod, attr, {}).items():
            repairs[int(k)] = v
    return repairs


def strip_app_refs(text: str) -> str:
    if not text:
        return ""
    text = re.sub(
        r"\s*In de kelder — of in de app[^.]*\.",
        ".",
        text,
    )
    text = re.sub(r"\s*In de app[^\n.]*\.?", "", text)
    text = re.sub(r"\s*— In de app[^\n]*", "", text)
    text = re.sub(
        r"\s*Way of (?:Wine|Tasting)-app[^\n.]*\.?",
        "",
        text,
        flags=re.I,
    )
    text = re.sub(r"\s*onder Drank/voorraad[^\n.]*\.?", "", text)
    text = re.sub(r"\s*tab Advies[^\n.]*\.?", "", text)
    text = re.sub(r"^-\s*Noteer je flessen in de app\s*$", "", text, flags=re.M)
    text = re.sub(r"^-\s*In de app:[^\n]*\n", "", text, flags=re.M)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def clean_samenvatting(text: str) -> str:
    text = strip_app_refs(text)
    lines = [ln for ln in text.splitlines() if ln.strip()]
    return "\n".join(lines)


def fix_punctuation_artifacts(text: str) -> str:
    if not text:
        return ""
    text = re.sub(r"(\w):\.(\s*)", r"\1:\2", text)
    text = re.sub(r"---\.\s*", "", text)
    text = re.sub(r"Nieuwe spanningsvraag in theorie:\.\s*", "", text)
    text = re.sub(r",\.\s+", ", ", text)
    text = re.sub(r"\?\.\s+", "? ", text)
    text = re.sub(r"\*\.(\s*)", r"*\1", text)
    text = re.sub(r'\.(\s*)"', r'.\1"', text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def premium_smooth_prose(text: str) -> str:
    """Choppy lines → vloeiende premium-alinea's."""
    text = fix_punctuation_artifacts(text)
    if not text or text.strip().startswith("-") or "### " in text:
        return text

    blocks = re.split(r"\n\n+", text)
    out: list[str] = []
    buf: list[str] = []

    def flush_buf() -> None:
        if not buf:
            return
        parts = [s.strip() for s in buf if s.strip()]
        if not parts:
            buf.clear()
            return
        if len(parts) == 1:
            out.append(parts[0])
        else:
            merged = parts[0]
            for p in parts[1:]:
                if p.endswith("?"):
                    if merged and not merged.endswith(":"):
                        merged = merged.rstrip(".") + ": " + p
                    else:
                        merged = (merged + " " + p).strip()
                elif merged.endswith(":"):
                    merged = merged + " " + p
                elif len(p) < 40 and p[0].islower():
                    merged = merged.rstrip(".") + ", " + p[0].lower() + p[1:]
                else:
                    merged = merged.rstrip(".") + ". " + p
            out.append(merged)
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
            low = ln.lower()
            if ln.endswith("?") and len(ln) < 80:
                if buf and buf[-1].rstrip().endswith(":"):
                    buf.append(ln)
                elif low in ("waarom?", "nee.", "zoetheid?", "fruit?", "oxidatie?", "structuur?", "leeftijd?"):
                    if buf:
                        buf.append(ln)
                    else:
                        flush_buf()
                        out.append(ln)
                else:
                    flush_buf()
                    out.append(ln)
            elif low in ("de fout:", "belangrijke vraag:", "de kernvraag:", "dat betekent:"):
                flush_buf()
                out.append(ln.rstrip(":") + ":")
            elif len(ln) < 55 and not ln.endswith((".", ":", "?", "!", "»", "—")):
                buf.append(ln)
            else:
                if buf:
                    buf.append(ln)
                    flush_buf()
                else:
                    out.append(ln)
    flush_buf()
    return "\n\n".join(out)


def polish_food_pairing(text: str, lesson_num: int) -> str:
    text = fix_punctuation_artifacts(text)
    if lesson_num in FOOD_PAIRING_WAAROM_OVERRIDES:
        override = FOOD_PAIRING_WAAROM_OVERRIDES[lesson_num]
        text = re.sub(
            r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)",
            rf"\1\n{override}\n",
            text,
            flags=re.S,
        )
    m = re.search(r"(### Waarom dit werkt\s*\n)(.*?)(?=\n### |\Z)", text, re.S)
    if m:
        waarom = premium_smooth_prose(m.group(2).strip())
        text = text[: m.start(2)] + waarom + text[m.end(2) :]
    return text.strip()


def repair_field(repair: dict, key: str) -> str:
    mapping = {
        "Wist-je-dat": "wist_je_dat",
        "Quiz-feedback": "quiz_feedback",
        "Pro insight": "pro_insight",
        "Food pairing": "food_pairing",
    }
    rk = mapping.get(key, key.lower().replace(" ", "_").replace("-", "_"))
    val = repair.get(rk) or repair.get(key)
    return strip_app_refs(val) if val else ""


def format_food_pairing_from_repair(raw: str) -> str:
    raw = strip_app_refs(raw)
    if "### Beste pairing" in raw:
        return polish_food_pairing(raw, -1)
    return raw


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def parse_lessons(text: str) -> list[tuple[str, str, str]]:
    """Return (header_before, lesson_num, lesson_body) chunks for reassembly."""
    parts = re.split(r"(^# (?:MODULE \d+ — .+|LES \d+ — .+)$)", text, flags=re.M)
    chunks: list[tuple[str, str, str]] = []
    preamble = parts[0]
    i = 1
    while i < len(parts):
        header = parts[i]
        body = parts[i + 1] if i + 1 < len(parts) else ""
        m = re.match(r"# LES (\d+) — ", header)
        num = m.group(1) if m else ""
        if i == 1:
            chunks.append((preamble, "", ""))
        chunks.append(("", header, body))
        i += 2
    return chunks


def get_repair_for_lesson(num: int, repairs: dict[int, dict]) -> dict | None:
    if num in LESSON_PATCHES:
        return None
    if num in REPAIR_THEORY_LESSONS:
        return repairs.get(num)
    return None


def polish_lesson_body(num: int, body: str, repairs: dict[int, dict]) -> str:
    patch = LESSON_PATCHES.get(num, {})
    repair = get_repair_for_lesson(num, repairs)
    no_quiz = num in (15, 42, 45)

    sections: dict[str, str] = {}
    for sec in SECTIONS:
        sections[sec] = extract_section(body, sec)

    for sec, val in patch.items():
        sections[sec] = val

    sections["Leerdoel"] = PERFECT_LEERDOELEN[num]

    if repair:
        if "Theorie" not in patch and repair.get("theorie"):
            sections["Theorie"] = strip_app_refs(repair["theorie"])
        for sec in ("Wist-je-dat", "Samenvatting"):
            if sec not in patch:
                rv = repair_field(repair, sec)
                if rv:
                    sections[sec] = rv
        if "Pro insight" not in patch and repair.get("pro_insight"):
            sections["Pro insight"] = strip_app_refs(repair["pro_insight"])

    if num in PRO_INSIGHT_OVERRIDES and "Pro insight" not in patch:
        sections["Pro insight"] = PRO_INSIGHT_OVERRIDES[num]

    if sections.get("Theorie"):
        sections["Theorie"] = premium_smooth_prose(sections["Theorie"])
    if sections.get("Samenvatting"):
        sections["Samenvatting"] = clean_samenvatting(sections["Samenvatting"])
    if sections.get("Pro insight"):
        sections["Pro insight"] = premium_smooth_prose(sections["Pro insight"])
    if sections.get("Reflectievraag"):
        sections["Reflectievraag"] = fix_punctuation_artifacts(sections["Reflectievraag"])

    if sections.get("Food pairing"):
        sections["Food pairing"] = polish_food_pairing(sections["Food pairing"], num)

    meta = extract_section(body, "Metadata")
    slug_m = re.search(r"\*\*Slug:\*\* (\S+)", meta)
    dur_m = re.search(r"\*\*Duration:\*\* (\d+)", meta)
    quiz_m = re.search(r"\*\*Quiz questions:\*\* (\d+)", meta)
    slug = slug_m.group(1) if slug_m else ""
    duration = dur_m.group(1) if dur_m else "8"
    quiz_n = "0" if no_quiz else (quiz_m.group(1) if quiz_m else "5")

    lines = [
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

    order: list[str] = [
        "Leerdoel",
        "Theorie",
        "Wist-je-dat",
        "Samenvatting",
        "Food pairing",
        "Pro insight",
        "Praktijkopdracht",
        "Reflectievraag",
    ]
    if not no_quiz:
        order.append("Quiz")
    order.extend(["Quiz-feedback", "Kernbegrippen (DB field)"])

    for sec in order:
        content = sections.get(sec, "").strip()
        if not content:
            raise SystemExit(f"LES {num}: ontbrekende sectie {sec} na polish")
        lines.extend([f"## {sec}", "", content, "", "---", ""])

    return "\n".join(lines)


def validate(text: str) -> None:
    if len(re.findall(r"^# LES (\d+) — ", text, re.M)) != 45:
        raise SystemExit("Expected 45 lessons")
    if re.search(r"\w:\.", text):
        raise SystemExit("Punctuation artifacts remain (word:.)")
    if re.search(r"---\.", text):
        raise SystemExit("Punctuation artifacts remain (---.)")
    slugs = re.findall(r"^\*\*Slug:\*\* (\S+)", text, re.M)
    if len(slugs) != len(set(slugs)):
        dupes = [s for s in slugs if slugs.count(s) > 1]
        raise SystemExit(f"Duplicate slugs: {set(dupes)}")
    for m in re.finditer(r"uitleggen en toepassen in proef, service of gastadvies", text):
        pass
    generic = len(re.findall(r"uitleggen en toepassen in proef, service of gastadvies", text))
    if generic:
        raise SystemExit(f"Generic leerdoelen remaining: {generic}")


def build() -> str:
    repairs = load_repairs()
    raw = CANONICAL.read_text(encoding="utf-8")

    header = raw.split("# MODULE 1")[0]
    header = re.sub(
        r"## Port Track V2 — Referentiemodel.*?\n",
        "## Port Track V2 — Perfect\n",
        header,
    )
    header = re.sub(
        r"\*\*Versie:\*\* V2 Referentiemodel.*\n",
        "**Versie:** V2 Perfect (locked master)\n",
        header,
    )
    header = re.sub(
        r"\*\*Rebuild:\*\* `python3 scripts/build_port_track_v2_final.py`",
        "**Bron:** `PORT_TRACK_V2_CANONICAL.md` → `python3 scripts/polish_port_track_v2_perfect.py`",
        header,
    )

    out_parts = [header.rstrip(), "\n\n"]
    module_chunks = re.split(r"(^# MODULE \d+ — .+$)", raw, flags=re.M)[1:]

    for i in range(0, len(module_chunks), 2):
        mod_header = module_chunks[i]
        mod_body = module_chunks[i + 1] if i + 1 < len(module_chunks) else ""
        out_parts.append(mod_header + mod_body.split("# LES ")[0])

        lesson_parts = re.split(r"(^# LES (\d+) — .+$)", mod_body, flags=re.M)
        j = 1
        while j < len(lesson_parts):
            les_header = lesson_parts[j]
            les_num = int(lesson_parts[j + 1])
            les_body = lesson_parts[j + 2] if j + 2 < len(lesson_parts) else ""
            polished = polish_lesson_body(les_num, les_body, repairs)
            out_parts.append(les_header + polished)
            j += 3

    result = "".join(out_parts)
    result = normalize_output(result)
    validate(result)
    return result.rstrip() + "\n"


def normalize_output(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", "\n---\n", text)
    text = re.sub(r"(# LES \d+ — [^\n]+)\n## Metadata", r"\1\n\n## Metadata", text)
    text = re.sub(r"(### Waarom dit werkt\n)\n+", r"\1\n", text)
    text = re.sub(r"([^\n])\n(### Vermijd)", r"\1\n\n\2", text)
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def main() -> None:
    OUT.write_text(build(), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)} ({OUT.stat().st_size // 1024} KB)")


if __name__ == "__main__":
    main()
