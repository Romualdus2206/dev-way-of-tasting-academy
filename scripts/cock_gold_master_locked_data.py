"""Cocktail Track V2 — Gold Master LOCKED micro-pass data."""

from __future__ import annotations

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\boplogtijd\b", "oplostijd"),
    (r"\bpepperige\b", "peperige"),
    (r"\bwhiskey-forwardere\b", "whiskeygedreven"),
    (r"\bvermoutintegration\b", "vermoutintegratie"),
    (r"\bOverdilutie\b", "Oververdunning"),
    (r"\boverdilutie\b", "oververdunning"),
    (r"\bdilutie\b", "verdunning"),
    (r"\bsweetener\b", "zoetmaker"),
    (r"\bacidity tension\b", "zuurspanning"),
    (r"\bacidity attack\b", "zuuraanval"),
    (r"\bOver-aggressive acidity tension\b", "Te agressieve zuurspanning"),
    (r"\balkoholwarmte\b", "alcoholwarmte"),
    (r"\bfoodpairing\b", "food pairing"),
    (r"\bshaaketijd\b", "schudtijd"),
    (r"\bshaaktijd\b", "schudtijd"),
    (r"\btemperatuuras\b", "temperatuurcontrole"),
    (r"\bpalate weight\b", "gewicht op het palet"),
    (r"\b en tension\b", " en spanning"),
    (r"\btension ✅", "spanning ✅"),
    (r"\bmise en place\b", "mise-en-place"),
    (r"# LES 3 — Spirit, modifier en balance\b", "# LES 3 — Spirit, modifier en balans"),
    (r"\n\nVermelding:.*?(?=\n\n)", ""),
]

GISTING_TERMS: tuple[str, ...] = (
    "mondgevoel",
    "verdunning",
    "integratie",
    "balans",
    "textuur",
    "aromatische lift",
)

BODY_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bbody en mondgevoel\b", "mondgevoel en textuur"),
    (r"\bMeer body\b", "Meer mondgevoel"),
    (r"\bMinder body\b", "Minder mondgevoel"),
    (r"\bmeer body\b", "meer mondgevoel"),
    (r"\bminder body\b", "minder mondgevoel"),
    (r"\bhoge body\b", "vol mondgevoel"),
    (r"\blichte body\b", "licht mondgevoel"),
    (r"\bgecontroleerde body\b", "gecontroleerd mondgevoel"),
    (r"\bvoegt ook body toe\b", "voegt ook mondgevoel toe"),
    (r"\bextra body\b", "extra mondgevoel"),
    (r"\bop body\b", "op mondgevoel"),
    (r"\bbody en\b", "mondgevoel en"),
    (r"\bbody,\b", "mondgevoel,"),
    (r"\bbody en alcoholwarmte\b", "mondgevoel en alcoholwarmte"),
    (r"\bbody en warmte\b", "mondgevoel en warmte"),
    (r"\b- body\b", "- mondgevoel"),
    (r"\bbody en zoetrest\b", "mondgevoel en zoetrest"),
    (r"\bhoge body bij\b", "vol mondgevoel bij"),
    (r"\btoont hoge body\b", "toont vol mondgevoel"),
    (r"\bbitter/body/\b", "bitter/mondgevoel/"),
]

THEORY_OVERRIDES: dict[int, str] = {
    14: (
        "Citrus en suiker vormen het zuur-zoet-paar van talloze klassiekers. Versgeperst sap geeft "
        "levendigheid; flessensap geeft een platte smaak die afzwakt.\n\n"
        "Suikersiroop is de meest gebruikte zoetmaker — lost sneller op dan kristalsuiker en geeft "
        "egale zoetheid. Rijke suikersiroop (2:1) voegt ook mondgevoel toe.\n\n"
        "Zuurbalans is het gevoeligste aspect van cocktailmaken. Een kwart citroen extra of een halve "
        "barlepel zoetmaker meer maakt het verschil tussen vlak en gebalanceerd."
    ),
    18: (
        "De Manhattan is de verfijnde oudere broer van de Old Fashioned. Sweet vermouth vervangt suiker "
        "als zoete component, wat meer kruidigheid en aromatische complexiteit toevoegt aan het profiel.\n\n"
        "Rye whiskey geeft een scherpe, peperige toon die goed contrasteert met de zoetheid van de vermouth. "
        "Bourbon werkt ook maar levert een zachtere, vanilleachtige stijl op. De keuze van de spiritbasis "
        "bepaalt het gehele karakter van de cocktail.\n\n"
        "Angostura bitters verbinden de twee werelden en voegen laagdiepte toe. De verhouding 2:1 "
        "(whiskey:vermouth) is de klassieke standaard, maar 3:1 geeft een drogere, whiskeygedreven stijl "
        "die door velen wordt geprefereerd.\n\n"
        "De Luxardo-kers als garnish is niet louter decoratief — de zoete, amandelachtige smaak interacteert "
        "subtiel met elke slok."
    ),
}

