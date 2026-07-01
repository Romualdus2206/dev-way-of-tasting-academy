"""Bier 0.0 Track V2 — Gold Master data (lessons 23-45)."""

from __future__ import annotations

from bier_0_0_gold_master_data import (  # noqa: E402
    EXAMENONDERDELEN,
    FOOD_PAIRING,
    GOLD_KEY_CONCEPTS,
    LEERDOELEN,
    PRO_INSIGHTS,
    QUIZ_FEEDBACK,
    QUIZ_FULL,
    QUIZ_PATCHES,
    REFLECTIEVRAGEN,
    SUMMARIES,
    THEORY_OVERRIDES,
    THEORY_MENTIONS,
    _fp,
)


def apply_part2() -> None:
    LEERDOELEN.update(_LEERDOELEN)
    SUMMARIES.update(_SUMMARIES)
    GOLD_KEY_CONCEPTS.update(_GOLD_KEY_CONCEPTS)
    REFLECTIEVRAGEN.update(_REFLECTIEVRAGEN)
    FOOD_PAIRING.update(_FOOD_PAIRING)
    PRO_INSIGHTS.update(_PRO_INSIGHTS)
    THEORY_OVERRIDES.update(_THEORY_OVERRIDES)
    THEORY_MENTIONS.update(_THEORY_MENTIONS)
    QUIZ_PATCHES.update(_QUIZ_PATCHES)
    QUIZ_FULL.update(_QUIZ_FULL)
    QUIZ_FEEDBACK.update(_QUIZ_FEEDBACK)
    EXAMENONDERDELEN.update(_EXAMENONDERDELEN)


_LEERDOELEN = {
    23: "Na deze les kun jij isotone positionering uitleggen en correct inzetten zonder medische claims.",
    24: "Na deze les kun jij functionele 0.0-bieren beoordelen op claim versus smaakprofiel en serveermoment.",
    25: "Na deze les kun jij premium alcoholvrij adviseren op basis van proefkwaliteit, presentatie en gasttype.",
    26: "Na deze les kun jij sportcontext en herstelmomenten bespreken met nuance over hydratatie en verwachting.",
    27: "Na deze les kun jij calorieën van 0.0 vergelijken met regulier bier zonder simplistische 'gezond'-taal.",
    28: "Na deze les kun jij restsuiker en suiker op label lezen en vertalen naar smaak en pairing.",
    29: "Na deze les kun jij hydratatie en 0.0 bespreken als contextkeuze, niet als vervangende sportdrank.",
    30: "Na deze les kun jij alcoholvrij in sociale context adviseren op gasttype, moment en stijlkeuze.",
    31: "Na deze les kun jij serveertemperatuur per 0.0-stijl bepalen en fouten die aroma maskeren vermijden.",
    32: "Na deze les kun jij glaswerk kiezen dat aroma, schuim en temperatuur voor 0.0 optimaliseert.",
    33: "Na deze les kun jij presentatie en inschenktechniek inzetten om premium 0.0 waardevol te laten aanvoelen.",
    34: "Na deze les kun jij bewaring en lichtinvloed beheren zodat 0.0 aroma en koolzuur behouden.",
    35: "Na deze les kun jij service in de praktijk uitvoeren met foutpreventie op schuim, temperatuur en glas.",
    36: "Na deze les kun jij lunchpairing met 0.0 opbouwen via frisheid, vet en lichte bitterheid.",
    37: "Na deze les kun jij kaaspairing met 0.0 technisch onderbouwen via vet, zout en bitter-koolzuurspanning.",
    38: "Na deze les kun jij lichte gerechten koppelen aan stijlkeuze op restzoetheid en aromatische lift.",
    39: "Na deze les kun jij contrast- en harmoniepairing bewust inzetten bij 0.0.",
    40: "Na deze les kun jij bier 0.0 in gastronomische menu's positioneren als volwaardige drankbegeleider.",
    41: "Na deze les kun jij blind pils 0.0 versus regulier pils vergelijken op body, lengte en restzoetheid.",
    42: "Na deze les kun jij blind IPA 0.0 versus regulier IPA vergelijken op hopintegratie en bittere afdronk.",
    43: "Na deze les kun jij stijlen blind herkennen via mondgevoel, bitterbalans en aromatische signatuur.",
    44: "Na deze les kun jij je volledige theoretische Bier 0.0-kennis integreren voor certificering.",
    45: "Na deze les kun jij praktijk, service en pairing samenbrengen op Master-niveau.",
}

