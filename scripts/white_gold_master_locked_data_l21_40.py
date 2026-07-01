"""White Wine Track V2 — Gold Master LOCKED polish data (lessons 21-40 + module kernbegrippen).

Bron: `content/pipeline/WHITE_PIPELINE_CONTENT.md` (Module 5 t/m 9, Les 21 t/m 40).
Elite polish-pass: module-kernbegrippen (alle 9 modules) ontdaan van generieke termen,
plus theorie-lead-, pro insight-, quiz-feedback- en wist-je-dat-overrides voor Les 21-40.
"""

from __future__ import annotations


def _qf(validation: str, leerankers: tuple[str, str, str], bridge: str) -> str:
    bullets = "\n".join(f"- {item}" for item in leerankers)
    return f"{validation}\n\nDrie leerankers:\n\n{bullets}\n\n{bridge}"


MODULE_KERNBEGRIPPEN: dict[int, list[str]] = {
    1: [
        "witte-wijn-identiteit",
        "direct press",
        "alcoholische gisting",
        "zuurstructuur",
        "terroir-expressie",
        "primair fruit",
        "mondgevoel",
        "druivenras-signatuur",
        "oxidatieve kwetsbaarheid",
        "stijlcategorisering",
    ],
    2: [
        "direct press",
        "RVS-vinificatie",
        "houtrijping",
        "malolactische gisting",
        "lies-contact",
        "bâtonnage",
        "reductieve wijnmaak",
        "oxidatieve wijnmaak",
        "vatrijping",
        "gistautolyse",
    ],
    3: [
        "visuele intensiteit",
        "viscositeit",
        "primair aroma",
        "secundair aroma",
        "tertiair aroma",
        "zuurstructuur",
        "mondgevoel",
        "lengte-afdronk",
        "proefprotocol",
        "hypothese-vóór-conclusie",
    ],
    4: [
        "Sauvignon Blanc",
        "Riesling",
        "Albariño",
        "Grüner Veltliner",
        "Verdejo",
        "hoge zuurstructuur",
        "ziltige mineraliteit",
        "aromatische intensiteit",
        "terroir-transparantie",
        "primair-fruitdominantie",
    ],
    5: [
        "Chardonnay",
        "Chenin Blanc",
        "Viognier",
        "Semillon",
        "Marsanne",
        "Roussanne",
        "malolactische romigheid",
        "houtintegratie",
        "bewaarpotentieel",
        "textuurgewicht",
    ],
    6: [
        "Gewürztraminer",
        "Muscat",
        "Torrontés",
        "Pinot Gris",
        "Vermentino",
        "terpeenconcentratie",
        "fenolische textuurgrip",
        "orthonasaal-retronasaal-effect",
        "ampelografische synonymie",
        "schilcontact-fenolen",
    ],
    7: [
        "serveertemperatuurprotocol",
        "aromavolatiliteit",
        "glasvormfunctie",
        "splash-decanteren",
        "reductieve service",
        "oxidatieve rijping",
        "zuurbuffering",
        "kurk-versus-schroefdop",
        "koelprotocol",
        "lees-textuurgevoeligheid",
    ],
    8: [
        "ijzer-tannine-effect",
        "zuur-vet-snede",
        "capsaïcine-balans",
        "sausgedreven pairing",
        "umami-zoutbalans",
        "intensiteitsmatching",
        "eiwit-neutraliteit",
        "vetgehalte-as",
        "contrast-versus-spiegelpairing",
        "gastronomische mechanismelogica",
    ],
    9: [
        "systematische deductieketen",
        "methoxypyrazines",
        "vluchtige thiolen",
        "TDN-petroltoon",
        "diacetyl-signatuur",
        "structuur-eerst-principe",
        "fenolische grip",
        "winemaking-versus-varietaal-signaal",
        "examenintegratie",
        "hypothesevalidatie",
    ],
}


