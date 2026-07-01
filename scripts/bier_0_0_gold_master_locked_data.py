"""Bier 0.0 Track V2 — Gold Master LOCKED harmonization data (lessons 1-22)."""

from __future__ import annotations

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bfoodpairing\b", "food pairing"),
    (r"\bis gezond\b", "kan functioneel interessant zijn"),
    (r"  +✅", " ✅"),
    (r"✅ ", "✅"),
]

GISTING_TERMS: tuple[str, ...] = (
    "de-alcoholisatie",
    "restsuiker",
    "body",
    "mondgevoel",
    "bitterbalans",
    "aromatische intensiteit",
    "lengte",
    "drinkbaarheid",
    "alcohol-switching",
)


def _fp(beste, waarom, vermijd):
    return (
        f"### Beste pairing\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


def merge_locked_part2():
    from bier_0_0_gold_master_locked_data_part2 import apply_part2

    apply_part2()


THEORY_OVERRIDES: dict[int, str] = {
    1: (
        "Bier 0.0 is gebrouwen bier waarin alcohol bewust wordt beperkt of verwijderd, zodat mout-hop-giststructuur "
        "behouden blijft. In de EU-context geldt maximaal 0,05% als 0.0 — minimale sporen zijn daardoor technisch "
        "mogelijk, maar het product gedraagt zich in service als alcoholvrij.\n\n"
        "Professioneel adviseer je 0.0 wanneer gasten bierbeleving willen zonder alcohol: lunch, werk, rijden, sport "
        "of sociale context. De categorie groeit omdat assortimenten uitbreiden en kwaliteit steeds minder compromis "
        "hoeft te zijn — niet omdat 0.0 automatisch 'gezonder' is."
    ),
    2: (
        "De-alcoholisatie bepaalt direct restsuiker, mondgevoel en aromatische intensiteit. Drie routes domineren:\n\n"
        "- gestopte fermentatie: minder alcohol door vroeg stoppen, vaak meer restsuiker\n"
        "- vacuümdestillatie: alcohol verdampt onder verlaagde druk; aroma is kwetsbaar\n"
        "- reverse osmosis: filtratie scheidt alcohol; recombinatie bepaalt de finale balans\n\n"
        "In advies vertaal je methode naar proefsignaal: zoete instap wijst vaker op vroege stop, vlak aroma op "
        "warmte- of bewaarfout, frisse structuur op gecontroleerde filtratie."
    ),
    3: (
        "Bier 0.0 onderscheidt zich doordat het bierlogica behoudt — bitterbalans, koolzuur, mout en hop — zonder "
        "alcoholwarmte als structuurdrager. Daardoor past het beter bij food pairing en momentkeuze dan frisdrank of water.\n\n"
        "Functionele momenten zijn divers: sport en lunch vragen frisheid en drinkbaarheid; werk en rijcontext vragen "
        "discrete presentatie; sociale settings vragen herkenbare stijl zonder stigma. Het proefrisico zit in bodyverlies: "
        "zonder alcohol moet mondgevoel en lengte uit mout, restsuiker en koolzuur komen."
    ),
    4: (
        "Alcoholvrij bier is geen nieuw fenomeen, maar technologische evolutie maakte smaakbehoud schaalbaar. "
        "Waar vroeg 0.0 vooral compromis was, verwachten gasten nu premiumpositionering en stijlherkenning.\n\n"
        "Voor foodservice betekent dat: 0.0 hoort in het assortiment als volwaardige categorie met pils, IPA en donker — "
        "niet als enkelvoudige 'alcoholvrije optie'. Marktsegmentatie volgt moment: instap, craft, premium en functioneel."
    ),
    5: (
        "Het 0.0-spectrum wordt gelezen via vijf ankerstijlen:\n\n"
        "- pils: dorstlessend, subtiele bitterbalans, kwaliteitstest\n"
        "- IPA: hopgedreven, compenseert bodyverlies\n"
        "- witbier: kruidig-koolzuur, lunch en terras\n"
        "- blond: brug tussen licht en rond\n"
        "- donker: moutdiepte, umami en kouder weer\n\n"
        "Adviseren start bij moment en gerecht, niet bij 'alcoholvrij' als label. Stijlkeuze voorkomt generiek advies "
        "en opent upsell naar premium 0.0."
    ),
    6: (
        "Gestopte fermentatie beperkt alcohol door het gistingsproces vroegtijdig te stoppen, waardoor restsuiker "
        "hoger blijft en mondgevoel ronder kan aanvoelen. Dat is productie-efficiënt, maar vraagt bitterbalans om "
        "zoetheid drinkbaar te houden.\n\n"
        "Herken je in proef opvallende zoetheid met lichte body, dan is deze route een logische hypothese. Adviseer "
        "instapgasten bewust: fris en toegankelijk, maar controleer of bitterheid de afdronk droog genoeg houdt."
    ),
    7: (
        "Vacuümdestillatie verwijdert alcohol bij lagere temperatuur dan klassieke destillatie, maar hop- en esteraroma's "
        "blijven kwetsbaar. Kwaliteit zit in aroma-retentie na de stap — niet alleen in het eindalcoholpercentage.\n\n"
        "Bij aankoop en service: proef op aromatische intensiteit na opening. Vlakheid wijst vaker op proces- of "
        "bewaarfout dan op 'slechte stijl'. Premium 0.0 op deze route rechtvaardigt zich door hopprofiel dat intact blijft."
    ),
    8: (
        "Reverse osmosis scheidt alcohol via filtratie voordat smaakcomponenten opnieuw worden samengevoegd. "
        "Daardoor kan het profiel frisser en aromatischer uitvallen dan bij gestopte fermentatie, mits recombinatie "
        "zorgvuldig gebeurt.\n\n"
        "Adviseer deze route wanneer gasten voller aroma willen zonder zware zoetheid. Het proefsignaal is schone "
        "frisheid met gecontroleerde restsuiker — niet waterige dunheid."
    ),
    9: (
        "Bij 0.0 is aromatische intensiteit vaak het eerste kwaliteitsverlies: alcohol droeg mede tot geurimpressie bij. "
        "Productie, licht, warmte en taprotatie versterken of vernietigen aroma na de-alcoholisatie.\n\n"
        "In service controleer je versheid en temperatuur vóór je stijl uitlegt. Een vlak bier met intacte bitterbalans "
        "wijst op aroma-retentieprobleem, niet op 'te weinig hop' alleen."
    ),
    10: (
        "Zonder alcoholwarmte moet bitterbalans uit hop, mout en koolzuur komen; restsuiker mag rondheid geven maar "
        "niet plakkerig worden. Lengte en drinkbaarheid bepalen of een tweede glas logisch is.\n\n"
        "Professioneel stuur je op drie assen: zoetheid versus bitterheid, mondgevoel versus frisheid, en afdronk "
        "versus uitputting. Dat is de productielogica die elke latere stijlmodule ondersteunt."
    ),
    11: (
        "Proef bier 0.0 in vaste volgorde: visueel (kleur, helderheid, schuim), aroma (mout, hop, fruit, kruiden), "
        "smaak (mondgevoel, restsuiker, bitterbalans, lengte). Bij 0.0 weegt mondgevoel zwaarder omdat alcoholwarmte ontbreekt.\n\n"
        "Objectieve proefstructuur voorkomt merkbias en maakt alcohol-switching adviseerbaar: je beschrijft wat het glas "
        "doet, niet wat het etiket belooft."
    ),
    12: (
        "Body is gewicht en textuur op het palet — niet alcoholwarmte. Bij 0.0 wordt body opgebouwd via restsuiker, "
        "eiwitten, koolzuur en moutextract. Dun mondgevoel is het meest voorkomende kwaliteitsdefect.\n\n"
        "In advies koppel je body aan moment: dorstlessend vraagt frisheid met voldoende structuur; gastronomisch "
        "vragen volmondigheid zonder zoete vermoeidheid."
    ),
    13: (
        "Restsuiker bepaalt zoetheidsperceptie; koolzuur kan die tijdelijk maskeren. Noteer altijd of zoetheid rond, "
        "plakkerig of droog eindigt — dat onderscheidt productiemethode van serveerfout.\n\n"
        "Voor pairing: restzoetheid vangt spice en umami; te veel vermoeit zonder alcoholbuffer. Adviseer drogere stijlen "
        "bij caloriebewuste gasten, niet generiek 'minder suiker' zonder proef."
    ),
    14: (
        "Bitterbalans compenseert bodyverlies en houdt 0.0 drinkbaar. Hopbitterheid moet scherp maar niet uitdrogend zijn; "
        "lengte bepaalt of de afdronk uitnodigt tot een volgende slok.\n\n"
        "Bij twijfel tussen twee 0.0'en: vergelijk bittere afdronk na tien seconden. Dat is het signaal dat gasten het "
        "meest bewust waarnemen in foodservice."
    ),
    15: (
        "Deze mini-toets integreert productie, proefstructuur en bitterbalans. Blind proeven dwingt objectieve parameters "
        "en sluit de Explorer-fase af: je leest 0.0 als smaaksysteem, niet als afwezigheid van alcohol.\n\n"
        "Vanaf module 4 vertaal je deze parameters naar stijl, pairing en premiumpositionering."
    ),
}

FOOD_PAIRING: dict[int, str] = {
    1: _fp(
        "Gezouten pretzels, lichte borrelhapjes en milde kaas.",
        "Koolzuur lift zout; lichte bitterbalans snijdt door vet; minimale restzoetheid voorkomt dat zout het bier uitdroogt.",
        "Zoete desserts zonder zuurcomponent — instap-0.0 verliest spanning.",
    ),
    2: _fp(
        "Technische proef met neutrale crackers en zeezout.",
        "Zout kalibreert bitterheid en restsuiker tussen samples; neutrale textuur toont productiemethode zonder gerechtmaskering.",
        "Proeven alleen op etiket zonder pairingcontext — bias vervuilt methode-inschatting.",
    ),
    3: _fp(
        "Lunchsalade met licht vinaigrette en gegrilde kip.",
        "Frisheid en bitterbalans snijden door vet; koolzuur reset zout; alcohol-switching blijft gastronomisch logisch.",
        "Zware stoof zonder umami-brug — lichte 0.0 verliest structuur.",
    ),
    4: _fp(
        "Ambachtelijk brood, oude kaas licht en gezouten boter.",
        "Geroosterde tonen echoën mout; vet vraagt bitter-koolzuurspanning; umami vraagt body of hopstructuur.",
        "Ultra-lichte salade zonder zout — pairing levert weinig proefinformatie.",
    ),
    5: _fp(
        "Vijf mini-hapjes per stijl: pils met zout, wit met kruidig, IPA met pittig.",
        "Elke stijl test andere parameter: bitter-vet, kruid-koolzuur, hop-spice; stijlkeuze wordt adviseerbaar per moment.",
        "Eén generiek 0.0 bij alle hapjes — geen stijlcalibratie.",
    ),
    6: _fp(
        "Jonge Goudse kaas en lichte appelstroop.",
        "Restsuiker harmoniseert met milde zoetheid; koolzuur snijdt door vet; bitterbalans houdt het geheel drinkbaar.",
        "Zoet dessert bij opvallend zoete 0.0 — dubbele zoetheid zonder spanning.",
    ),
    7: _fp(
        "Gegrilde groente en lichte hummus.",
        "Aromatische intensiteit uit hop/mout ondersteunt gegrilde tonen; zuur in gerecht lift bieraroma; vet vraagt bittere afdronk.",
        "Vlak 0.0 bij umami-gerecht — aroma-retentieprobleem wordt zichtbaar.",
    ),
    8: _fp(
        "Ceviche en citrusmarinade.",
        "Frisse structuur echoët zuur in gerecht; koolzuur versterkt citrus; lichte restsuiker rondt zout af.",
        "Zware roomsaus zonder zuur — filtratie-frisheid botst.",
    ),
    9: _fp(
        "Vers gesneden kruidenboter op brood.",
        "Aromatische intensiteit in bier moet boteraroma dragen; zout activeert geur; mondgevoel toont bewaarkwaliteit.",
        "Lang openstaand 0.0 — oxidatie vernietigt pairingbrug.",
    ),
    10: _fp(
        "Pittige noedels en zoetzure glazuur licht.",
        "Restzoetheid vangt spice; bitterbalans voorkomt plakkerigheid; koolzuur lift vet uit noedels.",
        "Ultra-droge pils bij zeer zoet gerecht — bitterheid zonder compensatie.",
    ),
    11: _fp(
        "Blindproef met gezouten cracker.",
        "Zout kalibreert bitter en zoet tussen samples; neutrale textuur isoleert proefstructuur.",
        "Proeven met zichtbaar etiket — objectiviteit faalt.",
    ),
    12: _fp(
        "Romige soep en lichte stoof.",
        "Vol mondgevoel in bier balanceert textuur in gerecht; bitterbalans snijdt door vet; lengte houdt pairing drinkbaar.",
        "Waterig 0.0 bij romig gerecht — bodydefect wordt direct zichtbaar.",
    ),
    13: _fp(
        "Fruitige salade met honing-dressing licht.",
        "Restsuiker mag harmonie geven maar moet door bitterbalans gedragen worden; zuur in fruit balanceert zoetheid.",
        "Zoet bier bij zoet dressing zonder bittere afdronk.",
    ),
    14: _fp(
        "IPA-achtige hopbitter bij spicy wings.",
        "Bitterheid temt capsaïcine; koolzuur reset vet; aromatische intensiteit verlengt afdronk.",
        "Te zoet 0.0 bij spice — geen bittere spanning.",
    ),
    15: _fp(
        "Twee blind geproefde stijlen bij neutrale cracker.",
        "Integratie van productie- en proefparameters: mondgevoel, restsuiker, bitterbalans bepalen stijlhypothese.",
        "Blind zonder notatiestructuur — conclusies blijven willekeurig.",
    ),
}

PRO_INSIGHTS: dict[int, str] = {
    1: (
        "Start alcohol-switch-gesprekken met moment, niet met percentage: 'Wilt u fris en herkenbaar bier zonder alcohol?' "
        "Dat verlaagt stigma en opent stijlkeuze sneller dan technische uitleg."
    ),
    2: (
        "Bij zoete 0.0 op de kaart: noem productielogica in één zin ('rond door vroege fermentatiestop'). Gasten kopen "
        "transparantie sneller dan 'speciaal recept' zonder proefanker."
    ),
    3: (
        "Sport- en lunchmoment: positioneer 0.0 als sociaal en functioneel, niet als hersteldrank. Koppel frisheid aan "
        "gerecht of terras — dat voelt premium en vermijdt claimtaal."
    ),
    4: (
        "Plaats 0.0 zichtbaar naast pils en IPA, niet onderaan. Marktsegmentatie op de kaart traint team en gast in "
        "stijl denken vóór merk denken."
    ),
    5: (
        "Vraag bij twijfel: 'Licht en dorstlessend, of voller en gastronomisch?' Die vraag verdeelt pils/wit versus blond/donker "
        "zonder vijftien merken te tonen."
    ),
    6: (
        "Instap-0.0 verkoopt op vertrouwen: serveer koud, schoon glas, korte uitleg over frisheid. Eerste slok bepaalt "
        "herbestelling meer dan merknaam."
    ),
    7: (
        "Vermijd 'alle 0.0 smaakt hetzelfde' — gebruik aroma als differentiator. Eén zin over hop of mout opent upsell "
        "naar premium filtratie-route."
    ),
    8: (
        "Craft-bewuste gasten: pitch filtratie-route als aromatische keuze. Koppel aan licht gerecht met zuur — dat voelt "
        "bewust en niet defensief alcoholvrij."
    ),
    9: (
        "Taprotatie en lichtbescherming zijn upsell-beschermers: vlak 0.0 doodt premiumprijs sneller dan slechte reclame."
    ),
    10: (
        "Bij klacht 'te zoet' of 'te waterig': corrigeer op bitterbalans en mondgevoel, niet op merkwissel zonder proef."
    ),
    11: (
        "Train team op vaste proefvolgorde in shifts van twee minuten. Snelle structuur maakt alcohol-switching consistent "
        "tussen bediening en bar."
    ),
    12: (
        "Body is je eerste upsell-argument: 'Wilt u iets voller op het palet?' werkt beter dan 'duurder merk' zonder proef."
    ),
    13: (
        "Leg restsuiker uit als pairingparameter, niet als schuldgevoel. Professionele taal voorkomt defensieve reacties "
        "bij caloriebewuste gasten."
    ),
    14: (
        "Bitterklachten bij 0.0: check temperatuur en stijl vóór je suiker adviseert. Te koud maskeert; verkeerde stijl "
        "maskeert geen productiefout."
    ),
    15: (
        "Gebruik mini-toetsresultaten in teamoverleg: één gedeelde parameter (bijv. mondgevoel) per week verhoogt "
        "assortimentsdiscipline sneller dan losse proeverijen."
    ),
}

GOLD_KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["0.0-regelgeving", "de-alcoholisatie", "fermentatie", "alcohol-switching", "proefstructuur"],
    2: ["gestopte fermentatie", "vacuümdestillatie", "reverse osmosis", "aroma-retentie", "restsuiker"],
    3: ["smaakstructuur", "mondgevoel", "bitterbalans", "functioneel moment", "drinkbaarheid"],
    4: ["technologische evolutie", "gastverwachting", "marktsegmentatie", "premiumpositionering", "kwaliteitsnorm"],
    5: ["stijlspectrum", "momentkeuze", "pils", "IPA", "stijladvies"],
    6: ["gestopte fermentatie", "restsuiker", "mondgevoel", "zoetheidsprofiel", "instapsegment"],
    7: ["vacuümdestillatie", "aroma-retentie", "hopkwetsbaarheid", "temperatuurcontrole", "kwaliteitscontrole"],
    8: ["reverse osmosis", "filtratie", "recombinatie", "frisheidsprofiel", "aromatische intensiteit"],
    9: ["aroma-retentie", "esters", "hoparoma", "bewaring", "aromatische intensiteit"],
    10: ["bitterbalans", "restsuiker", "koolzuur", "lengte", "drinkbaarheid"],
    11: ["proefstructuur", "visuele analyse", "aroma-analyse", "mondgevoel", "objectiviteit"],
    12: ["body", "textuur", "restsuiker", "eiwitten", "gewichtspalet"],
    13: ["restsuiker", "zoetheidsperceptie", "koolzuurmaskering", "bitterbalans", "pairinglogica"],
    14: ["bitterbalans", "hopbitterheid", "lengte", "afdronk", "drinkbaarheid"],
    15: ["blindproeven", "stijlhypothese", "integratie", "mondgevoel", "bitterbalans"],
}

QUIZ_FEEDBACK: dict[int, str] = {
    1: "Sterk begin. Je kunt 0.0 nu uitleggen als biercategorie met adviserend moment, niet alleen als label.",
}

FOOD_PAIRING_WAAROM: dict[int, str] = {}
