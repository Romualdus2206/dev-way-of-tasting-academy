"""Rosé Track V2 — FINAL LOCK precision pass (module kernbegrippen + Les 23-43 quiz-feedback).

Bron: `content/pipeline/ROSE_PIPELINE_CONTENT.md` (Module 1 t/m 9, Les 23 t/m 43).

Sequentiële les-volgorde (bestandsvolgorde, Les 22 Cinsault was de vorige les):
23 Syrah -> 24 Mourvèdre -> 25 Tempranillo rosado -> 26 Licht en fris ->
27 Fruitig en sappig -> 28 Kruidig en droog -> 29 Structuur en body ->
30 Rosé als maaltijdwijn -> 31 Serveertemperatuur -> 32 Glaswerk -> 33 Bewaren ->
34 Jong drinken vs rijping -> 35 Rosé & salades -> 36 Rosé & vis ->
37 Rosé & barbecue -> 38 Rosé & Aziatische keuken -> 39 Rosé & charcuterie ->
40 Rosé & fine dining -> 41 Provence vs Tavel blind -> 42 Rosé vs lichte rode wijn
blind -> 43 Theorie- en praktijkexamen (bridge naar certificering).

Let op: de bronmarkdown labelt de laatste drie lessen van Module 9 abusievelijk als
"LES 38/39/40" (dubbel met Module 8) in plaats van 41/42/43. Deze module gebruikt
overal de correcte, doorlopende lesnummering 41-43 zoals hierboven vastgelegd.

Elite polish-pass: module-kernbegrippen (alle 9 modules) ontdaan van generieke
Rosé Foundation-termen (rosé, frisheid, aroma, body, stijl, balans, kleur) en
vervangen door specialist Rosé DB-termen die al elders in de Gold Master
voorkomen, plus quiz-feedback-overrides voor Les 23-43 volgens het validatie /
Drie leerankers / bridge-format. De roséfinesse (extractieprecisie,
kleursturing, textuurspanning) blijft leidend — geen rode-wijn-framing.
"""

from __future__ import annotations


def _qf(validation: str, leerankers: tuple[str, str, str], bridge: str) -> str:
    bullets = "\n".join(f"- {item}" for item in leerankers)
    return f"{validation}\n\nDrie leerankers:\n\n{bullets}\n\n{bridge}"


