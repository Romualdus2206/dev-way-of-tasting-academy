"""Rosé Track V2 — FINAL LOCK precision pass data (lessen 1–22, build index).

Bron voor context: `content/pipeline/ROSE_PIPELINE_CONTENT.md`.
Identiteit: rosé als zelfstandige, precisiegedreven derde as tussen wit en
rood — extractieprecisie, kleursturing (kleur als stijlsignaal, nooit als
kwaliteitsmaat), aromatische finesse, textuurspanning, fenolische
subtiliteit als optionele tweede structuuras naast zuur, temperatuurvenster
per productiestap en per stijl, direct press versus saignée, reductieve
precisie tijdens de vergisting, blindproefmarkers per stijl en druif — géén
red-wine tannineframework, géén Wine Foundation- of White Track-rehash.

Build index 1–22 dekt LES 1 t/m LES 22 in bestandsvolgorde (Wat is rosé? t/m
Cinsault), NIET de LES-nummers uit de koppen zelf.
"""

from __future__ import annotations


def _qf(validation: str, leerankers: tuple[str, str, str], bridge: str) -> str:
    """Bouw een quiz-feedback tekst op uit validatie, drie leerankers en een brug."""
    bullets = "\n".join(f"- {anker}" for anker in leerankers)
    return f"{validation}\n\nDrie leerankers:\n{bullets}\n\n{bridge}"


