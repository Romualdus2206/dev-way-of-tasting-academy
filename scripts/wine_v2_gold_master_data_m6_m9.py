"""Premium Gold Master repair data — Wine Foundation Track lessons 26–40 (modules 6–9).

Module 6 (26–30): Klimaat & Terroir — specialist analyseniveau
Module 7 (31–34): Service — horeca-kwaliteit op Port-niveau (temperatuur, glas, decanteren, kelderen)
Module 8 (35–37): Pairing & Gastronomie
Module 9 (38–40): Blindproeven & Examen
"""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    26: {
        "theorie": (
            "Koel klimaat is meer dan 'het is er fris' — het is een meetbaar effect van temperatuur op "
            "fysiologie. Een groot diurnaal verschil (warme dagen, koude nachten) remt nachtelijke "
            "ademhaling van de druif, waardoor appelzuur minder snel wordt afgebroken. Het resultaat: "
            "hogere totale zuurgraad bij de oogst, ook bij volledige suikerrijping.\n\n"
            "Specialistisch gezien loopt de fenolische rijping (tannine, kleurstoffen, aromatische "
            "precursors) in koele gebieden vaak achter op de suikerrijping. Te vroeg oogsten om zuur te "
            "behouden kan onrijpe, groene tannine of pyrazinetonen (groene paprika) opleveren — een "
            "klassieke valkuil in marginale koele gebieden.\n\n"
            "Referentiegebieden: Mosel (leisteen, Riesling), Chablis (Kimmeridgien kalksteen), "
            "Champagne, Sancerre, Central Otago en Tasmanië. De Huglin-index (een verfijning van "
            "graaddagen) wordt door specialisten gebruikt om gebieden objectief te classificeren in "
            "plaats van te vertrouwen op reputatie alleen.\n\n"
            "Onderscheid 'koel klimaat' (structureel kenmerk van een regio) van een 'koel jaargang' "
            "(een atypisch jaar in een normaal warmer gebied) — die twee worden in de praktijk vaak "
            "verward, met verkeerde verwachtingen als gevolg."
        ),
        "samenvatting": (
            "- Groot diurnaal verschil remt zuurafbraak: meer appelzuur behouden\n"
            "- Fenolische rijping loopt vaak achter op suikerrijping — risico op groene tannine\n"
            "- Huglin-index classificeert klimaat objectief, los van regio-reputatie\n"
            "- Referentiegebieden: Mosel, Chablis, Champagne, Sancerre, Central Otago\n"
            "- Onderscheid koel klimaat (structureel) van koele jaargang (incidenteel)"
        ),
        "pro_insight": (
            "Vraagt een gast om 'iets fris' zonder regio te noemen? Vraag door naar het gewenste "
            "zuurniveau in plaats van een hele regiolijst op te noemen — dat filtert sneller en "
            "voorkomt een fles die technisch koel-klimaat is maar toch te scherp aanvoelt."
        ),
        "kernbegrippen": [
            "diurnaal temperatuurverschil",
            "malaatbehoud",
            "Huglin-index",
            "fenolische rijping",
            "aromatische precursors",
        ],
        "food_pairing": fp(
            "Chablis 1er Cru bij oesters en schaaldieren met citroen.",
            "Hoge zuren en mineraliteit spiegelen de jodiumtonen en snijden door de natuurlijke zoutigheid.",
            "Rijk gegrild rood vlees — de wijn mist body en alcohol om dat gewicht te dragen.",
        ),
        "reflectievraag": (
            "Welke twee koel-klimaatregio's zou jij naast elkaar zetten om het effect van bodem "
            "(bijvoorbeeld kalk versus leisteen) op smaak te isoleren — terwijl het klimaat zelf "
            "vergelijkbaar blijft?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat is het grootste risico bij onvolledige fenolische rijping in een koel klimaat?\n\n"
                "A. Groene, kruidige tannine en pyrazinetonen ✅  \n"
                "B. Te hoog alcoholpercentage  \n"
                "C. Te weinig zuur  \n"
                "D. Te veel restsuiker"
            ),
        },
    },
    27: {
        "theorie": (
            "Gematigd klimaat is het balansvenster tussen onderrijpheid en overrijpheid — met "
            "graaddagen die meestal in Winkler-regio II–III vallen. Het lastige aan dit venster: de "
            "marge voor fouten is kleiner dan bij koel of warm klimaat. Een koelere jaargang kipt snel "
            "richting groen en scherp; een warmere jaargang richting jammy en log. Daarom is "
            "jaargangvariatie in gematigde gebieden vaak prominenter dan in extreme klimaten.\n\n"
            "Bordeaux toont dit door zijn maritieme moderatie (Atlantische Oceaan en de Gironde "
            "temperen extremen), Bourgogne door zijn continentale karakter met reëel vorstrisico en "
            "een nauw oogstvenster, Rioja door de combinatie van Atlantisch, mediterraan en "
            "continentaal subklimaat binnen één DOCa, en Piemonte door de mist (nebbia) die de "
            "rijping van Nebbiolo vertraagt en verfijnt.\n\n"
            "Specialistisch inzicht: in gematigde gebieden doet het klimaat slechts 'het halve werk'. "
            "Expositie, hellingsgraad en oogstmoment — menselijke beslissingen — bepalen vaak méér "
            "over het eindresultaat dan in extreme klimaten, waar het klimaat zelf al een dominante "
            "stempel drukt."
        ),
        "samenvatting": (
            "- Gematigd klimaat = balansvenster met smalle foutmarge tussen groen en overrijp\n"
            "- Jaargangvariatie is hier vaak groter dan tussen twee gematigde regio's onderling\n"
            "- Bordeaux, Bourgogne, Rioja en Piemonte tonen elk een ander subklimaat-mechanisme\n"
            "- Expositie en oogstmoment bepalen relatief meer dan het klimaat alleen\n"
            "- Winkler-regio II–III is de technische classificatie achter 'gematigd'"
        ),
        "pro_insight": (
            "Bij twijfel over een jaargang in een gematigd gebied: vraag eerst naar het oogstmoment, "
            "niet naar de regio — het verschil tussen een vroege en een late oogst in hetzelfde dorp "
            "is vaak groter dan het verschil tussen twee gematigde regio's."
        ),
        "kernbegrippen": [
            "rijpingsvenster",
            "jaargangvariatie",
            "mesoklimaat",
            "Atlantische invloed",
            "oogstmoment",
        ],
        "food_pairing": fp(
            "Bourgogne rouge (Pinot Noir) bij eend met bospaddenstoelen.",
            "Evenwichtig zuur en fijne tannine dragen umami zonder de subtiele balans te overstemmen.",
            "Zeer specerijrijke gerechten — die overschaduwen precies de finesse die gematigd klimaat mogelijk maakt.",
        ),
        "reflectievraag": (
            "Welke jaargangfactor — vroege vorst, regen tijdens de oogst of een hittegolf — zou jij "
            "het eerst navragen bij een fles uit een gematigd gebied, vóór je iets over stijl aanneemt?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom is jaargangvariatie in gematigde klimaten vaak prominenter dan in extreme klimaten?\n\n"
                "A. Omdat de foutmarge tussen onderrijp en overrijp er kleiner is ✅  \n"
                "B. Omdat er nooit zon is  \n"
                "C. Omdat er geen druivenrassen geschikt zijn  \n"
                "D. Omdat er nooit regen valt"
            ),
        },
    },
    28: {
        "theorie": (
            "Warm klimaat (Winkler-regio IV–V, hoge graaddagen) versnelt suikeraccumulatie sneller dan "
            "fenolische rijping kan bijhouden. Daardoor ontstaat een kloof: bij voldoende fenolische "
            "rijpheid (rijpe tannine, ontwikkelde kleurstoffen) is het suikerniveau — en dus het "
            "potentiële alcoholpercentage — vaak al hoog opgelopen, soms boven 14,5%.\n\n"
            "Producenten in warme gebieden sturen actief bij: nachtoogst om hitte-stress en "
            "suikerpieken te vermijden, bladwerk voor schaduw op de trossen, of het zoeken naar "
            "koelere mesoklimaten binnen een warm gebied — hoogteligging in Mendoza, kustmist in "
            "delen van Napa, of de hitte-bufferende werking van licorella-leisteen in Priorat die "
            "overdag opwarmt en 's nachts langzaam afgeeft.\n\n"
            "Sensorisch resultaat: vol, rijp zwart fruit, jam- en specerijtonen, zachtere zuren en "
            "vaak een houtregime dat structuur moet toevoegen omdat tannine van de druif zelf minder "
            "scherp aanvoelt. Referentiegebieden: Barossa (oude, laagopbrengende Shiraz-stokken), "
            "Napa Valley, Priorat."
        ),
        "samenvatting": (
            "- Suikeraccumulatie loopt in warm klimaat sneller dan fenolische rijping\n"
            "- Risico: hoog alcohol bij volledige fenolische rijpheid\n"
            "- Nachtoogst, bladwerk en koelere mesoklimaten corrigeren de balans\n"
            "- Sensorisch: vol, rijp fruit, jam- en specerijtonen, zachtere zuren\n"
            "- Referentiegebieden: Barossa, Napa Valley, Priorat"
        ),
        "pro_insight": (
            "Een warme-klimaat-wijn met laag alcohol (onder 13%) is vaak interessanter dan het "
            "etiket suggereert: dat wijst meestal op vroege oogst, hoogteligging of bewuste "
            "stijlkeuze — vraag daar gericht naar bij inkoop."
        ),
        "kernbegrippen": [
            "graaddagen",
            "suiker-fenolen-kloof",
            "nachtoogst",
            "hoogteligging",
            "potentieel alcohol",
        ],
        "food_pairing": fp(
            "Barossa Shiraz bij geroosterd lamsvlees met rozemarijn.",
            "Rijk fruit en zachte tannine matchen de intensiteit en het vet van het vlees.",
            "Lichte visgerechten — alcohol en body verpletteren de delicate textuur volledig.",
        ),
        "reflectievraag": (
            "Bij welke warme-klimaatwijn op jouw kaart vermoed je dat de producent bewust vroeg heeft "
            "geoogst — en welk signaal in het glas (alcohol, zuur, fruitrijpheid) zou dat bevestigen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Welke ingreep gebruiken producenten in warm klimaat het vaakst om de suiker-fenolen-kloof te beperken?\n\n"
                "A. Nachtoogst en bladwerk voor schaduw ✅  \n"
                "B. Extra bewatering vlak voor de oogst  \n"
                "C. Vroeg snoeien zonder schaduw  \n"
                "D. Volledig kunstlicht in de wijngaard"
            ),
        },
    },
    29: {
        "theorie": (
            "Bodem stuurt drie zaken tegelijk: drainage (en daarmee waterstress op de wortel), "
            "warmtehuishouding (opslag en afgifte) en mineraalbeschikbaarheid. Specialisten zijn "
            "voorzichtig met de term 'mineraliteit': directe mineraaloverdracht van gesteente naar wijn "
            "is wetenschappelijk niet aangetoond — het gaat eerder om een sensorische associatie "
            "(reductieve aromacomponenten, hoog zuur) die wij koppelen aan 'steenachtig' proeven.\n\n"
            "Kalksteen (Chablis, Champagne) drainen goed en geven matige waterstress — vaak gekoppeld "
            "aan spanning en finesse. Klei (Pomerol) houdt water vast, geeft de wijnstok meer "
            "beschikbaarheid en levert vaak body en kracht. Zand (Châteauneuf-du-Pape's zandige "
            "percelen, Colares) drainen snel en geven door warmte-isolatie vaak zachte, aromatische "
            "wijnen. Leisteen (Mosel, Douro, Priorat) slaat overdag warmte op en geeft die 's nachts "
            "langzaam af, wat de rijping verlengt en concentratie ondersteunt. Grind/rolkeien "
            "(galets roulés) reflecteren en bufferen warmte extra sterk.\n\n"
            "Geen enkele bodem is intrinsiek 'beter' — de kwaliteit ontstaat uit de match tussen "
            "bodemtype, klimaat en druivenras. Dezelfde leisteen die Riesling in de Mosel scherpte "
            "geeft, geeft Touriga Nacional in de Douro juist concentratie door extra hitte."
        ),
        "samenvatting": (
            "- Bodem stuurt drainage, warmtehuishouding en mineraalbeschikbaarheid — niet 'smaak via mineralen'\n"
            "- Kalk → drainage en spanning; klei → waterbehoud en body; zand → warmte-isolatie en zachtheid\n"
            "- Leisteen slaat warmte op en geeft die vertraagd af — verlengt rijping\n"
            "- 'Mineraliteit' is sensorisch, geen directe mineraaloverdracht\n"
            "- Kwaliteit ontstaat uit de match tussen bodem, klimaat én druif"
        ),
        "pro_insight": (
            "Vermijd op de kaart de claim 'je proeft de bodem' — leg liever uit wat bodem doet "
            "(drainage, warmte, waterstress). Dat is technisch correcter en overtuigt kenners sneller "
            "dan marketingtaal."
        ),
        "kernbegrippen": [
            "drainage",
            "warmtereflectie",
            "mineraliteitsperceptie",
            "wortelstress",
            "gesteentetype",
        ],
        "food_pairing": fp(
            "Pomerol (klei, Merlot-dominant) bij gebraiseerd rundvlees.",
            "Kleibodems geven body en zachte tannine die de rijke jus van het gerecht spiegelen.",
            "Rauwe schaaldieren — de volle structuur verdrukt de delicate zilte smaak.",
        ),
        "reflectievraag": (
            "Waarom zou je voorzichtig moeten zijn met de uitspraak 'ik proef de leisteen' — en welke "
            "twee mechanismen (warmte, drainage) leg jij liever uit aan een gast in plaats daarvan?"
        ),
    },
    30: {
        "theorie": (
            "Terroir is de synthese van klimaat, bodem, topografie (expositie, hellingsgraad, "
            "hoogteligging) en de menselijke factor — wijnstokleeftijd, trainingssysteem, "
            "oogstbeslissingen en wijnmaakfilosofie. De Franse INAO-traditie benadert terroir als een "
            "vast gegeven dat de mens moet respecteren; Nieuwe Wereld-producenten benaderen het vaker "
            "als actieve site-selectie — andere filosofie, zelfde onderliggende factoren.\n\n"
            "Specialistisch is het cruciaal om macroklimaat (de regio) te onderscheiden van "
            "mesoklimaat (het perceel) en microklimaat (de individuele wijnstok of rij). Twee "
            "percelen op honderd meter afstand kunnen door expositie en hellingshoek een volledig "
            "ander rijpingsprofiel hebben — exact de logica achter het Bourgondische climats-systeem, "
            "waarbij aangrenzende stukken grond officieel verschillende kwaliteitsniveaus krijgen.\n\n"
            "Terroir verklaart dus niet alleen waarom Pinot Noir uit Bourgogne anders smaakt dan "
            "Pinot Noir uit Oregon, maar ook waarom twee naburige percelen van dezelfde producent, "
            "met dezelfde druif en dezelfde wijnmaaktechniek, structureel verschillende wijnen "
            "opleveren. Dat laatste — niet de regio, maar het specifieke perceel — is waar "
            "gespecialiseerde terroir-analyse begint."
        ),
        "samenvatting": (
            "- Terroir = klimaat + bodem + topografie + menselijke factor, in synthese\n"
            "- Macro-, meso- en microklimaat zijn drie verschillende schaalniveaus\n"
            "- Het Bourgondische climats-systeem toont perceelverschil binnen één dorp\n"
            "- INAO-filosofie (respecteren) versus Nieuwe Wereld-filosofie (selecteren) — zelfde factoren\n"
            "- Specialistische analyse kijkt naar het perceel, niet alleen de regio"
        ),
        "pro_insight": (
            "Verkoop terroir niet als 'magie van de plek' maar als optelsom van meetbare factoren — "
            "expositie, hellingsgraad, bodemtype. Dat verhaal overtuigt zowel de kenner als de gast "
            "die voor het eerst over terroir hoort."
        ),
        "kernbegrippen": [
            "mesoklimaat",
            "expositie",
            "perceelselectie",
            "menselijke factor",
            "climats-systeem",
        ],
        "food_pairing": fp(
            "Eenzelfde druif van twee aangrenzende percelen naast elkaar bij een neutraal gerecht zoals gepocheerde kip.",
            "Een neutraal gerecht laat het terroirverschil onvervormd naar voren komen.",
            "Een sterk gekruid gerecht tijdens een terroir-vergelijking — dat maskeert precies het verschil dat je wilt proeven.",
        ),
        "reflectievraag": (
            "Welk schaalniveau — macro-, meso- of microklimaat — gebruik jij het minst bewust in je "
            "eigen proefnotities, en welke vraag zou je daar voortaan bij moeten stellen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart een smaakverschil tussen twee naburige percelen met dezelfde druif en wijnmaaktechniek?\n\n"
                "A. Verschil in expositie, helling of mesoklimaat ✅  \n"
                "B. Een ander etiketontwerp  \n"
                "C. Een andere flesvorm  \n"
                "D. Toeval zonder verklaring"
            ),
        },
    },
    31: {
        "theorie": (
            "Op horecaniveau is serveertemperatuur geen vast getal maar een bewegend doel: een glas "
            "warmt in een verwarmde ruimte ongeveer 1–2°C per tien minuten op. Schenk daarom altijd "
            "net iets ónder de uiteindelijke doeltemperatuur — de wijn warmt vanzelf bij in het glas.\n\n"
            "Snelste koelmethode: een ijsemmer met 50% water en 50% ijs koelt een fles in circa "
            "10–15 minuten effectiever dan een koelkast, omdat het volledige contactoppervlak wordt "
            "benut. Verfijnde banden voor professionele service: mousserend 6–8°C, fris/aromatisch wit "
            "8–10°C, vol gehout wit 10–12°C, licht rood (Pinot Noir, Beaujolais) 13–15°C, vol rood "
            "16–18°C, en versterkte wijn stijlafhankelijk — White Port en jonge stijlen gekoeld op "
            "8–10°C, oude Tawny op 12–14°C.\n\n"
            "Een veelgemaakte fout: 'kamertemperatuur' voor rode wijn stamt uit een tijd zonder "
            "centrale verwarming (16–17°C), niet uit moderne verwarmde ruimtes (21–23°C). Te warm "
            "geserveerde rode wijn proeft vlak en benadrukt alcohol; te koud geserveerd wit sluit "
            "aroma volledig af."
        ),
        "samenvatting": (
            "- Schenk altijd iets onder doeltemperatuur — een glas warmt vanzelf op tijdens service\n"
            "- Ijsemmer met 50/50 water-ijs koelt sneller en gelijkmatiger dan een koelkast\n"
            "- Verfijnde banden per stijl, ook binnen versterkte wijn (jong gekoeld, oud minder koud)\n"
            "- 'Kamertemperatuur' is historisch 16–17°C — niet de moderne verwarmde 21–23°C\n"
            "- Te warm = vlak en alcoholisch; te koud = aroma's volledig gesloten"
        ),
        "pro_insight": (
            "Zet een thermometer in de kelder, niet alleen in de marketing. Eén graad verschil "
            "verklaart een groot deel van de 'te zuur' of 'te alcoholisch'-klachten aan tafel."
        ),
        "kernbegrippen": [
            "temperatuurdrift",
            "koelprotocol",
            "serveerband",
            "decanteerkoeling",
            "alcoholperceptie",
        ],
        "food_pairing": fp(
            "Zelfde Chardonnay geserveerd op 8°C en op 14°C naast een romige scampi-pasta.",
            "De temperatuurproef toont direct hoe boter en zuur anders balanceren bij het gerecht.",
            "Een ijskoude volle rode wijn bij dit gerecht — tannine en fruit sluiten zich volledig af.",
        ),
        "reflectievraag": (
            "Welke fles op jouw kaart serveer je waarschijnlijk te warm of te koud — en welk "
            "aromasignaal zou je na correctie moeten proeven dat je nu mist?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom schenk je een wijn idealiter iets onder de uiteindelijke doeltemperatuur?\n\n"
                "A. Omdat het glas tijdens service vanzelf opwarmt ✅  \n"
                "B. Omdat dat de alcohol verlaagt  \n"
                "C. Omdat dat het zuur verhoogt  \n"
                "D. Omdat dat verplicht is bij elk wijnkeurmerk"
            ),
        },
    },
    32: {
        "theorie": (
            "Glasvorm is geen esthetiek maar aromatechniek. Kelkbreedte en de taper (versmalling) "
            "naar de rand bepalen hoeveel aromatische verbindingen zich boven de wijn concentreren "
            "vóór ze de neus bereiken. De dikte van de rand beïnvloedt hoe de wijn de tong bereikt: "
            "een dunne, scherp geslepen rand laat wijn de mond bereiken vóór de lip het glas voelt, "
            "met minder interferentie in de eerste indruk.\n\n"
            "Varietal-specifieke glazen bestaan met reden: het Bordeaux-glas (hoog, brede kelk) geeft "
            "tanninerijke wijnen ruimte; het Bourgogne-glas (breder, lagere kelk) concentreert subtiele "
            "aromatiek van delicate rode en witte wijnen; het smallere, getailleerde glas voor "
            "aromatische witte wijn (Riesling, Gewürztraminer) richt florale en fruittonen direct "
            "naar de neus; het neutrale ISO-tasting-glas is de internationale standaard voor blind "
            "proeven en wedstrijden — bewust zonder stijlinterpretatie.\n\n"
            "Glashygiëne is minstens zo belangrijk als vorm: detergent-residu doodt mousse in "
            "mousserende wijn en dempt aroma in stille wijn. Poets met een pluisvrije doek, stapel "
            "glazen niet op elkaar (geurabsorptie) en bewaar ze niet in een kast die naar karton of "
            "schoonmaakmiddel ruikt."
        ),
        "samenvatting": (
            "- Kelkbreedte en taper bepalen aromaconcentratie vóór de neus\n"
            "- Randdikte beïnvloedt hoe wijn de tong bereikt en de eerste indruk\n"
            "- Bordeaux-, Bourgogne- en aromatisch-wit-glas zijn elk functioneel ontworpen\n"
            "- ISO-tasting-glas is de neutrale standaard voor blind proeven\n"
            "- Detergent-residu en geurabsorptie zijn de meest onderschatte servicefouten"
        ),
        "pro_insight": (
            "Schenk interne proeverijen altijd in een neutraal ISO- of witwijnglas; bewaar het "
            "varietal-specifieke glaswerk voor gastpresentatie. Zo vergelijk je wijnen zuiver én "
            "verkoop je toch het juiste glas aan tafel."
        ),
        "kernbegrippen": [
            "kelkvorm",
            "randdikte",
            "ISO-glas",
            "glashygiëne",
            "aromaconcentratie",
        ],
        "food_pairing": fp(
            "Bourgogne Pinot Noir in een Bourgogne-kelk bij eendenborst met kersensaus.",
            "De brede kelk concentreert de subtiele rode-vruchtenaroma's vlak boven het glas.",
            "Een smal sherryglas voor dezelfde wijn — dat comprimeert de aromatische laag te veel en verstikt de finesse.",
        ),
        "reflectievraag": (
            "Welk glas in jouw zaak doet een wijnstijl structureel tekort — en wat is de service- of "
            "verkoopimpact daarvan op die fles?"
        ),
        "quiz_patches": {
            4: (
                "### Vraag 4\n\n"
                "Waarom doodt detergent-residu de mousse van mousserende wijn?\n\n"
                "A. Het verstoort het oppervlaktespanning-effect waarop bubbels zich vormen ✅  \n"
                "B. Het verlaagt de temperatuur van het glas  \n"
                "C. Het verandert de kleur van de wijn  \n"
                "D. Het heeft geen effect op mousse"
            ),
            5: (
                "### Vraag 5\n\n"
                "Welk glas is de internationale standaard voor blind proeven en wedstrijden?\n\n"
                "A. Het neutrale ISO-tasting-glas ✅  \n"
                "B. Het Bordeaux-glas  \n"
                "C. De coupe  \n"
                "D. Het sherryglas"
            ),
        },
    },
    33: {
        "theorie": (
            "Decanteren heeft twee technisch verschillende doelen die je niet mag verwarren. "
            "Beluchten (aeration) versnelt esterificatie en zachte oxidatie bij jonge, tanninerijke "
            "wijn door het oppervlak met lucht te vergroten — denk aan een jonge Barolo of Bordeaux "
            "die één tot vier uur vóór serveren wordt gedecanteerd. Sedimentscheiding is iets anders: "
            "bij oude wijn schenk je langzaam en in één vloeiende beweging over een lichtbron "
            "(kaars of telefoonlamp onder de hals), en stop je zodra het depot de hals bereikt.\n\n"
            "Bij zeer oude, fragiele wijn met veel depot maar weinig fruitreserve is dubbel "
            "decanteren de professionele techniek: eerst overschenken in de karaf om het sediment te "
            "scheiden, daarna teruggieten in de gespoelde originele fles — zo blijft luchtcontact "
            "minimaal terwijl het depot volledig weg is.\n\n"
            "Niet elke wijn profiteert: een zeer oude, delicate wijn kan binnen minuten 'instorten' "
            "(fruit verdwijnt, structuur valt uit elkaar) als hij te lang van tevoren wordt "
            "gedecanteerd. Decanteer die wijnen pas vlak vóór het schenken, of helemaal niet, en "
            "observeer de ontwikkeling in het glas zelf."
        ),
        "samenvatting": (
            "- Beluchten (jonge tanninerijke wijn) en sedimentscheiding (oude wijn) zijn verschillende doelen\n"
            "- Sedimentscheiding: langzaam, vloeiend, over een lichtbron, stoppen bij de hals\n"
            "- Dubbel decanteren combineert sedimentscheiding met minimaal luchtcontact\n"
            "- Zeer oude, fragiele wijn kan instorten bij te vroeg decanteren\n"
            "- Timing is een bewuste keuze per wijnstijl en leeftijd, geen vaste regel"
        ),
        "pro_insight": (
            "Laat nieuwe staff eerst oefenen met een lege fles en een kaars onder de hals — die "
            "muscle memory voorkomt dat kostbaar depot in het glas van de gast terechtkomt onder "
            "tijdsdruk."
        ),
        "kernbegrippen": [
            "beluchting",
            "sedimentscheiding",
            "dubbel decanteren",
            "lichtbron-techniek",
            "timing",
        ],
        "food_pairing": fp(
            "Een jonge Barolo, twee uur voor het hoofdgerecht gedecanteerd, bij ossobuco.",
            "Lucht verzacht de strakke tannine van Nebbiolo terwijl het gerecht tijd krijgt om te garen.",
            "Een zeer oude, fragiele Bourgogne lang van tevoren decanteren — het fruit kan binnen minuten wegvallen.",
        ),
        "reflectievraag": (
            "Bij welke fles in jouw assortiment zou jij kiezen voor dubbel decanteren in plaats van "
            "gewoon decanteren — en welk signaal (leeftijd, depot, fragiliteit) bepaalt die keuze?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom decanteer je een zeer oude, fragiele wijn het beste vlak vóór het serveren?\n\n"
                "A. Om te voorkomen dat fruit en structuur te snel 'instorten' ✅  \n"
                "B. Om de wijn kouder te maken  \n"
                "C. Om meer sediment te creëren  \n"
                "D. Om het alcoholpercentage te verlagen"
            ),
        },
    },
    34: {
        "theorie": (
            "Professionele kelderopslag vraagt vier stabiele condities tegelijk: een constante "
            "temperatuur rond 12–14°C (fluctuaties beschadigen wijn meer dan een iets hogere maar "
            "stabiele temperatuur), 70–75% relatieve luchtvochtigheid (te droog laat de kurk "
            "uitdrogen en lucht binnendringen, te vochtig riskeert schimmel op het etiket), "
            "volledige duisternis (UV-licht breekt aromatische verbindingen af — vandaar gekleurd "
            "glas) en minimale trilling (trilling verstoort de langzame, stabiele rijping).\n\n"
            "Liggende opslag houdt de kurk vochtig vanaf de binnenzijde, wat indroging en "
            "zuurstofinfiltratie voorkomt. Flessen met schroefdop rijpen via een ander, meer "
            "reductief pad dan kurk — geen verkeerde keuze, maar wel een andere ontwikkelingscurve "
            "die je inkoop- en bewaaradvies moet meewegen. Magnums rijpen trager dan standaardflessen "
            "door een lagere zuurstof-tot-wijn-ratio — relevant bij investeringsaankopen.\n\n"
            "Professioneel kelderbeheer segmenteert voorraad bewust in 'drink nu', '2–5 jaar' en "
            "'bewaar lang' — zonder die scheiding open je per ongeluk je beste fles op het verkeerde "
            "moment, of laat je een fles veel langer liggen dan zijn optimale venster toelaat."
        ),
        "samenvatting": (
            "- Stabiele 12–14°C en 70–75% luchtvochtigheid zijn belangrijker dan extreem koel\n"
            "- UV-licht en trilling beschadigen wijn structureel tijdens lange opslag\n"
            "- Liggend bewaren houdt de kurk vochtig en voorkomt zuurstofinfiltratie\n"
            "- Schroefdop en magnum volgen elk een eigen, voorspelbare rijpingscurve\n"
            "- Segmenteer voorraad in drink-nu / 2–5 jaar / lang bewaren"
        ),
        "pro_insight": (
            "Label je voorraad fysiek met 'drink nu / 2–5 jaar / bewaar' — zonder die scheiding open "
            "je per ongeluk je beste investering veel te vroeg, of mis je het optimale drinkvenster "
            "volledig."
        ),
        "kernbegrippen": [
            "kelderklimaat",
            "luchtvochtigheid",
            "liggende opslag",
            "drink-nu-of-bewaar",
            "ullage",
        ],
        "food_pairing": fp(
            "Een goed bewaarde, tien jaar oude Bourgogne bij een truffelrisotto.",
            "Trage, stabiele rijping ontwikkelt ondergrondse en umami-tonen die de truffel spiegelen.",
            "Een wijn die warm of met trilling is opgeslagen — vroegtijdige oxidatie ondermijnt precies de complexiteit die je verwacht.",
        ),
        "reflectievraag": (
            "Welke fles in jouw kelder zit waarschijnlijk in het verkeerde segment — drink nu, "
            "middellang of lang bewaren — en welke conditie (temperatuur, licht, trilling) zou je "
            "het eerst corrigeren?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom rijpt een magnumfles doorgaans trager dan een standaardfles van dezelfde wijn?\n\n"
                "A. Door een lagere zuurstof-tot-wijn-ratio ✅  \n"
                "B. Door een dikkere kurk  \n"
                "C. Door een ander druivenras  \n"
                "D. Door een hogere opslagtemperatuur"
            ),
        },
    },
    35: {
        "theorie": (
            "De aanname 'rode wijn bij kaas' klopt sensorisch zelden: tannine en het vet/eiwit van "
            "veel kazen botsen vaker dan ze harmoniëren, behalve bij zeer vette, harde kazen. "
            "Professionele kaaspairing werkt daarom per categorie, niet per kleur wijn.\n\n"
            "Verse, jonge kaas (chèvre, mozzarella) vraagt hoge zuren — een Sancerre of andere "
            "Sauvignon Blanc snijdt door de frisse zuurgraad van de kaas zelf. Zachte schimmelkaas "
            "(Brie, Camembert) werkt vaak beter met mousserend of lichte Chardonnay dan met rood: de "
            "ammoniaktonen van een rijpe korst kunnen tegen tannine bitter aanvoelen. Gewassen korst "
            "(Époisses, Munster) vraagt aromatische of halfdroge witte wijn — de intensiteit van de "
            "kaas overschreeuwt een delicate droge wijn volledig. Harde, gerijpte kaas (Comté, "
            "Parmigiano, oude Gouda) combineert sterk met gerijpte witte wijn of medium rode wijn: "
            "de umami- en kristaltonen spiegelen oxidatieve of notige stijlen. Blauwe kaas "
            "(Roquefort, Stilton) vraagt zoete versterkte wijn (Sauternes, Port) — suiker balanceert "
            "het zout en temt de bitterheid van het schimmel.\n\n"
            "Het mechanisme erachter: vet omhult tannine en verlaagt waargenomen astringentie; zout "
            "onderdrukt bitterheid en versterkt fruitperceptie; zuur snijdt door romigheid. Bouw "
            "pairing op die drie principes, niet op land-van-herkomst-associaties."
        ),
        "samenvatting": (
            "- Pair per kaascategorie (vers, zacht, gewassen korst, hard, blauw) — niet per wijnkleur\n"
            "- Vet omhult tannine; zout onderdrukt bitterheid; zuur snijdt door romigheid\n"
            "- Blauwe kaas vraagt zoete versterkte wijn om zout en bitterheid te balanceren\n"
            "- Harde, gerijpte kaas matcht goed met oxidatieve of notige witte wijn\n"
            "- 'Rode wijn bij kaas' is vaker mythe dan regel"
        ),
        "pro_insight": (
            "Bouw een kaasplank-wijnkaart op intensiteit en categorie, niet op land — één rij van "
            "fris-zuur naar zoet-versterkt dekt vrijwel elke kaas die je serveert."
        ),
        "kernbegrippen": [
            "vet-tannine-binding",
            "zoet-zout-balans",
            "kaascategorie",
            "umami",
            "zuurcontrast",
        ],
        "food_pairing": fp(
            "Comté 24 maanden bij een gerijpte witte Bourgogne (Chardonnay).",
            "Oxidatieve en notige tonen in beide spiegelen elkaar; zuur in de wijn balanceert de zoutige kristallen.",
            "Een fris, jong Sauvignon Blanc bij dezelfde Comté — de wijn voelt dun en verliest tegen de umami-intensiteit.",
        ),
        "reflectievraag": (
            "Bij welke kaas op jouw plank zou jij een gast bewust van rode wijn afhouden — en welk "
            "mechanisme (vet, zout, bitterheid) gebruik je om dat advies te onderbouwen?"
        ),
    },
    36: {
        "theorie": (
            "De klassieke regel 'geen rode wijn bij vis' heeft een concreet mechanisme achter zich: "
            "bepaalde verbindingen in vis — vooral vette vis — kunnen reageren met ijzer en tannine "
            "in rode wijn, wat een metalen, bitter nasmaak oplevert. Dat verklaart waarom de regel "
            "bestaat, maar ook waarom uitzonderingen werken: tanninearme Pinot Noir bij zalm functioneert "
            "niet omdat 'regels niet gelden', maar omdat het vetgehalte van zalm qua body aansluit "
            "bij de lichte structuur van Pinot Noir, zonder het ijzer-tannine-effect te triggeren.\n\n"
            "Saus bepaalt vaak sterker dan de vis zelf: boter- en roomsauzen (beurre blanc, velouté) "
            "vragen een licht gehouten Chardonnay — boter in het gerecht en vanille/room in de wijn "
            "versterken elkaar. Citrus- en kruidenbereidingen vragen juist hoge, onversneden zuren "
            "(Sancerre, Albariño) om de frisheid te spiegelen. Umami-rijke, sojagedreven gerechten "
            "(sushi, miso) vragen subtiele restzoetheid of lage tannine om het zout van soja te "
            "balanceren zonder de wijn bitter te laten lijken.\n\n"
            "Structuurregel: lichte witvis vraagt lichte, frisse wijn; vette vis (zalm, makreel) kan "
            "meer body en zelfs licht houtcontact aan; schaaldieren vragen vrijwel altijd hoge zuren "
            "en mineraliteit boven body."
        ),
        "samenvatting": (
            "- Het ijzer-tannine-effect verklaart waarom vette vis met tannine een metalen nasmaak geeft\n"
            "- Uitzonderingen (Pinot Noir bij zalm) werken door vetgehalte-body-match, niet toeval\n"
            "- Saus bepaalt vaak sterker dan de vis zelf: boter vraagt gehout wit, citrus vraagt onversneden zuur\n"
            "- Sojagedreven umami vraagt subtiele restzoetheid of lage tannine\n"
            "- Lichte vis = lichte wijn; vette vis kan meer body en houtcontact aan"
        ),
        "pro_insight": (
            "Vraag bij twijfel altijd naar de saus vóór je naar de vissoort vraagt — de saus stuurt "
            "het pairingadvies in de praktijk vaker dan het hoofdingrediënt."
        ),
        "kernbegrippen": [
            "ijzer-tannine-effect",
            "sausgedreven pairing",
            "vetgehalte vis",
            "zuur-vet-snede",
            "umami-zoet-balans",
        ],
        "food_pairing": fp(
            "Gegrilde zalm met beurre blanc bij een licht gehoute Chardonnay.",
            "Boter in de saus en vanille/room in de wijn versterken elkaar zonder te botsen met de visvet.",
            "Een tanninerijke rode Bordeaux — het ijzer-tannine-effect met vette vis geeft een metalen bijsmaak.",
        ),
        "reflectievraag": (
            "Bij welk visgerecht op je menu zou een lichte rode wijn toch kunnen werken — en welk "
            "vetgehalte- of saussignaal maakt die uitzondering verdedigbaar?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom kan tanninearme Pinot Noir bij zalm wél werken, ondanks de 'geen rood bij vis'-regel?\n\n"
                "A. Omdat het vetgehalte van zalm qua body aansluit zonder het ijzer-tannine-effect te triggeren ✅  \n"
                "B. Omdat de regel nooit klopt  \n"
                "C. Omdat Pinot Noir geen tannine bevat  \n"
                "D. Omdat zalm geen vet bevat"
            ),
        },
    },
    37: {
        "theorie": (
            "Het mechanisme achter 'vlees verzacht tannine' is eiwitbinding: tannine grijpt normaal "
            "speekseleiwitten aan, wat als droge, samentrekkende astringentie aanvoelt. Eiwit en vet "
            "uit vlees bieden alternatieve bindingsplekken — tannine 'verbruikt' zich daar eerst, "
            "waardoor de wijn zachter aanvoelt zodra je proeft na een hap vlees.\n\n"
            "Vetgehalte bepaalt hoeveel tannine of zuur een gerecht nodig heeft om fris te blijven: "
            "een vette ribeye vraagt stevige tannine of hoog zuur om het vet te doorbreken; een "
            "magere kalfsfilet heeft die kracht niet nodig en wordt juist overweldigd door een zwaar "
            "getannineerde wijn. Bereidingswijze verschuift het profiel verder: grillen en roosteren "
            "voegen rooktonen toe die resoneren met gehoute, structuurrijke wijn; stoven en braiseren "
            "concentreren umami en vragen een rijpere, zachtere wijn met minder agressieve tannine. "
            "Wild — met zijn ferreuze, aardse karakter — matcht specifiek met wijnen die zelf "
            "aardse, dierlijke complexiteit tonen, zoals gerijpte Pinot Noir of Syrah.\n\n"
            "Saus en garnituur blijven het laatste correctiemiddel: een pepersaus verschuift de match "
            "richting specerijrijke wijn, een zoetzure jus vraagt juist meer fruit en minder strakke "
            "tannine om niet hard te proeven."
        ),
        "samenvatting": (
            "- Eiwit en vet bieden alternatieve bindingsplekken voor tannine — vandaar de zachtere perceptie\n"
            "- Vetgehalte bepaalt hoeveel tannine of zuur een gerecht nodig heeft\n"
            "- Grillen/roosteren matcht met gehoute wijn; stoven/braiseren vraagt rijpere, zachtere wijn\n"
            "- Wild matcht met aardse, dierlijke complexiteit zoals gerijpte Pinot Noir of Syrah\n"
            "- Saus is het laatste correctiemiddel: specerij of zoetzuur verschuift de wijnkeuze"
        ),
        "pro_insight": (
            "Vraag bij vleespairing altijd naar de bereidingswijze vóór je het vleestype noemt — "
            "gegrild versus gestoofd verandert het advies vaak sterker dan rund versus lam."
        ),
        "kernbegrippen": [
            "eiwit-tannine-binding",
            "marmering",
            "bereidingswijze",
            "wildkarakter",
            "structuurmatch",
        ],
        "food_pairing": fp(
            "Geroosterde ribeye (hoog vetgehalte) bij een jonge Cabernet Sauvignon met stevige tannine.",
            "Vet en eiwit binden de tannine, waardoor de wijn zachter aanvoelt en het vlees fris blijft door het zuur.",
            "Een delicate, lichte Pinot Noir bij hetzelfde stuk vlees — de wijn wordt volledig overschaduwd door het vet.",
        ),
        "reflectievraag": (
            "Bij welk vleesgerecht op je kaart bepaalt de bereidingswijze — niet het vleestype — "
            "jouw uiteindelijke wijnadvies, en waarom?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom vragen stoofgerechten doorgaans om een rijpere, zachtere wijn dan gegrild vlees?\n\n"
                "A. Omdat stoven umami concentreert en agressieve tannine dan minder goed past ✅  \n"
                "B. Omdat stoofvlees geen eiwit bevat  \n"
                "C. Omdat stoven het vetgehalte verlaagt tot nul  \n"
                "D. Omdat gegrild vlees altijd magerder is"
            ),
        },
    },
    38: {
        "theorie": (
            "Systematisch blindproeven van witte wijn volgt een vaste analyseketen: visueel "
            "(helderheid, intensiteit, kleurtint als indicatie van leeftijd, houtcontact of druif), "
            "neus (intensiteit en type primair fruit, secundaire gistings- of houttonen zoals "
            "vanille en toast, tertiaire ontwikkeling zoals honing of petrol bij oude Riesling), en "
            "mond (zuur als klimaatindicator, body/alcohol als rijpheidsindicator, lengte als "
            "kwaliteitsindicator). Pas na deze volledige keten formuleer je een hypothese met "
            "expliciete redenering — niet andersom.\n\n"
            "Klassieke verwarringsparen trainen specialistisch onderscheid: ongehoute Chardonnay "
            "versus Chablis (beide appel/citrus, maar Chablis toont meer strakke mineraliteit en "
            "hogere zuren door het koelere klimaat en de Kimmeridgien-bodem); Riesling versus "
            "Albariño (beide hoog zuur, maar Riesling toont vaker bloemig/petrol-potentieel, "
            "Albariño meer zilte, kustgebonden tonen); gerijpte witte Bourgogne versus witte Rioja "
            "(beide oxidatief geneigd door houtcontact, maar de zuurstructuur en het type hout "
            "verschillen herkenbaar).\n\n"
            "De gouden regel: structuur eerst, label laatst. Wie te snel naar een druif of regio "
            "springt vóór de structuuranalyse compleet is, raadt vaker fout dan wie de volledige "
            "keten doorloopt."
        ),
        "samenvatting": (
            "- Vaste analyseketen: visueel → neus (primair/secundair/tertiair) → mond → hypothese\n"
            "- Zuur wijst op klimaat, body/alcohol op rijpheid, lengte op kwaliteit\n"
            "- Klassieke verwarringsparen: Chardonnay/Chablis, Riesling/Albariño, Bourgogne/Rioja wit\n"
            "- Structuur eerst, label laatst — vroegtijdig raden verlaagt nauwkeurigheid\n"
            "- Een hypothese moet expliciet beargumenteerd worden, niet geraden"
        ),
        "pro_insight": (
            "Leg na elke blindronde je topfout vast in één zin ('te snel naar druif, te weinig naar "
            "zuurstructuur'). Dat versnelt leren meer dan tien perfecte proeven zonder reflectie."
        ),
        "kernbegrippen": [
            "systematische deductie",
            "primair-secundair-tertiair",
            "structuur-eerst-principe",
            "variëteitsverwarring",
            "kwaliteitsconclusie",
        ],
        "food_pairing": fp(
            "Blindproef-context: geen pairing — focus op systematische deductie.",
            "Voedsel zou de zuiverheid van het analyseproces vervuilen.",
            "Elke vorm van food tijdens de blindronde zelf.",
        ),
        "reflectievraag": (
            "Bij je laatste blindproef: welke stap in de keten (visueel, neus of mond) sloeg je "
            "onbewust over vóór je naar een conclusie sprong?"
        ),
    },
    39: {
        "theorie": (
            "Bij rode wijn leidt structuur sneller naar een correcte hypothese dan aroma alleen. "
            "Kleurdiepte en -tint geven een eerste indicatie van leeftijd en druif (dunschillige "
            "rassen zoals Pinot Noir en Nebbiolo blijven lichter van kleur, ook bij volle "
            "concentratie). Tanninekwaliteit — fijnkorrelig en zijdezacht versus grof en drogend — "
            "wijst vaak sterker op druif en herkomst dan kleur. Alcoholperceptie (warmte in de "
            "afdronk) wijst op klimaat en rijpheid; houtintegratie (toast, vanille, kruidigheid) "
            "wijst op winemaking-keuzes.\n\n"
            "Het klassieke verwarringspaar Pinot Noir versus Nebbiolo illustreert dit goed: beide "
            "zijn licht van kleur met hoge zuren, maar Nebbiolo toont aanzienlijk hogere, grovere "
            "tannine en kenmerkende teer- en rozentonen — een onderscheid dat je via structuur "
            "sneller maakt dan via kleur alleen. Cabernet Sauvignon versus Syrah is een ander "
            "klassiek paar: beide vol van body, maar Cabernet toont meer cassis, ceder en strakke "
            "tannine, Syrah meer peper, gerookt vlees en violet.\n\n"
            "Een derde valkuil is leeftijd verwarren met stijl: tertiaire ontwikkeling (leder, "
            "tabak, gedroogd fruit) kan zowel op een oude wijn als op een bewust oxidatieve "
            "winemaking-stijl wijzen — vraag jezelf altijd af of het kleurintensiteit én tanninegrip "
            "bevestigen vóór je 'oud' concludeert."
        ),
        "samenvatting": (
            "- Tanninekwaliteit (fijn versus grof) wijst vaak sterker op druif dan kleur alleen\n"
            "- Alcoholperceptie wijst op klimaat/rijpheid; houtintegratie op winemaking-keuzes\n"
            "- Pinot Noir versus Nebbiolo: beide licht en zuurrijk, maar tannine en aromatiek verschillen sterk\n"
            "- Cabernet Sauvignon versus Syrah: cassis/ceder versus peper/gerookt vlees\n"
            "- Verwar tertiaire ontwikkeling niet automatisch met hoge leeftijd"
        ),
        "pro_insight": (
            "Bij twijfel tussen twee verwante druiven: vertrouw eerst op tanninekorrel (fijn versus "
            "grof) en pas daarna op aroma — structuur bedriegt minder snel dan een vluchtige "
            "geurindruk."
        ),
        "kernbegrippen": [
            "tanninekwaliteit",
            "kleurdiepte",
            "alcoholperceptie",
            "houtintegratie",
            "variant-hypothese",
        ],
        "food_pairing": fp(
            "Blindproef-context: geen pairing — focus op structuuranalyse.",
            "Zuiver proeven zonder voedselinvloed is hier het doel.",
            "Elke vorm van food tijdens deze blindronde.",
        ),
        "reflectievraag": (
            "Welk structuurelement — tanninekorrel, kleurdiepte of alcoholwarmte — gaf bij jouw "
            "laatste rode blindproef de doorslag, en had je dat vóóraf verwacht?"
        ),
    },
    40: {
        "theorie": (
            "Dit Master-examen integreert de volledige Wine Foundation Track: fundament, productie, "
            "proeftechniek, structuur, druivenrassen, klimaat & terroir, service, pairing en "
            "blindanalyse. Drie examenonderdelen toetsen elk een andere vaardigheid: theorie toetst "
            "kennis van mechanismen, blindproeven toetst sensorische methode, en pairingadvies toetst "
            "professioneel redeneren onder druk.\n\n"
            "Succesvolle aanpak vraagt een vast proefprotocol (visueel → neus → mond → structuur → "
            "conclusie), expliciete hypotheses met argumentatie in plaats van geraden antwoorden, "
            "servicebewustzijn (temperatuur- en glaskeuzes die je in module 7 leerde) en "
            "pairingredenering vanuit mechanismen — zuur, tannine, vet, zout, suiker — in plaats van "
            "het opnoemen van bekende combinaties uit het geheugen.\n\n"
            "Fouten clusteren rond drie patronen: haast (te snel naar een druifconclusie springen "
            "vóór de structuuranalyse compleet is), verkeerde temperatuur- of glasaannames bij "
            "service-vragen, en pairingadvies dat traditie citeert ('dat hoort zo') zonder het "
            "onderliggende mechanisme te benoemen. Bereid je voor met twee blinde sets per week en "
            "minstens één schriftelijke pairing-case — dat dekt het grootste deel van het "
            "examenpatroon."
        ),
        "samenvatting": (
            "- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)\n"
            "- Vast protocol en expliciete hypotheses verslaan geraden antwoorden\n"
            "- Servicebewustzijn (temperatuur, glas) en pairingmechanismen tellen net zo zwaar als kennis\n"
            "- Veelvoorkomende fouten: haast, verkeerde temperatuuraannames, traditie zonder mechanisme\n"
            "- Twee blinde sets per week plus één schriftelijke pairing-case dekt het examenpatroon"
        ),
        "pro_insight": (
            "Lees examenvragen als servicecases: wat zou je schenken vrijdagavond om 20:00 bij deze "
            "gast en dit gerecht — en waarom precies dat mechanisme, niet die traditie?"
        ),
        "kernbegrippen": [
            "integratie",
            "examenprotocol",
            "advieslogica",
            "structuuranalyse",
            "servicebewustzijn",
        ],
        "food_pairing": fp(
            "Examenonderdeel pairing: kies per gerecht een stijl op basis van zuur, tannine, vet, zout en intensiteit.",
            "Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.",
            "Eén wijnstijl voor alle examen-gerechten zonder onderbouwing per mechanisme.",
        ),
        "reflectievraag": (
            "Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste schakel, en "
            "welke ene wekelijkse routine zou dat het snelst verbeteren?"
        ),
    },
}
