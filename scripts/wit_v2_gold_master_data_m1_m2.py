"""White Wine Track V2 Gold Master — lessons 1-10 (Modules 1-2: Fundament & Productie).

Premium specialist content, sommelier-diepgang. Bouwt niet het wijnfundament
opnieuw op (fermentatie, wat is zuur, etc. — dat zit al in de algemene Wine
Foundation Track) maar focust telkens op de witte-wijn-identiteit: schilcontact,
zuur als ruggengraat, direct press, koude vergisting, RVS versus hout,
malolactische gisting en rijping.
"""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    1: {
        "theorie": (
            "Witte wijn definieer je niet via de kleur van de druif, maar via het contactmoment "
            "tussen sap en schil. Het overgrote deel van druivenrassen — wit én blauw — heeft "
            "kleurloze pulp; de kleurstoffen zitten vrijwel uitsluitend in de schil. Zodra je die "
            "schil snel van het sap scheidt, houd je een kleurloos tot lichtgeel most over, "
            "ongeacht de druif waarmee je begint. Dat is precies waarom Champagne en andere "
            "blanc de noirs-stijlen witte wijn maken van blauwe druiven zoals Pinot Noir en "
            "Meunier: de techniek, niet de druif, bepaalt het eindresultaat.\n\n"
            "Dat korte schilcontact heeft een structureel gevolg dat verder reikt dan kleur "
            "alleen: zonder extractie van tannine uit schil en pit mist witte wijn de "
            "tanninestructuur die rode wijn draagt. De architectuur verschuift daardoor volledig "
            "naar de zuurruggengraat — het samenspel van wijnsteenzuur, appelzuur en citroenzuur "
            "bepaalt spanning, lengte en bewaarpotentieel op een manier die bij rode wijn wordt "
            "gedeeld met tannine. Dat is de kern van 'wit denken': je beoordeelt balans via "
            "zuur-alcohol-extract, niet via zuur-tannine-alcohol.\n\n"
            "Hoe je dat gebruikt in de praktijk: bij een onbekend glas witte wijn zoek je eerst "
            "naar de zuurspanning, niet naar body in isolatie — body zonder voldoende zuur voelt "
            "plat aan, terwijl datzelfde gewicht mét een scherpe zuurlijn juist verfijnd "
            "overkomt. Fenolen — bittere, structurerende verbindingen die via licht schil- of "
            "pitcontact toch in het sap terechtkomen — verklaren waarom sommige witte wijnen een "
            "lichte grip hebben ondanks de afwezigheid van klassieke tannine.\n\n"
            "Je valt op dit onderscheid terug telkens wanneer een gast vraagt waarom een witte "
            "wijn 'structuur' kan hebben zonder tannine: het antwoord ligt in zuur, extract en "
            "soms een spoor fenolen — nooit in tannine zoals bij rood."
        ),
        "samenvatting": (
            "- Kleur komt uit de schil, niet uit het sap — vrijwel alle druivenpulp is kleurloos\n"
            "- Kort schilcontact maakt witte wijn tot witte wijn, niet de druif zelf\n"
            "- Blanc de noirs bewijst dat blauwe druiven witte wijn kunnen opleveren\n"
            "- Zonder tannine-extractie verschuift de structuur volledig naar de zuurruggengraat\n"
            "- Lichte fenolen kunnen toch grip geven, los van klassieke tannine"
        ),
        "pro_insight": (
            "Wanneer een gast zegt dat witte wijn 'geen structuur' heeft omdat er geen tannine "
            "in zit, leg uit dat structuur bij wit via zuur en extract loopt. Dat verandert hoe "
            "ze naar body en lengte proeven, en voorkomt dat je automatisch naar een zoetere "
            "stijl grijpt om 'body' te compenseren terwijl een steviger zuurprofiel het echte "
            "antwoord is."
        ),
        "reflectievraag": (
            "Kun jij bij een onbekende witte wijn aangeven of de structuur voornamelijk van "
            "zuur, extract of een spoor fenolen komt — en welk kenmerk proef je daarvoor het "
            "eerst?"
        ),
        "kernbegrippen": ["schilcontact", "blanc de noirs", "zuurruggengraat", "druivenpulp", "fenolen"],
    },
    2: {
        "theorie": (
            "Witte wijn ontstaat via een keten waarin timing en zuurstofbeheer strenger zijn dan "
            "bij vrijwel elke andere wijnstijl — elke stap is erop gericht primair fruit en zuur "
            "te bewaren vóór iets daarvan kan wegvallen. Veel producenten kiezen bewust voor een "
            "nachtoogst of vroege ochtendoogst: bij lagere temperaturen blijft het zuur beter "
            "behouden en start oxidatie van het sap trager zodra de druiven worden geplukt en "
            "vervoerd.\n\n"
            "Na direct persen volgt débourbage: het most krijgt enkele uren tot een dag rust, "
            "vaak gekoeld, zodat grove deeltjes — schilresten, stof, plantaardig materiaal — "
            "bezinken vóór de gisting begint. Een helder gestart most geeft een zuiverdere "
            "aromatische basis dan most dat troebel de tank ingaat, omdat grove deeltjes tijdens "
            "gisting bittere en groene tonen kunnen afgeven.\n\n"
            "Na de gisting valt de beslissing over élevage: blijft de wijn sur lie — op de fijne "
            "gistlees — liggen voor extra textuur en complexiteit, of wordt er vroeg van de lees "
            "gehaald voor een strakker, puurder profiel? Die keuze werkt samen met het vat: RVS "
            "voor precisie, hout voor structuur.\n\n"
            "Je gebruikt deze keten als diagnosemiddel: proef je opvallend puur fruit en een "
            "strakke zuurlijn, dan vermoed je een korte débourbage en weinig sur-lie-contact; "
            "proef je romigheid en een subtiele broodachtige toon, dan wijst dat op langere "
            "lees-opvoeding vóór de botteling."
        ),
        "samenvatting": (
            "- Nachtoogst of vroege ochtendoogst behoudt zuur en vertraagt oxidatie\n"
            "- Débourbage klaart het most vóór de gisting begint, voor een zuiverdere basis\n"
            "- Sur lie geeft textuur en complexiteit, vroeg raken geeft een strakker profiel\n"
            "- De élevage-keuze na gisting bepaalt samen met het vat het uiteindelijke profiel\n"
            "- Elke stap in de keten is gericht op het bewaren van fruit en zuur, niet op extractie"
        ),
        "pro_insight": (
            "Leg aan gasten uit dat een romige, broodachtige toon in een RVS-witte wijn vaak van "
            "sur-lie-contact komt en niet van hout — dat voorkomt de aanname dat 'romig' altijd "
            "gelijkstaat aan houtrijping, en helpt je gerichter door te vragen naar wat de gast "
            "precies zoekt."
        ),
        "reflectievraag": (
            "Welke stap in de productieketen — oogsttiming, débourbage of sur-lie-keuze — zou "
            "jij als eerste vraag stellen aan een producent om snel het profiel van een witte "
            "wijn in te schatten?"
        ),
        "kernbegrippen": ["nachtoogst", "débourbage", "koude vergisting", "sur lie", "élevage"],
    },
    3: {
        "theorie": (
            "Witte wijn is uniek omdat één enkel element — zuur — een extreem breed spectrum aan "
            "stijlen bij elkaar houdt: van bloedstrak en mineraal tot romig en zelfs botrytis-zoet. "
            "Bij rode wijn delen zuur en tannine de structurele rol; bij wit draagt zuur die "
            "rol vrijwel alleen, wat verklaart waarom zuurspanning het eerste kenmerk is waarop "
            "professionals een witte wijn beoordelen, nog vóór aroma of lengte.\n\n"
            "Diezelfde zuurspanning maakt witte wijn gastronomisch de meest inzetbare categorie: "
            "hoge zuren snijden door vet, romige sauzen en zilte smaken op een manier die tannine "
            "niet kan. Daarnaast laat de afwezigheid van tannine het terroir directer doorklinken "
            "— zonder tanninesluier proef je bodem, klimaat en druif vaak scherper, wat "
            "terroirtransparantie oplevert die bij zware, tanninerijke rode wijn minder "
            "vanzelfsprekend is.\n\n"
            "Aan het zoete uiteinde van het spectrum zorgt botrytis — edelrot — voor "
            "geconcentreerde, hooggezoete witte wijnen zoals Sauternes en Tokaji, waarbij "
            "diezelfde hoge zuurgraad voorkomt dat de wijn plakkerig zoet aanvoelt. Zuur is dus "
            "niet alleen het kenmerk van droge, frisse stijlen — het is de rode draad door het "
            "hele witte spectrum.\n\n"
            "Je gebruikt dit inzicht wanneer je moet uitleggen waarom witte wijn zo breed "
            "inzetbaar is aan tafel: niet omdat er 'iets voor iedereen' bij zit, maar omdat één "
            "en hetzelfde structuurprincipe — zuur — elke stijl in dat spectrum draagbaar houdt."
        ),
        "samenvatting": (
            "- Zuur draagt bij witte wijn de structurele rol die bij rood wordt gedeeld met tannine\n"
            "- Zuurspanning is het eerste kenmerk waarop professionals witte wijn beoordelen\n"
            "- Hoge zuren maken witte wijn gastronomisch zeer breed inzetbaar\n"
            "- Afwezigheid van tannine geeft vaak meer terroirtransparantie\n"
            "- Botrytis-zoete stijlen blijven dankzij hoge zuurgraad in balans, niet plakkerig"
        ),
        "pro_insight": (
            "Verkoop witte wijn bij vette of romige gerechten op basis van zuurspanning, niet op "
            "basis van 'past bij vis' — die vuistregel dekt de gastronomische breedte van wit "
            "niet en laat kansen liggen bij vlees- of sauzen-gedreven gerechten."
        ),
        "reflectievraag": (
            "Bij welk gerecht dat jij normaal met rode wijn serveert, zou een witte wijn met "
            "hoge zuurspanning eigenlijk een sterkere match kunnen zijn?"
        ),
        "kernbegrippen": [
            "zuurspanning",
            "terroirtransparantie",
            "botrytis",
            "gastronomische inzetbaarheid",
            "mineraliteit",
        ],
    },
    4: {
        "theorie": (
            "De geschiedenis van witte wijn is korter en technischer dan die van wijn in het "
            "algemeen: de heldere, frisse, direct geperste witte wijn die we vandaag als "
            "standaard zien, is grotendeels een uitvinding van de twintigste eeuw. Antieke "
            "wijnbereiding — inclusief de Georgische qvevri-traditie — liet wit druivensap vaak "
            "wél lang met de schillen in contact, wat resulteerde in oranjegekleurde, "
            "tanninerijke wijnen die dichter bij het huidige 'oranje wijn' liggen dan bij een "
            "moderne, strakke Sauvignon Blanc.\n\n"
            "De omslag kwam met temperatuurbeheersing. Vóór koeltechniek beschikbaar was, "
            "vergiste wit most vaak te warm, wat aroma verloor en oxidatieve, zwaardere stijlen "
            "opleverde. De koelrevolutie — eerst in Duitsland langs de Mosel en Rijn, later "
            "wereldwijd verspreid door vliegende wijnmakers vanaf de jaren zeventig en tachtig — "
            "maakte gecontroleerde koude vergisting overal toegankelijk en veranderde witte wijn "
            "definitief in een precisieproduct.\n\n"
            "Tegelijk bouwden specifieke terroirs hun eigen witte-wijnidentiteit op: het "
            "Kimmeridgien-kalksteen van Chablis leverde eeuwenlang de mineraliteit waarmee die "
            "regio nog steeds wordt geassocieerd, terwijl Duitsland via het Prädikatsysteem al "
            "vroeg rijpheidsniveaus van Riesling classificeerde — een systeem dat draait om "
            "precies de suiker-zuurbalans die witte wijn zo veelzijdig maakt.\n\n"
            "Je gebruikt deze geschiedenis om 'traditioneel' en 'modern' bij witte wijn scherp "
            "uit elkaar te houden: een eeuwenoude regio zoals Chablis bouwt op oud terroir, maar "
            "de strakke, frisse stijl die je vandaag proeft, is technisch gezien pas enkele "
            "decennia oud."
        ),
        "samenvatting": (
            "- Antieke wijnbereiding gaf wit sap vaak lang schilcontact — dichter bij oranje wijn\n"
            "- De koelrevolutie maakte gecontroleerde koude vergisting wereldwijd toegankelijk\n"
            "- Vliegende wijnmakers verspreidden die techniek vanaf de jaren zeventig en tachtig\n"
            "- Kimmeridgien-kalksteen bouwde de mineraliteitsreputatie van Chablis op\n"
            "- Het Prädikatsysteem classificeert Riesling op basis van de suiker-zuurbalans"
        ),
        "pro_insight": (
            "Wanneer een gast 'traditionele witte wijn' vraagt, vraag door wat ze bedoelen: een "
            "oude regio zoals Chablis, of een oxidatieve, oranje stijl die dichter bij de "
            "werkelijk oude techniek ligt. Die twee liggen verder uit elkaar dan het woord "
            "'traditioneel' doet vermoeden."
        ),
        "reflectievraag": (
            "Zou jij een moderne, koel-vergiste witte wijn nog 'traditioneel' noemen als de "
            "techniek zelf pas enkele decennia oud is — en waarom wel of niet?"
        ),
        "kernbegrippen": [
            "oranjewijntraditie",
            "koelrevolutie",
            "vliegende wijnmakers",
            "Prädikatsysteem",
            "Kimmeridgien",
        ],
    },
    5: {
        "theorie": (
            "De vijf hoofdgroepen binnen witte wijn — fris & strak, rijk & romig, aromatisch, "
            "mineraal & strak en zoet — zijn geen smaakvoorkeuren maar het resultaat van "
            "meetbare technische keuzes. Het onderscheid begint bij het druivenras zelf: "
            "aromatische druiven zoals Gewürztraminer, Muscat en in mindere mate Riesling zijn "
            "rijk aan terpenen, geurstoffen die al vóór de gisting in de druif aanwezig zijn en "
            "een direct herkenbare, bloemige geur geven. Sauvignon Blanc en verwante rassen "
            "leunen juist op thiolen, zwavelhoudende aromastoffen die tijdens de gisting vrijkomen "
            "en zorgen voor de kenmerkende citrus-, grapefruit- en soms groene, kruidige tonen.\n\n"
            "De rijke, romige categorie ontstaat zelden puur uit de druif: dat profiel wordt "
            "meestal opgebouwd via houtcontact, sur lie en malolactische gisting, technieken die "
            "in latere lessen apart worden behandeld. De mineraal & strakke categorie hangt sterk "
            "samen met bodemtype en een bewust beperkte productiekeuze — weinig hout, weinig "
            "malolactisch, gericht op puurheid.\n\n"
            "De zoete categorie tot slot ontstaat via drie technieken die niet uitwisselbaar zijn: "
            "edelrot concentreert suiker en geeft een kenmerkende honing- en gedroogd-fruittoon "
            "(Sauternes, Tokaji), passerillage laat druiven drogen aan de plant of na de oogst "
            "voor concentratie zonder schimmel, en een late oogst zonder edelrot geeft een "
            "puurdere, fruitigere zoete stijl. Het restsuikerspectrum dat hieruit ontstaat, loopt "
            "van nauwelijks merkbaar tot extreem geconcentreerd.\n\n"
            "Je gebruikt deze technische lens om categorieën te herkennen zonder het etiket te "
            "hoeven lezen: ruik je sterke bloemige terpenen, denk aan Muscat of Gewürztraminer; "
            "ruik je citrus en een groene, kruidige rand, denk aan thiolen en dus vaak Sauvignon "
            "Blanc-achtige stijlen."
        ),
        "samenvatting": (
            "- Terpenen geven de directe, bloemige geur van aromatische druiven als Muscat\n"
            "- Thiolen ontstaan tijdens gisting en geven de citrus- en kruidentonen van Sauvignon Blanc\n"
            "- De rijke, romige categorie wordt meestal opgebouwd via hout, lees en malolactisch\n"
            "- Edelrot en passerillage zijn twee losstaande technieken achter zoete witte wijn\n"
            "- Het restsuikerspectrum loopt van nauwelijks merkbaar tot extreem geconcentreerd"
        ),
        "pro_insight": (
            "Wil je een gast snel richting een categorie sturen zonder jargon: vraag naar bloemig "
            "versus citrus/kruidig in plaats van naar 'fris of rijk' — dat onderscheid wijst "
            "sneller naar terpeen- versus thiol-gedreven druiven en dus naar de juiste stijl."
        ),
        "reflectievraag": (
            "Kun jij bij drie witte wijnen die je kent aangeven of het aromaprofiel vooral van "
            "terpenen, van thiolen of van élevage-technieken komt?"
        ),
        "kernbegrippen": ["thiolen", "terpenen", "edelrot", "passerillage", "restsuikerspectrum"],
    },
    6: {
        "theorie": (
            "Direct press is geen simpele handeling maar een precisiestap waarin elke minuut en "
            "elke druk-instelling het eindresultaat beïnvloedt. Moderne pneumatische persen "
            "werken met een opblaasbare membraan die de druiven zacht tegen de wand van de "
            "perscilinder duwt, in herhaalde, lage-drukcycli. Dat voorkomt het openbreken van "
            "pitten en het verscheuren van schillen, twee bronnen van bittere fenolen die je bij "
            "een ruwere pers wél zou extraheren.\n\n"
            "Tijdens het persen ontstaan verschillende sapfracties. Het vrijloopsap — sap dat "
            "vrijkomt vóór er überhaupt druk wordt gezet, puur door het gewicht van de druiven "
            "zelf — is het meest verfijnd en het minst fenolisch. Naarmate de druk oploopt, "
            "leveren de daaropvolgende persfracties steeds meer volume maar ook meer fenolen en "
            "bitterheid op. Veel producenten scheiden deze fracties bewust en gebruiken alleen "
            "de eerste, mildste fracties voor hun topcuvées.\n\n"
            "Omdat sap zonder schilbescherming razendsnel oxideert, wordt het hele proces vaak "
            "onder inertisering uitgevoerd: stikstof of CO₂ verdringt zuurstof in pers, leidingen "
            "en tank, zodat het kwetsbare, kleurloze most zijn frisheid behoudt tot aan de "
            "gisting.\n\n"
            "Je gebruikt deze kennis om kwaliteit op etiket of prijs te duiden: cuvées die "
            "expliciet 'vrijloop' of 'free-run juice' vermelden, beloven doorgaans meer "
            "verfijning en minder bitterheid dan wijnen gemaakt van de volledige persing zonder "
            "fractiescheiding."
        ),
        "samenvatting": (
            "- Pneumatische persen werken met lage-drukcycli om pitten en schillen te sparen\n"
            "- Vrijloopsap is het meest verfijnde en minst fenolische deel van de persing\n"
            "- Latere persfracties geven meer volume, maar ook meer fenolen en bitterheid\n"
            "- Inertisering met stikstof of CO₂ beschermt het kwetsbare most tegen oxidatie\n"
            "- Fractiescheiding bepaalt mede of most richting topcuvée of tweede lijn gaat"
        ),
        "pro_insight": (
            "Bij een prijsverschil tussen twee vergelijkbare witte wijnen van dezelfde producent "
            "kun je vaak wijzen naar persfractie: een cuvée op basis van vrijloopsap rechtvaardigt "
            "een hogere prijs door minder fenolen en meer verfijning, niet door marketing alleen."
        ),
        "reflectievraag": (
            "Zou jij bij een blinde proeverij het verschil durven benoemen tussen een wijn op "
            "basis van vrijloopsap en een wijn uit een latere, fenolrijkere persfractie?"
        ),
        "kernbegrippen": ["vrijloopsap", "persfracties", "pneumatische pers", "inertisering", "fenolextractie"],
    },
    7: {
        "theorie": (
            "Bij witte wijn wordt gisting veel strakker gestuurd dan bij rode wijn, met als doel "
            "niet extractie maar aromabehoud. Waar rode wijn vaak boven de twintig graden "
            "vergist, blijft witte wijn doorgaans tussen twaalf en achttien graden — soms zelfs "
            "kouder bij extreem aromatische cuvées. Die lage temperatuur vertraagt de gisting "
            "aanzienlijk, waardoor het proces weken in plaats van dagen kan duren.\n\n"
            "Die vertraging is precies waar de winst zit: bij lage temperatuur produceren gisten "
            "meer esters, vluchtige aromastoffen die fruitige, bloemige tonen geven die bij "
            "warmere gisting grotendeels zouden verdampen. Voor rassen zoals Sauvignon Blanc "
            "selecteren wijnmakers bovendien specifieke thiolvrijzettende gisten, die de "
            "aromastoffen die al gebonden in het most aanwezig zijn, tijdens de gisting actief "
            "vrijmaken.\n\n"
            "Die precisie brengt wel risico's mee. Koude, langzame gisting kan vastlopen — een "
            "vastzittende gisting waarbij de gist voortijdig stopt vóór alle suiker is omgezet — "
            "vaak door onvoldoende stikstofbeheer. Gisten hebben voldoende assimileerbare "
            "stikstof (YAN) nodig om door te vergisten; te weinig stikstof bij lage temperatuur "
            "verhoogt bovendien het reductierisico, waarbij zwavelverbindingen ontstaan die naar "
            "lucifer of gekookte kool kunnen ruiken.\n\n"
            "Je gebruikt dit om onbedoelde reductie te onderscheiden van een wijnfout: een lichte, "
            "vluchtige zwavelgeur bij het openen van een fles verdwijnt vaak na beluchting en "
            "wijst eerder op een krappe, koude gisting dan op een structureel probleem met de "
            "wijn."
        ),
        "samenvatting": (
            "- Witte wijn vergist doorgaans tussen twaalf en achttien graden, veel kouder dan rood\n"
            "- Lage temperatuur geeft meer estervorming en dus meer fruitige, bloemige aroma's\n"
            "- Thiolvrijzettende gisten maken gebonden aromastoffen actief vrij tijdens gisting\n"
            "- Onvoldoende stikstofbeheer (YAN) kan leiden tot een vastzittende gisting\n"
            "- Te weinig stikstof bij lage temperatuur verhoogt het reductierisico"
        ),
        "pro_insight": (
            "Ruikt een gast bij het inschenken een vluchtige, zwavelachtige geur die na even "
            "zwenken verdwijnt, leg dan uit dat dit reductie is uit een koude, precieze gisting — "
            "geen kurkfout. Dat voorkomt onterecht terugsturen van een technisch prima fles."
        ),
        "reflectievraag": (
            "Zou jij het verschil durven benoemen tussen reductie die verdwijnt na beluchting en "
            "een structurele wijnfout die blijft hangen — en welke stap zet je eerst om dat te "
            "checken?"
        ),
        "kernbegrippen": ["thiolvrijzetting", "vastzittende gisting", "stikstofbeheer", "estervorming", "reductierisico"],
    },
    8: {
        "theorie": (
            "RVS en hout zijn geen simpele smaaktoevoeging-versus-geen-smaaktoevoeging keuze: "
            "beide vaten beïnvloeden de wijn via een ander fysiek mechanisme. RVS is volledig "
            "inert en luchtdicht — er vindt geen zuurstofuitwisseling plaats, waardoor primair "
            "fruit en de scherpe zuurlijn ongewijzigd bewaard blijven. Hout daarentegen laat via "
            "zijn poriën langzaam micro-oxygenatie toe: minieme hoeveelheden zuurstof dringen "
            "geleidelijk door het hout, wat textuur verrondt en de wijn laat evolueren zonder "
            "haar bloot te stellen aan de plotse oxidatie die een open vat zou geven.\n\n"
            "Vatformaat verandert die dynamiek fundamenteel: een kleine barrique van "
            "tweehonderdvijfentwintig liter heeft een hoge oppervlakte-volumeverhouding, wat veel "
            "directe houtsmaak en relatief snelle micro-oxygenatie geeft. Een foudre — een groot "
            "houten vat van soms duizenden liters — heeft juist een lage oppervlakte-volumeverhouding, "
            "waardoor de wijn wel structuur en een subtiele textuurverandering krijgt, maar "
            "nauwelijks directe houtsmaak.\n\n"
            "Binnen beide vatformaten wordt vaak bâtonnage toegepast: het periodiek opnieuw "
            "opwerven van de fijne gistlees door de wijn te roeren. Dat geeft extra romigheid en "
            "textuur, versterkt door de zuurstof die al via het hout binnenkomt. Wie zuurstof "
            "wil zonder houtsmaak, kan kiezen voor een betonei — een eivormig betonnen vat dat "
            "micro-oxygenatie en interne convectie biedt zonder enige aromatische bijdrage van "
            "het materiaal zelf.\n\n"
            "Je gebruikt dit onderscheid om een wijn te lezen zonder het etiket: proef je subtiele "
            "romigheid en structuur zonder duidelijke vanille of toast, dan wijst dat eerder op "
            "foudre, betonei of oud, neutraal hout dan op een nieuwe barrique."
        ),
        "samenvatting": (
            "- RVS is volledig inert: geen zuurstofuitwisseling, primair fruit blijft puur bewaard\n"
            "- Hout laat via micro-oxygenatie geleidelijk zuurstof door, wat textuur verrondt\n"
            "- Vatformaat bepaalt de verhouding tussen directe houtsmaak en micro-oxygenatie\n"
            "- Bâtonnage roert de gistlees op voor extra romigheid en textuur\n"
            "- Een betonei geeft micro-oxygenatie zonder enige aromatische bijdrage van het vat"
        ),
        "pro_insight": (
            "Verwar bij gasten 'zacht en rond' niet automatisch met 'houtgerijpt' — vraag door of "
            "ze vanille of toast proeven vóór je hout aanwijst; vaak komt die rondheid van "
            "bâtonnage, foudre of een betonei zonder enige directe houtsmaak."
        ),
        "reflectievraag": (
            "Zou jij bij een romige witte wijn zonder duidelijke vanille durven inschatten of dat "
            "van foudre, een betonei of bâtonnage komt in plaats van een nieuwe barrique?"
        ),
        "kernbegrippen": ["micro-oxygenatie", "foudre", "bâtonnage", "betonei", "vatformaat"],
    },
    9: {
        "theorie": (
            "Malolactische gisting is geen tweede alcoholische gisting maar een bacteriële "
            "omzetting: de bacterie Oenococcus oeni zet scherp appelzuur om in zachter melkzuur "
            "en koolzuur. Chemisch daalt daarmee de totale zuurgraad slechts licht, maar "
            "sensorisch voelt de wijn veel ronder aan — melkzuur wordt door de tong als aanzienlijk "
            "zachter ervaren dan appelzuur, ook al is het effect op de pH bescheiden.\n\n"
            "Een bijproduct van deze omzetting is diacetyl, de verbinding die verantwoordelijk is "
            "voor de klassieke boter- en roomtoon in veel Chardonnay. Hoeveel diacetyl "
            "waarneembaar is, hangt af van de mate waarin MLF wordt toegelaten: bij volledige "
            "MLF domineert die boterigheid vaak, terwijl partiële MLF — waarbij slechts een deel "
            "van de partij de omzetting ondergaat en wordt teruggeblend met niet-MLF-wijn — een "
            "subtielere, meer beheerste romigheid geeft.\n\n"
            "Bij aromatische, zuurgedreven rassen zoals Riesling, Albariño of Sauvignon Blanc "
            "wordt MLF vaak juist bewust geblokkeerd: de winemaker gebruikt zwaveldioxide, koeling "
            "of filtratie om de bacterie te remmen, zodat de scherpe, frisse appelzuurstructuur "
            "intact blijft. Die keuze is net zo bewust als het toelaten van MLF bij Chardonnay — "
            "geen van beide is een standaard, het is telkens een stijlbeslissing.\n\n"
            "Je gebruikt dit inzicht om boterige tonen correct te duiden: proef je duidelijke "
            "diacetyl, dan weet je dat MLF volledig is doorgevoerd; proef je romigheid zonder "
            "uitgesproken boter, dan is partiële MLF of alleen sur-lie-contact waarschijnlijker."
        ),
        "samenvatting": (
            "- Oenococcus oeni zet scherp appelzuur om in zachter melkzuur en koolzuur\n"
            "- Het effect op de pH is bescheiden, maar het sensorische effect op rondheid is groot\n"
            "- Diacetyl is de verbinding achter de klassieke boter- en roomtoon van MLF\n"
            "- Partiële MLF geeft een subtielere romigheid dan volledige MLF\n"
            "- Bij zuurgedreven rassen zoals Riesling wordt MLF vaak bewust geblokkeerd"
        ),
        "pro_insight": (
            "Als een gast 'geen boterige Chardonnay' wil, vraag dan niet alleen naar de druif maar "
            "specifiek naar MLF-beleid — een RVS-Chardonnay zonder MLF kan verrassend strak zijn, "
            "terwijl een houtgerijpte met volledige MLF juist de stijl is die de gast wil mijden."
        ),
        "reflectievraag": (
            "Zou jij bij een romige witte wijn durven inschatten of dat van volledige MLF, "
            "partiële MLF of alleen sur-lie-contact komt — en welk kenmerk gebruik je daarvoor?"
        ),
        "kernbegrippen": ["Oenococcus oeni", "diacetyl", "pH-verhoging", "partiële MLF", "MLF-blokkade"],
    },
    10: {
        "theorie": (
            "Niet elke witte wijn is gemaakt om jong te worden gedronken, en het onderscheid "
            "tussen rijpingsroutes bepaalt sterk wélke aroma's een oudere fles ontwikkelt. "
            "Reductieve flesrijping — onder schroefdop of in een goed afgesloten fles zonder "
            "verdere zuurstoftoevoer — laat de wijn langzaam evolueren met minimale "
            "zuurstofblootstelling, wat primaire en subtiele tertiaire aroma's naast elkaar kan "
            "bewaren. Oxidatieve vatrijping daarentegen, zoals bij lang op hout gelagerde "
            "Semillon of Chenin Blanc, versnelt de ontwikkeling van notige, honingachtige tonen "
            "al vóór de botteling.\n\n"
            "Bij Riesling ontstaat met rijping een heel specifieke verbinding: TDN, die de "
            "kenmerkende petroltoon geeft die veel liefhebbers juist als kwaliteitskenmerk zien "
            "bij oudere, rijpe Riesling. Deze verbinding ontwikkelt zich sneller bij meer "
            "zonlichtblootstelling in de wijngaard en bij warmere bewaarcondities, wat verklaart "
            "waarom sommige jonge Riesling al vroeg een lichte petroltoon kan tonen.\n\n"
            "Structureel bepaalt de zuur-suikerbalans hoeveel bewaarpotentieel een witte wijn "
            "heeft: hoge zuren dragen droge stijlen door de jaren heen, terwijl bij zoete "
            "stijlen zoals Sauternes of Tokaji de combinatie van hoge zuren én hoge restsuiker "
            "een decennialange rijping mogelijk maakt. Sluitingskeuze speelt hierin ook mee: "
            "schroefdop favoriseert een reductief, fruitgedreven rijpingsverloop, terwijl kurk "
            "door zijn beperkte zuurstofdoorlaat een trager oxidatief component toevoegt.\n\n"
            "Je gebruikt deze kennis om bewaaradvies te onderbouwen: vraag niet alleen naar "
            "leeftijd van een fles, maar naar zuur-suikerbalans en sluiting — die twee factoren "
            "voorspellen samen veel beter of een witte wijn nog jaren verder kan ontwikkelen."
        ),
        "samenvatting": (
            "- Reductieve flesrijping bewaart primaire aroma's, oxidatieve vatrijping versnelt evolutie\n"
            "- TDN geeft de kenmerkende petroltoon van rijpe Riesling\n"
            "- Meer zonlichtblootstelling en warmere opslag versnellen TDN-ontwikkeling\n"
            "- Zuur-suikerbalans bepaalt hoeveel bewaarpotentieel een witte wijn daadwerkelijk heeft\n"
            "- Sluitingskeuze (schroefdop versus kurk) beïnvloedt het rijpingstraject mee"
        ),
        "pro_insight": (
            "Wijs een gast die twijfelt aan een petroltoon in oudere Riesling erop dat dit TDN is, "
            "een erkend kwaliteitskenmerk bij deze druif — geen wijnfout. Dat voorkomt onterechte "
            "twijfel over een fles die juist precies doet wat werd verwacht."
        ),
        "reflectievraag": (
            "Zou jij op basis van zuur-suikerbalans en sluiting durven inschatten of een witte "
            "wijn uit je eigen voorraad nog vijf tot tien jaar verder kan rijpen?"
        ),
        "kernbegrippen": ["TDN", "reductieve flesrijping", "oxidatieve vatrijping", "sluitingskeuze", "zuur-suikerbalans"],
    },
}