_SUMMARIES = {
    23: ["Isotoon is niche en claimgevoelig", "Context en verwachting sturen advies", "Geen medische garanties"],
    24: ["Functioneel = extra ingrediënt of positionering", "Smaak en moment blijven leidend", "Claims vragen nuance"],
    25: ["Premium = proefkwaliteit plus presentatie", "Gasttype bepaalt upsell", "Prijs volgt beleving"],
    26: ["Sportmoment vraagt om verwachtingsmanagement", "0.0 kan sociaal functioneel zijn zonder herstelclaim", "Hydratatie blijft primair water"],
    27: ["Calorieën verschillen door restsuiker en extract", "Vergelijk per stijl, niet generiek", "Geen automatische 'light'-conclusie"],
    28: ["Label suiker ≠ altijd zoetheid in mond", "Restsuiker beïnvloedt pairing", "Bitterheid maskeert zoetheid"],
    29: ["0.0 hydrateert via water, niet via marketing", "Koolzuur en alcoholvrijheid zijn geen sportformule", "Context bepaalt geschiktheid"],
    30: ["Sociale switch vraagt om herkenbare stijl", "Glas en presentatie verlagen stigma", "Moment stuurt pils versus IPA"],
    31: ["Te koud maskeert defecten", "Stijl bepaalt temperatuurvenster", "0.0 profiteert van gecontroleerde frisheid"],
    32: ["Glas beïnvloedt aroma en schuim", "Vet glas is directe kwaliteitsfout", "Stijl bepaalt vorm"],
    33: ["Inschenken bepaalt schuimkwaliteit", "Presentatie rechtvaardigt premium", "Rand en condens zijn signaal"],
    34: ["Licht en warmte vlakken aroma sneller", "0.0 is kwetsbaarder na opening", "Koel en donker bewaren"],
    35: ["Service is proefbare kwaliteit", "Fouten vallen bij 0.0 sneller op", "Flow en glashygiëne zijn basis"],
    36: ["Lunch = licht vet en frisheid", "Pils en witbier domineren", "Verteerbaarheid boven intensiteit"],
    37: ["Vet vraagt bitter en koolzuur", "Kaas toont bodyverschil", "Zout lift aromatiek"],
    38: ["Lichte gerechten vragen harmonie", "Restzoetheid vangt delicate smaken", "Te hoppy overschaduwt"],
    39: ["Contrast scherpt aan", "Harmonie verzacht", "Beide zijn bewuste keuzes"],
    40: ["0.0 hoort in wine-pairinglogica", "Menu-engineering verhoogt waarde", "Techniek boven trend"],
    41: ["Body en lengte zijn hoofdsignalen", "0.0 is vaak zoeter en korter", "Blind trainen objectiviteit"],
    42: ["Hop maskeert deels", "Bitterintegratie verschilt", "Mondgevoel blijft kritisch"],
    43: ["Stijl via parameterclusters", "Blind vermindert etiketbias", "Integratie van hele track"],
    44: ["Volledige theorie-integratie", "Alle modules komen terug", "Certificeringsmoment"],
    45: ["Praktijk plus service plus pairing", "Master-competentie", "Finale track-afronding"],
}

_GOLD_KEY_CONCEPTS = {
    23: ["isotone", "claimdiscipline", "sportcontext", "verwachting", "nuance"],
    24: ["functioneel bier", "ingrediëntclaim", "smaakprofiel", "moment", "transparantie"],
    25: ["premium", "proefkwaliteit", "presentatie", "upsell", "gasttype"],
    26: ["sportmoment", "herstel", "alcohol-switch", "context", "hydratatie"],
    27: ["calorieën", "extract", "restsuiker", "vergelijking", "nuance"],
    28: ["suiker label", "restsuiker", "zoetheid", "pairing", "bittermaskering"],
    29: ["hydratatie", "koolzuur", "context", "water", "verwachting"],
    30: ["sociale context", "stigma", "stijlkeuze", "presentatie", "moment"],
    31: ["serveertemperatuur", "frisheid", "aroma", "maskering", "stijl"],
    32: ["glaswerk", "schuim", "aroma", "temperatuur", "hygiëne"],
    33: ["presentatie", "inschenken", "schuimkwaliteit", "premium", "beleving"],
    34: ["bewaring", "licht", "aroma", "koolzuur", "houdbaarheid"],
    35: ["serviceflow", "foutpreventie", "glas", "temperatuur", "horeca"],
    36: ["lunch", "frisheid", "vet", "pils", "witbier"],
    37: ["kaas", "vet", "zout", "bitterheid", "koolzuur"],
    38: ["licht gerecht", "harmonie", "restzoetheid", "delicaat", "stijl"],
    39: ["contrast", "harmonie", "bitter-vet", "zoet-zuur", "spanning"],
    40: ["gastronomie", "menu", "drankbegeleiding", "techniek", "positionering"],
    41: ["blind", "pils", "body", "lengte", "restzoetheid"],
    42: ["blind", "IPA", "hop", "bitterheid", "integratie"],
    43: ["stijlherkenning", "mondgevoel", "blind", "signatuur", "calibratie"],
    44: ["theorie", "examen", "certificering", "integratie", "toetsing"],
    45: ["praktijk", "service", "pairing", "master", "integratie"],
}

