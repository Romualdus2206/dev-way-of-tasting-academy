"""Beer Track V2 — Gold Master LOCKED micro-pass data."""

from __future__ import annotations

MODULE_GOALS: dict[int, str] = {
    1: (
        "Ontdek wat bier is, hoe gisting het karakter bepaalt, welke vier ingrediënten "
        "de basis vormen en welke hoofdcategorieën de smaakwereld structureren."
    ),
    2: (
        "Begrijp mouten, maischen, hop, gist en lagering als bouwstenen van elk "
        "smaakprofiel en elke stijlbeslissing."
    ),
    3: (
        "Leer systematisch proeven, schuim en aroma's herkennen en structuur en "
        "mondgevoel blind interpreteren."
    ),
    4: (
        "Beheers Pilsner tot Bockbier op productie, smaakprofiel en serveermoment — "
        "de klassieke referentiestijlen."
    ),
    5: (
        "Verdiep Dubbel tot Trappist: Belgische abdijtraditie, gistprofiel en "
        "gastronomische positionering."
    ),
    6: (
        "Beheers IPA tot Barleywine: hoprevolutie, roast-denken en rijpingslogica "
        "in moderne biercultuur."
    ),
    7: (
        "Temperatuur, glaswerk, schenktechniek en bewaren onder de knie krijgen — "
        "service als kwaliteitshefboom."
    ),
    8: (
        "Bier koppelen aan kaas, vlees en desserts met structurele pairinglogica "
        "op zout, vet, umami en bitterheid."
    ),
    9: (
        "Blind analyseren, adviseren en integreren — Beer Academy afronden op "
        "theorie, praktijk en certificeringsniveau."
    ),
}

