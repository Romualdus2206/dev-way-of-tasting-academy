"""Premium repair data — MOUS lessons 26–40 (modules 6–9)."""

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
            "Brut Nature (max. 3 g/l, vaak zero dosage) is de meest onverbloemde test van basiswijn en kelderwerk. "
            "Waarom geen suikermasker? Omdat zuur, terroir en mousse direct zichtbaar worden — fouten vallen meteen op.\n\n"
            "Sensorisch: strak, mineraal, soms scherp; mousse moet compenseren met finesse, niet met zoetheid. "
            "Ideaal om productiekwaliteit te beoordelen en voor pairing met zout en umami.\n\n"
            "Hoe verschilt het van Extra Brut? Minder afronding; meer transparantie. Wanneer adviseren? "
            "Oesters, sashimi, gastronomische start — niet voor gasten die ronde middenpalet verwachten."
        ),
        "samenvatting": (
            "- Droogste categorie: max. 3 g/l, vaak geen dosage\n"
            "- Geen suikermasker: zuur, terroir en mousse staan bloot\n"
            "- Vraagt hoge kwaliteit basiswijn en fijne mousse\n"
            "- Pairing: zout, umami, minerale gerechten\n"
            "- Niet voor gasten die zachte afronding zoeken"
        ),
        "food_pairing": fp(
            "Oesters nature, sashimi, zee-urchin.",
            "Maximale transparantie vraagt maximale zuiverheid in het gerecht; zout versterkt mineraliteit.",
            "Romige pasta zonder zoutcontrast — Brut Nature voelt hard en kaal.",
        ),
        "pro_insight": (
            "Zet Brut Nature niet op de kaart zonder serveertip: iets warmer dan ijsklontjes, anders lijkt elke fles “te zuur”."
        ),
        "reflectievraag": (
            "Welk kwaliteitsprobleem in een basiswijn wordt het snelst zichtbaar zonder dosage — vlakke mousse of scherp zuur?"
        ),
    },
    27: {
        "theorie": (
            "Extra Brut (0–6 g/l) is het sweet spot-niveau voor veel premium huizen: bijna droog, maar net genoeg "
            "afronding om hoge zuren te temperen zonder zoetheid te tonen. Waarom populair bij sommeliers? "
            "Gastronomische precisie met toegankelijkheid.\n\n"
            "Vergelijk met Brut Nature: iets ronder mondgevoel; vergelijk met Brut: strakker en moderner. "
            "In pairing snijdt Extra Brut door vet zonder dessertassociatie.\n\n"
            "Wanneer kiezen? Maaltijdstart, vis met boter, lichte kaas — wanneer Brut Nature te scherp zou aanvoelen."
        ),
        "samenvatting": (
            "- 0–6 g/l: zeer droog met minimale afronding\n"
            "- Populair in premium segment voor balans bij hoge zuren\n"
            "- Tussen Brut Nature en Brut in mondgevoel\n"
            "- Gastronomisch veelzijdiger dan Brut Nature voor brede tafel\n"
            "- Dosage als fine-tuning, niet als stijl"
        ),
        "food_pairing": fp(
            "Gegrilde vis met citroen-botersaus, witte truffel-amuse.",
            "Minimale dosage rondt zuur af zonder zoet te tonen; mousse reinigt vet.",
            "Fruitdessert — Extra Brut mist de suiker om contrast te bieden.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Brut en Extra Brut op de kaart: noteer welke bij je hoofdgang-vis staat — "
            "dat voorkomt willekeurige upsell."
        ),
        "reflectievraag": (
            "In een verticale van Nature → Extra Brut → Brut: welk punt voelt voor jou het meest “compleet” bij hetzelfde gerecht?"
        ),
    },
    28: {
        "theorie": (
            "Brut (max. 12 g/l) is de wereldstandaard omdat het de breedste balans biedt: droog genoeg voor "
            "gastronomie, rond genoeg voor aperitief. Waarom domineert het verkoop? Omdat het de meeste "
            "gasten en gerechten dekt zonder educatie.\n\n"
            "Sensorisch: fris maar niet scherp; mousse geïntegreerd; dosage maskeert kleine onevenheden. "
            "Niet “minder kwaliteit” dan Extra Brut — vaak huisstijl-keuze.\n\n"
            "Wanneer default? Onbekende gast, gemengde tafel, eerste fles van de avond. "
            "Upgrade naar Extra Brut/ Nature wanneer gerecht strakker is."
        ),
        "samenvatting": (
            "- Meest voorkomende stijl: max. 12 g/l\n"
            "- Optimale balans aperitief én maaltijd voor brede doelgroep\n"
            "- Dosage maskeert lichte onevenheden; mousse blijft leidend\n"
            "- Veilige default in service en verkoop\n"
            "- Upgrade-pad naar droger wanneer pairing strakker wordt"
        ),
        "food_pairing": fp(
            "Gemengde borrel, canapés, lichte voorgerechten, eerste gang vis of gevogelte.",
            "Brut dekt brede intensiteit; zuur en mousse werken over meerdere hapjes.",
            "Zoet dessert zonder expliciete Demi-Sec-keuze.",
        ),
        "pro_insight": (
            "Train staff: “Brut is niet zoet” — die zin bespaart de meeste retouren op mousserend."
        ),
        "reflectievraag": (
            "Bij welk type gast of gerecht schakel jij bewust van Brut naar droger — en welk signaal triggert dat?"
        ),
    },
    29: {
        "theorie": (
            "Extra Dry (12–17 g/l) en Dry (17–32 g/l) zijn de grootste valkuilen in mousserende taal: "
            "de naam zegt droog, de suiker zegt iets anders. Historisch ontwikkeld voor bredere smaak; "
            "vandaag niche maar culinair nuttig.\n\n"
            "Extra Dry voelt zachter en fruitiger dan Brut — populair bij brunch en lichte Aziatische keuken "
            "met zoete componenten. Dry nog ronder; Demi-Sec module volgt voor zoetere pairing.\n\n"
            "Hoe verkoop je zonder verwarring? Noem altijd “zoeter dan Brut” vóór je het etiket noemt. "
            "Blind: meer fruitige afronding op het einde van de slok."
        ),
        "samenvatting": (
            "- Extra Dry is zoeter dan Brut (12–17 g/l); Dry nog zoeter (17–32 g/l)\n"
            "- Naamgeving is historisch en misleidend\n"
            "- Zachtere afronding, meer fruitige perceptie\n"
            "- Brunch, lichte Aziatische en toegankelijke pairing\n"
            "- Altijd uitleggen vóór schenken om teleurstelling te voorkomen"
        ),
        "food_pairing": fp(
            "Brunch met fruit en pannenkoek; lichte spicy tuna of zoetzure Aziatische hapjes.",
            "Restsuiker vangt spice en fruitzoet; mousse houdt het geheel fris genoeg.",
            "Oesters met Extra Dry — zout maakt de wijn vreemd zoet.",
        ),
        "pro_insight": (
            "Schrijf op je kaart: “Extra Dry = zoeter dan Brut”. Eén regel tekst voorkomt 80% dosage-discussie."
        ),
        "reflectievraag": (
            "Welke gastvraag (“iets droogs maar niet te scherp”) zou jij naar Extra Brut sturen in plaats van Extra Dry — en waarom?"
        ),
    },
    30: {
        "theorie": (
            "Demi-Sec en zoetere stijlen (32–50 g/l en hoger) zijn minder trendy maar gastronomisch scherp "
            "wanneer correct ingezet. Waarom terug in beeld? Omdat blauwschimmel, foie gras, pittige keuken "
            "en fruitdessert suiker in de wijn nodig kunnen hebben.\n\n"
            "Gouden regel: wijn moet zoeter of even zoet zijn als het gerecht — anders zuur domineert. "
            "Mousse houdt zoetheid levendig in plaats van plakkerig.\n\n"
            "Wanneer niet? Aperitief, oesters, strakke sashimi. Wanneer wel? Dessertgang, kaas met blauwschimmel, "
            "contrast met zout en vet."
        ),
        "samenvatting": (
            "- Demi-Sec = duidelijk zoet (32–50 g/l)\n"
            "- Pairing: dessert, blauwschimmel, foie gras, pittig met zoet element\n"
            "- Wijn-suiker moet gerecht evenaren of overtreffen\n"
            "- Mousse voorkomt plakkerige zoetheidsbeleving\n"
            "- Minder aperitief; meer gastronomisch finaal"
        ),
        "food_pairing": fp(
            "Demi-Sec bij blauwschimmelkaas, foie gras of fruitterrine.",
            "Suiker in wijn en gerecht balanceert; zuur en mousse houden het levend.",
            "Demi-Sec als aperitief zonder food — te zoet, te vermoeiend.",
        ),
        "pro_insight": (
            "Eén Demi-Sec op de kaart voor kaas/dessert verhoogt gemiddelde check meer dan drie extra Brut-flessen."
        ),
        "reflectievraag": (
            "Welk gerecht op je menu vraagt volgens jou Demi-Sec in plaats van “gewoon een zoete wijn” — en welk zuur-mousse-signaal bevestigt dat?"
        ),
    },
    31: {
        "theorie": (
            "Temperatuur is de stille kwaliteitskill in mousserend service. Te koud: aroma's en autolyse dicht, "
            "alleen zuur en koude mousse. Te warm: CO₂ ontsnapt sneller, spanning weg, alcohol dominant.\n\n"
            "Richtlijnen: jonge tankwijn 4–6 °C; standaard brut 6–8 °C; Champagne en gastronomische fles 8–10 °C; "
            "Prestige en gerijpt 10–12 °C. Demi-Sec koeler om zoetheid strak te houden.\n\n"
            "Hoe test je? Zelfde fles op twee temperaturen proeven — verschil in mousse en fruit is leerzaam.\n\n"
            "Wanneer corrigeren? Fles uit ijs na 10 minuten voor top-Champagne; tankwijn direct koel serveren."
        ),
        "samenvatting": (
            "- Te koud remt aroma; te warm kost spanning en frisheid\n"
            "- Jong/tank koeler; complex/fles warmer\n"
            "- Prestige vraagt warmere band voor autolyse-expressie\n"
            "- Temperatuur beïnvloedt mousse-perceptie direct\n"
            "- Meten en bijstellen is professionele standaard"
        ),
        "food_pairing": fp(
            "Zelfde oesterplateau bij 6 °C versus 10 °C Champagne.",
            "Temperatuur-test toont hoe mineraliteit en mousse veranderen met het gerecht.",
            "Ijskoude Prestige — verspilde autolyse bij dure pairing.",
        ),
        "pro_insight": (
            "Zet een thermometer in de kelder, niet in de marketing. Één graad verschil verklaart veel “te zuur”-klachten."
        ),
        "reflectievraag": (
            "Welke fles in je assortiment serveer je waarschijnlijk te koud — en welk aromasignaal zou je na 10 minuten anders moeten proeven?"
        ),
    },
    32: {
        "theorie": (
            "Glaswerk bepaalt hoe mousse en aroma samenkomen. Flute: visuele bubbelshow, beperkte neusontwikkeling. "
            "Witwijnglas/Bourgogne: meer aromatische expressie, betere analyse en gastronomische ervaring. "
            "Coupe: historisch, snel druk- en aromaverlies.\n\n"
            "Waarom verschuift de industrie? Omdat topmousserend meer autolyse en lengte heeft dan schuimshow. "
            "Breder glas = meer reductie-ontwikkeling en complexiteit.\n\n"
            "Wanneer flute? Massa-events en visuele impact. Wanneer witwijnglas? Proeverij, Prestige, pairingmenu."
        ),
        "samenvatting": (
            "- Flute = presentatie; witwijnglas = aroma en analyse\n"
            "- Coupe verliest snel mousse en geur\n"
            "- Glasvorm beïnvloedt gastbeleving en upsell\n"
            "- Prestige verdient breed glas voor autolyse\n"
            "- Consistent glaswerk = consistente kwaliteitsbeoordeling"
        ),
        "food_pairing": fp(
            "Zelfde Champagne in flute versus witwijnglas bij amuse met boter en zeezout.",
            "Breed glas toont of autolyse het gerecht versterkt; flute maskeert die laag.",
            "Coupe bij fine-dining pairing — aromatisch snel dood.",
        ),
        "pro_insight": (
            "Schenk interne proeverijen altijd in witwijnglas; flute alleen voor gastpresentatie als beleid."
        ),
        "reflectievraag": (
            "Welk glas in jouw zaak doet de meeste autolyse-aroma’s tekort — en wat is de service-impact op upsell?"
        ),
    },
    33: {
        "theorie": (
            "Openen is drukbeheer: explosief openen kost CO₂, mousse en kwaliteit. Protocol: folie en muselet los, "
            "duim op kurk, hand op kroon, fles draaien (niet kurk trekken), gecontroleerde “zucht”.\n\n"
            "Waarom professioneel? Veiligheid (kurkprojectiel) én smaak (mousse blijft geïntegreerd). "
            "Na openen: direct schenken of doppen; druk daalt snel in het glas.\n\n"
            "Wanneer trainen? Elke nieuwe medewerker vóór eerste service; fouten zijn zichtbaar aan schuimexplosie."
        ),
        "samenvatting": (
            "- Fles draaien, kurk onder controle; zachte ontluchting\n"
            "- Explosief openen = druk- en mousseverlies\n"
            "- Veiligheid en kwaliteit gaan samen\n"
            "- Direct schenken na openen voor consistente mousse\n"
            "- Techniek is onderdeel van premium service"
        ),
        "food_pairing": fp(
            "Geen pairing — focus op openentechniek vóór eerste schenk.",
            "Mousse in het glas begint bij correct openen.",
            "Knallende fles bij gast — verliest premium context ongeacht gerecht.",
        ),
        "pro_insight": (
            "Laat nieuwe staff eerst een lege fles oefenen met muselet — muscle memory voorkomt knallen onder druk."
        ),
        "reflectievraag": (
            "Hoeveel mousse denk jij dat je verliest bij een harde knal versus een gecontroleerde zucht — en hoe merk je dat in het eerste glas?"
        ),
    },
    34: {
        "theorie": (
            "Bewaren en rijping bepalen of mousserend verbetert of vervalt. Niet alles is voor de kelder: "
            "basis tankwijn en jonge Prosecco zijn voor nu; top Champagne, Vintage en Prestige kunnen jaren winnen.\n\n"
            "Opslag: constant koel (10–12 °C), donker, rustig, liggend, vochtig maar niet nat. Rijping ontwikkelt "
            "brioche, noten, honing; verliest fruit en extreme frisheid. Balans verschuift naar gastronomische diepte.\n\n"
            "Wanneer drinken? NV jong tot medium; Vintage/Presige volgens producent of proef. Te lang = fruit weg, "
            "mousse kan verzachten."
        ),
        "samenvatting": (
            "- Niet elke mousserende wijn is voor lang bewaren\n"
            "- Top flesgisting kan jaren rijpen met autolyse-winst\n"
            "- Koel, donker, liggend, zonder trilling\n"
            "- Rijping: meer autolyse, minder primair fruit\n"
            "- Voorraadsegmenteren: nu vs later"
        ),
        "food_pairing": fp(
            "Jonge NV bij aperitief; 5-jaar Vintage bij gastronomische hoofdgang.",
            "Rijping verhoogt umami-pairing-potential; jonge wijn wint op frisheid bij eerste gang.",
            "Oude Vintage bij lichte citrus-amuse — fruit en frisheid zijn weg.",
        ),
        "pro_insight": (
            "Label je voorraad met “drink nu / 2–5 jaar / bewaar” — anders open je per ongeluk je beste investering te vroeg."
        ),
        "reflectievraag": (
            "Welke fles in je kelder rijpt waarschijnlijk — en welke moet je binnen zes maanden serveren om mousse optimaal te vangen?"
        ),
    },
    35: {
        "theorie": (
            "Oesters en mousserend zijn het klassieke zuur-zout-umami-driehoeksparing. Waarom werkt het? "
            "Hoge zuren snijden door brine; mineraliteit versterkt zee-signatuur; mousse reinigt vet en herhaalt "
            "elke hap zonder vermoeidheid.\n\n"
            "Stijlkeuze: Brut Nature, Extra Brut, Blanc de Blancs voor maximale precisie. Demi-Sec botst met zout. "
            "Temperatuur: niet ijskoud — 8–10 °C laat mineraliteit ademen.\n\n"
            "Wanneer upsellen? Oesterbar = moment voor Prestige of Grand Cru Blanc de Blancs als verhaal."
        ),
        "samenvatting": (
            "- Zout + umami vraagt zuur, mineraliteit en mousse\n"
            "- Droge stijlen winnen; zoete stijlen verliezen\n"
            "- Blanc de Blancs en Brut Nature zijn klassieke match\n"
            "- Mousse reinigt gehemelte tussen oesters\n"
            "- Temperatuur bepaalt of mineraliteit arriveert"
        ),
        "food_pairing": fp(
            "Brut Nature Blanc de Blancs bij Gillardeau of Creuse nr. 2.",
            "Maximale droogte en mineraliteit versterken brine zonder zoetheidsconflict.",
            "Demi-Sec of zoete Prosecco bij oesters — klassieke dosage-fout.",
        ),
        "pro_insight": (
            "Serveer oesters altijd vóór je de Champagne prijs noemt — smaak verkoopt beter dan argumenten."
        ),
        "reflectievraag": (
            "Welk element — zuur, mineraliteit of mousse — zou jij benadrukken als een gast Demi-Sec bij oesters vraagt?"
        ),
    },
    36: {
        "theorie": (
            "Kaas en mousserend zijn vet-zuur-mousse-driehoek. Zachte kaas (Brie, triple crème) vraagt frisse Brut; "
            "harde gerijpte kaas (Comté, Parmezaan) vraagt Vintage of Franciacorta met autolyse; blauwschimmel "
            "kan Demi-Sec verrassen door suiker-zout-balans.\n\n"
            "Intensiteit moet matchen: jonge kaas + jonge wijn; rijpe kaas + rijpe fles. Mousse reinigt vet "
            "zodat umami niet verzwaart.\n\n"
            "Wanneer kaasplateau? Eindgang met één zoete en één droge optie — gast kiest, jij motiveert."
        ),
        "samenvatting": (
            "- Vet vraagt zuur; mousse reinigt\n"
            "- Zachte kaas: frisse Brut; harde kaas: gerijpte flesgisting\n"
            "- Blauwschimmel: soms Demi-Sec voor suiker-zout balans\n"
            "- Intensiteit kaas en wijn moeten gelijk lopen\n"
            "- Kaasplateau is upsell-moment voor Vintage"
        ),
        "food_pairing": fp(
            "NV Brut bij Brie; 5-jaar Vintage bij Comté; Demi-Sec bij Roquefort.",
            "Drie zuur-suiker-niveaus voor drie kaastypes — zo toon je dosage-logica.",
            "Zware blauwschimmel met Brut Nature zonder uitleg — gast ervaart hard zuur.",
        ),
        "pro_insight": (
            "Bouw kaaspairing per intensiteit, niet per land — één rij droog naar zoet op je kaart volstaat."
        ),
        "reflectievraag": (
            "Bij welke kaas op je plank zou Demi-Sec logischer zijn dan een droge rode wijn — en welk zout-vet-signaal bepaalt dat?"
        ),
    },
    37: {
        "theorie": (
            "Mousserend als maaltijdwijn is geen luxe-truc maar structuurlogica: zuur snijdt door gangen heen, "
            "mousse reset het gehemelte, autolyse draagt romige sauzen. Fout: één fles voor alles zonder "
            "dosage- of intensiteitswissel.\n\n"
            "Voorgerecht: droog en mineraal. Hoofdgang: meer body (BdN, Vintage). Kaas: zie module 8. "
            "Dessert: Demi-Sec of zeer zoet afhankelijk van gerecht.\n\n"
            "Wanneer volledig mousserend menu? Wanneer je team dosage en temperatuur beheerst — anders wissel "
            "per gang bewust."
        ),
        "samenvatting": (
            "- Mousserend kan volledige maaltijd dragen met stijlwissel\n"
            "- Droog → rijker → eventueel zoet per gang\n"
            "- Dosage en intensiteit bepalen succes\n"
            "- Mousse maakt herhaalde gangen mogelijk zonder vermoeidheid\n"
            "- Geen enkele fles past elke gang optimaal"
        ),
        "food_pairing": fp(
            "4-gangen: Extra Brut amuse → Brut vis → Vintage gevogelte → Demi-Sec kaas/dessert.",
            "Dosage-escalatie volgt intensiteit; mousse houdt verhaal coherent.",
            "Eén Brut Nature voor heel menu inclusief dessert — structureel onderbemand.",
        ),
        "pro_insight": (
            "Pitch een mousserend menu als “één drukcurve door de avond” — dat klinkt technisch en premium."
        ),
        "reflectievraag": (
            "In een vier-gangenmenu: bij welke gang zou jouw huidige assortiment het zwakst zijn — en welke stijl zou je toevoegen?"
        ),
    },
    38: {
        "theorie": (
            "Champagne versus Cava blind: zelfde methode, ander terroir en druif. Champagne vaak strakkere zuur, "
            "meer krijt/mineraliteit, fijnere mousse, diepere autolyse. Cava vaak rijper fruit, rondere structuur, "
            "Macabeo/Xarel·lo-signatuur.\n\n"
            "Analysevolgorde: mousse → zuurintensiteit → fruitkarakter → autolyse → lengte. "
            "Niet raden op prestige — argumenteren op sensoriek.\n\n"
            "Wanneer Cava wint blind? Rijpe Guarda Superior kan NV-Champagne benaderen op integratie tegen lagere verwachting."
        ),
        "samenvatting": (
            "- Zelfde traditionele methode; verschillend terroir en druif\n"
            "- Champagne: strakker, mineraliger, fijnere mousse\n"
            "- Cava: rijper fruit, rondere zuurlijn\n"
            "- Blind: mousse + zuur + autolyse-cluster\n"
            "- Analyse belangrijker dan correct label"
        ),
        "food_pairing": fp(
            "Blindproef-context: geen pairing — focus op vergelijkende analyse.",
            "Blind module meet methode- en terroir-lezen.",
            "Pairing tijdens blindronde — vervuilt methode-conclusie.",
        ),
        "pro_insight": (
            "Noteer na blind altijd één “bijna-raak” factor — dat is waar je leert, niet bij perfecte scores."
        ),
        "reflectievraag": (
            "Welke ene sensorische factor gaf bij je laatste Champagne-vs-Cava blind de doorslag — en had je die vóór de proef verwacht?"
        ),
    },
    39: {
        "theorie": (
            "Traditioneel versus tank blind is de kern-Master-skill. Traditioneel: fijne mousse, brioche/toast, "
            "complexiteit, langere afdronk. Tank: primair fruit, directe stijl, minder autolyse, kortere afdronk.\n\n"
            "Autolyse is vaak de snelste hint — maar check mousse en structuur ter bevestiging. "
            "Prosecco is niet de enige tankwijn; context helpt.\n\n"
            "Fout bij blind: te snel naar druif; juist: methode eerst, regio daarna."
        ),
        "samenvatting": (
            "- Traditioneel = autolyse + fijne mousse + lengte\n"
            "- Tank = primair fruit + directe mousse\n"
            "- Autolyse is primaire blindhint\n"
            "- Structuur bevestigt methode-hypothese\n"
            "- Methode vóór regio in conclusie"
        ),
        "food_pairing": fp(
            "Blindproef-context: twee onbekende glazen, geen food.",
            "Methode-herkenning vraagt neutrale proefomstandigheden.",
            "Rijke pairing tijdens methode-blind — maskeert autolyse-signaal.",
        ),
        "pro_insight": (
            "Als je twijfelt tussen tank en traditioneel: kies traditioneel bij lengte >5 seconden — vaak correct."
        ),
        "reflectievraag": (
            "Bij twijfel tussen brioche en rijp peer: welke extra check — mousse of afdronk — gebruik jij om de methode te bevestigen?"
        ),
    },
    40: {
        "theorie": (
            "Dit Master-examen integreert de volledige track: fundamente, productie, proeven, Champagne, "
            "wereldstijlen, dosage, service, pairing en blindanalyse. Waarom drie onderdelen? Theorie toetst "
            "kennis; blind toetst sensorische methode; pairing toetst professioneel advies onder druk.\n\n"
            "Succes vraagt: vaste proefvolgorde; dosage- en methode-hypotheses met argumenten; "
            "servicebewustzijn (temperatuur, glas); pairing per intensiteit en suiker. "
            "Fouten clusteren rond haast, verkeerde temperatuur en dosage-verwarring.\n\n"
            "Bereid je voor met twee blinde sets per week en één schriftelijke pairing-case — "
            "dat dekt 90% van het examenpatroon."
        ),
        "food_pairing": fp(
            "Examenonderdeel 3: kies per gerecht stijl op zuur, mousse, dosage en intensiteit.",
            "Pairing-examen test advieslogica, niet memoriseren van merken.",
            "Eén mousserende stijl voor alle drie gerechten — toont geen dosage-inzicht.",
        ),
        "pro_insight": (
            "Lees examenvragen als servicecases: wat zou je schenken vrijdag 20:00 met deze gast en dit gerecht?"
        ),
        "reflectievraag": (
            "Welk examenonderdeel — theorie, blind of pairing — is jouw zwakste schakel, en welke ene weekroutine zou dat het meest verkleinen?"
        ),
    },
}
