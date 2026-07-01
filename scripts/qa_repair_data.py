"""QA Global Repair Pass — quiz option expansions and replacement data."""

from __future__ import annotations

# Port module metadata for schema alignment (P0-4)
PORT_MODULE_META: dict[int, dict] = {
    1: {
        "title": "Fundament",
        "level": "Explorer",
        "pillar": "Fundament",
        "goal": "Ontdek wat Port is, hoe fortificatie werkt, waarom de Douro uniek is en welke hoofdstijlen de basis vormen.",
        "kernbegrippen": [
            "Port",
            "fortificatie",
            "Douro",
            "versterkte wijn",
            "restsuiker",
            "aguardente",
            "Ruby",
            "Tawny",
            "White Port",
            "Vintage",
        ],
    },
    2: {
        "title": "Productie & Terroir",
        "level": "Explorer",
        "pillar": "Productie",
        "goal": "Begrijp druiven, Douro, terroir, hout en oxidatie als bouwstenen van elke Portstijl.",
        "kernbegrippen": [
            "Touriga Nacional",
            "Touriga Franca",
            "Tinta Roriz",
            "Douro-subregio",
            "schist",
            "terrassen",
            "lage opbrengst",
            "houtlagering",
            "oxidatieve rijping",
            "blendlogica",
        ],
    },
    3: {
        "title": "Proeven & Analyse",
        "level": "Explorer",
        "pillar": "Proeven",
        "goal": "Leer Port systematisch proeven: kleur, aroma, structuur en kwaliteitsindicatoren.",
        "kernbegrippen": [
            "proefprotocol",
            "kleurintensiteit",
            "fruitaroma",
            "oxidatieve tonen",
            "alcoholwarmte",
            "zoetheidsbalans",
            "tannine-in-port",
            "leeftijdssignaal",
            "kwaliteitsindicatoren",
            "blindhypothese",
        ],
    },
    4: {
        "title": "Oorsprong & Identiteit",
        "level": "Specialist",
        "pillar": "Oorsprong & Stijl",
        "goal": "Plaats Port in historische, culturele en regionale context.",
        "kernbegrippen": [
            "Vila Nova de Gaia",
            "quinta",
            "Britse handel",
            "lodges",
            "terroir-identiteit",
            "Douro-classificatie",
            "stijltraditie",
            "provenance",
            "regionale signatuur",
            "heritage",
        ],
    },
    5: {
        "title": "Specialist Styles I",
        "level": "Specialist",
        "pillar": "Stijl & Identiteit",
        "goal": "Herken en onderscheid de kernstijlen Ruby, Tawny, LBV en Vintage.",
        "kernbegrippen": [
            "Ruby Port",
            "Tawny Port",
            "LBV",
            "Vintage Port",
            "Colheita",
            "stijlverschil",
            "rijpingstraject",
            "fruit versus oxidatie",
            "leeftijdslabel",
            "stijlherkenning",
        ],
    },
    6: {
        "title": "Specialist Styles II",
        "level": "Specialist",
        "pillar": "Stijl & Identiteit",
        "goal": "Verdiep je in White Port, Rosé Port en niche- en premiumcategorieën.",
        "kernbegrippen": [
            "White Port",
            "Rosé Port",
            "Single Quinta",
            "Crusted Port",
            "Reserve Ruby",
            "Reserve Tawny",
            "niche-stijlen",
            "premiumpositionering",
            "stijlvergelijking",
            "marktsegmentatie",
        ],
    },
    7: {
        "title": "Service & Bewaren",
        "level": "Master",
        "pillar": "Service",
        "goal": "Beheers serveren, decanteren, glaskeuze en bewaarlogica van Port.",
        "kernbegrippen": [
            "serveertemperatuur",
            "decanteren",
            "glaskeuze",
            "openingsvenster",
            "bewaarpotentieel",
            "flespositie",
            "oxidatiebeheer",
            "serviceprotocol",
            "kelderlogica",
            "presentatie",
        ],
    },
    8: {
        "title": "Food Pairing & Gastronomie",
        "level": "Master",
        "pillar": "Pairing",
        "goal": "Koppel Port bewust aan gerechten, momenten en gastprofielen.",
        "kernbegrippen": [
            "zoet-zout-balans",
            "kaaspairing",
            "chocoladepairing",
            "digestief",
            "aperitief",
            "gerechtintensiteit",
            "structuurmatching",
            "momentkeuze",
            "gastprofiel",
            "pairinglogica",
        ],
    },
    9: {
        "title": "Integratie & Mastery",
        "level": "Master",
        "pillar": "Integratie & Mastery",
        "goal": "Integreer kennis in kaartlezen, blindproeven, advies en eindbeoordeling.",
        "kernbegrippen": [
            "portkaart",
            "blindproef",
            "advieslogica",
            "kelderstrategie",
            "eindintegratie",
            "stijlkeuze",
            "gastnavigatie",
            "kwaliteitsbeoordeling",
            "professionele framing",
            "mastery",
        ],
    },
}