SUMMARIES: dict[int, list[str]] = {
    1: [
        "Bier is een gefermenteerd matrixsysteem van water, mout, hop en gist",
        "Gisting bepaalt alcohol, koolzuur en aroma",
        "Kleine procesverschillen produceren duizenden stijlen",
        "Proeven begint bij balans, niet bij etiket",
    ],
    2: [
        "Water bepaalt mineraalstructuur en mondgevoel",
        "Mout levert suikers, kleur en roast",
        "Hop structureert bitterheid en aroma",
        "Gist maakt alcohol en esters — interactie is doorslaggevend",
    ],
    3: [
        "Gisting zet suikers om in alcohol en CO₂",
        "Attenuatie stuurt droogheid en body",
        "Temperatuur beïnvloedt gistexpressie direct",
        "Servicefouten maskeeren vaak vergistingskarakter",
    ],
    4: [
        "ondergisting: koel, strak, schoon profiel",
        "bovengisting: warmer, esterrijker, expressiever",
        "Temperatuur en glaswerk zijn stijlafhankelijk",
        "Blindproeven start bij vergistingstype, niet kleur",
    ],
    5: [
        "Categorieën structureren verwachting en communicatie",
        "Lager, ale, tarwe, donker en IPA als ankerpunten",
        "Etiket is hypothese; glas is data",
        "Verkoop werkt op structuur-assen, niet op merk alleen",
    ],
    6: [
        "Mout bepaalt kleur, zoetheid en fermentatiegedrag",
        "Kristalmout verhoogt body; roast verhoogt bitterheidsperceptie",
        "Blind: brood-, karamel- en cacao-tonen wijzen op moutstort",
        "Pairing volgt roast-intensiteit en structuurgewicht",
    ],
    7: [
        "Maischen bepaalt vergistbaarheid en attenuatie",
        "Beta-amylase: meer vergistbare suikers, drogere finale",
        "Alfa-amylase: meer dextrinen, voller mondgevoel",
        "Maischschema lees je terug in textuur en afdronk",
    ],
    8: [
        "Hop levert bitterheid, aroma en stabiliteit",
        "IBU meet analytisch; perceptie is relationeel",
        "Dryhop versterkt aroma zonder IBU-lineair te stijgen",
        "Bitterheid proef je altijd in context van moutzoetheid",
    ],
    9: [
        "Gist is de primaire aromamotor",
        "Esters en fenolen zijn stijlmarkers",
        "Pitch-rate en temperatuur sturen expressie",
        "Te koud serveren dempt gistkarakter onnodig",
    ],
    10: [
        "Lagering stabiliseert; rijping integreert smaken",
        "Tijd alleen is geen kwaliteitsgarantie",
        "Frisheid versus complexiteit vraagt bewuste keuze",
        "Voorraadrotatie is onderdeel van vakmanschap",
    ],
    11: [
        "Proefvolgorde: uiterlijk → neus → mond → afdronk",
        "mondgevoel is een volwaardige analyse-as",
        "Hypotheses vóór conclusies — altijd",
        "Blindproeven draait om reproduceerbare observatie",
    ],
    12: [
        "Schuim signaleert eiwit, koolzuur en glashygiëne",
        "Instortend schuim wijst vaak op service, niet op bier",
        "Schuimkraag beschermt aroma en carbonatie",
        "Eerste visuele cue beïnvloedt gastverwachting",
    ],
    13: [
        "Aroma's lees je in families: mout, hop, gist, rijping",
        "Breed → specifiek → kwaliteit → plausibiliteit",
        "Bronhypothese maakt beschrijving diagnostisch",
        "Pairing volgt aroma-families, niet merkassociatie",
    ],
    14: [
        "Structuur = body, koolzuur, alcoholwarmte, bitterheid",
        "Body en alcohol zijn los van elkaar te beoordelen",
        "Textuur bepaalt elegantie versus zwaarte",
        "Glas en temperatuur sturen tactiele perceptie",
    ],
    15: [
        "Integratie van fundament, productie en proeven",
        "Besliskwaliteit zwaarder dan feitjeskennis",
        "Zwakke schakel = trainingsplan voor Specialist",
        "Causale redenering is het examenproduct",
    ],
    16: [
        "Pilsner: ondergistend, strak, hoge doordrinkbaarheid",
        "Fouten vallen direct op — technisch veeleisend",
        "Frisheid en droge afdronk zijn stijlkenmerken",
        "Service op temperatuur en glas is cruciaal",
    ],
    17: [
        "Blond: toegankelijk maar gistgedreven",
        "Esters en milde moutzoetheid domineren",
        "Balans tussen fruitigheid en droogheid",
        "Brugstijl tussen pils en abdijbier",
    ],
    18: [
        "Weizen: tarwe, esters, fenolen, troebele presentatie",
        "Banaan/kruidnagel zijn gistmarkers, geen toevoeging",
        "Hoog glas ondersteunt schuim en aroma",
        "Schenktechniek bepaalt depot en balans",
    ],
    19: [
        "Witbier: tarwe, koriander, fris en licht bitter",
        "Citrus en kruid vragen juiste serveertemperatuur",
        "Niet beoordelen met pils-criteria",
        "Seizoensbier met gastronomische breedte",
    ],
    20: [
        "Bock: moutdiepte, karamel, seizoenslogica",
        "Lagering integreert alcohol en moutzoetheid",
        "Te warm = alcohol domineert; te koud = vlak",
        "Digestief en pairing-anker in winterkeuken",
    ],
    21: [
        "Dubbel: karamelmout, donker fruit, abdijtraditie",
        "Moutdiepte zonder plakkerige zoetheid",
        "Koolzuur en milde bitterheid dragen structuur",
        "Gastronomisch bij umami en gekaramelliseerde smaken",
    ],
    22: [
        "Tripel: hoog alcohol, droge afdronk, kruidige esters",
        "Hoge attenuatie houdt spanning in het glas",
        "Droogheid maskeert alcohol — serveer met tempo-advies",
        "Krachtig maar verfijnd digestief en pairingbier",
    ],
    23: [
        "Quadrupel: intens, donker, rijp fruit en toffee",
        "Klein glas, rustig tempo, digestief positionering",
        "Oxidatieve rijping kan diepte toevoegen",
        "Pairing bij kaas, wild en chocolade",
    ],
    24: [
        "Saison: droog, kruidig, hoge attenuatie",
        "Boerenbier met gastronomische precisie",
        "Fenolen en koolzuur snijden vet",
        "Temperatuur bepaalt kruidexpressie",
    ],
    25: [
        "Trappist = certificering; abdijbier = stijlfamilie",
        "ITA-regels borgen herkomst en governance",
        "Verkoop op transparantie, niet op mythe",
        "Authenticiteit is commercieel onderscheidend",
    ],
    26: [
        "IPA: hopbitterheid en aroma als kern",
        "Versheid en oxidatiecontrole zijn cruciaal",
        "Substyllen: bitter, juicy, hazy",
        "Pairing bij vet, spice en gegrild vlees",
    ],
    27: [
        "NEIPA: troebel, juicy, zachte bitterheid",
        "Houdbaarheidsvenster is kort — roteer voorraad",
        "Chloride en dryhop bouwen mondgevoel",
        "Oxidatie verschuift aroma snel",
    ],
    28: [
        "Porter: roast, cacao, moutbalans",
        "Minder agressief dan veel stouts",
        "Gastronomisch bij gegrild en stoof",
        "Roast-niveau bepaalt pairing",
    ],
    29: [
        "Stout: roastbitterheid, koffie, cacao",
        "Onderscheid hopbitter versus roastbitter",
        "Varianten van droog tot imperial",
        "Temperatuur en glas bepalen expressie",
    ],
    30: [
        "Barleywine: wijnlogica in bier",
        "Rijping kan complexiteit toevoegen",
        "Klein schenken, hogere temperatuur",
        "Digestief en dessertpairing",
    ],
    31: [
        "Serveertemperatuur stuurt aroma en balans",
        "Te koud dempt; te warm verstoort",
        "Complexere stijlen vragen warmer venster",
        "Temperatuurkaart = professionele standaard",
    ],
    32: [
        "Glaswerk stuurt aroma, schuim en perceptie",
        "Kelkvorm kiest je bewust per stijl",
        "Functioneel, niet decoratief",
        "Verkeerd glas = verkeerde stijlconclusie",
    ],
    33: [
        "Schenktechniek bepaalt schuim, CO₂ en presentatie",
        "Tweefasen-schenking beschermt aroma",
        "Consistentie verlaagt verspilling",
        "Eerste indruk is servicekwaliteit",
    ],
    34: [
        "Niet elk bier wint aan tijd",
        "Hopbier drink je jong; sterke ales kunnen rijpen",
        "Licht, temperatuur en rechtop opslaan",
        "Drinkvenster communiceren, niet beloven",
    ],
    35: [
        "Kaas: koolzuur tegen vet, bitterheid tegen zout",
        "Intensiteit matching is kernregel",
        "Structuur vóór stijlnaam",
        "Bier vaak preciezer dan wijn bij kaas",
    ],
    36: [
        "Vlees: saus bepaalt vaak de pairing",
        "Roast spiegelt Maillard; koolzuur snijdt vet",
        "Hop of mout volgt bereiding en vetgehalte",
        "Eiwit, vet en umami als beslisassen",
    ],
    37: [
        "Dessert: zoetheidsmanagement is alles",
        "Contrast of spiegeling bewust kiezen",
        "Roast bij cacao; frisheid bij fruit",
        "Finale-lengte bepaalt pairingkwaliteit",
    ],
    38: [
        "Lager vs ale: esters, koolzuur, afdronk",
        "Kleur misleidt — structuur beslist",
        "Hypothesen stap voor stap uitsluiten",
        "Blind = reproduceerbaar redeneren",
    ],
    39: [
        "IPA vs stout: hopbitter versus roastbitter",
        "Neus → eerste slok → afdronk als volgorde",
        "Visuele cues zijn onbetrouwbaar",
        "Mechanisme-onderzoek voorkomt misclassificatie",
    ],
    40: [
        "Volledige integratie: theorie, proeven, service, pairing",
        "Oordeel zwaarder dan geheugen",
        "Certificering is startpunt, geen eindpunt",
        "Gerichte retraining na zwakke competentie",
    ],
}

