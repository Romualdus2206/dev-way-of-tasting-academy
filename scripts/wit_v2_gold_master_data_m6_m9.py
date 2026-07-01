"""Premium Gold Master repair data — White Wine Track lessons 26–40 (modules 6–9).

Module 6 (26–30): Aromatische witte druiven — Gewürztraminer, Muscat, Torrontés, Pinot Gris,
Vermentino, met specifieke aandacht voor klassieke verwarringsparen (Pinot Gris vs Pinot Grigio,
Gewürztraminer vs Muscat).
Module 7 (31–34): Service — sommelierniveau (temperatuur per stijl, glaswerk, decanteren van
witte wijn/reductie, bewaren & rijping).
Module 8 (35–37): Pairing & Gastronomie — vis, kaas, gevogelte, met de onderliggende mechanismen.
Module 9 (38–40): Blindproeven & Examen — Sauvignon Blanc vs Riesling, Chardonnay vs Chenin
Blanc, en het geïntegreerde eindexamen.
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
            "Gewürztraminer dankt zijn extreme aromatische intensiteit aan een uitzonderlijk hoge "
            "concentratie terpenen — linalool, geraniol en citronellol — een concentratie die tot "
            "de hoogste van alle klassieke druivenrassen behoort. Dat verklaart waarom lychee, "
            "rozen en gember zich al vóór elke houtlagering of extra maceratie manifesteren: het "
            "zit al in de druif zelf. Genetisch is Gewürztraminer een roze schilmutatie van "
            "Traminer (Savagnin Rose), en die pigmentatie correleert opvallend vaak met hogere "
            "terpeenrijkdom — eenzelfde patroon zien we terug bij Muscat en Torrontés.\n\n"
            "Lage zuurgraad, hoog extract en een vaak herkenbare lichte fenolische bitterheid — "
            "een subtiele grip in de afdronk, ontstaan tijdens de persing door beperkt schilcontact "
            "— vormen samen de kenmerkende 'olieachtige' textuur. Die fenolische component vraagt "
            "vakmanschap: te veel bitterheid is een veelvoorkomende fout, terwijl de Alsace "
            "Grand Cru-terroirs (Kaefferkopf, Hengst) laten zien hoe precisie in de wijngaard en "
            "kelder tot een verfijnde balans leidt.\n\n"
            "Vendange Tardive en Sélection de Grains Nobles tonen de affiniteit van Gewürztraminer "
            "met botrytis en late oogst: de dikke schil en lage zuurbuffering laten hogere "
            "suikerniveaus toe zonder dat de wijn plakkerig wordt. Dat contrasteert met de droge "
            "Alsace-stijl, de halfdroge Duitse Pfalz-interpretatie en de strakkere, preciezere "
            "Alto Adige-uitvoering in de koelere Zuid-Tiroolse bergdalen.\n\n"
            "Het klassieke verwarringsrisico is Muscat: beide zijn intens floraal en druivig van "
            "aard. Het verschil zit vooral in textuur, niet in aroma alleen — Gewürztraminer is "
            "breder en olieachtiger met een specerij-gember-rozensignatuur, terwijl Muscat lichter "
            "en 'sappiger' aanvoelt. Bij blind proeven lost textuur die verwarring vaak sneller op "
            "dan aroma alleen."
        ),
        "samenvatting": (
            "- Extreem hoge terpeenconcentratie (linalool, geraniol) verklaart de intense aromatiek\n"
            "- Roze schilmutatie van Traminer — pigmentatie correleert met terpeenrijkdom\n"
            "- Lichte fenolische bitterheid geeft de kenmerkende olieachtige textuur\n"
            "- Vendange Tardive en SGN tonen affiniteit met botrytis en late oogst\n"
            "- Onderscheid van Muscat zit vooral in textuur (olieachtig versus sappig-fris)"
        ),
        "pro_insight": (
            "Proef elke nieuwe Gewürztraminer eerst blind op fenolische grip voordat je hem "
            "aanbeveelt — te veel bitterheid in de afdronk is de meest voorkomende kwaliteitsfout "
            "bij deze druif en overstemt anders de finesse die je wilt verkopen."
        ),
        "kernbegrippen": [
            "terpenen",
            "fenolische bitterheid",
            "Vendange Tardive",
            "roze schilmutatie",
            "Alsace Grand Cru",
        ],
        "food_pairing": fp(
            "Gewürztraminer bij Munsterkaas of een matig pittige Thaise curry.",
            "Lage zuren en aromatische zoetheid temperen chilihitte en de zoute, sterke korstkaas zonder te botsen.",
            "Zeer zure of citrusrijke gerechten — de lage zuurgraad van de wijn geeft dan een vlakke, ongebalanceerde combinatie.",
        ),
        "reflectievraag": (
            "Welk signaal — textuur of aroma — zou jij als eerste gebruiken om Gewürztraminer van "
            "Muscat te onderscheiden in een blindproef, en waarom is dat signaal betrouwbaarder?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart de extreme aromatische intensiteit van Gewürztraminer het beste?\n\n"
                "A. Een zeer hoge concentratie terpenen zoals linalool en geraniol ✅  \n"
                "B. Lange malolactische gisting  \n"
                "C. Uitgebreide houtlagering  \n"
                "D. Een zeer hoog alcoholpercentage"
            ),
        },
    },
    27: {
        "theorie": (
            "Muscat is geen enkele druif maar een familie van verwante, genetisch onderscheiden "
            "rassen. Muscat Blanc à Petits Grains is de fijnste en meest florale variant, gebruikt "
            "in Moscato d'Asti en Alsace Muscat. Muscat of Alexandria is grover en dominant in "
            "zoete en versterkte stijlen zoals Moscatel de Setúbal. Muscat Ottonel is lichter en "
            "beter geschikt voor koelere klimaten zoals Alsace en Oostenrijk. Alle drie delen "
            "dezelfde kern-terpenen (linalool, geraniol), maar in andere concentratie en "
            "onderlinge verhouding — vandaar de stijlverschillen binnen één familienaam. "
            "Bijzonder: Muscat is de enige grote druivenfamilie waarvan de wijn daadwerkelijk naar "
            "verse druiven ruikt; de meeste andere 'druivige' associaties bij wijn ontstaan door "
            "gistingsesters, niet door de druif zelf.\n\n"
            "Die veelzijdigheid ontstaat doordat terpeenvorming vroeg in de rijping plaatsvindt en "
            "los staat van suiker- of zuurniveau bij oogst. Dat maakt bloedserieuze droge stijlen "
            "(Alsace) mogelijk naast de lichte, laagalcoholische frizzante Moscato d'Asti (fermentatie "
            "vroeg gestopt, CO₂ behouden), volledig mousserende Asti Spumante, en versterkte "
            "dessertstijlen zoals Rutherglen Liqueur Muscat uit Australië — een breder stijlbereik "
            "dan bijna elke andere druif.\n\n"
            "Het verwarringsrisico met Gewürztraminer wordt hier structureel opgelost: Muscat toont "
            "een frissere, 'sappigere' druivigheid met relatief hogere zuurretentie bij vergelijkbare "
            "rijpheid, terwijl Gewürztraminer breder en olieachtiger aanvoelt.\n\n"
            "Rutherglen classificeert zijn versterkte Muscats via een uniek kwaliteitssysteem "
            "(Rutherglen, Classic, Grand en Rare) gebaseerd op fractionele blending over "
            "meerdere decennia — conceptueel verwant aan het solera-systeem van sherry, maar "
            "toegepast op een aromatische in plaats van oxidatief-neutrale druif."
        ),
        "samenvatting": (
            "- Muscat is een familie: Blanc à Petits Grains (fijnst), of Alexandria (zoet/versterkt), Ottonel (koel klimaat)\n"
            "- Enige druivenfamilie waarvan de wijn daadwerkelijk naar verse druiven ruikt\n"
            "- Terpeenvorming staat los van suiker/zuur — vandaar het brede stijlbereik (droog tot versterkt)\n"
            "- Onderscheid met Gewürztraminer: Muscat is frisser en sappiger, minder olieachtig\n"
            "- Rutherglen classificeert versterkte Muscat via fractionele blending, vergelijkbaar met solera"
        ),
        "pro_insight": (
            "Vraag bij Muscat altijd eerst naar de gewenste stijl vóór je een fles aanbeveelt — "
            "'Muscat' kan bloedserieus droog, licht frizzante of zwaar versterkt betekenen, en die "
            "drie liggen verder uit elkaar dan bij vrijwel elke andere druif."
        ),
        "kernbegrippen": [
            "Muscat Blanc à Petits Grains",
            "Muscat of Alexandria",
            "Moscato d'Asti",
            "Rutherglen-classificatie",
            "terpeenfamilie",
        ],
        "food_pairing": fp(
            "Moscato d'Asti bij een lichte perzik- of abrikozentaart.",
            "De lage alcohol en zachte mousse van Moscato spiegelen het fruit zonder de wijn te overweldigen.",
            "Zwaar gekruide of zeer zure gerechten — die overstemmen de subtiele florale precisie van deze stijl volledig.",
        ),
        "reflectievraag": (
            "Bij welke Muscat-stijl (droog, frizzante of versterkt) zou jij een gast het snelst "
            "verrassen die alleen 'zoete Muscat' kent — en met welk argument overtuig je die gast?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Welke Muscat-variant wordt vooral gebruikt in zoete en versterkte stijlen?\n\n"
                "A. Muscat Blanc à Petits Grains  \n"
                "B. Muscat of Alexandria ✅  \n"
                "C. Muscat Ottonel  \n"
                "D. Muscat Canelli"
            ),
        },
    },
    28: {
        "theorie": (
            "Torrontés Riojano — de fijnste en meest verspreide variant — is een natuurlijke "
            "kruising tussen Muscat of Alexandria en de roze Criolla Chica. Die afkomst verklaart "
            "de sterk Muscat-achtige neus (geërfde terpenen), terwijl de smaak juist minder "
            "fenolische bitterheid en olieachtigheid toont dan zowel Gewürztraminer als Muscat. "
            "Dat verklaart het beroemde fenomeen dat 'de geur rijker is dan de smaak': orthonasale "
            "waarneming (rechtstreeks ruiken uit het glas) registreert de terpenen veel intenser "
            "dan de retronasale waarneming (proeven en doorslikken) doet.\n\n"
            "De hoogteligging van Salta en Cafayate — sommige percelen tot ruim 3000 meter, zoals "
            "Bodega Colomé's Altura Máxima — zorgt voor een groot diurnaal verschil dat zuren "
            "behoudt ondanks de intense zoninstraling. Diezelfde UV-stress stimuleert als "
            "afweermechanisme van de plant extra terpeen- en fenolsynthese — één en dezelfde "
            "omgevingsfactor verklaart dus zowel de aromatische intensiteit als de frisse "
            "structuur.\n\n"
            "Specialistisch onderscheid: niet elke 'Torrontés' op het etiket is gelijkwaardig. "
            "Torrontés Sanjuanino en Torrontés Mendocino zijn verwante maar minder fijne rassen; "
            "Riojano geldt als de kwaliteitsreferentie.\n\n"
            "Blind kan Torrontés verward worden met Muscat of Viognier door de florale intensiteit. "
            "De hoogte-gedreven zuurbehoud is het onderscheidende kenmerk: bij vergelijkbare "
            "florale intensiteit behoudt Torrontés meer zuur dan een warmeklimaat-Muscat."
        ),
        "samenvatting": (
            "- Torrontés Riojano is een natuurlijke kruising van Muscat of Alexandria en Criolla Chica\n"
            "- 'Geur rijker dan smaak' verklaard door orthonasale versus retronasale waarneming\n"
            "- Extreme hoogte (tot 3000+ meter) behoudt zuur via een groot diurnaal verschil\n"
            "- UV-stress stimuleert zowel terpeen- als fenolsynthese\n"
            "- Riojano is de kwaliteitsreferentie; Sanjuanino en Mendocino zijn minder fijn"
        ),
        "pro_insight": (
            "Leg de 'geur rijker dan smaak'-eigenschap uit als orthonasaal versus retronasaal "
            "effect in plaats van als tekortkoming — dat framet Torrontés als technisch "
            "interessant in plaats van 'teleurstellend' voor een gast die veel had verwacht."
        ),
        "kernbegrippen": [
            "Torrontés Riojano",
            "Criolla Chica",
            "orthonasaal versus retronasaal",
            "Cafayate",
            "diurnaal verschil",
        ],
        "food_pairing": fp(
            "Torrontés bij ceviche of empanadas met limoen en koriander.",
            "De florale intensiteit en frisse zuren spiegelen citrus en kruiden zonder de delicate vis te overweldigen.",
            "Romige, zware sauzen — die maskeren precies de florale precisie die Torrontés uniek maakt.",
        ),
        "reflectievraag": (
            "Welke andere aromatische druif uit deze module zou jij naast Torrontés zetten om het "
            "verschil tussen orthonasale en retronasale intensiteit expliciet te demonstreren?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom is de geur van Torrontés vaak intenser dan de smaak?\n\n"
                "A. Orthonasale waarneming registreert terpenen sterker dan retronasale waarneming ✅  \n"
                "B. Door fortificatie tijdens productie  \n"
                "C. Door langdurige houtlagering  \n"
                "D. Door een zeer lage serveertemperatuur"
            ),
        },
    },
    29: {
        "theorie": (
            "Pinot Gris is een kleurmutatie van Pinot Noir (grijsroze schil, 'gris' betekent grijs) "
            "en genetisch exact dezelfde druif als Pinot Grigio — geen twee rassen, maar één "
            "druif met twee stijltradities. Specialistisch belangrijk: de druif zelf is slechts "
            "matig terpenerijk, aanzienlijk minder dan Gewürztraminer, Muscat of Torrontés. Veel "
            "van het waargenomen karakter in rijkere uitvoeringen komt daarom van schilcontact-"
            "fenolen en textuur, niet van echte primaire terpeenaromatiek — een cruciaal onderscheid "
            "binnen een module die draait om aromatische druiven.\n\n"
            "Het stijlspectrum wordt bepaald door wijnmaakkeuzes, niet door genetica. Italiaanse "
            "Pinot Grigio (Veneto, Alto Adige, Friuli) wordt doorgaans direct en met minimaal "
            "schilcontact geperst: bleek, neutraal, fris, geschikt voor grootschalige productie. "
            "Alsace Pinot Gris ondergaat langere schilmaceratie en soms vat- of gistlagering: "
            "dieper van kleur, honingachtig van gewicht, met rook- en specerijtonen, en "
            "regelmatig een lichte restzoetheid.\n\n"
            "De ramato-stijl in Friuli — Pinot Grigio met verlengd schilcontact, waardoor een "
            "koperroze kleur ontstaat — is een specialistische niche die een historische "
            "Friulaanse traditie nieuw leven inblaast en op het snijvlak van 'wit' en 'oranje wijn' "
            "balanceert.\n\n"
            "Blindherkenning steunt daardoor minder op één signatuuraroma en meer op structurele "
            "'tussenpositie': neutrale aromatiek gecombineerd met subtiele fenolische grip en "
            "medium body die tussen fris en rijk in zit, is zelf al diagnostisch voor deze druif."
        ),
        "samenvatting": (
            "- Pinot Gris en Pinot Grigio zijn genetisch dezelfde druif, twee stijltradities\n"
            "- De druif zelf is slechts matig terpenerijk — karakter komt vaak van schilcontact\n"
            "- Italië: direct geperst, licht en neutraal; Alsace: schilmaceratie, rijker en kruidiger\n"
            "- Ramato-stijl (Friuli) gebruikt verlengd schilcontact voor een koperroze kleur\n"
            "- Blindherkenning steunt op structurele tussenpositie, niet op één signatuuraroma"
        ),
        "pro_insight": (
            "Leg aan een gast uit dat Pinot Grigio en Pinot Gris dezelfde druif zijn vóórdat je "
            "stijlverschil bespreekt — dat voorkomt verwarring en toont meteen vakkennis zonder "
            "belerend over te komen."
        ),
        "kernbegrippen": [
            "kleurmutatie",
            "schilcontact",
            "ramato-stijl",
            "Alto Adige",
            "structurele tussenpositie",
        ],
        "food_pairing": fp(
            "Alsace Pinot Gris bij gebraden gevogelte met champignons, of Pinot Grigio bij een lichte visceviche.",
            "De rijkere Alsace-stijl draagt umami en textuur; de lichte Italiaanse stijl laat delicate vis ongestoord.",
            "Zware, sterk gekruide gerechten bij de lichte Italiaanse stijl — die overweldigen de subtiele neutraliteit volledig.",
        ),
        "reflectievraag": (
            "Zou jij een gast die alleen lichte Pinot Grigio kent, durven verrassen met een rijke "
            "Alsace Pinot Gris — en welke ene zin zou je gebruiken om die stijlsprong uit te leggen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waar komt het rijkere karakter van Alsace Pinot Gris vooral vandaan?\n\n"
                "A. Langere schilmaceratie en gist- of vatlagering ✅  \n"
                "B. Een hogere terpeenconcentratie dan Gewürztraminer  \n"
                "C. Uitsluitend hoge suikerrijping  \n"
                "D. Fortificatie tijdens de gisting"
            ),
        },
    },
    30: {
        "theorie": (
            "Vermentino is een schoolvoorbeeld van ampelografische synonymie: dezelfde druif heet "
            "Vermentino op Sardinië, in Ligurië en Toscane, Rolle in de Provence en Languedoc, "
            "Pigato aan de Ligurische Riviera di Ponente (al bestaat discussie over subtiele "
            "klonale verschillen) en Favorita in Piemonte — DNA-onderzoek bevestigt de laatste als "
            "identiek. Eén druif met meerdere regionale identiteiten is een bredere les in "
            "wijnetikettering die verder reikt dan Vermentino alleen.\n\n"
            "De kenmerkende licht bittere amandeltoon in de afdronk komt van specifieke fenolische "
            "verbindingen die behouden blijven bij het doorgaans minimale schilcontact. Gecombineerd "
            "met een gematigd tot hoog zuurgehalte en een ziltige, texturele finish — vaak "
            "(ten onrechte) 'mineraliteit' genoemd, dezelfde voorzichtigheid als bij de "
            "terroir-analyse van andere druiven: het is een sensorische associatie, geen directe "
            "mineraaloverdracht, al kan kustnabijheid via zeewind meetbare sporen natriumchloride "
            "bijdragen, in tegenstelling tot 'mineraliteit' bij inland percelen.\n\n"
            "Vermentino di Gallura DOCG op Sardinië — Italië's enige DOCG voor een witte wijn op "
            "het eiland — toont hoe granietbodem intensiteit en spanning geeft, terwijl mildere "
            "Toscaanse Vermentino (bijvoorbeeld in Bolgheir-blends) een zachtere, ronde interpretatie "
            "oplevert van dezelfde druif.\n\n"
            "Structureel overbrugt Vermentino de categorieën 'fris' en 'aromatisch': florale en "
            "citruslift zonder werkelijk hoge terpeenconcentratie, wat het een bruikbaar "
            "ijkpunt maakt bij blindkalibratie tussen neutrale en echt aromatische druiven."
        ),
        "samenvatting": (
            "- Vermentino, Rolle, Pigato en Favorita zijn (grotendeels) dezelfde druif onder regionale namen\n"
            "- De bittere amandelfinish komt van fenolen die behouden blijven bij minimaal schilcontact\n"
            "- Ziltigheid is een sensorische associatie, geen bewezen directe mineraaloverdracht\n"
            "- Vermentino di Gallura DOCG is Sardinië's (en Italië's) enige witte DOCG\n"
            "- Overbrugt 'fris' en 'aromatisch' — florale lift zonder hoge terpeenconcentratie"
        ),
        "pro_insight": (
            "Noem bij Vermentino bewust de regionale synoniemen (Rolle, Favorita) wanneer een "
            "gast een fles uit de Provence of Piemonte niet herkent als 'dezelfde druif' — dat "
            "bouwt meteen vertrouwen op als kenner."
        ),
        "kernbegrippen": [
            "Rolle-synoniem",
            "Favorita",
            "bittere amandelfinish",
            "Vermentino di Gallura",
            "ziltige textuur",
        ],
        "food_pairing": fp(
            "Vermentino bij gegrilde vis met pesto genovese of gefrituurde inktvis.",
            "De ziltige, licht bittere structuur spiegelt de mediterrane kruiden en snijdt door het vet van de frituur.",
            "Romige, zwaar boterrijke sauzen — die verdrukken de lichte, ziltige precisie van deze stijl.",
        ),
        "reflectievraag": (
            "Bij welke fles op jouw kaart zou je een gast bewust attenderen op een regionaal "
            "synoniem (Rolle, Favorita, Pigato) — en waarom versterkt dat het vertrouwen in je advies?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Welke Piemontese naam is DNA-bevestigd identiek aan Vermentino?\n\n"
                "A. Favorita ✅  \n"
                "B. Arneis  \n"
                "C. Cortese  \n"
                "D. Erbaluce"
            ),
        },
    },
    31: {
        "theorie": (
            "Serveertemperatuur is een bewegend doel dat rechtstreeks samenhangt met de "
            "vluchtigheid van aromatische verbindingen. Terpenen en esters met een laag kookpunt "
            "verdampen al bij 8–10°C, wat verklaart waarom aromatische witte wijnen (Gewürztraminer, "
            "Muscat, Riesling) niet veel warmer geserveerd hoeven te worden dan neutrale, frisse "
            "stijlen ondanks hun hogere body — te koud serveren onder circa 7°C onderdrukt actief "
            "de verdamping van precies die terpenen die de aromatische module definieert.\n\n"
            "Vatgegiste of op gist gelagerde wijnen met malolactische gisting (houtgelagerde "
            "Chardonnay, sommige Pinot Gris) steunen op textuur — romigheid uit mannoproteïnen en "
            "gistcontact — die temperatuurgevoelig is: onder circa 10°C wordt die romigheid vlak of "
            "muf. Dat is het mechanisme achter het bewust warmer serveren van top-Bourgogne "
            "(12–14°C): geen indulgentie, maar chemie — viscositeitsperceptie en de lagere "
            "vluchtigheid van zwaardere verbindingen zoals diacetyl vragen net iets meer warmte om "
            "zich te openen.\n\n"
            "Praktisch protocol: schenk circa 1–2°C onder de uiteindelijke doeltemperatuur, want "
            "een glas warmt in een verwarmde ruimte vanzelf op. Een ijsemmer met 50% water en 50% "
            "ijs koelt sneller en gelijkmatiger dan een koelkast alleen.\n\n"
            "Specialistisch aandachtspunt: overmatig koelen kan lichte oxidatie of hitteschade in "
            "mindere kwaliteitswijnen maskeren — herken wanneer 'te koud serveren' een bewuste "
            "verkooptruc is in plaats van een oprechte stijlkeuze."
        ),
        "samenvatting": (
            "- Te koud onderdrukt de verdamping van terpenen — juist bij aromatische witte wijn een risico\n"
            "- Gist- en houtgelagerde textuur (romigheid) is temperatuurgevoelig — vandaar warmer serveren\n"
            "- Schenk altijd iets onder de doeltemperatuur; het glas warmt vanzelf op\n"
            "- Ijsemmer met 50/50 water-ijs koelt sneller en gelijkmatiger dan een koelkast\n"
            "- Overmatig koelen kan lichte oxidatie of hitteschade maskeren — wees daar alert op"
        ),
        "pro_insight": (
            "Wantrouw een wijn die opvallend ijskoud wordt geserveerd zonder duidelijke stijlreden "
            "— dat kan een signaal zijn dat de temperatuur lichte gebreken moet verdoezelen in "
            "plaats van aroma te sturen."
        ),
        "kernbegrippen": [
            "aromavolatiliteit",
            "lees-textuur",
            "temperatuurdrift",
            "koelprotocol",
            "foutmaskering",
        ],
        "food_pairing": fp(
            "Dezelfde houtgelagerde Chardonnay geserveerd op 8°C en op 13°C naast een romige kreeftenbisque.",
            "Bij 13°C ontvouwt de lees-textuur zich en spiegelt de romigheid van de bisque; bij 8°C blijft de wijn vlak.",
            "Een zeer aromatische Gewürztraminer op 14°C bij hetzelfde gerecht — te warm serveren maakt de wijn log en benadrukt alcohol.",
        ),
        "reflectievraag": (
            "Welke fles op jouw kaart serveer je vermoedelijk te koud uit gewoonte — en welk "
            "aromasignaal zou je na correctie moeten proeven dat je nu mist?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom wordt top-Bourgogne soms bewust warmer geserveerd dan de standaardrichtlijn?\n\n"
                "A. Omdat lees- en houttextuur temperatuurgevoelig is en meer warmte nodig heeft om zich te openen ✅  \n"
                "B. Omdat warmere wijn goedkoper oogt  \n"
                "C. Omdat het zuur daardoor verdwijnt  \n"
                "D. Omdat het verplicht is bij elk keurmerk"
            ),
        },
    },
    32: {
        "theorie": (
            "Glasvorm stuurt direct hoeveel aromatische verbindingen zich concentreren vóór ze de "
            "neus bereiken. Smalle, getailleerde tulpglazen voor aromatische witte wijn (Riesling, "
            "Gewürztraminer) bundelen de al overvloedige terpenen richting de neus en beperken "
            "tegelijk de ethanolwaarneming, zodat delicate florale tonen domineren boven "
            "alcoholwarmte. Bredere kelken voor houtgelagerde, gistgelagerde Chardonnay geven de "
            "textuurgedreven, minder vluchtige complexiteit ruimte om zich te ontplooien, zonder "
            "de zwaardere aroma's voortijdig te concentreren tot iets overweldigends.\n\n"
            "Het neutrale ISO-tasting-glas blijft de internationale standaard voor blind proeven en "
            "examens — bewust zonder stijlinterpretatie, zodat elke wijn onder identieke condities "
            "wordt beoordeeld.\n\n"
            "Randdikte beïnvloedt de eerste indruk: een dunne, scherp geslepen rand laat wijn de "
            "mond bereiken vóór de lip het glas voelt. Glashygiëne is minstens zo belangrijk als "
            "vorm — detergent-residu dempt juist de delicate topnoten waarop aromatische witte "
            "wijnen bijna volledig steunen voor hun aantrekkingskracht.\n\n"
            "Praktisch standaardiseren veel sommeliers aromatische witte wijn in één glasvorm en "
            "rijkere, houtgelagerde stijlen in een andere — een subtiel maar herkenbaar "
            "servicesignaal dat gasten leert welk soort wijn ze mogen verwachten nog vóór ze proeven."
        ),
        "samenvatting": (
            "- Smal glas concentreert terpenen en beperkt alcoholwaarneming bij aromatische wijn\n"
            "- Breed glas geeft textuurgedreven, houtgelagerde witte wijn ruimte om te ontplooien\n"
            "- ISO-tasting-glas is de neutrale standaard voor blind proeven en examens\n"
            "- Randdikte beïnvloedt hoe wijn de mond eerst bereikt\n"
            "- Detergent-residu dempt topnoten — kritiek bij aroma-gedreven aromatische witte wijn"
        ),
        "pro_insight": (
            "Schenk interne proeverijen altijd in een neutraal ISO- of wittewijnglas; bewaar het "
            "varietal-specifieke glaswerk voor gastpresentatie. Zo vergelijk je wijnen zuiver én "
            "verkoop je toch het juiste glas aan tafel."
        ),
        "kernbegrippen": [
            "tulpvorm",
            "randdikte",
            "ISO-glas",
            "glashygiëne",
            "aromaconcentratie",
        ],
        "food_pairing": fp(
            "Gewürztraminer in een smal, getailleerd glas bij een lichte Aziatische salade met gember.",
            "Het smalle glas bundelt de florale terpenen precies richting de neus, in balans met de kruidige salade.",
            "Datzelfde glas voor een houtgelagerde Chardonnay — de brede, textuurgedreven complexiteit krijgt dan te weinig ruimte.",
        ),
        "reflectievraag": (
            "Welk glas in jouw zaak doet een witte wijnstijl structureel tekort — en wat is de "
            "service- of verkoopimpact daarvan op die fles?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom dempt detergent-residu vooral aromatische witte wijnen zoals Gewürztraminer sterk?\n\n"
                "A. Omdat hun aantrekkingskracht bijna volledig op delicate topnoten steunt ✅  \n"
                "B. Omdat het de kleur van de wijn verandert  \n"
                "C. Omdat het de temperatuur verlaagt  \n"
                "D. Omdat het alleen mousserende wijn beïnvloedt"
            ),
        },
    },
    33: {
        "theorie": (
            "Decanteren van witte wijn draait meestal om een ander mechanisme dan bij rood: "
            "reductie. Reductief gemaakte wijn — minimale zuurstofblootstelling, inert gas, "
            "schroefdop — behoudt frisheid maar kan vluchtige zwavelverbindingen (H₂S, lichte "
            "mercaptanen) vasthouden die ruiken naar lucifer, rubber of gekookte kool. Die tonen "
            "verdwijnen doorgaans binnen enkele minuten zwenken of beluchten — in tegenstelling tot "
            "een echt gebrek, dat niet vervliegt.\n\n"
            "Wijnen die écht profiteren van decanteren: oude Riesling (integreert petroltonen), "
            "rijke witte Bourgogne (opent reductief gistkarakter), Chenin Blanc (integreert hoge "
            "zuren met textuur) en witte Rhône-blends op basis van Marsanne en Roussanne "
            "(textuur ontvouwt zich met lucht).\n\n"
            "Fragiele, oud gerijpte witte wijn kan sneller 'instorten' dan rode wijn van "
            "vergelijkbare leeftijd: minder fenolische buffering (minder tannine) betekent minder "
            "bescherming tegen oxidatie. Oude Riesling kan binnen twintig tot dertig minuten "
            "blootstelling al verse fruitlift verliezen.\n\n"
            "'Splash-decanteren' — krachtig overschenken in een brede karaf, of stevig zwenken in "
            "het glas zelf — is de snelle techniek om reductie direct te laten verdampen zonder "
            "langdurige blootstelling, terwijl langzaam, zorgvuldig decanteren bedoeld is voor "
            "structurele ontwikkeling van complexe, gerijpte stijlen."
        ),
        "samenvatting": (
            "- Bij witte wijn draait decanteren vaak om reductie, niet om sedimentscheiding\n"
            "- Vluchtige zwavelverbindingen (H₂S, mercaptanen) verdampen bij beluchting, een gebrek niet\n"
            "- Oude Riesling, rijke witte Bourgogne en Chenin Blanc profiteren het meest\n"
            "- Witte wijn heeft minder fenolische buffering — fragiele flessen storten sneller in\n"
            "- Splash-decanteren voor snelle reductie; langzaam decanteren voor structurele ontwikkeling"
        ),
        "pro_insight": (
            "Ruik een net geopende, sterk reductieve fles altijd eerst na een korte, krachtige "
            "zwenkbeweging vóórdat je 'm afschrijft als gebrekkig — het verschil tussen een echte "
            "fout en tijdelijke reductie zit in die ene beweging."
        ),
        "kernbegrippen": [
            "reductie",
            "vluchtige zwavelverbindingen",
            "splash-decanteren",
            "petrolontwikkeling",
            "fenolische buffering",
        ],
        "food_pairing": fp(
            "Een net geopende, licht reductieve Chablis, kort gezwenkt, bij verse oesters.",
            "Het kort openbreken van reductie laat de mineraal-citrusprecisie van Chablis samenwerken met de ziltige oester.",
            "Een zeer oude, fragiele Riesling lang van tevoren decanteren — het frisse fruit kan binnen minuten wegvallen.",
        ),
        "reflectievraag": (
            "Bij welke fles in jouw assortiment zou jij kiezen voor snel splash-decanteren in "
            "plaats van langzaam decanteren — en welk signaal (reductiegeur versus leeftijd) "
            "bepaalt die keuze?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom verdwijnt reductiegeur meestal snel na kort zwenken, in tegenstelling tot een echt wijngebrek?\n\n"
                "A. Omdat vluchtige zwavelverbindingen verdampen bij contact met lucht ✅  \n"
                "B. Omdat zwenken de temperatuur verlaagt  \n"
                "C. Omdat zwenken het alcoholpercentage verandert  \n"
                "D. Omdat een echt gebrek altijd binnen een minuut verdwijnt"
            ),
        },
    },
    34: {
        "theorie": (
            "Het bewaarpotentieel van witte wijn wordt bepaald door structurele buffers tegen "
            "oxidatie: natuurlijk hoog zuur (Riesling, Chenin Blanc), fenolische buffering uit "
            "schilcontact of hout (witte Rhône, oranje-wijntechnieken), en restsuiker of "
            "botrytisconcentratie (Sauternes, Trockenbeerenauslese). Elk van die factoren werkt via "
            "een ander mechanisme dan bij rode wijn, waar tannine-antocyaan-polymerisatie het "
            "rijpingspad domineert.\n\n"
            "Tertiaire ontwikkeling bij witte wijn ontstaat via langzame, gecontroleerde oxidatieve "
            "en Maillard-achtige reacties: honing, noten, gedroogd fruit, en bij Riesling specifiek "
            "petrol (TDN, gevormd uit afbraak van carotenoïden, versterkt door UV en hitte tijdens "
            "de rijping in de wijngaard en pas jaren later tot expressie komend in de fles) — een "
            "wezenlijk andere biochemische route dan tanninepolymerisatie bij rode wijn.\n\n"
            "Sluiting bepaalt mede het rijpingspad: kurk laat een minimale, langzame "
            "zuurstofinstroom toe die klassieke oxidatieve ontwikkeling ondersteunt; schroefdop "
            "creëert een meer reductieve omgeving die soms een langere 'openingstijd' vraagt en een "
            "ander — soms controversieel — reductiegedreven karakter kan ontwikkelen.\n\n"
            "De universele kelderprincipes blijven gelden: 12–14°C stabiel, donker, trillingsvrij, "
            "en een bewuste segmentatie van voorraad naar drinkvenster, zodat je niet per ongeluk "
            "een bewaarwijn te vroeg opent of een frisse stijl te lang laat liggen."
        ),
        "samenvatting": (
            "- Zuur, fenolische buffering en restsuiker zijn de drie structurele bewaarfactoren bij wit\n"
            "- Tertiaire ontwikkeling verloopt via oxidatieve en Maillard-achtige reacties, niet via tannine\n"
            "- TDN (petroltoon bij Riesling) ontstaat uit carotenoïdafbraak, versterkt door UV en hitte\n"
            "- Kurk geeft een oxidatief rijpingspad; schroefdop een meer reductief pad\n"
            "- Stabiele 12–14°C, duisternis en segmentatie naar drinkvenster blijven universeel"
        ),
        "pro_insight": (
            "Leg een schroefdopfles nooit automatisch naast een kurkfles van dezelfde wijn in het "
            "'nu drinken'-vak — de reductieve ontwikkeling onder schroefdop kan een langere of "
            "andere openingstijd vragen dan de kurkversie."
        ),
        "kernbegrippen": [
            "zuurbuffering",
            "TDN-vorming",
            "kurk versus schroefdop",
            "oxidatieve rijping",
            "botrytisconcentratie",
        ],
        "food_pairing": fp(
            "Een goed bewaarde, tien jaar oude Riesling met petroltonen bij gerookte paling.",
            "De oxidatieve honing- en petrolontwikkeling spiegelt de rokerige, vette intensiteit van de paling.",
            "Een wijn die warm of met trilling is opgeslagen — vroegtijdige, oncontroleerde oxidatie ondermijnt precies die complexiteit.",
        ),
        "reflectievraag": (
            "Welke fles in jouw kelder zit waarschijnlijk in het verkeerde segment — drink nu of "
            "lang bewaren — en welke conditie (temperatuur, licht, sluiting) zou je het eerst "
            "corrigeren?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart de petroltoon (TDN) in oude Riesling het beste?\n\n"
                "A. Afbraak van carotenoïden, versterkt door UV en hitte tijdens de rijping ✅  \n"
                "B. Contact met een schroefdop tijdens opslag  \n"
                "C. Malolactische gisting  \n"
                "D. Een te hoge serveertemperatuur"
            ),
        },
    },
    35: {
        "theorie": (
            "Het mechanisme achter 'geen rode wijn bij vis' is chemisch concreet: ijzer uit vis kan "
            "reageren met tannine, wat een metaalachtige bijsmaak oplevert, versterkt doordat "
            "tannine de perceptie van trimethylamine — de stof achter een 'visachtige' bijsmaak — "
            "verscherpt. Witte wijn mist tannine bijna volledig en vermijdt dat effect structureel, "
            "wat de klassieke regel verklaart zonder toevlucht te nemen tot traditie alleen.\n\n"
            "De saus stuurt de pairing vaak sterker dan de vissoort zelf. Boter- en roomsauzen "
            "(beurre blanc) vragen een licht houtgelagerde, malolactische Chardonnay — de "
            "boterachtige diacetyltoon in de wijn resoneert met de saus. Citrus- en "
            "kruidenbereidingen vragen juist hoge, onversneden zuren (Sancerre, Albariño) om de "
            "frisheid te spiegelen. Rauwe bereidingen (oesters, ceviche) vragen ziltige, hoogzure, "
            "minimaal geïntervenieerde wijn — dezelfde 'zuur snijdt door delicatesse en zilt' logica.\n\n"
            "Aziatische en pittige gerechten introduceren een extra mechanisme: bij sushi en "
            "sojagedreven umami-gerechten werkt een subtiel halfdroge of laagfenolische witte wijn "
            "(Riesling Kabinett, Chenin) om het zout van soja te balanceren zonder bitter te "
            "worden. Bij chilirijke gerechten temperen aromatische, licht zoete witte wijnen "
            "(Gewürztraminer, Riesling) de brandende pijnperceptie van capsaïcine, omdat suiker en "
            "vet dezelfde receptoren dempen die door hitte worden geactiveerd.\n\n"
            "Vetgehalte van de vis zelf blijft een structurele as: magere witvis vraagt een lichte, "
            "frisse wijn; vette vis (zalm, makreel) kan meer body en zelfs licht houtcontact aan."
        ),
        "samenvatting": (
            "- Het ijzer-tannine-effect verklaart chemisch waarom witte wijn beter werkt bij vis\n"
            "- Saus bepaalt vaak sterker dan de vissoort: boter vraagt gehout wit, citrus vraagt onversneden zuur\n"
            "- Bij Aziatische umami-gerechten balanceert subtiele restzoetheid het zout van soja\n"
            "- Aromatische, licht zoete witte wijn tempert capsaïcine-hitte bij pittige gerechten\n"
            "- Vetgehalte van de vis zelf blijft een structurele as: mager = licht, vet = meer body"
        ),
        "pro_insight": (
            "Vraag bij twijfel altijd eerst naar de saus en het kruidenprofiel vóór je naar de "
            "vissoort vraagt — die twee sturen het pairingadvies in de praktijk vaker dan het "
            "hoofdingrediënt."
        ),
        "kernbegrippen": [
            "ijzer-tannine-effect",
            "sausgedreven pairing",
            "capsaïcine-balans",
            "vetgehalte vis",
            "zuur-zout-snede",
        ],
        "food_pairing": fp(
            "Sushi en sashimi bij een halfdroge Riesling Kabinett.",
            "Subtiele restzoetheid balanceert het zout van soja en tempert eventuele wasabi-scherpte zonder bitter te worden.",
            "Een strak droge, hoogzure Sauvignon Blanc bij dezelfde sushi — te veel zuur zonder zoetheidsbuffer laat de sojasmaak hard aanvoelen.",
        ),
        "reflectievraag": (
            "Bij welk visgerecht op je menu bepaalt de saus — niet de vissoort — jouw uiteindelijke "
            "wijnadvies, en waarom?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom temperen aromatische, licht zoete witte wijnen de scherpte van pittige gerechten?\n\n"
                "A. Suiker en vet dempen dezelfde receptoren die door capsaïcine worden geactiveerd ✅  \n"
                "B. Omdat chili geen effect heeft op witte wijn  \n"
                "C. Omdat alcohol de scherpte volledig neutraliseert  \n"
                "D. Omdat lage zuren altijd scherpte verminderen"
            ),
        },
    },
    36: {
        "theorie": (
            "Bij witte wijn en kaas is zuur-vet-snede het dominante mechanisme — anders dan bij "
            "rood, waar vet-tannine-binding de sleutel is. Omdat witte wijn nauwelijks tannine "
            "bevat, werkt de logica hier vrijwel uitsluitend via zuur dat door vet en romigheid "
            "snijdt en het gehemelte verfrist. Dat verklaart waarom veel sommeliers bij kaas vaker "
            "wit dan rood adviseren, tegen de populaire aanname 'rode wijn hoort bij kaas' in.\n\n"
            "Categoriegewijs werken: verse geitenkaas vraagt hoogzure Sauvignon Blanc — de "
            "klassieke Loire-koppeling met Sancerre en Crottin de Chavignol werkt via zuurmatch in "
            "plaats van contrast. Zachte, gerijpte korstkazen (Brie, Camembert) werken vaak beter "
            "met licht houtgelagerde Chardonnay, waarbij romigheid in kaas en wijn elkaar versterken. "
            "Harde, gerijpte kaas (Comté, oude Gouda) combineert sterk met textuurrijke, oxidatieve "
            "Chenin Blanc: umami- en kristaltonen spiegelen notige complexiteit. Blauwe kaas vraagt "
            "zoete Riesling of botrytisrijke witte wijn — suiker balanceert zout, vaak succesvoller "
            "dan de klassieke Port-pairing bij mildere blauwschimmelstijlen.\n\n"
            "De logica is uit te breiden naar vegetarische gerechten in het algemeen: romige "
            "gerechten zoals paddenstoelenrisotto of kaasgebaseerde pasta volgen dezelfde "
            "zuur-snijdt-door-vet-logica, een bruikbaar, overdraagbaar principe buiten kaas alleen.\n\n"
            "Bouw een kaasplank op als een oplopende reeks: begin met de frisste, meest zure witte "
            "wijn bij de lichtste kaas en werk toe naar de rondste of zoetste stijl bij de "
            "krachtigste kaas — dezelfde logica als een dessertwijnflight."
        ),
        "samenvatting": (
            "- Zuur-vet-snede is het dominante mechanisme bij wit en kaas — vet-tannine-binding geldt hier niet\n"
            "- Verse geitenkaas + Sauvignon Blanc werkt via zuurmatch, niet via contrast\n"
            "- Harde, gerijpte kaas matcht sterk met textuurrijke, oxidatieve Chenin Blanc of Chardonnay\n"
            "- Blauwe kaas + zoete Riesling balanceert zout via suiker, vaak beter dan rode Port-pairing\n"
            "- Dezelfde zuur-vet-logica is overdraagbaar naar romige vegetarische gerechten"
        ),
        "pro_insight": (
            "Bouw een kaasplank-wijnkaart op van fris-zuur naar zoet-rond, ongeacht kleur — dat "
            "dekt vrijwel elke kaas die je serveert en overtuigt kenners sneller dan de "
            "land-van-herkomst-benadering."
        ),
        "kernbegrippen": [
            "zuur-vet-snede",
            "chèvre-Sancerre-match",
            "botrytis-blauwschimmelbalans",
            "acid-match versus contrast",
            "vegetarische transfer",
        ],
        "food_pairing": fp(
            "Verse geitenkaas bij een Sancerre (Sauvignon Blanc).",
            "De hoge zuurgraad van beide matcht in intensiteit in plaats van te contrasteren — een zuivere, verfrissende combinatie.",
            "Een zwaar houtgelagerde, romige Chardonnay bij dezelfde verse geitenkaas — de romigheid overstemt de frisse precisie van de kaas.",
        ),
        "reflectievraag": (
            "Bij welke kaas op jouw plank zou jij een gast bewust naar wit in plaats van rood "
            "sturen — en welk mechanisme (zuur, vet, zout) gebruik je om dat advies te onderbouwen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom werkt zuur-vet-snede sterker dan vet-tannine-binding bij witte wijn en kaas?\n\n"
                "A. Omdat witte wijn nauwelijks tannine bevat ✅  \n"
                "B. Omdat witte wijn altijd zoeter is dan rode wijn  \n"
                "C. Omdat kaas geen vet bevat  \n"
                "D. Omdat tannine het zout in kaas verhoogt"
            ),
        },
    },
    37: {
        "theorie": (
            "Gevogelte is qua eiwit zelf grotendeels neutraal en laag in intramusculair vet "
            "vergeleken met rood vlees — daardoor stuurt het eigen vlees zelden de wijnkeuze; "
            "vrijwel altijd bepalen saus, bereidingswijze en kruiding de match, sterker dan bij "
            "rood vlees waar het eigen vet en bindweefsel wél meetellen.\n\n"
            "Lichte bereiding (gepocheerde of gegrilde kipfilet) geeft een mager, laagvet gerecht "
            "dat vraagt om de eigen zuurstructuur van de wijn voor lift: crisp, licht aromatische "
            "witte wijn past hier het best. Rijke bereiding (roomsaus, boter, gebraden kip met "
            "jus) vraagt een wijn met vergelijkbare romigheid en textuur — vandaar houtgelagerde of "
            "op gist gelagerde witte wijn. Aziatisch of pittig bereide kip (citroengras, gember, "
            "chili) roept exact hetzelfde mechanisme op als bij vis: aromatische, licht zoete witte "
            "wijn tempert capsaïcine-hitte via suiker en aroma, een principe dat overdraagbaar is "
            "tussen eiwitcategorieën.\n\n"
            "Diezelfde sausgedreven logica geldt voor vegetarische alternatieven: een romige "
            "paddenstoelenrisotto volgt hetzelfde pad als romige kip, en een pittig gegrild "
            "groentespies met chiliglaze volgt hetzelfde pad als pittig bereide kip — het is de "
            "sausstructuur, niet het eiwit, die de wijnlogica bepaalt.\n\n"
            "Krokante huid voegt een extra textuur- en Maillard-dimensie toe: geroosterde, "
            "krokante kippenhuid brengt een lichte toastnoot en vetlaag in, wat zelfs een verder "
            "lichte bereiding dichter bij een licht houtgelagerde wijn kan brengen dan de "
            "saus alleen zou suggereren."
        ),
        "samenvatting": (
            "- Gevogelte is eiwit-neutraal — saus en bereiding bepalen de wijnkeuze vaker dan het vlees\n"
            "- Licht bereid vraagt wijnzuur voor lift; rijk bereid vraagt vergelijkbare romigheid\n"
            "- Aziatisch/pittig bereide kip volgt hetzelfde capsaïcine-mechanisme als bij vis\n"
            "- Dezelfde sausgedreven logica is overdraagbaar naar vegetarische alternatieven\n"
            "- Krokante, geroosterde huid voegt een Maillard-textuur toe die de wijnkeuze kan verschuiven"
        ),
        "pro_insight": (
            "Vraag bij gevogeltepairing altijd eerst naar de saus en bereidingswijze vóór je "
            "'kip' als uitgangspunt neemt — dat voorkomt een generiek advies dat de helft van de "
            "keren mis is."
        ),
        "kernbegrippen": [
            "sausgedreven pairing",
            "eiwit-neutraliteit",
            "Maillard-textuur",
            "capsaïcine-transfer",
            "vegetarische analogie",
        ],
        "food_pairing": fp(
            "Geroosterde kip met romige champignonsaus bij een licht houtgelagerde Chardonnay.",
            "De romigheid van de saus en de gistgedreven textuur van de wijn versterken elkaar zonder te botsen.",
            "Een strak droge, neutrale Muscadet bij hetzelfde romige gerecht — de wijn voelt dun en verliest tegen de saus.",
        ),
        "reflectievraag": (
            "Bij welk gevogeltegerecht op je kaart bepaalt de bereidingswijze — niet het vleestype "
            "— jouw uiteindelijke wijnadvies, en waarom?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom bepaalt de saus bij gevogelte vaak sterker de wijnkeuze dan bij rood vlees?\n\n"
                "A. Omdat gevogelte-eiwit zelf grotendeels neutraal en laag in intramusculair vet is ✅  \n"
                "B. Omdat gevogelte altijd gefrituurd wordt  \n"
                "C. Omdat rood vlees geen saus verdraagt  \n"
                "D. Omdat gevogelte nooit gekruid wordt"
            ),
        },
    },
    38: {
        "theorie": (
            "Sauvignon Blanc versus Riesling blind vraagt een vaste analyseketen: visueel (beide "
            "tonen een vergelijkbare bleke citroen-groene kleur, dus weinig onderscheidend), neus "
            "(Sauvignon Blanc toont methoxypyrazines — vooral IBMP — verantwoordelijk voor groene "
            "paprika, gras en kruisbes; Riesling toont monoterpenen voor florale, limoenachtige "
            "aromatiek en, bij oudere flessen, TDN voor de kenmerkende petroltoon, ontstaan uit "
            "carotenoïdafbraak tijdens rijping onder UV en hitte en pas jaren later tot expressie "
            "komend), en mond (beide hoogzuur, maar Sauvignon Blanc toont vaak een pittiger, "
            "kruidiger intensiteit terwijl Riesling strakker, puurder en mineraler overkomt).\n\n"
            "Een specialistische nuance: 'Sauvignon Blanc' heeft zelf twee chemisch verschillende "
            "aromatische drijfveren. Koele Loire-stijlen (Sancerre) worden gedreven door "
            "methoxypyrazines (groen, kruidig); warme Nieuwe Wereld-stijlen (Marlborough) worden "
            "juist gedreven door vluchtige thiolen (3MH, 4MMP) — een andere stofklasse die "
            "passievrucht en de kenmerkende 'kattenpis'-noot geeft. Dat verklaart waarom twee "
            "Sauvignon Blancs onderling soms verder uiteen liggen dan een Sauvignon Blanc en een "
            "jonge Riesling.\n\n"
            "Het klassieke verwarringsrisico werkt in twee richtingen: jonge, koele Riesling kan "
            "op Loire Sauvignon lijken door vergelijkbare citrus-groentonen; omgekeerd kan warme "
            "Marlborough Sauvignon Blanc door zijn tropische thiolprofiel juist verder van Riesling "
            "af staan dan verwacht.\n\n"
            "De gouden regel blijft: structuur eerst, label laatst. Fenolische grip in de afdronk "
            "(vaker aanwezig bij Sauvignon Blanc, zelden bij Riesling) is vaak het laatste, "
            "beslissende signaal wanneer aroma alleen niet overtuigt."
        ),
        "samenvatting": (
            "- Sauvignon Blanc: methoxypyrazines (groen, paprika, kruisbes) of thiolen (tropisch, in warm klimaat)\n"
            "- Riesling: monoterpenen (floraal, limoen) en TDN (petrol) bij oudere flessen\n"
            "- 'Sauvignon Blanc' zelf heeft twee chemisch verschillende aromatische drijfveren\n"
            "- Klassieke verwarring: koele Riesling versus Loire Sauvignon door vergelijkbare groentonen\n"
            "- Structuur eerst, label laatst — fenolische grip is vaak het beslissende signaal"
        ),
        "pro_insight": (
            "Leg na elke blindronde je topfout vast in één zin ('te snel naar druif, te weinig naar "
            "fenolische grip'). Dat versnelt leren meer dan tien perfecte proeven zonder reflectie."
        ),
        "kernbegrippen": [
            "methoxypyrazines",
            "vluchtige thiolen",
            "TDN-petroltoon",
            "regionale stijlverwarring",
            "structuur-eerst-principe",
        ],
        "food_pairing": fp(
            "Loire Sauvignon Blanc bij verse geitenkaas, of droge Riesling bij een lichte Aziatische salade.",
            "Beide combinaties gebruiken de hoge, precieze zuurgraad van de druif als brug naar respectievelijk zuivelfrisheid en kruidigheid.",
            "Een zoete, botrytisrijke stijl van beide druiven bij een hartig hoofdgerecht — de restzoetheid botst dan met de zoutigheid.",
        ),
        "reflectievraag": (
            "Bij je laatste blindproef: welke stap in de keten (visueel, neus of mond) sloeg je "
            "onbewust over vóór je naar een conclusie sprong?"
        ),
    },
    39: {
        "theorie": (
            "Chardonnay is op druifniveau aromatisch vrij neutraal; het karakter dat de meeste "
            "mensen als 'Chardonnay' herkennen — boter, vanille, toast, ronde textuur — ontstaat "
            "overwegend door wijnmaakkeuzes: houtlagering en malolactische gisting (die diacetyl "
            "produceert, de stof achter de boterachtige toon) en gistcontact via bâtonnage voor "
            "romige textuur. 'Chardonnaysmaak' is dus grotendeels een winemaking-signatuur, geen "
            "pure varietale eigenschap.\n\n"
            "Chenin Blanc daarentegen behoudt van nature hoge zuren, zelfs bij volledige rijpheid "
            "— een structurele, druifgedreven eigenschap, geen wijnmaakkeuze. Die eigenschap "
            "verklaart waarom Chenin functioneert over een ongeëvenaard stijlbereik: kurkdroog, "
            "halfzoet, volledig zoet en botrytisrijk (Vouvray, Quarts de Chaume) én mousserend "
            "(Crémant de Loire) — met behoud van diezelfde zuurruggengraat als sleutel, ongeacht "
            "stijl.\n\n"
            "Verwarringsrisico: houtgelagerde Zuid-Afrikaanse Chenin kan vanille- en toasttonen "
            "krijgen die de winemaking-signatuur van Chardonnay imiteren, terwijl ongehoute, oude "
            "Chablis het neutrale appel-citrusbasisprofiel van de druif zonder boter toont. Dat "
            "betekent dat winemaking-signalen alleen kunnen misleiden — specialisten wegen daarom "
            "altijd de zuurstructuur zwaarder dan aroma alleen, omdat Chenin's natuurlijke "
            "zuurretentie zich technisch niet laat nabootsen.\n\n"
            "Sleutelvolgorde bij blindproeven: proef eerst de zuurstructuur, interpreteer pas "
            "daarna de winemaking-signalen (hout, boter, room) — niet andersom."
        ),
        "samenvatting": (
            "- 'Chardonnaysmaak' (boter, vanille, toast) is grotendeels een winemaking-signatuur\n"
            "- Chenin Blanc behoudt van nature hoge zuren, ongeacht rijpheid of stijl\n"
            "- Chenin's stijlbereik (droog tot botrytisrijk tot mousserend) is ongeëvenaard\n"
            "- Houtgelagerde Chenin kan Chardonnay imiteren — winemaking-signalen kunnen misleiden\n"
            "- Proef zuurstructuur eerst, interpreteer winemaking-signalen (hout, boter) pas daarna"
        ),
        "pro_insight": (
            "Bij twijfel tussen Chardonnay en Chenin Blanc: vertrouw eerst op de zuurstructuur, "
            "niet op boter- of houttonen — die laatste kunnen bij beide druiven aanwezig zijn door "
            "winemaking-keuzes."
        ),
        "kernbegrippen": [
            "diacetyl",
            "malolactische signatuur",
            "natuurlijke zuurretentie",
            "stijlbereik Chenin",
            "winemaking- versus varietaal-signaal",
        ],
        "food_pairing": fp(
            "Houtgelagerde Chardonnay bij kreeft met botersaus, of droge Chenin Blanc bij een quiche met geitenkaas.",
            "Chardonnay's romige textuur spiegelt de botersaus; Chenin's zuurruggengraat snijdt door de romige quiche-vulling.",
            "Een zoete, botrytisrijke Chenin bij een hartig hoofdgerecht — de restzoetheid botst dan met zoute smaken.",
        ),
        "reflectievraag": (
            "Wat vond jij moeilijker: winemaking-signalen negeren of zuurstructuur isoleren — en "
            "welk glas zou je nogmaals willen proeven om zeker te worden?"
        ),
    },
    40: {
        "theorie": (
            "Dit Master-examen integreert de volledige White Wine Track: fundament, productie, "
            "proeftechniek, frisse en rijke druivenrassen, aromatische druiven, service, pairing "
            "en blindanalyse. Het productieproces — direct press versus schilcontact, keuze voor "
            "wel of geen malolactische gisting — legt de basis voor drie druivenfamilies die elk "
            "een ander mechanisme centraal stellen: frisse druiven (Sauvignon Blanc, Albariño, "
            "Grüner Veltliner, Verdejo) drijven op primair fruit en hoge zuren; rijke druiven "
            "(Chardonnay, Viognier, Marsanne, Roussanne, Semillon) drijven grotendeels op "
            "winemaking-textuur; aromatische druiven (Gewürztraminer, Muscat, Torrontés, Pinot "
            "Gris, Vermentino) drijven op terpeenchemie en regionale synonymie.\n\n"
            "Service bouwt daarop voort: temperatuur stuurt zowel aromavolatiliteit als "
            "lees-textuurperceptie, glasvorm richt terpenen naar de neus of geeft textuur ruimte, "
            "decanteren lost bij witte wijn vaker reductie op dan sedimentscheiding, en bewaren "
            "verloopt via zuur- en fenolbuffering in plaats van tanninepolymerisatie. Pairing "
            "bouwt op onderliggende mechanismen — het ijzer-tannine-effect verklaart waarom wit "
            "beter werkt bij vis, zuur-vet-snede verklaart het succes bij kaas, en sausgedreven "
            "logica verklaart pairing bij gevogelte en de overdraagbaarheid naar Aziatische en "
            "vegetarische gerechten.\n\n"
            "Blindanalyse integreert dat allemaal in één systematische keten: visueel, neus "
            "(primair, secundair, tertiair — met specifieke chemische markers als "
            "methoxypyrazines, thiolen, TDN en diacetyl als objectief bewijs in plaats van gokwerk), "
            "mond, en pas dan een onderbouwde hypothese. Sauvignon Blanc versus Riesling en "
            "Chardonnay versus Chenin Blanc tonen beide dat structuur — fenolische grip, "
            "zuurretentie — betrouwbaarder is dan aroma alleen.\n\n"
            "Succesvolle examenkandidaten vermijden drie terugkerende fouten: te snel naar een "
            "druifconclusie springen vóór de structuuranalyse compleet is, verkeerde "
            "temperatuur- of glasaannames bij servicevragen, en pairingadvies dat traditie citeert "
            "zonder het onderliggende mechanisme te benoemen. Dit examen beloont expliciete "
            "argumentatie boven geraden antwoorden, op elk van de drie examenonderdelen."
        ),
        "samenvatting": (
            "- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)\n"
            "- Productie en druivenfamilies (fris, rijk, aromatisch) vormen het fundament van elke analyse\n"
            "- Service en pairing bouwen op mechanismen (temperatuur, zuur-vet-snede, ijzer-tannine-effect)\n"
            "- Blindanalyse vraagt structuur eerst — chemische markers boven gokwerk\n"
            "- Veelvoorkomende fouten: haast, verkeerde temperatuuraannames, traditie zonder mechanisme"
        ),
        "pro_insight": (
            "Lees examenvragen als servicecases: wat zou je schenken vrijdagavond om 20:00 bij "
            "deze gast en dit gerecht — en waarom precies dat mechanisme, niet die traditie?"
        ),
        "kernbegrippen": [
            "examenintegratie",
            "systematische deductie",
            "servicebewustzijn",
            "pairingmechanismen",
            "certificering",
        ],
        "food_pairing": fp(
            "Examenonderdeel pairing: kies per gerecht een witte wijnstijl op basis van zuur, vet, capsaïcine en sausstructuur.",
            "Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.",
            "Eén wijnstijl voor alle examengerechten zonder onderbouwing per mechanisme.",
        ),
        "reflectievraag": (
            "Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste schakel, en "
            "welke ene wekelijkse routine zou dat het snelst verbeteren?"
        ),
        "praktijk": (
            "### Examenonderdeel 1 — Theorie (20 vragen)\n\n"
            "Beantwoord de volledige meerkeuzequiz van twintig vragen zonder hulpmiddelen. "
            "Minimaal 70% (14 van de 20) is vereist om te slagen.\n\n"
            "### Examenonderdeel 2 — Blindproeven (2 glazen)\n\n"
            "Analyseer twee witte wijnen — bij voorkeur één frisse en één aromatische stijl — "
            "volgens het vaste protocol:\n\n"
            "- kleur en intensiteit\n"
            "- geur (primair, secundair, tertiair)\n"
            "- zuur, body en lengte\n"
            "- vermoedelijk druivenras, met minstens drie argumenten\n"
            "- serviceadvies (temperatuur, glas, decanteren)\n\n"
            "### Examenonderdeel 3 — Pairing (3 gerechten)\n\n"
            "Koppel een onderbouwde witte wijnstijl aan elk van de volgende gerechten:\n\n"
            "1. Oesters met citroen\n"
            "2. Romige kip in botersaus\n"
            "3. Pittig Aziatisch gerecht met chili en gember\n\n"
            "Motiveer elke keuze via het onderliggende mechanisme (zuur, vet, capsaïcine, "
            "sausstructuur) — niet via traditie alleen.\n\n"
            "### Beoordeling\n\n"
            "- 18–20 goed + correcte blindanalyse = Master Distinction\n"
            "- 15–17 goed = Master Pass\n"
            "- 12–14 goed = Conditional Pass — herhaal de zwakste module\n"
            "- Minder dan 12 goed = Retry\n\n"
            "Bij slagen ontvang je de certificering **Way of Tasting Academy — White Wine "
            "Certified (Master Foundation)**."
        ),
        "quiz_full": (
            "### Vraag 1\n\n"
            "Wat is het belangrijkste doel van direct press bij witte wijnproductie?\n\n"
            "A. Kleur extraheren uit de schil  \n"
            "B. Schilcontact en tannine-extractie vermijden ✅  \n"
            "C. Het suikergehalte verhogen  \n"
            "D. Het zuurgehalte verlagen\n\n"
            "### Vraag 2\n\n"
            "Wat gebeurt er tijdens malolactische gisting?\n\n"
            "A. Appelzuur wordt omgezet in melkzuur ✅  \n"
            "B. Suiker wordt omgezet in alcohol  \n"
            "C. Tannine wordt afgebroken  \n"
            "D. Kleurstoffen worden geëxtraheerd\n\n"
            "### Vraag 3\n\n"
            "Welk aroma is typisch voor Sauvignon Blanc uit de koele Loire?\n\n"
            "A. Kruisbes en gras ✅  \n"
            "B. Boter en vanille  \n"
            "C. Honing en noten  \n"
            "D. Rozen en lychee\n\n"
            "### Vraag 4\n\n"
            "Welke druif staat bekend om een kenmerkende, peperachtige toon?\n\n"
            "A. Grüner Veltliner ✅  \n"
            "B. Chardonnay  \n"
            "C. Viognier  \n"
            "D. Muscat\n\n"
            "### Vraag 5\n\n"
            "Met welke regio wordt Albariño het sterkst geassocieerd?\n\n"
            "A. Rías Baixas ✅  \n"
            "B. Mosel  \n"
            "C. Loire  \n"
            "D. Salta\n\n"
            "### Vraag 6\n\n"
            "Wat veroorzaakt de boterachtige toon in veel Chardonnay?\n\n"
            "A. Diacetyl, gevormd tijdens malolactische gisting ✅  \n"
            "B. Terpenen uit de schil  \n"
            "C. Tannine-extractie  \n"
            "D. Een hoog suikergehalte\n\n"
            "### Vraag 7\n\n"
            "Welke druif is bekend om intense abrikoos- en viooltjesaroma's?\n\n"
            "A. Viognier ✅  \n"
            "B. Sauvignon Blanc  \n"
            "C. Riesling  \n"
            "D. Vermentino\n\n"
            "### Vraag 8\n\n"
            "Wat is typisch voor houtgelagerde witte Rhône-blends (Marsanne/Roussanne)?\n\n"
            "A. Zeer hoge tannine  \n"
            "B. Textuur en relatief lage aromatische intensiteit ✅  \n"
            "C. Extreem hoge zuren  \n"
            "D. Een mousserend karakter\n\n"
            "### Vraag 9\n\n"
            "Welke stofklasse is grotendeels verantwoordelijk voor de intense aromatiek van Gewürztraminer?\n\n"
            "A. Terpenen zoals linalool en geraniol ✅  \n"
            "B. Tannines  \n"
            "C. Diacetyl uit malolactische gisting  \n"
            "D. Ethanol\n\n"
            "### Vraag 10\n\n"
            "Waarom ruikt Muscat letterlijk naar druiven?\n\n"
            "A. Het is de enige grote druivenfamilie waarvan de wijn echt naar verse druiven ruikt ✅  \n"
            "B. Door lange houtlagering  \n"
            "C. Door een hoog tanninegehalte  \n"
            "D. Door een zeer lage zuurgraad\n\n"
            "### Vraag 11\n\n"
            "Waarom is de neus van Torrontés vaak intenser dan de smaak?\n\n"
            "A. Orthonasale waarneming registreert terpenen sterker dan retronasale waarneming ✅  \n"
            "B. Door fortificatie tijdens productie  \n"
            "C. Door langdurige houtlagering  \n"
            "D. Door een zeer lage serveertemperatuur\n\n"
            "### Vraag 12\n\n"
            "Wat is het genetische verband tussen Pinot Gris en Pinot Grigio?\n\n"
            "A. Twee genetisch verschillende druiven  \n"
            "B. Dezelfde druif, twee verschillende stijltradities ✅  \n"
            "C. Pinot Grigio is een kruising van Pinot Gris en Chardonnay  \n"
            "D. Pinot Gris is een klon van Sauvignon Blanc\n\n"
            "### Vraag 13\n\n"
            "Waarom schenk je een wijn idealiter iets onder de uiteindelijke doeltemperatuur?\n\n"
            "A. Omdat het glas tijdens service vanzelf opwarmt ✅  \n"
            "B. Omdat dat het zuur verhoogt  \n"
            "C. Omdat dat het alcoholpercentage verlaagt  \n"
            "D. Omdat dat verplicht is bij elk wijnkeurmerk\n\n"
            "### Vraag 14\n\n"
            "Welk glastype is de internationale standaard voor blind proeven?\n\n"
            "A. Het neutrale ISO-tasting-glas ✅  \n"
            "B. Het Bordeaux-glas  \n"
            "C. De coupe  \n"
            "D. Het sherryglas\n\n"
            "### Vraag 15\n\n"
            "Waarom decanteer je sommige witte wijnen?\n\n"
            "A. Om vluchtige zwavelverbindingen (reductie) te laten verdampen ✅  \n"
            "B. Om extra kleur toe te voegen  \n"
            "C. Om het suikergehalte te verlagen  \n"
            "D. Om tannine te verhogen\n\n"
            "### Vraag 16\n\n"
            "Welke factoren bepalen vooral het bewaarpotentieel van witte wijn?\n\n"
            "A. De vorm van de fles  \n"
            "B. Zuur, fenolische structuur en concentratie ✅  \n"
            "C. De kleur van het etiket  \n"
            "D. De geur van de kurk\n\n"
            "### Vraag 17\n\n"
            "Waarom botst rode wijn vaak met vis?\n\n"
            "A. Door het ijzer-tannine-effect ✅  \n"
            "B. Door een te hoog suikergehalte  \n"
            "C. Door een te laag alcoholpercentage  \n"
            "D. Door te veel koolzuur\n\n"
            "### Vraag 18\n\n"
            "Wat is het dominante mechanisme bij witte wijn en kaas?\n\n"
            "A. Vet-tannine-binding  \n"
            "B. Zuur-vet-snede ✅  \n"
            "C. Alcohol-zout-binding  \n"
            "D. Suiker-bitter-contrast\n\n"
            "### Vraag 19\n\n"
            "Wat bepaalt bij gevogelte vaak sterker de wijnkeuze dan het vlees zelf?\n\n"
            "A. De saus of bereidingswijze ✅  \n"
            "B. De kleur van het bord  \n"
            "C. Het gebruikte glas  \n"
            "D. De temperatuur van de keuken\n\n"
            "### Vraag 20\n\n"
            "Wat is het belangrijkste onderscheid tussen Chardonnay en Chenin Blanc in een blindproef?\n\n"
            "A. Chenin behoudt van nature hoge zuren, ongeacht winemaking-keuzes ✅  \n"
            "B. Chardonnay is altijd zoeter dan Chenin  \n"
            "C. Chenin heeft altijd meer tannine dan Chardonnay  \n"
            "D. Chardonnay heeft altijd meer kleur dan Chenin"
        ),
        "quiz_feedback": (
            "Gefeliciteerd. Je beheerst nu het volledige fundament van witte wijn: theorie, "
            "productie, druivenkennis (fris, rijk en aromatisch), professionele service, "
            "gastronomische pairing en systematisch blindproeven.\n\n"
            "Volgende logische tracks:\n\n"
            "- Rosé Wijn Track  \n"
            "- Rode Wijn Track  \n"
            "- Mousserende Wijn Track  \n"
            "- Port Track  \n"
            "- Cocktails Track"
        ),
    },
}
