"""Red Wine Track V2 — FINAL LOCK precision pass data (lessen 1–20).

Bron voor context: `content/pipeline/RED_PIPELINE_CONTENT.md`.
Identiteit: tannine als derde structuuras naast zuur en alcohol, fenolische
rijpheid, extractiecurve (anthocyanen versus tannine), copigmentatie en
polymerisatie tijdens rijping, hout- versus schil- versus pittannine,
rand-en-kernkleuranalyse, blindproefmarkers per druif — géén Wine Foundation-
of White Track-rehash.
"""

from __future__ import annotations


def _qf(validation: str, leerankers: tuple[str, str, str], bridge: str) -> str:
    """Bouw een quiz-feedback tekst op uit validatie, drie leerankers en een brug."""
    bullets = "\n".join(f"- {anker}" for anker in leerankers)
    return f"{validation}\n\nDrie leerankers:\n{bullets}\n\n{bridge}"


QUIZ_FEEDBACK_OVERRIDES: dict[int, str] = {
    1: _qf(
        "Sterk begin. Je begrijpt nu dat rode wijn zijn identiteit ontleent aan "
        "een derde structuuras die witte wijn volledig mist.",
        (
            "anthocyanen en tannine als twee losstaande verbindingen met elk een "
            "eigen extractiepad",
            "de zuur-tannine-alcoholdriehoek als vervanging van de zuur-"
            "extractbalans bij wit",
            "fenolische rijpheid (pit en schil) die apart van suikerrijpheid "
            "(Brix) beoordeeld moet worden",
        ),
        "In les 2 volg je die tanninearchitectuur de kelder in: hoe ontstelen, "
        "koude weking en persfractie samen bepalen welke structuur een rode "
        "wijn uiteindelijk krijgt.",
    ),
    2: _qf(
        "Solide. Je ziet nu dat elke keuze in de productieketen — van "
        "ontstelen tot assemblage — de tanninearchitectuur van de wijn bewust "
        "stuurt.",
        (
            "ontstelen versus steelinclusie als eerste structuurbeslissing",
            "koude weking die aroma en kleur extraheert vóór de zware "
            "tannine-extractie van de gisting begint",
            "vin de goutte en vin de presse als twee fracties met elk een "
            "eigen tanninetextuur",
        ),
        "In les 3 zoom je uit en ontdek je waarom precies die derde as — "
        "tannine — rode wijn tot een fundamenteel andere categorie maakt dan "
        "elke andere wijnstijl.",
    ),
    3: _qf(
        "Scherp gewerkt. Je kunt nu verklaren waarom tannine niet decoratief "
        "is, maar functioneel via de eiwit-tanninebinding.",
        (
            "eiwit-tanninebinding als verklaring voor het 'opschonende' effect "
            "bij vet vlees",
            "polymerisatie van tannine en anthocyanen tijdens flesrijping tot "
            "sediment",
            "structuurbalans (zuur-tannine-alcohol) als betrouwbare "
            "blindproefmarker voor klimaat",
        ),
        "In les 4 zie je hoe deze structuurgedreven identiteit zich historisch "
        "ontwikkelde, van amfora-maceratie tot de Bordeaux-blendtraditie.",
    ),
    4: _qf(
        "Goed doorgronde. Je kunt nu 'klassiek' en 'internationale stijl' bij "
        "Bordeaux scherp uit elkaar houden in plaats van ze te verwarren.",
        (
            "amfora- en qvevri-maceratie als voorloper van moderne, lange "
            "schilcontacttechnieken",
            "de 1855-classificatie als prijsgebaseerde chateau-hiërarchie",
            "de foudre-naar-barriquetransitie en de internationale "
            "stijlcorrectie sinds de jaren 2010",
        ),
        "In les 5 gebruik je dat historisch kader om de hoofdcategorieën van "
        "rode wijn te herkennen aan schildikte en extractiepotentieel.",
    ),
    5: _qf(
        "Sterk. Je herkent nu dat de indeling in lichte, medium en volle rode "
        "wijn rechtstreeks uit schildikte volgt, niet uit smaakvoorkeur.",
        (
            "dunschillige versus dikschillige rassen als basis van "
            "extractiepotentieel",
            "middencategorie-rassen die via productiekeuzes tussen "
            "toegankelijk en bewaarbaar bewegen",
            "monocépage versus cuvée als tweede, onafhankelijke stijlas",
        ),
        "Module 2 begint in les 6 bij het productiemoment waar deze "
        "tanninearchitectuur letterlijk vorm krijgt: schilcontact tijdens de "
        "gisting.",
    ),
    6: _qf(
        "Degelijk werk. Je begrijpt nu dat schilcontact geen passief wachten "
        "is, maar een actief gestuurd extractieproces via de hoed.",
        (
            "pigeage voor een zachte, gelijkmatige extractiecurve",
            "remontage die naast extractie ook zuurstof aan de gistende most "
            "toevoegt",
            "maceratieduur en extractietemperatuur als gezamenlijke sturende "
            "factoren",
        ),
        "In les 7 ontleed je die extractiecurve verder: waarom kleur en "
        "tannine niet gelijktijdig extraheren en wat copigmentatie daarmee te "
        "maken heeft.",
    ),
    7: _qf(
        "Scherp. Je kunt nu onderscheid maken tussen normale, jeugdige "
        "tanninestrengheid en tannine die op overextractie wijst.",
        (
            "de extractiecurve waarbij anthocyanen snel extraheren en "
            "tannine traag doorloopt",
            "copigmentatie als stabiliserende binding tussen anthocyanen en "
            "tannine",
            "polymerisatie tijdens verlengde maceratie als bron van zachtere "
            "tannine",
        ),
        "In les 8 volg je die extractie de tank in en ontdek je waarom rode "
        "wijn warmer vergist dan wit — en wat dat met alcohol als "
        "oplosmiddel te maken heeft.",
    ),
    8: _qf(
        "Goed doordacht. Je begrijpt nu dat alcohol bij rode wijn een dubbele "
        "rol speelt: suikeromzetting én oplosmiddel voor tannine en kleur.",
        (
            "het gistingstemperatuurregime (25–32°C) dat extractie en "
            "gistactiviteit tegelijk stuurt",
            "thermovinificatie als snelle maar structureel eenvoudigere "
            "kleurextractie",
            "koolzuurmaceratie als intracellulaire gisting zonder gewone "
            "schilextractie",
        ),
        "In les 9 verlaat de wijn de tank en kijk je naar de volgende "
        "structuurlaag: hoe houtlagering zijn eigen tannine toevoegt aan wat "
        "de druif al aanlevert.",
    ),
    9: _qf(
        "Sterk gewerkt. Je kunt nu een wijn zonder etiket toewijzen aan "
        "houttype op basis van houtintegratie in plaats van op smaak alleen.",
        (
            "zuurstofintegratie via vatporiën die polymerisatie versnelt en "
            "tannine verrondt",
            "Frans versus Amerikaans eikenhout als bron van fijne versus "
            "uitgesproken houttannine",
            "de foudre-barriqueverhouding als keuze tussen textuurontwikkeling "
            "en directe houtsmaak",
        ),
        "In les 10 zie je hoe deze houtgedreven structuur samen met "
        "flesrijping bepaalt hoe lang en hoe een rode wijn kan evolueren.",
    ),
    10: _qf(
        "Goed onderbouwd. Je kunt nu uitleggen waarom decanteren van een "
        "oudere rode wijn een ander doel dient dan bij een jonge fles.",
        (
            "polymerisatie die doorgaat tot moleculen als sediment neerslaan",
            "het rijpingsvenster dat per stijl van enkele jaren tot decennia "
            "verschilt",
            "het decanteermoment gericht op sedimentscheiding, niet op "
            "agressieve beluchting",
        ),
        "Met dit fundament stap je in les 11 de proefzaal in: hoe je rode "
        "wijn systematisch proeft met tannine als centrale, extra "
        "structuuras.",
    ),
    11: _qf(
        "Sterk. Je beheerst nu het aangepaste proefprotocol waarin tannine "
        "zich als aparte as tussen zuur en alcohol invoegt.",
        (
            "randanalyse (paars, robijn, granaat, baksteen) als eerste "
            "visuele signaal",
            "tweefasen-ruiken omdat rode aroma's zwaarder aan tannine "
            "gebonden zitten",
            "de vaste mondvolgorde zuur, tannine, alcohol, body, dan balans",
        ),
        "In les 12 pas je dit protocol concreet toe op kleur: hoe je rand en "
        "kern apart leest zonder aan het etiket te denken.",
    ),
    12: _qf(
        "Goed gelezen. Je gebruikt kleur nu als rand-en-kernhypothese in "
        "plaats van als eindoordeel.",
        (
            "rand-versus-kernanalyse in plaats van één lineaire "
            "intensiteitsschaal",
            "de paars-naar-baksteenovergang als betrouwbaar leeftijdssignaal",
            "de Nebbiolo-paradox: dunschillig met toch extreem hoge tannine",
        ),
        "In les 13 zet je die visuele hypothese om in een aromahypothese: hoe "
        "je primair, secundair en tertiair fruit bij rode wijn herkent.",
    ),
    13: _qf(
        "Scherp gedaan. Je kunt nu aroma's indelen naar herkomst en direct "
        "koppelen aan een druifhypothese.",
        (
            "het rood-versus-zwartfruitspectrum als eerste druifsignaal",
            "MLF als standaardpraktijk bij rood, waardoor boter zelden "
            "dominant is",
            "dierlijke en aardse tertiaire tonen die ontstaan via "
            "tannine-antocyaanpolymerisatie",
        ),
        "In les 14 volgt het laatste zintuiglijke bouwblok vóór de "
        "mini-toets: tannine zelf, in detail en per bron.",
    ),
    14: _qf(
        "Sterk. Je kunt tannine nu objectief beoordelen op bron in plaats van "
        "op intensiteit alleen.",
        (
            "schil-, pit- en houttannine als drie bronnen met elk een eigen "
            "textuur",
            "tanninepolymerisatie die met leeftijd de structuur verandert "
            "zonder de hoeveelheid te verlagen",
            "astringentiemeting via droogte, grip en aanhoudduur na "
            "doorslikken",
        ),
        "In les 15 breng je schilcontact, kleur, aroma en tannine samen in "
        "de eerste grote integratietoets van deze track.",
    ),
    15: _qf(
        "Uitstekend. Je hebt schilcontact, kleur, aroma en tannine nu "
        "succesvol in één blind protocol geïntegreerd.",
        (
            "de schilcontact-extractiekoppeling als gezamenlijke bron van "
            "kleur én tannine",
            "rand-en-kernkleuranalyse als eerste, nog te toetsen hypothese",
            "tannine als centrale as met eigen bronnen en rijpingsgedrag",
        ),
        "In les 16 zet je dit fundament om in druivenherkenning, te beginnen "
        "met de meest terroirgevoelige lichte druif: Pinot Noir.",
    ),
    16: _qf(
        "Sterk. Je herkent Pinot Noir nu op fijnkorrelige tannine en "
        "zuurgedreven bewaarpotentieel, ondanks de lichte kleur.",
        (
            "extreme terroir- en klimaatgevoeligheid als kernkenmerk van de "
            "druif",
            "zuurgedreven bewaarpotentieel als uitzondering op de "
            "tanninegebonden vuistregel",
            "de Nebbiolo-kleurparadox als grootste blindproef-valkuil",
        ),
        "In les 17 blijf je in het lichte segment, maar bij een druif waar "
        "een specifieke vinificatietechniek — carbonic maceratie — het "
        "profiel bepaalt: Gamay.",
    ),
    17: _qf(
        "Goed herkend. Je begrijpt nu waarom Gamay zijn kenmerkende profiel "
        "vooral aan een techniek dankt, niet alleen aan de druif.",
        (
            "carbonic maceratie als bron van banaan- en kersendropesters bij "
            "minimale tannine-extractie",
            "het Cru-versus-basis-Beaujolais-onderscheid in structuur en "
            "bewaarpotentieel",
            "de Gamay-Pinot Noir-verwarring, opgelost via de afwezige "
            "bosgrondtoon bij Gamay",
        ),
        "In les 18 verlaat je de koele Beaujolais-stijl voor een druif die "
        "juist in hitte tot volle rijpheid komt: Grenache.",
    ),
    18: _qf(
        "Sterk gewerkt. Je begrijpt nu waarom Grenache zelden solo bewaart en "
        "waarom de GSM-blend daar een structurele oplossing voor is.",
        (
            "warmteklimaat-alcoholopbouw als kernkenmerk van de druif",
            "de GSM-blend waarin Syrah en Mourvèdre het geraamte leveren dat "
            "Grenache zelf mist",
            "garrigue-kruidigheid als onderscheidend signaal tegenover de "
            "explicietere Zinfandel",
        ),
        "In les 19 blijf je bij een warmteminnende druif, maar dan een "
        "paradoxaal dunschillige: Cinsault.",
    ),
    19: _qf(
        "Goed doorzien. Je kunt nu verklaren waarom Cinsault ondanks zijn "
        "warme herkomst juist licht en bloemig blijft.",
        (
            "dunschilligheid ondanks warmteminnende herkomst als "
            "verklarende paradox",
            "de roosébasis die Cinsault historisch tot een sleuteldruif "
            "maakte",
            "de Cinsault-Grenache-blendverhouding, herkenbaar aan de "
            "opfrissende, bloemige onderlaag",
        ),
        "In les 20 sluit je Module 4 af met een Spaanse druif die op het "
        "eerste gezicht verrassend veel raakvlakken heeft met Pinot Noir: "
        "Mencía.",
    ),
    20: _qf(
        "Sterk gedaan. Je sluit Module 4 af met een scherp onderscheid "
        "tussen twee druiven die qua kleur, zuur en bloemigheid sterk op "
        "elkaar lijken.",
        (
            "de Bierzo-leisteenbodem als bron van Mencía's minerale "
            "randtoon",
            "de combinatie van medium tannine en hoge zuur die tien tot "
            "vijftien jaar bewaarpotentieel geeft",
            "de Mencía-Pinot Noir-verwarring, opgelost via de minerale "
            "leisteenrand die Pinot Noir mist",
        ),
        "In Module 5 verschuif je van lichte naar medium body rode druiven, "
        "te beginnen in les 21 met Merlot — de druif die rondheid en "
        "toegankelijkheid het meest zichtbaar samenbrengt.",
    ),
}