FOOD_PAIRING_WAAROM: dict[int, str] = {
    11: (
        "Neutraal zout activeert het palet zonder dominante smaken; koolzuur en lichte bitterheid "
        "houden observatie schoon zodat mondgevoel en afdronk objectief leesbaar blijven."
    ),
    15: (
        "Integratiepairing test koolzuur tegen vet, zoetheid tegen zout en bitterheid tegen umami "
        "over meerdere gangen — dezelfde assen als in je mini-toetsbeslissingen."
    ),
    31: (
        "Juiste temperatuur laat esters en koolzuur werken: te koud dempt aroma en verhardt bitterheid; "
        "te warm vergroot zoetheid en alcohol — pairing begint bij serveerconditie."
    ),
    32: (
        "Glasvorm concentreert of opent aroma: smalle opening voor esters, brede kelk voor textuur — "
        "zelfde bier, ander glas, andere pairingconclusie."
    ),
    33: (
        "Stabiel schuim en intacte koolzuur reinigen vet en resetten zoutperceptie; oxidatie door "
        "slecht schenken verstoort hop- en moutbruggen in pairing."
    ),
    34: (
        "Bewaarde bieren tonen meer geïntegreerde zoetheid en roast; pairing verschuift van frisse "
        "zout-vet-snede naar umami en rijpe textuur — rotatie bepaalt het moment."
    ),
}

