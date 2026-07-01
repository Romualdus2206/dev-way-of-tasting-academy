#!/usr/bin/env python3
"""
Valideer (en optioneel bijwerken) COCK kernbegrippen tegen ## Theorie.
Na premium repair staan termen al in COCK_MODULES; dit script is de BIO-parity check.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MODULES = ROOT / "content" / "COCK_MODULES.md"

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
    pattern = re.compile(rf"(?<![\wÀ-ÿ-])({escaped})(?![\wÀ-ÿ-])", re.I | re.U)
    return pattern.search(theory) is not None


def apply(modules_path: Path = MODULES, validate_only: bool = False) -> int:
    text = modules_path.read_text(encoding="utf-8")
    errors: list[str] = []
    checked = 0

    for m in re.finditer(r"# LES \d+ — .+?\n(.*?)(?=\n# LES \d+ —|\Z)", text, re.S):
        body = m.group(1)
        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", body)
        if not slug_m:
            continue
        slug = slug_m.group(1)
        theory = section(body, "Theorie")
        terms = parse_key_concepts(body)
        if not terms:
            errors.append(f"{slug}: geen kernbegrippen")
            continue
        checked += 1
        for term in terms:
            if not term_in_theory(term, theory):
                errors.append(f"{slug}: '{term}' niet in theorie")

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