QUIZ_FEEDBACK_OVERRIDES: dict[int, str] = {
    1: _qf(
        "Scherp begin. Je doorziet nu dat rosé geen tussenvorm is die "
        "toevallig ontstaat, maar een derde, zelfstandige as met een vooraf "
        "vastgelegd doelprofiel.",
        (
            "extractieprecisie als kernvaardigheid: binnen minuten tot enkele "
            "uren het beoogde kleur- en aromaprofiel raken, niet weken zoals "
            "bij rood",
            "kleur als eerste stijlindicator, niet als kwaliteitsmaat — "
            "kleurdiepte is een stijlkeuze, geen hiërarchie",
            "het vooraf vastgelegde doelprofiel waarnaar de hele vinificatie "
            "wordt teruggerekend, in plaats van een open, evoluerend "
            "extractietraject zoals bij rood",
        ),
        "In les 2 volg je dat doelprofiel de kelder in: hoe schilcontactduur "
        "via direct press en saignée dat profiel technisch waarmaakt.",
    ),
    2: _qf(
        "Precies gezien. Je begrijpt nu dat schilcontactduur geen "
        "toevalligheid is, maar het eerste bewuste sturingspunt van elke "
        "rosé, nog vóór er over gisttemperatuur wordt nagedacht.",
        (
            "direct press en saignée als de twee dominante, naast elkaar "
            "bestaande productiepaden, elk met een eigen extractielogica",
            "schilcontactduur als bewuste intentie die kleurdiepte en "
            "structuur samen stuurt, niet als toevallig neveneffect",
            "assemblage van rode en witte wijn, wettelijk vrijwel overal "
            "verboden voor stille rosé binnen de EU, behalve voor Champagne",
        ),
        "In les 3 gebruik je dat productie-inzicht om te verklaren waarom "
        "rosé, ondanks zijn positie tussen wit en rood, een volledig eigen "
        "categorie-identiteit heeft.",
    ),
    3: _qf(
        "Raak geanalyseerd. Je ziet nu dat rosé's identiteit steunt op een "
        "combinatie van aromatische finesse en textuurspanning die geen "
        "andere categorie op dezelfde schaal biedt.",
        (
            "aromatische finesse gecombineerd met textuurspanning als "
            "unieke identiteitscombinatie, in plaats van tannine (rood) of "
            "zuur (wit) als enkelvoudige as",
            "het smalle extractiepad tussen te weinig (een leeg, "
            "eendimensionaal profiel) en te veel (groene of tanninerijke "
            "tonen)",
            "de smalle temperatuurband die scherper is dan bij de meeste "
            "rode wijn en vergelijkbaar kritisch als bij verfijnde witte "
            "stijlen",
        ),
        "In les 4 zet je die unieke identiteit in historisch perspectief: "
        "hoe kort schilcontact van oude wijnbereidingstechniek tot moderne "
        "precisiecategorie evolueerde.",
    ),
    4: _qf(
        "Degelijk doorgrond. Je kunt het vooroordeel 'rosé is geen serieuze "
        "wijn' nu historisch én technisch ontkrachten, zonder terug te "
        "vallen op prijs als argument.",
        (
            "kort schilcontact als een van de oudste vormen van "
            "wijnbereiding, ouder dan langdurige, gecontroleerde "
            "roodwijnmaceratie",
            "de provençaalse stijlcodering die zo dominant werd dat ze "
            "wereldwijd als synoniem voor 'rosé' geldt",
            "de imago-evolutie van goedkope 'poolside wine' naar "
            "terroir-gedreven, bewaarbare rosé, parallel aan technische "
            "vooruitgang in temperatuurcontrole en perstechniek",
        ),
        "In les 5 zet je die geschiedenis om in een concreet kader: het "
        "volledige stijlspectrum van rosé, van bleek Provence tot "
        "tanninedragende Tavel.",
    ),
    5: _qf(
        "Overtuigend samengevat. Je overziet nu het volledige stijlspectrum "
        "van rosé als één samenhangend kader in plaats van losse, "
        "onsamenhangende regio's.",
        (
            "het stijlspectrum van bijna-wit tot bijna-rood, breder dan bij "
            "vrijwel elke andere wijncategorie",
            "tanninedragende stijlen zoals Tavel en Bandol tegenover de "
            "bleke, minimale structuur van Provence",
            "kleurdiepte en tannine-aanwezigheid samen gelezen als "
            "betrouwbare blindproefmarker, veel sterker dan kleur alleen",
        ),
        "Module 2 begint in les 6 bij de eerste productiemethode die dit "
        "spectrum technisch mogelijk maakt: direct press.",
    ),
    6: _qf(
        "Nauwkeurig doorzien. Je begrijpt nu waarom direct press de meest "
        "precisiegedreven methode binnen rosé is: er is geen aparte "
        "weekfase om fouten te corrigeren.",
        (
            "perscyclusprecisie (druk, snelheid, temperatuur) die bij deze "
            "methode zwaarder doorweegt dan bij elke andere roséproductie",
            "het strikte temperatuurvenster net boven het vriespunt van het "
            "sap dat oxidatie en ongewenste extra extractie voorkomt",
            "de drupvrijloopfractie als bleekste, aromatisch zuiverste "
            "basis, waaruit topcuvées vaak vrijwel uitsluitend bestaan",
        ),
        "In les 7 leg je dat precisiewerk naast een tweede productiepad met "
        "een heel andere extractielogica: saignée.",
    ),
    7: _qf(
        "Gedegen uitgewerkt. Je kunt nu onderscheid maken tussen saignée als "
        "louter bijproduct van roodwijnconcentratie en saignée als "
        "intentioneel geproduceerd volume.",
        (
            "dubbeldoelvinificatie: het aftappen concentreert de "
            "achterblijvende rode most én levert tegelijk rosé op",
            "extractie-intensiteit die door het langere schilcontact hoger "
            "ligt dan bij directe pers",
            "kleurdiepteopbouw en tanninegewicht die saignée bij uitstek "
            "geschikt maken voor structuurrijkere stijlen zoals Tavel",
        ),
        "In les 8 zet je beide productiepaden af tegen een derde, "
        "losstaande factor die stijl bepaalt: bewuste kleursturing.",
    ),
    8: _qf(
        "Helder doordacht. Je doorziet nu dat kleursturing een technisch "
        "vak is, geen esthetische bijzaak, en dat kleurdiepte een "
        "stijlsignaal blijft, geen kwaliteitsmeter.",
        (
            "kleurintensiteit die objectief gemeten en gestuurd wordt naar "
            "een reproduceerbaar doelprofiel, niet op het oog",
            "marketinggedreven paleur als onterechte aanname dat blekere "
            "rosé automatisch beter of verfijnder is",
            "beschermende vinificatie die kleurstabiliteit en -zuiverheid "
            "bewaart, een kwaliteitsfactor die losstaat van kleurdiepte "
            "zelf",
        ),
        "In les 9 verschuift de focus van kleursturing naar de vergisting "
        "zelf: hoe fermentatiekeuzes het aromaprofiel van rosé bepalen.",
    ),
    9: _qf(
        "Zuiver gezien. Je begrijpt nu waarom reductieve precisie tijdens de "
        "vergisting bepalend is voor de aromatische finesse van rosé.",
        (
            "reductieve precisie met minimaal zuurstofcontact als standaard "
            "bij het merendeel van de moderne, aromatisch gedreven "
            "roséstijlen",
            "temperatuurgestuurde gisting bij lage temperaturen die "
            "vluchtige, primaire aromastoffen behoudt",
            "textuurontwikkeling-via-lees en bâtonnage-bij-rosé als bewuste "
            "keuze voor mondvulling, ten koste van een deel van de "
            "primaire fruitscherpte",
        ),
        "In les 10 breng je productie en stijl samen: het verschil tussen "
        "de frisse en de gastronomische stijl van rosé.",
    ),
    10: _qf(
        "Trefzeker onderscheiden. Je kunt nu voorkomen dat een "
        "gastronomische rosé, zonder de juiste context, ten onrechte als "
        "'minder rosé' wordt ervaren.",
        (
            "de frisse stijl die op textuurspanning en aromatische "
            "zuiverheid draait, ontworpen voor onmiddellijke consumptie",
            "de gastronomische stijl die bewust meer body en tanninegewicht "
            "opbouwt voor bredere gastronomische inzetbaarheid",
            "servicetemperatuurdifferentiatie en bewaarpotentieelverschil "
            "als twee concrete, meetbare gevolgen van die stijlkeuze",
        ),
        "Met dit productiefundament stap je in les 11 de proefzaal in: hoe "
        "je rosé systematisch proeft met een eigen leesstrategie.",
    ),
    11: _qf(
        "Strak opgebouwd. Je beheerst nu een proefprotocol dat rosé op "
        "eigen merites leest, in plaats van tannine te zoeken zoals bij "
        "rood of een fruitschaal zoals bij wit.",
        (
            "tint en intensiteit als twee aparte visuele variabelen die "
            "samen de productiemethode verraden, nog vóór je iets geroken "
            "hebt",
            "primaire aroma's die door hun vluchtigheid het best direct na "
            "het inschenken worden beoordeeld",
            "de mondvolgorde zuur, optionele fenolische subtiliteit, "
            "alcohol, body — waarbij die fenolische subtiliteit een "
            "uitzondering blijft, geen vaste as",
        ),
        "In les 12 pas je dat protocol concreet toe op het meest "
        "diagnostische signaal in het glas: kleur.",
    ),
    12: _qf(
        "Consequent gelezen. Je gebruikt kleur nu als eerste hypothese over "
        "productiemethode, nooit meer als eindoordeel over kwaliteit.",
        (
            "tint en intensiteit als twee losse variabelen die correleren "
            "met direct press versus saignée of langere maceratie",
            "bewuste ontkleuring (koolstoffiltratie, bentoniet) die "
            "extreme bleekheid kan opleveren los van de natuurlijke "
            "extractie",
            "een oranje verkleuring aan de rand die bij rosé, door beperkte "
            "antocyanen, sneller op oxidatie wijst dan bij rood",
        ),
        "In les 13 zet je die kleurhypothese om in een aromahypothese: de "
        "vier primaire aromafamilies van rosé.",
    ),
    13: _qf(
        "Fijn herkend. Je beoordeelt aroma nu via de onderlinge verhouding "
        "van vier families, in plaats van via losse, geïsoleerde "
        "descriptors.",
        (
            "de vier primaire aromafamilies: rood fruit, citrus, bloemen en "
            "kruidigheid",
            "de onderlinge verhouding tussen die families als sterker "
            "diagnostisch signaal dan één losse geur",
            "de afwezigheid van secundaire of tertiaire tonen als "
            "diagnostisch signaal op zichzelf, geen tekortkoming",
        ),
        "In les 14 voeg je de laatste zintuiglijke laag toe vóór de "
        "mini-toets: structuur, met zuur als hoofdas.",
    ),
    14: _qf(
        "Messcherp vastgesteld. Je herkent fenolische subtiliteit nu als "
        "optioneel signaal, en verwart die nooit meer met tannine in de "
        "rode-wijnzin.",
        (
            "zuur als dominante structuuras bij vrijwel elke rosé, met "
            "fenolische subtiliteit als variabele, optionele tweede laag",
            "klimaatgedreven alcoholopbouw en restsuiker als twee aparte "
            "variabelen naast zuur en textuur",
            "afdronklengte als laatste stap die eenvoudige van "
            "gastronomisch geambieerde stijlen onderscheidt",
        ),
        "In les 15 breng je kleur, aroma en structuur samen in de eerste "
        "grote integratietoets van deze track.",
    ),
    15: _qf(
        "Uitstekend geïntegreerd. Je hebt kleur, aroma en structuur nu "
        "succesvol samengebracht in één blind protocol, met een "
        "stijlhypothese als sluitstuk.",
        (
            "kleur als productiehypothese, aroma als verhouding tussen vier "
            "families, structuur met zuur als hoofdas",
            "het blinde protocol dat kleur, aroma en structuur in vaste "
            "volgorde doorloopt vóór je aan een specifieke regio of druif "
            "denkt",
            "het documenteren van je stijlhypothese vóór de onthulling als "
            "enige objectieve manier om je eigen protocol te toetsen",
        ),
        "In les 16 zet je dit fundament om in stijlherkenning, te beginnen "
        "met de wereldwijde referentie: Provence.",
    ),
    16: _qf(
        "Raak geplaatst. Je herkent Provence nu op minimale extractie en "
        "een zuiver zuurgedreven textuur, niet enkel op een bleke kleur.",
        (
            "mistral en kalksteen-/schisterbodems die hitte overdag "
            "combineren met zuurbehoud 's nachts",
            "minimale extractie via direct press als directe verklaring "
            "voor de extreem bleke, zalmkleurige kleur",
            "het Provence-Tavel-onderscheid dat je test op fenolische "
            "textuur in de mond, niet op kleurdiepte alleen",
        ),
        "In les 17 ontmoet je die tegenpool rechtstreeks: Tavel, de enige "
        "Franse AOC die uitsluitend rosé produceert.",
    ),
    17: _qf(
        "Scherp onderscheiden. Je test nu bewust op tastbare fenolische "
        "grip in plaats van op kleur alleen om Tavel van Provence te "
        "scheiden.",
        (
            "galets roulés die overdag warmte opslaan en de druiven tot "
            "volledige fenolische rijpheid brengen",
            "intensievere extractie, vaak in combinatie met saignée, die "
            "Tavel dichter bij de wijnmaakfilosofie van lichte rode wijn "
            "brengt",
            "tastbare fenolische grip als belangrijkste blindproefmarker "
            "tegenover de gladde, zuivere textuur van Provence",
        ),
        "In les 18 verlaat je Frankrijk voor een derde Grenache-"
        "gedomineerde traditie: Spaanse rosado.",
    ),
    18: _qf(
        "Degelijk vastgesteld. Je herkent nu waarom kleur bij Spaanse "
        "rosado een minder betrouwbare stijlindicator is dan bij Provence "
        "of Tavel.",
        (
            "het continentale klimaat van Navarra en Rioja dat rijp fruit "
            "combineert met behoud van voldoende zuurgraad",
            "de verschuiving van traditioneel dieper gekleurde rosado naar "
            "een modernere, internationaal geïnspireerde, blekere stijl",
            "ronde, rijpe zoetheid en eventuele houttonen als signaal om "
            "rosado van Italiaanse rosato te onderscheiden, niet kleur "
            "alleen",
        ),
        "In les 19 zet je die Spaanse rosado af tegen de nog grotere "
        "interne diversiteit van Italiaanse rosato.",
    ),
    19: _qf(
        "Genuanceerd gedifferentieerd. Je behandelt Italiaanse rosato nu "
        "nooit meer als één stijl, maar als een categorie met een extreme "
        "interne bandbreedte.",
        (
            "de bleke, zuivere Chiaretto van het Gardameer tegenover de "
            "diep kersrode, structuurrijkere Cerasuolo d'Abruzzo",
            "de kersachtige zuurlijn van Cerasuolo als onderscheidend "
            "signaal tegenover de rondere Spaanse rosado",
            "Negroamaro-rosato uit Puglia als derde, donkerder en aardser "
            "profiel binnen dezelfde Italiaanse categorie",
        ),
        "In les 20 verlaat je Europa voor de warmere klimaten van de "
        "Nieuwe Wereld en de invloed daarvan op stijl.",
    ),
    20: _qf(
        "Precies doorgrond. Je proeft nu bewust door de kleur heen op "
        "fruitrijpheid, in plaats van tint als eindsignaal te gebruiken.",
        (
            "warmte-opbouw in Californië, Australië, Zuid-Afrika en Chili "
            "die rijper fruit en vaak hoger alcohol oplevert",
            "de historische off-dry lijn (White Zinfandel-erfenis) "
            "tegenover de moderne, droge Provence-imitatie",
            "fruitrijpheid en de aan- of afwezigheid van garrigue-"
            "kruidigheid als betrouwbaarder signaal dan tint alleen",
        ),
        "In les 21 verleg je de focus van regio naar druif, te beginnen "
        "met de ruggengraat van vrijwel elke klassieke Europese rosé: "
        "Grenache.",
    ),
    21: _qf(
        "Knap vastgesteld. Je begrijpt nu waarom Grenache's lage "
        "antocyaanconcentratie de kleur mild en beheersbaar houdt, zelfs "
        "bij substantieel schilcontact.",
        (
            "lage antocyaanconcentratie die de kleur ook bij langer "
            "schilcontact mild en beheersbaar houdt, in plaats van meteen "
            "diep en donker",
            "snelle suikeraccumulatie en laag natuurlijk zuur die extreem "
            "precieze oogsttiming vereisen",
            "de rijpere, warmere fruitonderlaag van Grenache tegenover de "
            "lichtere, bloemiger bovenlaag van Cinsault in een blend",
        ),
        "In les 22 proef je die tegenhanger apart: Cinsault, de "
        "paradoxaal dunschillige druif die de opfrissende bovenlaag "
        "levert.",
    ),
    22: _qf(
        "Doortastend doorzien. Je herkent nu waarom Cinsault, ondanks zijn "
        "warme herkomst, een paradoxaal licht en bloemig profiel "
        "oplevert.",
        (
            "de dunschillige warmteparadox: warmteminnend van herkomst, "
            "maar van nature laag in tannine en licht van kleur",
            "oude-stok Cinsault uit Zuid-Afrika en de Bekaa-vallei die "
            "aandacht krijgt als zelfstandige, hoogwaardige rosédruif",
            "de intensiteit van de bloemige noot en het lichtere "
            "alcoholgevoel als test voor het aandeel Cinsault in een "
            "Grenache-blend",
        ),
        "In les 23 vervolg je Module 5 met een derde blendpartner die "
        "structuur en kruidigheid toevoegt: Syrah.",
    ),
}
