#!/usr/bin/env python3
"""Valideer Port kernbegrippen tegen ## Theorie (per LES-nummer)."""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MODULES = ROOT / "content/archive/legacy/PORT_MODULES.md"

KC_STOP = r"(?=\n\n(?:---|# )|\Z)"


def section(body: str, name: str) -> str:
    sm = re.search(rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\n# |\Z)", body, re.S)
    if not sm:
        return ""
    return re.sub(r"\n---\s*$", "", sm.group(1).strip())


def parse_key_concepts(body: str) -> list[str]:
    block = section(body, "Kernbegrippen (DB field)")
    return [ln.lstrip("- ").strip() for ln in block.splitlines() if ln.strip().startswith("-")]


def term_in_theory(term: str, theory: str) -> bool:
    escaped = re.escape(term.strip())
    return bool(
        re.search(rf"(?<![\wÀ-ÿ-])({escaped})(?![\wÀ-ÿ-])", theory, re.I | re.U)
    )


def apply(modules_path: Path = MODULES, validate_only: bool = False) -> int:
    text = modules_path.read_text(encoding="utf-8")
    errors: list[str] = []
    checked = 0

    for m in re.finditer(r"^# LES (\d+) — .+?\n(.*?)(?=^# LES \d+ —|\Z)", text, re.S | re.M):
        num = m.group(1)
        body = m.group(2)
        theory = section(body, "Theorie")
        terms = parse_key_concepts(body)
        if not terms:
            errors.append(f"LES {num}: geen kernbegrippen")
            continue
        checked += 1
        for term in terms:
            if not term_in_theory(term, theory):
                errors.append(f"LES {num}: '{term}' niet in theorie")

    if errors:
        print("Validatiefouten:")
        for err in errors:
            print(f"  - {err}")
        return 1

    if validate_only:
        print(f"OK: {checked} lessen gevalideerd.")
        return 0

    print(f"Geen wijzigingen nodig ({checked} lessen OK).")
    return 0


def main() -> None:
    validate_only = "--check" in sys.argv
    raise SystemExit(apply(validate_only=validate_only))


if __name__ == "__main__":
    main()