# Alleen opgenomen waar de bestaande openingszin generiek of te lijstachtig was.
# Les 21-37 openen al met een sterke, specifieke hook en zijn hier bewust weggelaten.
THEORY_LEAD_OVERRIDES: dict[int, str] = {
    38: (
        "Weinig blindkoppels worden zo vaak verward als Sauvignon Blanc en Riesling, precies omdat "
        "beide een vergelijkbare bleke, citroen-groene kleur tonen — visueel dus welbewust weinig "
        "onderscheidend. Het onderscheid ontstaat pas in een vaste analyseketen: neus (Sauvignon "
        "Blanc toont methoxypyrazines — vooral IBMP — verantwoordelijk voor groene paprika, gras en "
        "kruisbes; Riesling toont monoterpenen voor florale, limoenachtige aromatiek en, bij oudere "
        "flessen, TDN voor de kenmerkende petroltoon, ontstaan uit carotenoïdafbraak tijdens rijping "
        "onder UV en hitte en pas jaren later tot expressie komend) en mond (beide hoogzuur, maar "
        "Sauvignon Blanc toont vaak een pittiger, kruidiger intensiteit terwijl Riesling strakker, "
        "puurder en mineraler overkomt)."
    ),
    40: (
        "Dit is het moment waarop veertig lessen samenkomen tot één beslissing: kun jij, onder "
        "tijdsdruk en zonder etiket, een witte wijn plaatsen én je advies verdedigen? Dit "
        "Master-examen integreert de volledige White Wine Track — fundament, productie, "
        "proeftechniek, frisse en rijke druivenrassen, aromatische druiven, service, pairing en "
        "blindanalyse. Het productieproces — direct press versus schilcontact, keuze voor wel of "
        "geen malolactische gisting — legt de basis voor drie druivenfamilies die elk een ander "
        "mechanisme centraal stellen: frisse druiven (Sauvignon Blanc, Albariño, Grüner Veltliner, "
        "Verdejo) drijven op primair fruit en hoge zuren; rijke druiven (Chardonnay, Viognier, "
        "Marsanne, Roussanne, Semillon) drijven grotendeels op winemaking-textuur; aromatische "
        "druiven (Gewürztraminer, Muscat, Torrontés, Pinot Gris, Vermentino) drijven op "
        "terpeenchemie en regionale synonymie."
    ),
}


