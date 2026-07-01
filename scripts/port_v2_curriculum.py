"""Port Track V2 — curriculum metadata, slugs, kernbegrippen, quiz overrides."""

from __future__ import annotations

MODULES: list[dict] = [
    {
        "num": 1,
        "slug": "intro-port",
        "title": "Fundament",
        "level": "explorer",
        "goal": "Ontdek wat Port is, hoe fortificatie werkt, waarom de Douro uniek is en welke hoofdstijlen de basis vormen.",
        "start": 1,
        "end": 5,
    },
    {
        "num": 2,
        "slug": "productie-port",
        "title": "Productie & Terroir",
        "level": "explorer",
        "goal": "Begrijp druiven, Douro, terroir, hout en oxidatie als bouwstenen van elke Portstijl.",
        "start": 6,
        "end": 10,
    },
    {
        "num": 3,
        "slug": "proeven-port",
        "title": "Proeven & Analyse",
        "level": "explorer",
        "goal": "Leer systematisch proeven, structuur en aroma's herkennen en Ruby vs Tawny blind onderscheiden.",
        "start": 11,
        "end": 15,
    },
    {
        "num": 4,
        "slug": "oorsprong-port",
        "title": "Oorsprong & Identiteit",
        "level": "specialist",
        "goal": "Verdiep herkomst, regionaliteit, quinta's, port houses en producentenstijlen.",
        "start": 16,
        "end": 20,
    },
    {
        "num": 5,
        "slug": "portstijlen",
        "title": "Specialist Styles I",
        "level": "specialist",
        "goal": "Beheers Ruby Reserve, LBV, Crusted, Vintage en het verschil Vintage versus LBV.",
        "start": 21,
        "end": 25,
    },
    {
        "num": 6,
        "slug": "portstijlen-verdiept",
        "title": "Specialist Styles II",
        "level": "specialist",
        "goal": "White, Rosé, Tawny (met leeftijdsniveaus), Colheita en Garrafeira als zelfstandige stijlen.",
        "start": 26,
        "end": 30,
    },
    {
        "num": 7,
        "slug": "service-port",
        "title": "Service & Bewaren",
        "level": "master",
        "goal": "Temperatuur, glaswerk, decanteren, houdbaarheid en momentkeuze onder de knie krijgen.",
        "start": 31,
        "end": 35,
    },
    {
        "num": 8,
        "slug": "pairing-port",
        "title": "Food Pairing & Gastronomie",
        "level": "master",
        "goal": "Port koppelen aan kaas, chocolade, noten, vlees en gastronomische toepassingen.",
        "start": 36,
        "end": 40,
    },
    {
        "num": 9,
        "slug": "examen-port",
        "title": "Integratie & Mastery",
        "level": "master",
        "goal": "Portkaart lezen, blindproeven, adviseren, kelderdenken en eindintegratie.",
        "start": 41,
        "end": 45,
    },
]

