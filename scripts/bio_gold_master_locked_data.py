"""Bio Track V2 — Gold Master LOCKED micro-pass data."""

from __future__ import annotations

STANDARD_CHECKLIST = """### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit"""

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bDynamic advice\b", "Dynamisch advies"),
    (r"\bStrategic advice\b", "Strategisch advies"),
    (r"\bDynamic Advice\b", "Dynamisch advies"),
    (r"\bStrategic Advice\b", "Strategisch advies"),
    (r"\bDynamic en Strategic Advice\b", "Dynamisch en strategisch advies"),
    (r"\bDynamic vs Strategic Advice\b", "Dynamisch versus strategisch advies"),
    (r"# LES 20 — Dynamic vs Strategic Advice\b", "# LES 20 — Dynamisch versus strategisch advies"),
    (r"achter Dynamic en Strategic Advice\b", "achter dynamisch en strategisch advies"),
    (r"\bWat betekent Dynamic Advice\?\b", "Wat betekent dynamisch advies?"),
    (r"\bWat betekent Strategic Advice\?\b", "Wat betekent strategisch advies?"),
    (r"\bLange termijn planning\b", "Lange-termijnplanning"),
    (r"\bDynamic en Strategisch advies\b", "dynamisch en strategisch advies"),
    (r"\bStrategic planning\b", "Strategische planning"),
    (r"\btasting notes\b", "proefnotities"),
    (r"\bprivate dinner\b", "privédiner"),
    (r"\bcollector night\b", "verzamelaarsavond"),
    (r"\bkeuzeverantwoording\b", "openingsbesluit"),
    (r"  +✅", " ✅"),
    (r"✅ ", "✅"),
]

SLUG_OVERRIDES: dict[int, str] = {
    20: "dynamisch-vs-strategisch-advies",
}

GOLD_KEY_CONCEPTS_PATCHES: dict[int, list[str]] = {
    1: ["biodynamisch proeven", "proefcontext", "dagtype", "besliskader", "servicevenster"],
    20: ["dynamisch advies", "strategisch advies", "openingsbesluit", "voorraadplanning", "servicebesluit"],
}

REFLECTIEVRAGEN_PATCHES: dict[int, str] = {
    45: (
        "Welke drie beslissingen uit deze track pas je volgende week toe op topfles, voorraad en gastadvies — "
        "en welk risico mitigeer je daarmee?"
    ),
}

QUIZ_PATCHES: dict[int, str] = {
    20: """### Vraag 1

Dynamisch advies kijkt naar:

A. Nu ✅
B. Over 6 maanden
C. Alleen voorraad
D. Alleen prijs

### Vraag 2

Strategisch advies kijkt naar:

A. Toekomst ✅
B. Alleen vandaag
C. Alleen temperatuur
D. Alleen druivenras""",
    34: """### Vraag 1

Strategische planning combineert:

A. Alles ✅
B. Alleen weer
C. Alleen dagtype
D. Alleen leeftijd""",
}

QUIZ_FEEDBACK_PATCHES: dict[int, str] = {
    20: (
        "Perfect. Je begrijpt nu de volledige logica achter dynamisch en strategisch advies "
        "en hoe deze direct aansluiten op je app-ecosysteem."
    ),
}