PRO_INSIGHT_OVERRIDES: dict[int, str] = {
    21: (
        "Beoordeel elke Chardonnay in twee losse stappen — eerst klimaat (fruitrichting), dan "
        "productie (hout, bâtonnage, MLF) — en benoem dat expliciet aan een gast. Zo verkoop je "
        "'een koele, ongehoute Chardonnay' in plaats van het vage 'droog wit', en voorkom je dat je "
        "de druif met een stijl verwart."
    ),
    22: (
        "Test bij twijfel tussen Chenin Blanc en Chardonnay altijd eerst de zuurlijn los van het "
        "fruit: blijft die scherp ondanks body en mogelijk hout, dan is het vrijwel zeker Chenin. "
        "Gebruik die volgorde ook in verkoop — 'hoog zuur mét body' is een uniek verkoopargument dat "
        "weinig andere druiven kunnen claimen."
    ),
    23: (
        "Verkoop Viognier nooit als 'een andere Chardonnay' — positioneer het expliciet op florale "
        "abrikoosintensiteit en textuur, met een lager zuurprofiel als bewuste stijlkeuze in plaats "
        "van tekortkoming. Serveer nooit te koud: dat onderdrukt precies het aroma waar de gast voor "
        "betaalt."
    ),
    24: (
        "Leer je team jonge Semillon niet af te schrijven als karakterloos: leg uit dat de stille "
        "aromatiek een teken is van rijpingscapaciteit, niet van kwaliteitsgebrek. Eén referentiefles "
        "van tien jaar oud overtuigt collega's sneller dan enige theorie."
    ),
    25: (
        "Adviseer een gast Marsanne en Roussanne altijd als koppel, nooit los — leg uit dat de een body "
        "levert en de ander aroma, en dat de blend daarom beter werkt dan beide druiven apart. Bij "
        "twijfel met Viognier: is de florale abrikoosintensiteit minder uitgesproken en voelt de wijn "
        "voller dan parfumerig, dan zit je goed met de Rhône-blend."
    ),
    26: (
        "Proef elke nieuwe Gewürztraminer eerst blind op fenolische grip vóór je hem aanbeveelt: te "
        "veel bitterheid in de afdronk is de meest voorkomende kwaliteitsfout en overstemt de "
        "finesse die je wilt verkopen. Gebruik textuur, niet aroma, als eerste onderscheid met "
        "Muscat."
    ),
    27: (
        "Vraag bij Muscat altijd eerst naar de gewenste stijl vóór je een fles aanbeveelt — droog, "
        "licht frizzante of zwaar versterkt liggen verder uiteen dan bij vrijwel elke andere druif. "
        "Leg de familiestructuur (Blanc à Petits Grains, Alexandria, Ottonel) uit als verkoopargument, "
        "niet als verwarrende technische voetnoot."
    ),
    28: (
        "Framen 'geur rijker dan smaak' als orthonasaal-retronasaal effect in plaats van tekortkoming "
        "voorkomt teleurstelling bij een gast die veel had verwacht. Wijs bewust op de extreme "
        "wijngaardhoogte van Salta als het verhaal achter de frisse structuur ondanks intense zon."
    ),
    29: (
        "Leg altijd eerst uit dat Pinot Grigio en Pinot Gris dezelfde druif zijn vóór je het "
        "stijlverschil bespreekt — dat voorkomt verwarring en toont meteen vakkennis. Gebruik de "
        "ramato-stijl als curiositeit om gevorderde gasten te verrassen richting oranje wijn."
    ),
    30: (
        "Noem bewust de regionale synoniemen (Rolle, Favorita, Pigato) wanneer een gast een fles niet "
        "herkent als 'dezelfde druif' — dat bouwt direct vertrouwen op als kenner. Wees voorzichtig "
        "met het woord 'mineraliteit': benoem het liever als ziltige textuur uit kustnabijheid."
    ),
    31: (
        "Wantrouw een wijn die opvallend ijskoud wordt geserveerd zonder duidelijke stijlreden — dat "
        "kan lichte gebreken verdoezelen in plaats van aroma sturen. Hang een stijl-temperatuurkaart "
        "achter de bar zodat elke medewerker dezelfde referentie gebruikt."
    ),
    32: (
        "Schenk interne proeverijen altijd in een neutraal ISO- of wittewijnglas en bewaar "
        "varietal-specifiek glaswerk voor gastpresentatie — zo vergelijk je zuiver én verkoop je toch "
        "het juiste glas aan tafel. Controleer glashygiëne structureel: detergent-residu is een "
        "onderschatte oorzaak van 'vlakke' aromatische witte wijn."
    ),
    33: (
        "Ruik een net geopende, sterk reductieve fles altijd eerst na een korte, krachtige "
        "zwenkbeweging vóór je hem afschrijft als gebrekkig — dat onderscheid tussen een echte fout "
        "en tijdelijke reductie zit in die ene beweging. Reserveer langzaam decanteren voor "
        "structurele ontwikkeling, niet voor elke fles die 'even moet luchten'."
    ),
    34: (
        "Leg een schroefdopfles nooit automatisch naast de kurkversie van dezelfde wijn in het 'nu "
        "drinken'-vak — de reductieve ontwikkeling onder schroefdop kan een andere openingstijd "
        "vragen. Segmenteer je voorraad expliciet naar drinkvenster zodat bewaarwijn niet per ongeluk "
        "te vroeg wordt geopend."
    ),
    35: (
        "Vraag bij twijfel altijd eerst naar de saus en het kruidenprofiel vóór je naar de vissoort "
        "vraagt — die twee sturen het pairingadvies in de praktijk vaker dan het hoofdingrediënt. Leg "
        "het ijzer-tannine-effect in één zin uit aan gasten die vragen waarom 'geen rode wijn bij "
        "vis' geldt."
    ),
    36: (
        "Bouw een kaasplank-wijnkaart op van fris-zuur naar zoet-rond, ongeacht kleur — dat dekt "
        "vrijwel elke kaas die je serveert en overtuigt kenners sneller dan een "
        "land-van-herkomst-benadering. Durf wit te adviseren bij kaas tegen de populaire 'rood hoort "
        "bij kaas'-aanname in, met zuur-vet-snede als argument."
    ),
    37: (
        "Vraag bij gevogeltepairing altijd eerst naar de saus en bereidingswijze vóór je 'kip' als "
        "uitgangspunt neemt — dat voorkomt een generiek advies dat de helft van de keren mis is. "
        "Vergeet de krokante huid niet: die Maillard-textuur kan een lichte bereiding dichter bij een "
        "gehoute wijn brengen dan de saus alleen zou suggereren."
    ),
    38: (
        "Leg na elke blindronde je topfout vast in één zin ('te snel naar druif, te weinig naar "
        "fenolische grip') — dat versnelt leren meer dan tien perfecte proeven zonder reflectie. "
        "Onthoud dat 'Sauvignon Blanc' zelf twee chemisch verschillende drijfveren heeft "
        "(methoxypyrazines versus thiolen), dus vergelijk nooit blind zonder de stijlherkomst te "
        "benoemen."
    ),
    39: (
        "Bij blindproef twijfel: vertrouw eerst op de zuurstructuur, niet op boter- of houttonen — die kunnen bij "
        "beide druiven aanwezig zijn door winemaking-keuzes. Gebruik een houtgelagerde "
        "Zuid-Afrikaanse Chenin bewust als lastig trainingsvoorbeeld voor je team, juist omdat die de "
        "Chardonnay-signatuur het dichtst benadert."
    ),
    40: (
        "Lees examenvragen als servicecases: wat zou je schenken vrijdagavond om 20:00 bij deze gast "
        "en dit gerecht — en waarom precies dat mechanisme, niet die traditie? Documenteer na het "
        "examen je zwakste onderdeel in één zin; dat wordt meteen je persoonlijke trainingsplan voor "
        "de volgende track."
    ),
}


