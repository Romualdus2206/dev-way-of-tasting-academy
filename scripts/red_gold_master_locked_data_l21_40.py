"""Red Wine Track V2 — FINAL LOCK precision pass (module kernbegrippen + Les 21-40 quiz-feedback).

Bron: `content/pipeline/RED_PIPELINE_CONTENT.md` (Module 1 t/m 9, Les 21 t/m 40).
Elite polish-pass: module-kernbegrippen (alle 9 modules) ontdaan van generieke
Wine Foundation-termen (rode wijn, druiven, fermentatie, body, aroma, tannine,
rijping, structuur, balans, harmonie, pairing) en vervangen door specialist
Red DB-termen die al elders in de Gold Master voorkomen, plus quiz-feedback-
overrides voor Les 21-40 volgens het validatie / Drie leerankers / bridge-
format.
"""

from __future__ import annotations


def _qf(validation: str, leerankers: tuple[str, str, str], bridge: str) -> str:
    bullets = "\n".join(f"- {item}" for item in leerankers)
    return f"{validation}\n\nDrie leerankers:\n\n{bullets}\n\n{bridge}"


MODULE_KERNBEGRIPPEN: dict[int, list[str]] = {
    1: [
        "anthocyanen",
        "tanninearchitectuur",
        "fenolische rijpheid",
        "schilextractie",
        "zuur-tannine-alcoholdriehoek",
        "dunschillige rassen",
        "dikschillige rassen",
        "cépageselectie",
        "amfora-maceratietraditie",
        "blindproefmarker",
    ],
    2: [
        "pigeage",
        "remontage",
        "délestage",
        "extractiecurve",
        "copigmentatie",
        "polymerisatie",
        "koolzuurmaceratie",
        "intracellulaire gisting",
        "houttannine-integratie",
        "vatrotatie",
    ],
    3: [
        "rood-proefprotocol",
        "rand-versus-kernanalyse",
        "paars-naar-baksteenovergang",
        "rood-versus-zwartfruitspectrum",
        "tannine-antocyaanpolymerisatie",
        "dierlijke tertiaire tonen",
        "schil-versus-pittanninen",
        "fijnkorrelig-versus-grofkorrelig",
        "astringentiemeting",
        "zuur-tannine-alcohol-lichaamsvolgorde",
    ],
    4: [
        "Pinot Noir",
        "Gamay",
        "Grenache",
        "Cinsault",
        "Mencía",
        "carbonic maceratie",
        "Gamay-Pinot Noir-verwarring",
        "garrigue-kruidigheid",
        "Bierzo-leisteenbodem",
        "fijnkorrelige tannine",
    ],
    5: [
        "Merlot",
        "Sangiovese",
        "Tempranillo",
        "Barbera",
        "Zinfandel",
        "Pomerol-kleibodem",
        "Brunello di Montalcino",
        "Crianza-Reserva-Gran Reserva",
        "snijdend zuur",
        "Primitivo-genetische identiteit",
    ],
    6: [
        "Cabernet Sauvignon",
        "Syrah",
        "Malbec",
        "Nebbiolo",
        "Mourvèdre",
        "IBMP-pyrazine",
        "rotundone",
        "kleur-tannine-ontkoppeling",
        "Uco Valley-hoogteligging",
        "Bandol-appellatie-eisen",
    ],
    7: [
        "eiwitbindingskinetiek",
        "chambré-mythe",
        "Bordeaux-glasgeometrie",
        "Bourgondië-trechtereffect",
        "sedimentscheiding versus beluchting",
        "dubbeldecanteren",
        "hyperdecanteren",
        "tartraatkristallen versus bezinksel",
        "tannine-antocyaan-polymerisatie",
        "drinkvenster per structuurcategorie",
    ],
    8: [
        "tannine-eiwitbinding",
        "vetgehalte-tanninematch",
        "Maillard-brug bij barbecue",
        "caseïnematrix en tanninebinding",
        "blauwschimmel-zoutmismatch",
        "intensiteitsmatching boven kleurmatching",
        "myoglobineconcentratie",
        "tertiaire aromabrug",
        "rotundone-marinadematch",
        "umami-tannine-risico",
    ],
    9: [
        "kleur-als-onbetrouwbare-indicator",
        "hypothese-vóór-onthullingsprotocol",
        "grip-versus-lineariteit",
        "rijpingscurve-verschil",
        "grind versus klei (Bordeaux-oevers)",
        "cederhout-en-grafietsignatuur",
        "Bordeaux-stamboomverwantschap",
        "systematische deductieketen",
        "structuur-eerst-principe",
        "examenintegratie",
    ],
}


