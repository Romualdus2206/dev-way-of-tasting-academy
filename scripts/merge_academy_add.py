#!/usr/bin/env python3
"""Merge content/ADD_*_MODULES.md repairs into main track markdown files."""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONTENT = ROOT / "content/archive/legacy"

SECTION_NAMES = ("Praktijkopdracht", "Quiz", "Quiz-feedback", "Examen-feedback", "Kernbegrippen (DB field)")

REBUILD_SCRIPTS = {
    "cocktails": "rebuild_cocktails_track.py",
    "mous": "rebuild_mous_track.py",
    "wine": "rebuild_wine_track.py",
    "red": "rebuild_red_wine_track.py",
    "white": "rebuild_white_wine_track.py",
    "rose": "rebuild_rose_wine_track.py",
    "beer": "rebuild_beer_track.py",
    "beer_zero": "rebuild_beer_zero_track.py",
    "port": "rebuild_port_track.py",
    "bio": "rebuild_bio_track.py",
}

TRACKS = {
    "cocktails": ("COCK_MODULES.md", "ADD_COCK_MODULES.md", "les"),
    "mous": ("MOUS_MODULES.md", "ADD_MOUS_MODULES.md", "mous"),
    "wine": ("WIJN_MODULES.md", "ADD_WIJN_MODULES.md", "prefix:WINE"),
    "red": ("ROOD_MODULES.md", "ADD_ROOD_MODULES.md", "prefix:RED"),
    "white": ("WIT_MODULES.md", "ADD_WIT_MODULES.md", "prefix:WHITE"),
    "rose": ("ROSE_MODULES.md", "ADD_ROSE_MODULES.md", "prefix:ROSE"),
    "beer": ("BIER_MODULES.md", "ADD_BIER_MODULES.md", "les"),
    "beer_zero": ("BIER_0_0_MODULES.md", "ADD_BIER_0_0_MODULES.md", "beer_zero"),
    "port": ("PORT_MODULES.md", "ADD_PORT_MODULES.md", "port"),
    "bio": ("BIO_MODULES.md", "ADD_BIO_MODULES.md", "bio"),
}


MODULE_TAIL_RE = re.compile(
    r"\n# (?:(?:[A-Z0-9_]+MODULE_\d+)|(?:PORT_\d+))\.md[^\n]*\n.*",
    re.S,
)


def split_body_tail(body: str) -> tuple[str, str]:
    m = MODULE_TAIL_RE.search(body)
    if not m:
        return body, ""
    return body[: m.start()], body[m.start() :]


def insert_after_any(body: str, anchors: list[str], name: str, content: str) -> str:
    if re.search(rf"^## {re.escape(name)}\s*\n", body, flags=re.M):
        return body
    for anchor in anchors:
        if re.search(rf"^## {re.escape(anchor)}\s*\n", body, flags=re.M):
            return insert_after_section(body, anchor, name, content)
    return body


def section_block(name: str, body: str) -> str:
    return f"## {name}\n\n{body.strip()}\n\n---\n\n"


def normalize_quiz(body: str) -> str:
    body = re.sub(r"^#### Vraag", "### Vraag", body, flags=re.M)
    body = re.sub(r"\n---\n(?=### Vraag )", "\n", body)
    return body.strip()


def is_placeholder(text: str) -> bool:
    t = text.strip()
    if not t:
        return True
    if re.fullmatch(r"\([^)]+\)", t):
        return True
    if re.match(r"^\(\d+ vragen", t):
        return True
    if t.lower() in {"alles daaronder", "vervang door:"}:
        return True
    return False


def clean_section_content(content: str) -> str:
    content = content.strip()
    content = re.sub(r"\n---\s*\n+[-=]{3,}.*$", "", content, flags=re.S)
    return content.strip()


def extract_sections(body: str) -> dict[str, str]:
    sections: dict[str, str] = {}
    for m in re.finditer(r"^## ([^\n]+)\s*\n(.*?)(?=^## |\Z)", body, flags=re.M | re.S):
        name = m.group(1).strip()
        if name.startswith("Quiz") and name != "Quiz-feedback":
            name = "Quiz"
        if name == "Examen-feedback":
            name = "Quiz-feedback"
        if name in SECTION_NAMES:
            content = clean_section_content(m.group(2))
            if name == "Quiz" and is_placeholder(content):
                continue
            if name == "Quiz":
                content = normalize_quiz(content)
            sections[name] = content
    return sections


