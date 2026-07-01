"""Cocktail Track V2 — Gold Master data (lessons 1-21)."""

from __future__ import annotations

import re

TERMINOLOGY_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bdilution\b", "verdunning"),
    (r"\bDilution\b", "Verdunning"),
    (r"\bfoodpairing\b", "food pairing"),
    (r"\bmouthfeel\b", "mondgevoel"),
    (r"\btexture\b", "textuur"),
    (r"\bTexture\b", "Textuur"),
    (r"\bbalance\b", "balans"),
    (r"\bBalance\b", "Balans"),
    (r"\bintegration\b", "integratie"),
    (r"\bIntegration\b", "Integratie"),
    (r"\baromatic lift\b", "aromatische lift"),
]

_CITE_ARTIFACT = r"\s*:contentReference\[oaicite:\d+\]\{index=\d+\}\.?"


def fix_artifacts(text, lesson_num=None):
    if not text:
        return ""
    text = re.sub(_CITE_ARTIFACT, "", text)
    text = re.sub(r"contentReference\[oaicite:\d+\]\{index=\d+\}", "", text)
    text = re.sub(r"\bTODO\b|\bFIXME\b", "", text, flags=re.I)
    text = re.sub(r"\bDe student\b", "Na deze les kun jij", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    text = re.sub(r" {2,}", " ", text)
    text = re.sub(r" +([,.;:!?])", r"\1", text)
    if lesson_num == 17:
        text = text.replace("Sazerac als hoofdcase", "Old Fashioned als hoofdcase")
    return text.strip()


def _fp(beste, waarom, vermijd):
    return (
        f"### Beste pairing\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


def merge_part2():
    from cock_gold_master_data_part2 import apply_part2

    apply_part2()


MODULE_GOALS: dict[int, str] = {
    1: "Je zet het cocktailfundament neer: definitie, functie en vaktaal voor consistente service.",
    2: "Je leest cocktailgeschiedenis als smaaklogica en vertaalt klassiek erfgoed naar moderne barbeslissingen.",
    3: "Je beheerst de as spirit-modifier-balans zodat recepten voorspelbaar en verkoopbaar worden.",
    4: "Je koppelt basisstructuren aan techniekkeuze, glas, ijs en verdunningscontrole.",
    5: "Je gebruikt categorieen als operationeel kompas voor kaartopbouw en gastadvies.",
    6: "Je voert shaken technisch zuiver uit met focus op koeling, textuur en aromatische lift.",
    7: "Je voert stirred-drinks strak uit met helderheid, integratie en gecontroleerde verdunning.",
    8: "Je bouwt built-drinks snel en consistent met koolzuurbehoud en servicetempo.",
    9: "Je gebruikt layering doelgericht voor visuele impact zonder structuurverlies in het glas.",
}


MODULE_KERNBEGRIPPEN: dict[int, list[str]] = {
    1: [
        "cocktaildefinitie",
        "structuur",
        "balans",
        "verdunning",
        "serveermoment",
        "mondgevoel",
        "textuur",
        "integratie",
        "aromatische lift",
        "barhygiene",
    ],
    2: [
        "punchtraditie",
        "pre-prohibition",
        "prohibition",
        "tiki",
        "craft cocktail",
        "sours-familie",
        "stirred-klassiekers",
        "highball-cultuur",
        "receptdiscipline",
        "gastnarratief",
    ],
    3: [
        "base spirit",
        "modifier",
        "zoet-zuurspanning",
        "bitteras",
        "alcoholintegratie",
        "smaakgewicht",
        "aromatische brug",
        "verdunningsvenster",
        "correctievolgorde",
        "consistentie",
    ],
    4: [
        "sour-structuur",
        "old-fashioned-structuur",
        "martini-structuur",
        "highball-structuur",
        "temperatuurcurve",
        "ijscontact",
        "verdunningscontrole",
        "glaskeuze",
        "afwerking",
        "serviceflow",
    ],
    5: [
        "aperitief",
        "digestief",
        "short drink",
        "long drink",
        "low-abv",
        "koolzuurprofiel",
        "bittermatrix",
        "smaakroute",
        "kaartsegmentatie",
        "upselllogica",
    ],
    6: [
        "shakekracht",
        "ijsratio",
        "airatie",
        "microfoam",
        "koudeopbouw",
        "zeeftechniek",
        "dubbelzeven",
        "citruslift",
        "textuurspanning",
        "servicetijd",
    ],
    7: [
        "roertechniek",
        "helderheid",
        "viscositeit",
        "integratietijd",
        "barspoon-ritme",
        "ijsdichtheid",
        "smeltcurve",
        "aromabehoud",
        "stir-efficiency",
        "precisieservice",
    ],
    8: [
        "built-opbouw",
        "koolzuurbehoud",
        "laag-toevoegen",
        "stir-kort",
        "glasvulling",
        "ijsmanagement",
        "top-up discipline",
        "tempo-uitgifte",
        "batch-basis",
        "line-check",
    ],
    9: [
        "laagdichtheid",
        "barspoon-float",
        "visuele spanning",
        "smaaksequentie",
        "servicerisico",
        "gastverwachting",
        "textuurtransitie",
        "foutreductie",
        "presentatieregie",
        "teamcoordinatie",
    ],
}


LEERDOELEN: dict[int, str] = {
    1: "Na deze les kun jij uitleggen wat een cocktail is en waarom balans, structuur en verdunning de kwaliteit bepalen.",
    2: "Na deze les kun jij de belangrijkste periodes uit cocktailgeschiedenis koppelen aan hedendaagse barkeuzes.",
    3: "Na deze les kun jij de verhouding tussen spirit en modifiers analyseren en technisch bijsturen naar balans.",
    4: "Na deze les kun jij basisstructuren herkennen en per structuur de juiste techniek en ijsstrategie kiezen.",
    5: "Na deze les kun jij cocktailcategorieen inzetten om kaartadvies, servicevolgorde en gastverwachting te sturen.",
    6: "Na deze les kun jij shaken correct uitvoeren met controle op temperatuur, textuur en aromatische lift.",
    7: "Na deze les kun jij stirred cocktails bouwen met maximale helderheid, integratie en gecontroleerde verdunning.",
    8: "Na deze les kun jij built cocktails snel en consistent serveren met behoud van koolzuur en structuur.",
    9: "Na deze les kun jij layering toepassen op een veilige, stabiele en smaaklogische manier.",
    10: "Na deze les kun jij muddling doelgericht inzetten zonder bitterextractie of textuurverlies.",
    11: "Na deze les kun jij base spirits technisch vergelijken op body, aromaprofiel en inzetbaarheid.",
    12: "Na deze les kun jij likeuren functioneel selecteren op zoetkracht, aromatische brug en integratie.",
    13: "Na deze les kun jij bitters doseren als structurele tool voor spanning, lengte en droogte-indruk.",
    14: "Na deze les kun jij citrus en suikers combineren tot gecontroleerde zuur-zoetbalans in verschillende structuren.",
    15: "Na deze les kun jij in een mini-toets theorie en techniek integreren en onderbouwde keuzes verantwoorden.",
    16: "Na deze les kun jij een Martini technisch zuiver opbouwen en afstellen op gastvoorkeur.",
    17: "Na deze les kun jij een Old Fashioned als kerncocktail bouwen met strakke suiker-bitter-balans en verdunning.",
    18: "Na deze les kun jij een Manhattan consistent bouwen met focus op vermoutkwaliteit, integratie en garnishdiscipline.",
    19: "Na deze les kun jij een Negroni nauwkeurig bouwen en de bitter-zoet-spanning professioneel sturen.",
    20: "Na deze les kun jij een Daiquiri exact balanceren op zuren, suikers en textuur onder hoge service snelheid.",
    21: "Na deze les kun jij een Whiskey Sour stabiel uitvoeren met juiste foam, zuurspanning en verdunningscontrole.",
}


THEORY_OVERRIDES: dict[int, str] = {
    4: (
        "Cocktailstructuren zijn herhaalbare smaakarchitecturen. De sour-structuur draait om spirit, zuur en zoet; "
        "de old-fashioned-structuur om spirit, suiker, bitters en gecontroleerde verdunning; de martini-structuur om "
        "spirit plus aromatische versterker met hoge helderheid; en de highball-structuur om lengte, koolzuur en frisheid.\n\n"
        "Wie structuren beheerst, kan sneller corrigeren: eerst zuur-zoet, daarna bitteras, dan verdunning. Zo blijft "
        "het glas in balans zonder overmixen of overgarnish."
    ),
    15: (
        "Deze mini-toets meet integratie, niet losse feiten. Je toont dat je techniek, smaaklogica en servicetempo "
        "tegelijk kunt managen. Het doel is reproduceerbaarheid: een cocktail moet onder druk hetzelfde niveau halen.\n\n"
        "Fouten zijn vooral leerdata. Analyseer of de afwijking komt uit receptdiscipline, ijsmanagement of timing, "
        "en vertaal dat direct naar je volgende service-setup."
    ),
    16: (
        "De Martini is een precisiecocktail waarin kleine afwijkingen direct hoorbaar worden in de smaak. "
        "Temperatuur, roertijd, vermoutverhouding en garnish bepalen samen of het glas scherp, vlak of perfect "
        "integraal overkomt.\n\n"
        "Professionele uitvoering betekent vooraf kaderen: dry, wet of 50/50, met heldere uitleg voor de gast en "
        "strakke herhaalbaarheid achter de bar."
    ),
}


THEORY_MENTIONS: dict[int, str] = {
    17: "Vermelding: de Sazerac is historisch verwant, maar blijft in deze les expliciet een korte contextmention en geen hoofdcase.",
    18: "Vermelding: de Vieux Carre toont hoe Manhattan-logica uitbreidt naar complexere aromatic builds met meerdere spirits.",
    19: "Vermelding: Boulevardier en Naked & Famous zijn varianten om bitter-zoet-spanning en aromatische richting te vergelijken.",
    21: "Vermelding: de Penicillin is een moderne sour-variant met rooklaag als aromatische lift boven een vergelijkbare zuur-zoetas.",
}


SUMMARIES: dict[int, list[str]] = {
    1: ["Cocktails draaien om structuur, niet om decoratie.", "Balans ontstaat uit zuur, zoet, bitter, alcohol en temperatuur.", "Verdunning is een ingrediënt, geen bijeffect.", "Servicekwaliteit begint bij reproduceerbaarheid."],
    2: ["Geschiedenis verklaart waarom klassiekers zo gebouwd zijn.", "Elke periode voegde techniek en taal toe.", "Kennis van context verhoogt gastvertrouwen.", "Traditie is bruikbaar als besliskader voor nu."],
    3: ["Base spirit zet gewicht en richting.", "Modifiers sturen spanning en aromatische lift.", "Correctievolgorde voorkomt oversturen.", "Integratie is belangrijker dan intensiteit alleen."],
    4: ["Vier basisstructuren dekken het grootste deel van de kaart.", "Techniek volgt structuur, niet andersom.", "Ijs en glas bepalen mee het eindresultaat.", "Snelle diagnose voorkomt serviceverlies."],
    5: ["Categorieen helpen gasten kiezen zonder jargon.", "Kaartopbouw moet op context en moment werken.", "Short en long drinks vragen andere flow.", "Goede segmentatie verhoogt conversie en tevredenheid."],
    6: ["Shaken brengt koeling, verdunning en textuur samen.", "Te lang shaken maakt dun en vlak.", "Dubbelzeven houdt textuur strak.", "Citrusdrinks vragen direct service tempo."],
    7: ["Stirred cocktails vragen rust en precisie.", "Helderheid en viscositeit zijn kwaliteitsmarkers.", "Ijsdichtheid stuurt verdunningssnelheid.", "Garnish moet aroma steunen, niet overschreeuwen."],
    8: ["Built drinks winnen op snelheid en frisheid.", "Koolzuurbehoud is kernkwaliteit.", "Roeren gebeurt kort en doelgericht.", "Consistente opbouw voorkomt verschil per ronde."],
    9: ["Layering is techniek met risico op show boven smaak.", "Dichtheid en temperatuur bepalen stabiliteit.", "Smaakvolgorde moet logisch blijven.", "Visuals mogen structuur niet breken."],
    10: ["Muddling is extractiecontrole.", "Te hard muddlen geeft bitter en troebel.", "Zachte druk bewaart frisse aroma's.", "Muddle alleen wat functioneel bijdraagt."],
    11: ["Base spirits verschillen in body en aromaprojectie.", "ABV alleen zegt weinig over mondgevoel.", "Distillaatstijl stuurt cocktailarchitectuur.", "Spiritkeuze bepaalt batchstrategie en marge."],
    12: ["Likeuren zijn smaaktools, geen suikertruc.", "Zoetkracht moet in verhouding tot zuur.", "Aromatische brug maakt integratie sneller.", "Te veel likeur maskeert structuur."],
    13: ["Bitters leveren spanning en lengte.", "Dosis werkt in druppels, niet in shots.", "Bitters kunnen zoetdruk verlagen.", "Correct gebruik verbetert droge finish."],
    14: ["Citrus en suiker bepalen het hart van veel classics.", "Verhouding verandert met ijs en temperatuur.", "Sirooptype stuurt textuur.", "Consistente meting voorkomt schommelingen."],
    15: ["Toetsing meet beslisvaardigheid onder druk.", "Techniek en theorie moeten samenkomen.", "Foutenanalyse geeft snelste groei.", "Herhaalbare output is de norm."],
    16: ["Martini vraagt maximale precisie.", "Vermoutkwaliteit is niet optioneel.", "Roerduur stuurt integratie en mondgevoel.", "Garnishkeuze verandert aromatische richting."],
    17: ["Old Fashioned draait om eenvoud en controle.", "Suiker, bitters en verdunning moeten strak staan.", "Te veel water maakt het glas vlak.", "Servicegesprek bepaalt personalisatie zonder chaos."],
    18: ["Manhattan vraagt balans tussen whiskey en vermout.", "Bitters verbinden en drogen het profiel.", "Helderheid en temperatuur zijn essentieel.", "Garnishdiscipline bepaalt finale aromatische lift."],
    19: ["Negroni werkt op bittere spanning en zoete ruggengraat.", "Gelijke delen vragen precieze kwaliteit per component.", "Verdunning maakt of breekt drinkbaarheid.", "Varianten vragen duidelijke communicatie aan tafel."],
    20: ["Daiquiri is de lakmoesproef voor zuur-zoet-balans.", "Limekwaliteit verandert elke shift.", "Korte shake met juiste ijsbelasting werkt het best.", "Directe uitgifte behoudt textuur en lift."],
    21: ["Whiskey Sour combineert structuur en textuur.", "Foamstabiliteit vraagt techniekdiscipline.", "Zuurspanning moet helder maar niet scherp zijn.", "Verdunning en garnish sturen finale beleving."],
}


FOOD_PAIRING: dict[int, str] = {
    1: _fp("Zoute amandelen, oesters en gefrituurde snacks.", "Zout en vet vragen koolzuur, alcoholsnede en gecontroleerde zoetdruk; lichte bitterheid houdt spanning in het palet en voorkomt plakkerig mondgevoel.", "Suikerzware desserts zonder zuurcomponent."),
    2: _fp("Klassieke canapes, paté en gerijpte kaas.", "Historische classics werken op vet-zout-umami; bitter en verdunning maken rijke happen lichter zodat aroma langer blijft staan.", "Zeer zure gerechten die de alcoholintegratie breken."),
    3: _fp("Citroenkip, gegrilde garnalen en jonge geitenkaas.", "De spirit-modifier-balans vangt zout en vet; zuur lift aroma, zoet dempt scherpe randen en bitter houdt de afdronk droog.", "Overmatig zoete sauzen zonder tegengewicht."),
    4: _fp("Steak tartaar, charcuterie en citrusrijke salades.", "Sour-structuur werkt met zuur op vet, old-fashioned-structuur met bitter op umami, highball-structuur met koolzuur op zout en textuur.", "Eenzijdige pairing op alleen intensiteit of alleen kleur."),
    5: _fp("Aperitiefhapjes, blauwschimmelkaas en pure chocolade.", "Categoriekeuze stuurt chemie: fris/highball voor zout en vet, stirred klassiek voor umami, bitter-gedragen drinks voor cacao-bitter.", "Een zware digestiefstijl als standaard voor elk gerecht."),
    6: _fp("Ceviche, tempura en geitenkaas.", "Shaken-drinks leveren hogere zuurspanning en koel mondgevoel; dat snijdt vet en tilt delicate aroma's zonder verlies van textuur.", "Warme, zoete desserts die de citruslijn platdrukken."),
    7: _fp("Gerookte vis, oude kaas en paddenstoelen-toast.", "Stirred-profielen koppelen bitter, umami en vet met gecontroleerde verdunning; lage temperatuur houdt structuur scherp en aromatische lift strak.", "Kruidige chili-gerechten die de subtiele integratie overschreeuwen."),
    8: _fp("Oesters, sushi en lichte borrelplanken.", "Built-stijl met koolzuur neutraliseert zout en vet, terwijl citrus of bittercomponent de mond schoon houdt voor volgende happen.", "Romige desserts met hoge suikerdruk."),
    9: _fp("Desserts met roomlaag en notige petit fours.", "Layering kan textuursequentie afstemmen op vet en zoet, waarbij bitter en alcohol de finale droogte terugbrengen.", "Zoutarme, neutrale bites die geen structuurcontrast geven."),
    10: _fp("Munt-rijke salades, gegrilde perzik en lichte geitenkaas.", "Muddled kruiden werken met aroma en fris zuur; beperkte extractie bewaart groene lift zonder bitter bladprofiel.", "Overmuddled schilcomponenten bij delicate gerechten."),
    11: _fp("Gerookt vlees, harde kazen en pure chocolade.", "Rijke base spirits dragen umami en vet via alcoholwarmte, bitteras en mondvulling; zuurcomponenten moeten ondersteunend blijven.", "Te lichte, waterige gerechten zonder tegenkracht."),
    12: _fp("Fruitdesserts, eendenlever en blauwaderkaas.", "Likeurzoet vangt zout en bitter, terwijl aromatische verbinding de brug slaat tussen gerecht en basisdistillaat.", "Likeur-op-likeur combinaties zonder zuur of bittercorrectie."),
    13: _fp("Donkere chocolade, oude kaas en geroosterde noten.", "Bitters versterken lengte en droogte, waardoor vet en zoet in balans komen; umami blijft helder door gecontroleerde bitterdosering.", "Zeer tanninerijke bites met extra bittere sauzen."),
    14: _fp("Citrustart, ceviche en romige kazen.", "Zuur-zoetbalans bepaalt of vet wordt opgeschoond of versterkt; juiste suikerspiegel houdt spanning zonder scherpte.", "Ongebalanceerde zure gerechten met te weinig zout of vet."),
    15: _fp("Driegangen oefenmenu: zout, umami, zoet.", "Toetspairing meet of je zuur, zoet, bitter, vet en zout als variabelen kunt verbinden met techniek en verdunning.", "Ad-hoc pairen zonder vooraf smaakanalyse."),
    16: _fp("Ziltige olijven, oesters en amandelchips.", "Martini-structuur werkt met zout en vet via droge spanning, lage temperatuur en aromatische lift uit garnish.", "Zoete desserts of sterk gekruide sauzen."),
    17: _fp("Old Fashioned bij oude kaas en pecannoot.", "Suiker-bitter-balans vangt zout en notige umami; gecontroleerde verdunning voorkomt plakkerigheid en houdt textuur strak.", "Overzoete desserts die bitterstructuur platmaken."),
    18: _fp("Manhattan bij eendenrillette en paddenstoel.", "Whiskey, vermout en bitters dragen vet en umami; zoete vermout rondt bitter af zonder de droge finish te verliezen.", "Citrusdominante gerechten die de vermoutintegration breken."),
    19: _fp("Negroni bij charcuterie en harde kaas.", "Bitter-zoet-spanning grijpt op zout en vet; aromatische kruiden tillen umami en de verdunning maakt het geheel drinkbaar.", "Lichtzure desserts met lage vetscore."),
    20: _fp("Daiquiri bij ceviche en schaaldieren.", "Hoge zuurspanning en lage suikerdruk reinigen vet en zout; frisse textuur versterkt maritieme aroma's zonder bitter conflict.", "Romige zoete nagerechten."),
    21: _fp("Whiskey Sour bij fried chicken en comte.", "Zuur + foam + alcohol brengen vet in evenwicht; bitters in garnishlaag verhogen droge lengte en aromatische spanning.", "Sterk bittere groentegerechten zonder vetbuffer."),
}


PRO_INSIGHTS: dict[int, str] = {
    1: "In service verkoop je geen recept maar zekerheid: benoem structuur en verdunning in gewone taal. Dat verlaagt keuzestress, versnelt upsell en houdt retouren laag.",
    2: "Gebruik geschiedenis als verkoopscript in 20 seconden: oorsprong, reden van techniek, wat de gast nu proeft. Dat maakt klassieke cocktails premium zonder elitair te klinken.",
    3: "Maak een correctievolgorde zichtbaar voor het team: eerst zuur-zoet, dan bitter, dan verdunning. Zo voorkom je dat junior bartenders tegelijk aan alle knoppen draaien.",
    4: "Werk met structuurstations in mise-en-place en batch de neutrale componenten per familietype. Dat verhoogt snelheid terwijl balans en textuur stabiel blijven tijdens piekdrukte.",
    5: "Categorieen sturen marge: zet toegankelijke highballs als entree en stuur daarna naar stirred klassiekers met hogere waarde. Heldere routekaart verhoogt bonwaarde per tafel.",
    6: "Shaken onder tijdsdruk mislukt meestal op ijsmanagement. Houd vaste ijsmassa per tin, anders loopt verdunning per ronde uiteen en verliest je batchkwaliteit.",
    7: "Stirred kwaliteit begint bij stilte en ritme. Leer bartenders roeren op tijdvenster in plaats van gevoel, zodat helderheid en integratie tussen shifts consistent blijven.",
    8: "Built-drinks lijken simpel maar fouten schuilen in top-up discipline. Meet koolzuurverlies door stilstand en pas je servicevolgorde aan op piekmomenten.",
    9: "Layering verkoopt op zicht, maar alleen als smaaksequentie klopt. Train met water-suiker proeflagen voordat je met premium spirits werkt om waste te beperken.",
    10: "Muddling moet je behandelen als extractietechniek met limieten. Batch je siroop slim zodat je minder hoeft te forceren in de shaker en bitters in de schil vermijdt.",
    11: "Koppel base spirit-keuze aan gastintentie: strak, rond of aromatisch. Dat verkort adviesgesprekken en maakt verkoop van hogere segmenten natuurlijker.",
    12: "Likeuren zijn je snelste knop voor gastpersonalisatie, maar ze verhogen ook foutkans. Werk met halve stapjes in ml en proef direct op integratie, niet op zoetheid alleen.",
    13: "Bitters zijn margeneutraal maar kwaliteitskritisch. Met consistente dash-techniek kun je dezelfde batch ineens strakker laten smaken zonder extra kosten.",
    14: "Citrus verandert elk uur. Plan micro-batches siroop en line-check elke serviceblokkade; zo blijft je zuur-zoet-as stabiel en voorkom je klachten over scherpe sours.",
    15: "Gebruik toetsdata als operationeel dashboard: welke fouten komen terug, in welke shift, bij welke techniek. Dat maakt training gericht en direct winstgevend.",
    16: "Martini-verkoop stijgt als je vooraf twee vragen stelt: droogte en garnish. Dat levert controle op verwachting, minder remakes en meer vertrouwen in premium gin-upsell.",
    17: "Old Fashioned faalt vaak op te snelle verdunning. Voor piekservice kun je spirit-suiker-bitters deels pre-batchen en pas op ijs afmaken voor constante textuur.",
    18: "Manhattan vraagt verse vermoutdiscipline. Werk met gekoelde kleine flessen en datumlabels; oxidatie sloopt integratie sneller dan veel teams denken.",
    19: "Negroni profiteert van mini-batches per drukblok. Zo houd je verhouding en temperatuur constant, en kun je garnishfocus gebruiken als laatste aromatische lift.",
    20: "Daiquiri is je kwaliteitsmeter per shift. Laat elke bartender een referentieglas bouwen bij start; verkoopgesprekken worden scherper als het team dezelfde balans proeft.",
    21: "Whiskey Sour met stabiele foam vereist protocol: dry shake, wet shake, direct service. Gebruik duidelijke garnishregels zodat bitters en aroma niet willekeurig uitpakken.",
}


REFLECTIEVRAGEN: dict[int, str] = {
    1: "Welke fout in jouw huidige cocktaildefinitie zorgt het vaakst voor verkeerde verwachting bij gasten?",
    2: "Welke historische les helpt jou vandaag het meest om een klassieker sneller en beter uit te leggen?",
    3: "Wanneer stuur jij te laat op modifierbalans, en welk signaal had je eerder moeten herkennen?",
    4: "Welke basisstructuur op jouw kaart veroorzaakt de meeste inconsistentie en waarom precies daar?",
    5: "Welke categorie op jouw kaart wordt te breed gecommuniceerd, waardoor upsellkansen verloren gaan?",
    6: "Welke technische stap in jouw shake-routine geeft de grootste variatie in textuur tussen rondes?",
    7: "Waar verlies jij bij stirred drinks het meeste aan helderheid: ijs, roertijd of snelheid?",
    8: "Welke built-cocktail op jouw kaart lijdt het meest onder koolzuurverlies tijdens piekservice?",
    9: "Wanneer levert layering visuele winst maar smaaktechnisch verlies op in jouw huidige uitvoering?",
    10: "Hoe toets je of jouw muddling nog extractiecontrole is en geen brute kracht?",
    11: "Welke base spirit wordt in jouw bar te vaak gekozen op merk in plaats van structuurfit?",
    12: "Waar gebruik jij likeur als snelle oplossing terwijl een zuur- of bittercorrectie beter was?",
    13: "Welke cocktail op jouw kaart zou met een andere bittersdosering direct consistenter worden?",
    14: "Hoe ga jij om met variatie in citruskracht tussen middag en avondservice?",
    15: "Welke terugkerende fout uit jouw mini-toets moet eerst opgelost worden voor schaalbare kwaliteit?",
    16: "Wanneer wijk jij in Martini-service af van standaard en hoe onderbouw je die afwijking?",
    17: "Welke stap in jouw Old Fashioned-proces vergroot de kans op oververdunning het meest?",
    18: "Hoe borg jij vermoutversheid in Manhattan-service zonder snelheid te verliezen?",
    19: "Welke component in jouw Negroni veroorzaakt het vaakst disbalans en hoe check je dat vooraf?",
    20: "Welke meetbare routine gebruik je om Daiquiri-balans constant te houden tussen bartenders?",
    21: "Op welk punt in jouw Whiskey Sour-routine gaat foamstabiliteit meestal verloren, en waarom?",
}


GOLD_KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["cocktaildefinitie", "balans", "structuur", "verdunning", "mondgevoel"],
    2: ["cocktailgeschiedenis", "klassieker", "prohibition", "craft", "barcontext"],
    3: ["base spirit", "modifier", "integratie", "spanning", "correctievolgorde"],
    4: ["sour-structuur", "old-fashioned-structuur", "martini-structuur", "highball-structuur", "ijsstrategie"],
    5: ["categorie", "kaartsegmentatie", "serviceflow", "upsell", "gastprofiel"],
    6: ["shaken", "airatie", "dubbelzeven", "koudeopbouw", "textuur"],
    7: ["stirred", "helderheid", "viscositeit", "smeltcurve", "aromabehoud"],
    8: ["built", "koolzuurbehoud", "top-up", "ijsmanagement", "tempo"],
    9: ["layering", "dichtheid", "smaaksequentie", "presentatie", "foutreductie"],
    10: ["muddling", "extractiecontrole", "kruidenlift", "bitterrisico", "drukdosering"],
    11: ["base spirit", "body", "distillaatstijl", "aromaprofiel", "inzetbaarheid"],
    12: ["likeur", "zoetkracht", "aromatische brug", "integratie", "dosering"],
    13: ["bitters", "spanning", "droogte-indruk", "lengte", "dash-techniek"],
    14: ["citrus", "suiker", "zuur-zoetbalans", "sirooptype", "kalibratie"],
    15: ["mini-toets", "integratie", "beslisvaardigheid", "reproduceerbaarheid", "foutenanalyse"],
    16: ["martini", "vermouth", "roertijd", "garnish", "precisie"],
    17: ["old fashioned", "suiker", "bitters", "verdunning", "ijsblok"],
    18: ["manhattan", "rye", "zoete vermout", "integratie", "garnishdiscipline"],
    19: ["negroni", "bitter-zoet-spanning", "gin", "campari", "verdunningsvenster"],
    20: ["daiquiri", "lime", "siroop", "shakecontrole", "frisse textuur"],
    21: ["whiskey sour", "foamstabiliteit", "zuurspanning", "dry shake", "bitters-garnish"],
}


QUIZ_PATCHES: dict[int, str] = {
    1: (
        "### Vraag 4\n\n"
        "Een gast zegt: 'Ik wil iets fris maar niet zuur.' Wat is je beste eerste stap?\n\n"
        "A. Meteen een random sour maken\n"
        "B. Kort peilen naar zoetheid en spiritvoorkeur, dan structuur kiezen ✅\n"
        "C. Alleen vragen naar budget\n"
        "D. Een extra bittere klassieker serveren\n\n"
        "### Vraag 5\n\n"
        "Je team levert wisselende resultaten op dezelfde cocktail. Wat corrigeer je eerst?\n\n"
        "A. Decoratie\n"
        "B. Recepttaal rond balans en verdunning standaardiseren ✅\n"
        "C. Muziekvolume\n"
        "D. Glaslogo\n"
    ),
    2: (
        "### Vraag 4\n\n"
        "Een gast wil een klassieker, maar kent de naam niet. Wat werkt professioneel?\n\n"
        "A. Geschiedenis negeren en gokken\n"
        "B. Korte historische context gebruiken om smaakverwachting te kaderen ✅\n"
        "C. Alleen de duurste optie voorstellen\n"
        "D. Meteen shotservice aanbieden\n\n"
        "### Vraag 5\n\n"
        "Waarom helpt cocktailgeschiedenis in verkoop?\n\n"
        "A. Omdat elke gast detailjaren wil horen\n"
        "B. Omdat context vertrouwen bouwt en keuze vergemakkelijkt ✅\n"
        "C. Omdat techniek dan niet meer nodig is\n"
        "D. Omdat alle klassiekers hetzelfde smaken\n"
    ),
    3: (
        "### Vraag 4\n\n"
        "Je Daiquiri is te scherp. Wat corrigeer je als eerste?\n\n"
        "A. Meer bitters\n"
        "B. Zoetcomponent in kleine stap verhogen en herproeven ✅\n"
        "C. Dubbele alcohol\n"
        "D. Extra garnish\n\n"
        "### Vraag 5\n\n"
        "Een cocktail smaakt vlak ondanks juiste ratio. Wat check je daarna?\n\n"
        "A. Integratie en verdunning door ijscontact ✅\n"
        "B. Alleen glasvorm\n"
        "C. Alleen merknaam\n"
        "D. Alleen kleur\n"
    ),
    4: (
        "### Vraag 4\n\n"
        "Bij een old-fashioned-structuur valt het glas te zoet uit. Beste ingreep?\n\n"
        "A. Meer suiker toevoegen\n"
        "B. Bitteras verhogen of verdunning verfijnen ✅\n"
        "C. Citrussap toevoegen zonder plan\n"
        "D. Koolzuur bijvullen\n\n"
        "### Vraag 5\n\n"
        "Waarom start je diagnose met structuur in plaats van ingredientenlijst?\n\n"
        "A. Structuur toont welke smaakas fout staat ✅\n"
        "B. Ingredienten zijn onbelangrijk\n"
        "C. Omdat garnish alles oplost\n"
        "D. Omdat ijs nooit invloed heeft\n"
    ),
    5: (
        "### Vraag 4\n\n"
        "Een gast wil 'iets lichts voor nu en iets diepers daarna'. Wat doe je?\n\n"
        "A. Twee zware digestiefs aanbieden\n"
        "B. Categorieen gebruiken om servicevolgorde logisch op te bouwen ✅\n"
        "C. Alleen house special pushen\n"
        "D. Zonder vragen random mixen\n\n"
        "### Vraag 5\n\n"
        "Welke kaartkeuze ondersteunt snelle piekservice het best?\n\n"
        "A. Ongeordende lijst\n"
        "B. Segmentatie op structuur en drinkmoment ✅\n"
        "C. Alleen op kleur geordend\n"
        "D. Alleen op prijs oplopend\n"
    ),
    6: (
        "### Vraag 4\n\n"
        "Na shaken is je cocktail waterig. Waarschijnlijke oorzaak?\n\n"
        "A. Te korte shake\n"
        "B. Te lange shake of zwakke ijsmassa ✅\n"
        "C. Te koude coupe\n"
        "D. Te weinig garnish\n\n"
        "### Vraag 5\n\n"
        "Wat borgt bij shaken de beste consistentie tussen bartenders?\n\n"
        "A. Vrije interpretatie per persoon\n"
        "B. Vaste ijsratio en tijdsvenster per recept ✅\n"
        "C. Alleen smaak op gevoel\n"
        "D. Geen line-checks\n"
    ),
    7: (
        "### Vraag 4\n\n"
        "Je stirred drink oogt troebel. Eerste technische check?\n\n"
        "A. Roeren langer met nat, brekend ijs\n"
        "B. Ijskwaliteit en roerritme op helderheid controleren ✅\n"
        "C. Extra citrussap toevoegen\n"
        "D. Direct serveren zonder proef\n\n"
        "### Vraag 5\n\n"
        "Waarom is garnishdiscipline bij stirred drinks cruciaal?\n\n"
        "A. Omdat visuals het enige doel zijn\n"
        "B. Omdat kleine aromasignalen de integratie sterk sturen ✅\n"
        "C. Omdat garnish bitterheid verlaagt\n"
        "D. Omdat stirred drinks geen verdunning kennen\n"
    ),
    8: (
        "### Vraag 4\n\n"
        "Een highball verliest snel prik aan tafel. Wat pas je eerst aan?\n\n"
        "A. Meer roeren in het glas\n"
        "B. Opbouwvolgorde en minimale agitatie voor koolzuurbehoud ✅\n"
        "C. Warmer ijs gebruiken\n"
        "D. Extra suikersiroop\n\n"
        "### Vraag 5\n\n"
        "Welke built-routine is het meest professioneel tijdens piek?\n\n"
        "A. Top-up op gevoel zonder meting\n"
        "B. Gestandaardiseerde vulhoogte en korte finish-stir ✅\n"
        "C. Elk glas eerst lang shaken\n"
        "D. Geen ijs gebruiken\n"
    ),
    9: (
        "### Vraag 4\n\n"
        "Je layered cocktail mixt direct in elkaar. Wat is meest waarschijnlijk?\n\n"
        "A. Te groot dichtheidsverschil\n"
        "B. Te weinig dichtheidsverschil of verkeerde schenksnelheid ✅\n"
        "C. Te koud glas\n"
        "D. Te kleine garnish\n\n"
        "### Vraag 5\n\n"
        "Wanneer is layering af te raden in service?\n\n"
        "A. Als visuele winst ten koste gaat van smaakintegratie ✅\n"
        "B. Als de gast foto wil maken\n"
        "C. Als de bar rustig is\n"
        "D. Als het glas helder is\n"
    ),
    10: (
        "### Vraag 4\n\n"
        "Muntcocktail smaakt bitter-groen. Waardoor meestal?\n\n"
        "A. Te zachte muddling\n"
        "B. Te harde muddling met bladbeschadiging ✅\n"
        "C. Te koud ijs\n"
        "D. Te weinig limoen\n\n"
        "### Vraag 5\n\n"
        "Wat is een goede muddlingregel?\n\n"
        "A. Altijd maximale kracht\n"
        "B. Net genoeg druk voor aroma-extractie zonder pulp ✅\n"
        "C. Alleen roeren met bladeren\n"
        "D. Muddling altijd overslaan\n"
    ),
    11: (
        "### Vraag 4\n\n"
        "Gast wil 'krachtig maar niet zwaar'. Wat stuur je eerst?\n\n"
        "A. Hoogste ABV kiezen\n"
        "B. Base spirit op mondgevoel en aromaprojectie kiezen ✅\n"
        "C. Alleen kleur van de drank\n"
        "D. Alleen merkbekendheid\n\n"
        "### Vraag 5\n\n"
        "Welke teamfout zie je vaak bij spiritkeuze?\n\n"
        "A. Structuurfit negeren en op merknaam bouwen ✅\n"
        "B. Te weinig decoratie\n"
        "C. Te veel ijs in freezer\n"
        "D. Te snelle pinbetaling\n"
    ),
    12: (
        "### Vraag 4\n\n"
        "Een cocktail wordt plakkerig zoet na likeurtoevoeging. Wat doe je?\n\n"
        "A. Nog meer likeur\n"
        "B. Dosering terug en zuur/bitteras herstellen ✅\n"
        "C. Alleen garnishes wisselen\n"
        "D. Water toevoegen zonder proef\n\n"
        "### Vraag 5\n\n"
        "Waarom is likeur een risicocomponent in piekservice?\n\n"
        "A. Omdat likeuren geen aroma hebben\n"
        "B. Omdat kleine ml-afwijkingen balans sterk verschuiven ✅\n"
        "C. Omdat likeuren altijd goedkoop zijn\n"
        "D. Omdat ze geen suiker bevatten\n"
    ),
    13: (
        "### Vraag 4\n\n"
        "Een cocktail mist lengte in de afdronk. Welke tool helpt vaak?\n\n"
        "A. Extra siroop\n"
        "B. Precisiedosering bitters voor spanning en droge finish ✅\n"
        "C. Minder ijs\n"
        "D. Extra room\n\n"
        "### Vraag 5\n\n"
        "Wat is professioneel bittergebruik?\n\n"
        "A. Op gevoel grote scheuten\n"
        "B. Reproduceerbare dash-techniek per recept ✅\n"
        "C. Bitters alleen als kleur\n"
        "D. Bitters altijd vervangen door zout\n"
    ),
    14: (
        "### Vraag 4\n\n"
        "Je sour smaakt in avondshift zuurder dan middagshift. Waarschijnlijk?\n\n"
        "A. Citrussterkte veranderde, ratio niet mee aangepast ✅\n"
        "B. Glas werd te schoon\n"
        "C. IJs was te hard\n"
        "D. Barspoon te lang\n\n"
        "### Vraag 5\n\n"
        "Welke routine houdt zuur-zoetbalans stabiel?\n\n"
        "A. Geen checks, alleen vertrouwen op receptkaart\n"
        "B. Shiftgewijze line-check met kleine ratio-correcties ✅\n"
        "C. Alleen extra suiker klaarzetten\n"
        "D. Elke cocktail dezelfde garnish\n"
    ),
    15: (
        "### Vraag 4\n\n"
        "Je mini-toets toont consistente oververdunning in sours. Beste opvolging?\n\n"
        "A. Meer shakekracht zonder analyse\n"
        "B. IJsmanagement en shakevenster gericht retrainen ✅\n"
        "C. Alle recepten herschrijven\n"
        "D. Minder meten aan de bar\n\n"
        "### Vraag 5\n\n"
        "Waarom is foutenanalyse na de toets essentieel?\n\n"
        "A. Omdat cijfers genoeg zeggen\n"
        "B. Omdat patroonherkenning directe serviceverbetering oplevert ✅\n"
        "C. Omdat trainen niet nodig is\n"
        "D. Omdat gasten geen verschil proeven\n"
    ),
    16: (
        "### Vraag 4\n\n"
        "Martini valt vlak uit ondanks premium gin. Eerste correctie?\n\n"
        "A. Meer olive brine\n"
        "B. Vermoutverhouding en roertijd herkalibreren ✅\n"
        "C. Extra suikersiroop\n"
        "D. Langer shaken\n\n"
        "### Vraag 5\n\n"
        "Welke vraag voorkomt de meeste Martini-remakes?\n\n"
        "A. Alleen 'met ijs?'\n"
        "B. Dry/wet-voorkeur en gewenste garnish vooraf ✅\n"
        "C. 'Ken je James Bond?'\n"
        "D. 'Wil je een foto?'\n"
    ),
    20: (
        "### Vraag 4\n\n"
        "Daiquiri smaakt plots vlak in drukke service. Wat check je eerst?\n\n"
        "A. Of de limebatch nog voldoende zuurspanning heeft ✅\n"
        "B. Alleen coupekleur\n"
        "C. Alleen rietjesvoorraad\n"
        "D. Alleen gastfeedback achteraf\n\n"
        "### Vraag 5\n\n"
        "Welke routine borgt Daiquiri-consistentie het best?\n\n"
        "A. Iedereen eigen ratio laten kiezen\n"
        "B. Startshift referentieglas en periodieke line-check ✅\n"
        "C. Altijd extra siroop toevoegen\n"
        "D. Nooit proeven tijdens service\n"
    ),
}


QUIZ_FULL: dict[int, str] = {
    15: (
        "### Vraag 1\n\n"
        "Wat meet een mini-toets primair?\n\n"
        "A. Alleen theoriekennis\n"
        "B. Integratie van techniek, balans en besluitvorming ✅\n"
        "C. Alleen snelheid\n"
        "D. Alleen glaswerk\n\n"
        "### Vraag 2\n\n"
        "Welke techniek hoort bij een spirit-forward cocktail in de toets?\n\n"
        "A. Shaken\n"
        "B. Stirred ✅\n"
        "C. Muddling\n"
        "D. Layering\n\n"
        "### Vraag 3\n\n"
        "Wat is de grootste risicofactor bij vier cocktails achter elkaar?\n\n"
        "A. Te weinig ijs in voorraad\n"
        "B. Verlies van verdunningscontrole en tempo ✅\n"
        "C. Te veel garnish\n"
        "D. Te koude coupe\n\n"
        "### Vraag 4\n\n"
        "Je mini-toets toont consistente oververdunning in sours. Beste opvolging?\n\n"
        "A. Meer shakekracht zonder analyse\n"
        "B. IJsmanagement en shakevenster gericht retrainen ✅\n"
        "C. Alle recepten herschrijven\n"
        "D. Minder meten aan de bar\n\n"
        "### Vraag 5\n\n"
        "Waarom is foutenanalyse na de toets essentieel?\n\n"
        "A. Omdat cijfers genoeg zeggen\n"
        "B. Omdat patroonherkenning directe serviceverbetering oplevert ✅\n"
        "C. Omdat trainen niet nodig is\n"
        "D. Omdat gasten geen verschil proeven\n\n"
        "### Vraag 6\n\n"
        "Welke cocktail in de toets vraagt muddling?\n\n"
        "A. Martini\n"
        "B. Mojito of mojito-achtige opdracht ✅\n"
        "C. Manhattan\n"
        "D. Negroni\n\n"
        "### Vraag 7\n\n"
        "Wat hoort in mise en place vóór een mini-toets?\n\n"
        "A. Alleen spirits\n"
        "B. IJs, tools, glaswerk en vooraf gemeten modifiers ✅\n"
        "C. Alleen citrus\n"
        "D. Alleen receptkaart\n\n"
        "### Vraag 8\n\n"
        "Highball in de toets: kritische succesfactor?\n\n"
        "A. Maximale shakekracht\n"
        "B. Build-volgorde en koolzuurbehoud ✅\n"
        "C. Dubbele fine strain\n"
        "D. Warm serveren\n\n"
        "### Vraag 9\n\n"
        "Stirred cocktail valt waterig uit. Eerste hypothese?\n\n"
        "A. Te weinig vermout\n"
        "B. Te lang roeren of te klein ijscontact ✅\n"
        "C. Te weinig garnish\n"
        "D. Verkeerde coupe\n\n"
        "### Vraag 10\n\n"
        "Wat maakt mini-toetsresultaat schaalbaar?\n\n"
        "A. Eenmalige perfecte run\n"
        "B. Herhaalbare standaard en gedocumenteerde correcties ✅\n"
        "C. Improvisatie per shift\n"
        "D. Minder proeven tijdens service\n"
    ),
    17: (
        "### Vraag 1\n\n"
        "Wat is de kernstructuur van een Old Fashioned?\n\n"
        "A. Spirit, citrus, suiker, eiwit\n"
        "B. Spirit, suiker, bitters, verdunning ✅\n"
        "C. Spirit, vermout, bitters\n"
        "D. Spirit, soda, citrus\n\n"
        "### Vraag 2\n\n"
        "Welke fout maakt een Old Fashioned het snelst vlak?\n\n"
        "A. Te weinig garnish\n"
        "B. Oververdunning door slecht ijsmanagement ✅\n"
        "C. Te kleine coupe\n"
        "D. Te koude barspoon\n\n"
        "### Vraag 3\n\n"
        "Welke techniek past het best bij klassieke Old Fashioned-service?\n\n"
        "A. Hard shaken\n"
        "B. Direct build en korte gecontroleerde stir op ijs ✅\n"
        "C. Dry shake en fine strain\n"
        "D. Layering in shotglas\n\n"
        "### Vraag 4\n\n"
        "Een gast wil minder zoet maar wel rond. Beste aanpassing?\n\n"
        "A. Meer suiker en minder bitters\n"
        "B. Suiker licht verlagen en bitter/verdunning preciezer sturen ✅\n"
        "C. Citroensap toevoegen\n"
        "D. Soda top-up toevoegen\n\n"
        "### Vraag 5\n\n"
        "Welke garnishkeuze ondersteunt de Old Fashioned meestal het best?\n\n"
        "A. Muntbos\n"
        "B. Citruszeste met gecontroleerde aromatische lift ✅\n"
        "C. Komkommerschijf\n"
        "D. Zout rand\n"
    ),
    18: (
        "### Vraag 1\n\n"
        "Wat is de klassieke basis van een Manhattan?\n\n"
        "A. Rye of bourbon met zoete vermout en bitters ✅\n"
        "B. Gin met droge vermout\n"
        "C. Rum met limoensap\n"
        "D. Tequila met agave\n\n"
        "### Vraag 2\n\n"
        "Welke techniek hoort bij Manhattan-bouw?\n\n"
        "A. Shaken met crushed ice\n"
        "B. Stirred met koud compact ijs voor helderheid ✅\n"
        "C. Layered in highball\n"
        "D. Built met soda\n\n"
        "### Vraag 3\n\n"
        "Waarom is vermoutversheid cruciaal in een Manhattan?\n\n"
        "A. Alleen voor kleur\n"
        "B. Oude vermout verliest integratie en maakt het profiel vlak ✅\n"
        "C. Omdat bitters dan overbodig zijn\n"
        "D. Omdat whiskey dan minder alcohol heeft\n\n"
        "### Vraag 4\n\n"
        "Een Manhattan smaakt log. Wat corrigeer je eerst?\n\n"
        "A. Meer suiker\n"
        "B. Verhouding whiskey-vermouth en verdunningsniveau ✅\n"
        "C. Alleen garnish verwijderen\n"
        "D. Extra citrussap\n\n"
        "### Vraag 5\n\n"
        "Welke garnish sluit klassiek het best aan bij een Manhattan?\n\n"
        "A. Selderij\n"
        "B. Cocktailkers met gecontroleerde dosage-impact ✅\n"
        "C. Sinaasappelsap\n"
        "D. Rietsuiker rand\n"
    ),
    19: (
        "### Vraag 1\n\n"
        "Wat is de klassieke ratio van een Negroni?\n\n"
        "A. 2:1:1\n"
        "B. 1:1:1 ✅\n"
        "C. 3:2:1\n"
        "D. 1:2:1\n\n"
        "### Vraag 2\n\n"
        "Welke component levert de kern van de bittere spanning?\n\n"
        "A. Zoete vermout\n"
        "B. Campari of vergelijkbare bittercomponent ✅\n"
        "C. Soda\n"
        "D. Eiwit\n\n"
        "### Vraag 3\n\n"
        "Welke techniek is standaard voor Negroni-service?\n\n"
        "A. Hard shaken\n"
        "B. Build over ijs met korte gecontroleerde stir ✅\n"
        "C. Dry shake\n"
        "D. Layering in flute\n\n"
        "### Vraag 4\n\n"
        "De Negroni smaakt scherp en kort. Wat helpt het meest?\n\n"
        "A. Meer campari toevoegen\n"
        "B. Verdunning finetunen en componentkwaliteit checken ✅\n"
        "C. Suikerrand toevoegen\n"
        "D. Koolzuur toevoegen\n\n"
        "### Vraag 5\n\n"
        "Waarom is duidelijke variantcommunicatie bij Negroni belangrijk?\n\n"
        "A. Omdat varianten identiek smaken\n"
        "B. Omdat bitter-zoetprofiel sterk kan verschuiven per twist ✅\n"
        "C. Omdat garnish altijd hetzelfde is\n"
        "D. Omdat gin geen rol speelt\n"
    ),
    21: (
        "### Vraag 1\n\n"
        "Wat is de kern van een Whiskey Sour-structuur?\n\n"
        "A. Whiskey, citrus, zoet, optionele textuurlaag ✅\n"
        "B. Whiskey, vermout, bitters\n"
        "C. Whiskey, soda, zout\n"
        "D. Whiskey, room, likeur\n\n"
        "### Vraag 2\n\n"
        "Welke techniek verhoogt foamstabiliteit het meest?\n\n"
        "A. Alleen wet shake\n"
        "B. Dry shake gevolgd door wet shake ✅\n"
        "C. Alleen roeren\n"
        "D. Layering met lepel\n\n"
        "### Vraag 3\n\n"
        "Een Whiskey Sour smaakt te scherp. Eerste correctie?\n\n"
        "A. Extra citrussap\n"
        "B. Zoetcomponent in kleine stap verhogen en herkalibreren ✅\n"
        "C. Meer bitters direct in bulk\n"
        "D. Minder ijs gebruiken\n\n"
        "### Vraag 4\n\n"
        "Welke rol heeft bitters-garnish op de foamlaag?\n\n"
        "A. Alleen decoratie\n"
        "B. Extra aromatische lift en subtiele bitterspanning ✅\n"
        "C. Verhoogt ABV direct\n"
        "D. Vervangt citrus\n\n"
        "### Vraag 5\n\n"
        "Welke servicefout ondermijnt Whiskey Sour het vaakst?\n\n"
        "A. Te koude coupe\n"
        "B. Te late uitgifte waardoor foam en textuur instorten ✅\n"
        "C. Te korte menukaart\n"
        "D. Te veel barlicht\n"
    ),
}
