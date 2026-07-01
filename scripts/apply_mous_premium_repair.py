#!/usr/bin/env python3
"""Apply premium repair patches to MOUS_TRACK_V2_GOLD_MASTER.md (lessons 11–40)."""

from __future__ import annotations

import importlib.util
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TRACK = ROOT / "content/pipeline/MOUS_PIPELINE_CONTENT.md"

SECTION_INSERT_AFTER = {
    "Food pairing": ["Samenvatting", "Wist-je-dat", "Theorie"],
    "Pro insight": ["Food pairing", "Samenvatting", "Theorie"],
}


def load_repairs() -> dict[int, dict]:
    repairs: dict[int, dict] = {}
    for name in ("mous_premium_repair_data_m3", "mous_premium_repair_data_m4_9"):
        path = ROOT / "scripts" / f"{name}.py"
        spec = importlib.util.spec_from_file_location(name, path)
        mod = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(mod)
        repairs.update(getattr(mod, "REPAIRS"))
    return repairs


def extract_section(body: str, name: str) -> str:
    pat = rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\Z)"
    m = re.search(pat, body, re.S)
    return m.group(1).strip() if m else ""


def replace_section(body: str, name: str, content: str) -> str:
    block = f"## {name}\n\n{content.strip()}\n"
    if re.search(rf"## {re.escape(name)}\s*\n", body):
        return re.sub(
            rf"## {re.escape(name)}\s*\n.*?(?=\n## |\n---\n|\Z)",
            block,
            body,
            count=1,
            flags=re.S,
        )
    for anchor in SECTION_INSERT_AFTER.get(name, []):
        m = re.search(rf"(## {re.escape(anchor)}\s*\n.*?\n)(?=\n## |\n---\n|\Z)", body, re.S)
        if m:
            insert = "\n---\n\n" + block if not m.group(1).rstrip().endswith("---") else "\n" + block
            return body[: m.end(1)] + insert + body[m.end(1) :]
    raise ValueError(f"Cannot insert section {name}")


def normalize_sections(text: str) -> str:
    text = re.sub(r"\n---\n\n---\n", "\n---\n", text)
    text = re.sub(
        r"(?<!\n---)(?<!\n---\n)\n\n(## (?!Metadata))",
        r"\n\n---\n\n\1",
        text,
    )
    text = re.sub(
        r"([^\n-])\n(## (?!Metadata))",
        r"\1\n\n---\n\n\2",
        text,
    )
    text = re.sub(r"\n{4,}", "\n\n\n", text)
    return text


def patch_reflectie(praktijk: str, reflectie: str) -> str:
    if "### Reflectievraag" in praktijk:
        return re.sub(
            r"(### Reflectievraag\s*\n).*?(?=\n---|\n## |\Z)",
            rf"\1\n{reflectie.strip()}\n",
            praktijk,
            count=1,
            flags=re.S,
        )
    return praktijk.rstrip() + f"\n\n### Reflectievraag\n\n{reflectie.strip()}\n"


def apply_repair(body: str, repair: dict) -> str:
    out = body
    if repair.get("theorie"):
        out = replace_section(out, "Theorie", repair["theorie"])
    if repair.get("samenvatting"):
        out = replace_section(out, "Samenvatting", repair["samenvatting"])
    if repair.get("food_pairing"):
        out = replace_section(out, "Food pairing", repair["food_pairing"])
    if repair.get("pro_insight"):
        out = replace_section(out, "Pro insight", repair["pro_insight"])
    if repair.get("reflectievraag"):
        praktijk = extract_section(out, "Praktijkopdracht")
        if praktijk:
            out = replace_section(out, "Praktijkopdracht", patch_reflectie(praktijk, repair["reflectievraag"]))
    return out


def split_lessons(text: str) -> list[tuple[int, str, str]]:
    parts = re.split(r"(^# LES (\d+) — [^\n]+$)", text, flags=re.M)
    out: list[tuple[int, str, str]] = []
    i = 1
    while i < len(parts):
        header = parts[i]
        num = int(parts[i + 1])
        body = parts[i + 2] if i + 2 < len(parts) else ""
        out.append((num, header, body))
        i += 3
    return out


def main() -> None:
    repairs = load_repairs()
    text = TRACK.read_text(encoding="utf-8")
    header_end = text.find("# LES 1 —")
    header = text[:header_end]
    lessons = split_lessons(text[header_end:])

    rebuilt: list[str] = [header.rstrip()]
    for num, les_header, body in lessons:
        if num in repairs:
            body = apply_repair(body, repairs[num])
        rebuilt.append(les_header + body)

    result = "\n".join(rebuilt).rstrip() + "\n"
    result = normalize_sections(result)
    result = re.sub(
        r"\*\*Bron:\*\* `MOUS_MODULES\.md` \+ `MOUS_REPAIR_CONTENT\.md` → Modules 1–2 repaired",
        "**Bron:** `MOUS_MODULES.md` + premium repair → Modules 1–9 repaired",
        result,
        count=1,
    )
    result = re.sub(
        r"\(premium repair in progress\)",
        "(premium repair complete)",
        result,
        count=1,
    )

    if len(re.findall(r"^# LES \d+ —", result, re.M)) != 40:
        raise SystemExit("Expected 40 lessons")
    fp_count = len(re.findall(r"^## Food pairing", result, re.M))
    if fp_count < 39:
        raise SystemExit(f"Expected ≥39 food pairings, got {fp_count}")

    TRACK.write_text(result, encoding="utf-8")
    print(f"Updated {TRACK.name}: {len(repairs)} lessons patched, {fp_count} food pairings")


if __name__ == "__main__":
    main()