def replace_section(body: str, name: str, new_content: str) -> str:
    pattern = rf"^## {re.escape(name)}\s*\n.*?(?=^## |\Z)"
    block = section_block(name, new_content)
    if re.search(pattern, body, flags=re.M | re.S):
        return re.sub(pattern, block.rstrip() + "\n\n", body, count=1, flags=re.M | re.S)
    return body


def insert_after_section(body: str, after: str, name: str, content: str) -> str:
    if re.search(rf"^## {re.escape(name)}\s*\n", body, flags=re.M):
        return body
    pattern = rf"(^## {re.escape(after)}\s*\n.*?(?=^## |\Z))"
    block = section_block(name, content)
    m = re.search(pattern, body, flags=re.M | re.S)
    if not m:
        return body
    return body[: m.end()] + "\n" + block + body[m.end() :].lstrip("\n")


def apply_sections(body: str, sections: dict[str, str]) -> str:
    out = body
    if "Praktijkopdracht" in sections:
        out = replace_section(out, "Praktijkopdracht", sections["Praktijkopdracht"])
        if not re.search(r"^## Praktijkopdracht\s*\n", out, flags=re.M):
            out = insert_after_any(
                out,
                ["Samenvatting", "Theorie", "Leerdoel", "Praktijkexamen", "Eindopdracht"],
                "Praktijkopdracht",
                sections["Praktijkopdracht"],
            )
    if "Quiz" in sections:
        out = replace_section(out, "Quiz", sections["Quiz"])
        if not re.search(r"^## Quiz\s*\n", out, flags=re.M):
            anchor = "Praktijkopdracht" if re.search(r"^## Praktijkopdracht\s*\n", out, flags=re.M) else "Samenvatting"
            out = insert_after_section(out, anchor, "Quiz", sections["Quiz"])
    if "Quiz-feedback" in sections:
        out = replace_section(out, "Quiz-feedback", sections["Quiz-feedback"])
        if not re.search(r"^## Quiz-feedback\s*\n", out, flags=re.M):
            anchor = "Quiz" if re.search(r"^## Quiz\s*\n", out, flags=re.M) else "Praktijkopdracht"
            if not re.search(rf"^## {re.escape(anchor)}\s*\n", out, flags=re.M):
                anchor = "Samenvatting"
            out = insert_after_section(out, anchor, "Quiz-feedback", sections["Quiz-feedback"])
    if "Kernbegrippen (DB field)" in sections:
        out = replace_section(out, "Kernbegrippen (DB field)", sections["Kernbegrippen (DB field)"])
        if not re.search(r"^## Kernbegrippen \(DB field\)\s*\n", out, flags=re.M):
            anchor = "Quiz-feedback" if re.search(r"^## Quiz-feedback\s*\n", out, flags=re.M) else "Quiz"
            if not re.search(rf"^## {re.escape(anchor)}\s*\n", out, flags=re.M):
                anchor = "Praktijkopdracht" if re.search(r"^## Praktijkopdracht\s*\n", out, flags=re.M) else "Samenvatting"
            out = insert_after_section(out, anchor, "Kernbegrippen (DB field)", sections["Kernbegrippen (DB field)"])
    return out


def split_lessons(text: str) -> tuple[str, list[tuple[str, str]]]:
    parts = re.split(r"(^# LES \d+ — .+$)", text, flags=re.M)
    header = parts[0]
    lessons: list[tuple[str, str]] = []
    i = 1
    while i < len(parts):
        title = parts[i]
        body = parts[i + 1] if i + 1 < len(parts) else ""
        lessons.append((title, body))
        i += 2
    return header, lessons


def join_lessons(header: str, lessons: list[tuple[str, str]]) -> str:
    out = [header.rstrip()]
    if out[0]:
        out.append("")
    for title, body in lessons:
        out.append(title)
        out.append(body.lstrip("\n") if body else "")
    return "\n".join(out).rstrip() + "\n"


def parse_les_feedback(add_text: str) -> dict[int, dict[str, str]]:
    patches: dict[int, dict[str, str]] = {}
    parts = re.split(r"^## LES (\d+) — ", add_text, flags=re.M)
    for i in range(1, len(parts), 2):
        num = int(parts[i])
        body = parts[i + 1]
        body = re.split(r"^# (?:MODULE|TOEVOEGEN)", body, flags=re.M)[0]
        sections = extract_sections(body)
        if sections:
            patches[num] = sections
    return patches


