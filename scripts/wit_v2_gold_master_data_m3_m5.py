"""White Wine Track V2 — Premium Gold Master repair data.

Lessen 11–25 (Modules 3–5):
- Module 3 — Proeven (11–15)
- Module 4 — Frisse witte druiven (16–20)
- Module 5 — Rijke witte druiven (21–25)

Structuur per les (zelfde patroon als de wine_v2 m3_m5 repair-data):
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
            "Het proefprotocol voor witte wijn volgt dezelfde basisvolgorde als bij elke wijn — "
            "visueel, neus, mond, conclusie — maar de nadruk binnen die volgorde verschuift sterk. "
            "Bij witte wijn ontbreekt tannine vrijwel volledig als structuurelement, waardoor zuur "
            "de centrale rol overneemt die tannine bij rode wijn speelt. Wie dat niet beseft, proeft "
            "wit als 'lichte rode wijn zonder grip' in plaats van als een eigen structuurwereld met "
            "een eigen logica.\n\n"
            "Visueel let je bij wit vooral op kleurintensiteit en kleurdiepte: bleekgeel-groen wijst "
            "op jeugd en een koel klimaat, dieper goud op rijpheid, houtcontact of malolactische "
            "gisting. Bij de neus ruik je bewust twee keer — eerst het stilstaande glas, dan na "
            "swirlen — omdat veel witte aroma's (citrus, bloemen) vluchtiger en subtieler zijn dan "
            "de aroma's die aan tannine gebonden zitten bij rode wijn.\n\n"
            "In de mond doorloop je een vaste volgorde: eerst zuur (frisheid, speekselopwekking aan "
            "de zijkanten van de tong), dan alcohol (warmte), dan body (gewicht), en pas daarna de "
            "balans tussen die drie. Zonder tannine als vierde as wordt de balans tussen zuur, "
            "alcohol en body het enige criterium waarop een witte wijn slaagt of faalt.\n\n"
            "Wanneer pas je dit bewust toe? Bij elke witte wijn, maar zeker als voorbereiding op de "
            "druivenherkenning in Module 4 en 5 — daar bepaalt precies deze combinatie van zuur, "
            "aroma-intensiteit en body welke druif je blind herkent."
        ),
        "samenvatting": (
            "- Protocol blijft visueel, neus, mond, conclusie — de nadruk verschuift\n"
            "- Zuur neemt bij wit de centrale structuurrol over die tannine bij rood heeft\n"
            "- Kleurintensiteit bij wit loopt van bleekgeel-groen naar diep goud\n"
            "- Ruik twee keer: stil glas, dan na swirlen, om vluchtige aroma's te vangen\n"
            "- Mondproef volgt vaste volgorde: zuur, alcohol, body, dan balans"
        ),
        "pro_insight": (
            "Vergeet tannine als checklist-item bij wit: vervang die stap bewust door een tweede "
            "zuurcheck aan het einde van de mondproef. Dat voorkomt dat je de structuuranalyse te "
            "vroeg afsluit."
        ),
        "kernbegrippen": [
            "wit-proefprotocol",
            "zuur als structuuras",
            "tweefasen-ruiken",
            "kleurintensiteit wit",
            "zuur-alcohol-lichaamsverhouding",
        ],
        "reflectievraag": (
            "Op welk moment sla jij de tweede zuurcheck nog over — en welke verkeerde "
            "stijlinschatting levert dat je meestal op?"
        ),
    },
    12: {
        "theorie": (
            "Kleur is bij witte wijn een lineaire schaal in plaats van de rand-versus-kern-analyse "
            "die je bij rode wijn gebruikt. Er is geen paarse-naar-baksteen-overgang om te lezen; in "
            "plaats daarvan beweegt de hele kleur zich van bleekgeel-groen naar diepgoud en "
            "uiteindelijk amber. Die ene as vertelt je tegelijk iets over klimaat, druif, productie "
            "en leeftijd — en juist omdat het één as is, is de interpretatie foutgevoeliger dan bij "
            "rood.\n\n"
            "Bleekgeel met een groenige gloed wijst meestal op een koel klimaat, een neutrale tot "
            "hoge zuurgraad en weinig of geen houtcontact — denk aan jonge Sauvignon Blanc, Albariño "
            "of ongehoute Chardonnay. Dieper goud ontstaat door een combinatie van factoren die je "
            "niet blind uit elkaar kunt trekken op kleur alleen: rijper fruit uit een warmer klimaat, "
            "houtrijping, malolactische gisting, langere lees-contact of simpelweg flesrijping.\n\n"
            "Amber en bruinige tinten zijn het gevoeligste signaal: dat kan wijzen op bewuste "
            "oxidatieve wijnmaakstijl (bijvoorbeeld bepaalde natuurwijnen of oranje wijn met "
            "schilcontact), op langdurige positieve flesrijping bij een structuurrijke druif als "
            "Semillon of Chenin Blanc, of op een productiefout. Zonder de neus en de mond erbij te "
            "betrekken kun je die drie scenario's niet uit elkaar houden.\n\n"
            "Gebruik kleur dus altijd als eerste hypothese, nooit als eindoordeel: kantel het glas "
            "tegen een witte achtergrond, beoordeel de kleur zonder aan het etiket te denken, en "
            "laat de neus die hypothese bevestigen of ontkrachten."
        ),
        "samenvatting": (
            "- Bij wit is kleur één lineaire as: bleekgeel-groen tot diepgoud en amber\n"
            "- Bleekgeel-groen wijst op koel klimaat, hoge zuren, weinig houtcontact\n"
            "- Diepgoud kan komen van rijpheid, hout, MLF, lees-contact of flesrijping\n"
            "- Amber is het gevoeligste signaal: bewuste stijl, positieve rijping of fout\n"
            "- Kleur is een hypothese die de neus en mond nog moeten bevestigen"
        ),
        "pro_insight": (
            "Beoordeel kleur altijd vóór je het etiket leest — noteer je hypothese over klimaat en "
            "productie eerst, en toets die pas daarna aan wat je ruikt."
        ),
        "kernbegrippen": [
            "kleurlineariteit wit",
            "diepgoud",
            "amberrisico",
            "schilcontact wit",
            "kleurhypothese",
        ],
        "reflectievraag": (
            "Welke witte wijn op jouw kaart zou jij nu opnieuw beoordelen puur op kleurdiepte, los "
            "van wat je al over de druif weet?"
        ),
    },
    13: {
        "theorie": (
            "Bij witte wijn is de primaire aromalaag breder en klimaatgevoeliger dan bij rode wijn, "
            "omdat schilcontact grotendeels ontbreekt en het fruitkarakter dus rechtstreeks uit de "
            "druif en het klimaat komt. Citrus en groen fruit (limoen, groene appel, kruisbes) "
            "wijzen op een koel klimaat; steenfruit (perzik, abrikoos) en tropisch fruit (ananas, "
            "mango) wijzen op een warmer klimaat of rijpere oogst. Florale tonen (witte bloemen, "
            "lindebloesem) zitten daar ergens tussenin en zijn vaak druifgebonden.\n\n"
            "Secundaire aroma's ontstaan door productiekeuzes die bij wit veel zichtbaarder zijn dan "
            "bij rood: gisting op de lies, bâtonnage en malolactische gisting geven brooddeeg, gist "
            "en boter — aroma's die je bij rode wijn zelden zo dominant tegenkomt omdat tannine en "
            "schilextractie daar meer op de voorgrond staan.\n\n"
            "Tertiaire aroma's bij wit lopen sterk uiteen per druif: honing en noten bij gerijpte "
            "Chenin Blanc of Semillon, toast en vanille bij houtgelagerde Chardonnay, en het "
            "beroemde petrolaroma bij oudere Riesling — een aroma dat ontstaat door de afbraak van "
            "TDN-verbindingen en nergens anders zo herkenbaar voorkomt.\n\n"
            "Waarom is deze indeling bij wit extra belangrijk? Omdat de balans tussen primair fruit "
            "en secundaire boter/houttonen direct de stijl bepaalt die je nodig hebt voor "
            "druivenherkenning in Module 4 en 5: veel primair fruit en weinig secundair wijst vaak "
            "op de frisse druiven, veel secundair en tertiair op de rijke druiven."
        ),
        "samenvatting": (
            "- Primair fruit bij wit is sterk klimaatgebonden: citrus/groen versus steenfruit/tropisch\n"
            "- Secundaire aroma's (boter, brooddeeg, gist) komen vaak van lees-contact en MLF\n"
            "- Tertiaire aroma's verschillen sterk per druif: honing, toast, of petrol\n"
            "- Petrol bij oudere Riesling ontstaat door afbraak van TDN-verbindingen\n"
            "- De verhouding primair versus secundair/tertiair stuurt je druivenhypothese"
        ),
        "pro_insight": (
            "Ruik bewust op de verhouding tussen fruit en boter/toast, niet alleen op losse "
            "descriptors — die verhouding alleen al scheidt de frisse van de rijke witte druiven."
        ),
        "kernbegrippen": [
            "klimaatgebonden fruit",
            "lees-contact aroma",
            "TDN-petrolnoot",
            "secundaire boteraroma",
            "aromaverhouding",
        ],
        "reflectievraag": (
            "Bij welke witte wijn verwarde jij laatst een secundair aroma (bijvoorbeeld boter) met "
            "een primair kenmerk van de druif zelf?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Je ruikt een oudere witte wijn met een duidelijke petrolgeur naast citrus. Welke druif "
            "en welk aromatype past hier het beste bij?\n\n"
            "A. Jonge Sauvignon Blanc, primair aroma\n"
            "B. Gerijpte Riesling, tertiair aroma ✅\n"
            "C. Houtgelagerde Chardonnay, secundair aroma\n"
            "D. Jonge Verdejo, primair aroma\n\n"
        ),
    },
    14: {
        "theorie": (
            "Zuur is bij witte wijn niet zomaar één van de structuurelementen — het is de "
            "ruggengraat waar de hele stijl omheen gebouwd wordt, omdat tannine als tegenwicht "
            "ontbreekt. Een witte wijn met te weinig zuur voelt plat en vermoeid aan, ongeacht "
            "hoeveel fruit of aroma er nog aanwezig is; een witte wijn met precies genoeg zuur "
            "blijft jaren fris.\n\n"
            "Twee zuren domineren: wijnsteenzuur (stabiel, blijft grotendeels behouden) en appelzuur "
            "(scherper, appelachtig, wordt tijdens malolactische gisting omgezet in zachter "
            "melkzuur). Die omzetting is een bewuste stijlkeuze: veel MLF bij Chardonnay geeft een "
            "rondere, romigere zuurindruk; vrijwel geen MLF bij Sauvignon Blanc of Riesling behoudt "
            "de scherpe, precieze zuurstructuur die deze druiven kenmerkt.\n\n"
            "Klimaat is de grootste externe factor: koele klimaten en vroege oogst behouden "
            "appelzuur, warme klimaten en late oogst laten het afbreken tijdens rijping op de "
            "wijnstok — nog vóór de wijnmaker iets beslist. Daarom is zuur zowel een druifkenmerk "
            "als een klimaatsignaal, en moet je die twee bij blind proeven altijd samen wegen.\n\n"
            "Hoe test je dat objectief? Let op speekselopwekking aan de zijkanten van de tong en op "
            "hoelang die sensatie aanhoudt na het doorslikken. Vergelijk bij dezelfde temperatuur — "
            "te koud overdrijft de indruk van zuur, te warm verdoezelt hem."
        ),
        "samenvatting": (
            "- Zuur is bij wit de ruggengraat van de structuur, niet tannine\n"
            "- Wijnsteenzuur blijft stabiel; appelzuur wordt door MLF omgezet in melkzuur\n"
            "- Veel MLF geeft een rondere zuurindruk; weinig MLF behoudt scherpte\n"
            "- Klimaat bepaalt hoeveel natuurlijk zuur een druif behoudt vóór de oogst\n"
            "- Zuur is zowel een druif- als een klimaatsignaal, en moet je samen wegen"
        ),
        "pro_insight": (
            "Vraag jezelf bij elke witte wijn af: is dit lage zuur door klimaat, door MLF, of door "
            "beide? Dat onderscheid voorkomt een verkeerde druivenhypothese."
        ),
        "kernbegrippen": [
            "appelzuur-melkzuuromzetting",
            "wijnsteenzuur",
            "zuur als ruggengraat",
            "klimaatgebonden zuur",
            "MLF-stijlkeuze",
        ],
        "reflectievraag": (
            "Welke witte wijn op jouw lijst zou je nu herclassificeren nadat je zuur apart van "
            "klimaat én MLF hebt beoordeeld?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een witte wijn heeft een opvallend ronde, zachte zuurindruk zonder scherpe randjes, "
            "terwijl het label een koel klimaat vermeldt. Wat is de meest logische verklaring?\n\n"
            "A. Extreem lage rendementen\n"
            "B. Volledige malolactische gisting ✅\n"
            "C. Vroege oogst\n"
            "D. Langdurige koude gisting\n\n"
        ),
    },
    15: {
        "theorie": (
            "Deze mini-toets bundelt alles wat witte wijn technisch en proefmatig uniek maakt: "
            "directe persing als productiebasis, kleur als eerste hypothese, zuur als structurele "
            "ruggengraat, en malolactische gisting als de belangrijkste stijlschakelaar die je tot "
            "nu toe hebt gezien. Waarom die combinatie? Omdat elk van deze vier elementen een andere "
            "laag van dezelfde wijn verklaart, en pas samen een betrouwbare stijlhypothese "
            "opleveren.\n\n"
            "Direct press bepaalt het startpunt: doordat schillen vrijwel meteen worden gescheiden "
            "van het sap, mist witte wijn de tannine en kleurextractie die rode wijn definiëren, en "
            "verschuift het zwaartepunt volledig naar zuur, aroma en (eventueel) lees- of "
            "houtcontact. Kleur is daarna de eerste visuele hypothese: bleekgeel-groen wijst op een "
            "koel klimaat en weinig productie-invloed, dieper goud op rijpheid, MLF, houtcontact of "
            "leeftijd — een hypothese die de neus en de mond nog moeten bevestigen.\n\n"
            "Zuur is de structurele kern: het bepaalt frisheid, bewaarpotentieel en pairingkracht, "
            "en is bij wit belangrijker dan bij enige andere structuuras omdat tannine ontbreekt. "
            "Malolactische gisting is de belangrijkste stijlkeuze die dat zuur verandert: scherp "
            "appelzuur wordt omgezet in zachter melkzuur, wat een wijn ronder en romiger maakt — een "
            "techniek die veel wordt toegepast bij Chardonnay en vrijwel nooit bij Riesling of "
            "Sauvignon Blanc.\n\n"
            "Het blinde witte-wijnprotocol brengt dit samen in vaste volgorde: kleur (intensiteit, "
            "diepte), aroma (primair versus secundair/tertiair, klimaatsignaal), structuur (zuur, "
            "alcohol, body, balans), en pas daarna een stijlhypothese — koel en strak, of warm en "
            "rond. Documenteer die hypothese vóór de onthulling: dat is de enige manier om objectief "
            "te toetsen of je protocol standhoudt zonder etiket."
        ),
        "samenvatting": (
            "- Direct press is het productiestartpunt: geen tannine, wel zuur en aroma centraal\n"
            "- Kleur is de eerste hypothese: bleekgeel-groen versus dieper goud of amber\n"
            "- Zuur is de structurele ruggengraat, belangrijker dan bij elke andere as\n"
            "- MLF zet scherp appelzuur om in zacht melkzuur en verandert de stijl fundamenteel\n"
            "- Het blinde protocol volgt vaste volgorde: kleur, aroma, structuur, stijlhypothese"
        ),
        "pro_insight": (
            "Documenteer bij elke blinde witte wijn eerst je stijlhypothese — koel/strak of "
            "warm/rond — vóór je nadenkt over een specifieke druif. Dat voorkomt dat je te snel naar "
            "een naam raadt zonder de onderliggende structuur te checken."
        ),
        "kernbegrippen": [
            "direct press",
            "malolactische stijlschakelaar",
            "zuur als ruggengraat wit",
            "blind wit-protocol",
            "stijlhypothese wit",
        ],
        "reflectievraag": (
            "Welke van de vier elementen — direct press, kleur, zuur of MLF — vergeet jij het vaakst "
            "mee te wegen vóór je een conclusie trekt over een witte wijn?"
        ),
        "praktijk": (
            "### Opdracht\n\n"
            "Proef één witte wijn volledig blind (laat het etiket door iemand anders verbergen). "
            "Doorloop het volledige protocol zonder te gokken op een merknaam: beschrijf eerst kleur "
            "en intensiteit, dan aroma (primair versus secundair/tertiair), dan structuur (zuur, "
            "alcohol, body, balans), en formuleer pas daarna een stijlhypothese — koel/strak of "
            "warm/rond — inclusief een vermoeden over wel of geen malolactische gisting. Onthul de "
            "wijn pas na het opschrijven van je hypothese.\n\n"
            "### Checklist\n\n"
            "- Ik heb kleur en intensiteit beschreven vóór ik aan de druif dacht\n"
            "- Ik heb primaire en secundaire/tertiaire aroma's apart benoemd\n"
            "- Ik heb zuur, alcohol en body apart beoordeeld\n"
            "- Ik heb een vermoeden over malolactische gisting genoteerd\n"
            "- Ik heb mijn stijlhypothese opgeschreven vóór de onthulling\n"
            "- Ik heb achteraf mijn grootste denkfout in één zin vastgelegd"
        ),
        "quiz_full": (
            "### Vraag 1\n\n"
            "Een witte wijn wordt direct na de oogst geperst, waarbij het sap vrijwel meteen van de "
            "schillen wordt gescheiden. Welk structuurelement wordt hierdoor het minst beïnvloed "
            "door de druif zelf?\n\n"
            "A. Zuur\n"
            "B. Tannine ✅\n"
            "C. Aroma\n"
            "D. Alcohol\n\n"
            "### Vraag 2\n\n"
            "Je proeft een bleekgele wijn met een lichte groene gloed, hoog zuur en weinig geur van "
            "boter of toast. Welke hypothese past het beste?\n\n"
            "A. Warm klimaat, veel houtcontact, uitgebreide MLF\n"
            "B. Koel klimaat, weinig productie-invloed, primair fruit dominant ✅\n"
            "C. Warm klimaat, geen MLF, oxidatieve stijl\n"
            "D. Koel klimaat, volledige MLF, houtrijping\n\n"
            "### Vraag 3\n\n"
            "Je ruikt brooddeeg, boter en een lichte vanilletoon naast rijp appelfruit. Welke twee "
            "lagen proef je hier samen?\n\n"
            "A. Primair en tertiair\n"
            "B. Primair en secundair ✅\n"
            "C. Secundair en tertiair\n"
            "D. Alleen tertiair\n\n"
            "### Vraag 4\n\n"
            "Een wijnmaker past volledige malolactische gisting toe op een Chardonnay. Wat is het "
            "meest directe effect op de zuurstructuur?\n\n"
            "A. Wijnsteenzuur verdwijnt volledig\n"
            "B. Appelzuur wordt omgezet in zachter melkzuur ✅\n"
            "C. Het totale zuurgehalte stijgt sterk\n"
            "D. Alle zuren verdampen tijdens gisting\n\n"
            "### Vraag 5\n\n"
            "Je proeft een oudere witte wijn met een duidelijke petrolgeur naast limoen. In welke "
            "laag hoort deze petrolgeur, en welke druif past hier het meest voor de hand liggend "
            "bij?\n\n"
            "A. Primair aroma, Sauvignon Blanc\n"
            "B. Tertiair aroma, Riesling ✅\n"
            "C. Secundair aroma, Chardonnay\n"
            "D. Primair aroma, Verdejo\n\n"
            "### Vraag 6\n\n"
            "Wat is de juiste volgorde van het blinde witte-wijnprotocol?\n\n"
            "A. Aroma, kleur, structuur, hypothese\n"
            "B. Structuur, aroma, kleur, hypothese\n"
            "C. Kleur, aroma, structuur, hypothese ✅\n"
            "D. Hypothese, kleur, aroma, structuur\n\n"
            "### Vraag 7\n\n"
            "Hoe herken je zuur het meest objectief in de mond?\n\n"
            "A. Warmte achterin de keel\n"
            "B. Speekselopwekking aan de zijkanten van de tong ✅\n"
            "C. Droogte op het tandvlees\n"
            "D. Een zoete nasmaak\n\n"
            "### Vraag 8\n\n"
            "Twee wijnen van dezelfde druif verschillen sterk in zuurniveau: de ene komt uit een "
            "koel klimaat, de andere uit een warm klimaat met late oogst. Wat verklaar je hier als "
            "eerste?\n\n"
            "A. Verschil in glaswerk\n"
            "B. Verschil in klimaat en oogstmoment ✅\n"
            "C. Verschil in flesvorm\n"
            "D. Verschil in kurktype\n\n"
            "### Vraag 9\n\n"
            "Een wijn ruikt overwegend naar boter en toast, met weinig direct herkenbaar fruit. Wat "
            "is de meest waarschijnlijke verklaring, los van de druif zelf?\n\n"
            "A. Zeer koude fermentatie zonder lees-contact\n"
            "B. Uitgebreid lees-contact en/of houtrijping ✅\n"
            "C. Extreem hoog zuurniveau\n"
            "D. Volledige afwezigheid van gisting\n\n"
            "### Vraag 10\n\n"
            "Blind: bleekgeel met groene rand, intense citrus- en kruidenaroma, hoog zuur, licht van "
            "lichaam, geen boter of toast. Welke combinatie van hypotheses past het beste?\n\n"
            "A. Warm klimaat, uitgebreide MLF, lange houtlagering\n"
            "B. Koel klimaat, geen MLF, geen houtcontact ✅\n"
            "C. Warm klimaat, geen MLF, korte flesrijping\n"
            "D. Koel klimaat, volledige MLF, lange houtlagering\n\n"
        ),
        "quiz_feedback": (
            "Goed gedaan. Je hebt nu de kern van witte wijn geïntegreerd: direct press als "
            "productiebasis, kleur als eerste hypothese, zuur als ruggengraat en malolactische "
            "gisting als belangrijkste stijlschakelaar. Dat fundament gebruik je in Module 4 en 5 om "
            "frisse en rijke witte druiven blind van elkaar te onderscheiden."
        ),
    },
    # ------------------------------------------------------------------
    # Module 4 — Frisse witte druiven (16–20) — food_pairing verplicht
    # ------------------------------------------------------------------
    16: {
        "theorie": (
            "Sauvignon Blanc is de meest ondubbelzinnige aromatische druif binnen de frisse witte "
            "categorie, en daardoor een uitstekend startpunt voor blindproefherkenning. Klimaat "
            "stuurt de stijl sterker dan bij bijna elke andere druif: in een koel klimaat (Loire, "
            "Marlborough) domineren gras, kruisbes, limoen en soms een groene-paprikatoon door "
            "pyrazines; in een warmer klimaat (delen van Zuid-Afrika, Chili) verschuift het "
            "spectrum naar rijper citrus, passievrucht en minder uitgesproken groene tonen.\n\n"
            "De stijlbandbreedte loopt dus van strak-groen en mineraal tot ronder en tropisch, met "
            "Marlborough vaak als het meest expressieve, aromatisch intense uiterste. "
            "Blindproefmarkers zijn daardoor betrouwbaar: hoog zuur, middelhoog alcohol, een "
            "aromatische intensiteit die je al ruikt vóór je swirlt, en een kenmerkende "
            "kruidig-groene ondertoon die zelden ontbreekt, zelfs in rijpere stijlen.\n\n"
            "Het grootste verwarringsgevaar is Verdejo: beide druiven geven citrus, kruidigheid en "
            "hoog zuur, en in een blinde line-up worden ze regelmatig omgewisseld. Het onderscheid "
            "zit in de intensiteit en het type kruidigheid — Sauvignon Blanc is scherper groen en "
            "explicieter aromatisch, Verdejo is subtieler met een kenmerkende lichte bitterheid en "
            "amandeltoon in de afdronk die Sauvignon Blanc mist.\n\n"
            "Serveer Sauvignon Blanc koel (6–9°C) in een smaller glas om de precisie te behouden; "
            "een te breed glas of te warme temperatuur laat de scherpe groene tonen omslaan naar "
            "vermoeid en vlak."
        ),
        "samenvatting": (
            "- Klimaat stuurt Sauvignon Blanc sterk: koel geeft groen en kruidig, warm geeft rijper "
            "citrus\n"
            "- Marlborough staat bekend om het meest expressieve, aromatisch intense uiterste\n"
            "- Blindproefmarkers: hoog zuur, aromatische intensiteit al vóór het swirlen, "
            "kruidig-groene ondertoon\n"
            "- Grootste verwarringsgevaar is Verdejo door vergelijkbare citrus- en kruidigheid\n"
            "- Verdejo heeft een lichte bitterheid en amandeltoon die Sauvignon Blanc mist"
        ),
        "food_pairing": fp(
            "Sauvignon Blanc bij een kruidige groene salade met geitenkaas en verse kruiden.",
            "De kruidig-groene aromatiek van de wijn spiegelt de kruiden in het gerecht, terwijl het "
            "hoge zuur de romigheid van de geitenkaas in balans houdt.",
            "Sauvignon Blanc bij romige, boterrijke gerechten met weinig kruiden — de scherpe groene "
            "tonen botsen dan met de romigheid in plaats van die te ondersteunen.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Sauvignon Blanc en Verdejo: zoek naar een lichte amandelbitterheid "
            "in de afdronk. Vind je die, dan proef je vrijwel zeker Verdejo."
        ),
        "kernbegrippen": [
            "Sauvignon Blanc",
            "pyrazinegroen",
            "Marlborough-stijl",
            "SB-Verdejo-verwarring",
            "kruidig-groene ondertoon",
        ],
        "reflectievraag": (
            "Zou jij een blinde Sauvignon Blanc en Verdejo naast elkaar nu correct kunnen scheiden "
            "— en op welk kenmerk zou je die beslissing baseren?"
        ),
    },
    17: {
        "theorie": (
            "Riesling is de meest pure terroir-druif binnen de frisse witte categorie: de druif "
            "zelf is aromatisch neutraler dan Sauvignon Blanc, waardoor klimaat, bodem en "
            "rijpheidsgraad des te directer doorklinken in het glas. Dat maakt Riesling tegelijk "
            "lastiger én lonender om blind te herkennen.\n\n"
            "Klimaat bepaalt de stijlbandbreedte extreem breed: in een koel klimaat (Mosel) geeft "
            "Riesling knisperend limoen, groene appel en een sprankelende, soms bijna scherpe "
            "zuurgraad, vaak met restzoet om die scherpte te temperen; in een warmer klimaat (Clare "
            "Valley, Alsace) verschuift het spectrum naar steenfruit en een vollere, drogere stijl. "
            "Riesling kent bovendien het breedste zoetheidsspectrum van alle grote witte druiven, "
            "van bot droog tot edelzoet.\n\n"
            "Blindproefmarkers zijn: extreem hoog en precies zuur, limoen en witte bloemen als "
            "primair fruit, en bij oudere flessen het onmiskenbare petrolaroma door afbraak van "
            "TDN-verbindingen. Het grootste verwarringsgevaar is Grüner Veltliner: beide druiven "
            "combineren hoog zuur met citrus en mineraliteit, maar Grüner voegt een herkenbare "
            "witte-pepertoon toe die Riesling mist, terwijl Riesling een striktere, puurdere "
            "zuurlijn heeft zonder die kruidige rand.\n\n"
            "Serveer Riesling koel (6–9°C) in een middelgroot glas dat zowel precisie als "
            "aromatische ontwikkeling toelaat; oudere, complexere Riesling profiteert van een iets "
            "breder glas om de tertiaire laag te openen."
        ),
        "samenvatting": (
            "- Riesling is aromatisch neutraler dan Sauvignon Blanc en laat terroir sterker "
            "doorklinken\n"
            "- Klimaat bepaalt een extreem brede stijlbandbreedte, van knisperend droog tot "
            "edelzoet\n"
            "- Blindproefmarkers: extreem precies zuur, limoen, witte bloemen, en petrol bij "
            "rijping\n"
            "- Grootste verwarringsgevaar is Grüner Veltliner door vergelijkbaar hoog zuur en "
            "citrus\n"
            "- Grüner heeft een witte-pepertoon die Riesling mist; Riesling is puurder in de "
            "zuurlijn"
        ),
        "food_pairing": fp(
            "Droge tot off-dry Riesling bij pittige Aziatische gerechten met gember en citrusgras.",
            "Hoog zuur en een vleugje restzoet temperen scherpte, terwijl de precieze citrusaroma's "
            "aansluiten bij de frisheid van het gerecht.",
            "Bot droge, extreem hoogzure Riesling bij zeer romige, boterrijke gerechten — de scherpe "
            "zuurlijn botst dan met de romigheid in plaats van die te doorbreken.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Riesling en Grüner Veltliner: zoek naar een pepertoon. Vind je die, "
            "dan proef je Grüner; blijft de zuurlijn puur zonder kruidige rand, dan is het Riesling."
        ),
        "kernbegrippen": [
            "Riesling",
            "petrolrijping",
            "zoetheidsspectrum",
            "Riesling-Grüner-verwarring",
            "terroir-transparantie",
        ],
        "reflectievraag": (
            "Welke Riesling-stijl (droog, off-dry of zoet) herken jij nog het minst betrouwbaar "
            "blind, en waarom denk je dat dat is?"
        ),
    },
    18: {
        "theorie": (
            "Albariño is de meest zilte druif binnen de frisse witte categorie, met een stijl die "
            "vrijwel volledig wordt gevormd door zijn Atlantische ligging in Rías Baixas. Klimaat is "
            "hier de dominante factor: de koele, vochtige, winderige kustomstandigheden geven "
            "consequent hoog zuur, matige alcohol en een directe, ziltige mineraliteit die zelden "
            "ontbreekt.\n\n"
            "De stijlbandbreedte is smaller dan bij Sauvignon Blanc of Riesling: Albariño blijft "
            "vrijwel altijd fris, droog en kustgedreven, met citrus, perzik en witte bloemen als "
            "primair fruit. Sommige producenten experimenteren met lees-contact voor meer textuur, "
            "maar de kern — ziltigheid en frisheid — verandert daardoor zelden fundamenteel.\n\n"
            "Blindproefmarkers zijn: een directe ziltige of maritieme toon naast citrus en perzik, "
            "een relatief compacte, precieze structuur, en een afdronk die vaak net iets korter is "
            "dan bij Riesling maar even fris. Het verwarringsgevaar ligt vooral bij Verdejo: beide "
            "zijn Spaanse, frisse, kruidige witten met matige body, maar Verdejo heeft een "
            "duidelijkere kruiden- en amandelbitterheid, terwijl Albariño explicieter zilt en "
            "maritiem overkomt.\n\n"
            "Serveer Albariño goed gekoeld (6–9°C) in een smal glas dat de frisheid en ziltigheid "
            "focust; het is een van de weinige witte wijnen waarbij een iets lagere temperatuur dan "
            "gebruikelijk de stijl juist versterkt in plaats van verzwakt."
        ),
        "samenvatting": (
            "- Albariño's stijl wordt sterk gevormd door de koele, Atlantische ligging van Rías "
            "Baixas\n"
            "- De stijlbandbreedte is smal: bijna altijd fris, droog en kustgedreven\n"
            "- Blindproefmarkers: ziltige/maritieme toon, citrus, perzik, compacte precieze "
            "structuur\n"
            "- Verwarringsgevaar met Verdejo: beide Spaans en fris, maar Verdejo is kruidiger en "
            "bitterder\n"
            "- Albariño is explicieter zilt en maritiem dan Verdejo"
        ),
        "food_pairing": fp(
            "Albariño bij verse oesters of andere rauwe schaal- en schelpdieren.",
            "De ziltige mineraliteit van de wijn spiegelt de zilte smaak van het schaaldier, terwijl "
            "het hoge zuur de romige textuur van de oester reinigt.",
            "Albariño bij zwaar gekruide of romige vleesgerechten — de subtiele ziltigheid en "
            "compacte structuur verdwijnen dan volledig tegen de intensiteit van het gerecht.",
        ),
        "pro_insight": (
            "Proef bewust op ziltigheid vóór je aan fruit denkt: die maritieme toon is bij Albariño "
            "vaak het eerste en meest betrouwbare signaal, sterker dan bij enige andere frisse "
            "witte druif."
        ),
        "kernbegrippen": [
            "Albariño",
            "Rías Baixas",
            "ziltige mineraliteit",
            "Albariño-Verdejo-verwarring",
            "Atlantische stijl",
        ],
        "reflectievraag": (
            "Bij welk schaaldier- of visgerecht op jouw kaart zou Albariño de huidige wijnkeuze "
            "overtreffen?"
        ),
    },
    19: {
        "theorie": (
            "Grüner Veltliner is Oostenrijks belangrijkste witte druif en de tegenhanger van "
            "Riesling binnen de frisse categorie: beide combineren hoog zuur met precisie, maar "
            "Grüner voegt een unieke kruidige signatuur toe die de druif direct herkenbaar maakt. "
            "Klimaat in de Wachau, Kamptal en Kremstal — met grote temperatuurverschillen tussen dag "
            "en nacht langs de Donau — behoudt de natuurlijke zuren terwijl het fruit toch "
            "voldoende rijpt.\n\n"
            "De stijlbandbreedte loopt van lichte, directe 'Steinfeder'-achtige stijlen tot "
            "geconcentreerde, bijna Bourgondische 'Smaragd'-stijlen met meer body en soms lichte "
            "houtinvloed. Ondanks die bandbreedte blijft de herkenbare witte-pepertoon vrijwel altijd "
            "aanwezig, ongeacht het concentratieniveau.\n\n"
            "Blindproefmarkers zijn: groene appel en limoen als primair fruit, een onmiskenbare "
            "witte-pepertoon, hoog zuur, en vaak een lichte, weldadige body die net iets voller "
            "aanvoelt dan bij Riesling. Het grootste verwarringsgevaar is precies Riesling: beide "
            "zijn hoogzuur en mineraal, maar Grüner heeft die pepertoon die Riesling mist, terwijl "
            "Riesling een striktere, puurdere zuurlijn behoudt en vaker florale in plaats van "
            "kruidige tonen laat zien.\n\n"
            "Serveer Grüner Veltliner koel (7–10°C) in een middelgroot glas; de lichtere "
            "Steinfeder-stijlen verdienen een iets kleiner glas, de geconcentreerde Smaragd-stijlen "
            "profiteren van meer ruimte om de kruidigheid te ontwikkelen."
        ),
        "samenvatting": (
            "- Grüner Veltliner combineert hoog zuur met een unieke witte-pepertoon\n"
            "- Grote dag-nachttemperatuurverschillen langs de Donau behouden zuur bij volledige "
            "rijping\n"
            "- Stijlbandbreedte loopt van lichte Steinfeder- tot geconcentreerde Smaragd-stijlen\n"
            "- Blindproefmarkers: groene appel, limoen, witte peper, hoog zuur, lichte volheid\n"
            "- Grootste verwarringsgevaar is Riesling; de pepertoon is het onderscheidende signaal"
        ),
        "food_pairing": fp(
            "Grüner Veltliner bij gegrilde asperges met een lichte botersaus.",
            "De kruidige pepertoon en het hoge zuur werken van nature samen met het bittere, groene "
            "karakter van asperges, een combinatie waar de meeste witte wijnen juist op stuklopen.",
            "Grüner Veltliner bij zoet gekruide of sterk specerijrijke gerechten — de subtiele "
            "pepertoon van de wijn verdwijnt dan tegen dominantere kruiden in het gerecht.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Grüner Veltliner en Riesling: zoek actief naar witte peper in de "
            "afdronk. Vind je die niet, ga dan uit van Riesling."
        ),
        "kernbegrippen": [
            "Grüner Veltliner",
            "witte-pepertoon",
            "Wachau-Steinfeder-Smaragd",
            "Riesling-Grüner-verwarring",
            "Donau-temperatuurverschil",
        ],
        "reflectievraag": (
            "Welke gerechten op jouw kaart zou je nu heroverwegen met Grüner Veltliner in plaats van "
            "de gebruikelijke witte huiswijn?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een witte wijn combineert hoog zuur, groene appel en een duidelijke pepertoon in de "
            "afdronk. Welke druif past het beste, en waarop baseer je dat?\n\n"
            "A. Riesling, vanwege de hoge zuurgraad\n"
            "B. Grüner Veltliner, vanwege de pepertoon ✅\n"
            "C. Sauvignon Blanc, vanwege de groene appel\n"
            "D. Albariño, vanwege de ziltigheid\n\n"
        ),
    },
    20: {
        "theorie": (
            "Verdejo is dé witte specialiteit van Rueda en het duidelijkste voorbeeld binnen deze "
            "module van hoe twee druiven met vergelijkbare basiskenmerken toch een eigen identiteit "
            "behouden. Klimaat in Rueda — hoog gelegen, continentaal, met grote "
            "temperatuurverschillen — geeft de druif zijn kenmerkende combinatie van frisheid en "
            "structuur, ondanks de relatief warme Spaanse zomers.\n\n"
            "De stijlbandbreedte is compact: Verdejo wordt bijna altijd jong en droog gevinifieerd, "
            "met citrus, venkel, groene kruiden en amandel als primair fruit, en een herkenbare "
            "lichte bitterheid in de afdronk. Historisch werd de druif ook oxidatief gemaakt, "
            "vergelijkbaar met Sherry-stijlen, maar de moderne, frisse stijl domineert nu vrijwel "
            "volledig.\n\n"
            "Blindproefmarkers zijn: citrus en venkel naast een amandelachtige, licht bittere "
            "afdronk, matig tot hoog zuur, en een compacte, geen overdreven aromatische intensiteit "
            "die Verdejo onderscheidt van explicietere druiven. Het grootste verwarringsgevaar is "
            "Sauvignon Blanc: beide geven citrus, kruidigheid en hoog zuur, maar Sauvignon Blanc is "
            "scherper groen en aromatisch explicieter, terwijl Verdejo subtieler is met die "
            "kenmerkende amandelbitterheid. Een secundair verwarringsgevaar is Albariño, dat qua "
            "herkomst dichtbij ligt maar explicieter zilt en maritiem is dan de meer kruidig-bittere "
            "Verdejo.\n\n"
            "Serveer Verdejo koel (7–9°C) in een smaller glas dat de frisheid focust; de lichte "
            "bitterheid in de afdronk komt het best tot zijn recht bij een iets hogere temperatuur "
            "dan de meest extreem frisse druiven."
        ),
        "samenvatting": (
            "- Verdejo combineert frisheid en structuur door het continentale klimaat van Rueda\n"
            "- De stijlbandbreedte is compact: bijna altijd jong, droog en fris gevinifieerd\n"
            "- Blindproefmarkers: citrus, venkel, amandelachtige lichte bitterheid, matig-hoog zuur\n"
            "- Grootste verwarringsgevaar is Sauvignon Blanc, dat scherper groen en explicieter is\n"
            "- Secundair verwarringsgevaar is Albariño, dat explicieter zilt en maritiem overkomt"
        ),
        "food_pairing": fp(
            "Verdejo bij gegrilde witvis met kruiden en amandelen, of bij een tapasplank met "
            "olijven.",
            "De amandelachtige bitterheid en kruidigheid van de wijn spiegelen de smaken op het "
            "bord, terwijl het zuur de vetheid van olijfolie en gegrilde vis in balans houdt.",
            "Verdejo bij zeer zoete of zeer romige desserts — de lichte bitterheid in de afdronk "
            "botst dan onaangenaam met de zoetheid.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Verdejo en Sauvignon Blanc: zoek naar amandelbitterheid in de "
            "afdronk in plaats van naar de intensiteit van het aroma. Die bitterheid is bij "
            "Sauvignon Blanc vrijwel afwezig."
        ),
        "kernbegrippen": [
            "Verdejo",
            "Rueda-klimaat",
            "amandelbitterheid",
            "SB-Verdejo-verwarring",
            "compacte stijlbandbreedte",
        ],
        "reflectievraag": (
            "Zou jij Verdejo, Sauvignon Blanc en Albariño nu blind uit elkaar kunnen houden — en "
            "welk kenmerk zou voor jou doorslaggevend zijn per druif?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Je proeft een droge witte wijn met citrus, venkel en een lichte amandelbitterheid in de "
            "afdronk, minder aromatisch explosief dan een klassieke Marlborough-stijl. Welke druif "
            "ligt het meest voor de hand?\n\n"
            "A. Sauvignon Blanc\n"
            "B. Verdejo ✅\n"
            "C. Riesling\n"
            "D. Grüner Veltliner\n\n"
        ),
    },
    # ------------------------------------------------------------------
    # Module 5 — Rijke witte druiven (21–25) — food_pairing verplicht
    # ------------------------------------------------------------------
    21: {
        "theorie": (
            "Chardonnay is de meest veelzijdige witte druif ter wereld, precies omdat de druif zelf "
            "relatief neutraal is en daardoor sterker reageert op klimaat en wijnmaakkeuzes dan "
            "bijna elke andere witte druif. Die eigenschap maakt Chardonnay tegelijk het makkelijkst "
            "herkenbare en het lastigst te generaliseren druivenras binnen deze module.\n\n"
            "Klimaat bepaalt een enorme stijlbandbreedte: in een koel klimaat (Chablis, delen van "
            "Bourgogne) blijft Chardonnay strak, citrusachtig en mineraal, vaak met weinig tot geen "
            "houtinvloed; in een warm klimaat (Californië, Australië, Chili) verschuift het fruit "
            "naar tropisch en rijp, gecombineerd met zachtere zuren en meer body. Wijnmaakkeuzes — "
            "houtrijping, bâtonnage en vooral malolactische gisting — voegen daar een derde, "
            "onafhankelijke laag aan toe: boter, vanille, toast en romigheid.\n\n"
            "Blindproefmarkers zijn daardoor tweeledig: eerst identificeer je het klimaatsignaal "
            "(citrus/mineraal versus tropisch/rijp), dan pas het productiesignaal (RVS/strak versus "
            "hout/MLF/romig). Het grootste verwarringsgevaar is een ongehoute, koel-klimaat "
            "Chardonnay tegenover Chenin Blanc: beide geven appel en een neutrale tot matige "
            "aromatiek, maar Chenin behoudt bijna altijd een hogere, striktere zuurlijn en vaker een "
            "honingachtige ondertoon, terwijl Chardonnay ronder aanvoelt zodra er enige lees-contact "
            "of MLF bij komt kijken.\n\n"
            "Serveer strakke, ongehoute Chardonnay koel (7–9°C) in een smaller glas; houtgelagerde, "
            "romige stijlen verdienen een breder glas en een iets hogere temperatuur (10–13°C) om de "
            "complexiteit te openen."
        ),
        "samenvatting": (
            "- Chardonnay is neutraal van karakter en reageert sterk op klimaat en wijnmaken\n"
            "- Klimaat bepaalt fruitrichting: citrus/mineraal (koel) versus tropisch/rijp (warm)\n"
            "- Houtrijping, bâtonnage en MLF voegen een onafhankelijke productielaag toe\n"
            "- Blindproefmarkers vereisen twee stappen: eerst klimaat, dan productiestijl\n"
            "- Grootste verwarringsgevaar is ongehoute Chardonnay tegenover Chenin Blanc"
        ),
        "food_pairing": fp(
            "Houtgelagerde, romige Chardonnay bij rijke kreeft of gegrild gevogelte in botersaus.",
            "De boterige, romige textuur van de wijn spiegelt de rijkdom van de botersaus, terwijl "
            "voldoende zuur het gerecht toch fris houdt.",
            "Dezelfde romige, houtgelagerde Chardonnay bij een lichte, rauwe visbereiding — de wijn "
            "overweldigt dan volledig de subtiliteit van het gerecht.",
        ),
        "pro_insight": (
            "Beoordeel Chardonnay altijd in twee losse stappen: eerst klimaat (fruitrichting), dan "
            "productie (hout/MLF). Door die twee te scheiden voorkom je dat je de druif verwart met "
            "de stijl."
        ),
        "kernbegrippen": [
            "Chardonnay-kameleon",
            "klimaatlaag versus productielaag",
            "malolactische romigheid",
            "Chardonnay-Chenin-verwarring",
            "Chablis-strakheid",
        ],
        "reflectievraag": (
            "Welke Chardonnay op jouw kaart zou je nu anders classificeren nadat je klimaatlaag en "
            "productielaag apart hebt beoordeeld?"
        ),
    },
    22: {
        "theorie": (
            "Chenin Blanc is een van de meest onderschatte witte druiven, juist omdat de "
            "stijlbandbreedte zo extreem breed is dat één simpele typering onmogelijk is: van "
            "bloedstrak droog tot edelzoet, en van stil tot mousserend. Klimaat en regio sturen die "
            "bandbreedte sterk: de Loire (Vouvray, Savennières) geeft precisie, hoge zuren en een "
            "minerale, soms wasachtige textuur; Zuid-Afrika geeft vaak een rondere, fruitigere en "
            "toegankelijkere stijl.\n\n"
            "Wat Chenin Blanc onderscheidt van bijna elke andere rijke witte druif is de combinatie "
            "van body met uitzonderlijk hoog zuur — een combinatie die zelden zo expliciet samen "
            "voorkomt. Die hoge zuurgraad geeft Chenin Blanc bovendien een indrukwekkend "
            "bewaarpotentieel, vergelijkbaar met Riesling maar met een geheel andere aromatische "
            "signatuur: appel, peer, honing en een kenmerkende wolachtige (lanoline) textuur.\n\n"
            "Blindproefmarkers zijn: hoog zuur gecombineerd met meer body dan de frisse druiven uit "
            "Module 4, appel- en peertonen, en bij oudere flessen honing en een subtiele "
            "wasachtigheid. Het grootste verwarringsgevaar is Chardonnay: beide kunnen rijk, complex "
            "en houtgelagerd zijn, maar Chenin Blanc behoudt vrijwel altijd een striktere, hogere "
            "zuurlijn die Chardonnay — vooral na volledige MLF — mist, en toont vaker een "
            "honingachtige in plaats van boterige ondertoon.\n\n"
            "Serveer droge Chenin Blanc koel tot matig gekoeld (8–11°C) in een middelgroot glas; "
            "edelzoete stijlen verdienen een kleiner glas en een iets lagere temperatuur om de "
            "balans tussen zoet en zuur te accentueren."
        ),
        "samenvatting": (
            "- Chenin Blanc heeft de breedste stijlbandbreedte: van bloedstrak droog tot edelzoet\n"
            "- De Loire geeft precisie en mineraliteit; Zuid-Afrika geeft ronder en fruitiger\n"
            "- Unieke combinatie van hoog zuur mét body onderscheidt Chenin van andere rijke "
            "druiven\n"
            "- Blindproefmarkers: appel, peer, hoog zuur, en honing/wasachtigheid bij rijping\n"
            "- Grootste verwarringsgevaar is Chardonnay; Chenin behoudt een striktere zuurlijn"
        ),
        "food_pairing": fp(
            "Droge Chenin Blanc bij lichte gevogelte- of varkensgerechten met een romige, licht "
            "zoete saus.",
            "De combinatie van hoog zuur en body matcht zowel de romigheid van de saus als de lichte "
            "zoetheid, zonder dat een van beide de wijn overschaduwt.",
            "Edelzoete Chenin Blanc bij hartige, zoutige gerechten zonder tegenwicht van zoet of vet "
            "— de zoetheid van de wijn werkt dan storend in plaats van aanvullend.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Chenin Blanc en Chardonnay: test de zuurlijn eerst apart van het "
            "fruit. Blijft die scherp en strak ondanks body en mogelijk hout, dan is het vrijwel "
            "zeker Chenin Blanc."
        ),
        "kernbegrippen": [
            "Chenin Blanc",
            "zuur-en-body-combinatie",
            "lanoline-textuur",
            "Chardonnay-Chenin-verwarring",
            "Vouvray-precisie",
        ],
        "reflectievraag": (
            "Welke stijl van Chenin Blanc (droog, rond of edelzoet) zou jij nu het eerst aan een "
            "gast voorstellen om de veelzijdigheid van de druif te laten zien?"
        ),
    },
    23: {
        "theorie": (
            "Viognier is de meest overtuigend aromatische druif binnen de rijke witte categorie, en "
            "tegelijk de druif waarbij textuur zwaarder weegt dan zuur. Klimaat speelt een cruciale, "
            "bijna paradoxale rol: Viognier heeft warmte nodig om zijn volle aromatische potentieel "
            "te bereiken, maar te veel warmte laat het toch al lage zuur volledig wegvallen, "
            "waardoor de wijn plat en log wordt in plaats van rijk en parfumerig.\n\n"
            "De stijlbandbreedte is relatief smal vergeleken met Chenin Blanc: Viognier blijft "
            "vrijwel altijd vol, aromatisch en zacht, met abrikoos, perzik, bloemen en specerijen "
            "als primair fruit. Condrieu, de belangrijkste regio, laat zien hoe geconcentreerd en "
            "parfumerig deze druif kan worden wanneer klimaat en wijnmaken precies kloppen.\n\n"
            "Blindproefmarkers zijn: een onmiskenbaar florale, abrikooservaring die je al ruikt vóór "
            "je swirlt, een volle body, en relatief lage tot middelhoge zuren die de textuur meer "
            "laten opvallen dan de spanning. Het grootste verwarringsgevaar is Marsanne en "
            "Roussanne: alle drie zijn volle, laagzure, Rhône-gebonden druiven met stone fruit en "
            "bloemen, maar Viognier is explicieter parfumerig en abrikoosachtig, terwijl Marsanne "
            "meer body en minder aroma geeft en Roussanne juist meer finesse en een subtielere "
            "kruidigheid toevoegt.\n\n"
            "Serveer Viognier matig gekoeld (10–12°C) in een breder glas dat de aromatische "
            "ontwikkeling ruimte geeft; te koud onderdrukt precies het aromatische karakter waar "
            "deze druif om bekendstaat."
        ),
        "samenvatting": (
            "- Viognier heeft warmte nodig voor aroma, maar te veel warmte laat het zuur wegvallen\n"
            "- De stijlbandbreedte is smal: vrijwel altijd vol, aromatisch en zacht\n"
            "- Condrieu toont de meest geconcentreerde, parfumerige uitvoering van de druif\n"
            "- Blindproefmarkers: florale abrikoosaroma, volle body, relatief laag tot middelhoog "
            "zuur\n"
            "- Grootste verwarringsgevaar is Marsanne/Roussanne door vergelijkbare volheid en laag "
            "zuur"
        ),
        "food_pairing": fp(
            "Viognier bij mild gekruide gerechten met abrikoos, gember of kerrie, zoals kip in een "
            "lichte kerriesaus.",
            "De florale, abrikoosachtige aromatiek van de wijn sluit direct aan bij de kruiden in "
            "het gerecht, terwijl de volle body de romigheid van de saus draagt.",
            "Viognier bij zeer zure of scherp gekruide gerechten — het lage zuur van de wijn kan dan "
            "niet tegen de scherpte op en de wijn voelt plat aan.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Viognier, Marsanne en Roussanne: let op de intensiteit van florale "
            "abrikoosaroma. Is die overweldigend aanwezig, dan is het vrijwel zeker Viognier."
        ),
        "kernbegrippen": [
            "Viognier",
            "florale abrikoosaroma",
            "Condrieu",
            "Rhône-verwarringsdrie",
            "textuur boven zuur",
        ],
        "reflectievraag": (
            "Bij welk gerecht op jouw kaart zou Viognier een verrassender maar toch logische keuze "
            "zijn dan de gebruikelijke Chardonnay?"
        ),
    },
    24: {
        "theorie": (
            "Semillon is een druif met subtiele kracht: jong relatief neutraal en wasachtig, maar "
            "met een uitzonderlijk vermogen om met flesrijping honing, toast en noten te "
            "ontwikkelen. Klimaat en regio bepalen sterk welke kant Semillon op gaat: in Hunter "
            "Valley (Australië) geeft een koel-klimaat, laag-alcohol stijl een van de meest "
            "opmerkelijke rijpingscurves in de witte wijnwereld — jong bijna karakterloos, na tien "
            "jaar diep complex met toast en honing zonder ooit hout te hebben gezien.\n\n"
            "In Bordeaux wordt Semillon vaak geblend met Sauvignon Blanc, waarbij Semillon de body "
            "en de rijpingscapaciteit levert en Sauvignon Blanc de aromatische frisheid. Bij "
            "botrytis-aantasting (edelrot) wordt Semillon bovendien de ruggengraat van Sauternes, "
            "waar geconcentreerde suikers en hoog zuur samen een evenwichtig edelzoete stijl "
            "vormen.\n\n"
            "Blindproefmarkers zijn: jong een wasachtige, citroenachtige, relatief stille aromatiek "
            "met gematigd zuur; ouder een geleidelijke verschuiving naar honing, toast en noten die "
            "niet van hout komt maar puur van flesrijping. Het verwarringsgevaar ligt vooral bij "
            "jonge, ongehoute Chardonnay of bij oudere Chenin Blanc: alle drie kunnen "
            "wasachtig-honingachtig aanvoelen, maar Semillon mist de scherpe zuurlijn van Chenin en "
            "de boterigheid die Chardonnay vaak via MLF krijgt.\n\n"
            "Serveer droge Semillon matig gekoeld (9–12°C) in een middelgroot glas; edelzoete "
            "Sauternes-stijlen serveer je kouder (8–10°C) in een klein glas om de balans tussen zoet "
            "en zuur te accentueren."
        ),
        "samenvatting": (
            "- Semillon is jong subtiel en wasachtig, maar ontwikkelt met flesrijping honing en "
            "toast\n"
            "- In Hunter Valley toont Semillon een opmerkelijke rijpingscurve zonder hout\n"
            "- In Bordeaux wordt Semillon vaak geblend met Sauvignon Blanc voor body en frisheid "
            "samen\n"
            "- Botrytis maakt Semillon de ruggengraat van edelzoete Sauternes\n"
            "- Verwarringsgevaar met jonge Chardonnay of oudere Chenin Blanc door wasachtige "
            "honingtonen"
        ),
        "food_pairing": fp(
            "Edelzoete Semillon (Sauternes-stijl) bij foie gras of een blauwschimmelkaas met "
            "honing.",
            "De geconcentreerde zoetheid en het hoge zuur van de wijn vormen tegenwicht voor de "
            "romige, zoute intensiteit van het gerecht, zonder dat een van beide overheerst.",
            "Jonge, droge Semillon bij zeer sterk gekruide gerechten — de subtiele, wasachtige stijl "
            "van de druif verdwijnt volledig tegen dominante kruiden.",
        ),
        "pro_insight": (
            "Onderschat jonge Semillon niet vanwege de stille aromatiek: leg een fles tien jaar weg "
            "en proef opnieuw — de ontwikkeling naar honing en toast is een van de meest "
            "overtuigende bewijzen van bewaarpotentieel in witte wijn."
        ),
        "kernbegrippen": [
            "Semillon",
            "Hunter Valley-rijpingscurve",
            "Bordeaux-blend",
            "botrytis-Sauternes",
            "wasachtige textuur",
        ],
        "reflectievraag": (
            "Heb jij weleens een jonge Semillon te snel afgeschreven als karakterloos — en zou je "
            "die nu anders beoordelen?"
        ),
    },
    25: {
        "theorie": (
            "Marsanne en Roussanne zijn de twee Rhône-druiven die zelden apart worden gedronken en "
            "daardoor het duidelijkste voorbeeld vormen van complementaire blending binnen witte "
            "wijn. Klimaat in Hermitage en Saint-Joseph — warm, met voldoende diurnale afkoeling — "
            "geeft beide druiven de rijpheid die ze nodig hebben zonder hun zuur volledig te "
            "verliezen.\n\n"
            "Marsanne levert body, textuur en een brede, soms amandelachtige rijkdom, maar mist op "
            "zichzelf vaak aromatische intensiteit en veroudert snel als hij alleen wordt gebotteld. "
            "Roussanne levert daarentegen aroma, elegantie en een net iets hogere zuurgraad, met "
            "kenmerken van perzik, kruiden en honing, maar heeft minder body dan Marsanne. Samen "
            "vormen ze een wijn die noch te log (zoals Marsanne alleen) noch te ijl (zoals Roussanne "
            "alleen) wordt.\n\n"
            "Blindproefmarkers zijn: volle body, matig tot laag zuur, stone fruit en amandel- of "
            "honingtonen, en een textuur die dichter bij Viognier ligt dan bij de frisse "
            "Module 4-druiven. Het grootste verwarringsgevaar is precies Viognier: alle drie zijn "
            "volle, laagzure Rhône-druiven, maar Viognier is explicieter florale-abrikoosachtig, "
            "terwijl Marsanne/Roussanne-blends meer body en een subtielere, minder parfumerige "
            "aromatiek tonen.\n\n"
            "Serveer deze blends matig gekoeld (10–13°C) in een breder glas dat de complexe, vaak "
            "wat gesloten aromatiek de ruimte geeft zich te ontwikkelen; witte Hermitage profiteert "
            "bovendien van enkele jaren flesrijping vóór het optimale drinkmoment."
        ),
        "samenvatting": (
            "- Marsanne en Roussanne worden zelden apart gebotteld en vullen elkaar functioneel "
            "aan\n"
            "- Marsanne geeft body en rijkdom maar mist aroma en veroudert snel alleen\n"
            "- Roussanne geeft aroma, elegantie en hoger zuur maar minder body\n"
            "- Blindproefmarkers: volle body, laag zuur, stone fruit, amandel- of honingtonen\n"
            "- Grootste verwarringsgevaar is Viognier, dat explicieter florale-abrikoosachtig is"
        ),
        "food_pairing": fp(
            "Marsanne-Roussanne blend bij romige schaaldierengerechten of gegratineerde vis met "
            "kruidenkorst.",
            "De volle body en subtiele kruidigheid van de blend matchen de romigheid van het "
            "gerecht, terwijl voldoende zuur de wijn toch fris genoeg houdt om niet te log te "
            "worden.",
            "Deze blend bij een lichte, rauwe visbereiding — de volle body en lage zuurgraad "
            "overweldigen de subtiliteit van het gerecht volledig.",
        ),
        "pro_insight": (
            "Bij twijfel tussen een Marsanne-Roussanne-blend en Viognier: let op de intensiteit van "
            "florale abrikoosaroma. Is die minder uitgesproken en voelt de wijn voller dan "
            "parfumerig, dan proef je waarschijnlijk de Rhône-blend."
        ),
        "kernbegrippen": [
            "Marsanne-Roussanne-complementariteit",
            "Hermitage",
            "amandel-honingprofiel",
            "Rhône-verwarringsdrie",
            "volle laagzure textuur",
        ],
        "reflectievraag": (
            "Bij welke gelegenheid op jouw kaart zou een Marsanne-Roussanne-blend een interessant "
            "alternatief zijn voor de gebruikelijke volle Chardonnay?"
        ),
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een witte wijn heeft volle body, laag zuur, stone fruit en amandeltonen, maar mist de "
            "uitgesproken florale abrikooservaring die je bij een andere Rhône-druif zou verwachten. "
            "Welke druif(en) past/passen het beste?\n\n"
            "A. Viognier\n"
            "B. Marsanne en/of Roussanne ✅\n"
            "C. Chenin Blanc\n"
            "D. Riesling\n\n"
        ),
    },
}
