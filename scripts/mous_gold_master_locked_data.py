"""Sparkling / Mousserend Track V2 — Gold Master LOCKED micro-pass data."""

from __future__ import annotations

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bCO2\b", "CO₂"),
    (r"\bco2\b", "CO₂"),
    (r"✅[ \t]+", "✅"),
    (r"\nNOTE:\s*\n[^\n]*(?:\n[^\n#][^\n]*)*", ""),
]

QUIZ_COUNT_OVERRIDES: dict[int, int] = {
    15: 0,
}

KERNBEGRIP_FIXES: dict[int, list[str]] = {
    15: ["blindproeven", "mousse", "productie", "aroma", "structuur"],
}

SAMENVATTING_OVERRIDES: dict[int, str] = {
    15: (
        "- Mini-toets integreert fundamente, productie en blind protocol\n"
        "- Mousse, aroma en structuur sturen methode-hypothese\n"
        "- Documenteer vóór onthulling voor professionele calibratie\n"
        "- Maandelijks herhalen bouwt referentiebibliotheek op\n"
        "- Praktijkgerichte Explorer-afsluiting zonder MC-quiz"
    ),
    40: (
        "- Examen dekt volledige track: theorie, blind en pairing\n"
        "- Theorie: minimaal 75% op 20 vragen\n"
        "- Blind: twee glazen, vijf analyse-aspecten per glas\n"
        "- Pairing: drie gerechten met gemotiveerde stijlkeuze\n"
        "- Certificaten op 75%, 85% en 90% plus correcte blindanalyse"
    ),
}

FOOD_PAIRING_OVERRIDES: dict[int, str] = {
    15: (
        "### Beste pairing\n\n"
        "Neutraal palate cleanser (water, ongezouten crackertje) tussen proeven.\n\n"
        "### Waarom dit werkt\n\n"
        "Blind protocol vraagt een schoon palet; food pairing zou aroma-hypotheses vertekenen.\n\n"
        "### Vermijd\n\n"
        "Zout, umami of vet vóór of tijdens de blindronde."
    ),
    33: (
        "### Beste pairing\n\n"
        "Service-first: open en schenk vóór pairing — mousse begint bij correct openen.\n\n"
        "### Waarom dit werkt\n\n"
        "Techniek bepaalt druk en schuim in het glas; pairing kan pas ná stabiele mousse.\n\n"
        "### Vermijd\n\n"
        "Knallende fles bij gast — verliest premium context ongeacht gerecht."
    ),
}

PRAKTIJK_OVERRIDES: dict[int, str] = {
    40: (
        "### Examenonderdeel 1 — Theorie\n\n"
        "20 vragen. Minimaal 75% goed.\n\n"
        "### Examenonderdeel 2 — Blindproeven\n\n"
        "2 glazen:\n\n"
        "Glas A — analyseer mousse, aroma, structuur, dosage en methode.\n\n"
        "Glas B — analyseer mousse, aroma, structuur, dosage en methode.\n\n"
        "### Examenonderdeel 3 — Pairing\n\n"
        "Kies voor drie gerechten een passende mousserende stijl en motiveer waarom.\n\n"
        "### Beoordeling\n\n"
        "Explorer-certificaat: 75%\n\n"
        "Specialist-certificaat: 85%\n\n"
        "Master-certificaat: 90% + correcte blindanalyse"
    ),
}

REFLECTIEVRAGEN: dict[int, str] = {
    15: (
        "Welke ene observatie — mousse, autolyse of structuur — had je methode-hypothese "
        "het sterkst moeten sturen?"
    ),
    40: (
        "Welk examenonderdeel — theorie, blind of pairing — is jouw zwakste schakel, "
        "en welke ene weekroutine zou dat het meest verkleinen?"
    ),
}
