"""Central paths for Academy content files."""

from __future__ import annotations

from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CONTENT = ROOT / "content"
PIPELINE = CONTENT / "pipeline"
ARCHIVE = CONTENT / "archive"
LEGACY = ARCHIVE / "legacy"
REPAIR = ARCHIVE / "repair"
INTERMEDIATE = ARCHIVE / "intermediate"

# Track prefix → legacy modules filename (in archive/legacy/)
LEGACY_MODULE_FILES: dict[str, str] = {
    "wine": "WIJN_MODULES.md",
    "white": "WIT_MODULES.md",
    "red": "ROOD_MODULES.md",
    "rose": "ROSE_MODULES.md",
    "mous": "MOUS_MODULES.md",
    "bier": "BIER_MODULES.md",
    "bier_0_0": "BIER_0_0_MODULES.md",
    "port": "PORT_MODULES.md",
    "cock": "COCK_MODULES.md",
    "bio": "BIO_MODULES.md",
}

# Track prefix → ADD repair filename (in archive/legacy/)
ADD_MODULE_FILES: dict[str, str] = {
    "wine": "ADD_WIJN_MODULES.md",
    "white": "ADD_WIT_MODULES.md",
    "red": "ADD_ROOD_MODULES.md",
    "rose": "ADD_ROSE_MODULES.md",
    "mous": "ADD_MOUS_MODULES.md",
    "bier": "ADD_BIER_MODULES.md",
    "bier_0_0": "ADD_BIER_0_0_MODULES.md",
    "port": "ADD_PORT_MODULES.md",
    "cock": "ADD_COCK_MODULES.md",
    "bio": "ADD_BIO_MODULES.md",
}


def final_content(prefix: str) -> Path:
    """Canonical production content: content/{PREFIX}_FINAL_CONTENT.md"""
    return CONTENT / f"{prefix.upper()}_FINAL_CONTENT.md"


def pipeline_content(prefix: str) -> Path:
    """Build output before lock polish: content/pipeline/{PREFIX}_PIPELINE_CONTENT.md"""
    return PIPELINE / f"{prefix.upper()}_PIPELINE_CONTENT.md"


def locked_content(prefix: str) -> Path:
    """Locked polish input/output: content/pipeline/{PREFIX}_LOCKED_CONTENT.md"""
    return PIPELINE / f"{prefix.upper()}_LOCKED_CONTENT.md"


def final_pipeline_content(prefix: str) -> Path:
    """Final-stage pipeline (e.g. bier before lock): content/pipeline/{PREFIX}_FINAL_PIPELINE_CONTENT.md"""
    return PIPELINE / f"{prefix.upper()}_FINAL_PIPELINE_CONTENT.md"


def legacy_modules(track: str) -> Path:
    """Legacy source modules in archive/legacy/."""
    name = LEGACY_MODULE_FILES[track]
    return LEGACY / name


def add_modules(track: str) -> Path:
    """ADD repair archive in archive/legacy/."""
    name = ADD_MODULE_FILES[track]
    return LEGACY / name