PRO_INSIGHTS: dict[int, str] = {
    1: (
        "Gasten die bier 'te bitter' vinden, kennen vaak alleen massamarkt-lager. Vraag naar moment "
        "en gerecht vóór je stijl noemt — moutzoetheid en koolzuur openen verkoop zonder push."
    ),
    11: (
        "Train personeel om vóór conclusie drie observaties te noteren; dat verlaagt retour door "
        "verkeerd advies en verhoogt blindproef-nauwkeurigheid in service."
    ),
    15: (
        "Noteer per mini-toets één zwakke schakel per medewerker; dat wordt je teamtrainingsplan "
        "en voorkomt generiek 'bieradvies' aan tafel."
    ),
    31: (
        "Hang een stijl-temperatuurkaart achter de bar; discussies dalen, upsell naar speciaalbier "
        "stijgt omdat smaak consistent leesbaar wordt."
    ),
    40: (
        "Plan na certificering één maandelijkse kalibratieproef; vakmanschap veroudert zonder "
        "herhaling — examen is startpunt, geen eindpunt."
    ),
}

QUIZ_COUNT_OVERRIDES: dict[int, int] = {
    15: 5,
    40: 5,
}

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"gistvITAliteit", "gistvitaliteit"),
    (r"vITAle", "vitale"),
    (r"ITAlië", "Italië"),
    (r"\bBiercategorieen\b", "Biercategorieën"),
    (r"\bcategorieen\b", "categorieën"),
    (r"\bCategorieen\b", "Categorieën"),
    (r"\bbeinvloedt\b", "beïnvloedt"),
    (r"\bBeinvloedt\b", "Beïnvloedt"),
    (r"\bingredient\b", "ingrediënt"),
    (r"\bIngredient\b", "Ingrediënt"),
    (r"\bingredienten\b", "ingrediënten"),
    (r"\bIngredienten\b", "Ingrediënten"),
    (r"\bgeevolueerd\b", "geëvolveerd"),
    (r"\bgeorienteerd\b", "georiënteerd"),
    (r"\bGeorienteerd\b", "Georiënteerd"),
    (r"\bpairen\b", "pairt"),
    (r"\bPairen\b", "Pairt"),
    (r"\baroma's\b", "aroma's"),  # normalize apostrophe
    (r"\bCO2\b", "CO₂"),
]