QUIZ_FEEDBACK_OVERRIDES: dict[int, str] = {
    21: _qf(
        "Goed — je herkent nu waarom Chardonnay de meest veelzijdige én meest misleidende witte "
        "druif is.",
        (
            "Chardonnay is zelf relatief neutraal; klimaat en wijnmaakkeuzes bepalen vrijwel de hele "
            "stijl.",
            "Houtrijping, bâtonnage en malolactische gisting voegen een onafhankelijke, herkenbare "
            "productielaag toe.",
            "Het grootste verwarringsgevaar is ongehoute Chardonnay tegenover Chenin Blanc — de "
            "zuurlijn beslist.",
        ),
        "Volgende les: Les 22 laat zien hoe Chenin Blanc een nog bredere stijlbandbreedte "
        "combineert met een unieke zuur-en-body-combinatie.",
    ),
    22: _qf(
        "Goed — je begrijpt nu waarom Chenin Blanc de breedste stijlbandbreedte van alle witte "
        "druiven heeft.",
        (
            "Chenin combineert hoog zuur mét body — een combinatie die zelden zo expliciet samen "
            "voorkomt.",
            "De Loire geeft precisie en mineraliteit; Zuid-Afrika geeft een rondere, fruitigere "
            "stijl.",
            "Tegenover Chardonnay behoudt Chenin vrijwel altijd een striktere, hogere zuurlijn.",
        ),
        "Volgende les: Les 23 verschuift de focus naar Viognier, waar textuur zwaarder weegt dan "
        "zuur.",
    ),
    23: _qf(
        "Goed — je herkent nu Viognier op zijn onmiskenbare florale abrikoosintensiteit en volle "
        "textuur.",
        (
            "Viognier heeft warmte nodig voor aroma, maar te veel warmte laat het toch al lage zuur "
            "wegvallen.",
            "Condrieu toont de meest geconcentreerde, parfumerige uitvoering van de druif.",
            "Het grootste verwarringsgevaar is Marsanne/Roussanne — Viognier is explicieter "
            "parfumerig-abrikoosachtig.",
        ),
        "Volgende les: Les 24 behandelt Semillon, de druif die juist jong stil is en pas met "
        "rijping haar kracht toont.",
    ),
    24: _qf(
        "Goed — je begrijpt nu waarom Semillon een subtiele druif is met een uitzonderlijk "
        "rijpingspotentieel.",
        (
            "Jonge Semillon is wasachtig en stil, maar ontwikkelt met flesrijping honing, toast en "
            "noten.",
            "In Bordeaux levert Semillon body en rijpingscapaciteit in blends met Sauvignon Blanc.",
            "Botrytis maakt Semillon de ruggengraat van edelzoete Sauternes.",
        ),
        "Volgende les: Les 25 sluit Module 5 af met Marsanne en Roussanne, twee Rhône-druiven die "
        "elkaar structureel aanvullen.",
    ),
    25: _qf(
        "Goed — je beheerst nu de belangrijkste rijke witte druiven van Module 5.",
        (
            "Marsanne levert body en rijkdom; Roussanne levert aroma, elegantie en hoger zuur.",
            "Samen vormen ze een wijn die noch te log noch te ijl wordt — vandaar de traditie van "
            "blenden.",
            "Het grootste verwarringsgevaar is Viognier, dat explicieter florale-abrikoosachtig is.",
        ),
        "Volgende stap: Module 6 — Aromatische witte druiven, te beginnen met Gewürztraminer en "
        "zijn extreme terpeenconcentratie.",
    ),
    26: _qf(
        "Goed — je herkent nu Gewürztraminer op zijn extreme terpeenconcentratie en olieachtige "
        "textuur.",
        (
            "Linalool, geraniol en citronellol verklaren de intense lychee-rozen-gembersignatuur.",
            "Een lichte fenolische bitterheid geeft de kenmerkende olieachtige textuur — te veel is "
            "een kwaliteitsfout.",
            "Het onderscheid met Muscat zit vooral in textuur: olieachtig versus sappig-fris.",
        ),
        "Volgende les: Les 27 verdiept in Muscat, de enige druivenfamilie die daadwerkelijk naar "
        "verse druiven ruikt.",
    ),
    27: _qf(
        "Goed — je begrijpt nu waarom Muscat een familie van druiven is in plaats van één ras.",
        (
            "Muscat Blanc à Petits Grains, Alexandria en Ottonel delen terpenen maar verschillen in "
            "concentratie en stijl.",
            "Muscat is de enige grote druivenfamilie waarvan de wijn daadwerkelijk naar verse "
            "druiven ruikt.",
            "Terpeenvorming staat los van suiker of zuur — vandaar het brede stijlbereik van droog "
            "tot versterkt.",
        ),
        "Volgende les: Les 28 behandelt Torrontés, waar hoogteligging en UV-stress een "
        "vergelijkbare terpeenrijkdom verklaren.",
    ),
    28: _qf(
        "Goed — je herkent nu Torrontés op zijn florale intensiteit en het orthonasaal-retronasaal "
        "effect.",
        (
            "Torrontés Riojano is een natuurlijke kruising van Muscat of Alexandria en Criolla "
            "Chica.",
            "'Geur rijker dan smaak' is orthonasale waarneming die terpenen sterker registreert dan "
            "retronasale waarneming.",
            "Extreme hoogte in Salta en Cafayate behoudt zuur ondanks intense zoninstraling.",
        ),
        "Volgende les: Les 29 verschuift naar Pinot Gris, een druif die minder terpenerijk is en "
        "meer op textuur leunt.",
    ),
    29: _qf(
        "Goed — je begrijpt nu dat Pinot Gris en Pinot Grigio dezelfde druif zijn met twee "
        "stijltradities.",
        (
            "De druif zelf is slechts matig terpenerijk — karakter komt vaak van schilcontact, niet "
            "van primaire aromatiek.",
            "Italië perst direct en licht; Alsace macereert langer voor een rijkere, kruidigere "
            "stijl.",
            "Blindherkenning steunt op een structurele tussenpositie tussen fris en rijk, niet op "
            "één signatuuraroma.",
        ),
        "Volgende les: Les 30 sluit Module 6 af met Vermentino, dat 'fris' en 'aromatisch' bewust "
        "overbrugt.",
    ),
    30: _qf(
        "Goed — je beheerst nu de belangrijkste aromatische witte druiven van Module 6.",
        (
            "Vermentino, Rolle, Pigato en Favorita zijn grotendeels dezelfde druif onder regionale "
            "namen.",
            "De bittere amandelfinish komt van fenolen die behouden blijven bij minimaal "
            "schilcontact.",
            "Ziltigheid is een sensorische associatie, geen bewezen directe mineraaloverdracht.",
        ),
        "Volgende stap: Module 7 — Service, te beginnen met hoe serveertemperatuur aroma direct "
        "stuurt.",
    ),
    31: _qf(
        "Goed — je begrijpt nu waarom serveertemperatuur rechtstreeks samenhangt met "
        "aromavolatiliteit.",
        (
            "Te koud onderdrukt de verdamping van terpenen — juist een risico bij aromatische witte "
            "wijn.",
            "Gist- en houtgelagerde textuur is temperatuurgevoelig, vandaar het bewust warmer "
            "serveren van top-Bourgogne.",
            "Overmatig koelen kan lichte oxidatie of hitteschade maskeren — wees daar professioneel "
            "alert op.",
        ),
        "Volgende les: Les 32 bouwt hierop voort met glaswerk, dat dezelfde aromatische "
        "verbindingen op een andere manier stuurt.",
    ),
    32: _qf(
        "Goed — je begrijpt nu hoe glasvorm rechtstreeks stuurt hoeveel aroma de neus bereikt.",
        (
            "Smalle glazen concentreren terpenen en beperken alcoholwaarneming bij aromatische "
            "witte wijn.",
            "Brede kelken geven textuurgedreven, houtgelagerde witte wijn ruimte om zich te "
            "ontplooien.",
            "Detergent-residu dempt topnoten — kritiek bij aroma-gedreven aromatische witte wijn.",
        ),
        "Volgende les: Les 33 behandelt decanteren, waar witte wijn een ander mechanisme volgt dan "
        "rood: reductie.",
    ),
    33: _qf(
        "Goed — je begrijpt nu dat decanteren bij witte wijn meestal om reductie draait, niet om "
        "sediment.",
        (
            "Vluchtige zwavelverbindingen verdampen bij kort zwenken — een echt gebrek doet dat "
            "niet.",
            "Oude Riesling, rijke witte Bourgogne en Chenin Blanc profiteren het meest van "
            "decanteren.",
            "Splash-decanteren lost snel reductie op; langzaam decanteren dient structurele "
            "ontwikkeling.",
        ),
        "Volgende les: Les 34 sluit Module 7 af met bewaren en rijping, waar dezelfde fragiliteit "
        "een grotere rol speelt.",
    ),
    34: _qf(
        "Goed — je beheerst nu de professionele serviceprincipes voor witte wijn uit Module 7.",
        (
            "Zuur, fenolische buffering en restsuiker zijn de drie structurele bewaarfactoren bij "
            "wit.",
            "TDN (petroltoon bij Riesling) ontstaat uit carotenoïdafbraak, versterkt door UV en "
            "hitte.",
            "Kurk geeft een oxidatief rijpingspad; schroefdop een meer reductief pad.",
        ),
        "Volgende stap: Module 8 — Pairing & Gastronomie, te beginnen met het chemische mechanisme "
        "achter witte wijn en vis.",
    ),
    35: _qf(
        "Goed — je begrijpt nu het chemische mechanisme achter waarom witte wijn zo sterk werkt met "
        "vis.",
        (
            "Het ijzer-tannine-effect verklaart waarom rode wijn vis vaak metaalachtig laat smaken.",
            "De saus stuurt de pairing vaak sterker dan de vissoort zelf.",
            "Aromatische, licht zoete witte wijn tempert capsaïcine-hitte bij pittige gerechten.",
        ),
        "Volgende les: Les 36 past dezelfde mechanismen toe op kaas, waar zuur-vet-snede het "
        "dominante principe wordt.",
    ),
    36: _qf(
        "Goed — je begrijpt nu waarom witte wijn vaak beter werkt bij kaas dan rode wijn.",
        (
            "Zuur-vet-snede is het dominante mechanisme bij wit en kaas, in plaats van "
            "vet-tannine-binding.",
            "Verse geitenkaas en Sauvignon Blanc werken via zuurmatch, niet via contrast.",
            "Blauwe kaas met zoete Riesling balanceert zout via suiker, vaak succesvoller dan Port.",
        ),
        "Volgende les: Les 37 verschuift naar gevogelte, waar saus en bereiding de wijnkeuze "
        "sterker sturen dan het vlees zelf.",
    ),
    37: _qf(
        "Goed — je begrijpt nu de basis van gastronomische witte wijnpairing bij gevogelte.",
        (
            "Gevogelte is eiwit-neutraal — saus en bereiding bepalen de wijnkeuze vaker dan het "
            "vlees.",
            "Aziatisch of pittig bereide kip volgt hetzelfde capsaïcine-mechanisme als bij vis.",
            "Dezelfde sausgedreven logica is overdraagbaar naar romige of pittige vegetarische "
            "gerechten.",
        ),
        "Volgende stap: Module 9 — Blindproeven & Examen, te beginnen met Sauvignon Blanc versus "
        "Riesling.",
    ),
    38: _qf(
        "Goed — je begrijpt nu de belangrijkste blindverschillen tussen Sauvignon Blanc en "
        "Riesling.",
        (
            "Methoxypyrazines geven Sauvignon Blanc groene paprika en kruisbes; monoterpenen geven "
            "Riesling floraal-limoen.",
            "'Sauvignon Blanc' heeft zelf twee chemisch verschillende drijfveren: methoxypyrazines "
            "versus vluchtige thiolen.",
            "Structuur eerst, label laatst — fenolische grip is vaak het beslissende signaal.",
        ),
        "Volgende les: Les 39 past dezelfde structuur-eerst-aanpak toe op Chardonnay versus Chenin "
        "Blanc.",
    ),
    39: _qf(
        "Goed — je begrijpt nu het sleutelverschil tussen Chardonnay en Chenin Blanc in een "
        "blindproef.",
        (
            "'Chardonnaysmaak' (boter, vanille, toast) is grotendeels een winemaking-signatuur, geen "
            "varietale eigenschap.",
            "Chenin Blanc behoudt van nature hoge zuren, ongeacht rijpheid of stijl.",
            "Proef eerst de zuurstructuur, interpreteer winemaking-signalen zoals hout en boter pas "
            "daarna.",
        ),
        "Volgende les: Les 40 — het Theorie- en praktijkexamen — integreert alle veertig lessen in "
        "één Master-toets.",
    ),
    40: _qf(
        "Gefeliciteerd — je beheerst nu het volledige fundament van witte wijn: theorie, productie, "
        "druivenkennis, service, pairing en blindproeven.",
        (
            "Drie druivenfamilies (fris, rijk, aromatisch) drijven elk op een ander mechanisme — "
            "primair fruit, winemaking-textuur of terpeenchemie.",
            "Service en pairing bouwen op chemische mechanismen, niet op traditie alleen.",
            "Structuur eerst, label laatst blijft de gouden regel bij elke blindanalyse.",
        ),
        "Volgende stap: kies je vervolgtrack — Rosé, Rood, Mousserend, Port of Cocktails — en bouw "
        "voort op deze Master-basis.",
    ),
}


