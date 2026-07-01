"""Bier 0.0 Track V2 — Gold Master data (lessons 1-22)."""

from __future__ import annotations

import re

TERMINOLOGY_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bfoodpairing\b", "food pairing"),
    (r"\bmouthfeel\b", "mondgevoel"),
    (r"\btexture\b", "textuur"),
    (r"\bTexture\b", "Textuur"),
    (r"\bbody\b", "body"),
    (r"\bNa deze les begrijp je\b", "Na deze les kun jij"),
    (r"\bNa deze les herken je\b", "Na deze les kun jij"),
    (r"\bNa deze les kun je\b", "Na deze les kun jij"),
]

_CITE_ARTIFACT = r"\s*:contentReference\[oaicite:\d+\]\{index=\d+\}\.?"


def fix_artifacts(text, lesson_num=None):
    if not text:
        return ""
    text = re.sub(_CITE_ARTIFACT, "", text)
    text = re.sub(r"contentReference\[oaicite:\d+\]\{index=\d+\}", "", text)
    text = re.sub(r"\bTODO\b|\bFIXME\b", "", text, flags=re.I)
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = re.sub(r" {2,}", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    return text.strip()


def _fp(beste, waarom, vermijd):
    return (
        f"### Beste pairing\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


def merge_part2():
    from bier_0_0_gold_master_data_part2 import apply_part2

    apply_part2()


MODULE_META: dict[int, dict[str, str]] = {
    1: {"title": "Fundament", "level": "Explorer", "pillar": "Fundament"},
    2: {"title": "Productie", "level": "Explorer", "pillar": "Productie"},
    3: {"title": "Proeven", "level": "Explorer", "pillar": "Proeven"},
    4: {"title": "Klassieke stijlen", "level": "Specialist", "pillar": "Stijlen"},
    5: {"title": "Markt & Innovatie", "level": "Specialist", "pillar": "Markt"},
    6: {"title": "Gezondheid & Lifestyle", "level": "Specialist", "pillar": "Lifestyle"},
    7: {"title": "Service", "level": "Master", "pillar": "Service"},
    8: {"title": "Pairing & Gastronomie", "level": "Master", "pillar": "Gastronomie"},
    9: {"title": "Blindproeven & Examen", "level": "Master", "pillar": "Integratie"},
}

MODULE_GOALS: dict[int, str] = {
    1: (
        "Je legt het fundament: definitie, productielogica, categorieën en waarom bier 0.0 "
        "professioneel anders gelezen wordt dan frisdrank of water."
    ),
    2: (
        "Je koppelt de belangrijkste de-alcoholisatietechnieken aan smaakresultaat, "
        "zodat je productiekwaliteit kunt inschatten zonder marketingtaal."
    ),
    3: (
        "Je proeft bier 0.0 systematisch op body, restsuiker, bitterbalans en lengte — "
        "de basis voor elke stijl- en servicebeslissing daarna."
    ),
    4: (
        "Je beheerst de klassieke 0.0-stijlen als smaakarchitecturen met gastronomische "
        "en verkoopbare advieslogica per stijl."
    ),
    5: (
        "Je leest markt, craft en premiumpositionering als besliskader voor assortiment, "
        "gastadvies en upsell in foodservice."
    ),
    6: (
        "Je adviseert gezondheid en lifestyle met nuance: context, moment en verwachting "
        "zonder medische claims of consumentenmarketing."
    ),
    7: (
        "Je serveert bier 0.0 op Master-niveau: temperatuur, glas, schuim, presentatie "
        "en foutpreventie in echte horecasituaties."
    ),
    8: (
        "Je bouwt technische food pairings op bitterheid, vet, zout, umami, koolzuur "
        "en textuur — niet op generieke combinaties."
    ),
    9: (
        "Je integreert blindproeven, stijlkeuze per moment en examenniveau tot "
        "professioneel Bier 0.0 Master-advies."
    ),
}

MODULE_KERNBEGRIPPEN: dict[int, list[str]] = {
    1: [
        "alcoholvrij bier",
        "0.0-regelgeving",
        "de-alcoholisatie",
        "fermentatie",
        "categorielogica",
        "restsuiker",
        "body",
        "aroma",
        "pils",
        "IPA",
    ],
    2: [
        "gestopte fermentatie",
        "vacuümdestillatie",
        "reverse osmosis",
        "aroma-retentie",
        "balans zonder alcohol",
        "restsuiker",
        "mondgevoel",
        "productiekwaliteit",
        "techniekkeuze",
        "smaakverlies",
    ],
    3: [
        "proefstructuur",
        "body",
        "restsuiker",
        "bitterbalans",
        "aromatische intensiteit",
        "lengte",
        "mondgevoel",
        "frisheid",
        "drinkbaarheid",
        "blindproeven",
    ],
    4: [
        "0.0-pils",
        "0.0-IPA",
        "0.0-witbier",
        "0.0-blond",
        "0.0-donker",
        "stijlherkenning",
        "bitterbalans",
        "food pairing",
        "gastadvies",
        "stijlkeuze",
    ],
    5: [
        "massamarkt",
        "craft 0.0",
        "isotone positionering",
        "functioneel bier",
        "premium alcoholvrij",
        "assortimentslogica",
        "upsell",
        "merkpositionering",
        "innovatie",
        "gastsegment",
    ],
    6: [
        "sportcontext",
        "calorievergelijking",
        "restsuiker",
        "hydratatie",
        "sociale context",
        "alcohol-switch",
        "nuance",
        "momentkeuze",
        "verwachtingsmanagement",
        "lifestyle-advies",
    ],
    7: [
        "serveertemperatuur",
        "glaswerk",
        "presentatie",
        "schuimkwaliteit",
        "inschenken",
        "bewaring",
        "serviceflow",
        "foutpreventie",
        "horeca-advies",
        "beleving",
    ],
    8: [
        "lunchpairing",
        "kaaspairing",
        "contrast",
        "harmonie",
        "vet-bitter",
        "koolzuur-zout",
        "umami",
        "textuur",
        "gastronomie",
        "Maillard-brug",
    ],
    9: [
        "blindvergelijking",
        "stijlherkenning",
        "pils versus 0.0",
        "IPA versus 0.0",
        "mondgevoel",
        "examen",
        "certificering",
        "integratie",
        "gasttype-advies",
        "momentkeuze",
    ],
}

LEERDOELEN: dict[int, str] = {}
SUMMARIES: dict[int, list[str]] = {}
GOLD_KEY_CONCEPTS: dict[int, list[str]] = {}
REFLECTIEVRAGEN: dict[int, str] = {}
FOOD_PAIRING: dict[int, str] = {}
PRO_INSIGHTS: dict[int, str] = {}
THEORY_OVERRIDES: dict[int, str] = {}
THEORY_MENTIONS: dict[int, str] = {}
QUIZ_PATCHES: dict[int, str] = {}
QUIZ_FULL: dict[int, str] = {}
QUIZ_FEEDBACK: dict[int, str] = {}
QUIZ_COUNT_OVERRIDES: dict[int, int] = {15: 10, 35: 10, 40: 10, 44: 0}
EXAMENONDERDELEN: dict[int, str] = {}

# --- Lessons 1-5 (Explorer M1) ---

LEERDOELEN.update(
    {
        1: "Na deze les kun jij uitleggen wat bier 0.0 is, wanneer het juridisch 0.0 heet en waarom de categorie in foodservice snel groeit.",
        2: "Na deze les kun jij de drie kernmethoden voor de-alcoholisatie benoemen en per methode één smaakgevolg formuleren.",
        3: "Na deze les kun jij uitleggen waarom bier 0.0 smaaktechnisch dichter bij bier staat dan bij frisdrank of water.",
        4: "Na deze les kun jij de belangrijkste mijlpalen in alcoholvrij bier plaatsen en vertalen naar hedendaagse gastverwachting.",
        5: "Na deze les kun jij de vijf hoofdcategorieën binnen bier 0.0 herkennen en koppelen aan serveermoment.",
    }
)

SUMMARIES.update(
    {
        1: [
            "0.0 betekent maximaal 0,05% alcohol in de EU-context",
            "Het product blijft gebrouwen bier met gecontroleerde alcoholverwijdering",
            "Groei komt uit moment, gewoonte en professionele assortimentsuitbreiding",
        ],
        2: [
            "Gestopte fermentatie, vacuümdestillatie en reverse osmosis zijn de kernroutes",
            "Elke route heeft andere gevolgen voor restsuiker, aroma en mondgevoel",
            "Productiekeuze bepaalt of een 0.0 premium of compromis aanvoelt",
        ],
        3: [
            "Bier 0.0 behoudt mout-hop-giststructuur beter dan simulatiefris",
            "Body en bitterbalans zijn de grootste kwaliteitsindicatoren",
            "De categorie vraagt om proefdiscipline, niet om etiketvergelijking",
        ],
        4: [
            "Alcoholvrij bier is geen trend van gisteren maar een hernieuwde categorie",
            "Technologische vooruitgang maakte smaakbehoud houdbaar",
            "Gasten verwachten nu kwaliteit, niet alleen afwezigheid van alcohol",
        ],
        5: [
            "Pils, IPA, witbier, blond en donker vormen het stijlspectrum",
            "Elke stijl heeft eigen pairing- en servicevenster",
            "Categoriekennis voorkomt generiek 'alcoholvrij' advies",
        ],
    }
)

GOLD_KEY_CONCEPTS.update(
    {
        1: ["0.0-regelgeving", "de-alcoholisatie", "fermentatie", "categoriegroei", "proefbasis"],
        2: ["gestopte fermentatie", "vacuümdestillatie", "reverse osmosis", "aroma-retentie", "restsuiker"],
        3: ["smaakstructuur", "body", "bitterbalans", "mondgevoel", "categorie-uniekheid"],
        4: ["geschiedenis", "technologische sprong", "gastverwachting", "kwaliteitsnorm", "marktgroei"],
        5: ["pils", "IPA", "witbier", "blond", "donker"],
    }
)

REFLECTIEVRAGEN.update(
    {
        1: "Een gast vraagt of 0.0 'echt bier' is. Welke twee zinnen gebruik je om vertrouwen te geven zonder te technisch te worden?",
        2: "Je proeft twee 0.0-bieren met verschillende zoetheid. Welke productiemethode vermoed je eerst en waarom?",
        3: "Waarom is body bij 0.0 een betere kwaliteitsindicator dan alleen frisheid of koolzuur?",
        4: "Welke historische ontwikkeling verklaart dat gasten nu wél premium 0.0 verwachten?",
        5: "Je moet snel een stijl kiezen voor een lichte lunch. Welke categorie kies je en op welke smaakparameter baseer je dat?",
    }
)

QUIZ_PATCHES.update(
    {
        1: """### Vraag 1

Een gast ziet 0,5% op een label en vraagt of dat 'echt 0.0' is. Wat antwoord je professioneel?

A. Ja, dat is hetzelfde
B. Nee, 0.0 is maximaal 0,05% in de EU-context ✅
C. Alles onder 1% telt als 0.0
D. Alleen thuisbier mag 0.0 heten

### Vraag 2

Waarom brouwt de industrie 0.0 meestal als volledig bier en verwijdert daarna alcohol?

A. Om hop te vermijden
B. Om mout-hop-giststructuur maximaal te behouden ✅
C. Om suiker wettelijk te verhogen
D. Om geen koolzuur te gebruiken

### Vraag 3

Een horecakaart wil alcoholvrij uitbreiden zonder frisdrankgevoel. Wat is je kernargument voor bier 0.0?

A. Het is altijd gezonder
B. Het behoudt bierstructuur en pairinglogica ✅
C. Het is altijd goedkoper
D. Het heeft geen bitterheid

### Vraag 4

Welke situatie verklaart de snelle categoriegroei het best?

A. Hogere alcoholpercentages
B. Meer momenten waarop gasten bewust alcohol willen mijden ✅
C. Minder interesse in smaak
D. Verplichte wetgeving in alle landen

### Vraag 5

Wat is het grootste proefrisico bij instap in bier 0.0?

A. Te veel schuim
B. Alleen naar merk kijken in plaats van body en balans ✅
C. Te warm serveren
D. Te veel glaswerkkeuze""",
        4: """### Vraag 4

Waarom groeit premium 0.0 sneller dan tien jaar geleden?

A. Gasten accepteren smaakverlies
B. Techniek en verwachting zijn beide verbeterd ✅
C. Alcohol is verboden
D. Pils bestaat niet meer""",
    }
)

# --- Lessons 6-10 (Explorer M2) ---

LEERDOELEN.update(
    {
        6: "Na deze les kun jij gestopte fermentatie uitleggen en het smaakprofiel koppelen aan restsuiker en mondgevoel.",
        7: "Na deze les kun jij vacuümdestillatie beschrijven en benoemen welk aroma-risico je proeft controleert.",
        8: "Na deze les kun jij reverse osmosis positioneren als filtratieroute met specifieke balansgevolgen.",
        9: "Na deze les kun jij aroma-retentie beoordelen en benoemen welke productiestap het meest kritisch is.",
        10: "Na deze les kun jij balans zonder alcohol analyseren via zoetheid, bitterheid, koolzuur en lengte.",
    }
)

SUMMARIES.update(
    {
        6: [
            "Vroeg stoppen van fermentatie beperkt alcohol maar verhoogt restsuiker",
            "Zoetheid en mondgevoel zijn hier het snelste proefsignaal",
            "Methode past vaak bij lichtere, instapgerichte 0.0",
        ],
        7: [
            "Alcohol verdampt onder verlaagde druk en temperatuur",
            "Hop- en esteraroma's zijn kwetsbaar voor warmte-effecten",
            "Kwaliteit zit in hoeveel aroma na de stap behouden blijft",
        ],
        8: [
            "Filtratie scheidt alcohol voordat smaak opnieuw samengevoegd wordt",
            "Controle over recombinatie bepaalt body en frisheid",
            "Technisch zwaarder maar potentieel aromatischer",
        ],
        9: [
            "Aroma is bij 0.0 het eerste wat gasten missen bij kwaliteitsverlies",
            "Productie, bewaring en service versterken of vernietigen aroma",
            "Proef op intensiteit, niet alleen op herkenbare hop",
        ],
        10: [
            "Zonder alcohol moet balans uit mout, hop, koolzuur en textuur komen",
            "Te zoet of te dun eindigt sneller bij 0.0",
            "Lengte en bittere afdronk compenseren bodyverlies",
        ],
    }
)

GOLD_KEY_CONCEPTS.update(
    {
        6: ["gestopte fermentatie", "restsuiker", "mondgevoel", "zoetheid", "lichte stijl"],
        7: ["vacuümdestillatie", "aroma-verlies", "temperatuur", "hopkwetsbaarheid", "kwaliteitscontrole"],
        8: ["reverse osmosis", "filtratie", "recombinatie", "body", "frisheid"],
        9: ["aroma-retentie", "esters", "hoparoma", "bewaring", "intensiteit"],
        10: ["balans", "zoetheid", "bitterheid", "koolzuur", "lengte"],
    }
)

REFLECTIEVRAGEN.update(
    {
        6: "Je proeft een 0.0 met opvallende zoetheid en lichte body. Past gestopte fermentatie bij dit profiel — en hoe onderbouw je dat?",
        7: "Welk aroma-element verlies je het eerst bij onzorgvuldige destillatie, en hoe merk je dat in service?",
        8: "Wanneer kies je reverse osmosis als verklaring voor een frisser, aromatischer profiel boven gestopte fermentatie?",
        9: "Beschrijf één product dat aroma sterk behoudt en één dat vlak ruikt: welke productiestap verschilt waarschijnlijk?",
        10: "Welke parameter corrigeer je als eerste wanneer een 0.0 zoet maar waterig aanvoelt?",
    }
)

# --- Lessons 11-15 (Explorer M3) ---

LEERDOELEN.update(
    {
        11: "Na deze les kun jij bier 0.0 systematisch proeven met een vaste volgorde van visueel, aroma en smaak.",
        12: "Na deze les kun jij body in 0.0 beoordelen via gewicht, textuur en restsuiker-zoetheid.",
        13: "Na deze les kun jij restsuiker en zoetheid herkennen zonder ze te verwarren met bitterheid of koolzuur.",
        14: "Na deze les kun jij bitterbalans en lengte analyseren als compensatie voor afwezige alcoholwarmte.",
        15: "Na deze les kun jij de Explorer-basis integreren in een korte blindproef met onderbouwde stijlkeuze.",
    }
)

THEORY_MENTIONS.update(
    {
        11: (
            "Proef altijd op mondgevoel en lengte na de eerste slok: bij 0.0 bepaalt dat of een stijl "
            "drinkbaar blijft of snel uitputtend aanvoelt."
        ),
        12: (
            "Body beoordeel je op gewicht op het middel van de tong, textuur en hoe lang smaak blijft hangen — "
            "niet op alcoholwarmte die hier ontbreekt."
        ),
        13: (
            "Restsuiker voelt rond en plakkerig-zacht; koolzuur voelt scherp en liftend. Verwar die twee niet "
            "in je notities."
        ),
        14: (
            "Bitterheid zonder alcohol vraagt om schonere hoplijn en gecontroleerde afdronk; te harde bitter "
            "maskeert geen dunne body meer."
        ),
    }
)

SUMMARIES.update(
    {
        11: [
            "Visueel → aroma → smaak in vaste volgorde",
            "Body en balans zijn prioriteit bij 0.0",
            "Objectieve structuur verslaat merkvooroordeel",
        ],
        12: [
            "Body is gewicht en textuur, niet alcoholwarmte",
            "Restsuiker en eiwitten dragen body op",
            "Dunne body is het meest voorkomende 0.0-defect",
        ],
        13: [
            "Zoetheid komt uit restsuiker, niet uit marketing",
            "Koolzuur maskeert zoetheid tijdelijk",
            "Balans met bitterheid bepaalt drinkbaarheid",
        ],
        14: [
            "Bitterheid moet scherp maar niet uitdrogend zijn",
            "Lengte compenseert bodyverlies",
            "Afdronk bepaalt of een tweede slok logisch voelt",
        ],
        15: [
            "Explorer combineert productie, proef en balans",
            "Blindproeven dwingt objectieve parameters",
            "Je bent klaar voor stijlspecialisatie",
        ],
    }
)

GOLD_KEY_CONCEPTS.update(
    {
        11: ["proefstructuur", "aroma", "mondgevoel", "balans", "objectiviteit"],
        12: ["body", "textuur", "restsuiker", "eiwitten", "gewicht"],
        13: ["zoetheid", "restsuiker", "koolzuur", "balans", "maskering"],
        14: ["bitterheid", "hopbalans", "lengte", "afdronk", "drinkbaarheid"],
        15: ["blindproeven", "stijlherkenning", "integratie", "body", "bitterbalans"],
    }
)

REFLECTIEVRAGEN.update(
    {
        11: "Welke observatie doe je ná de eerste slok die je niet uit het etiket haalt?",
        12: "Beschrijf het verschil tussen 'licht' en 'dun' in één professionele zin.",
        13: "Hoe herken je zoetheid als koolzuur het palet tijdelijk opscherpt?",
        14: "Wanneer is bitterheid een kwaliteitsplus en wanneer een productiefout bij 0.0?",
        15: "Welke parameter hielp je het snelst bij je laatste blindproef — en waarom?",
    }
)

QUIZ_FULL[15] = """### Vraag 1

Je start een professionele 0.0-proef. Wat doe je als eerste?

A. Bitterheid scoren
B. Kleur en helderheid beoordelen ✅
C. Serveertemperatuur meten
D. Food pairing kiezen

### Vraag 2

Twee blind geproefde 0.0-bieren: één voelt rond, één waterig. Welke parameter is het meest doorslaggevend?

A. Body en mondgevoel ✅
B. Flesvorm
C. Merknaam
D. Barcode

### Vraag 3

Een 0.0 smaakt zoet maar niet klonterig-zacht. Wat check je eerst?

A. Restsuiker versus koolzuurmaskering ✅
B. Glasgewicht
C. Etiketkleur
D. Schuimhoogte

### Vraag 4

Bitterheid voelt scherp en uitdrogend. Wat is de meest waarschijnlijke conclusie?

A. Hopbalans of extract is niet gecompenseerd ✅
B. Het bier is te koud
C. Het glas is te groot
D. Het is per definitie craft

### Vraag 5

Waarom blindproeven vóór module 4?

A. Om marketing te vermijden en parameters te trainen ✅
B. Om sneller te schenken
C. Om minder glaswerk te gebruiken
D. Om suiker te verhogen

### Vraag 6

Welke productiemethode past het meest bij opvallende zoetheid en lichte body?

A. Gestopte fermentatie ✅
B. Barrel aging
C. Droge hopping zonder bier
D. Pasteurisatie als hoofdmethode

### Vraag 7

Wat balanceert restzoetheid in een goed gebouwd 0.0?

A. Bitterheid en frisheid via koolzuur ✅
B. Meer suiker
C. Warm serveren
D. Groter glas

### Vraag 8

Aroma lijkt vlak maar bitterheid is intact. Waar zoek je eerst?

A. Aroma-retentie in productie of bewaring ✅
B. Alleen naar alcoholsporen
C. Alleen naar glasrand
D. Alleen naar prijs

### Vraag 9

Een gast wil 'iets fris zonder frisdrankgevoel'. Welke proefparameter stuur je op?

A. Frisheid met body en bittere afdronk ✅
B. Maximale zoetheid
C. Minimale koolzuur
D. Hoogste temperatuur

### Vraag 10

Wat bewijs je met deze mini-toets?

A. Explorer-proefdiscipline voor stijlmodules ✅
B. Master-examen readiness
C. Alleen theoriekennis merken
D. Alleen servicekennis"""

QUIZ_FEEDBACK[15] = (
    "Gefeliciteerd. Je hebt de Explorer-basis geïntegreerd: proefstructuur, body, zoetheid, "
    "bitterbalans en blind objectiveren. Je bent klaar voor Specialist."
)

# --- Lessons 16-20 (Specialist M4 — stijlen) ---

LEERDOELEN.update(
    {
        16: "Na deze les kun jij alcoholvrije pils technisch beoordelen en adviseren op frisheid, bitterheid en drinkbaarheid.",
        17: "Na deze les kun jij alcoholvrije IPA herkennen op hopintensiteit, bitterbalans en aromatische compensatie van bodyverlies.",
        18: "Na deze les kun jij alcoholvrij witbier analyseren op kruidigheid, koolzuur en fris-zachte textuur.",
        19: "Na deze les kun jij alcoholvrije blond positioneren op ronde moutzoetheid en toegankelijke bitterheid.",
        20: "Na deze les kun jij alcoholvrije donkere stijlen beoordelen op geroosterde mout, body en afdronk.",
    }
)

THEORY_OVERRIDES.update(
    {
        16: (
            "Pils 0.0 is de puurste kwaliteitstest in de categorie: weinig moutmaskering, subtiele hop, "
            "hoge drinkbaarheid. Fouten in extract, bitterheid of koolzuur zijn direct zichtbaar.\n\n"
            "Proef op lichte kleur, schone bittere afdronk, frisheid en mondgevoel zonder plakkerige restzoetheid. "
            "Een sterke 0.0-pils eindigt droog genoeg om door te drinken, maar niet zo uitgedroogd dat body verdwijnt."
        ),
        17: (
            "IPA 0.0 gebruikt hop om bodyverlies te compenseren: tropisch fruit, citrus, hars en bitterheid "
            "geven smaakgewicht. Het risico is een uit de hand lopende bitter-as zonder alcoholwarmte als buffer.\n\n"
            "Beoordeel aromatische intensiteit, bittere lengte en of zoetheid de hop schraagt. "
            "Goede 0.0-IPA voelt completer dan pils, maar blijft drinkbaar in het tweede glas."
        ),
        18: (
            "Witbier 0.0 combineert lichte moutzoetheid met koriander, citruszeste en vaak hogere koolzuurspanning. "
            "Textuur is zachter; frisheid komt uit koolzuur én specerijen.\n\n"
            "Let op of kruidigheid bot wordt na de-alcoholisatie en of body niet in waterigheid eindigt. "
            "Witbier 0.0 werkt gastronomisch bij lichte vetten en zilte componenten."
        ),
        19: (
            "Blond 0.0 balanceert toegankelijke moutzoetheid met milde hopbitterheid en ronde textuur. "
            "Het is vaak de brug tussen pils en donkerder stijlen.\n\n"
            "Proef op restsuiker versus drinkbaarheid: te zoet wordt snel vermoeiend zonder alcohol. "
            "Goede blond 0.0 heeft lengte en een schone, niet-plakkerige afdronk."
        ),
        20: (
            "Donker 0.0 bouwt op geroosterde en karamelmout voor body, kleur en Maillard-achtige tonen. "
            "Hier kan bodyverlies deels worden opgevangen door moutstructuur.\n\n"
            "Beoordeel bitterzoete balans, afdronk en of geroosterde tonen niet verbrand overkomen na de-alcoholisatie. "
            "Serveer iets warmer dan pils om aroma te openen."
        ),
    }
)

FOOD_PAIRING.update(
    {
        16: _fp(
            "Gezouten pretzels, mosselen en jonge Goudse kaas.",
            "Koolzuur lift zout op het palet; lichte hopbitterheid snijdt door umami van schelpdieren; "
            "minimale restzoetheid voorkomt dat zout het bier uitdroogt.",
            "Zoete barbecuesaus of gefrituurde snacks met agressieve umami-glaze — die overheersen de subtiele pilsstructuur.",
        ),
        17: _fp(
            "Pittige kip, sharp cheddar en citrusmarinade.",
            "Hopbitterheid temt capsaïcine; aromatische citrusbrug harmoniseert met marinade; "
            "koolzuur reset vet en zout tussen happen.",
            "Zachte roomsaus zonder zuur of zout — IPA-bitter wordt dan scherp en eenzijdig.",
        ),
        18: _fp(
            "Geitenkaas salade, lichte ceviche en witvis met kruidenboter.",
            "Koriander en citrus in het bier echoën het gerecht; koolzuur snijdt door vet van boter; "
            "lichte zoetheid harmoniseert met milde zuren.",
            "Zware stoof met donkere jus — witbier verliest frisheid en kruidig lift.",
        ),
        19: _fp(
            "Kip met kruiden, quiche en milde pasta met room.",
            "Ronde moutzoetheid harmoniseert met ei en room; milde bitterheid houdt het geheel drinkbaar; "
            "body vangt lichte vetten zonder zwaarte.",
            "Ultra-hoppy gerechten of agressief zure tomatasaus — blond 0.0 wordt dan te zacht.",
        ),
        20: _fp(
            "Stoofvlees licht, bruin brood, oude kaas en bitterballen.",
            "Geroosterde mout ondersteunt Maillard-tonen; restzoetheid vangt umami en zout; "
            "bittere afdronk balanceert vet van gefrituurd.",
            "Frisse citrusdesserts — donkere moutbotheid botst met zuur en maakt het bier zoet en zwaar.",
        ),
    }
)

PRO_INSIGHTS.update(
    {
        16: (
            "Gasten die 'gewoon iets fris' willen zonder discussie over alcohol: start met 0.0-pils op temperatuur "
            "en glas, niet met het sterkste IPA in het assortiment. Pils verkoopt vertrouwen; upsell volgt na de eerste positieve slok."
        ),
        17: (
            "IPA 0.0 is je upsell voor hopbewuste gasten en alcohol-switchers die gewend zijn aan craft. "
            "Vraag naar pittig eten of eerdere IPA-voorkeur vóór je een pils aanbeveelt."
        ),
        18: (
            "Witbier 0.0 past bij lunch en terras: licht vet, zout en kruidig eten maken de stijl logisch. "
            "Positioneer het als gastronomische keuze, niet als 'kindvriendelijk bier'."
        ),
        19: (
            "Blond 0.0 is de veilige middenweg in gemengde gezelschappen: herkenbaar zoet-rond zonder zware bitter. "
            "Ideaal wanneer gasten twijfelen tussen pils en donker."
        ),
        20: (
            "Donker 0.0 verkoopt beter bij kouder weer en herfstmenu's. Koppel geroosterde mout aan stoof of kaas — "
            "dat voelt premium en rechtvaardigt hogere prijspunt dan instap-pils."
        ),
    }
)

SUMMARIES.update(
    {
        16: ["Pils 0.0 is kwaliteitskritisch en weinig vergevingsgezind", "Frisheid en droge bittere afdronk zijn kern", "Servicefouten vallen hier het snelst op"],
        17: ["Hop compenseert bodyverlies", "Bitterbalans is het risico", "Aromatische intensiteit bepaalt premiumgevoel"],
        18: ["Kruidigheid en koolzuur dragen frisheid", "Zachte textuur vraagt om lichte pairings", "Vet en zout maken de stijl logisch"],
        19: ["Ronde moutzoetheid met milde hop", "Brug tussen licht en donker", "Drinkbaarheid boven zoetheid"],
        20: ["Geroosterde mout geeft body en diepte", "Warmer serveren opent aroma", "Umami en vet zijn natuurlijke partners"],
    }
)

GOLD_KEY_CONCEPTS.update(
    {
        16: ["0.0-pils", "frisheid", "bitterbalans", "drinkbaarheid", "kwaliteitstest"],
        17: ["0.0-IPA", "hopintensiteit", "bodycompensatie", "bitterrisico", "aroma"],
        18: ["0.0-witbier", "kruidigheid", "koolzuur", "textuur", "lunchpairing"],
        19: ["0.0-blond", "moutzoetheid", "toegankelijkheid", "lengte", "brugstijl"],
        20: ["0.0-donker", "geroosterde mout", "Maillard", "body", "umami"],
    }
)

REFLECTIEVRAGEN.update(
    {
        16: "Je serveert twee 0.0-pils: één waterig, één droog-bitter. Welke stuur je naar een gast die dorst wil lessen na sport?",
        17: "Wanneer adviseer je IPA 0.0 boven pils 0.0 bij hetzelfde gerecht — en welke pairingparameter maakt dat?",
        18: "Welk witbier-defect herken je het eerst na de-alcoholisatie: vlakke kruiden of dunne body?",
        19: "Een gast vindt pils te bitter maar donker te zwaar. Welke blond 0.0-parameter pitch je?",
        20: "Hoe verdedig je iets warmere serveertemperatuur voor donker 0.0 zonder dat het vlak wordt?",
    }
)

QUIZ_PATCHES.update(
    {
        16: """### Vraag 1

Een 0.0-pils smaakt zoet en waterig in rush-hour service. Wat is de meest waarschijnlijke productieoorzaak?

A. Te veel barrel aging
B. Onvoldoende extract/bittercompensatie na de-alcoholisatie ✅
C. Te veel koffie
D. Verkeerde glasvorm alleen

### Vraag 5

Een gast wil dorstlessend zonder frisdrank. Welke stijl en parameter pitch je?

A. Donker 0.0 op zoetheid
B. Pils 0.0 op frisheid en droge afdronk ✅
C. IPA 0.0 op maximale bitter
D. Witbier warm""",
        17: """### Vraag 3

Hopbitter voelt scherp zonder ronding. Wat ontbreekt waarschijnlijk?

A. Alcoholwarmte als buffer — compensatie via mout/restsuiker of aromatische integratie ✅
B. Meer koolzuur alleen
C. Groter glas
D. Koudere fles""",
    }
)

# --- Lessons 21-22 (Specialist M5 start) ---

LEERDOELEN.update(
    {
        21: "Na deze les kun jij massamarkt 0.0 positioneren in assortiment en gastverwachting zonder kwaliteitsstigma.",
        22: "Na deze les kun jij craft 0.0 beoordelen op innovatie, smaakambitie en prijs-kwaliteit in foodservice.",
    }
)

THEORY_OVERRIDES.update(
    {
        21: (
            "Massamarkt 0.0 domineert volume door herkenbaarheid, distributie en consistentie. "
            "De professionele lezing: niet automatisch inferieur, wel vaak geoptimaliseerd op brede acceptatie "
            "en lage foutmarge in smaak.\n\n"
            "Gebruik merkvertrouwen voor instap en alcohol-switch, maar proef blind voordat je premium claimt. "
            "Consistentie is hier het product — variatie is craft-territorium."
        ),
        22: (
            "Craft 0.0 experimenteert met hopdosering, moutkeuze en de-alcoholisatieroutes voor smaakidentiteit. "
            "Hogere prijs is gerechtvaardigd wanneer aromatische intensiteit, body en afdronk premium aanvoelen.\n\n"
            "In foodservice werkt craft 0.0 als signature en upsell, niet als standaard tap voor elk moment. "
            "Koppel het aan een verhaal en een gerecht, niet alleen aan 'lokaal'."
        ),
    }
)

FOOD_PAIRING.update(
    {
        21: _fp(
            "Bitterballen, burger licht gezouten en borrelhapjes met mosterd.",
            "Massapils-0.0 met stabiele bitterheid snijdt door vet; koolzuur lift zout; "
            "bekende smaak verlaagt drempel voor alcohol-switchers.",
            "Gerechten die premium umami en lange rijping vragen — dan ondersteunt instap-0.0 te weinig body.",
        ),
        22: _fp(
            "Gegrilde groente, spicy tuna tartare en aged cheddar.",
            "Craft IPA- of blond 0.0 met hop- of moutdiepte harmoniseert met gegrilde tonen; "
            "bitterheid balanceert vet; aromatische lift ondersteunt complexe toppings.",
            "Neutrale witvis zonder zout of zuur — craft-bitter domineert zonder gastronomische brug.",
        ),
    }
)

PRO_INSIGHTS.update(
    {
        21: (
            "Zet massamarkt 0.0 op de kaart als betrouwbare instap naast frisdrank, niet verstopt achterin. "
            "Zichtbaarheid verhoogt alcohol-switch zonder dat je premium craft hoeft te pushen."
        ),
        22: (
            "Craft 0.0 verkoopt wanneer je het koppelt aan één signature gerecht of chef's choice. "
            "Prijs uitleg via proefparameter — hopintensiteit, body — niet via 'kleine batch' alleen."
        ),
    }
)

SUMMARIES.update(
    {
        21: ["Volume en consistentie zijn het product", "Merk verlaagt drempel voor switchers", "Blind proeven blijft nodig"],
        22: ["Innovatie zit in hop, mout en proces", "Premium vraagt gastronomische brug", "Signature placement werkt beter dan volume"],
    }
)

GOLD_KEY_CONCEPTS.update(
    {
        21: ["massamarkt", "consistentie", "instap", "alcohol-switch", "assortiment"],
        22: ["craft 0.0", "innovatie", "hopdosering", "premium", "signature"],
    }
)

REFLECTIEVRAGEN.update(
    {
        21: "Hoe positioneer je een bekend massamerk zonder dat gasten denken dat 0.0 per definitie 'goedkoop smaakt'?",
        22: "Wanneer rechtvaardigt craft 0.0 een hogere kaartprijs dan massamarkt op hetzelfde moment?",
    }
)