_REFLECTIEVRAGEN = {
    23: "Een gast vraagt of isotone 0.0 'goed is na het sporten'. Hoe antwoord je professioneel zonder claim?",
    24: "Welke functionele claim zou je nooit op de kaart zetten zonder smaakonderbouwing?",
    25: "Beschrijf één situatie waarin premium 0.0 de moeite waard is en één waarin instap-pils slimmer is.",
    26: "Hoe adviseer je een gast die 0.0 wil als hersteldrank na training?",
    27: "Twee 0.0-bieren met verschillende calorieën: welke leg je uit aan een caloriebewuste gast en waarom?",
    28: "Hoe leg je uit dat een bier met suiker op het label niet altijd zoet proeft?",
    29: "Wanneer is water beter advies dan 0.0 in een sportcontext?",
    30: "Welke stijl en presentatie verlagen sociale drempel voor alcohol-switch in een gemengd gezelschap?",
    31: "Je proeft hetzelfde 0.0 op 3°C en 7°C. Welke temperatuur verkoop je aan een kritische gast en waarom?",
    32: "Welk glas kies je voor witbier 0.0 versus IPA 0.0 — en welke parameter win je?",
    33: "Welke inschenkfout maakt premium 0.0 direct goedkoop aanvoelen?",
    34: "Hoe bewaar je open 0.0 in de koelkast zonder aroma te verliezen?",
    35: "Noem drie servicefouten die bij 0.0 sneller opvallen dan bij regulier bier.",
    36: "Kies lunchgerecht en stijl: welke technische parameter maakt de pairing logisch?",
    37: "Oude kaas met pils 0.0 of IPA 0.0 — onderbouw met vet en bitterheid.",
    38: "Wanneer kies je harmonie en wanneer contrast bij een licht visgerecht?",
    39: "Geef één contrast- en één harmoniepairing met dezelfde 0.0-stijl.",
    40: "Hoe pitch je een 0.0-pairing aan een chef die alleen wijn in het menu wil?",
    41: "Welk blind signaal verraadt 0.0-pils het snelst bij jou?",
    42: "Waarom maakt IPA blindproeven moeilijker dan pils?",
    43: "Welke parametercluster gebruik jij als eerste bij stijlherkenning blind?",
    44: "Welk module-onderdeel voelt voor jou nog het zwakst vóór het examen?",
    45: "Welke groei in service of pairing merk je het meest sinds module 1?",
}