MODULE_KERNBEGRIPPEN: dict[int, list[str]] = {
    1: [
        "extractieprecisie",
        "kleuropbouwmechanisme",
        "schilcontactduur",
        "direct press",
        "saignée",
        "aromatische finesse",
        "textuurspanning",
        "categorie-autonomie",
        "gastronomische breedte",
        "temperatuurgevoeligheid",
    ],
    2: [
        "perscyclusprecisie",
        "drupvrijloopfractie",
        "saignée-extractie",
        "dubbeldoelvinificatie",
        "kleursturing",
        "beschermende vinificatie",
        "reductieve precisie",
        "temperatuurgestuurde gisting",
        "bâtonnage-bij-rosé",
        "oxidatiepreventie",
    ],
    3: [
        "roséproefprotocol",
        "tint-intensiteitscheiding",
        "primaire aromadominantie",
        "vier-aromafamilies-verhouding",
        "optionele fenolische grip",
        "zuur-als-hoofdas",
        "afdronklengte-als-stijlsignaal",
        "productiehypothese-vooraf",
        "blind-roséprotocol",
        "structuurverfijning",
    ],
    4: [
        "Provence",
        "Tavel",
        "rosado",
        "rosato",
        "Bandol",
        "garrigue-kruidigheid",
        "galets-roulés-warmteopslag",
        "Chiaretto-Gardameer",
        "White-Zinfandel-erfenis",
        "stijlpositionering",
    ],
    5: [
        "Grenache",
        "Cinsault",
        "Syrah",
        "Mourvèdre",
        "Tempranillo-rosado",
        "rotundone-peperspecerij",
        "lage antocyaanconcentratie",
        "Bandol-minimumaandeel",
        "vatgerijpte rosado fermentado en barrica",
        "blindproefmarker",
    ],
    6: [
        "geblokkeerde appelzuur-melkzuurgisting",
        "protectieve inertgastechniek",
        "onafhankelijke kleur-tannine-as",
        "ethylhexanoaat-roodfruitester",
        "Sutter Home-gistingsongeluk 1975",
        "garrigue-VOC-adsorptie",
        "Bandol-Mourvèdre-minimum 2014",
        "perswijn-vrijloopsapmenging Tavel",
        "fenolische subtiliteit",
        "moutgewicht-en-extractie-as",
    ],
    7: [
        "temperatuurvenster",
        "eiwitbindingskinetiek-rosé",
        "structuurgeleide glaskeuze",
        "witwijnglas-versus-Bourgondiëglas",
        "verre-à-rosé-ontwikkeling",
        "oxidatiegevoeligheid",
        "lichtschade-riboflavinereactie",
        "beperkte antocyaanpool",
        "Bandol-bewaarcapaciteit vijf-tot-tien-jaar",
        "fenolisch fundament als rijpingsbewijs",
    ],
    8: [
        "azijnzuur-versus-wijnzuur-asymmetrie",
        "chlorofyl-tanninebitterheid-valkuil",
        "ijzer-tannine-visreactie",
        "guaiacol-rooktoonresonantie",
        "suiker-tanninebitterheidsrisico",
        "TRPV1-capsaïcinereceptor",
        "zout-tannine-trigeminale-interactie",
        "Garrus-prestigeprecedent",
        "vatgisting-en-batonnage-rosé",
        "textuur-op-maat-techniek",
    ],
    9: [
        "hypothese-vóór-onthullingsprotocol",
        "kleur-aroma-zuur-lichaam-textuurketen",
        "tastgrip-als-scheidingscriterium",
        "persmoment-versus-fermentatieduur",
        "Tavel-afdronkgrip",
        "oeil-de-perdrix-kleurreferentie",
        "ontkoppelde kleur-tanninelogica",
        "structurele-categorieverwarring-in-de-praktijk",
        "examenintegratie-rosé",
        "certificering",
    ],
}