def parse_les_mous(add_text: str) -> dict[int, dict[str, str]]:
    patches: dict[int, dict[str, str]] = {}
    parts = re.split(r"^## LES (\d+) — ", add_text, flags=re.M)
    for i in range(1, len(parts), 2):
        num = int(parts[i])
        body = parts[i + 1]
        if re.search(r"### NO CHANGE", body, flags=re.M):
            continue
        body = re.split(r"^# MODULE ", body, flags=re.M)[0]
        sections: dict[str, str] = {}
        for m in re.finditer(
            r"^### ADD: (Quiz-feedback|Quiz|Praktijkopdracht)\s*\n(.*?)(?=^### ADD: |^---\n\n# |\Z)",
            body,
            flags=re.M | re.S,
        ):
            name = m.group(1)
            if name == "Quiz":
                name = "Quiz"
            content = m.group(2).strip()
            if name == "Quiz" and is_placeholder(content):
                continue
            if name == "Quiz":
                content = normalize_quiz(content)
            sections[name if name != "Quiz-feedback" else "Quiz-feedback"] = content
        if sections:
            patches[num] = sections
    return patches


def parse_prefix_patches(add_text: str, prefix: str, rose_module9_offset: bool = False) -> dict[int, dict[str, str]]:
    """Parse PREFIX-NNN or PATCH — PREFIX-NNN blocks in file order."""
    patches: dict[int, dict[str, str]] = {}
    current_module = 0
    lines = add_text.splitlines(keepends=True)
    i = 0
    while i < len(lines):
        line = lines[i]
        mod_m = re.match(r"^# MODULE (\d+)", line)
        if mod_m:
            current_module = int(mod_m.group(1))
        header_m = re.match(
            rf"^(?:#|##) (?:PATCH — )?{prefix}-(\d+)(?:\s|$|—|\()",
            line,
        )
        if not header_m and not re.match(rf"^# {prefix}-\d+ — ", line):
            i += 1
            continue
        num = int(header_m.group(1)) if header_m else int(re.match(rf"^# {prefix}-(\d+)", line).group(1))
        i += 1
        chunk: list[str] = []
        while i < len(lines):
            nxt = lines[i]
            if re.match(r"^# MODULE ", nxt) or re.match(r"^# RESULTAAT", nxt):
                break
            if re.match(rf"^(?:#|##) (?:PATCH — )?{prefix}-\d+", nxt):
                break
            if re.match(rf"^# {prefix}-\d+ — ", nxt):
                break
            if re.match(r"^# (?:FINAL EXAM|WINE_MODULE|RED_WINE|WHITE_MODULE|ROSE_REPAIR)", nxt):
                break
            if nxt.strip() == "GEEN MC QUIZ TOEVOEGEN":
                i += 1
                while i < len(lines) and not lines[i].startswith("## "):
                    i += 1
                continue
            chunk.append(nxt)
            i += 1
        body = "".join(chunk)
        body = re.sub(r"^## Inject direct[^\n]*\n", "", body, flags=re.M)
        sections = extract_sections(body)
        if not sections:
            continue
        target = num
        if rose_module9_offset and current_module >= 9 and num in (38, 39, 40):
            target = num + 3
        if target in patches:
            patches[target] = {**patches[target], **sections}
        else:
            patches[target] = sections
    return patches


def parse_beer_zero(add_text: str) -> dict[int, dict[str, str]]:
    blocks: dict[int, dict[str, str]] = {}
    parts = re.split(r"^# (ZERO-\d+) — ", add_text, flags=re.M)
    for i in range(1, len(parts), 2):
        num = int(parts[i].split("-")[1])
        body = parts[i + 1]
        body = re.split(r"^# Expected audit improvement", body, flags=re.M)[0]
        body = re.split(r"^# ZERO_MODULE_\d+_REPAIR", body, flags=re.M)[0]
        body = re.split(r"^# FULL TRACK RESULT", body, flags=re.M)[0]
        sections = extract_sections(body)
        if sections:
            blocks[num] = sections
    return blocks


def patch_beer_zero_metadata(body: str, lesson_num: int, has_quiz: bool) -> str:
    def repl(m: re.Match[str]) -> str:
        block = m.group(0)
        if lesson_num == 44:
            block = re.sub(r"\*\*Quiz questions:\*\*.*", "**Quiz questions:** 0 (open examen)", block)
        elif lesson_num == 45 and has_quiz:
            block = re.sub(r"\*\*Quiz questions:\*\*\s*\d+", "**Quiz questions:** 5", block)
        return block

    if re.search(r"^## Metadata\s*\n", body, flags=re.M):
        return re.sub(r"^## Metadata\s*\n.*?(?=\n---|\n## |\Z)", repl, body, count=1, flags=re.M | re.S)
    return body


