"""Bio Track V2 — Gold Master data (lessons 1-23)."""
from __future__ import annotations

import re

TERMINOLOGY_REPLACEMENTS = [
    (r"\broot day\b", "Worteldag"),
    (r"\bleaf day\b", "Bladdag"),
    (r"\bflower day\b", "Bloemdag"),
    (r"\bfruit day\b", "Vruchtdag"),
    (r"\bjij\b", "je"),
    (r"\bJouw\b", "Je"),
    (r"\bjouw\b", "je"),
    (r"\bDynamic vs Strategic\b", "Dynamisch versus strategisch advies"),
]

_CITE_ARTIFACT = r"\s*:contentReference\[oaicite:\d+\]\{index=\d+\}\.?"


def fix_artifacts(text, lesson_num=None):
    if not text:
        return ""
    text = re.sub(_CITE_ARTIFACT, "", text)
    text = re.sub(r"contentReference\[oaicite:\d+\]\{index=\d+\}", "", text)
    text = re.sub(r"\bTODO\b|\bFIXME\b", "", text, flags=re.I)
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = re.sub(r" {2,}", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    if lesson_num == 20:
        text = text.replace("Dynamic vs Strategic", "Dynamisch versus strategisch advies")
    return text.strip()


def _dm(beste, waarom, wachten):
    return (
        f"### Beste moment\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Wanneer wachten slimmer is\n\n{wachten}"
    )


def merge_part2():
    from bio_gold_master_data_part2 import apply_part2

    apply_part2()


MODULE_GOALS: dict[int, str] = {
    1: (
        "Je bouwt een besliskader voor biodynamisch proeven: van oorsprong en dagtypen naar "
        "concrete servicekeuzes met taal die professioneel uitlegbaar blijft."
    ),
    2: (
        "Je vertaalt kosmische ritmes naar operationele proefdiscipline, zodat observaties "
        "herhaalbaar worden in training, kaartadvies en evaluatie."
    ),
    3: (
        "Je koppelt elk dagtype aan smaakverwachting, foutmarge en risicobeheer in "
        "blindproeven, aankoop en tafeladvies."
    ),
    4: (
        "Je gebruikt elementen, weer en kalendersignalen als beslisintelligentie voor "
        "timing, niet als absoluut voorschrift."
    ),
    5: (
        "Je leert waarom professionals biodynamische data inzetten als extra laag naast "
        "klassieke oenologie, met focus op opbrengst in service."
    ),
    6: (
        "Je traint Worteldagen, Bladdagen, Bloemdagen en Vruchtdagen in echte "
        "wijncontexten zodat keuzes sneller en consistenter worden."
    ),
    7: (
        "Je leest de kalender op operationeel niveau: vensters, weersomslag en "
        "teamafstemming rond topflessen en kwetsbare service."
    ),
    8: (
        "Je integreert omgevingsfactoren zoals temperatuur, luchtdruk en vochtigheid in "
        "een scenario-aanpak voor proefplanning."
    ),
    9: (
        "Je sluit af met specialistische beslisintelligentie: dynamisch versus strategisch "
        "adviseren voor rode wijn, witte wijn en rose."
    ),
}


MODULE_KERNBEGRIPPEN: dict[int, list[str]] = {
    1: [
        "biodynamisch proeven",
        "proefcontext",
        "dagtype",
        "besliskader",
        "servicevenster",
        "kalenderdiscipline",
        "observatielog",
        "proefhypothese",
        "professionele calibratie",
        "keuzeverantwoording",
    ],
    2: [
        "Maria Thun",
        "zaaikalender",
        "ritmisch venster",
        "maanfase",
        "perigeum",
        "apogeum",
        "maanknoop",
        "proefritme",
        "herhaalbaarheid",
        "teamprotocol",
    ],
    3: [
        "Worteldag",
        "Bladdag",
        "Bloemdag",
        "Vruchtdag",
        "smaakas",
        "structuurfocus",
        "aromafocus",
        "contextvariatie",
        "besliszekerheid",
        "notitiekwaliteit",
    ],
    4: [
        "aarde-element",
        "water-element",
        "lucht-element",
        "vuur-element",
        "elementlogica",
        "sensorische mapping",
        "verwachtingsmanagement",
        "signaalsterkte",
        "randsignaal",
        "calibratiemoment",
    ],
    5: [
        "sommelierworkflow",
        "kaartadvies",
        "kelderplanning",
        "servicerisico",
        "topflesbeleid",
        "beslisboom",
        "biascontrole",
        "gastcontext",
        "flesrotatie",
        "teambriefing",
    ],
    6: [
        "Worteldag-signatuur",
        "aardse precisie",
        "zuurstructuur",
        "tanninekader",
        "temperatuurdiscipline",
        "karafmoment",
        "openingsvenster",
        "proefvergelijking",
        "flesselectie",
        "servicetoets",
    ],
    7: [
        "Bladdag-signatuur",
        "sapindruk",
        "romige textuur",
        "zuurspanning",
        "waterinvloed",
        "aromadiffusie",
        "tempo-aanpassing",
        "decanteringsgrens",
        "frisheidsbewaking",
        "adviesnuance",
    ],
    8: [
        "Bloemdag-signatuur",
        "geurintensiteit",
        "vluchtig aroma",
        "parfumlaag",
        "luchtgevoeligheid",
        "glaskeuze",
        "serveersnelheid",
        "presentatie-impact",
        "finessebehoud",
        "aromacaptatie",
    ],
    9: [
        "Vruchtdag-signatuur",
        "rijpingsbeleving",
        "mondvulling",
        "lengteperceptie",
        "vuurdynamiek",
        "beslisintelligentie",
        "strategisch advies",
        "dynamisch advies",
        "scenario-evaluatie",
        "prestatiemeting",
    ],
}


LEERDOELEN: dict[int, str] = {
    1: "Na deze les kun je biodynamisch proeven helder definiëren en plaatsen naast klassieke proefmethodes.",
    2: "Na deze les kun je de rol van Maria Thun uitleggen en vertalen naar bruikbare proefdiscipline.",
    3: "Na deze les kun je de vier dagtypen onderscheiden en koppelen aan concrete smaakverwachtingen.",
    4: "Na deze les kun je de vier elementen gebruiken als operationele taal in proefbeslissingen.",
    5: "Na deze les kun je onderbouwen waarom professionals biodynamische data inzetten als extra beslislaag.",
    6: "Na deze les kun je Worteldagen herkennen en toepassen in service, glaskeuze en timing.",
    7: "Na deze les kun je Bladdagen interpreteren en je advies afstemmen op textuur en sapbeleving.",
    8: "Na deze les kun je Bloemdagen inzetten voor aromatische precisie en presentatiewaarde.",
    9: "Na deze les kun je Vruchtdagen strategisch benutten voor expressie, verkoop en gastbeleving.",
    10: "Na deze les kun je een biodynamische kalender lezen en vertalen naar een weekplanning.",
    11: "Na deze les kun je een wijn op Worteldag analyseren met focus op structuur en lengte.",
    12: "Na deze les kun je een wijn op Bladdag beoordelen op sap, spanning en balans.",
    13: "Na deze les kun je een wijn op Bloemdag proeven met nadruk op aroma en finesse.",
    14: "Na deze les kun je een wijn op Vruchtdag evalueren op rijpheid, mondvulling en directheid.",
    15: "Na deze les kun je een gecontroleerd proefexperiment opzetten over meerdere dagtypen.",
    16: "Na deze les kun je temperatuur meenemen als beslisfactor bij biodynamische proefresultaten.",
    17: "Na deze les kun je luchtdruk verbinden aan waargenomen openheid of geslotenheid van wijn.",
    18: "Na deze les kun je luchtvochtigheid meenemen in textuur- en aromainterpretatie.",
    19: "Na deze les kun je weersomslag vertalen naar risicobeheer in service en topflesmomenten.",
    20: "Na deze les kun je dynamisch versus strategisch advies professioneel kiezen en uitleggen.",
    21: "Na deze les kun je biodynamische beslisintelligentie toepassen op rode wijn in servicecontext.",
    22: "Na deze les kun je biodynamische beslisintelligentie toepassen op witte wijn in servicecontext.",
    23: "Na deze les kun je biodynamische beslisintelligentie toepassen op rose met commerciële scherpte.",
}


THEORY_OVERRIDES: dict[int, str] = {
    1: (
        "Biodynamisch proeven vertrekt niet vanuit een claim dat natuurkrachten smaak lineair sturen, maar vanuit "
        "het idee dat context de waarneming mee kleurt. Veel proevers ervaren dat dezelfde wijn op verschillende "
        "dagen anders overkomt in structuur, geurprojectie en lengte. In professionele settings is die observatie "
        "waardevol zolang je haar systematisch noteert en naast klassieke indicatoren legt.\n\n"
        "In de praktijk werkt dit als hypothese: je verwacht op basis van dagtype een bepaalde nadruk en test die "
        "tegen wat je echt proeft. Daardoor vermijd je zowel blind geloof als blind cynisme. Je team bouwt stap voor "
        "stap een lokale dataset op waarin glaswerk, temperatuur en openingsduur mee geregistreerd worden.\n\n"
        "Het doel is beslisondersteuning niet dogma. Biodynamische taal helpt je betere vragen stellen: moet deze "
        "fles nu open, later op de avond, of morgen? Die verschuiving van gelijk willen hebben naar beter beslissen "
        "maakt het direct bruikbaar voor sommeliers en kelderteams."
    ),
    2: (
        "Maria Thun maakte de zaaikalender praktisch bruikbaar door ritmes te vertalen naar werkbare dagindelingen. "
        "Veel proevers ervaren haar model als een nuttig startpunt omdat het discipline brengt in planning en "
        "observatie, ook wanneer men verschilt in overtuiging over de oorzaken achter het effect.\n\n"
        "Voor een proefteam is dit vooral interessant als hypothese: je voorspelt een accent per dag en controleert "
        "die voorspelling in identieke omstandigheden. Door dezelfde fles op meerdere momenten te testen, zie je "
        "sneller of verschillen uit dagtype komen of uit servicevariabelen zoals temperatuur en zuurstof.\n\n"
        "Professioneel blijft het beslisondersteuning niet dogma. De kalender is een kader dat je helpt prioriteren, "
        "niet een vervanging van vakkennis. Juist die combinatie - klassieke oenologie plus ritmische planning - "
        "levert vaak de grootste kwaliteitswinst op."
    ),
    3: (
        "De vier dagtypen bieden een hanteerbare taal om proefverschillen te ordenen: aarde, water, lucht en vuur "
        "krijgen elk een eigen stijlverwachting. Veel proevers ervaren daardoor minder ruis in notities, omdat ze "
        "gericht kijken naar structuur, sap, aromatiek of fruitexpressie in plaats van losse indrukken op te sommen.\n\n"
        "Methodisch werkt dit als hypothese: je verwacht niet dat elk glas exact het leerboek volgt, maar je test of "
        "de dominante richting herkenbaar is. Zodra observaties afwijken, onderzoek je eerst praktische factoren "
        "zoals serving, flesconditie en vermoeidheid van het panel.\n\n"
        "Daarmee blijft het beslisondersteuning niet dogma. Het dagtype is een lens, geen oordeel. De professional "
        "gebruikt die lens om sneller te beslissen over openmoment, tafelinzet en communicatietoon richting gast."
    ),
    4: (
        "Elementen werken in biodynamische context als geheugensteun voor proefaccenten. Veel proevers ervaren dat "
        "deze symbolische taal verrassend effectief is in teamcommunicatie: iedereen begrijpt sneller wat bedoeld "
        "wordt met aardse grip, waterige soepelheid, luchtige geurdruk of vurige fruitdrive.\n\n"
        "Ook hier gebruik je het als hypothese. Je voorspelt een elementair profiel en checkt of het in jouw setting "
        "terugkomt. Waar dat niet gebeurt, leer je vaak minstens evenveel: afwijkingen tonen waar service, glas of "
        "temperatuur sterker doorwerkt dan het verwachte ritme.\n\n"
        "Voor specialistische teams is het beslisondersteuning niet dogma. Elementtaal maakt briefing en debriefing "
        "korter en scherper, maar de finale keuze blijft gebaseerd op het glas in het moment."
    ),
    5: (
        "Professionals gebruiken biodynamisch proeven zelden als ideologisch statement, maar als extra informatiekanaal. "
        "Veel proevers ervaren dat adviesgesprekken consistenter worden wanneer dagcontext expliciet wordt meegenomen, "
        "vooral bij topflessen waar timing grote impact heeft op gastbeleving.\n\n"
        "In operationele termen blijft dit een hypothese-gedreven methode. Je vergelijkt verwachte dagdynamiek met "
        "werkelijke tafelresultaten en stuurt bij op basis van servicefeedback, retourpercentages en gastreacties. "
        "Zo koppel je zachte signalen aan harde KPI's.\n\n"
        "Daarom noemen we het beslisondersteuning niet dogma. Het vergroot je beslisruimte: niet alleen welke fles "
        "past, maar ook wanneer die fles het meeste rendement geeft in kwaliteit en vertrouwen."
    ),
    6: (
        "Worteldagen worden vaak geassocieerd met strakkere structuur, aardse precisie en duidelijkere zuren. Veel "
        "proevers ervaren dat vooral bij wijnen met stevige ruggengraat: tanninecontouren lijken scherper en de "
        "wijn vraagt vaker om gedoseerde beluchting of iets hogere serveertemperatuur.\n\n"
        "Toch behandel je dit als hypothese en niet als gegarandeerd patroon. Wanneer een wijn onverwacht gesloten "
        "blijft, test je eerst praktische stappen: glas wisselen, temperatuurcorrectie, later opnieuw beoordelen. "
        "Die routine voorkomt overhaaste conclusies.\n\n"
        "In service is het beslisondersteuning niet dogma. Op een Worteldag kies je mogelijk eerder voor klassiekere "
        "structuurwijnen per glas, terwijl je fragiele topflessen nog even in reserve houdt."
    ),
    7: (
        "Bladdagen geven volgens veel professionals een zachtere, sappigere indruk met minder strakke contouren. Veel "
        "proevers ervaren dat zuren milder lijken en textuur prominenter wordt, wat zowel charmant als misleidend kan "
        "zijn bij wijnen die normaal op spanning geselecteerd worden.\n\n"
        "Gebruik dat effect als hypothese. Je checkt of sappigheid echt uit de wijn komt of vooral uit context, door "
        "parallel te vergelijken met notities van andere dagtypen en door temperatuurstabiele flights te gebruiken. "
        "Zo voorkom je dat je te vroeg spreekt van kwaliteitsverschil.\n\n"
        "De professionele conclusie blijft beslisondersteuning niet dogma. Op Bladdagen is advies vaak gastvriendelijk "
        "en toegankelijk, maar je bewaakt dat premiumkeuzes niet alleen op onmiddellijke soepelheid worden gemaakt."
    ),
    8: (
        "Bloemdagen staan bekend om verhoogde geurexpressie, finesse en florale precisie. Veel proevers ervaren dat "
        "aroma's sneller uit het glas komen en dat subtiele lagen gemakkelijker benoembaar worden, wat ideaal is voor "
        "educatieve proeverijen en tafelpresentaties met hoge verwachtingsdruk.\n\n"
        "Als hypothese betekent dit: je plant aromatisch kwetsbare flessen op zulke dagen en toetst of de meerwaarde "
        "echt merkbaar is in blind vergelijk. Wanneer het effect uitblijft, wijst dat vaak op teveel koeling of een "
        "ongeschikt glas in plaats van op een fout in het model.\n\n"
        "Daarmee blijft het beslisondersteuning niet dogma. Je benut mogelijke aromavoorsprong, maar je houdt altijd "
        "ruimte om op basis van actuele flesconditie van plan te veranderen."
    ),
    9: (
        "Vruchtdagen worden in de praktijk vaak ervaren als directer, rijper en commercieel toegankelijker. Veel "
        "proevers ervaren dat fruitdefinitie en mondvulling sneller overtuigen, waardoor gasten sneller tot aankoop "
        "of upgrade beslissen bij dezelfde wijnkaart.\n\n"
        "Ook dit behandel je als hypothese. Je test niet alleen smaak, maar ook gedrag: hoeveel tafelgesprekken "
        "converteren, welke flessen draaien sneller, en of retouren dalen. Dat maakt biodynamische observatie relevant "
        "voor businessbeslissingen zonder dat je causaliteit overschat.\n\n"
        "In de kern blijft het beslisondersteuning niet dogma. Vruchtdagen zijn kansdagen voor expressieve service, "
        "maar een topfles gaat alleen open als het volledige plaatje klopt: gast, moment en conditie."
    ),
    10: (
        "Een biodynamische kalender lezen is meer dan een icoon herkennen; het is tijdmanagement voor smaakrisico. "
        "Veel proevers ervaren dat planning rust geeft: je voorkomt ad-hoc openingen en kunt flights bewuster opbouwen "
        "rond dagvensters en weersignalen.\n\n"
        "Methodisch blijft de kalender een hypothese-instrument. Je plant verwachtingen, test uitkomsten en corrigeert "
        "achteraf in je logboek. Daardoor groeit een huisstijl in beslissen: minder improvisatie, meer reproduceerbare "
        "kwaliteit over teams en shifts heen.\n\n"
        "Zo blijft het beslisondersteuning niet dogma. De kalender dicteert niet, maar prioriteert: welke fles nu, "
        "welke later, en welke beter bewaren voor een gunstiger venster."
    ),
    11: (
        "Wijn op Worteldag kan in veel settings strakker en lineairder tonen, met nadruk op kernstructuur. Veel "
        "proevers ervaren dat vooral zuren en tannine duidelijker gearticuleerd zijn, waardoor technische beoordeling "
        "soms gemakkelijker wordt dan op meer aromatische dagen.\n\n"
        "Behandel die waarneming als hypothese. Laat dezelfde wijn gecontroleerd terugkomen op een ander dagtype en "
        "vergelijk alleen vaste parameters. Zo zie je of je conclusie werkelijk uit het ritme komt of uit servicefouten "
        "zoals te koude inschenking.\n\n"
        "In professioneel gebruik blijft dit beslisondersteuning niet dogma. Worteldag is vaak geschikt voor "
        "structuurgerichte training en serieuze kelderselectie, maar niet automatisch voor elke tafel."
    ),
    12: (
        "Op Bladdag lijkt wijn voor veel panelleden ronder en direct drinkbaar, met nadruk op sap in plaats van ruggengraat. "
        "Veel proevers ervaren daardoor een vriendelijkere eerste indruk, vooral bij witte wijn en lichte rode stijlen.\n\n"
        "Als hypothese test je dit met identieke schenkroutine en strakke temperatuurcontrole. Wanneer een wijn te vlak "
        "wordt ervaren, kan dat een signaal zijn om glaswerk of serveermoment aan te passen in plaats van de wijn af te "
        "schrijven.\n\n"
        "De professionele lijn blijft beslisondersteuning niet dogma. Bladdag helpt bij gastgerichte toegankelijkheid, "
        "maar je bewaakt dat selectie en prijspositionering analytisch verantwoord blijven."
    ),
    13: (
        "Bloemdag-proeven draait om aromatische leesbaarheid: neuslagen openen vaak sneller en preciezer. Veel proevers "
        "ervaren dat florale en kruidige tonen beter te scheiden zijn, wat nuttig is in opleiding en in high-touch service.\n\n"
        "Ook dit gebruik je als hypothese. Je controleert of aromavoordeel standhoudt over meerdere glazen en of panelleden "
        "consistent dezelfde descriptors gebruiken. Die discipline voorkomt dat suggestie wordt verward met waarneming.\n\n"
        "Daarmee blijft het beslisondersteuning niet dogma. Bloemdagen zijn ideale etalagemomenten voor finessewijnen, "
        "maar finale keuzes blijven afhankelijk van actuele flesprestatie."
    ),
    14: (
        "Vruchtdag laat veel wijnen opener en meer onmiddellijk overtuigend overkomen, vooral in het middenpalet. Veel "
        "proevers ervaren dat fruitlagen beter verbonden lijken met textuur, waardoor de wijn toegankelijker wordt voor "
        "niet-technische gasten.\n\n"
        "Gebruik dit als hypothese door verkoopdata en proefnotities te combineren. Als fruitexpressie hoog is maar "
        "lengte kort blijft, kan een kortere beluchting of aangepaste serveertemperatuur betere balans geven.\n\n"
        "Operationeel blijft het beslisondersteuning niet dogma. Vruchtdag kan een sterk commercieel venster zijn, "
        "maar je vermijdt automatische aanbevelingen zonder contextcheck per tafel."
    ),
    15: (
        "Een proefexperiment over meerdere dagtypen maakt impliciete aannames zichtbaar. Veel proevers ervaren dat hun "
        "eigen bias pas opvalt zodra dezelfde wijn in een vast protocol op verschillende momenten wordt geproefd.\n\n"
        "De kern is werken als hypothese: vooraf voorspellen, achteraf toetsen, en afwijkingen verklaren. Door identieke "
        "flesconditie, glaswerk en volgorde te borgen, verhoog je de bewijskracht van je observaties aanzienlijk.\n\n"
        "In professionele teams is dit beslisondersteuning niet dogma. Het experiment levert geen universele waarheid, "
        "wel een robuuste beslisbasis voor jouw kelder, jouw kaart en jouw gasten."
    ),
    16: (
        "Temperatuur is een sterke modulator van biodynamische indrukken en kan dagtype-signalen versterken of maskeren. "
        "Veel proevers ervaren dat te koude service verschillen tussen dagtypen afvlakt, terwijl te warme service fruit "
        "overschreeuwt en structuur diffuus maakt.\n\n"
        "Behandel dit als hypothese door in kleine stappen te werken, bijvoorbeeld per halve graad. Je test hoe hetzelfde "
        "glas evolueert en noteert waar balans, aromadetail en lengte optimaal samenkomen voor het gekozen dagvenster.\n\n"
        "Zo blijft het beslisondersteuning niet dogma. Temperatuurcorrectie is vaak de snelste professionele hefboom om "
        "een middelmatige indruk om te zetten in overtuigende service."
    ),
    17: (
        "Luchtdruk wordt door ervaren proefteams vaak genoemd bij plotselinge verschillen in openheid en precisie. Veel "
        "proevers ervaren op lage drukdagen meer diffusie in aroma en minder strakke contouren, al varieert dit per wijnstijl.\n\n"
        "Gebruik luchtdruk als hypothesevariabele in je logboek. Combineer kalenderdag, druktrend en proefuitkomst, zodat "
        "je na verloop van tijd ziet wanneer extra beluchting of juist voorzichtig openen het beste werkt.\n\n"
        "Daarmee blijft het beslisondersteuning niet dogma. Luchtdruk is een richtinggevend signaal, geen excuus voor "
        "zwakke service: techniek en timing blijven doorslaggevend."
    ),
    18: (
        "Luchtvochtigheid kan subtiel meespelen in hoe textuur en geurintensiteit worden beleefd. Veel proevers ervaren "
        "bij hoge vochtigheid een zachtere mondindruk, terwijl droge lucht soms scherpere contouren en snellere aromaverlies "
        "laat zien in warme serviceomgevingen.\n\n"
        "Professioneel behandel je dit als hypothese met praktische metingen. Door vochtigheid naast temperatuur en dagtype "
        "te registreren, kun je verklaren waarom dezelfde wijn niet elke avond identiek presteert in glas.\n\n"
        "De werkhouding blijft beslisondersteuning niet dogma. Vochtigheid helpt je anticiperen, maar je beslissing volgt "
        "altijd uit actuele waarneming en niet uit een enkel getal."
    ),
    19: (
        "Weersomslag brengt vaak onrust in proefperceptie: wat gisteren open was, kan vandaag geremd lijken. Veel proevers "
        "ervaren rond frontwisselingen grotere spreiding in panelnotities, vooral bij aromatisch gevoelige wijnen.\n\n"
        "Gebruik dit als hypothese voor risicobeheer. Je maakt vooraf een A-plan en B-plan: welke fles kan veilig open, "
        "welke houd je achter de hand, en op welk moment herproef je voordat je aan tafel adviseert.\n\n"
        "Zo blijft het beslisondersteuning niet dogma. Weersomslag vraagt om scenario-denken en rustige communicatie, "
        "niet om absolute claims richting gast of team."
    ),
    20: (
        "Dynamisch adviseren betekent inspelen op het huidige glas; strategisch adviseren betekent sturen op doel over tijd. "
        "Veel proevers ervaren dat beide nodig zijn: het ene voor directe tafelkwaliteit, het andere voor voorraad, marge "
        "en topflesplanning over weken of maanden.\n\n"
        "In methodiek werkt dit als hypothese-gestuurd beslisontwerp. Je test of dagtype en omgevingssignalen vandaag "
        "voldoende sterk zijn voor een premium opening, en je weegt tegelijk de strategische consequenties voor komende "
        "servicevensters.\n\n"
        "De professionele standaard blijft beslisondersteuning niet dogma. Dynamisch versus strategisch advies is geen "
        "kampkeuze maar een kader om op het juiste moment de juiste verantwoordelijkheid te nemen."
    ),
    21: (
        "Rode wijn reageert vaak duidelijk op dagcontext omdat tannine, zuur en fruitbalans sterk meespelen in beleving. "
        "Veel proevers ervaren op structuurgerichte dagen meer definitie, terwijl op expressieve dagen vooral middenpalet "
        "en aromatische charme sneller overtuigen.\n\n"
        "Gebruik deze observatie als hypothese door rode wijnen in stijlclusters te testen: strak klassiek, rijp modern "
        "en elegant koelklimaat. Zo zie je per cluster wanneer biodynamische timing echt voordeel oplevert in service.\n\n"
        "Voor de professional blijft het beslisondersteuning niet dogma. De keuze om een toprode te openen rust op glas, "
        "gastprofiel en operationele context, niet op kalenderinformatie alleen."
    ),
    22: (
        "Witte wijn toont daginvloed vaak in aromatische projectie, zuurbeleving en textuurbreedte. Veel proevers ervaren "
        "dat frisse stijlen op sommige dagen strakker lijken, terwijl rijpere stijlen juist meer gelaagdheid laten zien.\n\n"
        "Als hypothese test je wit in gecontroleerde temperatuurbanden en met passend glaswerk. Kleine afwijkingen in "
        "koeling kunnen anders ten onrechte als dagtype-effect worden gelezen, wat advieskwaliteit direct schaadt.\n\n"
        "Daarom blijft het beslisondersteuning niet dogma. Biodynamische signalen helpen prioriteren, maar de finale "
        "servicelijn volgt uit precisie in techniek en actuele proefprestatie."
    ),
    23: (
        "Rose is een uitstekende stresstest voor biodynamische besluitvorming omdat de categorie snel reageert op context "
        "en presentatie. Veel proevers ervaren dat fruitlift, bitters en zuren opvallend kunnen kantelen per dagvenster, "
        "vooral bij gastronomische rose in plaats van puur terrasstijl.\n\n"
        "Benader dit als hypothese met scenariovergelijking: aperitiefrose, gastronomische rose en houtgerijpte rose "
        "krijgen elk een eigen besliskader rond temperatuur, glas en timing. Zo voorkom je dat alle rose onder een "
        "enkele serviceformule valt.\n\n"
        "Ook hier geldt beslisondersteuning niet dogma. De beste keuze combineert dagtype, weer en gastdoel in een "
        "professionele afweging die uitlegbaar blijft aan team en tafel."
    ),
}


DRINKMOMENT: dict[int, str] = {
    1: _dm(
        "Plan deze les als openingsbriefing voor een nieuwe proefweek, liefst voor de eerste service.",
        "Je zet direct een gedeeld vocabulaire neer en voorkomt dat teamleden door elkaar praten over context en kwaliteit.",
        "Wacht als het team geen tijd heeft voor notitieprotocol; zonder discipline verlies je de meerwaarde van het kader.",
    ),
    2: _dm(
        "Gebruik deze les op een rustige prep-middag met tijd voor logboekinrichting.",
        "De inhoud wordt sterker als je theorie meteen vertaalt naar jullie eigen operationele ritme.",
        "Wacht op piekdagen zonder focus, want losse kennis zonder toepassing verdwijnt snel uit de service.",
    ),
    3: _dm(
        "Zet deze les in vlak voor een flight met verschillende stijlen om dagtypen tastbaar te maken.",
        "Directe vergelijking scherpt herkenning en versnelt beslissingen bij kaartadvies.",
        "Wacht wanneer je slechts een enkele referentiewijn hebt; dan is het onderscheid te dun voor betrouwbare conclusies.",
    ),
    4: _dm(
        "Plan deze les als teamkalibratie voorafgaand aan premium avonden.",
        "Elementtaal maakt communicatie compact en bruikbaar onder tijdsdruk in de zaal.",
        "Wacht als nieuwe teamleden nog basisproefstructuur missen; bouw eerst observatiehygiëne op.",
    ),
    5: _dm(
        "Gebruik deze les in een managementmoment met sommelier en floor lead samen.",
        "Je koppelt kwaliteitsambitie direct aan commerciële en operationele keuzes.",
        "Wacht wanneer alleen theorie besproken kan worden zonder echte servicecases; dan blijft het abstract.",
    ),
    6: _dm(
        "Kies een avond met structuurgedreven rode wijnen per glas.",
        "Worteldag-analyse helpt bij nauwkeurig decanteren en voorkomt te vroege topfles-openingen.",
        "Wacht bij hittegolfservice met instabiele koelketen; temperatuurfouten maskeren de les.",
    ),
    7: _dm(
        "Plan deze les op een dag met veel gasten die toegankelijk advies vragen.",
        "Bladdag-logica ondersteunt soepele aanbevelingen zonder technische overbelasting.",
        "Wacht als de kaart tijdelijk extreem tanninerijk is; dan kan de waarneming scheef trekken.",
    ),
    8: _dm(
        "Gebruik deze les voor aroma-gedreven flights en storytelling aan tafel.",
        "Bloemdag-focus versterkt geurpresentatie en verhoogt de beleving bij premium labels.",
        "Wacht bij drukke banquetingservice waar snelheid boven precisie gaat.",
    ),
    9: _dm(
        "Zet deze les in op avonden met veel by-the-glass rotatie.",
        "Vruchtdag-benadering ondersteunt snelle aankoopbeslissingen en hogere tevredenheid.",
        "Wacht als het team onvoldoende herproeft tijdens de shift; dan wordt advies te statisch.",
    ),
    10: _dm(
        "Plan dit vlak voor rooster- en kelderplanning van de komende week.",
        "Je vertaalt kalenderinformatie direct naar praktische keuzes per servicevenster.",
        "Wacht wanneer planning al vastligt zonder flexibiliteit; dan kun je inzichten niet implementeren.",
    ),
    11: _dm(
        "Gebruik deze les in een technische proefsessie met rode referentiewijnen.",
        "Worteldagtraining scherpt analyse op zuur, tannine en lijn in de afdronk.",
        "Wacht als het panel vermoeid is; structurele nuances vragen frisse concentratie.",
    ),
    12: _dm(
        "Plan deze les voor lunchservicevoorbereiding met lichte tot medium stijlen.",
        "Bladdag-evaluatie helpt om gastvriendelijke keuzes te maken zonder kwaliteit te verliezen.",
        "Wacht bij groot temperatuurverloop in de ruimte; textuurindruk wordt dan onbetrouwbaar.",
    ),
    13: _dm(
        "Zet deze les in voorafgaand aan een fine-dining service met aromatische focus.",
        "Bloemdag geeft vaak meer detail in de neus, ideaal voor verfijnde tafeluitleg.",
        "Wacht wanneer glasvoorraad suboptimaal is; aromawinst valt weg bij verkeerd glas.",
    ),
    14: _dm(
        "Gebruik deze les op verkoopgerichte avonden met een dynamische wijnkaart.",
        "Vruchtdag-assessment ondersteunt overtuigende suggesties per glas en per fles.",
        "Wacht als je geen ruimte hebt voor herproefmomenten gedurende de service.",
    ),
    15: _dm(
        "Plan het experiment verspreid over meerdere dagen met identieke condities.",
        "Alleen gespreide meting maakt verschillen zichtbaar en verdedigbaar.",
        "Wacht als je geen consistente fles- of glasopstelling kunt garanderen.",
    ),
    16: _dm(
        "Gebruik deze les bij seizoenswissel, wanneer temperatuurmanagement extra kritisch is.",
        "Je ziet direct hoe kleine gradenverschillen biodynamische signalen versterken of afzwakken.",
        "Wacht als koelapparatuur onstabiel is; eerst techniek fixen, dan pas evalueren.",
    ),
    17: _dm(
        "Plan deze les op dagen met duidelijke druktrend in de weersverwachting.",
        "Koppeling tussen proefnotities en luchtdruk maakt servicebeslissingen voorspelbaarder.",
        "Wacht wanneer er geen betrouwbare drukdata beschikbaar is voor je logboek.",
    ),
    18: _dm(
        "Gebruik deze les in ruimtes met meetbare verschillen in luchtvochtigheid.",
        "Je leert om textuur- en geurwaarneming beter te duiden bij veranderende zaalcondities.",
        "Wacht als je geen hygrometerdata hebt; dan blijft interpretatie te speculatief.",
    ),
    19: _dm(
        "Plan deze les rond aangekondigde weersomslag met een A/B-flesplan.",
        "Scenario-denken voorkomt teleurstelling bij topflesmomenten en verhoogt teamrust.",
        "Wacht wanneer je geen alternatief assortiment achter de hand hebt.",
    ),
    20: _dm(
        "Gebruik deze les in de weekstart met sommelier, manager en kelderverantwoordelijke.",
        "Dynamisch versus strategisch advies wordt dan meteen gekoppeld aan voorraad en servicekansen.",
        "Wacht als alleen operationeel personeel aanwezig is zonder beslisbevoegdheid voor planning.",
    ),
    21: _dm(
        "Plan deze les voor een rode-wijnavond met mix van klassiek en modern profiel.",
        "Je oefent keuze-intelligentie per stijlcluster en verhoogt precisie bij advies.",
        "Wacht op avonden met uitsluitend eenvoudige huiswijnen; dan is leerrendement beperkt.",
    ),
    22: _dm(
        "Gebruik deze les bij menu's met meerdere witte wijnmomenten.",
        "Fijne verschillen in zuur, aroma en textuur worden direct relevant voor pairing en upsell.",
        "Wacht wanneer serveertemperaturen niet stabiel gehouden kunnen worden.",
    ),
    23: _dm(
        "Plan deze les op een dag met zowel aperitief- als gastronomische rose in rotatie.",
        "Je leert snel schakelen tussen stijlverwachting, gastdoel en margedoel.",
        "Wacht als de kaart slechts een enkel generiek rose-label bevat; vergelijkingswaarde ontbreekt.",
    ),
}


PRO_INSIGHTS: dict[int, str] = {
    1: "Een sterk biodynamisch gesprek start met grenzen benoemen: dit is een extra beslislaag, geen waarheidssysteem. Die transparantie vergroot gastvertrouwen.",
    2: "Laat nieuwe sommeliers eerst logdiscipline leren. Zonder consistente notities worden kalenderclaims snel ruis in plaats van waarde.",
    3: "Gebruik dagtypen als pre-shift checklist. Wie vooraf hypothesen benoemt, maakt tijdens service minder impulsbeslissingen.",
    4: "Elementtaal werkt uitstekend in teamcoaching omdat het snel blijft onder druk. Kort, concreet, direct toepasbaar.",
    5: "De grootste winst zit vaak niet in smaakverschil maar in timing: topflessen openen op het juiste venster verlaagt retourrisico.",
    6: "Op Worteldagen loont het om beluchting in kortere intervallen te testen; overdecanteren maakt structuurwijnen snel hard.",
    7: "Bladdagen zijn ideaal om twijfelgasten over de streep te trekken, maar bewaak marges: toegankelijkheid mag niet tot onderadvies leiden.",
    8: "Bloemdagen zijn uitstekende momenten voor glasupgrade-advies. Geurwinst is tastbaar en commercieel uitlegbaar.",
    9: "Vruchtdagen kunnen verkoop versnellen; monitor wel bias: snelle ja's betekenen niet automatisch betere langetermijnkeuze voor de gast.",
    10: "Een kalender is pas professioneel als hij gekoppeld is aan voorraadstatus, teambezetting en eventdrukte.",
    11: "Train op Worteldag met blind flights van vergelijkbare prijsniveaus; zo voorkom je labelbias in structuurbeoordeling.",
    12: "Op Bladdag wordt overschenken een risico: zachtere indruk kan teamleden verleiden tot te royale service.",
    13: "Gebruik Bloemdag voor topflespresentaties met hoge verwachtingswaarde; geurexpressie ondersteunt premium storytelling.",
    14: "Vruchtdag is vaak geschikt voor conversie aan tafel, maar zet een herproefalarm in om consistentie per fles te bewaken.",
    15: "Een goed experiment logt ook mislukkingen. Juist afwijkingen leveren de beste beslisregels voor toekomstige service op.",
    16: "Temperatuur is je snelste correctieknop. Professionele teams sturen eerst graden, dan pas narratief.",
    17: "Koppel luchtdruktrends aan open-tijden in je kelderlog. Na enkele weken ontstaat een bruikbare voorspelkaart voor topflessen.",
    18: "Bij hoge luchtvochtigheid helpt extra glasdiscipline: naschenken in vers glas houdt aromadefinitie beter overeind.",
    19: "Weersomslag vraagt dubbel voorraadplan. Houd altijd een veilige tweede keuze per prijspunt klaar.",
    20: "Dynamisch advies wint service vandaag; strategisch advies beschermt marge en reputatie morgen. Topteams beheersen beide.",
    21: "Rode topflessen vragen biascontrole: verwacht je grandeur, dan proef je die al snel. Laat altijd een kalibratiefles meelopen.",
    22: "Witte wijn wordt het meest verkeerd beoordeeld door temperatuurfouten. Controleer eerst de fles, dan pas de kalenderverklaring.",
    23: "Rose biedt een kans om specialistisch te adviseren zonder elitair te klinken: context, temperatuur en dagtype in drie zinnen.",
}


REFLECTIEVRAGEN: dict[int, str] = {
    1: "Welke beslissing nam je vorige week op gevoel, en hoe had een expliciet dagtypekader die keuze kunnen verbeteren?",
    2: "Waar in je huidige workflow ontbreekt ritme: bij openen, adviseren of evalueren, en wat verander je morgen concreet?",
    3: "Bij welke twee wijnen op je kaart verwacht je het grootste dagtypeverschil, en hoe ga je dat gecontroleerd testen?",
    4: "Wanneer gebruik jij te brede proefwoorden, en welk elementair vocabulaire maakt je feedback preciezer naar het team?",
    5: "Welke professionele KPI zou jij koppelen aan biodynamisch plannen: retouren, upsell, of gastwaardering, en waarom juist die?",
    6: "Noem een rode wijn die je op Worteldag wel zou openen en een die je juist zou uitstellen; welke signalen bepalen dat verschil?",
    7: "Wanneer maakt Bladdag een wijn aantrekkelijker voor tafelverkoop maar minder geschikt voor examenproeven?",
    8: "Welke aromatische stijl op je kaart verdient expliciet Bloemdag-inzet, en hoe communiceer je dat zonder absolute claims?",
    9: "Op welke manier kan Vruchtdag je verkoop helpen zonder dat je te vroeg naar de duurste fles stuurt?",
    10: "Waar in je weekplanning zit nu het grootste conflict tussen kalenderkans en personeelsrealiteit, en hoe los je dat op?",
    11: "Welke drie observaties noteer jij verplicht voordat je op Worteldag concludeert dat een wijn 'strak' is?",
    12: "Wanneer kan Bladdag-jeugdige charme je misleiden over bewaarpotentieel van een wijn?",
    13: "Wat is je protocol als panelleden op Bloemdag verschillende aroma's benoemen bij dezelfde wijn?",
    14: "Welke keuze maak je anders op Vruchtdag: glas, temperatuur of openingstijd, en wat is je bewijs?",
    15: "Welk onderdeel van je experiment dreigt bias te introduceren: volgorde, verwachting of paneldiscussie?",
    16: "Bij welke temperatuurstap zie je meestal de grootste kwaliteitswinst in jouw serviceomgeving?",
    17: "Hoe onderscheid je in je notities luchtdrukeffect van simpelweg onvoldoende beluchting?",
    18: "Welke aanpassing in zaalsetting zou je testen om vochtigheidseffecten op aroma te minimaliseren?",
    19: "Wat is je B-plan als weersomslag samenvalt met een gereserveerde topfles aan een belangrijke tafel?",
    20: "In welke situatie kies jij bewust voor strategisch nee zeggen tegen een opening die dynamisch aantrekkelijk lijkt?",
    21: "Welke rode wijn op je kaart vraagt de strengste calibratie tegen tannine-bias, en hoe organiseer je die?",
    22: "Welke witte stijl laat in jouw ervaring de grootste schijnverschillen zien door temperatuur in plaats van dagtype?",
    23: "Hoe bepaal je bij rose of je advies moet sturen op aperitiefsnelheid of op gastronomische diepgang?",
}


SUMMARIES: dict[int, list[str]] = {
    1: [
        "Biodynamisch proeven is een contextkader naast klassieke analyse.",
        "Daginvloed wordt professioneel getest, niet blind aangenomen.",
        "Notitiekwaliteit bepaalt of inzichten bruikbaar worden.",
        "Doel: betere timing en betere servicebeslissingen.",
    ],
    2: [
        "Maria Thun geeft ritme aan planning en observatie.",
        "Kalendergebruik start met discipline, niet met overtuiging.",
        "Herhaalbare tests maken teamkennis robuust.",
        "Operationele vertaling is belangrijker dan theorie alleen.",
    ],
    3: [
        "Vier dagtypen geven structuur aan proefverwachtingen.",
        "Elke verwachting wordt getoetst als hypothese.",
        "Afwijkingen zijn leermomenten, geen fouten.",
        "Dagtypen versnellen briefing en tafelkeuzes.",
    ],
    4: [
        "Elementtaal maakt proefcommunicatie compact.",
        "Aarde, water, lucht en vuur sturen observatiefocus.",
        "Symboliek is nuttig zolang waarneming leidend blijft.",
        "Teams winnen snelheid zonder analytische diepte te verliezen.",
    ],
    5: [
        "Professionals gebruiken biodynamiek als beslisintelligentie.",
        "De grootste winst zit vaak in timing van service.",
        "KPI-koppeling voorkomt vrijblijvend gebruik.",
        "Extra context verhoogt kwaliteit en gastvertrouwen.",
    ],
    6: [
        "Worteldag legt nadruk op structuur en precisie.",
        "Beluchting en temperatuur vragen extra aandacht.",
        "Strakke wijnen kunnen technisch helder presteren.",
        "Topfleskeuze blijft afhankelijk van actuele conditie.",
    ],
    7: [
        "Bladdag geeft vaak meer sap en soepelheid.",
        "Toegankelijkheid stijgt, maar selectie vraagt discipline.",
        "Textuur kan zuren tijdelijk minder scherp tonen.",
        "Advies blijft sterk met heldere contextcheck.",
    ],
    8: [
        "Bloemdag vergroot vaak aromatische leesbaarheid.",
        "Finessewijnen profiteren van dit servicevenster.",
        "Glaswerk en snelheid bepalen het echte effect.",
        "Aromavoordeel is bruikbaar maar niet gegarandeerd.",
    ],
    9: [
        "Vruchtdag voelt vaak direct en commercieel sterk.",
        "Fruitexpressie ondersteunt snelle gastbeslissingen.",
        "Monitor conversie met kwaliteitsbewaking tegelijk.",
        "Gebruik het venster zonder automatisme.",
    ],
    10: [
        "Kalender lezen is planning, geen bijgeloof.",
        "Dagvensters helpen prioriteren in opening en inzet.",
        "Weekrooster en kelderlog horen samen.",
        "Flexibiliteit maakt kalenderinformatie rendabel.",
    ],
    11: [
        "Worteldag-proeven traint technische scherpte.",
        "Structuurwoorden worden preciezer met vaste routine.",
        "Vergelijkingen over dagen verhogen bewijskracht.",
        "Servicebeslissingen verbeteren met stricte notities.",
    ],
    12: [
        "Bladdag legt nadruk op sap en ronding.",
        "Gastvriendelijkheid kan stijgen zonder kwaliteitsverlies.",
        "Temperatuurstabiliteit blijft cruciaal voor betrouwbare lezing.",
        "Toegankelijkheid mag geen onderadvies veroorzaken.",
    ],
    13: [
        "Bloemdag helpt bij aromatische differentiatie.",
        "Descriptoren worden bruikbaarder in teamtraining.",
        "Suggestiegevaar vraagt blind en dubbelcheck.",
        "Finessepresentatie krijgt extra impact aan tafel.",
    ],
    14: [
        "Vruchtdag ondersteunt direct overtuigende service.",
        "Fruit en mondvulling worden vaak prominenter ervaren.",
        "Herproeven tijdens de shift blijft noodzakelijk.",
        "Commerciele winst vraagt tegelijk analytische controle.",
    ],
    15: [
        "Experimenten maken verborgen bias zichtbaar.",
        "Identieke condities zijn essentieel voor vergelijkbaarheid.",
        "Vooraf voorspellen verhoogt leerwaarde van resultaten.",
        "Lokale data is waardevoller dan algemene claims.",
    ],
    16: [
        "Temperatuur kan dagtype-effecten versterken of maskeren.",
        "Kleine correcties geven vaak grote kwaliteitswinst.",
        "Meet en noteer per halve graad voor precisie.",
        "Techniek eerst, interpretatie daarna.",
    ],
    17: [
        "Luchtdruk is een bruikbaar contextsignaal.",
        "Druktrend koppelen aan openmoment verbetert planning.",
        "Signaalsterkte verschilt per stijl en situatie.",
        "Geen drukdata betekent voorzichtiger conclusies.",
    ],
    18: [
        "Luchtvochtigheid kan textuurbeleving mee kleuren.",
        "Meetwaarden helpen speculatie te vermijden.",
        "Zaalcondities horen in het proeflogboek.",
        "Vochtigheid is richtinggevend, niet beslissend op zichzelf.",
    ],
    19: [
        "Weersomslag verhoogt perceptierisico in service.",
        "Scenario A/B voorkomt stress bij topflessen.",
        "Teambriefing moet expliciet alternatieven bevatten.",
        "Rustige communicatie voorkomt overselling en teleurstelling.",
    ],
    20: [
        "Dynamisch advies reageert op het moment.",
        "Strategisch advies beschermt voorraad en reputatie.",
        "Topteams combineren beide perspectieven bewust.",
        "Keuzekader werkt beter dan ideologische voorkeur.",
    ],
    21: [
        "Rode wijn toont dagcontext vaak duidelijk.",
        "Stijlclusters helpen gerichte beslissingen nemen.",
        "Biascontrole blijft essentieel bij toprode labels.",
        "Opening gebeurt pas na contextcheck.",
    ],
    22: [
        "Witte wijn vraagt precieze temperatuurdiscipline.",
        "Daginvloed toont zich vaak in aroma en zuur.",
        "Glaswerk en koeling bepalen interpretatiekwaliteit.",
        "Kalender is nuttig, techniek blijft fundament.",
    ],
    23: [
        "Rose is gevoelig voor context en presentatie.",
        "Aperitief- en gastronomische rose vragen ander kader.",
        "Dagtype helpt prioriteren van servicekeuzes.",
        "Professionele uitleg blijft compact en concreet.",
    ],
}


GOLD_KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["biodynamisch proeven", "dagtype", "proefhypothese", "servicevenster", "besliskader"],
    2: ["Maria Thun", "zaaikalender", "maanknoop", "ritmisch venster", "herhaalbaarheid"],
    3: ["Worteldag", "Bladdag", "Bloemdag", "Vruchtdag", "smaakas"],
    4: ["aarde-element", "water-element", "lucht-element", "vuur-element", "elementlogica"],
    5: ["sommelierworkflow", "kaartadvies", "kelderplanning", "biascontrole", "topflesbeleid"],
    6: ["aardse precisie", "zuurstructuur", "tanninekader", "openingsvenster", "servicetoets"],
    7: ["sapindruk", "romige textuur", "zuurspanning", "waterinvloed", "adviesnuance"],
    8: ["geurintensiteit", "vluchtig aroma", "parfumlaag", "finessebehoud", "aromacaptatie"],
    9: ["rijpingsbeleving", "mondvulling", "lengteperceptie", "vuurdynamiek", "scenario-evaluatie"],
    10: ["kalenderlezing", "tijdvenster", "weekplanning", "prioritering", "servicecapaciteit"],
    11: ["structuuranalyse", "zuurcontour", "tannineprojectie", "lineaire lengte", "technische calibratie"],
    12: ["sapbeleving", "ronding", "toegankelijkheid", "temperatuurbewaking", "textuurweging"],
    13: ["aromadifferentiatie", "descriptorprecisie", "finessepresentatie", "neusarchitectuur", "blindcontrole"],
    14: ["fruitdefinitie", "middenpalet", "directe expressie", "serviceconversie", "herproefmoment"],
    15: ["proefexperiment", "conditiecontrole", "biasdetectie", "vergelijkingsmatrix", "datagestuurd leren"],
    16: ["temperatuurstap", "serveercurve", "balanspunt", "koelketen", "correctieprotocol"],
    17: ["luchtdruktrend", "openheid", "aromadiffusie", "druklogboek", "timingbesluit"],
    18: ["luchtvochtigheid", "textuurwaarneming", "zaalconditie", "hygrometerdata", "interpretatiekader"],
    19: ["weersomslag", "risicobeheer", "A-plan", "B-plan", "topflesmoment"],
    20: ["dynamisch advies", "strategisch advies", "keuzekader", "verantwoordingslijn", "beslisintelligentie"],
    21: ["rode stijlcluster", "tanninebias", "decanteringskeuze", "structuurvenster", "openingsdiscipline"],
    22: ["witte precisie", "zuurbeleving", "aromaprojectie", "koelband", "glasselectie"],
    23: ["rose-scenario", "aperitiefkader", "gastronomisch kader", "presentatietiming", "contextadvies"],
}