_FOOD_PAIRING = {
    23: _fp(
        "Lichte post-workout maaltijd: kip, rijst en groene salade met licht zout.",
        "Isotone 0.0 met mineralen kan in sommige contexten functioneel interessanter aanvoelen dan regulier bier "
        "door lagere alcoholbelasting en bekende sportassociatie; zout in het gerecht harmoniseert met lichte bitterheid. "
        "Geen medische herstelclaim — context bepaalt geschiktheid.",
        "Zware vetrijke burger direct na inspanning — dan wint water of een neutrale maaltijd boven positionering.",
    ),
    24: _fp(
        "Brunch met eieren, avocado en citrussalade.",
        "Functionele toevoegingen moeten smaak niet domineren; frisheid en lichte bitterheid ondersteunen vet van avocado; "
        "citrus brugt met hop of specerijen in het bier.",
        "Gerechten met extreme umami zonder zout of zuur — functionele claims redden geen vlakke pairing.",
    ),
    25: _fp(
        "Oester, carpaccio en truffelrisotto licht.",
        "Premium 0.0 met diepere mout of gecontroleerde hopintensiteit kan umami en zout dragen zonder alcoholwarmte; "
        "presentatie in correct glas versterkt gastronomische geloofwaardigheid.",
        "Budget snackmix zonder structuur — premium prijs vraagt gastronomische context.",
    ),
    26: _fp(
        "Post-training wrap met kip, sla en yoghurt-dressing.",
        "Bier 0.0 kan in sociale sportcontext functioneel interessanter zijn dan regulier bier wanneer gasten "
        "bewust alcohol willen mijden; lichte bitterheid en koolzuur resetten vet en zout zonder dehydraterende alcohol.",
        "Positioneren als vervangende sportdrank met herstelbelofte — dat overschrijdt professionele nuance.",
    ),
    27: _fp(
        "Gegrilde groente, lichte salade en magere proteïne.",
        "Lager-calorische 0.0 met droge afdronk harmoniseert met lichte gerechten; bitterheid en koolzuur geven "
        "smaakdimensie zonder zware restsuiker.",
        "Caloriebewustheid als enige argument zonder smaakprofiel — dat ondermijnt gastvertrouwen.",
    ),
    28: _fp(
        "Pittige Aziatische noedels en zoetzure glazuur licht.",
        "Restzoetheid in 0.0 vangt spice en zuur op; bitterheid voorkomt dat zoetheid plakkerig wordt; "
        "koolzuur lift vet uit noedels.",
        "Ultra-droge pils bij zeer zoet gerecht — dan botst bitterheid zonder compenserende restzoetheid.",
    ),
    29: _fp(
        "Lichte soep, brood en gezouten croutons.",
        "Hydratatie via water blijft primair; 0.0 met matige koolzuur kan in sociale pauze functioneel interessanter "
        "aanvoelen dan regulier bier door lagere alcoholbelasting, mits gast verwachting correct is.",
        "Adviseren als dorstlesser tijdens intensieve dehydratatie — professioneel onjuist.",
    ),
    30: _fp(
        "Borrelplank met charcuterie licht, olijven en noten.",
        "Alcohol-switch in sociale context werkt wanneer stijl herkenbaar blijft: pils of blond voor brede groep; "
        "bitterheid snijdt door vet van charcuterie; zout lift aromatiek.",
        "Zwaarste IPA pushen in gemengd gezelschap zonder foodmatch — verhoogt drempel voor switchers.",
    ),
    31: _fp(
        "Gegrilde vis met citroen en kappertjes.",
        "Correcte serveertemperatuur opent citrus en hop zonder maskering; frisheid snijdt door vet van vis; "
        "zout van kappertjes lift koolzuur.",
        "Te koud serveren bij delicaat gerecht — aroma blijft dicht en pairing voelt vlak.",
    ),
    32: _fp(
        "IPA 0.0 met spicy taco en verse koriander.",
        "Breed IPA-glas concentreert hoparoma; bitterheid temt spice; koolzuur reset vet tussen bites.",
        "IPA in smal pils-glas — aroma verliest lift en pairing verliest technische brug.",
    ),
    33: _fp(
        "Premium bittergarnituur en ambachtelijk brood.",
        "Perfect schuim en schone inschenk signaleren kwaliteit; bitter van bier en hap echoën; "
        "presentatie rechtvaardigt premium 0.0 naast wijn.",
        "Slordige rand, vet glas of plat schuim — gasten koppelen dat aan 'goedkoop alcoholvrij'.",
    ),
    34: _fp(
        "Kaasplateau na bewaringstest — jonge versus oude kaas.",
        "Vers 0.0 met intact aroma balanceert vet van kaas; koolzuur spoelt palate; "
        "bewaarfouten tonen zich direct in vlakke pairing met zoute kaas.",
        "Lang openstaand 0.0 bij umami-rijke kaas — oxidatie en CO₂-verlies vernietigen de brug.",
    ),
    35: _fp(
        "Drie-gangen lunch in de zaal: voorgerecht, hoofd, dessert licht.",
        "Service op temperatuur en glas per gang verhoogt pairing succes; stijlwissel pils naar blond "
        "volgt gerechtgewicht; foutpreventie op schuim houdt beleving premium.",
        "Eén glas type voor alle gangen zonder herinschenk — temperatuur en aroma lijden.",
    ),
    36: _fp(
        "Club sandwich, Caesar licht en quiche.",
        "Pils 0.0: koolzuur lift zout en ei; bitterheid snijdt door vet van bacon of dressing; "
        "frisheid houdt lunch drinkbaar zonder zwaarte.",
        "Donker 0.0 bij delicate salade — moutzoetheid domineert en lunch voelt zwaar.",
    ),
    37: _fp(
        "Comté, blauwschimmel licht en gezouten cracker.",
        "Oude kaas: IPA 0.0 bitterheid tegen vet; jonge kaas: pils koolzuur en zachte bitter; "
        "zout op cracker lift aromatiek; umami vraagt body of hopstructuur.",
        "Zachte triple-achtige kaas met agressieve IPA zonder zoetheidscompensatie — bitter wordt scherp en droog.",
    ),
    38: _fp(
        "Gegrilde witvis, risotto licht en groene asperge.",
        "Witbier of blond 0.0: restzoetheid harmoniseert met asperge; koolzuur snijdt door boter in risotto; "
        "lichte bitterheid houdt vis fris.",
        "Zware donkere 0.0 bij delicate vis — geroosterde mout overschaduwt subtiele protein.",
    ),
    39: _fp(
        "Contrast: spicy wings met droge pils 0.0. Harmonie: kip met citroen en witbier 0.0.",
        "Contrast: bitterheid en koolzuur temmen capsaïcine. Harmonie: citrus en koriander echoën gerecht. "
        "Beide zijn bewuste technische keuzes, geen smaakvoorkeur alleen.",
        "Willekeurige stijl zonder te weten of je contrast of harmonie zoekt — pairing wordt gokwerk.",
    ),
    40: _fp(
        "Vijf-gangen chef's menu met variërend vet, zout en umami.",
        "Menu-engineering: pils voor amuse, witbier bij vis, blond bij gevogelte, donker bij kaas — "
        "elke gang gebruikt bitter-vet-zout-koolzuur logica; 0.0 als volwaardige dranklijn naast wijn.",
        "Eén generiek 0.0 voor heel menu — gastronomische geloofwaardigheid zakt weg.",
    ),
    41: _fp(
        "Zoute friet en mosterd-mayonaise.",
        "Blind vergelijken leert dat pils 0.0 vaak korter en zoeter eindigt; koolzuur en bitterheid "
        "blijven pairingmotor met vet; bodyverschil wordt zichtbaar bij zout.",
        "Alleen op etiket vergelijken — bias verhindert objectieve bodycalibratie.",
    ),
    42: _fp(
        "Sharp cheddar burger en pickled onion.",
        "Blind: reguliere IPA heeft vaak warmere bitterintegratie; 0.0 IPA kan frisser en korter zijn; "
        "vet van kaas toont welke bitterlijn beter spanning houdt.",
        "Blind proeven zonder notatie van lengte en zoetheid — hop maskeert conclusies.",
    ),
    43: _fp(
        "Drie blind geproefde stijlen bij neutrale crackers en zeezout.",
        "Stijlherkenning via parameterclusters: pils droog-fris, wit kruidig-koolzuur, donker mout-umami; "
        "zout op cracker kalibreert bitter en zoetheid tussen samples.",
        "Proeven met etiket zichtbaar — training faalt en examenobjectiviteit lijdt.",
    ),
}