FOOD_PAIRING_WAAROM: dict[int, str] = {
    14: (
        "Zuur snijdt door vet en activeert speeksel; gecontroleerde zoetheid balanceert citrus zonder "
        "umami te vervlakken; zout versterkt aromatische lift op het palet."
    ),
    36: (
        "Zuur reinigt vet tussen happen; zoetheid vangt umami en spice op; bitterheid en alcoholwarmte "
        "geven lengte; koolzuur lift zout; aromatisch contrast houdt het palet wakker zonder disharmonie."
    ),
    37: (
        "Digestieve bitters en alcoholwarmte ondersteunen vet en umami na de maaltijd; gecontroleerde "
        "zoetheid rondt af zonder dessertgevoel; lage temperatuur houdt integratie strak."
    ),
}

PRO_INSIGHTS: dict[int, str] = {
    6: (
        "Train shake-rondes op geluid en gewicht in de shaker: te lang = oververdunning en textuurverlies; "
        "te kort = scherpe zuur zonder integratie. Gebruik dat als teamcalibratie vóór shift — gasten merken "
        "temperatuur en mondgevoel eerder dan jouw handtechniek."
    ),
    7: (
        "Bij stirred cocktails wint verwachtingsmanagement op ijsvolume: te veel ijs in een kleine mixing glass "
        "forceert haast en oververdunning. Werk met vaste ijsblokken en roertijd per recept; dat is senior "
        "dilution management, geen persoonlijke stijl."
    ),
    32: (
        "Ijskwaliteit is gastpsychologie: troebel, klein of smeltend ijs signaleert slordigheid vóór de eerste slok. "
        "Label vriezers per dag en vervang batches op piekmoment — goedkoper dan retourcocktails."
    ),
    34: (
        "Serveerfouten zijn upsell-momenten als je ze zichtbaar corrigeert: koud glas, schone rand, bewuste "
        "citrusexpressie. Gasten betalen voor tempo mét zorg, niet voor show zonder integratie."
    ),
}

REFLECTIEVRAGEN: dict[int, str] = {
    36: (
        "Bij welk gerecht op jouw kaart faalde food pairing het laatst door verkeerde zuur- of bitterstructuur, "
        "en welke ene meting zou je nu eerst doen vóór je opnieuw adviseert?"
    ),
}

QUIZ_PATCHES: dict[int, str] = {
    20: """### Vraag 2

Wat doet aged rum?

A. Minder diepte
B. Meer hout en gewicht op het palet ✅
C. Minder aroma
D. Minder mondgevoel""",
    24: """### Vraag 4

Scenario: White Lady mist aromatische lift in de neus.

A. Meer suiker toevoegen
B. Verse citrusexpressie en kortere shake voor integratie ✅
C. Warmer glas
D. Minder ijs""",
    40: """### Vraag 5

Wat is de beste vervolgstap na structuren-blind?

A. Direct merk raden
B. Matrix invullen voor zuur/zoet/bitter/mondgevoel/alcoholwarmte ✅
C. Alleen garnish wijzigen
D. Recept online opzoeken""",
}

KERNBEGRIP_FIXES: dict[int, list[str]] = {
    32: [
        "smeltcurve",
        "ijskwaliteit",
        "temperatuurcontrole",
        "textuursturing",
        "ice-handling",
    ],
}
