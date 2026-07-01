"""Wine Foundation Track V2 — Gold Master LOCKED micro-pass data."""

from __future__ import annotations

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bCO2\b", "CO₂"),
    (r"\bco2\b", "CO₂"),
    (r"\bfoodpairing\b", "food pairing"),
    (r"✅[ \t]+", "✅"),
    (r"\nNOTE:\s*\n[^\n]*(?:\n[^\n#][^\n]*)*", ""),
]

KERNBEGRIP_FIXES: dict[int, list[str]] = {
    15: ["blindproeven", "stijlhypothese", "proefintegratie", "proefprotocol", "referentiebibliotheek"],
    20: [
        "structurele harmonie",
        "zwakste schakel",
        "structuurevaluatie",
        "componentintegratie",
        "pairingbeslissing",
    ],
    40: ["trackintegratie", "examenprotocol", "advieslogica", "structuuranalyse", "servicebewustzijn"],
}

FOOD_PAIRING_OVERRIDES: dict[int, str] = {
    15: (
        "### Beste pairing\n\n"
        "Neutraal palate cleanser (water, ongezouten crackertje) tussen proeven.\n\n"
        "### Waarom dit werkt\n\n"
        "Mini-toets meet analyse, niet gastronomie; een schoon palet voorkomt dat vet of zout "
        "je structuur- en aromahypotheses vertekenen.\n\n"
        "### Vermijd\n\n"
        "Umami of zout vóór de blindronde — dat maskeert zuur- en tanninesignalen."
    ),
}

REFLECTIEVRAGEN: dict[int, str] = {
    15: (
        "Welke ene observatie — kleur, aroma of structuur — had jouw conclusie het sterkst "
        "moeten sturen, en waar ging je te snel?"
    ),
    40: (
        "Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste schakel, "
        "en welke ene wekelijkse routine zou dat het snelst verbeteren?"
    ),
}