_PRO_INSIGHTS = {
    23: (
        "Isotone 0.0 verkoopt alleen in duidelijke sport- of wellnesscontext met eerlijke verwachting. "
        "Leg uit wat het wél en niet doet; verwijs bij twijfel naar water."
    ),
    24: (
        "Functionele 0.0 hoort op de kaart met smaakbeschrijving vóór claim. "
        "Gasten kopen eerst herkenbare stijl, daarna pas 'extra'."
    ),
    25: (
        "Premium upsell: bied één flagship 0.0 per stijl, niet tien middelmatige. "
        "Proefnotitie op de kaart verhoogt conversie meer dan 'alcoholvrij' alleen."
    ),
    26: (
        "Na sport: positioneer 0.0 als sociaal en verfrissend alternatief, niet als herstelproduct. "
        "Dat beschermt vertrouwen en past bij RULE 4-nuance."
    ),
    27: (
        "Calorieëngesprek: vergelijk stijl met stijl. Pils 0.0 versus zoet blond 0.0 is eerlijker dan 'bier 0.0 is altijd light'."
    ),
    28: (
        "Restsuiker uitleg aan gast: koppel zoetheid aan productiemethode en pairing, niet aan schuldgevoel. "
        "Professioneel taalgebruik voorkomt defensieve reacties."
    ),
    29: (
        "Bij dorst na inspanning: water eerst, 0.0 optioneel daarna in sociale setting. "
        "Dat is horeca-advies dat gasten terugbrengt."
    ),
    30: (
        "Alcohol-switch in groep: serveer 0.0 in hetzelfde glastype als regulier bier waar mogelijk. "
        "Visuele gelijkheid verlaagt stigma en verhoogt herhaalbestelling."
    ),
    31: (
        "Te koud serveren is een verkooptruc voor middelmatige 0.0 — professionele service kalibreert temperatuur "
        "per stijl en laat gast proeven bij twijfel."
    ),
    32: (
        "Vet glas is onacceptabel bij 0.0: schuim valt direct in en gasten associëren dat met gebrek aan kwaliteit. "
        "Glascheck vóór schenk is verplichte routine."
    ),
    33: (
        "Premium 0.0 vraagt om zichtbare zorg bij inschenk: twee-finger schuim, schone rand, geen overmatige condens. "
        "Gasten betalen voor beleving, niet alleen voor afwezigheid van alcohol."
    ),
    34: (
        "0.0 verliest aroma sneller na opening — train bar op kleinere batches en koele donkere opslag. "
        "Liever minder taplijnen met vers product dan breed assortiment met vlakke glazen."
    ),
    35: (
        "Servicefout bij 0.0 kost herbestelling: combineer temperatuurcheck, glasselectie en één zin pairingadvies "
        "bij uitserveren — dat is Master-niveau differentiatie."
    ),
    36: (
        "Lunchkaart: zet 0.0 bij gerecht, niet onderaan 'dranken'. "
        "Food-first placement verhoogt pairingverkoop en positioneert categorie gastronomisch."
    ),
    37: (
        "Kaasboard: verkoop per kaastype een stijl — gasten kopen sneller een flight dan één generiek advies."
    ),
    38: (
        "Lichte gerechten vragen harmonie; pitch witbier of blond vóór IPA tenzij gerecht expliciet pittig of vet is."
    ),
    39: (
        "Leer personeel één contrast- en één harmonievoorbeeld uit het hoofd. "
        "Dat maakt pairinggesprekken kort en overtuigend in drukke service."
    ),
    40: (
        "Chef-gesprek: bied 0.0-pairing aan als 'structuur' — bitter, koolzuur, restzoetheid — niet als trend. "
        "Academy-taal opent deuren die consumentenjargon sluit."
    ),
    41: (
        "Blind pils-training: gebruik body en lengte als eerste filter, niet zoetheid alleen. "
        "Dat kalibreert hele team voor gastadvies tussen 0.0 en regulier."
    ),
    42: (
        "IPA blind: noteer bittere afdronk na 10 seconden — verschil 0.0 versus regulier wordt daar zichtbaar "
        "wanneer hoparoma afneemt."
    ),
    43: (
        "Stijlherkenning blind: train op drie parameterclusters per stijl; snelheid komt van discipline, niet van geluk."
    ),
}