QUIZ_PATCHES: dict[int, str] = {
    1: (
        "### Vraag 4\n\n"
        "Je team twijfelt of een topfles nu open moet. Welk eerste signaal gebruik je volgens de les?\n\n"
        "A. Alleen de prijs van de fles\n"
        "B. Dagtype plus actuele proefcheck ✅\n"
        "C. Alleen wat gisteren werkte\n"
        "D. Wat de drukste ober zegt\n\n"
        "### Vraag 5\n\n"
        "Een gast vraagt waarom je biodynamische context noemt. Wat is professioneel?\n\n"
        "A. Zeggen dat het altijd zo is\n"
        "B. Uitleggen dat het beslisondersteuning is, geen dogma ✅\n"
        "C. De vraag negeren\n"
        "D. Meteen een duurdere fles adviseren"
    ),
    2: (
        "### Vraag 4\n\n"
        "Je bouwt een nieuw teamprotocol. Welke stap hoort direct bij Maria Thun-werkstijl?\n\n"
        "A. Geen notities maken\n"
        "B. Vaste voorspelling en latere toetsing per dagtype ✅\n"
        "C. Alleen op geheugen vertrouwen\n"
        "D. Slechts een keer per maand proeven\n\n"
        "### Vraag 5\n\n"
        "Het weer is instabiel en de app toont Bladdag. Wat doe je eerst?\n\n"
        "A. Kalendersignaal combineren met proefcontrole ✅\n"
        "B. Alles annuleren\n"
        "C. Topflessen blind openen\n"
        "D. Temperatuur negeren"
    ),
    3: (
        "### Vraag 4\n\n"
        "Je app toont Vruchtdag maar de wijn oogt gesloten. Wat is de beste vervolgstap?\n\n"
        "A. Meteen afserveren zonder check\n"
        "B. Hypothese herzien en servicevariabelen testen ✅\n"
        "C. Dagtype verwijderen uit planning\n"
        "D. Alleen op etiketreputatie varen\n\n"
        "### Vraag 5\n\n"
        "Voor een topflesavond kies je welke aanpak?\n\n"
        "A. Een dagtype aannemen zonder herproef\n"
        "B. Dagtype als lens gebruiken en live valideren ✅\n"
        "C. Geen teambriefing doen\n"
        "D. Altijd dezelfde openingstijd hanteren"
    ),
    4: (
        "### Vraag 4\n\n"
        "In briefing zegt iemand 'lucht-element = altijd beter'. Wat corrigeer je?\n\n"
        "A. Dat elementtaal een werkhypothese blijft ✅\n"
        "B. Dat lucht geen rol kan spelen\n"
        "C. Dat alleen prijzen tellen\n"
        "D. Dat je zonder proeven beslist\n\n"
        "### Vraag 5\n\n"
        "Welke app-notitie helpt bij elementvergelijking over weken?\n\n"
        "A. Alleen scorecijfers\n"
        "B. Element + glas + temperatuur + uitkomst ✅\n"
        "C. Alleen weersverwachting\n"
        "D. Alleen gastnaam"
    ),
    5: (
        "### Vraag 4\n\n"
        "Een sommelier wil biodynamiek inzetten. Welke professionele KPI past het best?\n\n"
        "A. Alleen social media likes\n"
        "B. Retouren en conversie per servicevenster ✅\n"
        "C. Aantal lege dozen\n"
        "D. Muziekvolume in de zaal\n\n"
        "### Vraag 5\n\n"
        "Bij een mogelijke topfles-opening op app-signaal kies je eerst voor:\n\n"
        "A. Direct openen zonder herproef\n"
        "B. Contextcheck met gastdoel en flesconditie ✅\n"
        "C. Alleen margedoel\n"
        "D. Alleen weerbericht"
    ),
    6: (
        "### Vraag 4\n\n"
        "Op Worteldag lijkt een rode wijn hard. Welke stap is logisch?\n\n"
        "A. Temperatuur licht verhogen en opnieuw proeven ✅\n"
        "B. Meteen uit kaart halen\n"
        "C. Alleen karafduur verdubbelen\n"
        "D. Blind op app-score vertrouwen\n\n"
        "### Vraag 5\n\n"
        "Je wilt een topfles openen op Worteldag. Wat weegt het zwaarst?\n\n"
        "A. Alleen dagtype\n"
        "B. Dagtype plus actuele glasprestatie ✅\n"
        "C. Alleen gastbudget\n"
        "D. Alleen flesleeftijd"
    ),
    7: (
        "### Vraag 4\n\n"
        "App meldt Bladdag en je tafel wil iets direct drinkbaars. Beste keuze?\n\n"
        "A. Soepel profiel adviseren met heldere contextuitleg ✅\n"
        "B. Alleen de duurste optie pushen\n"
        "C. Geen vergelijking aanbieden\n"
        "D. Temperatuurcontrole overslaan\n\n"
        "### Vraag 5\n\n"
        "Wanneer wacht je op een topfles ondanks Bladdag?\n\n"
        "A. Als de fles nog gesloten en onevenwichtig toont ✅\n"
        "B. Als de gast interesse heeft\n"
        "C. Als de kaart nieuw is\n"
        "D. Als het weekend is"
    ),
    8: (
        "### Vraag 4\n\n"
        "Tijdens Bloemdag-service blijft aroma zwak. Wat test je eerst?\n\n"
        "A. Glasvorm en serveertemperatuur ✅\n"
        "B. Alleen prijsniveau\n"
        "C. Alleen etiketjaar\n"
        "D. Alleen menukaartvolgorde\n\n"
        "### Vraag 5\n\n"
        "Voor een topfles met parfumlaag kies je op app-signaal:\n\n"
        "A. Snelle opening zonder briefing\n"
        "B. Gecontroleerde opening met aromavalidatie ✅\n"
        "C. Geen decantering ooit\n"
        "D. Alleen verkoopdruk volgen"
    ),
    9: (
        "### Vraag 4\n\n"
        "Op Vruchtdag stijgt verkoop van rode wijn sterk. Wat bewaak je extra?\n\n"
        "A. Bias door te snelle positieve indruk ✅\n"
        "B. Alleen voorraad van water\n"
        "C. Muziekkeuze\n"
        "D. Alleen dessertkaart\n\n"
        "### Vraag 5\n\n"
        "Je app geeft gunstig venster voor topfles. Wat doe je?\n\n"
        "A. Openen zonder teamafstemming\n"
        "B. Teambriefing plus herproef op tafelmoment ✅\n"
        "C. Alleen manager laten beslissen zonder proeven\n"
        "D. Fles naar morgen verschuiven zonder reden"
    ),
    10: (
        "### Vraag 4\n\n"
        "Welke kalenderactie is professioneel voor de weekplanning?\n\n"
        "A. Alleen dagtype noteren\n"
        "B. Dagtype koppelen aan bezetting en kelderkeuzes ✅\n"
        "C. Geen evaluatie doen\n"
        "D. Elke dag hetzelfde plan\n\n"
        "### Vraag 5\n\n"
        "Je verwacht slecht weer bij een topflesreservering. Wat plan je?\n\n"
        "A. Geen alternatief\n"
        "B. Een A/B-scenario met vervangende fles ✅\n"
        "C. Alleen dessertwijn meenemen\n"
        "D. Alle reserveringen annuleren"
    ),
    11: (
        "### Vraag 4\n\n"
        "Worteldag, rode flight, hoge drukte. Welke stap voorkomt foutadvies?\n\n"
        "A. Herproef met vaste structuurchecklist ✅\n"
        "B. Alleen op eerste slok afgaan\n"
        "C. Temperatuur niet meten\n"
        "D. App-notities overslaan\n\n"
        "### Vraag 5\n\n"
        "Wanneer open je een topfles op deze dag?\n\n"
        "A. Zodra een tafel erom vraagt\n"
        "B. Na bevestiging van balans in proefglas ✅\n"
        "C. Alleen na social media post\n"
        "D. Altijd direct na levering"
    ),
    12: (
        "### Vraag 4\n\n"
        "Bladdag geeft zachte indruk, maar wijn mist spanning. Wat doe je?\n\n"
        "A. Koeling licht aanscherpen en opnieuw proeven ✅\n"
        "B. Meteen afkeuren\n"
        "C. Alleen karaf gebruiken\n"
        "D. Geen verslag maken\n\n"
        "### Vraag 5\n\n"
        "App toont gunstig venster voor topfles wit. Welke check is cruciaal?\n\n"
        "A. Alleen dagtype\n"
        "B. Temperatuurband plus glasprestatie ✅\n"
        "C. Alleen voorraadhoogte\n"
        "D. Alleen gastnaam"
    ),
    13: (
        "### Vraag 4\n\n"
        "Bloemdag en fine-dining tafel vragen complex wit. Beste aanpak?\n\n"
        "A. Presenteren met aromafocus en korte herproef ✅\n"
        "B. Snel schenken zonder uitleg\n"
        "C. Alleen jonge wijn adviseren\n"
        "D. Kalendersignaal verbergen\n\n"
        "### Vraag 5\n\n"
        "Wanneer wacht je met topfles op Bloemdag?\n\n"
        "A. Als aroma ondanks correct glas gesloten blijft ✅\n"
        "B. Als de gast enthousiast is\n"
        "C. Als menu kort is\n"
        "D. Als er muziek speelt"
    ),
    14: (
        "### Vraag 4\n\n"
        "Vruchtdag en app tonen positief venster. Welke servicefout ligt op de loer?\n\n"
        "A. Te snelle upsell zonder tweede check ✅\n"
        "B. Te veel water aanbieden\n"
        "C. Teveel notitiepapier\n"
        "D. Te lang uitleggen over glasproductie\n\n"
        "### Vraag 5\n\n"
        "Topflesbesluit op Vruchtdag hoort te steunen op:\n\n"
        "A. Alleen verkoopdoel\n"
        "B. Dagtype, proefbalans en gastcontext ✅\n"
        "C. Alleen weerapp\n"
        "D. Alleen openingsprijs"
    ),
    15: (
        "### Vraag 4\n\n"
        "Je proefexperiment toont gemengde resultaten. Wat is professioneel?\n\n"
        "A. Alle data negeren\n"
        "B. Afwijkingen analyseren op condities en volgorde ✅\n"
        "C. Alleen beste score publiceren\n"
        "D. Teamdiscussie stoppen\n\n"
        "### Vraag 5\n\n"
        "Een topfles meenemen in experiment doe je wanneer:\n\n"
        "A. Nooit\n"
        "B. Condities controleerbaar en vergelijkbaar zijn ✅\n"
        "C. Alleen bij lege zaal\n"
        "D. Alleen op Bladdag"
    ),
    16: (
        "### Vraag 4\n\n"
        "Temperatuur fluctueert in de zaal. Eerste prioriteit?\n\n"
        "A. Graden stabiliseren voor je conclusies trekt ✅\n"
        "B. App uitschakelen\n"
        "C. Alleen oudere jaargangen schenken\n"
        "D. Geen notities meer maken\n\n"
        "### Vraag 5\n\n"
        "Topfles op warme avond en gunstig dagtype: wat doe je?\n\n"
        "A. Meteen op kamertemperatuur serveren\n"
        "B. Gecontroleerd koelen en gefaseerd herproeven ✅\n"
        "C. Uitsluitend decanteren\n"
        "D. Alleen prijs verhogen"
    ),
    17: (
        "### Vraag 4\n\n"
        "Luchtdruk daalt snel en aroma lijkt diffuus. Beste stap?\n\n"
        "A. Korter beluchten en tussentijds valideren ✅\n"
        "B. Alles langer karafen\n"
        "C. Geen verschil noteren\n"
        "D. Alleen mousserend schenken\n\n"
        "### Vraag 5\n\n"
        "App geeft sterk venster maar druktrend is ongunstig. Topfles?\n\n"
        "A. Altijd openen\n"
        "B. Alleen openen na proefbevestiging in context ✅\n"
        "C. Nooit openen\n"
        "D. Openen zonder teammelding"
    ),
    18: (
        "### Vraag 4\n\n"
        "Hoge luchtvochtigheid, aromadetail zakt weg. Welke correctie past?\n\n"
        "A. Vers glas en strakke schenkdosis testen ✅\n"
        "B. Alleen koeler zetten\n"
        "C. Alleen op etiket afgaan\n"
        "D. Geen evaluatie doen\n\n"
        "### Vraag 5\n\n"
        "Je overweegt topflesservice bij vochtige condities. Wat helpt het meest?\n\n"
        "A. Geen protocol\n"
        "B. Vooraf proefmoment met condities in logboek ✅\n"
        "C. Alleen prijscommunicatie\n"
        "D. Alleen wijnkaartvolgorde wijzigen"
    ),
    19: (
        "### Vraag 4\n\n"
        "Weersomslag op komst en een VIP-tafel reserveert topfles. Wat doe je?\n\n"
        "A. Alleen op forecast vertrouwen\n"
        "B. A/B-plan met alternatieve fles voorbereiden ✅\n"
        "C. Meteen annuleren\n"
        "D. Geen briefing geven\n\n"
        "### Vraag 5\n\n"
        "In de app lijkt het venster nog goed, maar proefglas twijfelt. Keuze?\n\n"
        "A. Toch openen voor de show\n"
        "B. Voorzichtig blijven en alternatief aanbieden ✅\n"
        "C. Gast laten kiezen zonder uitleg\n"
        "D. Alleen manager laten proeven"
    ),
    20: (
        "### Vraag 4\n\n"
        "Je moet kiezen tussen direct tafelgeluk en kelderstrategie. Welke vraag helpt?\n\n"
        "A. Wat levert vandaag het hoogste fooibedrag\n"
        "B. Wat optimaliseert zowel nu als komende servicevensters ✅\n"
        "C. Wat zegt alleen de app\n"
        "D. Wat kost de fles inkoop\n\n"
        "### Vraag 5\n\n"
        "Dynamic vs Strategic in praktijk bij topfles betekent:\n\n"
        "A. Altijd dynamisch handelen\n"
        "B. Contextgewogen keuze met expliciete verantwoording ✅\n"
        "C. Altijd strategisch wachten\n"
        "D. Geen evaluatie achteraf"
    ),
    21: (
        "### Vraag 4\n\n"
        "Rode wijn op structuurdag toont harde tannine. Wat is beste route?\n\n"
        "A. Fles afserveren zonder check\n"
        "B. Decantering en temperatuur finetunen, dan herproeven ✅\n"
        "C. Alleen op vintage vertrouwen\n"
        "D. Alleen op gastverwachting sturen\n\n"
        "### Vraag 5\n\n"
        "Wanneer is topfles rood verantwoord bij sterk app-signaal?\n\n"
        "A. Zodra omzetdoel hoog is\n"
        "B. Als stijlcluster en proefbalans beide kloppen ✅\n"
        "C. Alleen op vrijdag\n"
        "D. Alleen met foodpairing"
    ),
    22: (
        "### Vraag 4\n\n"
        "Witte wijn lijkt vlak op een gunstige dag. Wat controleer je eerst?\n\n"
        "A. Temperatuurband en glasselectie ✅\n"
        "B. Alleen druivenras\n"
        "C. Alleen wijnkaartpositie\n"
        "D. Alleen margedoel\n\n"
        "### Vraag 5\n\n"
        "Topfles wit bij wisselweer en app-signaal: welke keuze is professioneel?\n\n"
        "A. Direct openen zonder proef\n"
        "B. Gefaseerd openen met realtime validatie ✅\n"
        "C. Nooit openen\n"
        "D. Alleen halve fles schenken"
    ),
    23: (
        "### Vraag 4\n\n"
        "Rose-service op druk terras, dagtype oogt gunstig. Waar let je op?\n\n"
        "A. Alleen snelheid van schenken\n"
        "B. Doel van het moment: aperitief of gastronomisch ✅\n"
        "C. Alleen kleurintensiteit\n"
        "D. Alleen prijsrange\n\n"
        "### Vraag 5\n\n"
        "Een tafel vraagt om je beste rose-topfles. Welke volgorde klopt?\n\n"
        "A. Meteen openen, dan uitleg\n"
        "B. Contextcheck, proefcheck, daarna opening ✅\n"
        "C. Eerst dessert aanbevelen\n"
        "D. Alleen app-score tonen"
    ),
}


