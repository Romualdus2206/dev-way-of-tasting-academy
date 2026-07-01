"""Wine Foundation Track V2 — Premium Gold Master repair data.

Lessen 11–25 (Modules 3–5):
- Module 3 — Proeven (11–15)
- Module 4 — Structuur specialist (16–20)
- Module 5 — Druivenrassen foundation (21–25)

Structuur per les (zelfde patroon als de m1_m2 repair-data):
- theorie, samenvatting, pro_insight, kernbegrippen (5 items)
- food_pairing (alleen 16–25) via fp()
- reflectievraag en quiz_patches zijn optioneel per les
"""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    # ------------------------------------------------------------------
    # Module 3 — Proeven (11–15) — GEEN food_pairing
    # ------------------------------------------------------------------
    11: {
        "theorie": (
            "Proeven is een protocol, geen gevoel. Waarom een vaste volgorde? Omdat een conclusie die je te snel "
            "trekt — meestal op aroma alleen — zelden klopt zodra je structuur of kleur erbij betrekt. Vaste "
            "volgorde dwingt je om elke laag apart te toetsen vóór je een oordeel velt.\n\n"
            "De volgorde is altijd: visueel (helderheid, kleur, intensiteit), neus (eerste indruk, swirl, tweede "
            "indruk), mond (eerste indruk, structuur, lengte), conclusie. Elke stap levert een hypothese die de "
            "volgende stap bevestigt of weerlegt — kleur voorspelt iets over leeftijd of klimaat, de neus toetst "
            "dat, de mond toetst opnieuw.\n\n"
            "Waarom apart proeven en niet alles tegelijk? Omdat aroma en structuur verschillende zintuigen "
            "gebruiken en elkaar maskeren als je ze niet bewust scheidt. Een krachtig aroma kan een zwakke "
            "structuur verbloemen als je niet apart op mondgevoel let, en omgekeerd.\n\n"
            "Wanneer pas je dit protocol toe? Bij elk glas, zonder uitzondering. Niet alleen bij blindproeven of "
            "examens — juist de herhaling bij gewone glazen bouwt het proefgeheugen op waarmee je later sneller "
            "en betrouwbaarder conclusies trekt."
        ),
        "samenvatting": (
            "- Proeven volgt een vaste volgorde: visueel, neus, mond, conclusie\n"
            "- Vaste volgorde voorkomt te snelle, onderbouwde conclusies\n"
            "- Elke stap levert een hypothese die de volgende stap toetst\n"
            "- Structuur proef je bewust apart van aroma, niet tegelijk\n"
            "- Consistente herhaling bouwt een betrouwbaar proefgeheugen op"
        ),
        "pro_insight": (
            "Noteer bij elk glas drie woorden per stap — kleur, neus, mond — vóórdat je een conclusie trekt. "
            "Dat voorkomt dat smaakvoorkeur de analyse overneemt."
        ),
        "kernbegrippen": [
            "proefprotocol",
            "visuele analyse",
            "aromaherkenning",
            "structuuranalyse",
            "proefconclusie",
        ],
        "reflectievraag": (
            "Welke stap sla jij nu het vaakst over — visueel, neus of structuur — en welke verkeerde conclusie "
            "levert dat al snel op?"
        ),
    },
    12: {
        "theorie": (
            "Kleur is de eerste diagnostische laag, nog vóór je ruikt of proeft. Intensiteit, kleurtoon en de "
            "rand van de wijn geven samen een eerste hypothese over druif, leeftijd, klimaat en wijnmaakstijl — "
            "lang voordat het etiket bevestigt of weerspreekt wat je ziet.\n\n"
            "Bij witte wijn loopt de schaal van lichtgroen-geel (jong, koel klimaat, weinig of geen houtcontact) "
            "naar goud en amber (rijper, warmer klimaat, houtlagering of oxidatieve invloed). Bij rode wijn "
            "vertelt de rand het meest: een paarse, violette rand wijst op jeugd; een baksteen- of "
            "oranjeachtige rand wijst op leeftijd of versnelde oxidatie.\n\n"
            "Hoe lees je dat objectief? Kantel het glas tegen een witte achtergrond en kijk eerst naar de rand, "
            "niet naar het midden — daar zit het eerste leeftijdssignaal. Kleurdiepte hangt verder samen met "
            "schildikte en extractie, niet uitsluitend met de druif: een dikschillige druif geeft sneller diepe "
            "kleur dan een dunschillige, los van leeftijd.\n\n"
            "Wanneer gebruik je dit bewust? Bij blindproeven, bij kwaliteitscontrole en bij het inschatten van "
            "leeftijd of fraude-risico. Kleur is altijd een hypothese, geen eindconclusie — de neus en de mond "
            "moeten die hypothese nog bevestigen."
        ),
        "samenvatting": (
            "- Kleurintensiteit, kleurtoon en kleurrand geven een eerste hypothese\n"
            "- Witte wijn: lichtgroen-geel wijst op jong/koel; goud-amber op rijp of oxidatief\n"
            "- Rode wijn: paarse rand wijst op jeugd; baksteenrand op leeftijd\n"
            "- Kleurdiepte hangt samen met schildikte en extractie, niet alleen met de druif\n"
            "- Kleuranalyse is een hypothese, geen eindconclusie"
        ),
        "pro_insight": (
            "Kantel het glas tegen een witte achtergrond en kijk eerst naar de rand, niet het midden — "
            "daar zit de eerste leeftijdsindicatie, nog vóór je ruikt."
        ),
        "kernbegrippen": [
            "kleurintensiteit",
            "kleurrand",
            "oxidatieve rijping",
            "schilcontact",
            "leeftijdshypothese",
        ],
        "reflectievraag": (
            "Bij welke wijn verraste de kleur je het meest ten opzichte van wat je proefde — en welke hypothese "
            "paste je daarna aan?"
        ),
    },
    13: {
        "theorie": (
            "Aroma's in wijn ordenen zich in drie lagen. Primair komt rechtstreeks uit de druif: fruit, bloemen, "
            "kruiden. Secundair ontstaat tijdens gisting en vinificatie: gist, brooddeeg, boter. Tertiair "
            "ontwikkelt zich tijdens rijping op vat of fles: noten, honing, leder, gedroogd fruit. Waarom die "
            "lagen scheiden? Omdat de dominante laag direct iets verklapt over de productiekeuzes — een wijn "
            "vol primair fruit is jong en vaak ongehout; een wijn met sterke tertiaire tonen heeft tijd "
            "gehad.\n\n"
            "Hoe train je herkenning? Ruik twee keer: eerst stilstaand glas, dan na swirlen. Swirlen activeert "
            "vluchtige aromastoffen die in een stil glas verborgen blijven; het verschil tussen die twee passes "
            "is vaak precies de secundaire of tertiaire laag. Beperk je tot één descriptor per laag, maximaal "
            "drie in totaal — een overvolle proefnotitie is een vage proefnotitie.\n\n"
            "Waarom is dit meer dan een woordenspel? Omdat de dominante aromalaag al een eerste pairingrichting "
            "geeft: vers primair fruit vraagt om frisse, lichte gerechten; secundaire en tertiaire tonen passen "
            "vaker bij romige of hartige gerechten.\n\n"
            "Wanneer gebruik je dit bewust? Bij elke nieuwe wijn, en zeker bij het matchen van wijn aan een "
            "gerecht — de aromalaag bepaalt mee welke kant je culinair op kunt."
        ),
        "samenvatting": (
            "- Primair = druif en fruit, secundair = gisting/vinificatie, tertiair = rijping\n"
            "- Swirlen activeert vluchtige aroma's die een stil glas verbergt\n"
            "- Eén descriptor per laag, maximaal drie totaal, voorkomt vage notities\n"
            "- De dominante laag verklapt productiekeuzes: vers fruit versus hout of fles\n"
            "- Aromalagen sturen al een eerste pairingrichting"
        ),
        "pro_insight": (
            "Ruik twee keer — eerst stil, dan na swirlen — en benoem alleen wat erbij komt. Dat verschil is "
            "meestal precies de secundaire of tertiaire laag."
        ),
        "kernbegrippen": [
            "primair aroma",
            "secundair aroma",
            "tertiair aroma",
            "swirlen",
            "aromaherkomst",
        ],
        "reflectievraag": (
            "Welke aromalaag herken jij het minst betrouwbaar — en welke oefening zou dat het snelst verbeteren?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Je ruikt brooddeeg en gistige tonen naast vers citrusfruit. Welke twee aromalagen proef je hier "
            "samen?\n\n"
            "A. Primair en tertiair\n"
            "B. Primair en secundair ✅\n"
            "C. Secundair en tertiair\n"
            "D. Alleen tertiair\n\n"
        ),
    },
    14: {
        "theorie": (
            "Structuur is hoe een wijn zich gedraagt in de mond, los van wat je ruikt. Op foundation-niveau "
            "leer je vijf elementen herkennen: zuur, tannine, alcohol, body en balans — de volle technische "
            "diepte van elk element volgt in Module 4. Hier leer je ze eerst apart voelen.\n\n"
            "Zuur voel je als frisheid en speekselopwekking aan de zijkanten van de tong. Tannine voel je als "
            "droogte en grip op tandvlees en wangen, vooral bij rode wijn. Alcohol voel je als warmte achterin "
            "de mond en keel. Body is het gewicht of de viscositeit die de wijn in de mond geeft — licht, "
            "medium of vol. Balans is geen apart gevoel maar een conclusie: voelt geen van de andere vier "
            "elementen overheersend?\n\n"
            "Hoe test je dat objectief? Neem een slok, houd hem even vast en doorloop de elementen in volgorde: "
            "eerst zuur (zijkanten tong), dan tannine (tandvlees/wangen), dan alcohol (warmte), dan body "
            "(totaalgewicht). Proef structuur bewust los van aroma — sluit zo nodig je ogen en focus alleen op "
            "wat je mond voelt.\n\n"
            "Waarom is dit al op foundation-niveau nuttig? Omdat structuur, niet aroma, meestal de "
            "doorslaggevende factor is bij eenvoudige pairingbeslissingen: een gerecht met veel vet vraagt om "
            "zuur of tannine, een gerecht met weinig smaak vraagt om een lichtere body."
        ),
        "samenvatting": (
            "- Structuur = zuur, tannine, alcohol, body en de balans daartussen\n"
            "- Zuur voel je als frisheid en speekselopwekking\n"
            "- Tannine voel je als droogte en grip, vooral bij rode wijn\n"
            "- Alcohol voel je als warmte; body als gewicht in de mond\n"
            "- Balans betekent dat geen element de andere overheerst"
        ),
        "pro_insight": (
            "Proef structuur apart van aroma: sluit je ogen, focus alleen op wat je mond voelt, niet op wat je "
            "ruikt. Dat ontkoppelt twee zintuigen die je brein anders automatisch samenvoegt."
        ),
        "kernbegrippen": [
            "zuur",
            "tannine",
            "alcohol",
            "body",
            "structurele harmonie",
        ],
        "reflectievraag": (
            "Welk structuurelement voel jij het lastigst om los te proeven van de andere — en waarom denk je "
            "dat dat is?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Je proeft een wijn die droogte op je tandvlees geeft, weinig merkbare zoetheid en duidelijke "
            "warmte achterin de keel. Welke twee structuurelementen proef je hier het sterkst?\n\n"
            "A. Zuur en zoet\n"
            "B. Tannine en alcohol ✅\n"
            "C. Body en zoet\n"
            "D. Zuur en tannine\n\n"
        ),
    },
    15: {
        "theorie": (
            "Deze mini-toets integreert kleur, aroma en structuur in één protocol — het moment waarop losse "
            "vaardigheden samenkomen tot één proefoordeel. Waarom blind proeven op dit punt? Omdat je pas ziet "
            "of je protocol standhoudt wanneer je het zonder etiket moet toepassen, zonder vooringenomenheid "
            "over druif of regio.\n\n"
            "Je toetst in vaste volgorde: visuele kleur (intensiteit, rand), aromadominantie (primair versus "
            "secundair/tertiair), structuurprofiel (zuur, tannine, alcohol, body, balans), en pas daarna een "
            "stijlhypothese — koel klimaat en fris, of warmer klimaat en vol. Documenteer die hypothese vóór de "
            "onthulling; dat dwingt objectieve calibratie in plaats van achteraf redeneren.\n\n"
            "Hoe bereid je je voor? Vaste volgorde visueel → neus → mond → conclusie, en noteer bij je conclusie "
            "altijd één tegenargument. Fouten ontstaan meestal omdat je op aroma alleen al een conclusie trekt "
            "vóór structuur is getoetst.\n\n"
            "Wanneer herhaal je deze integratietoets? Maandelijks, met twee willekeurige flessen uit eigen "
            "voorraad — zo bouw je een persoonlijke referentiebibliotheek op die sneller groeit dan losse "
            "lesoefeningen alleen."
        ),
        "samenvatting": (
            "- Mini-toets combineert kleur, aroma en structuur in één protocol\n"
            "- Hypothese vóór onthulling traint objectieve, niet-achterafse conclusies\n"
            "- Fouten ontstaan meestal door te snel oordelen op aroma alleen\n"
            "- Herhaling met eigen voorraad bouwt een referentiebibliotheek op\n"
            "- Integratie van drie analyse-assen is de kern van deze toets"
        ),
        "pro_insight": (
            "Leg na elke blindronde je grootste denkfout vast in één zin — bijvoorbeeld 'te snel naar fruit, "
            "te weinig naar structuur'. Dat versnelt leren meer dan tien wijnen zonder reflectie."
        ),
        "kernbegrippen": [
            "blind proeven",
            "stijlhypothese",
            "integratie",
            "proefprotocol",
            "referentiebibliotheek",
        ],
        "reflectievraag": (
            "Welke ene observatie — kleur, aroma of structuur — had jouw conclusie het sterkst moeten sturen, "
            "en waar ging je te snel?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Blind: lichtgele kleur met groene rand, intens citrus- en kruidaroma, hoog zuur, licht van "
            "lichaam. Welke combinatie van hypotheses past het beste?\n\n"
            "A. Warm klimaat, neutrale druif, lange houtlagering\n"
            "B. Koel klimaat, aromatische druif, geen houtlagering ✅\n"
            "C. Warm klimaat, aromatische druif, lange flesrijping\n"
            "D. Koel klimaat, neutrale druif, lange houtlagering\n\n"
        ),
    },
    # ------------------------------------------------------------------
    # Module 4 — Structuur specialist (16–20) — food_pairing verplicht
    # ------------------------------------------------------------------
    16: {
        "theorie": (
            "Zuur is de ruggengraat van wijn. Het bepaalt frisheid, bewaarpotentieel en pairing-kracht: zuur "
            "snijdt door vet en zout in een gerecht en houdt de wijn zelf levendig na jaren in de fles. Zonder "
            "voldoende zuur valt een wijn snel plat, hoe rijk het fruit ook is.\n\n"
            "Waarom verschilt zuur zo sterk per wijn? Klimaat is de grootste factor: koelere streken behouden "
            "meer natuurlijke zuren omdat druiven minder snel overrijpen, warmere streken verliezen zuur "
            "sneller tijdens rijping. Daarnaast speelt de druif zelf een rol — Riesling en Sauvignon Blanc "
            "houden van nature hoger zuur vast dan Viognier of Grenache.\n\n"
            "Hoe proef je zuur objectief? Let op speekselopwekking aan de zijkanten van de tong en op hoe lang "
            "die sensatie aanhoudt. Vergelijk twee wijnen altijd bij dezelfde temperatuur — te koud overdrijft "
            "zuur, te warm verdoezelt het.\n\n"
            "Wanneer gebruik je zuur als beslissend criterium? Bij elk gerecht met vet of zout: hoog zuur snijdt "
            "daar doorheen en houdt de mond fris. Een laagzuur wijn mist die kracht en heeft fruit of body nodig "
            "om hetzelfde gerecht te kunnen dragen."
        ),
        "samenvatting": (
            "- Zuur is de ruggengraat: bepaalt frisheid en bewaarpotentieel\n"
            "- Koel klimaat en bepaalde druiven geven van nature meer zuur\n"
            "- Je proeft zuur als speekselopwekking aan de zijkanten van de tong\n"
            "- Hoog zuur snijdt door vet en zout in een gerecht\n"
            "- Laag zuur wijn heeft fruit of body nodig ter compensatie"
        ),
        "food_pairing": fp(
            "Hoogzuur wit (droge Riesling, Sauvignon Blanc) bij vette visgerechten met beurre blanc of romige "
            "saus.",
            "Zuur snijdt door het vet en houdt het gerecht licht zonder de smaak te verdoezelen; het reset de "
            "mond voor elke volgende hap.",
            "Laagzuur, volle witte wijn bij hetzelfde vette gerecht — de wijn voelt dan log en het gerecht "
            "domineert in plaats van de combinatie.",
        ),
        "pro_insight": (
            "Test zuur altijd bij dezelfde temperatuur als waarop je serveert — te koud overdrijft zuur, te "
            "warm verdoezelt het en geeft een vertekend beeld."
        ),
        "kernbegrippen": [
            "zuurgraad",
            "frisheid",
            "bewaarpotentieel",
            "speekselopwekking",
            "zuur-vetbalans",
        ],
        "reflectievraag": (
            "Bij welk gerecht op jouw kaart zou een hoger zuurprofiel de pairing meteen verbeteren?"
        ),
    },
    17: {
        "theorie": (
            "Tannine ontstaat uit fenolen in schil, pit en steel — en, bij houtlagering, ook uit het vat zelf. "
            "Het is vooral relevant bij rode wijn, maar speelt ook een rol bij wijnen met langdurig schilcontact. "
            "Tannine geeft structuur, draagt bij aan bewaarpotentieel en bepaalt een groot deel van het "
            "mondgevoel.\n\n"
            "De hoeveelheid en het karakter van tannine volgen uit de druif en de productie: dikschillige "
            "druiven zoals Cabernet Sauvignon en Nebbiolo geven van nature meer tannine dan dunschillige "
            "druiven zoals Pinot Noir of Gamay. Houtlagering voegt een extra laag tannine toe, los van de "
            "druif.\n\n"
            "Hoe proef je tannine, en hoe herken je kwaliteit? Voel je naar droogte en grip op tandvlees en "
            "wangen. Rijpe tannine voelt zacht en geïntegreerd; onrijpe of 'groene' tannine voelt scherp en "
            "bijtend, ook al is de hoeveelheid soms vergelijkbaar.\n\n"
            "Wanneer is tannine beslissend voor je advies? Eiwit en vet in een gerecht binden tanninemoleculen "
            "en maken de wijn zachter, terwijl het vlees of de saus zelf sappiger overkomt. Zonder dat tegenwicht "
            "domineert tannine een gerecht juist."
        ),
        "samenvatting": (
            "- Tannine komt van schil, pit, steel en eventueel houtlagering\n"
            "- Je voelt tannine als droogte en grip op tandvlees en wangen\n"
            "- Dikschillige druiven en houtlagering geven van nature meer tannine\n"
            "- Rijpe tannine voelt zacht; onrijpe tannine voelt scherp en groen\n"
            "- Eiwit en vet temperen de drogende werking van tannine"
        ),
        "food_pairing": fp(
            "Tanninerijke rode wijn (Cabernet Sauvignon, Nebbiolo) bij geroosterd rood vlees met natuurlijk "
            "vet.",
            "Eiwit en vet binden de tanninemoleculen, waardoor de wijn zachter aanvoelt en het vlees juist "
            "sappiger overkomt.",
            "Dezelfde tanninerijke wijn bij een licht, eiwitarm visgerecht — de tannine domineert dan zonder "
            "tegenwicht en voelt metalig.",
        ),
        "pro_insight": (
            "Laat een gast tannine bewust voelen door de wijn even op het tandvlees te houden vóór doorslikken "
            "— dat maakt het verschil tussen 'droog' en 'bitter' meteen duidelijk."
        ),
        "kernbegrippen": [
            "tannine",
            "fenolen",
            "schilcontact",
            "rijpe tannine",
            "eiwit-tanninebinding",
        ],
        "reflectievraag": "Welke tanninerijke wijn op je kaart verdient een vetter gerecht dan hij nu krijgt?",
    },
    18: {
        "theorie": (
            "Alcohol ontstaat tijdens gisting wanneer gist suiker omzet — hoe meer suiker er bij de oogst in de "
            "druif zit, hoe hoger het potentiële alcoholniveau. Klimaat en rijpheidskeuze bij de oogst bepalen "
            "dus grotendeels het natuurlijke alcoholgehalte, vóór de wijnmaker nog iets beslist.\n\n"
            "Hoe voel je alcohol in de mond? Niet als smaak maar als warmte, vooral achterin de mond en in de "
            "keel. Alcohol draagt ook bij aan body en kan zelfs aanvoelen als zoetheid, ook in een technisch "
            "droge wijn — een veelgemaakte verwarring bij beginnende proevers.\n\n"
            "Waarom is de balans met zuur hier cruciaal? Hoog alcohol zonder voldoende zuur voelt log of "
            "'heet' aan; hoog alcohol met genoeg zuur kan juist goed geïntegreerd overkomen, zoals bij volle "
            "Chardonnay uit een warmer klimaat. Alcohol op zichzelf is dus nooit het hele verhaal.\n\n"
            "Wanneer is alcohol beslissend voor je advies? Alcohol versterkt de brandende werking van scherp "
            "gekruid eten — chili en hoog alcohol vormen een slechte combinatie. Bij stevige, hartige gerechten "
            "met veel umami werkt diezelfde warmte juist ondersteunend."
        ),
        "samenvatting": (
            "- Alcohol ontstaat uit suikeromzetting tijdens gisting\n"
            "- Klimaat en rijpheid bij de oogst bepalen het natuurlijke alcoholniveau\n"
            "- Je voelt alcohol als warmte achterin de mond en keel, niet als smaak\n"
            "- Hoog alcohol zonder genoeg zuur voelt log of 'heet' aan\n"
            "- Alcohol versterkt de brandende werking van pittig eten"
        ),
        "food_pairing": fp(
            "Volle, hoog-alcohol witte of rode wijn bij stevige, hartige stoofschotels met umami-diepte.",
            "Alcohol en body matchen de zwaarte van het gerecht; de warmte van de wijn versterkt umami zonder "
            "dat zuur of tannine hoeven te compenseren.",
            "Hoog-alcohol wijn bij scherp gekruide, pittige gerechten — alcohol versterkt de brandende sensatie "
            "van chili in plaats van die te verzachten.",
        ),
        "pro_insight": (
            "Bij twijfel over het alcoholniveau: vraag of de afdronk warmte achterlaat in de keel. Dat is een "
            "betrouwbaardere test dan het percentage op het etiket."
        ),
        "kernbegrippen": [
            "alcoholpercentage",
            "gistingsproces",
            "warmtesensatie",
            "body-bijdrage",
            "alcohol-pittigheid",
        ],
        "reflectievraag": (
            "Welk gerecht op je kaart zou je heroverwegen omdat de wijn ernaast te veel alcoholwarmte toevoegt?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een gast klaagt dat een wijn 'heet' aanvoelt, zonder dat het etiket een extreem hoog percentage "
            "toont. Wat is de meest logische verklaring?\n\n"
            "A. Te veel tannine\n"
            "B. Te weinig zuur om de alcohol te balanceren ✅\n"
            "C. Te veel restsuiker\n"
            "D. Te koude serveertemperatuur\n\n"
        ),
    },
    19: {
        "theorie": (
            "Body is het gewicht of de viscositeit die je in de mond voelt — los van aroma en los van zoetheid "
            "alleen. Alcohol, glycerol, extract en tannine bouwen samen die sensatie op; hoe meer van elk, hoe "
            "voller de wijn aanvoelt.\n\n"
            "Licht, medium en vol zijn relatieve categorieën, geen absolute meetwaarden. Een handige analogie: "
            "vergelijk body met melk — licht is als halfvolle melk, vol is als room. Klimaat, druif en "
            "wijnmaakkeuzes (houtlagering, lees-contact, malolactische gisting) duwen een wijn richting een "
            "van die drie.\n\n"
            "Hoe proef je body objectief, los van smaakvoorkeur? Laat een gast twee wijnen vergelijken puur op "
            "'mondgevoel', zonder aroma te benoemen — body wordt dan voelbaar als een apart kenmerk, niet als "
            "onderdeel van de algemene indruk.\n\n"
            "Wanneer is body beslissend voor je advies? Body moet matchen met het gewicht van het gerecht: een "
            "lichte wijn naast een zwaar, romig gerecht verdwijnt; een volle wijn naast een delicaat gerecht "
            "overweldigt het. Mismatch op body is een van de meest voorkomende pairingfouten."
        ),
        "samenvatting": (
            "- Body is het gewicht en de viscositeit die je in de mond voelt\n"
            "- Alcohol, glycerol, extract en tannine bouwen samen body op\n"
            "- Licht, medium en vol zijn relatieve, geen absolute categorieën\n"
            "- Vergelijk body met melk: licht als halfvol, vol als room\n"
            "- Body moet matchen met het gewicht van het gerecht"
        ),
        "food_pairing": fp(
            "Volle, romige witte wijn (gerijpt op hout of lees) bij rijke gevogelte- of paddenstoelengerechten "
            "met boter.",
            "Gelijk gewicht houdt de balans: de textuur van de wijn matcht de textuur van het gerecht zonder "
            "dat een van beide verdwijnt.",
            "Lichte, slanke wijn bij een zwaar, romig gerecht — de wijn wordt dan onzichtbaar en voegt niets "
            "toe aan de smaakervaring.",
        ),
        "pro_insight": (
            "Laat een gast twee wijnen vergelijken op 'mondgevoel' zonder aroma te benoemen — body wordt dan "
            "voelbaar los van smaakvoorkeur."
        ),
        "kernbegrippen": [
            "body",
            "viscositeit",
            "glycerol",
            "extract",
            "gewichtmatching",
        ],
        "reflectievraag": (
            "Welke wijn op je kaart heeft een body die niet aansluit bij het gerecht waar hij nu naast staat?"
        ),
    },
    20: {
        "theorie": (
            "Balans is de synthese van alles wat je in deze module leerde: zuur, tannine, alcohol en body "
            "samen, zonder dat één element de andere overheerst. Een wijn kan op elk element apart technisch "
            "correct scoren en toch onbalans voelen als de verhouding tussen die elementen niet klopt.\n\n"
            "Waarom weegt balans zwaarder dan losse sterkte? Omdat een gerecht of een gast de wijn als geheel "
            "ervaart, niet als losse onderdelen. Hoog alcohol is geen probleem als het zuur het draagt; hoge "
            "tannine is geen probleem als body en fruit meegaan. Onbalans ontstaat zodra één element uit de pas "
            "loopt met de rest.\n\n"
            "Hoe beoordeel je balans systematisch? Score elk element apart — zuur, tannine, alcohol, body — en "
            "zoek de zwakste schakel. Die schakel is waar de wijn 'breekt', vooral zodra je eten toevoegt: een "
            "zwakte die in de wijn alleen nog meevalt, wordt scherp zichtbaar naast een complex gerecht.\n\n"
            "Wanneer gebruik je deze analyse in de praktijk? Stel bij elke pairingvraag eerst de vraag 'wat is "
            "de zwakste schakel in deze wijn?' vóór je het gerecht kiest. Dat voorkomt mismatches en geeft je "
            "ook een woord voor service-correctie: temperatuur, glas of een aangepast gerecht."
        ),
        "samenvatting": (
            "- Balans betekent dat geen structuurelement de andere overheerst\n"
            "- Beoordeel elk element apart en zoek de zwakste schakel\n"
            "- Een wijn kan technisch correct zijn en toch onbalans voelen\n"
            "- Onbalans wordt het scherpst zichtbaar zodra je eten toevoegt\n"
            "- Balans is het eindoordeel ná zuur, tannine, alcohol en body apart"
        ),
        "food_pairing": fp(
            "Goed gebalanceerde wijn met evenwicht tussen zuur en alcohol bij een gerecht met zowel zout als "
            "vet, zoals gebraden kip met jus.",
            "Balans in de wijn geeft ruimte om met meerdere smaakcomponenten in het gerecht te schakelen, "
            "zonder dat één element de match overneemt.",
            "Een onbalans wijn (hoog alcohol, laag zuur) bij een complex gerecht met zowel zoet als zuur — de "
            "wijn kan dan geen van beide goed dragen.",
        ),
        "pro_insight": (
            "Stel bij elke pairingvraag eerst de vraag 'wat is de zwakste schakel in deze wijn?' vóór je het "
            "gerecht kiest — dat voorkomt de meeste mismatches."
        ),
        "kernbegrippen": [
            "structurele harmonie",
            "zwakste schakel",
            "structuurevaluatie",
            "harmonie",
            "pairingbeslissing",
        ],
        "reflectievraag": (
            "Welke wijn op je kaart zou jij nu herclassificeren als 'onbalans' nadat je elk element apart hebt "
            "gescoord?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een wijn scoort hoog op alcohol en body, maar laag op zuur. Welke aanpassing in de bediening "
            "corrigeert de onbalans het beste?\n\n"
            "A. Serveer warmer om het aroma te benadrukken\n"
            "B. Combineer met een gerecht met voldoende vet en zout om de balans te ondersteunen ✅\n"
            "C. Voeg ijsblokjes toe aan het glas\n"
            "D. Schenk een groter glasvolume\n\n"
        ),
    },
    # ------------------------------------------------------------------
    # Module 5 — Druivenrassen foundation (21–25) — food_pairing verplicht
    # ------------------------------------------------------------------
    21: {
        "theorie": (
            "Witte druivenrassen vormen je eerste woordenboek voor stijl. Op foundation-niveau ga je niet de "
            "diepte van klonen, percelen of subregio's in — dat hoort bij de specialistische witwijntrack. Hier "
            "leer je vier druiven als startpunt herkennen: Chardonnay, Sauvignon Blanc, Riesling en Pinot "
            "Grigio.\n\n"
            "Chardonnay is een kameleon: de druif zelf is relatief neutraal en neemt vooral de signatuur van de "
            "wijnmaker over — hout, lees-contact en malolactische gisting bepalen meer dan de druif alleen. "
            "Sauvignon Blanc is aromatisch, met een kruidig-citrus karakter en van nature hoog zuur.\n\n"
            "Riesling combineert hoog zuur met een breed zoetheidsspectrum, van bot droog tot uitgesproken "
            "zoet, en bouwt daardoor een uitzonderlijk bewaarpotentieel op. Pinot Grigio is neutraal en licht "
            "van karakter, gericht op directe, toegankelijke drinkbaarheid zonder veel complexiteit te eisen "
            "van de proever.\n\n"
            "Waarom is dit nuttig vóór je verder gaat? Omdat druif je een starthypothese geeft, geen eindoordeel "
            "— klimaat en wijnmaken passen die hypothese later bij. Dat raamwerk komt terug in lesson 25."
        ),
        "samenvatting": (
            "- Chardonnay is een kameleon: stijl volgt vooral wijnmakerskeuzes\n"
            "- Sauvignon Blanc is aromatisch met kruidig-citruskarakter en hoog zuur\n"
            "- Riesling combineert hoog zuur met een breed zoetheidsspectrum\n"
            "- Pinot Grigio is neutraal en licht, gericht op directe drinkbaarheid\n"
            "- Druif geeft een starthypothese, geen eindoordeel over stijl"
        ),
        "food_pairing": fp(
            "Sauvignon Blanc bij geitenkaas of een kruidige groene salade met vinaigrette.",
            "Hoog zuur en het kruidig-citrus aroma matchen de frisheid en lichte zuurgraad van het gerecht, "
            "zonder dat de wijn wordt overweldigd.",
            "Pinot Grigio bij hetzelfde sterk kruidige gerecht — de neutrale aromatiek en lagere zuurintensiteit "
            "verdwijnen tegen de kruiden.",
        ),
        "pro_insight": (
            "Onthoud per druif één woord: Chardonnay = kameleon, Sauvignon Blanc = kruidig, Riesling = "
            "zuurspectrum, Pinot Grigio = neutraal. Dat is genoeg om een kaart snel te lezen."
        ),
        "kernbegrippen": [
            "Chardonnay",
            "Sauvignon Blanc",
            "Riesling",
            "Pinot Grigio",
            "druivenhypothese",
        ],
        "reflectievraag": (
            "Welke witte druif op je kaart verrast gasten het meest zodra ze de basis-stijl kennen?"
        ),
    },
    22: {
        "theorie": (
            "Rode druivenrassen leer je op foundation-niveau via tannine- en lichaamsniveau — dat raamwerk is "
            "bruikbaarder dan regio's onthouden vóór je de specialistische rodewijntrack volgt. Vier druiven "
            "vormen het startpunt: Cabernet Sauvignon, Merlot, Pinot Noir en Syrah/Shiraz.\n\n"
            "Cabernet Sauvignon heeft een dikke schil, geeft van nature hoog tannine en hoog zuur, en bouwt "
            "daardoor groot bewaarpotentieel op. Merlot heeft zachter tannine en een rondere structuur, en vult "
            "daarom vaak Cabernet-blends aan om de scherpe randjes te temperen.\n\n"
            "Pinot Noir heeft een dunne schil, is licht van lichaam met weinig tannine, en is gevoelig voor "
            "klimaat — kleine verschillen in temperatuur veranderen de stijl sterk. Syrah en Shiraz zijn "
            "dezelfde druif onder een andere naam: vol van lichaam en kruidig, met een stijl die varieert van "
            "peperig in koeler klimaat tot jamerig en rijp in warmer klimaat.\n\n"
            "Waarom dit raamwerk eerst? Omdat tannine- en lichaamsniveau direct een pairinghypothese geven, "
            "nog vóór je weet uit welke regio de wijn komt — dat voorkomt verwarring tussen bijvoorbeeld Pinot "
            "Noir uit Bourgogne en Cabernet uit Bordeaux."
        ),
        "samenvatting": (
            "- Cabernet Sauvignon: dikke schil, hoog tannine, groot bewaarpotentieel\n"
            "- Merlot: zachter tannine, ronder, vult vaak Cabernet-blends aan\n"
            "- Pinot Noir: dunne schil, licht van lichaam, gevoelig voor klimaat\n"
            "- Syrah/Shiraz: vol van lichaam, kruidig, varieert van peperig tot jamerig\n"
            "- Tannine- en lichaamsniveau van de druif sturen de eerste pairinghypothese"
        ),
        "food_pairing": fp(
            "Cabernet Sauvignon bij geroosterd rood vlees met korst; Pinot Noir bij eend of gevogelte met "
            "fruitige jus.",
            "Tanninerijke, volle druiven vragen om eiwit en vet om te zachten; lichtere, zuurrijke druiven "
            "passen bij fijner vlees zonder de wijn te overschaduwen.",
            "Pinot Noir bij zwaar gegrild rood vlees met korst — de wijn mist tannine en body om tegen het vet "
            "op te boksen.",
        ),
        "pro_insight": (
            "Leer eerst tannine- en lichaamsniveau per druif kennen vóór je regio's erbij haalt — dat voorkomt "
            "verwarring tussen Pinot Noir uit Bourgogne en Cabernet uit Bordeaux."
        ),
        "kernbegrippen": [
            "Cabernet Sauvignon",
            "Merlot",
            "Pinot Noir",
            "Syrah/Shiraz",
            "tanninehypothese",
        ],
        "reflectievraag": (
            "Welke rode druif op je kaart wordt nu verkeerd gepositioneerd ten opzichte van zijn werkelijke "
            "tannine- en lichaamsniveau?"
        ),
    },
    23: {
        "theorie": (
            "Aromatische druiven hebben van nature een hoog gehalte aan geurstoffen — vooral terpenen en "
            "thiolen — waardoor hun karakter intens en herkenbaar blijft, zelfs als terroir of wijnmaken minder "
            "uitgesproken is. Dat maakt ze het makkelijkste startpunt om blind te leren herkennen.\n\n"
            "Sauvignon Blanc en Riesling kennen je al uit lesson 21; daar voegen Gewürztraminer en Muscat zich "
            "bij als klassieke voorbeelden. Gewürztraminer combineert lychee, rozenblaadjes en gember met "
            "relatief lage zuur, vaak met een lichte restzoet. Muscat is bloemig en uitgesproken 'druivig', "
            "vaak ingezet voor zoete of mousserende stijlen.\n\n"
            "Waarom is deze categorie zo nuttig? Aromatische intensiteit kan in een pairing een deel van het "
            "werk doen dat anders zoetheid of vet zou moeten doen — vooral bij kruidig of pittig eten, waar de "
            "aromatische laag de kruiden in het gerecht spiegelt.\n\n"
            "Wanneer herken je een aromatisch ras blind het snelst? Ruik aan het glas zónder eerst te swirlen "
            "— een sterke, directe geur die je al van een afstand opvalt, wijst meteen op een aromatisch ras in "
            "plaats van een neutrale druif."
        ),
        "samenvatting": (
            "- Aromatische druiven hebben van nature intense, herkenbare aroma's\n"
            "- Sauvignon Blanc, Riesling, Gewürztraminer en Muscat zijn klassieke voorbeelden\n"
            "- Gewürztraminer combineert lychee en rozenaroma met relatief lage zuur\n"
            "- Muscat is bloemig en druivig, vaak ingezet voor zoete of mousserende stijlen\n"
            "- Aromatische intensiteit is een sterk hulpmiddel bij kruidige gerechten"
        ),
        "food_pairing": fp(
            "Gewürztraminer met een lichte restzoet bij pittige Aziatische gerechten met gember en koriander.",
            "De aromatische intensiteit en lichte zoetheid temperen scherpte, terwijl de bloemige tonen "
            "aansluiten op de kruiden in het gerecht.",
            "Droge, hoog-zuur Sauvignon Blanc bij zeer pittig eten zonder zoetheid — zuur alleen verzacht "
            "chili-scherpte niet en kan die juist versterken.",
        ),
        "pro_insight": (
            "Bij twijfel over een onbekende witte wijn: ruik eerst aan het glas zonder swirlen. Sterke, directe "
            "aromatiek wijst meteen op een aromatisch ras."
        ),
        "kernbegrippen": [
            "aromatische intensiteit",
            "terpenen",
            "Gewürztraminer",
            "Muscat",
            "kruidenpairing",
        ],
        "reflectievraag": (
            "Welke aromatische druif zou jij toevoegen aan je kaart om pittige gerechten beter te kunnen "
            "pairen?"
        ),
    },
    24: {
        "theorie": (
            "Tegenover aromatische druiven staan neutrale druiven: rassen met van nature minder uitgesproken "
            "aroma, waarbij terroir en wijnmaakkeuzes harder doorklinken dan het druifkarakter zelf. "
            "Ongehoute Chardonnay, Pinot Grigio en Trebbiano zijn klassieke voorbeelden uit deze categorie.\n\n"
            "Waarom is deze categorie waardevol, en niet 'saai'? Omdat neutrale druiven de beste "
            "terroir-boodschappers zijn — zonder dominant eigen aroma laat de druif klimaat, bodem en "
            "wijnmaken duidelijker doorklinken dan een aromatisch ras dat altijd zichzelf op de voorgrond "
            "zet.\n\n"
            "Hoe bouw je een pairing op rond een neutrale druif? Niet via aroma-match, maar via zuur, body en "
            "mineraliteit — de structuurelementen uit Module 4 worden hier het belangrijkste gereedschap, "
            "omdat aroma simpelweg minder houvast geeft.\n\n"
            "Wanneer zet je neutrale druiven bewust in op een kaart? Gebruik ze als 'blanco canvas': ze passen "
            "bij meer gerechten dan aromatische rassen, juist omdat ze niet domineren en ruimte laten voor de "
            "smaak van het gerecht zelf."
        ),
        "samenvatting": (
            "- Neutrale druiven hebben van nature minder uitgesproken aroma\n"
            "- Ongehoute Chardonnay, Pinot Grigio en Trebbiano zijn klassieke voorbeelden\n"
            "- Terroir en wijnmaken spreken luider dan het druifkarakter zelf\n"
            "- Neutrale druiven zijn ideale terroir-boodschappers in een glas\n"
            "- Pairing bouw je hier op zuur, body en mineraliteit, niet op aroma-match"
        ),
        "food_pairing": fp(
            "Ongehoute Chardonnay of Albariño bij lichte visgerechten met citroen en olijfolie.",
            "Zonder dominant aroma laat de wijn ruimte voor de smaak van het gerecht; zuur en mineraliteit "
            "dragen de match in plaats van aromaherkenning.",
            "Sterk aromatische Gewürztraminer bij dezelfde subtiele visbereiding — de aromatiek overschaduwt "
            "de fijne smaken van het gerecht.",
        ),
        "pro_insight": (
            "Gebruik neutrale druiven als 'blanco canvas' op je kaart: ze passen bij meer gerechten dan "
            "aromatische rassen, juist omdat ze niet domineren."
        ),
        "kernbegrippen": [
            "neutrale druif",
            "terroir-boodschapper",
            "Chardonnay ongehout",
            "mineraliteit",
            "canvaspairing",
        ],
        "reflectievraag": (
            "Welke neutrale witte wijn op je kaart gebruik je nog te weinig als flexibele pairingoptie?"
        ),
    },
    25: {
        "theorie": (
            "Deze les bundelt Module 5 in één bruikbaar raamwerk: stijl = druif + klimaat + wijnmaken, nooit "
            "druif alleen. Dezelfde druif kan twee totaal verschillende wijnen opleveren zodra klimaat of "
            "wijnmaakkeuzes veranderen — en dat is precies waarom 'ik proef Chardonnay' nog niets zegt over "
            "stijl.\n\n"
            "Klimaat is de tweede laag: een koel klimaat behoudt meer zuur en geeft slankere, citrusachtige "
            "stijlen; een warm klimaat geeft rijper fruit en minder zuur, met een voller resultaat. Dezelfde "
            "Chardonnay kan zo van slank en mineraal naar tropisch en boterig bewegen, puur door waar de "
            "druiven groeiden.\n\n"
            "Wijnmaken is de derde laag: houtlagering, lees-contact, schilcontact en fermentatietemperatuur "
            "voegen een signatuur toe die los staat van druif en klimaat. Een ongehoute en een gehoute versie "
            "van dezelfde druif uit dezelfde wijngaard kunnen volledig anders proeven.\n\n"
            "Waarom stop je hier op foundation-niveau? Omdat de volledige diepte per druif en regio bij de "
            "specialistische wit- en rodewijntracks hoort. Hier leer je het raamwerk: bij een onbekende wijn "
            "doorloop je in volgorde druif, klimaat, wijnmaken — dat geeft een snelle, betrouwbare "
            "stijlhypothese vóór je verder de diepte in gaat."
        ),
        "samenvatting": (
            "- Stijl = druif + klimaat + wijnmaken, niet druif alleen\n"
            "- Dezelfde druif kan totaal anders smaken in koel versus warm klimaat\n"
            "- Wijnmaakkeuzes (hout, gist, schilcontact) voegen een derde laag toe\n"
            "- Drie vragen op volgorde geven een snelle stijlhypothese\n"
            "- Dit raamwerk is de basis; diepgang per druif volgt in de specialistentracks"
        ),
        "food_pairing": fp(
            "Gebruik het drielagenraamwerk om bij een onbekende wijn eerst druif, dan klimaat, dan wijnmaken te "
            "bepalen vóór je een gerecht kiest — bijvoorbeeld een warm-klimaat Chardonnay met houtlagering bij "
            "rijke kreeft in botersaus.",
            "Door de drie lagen apart te lezen, kies je een gerecht dat past bij de werkelijke body en "
            "zuurbalans van de wijn, niet bij een aanname op basis van de druifnaam alleen.",
            "Een gerecht kiezen puur op de naam van de druif, bijvoorbeeld 'Chardonnay is altijd boters', "
            "zonder klimaat of wijnmaken te checken — dat leidt tot mismatches tussen een slanke en een volle "
            "stijl.",
        ),
        "pro_insight": (
            "Train jezelf om bij elke nieuwe wijn deze volgorde te doorlopen: druif, klimaat, wijnmaken. Na "
            "honderd wijnen wordt dat een automatisme dat blind proeven enorm versnelt."
        ),
        "kernbegrippen": [
            "druif-klimaat-wijnmaken",
            "stijlhypothese",
            "koel versus warm klimaat",
            "wijnmaaksignatuur",
            "stijlraamwerk",
        ],
        "reflectievraag": (
            "Bij welke wijn op je kaart zou het drielagenraamwerk — druif, klimaat, wijnmaken — je advies aan "
            "gasten het meest verbeteren?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Twee wijnen van dezelfde druif smaken volledig anders: de ene slank en citrusachtig, de andere "
            "vol en tropisch met boter. Wat verklaar je als eerste?\n\n"
            "A. Verschil in flesvorm\n"
            "B. Verschil in klimaat en/of wijnmaakkeuzes ✅\n"
            "C. Verschil in druivenras\n"
            "D. Verschil in glaswerk\n\n"
        ),
    },
}
