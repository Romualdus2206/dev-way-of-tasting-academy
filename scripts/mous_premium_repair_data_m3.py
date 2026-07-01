"""Premium repair data — MOUS lessons 11–25 (modules 3–5)."""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    11: {
        "theorie": (
            "Mousserend proeven vraagt dezelfde discipline als stille wijn — met één extra analyse-as: "
            "mousse en druk. Waarom eerst kijken? Omdat bubbelgrootte, opstijging en persistentie je "
            "vóór de neus al vertellen welke productieroute waarschijnlijk is, zonder dat je naar het etiket grijpt.\n\n"
            "Visueel lees je helderheid, kleur en mousse. Daarna de neus: primair fruit, autolyse (brioche, toast) "
            "en eventuele rijping. In de mond scheid je bewust zuur, mousse-textuur, body, dosage-effect en lengte. "
            "Dosage voel je niet als “suiker” maar als ronding; mousse niet als “schuim” maar als spanning.\n\n"
            "Hoe test je balans? Een wijn met scherp zuur maar grove, korte mousse voelt onafgemaakt; een wijn met "
            "zachte mousse maar vlak zuur voelt log. Topmousserend combineert lift, frisheid en een schone afdronk.\n\n"
            "Wanneer gebruik je dit protocol? Bij elke servicebeslissing, blindproef en kwaliteitscontrole — "
            "vaste volgorde voorkomt dat je te snel naar fruit of merk springt."
        ),
        "samenvatting": (
            "- Visuele mousse-analyse gaat vóór aroma en smaak\n"
            "- Proefprotocol: zuur, mousse, body, dosage-effect, lengte\n"
            "- Balans = spanning zonder hardheid, textuur zonder zoetheidsmasker\n"
            "- Druk beïnvloedt hoe aroma's vrijkomen in neus en mond\n"
            "- Vaste volgorde maakt service- en blindadvies reproduceerbaar"
        ),
        "food_pairing": fp(
            "Amuse met citroen, zeezout en lichte boter.",
            "Het proefprotocol test direct of zuur en mousse het gerecht verfrissen zonder te domineren.",
            "Zware umami-bouillon als eerste proef — die verdoezelt fijne mousse-details.",
        ),
        "pro_insight": (
            "Noteer in service altijd vier woorden na de eerste slok: mousse, zuur, dosage, lengte. "
            "Dat vocabulaire is genoeg om team en gast op één lijn te krijgen."
        ),
        "reflectievraag": (
            "Welke stap in jouw huidige proefroutine sla je het vaakst over — visuele mousse, neus of "
            "dosage-inschatting — en welk foutadvies levert dat op?"
        ),
    },
    12: {
        "theorie": (
            "Mousse-analyse is de snelste kwaliteitsbarometer in mousserend. Waarom? Bubbelgrootte, snelheid en "
            "persistentie vertalen direct druk, gistcontact en productiemethode naar textuur — los van fruit of dosage.\n\n"
            "Fijne, langzaam opstijgende bubbels wijzen meestal op hogere druk en zorgvuldiger fleswerk; grove, "
            "agressieve schuim wijst vaker op tankgisting of te warme service. Persistentie aan de wand na 30 seconden "
            "zegt meer over integratie dan de eerste schuimkop.\n\n"
            "Hoe vergelijk je twee glazen? Houd temperatuur en glasreinheid gelijk; kijk eerst naar lijn aan de wand, "
            "daarna naar mondgevoel. Traditionele methode wint vaak op persistentie; tank wint soms op direct fruit "
            "maar verliest op fijnheid.\n\n"
            "Wanneer gebruik je mousse als diagnose? Bij blindproef, kwaliteitsklacht (“te plat”) en upsell: "
            "fijne mousse rechtvaardigt gastronomische fles beter dan aroma-woorden alleen."
        ),
        "samenvatting": (
            "- Bubbelgrootte, snelheid en persistentie = textuurdiagnose\n"
            "- Fijne wandlijn wijst op druk en methode; grove schuim op tank of servicefout\n"
            "- Mousse beïnvloedt mondgevoel los van aroma en restsuiker\n"
            "- Vergelijk altijd bij gelijke temperatuur en glasreinheid\n"
            "- Mousse is de eerste blindhint tussen traditioneel en tank"
        ),
        "food_pairing": fp(
            "Twee blind geproefde mousserende wijnen bij krokante gougères.",
            "Krokant vet test of mousse de afdronk schoon houdt; verschil in persistentie wordt meteen tastbaar.",
            "Zoet glazuur op het hapje — dat maskeert mousseverschillen.",
        ),
        "pro_insight": (
            "Film 20 seconden tegen het licht vóór je ruikt. Gasten die “geen verschil” proeven tussen fles en tank "
            "zien vaak wél verschil zodra je de wandlijn benoemt."
        ),
        "reflectievraag": (
            "Welk mousse-signaal — fijnheid, snelheid of persistentie — gebruik jij als eerste om methode te gokken bij blindproef?"
        ),
    },
    13: {
        "theorie": (
            "Aromalagen geven mousserend zijn identiteit naast mousse. Primair fruit (appel, peer, citrus, witte bloemen) "
            "komt uit de druif; secundaire tonen (brioche, toast, brooddeeg) uit gist en autolyse; tertiair (honing, noten, "
            "gedroogd fruit) uit flesrijping. Waarom scheiden? Omdat blindproef meestal draait om secundair versus primair dominantie.\n\n"
            "Bij traditionele flesgisting is secundair vaak de differentiator; bij tank domineert primair. Dosage maskeert "
            "niet autolyse maar kan rijpere tonen versterken — lees lagen vóór je “zoet” zegt.\n\n"
            "Hoe train je herkenning? Eén descriptor per laag, maximaal drie per categorie. Vermijd parfumtaal zonder "
            "koppeling aan productie.\n\n"
            "Wanneer inzetten? Bij gastadvies (“fris en fruitig” = tank/jong; “toast en noten” = fles/rijper) en bij "
            "foutcorrectie wanneer iemand alleen primair fruit benoemt op oude Champagne."
        ),
        "samenvatting": (
            "- Primair = druif; secundair = gist/autolyse; tertiair = flesrijping\n"
            "- Traditioneel wint vaak op secundaire diepte; tank op primair fruit\n"
            "- Dosage beïnvloedt waarneming maar vervangt geen autolyse\n"
            "- Blindhint: brioche/toast wijst weg van pure tankstijl\n"
            "- Drie lagen apart benoemen voorkomt vage proefnotities"
        ),
        "food_pairing": fp(
            "Gerijpte Champagne met brioche-tonen bij gevogelte met room.",
            "Secundaire autolyse-echo's harmoniseren met geroosterde en romige elementen zonder zoetheid.",
            "Zeer jonge tankwijn met alleen primair fruit — die verliest culinair tegen romige saus.",
        ),
        "pro_insight": (
            "Vraag in training: “proef je druif of proef je gist?” Die ene vraag scheidt Explorer van Specialist-blindniveau."
        ),
        "reflectievraag": (
            "Bij welke wijn op je lijst verwacht je het sterkste secundaire profiel — en welk productiesignaal onderbouwt dat?"
        ),
    },
    14: {
        "theorie": (
            "Structuur bij mousserend is mondarchitectuur: zuur als ruggengraat, mousse als spanning, body als gewicht, "
            "dosage als afronding, lengte als kwaliteitsbewijs. Waarom niet alleen “zoet of droog”? Omdat een brut "
            "technisch droog kan aanvoelen als rond door mousse alleen.\n\n"
            "Zuur geeft richting en pairing-snijkracht; mousse geeft textuur en gehemelte-activiteit; body bepaalt "
            "of de wijn gastronomisch kan dragen; dosage tempert scherpte; lengte toont integratie. Technisch correct "
            "zonder balans voelt kort of plakkerig.\n\n"
            "Hoe evalueer je? Score elk element 1–5, zoek de zwakste schakel. Zwak zuur + hoge dosage = snel vermoeiend; "
            "sterk zuur + fijne mousse + lage dosage = gastronomische motor.\n\n"
            "Wanneer gebruik je structuuranalyse? Bij maaltijdwijnkeuze, retouranalyse (“te zuur”) en blindconclusies — "
            "structuur wint van merknaam."
        ),
        "samenvatting": (
            "- Structuur = zuur + mousse + body + dosage-effect + lengte\n"
            "- Mousse is textuur; dosage is afronding — niet verwarren\n"
            "- Lengte wijst op integratie en kwaliteit van basiswijn\n"
            "- Balans betekent geen dominante schakel\n"
            "- Structuurschema maakt retouren en pairing objectief"
        ),
        "food_pairing": fp(
            "Brut met hoge zuurlijn bij citroen-geglazuurd visgerecht.",
            "Zuur en mousse dragen het gerecht; body en lengte bepalen of de wijn overleeft zonder hard te worden.",
            "Demi-Sec bij hetzelfde gerecht zonder zoet element — balans kantelt.",
        ),
        "pro_insight": (
            "Bij klacht “te scherp”: check temperatuur en dosage vóór je een zoetere fles adviseert — "
            "te koude brut voelt vaak agressiever dan de wijn is."
        ),
        "reflectievraag": (
            "In je laatste proefnotitie: welk structuurelement droeg de wijn, en welke schakel beperkte de gastronomische inzet?"
        ),
    },
    15: {
        "theorie": (
            "Deze mini-toets integreert fundamente, productie en proeftechniek. Waarom blind twee glazen? Omdat "
            "mousse, autolyse en structuur pas echt scoren wanneer je methode moet afleiden zonder etiket — "
            "precies het moment waar Explorer overgaat in Specialist-denken.\n\n"
            "Je toetst: bubbelkwaliteit en persistentie; aromadominantie (primair vs secundair); balans van zuur, "
            "dosage en lengte; hypothese over traditioneel, tank, transfer of ancestrale productie. Documenteer "
            "hypothese vóór de onthulling — dat traint professionele calibratie.\n\n"
            "Hoe bereid je je voor? Vaste volgorde visueel → neus → mond; noteer één tegenargument bij je conclusie. "
            "Fouten zitten meestal in temperatuur, glas of te snelle methode-gok.\n\n"
            "Wanneer herhaal je deze toets? Maandelijks met twee willekeurige flessen uit je voorraad — "
            "zo bouw je een persoonlijke referentiebibliotheek op."
        ),
        "food_pairing": fp(
            "Geen pairing in deze toets — focus op blind protocol.",
            "Mini-toets meet analyse, niet gastronomie.",
            "N.v.t. voor deze les.",
        ),
        "pro_insight": (
            "Leg na elke blindronde je topfout vast in één zin (“te veel naar fruit, te weinig naar mousse”). "
            "Dat versnelt leren meer dan tien perfecte proeven zonder reflectie."
        ),
        "reflectievraag": (
            "Welke ene observatie — mousse, autolyse of structuur — had je methode-hypothese het sterkst moeten sturen?"
        ),
    },
    16: {
        "theorie": (
            "Champagne is niet alleen een merk maar een koel-klimaat systeem: hoge zuren behouden, alcohol gematigd, "
            "druk en autolyse als kwaliteitsmotor. Waarom subregio's matteren? Omdat druivenbalans per helling verschilt "
            "en blenders daarop sturen.\n\n"
            "Montagne de Reims levert vaak Pinot Noir-structuur; Côte des Blancs Chardonnay-finesse en krijtmineraliteit; "
            "Vallée de la Marne Meunier-ronding; Côte des Bar rijper Pinot met meer body. Krijt slaat water op en geeft "
            "spanning in de wijn — terroir als zuurbuffer.\n\n"
            "Hoe proef je terroir? Mineraliteit en zuurlijn versus rijp fruit; niet “welke dorp” maar welke bouwsteen "
            "domineert in de blend.\n\n"
            "Wanneer gebruik je regiokennis? Bij upsell naar Blanc de Blancs (Côte des Blancs-logica), bij "
            "gastronomische pairing en bij blind-Champagne versus warmere wereldstijlen."
        ),
        "samenvatting": (
            "- Koel klimaat = hoge zuren, essentieel voor mousserend\n"
            "- Vier subregio's leveren verschillende blend-bouwstenen\n"
            "- Krijt ondersteunt spanning en mineraliteit\n"
            "- Terroir lees je via zuur/mineraal versus rijp fruit\n"
            "- Regiokennis ondersteunt advies, geen elitaire opsomming"
        ),
        "food_pairing": fp(
            "Blanc de Blancs uit Côte des Blancs-logica bij oesters of zachte schaal.",
            "Krijtmineraliteit en strakke zuur versterken zout en umami zonder zwoele mousse.",
            "Zoete Demi-Sec bij oesters — klassieke mismatch op dosage.",
        ),
        "pro_insight": (
            "Verkoop Champagne niet als “regio 34.000 ha” maar als “koude-climate zuurmachine” — "
            "dat verbindt terroir aan smaak voor elke gast."
        ),
        "reflectievraag": (
            "Welke subregio-bouwsteen — Pinot-structuur, Chardonnay-finesse of Meunier-ronding — past het best bij je huidige foodpairing-kaart?"
        ),
    },
    17: {
        "theorie": (
            "Champagne is blend-architectuur met drie druiven. Chardonnay levert spanning, citrus en mineraliteit; "
            "Pinot Noir body, structuur en rood fruit; Meunier fruitigheid, toegankelijkheid en zachte afronding. "
            "Waarom bijna altijd blend? Omdat één druif zelden alle service-momenten dekt.\n\n"
            "Hoe proef je de blend? Chardonnay-dominant = strakker en gastronomischer; Pinot-dominant = voller en "
            "rijper op het middenpalet; Meunier-dominant = directer en feestelijker. Percentages op het etiket zijn "
            "zeldzaam — leer de signatuur van het huis.\n\n"
            "Wanneer kies je welke bouwsteen? Aperitief met finesse: meer Chardonnay; maaltijd met romige saus: "
            "meer Pinot; hoge rotatie borrel: Meunier-ronding kan converteren."
        ),
        "samenvatting": (
            "- Chardonnay = spanning; Pinot Noir = structuur; Meunier = toegankelijk fruit\n"
            "- Blends balanceren frisheid, body en huisstijl\n"
            "- Dominantie proef je via zuurlijn versus middenpalet\n"
            "- Druifkeuze is service-instrument, geen trivia\n"
            "- Huisstijl begrijpen wint van percentage-obsessie"
        ),
        "food_pairing": fp(
            "Pinot-dominante NV bij gevogelte met jus; Chardonnay-dominant bij sashimi.",
            "Structuur volgt druif: Pinot draagt umami en vet; Chardonnay snijdt en verfrist.",
            "Meunier-zware blend bij zeer delicate vis zonder saus — te rond, te weinig snijkracht.",
        ),
        "pro_insight": (
            "Vraag producenten niet “welke druiven” maar “wie leidt de blend vandaag voor gastronomie?” — "
            "dat geeft bruikbaarder verkooptaal."
        ),
        "reflectievraag": (
            "Welke druif mis je het vaakst in je eigen proefnotities bij Champagne — en hoe vervormt dat je advies?"
        ),
    },
    18: {
        "theorie": (
            "Blanc de Blancs (wit van wit) en Blanc de Noirs (wit van zwart) zijn stijlcontracten, geen marketinglabels. "
            "BdB — meestal Chardonnay — levert strakheid, mineraliteit en elegante mousse; ideaal voor finesse-pairing. "
            "BdN — Pinot en/of Meunier zonder kleur — levert body, rijper fruit en gastronomische breedte.\n\n"
            "Waarom belangrijk voor blind? BdB voelt lichter en verticaler; BdN voller en ronder op het middenpalet. "
            "Verwar kleur niet: BdN blijft wit wijn met rode druiven.\n\n"
            "Hoe kies je in service? BdB voor schaal, citrus en delicate vis; BdN voor kalf, kip met room, "
            "oudere kaas. Rijping versterkt BdB-noten; BdN blijft vaak toegankelijker jong.\n\n"
            "Wanneer upsellen? BdB voor mineraliteit-verhalen; BdN voor “Champagne die mee eet”."
        ),
        "samenvatting": (
            "- Blanc de Blancs = finesse, zuur, mineraliteit (meestal Chardonnay)\n"
            "- Blanc de Noirs = body, rijper fruit (Pinot/Meunier)\n"
            "- Stijlkeuze bepaalt gastronomisch venster\n"
            "- Blind: BdB strakker; BdN voller op het palet\n"
            "- Geen rosé — puur wit stijlspectrum binnen Champagne"
        ),
        "food_pairing": fp(
            "BdB bij oesters; BdN bij kalfszwezerik met champignon.",
            "BdB snijdt zout en mineraliteit; BdN draagt vet en umami met meer middenpalet.",
            "BdB bij zware braad met jus zonder finesse in de saus.",
        ),
        "pro_insight": (
            "Op de kaart: noem BdB en BdN naast elkaar met één gerecht-tip elk — zo verkoop je stijl, niet alleen Champagne."
        ),
        "reflectievraag": (
            "Welk blindsignaal — zuurlijn of middenpalet-gewicht — gebruik jij eerst om BdB van BdN te scheiden?"
        ),
    },
    19: {
        "theorie": (
            "NV versus Vintage is het verschil tussen huisstijl en oogstverhaal. NV blendt jaren voor consistentie — "
            "de motor van commerciële Champagne. Vintage declareert één topjaar, rijpt langer en toont terroir en "
            "tijd met meer diepte en bewaarpotentieel.\n\n"
            "Waarom prijsverschil? Selectie, lagere volume, langere kelder. Sensorisch: NV directer en toegankelijker; "
            "Vintage meer gelaagd, meer autolyse en lengte.\n\n"
            "Hoe adviseer je? NV voor aperitief en hoge rotatie; Vintage voor gastronomische hoofdgang, "
            "verjaardag en celrinvestering. Niet elke jaar wordt vintage — dat is kwaliteitsfilter.\n\n"
            "Wanneer wachten met openen? Jong vintage kan strakker zijn; geef flesrust of kies NV voor directe service."
        ),
        "samenvatting": (
            "- NV = consistente huisstijl, multi-vintage blend\n"
            "- Vintage = topjaar, meer rijping en diepte\n"
            "- Vintage heeft vaak meer bewaarpotentieel\n"
            "- NV wint op toegankelijkheid; Vintage op gastronomische lengte\n"
            "- Jaar op fles is kwaliteitsstatement, geen garantie voor smaakvoorkeur"
        ),
        "food_pairing": fp(
            "NV bij receptie; Vintage bij hoofdgang met gevogelte of zeevruchten in botersaus.",
            "NV verfrissend vóór tafel; Vintage combineert autolyse-diepte met rijkere gerechten.",
            "Jonge Vintage bij delicate sashimi — te veel rijpingstoon voor het gerecht.",
        ),
        "pro_insight": (
            "Leg in je voorraad vast: welke NV voor volume, welke Vintage voor topmomenten. "
            "Zonder die scheiding open je per ongeluk reserve op de verkeerde tafel."
        ),
        "reflectievraag": (
            "Voor welk gastmoment op je planning zou jij bewust NV kiezen boven Vintage — en welk risico neem je met Vintage als je dat niet doet?"
        ),
    },
    20: {
        "theorie": (
            "Prestige Cuvée is het maximale expressiepunt van een huis: beste percelen, strengste selectie, "
            "langste rijping, hoogste integratie van mousse en autolyse. Waarom bestaan ze? Omdat sommige "
            "oogsten en parcelles een niveau tonen dat NV niet hoeft te dragen.\n\n"
            "Sensorisch: extreme finesse, lange afdronk, diepe autolyse, vaak jaren celpotential. Niet “meer zoet” "
            "of “meer alcohol” — meer textuurcohesie en tijd.\n\n"
            "Hoe herken je blind? Fijne mousse + gelaagde autolyse + lengte die blijft na slikken. Prijs en hype "
            "zijn geen proefpunten.\n\n"
            "Wanneer serveren? Mijlpaal, collector, gastronomisch hoogtepunt — koeler dan te warm, witwijnglas, "
            "geen knal bij openen. Prestige vraagt rust in service."
        ),
        "samenvatting": (
            "- Topselectie, langste rijping, hoogste huisexpressie\n"
            "- Sensorisch: finesse, autolyse-diepte, extreme lengte\n"
            "- Groot bewaarpotentieel en verzamelwaarde\n"
            "- Blind: mousse + autolyse + lengte-cluster\n"
            "- Service vraagt temperatuur, glas en openentechniek op niveau"
        ),
        "food_pairing": fp(
            "Prestige Cuvée bij kreeft, turbot of sublieme gevogelte-gang.",
            "Textuur en lengte matchen premium ingrediënten; autolyse echo't met boter en umami zonder zoetheid.",
            "Zware BBQ-saus of agressief spice — die vernietigen finesse.",
        ),
        "pro_insight": (
            "Verkoop Prestige niet op naam maar op moment: “deze fles is gemaakt voor één topgang — welke is het bij u?”"
        ),
        "reflectievraag": (
            "Welke drie sensorische criteria — niet prijs of merk — zou jij hanteren om Prestige blind te scheiden van goede NV?"
        ),
    },
    21: {
        "theorie": (
            "Cava bewijst dat traditionele methode niet exclusief Champagne is. Penedès levert Macabeo, Xarel·lo en "
            "Parellada — eigen aromatisch palet, vaak rijper en ronder dan Noord-Franse blends. Waarom relevant? "
            "Sterke prijs-kwaliteit en fijne mousse zonder Champagne-budget.\n\n"
            "Guarda Superior en lange rijpingstermen tillen Cava naar gastronomisch niveau. Sensorisch: autolyse mogelijk, "
            "maar fruit vaak zachter en zuidelijker; zuur minder messcherp dan Champagne.\n\n"
            "Hoe blind onderscheiden? Minder krijt-mineraliteit, rijper fruit, iets rondere zuurlijn bij zelfde methode.\n\n"
            "Wanneer adviseren? Gastronomische lunch, bruiloft zonder prestige-tarief, pairing met Spaanse keuken."
        ),
        "samenvatting": (
            "- Spanje, Penedès, traditionele methode\n"
            "- Eigen druivenrassen, vaak rijper fruitprofiel\n"
            "- Guarda Superior = langere rijping, hogere kwaliteit\n"
            "- Blind: methode gelijk, terroir en druif verschillen\n"
            "- Commercieel: waarde+finesse zonder Champagne-label"
        ),
        "food_pairing": fp(
            "Guarda Superior Cava bij paella, gegrilde sardines of jamón.",
            "Autolyse en zachte mousse dragen umami en olijfolie; zuur houdt het geheel levend.",
            "Zeer strakke Brut Nature bij zoete romesco zonder compensatie.",
        ),
        "pro_insight": (
            "Zet Cava niet onder “alternatief” maar onder “traditioneel met Mediterrane fruitlijn” — "
            "dan vermijd je Champagne-vergelijkingsangst."
        ),
        "reflectievraag": (
            "Welk blindsignaal gebruik jij het eerst om Cava van Champagne te scheiden — fruitrijpheid, mineraliteit of mousse?"
        ),
    },
    22: {
        "theorie": (
            "Prosecco is de wereldwijde motor van toegankelijk mousserend: Glera, tankmethode, fruit voorop. "
            "Waarom geen Champagne-concurrent? Andere productielogica — volume, frisheid, directe verkoop. "
            "DOCG Conegliano-Valdobbiadene levert de meeste structuur binnen Prosecco.\n\n"
            "Sensorisch: peer, appel, witte bloemen; mousse directer; weinig autolyse. Superiore DOCG kan "
            "meer finesse tonen maar blijft fruitgedreven.\n\n"
            "Hoe positioneren? Aperitief, spritz, feest — niet gastronomische topgang. Dosage meestal brut; "
            "check etiket bij zoetere exportstijlen.\n\n"
            "Wanneer upsellen binnen Prosecco? Van DOC naar DOCG wanneer gast finesse wil zonder fles-Champagne-prijs."
        ),
        "samenvatting": (
            "- Glera + Charmat = fruit en toegankelijkheid\n"
            "- DOCG is kwaliteitsanker binnen Prosecco\n"
            "- Mousse directer; weinig brioche/toast\n"
            "- Service: aperitief, borrel, cocktails\n"
            "- Geen Champagne-light — eigen categorie"
        ),
        "food_pairing": fp(
            "DOCG Extra Brut bij cicchetti, lichte frituur of fruitige amuse.",
            "Fruitige mousse en zuur passen bij borrel-intensiteit zonder gastronomische zwaarte.",
            "Gastronomische hoofdgang met redux — Prosecco verliest structuur.",
        ),
        "pro_insight": (
            "Schenk Prosecco nooit in flute voor upsell-gesprek — fruit verdwijnt. "
            "Tulippe of witwijnglas verkoopt DOCG beter."
        ),
        "reflectievraag": (
            "Wanneer stuur jij bewust naar Prosecco in plaats van Cava — welk gastsignaal bepaalt die keuze?"
        ),
    },
    23: {
        "theorie": (
            "Crémant is Frankrijk buiten de Champagne-lijn — altijd traditionele methode, maximale regionale diversiteit. "
            "Alsace, Bourgogne, Loire, Jura, Limoux: elk eigen druivenpalet en stijl. Waarom interessant voor sommeliers? "
            "Kwaliteit vaak dicht bij Champagne tegen lagere drempel.\n\n"
            "Crémant d'Alsace: fruit en body; Loire: frisheid; Limoux: historische claim, vaak rijke mousse. "
            "Lees regio als smaakvoorspeller.\n\n"
            "Hoe blind? Traditionele autolyse-hints met regionaal fruitprofiel; minder krijt-Champagne-signatuur.\n\n"
            "Wanneer kaart? Wanneer je gastronomische flesgisting nodig hebt zonder prestige-tarief."
        ),
        "samenvatting": (
            "- Franse mousserend buiten AOC Champagne\n"
            "- Altijd traditionele methode; druiven per regio\n"
            "- Sterke prijs-kwaliteit en diversiteit\n"
            "- Regio bepaalt fruit- en bodyprofiel\n"
            "- Sommelier-categorie: finesse zonder Champagne-prijs"
        ),
        "food_pairing": fp(
            "Crémant de Loire bij geitenkaas en salade; Crémant d'Alsace bij terrine.",
            "Regionale zuur en autolyse matchen lokale gastronomie; mousse reinigt vet.",
            "Zware port-stijl dessert bij droge Crémant zonder suikercontrast.",
        ),
        "pro_insight": (
            "Bouw een Crémant-lijst per regio, niet per prijs — gasten kiezen sneller als ze smaakrichting snappen."
        ),
        "reflectievraag": (
            "Welke Crémant-regio zou jij koppelen aan je huidige lunchkaart — en welk druivenprofiel maakt dat logisch?"
        ),
    },
    24: {
        "theorie": (
            "Franciacorta positioneert Italië op traditioneel topniveau: strenge normen, lange rijping, "
            "Chardonnay/Pinot-dominantie. Satèn — lagere druk, zachtere mousse — is uniek Italiaans antwoord "
            "op gastronomische finesse.\n\n"
            "Sensorisch vaak rijker en romiger dan Champagne bij gelijke methode; autolyse duidelijk. "
            "Niet “kopie” maar parallel universum.\n\n"
            "Hoe onderscheiden van Champagne blind? Vaak rondere textuur, zuidelijker fruit, Satèn-signatuur.\n\n"
            "Wanneer adviseren? Gastronomische Italiaanse keuken, premium vegetarisch, kaasgang."
        ),
        "samenvatting": (
            "- Lombardije, traditionele methode, hoge normen\n"
            "- Chardonnay/Pinot-centraal; Satèn = zachte mousse\n"
            "- Vaak rijk, romig, autolyse-forward\n"
            "- Internationaal topalternatief voor Champagne\n"
            "- Satèn voor zachte gastronomische pairing"
        ),
        "food_pairing": fp(
            "Satèn bij risotto met Parmezaan; klassieke Franciacorta bij kalf of zeebaars.",
            "Romige mousse en autolyse dragen room en umami; zuur houdt balans.",
            "Zeer pittige curry zonder zoet element — Satèn verliest textuur.",
        ),
        "pro_insight": (
            "Noem Satèn expliciet op de kaart — het is het Italiaanse antwoord op “Champagne die niet bijt”."
        ),
        "reflectievraag": (
            "Welk Franciacorta-signaal — Satèn-textuur of autolyse-diepte — zou jij gebruiken om een gast van Prosecco naar Italiaans flesgisting te leiden?"
        ),
    },
    25: {
        "theorie": (
            "Sekt en English Sparkling tonen dat mousserend geen Frans monopolie is. Duits Sekt varieert van "
            "basis tot Deutscher Sekt b.A. en winzersekt traditionell — laatste categorie serieus traditioneel. "
            "Riesling en Spätburgunder geven eigen zuur- en fruitprofielen.\n\n"
            "English Sparkling profiteert van koel klimaat en krijtachtige bodems in Sussex/Hampshire: strak, "
            "mineraal, fijne mousse — steeds vaker blind verward met Champagne. Champagnehuizen investeren "
            "in Engeland — klimaat als kwaliteitsdriver.\n\n"
            "Hoe positioneren? Sekt top bij frisheid en brunch; English bij gastronomische finesse en "
            "Champagne-alternatief op Britse pairing.\n\n"
            "Blind: English vaak mineraliger en strakker; basis-Sekt fruitiger en eenvoudiger."
        ),
        "samenvatting": (
            "- Sekt: breed spectrum; top = traditioneel en terroir-gedreven\n"
            "- English Sparkling: snelle kwaliteitsgroei, koel klimaat\n"
            "- Beide tonen: methode + klimaat > alleen regio-reputatie\n"
            "- Blind: mineraliteit en zuur helpen English herkennen\n"
            "- Wereldstijlen vullen Champagne in prijs en profiel in"
        ),
        "food_pairing": fp(
            "English Sparkling bij oesters of fish & chips (verfijnde versie); Duitse Sekt b.A. bij brunch.",
            "Engelse zuren snijden schaal en vet; Duitse fruitzuur past bij late ochtend pairing.",
            "Basis-Sekt bij gastronomische hoofdgang — structuur ontbreekt.",
        ),
        "pro_insight": (
            "Voeg één English Sparkling toe als “blind verrassing” op proeverij — het vernietigt Champagne-arrogance in één ronde."
        ),
        "reflectievraag": (
            "Tussen Sekt en English Sparkling: welke zou jij blind het lastigst vinden naast Champagne — en welk signaal gebruik je om te kiezen?"
        ),
    },
}