QUIZ_FEEDBACK: dict[int, str] = {}
QUIZ_FULL: dict[int, str] = {}
QUIZ_COUNT_OVERRIDES: dict[int, int] = {}

PRAKTIJK: dict[int, str] = {
    2: (
        "### Opdracht\n\n"
        "Maak een mini-logboek voor drie opeenvolgende proefdagen. Noteer per dagtype dezelfde wijn op exact "
        "dezelfde serveertemperatuur en in hetzelfde glas. Schrijf vooraf een hypothese en toets die na het proeven.\n\n"
        "### Checklist\n\n"
        "- [ ] Ik noteerde dagtype, tijdstip en basisweer\n"
        "- [ ] Ik hield glas en temperatuur constant\n"
        "- [ ] Ik schreef vooraf een verwachtingszin\n"
        "- [ ] Ik evalueerde achteraf wat klopte en wat niet"
    ),
    16: (
        "### Opdracht\n\n"
        "Test eenzelfde wijn op drie temperaturen met kleine stappen (bijvoorbeeld 9, 10 en 11 graden voor wit, "
        "of 15, 16 en 17 graden voor rood). Vergelijk hoe dagtype-signalen veranderen per temperatuur.\n\n"
        "### Checklist\n\n"
        "- [ ] Ik werkte met kleine temperatuurstappen\n"
        "- [ ] Ik noteerde per stap aroma, structuur en lengte\n"
        "- [ ] Ik koppelde observaties aan het actuele dagtype\n"
        "- [ ] Ik formuleerde een concreet service-advies"
    ),
    20: (
        "### Opdracht\n\n"
        "Ontwerp voor komende week twee besluitregels: een dynamische regel voor live service en een strategische "
        "regel voor kelderplanning. Pas beide toe op minimaal een topfles-scenario.\n\n"
        "### Checklist\n\n"
        "- [ ] Ik beschreef wanneer ik dynamisch stuur\n"
        "- [ ] Ik beschreef wanneer ik strategisch wacht\n"
        "- [ ] Ik testte de regels op een echte servicecase\n"
        "- [ ] Ik legde de uitkomst uit in teamtaal"
    ),
}