LESSONS: list[dict] = [
    {"num": 1, "title": "Wat is Port?", "slug": "wat-is-port", "duration": 8, "add": 1},
    {"num": 2, "title": "Fortificatie", "slug": "fortificatie", "duration": 8, "add": 2},
    {"num": 3, "title": "Waarom is Port uniek?", "slug": "waarom-is-port-uniek", "duration": 8, "add": 3},
    {"num": 4, "title": "Geschiedenis van Port", "slug": "geschiedenis-van-port", "duration": 8, "add": 4},
    {"num": 5, "title": "Portcategorieën uitgelegd", "slug": "portcategorieen", "duration": 10, "add": 5},
    {"num": 6, "title": "Druiven van Port", "slug": "druiven-van-port", "duration": 8, "add": 6},
    {"num": 7, "title": "De Douro-vallei", "slug": "douro-vallei", "duration": 8, "add": 7},
    {"num": 8, "title": "Klimaat en terroir", "slug": "klimaat-en-terroir", "duration": 8, "add": 8},
    {"num": 9, "title": "Houtlagering", "slug": "houtlagering", "duration": 8, "add": 9},
    {"num": 10, "title": "Oxidatie uitgelegd", "slug": "oxidatie-uitgelegd", "duration": 8, "add": 10},
    {"num": 11, "title": "Proefnotitie Port", "slug": "proefnotitie-port", "duration": 10, "add": 11},
    {"num": 12, "title": "Structuur herkennen", "slug": "structuur-herkennen", "duration": 8, "add": 12},
    {"num": 13, "title": "Aroma's herkennen", "slug": "aromas-herkennen", "duration": 8, "add": 13},
    {"num": 14, "title": "Ruby vs Tawny blind herkennen", "slug": "ruby-vs-tawny-blind", "duration": 10, "add": 14},
    {"num": 15, "title": "Mini-toets Port Proeven", "slug": "mini-toets-port-proeven", "duration": 12, "add": 15, "no_quiz": True},
    {"num": 16, "title": "Waar komt Port vandaan?", "slug": "waar-komt-port-vandaan", "duration": 8, "add": 16},
    {"num": 17, "title": "Druiven van Port (Regionaliteit)", "slug": "druiven-regionaliteit", "duration": 8, "add": 17},
    {"num": 18, "title": "De Douro-vallei (Cultureel landschap)", "slug": "douro-cultureel-landschap", "duration": 8, "add": 18},
    {"num": 19, "title": "Quinta's en Port Houses", "slug": "quintas-en-port-houses", "duration": 10, "add": 19},
    {"num": 20, "title": "Producenten herkennen", "slug": "producenten-herkennen", "duration": 10, "add": 20},
    {"num": 21, "title": "Ruby Reserve", "slug": "ruby-reserve", "duration": 8, "add": 21},
    {"num": 22, "title": "Late Bottled Vintage (LBV)", "slug": "late-bottled-vintage", "duration": 8, "add": 22},
    {"num": 23, "title": "Crusted Port", "slug": "crusted-port", "duration": 8, "add": 23},
    {"num": 24, "title": "Vintage Port", "slug": "vintage-port", "duration": 10, "add": 24},
    {"num": 25, "title": "Vintage versus LBV", "slug": "vintage-vs-lbv", "duration": 10, "add": 25},
    {"num": 26, "title": "White Port", "slug": "white-port", "duration": 8, "custom": True},
    {"num": 27, "title": "Rosé Port", "slug": "rose-port", "duration": 8, "custom": True},
    {"num": 28, "title": "Tawny Port", "slug": "tawny-port", "duration": 12, "add_merge": [26, 27, 28, 29]},
    {"num": 29, "title": "Colheita", "slug": "colheita-port", "duration": 8, "add": 30},
    {"num": 30, "title": "Garrafeira", "slug": "garrafeira-port", "duration": 10, "custom": True},
    {"num": 31, "title": "Serveertemperatuur", "slug": "serveertemperatuur", "duration": 10, "add": 31},
    {"num": 32, "title": "Glaswerk", "slug": "glaswerk", "duration": 8, "add": 32},
    {"num": 33, "title": "Decanteren", "slug": "decanteren", "duration": 8, "add": 33},
    {"num": 34, "title": "Bewaren na openen", "slug": "bewaren-na-openen", "duration": 8, "add": 34},
    {"num": 35, "title": "Wanneer serveer je welke Port?", "slug": "wanneer-welke-port", "duration": 10, "add": 35},
    {"num": 36, "title": "Port & Kaas", "slug": "port-en-kaas", "duration": 10, "add": 36},
    {"num": 37, "title": "Port & Chocolade", "slug": "port-en-chocolade", "duration": 10, "add": 37},
    {"num": 38, "title": "Port & Notendesserts", "slug": "port-en-notendesserts", "duration": 8, "add": 38},
    {"num": 39, "title": "Port & Vlees", "slug": "port-en-vlees", "duration": 10, "add": 39},
    {"num": 40, "title": "Port in gastronomie", "slug": "port-in-gastronomie", "duration": 10, "add": 40},
    {"num": 41, "title": "Portkaart lezen", "slug": "portkaart-lezen", "duration": 10, "add": 41},
    {"num": 42, "title": "Blindproef examen", "slug": "blindproef-examen", "duration": 15, "add": 42, "no_quiz": True},
    {"num": 43, "title": "Port adviseren", "slug": "port-adviseren", "duration": 10, "add": 43},
    {"num": 44, "title": "Port bewaren (kelderdenken)", "slug": "port-bewaren-kelder", "duration": 10, "add": 44},
    {"num": 45, "title": "Eindintegratie Port", "slug": "eindintegratie-port", "duration": 15, "add": 45, "no_quiz": True},
]

KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["versterkte wijn", "Douro", "restsuiker", "oxidatie", "stijlkeuze"],
    2: ["fortificatie", "aguardente", "restsuiker", "timing", "gisting"],
    3: ["terroir", "terrassen", "uniek", "traditie", "concentratie"],
    4: ["handel", "lodges", "Gaia", "Britten", "geschiedenis"],
    5: ["Ruby", "Tawny", "Vintage", "White", "categorieën"],
    6: ["blend", "Touriga Nacional", "Tinta Roriz", "structuur", "druivenrassen"],
    7: ["Douro", "terrassen", "subzones", "Cima Corgo", "opbrengst"],
    8: ["terroir", "schist", "klimaat", "stress", "concentratie"],
    9: ["houtlagering", "vaten", "oxidatie", "stijl", "rijping"],
    10: ["oxidatie", "Ruby", "Tawny", "reductie", "stijlkeuze"],
    11: ["proefnotitie", "structuur", "neus", "afdronk", "conclusie"],
    12: ["alcohol", "zoetheid", "tannine", "body", "balans"],
    13: ["aroma", "fruit", "kruiden", "noten", "oxidatie"],
    14: ["Ruby", "Tawny", "blind", "kleur", "oxidatie"],
    15: ["integratie", "structuur", "analyse", "conclusie", "objectiviteit"],
    16: ["herkomst", "Douro Superior", "Cima Corgo", "identiteit", "subzones"],
    17: ["regionaliteit", "quinta", "Touriga Nacional", "terroiridentiteit", "traditie"],
    18: ["landschap", "UNESCO", "terrassen", "erfgoed", "quinta"],
    19: ["quinta", "Port House", "blend", "Single Quinta", "stijl"],
    20: ["producent", "huisstijl", "Taylor's", "Graham's", "herkenning"],
    21: ["Ruby Reserve", "selectie", "fruit", "structuur", "instap"],
    22: ["LBV", "oogstjaar", "vatrijping", "toegankelijk", "Vintage"],
    23: ["Crusted", "depot", "decanteren", "ongefilterd", "blend"],
    24: ["Vintage", "declaratie", "IVDP", "flesrijping", "tannine"],
    25: ["Vintage", "LBV", "rijping", "toegankelijk", "keuze"],
    26: ["White Port", "aperitief", "witte druiven", "tonic", "frisheid"],
    27: ["Rosé Port", "schilcontact", "aperitief", "fruit", "modern"],
    28: ["Tawny", "oxidatie", "leeftijd", "noten", "gemiddelde leeftijd"],
    29: ["Colheita", "single harvest", "vatrijping", "oogstjaar", "Tawny"],
    30: ["Garrafeira", "glasrijping", "demijohn", "zeldzaamheid", "complexiteit"],
    31: ["temperatuur", "service", "Ruby", "Tawny", "Vintage"],
    32: ["glaswerk", "tulpvorm", "aroma", "alcohol", "concentratie"],
    33: ["decanteren", "depot", "Vintage", "LBV", "lucht"],
    34: ["houdbaarheid", "oxidatie", "koel", "opening", "stijl"],
    35: ["moment", "aperitief", "digestief", "stijl", "advies"],
    36: ["kaas", "zoetheid", "zout", "Stilton", "balans"],
    37: ["chocolade", "bitter", "Ruby", "structuur", "intensiteit"],
    38: ["noten", "Tawny", "oxidatie", "dessert", "textuur"],
    39: ["vlees", "reductie", "Tawny", "umami", "gastronomie"],
    40: ["gastronomie", "reductie", "ingrediënt", "smaakversterker", "chef"],
    41: ["portkaart", "stijl", "inzetbaarheid", "service", "navigatie"],
    42: ["blind", "eliminatie", "structuur", "logica", "analyse"],
    43: ["advies", "context", "gast", "moment", "behoefte"],
    44: ["kelder", "rijping", "Vintage", "bewaren", "potentieel"],
    45: ["integratie", "keuze", "stijl", "context", "professionaliteit"],
}

