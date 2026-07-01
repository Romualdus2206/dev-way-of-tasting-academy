"""Red Wine Track V2 — Premium Gold Master repair data.

Lessen 11–25 (Modules 3–5):
- Module 3 — Proeven (11–15)
- Module 4 — Lichte rode druiven (16–20): Pinot Noir, Gamay, Grenache, Cinsault, Mencía
- Module 5 — Medium body druiven (21–25): Merlot, Sangiovese, Tempranillo, Barbera, Zinfandel

Structuur per les (zelfde patroon als de wit_v2/wine_v2 m3_m5 repair-data):
- theorie, samenvatting, pro_insight, kernbegrippen (5 items)
- food_pairing (alleen 16–25) via fp()
- reflectievraag en quiz_patches zijn optioneel per les
- LES 15 is de integratie-toets van Module 1–3 en bevat aanvullend een
  volledige praktijkopdracht (praktijk), een volledig vervangen quiz
  (quiz_full, 10 vragen) en quiz_feedback
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
            "Het proefprotocol voor rode wijn volgt dezelfde basisvolgorde als bij elke wijn — "
            "visueel, neus, mond, conclusie — maar de nadruk binnen die volgorde verschuift sterk "
            "ten opzichte van witte wijn. Bij rood is tannine vrijwel altijd aanwezig en neemt het "
            "de centrale structuurrol over die bij wit aan zuur toevalt. Wie dat niet beseft, proeft "
            "rood als 'wit met meer kleur' in plaats van als een eigen structuurwereld waarin "
            "tannine, zuur, alcohol en body samen de balans bepalen.\n\n"
            "Visueel let je bij rood vooral op de rand van de wijn, niet op een intensiteitsschaal "
            "zoals bij wit: een paarse, violette rand wijst op jeugd, een granaat- of "
            "baksteenachtige rand wijst op leeftijd of versnelde oxidatie. Kleurdiepte in de kern "
            "hangt daarnaast af van schildikte en extractie — een dunschillige druif kan intens "
            "tannine bevatten zonder ooit een diepe kleur te tonen.\n\n"
            "Bij de neus ruik je bewust twee keer — eerst het stilstaande glas, dan na swirlen — "
            "omdat de aroma's van rode wijn zwaarder aan polyfenolen en tannine gebonden zitten dan "
            "bij wit en dus meer beweging nodig hebben om zich te openen. Primair fruit komt uit de "
            "schil, secundaire tonen uit fermentatie en hout, tertiaire tonen uit de langzame "
            "polymerisatie van tannine en kleurstof tijdens rijping.\n\n"
            "In de mond doorloop je een vaste volgorde: eerst zuur (frisheid, speekselopwekking), "
            "dan tannine (droogte op tandvlees en wangen), dan alcohol (warmte), dan body, en pas "
            "daarna de balans tussen die vier. Tannine is precies de as die bij witte wijn ontbreekt "
            "en die bij rood het verschil maakt tussen een oordeel dat klopt en een oordeel dat te "
            "vroeg wordt getrokken — zeker als voorbereiding op de druivenherkenning in Module 4 en "
            "5."
        ),
        "samenvatting": (
            "- Protocol blijft visueel, neus, mond, conclusie — de nadruk verschuift naar tannine\n"
            "- Bij rood is de rand het belangrijkste visuele signaal, niet een intensiteitsschaal\n"
            "- Kleurdiepte hangt af van schildikte en extractie, los van tannine-intensiteit\n"
            "- Ruik twee keer: rode aroma's zitten zwaarder gebonden aan tannine dan witte\n"
            "- Mondproef volgt vaste volgorde: zuur, tannine, alcohol, body, dan balans"
        ),
        "pro_insight": (
            "Voeg tannine toe als apart checklist-item ná zuur en vóór alcohol: door die twee "
            "bewust te scheiden voorkom je dat een hoog zuur een zwakke tannine verdoezelt, of "
            "omgekeerd."
        ),
        "kernbegrippen": [
            "rood-proefprotocol",
            "randanalyse rood",
            "tannine als structuuras",
            "tweefasen-ruiken rood",
            "zuur-tannine-alcohol-lichaamsvolgorde",
        ],
        "reflectievraag": (
            "Op welk moment sla jij de aparte tanninecheck nog over — en welke verkeerde "
            "stijlinschatting levert dat je meestal op?"
        ),
    },
    12: {
        "theorie": (
            "Kleur is bij rode wijn een rand-versus-kern-analyse in plaats van de lineaire "
            "intensiteitsschaal die je bij witte wijn gebruikt. De rand van het glas vertelt vooral "
            "iets over leeftijd, de kern vooral iets over druif en extractie — en die twee moet je "
            "bewust apart lezen om geen verkeerde hypothese te vormen.\n\n"
            "Een paarse of violette rand wijst op een jonge wijn; naarmate de wijn ouder wordt "
            "verschuift de rand via robijnrood naar granaat en uiteindelijk baksteen of oranje. Die "
            "overgang ontstaat doordat antocyanen (kleurstoffen) geleidelijk polymeriseren met "
            "tannine en neerslaan, waardoor de kleur letterlijk vervaagt aan de rand terwijl de kern "
            "nog relatief diep kan blijven.\n\n"
            "Kleurdiepte in de kern hangt sterk af van schildikte en extractie, niet uitsluitend van "
            "de druif of de leeftijd: dikschillige druiven zoals Cabernet Sauvignon of Syrah geven "
            "van nature diepe kleur, terwijl dunschillige druiven zoals Pinot Noir opvallend licht "
            "kunnen blijven — met Nebbiolo als het meest verraderlijke uiterste, omdat deze druif "
            "ondanks een lichte kleur juist extreem hoge tannine bevat. Langere of intensievere "
            "extractie (langere maceratie, pigeage, remontage) verdiept de kleur bovendien "
            "onafhankelijk van de druif zelf.\n\n"
            "Gebruik kleur dus altijd als eerste hypothese, nooit als eindoordeel: kantel het glas "
            "tegen een witte achtergrond, beoordeel eerst de rand, dan de kern, zonder aan het "
            "etiket te denken, en laat de neus en de mond die hypothese bevestigen of ontkrachten."
        ),
        "samenvatting": (
            "- Bij rood lees je kleur als rand-versus-kern, niet als één lineaire schaal\n"
            "- De rand loopt van paars (jong) via robijn naar granaat en baksteen (ouder)\n"
            "- Kleurdiepte in de kern hangt af van schildikte en extractie, niet alleen leeftijd\n"
            "- Dunschillige druiven zoals Nebbiolo kunnen licht zijn met toch extreem hoge tannine\n"
            "- Kleur is een hypothese die de neus en mond nog moeten bevestigen"
        ),
        "pro_insight": (
            "Beoordeel de rand en de kern altijd apart en vóór je aan de druif denkt: een lichte "
            "kern met hoge tannine is het eerste signaal dat je met een dunschillige, maar "
            "tanninerijke druif te maken kunt hebben."
        ),
        "kernbegrippen": [
            "rand-versus-kernanalyse",
            "paars-naar-baksteenovergang",
            "extractiediepte",
            "dunschillig-versus-dikschillig",
            "kleurhypothese rood",
        ],
        "reflectievraag": (
            "Welke rode wijn op jouw kaart zou jij nu opnieuw beoordelen door de rand apart van de "
            "kern te bekijken, los van wat je al over de druif weet?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een rode wijn heeft een lichte kleur maar een opvallend hoge, grove tannine-intensiteit. "
            "Wat is de meest waarschijnlijke verklaring?\n\n"
            "A. De wijn is zeer oud\n"
            "B. Een dunschillige druif met van nature hoge tannine, zoals Nebbiolo ✅\n"
            "C. Onvoldoende extractie tijdens de gisting\n"
            "D. Overmatige houtrijping\n\n"
        ),
    },
    13: {
        "theorie": (
            "Bij rode wijn is de aromalaag rijker en donkerder van karakter dan bij wit, omdat "
            "schilcontact niet alleen kleur en tannine extraheert maar ook fenolische aromastoffen "
            "die bij directe persing grotendeels achterblijven. Primair fruit is daardoor bij rood "
            "zwaarder en diverser dan bij wit.\n\n"
            "Primaire aroma's komen uit de druif en de schil: rood fruit (kers, aardbei, framboos) "
            "domineert bij lichtere, dunschillige druiven zoals Pinot Noir of Gamay, terwijl zwart "
            "fruit (bosbes, braam, pruim) en kruidige tonen (peper, laurier) horen bij dikkerschillige "
            "of warmklimaat-druiven zoals Syrah of Zinfandel.\n\n"
            "Secundaire aroma's ontstaan door wijnmaakkeuzes: vanille, kokos, toast, rook en "
            "kruidnagel door houtrijping. Boter en room, die bij witte wijn zo bepalend zijn voor "
            "stijl, komen bij rood zelden dominant naar voren, omdat malolactische gisting bij "
            "rode wijn vrijwel altijd standaardpraktijk is in plaats van een bewuste stijlkeuze.\n\n"
            "Tertiaire aroma's — leer, tabak, natte aarde, paddenstoel, gedroogd fruit — ontstaan "
            "door de langzame polymerisatie van tannine en antocyanen tijdens rijping, een proces "
            "dat bij rode wijn veel explicieter en diverser verloopt dan bij witte wijn, waar vooral "
            "honing, petrol of toast domineren. De verhouding tussen rood en zwart fruit, en de "
            "aanwezigheid van dierlijke of aardse tertiaire tonen, stuurt direct je "
            "druivenhypothese in Module 4 en 5."
        ),
        "samenvatting": (
            "- Schilcontact maakt de primaire aromalaag bij rood rijker dan bij wit\n"
            "- Rood fruit hoort bij lichtere druiven, zwart fruit bij dikkerschillige/warmere druiven\n"
            "- MLF is bij rood standaardpraktijk, dus boter/room domineert zelden zoals bij wit\n"
            "- Tertiaire tonen (leer, tabak, aarde) ontstaan door tannine-antocyaanpolymerisatie\n"
            "- De rood-versus-zwartfruitverhouding stuurt je druivenhypothese direct"
        ),
        "pro_insight": (
            "Ruik bewust op de verhouding tussen rood en zwart fruit, niet alleen op losse "
            "descriptors — die verhouding alleen al scheidt de lichte druiven van Module 4 van de "
            "medium body druiven van Module 5."
        ),
        "kernbegrippen": [
            "rood-versus-zwartfruitspectrum",
            "tannine-antocyaanpolymerisatie",
            "dierlijke tertiaire tonen",
            "MLF bij rood als standaard",
            "aromaverhouding rood",
        ],
        "reflectievraag": (
            "Bij welke rode wijn verwarde jij laatst een tertiair aroma (bijvoorbeeld leer) met een "
            "primair kenmerk van de druif zelf?"
        ),
    },
    14: {
        "theorie": (
            "Tannine is het structuurelement dat rode wijn het meest onderscheidt van witte wijn: "
            "het is geen aroma maar een tactiele sensatie (astringentie) die ontstaat doordat "
            "polyfenolen binden aan speekseleiwitten, waardoor de mond een droog, grijpend gevoel "
            "krijgt.\n\n"
            "Tannine komt uit drie bronnen die elk een eigen textuur geven: schiltannine is het "
            "fijnste en meest polijstbare, pittannine is grover en bitterder en ontstaat vooral bij "
            "te agressieve extractie van de pitten, en houttannine — uit vat of steel — is vaak "
            "droger en kruidiger. Het aandeel van elke bron bepaalt of een wijn zijdeachtig of "
            "schurend aanvoelt.\n\n"
            "Met leeftijd polymeriseren tanninemoleculen tot langere ketens die uiteindelijk "
            "gedeeltelijk neerslaan als sediment. Dat verklaart waarom een jonge, agressieve wijn na "
            "jaren rijping zachter en ronder aanvoelt zonder dat het totale tanninegehalte wezenlijk "
            "afneemt — de structuur verandert, niet de hoeveelheid.\n\n"
            "Beoordeel tannine objectief door te letten op droogte op tandvlees en wangen, de 'grip' "
            "op de tong, en hoelang die droogte aanhoudt na doorslikken. Vergelijk fijnkorrelig en "
            "zijdeachtig (zoals bij goede Pinot Noir) met grofkorrelig en schurend (zoals bij jonge "
            "Nebbiolo of onrijpe Cabernet Sauvignon). Diezelfde tannine-eiwitbinding is ook de basis "
            "van de klassieke vlees-pairing: eiwit en vet in vlees binden tannine en verzachten de "
            "astringentie, waardoor de wijn ronder aanvoelt."
        ),
        "samenvatting": (
            "- Tannine is een tactiele sensatie (astringentie), geen aroma\n"
            "- Schiltannine is fijn, pittannine is grof en bitter, houttannine is droog en kruidig\n"
            "- Met leeftijd polymeriseert tannine en slaat deels neer, waardoor de wijn zachter wordt\n"
            "- Beoordeel tannine op droogte, grip en de duur daarvan na het doorslikken\n"
            "- Tannine-eiwitbinding in vlees verzacht astringentie en verklaart de klassieke pairing"
        ),
        "pro_insight": (
            "Vraag jezelf bij elke rode wijn af: komt deze tannine vooral van de schil, de pitten of "
            "het hout? Dat onderscheid voorkomt dat je grove pittannine verwart met een structuurrijke "
            "druif."
        ),
        "kernbegrippen": [
            "tannine-eiwitbinding",
            "schil-versus-pittanninen",
            "tanninepolymerisatie",
            "fijnkorrelig-versus-grofkorrelig",
            "astringentiemeting",
        ],
        "reflectievraag": (
            "Welke rode wijn op jouw lijst zou je nu herclassificeren nadat je de tanninebron (schil, "
            "pit of hout) apart hebt beoordeeld?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een wijnmaker wil zachtere, meer gepolijste tannine bereiken zonder in te leveren op "
            "kleurdiepte. Welke aanpassing helpt daarbij het meest?\n\n"
            "A. Langere maceratie met intensief pitcontact\n"
            "B. Voorzichtige extractie gericht op schiltannine, met minimaal pitcontact ✅\n"
            "C. Uitsluitend Amerikaans eikenhout gebruiken\n"
            "D. Volledig stoppen met schilcontact\n\n"
        ),
    },
    15: {
        "theorie": (
            "Deze mini-toets bundelt alles wat rode wijn technisch en proefmatig uniek maakt: "
            "schilcontact en extractie als productiebasis, kleur als rand-en-kernhypothese, de drie "
            "aromalagen, en tannine als de centrale structuuras die je tot nu toe hebt leren "
            "beoordelen. Elk van deze vier elementen verklaart een andere laag van dezelfde wijn, en "
            "pas samen leveren ze een betrouwbare stijlhypothese op.\n\n"
            "Schilcontact en extractie bepalen het startpunt: tijdens maceratie (koude weking, "
            "gisting op de schillen, eventueel post-fermentatieve maceratie) worden antocyanen "
            "(kleurstoffen) en tannine gelijktijdig geëxtraheerd. Langere of intensievere extractie "
            "— via pigeage of remontage — geeft een diepere kleur én meer tannine, onafhankelijk van "
            "de druif zelf. Dat is de reden waarom kleurdiepte alléén nooit een betrouwbare "
            "druifindicator is.\n\n"
            "Kleur is daarna de eerste visuele hypothese, gelezen als rand-en-kern: een paarse rand "
            "wijst op jeugd, een granaat- of baksteenachtige rand op leeftijd of oxidatie, terwijl de "
            "kerndiepte meer zegt over schildikte en extractie dan over leeftijd — een hypothese die "
            "de neus en de mond nog moeten bevestigen.\n\n"
            "Aroma en tannine vormen samen de resterende twee lagen: primair fruit (uit de schil), "
            "secundaire tonen (uit wijnmaak en hout) en tertiaire tonen (uit rijping, via "
            "tannine-antocyaanpolymerisatie) geven de aromatische kant, terwijl tannine zelf een "
            "aparte tactiele as is met bronnen in schil, pit en hout die met leeftijd polymeriseert "
            "en zachter wordt. Het blinde protocol brengt dit samen in vaste volgorde: kleur "
            "(rand, kern), aroma (primair versus secundair/tertiair), structuur (zuur, tannine, "
            "alcohol, body, lengte), en pas daarna een stijlhypothese. Documenteer die hypothese "
            "vóór de onthulling — dat is de enige manier om objectief te toetsen of je protocol "
            "standhoudt zonder etiket."
        ),
        "samenvatting": (
            "- Schilcontact en extractie zijn het productiestartpunt: kleur én tannine tegelijk\n"
            "- Kleur lees je als rand-en-kern: rand toont leeftijd, kern toont schildikte/extractie\n"
            "- Aroma kent drie lagen: primair (schil), secundair (wijnmaak), tertiair (rijping)\n"
            "- Tannine is een aparte tactiele as met bronnen in schil, pit en hout\n"
            "- Het blinde protocol volgt vaste volgorde: kleur, aroma, structuur, stijlhypothese"
        ),
        "pro_insight": (
            "Documenteer bij elke blinde rode wijn eerst je stijlhypothese — licht en fris of "
            "structuurrijk en warm — vóór je nadenkt over een specifieke druif. Dat voorkomt dat je "
            "te snel naar een naam raadt zonder de onderliggende structuur te checken."
        ),
        "kernbegrippen": [
            "schilcontact-extractiekoppeling",
            "rand-en-kernkleuranalyse",
            "drielagen-aromamodel rood",
            "tannine als centrale as",
            "blind rood-protocol",
        ],
        "reflectievraag": (
            "Welke van de vier elementen — extractie, kleur, aroma of tannine — vergeet jij het "
            "vaakst mee te wegen vóór je een conclusie trekt over een rode wijn?"
        ),
        "praktijk": (
            "### Opdracht\n\n"
            "Proef één rode wijn volledig blind (laat het etiket door iemand anders verbergen). "
            "Doorloop het volledige protocol zonder te gokken op een merknaam: beschrijf eerst de "
            "rand en de kern van de kleur apart, dan aroma (primair versus secundair/tertiair), dan "
            "structuur (zuur, tannine, alcohol, body, lengte), en formuleer pas daarna een "
            "stijlhypothese — licht en fris of structuurrijk en warm — inclusief een vermoeden over "
            "de tanninebron (schil, pit of hout). Onthul de wijn pas na het opschrijven van je "
            "hypothese.\n\n"
            "### Checklist\n\n"
            "- Ik heb de rand en de kern apart beschreven vóór ik aan de druif dacht\n"
            "- Ik heb primaire, secundaire en tertiaire aroma's apart benoemd\n"
            "- Ik heb zuur en tannine apart beoordeeld, niet als één geheel\n"
            "- Ik heb de tanninekorrel omschreven als fijn of grof\n"
            "- Ik heb mijn stijlhypothese opgeschreven vóór de onthulling\n"
            "- Ik heb achteraf mijn grootste denkfout in één zin vastgelegd"
        ),
        "quiz_full": (
            "### Vraag 1\n\n"
            "Waarom worden bij rode wijn de schillen tijdens de vergisting in contact gehouden met "
            "het sap?\n\n"
            "A. Om het alcoholpercentage te verlagen\n"
            "B. Om kleurstoffen en tannine te extraheren ✅\n"
            "C. Om de zuurgraad te verhogen\n"
            "D. Om het suikergehalte te verhogen\n\n"
            "### Vraag 2\n\n"
            "Je proeft een wijn met een paarse, violette rand. Wat concludeer je het eerst?\n\n"
            "A. De wijn is waarschijnlijk oud\n"
            "B. De wijn is waarschijnlijk relatief jong ✅\n"
            "C. De wijn heeft veel houtrijping gehad\n"
            "D. De wijn is versterkt\n\n"
            "### Vraag 3\n\n"
            "Een wijn heeft een opvallend lichte kleur maar extreem hoge, grove tannine. Welke "
            "druif past hier het beste bij, en waarom is dit verrassend?\n\n"
            "A. Merlot, omdat Merlot altijd licht van kleur is\n"
            "B. Nebbiolo, omdat lichte kleur bij deze druif niet wijst op lage tannine ✅\n"
            "C. Zinfandel, omdat Zinfandel altijd licht van kleur is\n"
            "D. Grenache, omdat Grenache nooit tannine bevat\n\n"
            "### Vraag 4\n\n"
            "Je ruikt leer, tabak en natte aarde in een gerijpte rode wijn. In welke aromalaag hoort "
            "dit?\n\n"
            "A. Primair\n"
            "B. Secundair\n"
            "C. Tertiair ✅\n"
            "D. Geen van deze\n\n"
            "### Vraag 5\n\n"
            "Wat is het belangrijkste verschil tussen schiltannine en pittannine?\n\n"
            "A. Schiltannine is grover en bitterder dan pittannine\n"
            "B. Pittannine is grover en bitterder dan schiltannine ✅\n"
            "C. Beide zijn identiek van structuur\n"
            "D. Pittannine komt alleen voor bij witte wijn\n\n"
            "### Vraag 6\n\n"
            "Waarom wordt een jonge, agressief tanninerijke rode wijn na jaren rijping vaak zachter, "
            "zonder dat het tanninegehalte daalt?\n\n"
            "A. Tannine verdampt met de tijd\n"
            "B. Tanninemoleculen polymeriseren tot langere ketens en slaan deels neer ✅\n"
            "C. Zuur neutraliseert tannine volledig\n"
            "D. Alcohol breekt tannine chemisch af\n\n"
            "### Vraag 7\n\n"
            "Wat is de juiste volgorde van het blinde rode-wijnprotocol?\n\n"
            "A. Aroma, structuur, kleur, hypothese\n"
            "B. Kleur, aroma, structuur, hypothese ✅\n"
            "C. Structuur, kleur, aroma, hypothese\n"
            "D. Hypothese, structuur, kleur, aroma\n\n"
            "### Vraag 8\n\n"
            "Hoe test je tannine het meest objectief?\n\n"
            "A. Door te letten op zoetheid op de tongpunt\n"
            "B. Door te letten op droogte en grip op tandvlees en wangen ✅\n"
            "C. Door de kleur van de wijn te beoordelen\n"
            "D. Door het alcoholpercentage te schatten\n\n"
            "### Vraag 9\n\n"
            "Een wijnmaker verlengt de maceratietijd en past intensievere pigeage toe. Wat is het "
            "meest directe effect, los van de druif zelf?\n\n"
            "A. Minder kleur en minder tannine\n"
            "B. Meer kleur en meer tannine ✅\n"
            "C. Een hoger suikergehalte\n"
            "D. Een lager alcoholpercentage\n\n"
            "### Vraag 10\n\n"
            "Blind: paarse rand, diepe kleur, rijp zwart fruit, hoge en grove tannine, hoog alcohol. "
            "Welke stijlhypothese past het beste?\n\n"
            "A. Jonge, structuurrijke rode wijn uit een warm klimaat ✅\n"
            "B. Oude, lichte rode wijn uit een koel klimaat\n"
            "C. Witte wijn met schilcontact\n"
            "D. Versterkte wijn zonder gisting\n\n"
        ),
        "quiz_feedback": (
            "Sterk gewerkt. Je hebt nu de kern van rode wijn geïntegreerd: schilcontact en extractie "
            "als productiebasis, rand-en-kernanalyse als eerste kleurhypothese, de drie aromalagen, "
            "en tannine als de centrale structuuras met eigen bronnen en rijpingsgedrag. Dat "
            "fundament gebruik je in Module 4 en 5 om lichte en medium body rode druiven blind van "
            "elkaar te onderscheiden."
        ),
    },
    # ------------------------------------------------------------------
    # Module 4 — Lichte rode druiven (16–20) — food_pairing verplicht
    # ------------------------------------------------------------------
    16: {
        "theorie": (
            "Pinot Noir is een van de meest terroir- en klimaatgevoelige druiven ter wereld: de "
            "dunne schil vraagt een koel tot matig klimaat, zoals Bourgogne, de Willamette Valley in "
            "Oregon, Central Otago in Nieuw-Zeeland, of Duitsland waar de druif Spätburgunder heet. "
            "In een te warm klimaat wordt Pinot Noir overrijp en jammy en verliest de druif zijn "
            "precisie; in een te koud klimaat blijft het fruit groen en onrijp.\n\n"
            "Ondanks de dunne schil kan tannine bij goede Bourgogne fijnkorrelig en zijdeachtig zijn, "
            "maar het niveau blijft over het geheel laag tot medium. Zuur is hoog en draagt hier "
            "zwaarder aan de structuur dan bij dikkerschillige druiven. Het bewaarpotentieel van "
            "topwijnen (Grand Cru Bourgogne) kan decennia bedragen dankzij die hoge zuur, ondanks de "
            "lage tannine — een uitzondering op de vuistregel dat bewaarpotentieel vooral aan "
            "tannine hangt.\n\n"
            "Blindproefmarkers zijn: een lichte kleur met een paarse tot robijnen rand, hoge zuur, "
            "lage-tot-medium fijne tannine, rood fruit (kers, aardbei, framboos) en bij rijping "
            "bosgrond of paddenstoel. Het grootste verwarringsgevaar is Nebbiolo: beide druiven "
            "kunnen verrassend licht van kleur zijn, maar Nebbiolo verbergt achter die lichte kleur "
            "juist extreem hoge, grove tannine en hoge zuur — de 'Nebbiolo-paradox'. Test daarom "
            "nooit op kleur alleen: proef de tannine apart; Pinot Noir blijft zijdeachtig en laag, "
            "Nebbiolo is agressief droog ondanks de lichte kleur.\n\n"
            "Serveer Pinot Noir iets koeler dan andere rode wijn (14–16°C) in een breed, bolvormig "
            "glas dat de subtiele aroma's concentreert zonder de precisie te verliezen."
        ),
        "samenvatting": (
            "- Pinot Noir is extreem klimaatgevoelig: koel tot matig klimaat is noodzakelijk\n"
            "- Tannine blijft laag tot medium maar fijnkorrelig; zuur draagt zwaar aan de structuur\n"
            "- Hoge zuur geeft topwijnen decennialang bewaarpotentieel ondanks lage tannine\n"
            "- Blindproefmarkers: lichte kleur, hoge zuur, fijne tannine, rood fruit, bosgrond\n"
            "- Grootste verwarringsgevaar is Nebbiolo door de 'Nebbiolo-paradox': licht van kleur, "
            "extreem hoge tannine"
        ),
        "food_pairing": fp(
            "Pinot Noir bij eend met paddenstoelensaus of een risotto met wilde zwammen.",
            "De hoge zuur van Pinot Noir snijdt door het vet van eend, terwijl de aardse umami van "
            "paddenstoelen resoneert met de bosgrond- en paddenstoeltonen van gerijpte Pinot Noir.",
            "Pinot Noir bij zeer pittige of sterk gekruide gerechten — de subtiele aromatiek van de "
            "druif verdwijnt volledig tegen dominante specerijen.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Pinot Noir en Nebbiolo: negeer de kleur volledig en proef alleen de "
            "tannine-intensiteit. Blijft die zijdeachtig en laag, dan is het Pinot Noir; is die "
            "agressief droog en grof, dan is het Nebbiolo."
        ),
        "kernbegrippen": [
            "Pinot Noir",
            "Nebbiolo-kleurparadox",
            "fijnkorrelige tannine",
            "Bourgogne-terroirgevoeligheid",
            "zuurgedreven bewaarpotentieel",
        ],
        "reflectievraag": (
            "Zou jij een lichtgekleurde rode wijn nu nog steeds automatisch als 'licht van smaak' "
            "bestempelen, of proef je eerst de tannine apart?"
        ),
    },
    17: {
        "theorie": (
            "Gamay is de druif van Beaujolais, waar granieten bodems en een matig-koel klimaat "
            "zorgen voor snelle rijping met behoud van frisheid. De tien Beaujolais Crus — waaronder "
            "Morgon, Fleurie en Moulin-à-Vent — tonen dat Gamay met de juiste bodem en het juiste "
            "klimaat verrassend serieus kan worden, ver voorbij het imago van simpele feestwijn.\n\n"
            "Carbonic maceratie is de sleuteltechniek: hele druiventrossen gisten intracellulair "
            "onder een laag CO2, wat nauwelijks tannine uit de schil extraheert maar wel intense, "
            "directe fruitesters (banaan, kersendrop) oplevert. Dat verklaart waarom basis-Beaujolais "
            "zo laag in tannine en zo direct drinkbaar is. Cru-Beaujolais, vaak deels traditioneel "
            "gevinifieerd, heeft meer tannine en structuur en kan enkele jaren rijpen; basis-"
            "Beaujolais en zeker Beaujolais Nouveau hebben nauwelijks bewaarpotentieel.\n\n"
            "Blindproefmarkers zijn: een zeer lichte kleur, hoge zuur, lage tannine, en de "
            "kenmerkende banaan- of kersendropester van carbonic maceratie. Het verwarringsgevaar "
            "met Pinot Noir is reëel omdat beide licht en fris zijn, maar Gamay mist de bosgrond- en "
            "paddenstoeltonen die Pinot Noir bij rijping ontwikkelt en toont een directere, minder "
            "complexe fruitexpressie; de banaanester is bij Pinot Noir bovendien vrijwel afwezig.\n\n"
            "Serveer basis-Beaujolais licht gekoeld (12–14°C, kouder dan de meeste rode wijn) om de "
            "frisheid te accentueren; Cru-Beaujolais verdient een iets hogere temperatuur (15–16°C) "
            "om de extra structuur te tonen."
        ),
        "samenvatting": (
            "- Beaujolais' granieten bodems en matig-koel klimaat geven Gamay frisheid en snelheid\n"
            "- Carbonic maceratie extraheert weinig tannine maar geeft intense banaan/kersendropester\n"
            "- Cru-Beaujolais heeft meer structuur en bewaarpotentieel dan basis-Beaujolais\n"
            "- Blindproefmarkers: zeer lichte kleur, hoge zuur, lage tannine, banaanester\n"
            "- Verwarringsgevaar met Pinot Noir; Gamay mist de bosgrond/paddenstoeltonen bij rijping"
        ),
        "food_pairing": fp(
            "Licht gekoelde Gamay bij een charcuterieplank of eenvoudige bistrogerechten zoals een "
            "lichte coq au vin.",
            "De lage tannine en hoge zuur matchen qua intensiteit met lichte, zoute gerechten zonder "
            "de wijn te overweldigen, terwijl het zuur de vetheid van charcuterie doorbreekt.",
            "Gamay bij zware, romige stoofschotels — de wijn is qua intensiteit te licht om daar "
            "tegenop te wegen en verdwijnt volledig.",
        ),
        "pro_insight": (
            "Ruik bewust op de banaan- of kersendropester bij twijfel tussen Gamay en Pinot Noir — "
            "die noot is het meest betrouwbare signaal van carbonic maceratie en dus van Gamay."
        ),
        "kernbegrippen": [
            "Gamay",
            "carbonic maceratie",
            "Beaujolais Cru-versus-basisonderscheid",
            "banaanester",
            "Gamay-Pinot Noir-verwarring",
        ],
        "reflectievraag": (
            "Zou jij Cru-Beaujolais nu serieuzer behandelen dan basis-Beaujolais, en op welk kenmerk "
            "zou je dat onderscheid baseren?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Je proeft een zeer lichte, laagtanninige rode wijn met een opvallende banaan- en "
            "kersendropgeur. Welke techniek verklaart dit het beste?\n\n"
            "A. Lange vatrijping\n"
            "B. Carbonic maceratie ✅\n"
            "C. Koude weking\n"
            "D. Micro-oxygenatie\n\n"
        ),
    },
    18: {
        "theorie": (
            "Grenache gedijt in hete, droge klimaten met veel zonuren — Châteauneuf-du-Pape, Priorat "
            "en delen van Australië (in GSM-blends) laten zien hoe de druif in warmte rijp fruit en "
            "hoog alcohol ontwikkelt. In koelere omstandigheden blijft Grenache dun en weinig "
            "expressief, wat verklaart waarom de druif zelden op eigen kracht in koele klimaten "
            "wordt geplant.\n\n"
            "Grenache heeft van nature laag-tot-medium, zachte tannine en relatief laag zuur — een "
            "combinatie die de wijn snel toegankelijk maakt maar het bewaarpotentieel beperkt tenzij "
            "hij wordt gecombineerd met structuurdruiven. Daarom wordt Grenache in de klassieke "
            "GSM-blend (Grenache-Syrah-Mourvèdre) gecombineerd met Syrah voor kleur, peper en "
            "tannine, en met Mourvèdre voor structuur en aardsheid: Grenache levert het rijpe fruit "
            "en de alcohol, de andere twee leveren het geraamte.\n\n"
            "Blindproefmarkers zijn: hoog alcohol, laag-medium zuur, zachte tannine, rijp rood fruit "
            "(framboos, aardbeienjam) met kruidige garrigue-ondertonen (laurier, tijm). Het "
            "grootste verwarringsgevaar is Zinfandel: beide zijn warme-klimaat, hoog-alcohol, jammy "
            "druiven, maar Grenache heeft doorgaans een subtielere, kruidige garrigue-ondertoon "
            "terwijl Zinfandel explicieter naar zwart fruit en zwarte peper neigt met vaak nog hoger "
            "alcohol.\n\n"
            "Serveer Grenache-gedomineerde wijnen matig gekoeld (15–17°C) in een breed glas dat het "
            "alcohol laat verdampen en de kruidige, aardse garrigue-ondertonen naar boven brengt."
        ),
        "samenvatting": (
            "- Grenache gedijt in hete, droge klimaten en levert rijp fruit met hoog alcohol\n"
            "- Van nature laag-medium zachte tannine en laag zuur beperkt het bewaarpotentieel solo\n"
            "- In de GSM-blend levert Grenache fruit en alcohol, Syrah en Mourvèdre het geraamte\n"
            "- Blindproefmarkers: hoog alcohol, laag zuur, zachte tannine, garrigue-kruidigheid\n"
            "- Grootste verwarringsgevaar is Zinfandel, dat explicieter zwarte peper en fruit toont"
        ),
        "food_pairing": fp(
            "Grenache-gedomineerde wijn bij lamsschouder met Provençaalse kruiden of een Marokkaanse "
            "lamstajine.",
            "Het hoge alcohol en de zachte tannine matchen de rijkdom van het vette lamsvlees, terwijl "
            "de kruidige garrigue-toon de kruiden in het gerecht spiegelt en het zout in de tajine de "
            "vruchtrijkdom van de wijn accentueert.",
            "Grenache bij lichte, delicate visgerechten — het hoge alcohol en de rijpe "
            "fruitconcentratie overweldigen de subtiliteit volledig.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Grenache en Zinfandel: zoek naar een kruidige garrigue-ondertoon "
            "(laurier, tijm). Vind je die, dan proef je waarschijnlijk Grenache."
        ),
        "kernbegrippen": [
            "Grenache",
            "GSM-blend",
            "garrigue-kruidigheid",
            "Grenache-Zinfandel-verwarring",
            "warmteklimaat-alcoholopbouw",
        ],
        "reflectievraag": (
            "Welke blend op jouw kaart met Grenache zou je nu anders beschrijven nadat je de rol van "
            "Syrah en Mourvèdre daarin apart hebt leren zien?"
        ),
    },
    19: {
        "theorie": (
            "Cinsault is een warmteminnende, hoogopbrengende druif die van nature dunschillig is "
            "ondanks het warme klimaat waarin hij groeit — zuidelijk Frankrijk (Languedoc, zuidelijke "
            "Rhône), Zuid-Afrika en Libanon (de Bekaa-vallei) zijn de belangrijkste gebieden. De "
            "combinatie van warmte en dunne schil geeft een paradoxaal lichte, soepele wijn ondanks "
            "de hitte.\n\n"
            "Tannine is bij Cinsault laag en zacht, zuur eveneens gematigd: de druif mist de "
            "structuur om lang te rijpen en wordt daarom zelden solo gebotteld voor bewaring — het "
            "bewaarpotentieel is kort tot middellang. Precies die lage tannine en het bloemige "
            "karakter maken Cinsault historisch een van de belangrijkste roosédruiven ter wereld, "
            "van Provence tot Zuid-Afrika.\n\n"
            "Blindproefmarkers zijn: een lichte kleur, lage tannine, bloemige (viooltjes) en rood "
            "fruit-tonen, en een soepel mondgevoel zonder de hoge zuur die Gamay kenmerkt. Het "
            "verwarringsgevaar ligt vooral bij Grenache, waarmee Cinsault vaak wordt geblend: "
            "Grenache heeft aanzienlijk hoger alcohol en meer geconcentreerd fruit, terwijl Cinsault "
            "lichter, bloemiger en directer blijft — in een blend herken je Cinsault aan de "
            "opfrissende, minder geconcentreerde onderlaag onder het rijpere Grenache-fruit.\n\n"
            "Serveer Cinsault, en Cinsault-gedomineerde rosé, goed gekoeld (10–13°C) in een smal "
            "glas dat de bloemige frisheid focust."
        ),
        "samenvatting": (
            "- Cinsault is warmteminnend maar van nature dunschillig, met een paradoxaal lichte stijl\n"
            "- Lage, zachte tannine en gematigd zuur geven een kort tot middellang bewaarpotentieel\n"
            "- Historisch een van de belangrijkste roosédruiven, van Provence tot Zuid-Afrika\n"
            "- Blindproefmarkers: lichte kleur, lage tannine, bloemige en rood-fruittonen\n"
            "- Verwarringsgevaar met Grenache in blends; Cinsault is de lichtere, bloemiger onderlaag"
        ),
        "food_pairing": fp(
            "Cinsault bij gegrilde sardines of een mezeplank met olijven en tapenade.",
            "De lage tannine laat Cinsault ongewoon goed samengaan met vis, terwijl de bloemige "
            "lichtheid qua intensiteit precies aansluit bij zoute, mediterrane kleine gerechten.",
            "Cinsault bij zwaar gekruide, rijke vleesschotels — de lichte, bloemige structuur "
            "verdwijnt volledig tegen die intensiteit.",
        ),
        "pro_insight": (
            "In een Grenache-Cinsault-blend zoek je naar de opfrissende, bloemige onderlaag om "
            "Cinsault te identificeren — die verdwijnt niet, ook al domineert Grenache qua volume."
        ),
        "kernbegrippen": [
            "Cinsault",
            "Bekaa-vallei",
            "roosébasis Cinsault",
            "Cinsault-Grenache-blendverhouding",
            "bloemige lichtheid",
        ],
        "reflectievraag": (
            "Zou jij Cinsault nu overwegen bij een visgerecht, ondanks dat het een rode druif is?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "In een Grenache-Cinsault-blend proef je een opfrissende, bloemige onderlaag onder rijp, "
            "geconcentreerd fruit. Welke conclusie trek je?\n\n"
            "A. De blend bevat geen Grenache\n"
            "B. De bloemige onderlaag komt waarschijnlijk van Cinsault ✅\n"
            "C. De blend is volledig geoxideerd\n"
            "D. De blend bevat uitsluitend Syrah\n\n"
        ),
    },
    20: {
        "theorie": (
            "Mencía komt uit het noordwesten van Spanje — Bierzo en Ribeira Sacra — waar steile "
            "leisteen- en kwartsietbodems in een overgangsklimaat tussen Atlantisch en continentaal "
            "een combinatie van rijpheid en frisheid opleveren die zeldzaam is voor Spanje. De vaak "
            "extreem steile, met de hand bewerkte wijngaarden dragen bovendien bij aan lage "
            "opbrengsten en geconcentreerd fruit.\n\n"
            "Mencía heeft medium tannine met een fijne, soms iets stroeve korrel, en behoudt door "
            "het koelere klimaat een relatief hoge zuurgraad vergeleken met andere Spaanse rode "
            "druiven zoals Tempranillo of Garnacha. Die combinatie van medium tannine en hoge zuur "
            "geeft topwijnen uit Bierzo een bewaarpotentieel van tien tot vijftien jaar.\n\n"
            "Blindproefmarkers zijn: rood fruit, florale (viooltjes) tonen, een herkenbare minerale "
            "of leisteenachtige ondertoon, en frisse zuren met medium tannine. Het grootste "
            "verwarringsgevaar is Pinot Noir: beide combineren rood fruit, bloemigheid en hoge zuur "
            "met een relatief lichte kleur, maar Mencía toont een explicietere minerale, bijna "
            "leisteenachtige rand die Pinot Noir mist, en de tannine ligt doorgaans iets hoger en "
            "steviger dan bij Bourgondische Pinot Noir.\n\n"
            "Serveer Mencía matig gekoeld (14–16°C) in een middelgroot glas dat zowel de florale top "
            "als de minerale kern ruimte geeft."
        ),
        "samenvatting": (
            "- Bierzo en Ribeira Sacra combineren leisteenbodems met een Atlantisch-continentaal "
            "klimaat\n"
            "- Medium tannine en relatief hoge zuur geven Mencía tien tot vijftien jaar "
            "bewaarpotentieel\n"
            "- Blindproefmarkers: rood fruit, viooltjes, minerale/leisteenachtige ondertoon, hoge "
            "zuur\n"
            "- Grootste verwarringsgevaar is Pinot Noir door vergelijkbaar fruit, bloemigheid en zuur\n"
            "- Mencía heeft een explicietere minerale rand en iets steviger tannine dan Pinot Noir"
        ),
        "food_pairing": fp(
            "Mencía bij gegrilde pulpo a la gallega (octopus met paprikapoeder) of andere Galicische "
            "visgerechten.",
            "De hoge zuur en de minerale ondertoon van Mencía sluiten aan bij de umami en rokerige "
            "paprika van het gerecht, een klassieke regionale pairing-logica.",
            "Mencía bij zeer romige, boterrijke sauzen — de minerale frisheid van de wijn verdrinkt "
            "dan in de vetrijkdom.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Mencía en Pinot Noir: zoek naar een minerale, leisteenachtige rand "
            "naast het rode fruit. Vind je die, ga dan uit van Mencía."
        ),
        "kernbegrippen": [
            "Mencía",
            "Bierzo-leisteenbodem",
            "Ribeira Sacra",
            "Mencía-Pinot Noir-verwarring",
            "minerale randtoon",
        ],
        "reflectievraag": (
            "Welke andere Spaanse druif zou jij nu eerder verwarren met Mencía dan met de 'grote' "
            "Spaanse druiven Tempranillo en Garnacha?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Twee lichtgekleurde, hoogzure rode wijnen met rood fruit en bloemige tonen liggen naast "
            "elkaar. De ene toont een duidelijke minerale, leisteenachtige rand, de andere niet. "
            "Welke conclusie trek je?\n\n"
            "A. De minerale wijn is waarschijnlijk Mencía uit Bierzo ✅\n"
            "B. De minerale wijn is zeker Pinot Noir uit Bourgogne\n"
            "C. Mineraliteit wijst altijd op houtrijping\n"
            "D. Mineraliteit is bij rode wijn nooit betrouwbaar\n\n"
        ),
    },
    # ------------------------------------------------------------------
    # Module 5 — Medium body druiven (21–25) — food_pairing verplicht
    # ------------------------------------------------------------------
    21: {
        "theorie": (
            "Merlot is een van de meest aangeplante rode druiven ter wereld en rijpt vroeger en "
            "makkelijker dan Cabernet Sauvignon, waardoor de druif ook slaagt in koelere, "
            "vochtigere omstandigheden zoals de kleiige bodems van Pomerol en Saint-Émilion in "
            "Bordeaux. In warmere klimaten (Californië, Chili) wordt Merlot al snel overrijp en "
            "verliest hij zijn kenmerkende rondheid ten gunste van jam-achtige zwaarte.\n\n"
            "Merlot heeft een dunnere schil en minder pitten dan Cabernet Sauvignon, wat resulteert "
            "in zachtere, ronde tannine met minder grip; het zuur is eveneens gematigder. Die "
            "combinatie geeft Merlot een aantrekkelijke, vroege toegankelijkheid, maar de beste "
            "voorbeelden — zoals topwijnen uit Pomerol — tonen dat Merlot op kleigrond wel degelijk "
            "decennialang kan rijpen dankzij concentratie in plaats van ruwe tannine.\n\n"
            "Blindproefmarkers zijn: een middeldiepe kleur, zachte afgeronde tannine, rijp fruit "
            "(pruim, zwarte kers), chocolade en kruidige tonen. Het grootste verwarringsgevaar is "
            "Cabernet Sauvignon: beide zijn Bordeaux-druiven die vaak samen worden geblend, maar "
            "Cabernet heeft dikkere schillen en dus meer, grovere tannine plus een herkenbare "
            "cassis-, potlood- of groene-paprikatoon door pyrazines, terwijl Merlot ronder, zachter "
            "en fruitiger blijft zonder die groene randnoot. Net zoals je later Syrah van Malbec "
            "moet leren onderscheiden op basis van peper versus zacht pruimfruit, onderscheid je "
            "Merlot van Cabernet Sauvignon op tanninestructuur, niet op fruitrijpheid alleen.\n\n"
            "Serveer Merlot bij 16–18°C in een middelgroot tot breed glas dat de ronde tannine en "
            "het rijpe fruit ruimte geeft."
        ),
        "samenvatting": (
            "- Merlot rijpt vroeger dan Cabernet Sauvignon en slaagt op de kleibodems van Pomerol\n"
            "- Dunnere schil en minder pitten geven zachtere, ronde tannine en gematigder zuur\n"
            "- Topwijnen uit Pomerol tonen decennialang bewaarpotentieel via concentratie\n"
            "- Blindproefmarkers: middeldiepe kleur, zachte tannine, pruim, zwarte kers, chocolade\n"
            "- Grootste verwarringsgevaar is Cabernet Sauvignon; die toont een groene pyrazinerand"
        ),
        "food_pairing": fp(
            "Merlot bij geroosterd lamsrack of eendenborst met een fruitige jus.",
            "De zachte maar aanwezige tannine van Merlot bindt nog voldoende met de eiwitten en het "
            "vet van het vlees om rond te blijven, terwijl het rijpe pruim- en kersfruit de fruitige "
            "jus spiegelt.",
            "Merlot bij zeer pittige of scherp-zure gerechten — de zachte tannine en het gematigde "
            "zuur bieden dan onvoldoende tegenwicht.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Merlot en Cabernet Sauvignon: zoek naar een groene, potlood-achtige "
            "pyrazinenoot. Vind je die, dan proef je Cabernet; blijft de wijn puur rond en fruitig "
            "zonder die groene rand, dan is het Merlot."
        ),
        "kernbegrippen": [
            "Merlot",
            "Pomerol-kleibodem",
            "Merlot-Cabernet-verwarring",
            "schildikteverschil",
            "vroege toegankelijkheid",
        ],
        "reflectievraag": (
            "Welke Merlot-Cabernet-blend op jouw kaart zou je nu opnieuw proeven om de twee druiven "
            "apart te herkennen in plaats van als één geheel?"
        ),
    },
    22: {
        "theorie": (
            "Sangiovese is de belangrijkste druif van Italië en gedijt vooral in Toscane (Chianti, "
            "Montalcino, Montepulciano), waar warme dagen en koele nachten in de heuvels zorgen voor "
            "een zeldzame combinatie van volledige fenolische rijpheid mét behoud van hoge zuren.\n\n"
            "Sangiovese heeft medium tannine met een vaak iets stroeve, hoekige korrel, gecombineerd "
            "met opvallend hoge zuur. Deze zuur-tanninecombinatie is de reden waarom Sangiovese zo "
            "gastronomisch en zo geschikt is voor langdurige flesrijping; Brunello di Montalcino — "
            "100% Sangiovese, wettelijk verplicht lang gerijpt — toont het bewaarpotentieel van tien "
            "tot twintig jaar het duidelijkst.\n\n"
            "Blindproefmarkers zijn: heldere kersen- en pruimentonen, een kenmerkende aardse of "
            "theeachtige ondertoon, hoge zuur, en medium, hoekige tannine. Het grootste "
            "verwarringsgevaar is Tempranillo: beide zijn medium body, hoogzure, gastronomische "
            "druiven met leer- en aardse tertiaire tonen na houtrijping, maar Sangiovese behoudt een "
            "scherpere, meer kersachtige zuurlijn met minder zoet fruit, terwijl Tempranillo ronder "
            "overkomt, met meer leer en tabak en vaak een vanilletoon van Amerikaans eiken.\n\n"
            "Serveer Sangiovese bij 16–18°C in een middelgroot glas; Chianti Classico en jongere "
            "stijlen profiteren van een iets kleiner glas, Brunello van een breder glas voor de "
            "complexiteit."
        ),
        "samenvatting": (
            "- Toscane's warme dagen en koele nachten geven Sangiovese rijpheid mét hoge zuren\n"
            "- Medium, hoekige tannine gecombineerd met hoge zuur maakt Sangiovese sterk gastronomisch\n"
            "- Brunello di Montalcino toont het bewaarpotentieel van tien tot twintig jaar het best\n"
            "- Blindproefmarkers: kersen/pruim, aardse/theeachtige tonen, hoge zuur, hoekige tannine\n"
            "- Grootste verwarringsgevaar is Tempranillo; Sangiovese blijft scherper en kersachtiger"
        ),
        "food_pairing": fp(
            "Sangiovese bij een klassieke tomatensaus-pasta of een pizza margherita.",
            "De hoge zuur van Sangiovese matcht direct de zuurgraad van tomaat — een van de weinige "
            "combinaties waar zuur-op-zuur werkt — terwijl het vet van kaas de tannine verzacht.",
            "Sangiovese bij zeer zoete of romige, niet-tomaatgebaseerde sauzen — zonder de tegenhanger "
            "van tomaatzuur voelt de wijn scherp en onaf.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Sangiovese en Tempranillo: proef de zuurlijn apart van het fruit. "
            "Blijft die scherp en kersachtig, dan is het Sangiovese; wordt het fruit ronder met meer "
            "leer en vanille, dan is het Tempranillo."
        ),
        "kernbegrippen": [
            "Sangiovese",
            "Brunello di Montalcino",
            "Sangiovese-Tempranillo-verwarring",
            "kersen-zuurlijn",
            "tomaat-zuurmatch",
        ],
        "reflectievraag": (
            "Welk gerecht met tomaat op jouw kaart zou nu een betere Sangiovese-pairing zijn dan de "
            "wijn die er momenteel bij staat?"
        ),
    },
    23: {
        "theorie": (
            "Tempranillo is de koningsdruif van Spanje en dankt zijn naam aan zijn vroege rijping "
            "('temprano' betekent 'vroeg'), wat de druif geschikt maakt voor het continentale, "
            "extreme klimaat van Rioja en Ribera del Duero, met hete dagen en koude nachten op "
            "hoogte.\n\n"
            "Tempranillo heeft medium tannine en medium zuur, minder scherp dan Sangiovese, en een "
            "natuurlijke affiniteit met langdurige houtrijping — traditioneel Amerikaans eiken in "
            "Rioja, tegenwoordig ook Frans eiken. De classificaties Crianza, Reserva en Gran Reserva "
            "zijn wettelijk vastgelegde minimale rijpingstermijnen in vat en fles, en tonen hoe "
            "centraal houtrijping is voor het bewaarpotentieel en de stijl van deze druif.\n\n"
            "Blindproefmarkers zijn: rood fruit, leer, tabak en een herkenbare vanille- of "
            "kokosnoot van Amerikaans eiken, medium tannine en zuur. Het grootste verwarringsgevaar "
            "is Sangiovese: beide zijn medium body, houtgerijpte, leer-en-aarde-tonende druiven, maar "
            "Tempranillo toont een rondere, minder scherpe zuurlijn en een explicietere "
            "vanille/kokos-houttoon, terwijl Sangiovese scherper en kersachtiger blijft met minder "
            "zoete houttonen.\n\n"
            "Serveer jonge Tempranillo (Crianza) bij 16°C in een middelgroot glas; Reserva en Gran "
            "Reserva profiteren van een breder glas en 17–18°C om de houtrijping en de tertiaire "
            "complexiteit te ontplooien."
        ),
        "samenvatting": (
            "- Tempranillo dankt zijn naam aan vroege rijping, geschikt voor Rioja en Ribera del "
            "Duero\n"
            "- Medium tannine en zuur met een sterke affiniteit voor langdurige houtrijping\n"
            "- Crianza, Reserva en Gran Reserva zijn wettelijke rijpingstermijnen die de stijl sturen\n"
            "- Blindproefmarkers: rood fruit, leer, tabak, vanille/kokos van Amerikaans eiken\n"
            "- Grootste verwarringsgevaar is Sangiovese; Tempranillo is ronder met meer houttoon"
        ),
        "food_pairing": fp(
            "Tempranillo bij gegrilde chorizo, lamskoteletten of andere geroosterde vleesgerechten.",
            "De vanille/kokos-roostertonen van Amerikaans eiken in Tempranillo spiegelen de "
            "Maillard-roostertonen die ontstaan bij grillen en roosteren, een directe aroma-op-aroma "
            "match.",
            "Tempranillo bij rauwe of zeer lichte visgerechten — de houtgedreven roostertonen en de "
            "structuur overweldigen de subtiliteit van het gerecht.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Tempranillo en Sangiovese: zoek naar een vanille- of kokos-houttoon. "
            "Vind je die duidelijk aanwezig, dan proef je waarschijnlijk Tempranillo."
        ),
        "kernbegrippen": [
            "Tempranillo",
            "Crianza-Reserva-Gran Reserva",
            "Amerikaans eiken-vanille",
            "Sangiovese-Tempranillo-verwarring",
            "vroege-rijpingsdruif",
        ],
        "reflectievraag": (
            "Zou jij het verschil tussen een Crianza en een Gran Reserva Tempranillo nu kunnen "
            "uitleggen aan een gast zonder de wettelijke definities letterlijk op te lezen?"
        ),
    },
    24: {
        "theorie": (
            "Barbera is de meest aangeplante druif van Piemonte (Asti, Alba) en groeit vaak op de "
            "minder prestigieuze hellingen die niet gereserveerd zijn voor Nebbiolo; het relatief "
            "koele, heuvelachtige klimaat van Piemonte behoudt de van nature extreem hoge zuurgraad "
            "waar de druif om bekendstaat.\n\n"
            "Barbera heeft van nature laag tannine maar uitzonderlijk hoog zuur — een zeldzame "
            "combinatie die de wijn direct drinkbaar maakt zonder dat hij plat aanvoelt, omdat het "
            "zuur in plaats van tannine de structuur draagt. Zonder houtrijping heeft Barbera een "
            "kort tot middellang bewaarpotentieel; met bewuste houtrijping (Barbera d'Asti "
            "Superiore) kan de wijn een aantal jaren extra ontwikkelen doordat het hoge zuur als "
            "conserveringsmiddel werkt.\n\n"
            "Blindproefmarkers zijn: donkere kersen- en pruimtonen, specerijen, zeer hoog en "
            "snijdend zuur, laag tannine en een sappig mondgevoel. Het verwarringsgevaar met "
            "Grenache is subtieler dan het lijkt: in een rijpe jaargang kunnen beide een jammy, "
            "rijp-kersachtig fruitprofiel tonen, maar de test is altijd het zuur — Barbera behoudt "
            "een snijdende, bijna appelachtige zuurgraad die Grenache, met zijn van nature lage zuur "
            "en hoge alcohol, volledig mist. Verwar dus nooit 'rijp fruit' met 'dezelfde structuur': "
            "proef eerst het zuur apart.\n\n"
            "Serveer Barbera bij 15–17°C in een middelgroot glas; de hoge zuur komt het best tot "
            "zijn recht bij een net iets hogere temperatuur dan de meest frisse witte wijn, maar "
            "kouder dan een volle Tempranillo."
        ),
        "samenvatting": (
            "- Barbera groeit op de niet-Nebbiolo-hellingen van Piemonte en behoudt extreem hoog "
            "zuur\n"
            "- Lage tannine met uitzonderlijk hoog zuur laat het zuur de structuur dragen\n"
            "- Zonder hout kort bewaarpotentieel; met houtrijping (Superiore) langer dankzij het zuur\n"
            "- Blindproefmarkers: donkere kersen/pruim, specerijen, snijdend zuur, laag tannine\n"
            "- Verwarringsgevaar met Grenache in rijpe jaargangen; het zuur is de doorslaggevende test"
        ),
        "food_pairing": fp(
            "Barbera bij vette Piemontese salumi, vitello tonnato of gegratineerde risotto.",
            "Het snijdende zuur van Barbera doorbreekt vet en romigheid moeiteloos, terwijl de lage "
            "tannine geen conflict geeft met de zoute, hartige intensiteit van salumi.",
            "Barbera bij lichte, delicate gerechten zonder vet of zout tegenwicht — het hoge zuur "
            "domineert dan volledig.",
        ),
        "pro_insight": (
            "Bij twijfel tussen een rijpe Barbera en Grenache: proef het zuur apart van het fruit. "
            "Snijdt het zuur nog duidelijk door, dan is het Barbera; voelt de wijn ronder en warmer "
            "zonder die snijdende rand, dan is het Grenache."
        ),
        "kernbegrippen": [
            "Barbera",
            "Asti-Alba-hellingen",
            "snijdend zuur",
            "Barbera-Grenache-verwarring",
            "zuur als draagconstructie",
        ],
        "reflectievraag": (
            "Bij welk vet, hartig gerecht op jouw kaart zou Barbera een logischere keuze zijn dan de "
            "huidige rode wijn?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een rijpe, jammy rode wijn met zacht kersfruit ligt op tafel. Om te bepalen of dit "
            "Barbera of Grenache is, test je eerst:\n\n"
            "A. De kleurdiepte\n"
            "B. Het zuurniveau ✅\n"
            "C. Het alcoholpercentage alleen\n"
            "D. De flesvorm\n\n"
        ),
    },
    25: {
        "theorie": (
            "Zinfandel is genetisch identiek aan de Zuid-Italiaanse druif Primitivo (Puglia) en "
            "dankt zijn huidige faam aan Californië, met name Lodi en Sonoma, waar warme, droge "
            "zomers de druif tot extreme suikerrijpheid en dus hoog alcohol laten uitrijpen.\n\n"
            "Zinfandel heeft medium tannine en gematigd zuur, maar het is vooral het vaak zeer hoge "
            "alcohol (soms boven 15%) dat de structuur domineert. Ongelijkmatige rijping binnen "
            "dezelfde tros — sommige bessen rozijnachtig, andere nog groen — is een bekend risico "
            "dat wijnmakers dwingt tot precieze oogsttiming. Het bewaarpotentieel is middellang; de "
            "beste voorbeelden ontwikkelen met leeftijd meer specerijen en minder primaire "
            "jamigheid.\n\n"
            "Blindproefmarkers zijn: rijp zwart fruit (bramenjam, gedroogde vijg), zwarte peper, "
            "hoog alcohol (merkbare warmte) en medium tannine. Het verwarringsgevaar met Grenache is "
            "vergelijkbaar met dat bij Barbera-Grenache maar dan omgekeerd: beide zijn "
            "warme-klimaat, hoog-alcohol druiven met rijp fruit, maar Zinfandel toont explicieter "
            "zwarte peper en een jammy, bijna rozijnachtige concentratie, terwijl Grenache kruidiger "
            "(garrigue) en minder geconcentreerd blijft. Net zoals Syrah en Malbec later worden "
            "onderscheiden op basis van peper versus zacht pruimfruit, onderscheid je Zinfandel van "
            "Grenache op de intensiteit van zwarte peper en jamconcentratie.\n\n"
            "Serveer Zinfandel bij 16–18°C in een breed glas dat het hoge alcohol laat verdampen en "
            "de specerijen naar boven brengt; te koud geserveerd benadrukt de alcoholische hitte "
            "onaangenaam sterk."
        ),
        "samenvatting": (
            "- Zinfandel is genetisch identiek aan Primitivo en dankt zijn faam aan Lodi en Sonoma\n"
            "- Warme, droge zomers geven vaak zeer hoog alcohol, dat de structuur domineert\n"
            "- Ongelijkmatige trosrijping dwingt wijnmakers tot precieze, lastige oogsttiming\n"
            "- Blindproefmarkers: rijp zwart fruit, zwarte peper, hoog alcohol, medium tannine\n"
            "- Verwarringsgevaar met Grenache; Zinfandel toont explicieter peper en jamconcentratie"
        ),
        "food_pairing": fp(
            "Zinfandel bij gerookte BBQ-ribs met een pepercrust of gegrilde spare ribs met een "
            "zoet-pittige glaze.",
            "De zwarte peper en de rokerige roostertonen van geroosterd of gegrild vlees resoneren "
            "direct met het peperprofiel van Zinfandel, terwijl het hoge alcohol en de jammy "
            "zoetheid van het fruit de lichte bitterheid van een gerookte korst in balans brengen.",
            "Zinfandel bij lichte, delicate gerechten of subtiele visbereidingen — het hoge alcohol "
            "en de geconcentreerde jamigheid overweldigen die volledig.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Zinfandel en Grenache: zoek naar een expliciete zwarte-peperintensiteit "
            "en een bijna rozijnachtige jamconcentratie. Is die sterk aanwezig, dan proef je "
            "waarschijnlijk Zinfandel."
        ),
        "kernbegrippen": [
            "Zinfandel",
            "Primitivo-genetische identiteit",
            "Lodi-Sonoma",
            "Zinfandel-Grenache-verwarring",
            "ongelijkmatige trosrijping",
        ],
        "reflectievraag": (
            "Zou jij Zinfandel en Primitivo nu blind kunnen onderscheiden puur op basis van "
            "regio-typische stijlkeuzes, ondanks dat het genetisch dezelfde druif is?"
        ),
    },
}
