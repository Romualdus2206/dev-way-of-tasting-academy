#!/usr/bin/env python3
"""One-time: update hardcoded content paths after FINAL_CONTENT restructure."""

from __future__ import annotations

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

REPLACEMENTS: list[tuple[str, str]] = [
    # Canonical FINAL
    ("content/WINE_FINAL_CONTENT.md", "content/WINE_FINAL_CONTENT.md"),
    ("content/WHITE_FINAL_CONTENT.md", "content/WHITE_FINAL_CONTENT.md"),
    ("content/RED_FINAL_CONTENT.md", "content/RED_FINAL_CONTENT.md"),
    ("content/ROSE_FINAL_CONTENT.md", "content/ROSE_FINAL_CONTENT.md"),
    ("content/MOUS_FINAL_CONTENT.md", "content/MOUS_FINAL_CONTENT.md"),
    ("content/BIER_FINAL_CONTENT.md", "content/BIER_FINAL_CONTENT.md"),
    ("content/BIER_0_0_FINAL_CONTENT.md", "content/BIER_0_0_FINAL_CONTENT.md"),
    ("content/PORT_FINAL_CONTENT.md", "content/PORT_FINAL_CONTENT.md"),
    ("content/BIO_FINAL_CONTENT.md", "content/BIO_FINAL_CONTENT.md"),
    ("content/COCK_FINAL_CONTENT.md", "content/COCK_FINAL_CONTENT.md"),
    # Pipeline
    ("content/pipeline/WHITE_PIPELINE_CONTENT.md", "content/pipeline/WHITE_PIPELINE_CONTENT.md"),
    ("content/pipeline/RED_PIPELINE_CONTENT.md", "content/pipeline/RED_PIPELINE_CONTENT.md"),
    ("content/pipeline/ROSE_PIPELINE_CONTENT.md", "content/pipeline/ROSE_PIPELINE_CONTENT.md"),
    ("content/pipeline/WINE_PIPELINE_CONTENT.md", "content/pipeline/WINE_PIPELINE_CONTENT.md"),
    ("content/pipeline/WINE_LOCKED_CONTENT.md", "content/pipeline/WINE_LOCKED_CONTENT.md"),
    ("content/pipeline/MOUS_PIPELINE_CONTENT.md", "content/pipeline/MOUS_PIPELINE_CONTENT.md"),
    ("content/pipeline/MOUS_LOCKED_CONTENT.md", "content/pipeline/MOUS_LOCKED_CONTENT.md"),
    ("content/pipeline/BIER_PIPELINE_CONTENT.md", "content/pipeline/BIER_PIPELINE_CONTENT.md"),
    ("content/pipeline/BIER_FINAL_PIPELINE_CONTENT.md", "content/pipeline/BIER_FINAL_PIPELINE_CONTENT.md"),
    ("content/pipeline/BIER_0_0_PIPELINE_CONTENT.md", "content/pipeline/BIER_0_0_PIPELINE_CONTENT.md"),
    ("content/pipeline/BIO_PIPELINE_CONTENT.md", "content/pipeline/BIO_PIPELINE_CONTENT.md"),
    ("content/pipeline/COCK_PIPELINE_CONTENT.md", "content/pipeline/COCK_PIPELINE_CONTENT.md"),
    # Archive legacy modules
    ("content/archive/legacy/WIJN_MODULES.md", "content/archive/legacy/WIJN_MODULES.md"),
    ("content/archive/legacy/WIT_MODULES.md", "content/archive/legacy/WIT_MODULES.md"),
    ("content/archive/legacy/ROOD_MODULES.md", "content/archive/legacy/ROOD_MODULES.md"),
    ("content/archive/legacy/ROSE_MODULES.md", "content/archive/legacy/ROSE_MODULES.md"),
    ("content/archive/legacy/MOUS_MODULES.md", "content/archive/legacy/MOUS_MODULES.md"),
    ("content/archive/legacy/BIER_MODULES.md", "content/archive/legacy/BIER_MODULES.md"),
    ("content/archive/legacy/BIER_0_0_MODULES.md", "content/archive/legacy/BIER_0_0_MODULES.md"),
    ("content/archive/legacy/PORT_MODULES.md", "content/archive/legacy/PORT_MODULES.md"),
    ("content/archive/legacy/COCK_MODULES.md", "content/archive/legacy/COCK_MODULES.md"),
    ("content/archive/legacy/BIO_MODULES.md", "content/archive/legacy/BIO_MODULES.md"),
    # Archive ADD / repair
    ("content/archive/legacy/ADD_WIJN_MODULES.md", "content/archive/legacy/ADD_WIJN_MODULES.md"),
    ("content/archive/legacy/ADD_WIT_MODULES.md", "content/archive/legacy/ADD_WIT_MODULES.md"),
    ("content/archive/legacy/ADD_ROOD_MODULES.md", "content/archive/legacy/ADD_ROOD_MODULES.md"),
    ("content/archive/legacy/ADD_ROSE_MODULES.md", "content/archive/legacy/ADD_ROSE_MODULES.md"),
    ("content/archive/legacy/ADD_MOUS_MODULES.md", "content/archive/legacy/ADD_MOUS_MODULES.md"),
    ("content/archive/legacy/ADD_BIER_MODULES.md", "content/archive/legacy/ADD_BIER_MODULES.md"),
    ("content/archive/legacy/ADD_BIER_0_0_MODULES.md", "content/archive/legacy/ADD_BIER_0_0_MODULES.md"),
    ("content/archive/legacy/ADD_PORT_MODULES.md", "content/archive/legacy/ADD_PORT_MODULES.md"),
    ("content/archive/legacy/ADD_COCK_MODULES.md", "content/archive/legacy/ADD_COCK_MODULES.md"),
    ("content/archive/legacy/ADD_BIO_MODULES.md", "content/archive/legacy/ADD_BIO_MODULES.md"),
    ("content/archive/repair/PORT_ADD_REPAIR_CONTENT.md", "content/archive/repair/PORT_ADD_REPAIR_CONTENT.md"),
    ("content/archive/repair/COCK_ADD_REPAIR_CONTENT.md", "content/archive/repair/COCK_ADD_REPAIR_CONTENT.md"),
    ("content/archive/repair/BIO_REPAIR_CONTENT.md", "content/archive/repair/BIO_REPAIR_CONTENT.md"),
    ("content/archive/repair/MOUS_REPAIR_CONTENT.md", "content/archive/repair/MOUS_REPAIR_CONTENT.md"),
    ("content/archive/repair/MOUS_REPAIR_M02.md", "content/archive/repair/MOUS_REPAIR_M02.md"),
    ("content/archive/repair/PORT_REPAIR_CONTENT.md", "content/archive/repair/PORT_REPAIR_CONTENT.md"),
    ("content/archive/repair/COCK_REPAIR_CONTENT.md", "content/archive/repair/COCK_REPAIR_CONTENT.md"),
    ("content/archive/repair/COCK_REPAIR_APEROL_SPRITZ.md", "content/archive/repair/COCK_REPAIR_APEROL_SPRITZ.md"),
    # Port intermediate
    ("content/archive/intermediate/PORT_TRACK_V2_CANONICAL.md", "content/archive/intermediate/PORT_TRACK_V2_CANONICAL.md"),
    ("content/archive/intermediate/PORT_TRACK_V2_FINAL.md", "content/archive/intermediate/PORT_TRACK_V2_FINAL.md"),
    ("content/archive/intermediate/PORT_TRACK_V2_PERFECT.md", "content/archive/intermediate/PORT_TRACK_V2_PERFECT.md"),
    ("content/archive/intermediate/PORT_TRACK_V2_README.md", "content/archive/intermediate/PORT_TRACK_V2_README.md"),
]

GLOBS = [
    ROOT / "scripts",
    ROOT / "docs",
    ROOT / "content/README.md",
]


def migrate_file(path: Path) -> int:
    text = path.read_text(encoding="utf-8")
    original = text
    for old, new in REPLACEMENTS:
        text = text.replace(old, new)
    if text != original:
        path.write_text(text, encoding="utf-8")
        return 1
    return 0


def main() -> None:
    changed = 0
    for base in GLOBS:
        if base.is_file():
            changed += migrate_file(base)
            continue
        for path in base.rglob("*"):
            if path.suffix in {".py", ".md", ".mjs"} and path.is_file():
                changed += migrate_file(path)
    print(f"Updated {changed} files")


if __name__ == "__main__":
    main()
