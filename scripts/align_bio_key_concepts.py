#!/usr/bin/env python3
"""
Vervang BIO kernbegrippen door Nederlandse termen die in de theorie voorkomen.
Werkt op content/archive/legacy/BIO_MODULES.md en valideert matches tegen ## Theorie.
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MODULES = ROOT / "content" / "BIO_MODULES.md"

# Termen in volgorde van introductie-prioriteit; moeten in theorie voorkomen.
BIO_KEY_CONCEPTS_NL: dict[str, list[str]] = {
    "wat-is-biodynamisch-proeven": [
        "biodynamisch proeven",
        "observatie",
        "ritmes",
        "timing",
        "patroonherkenning",
    ],
    "maria-thun-oorsprong": [
        "Maria Thun",
        "biodynamische kalender",
        "kosmische ritmes",
        "observaties",
        "drinkmomenten",
    ],
    "vier-dagtypen": [
        "Worteldagen",
        "Bladdagen",
        "Bloemdagen",
        "Vruchtdagen",
        "dagtypen",
    ],
    "elementen-biodynamiek": [
        "aarde",
        "water",
        "lucht",
        "vuur",
        "elementen",
    ],
    "waarom-gebruiken-professionals-dit": [
        "Sommeliers",
        "Wijnmakers",
        "timing",
        "balans",
        "precisie",
    ],
    "worteldagen-uitgelegd": [
        "Worteldagen",
        "structuur",
        "mineraliteit",
        "spanning",
        "aarde",
    ],
    "bladdagen-uitgelegd": [
        "Bladdagen",
        "vegetale",
        "frisheid",
        "water",
        "precisie",
    ],
    "bloemdagen-uitgelegd": [
        "Bloemdagen",
        "aroma",
        "finesse",
        "elegantie",
        "lucht",
    ],
    "vruchtdagen-uitgelegd": [
        "Vruchtdagen",
        "vuur",
        "fruitexpressie",
        "balans",
        "harmonie",
    ],
    "hoe-lees-je-de-kalender": [
        "biodynamische kalender",
        "maanknopen",
        "perigee",
        "apogee",
        "timing",
    ],
    "wijn-op-worteldag": [
        "Worteldagen",
        "structuur",
        "tannines",
        "mineraliteit",
        "bewaarpotentieel",
    ],
    "wijn-op-bladdag": [
        "Bladdagen",
        "vegetale",
        "frisse",
        "groenheid",
        "gebalanceerd",
    ],
    "wijn-op-bloemdag": [
        "Bloemdagen",
        "aromatische",
        "elegantie",
        "finesse",
        "mousse",
    ],
    "wijn-op-vruchtdag": [
        "Vruchtdagen",
        "openheid",
        "harmonie",
        "fruitexpressie",
        "tannines",
    ],
    "eerste-proefexperiment": [
        "vergelijking",
        "dagtypes",
        "patronen",
        "observeren",
        "timing",
    ],
    "temperatuur-en-smaak": [
        "temperatuur",
        "waarneming",
        "balans",
        "structuur",
        "timing",
    ],
    "luchtdruk-en-expressie": [
        "Luchtdruk",
        "focus",
        "openheid",
        "precisie",
        "helderheid",
    ],
    "luchtvochtigheid-en-perceptie": [
        "Luchtvochtigheid",
        "aroma",
        "mondgevoel",
        "spanning",
        "waargenomen",
    ],
    "weersomslag-en-proeven": [
        "Weersomslagen",
        "instabiliteit",
        "expressie",
        "proefmomenten",
        "focus",
    ],
    "dynamic-vs-strategic-advice": [
        "Dynamic Advice",
        "Strategic Advice",
        "dagtype",
        "drinkvensters",
        "vooruitblik",
    ],
    "rode-wijn-per-dagtype": [
        "tannine",
        "structuur",
        "Vruchtdagen",
        "Worteldagen",
        "harmonie",
    ],
    "witte-wijn-per-dagtype": [
        "finesse",
        "mineraliteit",
        "Bloemdagen",
        "Vruchtdagen",
        "precisie",
    ],
    "rose-per-dagtype": [
        "frisheid",
        "fruitexpressie",
        "Vruchtdagen",
        "Bloemdagen",
        "timing",
    ],
    "mousserend-per-dagtype": [
        "mousse",
        "finesse",
        "Bloemdagen",
        "Vruchtdagen",
        "mineraliteit",
    ],
    "port-per-dagtype": [
        "Port",
        "Vintage Port",
        "alcohol",
        "Vruchtdagen",
        "harmonie",
    ],
    "bier-en-biodynamische-dagen": [
        "Bier",
        "hop",
        "bitterheid",
        "mout",
        "timing",
    ],
    "bier-0-0-en-timing": [
        "Alcoholvrije bieren",
        "bitterheid",
        "balans",
        "alcohol",
        "timing",
    ],
    "cocktails-en-dagtypes": [
        "Cocktails",
        "bitters",
        "citrus",
        "finesse",
        "dagtype",
    ],
    "barrel-aged-dranken": [
        "vatgerijpte dranken",
        "hout",
        "oxidatie",
        "complexiteit",
        "timing",
    ],
    "alcoholvrij-en-proefmomenten": [
        "Alcoholvrije dranken",
        "Vruchtdagen",
        "Bloemdagen",
        "structuur",
        "timing",
    ],
    "juiste-fles-juiste-moment": [
        "timing",
        "dagtype",
        "rijpingsfase",
        "strategie",
        "context",
    ],
    "openen-of-wachten": [
        "wachten",
        "dagtype",
        "luchtdruk",
        "openheid",
        "Geduld",
    ],
    "drinkvensters-en-dagtypes": [
        "drinkvenster",
        "Vruchtdag",
        "balans",
        "dagtypes",
        "timing",
    ],
    "voorraadstrategie-topflessen": [
        "Topflessen",
        "dagtype",
        "timing",
        "pairing",
        "strategie",
    ],
    "reserves-lange-termijn": [
        "reserve",
        "timing",
        "rijping",
        "dagtype",
        "wijnplanning",
    ],
    "vertical-tasting-biodynamiek": [
        "vertical tasting",
        "rijping",
        "Vruchtdag",
        "Worteldag",
        "timing",
    ],
    "blindproeven-timing": [
        "Blindproeven",
        "timing",
        "Vruchtdag",
        "Worteldag",
        "interpretatie",
    ],
    "grote-flessen-biodynamiek": [
        "Magnums",
        "ontwikkeling",
        "Vruchtdag",
        "Worteldag",
        "timing",
    ],
    "pairing-dagtypes": [
        "Food pairing",
        "Vruchtdag",
        "Worteldag",
        "structuur",
        "timing",
    ],
    "eigen-biodynamisch-systeem": [
        "observatiesysteem",
        "dagtypes",
        "patronen",
        "data",
        "weersomstandigheden",
    ],
    "perfect-drinkmoment-herkennen": [
        "drinkvenster",
        "dagtype",
        "luchtdruk",
        "pairing",
        "context",
    ],
    "timing-versus-kwaliteit": [
        "timing",
        "kwaliteit",
        "Vruchtdag",
        "top-Barolo",
        "ervaring",
    ],
    "persoonlijke-voorkeurspatronen": [
        "timing",
        "Worteldagen",
        "Vruchtdagen",
        "voorkeuren",
        "stijl",
    ],
    "open-examen-biodynamisch": [
        "dagtype",
        "drinkvenster",
        "pairing",
        "context",
        "evaluatie",
    ],
    "biodynamisch-meesterschap": [
        "meesterschap",
        "patronen",
        "timing",
        "context",
        "strateeg",
    ],
}

KC_STOP = r"(?=\n\n(?:---|# )|\Z)"


def section(body: str, name: str) -> str:
    sm = re.search(rf"## {re.escape(name)}\s*\n(.*?)(?=\n## |\n# |\Z)", body, re.S)
    if not sm:
        return ""
    return re.sub(r"\n---\s*$", "", sm.group(1).strip())


def term_in_theory(term: str, theory: str) -> bool:
    escaped = re.escape(term.strip())
    pattern = re.compile(rf"(?<![\wÀ-ÿ-])({escaped})(?![\wÀ-ÿ-])", re.I | re.U)
    return pattern.search(theory) is not None


def format_key_concepts(terms: list[str]) -> str:
    return "## Kernbegrippen (DB field)\n\n" + "\n".join(f"- {t}" for t in terms) + "\n"


def replace_key_concepts(body: str, terms: list[str]) -> str:
    new_block = format_key_concepts(terms)
    return re.sub(
        rf"## Kernbegrippen \(DB field\)\s*\n.*?{KC_STOP}",
        new_block,
        body,
        count=1,
        flags=re.S,
    )


def apply(modules_path: Path = MODULES, validate_only: bool = False) -> int:
    text = modules_path.read_text(encoding="utf-8")
    errors: list[str] = []
    updated = text

    for m in re.finditer(r"# LES \d+ — .+?\n(.*?)(?=\n# LES \d+ —|\Z)", text, re.S):
        body = m.group(1)
        slug_m = re.search(r"\*\*Slug:\*\*\s*(\S+)", body)
        if not slug_m:
            continue
        slug = slug_m.group(1)
        if slug not in BIO_KEY_CONCEPTS_NL:
            errors.append(f"{slug}: geen mapping")
            continue

        terms = BIO_KEY_CONCEPTS_NL[slug]
        theory = section(body, "Theorie")
        for term in terms:
            if not term_in_theory(term, theory):
                errors.append(f"{slug}: '{term}' niet in theorie")

        if not validate_only:
            new_body = replace_key_concepts(body, terms)
            updated = updated.replace(body, new_body, 1)

    if errors:
        print("Validatiefouten:")
        for err in errors:
            print(f"  - {err}")
        return 1

    if validate_only:
        print(f"OK: {len(BIO_KEY_CONCEPTS_NL)} lessen gevalideerd.")
        return 0

    modules_path.write_text(updated, encoding="utf-8")
    print(f"Bijgewerkt: {modules_path}")
    return 0


def main() -> None:
    validate_only = "--check" in sys.argv
    raise SystemExit(apply(validate_only=validate_only))


if __name__ == "__main__":
    main()