_THEORY_OVERRIDES = {
    23: (
        "Isotone 0.0 positioneert zich rond sport en hydratatie met toegevoegde mineralen. "
        "Professioneel advies: bier 0.0 kan in bepaalde contexten functioneel interessanter aanvoelen dan regulier bier "
        "door lagere alcoholbelasting en herkenbare sportassociatie — zonder dat het een medische hersteldrank wordt."
    ),
    24: (
        "Functionele 0.0 voegt ingrediënten of narratieven toe: vitaminen, planten, eiwit of wellness-hoek. "
        "Beoordeel altijd eerst smaakprofiel en serveermoment; claims zijn secundair en vragen transparantie naar gast."
    ),
    25: (
        "Premium alcoholvrij combineert proefkwaliteit, design, beperkte distributie en vaak zwaardere de-alcoholisatieroutes. "
        "Advies in foodservice: koppel aan gastronomisch moment en glaspresentatie — prijs volgt beleving, niet alleen merk."
    ),
    26: (
        "Sport en herstel zijn gevoelige adviesmomenten. Bier 0.0 kan in sociale sportcontext aantrekkelijk zijn "
        "wanneer gasten gewoonte en gezelligheid willen zonder alcohol. Hydratatie en herstel blijven primair "
        "gebied van water en voeding — geen marketingclaims."
    ),
    27: (
        "Calorieën in 0.0 variëren door restsuiker, extract en eventuele toevoegingen. "
        "Vergelijk binnen stijl en product, niet met simplistische 'altijd minder' taal. "
        "Droge pils 0.0 versus zoete blond 0.0 zijn verschillende gesprekken."
    ),
    28: (
        "Suiker op het label en zoetheid in het glas lopen uiteen door bitterheid, koolzuur en temperatuur. "
        "Restsuiker bepaalt pairing: meer restzoetheid vangt spice en umami; te veel vermoeit zonder alcoholbuffer."
    ),
    29: (
        "Hydratatie via bier 0.0 is beperkt door alcoholvrijheid maar niet equivalent aan water of isotone sportdrank. "
        "Professioneel: leg context uit — sociale verfrissing kan, medische hydratatieclaim kan niet."
    ),
    30: (
        "Sociale context vraagt om herkenbare stijl, gelijkwaardige presentatie en geen defensieve toon. "
        "Alcohol-switchers willen meedoen in ritme van de tafel; glas, tempo en stijlkeuze bepalen of 0.0 geaccepteerd wordt."
    ),
    31: (
        "Serveertemperatuur bepaalt aromatische intensiteit, frisheid en bitterperceptie. "
        "Pils 0.0: 3–5°C voor dorstlessend profiel; IPA en blond: 6–8°C voor hop/mout-opening; donker: 8–10°C. "
        "Te koud maskeert defecten; te warm maakt 0.0 snel vlak door ontbrekende alcoholstructuur."
    ),
    32: (
        "Glaswerk stuurt aroma-concentratie, schuimstabiliteit en temperatuurbehoud. "
        "Pils: slank en hoog; IPA: breed voor hop; witbier: volumineus voor kruidigheid; donker: compact aromatisch. "
        "Vet residu op glas vernietigt schuim — bij 0.0 direct zichtbaar kwaliteitsverlies."
    ),
    33: (
        "Presentatie omvat schone glazen, gecontroleerd schuim, juiste vulgraad en geen beslagen rand door vuile was. "
        "Inschenk aan glaswand, niet in schuim; twee vingers schuim als richtlijn. "
        "Premium 0.0 verliest waarde bij haastige schenk zonder oogcontact met product."
    ),
    34: (
        "Bewaring: koel, donker, rechtop; 0.0 is gevoeliger voor licht en warmte door kleinere smaakbuffer. "
        "Na opening daalt koolzuur en aromatische lift sneller — plan taprotatie en voorraad daarop."
    ),
    35: (
        "Service in de praktijk combineert temperatuurcheck, glasselectie, schone inschenk en één zin gastadvies. "
        "Foutpreventie: geen warm glas, geen vet rand, geen plat 0.0 uit lang open tap. "
        "0.0 bestraft slordigheid sneller omdat gasten vergelijken met frisdrank én bier."
    ),
    36: (
        "Lunchpairing vraagt frisheid, lichte bitterheid en verteerbare structuur. "
        "Vet uit sandwich of dressing vraagt koolzuur-lift; zout vraagt bittere snede; umami licht vraagt droge afdronk "
        "of gecontroleerde restzoetheid — niet generiek 'pizza past goed'."
    ),
    37: (
        "Kaaspairing: vet vraagt bitterheid en koolzuur; zout lift aromatiek; umami in oude kaas vraagt hop of moutdiepte. "
        "Jonge kaas met pils 0.0; oude kaas met IPA 0.0; blauw met donker of bitter blond — altijd technisch onderbouwd."
    ),
    38: (
        "Lichte gerechten: harmonie via restzoetheid en milde bitterheid; contrast via droge pils en citruszuur in gerecht. "
        "Delicate vis overschaduwd door te hoppy IPA — witbier of blond 0.0 houden textuur in balans."
    ),
    39: (
        "Contrast verhoogt spanning: droge bitterheid tegen vet en spice. Harmonie verzacht: moutzoetheid met ronde gerechten. "
        "Beide zijn valide; keuze hangt af van menu-intentie en gastprofiel."
    ),
    40: (
        "Gastronomische positie: 0.0 als volwaardige drankbegeleider met stijlwissel per gang. "
        "Menu-engineering koppelt bitter-vet-zout-koolzuur per gerecht; sommelier-logica geldt evenzeer voor bier 0.0."
    ),
    41: (
        "Blind pils-vergelijking: regulier pils heeft meer body, warmere structuur en langere afdronk door alcohol. "
        "0.0 pils is vaak lichter, soms iets zoeter en korter — mondgevoel is het snelste signaal."
    ),
    42: (
        "Blind IPA-vergelijking: hop maskeert deels; let op bitterintegratie na 10 seconden en op restzoetheid die "
        "0.0 ronder kan maken. Regulier IPA voelt vaak warmer en langer bitter."
    ),
    43: (
        "Stijlherkenning blind: cluster parameters per stijl — pils droog-fris-kort; wit kruidig-koolzuur-zacht; "
        "IPA hop-bitter-aromatisch; blond rond-mild; donker mout-umami-lang. Objectiviteit verslaat etiketbias."
    ),
    44: (
        "Dit examen behandelt fundament, productie, proeven, stijlen, markt, gezondheid, service en pairing. "
        "Je toont aan dat je theorie beheerst op academy-niveau: technisch, adviserend en zonder consumentenjargon. "
        "Bij voldoende score rond je de theoretische certificering af."
    ),
    45: (
        "Praktijkexamen integreert blindproeven, stijlherkenning, service en pairing. "
        "Je laat zien dat bier 0.0 professioneel beheerst wordt als smaakproduct met horeca-discipline — "
        "niet als compromisdrank."
    ),
}