# Exact quiz replacements: (lesson_num, question_num) -> new question block (without ### Vraag header)
QUIZ_REPLACEMENTS: dict[str, dict[tuple[int, int], str]] = {
    "MOUS": {
        (29, 1): """Is Extra Dry droger dan Brut?

A. Ja
B. Nee ✅
C. Alleen bij hogere alcohol
D. Ja, want 'Extra' verwijst naar extra droogheid""",
        (37, 1): """Mousserend is alleen geschikt als aperitief.

A. Waar
B. Niet waar ✅
C. Alleen bij Demi-Sec
D. Alleen bij oude millésime""",
        (37, 5): """Kan mousserend bij dessert?

A. Nee
B. Ja ✅
C. Alleen als het Brut Nature is
D. Nooit bij kaas""",
    },
    "WINE": {
        (8, 5): """Elke wijn gebruikt hout:

A. Ja
B. Nee ✅
C. Alleen premium wijnen
D. Alleen rode wijnen""",
        (9, 4): """Welke stijl is frisser?

A. Reductief ✅
B. Oxidatief
C. Houtgerijpt
D. Botrytized""",
        (9, 5): """Beide methodes zijn:

A. Fouten
B. Bewuste keuzes ✅
C. Alleen oxidatie is bewust
D. Altijd ongewenst in de kelder""",
        (12, 5): """Kleur is:

A. Onbelangrijk
B. Eerste analysepunt ✅
C. Alleen relevant bij rode wijn
D. Identiek aan body""",
        (13, 1): """Fruit is meestal:

A. Primair ✅
B. Secundair
C. Tertiair
D. Oxidatief""",
        (13, 2): """Boter is vaak:

A. Primair
B. Secundair ✅
C. Tertiair
D. Primair fruit""",
        (13, 3): """Leer is vaak:

A. Primair
B. Secundair
C. Tertiair ✅
D. Secundair hout""",
        (19, 5): """Amarone is vaak:

A. Full-bodied ✅
B. Light-bodied
C. Altijd mousserend
D. Altijd zonder alcohol""",
    },
    "ROSE": {
        (3, 3): """Rosé kan gastronomisch zijn:

A. Nee
B. Ja ✅
C. Alleen bij sweet rosé
D. Nooit bij fine dining""",
    },
}

BIER_0_0_LEGAL_OLD = (
    "In de EU-context geldt maximaal 0,05% als 0.0 — minimale sporen zijn daardoor technisch mogelijk, "
    "maar het product gedraagt zich in service als alcoholvrij."
)
BIER_0_0_LEGAL_NEW = (
    "In Nederland geldt maximaal 0,1% alcohol voor het label alcoholvrij. Andere EU-landen hanteren "
    "grenzen tussen 0,5% en 1,2%. Het label 0.0 verwijst in de praktijk naar afgerond 0,00%."
)

BIER_0_0_QUIZ_OLD = "B. Nee, 0.0 is maximaal 0,05% in de EU-context ✅"
BIER_0_0_QUIZ_NEW = (
    "B. Nee, in Nederland is alcoholvrij maximaal 0,1%; 0.0 verwijst naar afgerond 0,00% ✅"
)

WINE_L21_THEORY_OLD = "Sauvignon Blanc is aromatisch, met een kruidig-citrus karakter en van nature hoog zuur."
WINE_L21_THEORY_NEW = (
    "Sauvignon Blanc is aromatisch, met een kruidig-citrus en vaak grassig karakter en van nature hoog zuur."
)