def remove_section(body: str, name: str) -> str:
    pattern = rf"^## {re.escape(name)}\s*\n.*?(?=^## |\Z)"
    return re.sub(pattern, "", body, count=1, flags=re.M | re.S).strip() + "\n\n"


def patch_port_metadata(body: str, lesson_num: int, has_quiz: bool) -> str:
    def repl(m: re.Match[str]) -> str:
        block = m.group(0)
        if lesson_num == 40:
            block = re.sub(r"\*\*Quiz questions:\*\*.*", "**Quiz questions:** 0 (open examen)", block)
        return block

    if re.search(r"^## Metadata\s*\n", body, flags=re.M):
        return re.sub(r"^## Metadata\s*\n.*?(?=\n---|\n## |\Z)", repl, body, count=1, flags=re.M | re.S)
    return body


def parse_port_patches(add_text: str) -> dict[int, dict[str, str]]:
    patches: dict[int, dict[str, str]] = {}
    for m in re.finditer(
        r"PATCH \d+ — PORT-(\d+)[^\n]*\n(.*?)(?=PATCH \d+ — PORT-|\# VALIDATIE|\Z)",
        add_text,
        flags=re.S,
    ):
        num = int(m.group(1))
        body = m.group(2)
        remove_quiz = bool(re.search(r"VERWIJDER:", body))
        if remove_quiz:
            body = re.sub(r"VERWIJDER:.*?(?=Vervang door:)", "", body, flags=re.S)
            body = re.sub(r"^Vervang door:\s*\n", "", body)
        sections = extract_sections(body)
        if remove_quiz:
            sections["_remove_quiz"] = True
            sections.pop("Quiz", None)
        if sections:
            if num in patches:
                patches[num] = {**patches[num], **sections}
            else:
                patches[num] = sections
    return patches


def apply_port_sections(body: str, sections: dict[str, str], lesson_num: int) -> str:
    out = body
    if sections.pop("_remove_quiz", False):
        out = remove_section(out, "Quiz")
    out = apply_sections(out, sections)
    has_quiz = bool(re.search(r"^## Quiz\s*\n", out, flags=re.M))
    out = patch_port_metadata(out, lesson_num, has_quiz)
    return out


BIO_LESSON_QUIZ_COUNTS: dict[int, int] = {15: 5, 41: 20}


def parse_bio_patches(add_text: str) -> dict[int, dict[str, str]]:
    patches: dict[int, dict[str, str]] = {}
    for m in re.finditer(
        r"# PATCH \d+ — LES (\d+)[^\n]*\n(.*?)(?=\n# PATCH \d+ — LES |\n# GEEN PATCH|\Z)",
        add_text,
        flags=re.S,
    ):
        num = int(m.group(1))
        header = m.group(0).split("\n", 1)[0]
        body = m.group(2).strip()
        if "METADATA" in header:
            qm = re.search(r"Vervang door:\s*\n+\s*\*\*Quiz questions:\*\*\s*(\d+)", body)
            if qm:
                patches.setdefault(num, {})["_quiz_questions"] = qm.group(1)
            continue
        sections = extract_sections(body)
        if sections:
            patches[num] = {**patches.get(num, {}), **sections}
    return patches


def patch_bio_metadata(body: str, lesson_num: int, quiz_count: str | None = None) -> str:
    count = quiz_count or str(BIO_LESSON_QUIZ_COUNTS.get(lesson_num, ""))
    if not count:
        return body

    def repl(m: re.Match[str]) -> str:
        block = m.group(0)
        return re.sub(r"\*\*Quiz questions:\*\*.*", f"**Quiz questions:** {count}", block)

    if re.search(r"^## Metadata\s*\n", body, flags=re.M):
        return re.sub(r"^## Metadata\s*\n.*?(?=\n---|\n## |\Z)", repl, body, count=1, flags=re.M | re.S)
    return body


def apply_bio_sections(body: str, sections: dict[str, str], lesson_num: int) -> str:
    quiz_count = sections.pop("_quiz_questions", None)
    out = body
    if "Quiz" in sections:
        quiz_content = sections["Quiz"]
        out = replace_section(out, "Quiz", quiz_content)
        if not re.search(r"^## Quiz\s*\n", out, flags=re.M):
            if re.search(r"^## Examenstructuur\s*\n", out, flags=re.M):
                out = insert_after_section(out, "Examenstructuur", "Quiz", quiz_content)
            elif re.search(r"^## Praktijkopdracht\s*\n", out, flags=re.M):
                out = insert_after_section(out, "Praktijkopdracht", "Quiz", quiz_content)
            else:
                out = insert_after_section(out, "Samenvatting", "Quiz", quiz_content)
    feedback_sections = {k: v for k, v in sections.items() if k != "Quiz"}
    out = apply_sections(out, feedback_sections)
    if quiz_count or lesson_num in BIO_LESSON_QUIZ_COUNTS:
        out = patch_bio_metadata(out, lesson_num, quiz_count)
    return out