_THEORY_MENTIONS = {
    36: "Geroosterde mout in donker 0.0 ondersteunt Maillard-tonen in gegrild brood of lichte stoof.",
    37: "Koolzuur spoelt vet van kaas weg; zonder voldoende bitterheid blijft het palet vet en vlak.",
    38: "Aromatische intensiteit in het gerecht bepaalt of je harmonie (zacht) of contrast (droog-bitter) kiest.",
}

_QUIZ_PATCHES = {
    26: """### Vraag 4

Een gast vraagt of 0.0 'goed is voor herstel na sport'. Beste antwoord?

A. Ja, vervangt sportdrank volledig
B. Het kan in sociale context interessant zijn zonder herstelclaim; water blijft primair ✅
C. Nee, 0.0 is altijd ongezond
D. Alleen isotone frisdrank telt""",
    31: """### Vraag 1

Een 0.0 smaakt vlak in de zaal maar fris in de koelcel. Meest waarschijnlijke oorzaak?

A. Te warm geserveerd waardoor frisheid en aroma dalen ✅
B. Te veel alcohol
C. Verkeerde hopsoort op het etiket
D. Te veel schuim""",
    36: """### Vraag 1

Waarom werkt pils 0.0 technisch bij club sandwich?

A. Koolzuur lift zout en bitterheid snijdt door vet van ei en vlees ✅
B. Zoetheid domineert umami
C. Geen koolzuur nodig
D. Donkere mout is verplicht""",
}

_QUIZ_FEEDBACK = {
    44: (
        "Sterk. Je bent klaar om je volledige kennisbasis te toetsen. "
        "Dit is de theoretische afronding van je Bier 0.0 Academy."
    ),
    45: (
        "Gefeliciteerd. Je hebt de Bier 0.0-track op Master-niveau afgerond: theorie, proef, service en gastronomie geïntegreerd."
    ),
}

_EXAMENONDERDELEN = {
    44: """- Open vragen en praktijkcases over productie en proef
- Stijlvragen met technische onderbouwing
- Gezondheid en lifestyle met nuance (geen claims)
- Service- en pairingcases op bitter-vet-zout-koolzuur logica
- Blindproef-scenario's en gastadvies per moment""",
}