LEERDOEL_OVERRIDES: dict[int, str] = {
    15: "Na deze les kun jij je kennis uit module drie integreren in een zelfstandige proefopdracht en je aanpak evalueren op systematiek en stijlherkenning.",
    17: "Na deze les kun jij druivenrassen en quintatradities lezen als regionale identiteit — los van productiemechanica.",
    18: "Na deze les kun jij het Douro-landschap als cultureel en oenologisch erfgoed uitleggen.",
    19: "Na deze les kun jij het verschil tussen quinta en Port House toepassen in proef en advies.",
    20: "Na deze les kun jij grote Porthuizen herkennen aan hun stijlhandtekening.",
    21: "Na deze les kun jij Ruby Reserve positioneren tussen basis-Ruby en LBV/Vintage.",
    22: "Na deze les kun jij LBV uitleggen als praktische oogstjaar-Port met langere vatrijping.",
    23: "Na deze les kun jij Crusted Port herkennen en het decanteeradvies onderbouwen.",
    24: "Na deze les kun jij Vintage Port uitleggen: declaratie, rijping en service.",
    25: "Na deze les kun jij Vintage en LBV vergelijken op potentieel, toegankelijkheid en gastmoment.",
    31: "Na deze les kun jij per stijl de juiste serveertemperatuur onderbouwen.",
    32: "Na deze les kun jij glaswerk kiezen dat aroma en alcohol in balans houdt.",
    33: "Na deze les kun jij bepalen wanneer decanteren nodig is en hoe je het uitvoert.",
    34: "Na deze les kun jij houdbaarheid na opening inschatten per stijl.",
    35: "Na deze les kun jij per moment de meest logische Portstijl adviseren.",
    36: "Na deze les kun jij Port systematisch aan kaas koppelen per stijl.",
    37: "Na deze les kun jij Port aan chocolade koppelen op structuur, niet alleen zoetheid.",
    38: "Na deze les kun jij Tawny en notendesserts in balans brengen.",
    39: "Na deze les kun jij Port in vleesgerechten positioneren.",
    40: "Na deze les kun jij Port als gastronomisch ingrediënt inzetten.",
    41: "Na deze les kun jij een Portkaart lezen op inzetbaarheid, niet alleen prijs.",
    42: "Na deze les kun jij blind systematisch elimineren in plaats van gokken.",
    43: "Na deze les kun jij Port adviseren vanuit gastcontext en behoefte.",
    44: "Na deze les kun jij kelder- en bewaarstrategie per stijl uitleggen.",
    45: "Na deze les kun jij Port als geïntegreerd systeem toepassen: stijl → structuur → context → keuze.",
}