WIST_JE_DAT_OVERRIDES: dict[int, str] = {
    21: (
        "Chablis ligt dichter bij Champagne dan bij de rest van Bourgogne, en de beroemde "
        "Kimmeridgian-kalksteenbodem bevat fossiele oesterschelpen van meer dan 150 miljoen jaar "
        "oud — vandaar de populaire (maar omstreden) link tussen Chablis en "
        "'oesterschelp-mineraliteit'."
    ),
    22: (
        "Vouvray kan in dezelfde oogst zowel bloedstrak droog als edelzoet worden gemaakt, "
        "afhankelijk van hoeveel botrytis de wijnmaker per perceel toelaat — één druif, één jaar, "
        "twee compleet verschillende wijnen."
    ),
    23: (
        "Condrieu was in de jaren zeventig bijna uitgestorven: minder dan 20 hectare wijngaard "
        "restte er, tot een handvol producenten de druif redde — vandaag is Viognier wereldwijd "
        "aangeplant, van Californië tot Australië."
    ),
    24: (
        "Een goede Hunter Valley Semillon wordt vaak al geoogst bij amper 10-11% potentieel alcohol "
        "— extreem vroeg voor witte wijn — juist om die kenmerkende, decennialange rijpingscurve "
        "mogelijk te maken."
    ),
    25: (
        "Witte Hermitage kan tientallen jaren rijpen en wordt door sommige kenners hoger aangeslagen "
        "dan zijn rode tegenhanger uit dezelfde heuvel — een zeldzaamheid in de wijnwereld, waar wit "
        "doorgaans korter leeft dan rood."
    ),
    26: (
        "De naam Traminer verwijst naar het dorp Tramin in Zuid-Tirol, waar de oorspronkelijke, "
        "niet-geroze variant vandaan zou komen — Gewürztraminer is dus letterlijk 'de kruidige "
        "Tramin-druif'."
    ),
    27: (
        "Rutherglen Liqueur Muscat wordt geclassificeerd via fractionele blending over meerdere "
        "decennia, conceptueel vergelijkbaar met het solera-systeem van sherry — sommige "
        "'Rare'-bottelingen bevatten wijn die honderd jaar oud is."
    ),
    28: (
        "Bodega Colomé's wijngaard Altura Máxima in Salta ligt op ruim 3111 meter hoogte — daarmee "
        "een van de hoogste commerciële wijngaarden ter wereld, waar de lucht al merkbaar ijler is "
        "dan op zeeniveau."
    ),
    29: (
        "De ramato-stijl (Pinot Grigio met verlengd schilcontact) was ooit de dominante manier om "
        "deze druif in Friuli te maken, tot RVS-technologie in de twintigste eeuw de lichte, bleke "
        "stijl tot standaard maakte — de koperroze traditie is dus een heropleving, geen innovatie."
    ),
    30: (
        "Vermentino di Gallura is niet alleen Sardinië's enige DOCG, maar ook nog altijd de enige "
        "DOCG voor witte wijn op het hele eiland — een unieke positie binnen de Italiaanse "
        "classificatiepiramide."
    ),
    31: (
        "Een glas wijn kan in een warme eetzaal binnen tien tot vijftien minuten twee tot drie "
        "graden opwarmen — genoeg om een strak geserveerde Sauvignon Blanc merkbaar rijker te laten "
        "aanvoelen tegen het einde van het glas."
    ),
    32: (
        "Het ISO-tasting-glas werd in de jaren zeventig ontwikkeld door de International "
        "Organization for Standardization specifiek om wijnbeoordeling wereldwijd vergelijkbaar te "
        "maken — het wordt nog altijd gebruikt bij officiële wijnexamens en -competities."
    ),
    33: (
        "Sommige topwijnmakers in de witte Bourgogne decanteren hun eigen wijn standaard vóór "
        "verkoopproeverijen — niet omdat de wijn een gebrek heeft, maar om reductief gistkarakter "
        "bewust te openen voor een eerlijker eerste indruk."
    ),
    34: (
        "Een goed bewaarde Riesling uit een topjaar kan dertig tot veertig jaar meegaan — langer dan "
        "de meeste rode wijnen uit hetzelfde prijssegment, puur dankzij de natuurlijke zuurbuffer "
        "van de druif."
    ),
    35: (
        "Het ijzer-tannine-effect is zo meetbaar dat het herhaaldelijk in gecontroleerde "
        "smaaktesten is aangetoond: proefpersonen proefden een sterkere metaalachtige bijsmaak "
        "zodra tannine en ijzerrijke vis samen werden geproefd, vergeleken met beide apart."
    ),
    36: (
        "Uit Franse consumentenonderzoeken blijkt herhaaldelijk dat witte wijn bij een brede "
        "kaasplank vaker als 'beter passend' wordt beoordeeld dan rode wijn — tegen de "
        "wijdverspreide aanname in dat kaas en rode wijn een vanzelfsprekend koppel vormen."
    ),
    37: (
        "Kip absorbeert kruiden en sauzen zo neutraal dat sommelierscholen het gerecht soms bewust "
        "gebruiken als 'blanco canvas' om cursisten te trainen in sausgedreven in plaats van "
        "eiwitgedreven pairingdenken."
    ),
    38: (
        "De 'kattenpis'-geur die sommige Marlborough Sauvignon Blancs kenmerkt, komt van dezelfde "
        "vluchtige thiolen die ook in bepaalde tropische vruchten voorkomen — een stofklasse die pas "
        "sinds de jaren negentig goed chemisch is begrepen."
    ),
    39: (
        "Sommige Zuid-Afrikaanse wijnmakers gebruiken bewust oud, neutraal hout bij Chenin Blanc om "
        "precies de textuur van Chardonnay te benaderen zonder de herkenbare vanilletonen van nieuw "
        "hout toe te voegen — een technische imitatie die blindproevers bewust op het verkeerde been "
        "zet."
    ),
    40: (
        "De term 'Master Foundation' in deze certificering wijst bewust op een fundament, niet op "
        "een eindpunt — professionele wijnexamens zoals WSET en Court of Master Sommeliers bouwen "
        "decennia aan kennis juist voort op dezelfde structuur-eerst-methodiek die je in dit examen "
        "hebt toegepast."
    ),
}


# Alle bestaande Food pairing-secties in Les 21-40 volgen al de Beste/Waarom/Vermijd-structuur
# met een concreet mechanisme in "Waarom dit werkt" — geen enkele pairing is hier als zwak
# beoordeeld, dus dit blijft bewust leeg (schema conform: alleen vullen bij zwakke pairing).
FOOD_PAIRING_OVERRIDES: dict[int, str] = {}