PRAKTIJK_OVERRIDES: dict[int, str] = {
    4: (
        "### Opdracht\n\n"
        "Kies vier dranken uit je assortiment en koppel elk aan het dominante element (aarde, water, lucht, vuur). "
        "Onderbouw per keuze met één sensorisch signaal en één service-implicatie.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    17: (
        "### Opdracht\n\n"
        "Proef dezelfde wijn op twee momenten met meetbaar verschil in luchtdruk (hoge versus lage druk volgens "
        "weerdata of kelderlogboek). Houd glas, temperatuur en beluchting constant en vergelijk geurintensiteit, "
        "openheid, focus, precisie en lengte.\n\n"
        "### Checklist\n\n"
        "- Ik noteerde luchtdruk en tijdstip per proefmoment\n"
        "- Ik hield serveercondities constant tussen beide momenten\n"
        "- Ik vergeleek geurintensiteit, openheid, focus, precisie en lengte\n"
        "- Ik formuleerde een openingsbesluit op basis van het drukverschil"
    ),
    18: (
        "### Opdracht\n\n"
        "Open een mousserende wijn of Riesling en noteer geurontwikkeling, mondgevoel, spanning, mousse en frisheid. "
        "Meet tegelijk de luchtvochtigheid in de proefruimte en herhaal de observatie na 15 minuten in dezelfde setting.\n\n"
        "### Checklist\n\n"
        "- Ik noteerde luchtvochtigheid vóór en tijdens de proef\n"
        "- Ik beschreef geur, mondgevoel, spanning, mousse en frisheid\n"
        "- Ik vergeleek beide meetmomenten op aromadefinitie\n"
        "- Ik vertaalde het resultaat naar een glas- of zaalbesluit"
    ),
    19: (
        "### Opdracht\n\n"
        "Controleer vóór je volgende topflesopening de weerscontext: luchtdruktrend, temperatuurtrend, "
        "neerslagkans en weersstabiliteit. Bepaal daarna of je opent, wacht of naar je B-plan schakelt.\n\n"
        "### Checklist\n\n"
        "- Ik noteerde luchtdruktrend en temperatuurtrend\n"
        "- Ik checkte neerslagkans en weersstabiliteit\n"
        "- Ik koos tussen openen, wachten of B-plan\n"
        "- Ik legde het servicebesluit in één zin vast voor het team"
    ),
    24: (
        "### Opdracht\n\n"
        "Open een Champagne of mousserende wijn en noteer mousse, geur, spanning, finesse en lengte. "
        "Herhaal dezelfde proef op een ander dagtype met identieke serveercondities en vergelijk de resultaten.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    37: (
        "### Opdracht\n\n"
        "Blindproef twee wijnen op een Vruchtdag en herhaal dit op een Worteldag. Vergelijk herkenbaarheid, "
        "openheid, structuur en advieskwaliteit per dagtype.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    39: (
        "### Opdracht\n\n"
        "Kies één wijn en combineer deze op twee verschillende dagtypes met hetzelfde gerecht. "
        "Analyseer harmonie, spanning, contrast en lengte. Plan het experiment over 2–4 weken onder vergelijkbare omstandigheden.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    42: (
        "### Opdracht\n\n"
        "Vergelijk een topwijn op een minder gunstig moment met een goede wijn op een sterk moment. "
        "Analyseer balans, plezier, expressie en memorabiliteit — en formuleer welke timingbeslissing je voortaan anders neemt.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    43: (
        "### Opdracht\n\n"
        "Maak een overzicht van je favoriete dagtype, je minst favoriete dagtype en je meest gevoelige wijnstijl. "
        "Koppel elk patroon aan minimaal twee concrete service- of voorraadbesluiten.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    31: (
        "### Opdracht\n\n"
        "Bouw een fleskeuze-matrix voor drie scenario's (zakelijke lunch, privédiner, verzamelaarsavond). "
        "Leg per scenario je primaire en secundaire keuze vast met argumenten op context, budget en drinkdoel.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    32: (
        "### Opdracht\n\n"
        "Voer een openen-wachten-protocol uit met twee flessen van verschillende stijl. "
        "Noteer observaties op 0, 10 en 20 minuten en formuleer per meetpunt een servicebesluit.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    33: (
        "### Opdracht\n\n"
        "Maak voor tien flessen een drinkvenster-kaart met drie zones: nu, binnenkort, later. "
        "Koppel elke inschatting aan minimaal twee concrete signalen of databronnen.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    34: (
        "### Opdracht\n\n"
        "Ontwerp een topvoorraadplan voor zes maanden met segmenten snel, midden en lang ritme. "
        "Benoem per segment gewenste rotatiesnelheid en triggers voor herbevoorrading.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    35: (
        "### Opdracht\n\n"
        "Evalueer je reservekelder op spreiding en concentratierisico. "
        "Stel een reservebeleid op met releasecriteria, vervangregels en kwartaalreview.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    36: (
        "### Opdracht\n\n"
        "Ontwerp en leid een mini-vertical met minimaal drie jaargangen. "
        "Gebruik een vast protocol en sluit af met drie operationele conclusies voor aankoop of service.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    40: (
        "### Opdracht\n\n"
        "Bouw je eigen beslissysteem in maximaal zeven stappen, van contextcheck tot eindadvies. "
        "Test het systeem op vijf uiteenlopende cases en noteer waar het moet worden bijgesteld.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    44: (
        "### Opdracht\n\n"
        "Werk een open examen-casus uit met volledige redenering: aannames, opties, keuze, risico en evaluatie. "
        "Laat je uitwerking peer-reviewen en verwerk minimaal twee kritische verbeterpunten.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    1: (
        "### Opdracht\n\n"
        "Kies een fles uit je huidige voorraad die binnen twee jaar op dronk is. Noteer fruitintensiteit, "
        "aromatische openheid, zuurgraad, structuur en lengte. Herhaal dit op een ander dagtype.\n\n"
        "### Checklist\n\n"
        "- Ik formuleerde een hypothese over het dagtype-effect\n"
        "- Ik noteerde dezelfde serveercondities bij beide momenten\n"
        "- Ik vergeleek observaties in vaste volgorde (aroma → structuur → lengte)\n"
        "- Ik koppelde het resultaat aan een openings- of adviesbesluit"
    ),
    3: (
        "### Opdracht\n\n"
        "Proef dezelfde wijn op een Worteldag en een Vruchtdag. Noteer fruit, tannine, lengte, balans en "
        "drinkbaarheid. Plan het experiment over 2–4 weken onder vergelijkbare omstandigheden.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    5: (
        "### Opdracht\n\n"
        "Kies één topfles uit je voorraad en plan met de biodynamische kalender: openingsdag, serveertemperatuur, "
        "pairing en decanteertijd.\n\n"
        "### Checklist\n\n"
        "- Ik noteerde het gekozen dagtype en tijdsblok\n"
        "- Ik koppelde openingsdag aan serveertemperatuur en decanteertijd\n"
        "- Ik legde pairing en gastcontext vast\n"
        "- Ik formuleerde een concreet topflesmoment voor het team"
    ),
    10: (
        "### Opdracht\n\n"
        "Bekijk de kalender van vandaag en noteer actief dagtype, wisselmomenten, eventuele nodes en het "
        "stabielste tijdsblok. Koppel hier één fles uit je voorraad aan.\n\n"
        "### Checklist\n\n"
        "- Ik noteerde dagtype en wisselmomenten\n"
        "- Ik identificeerde het stabielste tijdsblok\n"
        "- Ik koppelde één concrete fles aan de kalendercontext\n"
        "- Ik formuleerde een servicebesluit voor vandaag"
    ),
    21: (
        "### Opdracht\n\n"
        "Open dezelfde rode wijn op een Worteldag en een Vruchtdag. Noteer fruit, tannine, balans, lengte en "
        "drinkbaarheid. Plan het experiment over 2–4 weken onder vergelijkbare omstandigheden.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
    23: (
        "### Opdracht\n\n"
        "Open een rosé op een Vruchtdag en een Bloemdag. Vergelijk fruit, frisheid, finesse, spanning en "
        "drinkbaarheid onder identieke serveercondities.\n\n"
        f"{STANDARD_CHECKLIST}"
    ),
}

EXAM_QUIZ_PATCH = """### Vraag 11

Wat betekent dynamisch advies?

A. Drinkadvies voor nu ✅
B. Drinkadvies over 6 maanden
C. Alleen voorraadbeheer
D. Alleen weer

### Vraag 12

Wat betekent strategisch advies?

A. Lange-termijnplanning ✅
B. Alleen vandaag
C. Alleen pairing
D. Alleen weer"""