QUIZ_SUPPLEMENTS: dict[int, str] = {
    40: (
        "### Vraag 1\n\nWelke stijl past het best bij een notige sausreductie?\n\n"
        "A. Ruby\nB. Tawny ✅\nC. White\nD. Rosé\n\n"
        "### Vraag 2\n\nWaarom werkt Port in de keuken?\n\n"
        "A. Door hoge zuur\nB. Als smaakversterker en reductiebasis ✅\nC. Alleen als dessert\nD. Geen alcohol\n\n"
        "### Vraag 3\n\nWhite Port in sabayon geeft vooral:\n\n"
        "A. Bitterheid\nB. Frisse aromatische lift ✅\nC. Tannine\nD. Depot\n\n"
        "### Vraag 4\n\nGastronomische Port vraagt eerst:\n\n"
        "A. Prijs\nB. Functie in het gerecht ✅\nC. Etiketkleur\nD. Jaartal\n\n"
        "### Vraag 5\n\nBeste moment voor culinaire Port?\n\n"
        "A. Alleen digestief\nB. Wanneer structuur het gerecht ondersteunt ✅\nC. Alleen bij vis\nD. Nooit in keuken"
    ),
    41: (
        "### Vraag 1\n\nWat lees je eerst op een Portkaart?\n\n"
        "A. Prijs\nB. Stijlcategorie ✅\nC. Flesgewicht\nD. Alcohol\n\n"
        "### Vraag 2\n\nWaarom groepeer je per stijl?\n\n"
        "A. Voor marketing\nB. Voor inzetbaarheid en servicebeslissing ✅\nC. Alfabetisch\nD. Op jaartal alleen\n\n"
        "### Vraag 3\n\nVintage op de kaart vraagt vooral:\n\n"
        "A. Ijsbucket\nB. Decanteeradvies ✅\nC. Tonic\nD. Lange koeling\n\n"
        "### Vraag 4\n\nTawny op de kaart positioneer je vaak bij:\n\n"
        "A. Aperitief\nB. Dessert en noten ✅\nC. Salade\nD. Sushi\n\n"
        "### Vraag 5\n\nGoede kaartnavigatie volgt:\n\n"
        "A. prijs → stijl\nB. stijl → leeftijd → service → pairing ✅\nC. alleen producent\nD. willekeur"
    ),
    43: (
        "### Vraag 1\n\nEerste stap bij advies?\n\n"
        "A. Duurste fles\nB. Moment en context van de gast ✅\nC. Eigen favoriet\nD. Voorraad opruimen\n\n"
        "### Vraag 2\n\nGast wil rijk, zacht, niet te zwaar. Richting?\n\n"
        "A. Jonge Vintage\nB. Tawny 20 Years ✅\nC. White Dry\nD. Basic Ruby\n\n"
        "### Vraag 3\n\nGoede vragen leiden tot:\n\n"
        "A. Langere monologen\nB. Betere stijlmatch ✅\nC. Minder verkoop\nD. Alleen prijsdiscussie\n\n"
        "### Vraag 4\n\nAdviesvolgorde Way of Tasting:\n\n"
        "A. stijl → prijs\nB. moment → gerecht → ervaring → stijl ✅\nC. producent → jaartal\nD. random\n\n"
        "### Vraag 5\n\nProfessioneel advies is:\n\n"
        "A. Voorkeur pushen\nB. Context-gedreven ✅\nC. Altijd Vintage\nD. Altijd goedkoopste optie"
    ),
    44: (
        "### Vraag 1\n\nWelke Port wordt vaak beter op fles?\n\n"
        "A. Basic Ruby\nB. Vintage ✅\nC. White aperitief\nD. Rosé\n\n"
        "### Vraag 2\n\nKelderdenken vraagt vooral:\n\n"
        "A. Alleen kleur\nB. Rijpingstraject en geduld ✅\nC. Direct drinken\nD. Warm bewaren\n\n"
        "### Vraag 3\n\nOngeopende Vintage bewaar je idealiter:\n\n"
        "A. Staand warm\nB. Liggend, koel en donker ✅\nC. In de keuken\nD. Open in koelkast\n\n"
        "### Vraag 4\n\nLBV vs Vintage bewaren:\n\n"
        "A. Identiek\nB. Vintage heeft meer flespotentieel ✅\nC. LBV altijd langer\nD. Geen verschil\n\n"
        "### Vraag 5\n\nKelder zonder geduld past bij:\n\n"
        "A. Alleen Vintage kopen\nB. Stijlen kiezen die bij je horizon passen ✅\nC. Alles direct openen\nD. Geen Port kopen"
    ),
}