WINE_L21_SUMMARY_OLD = "- Sauvignon Blanc is aromatisch met kruidig-citruskarakter en hoog zuur"
WINE_L21_SUMMARY_NEW = "- Sauvignon Blanc is aromatisch met kruidig-citrus en grassig karakter en hoog zuur"

PORT_LESSON_REPAIRS: dict[int, dict[str, str]] = {
    41: {
        "wist_je_dat": (
            "Sommige grote Portproducenten groeperen hun kaart op inzetbaarheid (aperitief, digestief, "
            "decanteerbaar) in plaats van op prijs — dat versnelt servicebeslissingen aan tafel."
        ),
        "samenvatting": (
            "- Een Portkaart lees je op stijl, leeftijd en inzetbaarheid, niet op prijs alleen\n"
            "- Ruby, Tawny, LBV, Vintage en Colheita zijn servicebeslissingen, geen losse labels\n"
            "- De kernvraag: welke fles lost welk gastmoment op?\n"
            "- Groepeer per stijl om navigatie en advies te versnellen\n"
            "- Sterke sommeliers kennen categorie-inzet, niet elke individuele fles"
        ),
        "praktijk_checklist": (
            "- Ik heb een Portkaart op stijlcategorieën ingedeeld\n"
            "- Ik heb per stijl het juiste serveermoment benoemd\n"
            "- Ik kan uitleggen wanneer decanteren nodig is"
        ),
    },
    42: {
        "wist_je_dat": (
            "Professionele Port-blindpanels trainen vaak eerst op kleur en oxidatieniveau voordat ze "
            "stijl benoemen — dat vermindert vergissingen tussen Ruby en jonge Tawny."
        ),
        "samenvatting": (
            "- Blindproeven start met visuele en aromatische hypothese, niet met het etiket\n"
            "- Kleur en oxidatie scheiden Ruby van Tawny sneller dan fruit alleen\n"
            "- Structuur en zoetheid bevestigen of verwerpen je eerste hypothese\n"
            "- Noteer bewijs per stap voordat je een stijl noemt\n"
            "- Integratie van Module 1–8 bepaalt de kwaliteit van je eindoordeel"
        ),
        "praktijk_checklist": (
            "- Ik heb kleur en oxidatie apart genoteerd\n"
            "- Ik heb een onderbouwde stijlhypothese geformuleerd\n"
            "- Ik heb mijn conclusie met minstens drie proefankers onderbouwd"
        ),
    },
    43: {
        "wist_je_dat": (
            "In premium restaurants stijgt de conversie naar Port wanneer het advies start bij het "
            "gastmoment (digestief, kaas, chocolade) in plaats van bij de producentnaam."
        ),
        "samenvatting": (
            "- Portadvies begint bij gastmoment en gerecht, niet bij de duurste fles\n"
            "- Stijl, leeftijd en structuur bepalen of een suggestie past\n"
            "- Eén onderbouwd advies per moment werkt beter dan een lange kaartmonoloog\n"
            "- Temperatuur en glas zijn onderdeel van het advies, niet een voetnoot\n"
            "- Vertrouwen groeit wanneer je keuzes kunt uitleggen in serveertermen"
        ),
        "praktijk_checklist": (
            "- Ik heb een gastprofiel en moment gekozen\n"
            "- Ik heb één Portstijl met onderbouwing geadviseerd\n"
            "- Ik heb temperatuur en glas meegenomen in mijn advies"
        ),
    },
    44: {
        "wist_je_dat": (
            "Vintage Port kan decennia rijpen in fles, maar na opening versnelt oxidatie sterk — "
            "daarom is portiegrootte en timing na decanteren cruciaal voor kwaliteitsbeleving."
        ),
        "samenvatting": (
            "- Bewaren verschilt per stijl: Ruby kort, Tawny en Vintage lang in fles\n"
            "- Keldercondities (koel, donker, stabiel) beschermen rijping\n"
            "- Na opening is oxidatie de grootste vijand, vooral bij Vintage\n"
            "- Decanteer alleen wanneer sediment of ontwikkeling dat vraagt\n"
            "- Kelderlogica is onderdeel van professioneel Portadvies"
        ),
        "praktijk_checklist": (
            "- Ik heb bewaaradvies per stijl onderscheiden\n"
            "- Ik kan uitleggen wanneer decanteren zinvol is\n"
            "- Ik heb een openings- en bewaarplan voor één fles beschreven"
        ),
    },
    45: {
        "wist_je_dat": (
            "Het Douro DOC-systeem uit 1756 is een van de oudste beschermde herkomstaanduidingen ter wereld — "
            "Port draagt daarmee een van de langste gereguleerde wijntradities."
        ),
        "samenvatting": (
            "- Eindintegratie verbindt productie, stijl, service, pairing en advies\n"
            "- Een sterke Portprofessional denkt in ketens: herkomst → stijl → moment → gast\n"
            "- Blindproef, kaartlezen en kelderlogica zijn drie kanten van dezelfde expertise\n"
            "- Consistente terminologie maakt teamadvies betrouwbaarder\n"
            "- Mastery betekent onderbouwen, niet alles uit het hoofd kennen"
        ),
        "praktijk_checklist": (
            "- Ik heb drie kerncompetenties van de track benoemd\n"
            "- Ik kan één volledig Portadvies van kaart tot glas uitwerken\n"
            "- Ik heb mijn zwakste module geïdentificeerd voor herhaling"
        ),
    },
}