def parse_cocktail_exam_praktijk(add_text: str) -> dict[str, str] | None:
    m = re.search(
        r"# TOEVOEGEN — PRAKTIJKOPDRACHT BIJ LES \d+ \(EXAMEN\)[^\n]*\n(.*)",
        add_text,
        flags=re.M | re.S,
    )
    if not m:
        return None
    return extract_sections(m.group(1))


def cocktail_exam_lesson_index(lessons: list[tuple[str, str]]) -> int | None:
    for idx, (title, _) in enumerate(lessons, start=1):
        if re.search(r"praktijkexamen", title, flags=re.I):
            return idx
    return len(lessons) if lessons else None


def merge_track(name: str) -> int:
    main_name, add_name, parser = TRACKS[name]
    main_path = CONTENT / main_name
    add_path = CONTENT / add_name
    if not add_path.exists():
        print(f"Skip {name}: {add_name} not found")
        return 0

    add_text = add_path.read_text(encoding="utf-8")
    header, lessons = split_lessons(main_path.read_text(encoding="utf-8"))
    patches: dict[int, dict[str, str]] = {}

    if parser == "les":
        patches = parse_les_feedback(add_text)
        if name == "cocktails":
            exam = parse_cocktail_exam_praktijk(add_text)
            exam_idx = cocktail_exam_lesson_index(lessons)
            if exam and exam_idx:
                patches[exam_idx] = {**patches.get(exam_idx, {}), **exam}
    elif parser == "mous":
        patches = parse_les_mous(add_text)
    elif parser == "beer_zero":
        patches = parse_beer_zero(add_text)
    elif parser == "port":
        patches = parse_port_patches(add_text)
    elif parser == "bio":
        patches = parse_bio_patches(add_text)
    elif parser.startswith("prefix:"):
        prefix = parser.split(":")[1]
        patches = parse_prefix_patches(add_text, prefix, rose_module9_offset=(name == "rose"))
    else:
        raise ValueError(f"Unknown parser: {parser}")

    merged = 0
    for idx, (title, body) in enumerate(lessons, start=1):
        if idx not in patches:
            if name == "beer_zero" and idx in (44, 45):
                core, tail = split_body_tail(body)
                has_quiz = bool(re.search(r"^## Quiz\s*\n", core, flags=re.M))
                core = patch_beer_zero_metadata(core, idx, has_quiz)
                lessons[idx - 1] = (title, core + tail)
            continue
        core, tail = split_body_tail(body)
        if name == "port":
            core = apply_port_sections(core, dict(patches[idx]), idx)
        elif name == "bio":
            core = apply_bio_sections(core, dict(patches[idx]), idx)
        else:
            core = apply_sections(core, patches[idx])
        if name == "beer_zero":
            has_quiz = bool(re.search(r"^## Quiz\s*\n", core, flags=re.M))
            core = patch_beer_zero_metadata(core, idx, has_quiz)
        lessons[idx - 1] = (title, core + tail)
        merged += 1

    text = join_lessons(header, lessons)
    text = re.sub(r"\n---\n\n---\n", "\n---\n", text)
    text = re.sub(r"^ADD directly after.*\n\n?", "", text, flags=re.M)
    main_path.write_text(text, encoding="utf-8")
    print(f"  {name}: {merged} lessons patched → {main_name}")
    return merged


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--track", choices=[*TRACKS, "all"], default="all")
    ap.add_argument("--rebuild", action="store_true")
    ap.add_argument("--audit", action="store_true")
    args = ap.parse_args()

    names = list(TRACKS) if args.track == "all" else [args.track]
    total = 0
    for name in names:
        total += merge_track(name)

    if args.rebuild or args.audit:
        for name in names:
            script = REBUILD_SCRIPTS.get(name)
            if script:
                subprocess.run([sys.executable, str(ROOT / "scripts" / script)], check=True, cwd=ROOT)
        if args.audit:
            subprocess.run([sys.executable, str(ROOT / "scripts/audit_academy_gaps.py")], check=True, cwd=ROOT)

    print(f"Done ({total} tracks merged)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
