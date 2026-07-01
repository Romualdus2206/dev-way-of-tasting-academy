"""Red Wine Track V2 Gold Master — lessons 1-10 (Modules 1-2: Fundament & Productie).

Specialistische verdieping voor rode wijn. Herhaalt niet het algemene
wijnfundament (wat is fermentatie, wat is tannine in basistermen, wat is
aroma — dat zit al in de Wine Foundation Track) maar focust telkens op de
rode-wijn-identiteit: tannine als structuur-as, maceratie en extractie als
stijlmotor, houtintegratie, zuurstofontwikkeling en bewaarpotentieel.
"""

from __future__ import annotations


REPAIRS: dict[int, dict] = {
    1: {
        "theorie": (
            "Rode wijn ontstaat niet door de druif alleen, maar door een bewuste keuze die "
            "precies tegenovergesteld is aan die bij witte wijn: in plaats van het sap zo snel "
            "mogelijk van de schil te scheiden, laat je gekneusde druiven — schil, pulp, pitten "
            "en soms een deel van de steel — dagen tot weken samen macereren. Kleurstoffen, "
            "anthocyanen genaamd, zitten net als bij blauwe druiven voor witte wijn vrijwel "
            "uitsluitend in de schil, maar bij rode wijn krijgen ze wél de tijd om in het sap "
            "over te gaan. Tannines volgen een ander extractiepad: ze zitten zowel in de schil "
            "als in de pitten en, bij hele-tros-vinificatie, in de steel zelf — drie bronnen met "
            "elk hun eigen extractiesnelheid en kwaliteit.\n\n"
            "Die verlengde extractie verschuift de structurele architectuur van rode wijn "
            "volledig ten opzichte van wit. Bij wit dragen zuur en extract de structuur; bij "
            "rood voegt tannine zich toe als een derde, dominante as, naast zuur en alcohol. Die "
            "zuur-tannine-alcoholdriehoek bepaalt niet alleen hoe een rode wijn aanvoelt in de "
            "mond, maar ook hoeveel bewaarpotentieel, foodpairingcapaciteit en stijlbreedte de "
            "wijn heeft — het is de reden waarom rode wijn als categorie zo veel dieper kan gaan "
            "in complexiteit dan wit.\n\n"
            "Cruciaal daarbij is dat tannine een eigen rijpheidsklok heeft die losstaat van "
            "suikerrijpheid. Suikerrijpheid meet je via de Brix-graad — hoeveel suiker de druif "
            "heeft opgebouwd — maar fenolische rijpheid meet je aan de pit en de schil zelf: "
            "bruine, houtachtige pitten en soepele, niet-groene schillen wijzen op "
            "tanninerijpheid, ongeacht wat de suikermeter zegt. Oogst je op suikerrijpheid "
            "alleen, dan loop je het risico op harde, groene tannine ondanks een perfect "
            "alcoholpercentage — een fout die je in dit vak leert vermijden door beide "
            "rijpheidsklokken apart te lezen.\n\n"
            "Je gebruikt dit onderscheid telkens wanneer je een onbekende rode wijn beoordeelt: "
            "proef eerst de textuur en rijpheid van de tannine — fijnkorrelig en soepel, of grof "
            "en verdrogend — vóór je iets zegt over fruit of lichaam. Die volgorde is het "
            "fundamentele verschil tussen foundation-niveau proeven en specialistisch "
            "rode-wijnproeven: bij rood begin je bij de structuur-as, niet bij het fruit."
        ),
        "samenvatting": (
            "- Rode wijn ontstaat door bewust verlengd contact tussen sap en gekneusde schil, "
            "pulp en pitten\n"
            "- Anthocyanen (kleur) en tannines (structuur) zijn losstaande verbindingen met elk "
            "hun eigen extractiepad\n"
            "- De zuur-tannine-alcoholdriehoek vervangt bij rood de zuur-extractbalans die bij "
            "wit de structuur draagt\n"
            "- Fenolische rijpheid (pit en schil) staat los van suikerrijpheid (Brix) en moet "
            "apart beoordeeld worden\n"
            "- Oogsten op suiker alleen kan harde, groene tannine opleveren ondanks correct "
            "alcoholpercentage"
        ),
        "pro_insight": (
            "Wanneer een gast een rode wijn 'te hard' noemt, vraag door of dat aan de "
            "tanninetextuur ligt of aan de zuurspanning — dat onderscheid bepaalt of "
            "decanteren, een hogere serveertemperatuur of simpelweg meer flesrijping het "
            "probleem oplost, en voorkomt dat je een gast onterecht naar een andere druif "
            "stuurt."
        ),
        "reflectievraag": (
            "Kun jij bij een onbekende rode wijn aangeven of de tannine fijnkorrelig-rijp of "
            "grof-groen aanvoelt, vóór je een uitspraak doet over fruit of lichaam?"
        ),
        "kernbegrippen": [
            "anthocyanen",
            "tanninearchitectuur",
            "fenolische rijpheid",
            "zuur-tannine-alcoholdriehoek",
            "schilextractie",
        ],
    },
    2: {
        "theorie": (
            "De keten van rode wijn wijkt op vrijwel elk punt af van die van witte wijn, omdat "
            "het doel niet is om extractie te vermijden maar om ze gecontroleerd te sturen. Na "
            "de oogst — waarbij fenolische rijpheid minstens zo zwaar weegt als het "
            "suikergehalte — kiest de wijnmaker eerst tussen ontstelen en steelinclusie. "
            "Ontstelen verwijdert de steel volledig en geeft een zuiverder, ronder tanninebeeld; "
            "steelinclusie laat een deel van de trosstelen mee-vergisten en voegt extra tannine, "
            "kruidigheid en soms een groene, plantaardige toon toe — een techniek die "
            "bijvoorbeeld bij Bourgogne Pinot Noir bewust wordt ingezet voor extra structuur.\n\n"
            "Na het kneuzen volgt vaak een koude weking: het most rust enkele dagen bij lage "
            "temperatuur, vóór de gisting op gang komt. Zonder de aanwezigheid van alcohol — "
            "die tannine en kleurstoffen juist sterk helpt oplossen — extraheert deze fase "
            "voornamelijk aromatische en kleurcomponenten, wat een puurder fruitbeeld geeft "
            "vóór de zwaardere tannine-extractie van de eigenlijke gisting begint.\n\n"
            "Tijdens en na de gisting wordt de wijn geperst, en net als bij wit ontstaan daarbij "
            "meerdere fracties: vin de goutte, het vrijlopende deel, is zachter en fijner van "
            "tannine, terwijl vin de presse — het onder druk geperste restant — meer kleur, "
            "tannine en structuur geeft maar ook meer ruwheid. Veel producenten proeven beide "
            "fracties apart en beslissen pas daarna, via assemblage, welk aandeel van elke "
            "fractie in de uiteindelijke cuvée terechtkomt.\n\n"
            "Je gebruikt deze keten als diagnosemiddel: proef je een rode wijn met een "
            "kruidige, iets groene rand naast rijp fruit, dan vermoed je steelinclusie; proef je "
            "opvallend stevige, wat ruwere tannine naast rijk fruit, dan is een hoog aandeel vin "
            "de presse in de assemblage waarschijnlijk."
        ),
        "samenvatting": (
            "- Oogsttiming bij rood weegt fenolische rijpheid minstens zo zwaar als "
            "suikergehalte\n"
            "- Ontstelen geeft een zuiverder tanninebeeld, steelinclusie voegt extra structuur "
            "en kruidigheid toe\n"
            "- Koude weking vóór de gisting extraheert vooral aroma en kleur, nog zonder zware "
            "tannine-extractie\n"
            "- Vin de goutte (vrijloop) is zachter, vin de presse (persfractie) geeft meer kleur "
            "en structuur\n"
            "- Assemblage bepaalt bewust welk aandeel van elke fractie in de eindwijn "
            "terechtkomt"
        ),
        "pro_insight": (
            "Leg aan gasten uit dat een lichte, kruidig-groene rand in een verder rijpe rode "
            "wijn vaak van bewuste steelinclusie komt, niet van onrijp fruit — dat voorkomt dat "
            "je een technische stijlkeuze verwart met een kwaliteitsprobleem."
        ),
        "reflectievraag": (
            "Zou jij bij een rode wijn met een kruidige, licht groene ondertoon durven "
            "inschatten of dat van steelinclusie komt of van werkelijk onrijp fruit — en welk "
            "ander kenmerk zou je daarvoor checken?"
        ),
        "kernbegrippen": [
            "ontstelen",
            "steelinclusie",
            "koude weking",
            "vin de presse",
            "assemblage",
        ],
    },
    3: {
        "theorie": (
            "Rode wijn is uniek omdat het, als enige hoofdcategorie, een derde structuurelement "
            "toevoegt aan het samenspel van zuur en alcohol: tannine. Die toevoeging is niet "
            "decoratief maar functioneel — tannine bindt zich chemisch aan eiwitten en vet, wat "
            "verklaart waarom een stevig gestructureerde rode wijn een vet stuk rood vlees als "
            "het ware 'opschoont': de eiwit-tanninebinding laat het gerecht lichter aanvoelen "
            "dan het zonder die wijn zou doen. Geen enkele andere categorie biedt die specifieke "
            "mondgevoel-interactie op dezelfde schaal.\n\n"
            "Diezelfde tannine, samen met anthocyanen, is verantwoordelijk voor het "
            "opmerkelijke bewaarpotentieel van veel rode wijnstijlen: tijdens jarenlange "
            "flesrijping binden tannine- en kleurmoleculen zich aan elkaar tot steeds grotere "
            "polymeren, die uiteindelijk als fijn sediment neerslaan. Dat proces verzacht de "
            "tanninetextuur geleidelijk zonder de structuur te laten instorten — een "
            "ontwikkeling die witte wijn, op zoete en botrytis-stijlen na, zelden op dezelfde "
            "schaal doormaakt.\n\n"
            "Rode wijn laat bovendien klimaat en druivenras extreem direct doorklinken via de "
            "mate van fenolische rijpheid: een koel klimaat geeft vaker slankere, hogere-zuur "
            "stijlen met verfijnde maar soms stevige tannine (Bourgondische Pinot Noir), terwijl "
            "een warm klimaat rijpere, zachtere tannine en meer alcohol geeft (Zuid-Australische "
            "Shiraz). Die structuurbalans tussen zuur, tannine en alcohol werkt daardoor als een "
            "betrouwbare blindproefmarker voor klimaat en stijl, veel directer dan bij witte "
            "wijn waar alleen zuur die rol speelt.\n\n"
            "Je gebruikt dit inzicht wanneer je moet uitleggen waarom rode wijn zo'n breed "
            "spectrum beslaat, van lichte, koelklimaat-Gamay tot massieve, warmklimaat-Tannat: "
            "niet omdat de druif zoveel verschilt, maar omdat tannine een derde as toevoegt "
            "waarlangs stijl, klimaat en bewaarpotentieel zich allemaal tegelijk kunnen bewegen."
        ),
        "samenvatting": (
            "- Tannine voegt bij rode wijn een derde structuuras toe naast zuur en alcohol\n"
            "- Eiwit-tanninebinding verklaart waarom rode wijn vet vlees mondgevoel-technisch "
            "'opschoont'\n"
            "- Tannine en anthocyanen binden tijdens flesrijping tot polymeren die de textuur "
            "verzachten\n"
            "- Structuurbalans tussen zuur, tannine en alcohol werkt als betrouwbare "
            "blindproefmarker voor klimaat\n"
            "- De derde as (tannine) verklaart de extreem brede stijlspreiding binnen rode wijn"
        ),
        "pro_insight": (
            "Adviseer bij een vet, eiwitrijk gerecht een rode wijn op basis van "
            "tanninestevigheid, niet alleen op basis van 'rood past bij vlees' — een te zachte "
            "tanninestructuur laat het gerecht juist zwaarder aanvoelen in plaats van lichter."
        ),
        "reflectievraag": (
            "Bij welk gerecht dat jij normaal met een stevig gestructureerde rode wijn "
            "serveert, zou de eiwit-tanninebinding eigenlijk minder werken dan je zou "
            "verwachten — en waarom?"
        ),
        "kernbegrippen": [
            "eiwit-tanninebinding",
            "structuurbalans",
            "blindproefmarker",
            "klimaatexpressie",
            "stijlspreiding",
        ],
    },
    4: {
        "theorie": (
            "In tegenstelling tot witte wijn, waar de moderne, frisse stijl een "
            "twintigste-eeuwse uitvinding is, ligt de kern van rode wijn — lange schilcontact "
            "voor kleur en tannine — al besloten in de oudste wijnbereidingstechnieken. Antieke "
            "amforawijn en de Georgische qvevri-traditie lieten sap vaak wekenlang met schillen, "
            "pitten en soms stelen in contact, wat resulteerde in stevig getanninneerde, "
            "oxidatieve wijnen — een stijl die dichter bij de hedendaagse 'oranje wijn' en "
            "natuurlijke rode wijn ligt dan bij een moderne, gepolijste Bordeaux.\n\n"
            "De Bordeaux-regio bouwde vanaf de achttiende eeuw de blend-traditie op die rode "
            "wijn wereldwijd zou beïnvloeden: Cabernet Sauvignon voor structuur en tannine, "
            "Merlot voor rondheid en volume, aangevuld met Cabernet Franc, Petit Verdot en "
            "Malbec, elk met een eigen taak binnen de assemblage. De officiële classificatie van "
            "1855 — oorspronkelijk opgesteld voor een wereldtentoonstelling — legde de "
            "hiërarchie van chateaus vast op basis van historische marktprijzen, en die rangorde "
            "staat, op een enkele wijziging na, nog steeds grotendeels overeind.\n\n"
            "Het vatgebruik bij rode wijn onderging een eigen evolutie: van grote, neutrale "
            "foudres — die vooral langzame zuurstofintegratie gaven zonder veel directe "
            "houtsmaak — naar de kleine, nieuwe barrique die vanaf de tweede helft van de "
            "twintigste eeuw wereldwijd furore maakte. Diezelfde periode kende ook een "
            "'internationale stijl' met zeer rijp geoogst fruit, zware extractie en veel nieuw "
            "hout, gericht op hoge scores bij critici; sinds de jaren 2010 corrigeren steeds "
            "meer producenten terug richting vroegere oogst, mildere extractie en "
            "terughoudender houtgebruik.\n\n"
            "Je gebruikt deze geschiedenis om 'klassiek' en 'internationaal' bij rode wijn "
            "scherp te onderscheiden: een klassieke Bordeaux-blend uit de negentiende eeuw was "
            "doorgaans lichter en zuurder dan de zwaar geëxtraheerde, houtrijke stijl die "
            "decennialang als 'traditioneel Bordeaux' gold — de correctie van de laatste jaren "
            "gaat eerder terug naar die oudere, slankere stijl dan dat ze iets nieuws uitvindt."
        ),
        "samenvatting": (
            "- Antieke amfora- en qvevri-wijn kende al lange schilcontact, resulterend in "
            "stevig getanninneerde, oxidatieve stijlen\n"
            "- Bordeaux bouwde de blend-traditie op met Cabernet Sauvignon, Merlot en "
            "aanvullende rassen elk met een eigen taak\n"
            "- De classificatie van 1855 legde een prijsgebaseerde chateau-hiërarchie vast die "
            "grotendeels nog geldt\n"
            "- Het vatgebruik evolueerde van grote, neutrale foudres naar de kleine, nieuwe "
            "barrique\n"
            "- De 'internationale stijl' met zware extractie en veel nieuw hout wordt sinds de "
            "jaren 2010 teruggedraaid"
        ),
        "pro_insight": (
            "Wanneer een gast 'klassieke Bordeaux' vraagt, vraag door of ze de zwaar "
            "geëxtraheerde, houtrijke stijl van de jaren negentig en tweeduizend bedoelen, of de "
            "slankere, zuurdere stijl die vóór die periode én sinds de correctie van de jaren "
            "2010 weer gangbaar is."
        ),
        "reflectievraag": (
            "Zou jij een zwaar geëxtraheerde, houtrijke rode wijn uit de internationale stijl "
            "nog 'traditioneel' noemen, of hoort die term eigenlijk bij de slankere stijl die "
            "daarvóór en daarna gangbaar was?"
        ),
        "kernbegrippen": [
            "cépageselectie",
            "1855-classificatie",
            "foudre-naar-barriquetransitie",
            "internationale stijlcorrectie",
            "amfora-maceratietraditie",
        ],
    },
    5: {
        "theorie": (
            "De indeling van rode wijn in lichte, medium en volle categorieën is geen "
            "smaakvoorkeur maar volgt direct uit schildikte en het bijbehorende tanninegehalte "
            "van de druif. Dunschillige rassen zoals Pinot Noir en Gamay geven van nature minder "
            "extraheerbare tannine en anthocyanen, wat resulteert in lichtere, transparantere "
            "wijnen met een hogere relatieve zuurspanning. Dikschillige rassen zoals Cabernet "
            "Sauvignon, Nebbiolo, Syrah en Tannat geven juist een veel groter extractiepotentieel, "
            "wat de basis legt voor stevig gestructureerde, langer bewaarbare stijlen.\n\n"
            "Rassen als Merlot, Sangiovese en Tempranillo vallen in een middencategorie waarbij "
            "productiekeuzes — maceratieduur, houtgebruik, oogsttijdstip — het verschil maken "
            "tussen een toegankelijke, fruitgedreven stijl en een steviger, voor bewaring "
            "geschikte versie van dezelfde druif. Sangiovese in Chianti Classico kan zowel licht "
            "en kersig zijn als, via langere maceratie en strengere selectie, stevig en "
            "tanninerijk zoals in een Chianti Classico Riserva.\n\n"
            "Naast schildikte bepaalt de keuze tussen monocépage en cuvée een tweede stijlas: "
            "een enkele druif zoals Nebbiolo in Barolo laat de karakteristieke, hoge tannine en "
            "zuur van dat ras onverbloemd zien, terwijl een Bordeaux-blend bewust meerdere "
            "rassen combineert om tannine, volume en aroma in balans te brengen — geen van "
            "beide benaderingen is superieur, het zijn twee verschillende filosofieën over "
            "structuuropbouw.\n\n"
            "Je gebruikt schildikte en extractieniveau als eerste blindproefmarker: proef je een "
            "transparante, lichte kleur met hoge zuurspanning en fijne tannine, denk aan een "
            "dunschillig ras; proef je diepe kleur, veel tanninegewicht en een langere finish, "
            "denk aan een dikschillig ras of een bewust langere maceratie."
        ),
        "samenvatting": (
            "- Dunschillige rassen als Pinot Noir en Gamay geven van nature lichtere, "
            "transparantere stijlen\n"
            "- Dikschillige rassen als Cabernet Sauvignon, Nebbiolo en Tannat geven een groot "
            "extractiepotentieel\n"
            "- Middencategorie-rassen zoals Sangiovese en Tempranillo variëren sterk op basis "
            "van productiekeuzes\n"
            "- Monocépage laat het karakter van één ras onverbloemd zien, een cuvée combineert "
            "rassen bewust\n"
            "- Kleurdiepte en tanninegewicht werken samen als eerste blindproefmarker voor het "
            "ras"
        ),
        "pro_insight": (
            "Wil je een gast snel richting een categorie sturen: vraag naar voorkeur voor "
            "kleurdiepte en tanninegewicht in plaats van naar 'licht of stevig' — dat leidt "
            "sneller naar dunschillige versus dikschillige rassen en dus naar de juiste stijl."
        ),
        "reflectievraag": (
            "Kun jij bij drie rode wijnen die je kent aangeven of hun stijl vooral van "
            "schildikte van het ras komt, of van productiekeuzes zoals maceratieduur en "
            "houtgebruik?"
        ),
        "kernbegrippen": [
            "dunschillige rassen",
            "dikschillige rassen",
            "extractiepotentieel",
            "monocépage",
            "tanninegewicht",
        ],
    },
    6: {
        "theorie": (
            "Schilcontact bij rode wijn is geen passief wachten maar een actief gestuurd proces "
            "waarbij de wijnmaker voortdurend ingrijpt om extractie te sturen. Tijdens de "
            "gisting duwt vrijkomend CO₂ de schillen omhoog tot een compacte laag boven het "
            "vloeibare most — de hoed. Zonder ingrijpen droogt die hoed uit en verzuurt hij, "
            "terwijl het onderliggende sap juist minder contact met de schil krijgt dan "
            "gewenst.\n\n"
            "Pigeage duwt de hoed fysiek terug onder het vloeistofoppervlak — met een stok, een "
            "plaat of, bij grotere volumes, mechanisch — en geeft een zachte, gelijkmatige "
            "extractie die vaak wordt geassocieerd met verfijnde, Bourgondische Pinot "
            "Noir-stijlen. Remontage pompt in plaats daarvan most van onderaf de tank uit en "
            "giet het over de hoed heen, wat behalve extractie ook zuurstof toevoegt aan de "
            "gistende most — belangrijk voor gistgezondheid, maar met een sterker effect op "
            "tanninehardheid dan pigeage.\n\n"
            "Délestage gaat een stap verder: de volledige tank wordt leeggelaten in een tweede "
            "vat, waarna de hoed instort onder zijn eigen gewicht en de most er weer overheen "
            "wordt gepompt — een intensieve techniek die vooral bij stevig gestructureerde "
            "stijlen wordt ingezet. Naast de gekozen techniek bepaalt maceratieduur — van "
            "enkele dagen tot enkele weken — samen met de extractietemperatuur (doorgaans "
            "tussen vijfentwintig en tweeëndertig graden) hoeveel tannine, kleur en aroma "
            "uiteindelijk in de wijn belanden.\n\n"
            "Je gebruikt deze technieken om een stijl te verklaren zonder het etiket te lezen: "
            "proef je een fijne, gepolijste tanninetextuur met behouden fruit, denk aan "
            "pigeage-gedreven extractie; proef je een stevigere, meer omlijnde tanninestructuur "
            "met wat meer diepte, dan wijst dat eerder op remontage of délestage."
        ),
        "samenvatting": (
            "- De hoed — schillen die door CO₂ omhoog worden geduwd — vereist actief beheer "
            "tijdens de gisting\n"
            "- Pigeage duwt de hoed onder, voor een zachte, gelijkmatige extractie\n"
            "- Remontage pompt most over de hoed en voegt tegelijk zuurstof toe aan de "
            "gistende most\n"
            "- Délestage is een intensievere techniek voor stevig gestructureerde stijlen\n"
            "- Maceratieduur en extractietemperatuur bepalen samen hoeveel tannine, kleur en "
            "aroma extraheren"
        ),
        "pro_insight": (
            "Leg aan gasten met een voorkeur voor 'zijdezachte' tannine uit dat dit vaak wijst "
            "op pigeage-gedreven wijnen, terwijl een voorkeur voor stevigere, omlijnde structuur "
            "beter aansluit bij remontage- of délestage-gedreven stijlen — dat helpt je "
            "gerichter doorvragen bij een aanbeveling."
        ),
        "reflectievraag": (
            "Zou jij bij een rode wijn met een fijne, gepolijste tanninetextuur durven "
            "inschatten of dat van pigeage komt, en welk ander kenmerk zou je daarvoor "
            "gebruiken om je hypothese te toetsen?"
        ),
        "kernbegrippen": [
            "pigeage",
            "remontage",
            "délestage",
            "maceratieduur",
            "extractietemperatuur",
        ],
    },
    7: {
        "theorie": (
            "Kleur en tannine extraheren niet gelijktijdig, en dat verschil in extractiecurve "
            "is precies waarom timing bij rode wijnproductie zo veel aandacht krijgt. "
            "Anthocyanen lossen relatief snel op, vaak al binnen de eerste dagen van maceratie, "
            "en bereiken op een gegeven moment zelfs een piek waarna de gemeten kleurintensiteit "
            "weer kan dalen — een deel van de kleurstoffen bindt zich namelijk aan tannine en "
            "andere verbindingen in plaats van vrij in oplossing te blijven. Tannine extraheert "
            "trager en blijft, zeker uit de pitten, vrijwel de hele maceratieperiode doorlopend "
            "oplopen.\n\n"
            "Dat bindingsproces heet copigmentatie: anthocyanen en bepaalde tannines vormen "
            "samen stabielere kleurcomplexen dan de losse anthocyanen zelf, wat verklaart "
            "waarom een jonge rode wijn met voldoende tanninebasis vaak een dieper, stabieler "
            "kleurbeeld toont dan een tanninearme wijn met evenveel kleurstof. Naarmate de wijn "
            "rijpt, gaat dit proces door via polymerisatie: tannine- en kleurmoleculen bouwen "
            "steeds grotere ketens, die de tanninetextuur geleidelijk verzachten en uiteindelijk "
            "als fijn sediment kunnen neerslaan.\n\n"
            "Sommige producenten verlengen de maceratie bewust tot ver na het einde van de "
            "alcoholische gisting — verlengde maceratie — om extra polymerisatie en dus zachtere "
            "tannine te bereiken zonder extra alcohol te winnen. Dat is een precisiebalans: te "
            "weinig extractietijd geeft onderontwikkelde, korte tannine, terwijl te agressieve "
            "of te lange extractie — vooral bij hoge temperatuur of overmatig pitcontact — juist "
            "harde, drogende en soms bittere tannine oplevert, samen met groene, onrijpe tonen "
            "uit te vroeg gebroken pitten.\n\n"
            "Je gebruikt deze extractiecurve als diagnosemiddel: proef je een jonge rode wijn "
            "met diepe, stabiele kleur en al relatief zachte tannine, dan vermoed je een goed "
            "gedoseerde extractie met mogelijk verlengde maceratie; proef je bittere, drogende "
            "tannine naast onrijpe, groene tonen, dan wijst dat eerder op overextractie dan op "
            "een simpel jong-wijn-kenmerk."
        ),
        "samenvatting": (
            "- Anthocyanen extraheren snel en kunnen na een piek weer dalen doordat ze zich "
            "binden aan tannine\n"
            "- Tannine extraheert trager, vooral uit de pitten, en loopt door tot ver in de "
            "maceratieperiode\n"
            "- Copigmentatie stabiliseert kleur door binding tussen anthocyanen en tannine\n"
            "- Verlengde maceratie na de gisting kan tannine verder verzachten via "
            "polymerisatie\n"
            "- Overextractie geeft harde, drogende, soms bittere tannine met groene, onrijpe "
            "tonen"
        ),
        "pro_insight": (
            "Verwar bittere, drogende tannine bij een gast niet automatisch met 'gewoon een "
            "jonge, stevige wijn' — vraag door naar groene, onrijpe tonen erbij; die combinatie "
            "wijst eerder op overextractie dan op normale jeugdige structuur, en dat verandert "
            "je bewaaradvies."
        ),
        "reflectievraag": (
            "Zou jij bij een jonge rode wijn het verschil durven benoemen tussen normale, "
            "jeugdige tanninestrengheid en tannine die wijst op overextractie — en welk "
            "bijkomend kenmerk gebruik je daarvoor?"
        ),
        "kernbegrippen": [
            "extractiecurve",
            "copigmentatie",
            "polymerisatie",
            "verlengde maceratie",
            "overextractie",
        ],
    },
    8: {
        "theorie": (
            "Alcoholische gisting bij rode wijn dient een dubbel doel dat bij wit niet speelt: "
            "naast het omzetten van suiker in alcohol, is alcohol zelf een krachtig oplosmiddel "
            "voor tannine en kleurstoffen. Daarom vergist rode wijn doorgaans veel warmer dan "
            "wit — meestal tussen vijfentwintig en tweeëndertig graden — omdat hogere "
            "temperatuur zowel de gistactiviteit als de extractiesnelheid van fenolen verhoogt. "
            "Bij te lage temperatuur blijft niet alleen de gisting trager, maar ook de "
            "extractie van kleur en tannine onderontwikkeld.\n\n"
            "Voor snelle, betrouwbare kleurextractie bij goedkopere of grootschalige productie "
            "bestaat thermovinificatie: de druiven worden kort verhit tot zeventig à tachtig "
            "graden vóór de gisting, wat de celwanden in de schil breekt en anthocyanen "
            "razendsnel vrijgeeft zonder wekenlange maceratie nodig te hebben. Het resultaat is "
            "een diep gekleurde, maar vaak structureel eenvoudigere wijn dan bij traditionele, "
            "langzame extractie via de gisting zelf.\n\n"
            "Aan het andere uiterste staat koolzuurmaceratie, de techniek achter het merendeel "
            "van de Beaujolais-stijl Gamay: hele, ongekneusde trossen worden in een gesloten "
            "tank onder een CO₂-deken geplaatst, waardoor de gisting intracellulair — binnen de "
            "druif zelf — begint, zonder gewone schilcontact-extractie. Dat geeft een opvallend "
            "laag tanninegehalte en de kenmerkende banaan- en snoepachtige estertonen die "
            "Beaujolais Nouveau herkenbaar maken. Semi-koolzuurmaceratie combineert dit principe "
            "met een deel gewone, gekneusde druiven voor een tussenstijl met iets meer "
            "structuur.\n\n"
            "Je gebruikt dit onderscheid om een stijl te verklaren aan tafel: ruikt een gast bij "
            "een lichte, fruitige rode wijn duidelijk banaan of snoepachtige tonen, dan wijst "
            "dat vrijwel zeker op koolzuurmaceratie, niet op de druif zelf — diezelfde Gamay via "
            "klassieke gisting en schilcontact geeft een heel ander, structuurrijker profiel."
        ),
        "samenvatting": (
            "- Rode wijn vergist warmer dan wit (vijfentwintig tot tweeëndertig graden) omdat "
            "alcohol tannine en kleur helpt oplossen\n"
            "- Thermovinificatie verhit druiven kort vóór de gisting voor snelle, maar "
            "structureel eenvoudigere kleurextractie\n"
            "- Koolzuurmaceratie laat hele trossen intracellulair vergisten onder een "
            "CO₂-deken, zonder gewone schilextractie\n"
            "- Koolzuurmaceratie geeft kenmerkende banaan- en snoeptonen en een laag "
            "tanninegehalte\n"
            "- Semi-koolzuurmaceratie combineert dit principe met gewone druiven voor meer "
            "structuur"
        ),
        "pro_insight": (
            "Ruikt een gast duidelijke banaan- of snoeptonen bij een lichte rode wijn en "
            "twijfelt die aan de kwaliteit, leg dan uit dat dit een bewuste stijlkeuze "
            "(koolzuurmaceratie) is, geen wijnfout — dat voorkomt onterechte twijfel over een "
            "technisch correcte fles."
        ),
        "reflectievraag": (
            "Zou jij het verschil durven benoemen tussen een Gamay gemaakt via "
            "koolzuurmaceratie en dezelfde druif via klassieke schilcontact-gisting — en welk "
            "aromakenmerk gebruik je als eerste aanwijzing?"
        ),
        "kernbegrippen": [
            "gistingstemperatuurregime",
            "thermovinificatie",
            "koolzuurmaceratie",
            "semi-koolzuurmaceratie",
            "intracellulaire gisting",
        ],
    },
    9: {
        "theorie": (
            "Houtlagering bij rode wijn doet structureel meer dan bij wit, omdat hout niet "
            "alleen textuur en aroma toevoegt maar ook zijn eigen tannine inbrengt die zich "
            "vermengt met de tannine uit de druif zelf. Via de poriën van het vat vindt "
            "geleidelijke zuurstofintegratie plaats: minieme hoeveelheden zuurstof dringen door "
            "het hout, wat de polymerisatie van druiventannine versnelt en de textuur verrondt, "
            "terwijl de houttannine zelf een extra structurele laag toevoegt bovenop wat de "
            "druif al aanlevert.\n\n"
            "De herkomst van het hout verandert het smaakprofiel aanzienlijk: Frans eikenhout "
            "geeft doorgaans fijnere, meer ingebedde tannine met subtiele kruidigheid, terwijl "
            "Amerikaans eikenhout, rijker aan bepaalde aromatische verbindingen, een "
            "uitgesprokener kokos-, vanille- en dilltoon geeft — een combinatie die klassiek is "
            "bij Rioja Tempranillo. De roostergraad tijdens het bouwen van het vat — licht, "
            "medium of zwaar gebrand — bepaalt daarbovenop of de wijn meer richting "
            "kruidig-rokerig (zware toast) of richting vanille-zoet (medium toast) evolueert.\n\n"
            "Net als bij wit verandert vatformaat de balans tussen directe houtsmaak en "
            "zuurstofintegratie: een barrique van tweehonderdvijfentwintig liter geeft veel "
            "directe houtsmaak en relatief snelle micro-oxygenatie, terwijl een grote foudre "
            "vooral zuurstofintegratie en textuurontwikkeling geeft met nauwelijks directe "
            "houtsmaak — een keuze die veel klassieke Nebbiolo- en Sangiovese-producenten bewust "
            "maken om de eigen tanninestructuur van de druif niet te overstemmen. Periodiek "
            "bijvullen (ouillage) en vatrotatie houden bovendien verdamping en ongelijkmatige "
            "oxidatie onder controle.\n\n"
            "Je gebruikt deze kennis om een wijn te lezen zonder etiket: proef je uitgesproken "
            "vanille en kokos naast stevige, zoete tannine, denk aan nieuw Amerikaans "
            "eikenhout; proef je subtiele kruidigheid en een fijn ingebedde tanninestructuur "
            "zonder dominante houtsmaak, denk aan Frans eikenhout, oudere vaten of een grote "
            "foudre."
        ),
        "samenvatting": (
            "- Hout voegt bij rode wijn eigen tannine toe, die zich mengt met de tannine uit de "
            "druif zelf\n"
            "- Zuurstofintegratie via de vatporiën versnelt polymerisatie en verrondt de "
            "tanninetextuur\n"
            "- Frans eikenhout geeft fijnere, ingebedde tannine; Amerikaans eikenhout geeft "
            "uitgesprokener vanille en kokos\n"
            "- Roostergraad bepaalt of de wijn richting kruidig-rokerig of vanille-zoet "
            "evolueert\n"
            "- Foudres geven zuurstofintegratie met weinig directe houtsmaak, in tegenstelling "
            "tot barriques"
        ),
        "pro_insight": (
            "Verwar bij gasten een uitgesproken vanille- en kokostoon niet met 'kwaliteit an "
            "sich' — leg uit dat dit vaak op nieuw Amerikaans eikenhout wijst, terwijl een "
            "subtielere, kruidigere stijl net zo goed of beter bij hun voorkeur voor de druif "
            "zelf kan passen."
        ),
        "reflectievraag": (
            "Zou jij bij een rode wijn met uitgesproken vanille en kokos durven inschatten of "
            "dat van Amerikaans eikenhout komt, en welke andere aanwijzing zou je daarbij "
            "zoeken om dat te bevestigen?"
        ),
        "kernbegrippen": [
            "zuurstofintegratie",
            "roostergraad",
            "foudre-barriqueverhouding",
            "houttannine-integratie",
            "vatrotatie",
        ],
    },
    10: {
        "theorie": (
            "Rijping van rode wijn draait om een geleidelijke chemische transformatie die "
            "verder gaat dan bij de meeste witte wijn: tannine- en kleurmoleculen blijven zich "
            "binden tot steeds grotere polymeren, tot ze op een gegeven moment te groot worden "
            "om opgelost te blijven en als fijn, korrelig sediment neerslaan. Dat proces "
            "verklaart zowel de zachtere tanninetextuur van een oudere rode wijn als de "
            "noodzaak om zo'n fles voorzichtig rechtop te laten staan vóór het serveren.\n\n"
            "Tegelijk verschuift het aromaprofiel van primair fruit naar tertiaire tonen: leer, "
            "ondergroei, gedroogd fruit, tabak en bij sommige rassen zelfs een wildtoon. Deze "
            "ontwikkeling ontstaat deels door langzame, gecontroleerde zuurstofblootstelling via "
            "de kurk en deels door de trage chemische omzetting van de resterende aromastoffen "
            "zelf. Hoe die balans precies uitpakt, hangt sterk af van het rijpingsvenster van de "
            "specifieke wijn.\n\n"
            "Het rijpingsvenster — de periode waarin een wijn optimaal in balans is tussen "
            "fruit, tannine en zuur — verschilt enorm per stijl: een lichte, tanninearme "
            "Beaujolais heeft een venster van slechts enkele jaren, terwijl een stevig "
            "gestructureerde Barolo of Bordeaux-blend soms pas na tien tot vijftien jaar zijn "
            "evenwicht bereikt en dat evenwicht vervolgens decennialang kan vasthouden. Bewaar "
            "je een wijn te lang voorbij dat venster, dan valt het fruit weg vóórdat de tannine "
            "volledig is opgelost; open je te vroeg, dan domineert de tannine nog het fruit.\n\n"
            "Je gebruikt deze kennis direct bij het decanteren van oudere rode wijn: het doel is "
            "dan niet beluchting zoals bij een jonge, gesloten wijn, maar het scheiden van de "
            "wijn van het sediment dat zich tijdens de rijping heeft gevormd — schenk daarom "
            "langzaam en stop zodra je het bezinksel in de hals ziet naderen, in plaats van "
            "agressief te decanteren zoals bij een jonge, stevige fles."
        ),
        "samenvatting": (
            "- Polymerisatie van tannine en kleurstof gaat door tot moleculen te groot worden "
            "en als sediment neerslaan\n"
            "- Het aromaprofiel verschuift van primair fruit naar tertiaire tonen als leer, "
            "ondergroei en tabak\n"
            "- Het rijpingsvenster verschilt sterk per stijl, van enkele jaren tot decennia\n"
            "- Te lang bewaren laat fruit wegvallen vóórdat tannine volledig is opgelost\n"
            "- Decanteren van oudere rode wijn dient vooral om sediment te scheiden, niet "
            "primair om te beluchten"
        ),
        "pro_insight": (
            "Decanteer een oudere, sedimentrijke rode wijn altijd langzaam en met een "
            "lichtbron onder de hals — het doel is sedimentscheiding, niet agressieve "
            "beluchting zoals bij een jonge, gesloten fles, en die verwarring kan een fragiele "
            "oudere wijn juist uitputten."
        ),
        "reflectievraag": (
            "Zou jij op basis van tanninegehalte, zuur en fruitconcentratie durven inschatten "
            "hoe lang het rijpingsvenster van een rode wijn uit je eigen voorraad nog duurt?"
        ),
        "kernbegrippen": [
            "rijpingsvenster",
            "sedimentvorming",
            "tertiaire ontwikkeling",
            "decanteermoment",
            "bewaarpotentieel",
        ],
    },
}