QUIZ_FEEDBACK_OVERRIDES: dict[int, str] = {
    23: _qf(
        "Goed — je herkent nu Syrah's rol als kleine, gerichte kruidentoevoeging in "
        "roséblends, niet als hoofddruif.",
        (
            "Een dikkere schil geeft, zelfs bij tien tot twintig procent aandeel, "
            "merkbaar meer kleurdiepte dan Grenache of Cinsault alleen.",
            "Rotundone geeft de karakteristieke zwarte-peper- en "
            "kruidnagelspecerij, herkenbaar zelfs bij kortstondig schilcontact.",
            "Het grootste verwarringsgevaar is Mourvèdre — proef het verschil "
            "tussen peperig-bloemig (Syrah) en aards-wild (Mourvèdre).",
        ),
        "Volgende les: Les 24 verschuift naar Mourvèdre, de structuurdruif die "
        "Syrah's frisse specerij vervangt door aardse diepgang en bewaarpotentieel.",
    ),
    24: _qf(
        "Goed — je begrijpt nu waarom Mourvèdre de structuurdruif bij uitstek is "
        "binnen serieuze roséblends.",
        (
            "Bandol eist wettelijk een Mourvèdre-minimumaandeel van rond de "
            "vijftig procent in de rosé, precies om body en bewaarpotentieel te "
            "garanderen.",
            "De late rijping en dikkere schil geven zelfs bij kort schilcontact "
            "meetbaar meer kleurdiepte en fenolische structuur.",
            "Bandol-rosé kan, anders dan de meeste rosé, enkele jaren positief "
            "evolueren dankzij die Mourvèdre-structuur.",
        ),
        "Volgende les: Les 25 sluit Module 5 af met Tempranillo rosado, waar "
        "houtaffiniteit in plaats van fenolische grip de gastronomische "
        "structuur bepaalt.",
    ),
    25: _qf(
        "Goed — je beheerst nu de belangrijkste druivenrassen achter rosé uit "
        "Module 5.",
        (
            "Tempranillo behoudt een steviger zuurniveau en directere "
            "roodfruitstructuur dan Garnacha, wat rosado gastronomischer maakt.",
            "Als enige van de twee heeft Tempranillo een sterke affiniteit met "
            "houtrijping (rosado fermentado en barrica), met een subtiele "
            "vanille- of roostertoon.",
            "In blends proef je Tempranillo als de scherpere, structurerende "
            "laag onder het rondere Garnacha-fruit.",
        ),
        "Volgende stap: Module 6 — Stijl & Gastronomie, te beginnen met hoe "
        "extreem kort schilcontact de bleke, protectieve stijl van Les 26 bepaalt.",
    ),
    26: _qf(
        "Goed — je begrijpt nu dat bleke, protectieve rosé een bewuste "
        "witwijn-vinificatietechniek is, geen toevallig bijproduct.",
        (
            "Twee tot zes uur schilcontact bepaalt tegelijk lage kleurdiepte én "
            "lage tanninextractie, omdat beide uit dezelfde schil komen.",
            "Geblokkeerde appelzuur-melkzuurgisting en een vroege oogst bewaren "
            "de strakke, rechte zuurstructuur van deze stijl.",
            "Protectieve, reductieve vinificatie (inert gas, koele gisting) "
            "behoudt subtiele esters in plaats van uitbundig fruit.",
        ),
        "Volgende les: Les 27 verschuift naar de fruitige, sappige stijl, waar "
        "net iets meer schilcontact en warmte een compleet ander esterprofiel "
        "opleveren.",
    ),
    27: _qf(
        "Sterk — je begrijpt nu waarom fruitige, sappige rosé wereldwijd de "
        "grootste commerciële categorie is.",
        (
            "Zes tot twaalf uur schilcontact in een warmer klimaat geeft rijper "
            "fruit en meer ethylhexanoaat- en ethylbutyraatesters.",
            "White Zinfandel ontstond in 1975 uit een gisting die per ongeluk "
            "stokte bij circa 2% restsuiker — een technisch mankement, geen "
            "ontwerpkeuze.",
            "Sommige Nieuwe Wereld blush-stijlen dragen bewust restsuiker; "
            "Spaanse en Australische Grenache-rosado blijft vaak volledig droog "
            "en haalt haar fruit uit rijpheid en esters.",
        ),
        "Volgende les: Les 28 behandelt de kruidige, drogere stijl, waar "
        "rotundone en garrigue-invloed voor een heel ander mechanisme zorgen.",
    ),
    28: _qf(
        "Goed — je begrijpt nu dat kruidigheid in rosé deels druifchemie en "
        "deels een aantoonbaar omgevingseffect is, geen vaag stijlkenmerk.",
        (
            "Rotundone uit Syrah neemt toe naarmate de druiventros minder "
            "zoninstraling krijgt — kruidigheid is deels een teeltkeuze.",
            "Garrigue-kruiden zoals tijm, rozemarijn en lavendel geven "
            "vluchtige aromatische verbindingen af die zich aan de druivenschil "
            "hechten.",
            "Bandol AOC eist sinds 2014 wettelijk minimaal 20% Mourvèdre voor "
            "rosé, wat een herkenbaar steviger karakter garandeert.",
        ),
        "Volgende les: Les 29 maakt structuur en body expliciet tot een eigen, "
        "onafhankelijk stuurbare as naast kleur en aromatiek.",
    ),
    29: _qf(
        "Sterk — je begrijpt nu dat body bij rosé het resultaat is van drie "
        "onafhankelijk stuurbare factoren, geen vast druifkenmerk.",
        (
            "Tavel is de enige Franse AOC die uitsluitend rosé mag produceren "
            "en mengt daarvoor bewust perswijn met vrijloopsap voor extra "
            "lichaam.",
            "Grenache draagt van nature meer suiker en dus meer alcoholgewicht "
            "bij dan de vroeger geoogste, koelere Provence-druiven.",
            "Lichte, medium en volle body koppelen direct aan aperitief-, "
            "vis-kip- en barbecuegerechten — body is het meest praktische "
            "serviceinstrument.",
        ),
        "Volgende les: Les 30 sluit Module 6 af door structuur, zuur en "
        "aromatiek samen te brengen tot één gastronomische stelling over rosé "
        "als maaltijdwijn.",
    ),
    30: _qf(
        "Uitstekend — je beheerst nu waarom rosé een van de meest veelzijdige "
        "maaltijdwijnen is die een sommelier ter beschikking heeft.",
        (
            "Bij rosé zijn kleur en tannine ontkoppelde variabelen — het "
            "persmoment bepaalt de kleur, terwijl de fermentatieduur op de "
            "schillen vrijwel nul blijft.",
            "Die ontkoppeling laat een rosé tegelijk hoog zuur én voldoende "
            "lichaam combineren, iets rode wijn zelden doet.",
            "Mediterrane, Aziatische, barbecue- en charcuteriepairing "
            "profiteren allemaal van diezelfde combinatie van zuur, fruit en "
            "lichaam.",
        ),
        "Volgende stap: Module 7 — Service, te beginnen met hoe "
        "serveertemperatuur het fenolisch fundament van elke roséstijl direct "
        "stuurt.",
    ),
    31: _qf(
        "Goed — je begrijpt nu dat serveertemperatuur bij rosé een "
        "structuurafhankelijke curve volgt, geen vaste regel.",
        (
            "Koude onderdrukt zoetheidsperceptie zonder de zuurperceptie "
            "evenredig te dempen — te koud maakt een rosé scherper en gesloten.",
            "Bleke stijl serveer je op 8–10°C, fruitige stijl op 9–11°C en "
            "gastronomische, fenolrijkere stijl zoals Tavel of Bandol op "
            "11–13°C.",
            "Rosé wordt in de praktijk bijna altijd standaard te koud "
            "geserveerd, ongeacht stijl — waardoor structuurrijke flessen "
            "onder hun niveau presteren.",
        ),
        "Volgende les: Les 32 bouwt hierop voort met glaswerk, dat dezelfde "
        "fenolische substantie via glasvorm in plaats van temperatuur stuurt.",
    ),
    32: _qf(
        "Sterk — je begrijpt nu dat glaskeuze bij rosé gestuurd moet worden "
        "door structuurniveau, niet door de kleur van het etiket.",
        (
            "Bleke rosé werkt het best in een kleiner witwijnglas, dat de "
            "subtiele esters concentreert in plaats van verdunt.",
            "Volle, structuurrijke rosé zoals Tavel of Bandol opent beter in "
            "een groter witwijnglas of Bourgondië-witwijnglas.",
            "Enkele roséhuizen ontwikkelden samen met glasfabrikanten een "
            "specifiek 'verre à rosé'-ontwerp, een teken dat de categorie "
            "serieus wordt genomen.",
        ),
        "Volgende les: Les 33 behandelt bewaren, waar hetzelfde fenolische "
        "fundament bepaalt hoe kwetsbaar een rosé is voor oxidatie en licht.",
    ),
    33: _qf(
        "Goed — je begrijpt nu waarom rosé qua opslag structureel de "
        "kwetsbaarste van de drie wijnkleuren is.",
        (
            "Een kleinere fenolische antioxidantbuffer dan bij rode wijn laat "
            "warmte en zuurstof sneller oxidatieve kleurverschuiving "
            "veroorzaken.",
            "Helder flesglas — vaak gekozen om de kleur te tonen — maakt rosé "
            "extra gevoelig voor lichtschade, omdat riboflavine onder licht met "
            "methionine reageert.",
            "Structuurrijkere stijlen zoals Bandol en Tavel hebben een grotere "
            "fenolische buffer en verouderen merkbaar langzamer dan de bleke of "
            "fruitige stijl.",
        ),
        "Volgende les: Les 34 sluit Module 7 af met jong drinken versus "
        "rijping, waar diezelfde fenolische buffer bepaalt welke rosé "
        "daadwerkelijk kan rijpen.",
    ),
    34: _qf(
        "Sterk — je beheerst nu de professionele serviceprincipes voor rosé "
        "uit Module 7.",
        (
            "Rosé's kleine antocyaanpool laat de kleur veel sneller "
            "verschuiven dan bij rode wijn — vaak binnen jaren in plaats van "
            "decennia.",
            "Bandol rosé kan dankzij het wettelijke Mourvèdre-minimum vijf tot "
            "tien jaar ontwikkelen, een uitzondering op de vroegdrink-regel.",
            "Structuur garandeert geen rijpingspotentieel automatisch — "
            "beoordeel elke fles op haar fenolisch fundament, niet op regio of "
            "prijs alleen.",
        ),
        "Volgende stap: Module 8 — Pairing & Gastronomie, te beginnen met het "
        "zuurmechanisme achter rosé en salades.",
    ),
    35: _qf(
        "Goed — je begrijpt nu waarom rosé bij salades twee aparte "
        "pairingvallen tegelijk vermijdt.",
        (
            "Geblokkeerde appelzuur-melkzuurgisting houdt rosé's zuurgraad "
            "hoog genoeg om tegen scherp azijnzuur uit vinaigrette op te wegen.",
            "Rosé's vrijwel afwezige tannine ontwijkt de "
            "chlorofyl-tanninebitterheid die lichte rode wijn bij bittere "
            "bladgroenten wél kan raken.",
            "Vet uit kaas of noten in een salade vraagt om een net iets "
            "vollere, medium body rosé om niet weggedrukt te worden.",
        ),
        "Volgende les: Les 36 past hetzelfde chemische denken toe op vis, waar "
        "rosé een heel ander mismatch-risico vermijdt.",
    ),
    36: _qf(
        "Sterk — je begrijpt nu het chemische mechanisme achter waarom rosé zo "
        "goed werkt bij vis.",
        (
            "IJzer en trimethylamine in visvet reageren met tannine tot een "
            "metaalachtige bijsmaak — een risico dat rosé's lage fenolgehalte "
            "vermijdt.",
            "Rosé biedt tegelijk net genoeg textuur voor vettere vis, iets wat "
            "zuiver aromatische witte wijn vaak mist.",
            "Magere, rauwe vis vraagt de bleke, hoogzure stijl; vettere vis "
            "zoals tonijn of zalm vraagt de vollere, medium body stijl.",
        ),
        "Volgende les: Les 37 verschuift naar barbecue, waar rosé opnieuw vier "
        "mechanismen tegelijk moet bedienen.",
    ),
    37: _qf(
        "Goed — je begrijpt nu waarom rosé, meer dan rode wijn, alle vier "
        "barbecuemechanismen tegelijk kan bedienen.",
        (
            "Rotundone- en garriguetonen in kruidige rosé resoneren "
            "aromatisch met guaiacol en rookverbindingen van gegrild vlees.",
            "Suiker versterkt tanninebitterheid — rosé's lage tanninegehalte "
            "omzeilt de klassieke mismatch met zoete barbecueglazuren.",
            "Rosé's hogere, geblokkeerde zuurgraad snijdt vet effectiever dan "
            "de gemiddelde rode wijn bij dezelfde temperatuur.",
        ),
        "Volgende les: Les 38 verschuift naar de Aziatische keuken, waar "
        "temperatuur en alcohol chilihitte fysiologisch beïnvloeden.",
    ),
    38: _qf(
        "Sterk — je begrijpt nu waarom rosé fysiologisch en chemisch veiliger "
        "is dan rode wijn bij pittige, umami-rijke gerechten.",
        (
            "Alcohol versterkt het TRPV1-receptorsignaal dat capsaïcine "
            "activeert — een koelere, laag-alcoholische rosé voelt daardoor "
            "milder aan bij chili.",
            "Rijpheid en lichte restsuiker in fruitige rosé dempen "
            "perceptueel de scherpte van capsaïcine.",
            "Rosé's lage tanninegehalte ontwijkt het umami-tannine-risico dat "
            "rode wijn bij sojasaus, vissaus en miso wél loopt.",
        ),
        "Volgende les: Les 39 behandelt charcuterie, waar zout in plaats van "
        "umami de tannine-interactie stuurt.",
    ),
    39: _qf(
        "Goed — je begrijpt nu waarom rosé technisch beter is toegerust voor "
        "charcuterie dan veel zwaardere rode wijn.",
        (
            "Zout interageert met de trigeminale waarneming van tannine en "
            "kan astringentie versterken — rosé's lage tannine omzeilt dat "
            "risico.",
            "Rosé's hoge, geblokkeerde zuurgraad verfrist het palet tussen "
            "happen door, net als mousserende wijn bij charcuterie.",
            "Haar fenolisch fundament geeft precies genoeg textuur om het "
            "gewicht van vet en zout te dragen, waar zuivere hoogzure witte "
            "wijn soms tekortschiet.",
        ),
        "Volgende les: Les 40 sluit Module 8 af met fine dining, waar "
        "vatgisting en batonnage premium rosé een compleet nieuw register "
        "geven.",
    ),
    40: _qf(
        "Uitstekend — je begrijpt nu hoe rosé op het hoogste gastronomische "
        "niveau kan meespelen.",
        (
            "Verlengd lees-contact met batonnage en, bij enkele "
            "prestigecuvées, gedeeltelijke vatgisting geven premium rosé "
            "extra textuur.",
            "Château d'Esclans' Garrus geldt als het duidelijkste precedent "
            "dat rosé qua textuur en concentratie met Grand Cru-stijlen kan "
            "concurreren.",
            "Eén fles kan zowel delicate schaaldieren als rijke, "
            "umami-gedreven gerechten bedienen — een dubbelregister dat puur "
            "wit of puur rood mist.",
        ),
        "Volgende stap: Module 9 — Blindproeven & Examen, te beginnen met "
        "Provence versus Tavel als de fundamentele roséverglijking.",
    ),
    41: _qf(
        "Sterk — je kunt nu Provence en Tavel systematisch van elkaar "
        "onderscheiden via de vaste deductieketen.",
        (
            "Kleur is de eerste aanwijzing: Provence toont een extreem bleke "
            "'oeil de perdrix'-tint, Tavel een dieper zalm-tot-oranjeroze.",
            "Het beslissende tastsignaal is niet kleur maar textuur: Tavel "
            "toont, dankzij perswijnmenging, een lichte maar duidelijk "
            "waarneembare grip die Provence vrijwel nooit heeft.",
            "Train het hypothese-vóór-onthullingsprotocol: kleur, aroma, "
            "zuur, lichaam en pas als laatste de tastbare grip, vóór het "
            "etiket.",
        ),
        "Volgende les: Les 42 verlegt de vergelijking naar rosé tegenover "
        "lichte rode wijn, waar kleur nog minder betrouwbaar blijkt.",
    ),
    42: _qf(
        "Goed — je begrijpt nu waarom kleurdiepte en tanninegehalte bij rosé "
        "structureel ontkoppelde variabelen zijn, in tegenstelling tot bij "
        "rode wijn.",
        (
            "Zelfs de lichtste rode wijn fermenteert volledig op de schillen; "
            "rosé wordt er vóór of zeer vroeg in de gisting van gescheiden.",
            "Zelfs een geconcentreerde, diepgekleurde rosé zoals Tavel behoudt "
            "structureel minder tannine dan de lichtste volledig gefermenteerde "
            "rode wijn.",
            "Tastgrip op de afdronk is het beslissende criterium, niet kleur, "
            "geur of lichaam — koude lichte rode wijn wordt daardoor vaak "
            "verward met krachtige rosé.",
        ),
        "Volgende les: Les 43 — het Theorie- en praktijkexamen — integreert "
        "alle drieënveertig lessen in één Master-toets.",
    ),
    43: _qf(
        "Gefeliciteerd — je beheerst nu het volledige fundament van rosé: "
        "theorie, productie, druivenkennis, stijl- en gastronomiediepte, "
        "professionele service, pairing en blindproeven.",
        (
            "Kleur en tannine zijn bij rosé onafhankelijk stuurbare "
            "variabelen — het persmoment bepaalt de kleur, terwijl fermentatie "
            "op de schillen per definitie vrijwel nul is.",
            "Drie stijlfamilies (bleek-protectief, fruitig-sappig, "
            "kruidig-structuurrijk) drijven elk op een ander "
            "productiemechanisme, niet op toeval.",
            "Tastgrip, niet kleur, blijft het betrouwbaarste bewijs bij elke "
            "blindanalyse van rosé.",
        ),
        "Volgende stap: met de certificering Way of Tasting Academy — Rosé "
        "Certified (Master Foundation) op zak kies je je vervolgtrack en bouw "
        "je voort op deze Master-basis.",
    ),
}
