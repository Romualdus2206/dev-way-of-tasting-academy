"""Premium Gold Master repair data — Red Wine Track lessons 26–40 (modules 6–9).

Module 6 (26–30): Krachtige rode druiven — Cabernet Sauvignon, Syrah, Malbec, Nebbiolo,
Mourvèdre, met specifieke aandacht voor genetische afkomst, klimaatmechanismen en
regionale stijlverschillen binnen elke druif.
Module 7 (31–34): Service — sommelierniveau (temperatuur per structuurtype, glaswerk per
structuurtype, karaferen per tannineniveau, bewaren & kelderlogica).
Module 8 (35–37): Pairing & Gastronomie — vlees, kaas, wild, met de onderliggende
mechanismen (tannine-eiwitbinding, caseïnebinding, aromatische brug).
Module 9 (38–40): Blindproeven & Examen — Pinot Noir vs Nebbiolo, Merlot vs Cabernet
Sauvignon, en het geïntegreerde eindexamen.
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
            "Cabernet Sauvignon is genetisch geen oeroude druif maar een relatief jonge, "
            "natuurlijke kruising tussen Cabernet Franc en Sauvignon Blanc — bevestigd via "
            "DNA-onderzoek in 1996 door Carole Meredith aan UC Davis, en vermoedelijk ontstaan "
            "in de zeventiende eeuw ergens in de Bordeaux-wijngaarden. Die afkomst verklaart "
            "meteen twee kenmerken: de groene paprikatoon (methoxypyrazine, IBMP) is "
            "geërfd van beide ouders, en de dikke schil met kleine bessen — een hoge "
            "schil-tot-sap-verhouding — verklaart de van nature hoge tannine- en "
            "kleurstofconcentratie die de druif tot een structurele ruggengraat maakt.\n\n"
            "Cabernet Sauvignon budt laat uit (ontwijkt daardoor voorjaarsvorst) maar heeft "
            "een lang, warm groeiseizoen nodig om die dikke schil volledig fenolisch te "
            "laten rijpen. Dat verklaart waarom de druif zo goed gedijt op warmtevasthoudend, "
            "goed drainerend grind — de Left Bank-terroirs van Bordeaux (Médoc, "
            "Pauillac, Margaux) en de vergelijkbare, warmere bodems van Napa Valley. Op "
            "kleirijke, vochtige grond (de Right Bank) rijpt Cabernet Sauvignon onvoldoende "
            "betrouwbaar — vandaar dat die percelen historisch naar Merlot gingen.\n\n"
            "IBMP is geen vast kenmerk maar een rijpheidssignaal: naarmate de druif meer "
            "zonlicht en warmte krijgt, breekt dit pyrazine versneld af. Te veel groene "
            "paprika in het glas wijst daarom specialistisch gezien op onderrijpheid of een "
            "te koel jaargang, niet op een onvermijdelijk kenmerk van de druif zelf — een "
            "kwaliteitsdiagnose, geen smaakvoorkeur.\n\n"
            "De stevige, grof-korrelige tannine van Cabernet Sauvignon integreert uitstekend "
            "met nieuw eikenhout: de tanninestructuur is stevig genoeg om vanilline- en "
            "toasttonen te dragen zonder overweldigd te worden, wat verklaart waarom de "
            "druif zelden ongehout wordt uitgebracht. Tegelijk vraagt die stevige structuur "
            "vaak een zachtere blendpartner — Merlot vult het midden-palet en rondt de "
            "tannine af, Petit Verdot voegt kleur en specerij toe — de klassieke logica "
            "achter de Bordeaux Left Bank-blend.\n\n"
            "Regionale expressie varieert sterk: Napa Valley geeft door een groter diurnaal "
            "verschil rijper fruit, hogere alcohol en zachtere tannine dan het koelere "
            "Bordeaux; Coonawarra in Australië ontwikkelt een herkenbare munt-eucalyptustoon "
            "doordat eucalyptusbomen naast de wijngaarden een vluchtige stof (1,8-cineol) "
            "afgeven die zich aan de druivenschil hecht — een aantoonbaar omgevingseffect, "
            "geen druifeigen aroma."
        ),
        "samenvatting": (
            "- Natuurlijke kruising van Cabernet Franc en Sauvignon Blanc, bevestigd in 1996\n"
            "- Dikke schil en hoge schil-tot-sap-verhouding verklaren de hoge tannine- en kleurconcentratie\n"
            "- Groene paprikatoon (IBMP) is een rijpheidssignaal, geen vast druifkenmerk\n"
            "- Grind en warmte (Médoc, Napa) zijn nodig om de dikke schil volledig te laten rijpen\n"
            "- Coonawarra's munt-eucalyptustoon komt van naburige eucalyptusbomen, niet van de druif zelf"
        ),
        "pro_insight": (
            "Proef een jonge Cabernet Sauvignon eerst bewust op groene paprika vóór je hem "
            "aanbeveelt — een duidelijk aanwezige pyrazinetoon is een rijpheidsdiagnose die "
            "je meteen iets vertelt over de kwaliteit van het jaargang of perceel, niet "
            "alleen over stijl."
        ),
        "kernbegrippen": [
            "IBMP-pyrazine",
            "DNA-kruising 1996",
            "laatbotend laatrijpend",
            "Coonawarra-eucalyptol",
            "Bordeaux-blendlogica",
        ],
        "food_pairing": fp(
            "Gegrilde ribeye met pepersaus of lamsrack met rozemarijn.",
            "Het vet in het vlees bindt de stevige tannine, waardoor de wijn ronder aanvoelt en het vlees minder zwaar oogt.",
            "Delicate visgerechten of licht gekruide salades — de stevige tannine en structuur verpletteren die subtiliteit volledig.",
        ),
        "reflectievraag": (
            "Bij welke fles Cabernet Sauvignon op jouw kaart zou jij groene paprika benoemen "
            "als bewuste rijpheidsdiagnose in plaats van als smaakvoorkeur — en hoe leg je dat "
            "verschil uit aan een gast?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart de genetische afkomst van Cabernet Sauvignon het beste?\n\n"
                "A. Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc ✅  \n"
                "B. Een kloon van Merlot  \n"
                "C. Een kruising van Syrah en Grenache  \n"
                "D. Een mutatie van Nebbiolo"
            ),
        },
    },
    27: {
        "theorie": (
            "Syrah is, net als Cabernet Sauvignon, een natuurlijke kruising — bevestigd in "
            "1998 door dezelfde onderzoeksgroep rond Carole Meredith — tussen Dureza en "
            "Mondeuse Blanche, twee obscure druiven uit de Ardèche en Savoie. Dat weerlegt "
            "definitief de romantische mythe dat Syrah zijn naam en oorsprong dankt aan de "
            "Perzische stad Shiraz: de druif is en blijft een kind van de noordelijke "
            "Rhône-vallei.\n\n"
            "De kenmerkende zwarte-pepertoon komt van rotundone, een sesquiterpeen dat pas "
            "in 2008 wetenschappelijk geïdentificeerd werd als de stof achter peperige "
            "aroma's in wijn. Cruciaal voor de praktijk: rotundone-concentratie is direct "
            "stuurbaar via wijngaardmanagement. Minder zonlicht op de druiventros — door "
            "koeler klimaat, hogere ligging of bewuste bladwerkkeuzes — verhoogt de "
            "rotundoneconcentratie, terwijl volle zoninstraling de vorming juist onderdrukt. "
            "Peperigheid is dus deels een teeltkeuze, niet alleen een druifeigenschap.\n\n"
            "In de noordelijke Rhône (Côte-Rôtie, Hermitage, Cornas) groeit Syrah op steile "
            "granietterrassen, vaak als enige druif, en in Côte-Rôtie is het wettelijk "
            "toegestaan om tot 20% Viognier mee te co-fermenteren — in de praktijk meestal "
            "veel minder. Die kleine hoeveelheid witte druif stabiliseert kleur via "
            "co-pigmentatie en voegt een subtiele abrikoos-bloesemlift toe, een specifieke "
            "historische techniek die nergens anders in de Rhône standaard is.\n\n"
            "In het warme zuidelijk halfrond — Barossa Valley, waar de druif Shiraz heet — "
            "onderdrukt de intense zoninstraling juist de rotundonevorming, wat rijp "
            "bramen-pruimenfruit, chocolade en een aanzienlijk lagere pepertoon oplevert, "
            "vaak in Amerikaans in plaats van Frans eikenhout gelagerd. Dezelfde druif, "
            "twee klimatologisch tegengestelde uitersten.\n\n"
            "Structureel behoudt Syrah, dankzij zijn dikke schil, ook in warm klimaat "
            "relatief goed zuur en kleurstabiliteit, wat de druif geschikt maakt als "
            "ruggengraat in GSM-blends (Grenache-Syrah-Mourvèdre): Grenache levert fruit en "
            "alcohol, Mourvèdre levert aardse diepte, Syrah levert kleur, structuur en "
            "specerij."
        ),
        "samenvatting": (
            "- Natuurlijke kruising van Dureza en Mondeuse Blanche, bevestigd in 1998 — geen Perzische oorsprong\n"
            "- Rotundone veroorzaakt de zwarte-pepertoon en is stuurbaar via zonlichtblootstelling\n"
            "- Côte-Rôtie mag wettelijk tot 20% Viognier co-fermenteren voor kleurstabiliteit en lift\n"
            "- Warm klimaat (Barossa) onderdrukt rotundone en geeft rijp fruit met minder peper\n"
            "- Dikke schil geeft goede kleur- en zuurstabiliteit — een sterke ruggengraat in GSM-blends"
        ),
        "pro_insight": (
            "Gebruik de peperintensiteit van een Syrah als klimaatthermometer bij een gast: "
            "veel zwarte peper wijst op een koeler perceel of een bewuste rotundone-gerichte "
            "wijngaardkeuze, weinig peper wijst op warmte — dat is een concreet, uitlegbaar "
            "verkoopargument."
        ),
        "kernbegrippen": [
            "rotundone",
            "Dureza-Mondeuse-kruising",
            "Côte-Rôtie-cofermentatie",
            "GSM-blend",
            "Barossa versus Rhône-expressie",
        ],
        "food_pairing": fp(
            "Lamsrack met een korst van zwarte peper en tijm, of gegrilde worst met paprika.",
            "De rotundone in de wijn resoneert direct met de peperkorst — een aroma-op-aroma-brug in plaats van alleen textuurmatch.",
            "Zeer zoete desserts of licht gekruide vis — de peperige specerij en structuur van Syrah overheersen die gerechten volledig.",
        ),
        "reflectievraag": (
            "Zou jij een gast die alleen warme, fruitige Barossa Shiraz kent, durven "
            "verrassen met een peperige, koelere noordelijke Rhône-Syrah — en met welk ene "
            "argument (rotundone, klimaat) leg je dat verschil uit?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart de zwarte-pepertoon in Syrah het beste?\n\n"
                "A. Rotundone, een sesquiterpeen dat toeneemt bij minder zonlicht op de druif ✅  \n"
                "B. Uitsluitend langdurige houtlagering  \n"
                "C. Een hoog suikergehalte bij de oogst  \n"
                "D. Co-fermentatie met Viognier"
            ),
        },
    },
    28: {
        "theorie": (
            "Malbec heette oorspronkelijk Côt of Auxerrois en is de historische druif achter "
            "de 'zwarte wijn' (vin noir) van Cahors in Zuidwest-Frankrijk — een bijnaam die "
            "verwijst naar de intense kleurdiepte dankzij de dikke schil en traditioneel "
            "lange maceratie. Genetisch onderzoek uit 2009 toonde aan dat Malbec een "
            "natuurlijke kruising is van Prunelard en Magdeleine Noire des Charentes — "
            "dezelfde moederdruif die ook Merlot voortbracht (met Cabernet Franc als vader). "
            "Malbec en Merlot zijn dus genetisch halfbroers, wat verklaart waarom beide zo "
            "moeiteloos in Bordeaux-blends samenwerken.\n\n"
            "Na verwoestende vorst in 1956 en de naweeën van de druifluis-crisis verdween "
            "Malbec grotendeels uit Frankrijk, maar de druif kreeg een tweede leven in "
            "Argentinië nadat de Franse agronoom Michel Aimé Pouget haar in 1868 naar "
            "Mendoza bracht. De hooggelegen wijngaarden van de Uco Valley — vaak tussen 900 "
            "en 1500 meter — combineren intense UV-instraling (dikkere schillen, meer "
            "kleurstof) met een groot diurnaal verschil dat het zuur behoudt ondanks de "
            "felle zon: hetzelfde mechanisme dat bij Torrontés en andere hooggelegen wijnen "
            "een rol speelt.\n\n"
            "Stilistisch staan de twee tradities ver uit elkaar. De Cahors AOC eist minimaal "
            "70% Malbec (lokaal nog Côt of Auxerrois genoemd) en levert een rustieker, "
            "steviger tannine met savoury, aardse tonen op. Argentijnse Malbec is rijper, "
            "ronder van tannine, met een herkenbare viooltjes- en cacaotoon uit de "
            "eikenlagering — twee interpretaties van dezelfde druif die bijna niets van "
            "elkaar wegdrinken.\n\n"
            "Opvallend specialistisch kenmerk: ondanks de diepe kleur is de tannine van "
            "Malbec fijnkorreliger en minder grijpend dan die van Cabernet Sauvignon bij "
            "vergelijkbare concentratie — een andere polymeerstructuur die de druif eerder "
            "drinkbaar maakt zonder decennialange flesrijping, in tegenstelling tot wat de "
            "donkere kleur zou doen vermoeden."
        ),
        "samenvatting": (
            "- Historisch Côt/Auxerrois, de 'zwarte wijn' van Cahors, waar minimaal 70% Malbec verplicht is\n"
            "- Genetisch een halfbroer van Merlot — beide delen moederdruif Magdeleine Noire des Charentes\n"
            "- Michel Aimé Pouget bracht Malbec in 1868 naar Mendoza, Argentinië\n"
            "- Hoogteligging in de Uco Valley geeft intense kleur én zuurbehoud via diurnaal verschil\n"
            "- Tannine is fijnkorreliger dan bij Cabernet Sauvignon — toegankelijker ondanks de diepe kleur"
        ),
        "pro_insight": (
            "Vertel een gast die Malbec alleen als 'makkelijk drinkbaar' kent over de "
            "genetische band met Merlot — dat framet de druif meteen als serieuze "
            "Bordeaux-verwant in plaats van louter een toegankelijke instapwijn."
        ),
        "kernbegrippen": [
            "Côt-synoniem Cahors",
            "Prunelard-kruising",
            "Uco Valley-hoogteligging",
            "diurnaal zuurbehoud",
            "fijnkorrelige tanninestructuur",
        ],
        "food_pairing": fp(
            "Argentijnse asado (gegrild rundvlees) of entrecote met chimichurri.",
            "De rijpe, ronde tannine en donkere fruittonen spiegelen het gegrilde vet en de kruidige, zure chimichurri-saus.",
            "Lichte, delicate visgerechten — de diepe kleur en concentratie van Malbec verpletteren die subtiliteit direct.",
        ),
        "reflectievraag": (
            "Welke twee flessen Malbec — één uit Cahors, één uit Mendoza — zou jij een gast "
            "naast elkaar laten proeven om te bewijzen dat het dezelfde druif is, en welk "
            "signaal (tannine, aroma) zou jij daarbij benadrukken?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Welke druif is de genetische halfbroer van Malbec via de moederdruif Magdeleine Noire des Charentes?\n\n"
                "A. Merlot ✅  \n"
                "B. Syrah  \n"
                "C. Nebbiolo  \n"
                "D. Mourvèdre"
            ),
        },
    },
    29: {
        "theorie": (
            "Nebbiolo dankt zijn naam aan 'nebbia', de dichte herfstmist die zich in oktober "
            "over de heuvels van Piemonte legt tijdens de late oogst — de druif rijpt pas na "
            "vrijwel alle andere Italiaanse rassen. Wat Nebbiolo specialistisch fascinerend "
            "maakt, is een structurele paradox: de schil is dun en arm aan antocyaan, wat "
            "een bleke, granaatachtige kleur oplevert die aan Pinot Noir doet denken — maar "
            "diezelfde schil (en de pitten) bevat een uitzonderlijk hoge concentratie "
            "tannine. Kleur en tannineconcentratie zijn bij Nebbiolo dus volledig "
            "losgekoppeld, een cruciale valkuil bij blind proeven.\n\n"
            "Barolo en Barbaresco tonen hoe bodemtype binnen één druif tot structureel "
            "verschillende wijnen leidt. Communes met Tortoniaanse kalkmergel (La Morra, "
            "Barolo-dorp zelf) geven zachtere, aromatischere, eerder toegankelijke wijnen; "
            "communes met Serravalliaanse/Helvetische zandsteen (Serralunga d'Alba, "
            "Monforte d'Alba, Castiglione Falletto) geven krachtiger, taniner en "
            "langlevender wijnen. Dezelfde druif, dezelfde regio, structureel andere "
            "resultaten door bodemchemie alleen.\n\n"
            "De stijlstrijd tussen traditionalisten en modernisten definieerde Barolo in de "
            "jaren tachtig en negentig: traditionalisten gebruiken lange maceratie en grote, "
            "oude Slavonische eikenvaten (botti), wat de florale roos- en teertonen "
            "behoudt en tannine langzaam laat integreren; de 'Barolo Boys'-modernisten "
            "kozen voor kortere maceratie en kleinere, nieuwe Franse barriques, met "
            "rondere tannine en meer vanille- en houtspecerij. Beide scholen bestaan "
            "vandaag naast elkaar.\n\n"
            "Aromatisch draait Nebbiolo om rozen en teer — damasceon, een stof die ook de "
            "rozentoon in andere druiven verklaart, gecombineerd met truffel- en "
            "leertonen die zich pas na jaren flesrijping ontwikkelen. Die extreem lange "
            "rijpingscurve — Barolo DOCG vereist wettelijk minimaal 38 maanden rijping, "
            "waarvan 18 op vat — wordt precies mogelijk gemaakt door de combinatie van "
            "hoge zuren en hoge tannine, twee structurele buffers die elkaar versterken.\n\n"
            "Nebbiolo geldt daarom als de 'Pinot Noir van Italië' qua terroirgevoeligheid — "
            "twee percelen op honderden meters afstand kunnen wezenlijk andere wijnen "
            "opleveren — terwijl de onderliggende structuur (kleur versus tannine) precies "
            "tegenovergesteld is."
        ),
        "samenvatting": (
            "- 'Nebbia' (mist) verwijst naar de late herfstoogst in de Piemontese heuvels\n"
            "- Bleke kleur en extreem hoge tannine zijn bij Nebbiolo volledig losgekoppeld\n"
            "- Tortoniaanse kalkmergel geeft zachtere wijn, Serravalliaanse zandsteen geeft krachtigere wijn\n"
            "- Traditioneel (grote oude vaten) versus modernistisch (kleine nieuwe barriques) blijft een levende stijlstrijd\n"
            "- Hoge zuren en hoge tannine samen maken de zeer lange, wettelijk verplichte rijping mogelijk"
        ),
        "pro_insight": (
            "Waarschuw een gast expliciet vóór het eerste glas Nebbiolo dat de bleke kleur "
            "misleidt — verwacht een tanninegrip die veel steviger is dan de kleur "
            "suggereert, zodat de eerste slok niet als een onaangename verrassing landt."
        ),
        "kernbegrippen": [
            "nebbia-etymologie",
            "kleur-tannine-ontkoppeling",
            "Barolo versus Barbaresco-bodem",
            "Barolo Boys-modernisme",
            "damasceon-rozentoon",
        ],
        "food_pairing": fp(
            "Witte truffel over tagliatelle, of gestoofd rundvlees (brasato al Barolo).",
            "De aardse truffeltoon en de extreem hoge tannine van Nebbiolo versterken elkaar via dezelfde aardse aromagroep.",
            "Lichte, delicate visgerechten — de extreme tannine en zuurgraad verpletteren die subtiliteit onmiddellijk.",
        ),
        "reflectievraag": (
            "Welke twee Barolo-communes (bijvoorbeeld La Morra en Serralunga d'Alba) zou jij "
            "naast elkaar zetten om het effect van bodemtype op structuur te demonstreren, "
            "en welk signaal (tannine, aroma) zou het verschil het snelst tonen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat is het meest opvallende structurele kenmerk van Nebbiolo?\n\n"
                "A. Bleke kleur gecombineerd met extreem hoge tannine ✅  \n"
                "B. Diepe kleur gecombineerd met lage tannine  \n"
                "C. Zeer lage zuurgraad  \n"
                "D. Volledige afwezigheid van tannine"
            ),
        },
    },
    30: {
        "theorie": (
            "Mourvèdre — in Spanje Monastrell genoemd en historisch in Australië en "
            "Californië bekend als Mataro — heeft vermoedelijk zijn oorsprong in het "
            "Spaanse Levante rond Alicante en Jumilla, van waaruit de druif zich naar "
            "Zuid-Frankrijk verspreidde. De druif is opvallend hitte- en droogteresistent: "
            "in Jumilla staan nog altijd ongeënte, stokoude wijnstokken op zandige bodem "
            "die van nature bestand is tegen de druifluis, waardoor enting nooit nodig "
            "was.\n\n"
            "Mourvèdre budt laat uit en heeft veel zon en warmte nodig om volledig te "
            "rijpen — een trage, hitteafhankelijke druif die in koelere jaren zelden "
            "overtuigt. Jong vertoont de druif vaak een uitgesproken reductief karakter: "
            "bloed, wild, leer en zwarte olijf, tonen die pas na verluchting of enige "
            "flesrijping plaatsmaken voor rijper donker fruit — een kenmerk waarmee "
            "beginnende proevers de druif regelmatig ten onrechte als 'gebrekkig' "
            "afschrijven.\n\n"
            "Bandol in de Provence is de klassieke referentie: de AOC eist wettelijk "
            "minimaal 50% Mourvèdre voor rode wijn en een verplichte vatrijping van "
            "minstens achttien maanden, traditioneel in grote foudres. De kalkrijke, "
            "naar de Middellandse Zee hellende hellingen geven de druif precies de warmte "
            "en drainage die ze nodig heeft om haar volle, aardse potentieel te bereiken.\n\n"
            "In GSM-blends (Grenache-Syrah-Mourvèdre) speelt Mourvèdre de rol van "
            "ruggengraat: Grenache levert fruit en alcohol maar vervaagt snel zonder "
            "structuur, Syrah levert kleur en specerij, en Mourvèdre levert de "
            "tanninebasis, de aardse diepte en het bewaarpotentieel die de blend op de "
            "lange termijn overeind houden — zonder Mourvèdre valt een GSM-blend structureel "
            "sneller uit elkaar dan met.\n\n"
            "Ondanks het warme klimaat waarin de druif meestal groeit, behoudt Mourvèdre bij "
            "zorgvuldige oogst een verrassend goed zuurniveau, wat haar — samen met de "
            "stevige tannine — een langer bewaarpotentieel geeft dan de meeste andere "
            "warmeklimaatdruiven."
        ),
        "samenvatting": (
            "- Monastrell in Spanje, Mataro historisch in Australië/Californië — vermoedelijk Spaanse oorsprong\n"
            "- Stokoude, ongeënte wijnstokken in Jumilla zijn van nature droogte- en luisresistent\n"
            "- Jonge Mourvèdre toont vaak reductieve bloed- en leertonen die met lucht of tijd verdwijnen\n"
            "- Bandol AOC eist wettelijk minimaal 50% Mourvèdre en 18 maanden vatrijping\n"
            "- Vormt de tanninebasis en het bewaarpotentieel van GSM-blends (Grenache-Syrah-Mourvèdre)"
        ),
        "pro_insight": (
            "Schenk een jonge Mourvèdre nooit direct na ontkurken zonder te beluchten of "
            "kort te decanteren — anders proeft een gast de tijdelijke reductieve fase en "
            "beoordeelt de wijn onterecht als gebrekkig."
        ),
        "kernbegrippen": [
            "Monastrell-synoniem",
            "reductieve jeugdfase",
            "Bandol-appellatie-eisen",
            "GSM-ruggengraat",
            "stokoude droogteresistente wijngaarden",
        ],
        "food_pairing": fp(
            "Lamsstoofpot met olijven en rozemarijn, of wildzwijnragout.",
            "De aardse, wilde en olijfachtige tonen van Mourvèdre spiegelen direct de kruidige, langzaam gegaarde stoofsmaken.",
            "Lichte, frisse visgerechten — de wilde, reductieve en tanninerijke aard van deze druif overweldigt die subtiliteit volledig.",
        ),
        "reflectievraag": (
            "Bij welke jonge, gesloten fles Mourvèdre op jouw kaart zou jij bewust extra "
            "beluchting adviseren vóór het serveren — en hoe leg je dat verschil tussen "
            "reductie en een echt gebrek uit aan een gast?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom worden veel oude Mourvèdre-wijnstokken in Jumilla nooit geënt?\n\n"
                "A. Omdat de zandige bodem van nature resistent is tegen druifluis ✅  \n"
                "B. Omdat enting het alcoholpercentage verlaagt  \n"
                "C. Omdat enting verboden is door de EU  \n"
                "D. Omdat geënte stokken minder kleur geven"
            ),
        },
    },
    31: {
        "theorie": (
            "Serveertemperatuur bij rode wijn stuurt twee tegengestelde mechanismen "
            "tegelijk: de vluchtigheid van ethanol neemt toe met temperatuur (te warm "
            "geeft een dominante, brandende alcoholindruk), terwijl de perceptie van "
            "tanninegrip juist toeneemt naarmate de wijn kouder is — koude vertraagt de "
            "bindingskinetiek tussen tannine en speekseleiwitten, waardoor de mond minder "
            "snel 'wordt overspoeld' en de tannine harder en droger aanvoelt. Beide "
            "effecten samen bepalen het serveerprotocol per structuurtype.\n\n"
            "Lichte rode wijn (Gamay, jonge Pinot Noir) leunt op primair fruit en "
            "zuurgraad; een lichte koeling (12–14°C) accentueert die frisheid en dempt "
            "de al beperkte tannine niet noemenswaardig, wat de wijn levendiger maakt "
            "zonder iets te verliezen. Medium body-druiven (Merlot, Sangiovese, "
            "Tempranillo) vinden hun balanspunt rond 14–16°C: warm genoeg om tannine niet "
            "hard te laten aanvoelen, koel genoeg om alcohol niet te laten domineren.\n\n"
            "Krachtige, hoogtanninerijke druiven (Cabernet Sauvignon, Nebbiolo, Syrah) "
            "vragen 16–18°C: bij die temperatuur verloopt de eiwitbinding sneller en "
            "vloeiender, waardoor de tannine ronder aanvoelt, en komen secundaire en "
            "tertiaire aroma's die aan houtcontact en complexe fenolen gebonden zijn beter "
            "vrij. Oude, kwetsbare wijnen profiteren van een vergelijkbare temperatuur, "
            "maar vragen wel voorzichtigheid: te warm laat de fragiele, tertiaire "
            "boeket sneller wegvallen dan bij een robuustere, jongere wijn.\n\n"
            "'Kamertemperatuur' als vuistregel is historisch misleidend: het begrip "
            "ontstond in ongeverwarmde negentiende-eeuwse Europese kamers van ongeveer "
            "15–16°C, niet in de centraal verwarmde ruimtes van vandaag die vaak 21–22°C "
            "halen. Een wijn op werkelijke moderne kamertemperatuur serveren, betekent in "
            "de praktijk vrijwel altijd te warm serveren.\n\n"
            "Praktisch protocol: schenk 1–2°C onder de uiteindelijke doeltemperatuur, want "
            "het glas en de ruimte warmen de wijn vanzelf op tijdens het drinken. Voor "
            "krachtige, hoge-tanninewijnen is het net zo belangrijk om niet te koud te "
            "serveren als om niet te warm te serveren — beide uitersten verstoren dezelfde "
            "eiwitbindingskinetiek, in tegengestelde richting."
        ),
        "samenvatting": (
            "- Koude vertraagt de eiwitbinding van tannine, waardoor tannine harder en droger aanvoelt\n"
            "- Warmte verhoogt ethanolvolatiliteit — te warm geeft een dominante alcoholindruk\n"
            "- Lichte rode wijn: 12–14°C; medium body: 14–16°C; krachtige stijlen: 16–18°C\n"
            "- 'Kamertemperatuur' is een historisch verouderd begrip (15–16°C, niet de moderne 21–22°C)\n"
            "- Schenk altijd 1–2°C onder de doeltemperatuur — het glas warmt de wijn vanzelf op"
        ),
        "pro_insight": (
            "Wantrouw het advies 'gewoon op kamertemperatuur' voor een krachtige rode wijn "
            "— leg een gast uit dat moderne kamers vaak te warm zijn, en koel de fles indien "
            "nodig bewust een paar graden vóór het serveren."
        ),
        "kernbegrippen": [
            "eiwitbindingskinetiek",
            "ethanolvolatiliteit",
            "chambré-mythe",
            "serveerprotocol per structuurtype",
            "temperatuurgevoelige tanninegrip",
        ],
        "food_pairing": fp(
            "Dezelfde Cabernet Sauvignon geserveerd op 12°C en op 17°C naast gegrild rood vlees.",
            "Bij 17°C rondt de tannine af en integreert met het vlees; bij 12°C domineert een harde, drogende grip die het gerecht overstemt.",
            "Een krachtige, tanninerijke Nebbiolo op 22°C bij hetzelfde gerecht — te warm serveren maakt de wijn log en benadrukt de alcohol.",
        ),
        "reflectievraag": (
            "Welke fles op jouw kaart serveer je vermoedelijk op de verkeerde temperatuur uit "
            "gewoonte — en welk signaal (tanninegrip of alcoholwarmte) zou je na correctie "
            "moeten proeven dat je nu mist?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom voelt tannine harder aan wanneer een rode wijn te koud geserveerd wordt?\n\n"
                "A. Koude vertraagt de binding tussen tannine en speekseleiwitten ✅  \n"
                "B. Koude verhoogt het alcoholpercentage  \n"
                "C. Koude verwijdert zuur uit de wijn  \n"
                "D. Koude verhoogt de suikerconcentratie"
            ),
        },
    },
    32: {
        "theorie": (
            "Glasgeometrie stuurt bij rode wijn twee zaken tegelijk: het "
            "zuurstofoppervlak dat de wijn krijgt vóór het glas de neus bereikt, en de "
            "plek op de tong waar de wijn als eerste landt — wat direct bepaalt of tannine "
            "of fruit als eerste wordt waargenomen. Glasvorm is daarmee geen esthetische "
            "keuze maar een structureel stuurmiddel.\n\n"
            "Het Bordeaux-glas — hoog, brede bol, licht taps toelopend — is ontworpen voor "
            "krachtige, hooggetanninerijke druiven als Cabernet Sauvignon en Syrah. Het "
            "grote oppervlak geeft ruimte voor beluchting, en de vorm stuurt de wijn "
            "richting het midden en de achterkant van de tong, waardoor de eerste "
            "tanninegrip aan de voorkant wordt afgezwakt. Het Bourgondië-glas — breder, "
            "bolvormig, met een naar binnen gebogen rand — past bij delicatere maar "
            "aromatisch intensere druiven zoals Pinot Noir en Nebbiolo: het grotere "
            "verdampingsoppervlak maximaliseert de vaak subtiele secundaire aroma's (roos, "
            "teer, bosgrond), terwijl de ingebogen rand die aroma's trechtvormig naar de "
            "neus stuurt en de wijn naar het puntje van de tong leidt, waar fruit en zuur "
            "het eerst worden opgemerkt vóór tannine.\n\n"
            "Het neutrale ISO-tasting-glas blijft de internationale standaard voor blind "
            "proeven en examens: bewust zonder stijlinterpretatie, zodat elke wijn onder "
            "identieke condities wordt beoordeeld en het glas zelf geen variabele wordt in "
            "de vergelijking.\n\n"
            "Randdikte blijft ook bij rode wijn relevant: een dunne, scherp geslepen rand "
            "laat de wijn de mond bereiken vóór de lip het glas voelt, wat de eerste "
            "indruk zuiverder maakt. Glashygiëne is bij rode wijn minder kritiek dan bij "
            "delicate aromatische witte wijn — de aromatische intensiteit en tannine van "
            "rode wijn maskeren een lichte detergentrestant sneller — maar bij blind "
            "proeven op hoog niveau blijft het een meetbaar storende factor.\n\n"
            "Praktisch onderscheiden veel sommeliers structuurtype in plaats van druif bij "
            "glaskeuze: één glasvorm voor lichte tot medium body, één voor krachtige, "
            "tanninerijke stijlen — een herkenbaar servicesignaal dat een gast alvast "
            "voorbereidt op wat komen gaat."
        ),
        "samenvatting": (
            "- Glasvorm bepaalt beluchtingsoppervlak én de plek op de tong waar wijn eerst landt\n"
            "- Bordeaux-glas stuurt krachtige, tanninerijke wijn naar midden/achterkant van de tong\n"
            "- Bourgondië-glas trechtert subtiele aroma's naar de neus en stuurt wijn naar het tongpuntje\n"
            "- ISO-tasting-glas is de neutrale standaard voor blind proeven en examens\n"
            "- Glashygiëne is bij rode wijn minder kritiek dan bij wit, maar blijft meetbaar bij blind proeven"
        ),
        "pro_insight": (
            "Schenk interne vergelijkende proeverijen altijd in een neutraal ISO-glas en "
            "bewaar het druifspecifieke glaswerk voor gastpresentatie — zo vergelijk je "
            "wijnen zuiver én verkoop je toch het juiste glas aan tafel."
        ),
        "kernbegrippen": [
            "Bordeaux-glasgeometrie",
            "Bourgondië-trechtereffect",
            "tongpositionering via glasvorm",
            "ISO-glas-standaardisatie",
            "glashygiëne bij rode wijn",
        ],
        "food_pairing": fp(
            "Nebbiolo in een breed Bourgondië-glas bij een truffelrisotto.",
            "Het brede glas trechtert de subtiele roos- en teertonen precies naar de neus, in balans met de aardse truffelintensiteit.",
            "Datzelfde brede glas voor een krachtige Cabernet Sauvignon — de wijn krijgt dan te veel beluchting vóór de tannine kans krijgt zich te settelen.",
        ),
        "reflectievraag": (
            "Welk glas in jouw zaak doet een rode wijnstijl structureel tekort — en wat is "
            "de service- of verkoopimpact daarvan aan tafel?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom past een breed Bourgondië-glas beter bij Nebbiolo dan een smal glas?\n\n"
                "A. Het grotere oppervlak trechtert subtiele secundaire aroma's beter naar de neus ✅  \n"
                "B. Het verhoogt het alcoholpercentage van de wijn  \n"
                "C. Het verlaagt de temperatuur sneller  \n"
                "D. Het is uitsluitend bedoeld voor mousserende wijn"
            ),
        },
    },
    33: {
        "theorie": (
            "Decanteren van rode wijn dient twee wezenlijk verschillende doelen, en het "
            "verwarren van die twee is de meest voorkomende beginnersfout. Sedimentscheiding "
            "is bedoeld voor oude, ongefilterde of licht gefinede wijnen met zichtbaar "
            "bezinksel: langzaam schenken bij een lichtbron (traditioneel een kaars) laat "
            "je precies zien wanneer het bezinksel de schouder van de fles bereikt, zodat "
            "je op tijd stopt met schenken. Beluchting is bedoeld voor jonge, "
            "tanninerijke wijnen: gecontroleerde zuurstofblootstelling versnelt de "
            "polymerisatie van tannine, waardoor de perceptie van astringentie verzacht en "
            "eventuele reductieve tonen verdampen.\n\n"
            "De benodigde decanteertijd schaalt met het structuurniveau: jonge Nebbiolo, "
            "Cabernet Sauvignon of Syrah kunnen één tot drie uur of langer aan, medium "
            "body-druiven zoals Merlot of Tempranillo hebben doorgaans genoeg aan twintig "
            "tot veertig minuten, en fragiele, oude wijnen vragen minimale blootstelling — "
            "soms slechts de tijd die nodig is om het bezinksel te scheiden. Hun fenolische "
            "buffering (tannine en zuur) is weliswaar hoger dan bij oude witte wijn, maar "
            "niet onuitputtelijk: eenmaal uitgeput kan de structuur die de complexiteit "
            "overeind hield relatief snel instorten.\n\n"
            "Dubbeldecanteren is een specialistische techniek: een jonge, tanninerijke wijn "
            "wordt gedecanteerd voor volledige beluchting, waarna de originele fles wordt "
            "gespoeld en de wijn erin teruggeschonken — zo kun je het label aan tafel tonen "
            "en toch de volle beluchting benutten.\n\n"
            "Voor hardnekkig gesloten, jonge tanninerijke wijnen bestaat 'hyperdecanteren' "
            "— krachtig overschenken, zwenken in een blender op lage snelheid, of "
            "herhaaldelijk tussen twee karaffen overgieten — een agressieve techniek die "
            "in enkele minuten evenveel zuurstofcontact geeft als uren rustig decanteren, "
            "bruikbaar wanneer de tijd ontbreekt.\n\n"
            "Onderscheid tot slot tartraatkristallen (onschuldige wijnsteenkristallen, die "
            "op glasscherven of suikerkorrels lijken) van echt bezinksel (een fijne, "
            "donkere neerslag van gepolymeriseerde tannine-pigmentcomplexen) — de eerste is "
            "een kwaliteitskenmerk van weinig ingrijpen, de tweede vraagt zorgvuldig "
            "decanteren."
        ),
        "samenvatting": (
            "- Sedimentscheiding (oude wijn) en beluchting (jonge tanninerijke wijn) zijn twee verschillende doelen\n"
            "- Decanteertijd schaalt met structuurniveau: uren voor krachtige jonge wijn, minuten voor fragiele oude wijn\n"
            "- Dubbeldecanteren combineert volledige beluchting met het tonen van het originele etiket\n"
            "- Hyperdecanteren (agressief overschenken of zwenken) versnelt beluchting wanneer tijd ontbreekt\n"
            "- Tartraatkristallen zijn onschuldig; echt bezinksel is gepolymeriseerde tannine-pigmentneerslag"
        ),
        "pro_insight": (
            "Vraag jezelf bij elke decanteerbeslissing eerst af of het doel zuurstof of "
            "bezinksel is — die twee vragen om een volledig andere schenktechniek en "
            "wachttijd, en verwarring daartussen is de snelste weg naar een verkeerd "
            "geserveerde fles."
        ),
        "kernbegrippen": [
            "sedimentscheiding versus beluchting",
            "dubbeldecanteren",
            "tanninepolymerisatie tijdens beluchting",
            "tartraatkristallen versus bezinksel",
            "hyperdecanteren",
        ],
        "food_pairing": fp(
            "Een jonge, gesloten Cabernet Sauvignon, twee uur gedecanteerd, bij een langzaam gegaarde runderstoof.",
            "De beluchting laat de tannine polymeriseren en ronder worden, precies passend bij de langzame, collageenrijke textuur van de stoof.",
            "Een zeer oude, fragiele Nebbiolo lang van tevoren decanteren — het delicate tertiaire boeket kan binnen een halfuur wegvallen.",
        ),
        "reflectievraag": (
            "Bij welke fles in jouw assortiment zou jij kiezen voor hyperdecanteren in "
            "plaats van rustig decanteren — en welk signaal (tijdsdruk, tanninegrip) bepaalt "
            "die keuze?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat is het belangrijkste verschil tussen decanteren voor sedimentscheiding en decanteren voor beluchting?\n\n"
                "A. Sedimentscheiding vraagt langzaam schenken bij licht, beluchting vraagt zuurstofcontact voor tanninepolymerisatie ✅  \n"
                "B. Beide technieken dienen exact hetzelfde doel  \n"
                "C. Sedimentscheiding is alleen nodig bij witte wijn  \n"
                "D. Beluchting verwijdert altijd bezinksel"
            ),
        },
    },
    34: {
        "theorie": (
            "Het bewaarpotentieel van rode wijn wordt structureel bepaald door de "
            "combinatie van tannineconcentratie, zuurgraad en extractconcentratie — "
            "buffers die samen bepalen hoe lang een wijn zich kan ontwikkelen zonder in te "
            "storten. Het kernmechanisme achter rijping is tannine-antocyaan-polymerisatie: "
            "vrije antocyanen (de jonge, felle paars-rode kleurstoffen) binden geleidelijk "
            "aan tannine tot grotere, stabielere pigmentpolymeren. Die polymeren zijn "
            "minder fel van kleur — vandaar de evolutie van paars/violet in jonge wijn naar "
            "granaat en uiteindelijk baksteenrood in oude wijn — en precipiteren "
            "uiteindelijk deels als het bezinksel dat je bij decanteren scheidt.\n\n"
            "Tertiaire aroma's bij rode wijn — leer, bosgrond, gedroogd fruit, tabak, wild "
            "— ontstaan via een langzaam oxidatief-reductief evenwicht dat via de "
            "micro-poreusheid van de kurk verloopt, samen met voortgaande esterificatie en "
            "de langzame afbraak van de grotere tanninepolymeren. Dat is een wezenlijk "
            "ander biochemisch traject dan de oxidatieve en Maillard-achtige reacties die "
            "tertiaire ontwikkeling bij witte wijn aandrijven — bij rood is tannine de "
            "hoofdrolspeler, bij wit zijn dat zuur en suiker.\n\n"
            "Appellatieregels weerspiegelen dit structurele verschil expliciet: Barolo "
            "DOCG eist wettelijk minimaal 38 maanden rijping (waarvan 18 op vat), Barbaresco "
            "26 maanden, en traditionele Cahors-Malbec vraagt eveneens langere rijping om "
            "de stevige tannine te laten integreren — in schril contrast met Beaujolais "
            "Gamay, bewust bedoeld om jong en fris gedronken te worden, met minimale "
            "tannine om op te ruimen.\n\n"
            "De universele kelderprincipes gelden onverkort: 12–14°C stabiel, donker, "
            "trillingsvrij en circa 70% luchtvochtigheid om de kurk vochtig te houden. Bij "
            "rode wijn is liggend bewaren extra belangrijk, precies omdat het "
            "bewaarvenster vaak decennia beslaat — een uitgedroogde kurk bij een "
            "twintig jaar oude Barolo is een groter risico dan bij een wijn die binnen "
            "twee jaar toch gedronken wordt.\n\n"
            "Bouw daarom een bewuste segmentatie op: licht-drink-nu, medium body voor vijf "
            "tot tien jaar, en krachtige, verzamelaarsstijlen voor tien tot dertig jaar of "
            "langer — zodat je niet per ongeluk een bewaarwijn te vroeg opent of een "
            "vroegdrinkstijl te lang laat liggen."
        ),
        "samenvatting": (
            "- Tannine, zuur en extract zijn de drie structurele buffers achter het bewaarpotentieel\n"
            "- Tannine-antocyaan-polymerisatie verklaart zowel de kleurevolutie als de vorming van bezinksel\n"
            "- Tertiaire ontwikkeling bij rood verloopt via tannineafbraak, niet via de oxidatieve route van wit\n"
            "- Appellatieregels (Barolo 38 maanden, Barbaresco 26 maanden) weerspiegelen structurele rijpingsbehoefte\n"
            "- Liggend bewaren is extra belangrijk bij rood door de vaak decennialange bewaarhorizon"
        ),
        "pro_insight": (
            "Segmenteer je kelder expliciet op structuurcategorie in plaats van alleen op "
            "druif of regio — zo voorkom je dat een gastvriendelijke, vroegdrinkbare Gamay "
            "jarenlang naast een krachtige Barolo ligt te wachten op een moment dat nooit "
            "komt."
        ),
        "kernbegrippen": [
            "tannine-antocyaan-polymerisatie",
            "kleurevolutie paars-naar-baksteen",
            "drinkvenster per structuurcategorie",
            "appellatieverplichte vatrijping",
            "kurkvochtigheid en ligpositie",
        ],
        "food_pairing": fp(
            "Een goed bewaarde, twintig jaar oude Barolo met leder- en truffeltonen bij gestoofd wild.",
            "De tertiaire leder- en aardse tonen van de gerijpte wijn spiegelen de diepe, langzaam gegaarde umami van het stoofgerecht.",
            "Een wijn die warm of met trilling is opgeslagen — vroegtijdige, oncontroleerde tannineafbraak ondermijnt precies die complexiteit.",
        ),
        "reflectievraag": (
            "Welke fles in jouw kelder zit waarschijnlijk in het verkeerde segment — nu "
            "drinken of nog jarenlang bewaren — en welke conditie (temperatuur, positie, "
            "vochtigheid) zou je het eerst corrigeren?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart de kleurevolutie van paars/violet naar granaat en baksteenrood bij het rijpen van rode wijn?\n\n"
                "A. Antocyanen binden geleidelijk aan tannine tot grotere, minder felgekleurde pigmentpolymeren ✅  \n"
                "B. De alcohol verdampt langzaam uit de fles  \n"
                "C. Contact met een schroefdop tijdens opslag  \n"
                "D. Een geleidelijke daling van het suikergehalte"
            ),
        },
    },
    35: {
        "theorie": (
            "De klassieke pairing van rode wijn met vlees is geen kwestie van traditie "
            "maar van een concreet chemisch mechanisme: tannine — polyfenolen uit schil, "
            "pit en eventueel hout — bindt zich normaal aan proline-rijke eiwitten in "
            "speeksel, wat de drogende, samentrekkende astringentie veroorzaakt die je "
            "zonder eten proeft. Eiwit- en vetrijk vlees biedt tannine een alternatieve "
            "bindingspartner: de tannine hecht zich bij voorkeur aan de eiwitten en vetten "
            "in het vlees in plaats van aan speekseleiwitten, waardoor de mond soepeler "
            "blijft, de wijn ronder aanvoelt en het vlees zelf minder zwaar overkomt.\n\n"
            "Het vetgehalte van het vlees moet schalen met het tanningehalte van de wijn. "
            "Magere sneden (ossenhaas, mager wildvlees) vragen een wijn met minder "
            "tannine, omdat er simpelweg onvoldoende vet is om overtollige tannine te "
            "binden — een zeer krachtige wijn voelt dan hard en droog aan. Vettere sneden "
            "(entrecote, lamsrack met vetrand, ribeye) kunnen juist krachtige, "
            "hooggetanninerijke wijnen aan, omdat er voldoende vet beschikbaar is om die "
            "tannine te temperen.\n\n"
            "Grillen en barbecueën voegen een tweede, aroma-gedreven mechanisme toe: de "
            "Maillard-reactie op het geschroeide oppervlak vormt pyrazines en geroosterde "
            "verbindingen die rechtstreeks resoneren met de toast- en roosternoten uit "
            "eikenhoutlagering. Dat verklaart waarom gegrild of geroosterd vlees bij "
            "houtgelagerde Cabernet Sauvignon, Malbec of Syrah zo goed werkt: het is een "
            "aroma-op-aroma-brug, niet alleen een textuurmatch.\n\n"
            "Umami uit vlees — geconcentreerd in gerijpt rundvlees en versterkt door "
            "champignonsauzen — kan juist averechts werken bij zeer hooggetanninerijke, "
            "sterk gehoute wijnen: umami kan de perceptie van bitterheid en een licht "
            "metaalachtige bijsmaak versterken als de wijn onvoldoende rijp fruit heeft om "
            "dat te bufferen. Zeer umami-rijke bereidingen vragen daarom wijnen met "
            "voldoende fruitconcentratie, niet enkel veel tannine.\n\n"
            "Donker gevogelte — eend, gans — gedraagt zich door een hoger vet- en "
            "ijzergehalte dichter bij rood vlees dan bij lichte kip, en kan daardoor "
            "dezelfde tannine-vet-logica gebruiken, alleen op een lichter register: een "
            "medium body of zelfs lichte rode wijn (Pinot Noir) volstaat waar rood vlees "
            "een krachtigere stijl zou vragen."
        ),
        "samenvatting": (
            "- Tannine bindt bij voorkeur aan eiwit en vet in vlees in plaats van aan speekseleiwitten\n"
            "- Vetgehalte van het vlees moet schalen met het tanninegehalte van de wijn\n"
            "- Maillard-verbindingen van grillen/barbecue resoneren met toastnoten uit eikenhoutlagering\n"
            "- Zeer umami-rijke bereidingen vragen wijnen met voldoende fruitconcentratie om bitterheid te bufferen\n"
            "- Donker gevogelte (eend, gans) volgt dezelfde tannine-vet-logica als rood vlees, op een lichter register"
        ),
        "pro_insight": (
            "Vraag bij twijfel eerst naar het vetgehalte van de snede vóór je een tannineniveau "
            "adviseert — een magere biefstuk met een zeer krachtige, tanninerijke wijn is een "
            "veelvoorkomende mismatch die met die ene vraag te voorkomen is."
        ),
        "kernbegrippen": [
            "tannine-eiwitbinding",
            "vetgehalte-tanninematch",
            "Maillard-brug bij barbecue",
            "umami-tannine-risico",
            "donker gevogelte als brugcategorie",
        ],
        "food_pairing": fp(
            "Gegrilde ribeye van de barbecue bij een houtgelagerde Malbec of Cabernet Sauvignon.",
            "De Maillard-geroosterde korst resoneert met de toastnoten van het eikenhout, terwijl het vet de stevige tannine bindt en verzacht.",
            "Een zeer magere ossenhaas bij een extreem krachtige, jonge Nebbiolo — te weinig vet om de tannine te temperen laat de wijn hard aanvoelen.",
        ),
        "reflectievraag": (
            "Bij welk vleesgerecht op je kaart bepaalt het vetgehalte — niet de vleessoort "
            "zelf — jouw uiteindelijke wijnadvies, en waarom?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom kan umami uit gerijpt vlees juist averechts werken bij zeer tanninerijke, sterk gehoute rode wijn?\n\n"
                "A. Umami kan de perceptie van bitterheid en een metaalachtige bijsmaak versterken zonder voldoende fruitconcentratie ✅  \n"
                "B. Umami verwijdert alle tannine uit de wijn  \n"
                "C. Umami verhoogt het suikergehalte van het gerecht  \n"
                "D. Umami heeft nooit effect op wijnperceptie"
            ),
        },
    },
    36: {
        "theorie": (
            "De veelgehoorde regel 'rode wijn hoort bij kaas' is fragieler dan de "
            "populaire aanname doet vermoeden, en het mechanisme legt precies uit waarom. "
            "Net als bij vlees bindt tannine zich aan eiwit — maar caseïne, het "
            "melkeiwit in kaas, bindt in combinatie met het hoge vetgehalte van kaas nog "
            "agressiever aan tannine dan vleeseiwitten doen. Dat kan een wijn zo sterk "
            "'overbinden' dat de structuur wegvalt: de wijn proeft dan dun, heet (de "
            "alcohol wordt relatief prominenter) of zelfs licht metaalachtig — een risico "
            "dat bij vlees veel minder speelt.\n\n"
            "Waar rode wijn wél overtuigend werkt, is bij harde, lang gerijpte kazen "
            "(Comté, oude Gouda, Parmigiano Reggiano). Hun dichtere, kristallijne "
            "eiwitmatrix bevat relatief minder vrij vet om tannine te overbinden, en hun "
            "diepe umami-intensiteit matcht de concentratie van een krachtige, hoogzure "
            "rode wijn zoals Nebbiolo of Sangiovese — een kwestie van intensiteitsmatching, "
            "niet alleen textuurmatching.\n\n"
            "Zachte, vetrijke, korstrijpe of gewassen kazen (Brie, Camembert, Époisses) zijn "
            "juist het meest voorkomende faalpunt bij rood: het overvloedige vet "
            "overbindt tannine agressief, en de doordringende geur van gewassen korstkazen "
            "botst met veel wijnaroma's. Lichte, laagtanninerijke rode wijn — Pinot Noir, "
            "Gamay — vormt hier de uitzondering, precies omdat er simpelweg minder tannine "
            "is om te overbinden.\n\n"
            "Blauwschimmelkaas is het duidelijkste voorbeeld waarbij droge rode wijn "
            "structureel verliest: de combinatie van hoog zout en scherpe schimmelintensiteit "
            "overweldigt de droge tanninestructuur, met een metaalachtige bitterheid als "
            "resultaat. Zoete, versterkte wijn zoals Port werkt hier traditioneel beter, "
            "omdat restsuiker het zout neutraliseert — een mechanisme dat een droge rode "
            "wijn simpelweg niet kan evenaren.\n\n"
            "Praktische vuistregel voor een sommelier: match de dichtheid en umami-"
            "concentratie van de kaas aan het tannine- en zuurniveau van de wijn, en "
            "wees kritisch op het automatisme 'rood hoort bij kaas' — bij zachte, "
            "vetrijke kazen presteert witte wijn of zelfs Champagne in blinde vergelijkingen "
            "vaak beter."
        ),
        "samenvatting": (
            "- Caseïne en vet in kaas binden tannine agressiever dan eiwitten in vlees — 'rood bij kaas' is fragieler dan gedacht\n"
            "- Harde, lang gerijpte kazen (Comté, oude Gouda) matchen goed via intensiteit, niet via textuur alleen\n"
            "- Zachte, vetrijke kazen overbinden tannine agressief — alleen laagtanninerijke rode wijn werkt daar goed\n"
            "- Blauwschimmelkaas botst met droge rode tannine — zoete Port werkt beter door restsuiker tegen zout\n"
            "- Match kaasdichtheid en umami-intensiteit aan tannine- en zuurniveau, niet automatisch op kleur"
        ),
        "pro_insight": (
            "Wees kritisch op het automatisme 'rode wijn hoort bij kaas' — bied bij een "
            "zachte, vetrijke kaas bewust een witte wijn of Champagne als alternatief aan; "
            "dat verrast een kaasliefhebber vaker positief dan een standaard rode keuze."
        ),
        "kernbegrippen": [
            "caseïnematrix en tanninebinding",
            "harde kaas als uitzondering",
            "intensiteitsmatching boven kleurmatching",
            "blauwschimmel-zoutmismatch",
            "washed-rind-tanninecontrast",
        ],
        "food_pairing": fp(
            "Oude Comté of Parmigiano Reggiano bij een Nebbiolo of Sangiovese.",
            "De dichte, kristallijne eiwitmatrix bindt tannine minder agressief, terwijl de diepe umami de concentratie van de wijn matcht.",
            "Een zachte, vetrijke Brie bij dezelfde krachtige, hooggetanninerijke wijn — het overvloedige vet overbindt de tannine en laat de wijn dun aanvoelen.",
        ),
        "reflectievraag": (
            "Bij welke kaas op jouw plank zou jij een gast bewust naar wit in plaats van "
            "rood sturen — en welk mechanisme (caseïnebinding, zout) gebruik je om dat "
            "advies te onderbouwen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom is de combinatie rode wijn en kaas fragieler dan vaak wordt aangenomen?\n\n"
                "A. Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees ✅  \n"
                "B. Kaas bevat altijd meer tannine dan vlees  \n"
                "C. Kaas heeft nooit vet  \n"
                "D. Rode wijn bevat geen eiwit"
            ),
        },
    },
    37: {
        "theorie": (
            "Wildvlees verschilt structureel van gefokt vlees: minder intramusculair vet, "
            "dichter spierweefsel door natuurlijke beweging, en een hoger myoglobinegehalte "
            "dat de kenmerkende, licht ijzerachtige 'wilde' toon geeft. Dat betekent dat "
            "het klassieke tannine-vet-mechanisme van les 35 hier zwakker werkt — er is "
            "simpelweg minder vet beschikbaar om tannine te binden — waardoor pairing bij "
            "wild sterker leunt op een aroma-brug dan op textuurbuffering: aardse, wilde "
            "en umami-tonen in het vlees resoneren met tertiaire aroma's in gerijpte wijn "
            "(bosgrond, leer, gedroogd fruit, paddenstoel).\n\n"
            "Dat verklaart waarom gerijpte, tertiair ontwikkelde wijn (oude Nebbiolo, "
            "gerijpte Syrah, gerijpte Sangiovese) bij wild vaak beter presteert dan een "
            "jonge, puur op primair fruit gerichte wijn — de aromatische resonantie op "
            "verbindingsniveau weegt hier zwaarder dan pure structuurmatching.\n\n"
            "De saus stuurt de keuze sterk. Fruitgedreven, zoetere reductiesauzen (kers, "
            "bosbes bij hertenvlees) vragen een wijn met voldoende rijp fruit om die "
            "zoetheidsperceptie te evenaren — anders proeft de wijn plots zuur en dun in "
            "vergelijking. Rijke, donkere paddenstoel-wijnreductiesauzen — klassiek Frans "
            "bij wild — vragen juist een wijn met aardse, umami-compatibele tonen en "
            "voldoende zuur om door de rijkdom van de saus te snijden. Peperige, "
            "jeneverbesgedreven marinades (klassiek bij hertenvlees en wild zwijn) "
            "resoneren specifiek met rotundone-gedreven wijnen zoals Syrah — hetzelfde "
            "mechanisme als in les 27.\n\n"
            "De intensiteitsschaal van wild loopt op: lichter gevogelte-wild (patrijs, "
            "fazant) sluit qua pairinglogica dichter aan bij gevogelte en verdraagt "
            "lichtere, elegante rode wijn zoals Pinot Noir; behaard wild (hert, wild "
            "zwijn, haas) zit aan het meest intense uiteinde en vraagt de meest complexe, "
            "vaak gerijpte en structuurrijke wijnen.\n\n"
            "Praktisch betekent dit een omkering ten opzichte van vlees: bij wild vraag je "
            "eerst naar de saus en de gaarheid/leeftijd van de wijn, niet primair naar het "
            "vetgehalte — de aromatische resonantie is hier de dominante, sturende factor."
        ),
        "samenvatting": (
            "- Wild heeft minder vet en meer myoglobine dan gefokt vlees — het tannine-vet-mechanisme werkt zwakker\n"
            "- Aardse, tertiaire tonen in gerijpte wijn resoneren met de wilde, aardse smaak van het vlees\n"
            "- Fruitgedreven sauzen vragen rijp fruit in de wijn; paddenstoel-wijnsauzen vragen umami-compatibele aardsheid\n"
            "- Peperige jeneverbesmarinades resoneren specifiek met rotundone-gedreven wijnen zoals Syrah\n"
            "- Intensiteit loopt op van lichter gevogelte-wild naar behaard wild, dat de meest complexe wijn vraagt"
        ),
        "pro_insight": (
            "Vraag bij wildpairing eerst naar de saus en de leeftijd van de beschikbare "
            "wijn vóór je naar het wildtype kijkt — de aromatische resonantie tussen "
            "tertiaire tonen en de saus stuurt hier sterker dan bij standaard vleespairing."
        ),
        "kernbegrippen": [
            "myoglobineconcentratie",
            "tertiaire aromabrug",
            "sausgedreven wildpairing",
            "rotundone-marinadematch",
            "wildintensiteitsschaal",
        ],
        "food_pairing": fp(
            "Hertenbiefstuk met een rijke rode wijn-paddenstoelsaus bij een gerijpte Nebbiolo of Syrah.",
            "De aardse, tertiaire leder- en bosgrondtonen van de gerijpte wijn resoneren met de umami van de paddenstoelsaus, terwijl het zuur door de rijkdom snijdt.",
            "Een jonge, puur op primair fruit gerichte wijn bij hetzelfde gerecht — zonder tertiaire ontwikkeling ontbreekt de aromatische brug volledig.",
        ),
        "reflectievraag": (
            "Bij welk wildgerecht op je kaart bepaalt de saus — niet het wildtype zelf — "
            "jouw uiteindelijke wijnadvies, en waarom?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom werkt het tannine-vet-mechanisme minder sterk bij wild dan bij gefokt rood vlees?\n\n"
                "A. Wild heeft minder intramusculair vet, waardoor pairing meer op aromatische resonantie leunt ✅  \n"
                "B. Wild bevat geen eiwit  \n"
                "C. Wild bevat altijd meer tannine dan gefokt vlees  \n"
                "D. Wild wordt nooit met rode wijn gecombineerd"
            ),
        },
    },
    38: {
        "theorie": (
            "Pinot Noir versus Nebbiolo blind vraagt een vaste deductieketen, precies "
            "omdat de eerste, meest voor de hand liggende observatie — kleur — hier "
            "misleidt. Beide tonen een vergelijkbare bleke, granaatachtige kleur, maar om "
            "totaal verschillende redenen: Pinot Noir is werkelijk arm aan zowel "
            "kleurstof als tannine (dunne schil, weinig pitten relatief tot het vruchtvlees); "
            "Nebbiolo is even arm aan kleurstof maar extreem rijk aan tannine door een "
            "specifieke, catechinerijke schil- en pitchemie. Kleurintensiteit is bij deze "
            "twee druiven dus geen betrouwbare voorspeller van tanninegehalte — de "
            "belangrijkste valkuil in deze vergelijking.\n\n"
            "De deductieketen begint visueel: beide zijn bleek, maar Nebbiolo toont vaak "
            "al jong een oranje-granaatrand door een lager totaal antocyaangehalte en "
            "snellere pigmentpolymerisatie. Op de neus toont Pinot Noir rode kers, "
            "framboos en bosgrond; Nebbiolo toont rozen (damasceon), teer, gedroogde "
            "kruiden en zoethout. Op de mond is tannine de doorslaggevende factor: Pinot "
            "Noir's tannine is fijn, laag en zijdezacht; Nebbiolo's tannine grijpt intens "
            "en droog, ondanks de vergelijkbaar bleke kleur — die ene tastwaarneming zou "
            "elke op kleur gebaseerde hypothese meteen moeten omgooien.\n\n"
            "Klimaat bevestigt het onderscheid: Pinot Noir gedijt in een werkelijk koel "
            "klimaat (Bourgogne, Central Otago, Oregon); Nebbiolo heeft een specifiek "
            "Piemontees mesoklimaat nodig van warme dagen en koele, mistige nachten. Beide "
            "kunnen hoge zuren tonen, maar bij Nebbiolo combineert dat zuur met extreme "
            "tannine tot een langdurige, strakke grip, terwijl bij Pinot Noir zuur en "
            "fijne tannine samen een lineairdere, vloeiendere indruk geven.\n\n"
            "Eikensignaal is dubbelzinnig: traditionele Nebbiolo (grote, oude Slavonische "
            "vaten) toont nauwelijks nieuwe houtzoetheid, terwijl moderne Nebbiolo of "
            "Pinot Noir in Franse barrique wél vanille en toast kan tonen — hout alleen "
            "disambigueert dus niets, wat het belang van de tanninestructuur als "
            "primair bewijs alleen maar versterkt.\n\n"
            "Jonge Nebbiolo vormt een klassieke valstrik voor wie vooral op Pinot Noir "
            "getraind is: de neus kan verrassend delicaat en bloemig ogen, terwijl de mond "
            "meteen een compromisloze, drogende grip toont. Train daarom expliciet het "
            "hypothese-vóór-onthullingsprotocol: benoem eerst je kleurobservatie, dan je "
            "aromahypothese, en pas daarna je bevestiging of verwerping op basis van de "
            "mond — vóórdat je het etiket ziet."
        ),
        "samenvatting": (
            "- Beide druiven zijn bleek van kleur, maar om tegengestelde redenen — kleur is geen betrouwbare tannine-indicator\n"
            "- Pinot Noir: fijne, zijdezachte tannine, rood fruit en bosgrond; Nebbiolo: extreme grip, roos, teer en kruiden\n"
            "- Tannine op de mond is het beslissende signaal, niet kleur of neus alleen\n"
            "- Eikensignaal is dubbelzinnig bij beide druiven en disambigueert de vergelijking niet\n"
            "- Train het hypothese-vóór-onthullingsprotocol: kleur, dan aroma, dan mond, vóór het etiket"
        ),
        "pro_insight": (
            "Leg na elke blindronde je topfout vast in één zin ('te snel op kleur "
            "vertrouwd, te weinig op tanninegrip'). Dat versnelt leren meer dan tien "
            "perfecte proeven zonder reflectie."
        ),
        "kernbegrippen": [
            "kleur-als-onbetrouwbare-indicator",
            "grip-versus-lineariteit",
            "mesoklimaat Piemonte",
            "hypothese-vóór-onthullingsprotocol",
            "eikensignaal-dubbelzinnigheid",
        ],
        "food_pairing": fp(
            "Bourgogne rouge (Pinot Noir) bij eend met bospaddenstoelen, of jonge Nebbiolo bij een lichte kalfsragout.",
            "Beide combinaties gebruiken de fijne tot stevige tanninestructuur van de druif om umami te dragen zonder de subtiele balans te overstemmen.",
            "Een zeer krachtige, jonge Nebbiolo bij een delicaat visgerecht — de extreme tanninegrip verpletteert die subtiliteit volledig.",
        ),
        "reflectievraag": (
            "Bij je laatste blindproef: welke stap in de keten (kleur, neus of mond) sloeg "
            "je onbewust over vóór je naar een conclusie sprong?"
        ),
    },
    39: {
        "theorie": (
            "Merlot versus Cabernet Sauvignon blind draait om één centraal mechanisme: "
            "een verschillende rijpingscurve die rechtstreeks voortkomt uit schildikte en "
            "bessengrootte. Merlot heeft een dunnere schil en grotere bessen — een lagere "
            "schil-tot-sap-verhouding — waardoor de druif één tot twee weken eerder rijpt "
            "dan Cabernet Sauvignon, met zachtere, rondere tannine en minder "
            "pyrazine omdat volledige rijpheid makkelijker haalbaar is, zelfs in koelere "
            "jaren. Dat verklaart precies waarom de kleirijke, vochtigere Right Bank van "
            "Bordeaux (Pomerol, Saint-Émilion) Merlot als hoofddruif koos — betrouwbare "
            "rijping op koelere grond — terwijl de warmtevasthoudende, goed drainerende "
            "grind van de Left Bank (Médoc) precies de extra hitte biedt die Cabernet "
            "Sauvignon nodig heeft om zijn dikkere schil volledig te laten rijpen.\n\n"
            "De deductieketen: visueel tonen beide een diepe kleur, met Cabernet "
            "Sauvignon vaak iets meer verzadigd door een hogere kleurstof-tannine-"
            "verhouding in de schil. Op de neus toont Merlot pruim, zwarte kers, cacao en "
            "zachter, ronder zwart-rood fruit; Cabernet Sauvignon toont cassis, eventueel "
            "groene paprika bij onderrijpheid, ceder en potlood/grafiet — een "
            "mineraal-savoury signatuur. Op de mond is tanninekorrel opnieuw beslissend: "
            "Cabernets tannine is steviger, korreliger, met een langere, drogere afdronk; "
            "Merlots tannine is voller, ronder, met een kortere grip.\n\n"
            "Genetisch zijn de twee druiven nauwer verwant dan hun structurele "
            "tegenpolen doen vermoeden: Merlot is een kruising van Cabernet Franc en "
            "Magdeleine Noire des Charentes — dezelfde moederdruif die, gekruist met "
            "Prunelard, ook Malbec voortbracht (les 28). Merlot en Malbec zijn dus "
            "halfbroers, en Merlot en Cabernet Sauvignon delen via Cabernet Franc "
            "eveneens verwantschap — een genetische Bordeaux-stamboom die verklaart "
            "waarom deze druiven zo naadloos in blends samenwerken in plaats van elkaar "
            "te overschaduwen.\n\n"
            "Klimaat en jaargang bevestigen de rijpingslogica: in een koeler jaargang kan "
            "Cabernet Sauvignon onvoldoende rijpen (dominante groene paprika, harde "
            "tannine) terwijl Merlot nog steeds slaagt — historisch de verzekeringslogica "
            "achter het samen aanplanten van beide druiven in Bordeaux.\n\n"
            "De snelste praktische heuristiek blijft: voelt de wijn rond of strak? Rond "
            "correleert met de lager gepolymeriseerde, oplosbaardere tannine van Merlot; "
            "strak correleert met de hoger gepolymeriseerde, uit een dikkere schil "
            "geëxtraheerde tannine van Cabernet Sauvignon — een eenvoudige vraag met een "
            "onderliggend, uitlegbaar mechanisme."
        ),
        "samenvatting": (
            "- Merlot rijpt één tot twee weken eerder dan Cabernet Sauvignon door een dunnere schil en grotere bessen\n"
            "- Klei (Right Bank, Merlot) versus grind (Left Bank, Cabernet Sauvignon) weerspiegelt die rijpingsbehoefte\n"
            "- Tanninekorrel is het beslissende signaal: rond en vol (Merlot) versus strak en korrelig (Cabernet Sauvignon)\n"
            "- Merlot en Malbec zijn genetische halfbroers via moederdruif Magdeleine Noire des Charentes\n"
            "- Koudere jaargangen verklaren historisch waarom Bordeaux beide druiven samen aanplant als verzekering"
        ),
        "pro_insight": (
            "Bij twijfel tussen Merlot en Cabernet Sauvignon: vertrouw eerst op de "
            "tanninekorrel (rond versus strak), niet op kleur alleen — kleurverzadiging "
            "verschilt te subtiel om als hoofdbewijs te dienen."
        ),
        "kernbegrippen": [
            "rijpingscurve-verschil",
            "grind versus klei (Bordeaux-oevers)",
            "pyrazine-onderrijpheidssignaal",
            "cederhout-en-grafietsignatuur",
            "Bordeaux-stamboomverwantschap",
        ],
        "food_pairing": fp(
            "Merlot bij eendenborst met pruimensaus, of Cabernet Sauvignon bij gegrilde ribeye.",
            "Merlots ronde tannine en pruimtoon spiegelen de zoete saus; Cabernets stevigere, korreligere tannine matcht het geroosterde vet van de ribeye.",
            "Een strak, jong Cabernet Sauvignon bij een delicaat gerecht met pruimensaus — de stevige tannine en cassis overstemmen de zachte zoetheid van de saus.",
        ),
        "reflectievraag": (
            "Wat vond jij moeilijker: tanninekorrel isoleren of het genetische verband "
            "tussen Merlot en Malbec onthouden — en welk glas zou je nogmaals willen "
            "proeven om zeker te worden?"
        ),
    },
    40: {
        "theorie": (
            "Dit Master-examen integreert de volledige Red Wine Track: fundament, "
            "productie, proeftechniek, lichte, medium en krachtige druivenrassen, service, "
            "pairing en blindanalyse. Het productieproces — schilcontact en extractie als "
            "bron van kleur en tannine, de keuze voor houtlagering — legt de basis voor "
            "drie druivenfamilies die elk een ander structureel mechanisme centraal "
            "stellen: lichte druiven (Pinot Noir, Gamay, Grenache, Cinsault, Mencía) "
            "drijven op fijne tannine en primair fruit; medium body-druiven (Merlot, "
            "Sangiovese, Tempranillo, Barbera, Zinfandel) balanceren tannine, zuur en "
            "fruitconcentratie; krachtige druiven (Cabernet Sauvignon, Syrah, Malbec, "
            "Nebbiolo, Mourvèdre) drijven op dikke schillen, hoge tannineconcentratie en "
            "vaak een specifieke genetische of klimatologische verklaring voor hun "
            "kracht.\n\n"
            "Service bouwt daarop voort: temperatuur stuurt tegelijk ethanolvolatiliteit "
            "en de eiwitbindingskinetiek achter tanninepercepetie, glasvorm richt "
            "beluchting en tongpositionering per structuurtype, decanteren lost bij rode "
            "wijn zowel sedimentscheiding als tanninepolymerisatie op afhankelijk van het "
            "doel, en bewaren verloopt via tannine-antocyaan-polymerisatie in plaats van "
            "de oxidatieve route van witte wijn. Pairing bouwt op onderliggende "
            "mechanismen — tannine-eiwitbinding verklaart waarom rood bij vlees werkt, de "
            "agressievere caseïnebinding verklaart waarom rood bij kaas fragieler is dan "
            "gedacht, en de zwakkere vetbuffering bij wild verschuift pairinglogica naar "
            "een aromatische tertiaire brug.\n\n"
            "Blindanalyse integreert dat allemaal in één systematische keten: visueel, "
            "neus (primair, secundair, tertiair — met specifieke chemische en genetische "
            "markers zoals rotundone, damasceon, IBMP-pyrazine en tannine-kleur-"
            "ontkoppeling als objectief bewijs in plaats van gokwerk), mond, klimaat- en "
            "houtsignaal, en pas dan een onderbouwde hypothese. Pinot Noir versus "
            "Nebbiolo en Merlot versus Cabernet Sauvignon tonen beide dat tanninestructuur "
            "— niet kleur, niet hout — het betrouwbaarste bewijs is.\n\n"
            "Succesvolle examenkandidaten vermijden drie terugkerende fouten: te snel op "
            "kleurintensiteit vertrouwen als tannine-indicator vóór de tastwaarneming "
            "compleet is, verkeerde temperatuur- of glasaannames bij servicevragen die "
            "structuurtype negeren, en pairingadvies dat traditie citeert ('rood hoort bij "
            "vlees, rood hoort bij kaas') zonder het onderliggende mechanisme te benoemen. "
            "Dit examen beloont expliciete argumentatie boven geraden antwoorden, op elk "
            "van de drie examenonderdelen."
        ),
        "samenvatting": (
            "- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)\n"
            "- Productie en druivenfamilies (licht, medium, krachtig) vormen het fundament van elke analyse\n"
            "- Service en pairing bouwen op mechanismen (temperatuur, tannine-eiwitbinding, caseïnebinding)\n"
            "- Blindanalyse vraagt tannine en structuur eerst — chemische en genetische markers boven gokwerk\n"
            "- Veelvoorkomende fouten: op kleur vertrouwen, verkeerde temperatuuraannames, traditie zonder mechanisme"
        ),
        "pro_insight": (
            "Lees examenvragen als servicecases: wat zou je schenken vrijdagavond om 20:00 "
            "bij deze gast en dit gerecht — en waarom precies dat mechanisme, niet die "
            "traditie?"
        ),
        "kernbegrippen": [
            "examenintegratie",
            "systematische deductieketen",
            "tanninemechanismen in service en pairing",
            "structuur-eerst-principe",
            "certificering",
        ],
        "food_pairing": fp(
            "Examenonderdeel pairing: kies per gerecht een rode wijnstijl op basis van tannine-eiwitbinding, caseïnebinding en aromatische brug.",
            "Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.",
            "Eén wijnstijl voor alle examengerechten zonder onderbouwing per mechanisme.",
        ),
        "reflectievraag": (
            "Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste "
            "schakel, en welke ene wekelijkse routine zou dat het snelst verbeteren?"
        ),
        "praktijk": (
            "### Examenonderdeel 1 — Theorie (20 vragen)\n\n"
            "Beantwoord de volledige meerkeuzequiz van twintig vragen zonder hulpmiddelen. "
            "Minimaal 70% (14 van de 20) is vereist om te slagen.\n\n"
            "### Examenonderdeel 2 — Blindproeven (2 glazen)\n\n"
            "Analyseer twee rode wijnen — bij voorkeur uit verschillende structuurcategorieën "
            "(bijvoorbeeld één medium body en één krachtige stijl) — volgens het vaste "
            "protocol:\n\n"
            "- kleur en intensiteit (inclusief randkleur)\n"
            "- geur (primair, secundair, tertiair)\n"
            "- tannine, zuur, body en lengte\n"
            "- vermoedelijk druivenras, met minstens drie argumenten\n"
            "- serviceadvies (temperatuur, glas, decanteren)\n\n"
            "### Examenonderdeel 3 — Pairing (3 gerechten)\n\n"
            "Koppel een onderbouwde rode wijnstijl aan elk van de volgende gerechten:\n\n"
            "1. Gegrilde ribeye van de barbecue\n"
            "2. Oude Comté of vergelijkbare harde kaas\n"
            "3. Hertenbiefstuk met een rijke wildsaus\n\n"
            "Motiveer elke keuze via het onderliggende mechanisme (tannine-eiwitbinding, "
            "caseïnebinding, aromatische brug) — niet via traditie alleen.\n\n"
            "### Beoordeling\n\n"
            "- 18–20 goed + correcte blindanalyse = Master Distinction\n"
            "- 15–17 goed = Master Pass\n"
            "- 12–14 goed = Conditional Pass — herhaal de zwakste module\n"
            "- Minder dan 12 goed = Retry\n\n"
            "Bij slagen ontvang je de certificering **Way of Tasting Academy — Red Wine "
            "Certified (Master Foundation)**."
        ),
        "quiz_full": (
            "### Vraag 1\n\n"
            "Wat is het belangrijkste doel van schilcontact bij rode wijnproductie?\n\n"
            "A. Extractie van kleur en tannine uit de schil ✅  \n"
            "B. Suiker verhogen  \n"
            "C. Zuur verlagen  \n"
            "D. Alcohol verwijderen\n\n"
            "### Vraag 2\n\n"
            "Wat gebeurt er tijdens alcoholische gisting?\n\n"
            "A. Suiker wordt omgezet in alcohol en CO₂ ✅  \n"
            "B. Tannine wordt afgebroken  \n"
            "C. Appelzuur wordt omgezet in melkzuur  \n"
            "D. Kleurstof wordt verwijderd\n\n"
            "### Vraag 3\n\n"
            "Welke techniek is klassiek voor Gamay in Beaujolais?\n\n"
            "A. Koolzuurmaceratie ✅  \n"
            "B. Fortificatie  \n"
            "C. Solera-blending  \n"
            "D. Botrytisconcentratie\n\n"
            "### Vraag 4\n\n"
            "Welke druif staat bekend om hoge zuren en lage tot medium tannines, gekoppeld aan sterke terroirgevoeligheid?\n\n"
            "A. Pinot Noir ✅  \n"
            "B. Cabernet Sauvignon  \n"
            "C. Mourvèdre  \n"
            "D. Malbec\n\n"
            "### Vraag 5\n\n"
            "Met welke regio wordt Sangiovese het sterkst geassocieerd?\n\n"
            "A. Chianti (Toscane) ✅  \n"
            "B. Rioja  \n"
            "C. Barossa Valley  \n"
            "D. Mendoza\n\n"
            "### Vraag 6\n\n"
            "Wat verklaart de genetische afkomst van Cabernet Sauvignon?\n\n"
            "A. Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc ✅  \n"
            "B. Een kloon van Nebbiolo  \n"
            "C. Een kruising van Merlot en Malbec  \n"
            "D. Een mutatie van Grenache\n\n"
            "### Vraag 7\n\n"
            "Welke stof veroorzaakt de zwarte-pepertoon in Syrah?\n\n"
            "A. Rotundone ✅  \n"
            "B. Diacetyl  \n"
            "C. Linalool  \n"
            "D. TDN\n\n"
            "### Vraag 8\n\n"
            "Waar werd Malbec beroemd nadat de druif bijna uit Frankrijk verdween?\n\n"
            "A. Mendoza, Argentinië ✅  \n"
            "B. Rioja, Spanje  \n"
            "C. Barossa Valley, Australië  \n"
            "D. Douro, Portugal\n\n"
            "### Vraag 9\n\n"
            "Wat is het meest opvallende structurele kenmerk van Nebbiolo?\n\n"
            "A. Bleke kleur gecombineerd met extreem hoge tannine ✅  \n"
            "B. Diepe kleur gecombineerd met lage tannine  \n"
            "C. Zeer lage zuurgraad  \n"
            "D. Volledige afwezigheid van tannine\n\n"
            "### Vraag 10\n\n"
            "Welke druif vormt traditioneel de ruggengraat van GSM-blends?\n\n"
            "A. Mourvèdre ✅  \n"
            "B. Pinot Noir  \n"
            "C. Sangiovese  \n"
            "D. Tempranillo\n\n"
            "### Vraag 11\n\n"
            "Op welke temperatuur serveer je een krachtige, hooggetanninerijke rode wijn meestal?\n\n"
            "A. 8–10°C  \n"
            "B. 12–14°C  \n"
            "C. 16–18°C ✅  \n"
            "D. 22–24°C\n\n"
            "### Vraag 12\n\n"
            "Waarom past een breed Bourgondië-glas beter bij Nebbiolo dan een smal glas?\n\n"
            "A. Het grotere oppervlak trechtert subtiele secundaire aroma's beter naar de neus ✅  \n"
            "B. Het verhoogt het alcoholpercentage  \n"
            "C. Het verlaagt de temperatuur sneller  \n"
            "D. Het is uitsluitend bedoeld voor mousserende wijn\n\n"
            "### Vraag 13\n\n"
            "Waarom decanteer je een jonge, tanninerijke rode wijn?\n\n"
            "A. Om tannine te laten polymeriseren en de perceptie van astringentie te verzachten ✅  \n"
            "B. Om het suikergehalte te verlagen  \n"
            "C. Om kleur toe te voegen  \n"
            "D. Om het alcoholpercentage te verhogen\n\n"
            "### Vraag 14\n\n"
            "Wat verklaart de kleurevolutie van paars naar baksteenrood bij het rijpen van rode wijn?\n\n"
            "A. Antocyanen binden geleidelijk aan tannine tot grotere, minder felgekleurde pigmentpolymeren ✅  \n"
            "B. De alcohol verdampt langzaam  \n"
            "C. Contact met een schroefdop  \n"
            "D. Een daling van het suikergehalte\n\n"
            "### Vraag 15\n\n"
            "Waarom voelt een rode wijn met tannine vaak zachter aan bij vet, eiwitrijk vlees?\n\n"
            "A. Tannine bindt bij voorkeur aan eiwit en vet in het vlees in plaats van aan speekseleiwitten ✅  \n"
            "B. Vlees verwijdert alle tannine uit de wijn  \n"
            "C. Vlees verhoogt het suikergehalte van de wijn  \n"
            "D. Vlees heeft geen effect op tannineperceptie\n\n"
            "### Vraag 16\n\n"
            "Waarom is de combinatie rode wijn en kaas fragieler dan vaak wordt aangenomen?\n\n"
            "A. Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees ✅  \n"
            "B. Kaas bevat altijd meer tannine dan vlees  \n"
            "C. Kaas heeft nooit vet  \n"
            "D. Rode wijn bevat geen eiwit\n\n"
            "### Vraag 17\n\n"
            "Waarom leunt pairing bij wild sterker op een aromatische brug dan op tannine-vetbuffering?\n\n"
            "A. Wild heeft minder intramusculair vet dan gefokt vlees ✅  \n"
            "B. Wild bevat geen eiwit  \n"
            "C. Wild wordt nooit met rode wijn gecombineerd  \n"
            "D. Wild bevat altijd meer tannine dan rundvlees\n\n"
            "### Vraag 18\n\n"
            "Wat is bij Pinot Noir versus Nebbiolo het meest betrouwbare onderscheidende signaal?\n\n"
            "A. Kleurintensiteit  \n"
            "B. Tanninegrip op de mond ✅  \n"
            "C. Het gebruikte glas  \n"
            "D. De flesvorm\n\n"
            "### Vraag 19\n\n"
            "Wat verklaart het rijpingsverschil tussen Merlot en Cabernet Sauvignon het beste?\n\n"
            "A. Een dunnere schil en grotere bessen bij Merlot zorgen voor vroegere, betrouwbaardere rijping ✅  \n"
            "B. Merlot heeft altijd meer suiker nodig  \n"
            "C. Cabernet Sauvignon heeft geen schil  \n"
            "D. Merlot wordt nooit gehout gelagerd\n\n"
            "### Vraag 20\n\n"
            "Wat is de kern van systematisch blindproeven bij rode wijn?\n\n"
            "A. Een vaste keten van kleur, neus, mond en structuur, met een hypothese vóór de conclusie ✅  \n"
            "B. Direct naar het etiket kijken vóór het proeven  \n"
            "C. Alleen op kleur vertrouwen  \n"
            "D. Alleen op de regio van herkomst gokken"
        ),
        "quiz_feedback": (
            "Gefeliciteerd. Je beheerst nu het volledige fundament van rode wijn: theorie, "
            "productie, druivenkennis (licht, medium en krachtig), professionele service, "
            "gastronomische pairing en systematisch blindproeven.\n\n"
            "Volgende logische tracks:\n\n"
            "- Witte Wijn Track  \n"
            "- Rosé Wijn Track  \n"
            "- Mousserende Wijn Track  \n"
            "- Port Track  \n"
            "- Cocktails Track"
        ),
    },
}