_QUIZ_FULL = {
    35: """### Vraag 1

Je opent een drukke lunchservice met 0.0-pils. Wat check je als eerste?

A. Vet glas en serveertemperatuur vóór inschenk ✅
B. Alleen etiketkleur
C. Taplawaai
D. Barbecuepairing

### Vraag 2

Witbier 0.0 wordt te vlak ervaren. Meest waarschijnlijke servicefout?

A. Te koud geserveerd in verkeerd glas waardoor kruidigheid dicht blijft ✅
B. Te veel alcohol
C. Verkeerde hopsoort in recept
D. Te veel suiker in gerecht

### Vraag 3

IPA 0.0 met plat schuim en snel verdwijnend aroma. Oorzaak?

A. Vet glas of slordige inschenk zonder schuimcontrole ✅
B. Te veel geroosterde mout
C. Te warm bier alleen door recept
D. Verkeerde kaaskeuze

### Vraag 4

Een gast bestelt premium donker 0.0. Juiste servicevolgorde?

A. Glas check → 8–10°C → inschenk aan wand → korte pairingzin ✅
B. Warm glas → maximaal koud → snel volschenken
C. Wijnkelk → ijsblokjes → snel roeren
D. Shotglas → dubbel schuim → geen uitleg

### Vraag 5

Waarom is service bij 0.0 extra kritisch?

A. Gasten vergelijken direct met frisdrank én bier; fouten vallen sneller op ✅
B. Meer alcohol vereist precisie
C. Minder aroma mogelijk
D. Alleen prijs telt

### Vraag 6

Twee identieke 0.0, verschillende glazen. Wat verandert het meest?

A. Aroma-concentratie en schuimstabiliteit ✅
B. Alcoholpercentage
C. Restsuiker in fles
D. Etiketwaarde

### Vraag 7

Tap 0.0 smaakt oxidatief na weekend. Beste operationele actie?

A. Rotatie verscherpen en bewaring/licht controleren ✅
B. Warmer serveren om te maskeren
C. Meer suiker toevoegen
D. Glas niet spoelen

### Vraag 8

Gast vraagt waarom je 6°C adviseert voor blond 0.0. Beste antwoord?

A. Opent mout en hop zonder frisheid te verliezen ✅
B. Verbergt alle defecten permanent
C. Is wettelijk verplicht
D. Maakt bier zoeter

### Vraag 9

Welke fout ondermijnt premium positionering het directst?

A. Beslagen vuile rand en haastige schenk zonder oogcontact ✅
B. Te veel pairinguitleg
C. Te klein glas voor pils
D. Te koud water naast

### Vraag 10

Wat bewijs je met deze service-module?

A. Master-serviceintegratie: temperatuur, glas, inschenk en gastbeleving ✅
B. Alleen theoriekennis productie
C. Alleen blindproeven
D. Alleen calorieadvies""",
    40: """### Vraag 1

Chef wil alleen wijn in pairingmenu. Sterkste academy-argument voor 0.0?

A. Bitter-vet-zout-koolzuur structuur per gang net als wijn ✅
B. 0.0 is altijd goedkoper
C. 0.0 heeft geen smaak
D. Alleen trend

### Vraag 2

Amuse met oester en zoute cracker. Logische 0.0-keuze?

A. Pils of witbier met koolzuur-lift en lichte bitterheid ✅
B. Zoete blond met dessertprofiel
C. Donker met zware mout alleen
D. Warm flat bier

### Vraag 3

Hoofdgerecht met truffel en umami. Technische pairinglijn?

A. Blond of donker 0.0 met moutdiepte en gecontroleerde bitterheid ✅
B. Instap pils zonder body
C. Maximaal koud witbier
D. Geen drank

### Vraag 4

Kaasgang met blauwschimmel. Beste logica?

A. Donker of bitter blond: restzoetheid vangt umami, bitter snijdt vet ✅
B. Zoete frisdrank
C. Water alleen
D. Pils zonder koolzuur

### Vraag 5

Waarom menu-engineering met 0.0?

A. Stijlwissel volgt gerechtgewicht en houdt pairing geloofwaardig ✅
B. Eén glas voor alles is efficiënter
C. Minder werk voor bediening
D. Geen uitleg nodig

### Vraag 6

Lunchrestaurant wil alcoholvrije pairing. Eerste stap?

A. Gerechtstructuur analyseren op vet, zout en umami per gang ✅
B. Alleen goedkoopste 0.0 bestellen
C. Alleen wijn behouden
D. Geen kaartwijziging

### Vraag 7

Gast wil 'geen wijn, wel beleving'. Positionering?

A. 0.0 als volwaardige drankbegeleider met technische uitleg ✅
B. Frisdrank als enige optie
C. Water zonder context
D. Alleen digestief

### Vraag 8

Contrast pairing voor spicy kip in menu?

A. Droge pils 0.0: bitter en koolzuur temmen capsaïcine ✅
B. Zoete blond zonder bitter
C. Donker met zware mout
D. Warm flat ale

### Vraag 9

Harmonie pairing voor lichte vis met boter?

A. Witbier of blond 0.0: restzoetheid en kruidigheid echoën gerecht ✅
B. Agressieve IPA
C. Donker stoofprofiel
D. Geen koolzuur

### Vraag 10

Wat bewijs je met gastronomie-module?

A. 0.0 op sommelier-niveau in menu's en pairingcases ✅
B. Alleen marketinggroei
C. Alleen sportpositionering
D. Alleen merkkennis""",
}