BIO_FEEDBACK_HEDGING: list[tuple[str, str]] = [
    ("Je begrijpt nu hoe fleskeuze strategisch werkt.", "Je ziet nu hoe fleskeuze strategisch kan werken."),
    ("Je begrijpt nu hoe temperatuur directe invloed heeft op beleving.", "Je ziet nu hoe temperatuur invloed kan hebben op beleving."),
    ("Je begrijpt nu hoe mousserend zeer gevoelig reageert.", "Je ziet nu hoe mousserend gevoelig kan reageren."),
    ("Je begrijpt nu hoe Port biodynamisch kan worden ingezet.", "Je ziet nu hoe Port biodynamisch als hulpmiddel kan worden ingezet."),
    ("Je begrijpt nu hoe bier biodynamisch anders kan aanvoelen.", "Je ziet nu hoe bier biodynamisch anders kan aanvoelen."),
    ("Je begrijpt nu hoe cocktails biodynamisch beïnvloed kunnen worden.", "Je ziet nu hoe cocktails biodynamisch beïnvloed kunnen worden."),
    ("Je begrijpt nu de volledige logica achter dynamisch en strategisch advies", "Je ziet nu de logica achter dynamisch en strategisch advies"),
    ("Je beheerst nu de strategische kern van biodynamisch drinken.", "Je ziet nu de strategische kern van biodynamisch drinken."),
    ("Meesterschap bewezen.", "Je hebt het eindniveau van deze track aangetoond."),
    ("Perfect. Je begrijpt nu waarom biodynamische timing praktisch waardevol kan zijn.", "Duidelijk. Je ziet nu waarom biodynamische timing door sommigen als praktisch waardevol wordt gezien."),
    ("Perfect. Je kent nu de vier basisdagen.", "Duidelijk. Je kent nu de vier basisdagen als besliskader."),
    ("Perfect. Je begrijpt nu de rol van Bloemdagen.", "Duidelijk. Je ziet nu de rol van Bloemdagen binnen het kader."),
    ("Perfect. Je begrijpt nu hoe verschillende dagtypes de proefervaring kunnen beïnvloeden", "Duidelijk. Je ziet nu hoe verschillende dagtypes de proefervaring kunnen beïnvloeden"),
    ("Perfect. Je begrijpt nu hoe barrel-aged dranken reageren.", "Duidelijk. Je ziet nu hoe barrel-aged dranken kunnen reageren."),
    ("Perfect. Je beheerst nu de cross-category toepassing van biodynamische timing.", "Duidelijk. Je ziet nu hoe cross-category toepassing van biodynamische timing kan werken."),
    ("Perfect. Je begrijpt nu hoe drinkvensters en dagtypes samenwerken.", "Duidelijk. Je ziet nu hoe drinkvensters en dagtypes kunnen samenwerken."),
    ("Perfect. Je beheerst nu je persoonlijke tasting intelligence", "Duidelijk. Je hebt je persoonlijke tasting intelligence verder opgebouwd"),
]