QUIZ_FEEDBACK_OVERRIDES: dict[int, str] = {
    21: _qf(
        "Goed — je herkent nu waarom Merlot de meest toegankelijke Bordeaux-druif is zonder aan "
        "diepgang in te boeten.",
        (
            "Een dunnere schil en minder pitten geven Merlot zachtere, rondere tannine en "
            "gematigder zuur dan Cabernet Sauvignon.",
            "Pomerol's kleibodem laat Merlot decennialang rijpen via concentratie, niet via ruwe "
            "tannine.",
            "Het grootste verwarringsgevaar is Cabernet Sauvignon: een groene, pyrazine-achtige "
            "rand verraadt de andere druif.",
        ),
        "Volgende les: Les 22 verschuift naar Sangiovese, waar hoge zuur in plaats van zachte "
        "tannine de structuur draagt.",
    ),
    22: _qf(
        "Goed — je begrijpt nu waarom Sangiovese de meest gastronomische medium body-druif van "
        "Italië is.",
        (
            "Warme dagen en koele nachten in Toscane geven Sangiovese zowel fenolische rijpheid "
            "als hoge zuur.",
            "Medium, hoekige tannine gecombineerd met scherpe kersenzuur maakt de druif ideaal bij "
            "tomaatgerechten.",
            "Het grootste verwarringsgevaar is Tempranillo; Sangiovese blijft scherper en "
            "kersachtiger, met minder zoete houttoon.",
        ),
        "Volgende les: Les 23 behandelt Tempranillo, waar juist die houttoon en een rondere "
        "zuurlijn de doorslag geven.",
    ),
    23: _qf(
        "Goed — je herkent nu Tempranillo op zijn wettelijk vastgelegde rijpingsstijl en "
        "Amerikaans-eiken-signatuur.",
        (
            "Crianza, Reserva en Gran Reserva zijn wettelijke minimale rijpingstermijnen die de "
            "stijl direct sturen.",
            "Vanille- en kokostonen van Amerikaans eiken zijn het duidelijkste onderscheid met "
            "Sangiovese.",
            "Medium tannine en zuur, ronder dan Sangiovese, passen van nature bij langdurige "
            "houtrijping.",
        ),
        "Volgende les: Les 24 sluit af met Barbera, een druif die net als Sangiovese op zuur "
        "leunt maar met nog lagere tannine.",
    ),
    24: _qf(
        "Goed — je begrijpt nu waarom Barbera het zuur, niet de tannine, de structuur laat "
        "dragen.",
        (
            "Van nature laag tannine met uitzonderlijk hoog, snijdend zuur maakt Barbera direct "
            "drinkbaar zonder plat te worden.",
            "Piemonte's koelere, minder prestigieuze hellingen behouden precies die extreme "
            "zuurgraad.",
            "Het verwarringsgevaar met Grenache in een rijpe jaargang los je op door eerst het "
            "zuur apart te proeven.",
        ),
        "Volgende les: Les 25 sluit Module 5 af met Zinfandel, waar juist hoog alcohol in plaats "
        "van hoog zuur de structuur domineert.",
    ),
    25: _qf(
        "Goed — je beheerst nu de belangrijkste medium body rode druiven van Module 5.",
        (
            "Zinfandel is genetisch identiek aan Primitivo maar dankt zijn faam aan Californische "
            "warmte en hoog alcohol.",
            "Ongelijkmatige trosrijping dwingt wijnmakers tot precieze, lastige oogsttiming.",
            "Het verwarringsgevaar met Grenache los je op via expliciete zwarte peper en een "
            "jammy, bijna rozijnachtige concentratie.",
        ),
        "Volgende stap: Module 6 — Krachtige rode druiven, te beginnen met Cabernet Sauvignon en "
        "zijn genetische oorsprong.",
    ),
    26: _qf(
        "Goed — je begrijpt nu waarom Cabernet Sauvignon zijn kracht dankt aan een specifieke "
        "genetische en fysieke opbouw.",
        (
            "Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc verklaart zowel de "
            "pyrazinetoon als de dikke schil.",
            "IBMP is een rijpheidssignaal, geen vast druifkenmerk — te veel groene paprika wijst "
            "op onderrijpheid.",
            "De stevige, grofkorrelige tannine integreert uitstekend met nieuw eikenhout, vandaar "
            "de klassieke Bordeaux-blendlogica.",
        ),
        "Volgende les: Les 27 behandelt Syrah, waar niet pyrazine maar rotundone de kenmerkende "
        "specerij bepaalt.",
    ),
    27: _qf(
        "Goed — je herkent nu Syrah op zijn stuurbare zwarte-pepersignatuur en dubbele "
        "geografische identiteit.",
        (
            "Rotundone veroorzaakt de zwarte peper en neemt toe naarmate de druif minder zonlicht "
            "krijgt.",
            "Côte-Rôtie mag wettelijk tot 20% Viognier co-fermenteren voor kleurstabiliteit en een "
            "subtiele bloesemlift.",
            "Warm klimaat (Barossa/Shiraz) onderdrukt rotundone en geeft rijp fruit met minder "
            "peper — dezelfde druif, tegengestelde uitersten.",
        ),
        "Volgende les: Les 28 verschuift naar Malbec, dat via een compleet andere genetische band "
        "met Merlot verwant is.",
    ),
    28: _qf(
        "Goed — je begrijpt nu waarom Malbec's diepe kleur een andere tanninestructuur verbergt "
        "dan je zou verwachten.",
        (
            "Genetisch is Malbec een halfbroer van Merlot via de gedeelde moederdruif Magdeleine "
            "Noire des Charentes.",
            "Hoogteligging in de Uco Valley combineert intense kleur met zuurbehoud via een groot "
            "diurnaal verschil.",
            "Ondanks de diepe kleur is de tannine fijnkorreliger en toegankelijker dan bij "
            "Cabernet Sauvignon.",
        ),
        "Volgende les: Les 29 behandelt Nebbiolo, waar kleur en tannine juist volledig "
        "tegenovergesteld zijn gekoppeld.",
    ),
    29: _qf(
        "Goed — je begrijpt nu de structurele paradox die Nebbiolo tot een van de lastigste "
        "blindproefdruiven maakt.",
        (
            "Bleke, granaatachtige kleur en extreem hoge tannine zijn bij Nebbiolo volledig "
            "losgekoppeld.",
            "Bodemtype (kalkmergel versus zandsteen) verklaart waarom Barolo en Barbaresco "
            "structureel verschillen.",
            "Hoge zuren en hoge tannine samen maken de wettelijk verplichte, decennialange "
            "rijping mogelijk.",
        ),
        "Volgende les: Les 30 sluit Module 6 af met Mourvèdre, de ruggengraat van GSM-blends.",
    ),
    30: _qf(
        "Goed — je beheerst nu de belangrijkste krachtige rode druiven van Module 6.",
        (
            "Mourvèdre budt laat uit en heeft veel warmte nodig om haar volle, aardse potentieel "
            "te bereiken.",
            "Jonge Mourvèdre toont vaak reductieve bloed- en leertonen die met beluchting "
            "verdwijnen, geen wijnfout.",
            "In GSM-blends levert Mourvèdre de tanninebasis en het bewaarpotentieel die Grenache "
            "en Syrah alleen niet bieden.",
        ),
        "Volgende stap: Module 7 — Service, te beginnen met hoe temperatuur tanninegrip en "
        "alcoholperceptie tegelijk stuurt.",
    ),
    31: _qf(
        "Goed — je begrijpt nu waarom serveertemperatuur bij rode wijn twee tegengestelde "
        "mechanismen tegelijk stuurt.",
        (
            "Koude vertraagt de eiwitbinding van tannine, waardoor tannine harder en droger "
            "aanvoelt.",
            "Warmte verhoogt ethanolvolatiliteit — te warm geeft een dominante, brandende "
            "alcoholindruk.",
            "'Kamertemperatuur' is een historisch verouderd begrip van 15–16°C, niet de moderne "
            "21–22°C.",
        ),
        "Volgende les: Les 32 bouwt hierop voort met glaswerk, dat dezelfde tanninegrip via "
        "glasvorm stuurt.",
    ),
    32: _qf(
        "Goed — je begrijpt nu hoe glasvorm rechtstreeks stuurt of tannine of fruit als eerste "
        "wordt waargenomen.",
        (
            "Het Bordeaux-glas stuurt krachtige, tanninerijke wijn naar het midden en de "
            "achterkant van de tong.",
            "Het Bourgondië-glas trechtert subtiele secundaire aroma's naar de neus en stuurt wijn "
            "naar het tongpuntje.",
            "Het neutrale ISO-glas blijft de standaard voor blind proeven, zodat het glas zelf "
            "geen variabele wordt.",
        ),
        "Volgende les: Les 33 behandelt decanteren, waar zuurstof en glasvorm samen de "
        "tanninepercepetie verder sturen.",
    ),
    33: _qf(
        "Goed — je begrijpt nu dat decanteren bij rode wijn twee wezenlijk verschillende doelen "
        "dient.",
        (
            "Sedimentscheiding (oude wijn) en beluchting (jonge tanninerijke wijn) vragen een "
            "compleet andere schenktechniek.",
            "Decanteertijd schaalt met structuurniveau: uren voor krachtige jonge wijn, minuten "
            "voor fragiele oude wijn.",
            "Tartraatkristallen zijn onschuldig; echt bezinksel is gepolymeriseerde "
            "tannine-pigmentneerslag.",
        ),
        "Volgende les: Les 34 sluit Module 7 af met bewaren en kelderen, waar diezelfde "
        "tanninepolymerisatie de kleurevolutie stuurt.",
    ),
    34: _qf(
        "Goed — je beheerst nu de professionele serviceprincipes voor rode wijn uit Module 7.",
        (
            "Tannine-antocyaan-polymerisatie verklaart zowel de kleurevolutie als de vorming van "
            "bezinksel.",
            "Appellatieregels (Barolo 38 maanden, Barbaresco 26 maanden) weerspiegelen structurele "
            "rijpingsbehoefte.",
            "Liggend bewaren is extra belangrijk bij rood door de vaak decennialange "
            "bewaarhorizon.",
        ),
        "Volgende stap: Module 8 — Pairing & Gastronomie, te beginnen met het chemische "
        "mechanisme achter rode wijn en vlees.",
    ),
    35: _qf(
        "Goed — je begrijpt nu het chemische mechanisme achter waarom rode wijn zo sterk werkt "
        "met vlees.",
        (
            "Tannine bindt bij voorkeur aan eiwit en vet in vlees in plaats van aan "
            "speekseleiwitten.",
            "Het vetgehalte van het vlees moet schalen met het tanninegehalte van de wijn.",
            "Maillard-roostertonen van grillen resoneren direct met toastnoten uit "
            "eikenhoutlagering.",
        ),
        "Volgende les: Les 36 past dezelfde eiwitlogica toe op kaas, waar caseïne tannine juist "
        "agressiever bindt.",
    ),
    36: _qf(
        "Goed — je begrijpt nu waarom 'rode wijn hoort bij kaas' fragieler is dan de populaire "
        "aanname doet vermoeden.",
        (
            "Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees.",
            "Harde, lang gerijpte kazen matchen goed via intensiteit; zachte, vetrijke kazen "
            "overbinden tannine juist.",
            "Blauwschimmelkaas botst met droge tannine — zoete Port werkt beter door restsuiker "
            "tegen zout.",
        ),
        "Volgende les: Les 37 verschuift naar wild, waar de aromatische brug zwaarder weegt dan "
        "de tannine-vetbuffering.",
    ),
    37: _qf(
        "Goed — je begrijpt nu waarom wildpairing sterker op aroma leunt dan op de klassieke "
        "tannine-vetlogica.",
        (
            "Wild heeft minder intramusculair vet dan gefokt vlees, waardoor het "
            "tannine-vet-mechanisme zwakker werkt.",
            "Tertiaire tonen in gerijpte wijn (bosgrond, leer, gedroogd fruit) resoneren met de "
            "aardse smaak van wild.",
            "Peperige jeneverbesmarinades resoneren specifiek met rotundone-gedreven wijnen zoals "
            "Syrah.",
        ),
        "Volgende stap: Module 9 — Blindproeven & Examen, te beginnen met Pinot Noir versus "
        "Nebbiolo.",
    ),
    38: _qf(
        "Goed — je begrijpt nu de belangrijkste blindverschillen tussen Pinot Noir en Nebbiolo.",
        (
            "Beide zijn bleek van kleur, maar om tegengestelde redenen — kleur is bij deze twee "
            "geen betrouwbare tannine-indicator.",
            "Tannine op de mond is het beslissende signaal: fijn en zijdezacht bij Pinot Noir, "
            "intens en droog bij Nebbiolo.",
            "Train het hypothese-vóór-onthullingsprotocol: kleur, dan aroma, dan mond, vóór je "
            "het etiket ziet.",
        ),
        "Volgende les: Les 39 past dezelfde structuur-eerst-aanpak toe op Merlot versus Cabernet "
        "Sauvignon.",
    ),
    39: _qf(
        "Goed — je begrijpt nu het sleutelverschil tussen Merlot en Cabernet Sauvignon in een "
        "blindproef.",
        (
            "Een dunnere schil en grotere bessen laten Merlot één tot twee weken eerder rijpen, "
            "met zachtere tannine.",
            "Tanninekorrel is beslissend: rond en vol bij Merlot, strak en korrelig bij Cabernet "
            "Sauvignon.",
            "Merlot en Cabernet Sauvignon delen via Cabernet Franc een genetische "
            "Bordeaux-verwantschap.",
        ),
        "Volgende les: Les 40 — het Theorie- en praktijkexamen — integreert alle veertig lessen "
        "in één Master-toets.",
    ),
    40: _qf(
        "Gefeliciteerd — je beheerst nu het volledige fundament van rode wijn: theorie, "
        "productie, druivenkennis, service, pairing en blindproeven.",
        (
            "Drie druivenfamilies (licht, medium, krachtig) drijven elk op een ander mechanisme "
            "— fijne tannine, balans of dikke schillen.",
            "Service en pairing bouwen op chemische mechanismen (eiwitbindingskinetiek, "
            "caseïnebinding), niet op traditie alleen.",
            "Tanninestructuur, niet kleur en niet hout, blijft het betrouwbaarste bewijs bij elke "
            "blindanalyse.",
        ),
        "Volgende stap: met de certificering Way of Tasting Academy — Red Wine Certified (Master "
        "Foundation) op zak kies je je vervolgtrack en bouw je voort op deze Master-basis.",
    ),
}
