-- Red Wine track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'red-wine';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'red-wine',
  'Rode wijn',
  'Leer rode wijn van Fundament tot Master: productie, proeven, druiven, service, pairing en examen.',
  6,
  now()
);

with t as (select id from academy.tracks where slug = 'red-wine')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-red-wine', 'Fundament', 1),
  ('explorer', 'productie-red-wine', 'Productie', 2),
  ('explorer', 'proeven-red-wine', 'Proeven', 3),
  ('specialist', 'lichte-druiven-red-wine', 'Lichte rode druiven', 4),
  ('specialist', 'medium-druiven-red-wine', 'Medium body druiven', 5),
  ('specialist', 'krachtige-druiven-red-wine', 'Krachtige rode druiven', 6),
  ('master', 'service-red-wine', 'Service', 7),
  ('master', 'pairing-red-wine', 'Pairing & Gastronomie', 8),
  ('master', 'examen-red-wine', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-red-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'intro-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'wat-is-rode-wijn',
    'Wat is rode wijn?',
    'Na deze les kun jij uitleggen wat rode wijn is, hoe het wordt gemaakt en waarom het verschilt van witte wijn.
',
    'Rode wijn ontstaat niet door de druif alleen, maar door een bewuste keuze die precies tegenovergesteld is aan die bij witte wijn: in plaats van het sap zo snel mogelijk van de schil te scheiden, laat je gekneusde druiven — schil, pulp, pitten en soms een deel van de steel — dagen tot weken samen macereren. Kleurstoffen, anthocyanen genaamd, zitten net als bij blauwe druiven voor witte wijn vrijwel uitsluitend in de schil, maar bij rode wijn krijgen ze wél de tijd om in het sap over te gaan. Tannines volgen een ander extractiepad: ze zitten zowel in de schil als in de pitten en, bij hele-tros-vinificatie, in de steel zelf — drie bronnen met elk hun eigen extractiesnelheid en kwaliteit.

Die verlengde extractie verschuift de structurele architectuur van rode wijn volledig ten opzichte van wit. Bij wit dragen zuur en extract de structuur; bij rood voegt tannine zich toe als een derde, dominante as, naast zuur en alcohol. Die zuur-tannine-alcoholdriehoek bepaalt niet alleen hoe een rode wijn aanvoelt in de mond, maar ook hoeveel bewaarpotentieel, foodpairingcapaciteit en stijlbreedte de wijn heeft — het is de reden waarom rode wijn als categorie zo veel dieper kan gaan in complexiteit dan wit.

Cruciaal daarbij is dat tannine een eigen rijpheidsklok heeft die losstaat van suikerrijpheid. Suikerrijpheid meet je via de Brix-graad — hoeveel suiker de druif heeft opgebouwd — maar fenolische rijpheid meet je aan de pit en de schil zelf: bruine, houtachtige pitten en soepele, niet-groene schillen wijzen op tanninerijpheid, ongeacht wat de suikermeter zegt. Oogst je op suikerrijpheid alleen, dan loop je het risico op harde, groene tannine ondanks een perfect alcoholpercentage — een fout die je in dit vak leert vermijden door beide rijpheidsklokken apart te lezen.

Je gebruikt dit onderscheid telkens wanneer je een onbekende rode wijn beoordeelt: proef eerst de textuur en rijpheid van de tannine — fijnkorrelig en soepel, of grof en verdrogend — vóór je iets zegt over fruit of lichaam. Die volgorde is het fundamentele verschil tussen foundation-niveau proeven en specialistisch rode-wijnproeven: bij rood begin je bij de structuur-as, niet bij het fruit.


## Pro insight

Wanneer een gast een rode wijn ''te hard'' noemt, vraag door of dat aan de tanninetextuur ligt of aan de zuurspanning — dat onderscheid bepaalt of decanteren, een hogere serveertemperatuur of simpelweg meer flesrijping het probleem oplost, en voorkomt dat je een gast onterecht naar een andere druif stuurt.',
    '- anthocyanen
- tanninearchitectuur
- fenolische rijpheid
- zuur-tannine-alcoholdriehoek
- schilextractie
',
    'Zonder schilcontact zou rode wijn bijna kleurloos zijn.
',
    '- Rode wijn ontstaat door bewust verlengd contact tussen sap en gekneusde schil, pulp en pitten
- Anthocyanen (kleur) en tannines (structuur) zijn losstaande verbindingen met elk hun eigen extractiepad
- De zuur-tannine-alcoholdriehoek vervangt bij rood de zuur-extractbalans die bij wit de structuur draagt
- Fenolische rijpheid (pit en schil) staat los van suikerrijpheid (Brix) en moet apart beoordeeld worden
- Oogsten op suiker alleen kan harde, groene tannine opleveren ondanks correct alcoholpercentage
',
    '### Opdracht

Zoek thuis of online een fles rode wijn.

### Checklist

- Ik heb de druivensoort bekeken
- Ik heb het alcoholpercentage bekeken
- Ik heb het land van herkomst bekeken
- Ik heb de stijl ingeschat


### Reflectievraag

Kun jij bij een onbekende rode wijn aangeven of de tannine fijnkorrelig-rijp of grof-groen aanvoelt, vóór je een uitspraak doet over fruit of lichaam?',
    8,
    1
  ),
  (
    'hoe-ontstaat-rode-wijn',
    'Hoe ontstaat rode wijn?',
    'Na deze les kun jij het basisproces van rode wijn uitleggen.
',
    'De keten van rode wijn wijkt op vrijwel elk punt af van die van witte wijn, omdat het doel niet is om extractie te vermijden maar om ze gecontroleerd te sturen. Na de oogst — waarbij fenolische rijpheid minstens zo zwaar weegt als het suikergehalte — kiest de wijnmaker eerst tussen ontstelen en steelinclusie. Ontstelen verwijdert de steel volledig en geeft een zuiverder, ronder tanninebeeld; steelinclusie laat een deel van de trosstelen mee-vergisten en voegt extra tannine, kruidigheid en soms een groene, plantaardige toon toe — een techniek die bijvoorbeeld bij Bourgogne Pinot Noir bewust wordt ingezet voor extra structuur.

Na het kneuzen volgt vaak een koude weking: het most rust enkele dagen bij lage temperatuur, vóór de gisting op gang komt. Zonder de aanwezigheid van alcohol — die tannine en kleurstoffen juist sterk helpt oplossen — extraheert deze fase voornamelijk aromatische en kleurcomponenten, wat een puurder fruitbeeld geeft vóór de zwaardere tannine-extractie van de eigenlijke gisting begint.

Tijdens en na de gisting wordt de wijn geperst, en net als bij wit ontstaan daarbij meerdere fracties: vin de goutte, het vrijlopende deel, is zachter en fijner van tannine, terwijl vin de presse — het onder druk geperste restant — meer kleur, tannine en structuur geeft maar ook meer ruwheid. Veel producenten proeven beide fracties apart en beslissen pas daarna, via assemblage, welk aandeel van elke fractie in de uiteindelijke cuvée terechtkomt.

Je gebruikt deze keten als diagnosemiddel: proef je een rode wijn met een kruidige, iets groene rand naast rijp fruit, dan vermoed je steelinclusie; proef je opvallend stevige, wat ruwere tannine naast rijk fruit, dan is een hoog aandeel vin de presse in de assemblage waarschijnlijk.


## Pro insight

Leg aan gasten uit dat een lichte, kruidig-groene rand in een verder rijpe rode wijn vaak van bewuste steelinclusie komt, niet van onrijp fruit — dat voorkomt dat je een technische stijlkeuze verwart met een kwaliteitsprobleem.',
    '- ontstelen
- steelinclusie
- koude weking
- vin de presse
- assemblage
',
    'Sommige topwijnen vergisten meer dan 30 dagen op schil.
',
    '- Oogsttiming bij rood weegt fenolische rijpheid minstens zo zwaar als suikergehalte
- Ontstelen geeft een zuiverder tanninebeeld, steelinclusie voegt extra structuurdensiteit en kruidigheid toe
- Koude weking vóór de gisting extraheert vooral aroma en kleur, nog zonder zware tannine-extractie
- Vin de goutte (vrijloop) is zachter, vin de presse (persfractie) geeft meer kleur en structuur
- Assemblage bepaalt bewust welk aandeel van elke fractie in de eindwijn terechtkomt
',
    '### Opdracht

Maak een simpel schema van het productieproces.

### Checklist

- Ik heb alle stappen genoteerd
- Ik begrijp waar extractie plaatsvindt
- Ik begrijp waar alcohol ontstaat


### Reflectievraag

Zou jij bij een rode wijn met een kruidige, licht groene ondertoon durven inschatten of dat van steelinclusie komt of van werkelijk onrijp fruit — en welk ander kenmerk zou je daarvoor checken?',
    8,
    2
  ),
  (
    'waarom-is-rode-wijn-uniek',
    'Waarom is rode wijn uniek?',
    'Na deze les begrijp jij waarom rode wijn anders is dan andere wijnstijlen.
',
    'Rode wijn is uniek omdat het, als enige hoofdcategorie, een derde structuurelement toevoegt aan het samenspel van zuur en alcohol: tannine. Die toevoeging is niet decoratief maar functioneel — tannine bindt zich chemisch aan eiwitten en vet, wat verklaart waarom een stevig gestructureerde rode wijn een vet stuk rood vlees als het ware ''opschoont'': de eiwit-tanninebinding laat het gerecht lichter aanvoelen dan het zonder die wijn zou doen. Geen enkele andere categorie biedt die specifieke mondgevoel-interactie op dezelfde schaal.

Diezelfde tannine, samen met anthocyanen, is verantwoordelijk voor het opmerkelijke bewaarpotentieel van veel rode wijnstijlen: tijdens jarenlange flesrijping binden tannine- en kleurmoleculen zich aan elkaar tot steeds grotere polymeren, die uiteindelijk als fijn sediment neerslaan. Dat proces verzacht de tanninetextuur geleidelijk zonder de structuur te laten instorten — een ontwikkeling die witte wijn, op zoete en botrytis-stijlen na, zelden op dezelfde schaal doormaakt.

Rode wijn laat bovendien klimaat en druivenras extreem direct doorklinken via de mate van fenolische rijpheid: een koel klimaat geeft vaker slankere, hogere-zuur stijlen met verfijnde maar soms stevige tannine (Bourgondische Pinot Noir), terwijl een warm klimaat rijpere, zachtere tannine en meer alcohol geeft (Zuid-Australische Shiraz). Die structuurbalans tussen zuur, tannine en alcohol werkt daardoor als een betrouwbare blindproefmarker voor klimaat en stijl, veel directer dan bij witte wijn waar alleen zuur die rol speelt.

Je gebruikt dit inzicht wanneer je moet uitleggen waarom rode wijn zo''n breed spectrum beslaat, van lichte, koelklimaat-Gamay tot massieve, warmklimaat-Tannat: niet omdat de druif zoveel verschilt, maar omdat tannine een derde as toevoegt waarlangs stijl, klimaat en bewaarpotentieel zich allemaal tegelijk kunnen bewegen.


## Pro insight

Adviseer bij een vet, eiwitrijk gerecht een rode wijn op basis van tanninestevigheid, niet alleen op basis van ''rood past bij vlees'' — een te zachte tanninearchitectuur laat het gerecht juist zwaarder aanvoelen in plaats van lichter.',
    '- eiwit-tanninebinding
- structuurbalans
- blindproefmarker
- klimaatexpressie
- stijlspreiding
',
    'Top Bordeaux kan tientallen jaren rijpen.
',
    '- Tannine voegt bij rode wijn een derde structuuras toe naast zuur en alcohol
- Eiwit-tanninebinding verklaart waarom rode wijn vet vlees mondgevoel-technisch ''opschoont''
- Tannine en anthocyanen binden tijdens flesrijping tot polymeren die de textuur verzachten
- Structuurbalans tussen zuur, tannine en alcohol werkt als betrouwbare blindproefmarker voor klimaat
- De derde as (tannine) verklaart de extreem brede stijlspreiding binnen rode wijn
',
    '### Opdracht

Bedenk drie gerechten waarbij rode wijn goed past.

### Checklist

- Ik heb drie gerechten bedacht
- Ik heb rekening gehouden met kracht
- Ik heb over tannines nagedacht


### Reflectievraag

Bij welk gerecht dat jij normaal met een stevig gestructureerde rode wijn serveert, zou de eiwit-tanninebinding eigenlijk minder werken dan je zou verwachten — en waarom?',
    8,
    3
  ),
  (
    'geschiedenis-rode-wijn',
    'Geschiedenis van rode wijn',
    'Na deze les begrijp jij hoe rode wijn zich historisch ontwikkelde.
',
    'In tegenstelling tot witte wijn, waar de moderne, frisse stijl een twintigste-eeuwse uitvinding is, ligt de kern van rode wijn — lange schilcontact voor kleur en tannine — al besloten in de oudste wijnbereidingstechnieken. Antieke amforawijn en de Georgische qvevri-traditie lieten sap vaak wekenlang met schillen, pitten en soms stelen in contact, wat resulteerde in stevig getanninneerde, oxidatieve wijnen — een stijl die dichter bij de hedendaagse ''oranje wijn'' en natuurlijke rode wijn ligt dan bij een moderne, gepolijste Bordeaux.

De Bordeaux-regio bouwde vanaf de achttiende eeuw de blend-traditie op die rode wijn wereldwijd zou beïnvloeden: Cabernet Sauvignon voor structuurdensiteit en tannine, Merlot voor rondheid en volume, aangevuld met Cabernet Franc, Petit Verdot en Malbec, elk met een eigen taak binnen de assemblage. De officiële classificatie van 1855 — oorspronkelijk opgesteld voor een wereldtentoonstelling — legde de hiërarchie van chateaus vast op basis van historische marktprijzen, en die rangorde staat, op een enkele wijziging na, nog steeds grotendeels overeind.

Het vatgebruik bij rode wijn onderging een eigen evolutie: van grote, neutrale foudres — die vooral langzame zuurstofintegratie gaven zonder veel directe houtsmaak — naar de kleine, nieuwe barrique die vanaf de tweede helft van de twintigste eeuw wereldwijd furore maakte. Diezelfde periode kende ook een ''internationale stijl'' met zeer rijp geoogst fruit, zware extractie en veel nieuw hout, gericht op hoge scores bij critici; sinds de jaren 2010 corrigeren steeds meer producenten terug richting vroegere oogst, mildere extractie en terughoudender houtgebruik.

Je gebruikt deze geschiedenis om ''klassiek'' en ''internationaal'' bij rode wijn scherp te onderscheiden: een klassieke Bordeaux-blend uit de negentiende eeuw was doorgaans lichter en zuurder dan de zwaar geëxtraheerde, houtrijke stijl die decennialang als ''traditioneel Bordeaux'' gold — de correctie van de laatste jaren gaat eerder terug naar die oudere, slankere stijl dan dat ze iets nieuws uitvindt.


## Pro insight

Wanneer een gast ''klassieke Bordeaux'' vraagt, vraag door of ze de zwaar geëxtraheerde, houtrijke stijl van de jaren negentig en tweeduizend bedoelen, of de slankere, zuurdere stijl die vóór die periode én sinds de correctie van de jaren 2010 weer gangbaar is.',
    '- cépageselectie
- 1855-classificatie
- foudre-naar-barriquetransitie
- internationale stijlcorrectie
- amfora-maceratietraditie
',
    'De Romeinen plantten al wijnstokken in Bordeaux.
',
    '- Antieke amfora- en qvevri-wijn kende al lange schilcontact, resulterend in stevig getanninneerde, oxidatieve stijlen
- Bordeaux bouwde de blend-traditie op met Cabernet Sauvignon, Merlot en aanvullende rassen elk met een eigen taak
- De classificatie van 1855 legde een prijsgebaseerde chateau-hiërarchie vast die grotendeels nog geldt
- Het vatgebruik evolueerde van grote, neutrale foudres naar de kleine, nieuwe barrique
- De ''internationale stijl'' met zware extractie en veel nieuw hout wordt sinds de jaren 2010 teruggedraaid
',
    '### Opdracht

Zoek de drie oudste beroemde rode wijngebieden.

### Checklist

- Ik heb drie regio''s gevonden
- Ik weet in welk land ze liggen
- Ik weet welke druiven daar groeien


### Reflectievraag

Zou jij een zwaar geëxtraheerde, houtrijke rode wijn uit de internationale stijl nog ''traditioneel'' noemen, of hoort die term eigenlijk bij de slankere stijl die daarvóór en daarna gangbaar was?',
    8,
    4
  ),
  (
    'rode-wijncategorieen',
    'Belangrijkste rode wijncategorieën',
    'Na deze les herken jij de belangrijkste stijlcategorieën van rode wijn.
',
    'De indeling van rode wijn in lichte, medium en volle categorieën is geen smaakvoorkeur maar volgt direct uit schildikte en het bijbehorende tanninegehalte van de druif. Dunschillige rassen zoals Pinot Noir en Gamay geven van nature minder extraheerbare tannine en anthocyanen, wat resulteert in lichtere, transparantere wijnen met een hogere relatieve zuurspanning. Dikschillige rassen zoals Cabernet Sauvignon, Nebbiolo, Syrah en Tannat geven juist een veel groter extractiepotentieel, wat de basis legt voor stevig gestructureerde, langer bewaarbare stijlen.

Rassen als Merlot, Sangiovese en Tempranillo vallen in een middencategorie waarbij productiekeuzes — maceratieduur, houtgebruik, oogsttijdstip — het verschil maken tussen een toegankelijke, fruitgedreven stijl en een steviger, voor bewaring geschikte versie van dezelfde druif. Sangiovese in Chianti Classico kan zowel licht en kersig zijn als, via langere maceratie en strengere selectie, stevig en tanninerijk zoals in een Chianti Classico Riserva.

Naast schildikte bepaalt de keuze tussen monocépage en cuvée een tweede stijlas: een enkele druif zoals Nebbiolo in Barolo laat de karakteristieke, hoge tannine en zuur van dat ras onverbloemd zien, terwijl een Bordeaux-blend bewust meerdere rassen combineert om tannine, volume en aroma in balans te brengen — geen van beide benaderingen is superieur, het zijn twee verschillende filosofieën over structuuropbouw.

Je gebruikt schildikte en extractieniveau als eerste blindproefmarker: proef je een transparante, lichte kleur met hoge zuurspanning en fijne tannine, denk aan een dunschillig ras; proef je diepe kleur, veel tanninegewicht en een langere finish, denk aan een dikschillig ras of een bewust langere maceratie.


## Pro insight

Wil je een gast snel richting een categorie sturen: vraag naar voorkeur voor kleurdiepte en tanninegewicht in plaats van naar ''licht of stevig'' — dat leidt sneller naar dunschillige versus dikschillige rassen en dus naar de juiste stijl.',
    '- dunschillige rassen
- dikschillige rassen
- extractiepotentieel
- monocépage
- tanninegewicht
',
    'Pinot Noir en Nebbiolo kunnen qua kleur vergelijkbaar lijken, maar totaal anders smaken.
',
    '- Dunschillige rassen als Pinot Noir en Gamay geven van nature lichtere, transparantere stijlen
- Dikschillige rassen als Cabernet Sauvignon, Nebbiolo en Tannat geven een groot extractiepotentieel
- Middencategorie-rassen zoals Sangiovese en Tempranillo variëren sterk op basis van productiekeuzes
- Monocépage laat het karakter van één ras onverbloemd zien, een cuvée combineert rassen bewust
- Kleurdiepte en tanninegewicht werken samen als eerste blindproefmarker voor het ras
',
    '### Opdracht

Zoek drie rode wijnen en deel ze in.

### Checklist

- Ik heb drie wijnen bekeken
- Ik heb body ingeschat
- Ik heb de druif bekeken


### Reflectievraag

Kun jij bij drie rode wijnen die je kent aangeven of hun stijl vooral van schildikte van het ras komt, of van productiekeuzes zoals maceratieduur en houtgebruik?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-red-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'productie-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'schilcontact-uitgelegd',
    'Schilcontact uitgelegd',
    'Na deze les kun jij uitleggen waarom schilcontact essentieel is voor rode wijn.
',
    'Schilcontact bij rode wijn is geen passief wachten maar een actief gestuurd proces waarbij de wijnmaker voortdurend ingrijpt om extractie te sturen. Tijdens de gisting duwt vrijkomend CO₂ de schillen omhoog tot een compacte laag boven het vloeibare most — de hoed. Zonder ingrijpen droogt die hoed uit en verzuurt hij, terwijl het onderliggende sap juist minder contact met de schil krijgt dan gewenst.

Pigeage duwt de hoed fysiek terug onder het vloeistofoppervlak — met een stok, een plaat of, bij grotere volumes, mechanisch — en geeft een zachte, gelijkmatige extractie die vaak wordt geassocieerd met verfijnde, Bourgondische Pinot Noir-stijlen. Remontage pompt in plaats daarvan most van onderaf de tank uit en giet het over de hoed heen, wat behalve extractie ook zuurstof toevoegt aan de gistende most — belangrijk voor gistgezondheid, maar met een sterker effect op tanninehardheid dan pigeage.

Délestage gaat een stap verder: de volledige tank wordt leeggelaten in een tweede vat, waarna de hoed instort onder zijn eigen gewicht en de most er weer overheen wordt gepompt — een intensieve techniek die vooral bij stevig gestructureerde stijlen wordt ingezet. Naast de gekozen techniek bepaalt maceratieduur — van enkele dagen tot enkele weken — samen met de extractietemperatuur (doorgaans tussen vijfentwintig en tweeëndertig graden) hoeveel tannine, kleur en aroma uiteindelijk in de wijn belanden.

Je gebruikt deze technieken om een stijl te verklaren zonder het etiket te lezen: proef je een fijne, gepolijste tanninetextuur met behouden fruit, denk aan pigeage-gedreven extractie; proef je een stevigere, meer omlijnde tanninearchitectuur met wat meer diepte, dan wijst dat eerder op remontage of délestage.


## Pro insight

Leg aan gasten met een voorkeur voor ''zijdezachte'' tannine uit dat dit vaak wijst op pigeage-gedreven wijnen, terwijl een voorkeur voor stevigere, omlijnde structuur beter aansluit bij remontage- of délestage-gedreven stijlen — dat helpt je gerichter doorvragen bij een aanbeveling.',
    '- pigeage
- remontage
- délestage
- maceratieduur
- extractietemperatuur
',
    'Pinot Noir heeft vaak dunne schillen en daardoor lichtere kleur.
',
    '- De hoed — schillen die door CO₂ omhoog worden geduwd — vereist actief beheer tijdens de gisting
- Pigeage duwt de hoed onder, voor een zachte, gelijkmatige extractie
- Remontage pompt most over de hoed en voegt tegelijk zuurstof toe aan de gistende most
- Délestage is een intensievere techniek voor stevig gestructureerde stijlen
- Maceratieduur en extractietemperatuur bepalen samen hoeveel tannine, kleur en aroma extraheren
',
    '### Opdracht

Vergelijk een lichte en een krachtige rode wijn.

### Checklist

- Ik heb de kleur bekeken
- Ik heb het mondgevoel vergeleken
- Ik heb de tannines vergeleken


### Reflectievraag

Zou jij bij een rode wijn met een fijne, gepolijste tanninetextuur durven inschatten of dat van pigeage komt, en welk ander kenmerk zou je daarvoor gebruiken om je hypothese te toetsen?',
    8,
    1
  ),
  (
    'extractie-kleur-tannine',
    'Extractie van kleur en tannine',
    'Na deze les begrijp jij wat extractie betekent.
',
    'Kleur en tannine extraheren niet gelijktijdig, en dat verschil in extractiecurve is precies waarom timing bij rode wijnproductie zo veel aandacht krijgt. Anthocyanen lossen relatief snel op, vaak al binnen de eerste dagen van maceratie, en bereiken op een gegeven moment zelfs een piek waarna de gemeten kleurintensiteit weer kan dalen — een deel van de kleurstoffen bindt zich namelijk aan tannine en andere verbindingen in plaats van vrij in oplossing te blijven. Tannine extraheert trager en blijft, zeker uit de pitten, vrijwel de hele maceratieperiode doorlopend oplopen.

Dat bindingsproces heet copigmentatie: anthocyanen en bepaalde tannines vormen samen stabielere kleurcomplexen dan de losse anthocyanen zelf, wat verklaart waarom een jonge rode wijn met voldoende tanninebasis vaak een dieper, stabieler kleurbeeld toont dan een tanninearme wijn met evenveel kleurstof. Naarmate de wijn rijpt, gaat dit proces door via polymerisatie: tannine- en kleurmoleculen bouwen steeds grotere ketens, die de tanninetextuur geleidelijk verzachten en uiteindelijk als fijn sediment kunnen neerslaan.

Sommige producenten verlengen de maceratie bewust tot ver na het einde van de alcoholische gisting — verlengde maceratie — om extra polymerisatie en dus zachtere tannine te bereiken zonder extra alcohol te winnen. Dat is een precisiebalans: te weinig extractietijd geeft onderontwikkelde, korte tannine, terwijl te agressieve of te lange extractie — vooral bij hoge temperatuur of overmatig pitcontact — juist harde, drogende en soms bittere tannine oplevert, samen met groene, onrijpe tonen uit te vroeg gebroken pitten.

Je gebruikt deze extractiecurve als diagnosemiddel: proef je een jonge rode wijn met diepe, stabiele kleur en al relatief zachte tannine, dan vermoed je een goed gedoseerde extractie met mogelijk verlengde maceratie; proef je bittere, drogende tannine naast onrijpe, groene tonen, dan wijst dat eerder op overextractie dan op een simpel jong-wijn-kenmerk.


## Pro insight

Verwar bittere, drogende tannine bij een gast niet automatisch met ''gewoon een jonge, stevige wijn'' — vraag door naar groene, onrijpe tonen erbij; die combinatie wijst eerder op overextractie dan op normale jeugdige structuur, en dat verandert je bewaaradvies.',
    '- extractiecurve
- copigmentatie
- polymerisatie
- verlengde maceratie
- overextractie
',
    'Nebbiolo heeft veel tannine maar relatief lichte kleur.
',
    '- Anthocyanen extraheren snel en kunnen na een piek weer dalen doordat ze zich binden aan tannine
- Tannine extraheert trager, vooral uit de pitten, en loopt door tot ver in de maceratieperiode
- Copigmentatie stabiliseert kleur door binding tussen anthocyanen en tannine
- Verlengde maceratie na de gisting kan tannine verder verzachten via polymerisatie
- Overextractie geeft harde, drogende, soms bittere tannine met groene, onrijpe tonen
',
    '### Opdracht

Proef een jonge rode wijn.

### Checklist

- Ik lette op astringentie
- Ik lette op kleur
- Ik lette op intensiteit


### Reflectievraag

Zou jij bij een jonge rode wijn het verschil durven benoemen tussen normale, jeugdige tanninestrengheid en tannine die wijst op overextractie — en welk bijkomend kenmerk gebruik je daarvoor?',
    8,
    2
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting',
    'Na deze les kun jij uitleggen hoe alcohol ontstaat.
',
    'Alcoholische gisting bij rode wijn dient een dubbel doel dat bij wit niet speelt: naast het omzetten van suiker in alcohol, is alcohol zelf een krachtig oplosmiddel voor tannine en kleurstoffen. Daarom vergist rode wijn doorgaans veel warmer dan wit — meestal tussen vijfentwintig en tweeëndertig graden — omdat hogere temperatuur zowel de gistactiviteit als de extractiesnelheid van fenolen verhoogt. Bij te lage temperatuur blijft niet alleen de gisting trager, maar ook de extractie van kleur en tannine onderontwikkeld.

Voor snelle, betrouwbare kleurextractie bij goedkopere of grootschalige productie bestaat thermovinificatie: de druiven worden kort verhit tot zeventig à tachtig graden vóór de gisting, wat de celwanden in de schil breekt en anthocyanen razendsnel vrijgeeft zonder wekenlange maceratie nodig te hebben. Het resultaat is een diep gekleurde, maar vaak structureel eenvoudigere wijn dan bij traditionele, langzame extractie via de gisting zelf.

Aan het andere uiterste staat koolzuurmaceratie, de techniek achter het merendeel van de Beaujolais-stijl Gamay: hele, ongekneusde trossen worden in een gesloten tank onder een CO₂-deken geplaatst, waardoor de gisting intracellulair — binnen de druif zelf — begint, zonder gewone schilcontact-extractie. Dat geeft een opvallend laag tanninegehalte en de kenmerkende banaan- en snoepachtige estertonen die Beaujolais Nouveau herkenbaar maken. Semi-koolzuurmaceratie combineert dit principe met een deel gewone, gekneusde druiven voor een tussenstijl met iets meer structuur.

Je gebruikt dit onderscheid om een stijl te verklaren aan tafel: ruikt een gast bij een lichte, fruitige rode wijn duidelijk banaan of snoepachtige tonen, dan wijst dat vrijwel zeker op koolzuurmaceratie, niet op de druif zelf — diezelfde Gamay via klassieke gisting en schilcontact geeft een heel ander, structuurrijker profiel.


## Pro insight

Ruikt een gast duidelijke banaan- of snoeptonen bij een lichte rode wijn en twijfelt die aan de kwaliteit, leg dan uit dat dit een bewuste stijlkeuze (koolzuurmaceratie) is, geen wijnfout — dat voorkomt onterechte twijfel over een technisch correcte fles.',
    '- gistingstemperatuurregime
- thermovinificatie
- koolzuurmaceratie
- semi-koolzuurmaceratie
- intracellulaire gisting
',
    'Tijdens gisting komt zoveel warmte vrij dat tanks gekoeld moeten worden.
',
    '- Rode wijn vergist warmer dan wit (vijfentwintig tot tweeëndertig graden) omdat alcohol tannine en kleur helpt oplossen
- Thermovinificatie verhit druiven kort vóór de gisting voor snelle, maar structureel eenvoudigere kleurextractie
- Koolzuurmaceratie laat hele trossen intracellulair vergisten onder een CO₂-deken, zonder gewone schilextractie
- Koolzuurmaceratie geeft kenmerkende banaan- en snoeptonen en een laag tanninegehalte
- Semi-koolzuurmaceratie combineert dit principe met gewone druiven voor meer structuur
',
    '### Opdracht

Bekijk een fermentatietank online.

### Checklist

- Ik heb een tank gezien
- Ik weet waarom temperatuur belangrijk is
- Ik begrijp waarom koeling nodig is


### Reflectievraag

Zou jij het verschil durven benoemen tussen een Gamay gemaakt via koolzuurmaceratie en dezelfde druif via klassieke schilcontact-gisting — en welk aromakenmerk gebruik je als eerste aanwijzing?',
    8,
    3
  ),
  (
    'houtlagering',
    'Houtlagering',
    'Na deze les begrijp jij wat hout doet met rode wijn.
',
    'Houtlagering bij rode wijn doet structureel meer dan bij wit, omdat hout niet alleen textuur en aroma toevoegt maar ook zijn eigen tannine inbrengt die zich vermengt met de tannine uit de druif zelf. Via de poriën van het vat vindt geleidelijke zuurstofintegratie plaats: minieme hoeveelheden zuurstof dringen door het hout, wat de polymerisatie van druiventannine versnelt en de textuur verrondt, terwijl de houttannine zelf een extra structurele laag toevoegt bovenop wat de druif al aanlevert.

De herkomst van het hout verandert het smaakprofiel aanzienlijk: Frans eikenhout geeft doorgaans fijnere, meer ingebedde tannine met subtiele kruidigheid, terwijl Amerikaans eikenhout, rijker aan bepaalde aromatische verbindingen, een uitgesprokener kokos-, vanille- en dilltoon geeft — een combinatie die klassiek is bij Rioja Tempranillo. De roostergraad tijdens het bouwen van het vat — licht, medium of zwaar gebrand — bepaalt daarbovenop of de wijn meer richting kruidig-rokerig (zware toast) of richting vanille-zoet (medium toast) evolueert.

Net als bij wit verandert vatformaat de balans tussen directe houtsmaak en zuurstofintegratie: een barrique van tweehonderdvijfentwintig liter geeft veel directe houtsmaak en relatief snelle micro-oxygenatie, terwijl een grote foudre vooral zuurstofintegratie en textuurontwikkeling geeft met nauwelijks directe houtsmaak — een keuze die veel klassieke Nebbiolo- en Sangiovese-producenten bewust maken om de eigen tanninearchitectuur van de druif niet te overstemmen. Periodiek bijvullen (ouillage) en vatrotatie houden bovendien verdamping en ongelijkmatige oxidatie onder controle.

Je gebruikt deze kennis om een wijn te lezen zonder etiket: proef je uitgesproken vanille en kokos naast stevige, zoete tannine, denk aan nieuw Amerikaans eikenhout; proef je subtiele kruidigheid en een fijn ingebedde tanninearchitectuur zonder dominante houtsmaak, denk aan Frans eikenhout, oudere vaten of een grote foudre.


## Pro insight

Verwar bij gasten een uitgesproken vanille- en kokostoon niet met ''kwaliteit an sich'' — leg uit dat dit vaak op nieuw Amerikaans eikenhout wijst, terwijl een subtielere, kruidigere stijl net zo goed of beter bij hun voorkeur voor de druif zelf kan passen.',
    '- zuurstofintegratie
- roostergraad
- foudre-barriqueverhouding
- houttannine-integratie
- vatrotatie
',
    'Barrique is vaak 225 liter.
',
    '- Hout voegt bij rode wijn eigen tannine toe, die zich mengt met de tannine uit de druif zelf
- Zuurstofintegratie via de vatporiën versnelt polymerisatie en verrondt de tanninetextuur
- Frans eikenhout geeft fijnere, ingebedde tannine; Amerikaans eikenhout geeft uitgesprokener vanille en kokos
- Roostergraad bepaalt of de wijn richting kruidig-rokerig of vanille-zoet evolueert
- Foudres geven zuurstofintegratie met weinig directe houtsmaak, in tegenstelling tot barriques
',
    '### Opdracht

Zoek een wijn met houtrijping.

### Checklist

- Ik heb houtrijping op het etiket gevonden
- Ik heb aroma''s benoemd
- Ik heb het verschil met niet-hout bedacht


### Reflectievraag

Zou jij bij een rode wijn met uitgesproken vanille en kokos durven inschatten of dat van Amerikaans eikenhout komt, en welke andere aanwijzing zou je daarbij zoeken om dat te bevestigen?',
    8,
    4
  ),
  (
    'rijping-rode-wijn',
    'Rijping van rode wijn',
    'Na deze les begrijp jij wat rijping doet met rode wijn.
',
    'Rijping van rode wijn draait om een geleidelijke chemische transformatie die verder gaat dan bij de meeste witte wijn: tannine- en kleurmoleculen blijven zich binden tot steeds grotere polymeren, tot ze op een gegeven moment te groot worden om opgelost te blijven en als fijn, korrelig sediment neerslaan. Dat proces verklaart zowel de zachtere tanninetextuur van een oudere rode wijn als de noodzaak om zo''n fles voorzichtig rechtop te laten staan vóór het serveren.

Tegelijk verschuift het aromaprofiel van primair fruit naar tertiaire tonen: leer, ondergroei, gedroogd fruit, tabak en bij sommige rassen zelfs een wildtoon. Deze ontwikkeling ontstaat deels door langzame, gecontroleerde zuurstofblootstelling via de kurk en deels door de trage chemische omzetting van de resterende aromastoffen zelf. Hoe die balans precies uitpakt, hangt sterk af van het rijpingsvenster van de specifieke wijn.

Het rijpingsvenster — de periode waarin een wijn optimaal in balans is tussen fruit, tannine en zuur — verschilt enorm per stijl: een lichte, tanninearme Beaujolais heeft een venster van slechts enkele jaren, terwijl een stevig gestructureerde Barolo of Bordeaux-blend soms pas na tien tot vijftien jaar zijn evenwicht bereikt en dat evenwicht vervolgens decennialang kan vasthouden. Bewaar je een wijn te lang voorbij dat venster, dan valt het fruit weg vóórdat de tannine volledig is opgelost; open je te vroeg, dan domineert de tannine nog het fruit.

Je gebruikt deze kennis direct bij het decanteren van oudere rode wijn: het doel is dan niet beluchting zoals bij een jonge, gesloten wijn, maar het scheiden van de wijn van het sediment dat zich tijdens de rijping heeft gevormd — schenk daarom langzaam en stop zodra je het bezinksel in de hals ziet naderen, in plaats van agressief te decanteren zoals bij een jonge, stevige fles.


## Pro insight

Decanteer een oudere, sedimentrijke rode wijn altijd langzaam en met een lichtbron onder de hals — het doel is sedimentscheiding, niet agressieve beluchting zoals bij een jonge, gesloten fles, en die verwarring kan een fragiele oudere wijn juist uitputten.',
    '- rijpingsvenster
- sedimentvorming
- tertiaire ontwikkeling
- decanteermoment
- bewaarpotentieel
',
    'Sommige topwijnen rijpen 30+ jaar.
',
    '- Polymerisatie van tannine en kleurstof gaat door tot moleculen te groot worden en als sediment neerslaan
- Het aromaprofiel verschuift van primair fruit naar tertiaire tonen als leer, ondergroei en tabak
- Het rijpingsvenster verschilt sterk per stijl, van enkele jaren tot decennia
- Te lang bewaren laat fruit wegvallen vóórdat tannine volledig is opgelost
- Decanteren van oudere rode wijn dient vooral om sediment te scheiden, niet primair om te beluchten
',
    '### Opdracht

Vergelijk een jonge en oudere rode wijn.

### Checklist

- Ik heb kleur vergeleken
- Ik heb aroma''s vergeleken
- Ik heb structuur vergeleken


### Reflectievraag

Zou jij op basis van tanninegehalte, zuur en fruitconcentratie durven inschatten hoe lang het rijpingsvenster van een rode wijn uit je eigen voorraad nog duurt?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-red-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'proeven-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'hoe-proef-je-rode-wijn',
    'Hoe proef je rode wijn?',
    'Na deze les kun jij rode wijn systematisch proeven.
',
    'Het proefprotocol voor rode wijn volgt dezelfde basisvolgorde als bij elke wijn — visueel, neus, mond, conclusie — maar de nadruk binnen die volgorde verschuift sterk ten opzichte van witte wijn. Bij rood is tannine vrijwel altijd aanwezig en neemt het de centrale structuurrol over die bij wit aan zuur toevalt. Wie dat niet beseft, proeft rood als ''wit met meer kleur'' in plaats van als een eigen structuurwereld waarin tannine, zuur, alcohol en body samen de balans bepalen.

Visueel let je bij rood vooral op de rand van de wijn, niet op een intensiteitsschaal zoals bij wit: een paarse, violette rand wijst op jeugd, een granaat- of baksteenachtige rand wijst op leeftijd of versnelde oxidatie. Kleurdiepte in de kern hangt daarnaast af van schildikte en extractie — een dunschillige druif kan intens tannine bevatten zonder ooit een diepe kleur te tonen.

Bij de neus ruik je bewust twee keer — eerst het stilstaande glas, dan na swirlen — omdat de aroma''s van rode wijn zwaarder aan polyfenolen en tannine gebonden zitten dan bij wit en dus meer beweging nodig hebben om zich te openen. Primair fruit komt uit de schil, secundaire tonen uit fermentatie en hout, tertiaire tonen uit de langzame polymerisatie van tannine en kleurstof tijdens rijping.

In de mond doorloop je een vaste volgorde: eerst zuur (frisheid, speekselopwekking), dan tannine (droogte op tandvlees en wangen), dan alcohol (warmte), dan body, en pas daarna de balans tussen die vier. Tannine is precies de as die bij witte wijn ontbreekt en die bij rood het verschil maakt tussen een oordeel dat klopt en een oordeel dat te vroeg wordt getrokken — zeker als voorbereiding op de druivenherkenning in Module 4 en 5.


## Pro insight

Voeg tannine toe als apart checklist-item ná zuur en vóór alcohol: door die twee bewust te scheiden voorkom je dat een hoog zuur een zwakke tannine verdoezelt, of omgekeerd.',
    '- rood-proefprotocol
- randanalyse rood
- tannine als structuuras
- tweefasen-ruiken rood
- zuur-tannine-alcohol-lichaamsvolgorde
',
    'De eerste indruk van kleur vertelt vaak al veel over druif en leeftijd.
',
    '- Protocol blijft visueel, neus, mond, conclusie — de nadruk verschuift naar tannine
- Bij rood is de rand het belangrijkste visuele signaal, niet een intensiteitsschaal
- Kleurdiepte hangt af van schildikte en extractie, los van tannine-intensiteit
- Ruik twee keer: rode aroma''s zitten zwaarder gebonden aan tannine dan witte
- Mondproef volgt vaste volgorde: zuur, tannine, alcohol, body, dan balans
',
    '### Opdracht

Proef een rode wijn volgens de drie stappen.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb mijn indrukken genoteerd


### Reflectievraag

Op welk moment sla jij de aparte tanninecheck nog over — en welke verkeerde stijlinschatting levert dat je meestal op?',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij kleur en intensiteit van rode wijn analyseren.
',
    'Kleur is bij rode wijn een rand-versus-kern-analyse in plaats van de lineaire intensiteitsschaal die je bij witte wijn gebruikt. De rand van het glas vertelt vooral iets over leeftijd, de kern vooral iets over druif en extractie — en die twee moet je bewust apart lezen om geen verkeerde hypothese te vormen.

Een paarse of violette rand wijst op een jonge wijn; naarmate de wijn ouder wordt verschuift de rand via robijnrood naar granaat en uiteindelijk baksteen of oranje. Die overgang ontstaat doordat antocyanen (kleurstoffen) geleidelijk polymeriseren met tannine en neerslaan, waardoor de kleur letterlijk vervaagt aan de rand terwijl de kern nog relatief diep kan blijven.

Kleurdiepte in de kern hangt sterk af van schildikte en extractie, niet uitsluitend van de druif of de leeftijd: dikschillige druiven zoals Cabernet Sauvignon of Syrah geven van nature diepe kleur, terwijl dunschillige druiven zoals Pinot Noir opvallend licht kunnen blijven — met Nebbiolo als het meest verraderlijke uiterste, omdat deze druif ondanks een lichte kleur juist extreem hoge tannine bevat. Langere of intensievere extractie (langere maceratie, pigeage, remontage) verdiept de kleur bovendien onafhankelijk van de druif zelf.

Gebruik kleur dus altijd als eerste hypothese, nooit als eindoordeel: kantel het glas tegen een witte achtergrond, beoordeel eerst de rand, dan de kern, zonder aan het etiket te denken, en laat de neus en de mond die hypothese bevestigen of ontkrachten.


## Pro insight

Beoordeel de rand en de kern altijd apart en vóór je aan de druif denkt: een lichte kern met hoge tannine is het eerste signaal dat je met een dunschillige, maar tanninerijke druif te maken kunt hebben.',
    '- rand-versus-kernanalyse
- paars-naar-baksteenovergang
- extractiediepte
- dunschillig-versus-dikschillig
- kleurhypothese rood
',
    'Nebbiolo kan licht van kleur zijn maar extreem krachtig smaken.
',
    '- Bij rood lees je kleur als rand-versus-kern, niet als één lineaire schaal
- De rand loopt van paars (jong) via robijn naar granaat en baksteen (ouder)
- Kleurdiepte in de kern hangt af van schildikte en extractie, niet alleen leeftijd
- Dunschillige druiven zoals Nebbiolo kunnen licht zijn met toch extreem hoge tannine
- Kleur is een hypothese die de neus en mond nog moeten bevestigen
',
    '### Opdracht

Bekijk twee rode wijnen naast elkaar.

### Checklist

- Ik heb kleur vergeleken
- Ik heb intensiteit vergeleken
- Ik heb leeftijd ingeschat


### Reflectievraag

Welke rode wijn op jouw kaart zou jij nu opnieuw beoordelen door de rand apart van de kern te bekijken, los van wat je al over de druif weet?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma''s herkennen',
    'Na deze les herken jij de drie aroma-lagen.
',
    'Bij rode wijn is de aromalaag rijker en donkerder van karakter dan bij wit, omdat schilcontact niet alleen kleur en tannine extraheert maar ook fenolische aromastoffen die bij directe persing grotendeels achterblijven. Primair fruit is daardoor bij rood zwaarder en diverser dan bij wit.

Primaire aroma''s komen uit de druif en de schil: rood fruit (kers, aardbei, framboos) domineert bij lichtere, dunschillige druiven zoals Pinot Noir of Gamay, terwijl zwart fruit (bosbes, braam, pruim) en kruidige tonen (peper, laurier) horen bij dikkerschillige of warmklimaat-druiven zoals Syrah of Zinfandel.

Secundaire aroma''s ontstaan door wijnmaakkeuzes: vanille, kokos, toast, rook en kruidnagel door houtrijping. Boter en room, die bij witte wijn zo bepalend zijn voor stijl, komen bij rood zelden dominant naar voren, omdat malolactische gisting bij rode wijn vrijwel altijd standaardpraktijk is in plaats van een bewuste stijlkeuze.

Tertiaire aroma''s — leer, tabak, natte aarde, paddenstoel, gedroogd fruit — ontstaan door de langzame polymerisatie van tannine en antocyanen tijdens rijping, een proces dat bij rode wijn veel explicieter en diverser verloopt dan bij witte wijn, waar vooral honing, petrol of toast domineren. De verhouding tussen rood en zwart fruit, en de aanwezigheid van dierlijke of aardse tertiaire tonen, stuurt direct je druivenhypothese in Module 4 en 5.


## Pro insight

Ruik bewust op de verhouding tussen rood en zwart fruit, niet alleen op losse descriptors — die verhouding alleen al scheidt de lichte druiven van Module 4 van de medium body druiven van Module 5.',
    '- rood-versus-zwartfruitspectrum
- tannine-antocyaanpolymerisatie
- dierlijke tertiaire tonen
- MLF bij rood als standaard
- aromaverhouding rood
',
    'Oude Bordeaux ruikt vaak naar sigarenkistje.
',
    '- Schilcontact maakt de primaire aromalaag bij rood rijker dan bij wit
- Rood fruit hoort bij lichtere druiven, zwart fruit bij dikkerschillige/warmere druiven
- MLF is bij rood standaardpraktijk, dus boter/room domineert zelden zoals bij wit
- Tertiaire tonen (leer, tabak, aarde) ontstaan door tannine-antocyaanpolymerisatie
- De rood-versus-zwartfruitverhouding stuurt je druivenhypothese direct
',
    '### Opdracht

Ruik aan een rode wijn en benoem drie aroma''s.

### Checklist

- Ik vond fruit
- Ik vond hout of kruiden
- Ik dacht na over rijping


### Reflectievraag

Bij welke rode wijn verwarde jij laatst een tertiair aroma (bijvoorbeeld leer) met een primair kenmerk van de druif zelf?',
    8,
    3
  ),
  (
    'tannines-herkennen',
    'Tannines herkennen',
    'Na deze les kun jij tannines herkennen en beoordelen.
',
    'Tannine is het structuurelement dat rode wijn het meest onderscheidt van witte wijn: het is geen aroma maar een tactiele sensatie (astringentie) die ontstaat doordat polyfenolen binden aan speekseleiwitten, waardoor de mond een droog, grijpend gevoel krijgt.

Tannine komt uit drie bronnen die elk een eigen textuur geven: schiltannine is het fijnste en meest polijstbare, pittannine is grover en bitterder en ontstaat vooral bij te agressieve extractie van de pitten, en houttannine — uit vat of steel — is vaak droger en kruidiger. Het aandeel van elke bron bepaalt of een wijn zijdeachtig of schurend aanvoelt.

Met leeftijd polymeriseren tanninemoleculen tot langere ketens die uiteindelijk gedeeltelijk neerslaan als sediment. Dat verklaart waarom een jonge, agressieve wijn na jaren rijping zachter en ronder aanvoelt zonder dat het totale tanninegehalte wezenlijk afneemt — de structuur verandert, niet de hoeveelheid.

Beoordeel tannine objectief door te letten op droogte op tandvlees en wangen, de ''astringentie'' op de tong, en hoelang die droogte aanhoudt na doorslikken. Vergelijk fijnkorrelig en zijdeachtig (zoals bij goede Pinot Noir) met grofkorrelig en schurend (zoals bij jonge Nebbiolo of onrijpe Cabernet Sauvignon). Diezelfde tannine-eiwitbinding is ook de basis van de klassieke vlees-pairing: eiwit en vet in vlees binden tannine en verzachten de astringentie, waardoor de wijn ronder aanvoelt.


## Pro insight

Vraag jezelf bij elke rode wijn af: komt deze tannine vooral van de schil, de pitten of het hout? Dat onderscheid voorkomt dat je grove pittannine verwart met een structuurrijke druif.',
    '- tannine-eiwitbinding
- schil-versus-pittanninen
- tanninepolymerisatie
- fijnkorrelig-versus-grofkorrelig
- astringentiemeting
',
    'Water neutraliseert tannines niet goed; eiwit wel.
',
    '- Tannine is een tactiele sensatie (astringentie), geen aroma
- Schiltannine is fijn, pittannine is grof en bitter, houttannine is droog en kruidig
- Met leeftijd polymeriseert tannine en slaat deels neer, waardoor de wijn zachter wordt
- Beoordeel tannine op droogte, astringentie en de duur daarvan na het doorslikken
- Tannine-eiwitbinding in vlees verzacht astringentie en verklaart de klassieke pairing
',
    '### Opdracht

Proef een jonge Cabernet Sauvignon.

### Checklist

- Ik voelde astringentie
- Ik voelde droogte
- Ik beoordeelde de intensiteit


### Reflectievraag

Welke rode wijn op jouw lijst zou je nu herclassificeren nadat je de tanninebron (schil, pit of hout) apart hebt beoordeeld?',
    8,
    4
  ),
  (
    'mini-toets-rode-wijn',
    'Mini-toets Rode Wijn',
    'Na deze les toets jij jouw kennis van Module 1–3.
',
    'Deze mini-toets bundelt alles wat rode wijn technisch en proefmatig uniek maakt: schilcontact en extractie als productiebasis, kleur als rand-en-kernhypothese, de drie aromalagen, en tannine als de centrale structuuras die je tot nu toe hebt leren beoordelen. Elk van deze vier elementen verklaart een andere laag van dezelfde wijn, en pas samen leveren ze een betrouwbare stijlhypothese op.

Schilcontact en extractie bepalen het startpunt: tijdens maceratie (koude weking, gisting op de schillen, eventueel post-fermentatieve maceratie) worden antocyanen (kleurstoffen) en tannine gelijktijdig geëxtraheerd. Langere of intensievere extractie — via pigeage of remontage — geeft een diepere kleur én meer tannine, onafhankelijk van de druif zelf. Dat is de reden waarom kleurdiepte alléén nooit een betrouwbare druifindicator is.

Kleur is daarna de eerste visuele hypothese, gelezen als rand-en-kern: een paarse rand wijst op jeugd, een granaat- of baksteenachtige rand op leeftijd of oxidatie, terwijl de kerndiepte meer zegt over schildikte en extractie dan over leeftijd — een hypothese die de neus en de mond nog moeten bevestigen.

Aroma en tannine vormen samen de resterende twee lagen: primair fruit (uit de schil), secundaire tonen (uit wijnmaak en hout) en tertiaire tonen (uit rijping, via tannine-antocyaanpolymerisatie) geven de aromatische kant, terwijl tannine zelf een aparte tactiele as is met bronnen in schil, pit en hout die met leeftijd polymeriseert en zachter wordt. Het blinde protocol brengt dit samen in vaste volgorde: kleur (rand, kern), aroma (primair versus secundair/tertiair), structuur (zuur, tannine, alcohol, body, lengte), en pas daarna een stijlhypothese. Documenteer die hypothese vóór de onthulling — dat is de enige manier om objectief te toetsen of je protocol standhoudt zonder etiket.


## Pro insight

Documenteer bij elke blinde rode wijn eerst je stijlhypothese — licht en fris of structuurrijk en warm — vóór je nadenkt over een specifieke druif. Dat voorkomt dat je te snel naar een naam raadt zonder de onderliggende structuur te checken.',
    '- schilcontact-extractiekoppeling
- rand-en-kernkleuranalyse
- drielagen-aromamodel rood
- tannine als centrale as
- blind rood-protocol
',
    '',
    '- Schilcontact en extractie zijn het productiestartpunt: kleur én tannine tegelijk
- Kleur lees je als rand-en-kern: rand toont leeftijd, kern toont schildikte/extractie
- Aroma kent drie lagen: primair (schil), secundair (wijnmaak), tertiair (rijping)
- Tannine is een aparte tactiele as met bronnen in schil, pit en hout
- Het blinde protocol volgt vaste volgorde: kleur, aroma, structuur, stijlhypothese
',
    '### Opdracht

Proef één rode wijn volledig blind (laat het etiket door iemand anders verbergen). Doorloop het volledige protocol zonder te gokken op een merknaam: beschrijf eerst de rand en de kern van de kleur apart, dan aroma (primair versus secundair/tertiair), dan structuur (zuur, tannine, alcohol, body, lengte), en formuleer pas daarna een stijlhypothese — licht en fris of structuurrijk en warm — inclusief een vermoeden over de tanninebron (schil, pit of hout). Onthul de wijn pas na het opschrijven van je hypothese.

### Checklist

- Ik heb de rand en de kern apart beschreven vóór ik aan de druif dacht
- Ik heb primaire, secundaire en tertiaire aroma''s apart benoemd
- Ik heb zuur en tannine apart beoordeeld, niet als één geheel
- Ik heb de tanninekorrel omschreven als fijn of grof
- Ik heb mijn stijlhypothese opgeschreven vóór de onthulling
- Ik heb achteraf mijn grootste denkfout in één zin vastgelegd


### Reflectievraag

Welke van de vier elementen — extractie, kleur, aroma of tannine — vergeet jij het vaakst mee te wegen vóór je een conclusie trekt over een rode wijn?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- lichte-druiven-red-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'lichte-druiven-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'pinot-noir',
    'Pinot Noir',
    'Na deze les kun jij Pinot Noir herkennen en plaatsen.
',
    'Pinot Noir is een van de meest terroir- en klimaatgevoelige druiven ter wereld: de dunne schil vraagt een koel tot matig klimaat, zoals Bourgogne, de Willamette Valley in Oregon, Central Otago in Nieuw-Zeeland, of Duitsland waar de druif Spätburgunder heet. In een te warm klimaat wordt Pinot Noir overrijp en jammy en verliest de druif zijn precisie; in een te koud klimaat blijft het fruit groen en onrijp.

Ondanks de dunne schil kan tannine bij goede Bourgogne fijnkorrelig en zijdeachtig zijn, maar het niveau blijft over het geheel laag tot medium. Zuur is hoog en draagt hier zwaarder aan de structuur dan bij dikkerschillige druiven. Het bewaarpotentieel van topwijnen (Grand Cru Bourgogne) kan decennia bedragen dankzij die hoge zuur, ondanks de lage tannine — een uitzondering op de vuistregel dat bewaarpotentieel vooral aan tannine hangt.

Blindproefmarkers zijn: een lichte kleur met een paarse tot robijnen rand, hoge zuur, lage-tot-medium fijne tannine, rood fruit (kers, aardbei, framboos) en bij rijping bosgrond of paddenstoel. Het grootste verwarringsgevaar is Nebbiolo: beide druiven kunnen verrassend licht van kleur zijn, maar Nebbiolo verbergt achter die lichte kleur juist extreem hoge, grove tannine en hoge zuur — de ''Nebbiolo-paradox''. Test daarom nooit op kleur alleen: proef de tannine apart; Pinot Noir blijft zijdeachtig en laag, Nebbiolo is agressief droog ondanks de lichte kleur.

Serveer Pinot Noir iets koeler dan andere rode wijn (14–16 °C) in een breed, bolvormig glas dat de subtiele aroma''s concentreert zonder de precisie te verliezen.


## Food pairing

### Beste pairing

Pinot Noir bij eend met paddenstoelensaus of een risotto met wilde zwammen.

### Waarom dit werkt

De hoge zuur van Pinot Noir snijdt door het vet van eend, terwijl de aardse umami van paddenstoelen resoneert met de bosgrond- en paddenstoeltonen van gerijpte Pinot Noir.

### Vermijd

Pinot Noir bij zeer pittige of sterk gekruide gerechten — de subtiele aromatiek van de druif verdwijnt volledig tegen dominante specerijen.

## Pro insight

Bij twijfel tussen Pinot Noir en Nebbiolo: negeer de kleur volledig en proef alleen de tannine-intensiteit. Blijft die zijdeachtig en laag, dan is het Pinot Noir; is die agressief droog en grof, dan is het Nebbiolo.',
    '- Pinot Noir
- Nebbiolo-kleurparadox
- fijnkorrelige tannine
- Bourgogne-terroirgevoeligheid
- zuurgedreven bewaarpotentieel
',
    'Pinot Noir is genetisch één van de oudste druivenrassen.
',
    '- Pinot Noir is extreem klimaatgevoelig: koel tot matig klimaat is noodzakelijk
- Tannine blijft laag tot medium maar fijnkorrelig; zuur draagt zwaar aan de structuur
- Hoge zuur geeft topwijnen decennialang bewaarpotentieel ondanks lage tannine
- Blindproefmarkers: lichte kleur, hoge zuur, fijne tannine, rood fruit, bosgrond
- Grootste verwarringsgevaar is Nebbiolo door de ''Nebbiolo-paradox'': licht van kleur, extreem hoge tannine
',
    '### Opdracht

Proef een Pinot Noir en let op elegantie en frisheid.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij een lichtgekleurde rode wijn nu nog steeds automatisch als ''licht van smaak'' bestempelen, of proef je eerst de tannine apart?',
    10,
    1
  ),
  (
    'gamay',
    'Gamay',
    'Na deze les herken jij Gamay.
',
    'Gamay is de druif van Beaujolais, waar granieten bodems en een matig-koel klimaat zorgen voor snelle rijping met behoud van frisheid. De tien Beaujolais Crus — waaronder Morgon, Fleurie en Moulin-à-Vent — tonen dat Gamay met de juiste bodem en het juiste klimaat verrassend serieus kan worden, ver voorbij het imago van simpele feestwijn.

Carbonic maceratie is de sleuteltechniek: hele druiventrossen gisten intracellulair onder een laag CO2, wat nauwelijks tannine uit de schil extraheert maar wel intense, directe fruitesters (banaan, kersendrop) oplevert. Dat verklaart waarom basis-Beaujolais zo laag in tannine en zo direct drinkbaar is. Cru-Beaujolais, vaak deels traditioneel gevinifieerd, heeft meer tannine en structuurdensiteit en kan enkele jaren rijpen; basis-Beaujolais en zeker Beaujolais Nouveau hebben nauwelijks bewaarpotentieel.

Blindproefmarkers zijn: een zeer lichte kleur, hoge zuur, lage tannine, en de kenmerkende banaan- of kersendropester van carbonic maceratie. Het verwarringsgevaar met Pinot Noir is reëel omdat beide licht en fris zijn, maar Gamay mist de bosgrond- en paddenstoeltonen die Pinot Noir bij rijping ontwikkelt en toont een directere, minder complexe fruitexpressie; de banaanester is bij Pinot Noir bovendien vrijwel afwezig.

Serveer basis-Beaujolais licht gekoeld (12–14 °C, kouder dan de meeste rode wijn) om de frisheid te accentueren; Cru-Beaujolais verdient een iets hogere temperatuur (15–16 °C) om de extra structuur te tonen.


## Food pairing

### Beste pairing

Licht gekoelde Gamay bij een charcuterieplank of eenvoudige bistrogerechten zoals een lichte coq au vin.

### Waarom dit werkt

De lage tannine en hoge zuur matchen qua intensiteit met lichte, zoute gerechten zonder de wijn te overweldigen, terwijl het zuur de vetheid van charcuterie doorbreekt.

### Vermijd

Gamay bij zware, romige stoofschotels — de wijn is qua intensiteit te licht om daar tegenop te wegen en verdwijnt volledig.

## Pro insight

Ruik bewust op de banaan- of kersendropester bij twijfel tussen Gamay en Pinot Noir — die noot is het meest betrouwbare signaal van carbonic maceratie en dus van Gamay.',
    '- Gamay
- carbonic maceratie
- Beaujolais Cru-versus-basisonderscheid
- banaanester
- Gamay-Pinot Noir-verwarring
',
    'Beaujolais Nouveau is wereldwijd één van de snelst uitgebrachte wijnen.
',
    '- Beaujolais'' granieten bodems en matig-koel klimaat geven Gamay frisheid en snelheid
- Carbonic maceratie extraheert weinig tannine maar geeft intense banaan/kersendropester
- Cru-Beaujolais heeft meer structuurdensiteit en bewaarpotentieel dan basis-Beaujolais
- Blindproefmarkers: zeer lichte kleur, hoge zuur, lage tannine, banaanester
- Verwarringsgevaar met Pinot Noir; Gamay mist de bosgrond/paddenstoeltonen bij rijping
',
    '### Opdracht

Vergelijk Gamay met Pinot Noir.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij Cru-Beaujolais nu serieuzer behandelen dan basis-Beaujolais, en op welk kenmerk zou je dat onderscheid baseren?',
    10,
    2
  ),
  (
    'grenache',
    'Grenache',
    'Na deze les begrijp jij Grenache.
',
    'Grenache gedijt in hete, droge klimaten met veel zonuren — Châteauneuf-du-Pape, Priorat en delen van Australië (in GSM-blends) laten zien hoe de druif in warmte rijp fruit en hoog alcohol ontwikkelt. In koelere omstandigheden blijft Grenache dun en weinig expressief, wat verklaart waarom de druif zelden op eigen kracht in koele klimaten wordt geplant.

Grenache heeft van nature laag-tot-medium, zachte tannine en relatief laag zuur — een combinatie die de wijn snel toegankelijk maakt maar het bewaarpotentieel beperkt tenzij hij wordt gecombineerd met structuurdruiven. Daarom wordt Grenache in de klassieke GSM-blend (Grenache-Syrah-Mourvèdre) gecombineerd met Syrah voor kleur, peper en tannine, en met Mourvèdre voor structuurdensiteit en aardsheid: Grenache levert het rijpe fruit en de alcohol, de andere twee leveren het geraamte.

Blindproefmarkers zijn: hoog alcohol, laag-medium zuur, zachte tannine, rijp rood fruit (framboos, aardbeienjam) met kruidige garrigue-ondertonen (laurier, tijm). Het grootste verwarringsgevaar is Zinfandel: beide zijn warme-klimaat, hoog-alcohol, jammy druiven, maar Grenache heeft doorgaans een subtielere, kruidige garrigue-ondertoon terwijl Zinfandel explicieter naar zwart fruit en zwarte peper neigt met vaak nog hoger alcohol.

Serveer Grenache-gedomineerde wijnen matig gekoeld (15–17 °C) in een breed glas dat het alcohol laat verdampen en de kruidige, aardse garrigue-ondertonen naar boven brengt.


## Food pairing

### Beste pairing

Grenache-gedomineerde wijn bij lamsschouder met Provençaalse kruiden of een Marokkaanse lamstajine.

### Waarom dit werkt

Het hoge alcohol en de zachte tannine matchen de rijkdom van het vette lamsvlees, terwijl de kruidige garrigue-toon de kruiden in het gerecht spiegelt en het zout in de tajine de vruchtrijkdom van de wijn accentueert.

### Vermijd

Grenache bij lichte, delicate visgerechten — het hoge alcohol en de rijpe fruitconcentratie overweldigen de subtiliteit volledig.

## Pro insight

Bij twijfel tussen Grenache en Zinfandel: zoek naar een kruidige garrigue-ondertoon (laurier, tijm). Vind je die, dan proef je waarschijnlijk Grenache.',
    '- Grenache
- GSM-blend
- garrigue-kruidigheid
- Grenache-Zinfandel-verwarring
- warmteklimaat-alcoholopbouw
',
    'Grenache is één van de meest aangeplante druiven ter wereld.
',
    '- Grenache gedijt in hete, droge klimaten en levert rijp fruit met hoog alcohol
- Van nature laag-medium zachte tannine en laag zuur beperkt het bewaarpotentieel solo
- In de GSM-blend levert Grenache fruit en alcohol, Syrah en Mourvèdre het geraamte
- Blindproefmarkers: hoog alcohol, laag zuur, zachte tannine, garrigue-kruidigheid
- Grootste verwarringsgevaar is Zinfandel, dat explicieter zwarte peper en fruit toont
',
    '### Opdracht

Zoek een Grenache-blend.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welke blend op jouw kaart met Grenache zou je nu anders beschrijven nadat je de rol van Syrah en Mourvèdre daarin apart hebt leren zien?',
    10,
    3
  ),
  (
    'cinsault',
    'Cinsault',
    'Na deze les herken jij Cinsault.
',
    'Cinsault is een warmteminnende, hoogopbrengende druif die van nature dunschillig is ondanks het warme klimaat waarin hij groeit — zuidelijk Frankrijk (Languedoc, zuidelijke Rhône), Zuid-Afrika en Libanon (de Bekaa-vallei) zijn de belangrijkste gebieden. De combinatie van warmte en dunne schil geeft een paradoxaal lichte, soepele wijn ondanks de hitte.

Tannine is bij Cinsault laag en zacht, zuur eveneens gematigd: de druif mist de structuur om lang te rijpen en wordt daarom zelden solo gebotteld voor bewaring — het bewaarpotentieel is kort tot middellang. Precies die lage tannine en het bloemige karakter maken Cinsault historisch een van de belangrijkste roosédruiven ter wereld, van Provence tot Zuid-Afrika.

Blindproefmarkers zijn: een lichte kleur, lage tannine, bloemige (viooltjes) en rood fruit-tonen, en een soepel mondgevoel zonder de hoge zuur die Gamay kenmerkt. Het verwarringsgevaar ligt vooral bij Grenache, waarmee Cinsault vaak wordt geblend: Grenache heeft aanzienlijk hoger alcohol en meer geconcentreerd fruit, terwijl Cinsault lichter, bloemiger en directer blijft — in een blend herken je Cinsault aan de opfrissende, minder geconcentreerde onderlaag onder het rijpere Grenache-fruit.

Serveer Cinsault, en Cinsault-gedomineerde rosé, goed gekoeld (10–13 °C) in een smal glas dat de bloemige frisheid focust.


## Food pairing

### Beste pairing

Cinsault bij gegrilde sardines of een mezeplank met olijven en tapenade.

### Waarom dit werkt

De lage tannine laat Cinsault ongewoon goed samengaan met vis, terwijl de bloemige lichtheid qua intensiteit precies aansluit bij zoute, mediterrane kleine gerechten.

### Vermijd

Cinsault bij zwaar gekruide, rijke vleesschotels — de lichte, bloemige structuur verdwijnt volledig tegen die intensiteit.

## Pro insight

In een Grenache-Cinsault-blend zoek je naar de opfrissende, bloemige onderlaag om Cinsault te identificeren — die verdwijnt niet, ook al domineert Grenache qua volume.',
    '- Cinsault
- Bekaa-vallei
- roosébasis Cinsault
- Cinsault-Grenache-blendverhouding
- bloemige lichtheid
',
    'Cinsault is ouder van Pinotage.
',
    '- Cinsault is warmteminnend maar van nature dunschillig, met een paradoxaal lichte stijl
- Lage, zachte tannine en gematigd zuur geven een kort tot middellang bewaarpotentieel
- Historisch een van de belangrijkste roosédruiven, van Provence tot Zuid-Afrika
- Blindproefmarkers: lichte kleur, lage tannine, bloemige en rood-fruittonen
- Verwarringsgevaar met Grenache in blends; Cinsault is de lichtere, bloemiger onderlaag
',
    '### Opdracht

Vergelijk Cinsault met Grenache.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij Cinsault nu overwegen bij een visgerecht, ondanks dat het een rode druif is?',
    8,
    4
  ),
  (
    'mencia',
    'Mencía',
    'Na deze les begrijp jij Mencía.
',
    'Mencía komt uit het noordwesten van Spanje — Bierzo en Ribeira Sacra — waar steile leisteen- en kwartsietbodems in een overgangsklimaat tussen Atlantisch en continentaal een combinatie van rijpheid en frisheid opleveren die zeldzaam is voor Spanje. De vaak extreem steile, met de hand bewerkte wijngaarden dragen bovendien bij aan lage opbrengsten en geconcentreerd fruit.

Mencía heeft medium tannine met een fijne, soms iets stroeve korrel, en behoudt door het koelere klimaat een relatief hoge zuurgraad vergeleken met andere Spaanse rode druiven zoals Tempranillo of Garnacha. Die combinatie van medium tannine en hoge zuur geeft topwijnen uit Bierzo een bewaarpotentieel van tien tot vijftien jaar.

Blindproefmarkers zijn: rood fruit, florale (viooltjes) tonen, een herkenbare minerale of leisteenachtige ondertoon, en frisse zuren met medium tannine. Het grootste verwarringsgevaar is Pinot Noir: beide combineren rood fruit, bloemigheid en hoge zuur met een relatief lichte kleur, maar Mencía toont een explicietere minerale, bijna leisteenachtige rand die Pinot Noir mist, en de tannine ligt doorgaans iets hoger en steviger dan bij Bourgondische Pinot Noir.

Serveer Mencía matig gekoeld (14–16 °C) in een middelgroot glas dat zowel de florale top als de minerale kern ruimte geeft.


## Food pairing

### Beste pairing

Mencía bij gegrilde pulpo a la gallega (octopus met paprikapoeder) of andere Galicische visgerechten.

### Waarom dit werkt

De hoge zuur en de minerale ondertoon van Mencía sluiten aan bij de umami en rokerige paprika van het gerecht, een klassieke regionale pairing-logica.

### Vermijd

Mencía bij zeer romige, boterrijke sauzen — de minerale frisheid van de wijn verdrinkt dan in de vetrijkdom.

## Pro insight

Bij twijfel tussen Mencía en Pinot Noir: zoek naar een minerale, leisteenachtige rand naast het rode fruit. Vind je die, ga dan uit van Mencía.',
    '- Mencía
- Bierzo-leisteenbodem
- Ribeira Sacra
- Mencía-Pinot Noir-verwarring
- minerale randtoon
',
    'Veel top-Mencía komt van extreem steile wijngaarden.
',
    '- Bierzo en Ribeira Sacra combineren leisteenbodems met een Atlantisch-continentaal klimaat
- Medium tannine en relatief hoge zuur geven Mencía tien tot vijftien jaar bewaarpotentieel
- Blindproefmarkers: rood fruit, viooltjes, minerale/leisteenachtige ondertoon, hoge zuur
- Grootste verwarringsgevaar is Pinot Noir door vergelijkbaar fruit, bloemigheid en zuur
- Mencía heeft een explicietere minerale rand en iets steviger tannine dan Pinot Noir
',
    '### Opdracht

Zoek een Mencía en vergelijk met Pinot Noir.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke andere Spaanse druif zou jij nu eerder verwarren met Mencía dan met de ''grote'' Spaanse druiven Tempranillo en Garnacha?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- medium-druiven-red-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'medium-druiven-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'merlot',
    'Merlot',
    'Na deze les herken jij Merlot en begrijp je waarom deze druif zo populair is.
',
    'Merlot is een van de meest aangeplante rode druiven ter wereld en rijpt vroeger en makkelijker dan Cabernet Sauvignon, waardoor de druif ook slaagt in koelere, vochtigere omstandigheden zoals de kleiige bodems van Pomerol en Saint-Émilion in Bordeaux. In warmere klimaten (Californië, Chili) wordt Merlot al snel overrijp en verliest hij zijn kenmerkende rondheid ten gunste van jam-achtige zwaarte.

Merlot heeft een dunnere schil en minder pitten dan Cabernet Sauvignon, wat resulteert in zachtere, ronde tannine met minder astringentie; het zuur is eveneens gematigder. Die combinatie geeft Merlot een aantrekkelijke, vroege toegankelijkheid, maar de beste voorbeelden — zoals topwijnen uit Pomerol — tonen dat Merlot op kleigrond wel degelijk decennialang kan rijpen dankzij concentratie in plaats van ruwe tannine.

Blindproefmarkers zijn: een middeldiepe kleur, zachte afgeronde tannine, rijp fruit (pruim, zwarte kers), chocolade en kruidige tonen. Het grootste verwarringsgevaar is Cabernet Sauvignon: beide zijn Bordeaux-druiven die vaak samen worden geblend, maar Cabernet heeft dikkere schillen en dus meer, grovere tannine plus een herkenbare cassis-, potlood- of groene-paprikatoon door pyrazines, terwijl Merlot ronder, zachter en fruitiger blijft zonder die groene randnoot. Net zoals je later Syrah van Malbec moet leren onderscheiden op basis van peper versus zacht pruimfruit, onderscheid je Merlot van Cabernet Sauvignon op tanninearchitectuur, niet op fruitrijpheid alleen.

Serveer Merlot bij 16–18 °C in een middelgroot tot breed glas dat de ronde tannine en het rijpe fruit ruimte geeft.


## Food pairing

### Beste pairing

Merlot bij geroosterd lamsrack of eendenborst met een fruitige jus.

### Waarom dit werkt

De zachte maar aanwezige tannine van Merlot bindt nog voldoende met de eiwitten en het vet van het vlees om rond te blijven, terwijl het rijpe pruim- en kersfruit de fruitige jus spiegelt.

### Vermijd

Merlot bij zeer pittige of scherp-zure gerechten — de zachte tannine en het gematigde zuur bieden dan onvoldoende tegenwicht.

## Pro insight

Bij twijfel tussen Merlot en Cabernet Sauvignon: zoek naar een groene, potlood-achtige pyrazinenoot. Vind je die, dan proef je Cabernet; blijft de wijn puur rond en fruitig zonder die groene rand, dan is het Merlot.',
    '- Merlot
- Pomerol-kleibodem
- Merlot-Cabernet-verwarring
- schildikteverschil
- vroege toegankelijkheid
',
    '{index=4} is één van de beroemdste Merlot-wijnen ter wereld.
',
    '- Merlot rijpt vroeger dan Cabernet Sauvignon en slaagt op de kleibodems van Pomerol
- Dunnere schil en minder pitten geven zachtere, ronde tannine en gematigder zuur
- Topwijnen uit Pomerol tonen decennialang bewaarpotentieel via concentratie
- Blindproefmarkers: middeldiepe kleur, zachte tannine, pruim, zwarte kers, chocolade
- Grootste verwarringsgevaar is Cabernet Sauvignon; die toont een groene pyrazinerand
',
    '### Opdracht

Vergelijk Merlot met Cabernet Sauvignon.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke Merlot-Cabernet-blend op jouw kaart zou je nu opnieuw proeven om de twee druiven apart te herkennen in plaats van als één geheel?',
    10,
    1
  ),
  (
    'sangiovese',
    'Sangiovese',
    'Na deze les herken jij Sangiovese.
',
    'Sangiovese is de belangrijkste druif van Italië en gedijt vooral in Toscane (Chianti, Montalcino, Montepulciano), waar warme dagen en koele nachten in de heuvels zorgen voor een zeldzame combinatie van volledige fenolische rijpheid mét behoud van hoge zuren.

Sangiovese heeft medium tannine met een vaak iets stroeve, hoekige korrel, gecombineerd met opvallend hoge zuur. Deze zuur-tanninecombinatie is de reden waarom Sangiovese zo gastronomisch en zo geschikt is voor langdurige flesrijping; Brunello di Montalcino — 100% Sangiovese, wettelijk verplicht lang gerijpt — toont het bewaarpotentieel van tien tot twintig jaar het duidelijkst.

Blindproefmarkers zijn: heldere kersen- en pruimentonen, een kenmerkende aardse of theeachtige ondertoon, hoge zuur, en medium, hoekige tannine. Het grootste verwarringsgevaar is Tempranillo: beide zijn medium body, hoogzure, gastronomische druiven met leer- en aardse tertiaire tonen na houtrijping, maar Sangiovese behoudt een scherpere, meer kersachtige zuurlijn met minder zoet fruit, terwijl Tempranillo ronder overkomt, met meer leer en tabak en vaak een vanilletoon van Amerikaans eiken.

Serveer Sangiovese bij 16–18 °C in een middelgroot glas; Chianti Classico en jongere stijlen profiteren van een iets kleiner glas, Brunello van een breder glas voor de complexiteit.


## Food pairing

### Beste pairing

Sangiovese bij een klassieke tomatensaus-pasta of een pizza margherita.

### Waarom dit werkt

De hoge zuur van Sangiovese matcht direct de zuurgraad van tomaat — een van de weinige combinaties waar zuur-op-zuur werkt — terwijl het vet van kaas de tannine verzacht.

### Vermijd

Sangiovese bij zeer zoete of romige, niet-tomaatgebaseerde sauzen — zonder de tegenhanger van tomaatzuur voelt de wijn scherp en onaf.

## Pro insight

Bij twijfel tussen Sangiovese en Tempranillo: proef de zuurlijn apart van het fruit. Blijft die scherp en kersachtig, dan is het Sangiovese; wordt het fruit ronder met meer leer en vanille, dan is het Tempranillo.',
    '- Sangiovese
- Brunello di Montalcino
- Sangiovese-Tempranillo-verwarring
- kersen-zuurlijn
- tomaat-zuurmatch
',
    'Brunello is een pure Sangiovese-kloon.
',
    '- Toscane''s warme dagen en koele nachten geven Sangiovese rijpheid mét hoge zuren
- Medium, hoekige tannine gecombineerd met hoge zuur maakt Sangiovese sterk gastronomisch
- Brunello di Montalcino toont het bewaarpotentieel van tien tot twintig jaar het best
- Blindproefmarkers: kersen/pruim, aardse/theeachtige tonen, hoge zuur, hoekige tannine
- Grootste verwarringsgevaar is Tempranillo; Sangiovese blijft scherper en kersachtiger
',
    '### Opdracht

Proef een Chianti.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welk gerecht met tomaat op jouw kaart zou nu een betere Sangiovese-pairing zijn dan de wijn die er momenteel bij staat?',
    10,
    2
  ),
  (
    'tempranillo',
    'Tempranillo',
    'Na deze les herken jij Tempranillo.
',
    'Tempranillo is de koningsdruif van Spanje en dankt zijn naam aan zijn vroege rijping (''temprano'' betekent ''vroeg''), wat de druif geschikt maakt voor het continentale, extreme klimaat van Rioja en Ribera del Duero, met hete dagen en koude nachten op hoogte.

Tempranillo heeft medium tannine en medium zuur, minder scherp dan Sangiovese, en een natuurlijke affiniteit met langdurige houtrijping — traditioneel Amerikaans eiken in Rioja, tegenwoordig ook Frans eiken. De classificaties Crianza, Reserva en Gran Reserva zijn wettelijk vastgelegde minimale rijpingstermijnen in vat en fles, en tonen hoe centraal houtrijping is voor het bewaarpotentieel en de stijl van deze druif.

Blindproefmarkers zijn: rood fruit, leer, tabak en een herkenbare vanille- of kokosnoot van Amerikaans eiken, medium tannine en zuur. Het grootste verwarringsgevaar is Sangiovese: beide zijn medium body, houtgerijpte, leer-en-aarde-tonende druiven, maar Tempranillo toont een rondere, minder scherpe zuurlijn en een explicietere vanille/kokos-houttoon, terwijl Sangiovese scherper en kersachtiger blijft met minder zoete houttonen.

Serveer jonge Tempranillo (Crianza) bij 16 °C in een middelgroot glas; Reserva en Gran Reserva profiteren van een breder glas en 17–18 °C om de houtrijping en de tertiaire complexiteit te ontplooien.


## Food pairing

### Beste pairing

Tempranillo bij gegrilde chorizo, lamskoteletten of andere geroosterde vleesgerechten.

### Waarom dit werkt

De vanille/kokos-roostertonen van Amerikaans eiken in Tempranillo spiegelen de Maillard-roostertonen die ontstaan bij grillen en roosteren, een directe aroma-op-aroma match.

### Vermijd

Tempranillo bij rauwe of zeer lichte visgerechten — de houtgedreven roostertonen en de structuur overweldigen de subtiliteit van het gerecht.

## Pro insight

Bij twijfel tussen Tempranillo en Sangiovese: zoek naar een vanille- of kokos-houttoon. Vind je die duidelijk aanwezig, dan proef je waarschijnlijk Tempranillo.',
    '- Tempranillo
- Crianza-Reserva-Gran Reserva
- Amerikaans eiken-vanille
- Sangiovese-Tempranillo-verwarring
- vroege-rijpingsdruif
',
    'Rioja Reserva moet wettelijk rijpen.
',
    '- Tempranillo dankt zijn naam aan vroege rijping, geschikt voor Rioja en Ribera del Duero
- Medium tannine en zuur met een sterke affiniteit voor langdurige houtrijping
- Crianza, Reserva en Gran Reserva zijn wettelijke rijpingstermijnen die de stijl sturen
- Blindproefmarkers: rood fruit, leer, tabak, vanille/kokos van Amerikaans eiken
- Grootste verwarringsgevaar is Sangiovese; Tempranillo is ronder met meer houttoon
',
    '### Opdracht

Vergelijk jonge en gerijpte Rioja.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij het verschil tussen een Crianza en een Gran Reserva Tempranillo nu kunnen uitleggen aan een gast zonder de wettelijke definities letterlijk op te lezen?',
    10,
    3
  ),
  (
    'barbera',
    'Barbera',
    'Na deze les herken jij Barbera.
',
    'Barbera is de meest aangeplante druif van Piemonte (Asti, Alba) en groeit vaak op de minder prestigieuze hellingen die niet gereserveerd zijn voor Nebbiolo; het relatief koele, heuvelachtige klimaat van Piemonte behoudt de van nature extreem hoge zuurgraad waar de druif om bekendstaat.

Barbera heeft van nature laag tannine maar uitzonderlijk hoog zuur — een zeldzame combinatie die de wijn direct drinkbaar maakt zonder dat hij plat aanvoelt, omdat het zuur in plaats van tannine de structuur draagt. Zonder houtrijping heeft Barbera een kort tot middellang bewaarpotentieel; met bewuste houtrijping (Barbera d''Asti Superiore) kan de wijn een aantal jaren extra ontwikkelen doordat het hoge zuur als conserveringsmiddel werkt.

Blindproefmarkers zijn: donkere kersen- en pruimtonen, specerijen, zeer hoog en snijdend zuur, laag tannine en een sappig mondgevoel. Het verwarringsgevaar met Grenache is subtieler dan het lijkt: in een rijpe jaargang kunnen beide een jammy, rijp-kersachtig fruitprofiel tonen, maar de test is altijd het zuur — Barbera behoudt een snijdende, bijna appelachtige zuurgraad die Grenache, met zijn van nature lage zuur en hoge alcohol, volledig mist. Verwar dus nooit ''rijp fruit'' met ''dezelfde structuur'': proef eerst het zuur apart.

Serveer Barbera bij 15–17 °C in een middelgroot glas; de hoge zuur komt het best tot zijn recht bij een net iets hogere temperatuur dan de meest frisse witte wijn, maar kouder dan een volle Tempranillo.


## Food pairing

### Beste pairing

Barbera bij vette Piemontese salumi, vitello tonnato of gegratineerde risotto.

### Waarom dit werkt

Het snijdende zuur van Barbera doorbreekt vet en romigheid moeiteloos, terwijl de lage tannine geen conflict geeft met de zoute, hartige intensiteit van salumi.

### Vermijd

Barbera bij lichte, delicate gerechten zonder vet of zout tegenwicht — het hoge zuur domineert dan volledig.

## Pro insight

Bij twijfel tussen een rijpe Barbera en Grenache: proef het zuur apart van het fruit. Snijdt het zuur nog duidelijk door, dan is het Barbera; voelt de wijn ronder en warmer zonder die snijdende rand, dan is het Grenache.',
    '- Barbera
- Asti-Alba-hellingen
- snijdend zuur
- Barbera-Grenache-verwarring
- zuur als draagconstructie
',
    'Barbera heeft vaak meer zuren dan Nebbiolo.
',
    '- Barbera groeit op de niet-Nebbiolo-hellingen van Piemonte en behoudt extreem hoog zuur
- Lage tannine met uitzonderlijk hoog zuur laat het zuur de structuur dragen
- Zonder hout kort bewaarpotentieel; met houtrijping (Superiore) langer dankzij het zuur
- Blindproefmarkers: donkere kersen/pruim, specerijen, snijdend zuur, laag tannine
- Verwarringsgevaar met Grenache in rijpe jaargangen; het zuur is de doorslaggevende test
',
    '### Opdracht

Vergelijk Barbera met Sangiovese.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij welk vet, hartig gerecht op jouw kaart zou Barbera een logischere keuze zijn dan de huidige rode wijn?',
    8,
    4
  ),
  (
    'zinfandel',
    'Zinfandel',
    'Na deze les begrijp jij Zinfandel.
',
    'Zinfandel is genetisch identiek aan de Zuid-Italiaanse druif Primitivo (Puglia) en dankt zijn huidige faam aan Californië, met name Lodi en Sonoma, waar warme, droge zomers de druif tot extreme suikerrijpheid en dus hoog alcohol laten uitrijpen.

Zinfandel heeft medium tannine en gematigd zuur, maar het is vooral het vaak zeer hoge alcohol (soms boven 15%) dat de structuur domineert. Ongelijkmatige rijping binnen dezelfde tros — sommige bessen rozijnachtig, andere nog groen — is een bekend risico dat wijnmakers dwingt tot precieze oogsttiming. Het bewaarpotentieel is middellang; de beste voorbeelden ontwikkelen met leeftijd meer specerijen en minder primaire jamigheid.

Blindproefmarkers zijn: rijp zwart fruit (bramenjam, gedroogde vijg), zwarte peper, hoog alcohol (merkbare warmte) en medium tannine. Het verwarringsgevaar met Grenache is vergelijkbaar met dat bij Barbera-Grenache maar dan omgekeerd: beide zijn warme-klimaat, hoog-alcohol druiven met rijp fruit, maar Zinfandel toont explicieter zwarte peper en een jammy, bijna rozijnachtige concentratie, terwijl Grenache kruidiger (garrigue) en minder geconcentreerd blijft. Net zoals Syrah en Malbec later worden onderscheiden op basis van peper versus zacht pruimfruit, onderscheid je Zinfandel van Grenache op de intensiteit van zwarte peper en jamconcentratie.

Serveer Zinfandel bij 16–18 °C in een breed glas dat het hoge alcohol laat verdampen en de specerijen naar boven brengt; te koud geserveerd benadrukt de alcoholische hitte onaangenaam sterk.


## Food pairing

### Beste pairing

Zinfandel bij gerookte BBQ-ribs met een pepercrust of gegrilde spare ribs met een zoet-pittige glaze.

### Waarom dit werkt

De zwarte peper en de rokerige roostertonen van geroosterd of gegrild vlees resoneren direct met het peperprofiel van Zinfandel, terwijl het hoge alcohol en de jammy zoetheid van het fruit de lichte bitterheid van een gerookte korst in balans brengen.

### Vermijd

Zinfandel bij lichte, delicate gerechten of subtiele visbereidingen — het hoge alcohol en de geconcentreerde jamigheid overweldigen die volledig.

## Pro insight

Bij twijfel tussen Zinfandel en Grenache: zoek naar een expliciete zwarte-peperintensiteit en een bijna rozijnachtige jamconcentratie. Is die sterk aanwezig, dan proef je waarschijnlijk Zinfandel.',
    '- Zinfandel
- Primitivo-genetische identiteit
- Lodi-Sonoma
- Zinfandel-Grenache-verwarring
- ongelijkmatige trosrijping
',
    'Zinfandel is genetisch hetzelfde als Primitivo.
',
    '- Zinfandel is genetisch identiek aan Primitivo en dankt zijn faam aan Lodi en Sonoma
- Warme, droge zomers geven vaak zeer hoog alcohol, dat de structuur domineert
- Ongelijkmatige trosrijping dwingt wijnmakers tot precieze, lastige oogsttiming
- Blindproefmarkers: rijp zwart fruit, zwarte peper, hoog alcohol, medium tannine
- Verwarringsgevaar met Grenache; Zinfandel toont explicieter peper en jamconcentratie
',
    '### Opdracht

Vergelijk Zinfandel met Grenache.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij Zinfandel en Primitivo nu blind kunnen onderscheiden puur op basis van regio-typische stijlkeuzes, ondanks dat het genetisch dezelfde druif is?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- krachtige-druiven-red-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'krachtige-druiven-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'cabernet-sauvignon',
    'Cabernet Sauvignon',
    'Na deze les herken jij Cabernet Sauvignon en begrijp je zijn kracht.
',
    'Cabernet Sauvignon is genetisch geen oeroude druif maar een relatief jonge, natuurlijke kruising tussen Cabernet Franc en Sauvignon Blanc — bevestigd via DNA-onderzoek in 1996 door Carole Meredith aan UC Davis, en vermoedelijk ontstaan in de zeventiende eeuw ergens in de Bordeaux-wijngaarden. Die afkomst verklaart meteen twee kenmerken: de groene paprikatoon (methoxypyrazine, IBMP) is geërfd van beide ouders, en de dikke schil met kleine bessen — een hoge schil-tot-sap-verhouding — verklaart de van nature hoge tannine- en kleurstofconcentratie die de druif tot een structurele ruggengraat maakt.

Cabernet Sauvignon budt laat uit (ontwijkt daardoor voorjaarsvorst) maar heeft een lang, warm groeiseizoen nodig om die dikke schil volledig fenolisch te laten rijpen. Dat verklaart waarom de druif zo goed gedijt op warmtevasthoudend, goed drainerend grind — de Left Bank-terroirs van Bordeaux (Médoc, Pauillac, Margaux) en de vergelijkbare, warmere bodems van Napa Valley. Op kleirijke, vochtige grond (de Right Bank) rijpt Cabernet Sauvignon onvoldoende betrouwbaar — vandaar dat die percelen historisch naar Merlot gingen.

IBMP is geen vast kenmerk maar een rijpheidssignaal: naarmate de druif meer zonlicht en warmte krijgt, breekt dit pyrazine versneld af. Te veel groene paprika in het glas wijst daarom specialistisch gezien op onderrijpheid of een te koel jaargang, niet op een onvermijdelijk kenmerk van de druif zelf — een kwaliteitsdiagnose, geen smaakvoorkeur.

De stevige, grof-korrelige tannine van Cabernet Sauvignon integreert uitstekend met nieuw eikenhout: de tanninearchitectuur is stevig genoeg om vanilline- en toasttonen te dragen zonder overweldigd te worden, wat verklaart waarom de druif zelden ongehout wordt uitgebracht. Tegelijk vraagt die stevige structuur vaak een zachtere blendpartner — Merlot vult het midden-palet en rondt de tannine af, Petit Verdot voegt kleur en specerij toe — de klassieke logica achter de Bordeaux Left Bank-blend.

Regionale expressie varieert sterk: Napa Valley geeft door een groter diurnaal verschil rijper fruit, hogere alcohol en zachtere tannine dan het koelere Bordeaux; Coonawarra in Australië ontwikkelt een herkenbare munt-eucalyptustoon doordat eucalyptusbomen naast de wijngaarden een vluchtige stof (1,8-cineol) afgeven die zich aan de druivenschil hecht — een aantoonbaar omgevingseffect, geen druifeigen aroma.


## Food pairing

### Beste pairing

Gegrilde ribeye met pepersaus of lamsrack met rozemarijn.

### Waarom dit werkt

Het vet in het vlees bindt de stevige tannine, waardoor de wijn ronder aanvoelt en het vlees minder zwaar oogt.

### Vermijd

Delicate visgerechten of licht gekruide salades — de stevige tannine en structuur verpletteren die subtiliteit volledig.

## Pro insight

Proef een jonge Cabernet Sauvignon eerst bewust op groene paprika vóór je hem aanbeveelt — een duidelijk aanwezige pyrazinetoon is een rijpheidsdiagnose die je meteen iets vertelt over de kwaliteit van het jaargang of perceel, niet alleen over stijl.',
    '- IBMP-pyrazine
- DNA-kruising 1996
- laatbotend laatrijpend
- Coonawarra-eucalyptol
- Bordeaux-blendlogica
',
    'Cabernet Sauvignon ontstond uit een kruising van Cabernet Franc en Sauvignon Blanc.
',
    '- Natuurlijke kruising van Cabernet Franc en Sauvignon Blanc, bevestigd in 1996
- Dikke schil en hoge schil-tot-sap-verhouding verklaren de hoge tannine- en kleurconcentratie
- Groene paprikatoon (IBMP) is een rijpheidssignaal, geen vast druifkenmerk
- Grind en warmte (Médoc, Napa) zijn nodig om de dikke schil volledig te laten rijpen
- Coonawarra''s munt-eucalyptustoon komt van naburige eucalyptusbomen, niet van de druif zelf
',
    '### Opdracht

Vergelijk Cabernet met Merlot.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij welke fles Cabernet Sauvignon op jouw kaart zou jij groene paprika benoemen als bewuste rijpheidsdiagnose in plaats van als smaakvoorkeur — en hoe leg je dat verschil uit aan een gast?',
    10,
    1
  ),
  (
    'syrah',
    'Syrah',
    'Na deze les herken jij Syrah.
',
    'Syrah is, net als Cabernet Sauvignon, een natuurlijke kruising — bevestigd in 1998 door dezelfde onderzoeksgroep rond Carole Meredith — tussen Dureza en Mondeuse Blanche, twee obscure druiven uit de Ardèche en Savoie. Dat weerlegt definitief de romantische mythe dat Syrah zijn naam en oorsprong dankt aan de Perzische stad Shiraz: de druif is en blijft een kind van de noordelijke Rhône-vallei.

De kenmerkende zwarte-pepertoon komt van rotundone, een sesquiterpeen dat pas in 2008 wetenschappelijk geïdentificeerd werd als de stof achter peperige aroma''s in wijn. Cruciaal voor de praktijk: rotundone-concentratie is direct stuurbaar via wijngaardmanagement. Minder zonlicht op de druiventros — door koeler klimaat, hogere ligging of bewuste bladwerkkeuzes — verhoogt de rotundoneconcentratie, terwijl volle zoninstraling de vorming juist onderdrukt. Peperigheid is dus deels een teeltkeuze, niet alleen een druifeigenschap.

In de noordelijke Rhône (Côte-Rôtie, Hermitage, Cornas) groeit Syrah op steile granietterrassen, vaak als enige druif, en in Côte-Rôtie is het wettelijk toegestaan om tot 20% Viognier mee te co-fermenteren — in de praktijk meestal veel minder. Die kleine hoeveelheid witte druif stabiliseert kleur via co-pigmentatie en voegt een subtiele abrikoos-bloesemlift toe, een specifieke historische techniek die nergens anders in de Rhône standaard is.

In het warme zuidelijk halfrond — Barossa Valley, waar de druif Shiraz heet — onderdrukt de intense zoninstraling juist de rotundonevorming, wat rijp bramen-pruimenfruit, chocolade en een aanzienlijk lagere pepertoon oplevert, vaak in Amerikaans in plaats van Frans eikenhout gelagerd. Dezelfde druif, twee klimatologisch tegengestelde uitersten.

Structureel behoudt Syrah, dankzij zijn dikke schil, ook in warm klimaat relatief goed zuur en kleurstabiliteit, wat de druif geschikt maakt als ruggengraat in GSM-blends (Grenache-Syrah-Mourvèdre): Grenache levert fruit en alcohol, Mourvèdre levert aardse diepte, Syrah levert kleur, structuurdensiteit en specerij.


## Food pairing

### Beste pairing

Lamsrack met een korst van zwarte peper en tijm, of gegrilde worst met paprika.

### Waarom dit werkt

De rotundone in de wijn resoneert direct met de peperkorst — een aroma-op-aroma-brug in plaats van alleen textuurmatch.

### Vermijd

Zeer zoete desserts of licht gekruide vis — de peperige specerij en structuur van Syrah overheersen die gerechten volledig.

## Pro insight

Gebruik de peperintensiteit van een Syrah als klimaatthermometer bij een gast: veel zwarte peper wijst op een koeler perceel of een bewuste rotundone-gerichte wijngaardkeuze, weinig peper wijst op warmte — dat is een concreet, uitlegbaar verkoopargument.',
    '- rotundone
- Dureza-Mondeuse-kruising
- Côte-Rôtie-cofermentatie
- GSM-blend
- Barossa versus Rhône-expressie
',
    'In Australië heet Syrah meestal Shiraz.
',
    '- Natuurlijke kruising van Dureza en Mondeuse Blanche, bevestigd in 1998 — geen Perzische oorsprong
- Rotundone veroorzaakt de zwarte-pepertoon en is stuurbaar via zonlichtblootstelling
- Côte-Rôtie mag wettelijk tot 20% Viognier co-fermenteren voor kleurstabiliteit en lift
- Warm klimaat (Barossa) onderdrukt rotundone en geeft rijp fruit met minder peper
- Dikke schil geeft goede kleur- en zuurstabiliteit — een sterke ruggengraat in GSM-blends
',
    '### Opdracht

Vergelijk Rhône Syrah met Australische Shiraz.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij een gast die alleen warme, fruitige Barossa Shiraz kent, durven verrassen met een peperige, koelere noordelijke Rhône-Syrah — en met welk ene argument (rotundone, klimaat) leg je dat verschil uit?',
    10,
    2
  ),
  (
    'malbec',
    'Malbec',
    'Na deze les herken jij Malbec.
',
    'Malbec heette oorspronkelijk Côt of Auxerrois en is de historische druif achter de ''zwarte wijn'' (vin noir) van Cahors in Zuidwest-Frankrijk — een bijnaam die verwijst naar de intense kleurdiepte dankzij de dikke schil en traditioneel lange maceratie. Genetisch onderzoek uit 2009 toonde aan dat Malbec een natuurlijke kruising is van Prunelard en Magdeleine Noire des Charentes — dezelfde moederdruif die ook Merlot voortbracht (met Cabernet Franc als vader). Malbec en Merlot zijn dus genetisch halfbroers, wat verklaart waarom beide zo moeiteloos in Bordeaux-blends samenwerken.

Na verwoestende vorst in 1956 en de naweeën van de druifluis-crisis verdween Malbec grotendeels uit Frankrijk, maar de druif kreeg een tweede leven in Argentinië nadat de Franse agronoom Michel Aimé Pouget haar in 1868 naar Mendoza bracht. De hooggelegen wijngaarden van de Uco Valley — vaak tussen 900 en 1500 meter — combineren intense UV-instraling (dikkere schillen, meer kleurstof) met een groot diurnaal verschil dat het zuur behoudt ondanks de felle zon: hetzelfde mechanisme dat bij Torrontés en andere hooggelegen wijnen een rol speelt.

Stilistisch staan de twee tradities ver uit elkaar. De Cahors AOC eist minimaal 70% Malbec (lokaal nog Côt of Auxerrois genoemd) en levert een rustieker, steviger tannine met savoury, aardse tonen op. Argentijnse Malbec is rijper, ronder van tannine, met een herkenbare viooltjes- en cacaotoon uit de eikenlagering — twee interpretaties van dezelfde druif die bijna niets van elkaar wegdrinken.

Opvallend specialistisch kenmerk: ondanks de diepe kleur is de tannine van Malbec fijnkorreliger en minder grijpend dan die van Cabernet Sauvignon bij vergelijkbare concentratie — een andere polymeerstructuur die de druif eerder drinkbaar maakt zonder decennialange flesrijping, in tegenstelling tot wat de donkere kleur zou doen vermoeden.


## Food pairing

### Beste pairing

Argentijnse asado (gegrild rundvlees) of entrecote met chimichurri.

### Waarom dit werkt

De rijpe, ronde tannine en donkere fruittonen spiegelen het gegrilde vet en de kruidige, zure chimichurri-saus.

### Vermijd

Lichte, delicate visgerechten — de diepe kleur en concentratie van Malbec verpletteren die subtiliteit direct.

## Pro insight

Vertel een gast die Malbec alleen als ''makkelijk drinkbaar'' kent over de genetische band met Merlot — dat framet de druif meteen als serieuze Bordeaux-verwant in plaats van louter een toegankelijke instapwijn.',
    '- Côt-synoniem Cahors
- Prunelard-kruising
- Uco Valley-hoogteligging
- diurnaal zuurbehoud
- fijnkorrelige tanninearchitectuur
',
    'Cahors werd vroeger “de zwarte wijn” genoemd.
',
    '- Historisch Côt/Auxerrois, de ''zwarte wijn'' van Cahors, waar minimaal 70% Malbec verplicht is
- Genetisch een halfbroer van Merlot — beide delen moederdruif Magdeleine Noire des Charentes
- Michel Aimé Pouget bracht Malbec in 1868 naar Mendoza, Argentinië
- Hoogteligging in de Uco Valley geeft intense kleur én zuurbehoud via diurnaal verschil
- Tannine is fijnkorreliger dan bij Cabernet Sauvignon — toegankelijker ondanks de diepe kleur
',
    '### Opdracht

Proef Malbec naast Cabernet.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welke twee flessen Malbec — één uit Cahors, één uit Mendoza — zou jij een gast naast elkaar laten proeven om te bewijzen dat het dezelfde druif is, en welk signaal (tannine, aroma) zou jij daarbij benadrukken?',
    10,
    3
  ),
  (
    'nebbiolo',
    'Nebbiolo',
    'Na deze les herken jij Nebbiolo.
',
    'Nebbiolo dankt zijn naam aan ''nebbia'', de dichte herfstmist die zich in oktober over de heuvels van Piemonte legt tijdens de late oogst — de druif rijpt pas na vrijwel alle andere Italiaanse rassen. Wat Nebbiolo specialistisch fascinerend maakt, is een structurele paradox: de schil is dun en arm aan antocyaan, wat een bleke, granaatachtige kleur oplevert die aan Pinot Noir doet denken — maar diezelfde schil (en de pitten) bevat een uitzonderlijk hoge concentratie tannine. Kleur en tannineconcentratie zijn bij Nebbiolo dus volledig losgekoppeld, een cruciale valkuil bij blind proeven.

Barolo en Barbaresco tonen hoe bodemtype binnen één druif tot structureel verschillende wijnen leidt. Communes met Tortoniaanse kalkmergel (La Morra, Barolo-dorp zelf) geven zachtere, aromatischere, eerder toegankelijke wijnen; communes met Serravalliaanse/Helvetische zandsteen (Serralunga d''Alba, Monforte d''Alba, Castiglione Falletto) geven krachtiger, taniner en langlevender wijnen. Dezelfde druif, dezelfde regio, structureel andere resultaten door bodemchemie alleen.

De stijlstrijd tussen traditionalisten en modernisten definieerde Barolo in de jaren tachtig en negentig: traditionalisten gebruiken lange maceratie en grote, oude Slavonische eikenvaten (botti), wat de florale roos- en teertonen behoudt en tannine langzaam laat integreren; de ''Barolo Boys''-modernisten kozen voor kortere maceratie en kleinere, nieuwe Franse barriques, met rondere tannine en meer vanille- en houtspecerij. Beide scholen bestaan vandaag naast elkaar.

Aromatisch draait Nebbiolo om rozen en teer — damasceon, een stof die ook de rozentoon in andere druiven verklaart, gecombineerd met truffel- en leertonen die zich pas na jaren flesrijping ontwikkelen. Die extreem lange rijpingscurve — Barolo DOCG vereist wettelijk minimaal 38 maanden rijping, waarvan 18 op vat — wordt precies mogelijk gemaakt door de combinatie van hoge zuren en hoge tannine, twee structurele buffers die elkaar versterken.

Nebbiolo geldt daarom als de ''Pinot Noir van Italië'' qua terroirgevoeligheid — twee percelen op honderden meters afstand kunnen wezenlijk andere wijnen opleveren — terwijl de onderliggende structuur (kleur versus tannine) precies tegenovergesteld is.


## Food pairing

### Beste pairing

Witte truffel over tagliatelle, of gestoofd rundvlees (brasato al Barolo).

### Waarom dit werkt

De aardse truffeltoon en de extreem hoge tannine van Nebbiolo versterken elkaar via dezelfde aardse aromagroep.

### Vermijd

Lichte, delicate visgerechten — de extreme tannine en zuurgraad verpletteren die subtiliteit onmiddellijk.

## Pro insight

Waarschuw een gast expliciet vóór het eerste glas Nebbiolo dat de bleke kleur misleidt — verwacht een tanninegrip die veel steviger is dan de kleur suggereert, zodat de eerste slok niet als een onaangename verrassing landt.',
    '- nebbia-etymologie
- kleur-tannine-ontkoppeling
- Barolo versus Barbaresco-bodem
- Barolo Boys-modernisme
- damasceon-rozentoon
',
    'Nebbiolo kan decennia rijpen.
',
    '- ''Nebbia'' (mist) verwijst naar de late herfstoogst in de Piemontese heuvels
- Bleke kleur en extreem hoge tannine zijn bij Nebbiolo volledig losgekoppeld
- Tortoniaanse kalkmergel geeft zachtere wijn, Serravalliaanse zandsteen geeft krachtigere wijn
- Traditioneel (grote oude vaten) versus modernistisch (kleine nieuwe barriques) blijft een levende stijlstrijd
- Hoge zuren en hoge tannine samen maken de zeer lange, wettelijk verplichte rijping mogelijk
',
    '### Opdracht

Vergelijk Nebbiolo met Pinot Noir.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke twee Barolo-communes (bijvoorbeeld La Morra en Serralunga d''Alba) zou jij naast elkaar zetten om het effect van bodemtype op structuur te demonstreren, en welk signaal (tannine, aroma) zou het verschil het snelst tonen?',
    10,
    4
  ),
  (
    'mourvedre',
    'Mourvèdre',
    'Na deze les herken jij Mourvèdre.
',
    'Mourvèdre — in Spanje Monastrell genoemd en historisch in Australië en Californië bekend als Mataro — heeft vermoedelijk zijn oorsprong in het Spaanse Levante rond Alicante en Jumilla, van waaruit de druif zich naar Zuid-Frankrijk verspreidde. De druif is opvallend hitte- en droogteresistent: in Jumilla staan nog altijd ongeënte, stokoude wijnstokken op zandige bodem die van nature bestand is tegen de druifluis, waardoor enting nooit nodig was.

Mourvèdre budt laat uit en heeft veel zon en warmte nodig om volledig te rijpen — een trage, hitteafhankelijke druif die in koelere jaren zelden overtuigt. Jong vertoont de druif vaak een uitgesproken reductief karakter: bloed, wild, leer en zwarte olijf, tonen die pas na verluchting of enige flesrijping plaatsmaken voor rijper donker fruit — een kenmerk waarmee beginnende proevers de druif regelmatig ten onrechte als ''gebrekkig'' afschrijven.

Bandol in de Provence is de klassieke referentie: de AOC eist wettelijk minimaal 50% Mourvèdre voor rode wijn en een verplichte vatrijping van minstens achttien maanden, traditioneel in grote foudres. De kalkrijke, naar de Middellandse Zee hellende hellingen geven de druif precies de warmte en drainage die ze nodig heeft om haar volle, aardse potentieel te bereiken.

In GSM-blends (Grenache-Syrah-Mourvèdre) speelt Mourvèdre de rol van ruggengraat: Grenache levert fruit en alcohol maar vervaagt snel zonder structuur, Syrah levert kleur en specerij, en Mourvèdre levert de tanninebasis, de aardse diepte en het bewaarpotentieel die de blend op de lange termijn overeind houden — zonder Mourvèdre valt een GSM-blend structureel sneller uit elkaar dan met.

Ondanks het warme klimaat waarin de druif meestal groeit, behoudt Mourvèdre bij zorgvuldige oogst een verrassend goed zuurniveau, wat haar — samen met de stevige tannine — een langer bewaarpotentieel geeft dan de meeste andere warmeklimaatdruiven.


## Food pairing

### Beste pairing

Lamsstoofpot met olijven en rozemarijn, of wildzwijnragout.

### Waarom dit werkt

De aardse, wilde en olijfachtige tonen van Mourvèdre spiegelen direct de kruidige, langzaam gegaarde stoofsmaken.

### Vermijd

Lichte, frisse visgerechten — de wilde, reductieve en tanninerijke aard van deze druif overweldigt die subtiliteit volledig.

## Pro insight

Schenk een jonge Mourvèdre nooit direct na ontkurken zonder te beluchten of kort te decanteren — anders proeft een gast de tijdelijke reductieve fase en beoordeelt de wijn onterecht als gebrekkig.',
    '- Monastrell-synoniem
- reductieve jeugdfase
- Bandol-appellatie-eisen
- GSM-ruggengraat
- stokoude droogteresistente wijngaarden
',
    'Mourvèdre rijpt laat en heeft veel zon nodig.
',
    '- Monastrell in Spanje, Mataro historisch in Australië/Californië — vermoedelijk Spaanse oorsprong
- Stokoude, ongeënte wijnstokken in Jumilla zijn van nature droogte- en luisresistent
- Jonge Mourvèdre toont vaak reductieve bloed- en leertonen die met lucht of tijd verdwijnen
- Bandol AOC eist wettelijk minimaal 50% Mourvèdre en 18 maanden vatrijping
- Vormt de tanninebasis en het bewaarpotentieel van GSM-blends (Grenache-Syrah-Mourvèdre)
',
    '### Opdracht

Zoek een GSM-blend (Grenache-Syrah-Mourvèdre).

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Bij welke jonge, gesloten fles Mourvèdre op jouw kaart zou jij bewust extra beluchting adviseren vóór het serveren — en hoe leg je dat verschil tussen reductie en een echt gebrek uit aan een gast?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-red-wine (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'service-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'serveertemperatuur-rode-wijn',
    'Serveertemperatuur',
    'Na deze les weet jij hoe rode wijn op de juiste temperatuur geserveerd wordt.
',
    'Serveertemperatuur bij rode wijn stuurt twee tegengestelde mechanismen tegelijk: de vluchtigheid van ethanol neemt toe met temperatuur (te warm geeft een dominante, brandende alcoholindruk), terwijl de perceptie van tanninegrip juist toeneemt naarmate de wijn kouder is — koude vertraagt de bindingskinetiek tussen tannine en speekseleiwitten, waardoor de mond minder snel ''wordt overspoeld'' en de tannine harder en droger aanvoelt. Beide effecten samen bepalen het serveerprotocol per structuurtype.

Lichte rode wijn (Gamay, jonge Pinot Noir) leunt op primair fruit en zuurgraad; een lichte koeling (12–14 °C) accentueert die frisheid en dempt de al beperkte tannine niet noemenswaardig, wat de wijn levendiger maakt zonder iets te verliezen. Medium body-druiven (Merlot, Sangiovese, Tempranillo) vinden hun balanspunt rond 14–16 °C: warm genoeg om tannine niet hard te laten aanvoelen, koel genoeg om alcohol niet te laten domineren.

Krachtige, hoogtanninerijke druiven (Cabernet Sauvignon, Nebbiolo, Syrah) vragen 16–18 °C: bij die temperatuur verloopt de eiwitbinding sneller en vloeiender, waardoor de tannine ronder aanvoelt, en komen secundaire en tertiaire aroma''s die aan houtcontact en complexe fenolen gebonden zijn beter vrij. Oude, kwetsbare wijnen profiteren van een vergelijkbare temperatuur, maar vragen wel voorzichtigheid: te warm laat de fragiele, tertiaire boeket sneller wegvallen dan bij een robuustere, jongere wijn.

''Kamertemperatuur'' als vuistregel is historisch misleidend: het begrip ontstond in ongeverwarmde negentiende-eeuwse Europese kamers van ongeveer 15–16 °C, niet in de centraal verwarmde ruimtes van vandaag die vaak 21–22 °C halen. Een wijn op werkelijke moderne kamertemperatuur serveren, betekent in de praktijk vrijwel altijd te warm serveren.

Praktisch protocol: schenk 1–2 °C onder de uiteindelijke doeltemperatuur, want het glas en de ruimte warmen de wijn vanzelf op tijdens het drinken. Voor krachtige, hoge-tanninewijnen is het net zo belangrijk om niet te koud te serveren als om niet te warm te serveren — beide uitersten verstoren dezelfde eiwitbindingskinetiek, in tegengestelde richting.


## Food pairing

### Beste pairing

Dezelfde Cabernet Sauvignon geserveerd op 12 °C en op 17 °C naast gegrild rood vlees.

### Waarom dit werkt

Bij 17 °C rondt de tannine af en integreert met het vlees; bij 12 °C domineert een harde, drogende astringentie die het gerecht overstemt.

### Vermijd

Een krachtige, tanninerijke Nebbiolo op 22 °C bij hetzelfde gerecht — te warm serveren maakt de wijn log en benadrukt de alcohol.

## Pro insight

Wantrouw het advies ''gewoon op kamertemperatuur'' voor een krachtige rode wijn — leg een gast uit dat moderne kamers vaak te warm zijn, en koel de fles indien nodig bewust een paar graden vóór het serveren.',
    '- eiwitbindingskinetiek
- ethanolvolatiliteit
- chambré-mythe
- serveerprotocol per structuurtype
- temperatuurgevoelige tanninegrip
',
    'Vroeger was kamertemperatuur rond de 16 °C.
',
    '- Koude vertraagt de eiwitbinding van tannine, waardoor tannine harder en droger aanvoelt
- Warmte verhoogt ethanolvolatiliteit — te warm geeft een dominante alcoholindruk
- Lichte rode wijn: 12–14 °C; medium body: 14–16 °C; krachtige stijlen: 16–18 °C
- ''Kamertemperatuur'' is een historisch verouderd begrip (15–16 °C, niet de moderne 21–22 °C)
- Schenk altijd 1–2 °C onder de doeltemperatuur — het glas warmt de wijn vanzelf op
',
    '### Opdracht

Meet thuis de temperatuur van een rode wijn.

### Checklist

- Ik heb de temperatuur gemeten
- Ik heb geproefd
- Ik heb temperatuur aangepast
- Ik proefde het verschil


### Reflectievraag

Welke fles op jouw kaart serveer je vermoedelijk op de verkeerde temperatuur uit gewoonte — en welk signaal (tanninegrip of alcoholwarmte) zou je na correctie moeten proeven dat je nu mist?',
    8,
    1
  ),
  (
    'glaswerk-rode-wijn',
    'Glaswerk',
    'Na deze les begrijp jij welk glas bij welke rode wijn past.
',
    'Glasgeometrie stuurt bij rode wijn twee zaken tegelijk: het zuurstofoppervlak dat de wijn krijgt vóór het glas de neus bereikt, en de plek op de tong waar de wijn als eerste landt — wat direct bepaalt of tannine of fruit als eerste wordt waargenomen. Glasvorm is daarmee geen esthetische keuze maar een structureel stuurmiddel.

Het Bordeaux-glas — hoog, brede bol, licht taps toelopend — is ontworpen voor krachtige, hooggetanninerijke druiven als Cabernet Sauvignon en Syrah. Het grote oppervlak geeft ruimte voor beluchting, en de vorm stuurt de wijn richting het midden en de achterkant van de tong, waardoor de eerste tanninegrip aan de voorkant wordt afgezwakt. Het Bourgondië-glas — breder, bolvormig, met een naar binnen gebogen rand — past bij delicatere maar aromatisch intensere druiven zoals Pinot Noir en Nebbiolo: het grotere verdampingsoppervlak maximaliseert de vaak subtiele secundaire aroma''s (roos, teer, bosgrond), terwijl de ingebogen rand die aroma''s trechtvormig naar de neus stuurt en de wijn naar het puntje van de tong leidt, waar fruit en zuur het eerst worden opgemerkt vóór tannine.

Het neutrale ISO-tasting-glas blijft de internationale standaard voor blind proeven en examens: bewust zonder stijlinterpretatie, zodat elke wijn onder identieke condities wordt beoordeeld en het glas zelf geen variabele wordt in de vergelijking.

Randdikte blijft ook bij rode wijn relevant: een dunne, scherp geslepen rand laat de wijn de mond bereiken vóór de lip het glas voelt, wat de eerste indruk zuiverder maakt. Glashygiëne is bij rode wijn minder kritiek dan bij delicate aromatische witte wijn — de aromatische intensiteit en tannine van rode wijn maskeren een lichte detergentrestant sneller — maar bij blind proeven op hoog niveau blijft het een meetbaar storende factor.

Praktisch onderscheiden veel sommeliers structuurtype in plaats van druif bij glaskeuze: één glasvorm voor lichte tot medium body, één voor krachtige, tanninerijke stijlen — een herkenbaar servicesignaal dat een gast alvast voorbereidt op wat komen gaat.


## Food pairing

### Beste pairing

Nebbiolo in een breed Bourgondië-glas bij een truffelrisotto.

### Waarom dit werkt

Het brede glas trechtert de subtiele roos- en teertonen precies naar de neus, in balans met de aardse truffelintensiteit.

### Vermijd

Datzelfde brede glas voor een krachtige Cabernet Sauvignon — de wijn krijgt dan te veel beluchting vóór de tannine kans krijgt zich te settelen.

## Pro insight

Schenk interne vergelijkende proeverijen altijd in een neutraal ISO-glas en bewaar het druifspecifieke glaswerk voor gastpresentatie — zo vergelijk je wijnen zuiver én verkoop je toch het juiste glas aan tafel.',
    '- Bordeaux-glasgeometrie
- Bourgondië-trechtereffect
- tongpositionering via glasvorm
- ISO-glas-standaardisatie
- glashygiëne bij rode wijn
',
    'Professionele proevers gebruiken vaak universele glazen om objectief te blijven.
',
    '- Glasvorm bepaalt beluchtingsoppervlak én de plek op de tong waar wijn eerst landt
- Bordeaux-glas stuurt krachtige, tanninerijke wijn naar midden/achterkant van de tong
- Bourgondië-glas trechtert subtiele aroma''s naar de neus en stuurt wijn naar het tongpuntje
- ISO-tasting-glas is de neutrale standaard voor blind proeven en examens
- Glashygiëne is bij rode wijn minder kritiek dan bij wit, maar blijft meetbaar bij blind proeven
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik rook verschil
- Ik proefde verschil
- Ik noteerde mijn bevindingen


### Reflectievraag

Welk glas in jouw zaak doet een rode wijnstijl structureel tekort — en wat is de service- of verkoopimpact daarvan aan tafel?',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren',
    'Na deze les weet jij wanneer en waarom je rode wijn decanteert.
',
    'Decanteren van rode wijn dient twee wezenlijk verschillende doelen, en het verwarren van die twee is de meest voorkomende beginnersfout. Sedimentscheiding is bedoeld voor oude, ongefilterde of licht gefinede wijnen met zichtbaar bezinksel: langzaam schenken bij een lichtbron (traditioneel een kaars) laat je precies zien wanneer het bezinksel de schouder van de fles bereikt, zodat je op tijd stopt met schenken. Beluchting is bedoeld voor jonge, tanninerijke wijnen: gecontroleerde zuurstofblootstelling versnelt de polymerisatie van tannine, waardoor de perceptie van astringentie verzacht en eventuele reductieve tonen verdampen.

De benodigde decanteertijd schaalt met het structuurniveau: jonge Nebbiolo, Cabernet Sauvignon of Syrah kunnen één tot drie uur of langer aan, medium body-druiven zoals Merlot of Tempranillo hebben doorgaans genoeg aan twintig tot veertig minuten, en fragiele, oude wijnen vragen minimale blootstelling — soms slechts de tijd die nodig is om het bezinksel te scheiden. Hun fenolische buffering (tannine en zuur) is weliswaar hoger dan bij oude witte wijn, maar niet onuitputtelijk: eenmaal uitgeput kan de structuur die de complexiteit overeind hield relatief snel instorten.

Dubbeldecanteren is een specialistische techniek: een jonge, tanninerijke wijn wordt gedecanteerd voor volledige beluchting, waarna de originele fles wordt gespoeld en de wijn erin teruggeschonken — zo kun je het label aan tafel tonen en toch de volle beluchting benutten.

Voor hardnekkig gesloten, jonge tanninerijke wijnen bestaat ''hyperdecanteren'' — krachtig overschenken, zwenken in een blender op lage snelheid, of herhaaldelijk tussen twee karaffen overgieten — een agressieve techniek die in enkele minuten evenveel zuurstofcontact geeft als uren rustig decanteren, bruikbaar wanneer de tijd ontbreekt.

Onderscheid tot slot tartraatkristallen (onschuldige wijnsteenkristallen, die op glasscherven of suikerkorrels lijken) van echt bezinksel (een fijne, donkere neerslag van gepolymeriseerde tannine-pigmentcomplexen) — de eerste is een kwaliteitskenmerk van weinig ingrijpen, de tweede vraagt zorgvuldig decanteren.


## Food pairing

### Beste pairing

Een jonge, gesloten Cabernet Sauvignon, twee uur gedecanteerd, bij een langzaam gegaarde runderstoof.

### Waarom dit werkt

De beluchting laat de tannine polymeriseren en ronder worden, precies passend bij de langzame, collageenrijke textuur van de stoof.

### Vermijd

Een zeer oude, fragiele Nebbiolo lang van tevoren decanteren — het delicate tertiaire boeket kan binnen een halfuur wegvallen.

## Pro insight

Vraag jezelf bij elke decanteerbeslissing eerst af of het doel zuurstof of bezinksel is — die twee vragen om een volledig andere schenktechniek en wachttijd, en verwarring daartussen is de snelste weg naar een verkeerd geserveerde fles.',
    '- sedimentscheiding versus beluchting
- dubbeldecanteren
- tanninepolymerisatie tijdens beluchting
- tartraatkristallen versus bezinksel
- hyperdecanteren
',
    'Oude Barolo kan soms al na 20 minuten volledig open zijn.
',
    '- Sedimentscheiding (oude wijn) en beluchting (jonge tanninerijke wijn) zijn twee verschillende doelen
- Decanteertijd schaalt met structuurniveau: uren voor krachtige jonge wijn, minuten voor fragiele oude wijn
- Dubbeldecanteren combineert volledige beluchting met het tonen van het originele etiket
- Hyperdecanteren (agressief overschenken of zwenken) versnelt beluchting wanneer tijd ontbreekt
- Tartraatkristallen zijn onschuldig; echt bezinksel is gepolymeriseerde tannine-pigmentneerslag
',
    '### Opdracht

Decanteer een jonge rode wijn.

### Checklist

- Ik schonk rustig
- Ik proefde voor en na
- Ik noteerde verschillen


### Reflectievraag

Bij welke fles in jouw assortiment zou jij kiezen voor hyperdecanteren in plaats van rustig decanteren — en welk signaal (tijdsdruk, tanninegrip) bepaalt die keuze?',
    10,
    3
  ),
  (
    'bewaren-en-kelderen',
    'Bewaren & kelderen',
    'Na deze les begrijp jij hoe rode wijn correct wordt opgeslagen.
',
    'Het bewaarpotentieel van rode wijn wordt structureel bepaald door de combinatie van tannineconcentratie, zuurgraad en extractconcentratie — buffers die samen bepalen hoe lang een wijn zich kan ontwikkelen zonder in te storten. Het kernmechanisme achter rijping is tannine-antocyaan-polymerisatie: vrije antocyanen (de jonge, felle paars-rode kleurstoffen) binden geleidelijk aan tannine tot grotere, stabielere pigmentpolymeren. Die polymeren zijn minder fel van kleur — vandaar de evolutie van paars/violet in jonge wijn naar granaat en uiteindelijk baksteenrood in oude wijn — en precipiteren uiteindelijk deels als het bezinksel dat je bij decanteren scheidt.

Tertiaire aroma''s bij rode wijn — leer, bosgrond, gedroogd fruit, tabak, wild — ontstaan via een langzaam oxidatief-reductief evenwicht dat via de micro-poreusheid van de kurk verloopt, samen met voortgaande esterificatie en de langzame afbraak van de grotere tanninepolymeren. Dat is een wezenlijk ander biochemisch traject dan de oxidatieve en Maillard-achtige reacties die tertiaire ontwikkeling bij witte wijn aandrijven — bij rood is tannine de hoofdrolspeler, bij wit zijn dat zuur en suiker.

Appellatieregels weerspiegelen dit structurele verschil expliciet: Barolo DOCG eist wettelijk minimaal 38 maanden rijping (waarvan 18 op vat), Barbaresco 26 maanden, en traditionele Cahors-Malbec vraagt eveneens langere rijping om de stevige tannine te laten integreren — in schril contrast met Beaujolais Gamay, bewust bedoeld om jong en fris gedronken te worden, met minimale tannine om op te ruimen.

De universele kelderprincipes gelden onverkort: 12–14 °C stabiel, donker, trillingsvrij en circa 70% luchtvochtigheid om de kurk vochtig te houden. Bij rode wijn is liggend bewaren extra belangrijk, precies omdat het bewaarvenster vaak decennia beslaat — een uitgedroogde kurk bij een twintig jaar oude Barolo is een groter risico dan bij een wijn die binnen twee jaar toch gedronken wordt.

Bouw daarom een bewuste segmentatie op: licht-drink-nu, medium body voor vijf tot tien jaar, en krachtige, verzamelaarsstijlen voor tien tot dertig jaar of langer — zodat je niet per ongeluk een bewaarwijn te vroeg opent of een vroegdrinkstijl te lang laat liggen.


## Food pairing

### Beste pairing

Een goed bewaarde, twintig jaar oude Barolo met leder- en truffeltonen bij gestoofd wild.

### Waarom dit werkt

De tertiaire leder- en aardse tonen van de gerijpte wijn spiegelen de diepe, langzaam gegaarde umami van het stoofgerecht.

### Vermijd

Een wijn die warm of met trilling is opgeslagen — vroegtijdige, oncontroleerde tannineafbraak ondermijnt precies die complexiteit.

## Pro insight

Segmenteer je kelder expliciet op structuurcategorie in plaats van alleen op druif of regio — zo voorkom je dat een gastvriendelijke, vroegdrinkbare Gamay jarenlang naast een krachtige Barolo ligt te wachten op een moment dat nooit komt.',
    '- tannine-antocyaan-polymerisatie
- kleurevolutie paars-naar-baksteen
- drinkvenster per structuurcategorie
- appellatieverplichte vatrijping
- kurkvochtigheid en ligpositie
',
    'Temperatuurschommelingen zijn schadelijker dan een constante iets hogere temperatuur.
',
    '- Tannine, zuur en extract zijn de drie structurele buffers achter het bewaarpotentieel
- Tannine-antocyaan-polymerisatie verklaart zowel de kleurevolutie als de vorming van bezinksel
- Tertiaire ontwikkeling bij rood verloopt via tannineafbraak, niet via de oxidatieve route van wit
- Appellatieregels (Barolo 38 maanden, Barbaresco 26 maanden) weerspiegelen structurele rijpingsbehoefte
- Liggend bewaren is extra belangrijk bij rood door de vaak decennialange bewaarhorizon
',
    '### Opdracht

Controleer jouw wijnopslag.

### Checklist

- Ik heb temperatuur bekeken
- Ik heb licht gecontroleerd
- Ik heb positie gecontroleerd


### Reflectievraag

Welke fles in jouw kelder zit waarschijnlijk in het verkeerde segment — nu drinken of nog jarenlang bewaren — en welke conditie (temperatuur, positie, vochtigheid) zou je het eerst corrigeren?',
    10,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-red-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'pairing-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'rode-wijn-vlees',
    'Rode wijn & vlees',
    'Na deze les begrijp jij waarom rode wijn en vlees zo goed samengaan.
',
    'De klassieke pairing van rode wijn met vlees is geen kwestie van traditie maar van een concreet chemisch mechanisme: tannine — polyfenolen uit schil, pit en eventueel hout — bindt zich normaal aan proline-rijke eiwitten in speeksel, wat de drogende, samentrekkende astringentie veroorzaakt die je zonder eten proeft. Eiwit- en vetrijk vlees biedt tannine een alternatieve bindingspartner: de tannine hecht zich bij voorkeur aan de eiwitten en vetten in het vlees in plaats van aan speekseleiwitten, waardoor de mond soepeler blijft, de wijn ronder aanvoelt en het vlees zelf minder zwaar overkomt.

Het vetgehalte van het vlees moet schalen met het tanningehalte van de wijn. Magere sneden (ossenhaas, mager wildvlees) vragen een wijn met minder tannine, omdat er simpelweg onvoldoende vet is om overtollige tannine te binden — een zeer krachtige wijn voelt dan hard en droog aan. Vettere sneden (entrecote, lamsrack met vetrand, ribeye) kunnen juist krachtige, hooggetanninerijke wijnen aan, omdat er voldoende vet beschikbaar is om die tannine te temperen.

Grillen en barbecueën voegen een tweede, aroma-gedreven mechanisme toe: de Maillard-reactie op het geschroeide oppervlak vormt pyrazines en geroosterde verbindingen die rechtstreeks resoneren met de toast- en roosternoten uit eikenhoutlagering. Dat verklaart waarom gegrild of geroosterd vlees bij houtgelagerde Cabernet Sauvignon, Malbec of Syrah zo goed werkt: het is een aroma-op-aroma-brug, niet alleen een textuurmatch.

Umami uit vlees — geconcentreerd in gerijpt rundvlees en versterkt door champignonsauzen — kan juist averechts werken bij zeer hooggetanninerijke, sterk gehoute wijnen: umami kan de perceptie van bitterheid en een licht metaalachtige bijsmaak versterken als de wijn onvoldoende rijp fruit heeft om dat te bufferen. Zeer umami-rijke bereidingen vragen daarom wijnen met voldoende fruitconcentratie, niet enkel veel tannine.

Donker gevogelte — eend, gans — gedraagt zich door een hoger vet- en ijzergehalte dichter bij rood vlees dan bij lichte kip, en kan daardoor dezelfde tannine-vet-logica gebruiken, alleen op een lichter register: een medium body of zelfs lichte rode wijn (Pinot Noir) volstaat waar rood vlees een krachtigere stijl zou vragen.


## Food pairing

### Beste pairing

Gegrilde ribeye van de barbecue bij een houtgelagerde Malbec of Cabernet Sauvignon.

### Waarom dit werkt

De Maillard-geroosterde korst resoneert met de toastnoten van het eikenhout, terwijl het vet de stevige tannine bindt en verzacht.

### Vermijd

Een zeer magere ossenhaas bij een extreem krachtige, jonge Nebbiolo — te weinig vet om de tannine te temperen laat de wijn hard aanvoelen.

## Pro insight

Vraag bij twijfel eerst naar het vetgehalte van de snede vóór je een tannineniveau adviseert — een magere biefstuk met een zeer krachtige, tanninerijke wijn is een veelvoorkomende mismatch die met die ene vraag te voorkomen is.',
    '- tannine-eiwitbinding
- vetgehalte-tanninematch
- Maillard-brug bij barbecue
- umami-tannine-risico
- donker gevogelte als brugcategorie
',
    'Een tanninerijke wijn zonder eten kan veel harder aanvoelen.
',
    '- Tannine bindt bij voorkeur aan eiwit en vet in vlees in plaats van aan speekseleiwitten
- Vetgehalte van het vlees moet schalen met het tanninegehalte van de wijn
- Maillard-verbindingen van grillen/barbecue resoneren met toastnoten uit eikenhoutlagering
- Zeer umami-rijke bereidingen vragen wijnen met voldoende fruitconcentratie om bitterheid te bufferen
- Donker gevogelte (eend, gans) volgt dezelfde tannine-vet-logica als rood vlees, op een lichter register
',
    '### Opdracht

Combineer een rode wijn met rood vlees.

### Checklist

- Ik proefde de wijn apart
- Ik proefde met het gerecht
- Ik noteerde het verschil


### Reflectievraag

Bij welk vleesgerecht op je kaart bepaalt het vetgehalte — niet de vleessoort zelf — jouw uiteindelijke wijnadvies, en waarom?',
    10,
    1
  ),
  (
    'rode-wijn-kaas',
    'Rode wijn & kaas',
    'Na deze les begrijp jij hoe rode wijn met kaas werkt.
',
    'De veelgehoorde regel ''rode wijn hoort bij kaas'' is fragieler dan de populaire aanname doet vermoeden, en het mechanisme legt precies uit waarom. Net als bij vlees bindt tannine zich aan eiwit — maar caseïne, het melkeiwit in kaas, bindt in combinatie met het hoge vetgehalte van kaas nog agressiever aan tannine dan vleeseiwitten doen. Dat kan een wijn zo sterk ''overbinden'' dat de structuur wegvalt: de wijn proeft dan dun, heet (de alcohol wordt relatief prominenter) of zelfs licht metaalachtig — een risico dat bij vlees veel minder speelt.

Waar rode wijn wél overtuigend werkt, is bij harde, lang gerijpte kazen (Comté, oude Gouda, Parmigiano Reggiano). Hun dichtere, kristallijne eiwitmatrix bevat relatief minder vrij vet om tannine te overbinden, en hun diepe umami-intensiteit matcht de concentratie van een krachtige, hoogzure rode wijn zoals Nebbiolo of Sangiovese — een kwestie van intensiteitsmatching, niet alleen textuurmatching.

Zachte, vetrijke, korstrijpe of gewassen kazen (Brie, Camembert, Époisses) zijn juist het meest voorkomende faalpunt bij rood: het overvloedige vet overbindt tannine agressief, en de doordringende geur van gewassen korstkazen botst met veel wijnaroma''s. Lichte, laagtanninerijke rode wijn — Pinot Noir, Gamay — vormt hier de uitzondering, precies omdat er simpelweg minder tannine is om te overbinden.

Blauwschimmelkaas is het duidelijkste voorbeeld waarbij droge rode wijn structureel verliest: de combinatie van hoog zout en scherpe schimmelintensiteit overweldigt de droge tanninearchitectuur, met een metaalachtige bitterheid als resultaat. Zoete, versterkte wijn zoals Port werkt hier traditioneel beter, omdat restsuiker het zout neutraliseert — een mechanisme dat een droge rode wijn simpelweg niet kan evenaren.

Praktische vuistregel voor een sommelier: match de dichtheid en umami-concentratie van de kaas aan het tannine- en zuurniveau van de wijn, en wees kritisch op het automatisme ''rood hoort bij kaas'' — bij zachte, vetrijke kazen presteert witte wijn of zelfs Champagne in blinde vergelijkingen vaak beter.


## Food pairing

### Beste pairing

Oude Comté of Parmigiano Reggiano bij een Nebbiolo of Sangiovese.

### Waarom dit werkt

De dichte, kristallijne eiwitmatrix bindt tannine minder agressief, terwijl de diepe umami de concentratie van de wijn matcht.

### Vermijd

Een zachte, vetrijke Brie bij dezelfde krachtige, hooggetanninerijke wijn — het overvloedige vet overbindt de tannine en laat de wijn dun aanvoelen.

## Pro insight

Wees kritisch op het automatisme ''rode wijn hoort bij kaas'' — bied bij een zachte, vetrijke kaas bewust een witte wijn of Champagne als alternatief aan; dat verrast een kaasliefhebber vaker positief dan een standaard rode keuze.',
    '- caseïnematrix en tanninebinding
- harde kaas als uitzondering
- intensiteitsmatching boven kleurmatching
- blauwschimmel-zoutmismatch
- washed-rind-tanninecontrast
',
    'Port werkt vaak beter bij blauwe kaas dan droge rode wijn.
',
    '- Caseïne en vet in kaas binden tannine agressiever dan eiwitten in vlees — ''rood bij kaas'' is fragieler dan gedacht
- Harde, lang gerijpte kazen (Comté, oude Gouda) matchen goed via intensiteit, niet via textuur alleen
- Zachte, vetrijke kazen overbinden tannine agressief — alleen laagtanninerijke rode wijn werkt daar goed
- Blauwschimmelkaas botst met droge rode tannine — zoete Port werkt beter door restsuiker tegen zout
- Match kaasdichtheid en umami-intensiteit aan tannine- en zuurniveau, niet automatisch op kleur
',
    '### Opdracht

Proef drie kazen met één rode wijn.

### Checklist

- Ik proefde apart
- Ik proefde samen
- Ik noteerde verschillen


### Reflectievraag

Bij welke kaas op jouw plank zou jij een gast bewust naar wit in plaats van rood sturen — en welk mechanisme (caseïnebinding, zout) gebruik je om dat advies te onderbouwen?',
    10,
    2
  ),
  (
    'rode-wijn-wild',
    'Rode wijn & wild',
    'Na deze les begrijp jij waarom wild klassieke rode wijnpairing is.
',
    'Wildvlees verschilt structureel van gefokt vlees: minder intramusculair vet, dichter spierweefsel door natuurlijke beweging, en een hoger myoglobinegehalte dat de kenmerkende, licht ijzerachtige ''wilde'' toon geeft. Dat betekent dat het klassieke tannine-vet-mechanisme van les 35 hier zwakker werkt — er is simpelweg minder vet beschikbaar om tannine te binden — waardoor pairing bij wild sterker leunt op een aroma-brug dan op textuurbuffering: aardse, wilde en umami-tonen in het vlees resoneren met tertiaire aroma''s in gerijpte wijn (bosgrond, leer, gedroogd fruit, paddenstoel).

Dat verklaart waarom gerijpte, tertiair ontwikkelde wijn (oude Nebbiolo, gerijpte Syrah, gerijpte Sangiovese) bij wild vaak beter presteert dan een jonge, puur op primair fruit gerichte wijn — de aromatische resonantie op verbindingsniveau weegt hier zwaarder dan pure structuurmatching.

De saus stuurt de keuze sterk. Fruitgedreven, zoetere reductiesauzen (kers, bosbes bij hertenvlees) vragen een wijn met voldoende rijp fruit om die zoetheidsperceptie te evenaren — anders proeft de wijn plots zuur en dun in vergelijking. Rijke, donkere paddenstoel-wijnreductiesauzen — klassiek Frans bij wild — vragen juist een wijn met aardse, umami-compatibele tonen en voldoende zuur om door de rijkdom van de saus te snijden. Peperige, jeneverbesgedreven marinades (klassiek bij hertenvlees en wild zwijn) resoneren specifiek met rotundone-gedreven wijnen zoals Syrah — hetzelfde mechanisme als in les 27.

De intensiteitsschaal van wild loopt op: lichter gevogelte-wild (patrijs, fazant) sluit qua pairinglogica dichter aan bij gevogelte en verdraagt lichtere, elegante rode wijn zoals Pinot Noir; behaard wild (hert, wild zwijn, haas) zit aan het meest intense uiteinde en vraagt de meest complexe, vaak gerijpte en structuurrijke wijnen.

Praktisch betekent dit een omkering ten opzichte van vlees: bij wild vraag je eerst naar de saus en de gaarheid/leeftijd van de wijn, niet primair naar het vetgehalte — de aromatische resonantie is hier de dominante, sturende factor.


## Food pairing

### Beste pairing

Hertenbiefstuk met een rijke rode wijn-paddenstoelsaus bij een gerijpte Nebbiolo of Syrah.

### Waarom dit werkt

De aardse, tertiaire leder- en bosgrondtonen van de gerijpte wijn resoneren met de umami van de paddenstoelsaus, terwijl het zuur door de rijkdom snijdt.

### Vermijd

Een jonge, puur op primair fruit gerichte wijn bij hetzelfde gerecht — zonder tertiaire ontwikkeling ontbreekt de aromatische brug volledig.

## Pro insight

Vraag bij wildpairing eerst naar de saus en de leeftijd van de beschikbare wijn vóór je naar het wildtype kijkt — de aromatische resonantie tussen tertiaire tonen en de saus stuurt hier sterker dan bij standaard vleespairing.',
    '- myoglobineconcentratie
- tertiaire aromabrug
- sausgedreven wildpairing
- rotundone-marinadematch
- wildintensiteitsschaal
',
    'Barolo en truffel zijn een legendarische combinatie.
',
    '- Wild heeft minder vet en meer myoglobine dan gefokt vlees — het tannine-vet-mechanisme werkt zwakker
- Aardse, tertiaire tonen in gerijpte wijn resoneren met de wilde, aardse smaak van het vlees
- Fruitgedreven sauzen vragen rijp fruit in de wijn; paddenstoel-wijnsauzen vragen umami-compatibele aardsheid
- Peperige jeneverbesmarinades resoneren specifiek met rotundone-gedreven wijnen zoals Syrah
- Intensiteit loopt op van lichter gevogelte-wild naar behaard wild, dat de meest complexe wijn vraagt
',
    '### Opdracht

Bedenk drie wildpairings.

### Checklist

- Ik koos het vlees
- Ik koos de wijn
- Ik dacht na over saus


### Reflectievraag

Bij welk wildgerecht op je kaart bepaalt de saus — niet het wildtype zelf — jouw uiteindelijke wijnadvies, en waarom?',
    10,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-red-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine' and m.slug = 'examen-red-wine'
)
insert into academy.lessons (
  module_id, slug, title, learning_objective, theory_markdown,
  key_concepts_markdown, did_you_know, summary_markdown, practice_assignment_markdown,
  duration_minutes, sort_order, is_published
)
select m.id, v.slug, v.title, v.objective, v.theory, v.key_concepts, v.did_you_know, v.summary, v.practice, v.duration, v.sort_order, true
from m
cross join (values
  (
    'pinot-noir-vs-nebbiolo',
    'Pinot Noir vs Nebbiolo blind',
    'Na deze les kun jij {index=0} en {index=1} blind onderscheiden.
',
    'Pinot Noir versus Nebbiolo blind vraagt een vaste deductieketen, precies omdat de eerste, meest voor de hand liggende observatie — kleur — hier misleidt. Beide tonen een vergelijkbare bleke, granaatachtige kleur, maar om totaal verschillende redenen: Pinot Noir is werkelijk arm aan zowel kleurstof als tannine (dunne schil, weinig pitten relatief tot het vruchtvlees); Nebbiolo is even arm aan kleurstof maar extreem rijk aan tannine door een specifieke, catechinerijke schil- en pitchemie. Kleurintensiteit is bij deze twee druiven dus geen betrouwbare voorspeller van tanninegehalte — de belangrijkste valkuil in deze vergelijking.

De deductieketen begint visueel: beide zijn bleek, maar Nebbiolo toont vaak al jong een oranje-granaatrand door een lager totaal antocyaangehalte en snellere pigmentpolymerisatie. Op de neus toont Pinot Noir rode kers, framboos en bosgrond; Nebbiolo toont rozen (damasceon), teer, gedroogde kruiden en zoethout. Op de mond is tannine de doorslaggevende factor: Pinot Noir''s tannine is fijn, laag en zijdezacht; Nebbiolo''s tannine grijpt intens en droog, ondanks de vergelijkbaar bleke kleur — die ene tastwaarneming zou elke op kleur gebaseerde hypothese meteen moeten omgooien.

Klimaat bevestigt het onderscheid: Pinot Noir gedijt in een werkelijk koel klimaat (Bourgogne, Central Otago, Oregon); Nebbiolo heeft een specifiek Piemontees mesoklimaat nodig van warme dagen en koele, mistige nachten. Beide kunnen hoge zuren tonen, maar bij Nebbiolo combineert dat zuur met extreme tannine tot een langdurige, strakke astringentie, terwijl bij Pinot Noir zuur en fijne tannine samen een lineairdere, vloeiendere indruk geven.

Eikensignaal is dubbelzinnig: traditionele Nebbiolo (grote, oude Slavonische vaten) toont nauwelijks nieuwe houtzoetheid, terwijl moderne Nebbiolo of Pinot Noir in Franse barrique wél vanille en toast kan tonen — hout alleen disambigueert dus niets, wat het belang van de tanninearchitectuur als primair bewijs alleen maar versterkt.

Jonge Nebbiolo vormt een klassieke valstrik voor wie vooral op Pinot Noir getraind is: de neus kan verrassend delicaat en bloemig ogen, terwijl de mond meteen een compromisloze, drogende astringentie toont. Train daarom expliciet het hypothese-vóór-onthullingsprotocol: benoem eerst je kleurobservatie, dan je aromahypothese, en pas daarna je bevestiging of verwerping op basis van de mond — vóórdat je het etiket ziet.


## Food pairing

### Beste pairing

Bourgogne rouge (Pinot Noir) bij eend met bospaddenstoelen, of jonge Nebbiolo bij een lichte kalfsragout.

### Waarom dit werkt

Beide combinaties gebruiken de fijne tot stevige tanninearchitectuur van de druif om umami te dragen zonder de subtiele balans te overstemmen.

### Vermijd

Een zeer krachtige, jonge Nebbiolo bij een delicaat visgerecht — de extreme tanninegrip verpletteert die subtiliteit volledig.

## Pro insight

Leg na elke blindronde je topfout vast in één zin (''te snel op kleur vertrouwd, te weinig op tanninegrip''). Dat versnelt leren meer dan tien perfecte proeven zonder reflectie.',
    '- kleur-als-onbetrouwbare-indicator
- astringentie-versus-lineariteit
- mesoklimaat Piemonte
- hypothese-vóór-onthullingsprotocol
- eikensignaal-dubbelzinnigheid
',
    'Veel beginners verwarren Nebbiolo door de lichte kleur.
',
    '- Beide druiven zijn bleek van kleur, maar om tegengestelde redenen — kleur is geen betrouwbare tannine-indicator
- Pinot Noir: fijne, zijdezachte tannine, rood fruit en bosgrond; Nebbiolo: extreme astringentie, roos, teer en kruiden
- Tannine op de mond is het beslissende signaal, niet kleur of neus alleen
- Eikensignaal is dubbelzinnig bij beide druiven en disambigueert de vergelijking niet
- Train het hypothese-vóór-onthullingsprotocol: kleur, dan aroma, dan mond, vóór het etiket
',
    '### Opdracht

Proef blind twee lichte rode wijnen.

### Checklist

- Ik analyseerde kleur
- Ik beoordeelde tannines
- Ik noteerde aroma''s
- Ik trok een conclusie


### Reflectievraag

Bij je laatste blindproef: welke stap in de keten (kleur, neus of mond) sloeg je onbewust over vóór je naar een conclusie sprong?',
    12,
    1
  ),
  (
    'merlot-vs-cabernet',
    'Merlot vs Cabernet blind',
    'Na deze les kun jij {index=2} en {index=3} blind onderscheiden.
',
    'Merlot versus Cabernet Sauvignon blind draait om één centraal mechanisme: een verschillende rijpingscurve die rechtstreeks voortkomt uit schildikte en bessengrootte. Merlot heeft een dunnere schil en grotere bessen — een lagere schil-tot-sap-verhouding — waardoor de druif één tot twee weken eerder rijpt dan Cabernet Sauvignon, met zachtere, rondere tannine en minder pyrazine omdat volledige rijpheid makkelijker haalbaar is, zelfs in koelere jaren. Dat verklaart precies waarom de kleirijke, vochtigere Right Bank van Bordeaux (Pomerol, Saint-Émilion) Merlot als hoofddruif koos — betrouwbare rijping op koelere grond — terwijl de warmtevasthoudende, goed drainerende grind van de Left Bank (Médoc) precies de extra hitte biedt die Cabernet Sauvignon nodig heeft om zijn dikkere schil volledig te laten rijpen.

De deductieketen: visueel tonen beide een diepe kleur, met Cabernet Sauvignon vaak iets meer verzadigd door een hogere kleurstof-tannine-verhouding in de schil. Op de neus toont Merlot pruim, zwarte kers, cacao en zachter, ronder zwart-rood fruit; Cabernet Sauvignon toont cassis, eventueel groene paprika bij onderrijpheid, ceder en potlood/grafiet — een mineraal-savoury signatuur. Op de mond is tanninekorrel opnieuw beslissend: Cabernets tannine is steviger, korreliger, met een langere, drogere afdronk; Merlots tannine is voller, ronder, met een kortere astringentie.

Genetisch zijn de twee druiven nauwer verwant dan hun structurele tegenpolen doen vermoeden: Merlot is een kruising van Cabernet Franc en Magdeleine Noire des Charentes — dezelfde moederdruif die, gekruist met Prunelard, ook Malbec voortbracht (les 28). Merlot en Malbec zijn dus halfbroers, en Merlot en Cabernet Sauvignon delen via Cabernet Franc eveneens verwantschap — een genetische Bordeaux-stamboom die verklaart waarom deze druiven zo naadloos in blends samenwerken in plaats van elkaar te overschaduwen.

Klimaat en jaargang bevestigen de rijpingslogica: in een koeler jaargang kan Cabernet Sauvignon onvoldoende rijpen (dominante groene paprika, harde tannine) terwijl Merlot nog steeds slaagt — historisch de verzekeringslogica achter het samen aanplanten van beide druiven in Bordeaux.

De snelste praktische heuristiek blijft: voelt de wijn rond of strak? Rond correleert met de lager gepolymeriseerde, oplosbaardere tannine van Merlot; strak correleert met de hoger gepolymeriseerde, uit een dikkere schil geëxtraheerde tannine van Cabernet Sauvignon — een eenvoudige vraag met een onderliggend, uitlegbaar mechanisme.


## Food pairing

### Beste pairing

Merlot bij eendenborst met pruimensaus, of Cabernet Sauvignon bij gegrilde ribeye.

### Waarom dit werkt

Merlots ronde tannine en pruimtoon spiegelen de zoete saus; Cabernets stevigere, korreligere tannine matcht het geroosterde vet van de ribeye.

### Vermijd

Een strak, jong Cabernet Sauvignon bij een delicaat gerecht met pruimensaus — de stevige tannine en cassis overstemmen de zachte zoetheid van de saus.

## Pro insight

Bij twijfel tussen Merlot en Cabernet Sauvignon: vertrouw eerst op de tanninekorrel (rond versus strak), niet op kleur alleen — kleurverzadiging verschilt te subtiel om als hoofdbewijs te dienen.',
    '- rijpingscurve-verschil
- grind versus klei (Bordeaux-oevers)
- pyrazine-onderrijpheidssignaal
- cederhout-en-grafietsignatuur
- Bordeaux-stamboomverwantschap
',
    'In veel Bordeaux-blends zijn deze druiven samen aanwezig.
',
    '- Merlot rijpt één tot twee weken eerder dan Cabernet Sauvignon door een dunnere schil en grotere bessen
- Klei (Right Bank, Merlot) versus grind (Left Bank, Cabernet Sauvignon) weerspiegelt die rijpingsbehoefte
- Tanninekorrel is het beslissende signaal: rond en vol (Merlot) versus strak en korrelig (Cabernet Sauvignon)
- Merlot en Malbec zijn genetische halfbroers via moederdruif Magdeleine Noire des Charentes
- Koudere jaargangen verklaren historisch waarom Bordeaux beide druiven samen aanplant als verzekering
',
    '### Opdracht

Proef blind twee Bordeaux-blends.

### Checklist

- Ik zocht structuur
- Ik zocht fruitprofiel
- Ik noteerde tannines


### Reflectievraag

Wat vond jij moeilijker: tanninekorrel isoleren of het genetische verband tussen Merlot en Malbec onthouden — en welk glas zou je nogmaals willen proeven om zeker te worden?',
    12,
    2
  ),
  (
    'red-wine-final-exam',
    'Theorie- en praktijkexamen',
    'Na deze les toon jij dat je de volledige Red Wine Track beheerst.
',
    'Dit Master-examen integreert de volledige Red Wine Track: fundament, productie, proeftechniek, lichte, medium en krachtige druivenrassen, service, pairing en blindanalyse. Het productieproces — schilcontact en extractie als bron van kleur en tannine, de keuze voor houtlagering — legt de basis voor drie druivenfamilies die elk een ander structureel mechanisme centraal stellen: lichte druiven (Pinot Noir, Gamay, Grenache, Cinsault, Mencía) drijven op fijne tannine en primair fruit; medium body-druiven (Merlot, Sangiovese, Tempranillo, Barbera, Zinfandel) balanceren tannine, zuur en fruitconcentratie; krachtige druiven (Cabernet Sauvignon, Syrah, Malbec, Nebbiolo, Mourvèdre) drijven op dikke schillen, hoge tannineconcentratie en vaak een specifieke genetische of klimatologische verklaring voor hun kracht.

Service bouwt daarop voort: temperatuur stuurt tegelijk ethanolvolatiliteit en de eiwitbindingskinetiek achter tanninepercepetie, glasvorm richt beluchting en tongpositionering per structuurtype, decanteren lost bij rode wijn zowel sedimentscheiding als tanninepolymerisatie op afhankelijk van het doel, en bewaren verloopt via tannine-antocyaan-polymerisatie in plaats van de oxidatieve route van witte wijn. Pairing bouwt op onderliggende mechanismen — tannine-eiwitbinding verklaart waarom rood bij vlees werkt, de agressievere caseïnebinding verklaart waarom rood bij kaas fragieler is dan gedacht, en de zwakkere vetbuffering bij wild verschuift pairinglogica naar een aromatische tertiaire brug.

Blindanalyse integreert dat allemaal in één systematische keten: visueel, neus (primair, secundair, tertiair — met specifieke chemische en genetische markers zoals rotundone, damasceon, IBMP-pyrazine en tannine-kleur-ontkoppeling als objectief bewijs in plaats van gokwerk), mond, klimaat- en houtsignaal, en pas dan een onderbouwde hypothese. Pinot Noir versus Nebbiolo en Merlot versus Cabernet Sauvignon tonen beide dat tanninearchitectuur — niet kleur, niet hout — het betrouwbaarste bewijs is.

Succesvolle examenkandidaten vermijden drie terugkerende fouten: te snel op kleurintensiteit vertrouwen als tannine-indicator vóór de tastwaarneming compleet is, verkeerde temperatuur- of glasaannames bij servicevragen die structuurtype negeren, en pairingadvies dat traditie citeert (''rood hoort bij vlees, rood hoort bij kaas'') zonder het onderliggende mechanisme te benoemen. Dit examen beloont expliciete argumentatie boven geraden antwoorden, op elk van de drie examenonderdelen.


## Food pairing

### Beste pairing

Examenonderdeel pairing: kies per gerecht een rode wijnstijl op basis van tannine-eiwitbinding, caseïnebinding en aromatische brug.

### Waarom dit werkt

Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.

### Vermijd

Eén wijnstijl voor alle examengerechten zonder onderbouwing per mechanisme.

## Pro insight

Lees examenvragen als servicecases: wat zou je schenken vrijdagavond om 20:00 bij deze gast en dit gerecht — en waarom precies dat mechanisme, niet die traditie?',
    '- examenintegratie
- systematische deductieketen
- tanninemechanismen in service en pairing
- structuur-eerst-principe
- certificering
',
    '',
    '- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)
- Productie en druivenfamilies (licht, medium, krachtig) vormen het fundament van elke analyse
- Service en pairing bouwen op mechanismen (temperatuur, tannine-eiwitbinding, caseïnebinding)
- Blindanalyse vraagt tannine en structuur eerst — chemische en genetische markers boven gokwerk
- Veelvoorkomende fouten: op kleur vertrouwen, verkeerde temperatuuraannames, traditie zonder mechanisme
',
    '### Examenonderdeel 1 — Theorie (20 vragen)

Beantwoord de volledige meerkeuzequiz van twintig vragen zonder hulpmiddelen. Minimaal 70% (14 van de 20) is vereist om te slagen.

### Examenonderdeel 2 — Blindproeven (2 glazen)

Analyseer twee rode wijnen — bij voorkeur uit verschillende structuurcategorieën (bijvoorbeeld één medium body en één krachtige stijl) — volgens het vaste protocol:

- kleur en intensiteit (inclusief randkleur)
- geur (primair, secundair, tertiair)
- tannine, zuur, body en lengte
- vermoedelijk druivenras, met minstens drie argumenten
- serviceadvies (temperatuur, glas, decanteren)

### Examenonderdeel 3 — Pairing (3 gerechten)

Koppel een onderbouwde rode wijnstijl aan elk van de volgende gerechten:

1. Gegrilde ribeye van de barbecue
2. Oude Comté of vergelijkbare harde kaas
3. Hertenbiefstuk met een rijke wildsaus

Motiveer elke keuze via het onderliggende mechanisme (tannine-eiwitbinding, caseïnebinding, aromatische brug) — niet via traditie alleen.

### Beoordeling

- 18–20 goed + correcte blindanalyse = Master Distinction
- 15–17 goed = Master Pass
- 12–14 goed = Conditional Pass — herhaal de zwakste module
- Minder dan 12 goed = Retry

Bij slagen ontvang je de certificering **Way of Tasting Academy — Red Wine Certified (Master Foundation)**.

### Checklist

- Ik heb alle drie examenonderdelen volledig afgerond
- Ik documenteerde mijn blindhypotheses vóór de onthulling
- Ik motiveerde elk pairing via tannine-eiwit, vet of umami
- Ik noteerde mijn score en zwakste onderdeel
- Ik kan mijn keuzes mondeling verdedigen


### Reflectievraag

Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste schakel, en welke ene wekelijkse routine zou dat het snelst verbeteren?',
    20,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- Quizvragen
with l as (
  select l.id, m.slug as module_slug, l.slug as lesson_slug
  from academy.lessons l
  join academy.modules m on m.id = l.module_id
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'red-wine'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-red-wine', 'wat-is-rode-wijn', 1, 'Waar wordt rode wijn van gemaakt?', '["Witte druiven", "Blauwe druiven", "Rozijnen", "Appels"]', 1, 'Correct: Blauwe druiven'),
  ('intro-red-wine', 'wat-is-rode-wijn', 2, 'Waar komt de kleur vandaan?', '["Het sap", "De pitten", "De schillen", "Het hout"]', 2, 'Correct: De schillen'),
  ('intro-red-wine', 'wat-is-rode-wijn', 3, 'Wat geven schillen nog meer?', '["Suiker", "Zuur", "Tannine", "Water"]', 2, 'Correct: Tannine'),
  ('intro-red-wine', 'wat-is-rode-wijn', 4, 'Wat is schilcontact?', '["Druiven koelen", "Sap en schillen samen vergisten", "Druiven persen", "Wijn filteren"]', 1, 'Correct: Sap en schillen samen vergisten'),
  ('intro-red-wine', 'wat-is-rode-wijn', 5, 'Rode wijn is:', '["Altijd zwaar", "Altijd zoet", "Altijd jong", "Heel veelzijdig"]', 3, 'Correct: Heel veelzijdig'),
  ('intro-red-wine', 'hoe-ontstaat-rode-wijn', 1, 'Wat gebeurt eerst?', '["Bottelen", "Oogsten", "Houtrijping", "Decanteren"]', 1, 'Correct: Oogsten'),
  ('intro-red-wine', 'hoe-ontstaat-rode-wijn', 2, 'Wat doet gist?', '["Maakt zuur", "Maakt alcohol", "Maakt kleur", "Maakt hout"]', 1, 'Correct: Maakt alcohol'),
  ('intro-red-wine', 'hoe-ontstaat-rode-wijn', 3, 'Wat is extractie?', '["Suiker toevoegen", "Kleur uit schillen halen", "Wijn koelen", "Wijn filteren"]', 1, 'Correct: Kleur uit schillen halen'),
  ('intro-red-wine', 'hoe-ontstaat-rode-wijn', 4, 'Waar komt tannine vandaan?', '["Water", "Hout", "Schillen", "Alcohol"]', 2, 'Correct: Schillen'),
  ('intro-red-wine', 'hoe-ontstaat-rode-wijn', 5, 'Wat gebeurt na fermentatie?', '["Persen", "Oogsten", "Planten", "Snoeien"]', 0, 'Correct: Persen'),
  ('intro-red-wine', 'waarom-is-rode-wijn-uniek', 1, 'Wat geeft astringentie?', '["Suiker", "Tannine", "Alcohol", "Water"]', 1, 'Correct: Tannine'),
  ('intro-red-wine', 'waarom-is-rode-wijn-uniek', 2, 'Wat maakt rode wijn geschikt voor vlees?', '["Bubbels", "Tannines", "Lage alcohol", "Zoetheid"]', 1, 'Correct: Tannines'),
  ('intro-red-wine', 'waarom-is-rode-wijn-uniek', 3, 'Wat ontstaat bij rijping?', '["Minder smaak", "Meer complexiteit", "Meer suiker", "Meer zuur"]', 1, 'Correct: Meer complexiteit'),
  ('intro-red-wine', 'waarom-is-rode-wijn-uniek', 4, 'Rode wijn kan:', '["Vaak rijpen", "Nooit rijpen", "Alleen jong drinken", "Alleen gekoeld"]', 0, 'Correct: Vaak rijpen'),
  ('intro-red-wine', 'waarom-is-rode-wijn-uniek', 5, 'Wat hoort bij oude rode wijn?', '["Truffel", "Citrus", "Gras", "Lychee"]', 0, 'Correct: Truffel'),
  ('intro-red-wine', 'geschiedenis-rode-wijn', 1, 'Hoe oud is wijn ongeveer?', '["500 jaar", "2000 jaar", "8000 jaar", "100 jaar"]', 2, 'Correct: 8000 jaar'),
  ('intro-red-wine', 'geschiedenis-rode-wijn', 2, 'Wie verspreidden wijnbouw?', '["Vikingen", "Romeinen", "Engelsen", "Nederlanders"]', 1, 'Correct: Romeinen'),
  ('intro-red-wine', 'geschiedenis-rode-wijn', 3, 'Welke regio hoort erbij?', '["Bordeaux", "Champagne", "Mosel", "Marlborough"]', 0, 'Correct: Bordeaux'),
  ('intro-red-wine', 'geschiedenis-rode-wijn', 4, 'Waar ligt Rioja?', '["Italië", "Spanje", "Frankrijk", "Portugal"]', 1, 'Correct: Spanje'),
  ('intro-red-wine', 'geschiedenis-rode-wijn', 5, 'Rode wijn is:', '["Wereldwijd belangrijk", "Alleen Europees", "Alleen oud", "Alleen zoet"]', 0, 'Correct: Wereldwijd belangrijk'),
  ('intro-red-wine', 'rode-wijncategorieen', 1, 'Welke stijl is vaak licht?', '["Pinot Noir", "Cabernet Sauvignon", "Malbec", "Syrah"]', 0, 'Correct: Pinot Noir'),
  ('intro-red-wine', 'rode-wijncategorieen', 2, 'Welke stijl is vaak krachtig?', '["Gamay", "Cabernet Sauvignon", "Cinsault", "Pinot Noir"]', 1, 'Correct: Cabernet Sauvignon'),
  ('intro-red-wine', 'rode-wijncategorieen', 3, 'Wat bepaalt structuur?', '["Suiker", "Tannine", "Water", "Zuurstof"]', 1, 'Correct: Tannine'),
  ('intro-red-wine', 'rode-wijncategorieen', 4, 'Body betekent:', '["Kleur", "Mondgevoel", "Alcohol", "Leeftijd"]', 1, 'Correct: Mondgevoel'),
  ('intro-red-wine', 'rode-wijncategorieen', 5, 'Kracht betekent:', '["Altijd betere wijn", "Meer structuur mogelijk", "Minder smaak", "Minder rijping"]', 1, 'Correct: Meer structuur mogelijk'),
  ('productie-red-wine', 'schilcontact-uitgelegd', 1, 'Wat geeft kleur?', '["Sap", "Schillen", "Alcohol", "Hout"]', 1, 'Correct: Schillen'),
  ('productie-red-wine', 'schilcontact-uitgelegd', 2, 'Wat geeft structuur?', '["Tannines", "Water", "Suiker", "Zuurstof"]', 0, 'Correct: Tannines'),
  ('productie-red-wine', 'schilcontact-uitgelegd', 3, 'Wat gebeurt bij langer schilcontact?', '["Minder kleur", "Meer extractie", "Minder alcohol", "Minder geur"]', 1, 'Correct: Meer extractie'),
  ('productie-red-wine', 'schilcontact-uitgelegd', 4, 'Pinot Noir heeft vaak:', '["Dikke schillen", "Dunne schillen", "Geen schillen", "Witte schillen"]', 1, 'Correct: Dunne schillen'),
  ('productie-red-wine', 'schilcontact-uitgelegd', 5, 'Schilcontact gebeurt tijdens:', '["Botteling", "Vergisting", "Rijping", "Oogst"]', 1, 'Correct: Vergisting'),
  ('productie-red-wine', 'extractie-kleur-tannine', 1, 'Wat is extractie?', '["Koelen", "Stoffen uit schillen halen", "Filteren", "Bottelen"]', 1, 'Correct: Stoffen uit schillen halen'),
  ('productie-red-wine', 'extractie-kleur-tannine', 2, 'Wat geeft kleur?', '["Anthocyanen", "Alcohol", "Zuur", "Water"]', 0, 'Correct: Anthocyanen'),
  ('productie-red-wine', 'extractie-kleur-tannine', 3, 'Wat beïnvloedt extractie?', '["Tijd", "Flesvorm", "Kurk", "Glas"]', 0, 'Correct: Tijd'),
  ('productie-red-wine', 'extractie-kleur-tannine', 4, 'Meer extractie geeft vaak:', '["Meer body", "Minder geur", "Minder kleur", "Minder alcohol"]', 0, 'Correct: Meer body'),
  ('productie-red-wine', 'extractie-kleur-tannine', 5, 'Te veel extractie kan:', '["Zachter maken", "Hard maken", "Zoeter maken", "Koeler maken"]', 1, 'Correct: Hard maken'),
  ('productie-red-wine', 'alcoholische-gisting', 1, 'Wat maakt gist?', '["Alcohol", "Water", "Hout", "Tannine"]', 0, 'Correct: Alcohol'),
  ('productie-red-wine', 'alcoholische-gisting', 2, 'Wat ontstaat nog meer?', '["CO₂", "Zout", "Suiker", "Kurk"]', 0, 'Correct: CO₂'),
  ('productie-red-wine', 'alcoholische-gisting', 3, 'Welke temperatuur is normaal?', '["5 °C", "10 °C", "25–32 °C", "40 °C"]', 2, 'Correct: 25–32 °C'),
  ('productie-red-wine', 'alcoholische-gisting', 4, 'Te warm is:', '["Goed", "Riskant", "Verplicht", "Onmogelijk"]', 1, 'Correct: Riskant'),
  ('productie-red-wine', 'alcoholische-gisting', 5, 'Warmte helpt:', '["Extractie", "Koeling", "Botteling", "Filtering"]', 0, 'Correct: Extractie'),
  ('productie-red-wine', 'houtlagering', 1, 'Welk hout wordt vaak gebruikt?', '["Eik", "Den", "Beuk", "Spar"]', 0, 'Correct: Eik'),
  ('productie-red-wine', 'houtlagering', 2, 'Wat geeft hout?', '["Vanille", "Citrus", "Gras", "Lychee"]', 0, 'Correct: Vanille'),
  ('productie-red-wine', 'houtlagering', 3, 'Nieuw hout geeft:', '["Meer smaak", "Minder smaak", "Geen smaak", "Minder kleur"]', 0, 'Correct: Meer smaak'),
  ('productie-red-wine', 'houtlagering', 4, 'Wat doet zuurstof?', '["Verzacht tannines", "Verhoogt suiker", "Verlaagt alcohol", "Verhoogt zuur"]', 0, 'Correct: Verzacht tannines'),
  ('productie-red-wine', 'houtlagering', 5, 'Barrique is:', '["50 liter", "100 liter", "225 liter", "500 liter"]', 2, 'Correct: 225 liter'),
  ('productie-red-wine', 'rijping-rode-wijn', 1, 'Wat gebeurt met tannines?', '["Worden zachter", "Worden harder", "Verdwijnen direct", "Worden zoeter"]', 0, 'Correct: Worden zachter'),
  ('productie-red-wine', 'rijping-rode-wijn', 2, 'Wat ontstaat later?', '["Tertiaire aroma's", "Minder geur", "Meer suiker", "Meer zuur"]', 0, 'Correct: Tertiaire aroma''s'),
  ('productie-red-wine', 'rijping-rode-wijn', 3, 'Wat is een tertiair aroma?', '["Tabak", "Citrus", "Banaan", "Gras"]', 0, 'Correct: Tabak'),
  ('productie-red-wine', 'rijping-rode-wijn', 4, 'Wordt elke wijn beter oud?', '["Ja", "Nee", "Alleen wit", "Alleen rosé"]', 1, 'Correct: Nee'),
  ('productie-red-wine', 'rijping-rode-wijn', 5, 'Wat bepaalt bewaarpotentieel?', '["Structuur", "Kleur", "Flesvorm", "Etiket"]', 0, 'Correct: Structuur'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 1, 'Wat is stap één?', '["Proeven", "Kijken", "Schudden", "Decanteren"]', 1, 'Correct: Kijken'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 2, 'Wat beoordeel je bij kijken?', '["Tannine", "Kleur", "Alcohol", "Hout"]', 1, 'Correct: Kleur'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 3, 'Wat beoordeel je bij ruiken?', '["Aroma's", "Temperatuur", "Glas", "Kurk"]', 0, 'Correct: Aroma''s'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 4, 'Wat beoordeel je bij proeven?', '["Structuur", "Etiket", "Oogstjaar", "Producent"]', 0, 'Correct: Structuur'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 5, 'Waarom systematisch?', '["Sneller leren herkennen", "Mooier glas", "Meer alcohol", "Minder geur"]', 0, 'Correct: Sneller leren herkennen'),
  ('proeven-red-wine', 'kleur-analyseren', 1, 'Wat zegt kleur vaak?', '["Leeftijd", "Prijs", "Regio", "Kurk"]', 0, 'Correct: Leeftijd'),
  ('proeven-red-wine', 'kleur-analyseren', 2, 'Wat heeft vaak lichte kleur?', '["Pinot Noir", "Malbec", "Syrah", "Cabernet"]', 0, 'Correct: Pinot Noir'),
  ('proeven-red-wine', 'kleur-analyseren', 3, 'Wat zie je vaak bij jonge wijn?', '["Oranje", "Paars", "Bruin", "Goud"]', 1, 'Correct: Paars'),
  ('proeven-red-wine', 'kleur-analyseren', 4, 'Wat zie je bij oudere wijn?', '["Groen", "Granaat", "Paars", "Wit"]', 1, 'Correct: Granaat'),
  ('proeven-red-wine', 'kleur-analyseren', 5, 'Een rode wijn heeft een lichte kleur maar een opvallend hoge, grove tannine-intensiteit. Wat is de meest waarschijnlijke verklaring?', '["De wijn is zeer oud", "Een dunschillige druif met van nature hoge tannine, zoals Nebbiolo", "Onvoldoende extractie tijdens de gisting", "Overmatige houtrijping"]', 1, 'Correct: Een dunschillige druif met van nature hoge tannine, zoals Nebbiolo'),
  ('proeven-red-wine', 'aromas-herkennen', 1, 'Wat is primair?', '["Rijping", "Druif", "Hout", "Fles"]', 1, 'Correct: Druif'),
  ('proeven-red-wine', 'aromas-herkennen', 2, 'Wat is secundair?', '["Productie", "Druif", "Leeftijd", "Kelder"]', 0, 'Correct: Productie'),
  ('proeven-red-wine', 'aromas-herkennen', 3, 'Wat is tertiair?', '["Rijping", "Gisting", "Schilcontact", "Persing"]', 0, 'Correct: Rijping'),
  ('proeven-red-wine', 'aromas-herkennen', 4, 'Wat hoort bij tertiair?', '["Tabak", "Citroen", "Gras", "Banaan"]', 0, 'Correct: Tabak'),
  ('proeven-red-wine', 'aromas-herkennen', 5, 'Wat hoort bij primair?', '["Braam", "Leer", "Toast", "Aarde"]', 0, 'Correct: Braam'),
  ('proeven-red-wine', 'tannines-herkennen', 1, 'Wat doen tannines?', '["Zoeten", "Drogen", "Koelen", "Verzachten"]', 1, 'Correct: Drogen'),
  ('proeven-red-wine', 'tannines-herkennen', 2, 'Waar voel je tannines?', '["Tandvlees", "Oren", "Ogen", "Handen"]', 0, 'Correct: Tandvlees'),
  ('proeven-red-wine', 'tannines-herkennen', 3, 'Welke druif heeft vaak hoge tannines?', '["Pinot Noir", "Nebbiolo", "Riesling", "Sauvignon Blanc"]', 1, 'Correct: Nebbiolo'),
  ('proeven-red-wine', 'tannines-herkennen', 4, 'Waarom belangrijk?', '["Rijping", "Kleur", "Bubbels", "Suiker"]', 0, 'Correct: Rijping'),
  ('proeven-red-wine', 'tannines-herkennen', 5, 'Een wijnmaker wil zachtere, meer gepolijste tannine bereiken zonder in te leveren op kleurdiepte. Welke aanpassing helpt daarbij het meest?', '["Langere maceratie met intensief pitcontact", "Voorzichtige extractie gericht op schiltannine, met minimaal pitcontact", "Uitsluitend Amerikaans eikenhout gebruiken", "Volledig stoppen met schilcontact"]', 1, 'Correct: Voorzichtige extractie gericht op schiltannine, met minimaal pitcontact'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 1, 'Waarom worden bij rode wijn de schillen tijdens de vergisting in contact gehouden met het sap?', '["Om het alcoholpercentage te verlagen", "Om kleurstoffen en tannine te extraheren", "Om de zuurgraad te verhogen", "Om het suikergehalte te verhogen"]', 1, 'Correct: Om kleurstoffen en tannine te extraheren'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 2, 'Je proeft een wijn met een paarse, violette rand. Wat concludeer je het eerst?', '["De wijn is waarschijnlijk oud", "De wijn is waarschijnlijk relatief jong", "De wijn heeft veel houtrijping gehad", "De wijn is versterkt"]', 1, 'Correct: De wijn is waarschijnlijk relatief jong'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 3, 'Een wijn heeft een opvallend lichte kleur maar extreem hoge, grove tannine. Welke druif past hier het beste bij, en waarom is dit verrassend?', '["Merlot, omdat Merlot altijd licht van kleur is", "Nebbiolo, omdat lichte kleur bij deze druif niet wijst op lage tannine", "Zinfandel, omdat Zinfandel altijd licht van kleur is", "Grenache, omdat Grenache nooit tannine bevat"]', 1, 'Correct: Nebbiolo, omdat lichte kleur bij deze druif niet wijst op lage tannine'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 4, 'Je ruikt leer, tabak en natte aarde in een gerijpte rode wijn. In welke aromalaag hoort dit?', '["Primair", "Secundair", "Tertiair", "Geen van deze"]', 2, 'Correct: Tertiair'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 5, 'Wat is het belangrijkste verschil tussen schiltannine en pittannine?', '["Schiltannine is grover en bitterder dan pittannine", "Pittannine is grover en bitterder dan schiltannine", "Beide zijn identiek van structuur", "Pittannine komt alleen voor bij witte wijn"]', 1, 'Correct: Pittannine is grover en bitterder dan schiltannine'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 6, 'Waarom wordt een jonge, agressief tanninerijke rode wijn na jaren rijping vaak zachter, zonder dat het tanninegehalte daalt?', '["Tannine verdampt met de tijd", "Tanninemoleculen polymeriseren tot langere ketens en slaan deels neer", "Zuur neutraliseert tannine volledig", "Alcohol breekt tannine chemisch af"]', 1, 'Correct: Tanninemoleculen polymeriseren tot langere ketens en slaan deels neer'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 7, 'Wat is de juiste volgorde van het blinde rode-wijnprotocol?', '["Aroma, structuur, kleur, hypothese", "Kleur, aroma, structuur, hypothese", "Structuur, kleur, aroma, hypothese", "Hypothese, structuur, kleur, aroma"]', 1, 'Correct: Kleur, aroma, structuur, hypothese'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 8, 'Hoe test je tannine het meest objectief?', '["Door te letten op zoetheid op de tongpunt", "Door te letten op droogte en astringentie op tandvlees en wangen", "Door de kleur van de wijn te beoordelen", "Door het alcoholpercentage te schatten"]', 1, 'Correct: Door te letten op droogte en astringentie op tandvlees en wangen'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 9, 'Een wijnmaker verlengt de maceratietijd en past intensievere pigeage toe. Wat is het meest directe effect, los van de druif zelf?', '["Minder kleur en minder tannine", "Meer kleur en meer tannine", "Een hoger suikergehalte", "Een lager alcoholpercentage"]', 1, 'Correct: Meer kleur en meer tannine'),
  ('proeven-red-wine', 'mini-toets-rode-wijn', 10, 'Blind: paarse rand, diepe kleur, rijp zwart fruit, hoge en grove tannine, hoog alcohol. Welke stijlhypothese past het beste?', '["Jonge, structuurrijke rode wijn uit een warm klimaat", "Oude, lichte rode wijn uit een koel klimaat", "Witte wijn met schilcontact", "Versterkte wijn zonder gisting"]', 0, 'Correct: Jonge, structuurrijke rode wijn uit een warm klimaat'),
  ('lichte-druiven-red-wine', 'pinot-noir', 1, 'Waar staat Pinot Noir vooral om bekend?', '["Hoge tannines", "Lichte elegantie", "Hoge alcohol", "Veel hout"]', 1, 'Correct: Lichte elegantie'),
  ('lichte-druiven-red-wine', 'pinot-noir', 2, 'Welke regio is klassiek voor Pinot Noir?', '["Rioja", "Burgundy", "Douro", "Mosel"]', 1, 'Correct: Burgundy'),
  ('lichte-druiven-red-wine', 'pinot-noir', 3, 'Welke aroma hoort vaak bij Pinot Noir?', '["Cassis", "Aardbei", "Lychee", "Peper"]', 1, 'Correct: Aardbei'),
  ('lichte-druiven-red-wine', 'pinot-noir', 4, 'Pinot Noir heeft meestal:', '["Lage tot medium tannines", "Zeer hoge tannines", "Geen zuren", "Veel restsuiker"]', 0, 'Correct: Lage tot medium tannines'),
  ('lichte-druiven-red-wine', 'pinot-noir', 5, 'Pinot Noir is sterk beïnvloed door:', '["Hout", "Terroir", "Fortificatie", "Oxidatie"]', 1, 'Correct: Terroir'),
  ('lichte-druiven-red-wine', 'gamay', 1, 'Waar komt Gamay vooral vandaan?', '["Beaujolais", "Bordeaux", "Napa", "Douro"]', 0, 'Correct: Beaujolais'),
  ('lichte-druiven-red-wine', 'gamay', 2, 'Gamay heeft meestal:', '["Lage tannines", "Hoge tannines", "Veel hout", "Veel alcohol"]', 0, 'Correct: Lage tannines'),
  ('lichte-druiven-red-wine', 'gamay', 3, 'Welke techniek hoort vaak bij Gamay?', '["Houtrijping", "Carbonic maceration", "Fortificatie", "Solera"]', 1, 'Correct: Carbonic maceration'),
  ('lichte-druiven-red-wine', 'gamay', 4, 'Welke aroma is typisch?', '["Banaan", "Cassis", "Teer", "Tabak"]', 0, 'Correct: Banaan'),
  ('lichte-druiven-red-wine', 'gamay', 5, 'Je proeft een zeer lichte, laagtanninige rode wijn met een opvallende banaan- en kersendropgeur. Welke techniek verklaart dit het beste?', '["Lange vatrijping", "Carbonic maceratie", "Koude weking", "Micro-oxygenatie"]', 1, 'Correct: Carbonic maceratie'),
  ('lichte-druiven-red-wine', 'grenache', 1, 'Grenache houdt van:', '["Koude klimaten", "Warme klimaten", "Nat klimaat", "Hoogte"]', 1, 'Correct: Warme klimaten'),
  ('lichte-druiven-red-wine', 'grenache', 2, 'Grenache heeft vaak:', '["Hoge zuren", "Hoge alcohol", "Lage alcohol", "Geen fruit"]', 1, 'Correct: Hoge alcohol'),
  ('lichte-druiven-red-wine', 'grenache', 3, 'Grenache wordt vaak gebruikt in:', '["Blends", "Port only", "Dessert only", "Sparkling only"]', 0, 'Correct: Blends'),
  ('lichte-druiven-red-wine', 'grenache', 4, 'Typisch aroma?', '["Rijp rood fruit", "Gras", "Citrus", "Krijt"]', 0, 'Correct: Rijp rood fruit'),
  ('lichte-druiven-red-wine', 'grenache', 5, 'Belangrijke regio?', '["Châteauneuf-du-Pape", "Champagne", "Mosel", "Tokaj"]', 0, 'Correct: Châteauneuf-du-Pape'),
  ('lichte-druiven-red-wine', 'cinsault', 1, 'Cinsault is meestal:', '["Licht en soepel", "Zeer krachtig", "Zoet", "Oxidatief"]', 0, 'Correct: Licht en soepel'),
  ('lichte-druiven-red-wine', 'cinsault', 2, 'Cinsault wordt vaak gebruikt voor:', '["Rosé", "Port", "Sherry", "Madeira"]', 0, 'Correct: Rosé'),
  ('lichte-druiven-red-wine', 'cinsault', 3, 'Welke stijl hoort erbij?', '["Lage tannines", "Hoge tannines", "Veel zuur", "Hoog alcohol"]', 0, 'Correct: Lage tannines'),
  ('lichte-druiven-red-wine', 'cinsault', 4, 'Cinsault is vaak:', '["Blendpartner", "Altijd single vineyard", "Mousserend", "Versterkt"]', 0, 'Correct: Blendpartner'),
  ('lichte-druiven-red-wine', 'cinsault', 5, 'In een Grenache-Cinsault-blend proef je een opfrissende, bloemige onderlaag onder rijp, geconcentreerd fruit. Welke conclusie trek je?', '["De blend bevat geen Grenache", "De bloemige onderlaag komt waarschijnlijk van Cinsault", "De blend is volledig geoxideerd", "De blend bevat uitsluitend Syrah"]', 1, 'Correct: De bloemige onderlaag komt waarschijnlijk van Cinsault'),
  ('lichte-druiven-red-wine', 'mencia', 1, 'Mencía komt vooral uit:', '["Spanje", "Frankrijk", "Italië", "Argentinië"]', 0, 'Correct: Spanje'),
  ('lichte-druiven-red-wine', 'mencia', 2, 'Belangrijke regio?', '["Bierzo", "Rioja", "Bordeaux", "Chianti"]', 0, 'Correct: Bierzo'),
  ('lichte-druiven-red-wine', 'mencia', 3, 'Typische stijl?', '["Elegant", "Zeer zwaar", "Zoet", "Oxidatief"]', 0, 'Correct: Elegant'),
  ('lichte-druiven-red-wine', 'mencia', 4, 'Mencía heeft vaak:', '["Mineraliteit", "Veel hout", "Veel suiker", "Lage zuren"]', 0, 'Correct: Mineraliteit'),
  ('lichte-druiven-red-wine', 'mencia', 5, 'Twee lichtgekleurde, hoogzure rode wijnen met rood fruit en bloemige tonen liggen naast elkaar. De ene toont een duidelijke minerale, leisteenachtige rand, de andere niet. Welke conclusie trek je?', '["De minerale wijn is waarschijnlijk Mencía uit Bierzo", "De minerale wijn is zeker Pinot Noir uit Bourgogne", "Mineraliteit wijst altijd op houtrijping", "Mineraliteit is bij rode wijn nooit betrouwbaar"]', 0, 'Correct: De minerale wijn is waarschijnlijk Mencía uit Bierzo'),
  ('medium-druiven-red-wine', 'merlot', 1, 'Merlot staat bekend om:', '["Hoge zuren", "Zachte tannines", "Veel bubbels", "Oxidatieve stijl"]', 1, 'Correct: Zachte tannines'),
  ('medium-druiven-red-wine', 'merlot', 2, 'Welke aroma is typisch?', '["Pruim", "Citroen", "Gras", "Lychee"]', 0, 'Correct: Pruim'),
  ('medium-druiven-red-wine', 'merlot', 3, 'Merlot is vaak:', '["Strakker dan Cabernet", "Zachter dan Cabernet", "Zoeter dan Port", "Lichter dan Gamay"]', 1, 'Correct: Zachter dan Cabernet'),
  ('medium-druiven-red-wine', 'merlot', 4, 'Belangrijke regio?', '["Pomerol", "Mosel", "Champagne", "Douro"]', 0, 'Correct: Pomerol'),
  ('medium-druiven-red-wine', 'merlot', 5, 'Merlot geeft vaak:', '["Rondheid", "Extreme zuren", "Lage alcohol", "Veel rook"]', 0, 'Correct: Rondheid'),
  ('medium-druiven-red-wine', 'sangiovese', 1, 'Sangiovese komt vooral uit:', '["Italië", "Spanje", "Portugal", "Chili"]', 0, 'Correct: Italië'),
  ('medium-druiven-red-wine', 'sangiovese', 2, 'Belangrijkste stijl?', '["Hoge zuren", "Lage zuren", "Zoet", "Mousserend"]', 0, 'Correct: Hoge zuren'),
  ('medium-druiven-red-wine', 'sangiovese', 3, 'Typisch aroma?', '["Kers", "Cassis", "Banaan", "Lychee"]', 0, 'Correct: Kers'),
  ('medium-druiven-red-wine', 'sangiovese', 4, 'Brunello is:', '["Een blend", "Pure Sangiovese", "Versterkte wijn", "Mousserend"]', 1, 'Correct: Pure Sangiovese'),
  ('medium-druiven-red-wine', 'sangiovese', 5, 'Sangiovese is sterk in:', '["Gastronomie", "Dessert", "Portpairing", "Zoete gerechten"]', 0, 'Correct: Gastronomie'),
  ('medium-druiven-red-wine', 'tempranillo', 1, 'Tempranillo is de topdruif van:', '["Spanje", "Frankrijk", "Italië", "Portugal"]', 0, 'Correct: Spanje'),
  ('medium-druiven-red-wine', 'tempranillo', 2, 'Belangrijkste regio?', '["Rioja", "Bordeaux", "Mosel", "Burgundy"]', 0, 'Correct: Rioja'),
  ('medium-druiven-red-wine', 'tempranillo', 3, 'Typisch aroma?', '["Leer", "Citrus", "Lychee", "Gras"]', 0, 'Correct: Leer'),
  ('medium-druiven-red-wine', 'tempranillo', 4, 'Tempranillo rijpt vaak op:', '["Eikenhout", "Staal", "Beton", "Glas"]', 0, 'Correct: Eikenhout'),
  ('medium-druiven-red-wine', 'tempranillo', 5, 'Rioja Reserva betekent:', '["Wettelijke rijping", "Geen rijping", "Zoete wijn", "Geen hout"]', 0, 'Correct: Wettelijke rijping'),
  ('medium-druiven-red-wine', 'barbera', 1, 'Barbera heeft vaak:', '["Hoge zuren", "Hoge tannines", "Lage alcohol", "Restsuiker"]', 0, 'Correct: Hoge zuren'),
  ('medium-druiven-red-wine', 'barbera', 2, 'Barbera komt vooral uit:', '["Piemonte", "Bordeaux", "Rioja", "Napa"]', 0, 'Correct: Piemonte'),
  ('medium-druiven-red-wine', 'barbera', 3, 'Barbera is vaak:', '["Direct drinkbaar", "Altijd zwaar", "Zoet", "Oxidatief"]', 0, 'Correct: Direct drinkbaar'),
  ('medium-druiven-red-wine', 'barbera', 4, 'Typisch aroma?', '["Pruim", "Teer", "Peper", "Citrus"]', 0, 'Correct: Pruim'),
  ('medium-druiven-red-wine', 'barbera', 5, 'Een rijpe, jammy rode wijn met zacht kersfruit ligt op tafel. Om te bepalen of dit Barbera of Grenache is, test je eerst:', '["De kleurdiepte", "Het zuurniveau", "Het alcoholpercentage alleen", "De flesvorm"]', 1, 'Correct: Het zuurniveau'),
  ('medium-druiven-red-wine', 'zinfandel', 1, 'Zinfandel is beroemd in:', '["Californië", "Bordeaux", "Mosel", "Douro"]', 0, 'Correct: Californië'),
  ('medium-druiven-red-wine', 'zinfandel', 2, 'Typische stijl?', '["Jammy", "Strak mineraal", "Zeer zuur", "Mousserend"]', 0, 'Correct: Jammy'),
  ('medium-druiven-red-wine', 'zinfandel', 3, 'Zinfandel is genetisch gelijk aan:', '["Primitivo", "Merlot", "Syrah", "Mourvèdre"]', 0, 'Correct: Primitivo'),
  ('medium-druiven-red-wine', 'zinfandel', 4, 'Typisch aroma?', '["Zwart fruit", "Citrus", "Groene appel", "Gras"]', 0, 'Correct: Zwart fruit'),
  ('medium-druiven-red-wine', 'zinfandel', 5, 'Zinfandel heeft vaak:', '["Hogere alcohol", "Lage alcohol", "Lage body", "Geen fruit"]', 0, 'Correct: Hogere alcohol'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 1, 'Cabernet Sauvignon heeft vaak:', '["Hoge tannines", "Lage tannines", "Zoetheid", "Lage structuur"]', 0, 'Correct: Hoge tannines'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 2, 'Typisch aroma?', '["Cassis", "Aardbei", "Banaan", "Lychee"]', 0, 'Correct: Cassis'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 3, 'Bekende regio?', '["Napa Valley", "Mosel", "Tokaj", "Chianti"]', 0, 'Correct: Napa Valley'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 4, 'Cabernet heeft vaak:', '["Groot bewaarpotentieel", "Geen rijping", "Lage alcohol", "Geen zuur"]', 0, 'Correct: Groot bewaarpotentieel'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 5, 'Wat verklaart de genetische afkomst van Cabernet Sauvignon het beste?', '["Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc", "Een kloon van Merlot", "Een kruising van Syrah en Grenache", "Een mutatie van Nebbiolo"]', 0, 'Correct: Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc'),
  ('krachtige-druiven-red-wine', 'syrah', 1, 'Syrah staat bekend om:', '["Peper", "Citrus", "Honing", "Zout"]', 0, 'Correct: Peper'),
  ('krachtige-druiven-red-wine', 'syrah', 2, 'Australische naam?', '["Shiraz", "Grenache", "Merlot", "Zinfandel"]', 0, 'Correct: Shiraz'),
  ('krachtige-druiven-red-wine', 'syrah', 3, 'Koel klimaat geeft meer:', '["Peper", "Jam", "Suiker", "Hout"]', 0, 'Correct: Peper'),
  ('krachtige-druiven-red-wine', 'syrah', 4, 'Belangrijke regio?', '["Rhône", "Rioja", "Mosel", "Douro"]', 0, 'Correct: Rhône'),
  ('krachtige-druiven-red-wine', 'syrah', 5, 'Wat verklaart de zwarte-pepertoon in Syrah het beste?', '["Rotundone, een sesquiterpeen dat toeneemt bij minder zonlicht op de druif", "Uitsluitend langdurige houtlagering", "Een hoog suikergehalte bij de oogst", "Co-fermentatie met Viognier"]', 0, 'Correct: Rotundone, een sesquiterpeen dat toeneemt bij minder zonlicht op de druif'),
  ('krachtige-druiven-red-wine', 'malbec', 1, 'Malbec is beroemd in:', '["Argentinië", "Duitsland", "Portugal", "Oostenrijk"]', 0, 'Correct: Argentinië'),
  ('krachtige-druiven-red-wine', 'malbec', 2, 'Belangrijkste regio?', '["Mendoza", "Douro", "Mosel", "Bordeaux"]', 0, 'Correct: Mendoza'),
  ('krachtige-druiven-red-wine', 'malbec', 3, 'Malbec is vaak:', '["Donker en vol", "Licht en fris", "Zoet", "Mousserend"]', 0, 'Correct: Donker en vol'),
  ('krachtige-druiven-red-wine', 'malbec', 4, 'Typisch aroma?', '["Chocolade", "Citrus", "Banaan", "Appel"]', 0, 'Correct: Chocolade'),
  ('krachtige-druiven-red-wine', 'malbec', 5, 'Welke druif is de genetische halfbroer van Malbec via de moederdruif Magdeleine Noire des Charentes?', '["Merlot", "Syrah", "Nebbiolo", "Mourvèdre"]', 0, 'Correct: Merlot'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 1, 'Nebbiolo heeft:', '["Zeer hoge tannines", "Lage tannines", "Geen zuren", "Veel suiker"]', 0, 'Correct: Zeer hoge tannines'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 2, 'Belangrijke regio?', '["Barolo", "Rioja", "Napa", "Mosel"]', 0, 'Correct: Barolo'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 3, 'Typisch aroma?', '["Rozen", "Mango", "Citrus", "Banaan"]', 0, 'Correct: Rozen'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 4, 'Nebbiolo heeft vaak:', '["Hoge zuren", "Lage zuren", "Geen structuur", "Lage alcohol"]', 0, 'Correct: Hoge zuren'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 5, 'Wat is het meest opvallende structurele kenmerk van Nebbiolo?', '["Bleke kleur gecombineerd met extreem hoge tannine", "Diepe kleur gecombineerd met lage tannine", "Zeer lage zuurgraad", "Volledige afwezigheid van tannine"]', 0, 'Correct: Bleke kleur gecombineerd met extreem hoge tannine'),
  ('krachtige-druiven-red-wine', 'mourvedre', 1, 'Mourvèdre is vaak:', '["Krachtig en kruidig", "Licht en fris", "Zoet", "Mousserend"]', 0, 'Correct: Krachtig en kruidig'),
  ('krachtige-druiven-red-wine', 'mourvedre', 2, 'Belangrijke regio?', '["Bandol", "Mosel", "Rioja", "Chianti"]', 0, 'Correct: Bandol'),
  ('krachtige-druiven-red-wine', 'mourvedre', 3, 'Mourvèdre wordt vaak gebruikt in:', '["GSM-blends", "Port", "Sherry", "Champagne"]', 0, 'Correct: GSM-blends'),
  ('krachtige-druiven-red-wine', 'mourvedre', 4, 'Typisch aroma?', '["Leer", "Citrus", "Gras", "Appel"]', 0, 'Correct: Leer'),
  ('krachtige-druiven-red-wine', 'mourvedre', 5, 'Waarom worden veel oude Mourvèdre-wijnstokken in Jumilla nooit geënt?', '["Omdat de zandige bodem van nature resistent is tegen druifluis", "Omdat enting het alcoholpercentage verlaagt", "Omdat enting verboden is door de EU", "Omdat geënte stokken minder kleur geven"]', 0, 'Correct: Omdat de zandige bodem van nature resistent is tegen druifluis'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 1, 'Wat gebeurt er als rode wijn te warm wordt geserveerd?', '["Meer frisheid", "Alcohol wordt dominanter", "Minder geur", "Meer zuur"]', 1, 'Correct: Alcohol wordt dominanter'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 2, 'Wat gebeurt er als rode wijn te koud wordt geserveerd?', '["Aroma's openen meer", "Tannines voelen harder aan", "Meer zoetheid", "Meer fruit"]', 1, 'Correct: Tannines voelen harder aan'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 3, 'Lichte rode wijn serveer je meestal op:', '["8–10 °C", "12–14 °C", "16–18 °C", "20–22 °C"]', 1, 'Correct: 12–14 °C'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 4, 'Krachtige rode wijn serveer je meestal op:', '["8–10 °C", "12–14 °C", "16–18 °C", "22–24 °C"]', 2, 'Correct: 16–18 °C'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 5, 'Waarom voelt tannine harder aan wanneer een rode wijn te koud geserveerd wordt?', '["Koude vertraagt de binding tussen tannine en speekseleiwitten", "Koude verhoogt het alcoholpercentage", "Koude verwijdert zuur uit de wijn", "Koude verhoogt de suikerconcentratie"]', 0, 'Correct: Koude vertraagt de binding tussen tannine en speekseleiwitten'),
  ('service-red-wine', 'glaswerk-rode-wijn', 1, 'Wat doet een groter glas meestal?', '["Minder aroma", "Meer zuurstof en opening", "Meer alcohol", "Minder tannine"]', 1, 'Correct: Meer zuurstof en opening'),
  ('service-red-wine', 'glaswerk-rode-wijn', 2, 'Pinot Noir wordt vaak geserveerd in:', '["Smal glas", "Breed bol glas", "Flute", "Klein proefglas"]', 1, 'Correct: Breed bol glas'),
  ('service-red-wine', 'glaswerk-rode-wijn', 3, 'Waarom is glasvorm belangrijk?', '["Voor de kleur", "Voor geur en smaakontwikkeling", "Voor alcoholpercentage", "Voor bewaarpotentieel"]', 1, 'Correct: Voor geur en smaakontwikkeling'),
  ('service-red-wine', 'glaswerk-rode-wijn', 4, 'Nebbiolo profiteert vaak van:', '["Klein glas", "Groot open glas", "Champagneglas", "Shotglas"]', 1, 'Correct: Groot open glas'),
  ('service-red-wine', 'glaswerk-rode-wijn', 5, 'Waarom past een breed Bourgondië-glas beter bij Nebbiolo dan een smal glas?', '["Het grotere oppervlak trechtert subtiele secundaire aroma's beter naar de neus", "Het verhoogt het alcoholpercentage van de wijn", "Het verlaagt de temperatuur sneller", "Het is uitsluitend bedoeld voor mousserende wijn"]', 0, 'Correct: Het grotere oppervlak trechtert subtiele secundaire aroma''s beter naar de neus'),
  ('service-red-wine', 'decanteren', 1, 'Waarom decanteer je jonge rode wijn?', '["Voor suiker", "Voor zuurstof", "Voor koeling", "Voor kleur"]', 1, 'Correct: Voor zuurstof'),
  ('service-red-wine', 'decanteren', 2, 'Waarom decanteer je oude wijn?', '["Voor alcohol", "Voor bezinksel", "Voor tannines", "Voor bubbels"]', 1, 'Correct: Voor bezinksel'),
  ('service-red-wine', 'decanteren', 3, 'Welke wijn profiteert vaak van decanteren?', '["Cabernet Sauvignon", "Gamay", "Rosé", "Moscato"]', 0, 'Correct: Cabernet Sauvignon'),
  ('service-red-wine', 'decanteren', 4, 'Te lang decanteren kan:', '["Wijn openen", "Kwetsbare wijn beschadigen", "Suiker verhogen", "Alcohol verlagen"]', 1, 'Correct: Kwetsbare wijn beschadigen'),
  ('service-red-wine', 'decanteren', 5, 'Wat is het belangrijkste verschil tussen decanteren voor sedimentscheiding en decanteren voor beluchting?', '["Sedimentscheiding vraagt langzaam schenken bij licht, beluchting vraagt zuurstofcontact voor tanninepolymerisatie", "Beide technieken dienen exact hetzelfde doel", "Sedimentscheiding is alleen nodig bij witte wijn", "Beluchting verwijdert altijd bezinksel"]', 0, 'Correct: Sedimentscheiding vraagt langzaam schenken bij licht, beluchting vraagt zuurstofcontact voor tanninepolymerisatie'),
  ('service-red-wine', 'bewaren-en-kelderen', 1, 'Ideale bewaartemperatuur?', '["4 °C", "8 °C", "12–14 °C", "20 °C"]', 2, 'Correct: 12–14 °C'),
  ('service-red-wine', 'bewaren-en-kelderen', 2, 'Wat is slecht voor wijn?', '["Donkerte", "Stabiliteit", "Licht", "Liggend bewaren"]', 2, 'Correct: Licht'),
  ('service-red-wine', 'bewaren-en-kelderen', 3, 'Waarom flessen liggend?', '["Voor uitstraling", "Kurk vochtig houden", "Meer alcohol", "Minder zuur"]', 1, 'Correct: Kurk vochtig houden'),
  ('service-red-wine', 'bewaren-en-kelderen', 4, 'Wat is belangrijk?', '["Temperatuurschommelingen", "Constante temperatuur", "Hoge warmte", "Open lucht"]', 1, 'Correct: Constante temperatuur'),
  ('service-red-wine', 'bewaren-en-kelderen', 5, 'Wat verklaart de kleurevolutie van paars/violet naar granaat en baksteenrood bij het rijpen van rode wijn?', '["Antocyanen binden geleidelijk aan tannine tot grotere, minder felgekleurde pigmentpolymeren", "De alcohol verdampt langzaam uit de fles", "Contact met een schroefdop tijdens opslag", "Een geleidelijke daling van het suikergehalte"]', 0, 'Correct: Antocyanen binden geleidelijk aan tannine tot grotere, minder felgekleurde pigmentpolymeren'),
  ('pairing-red-wine', 'rode-wijn-vlees', 1, 'Waarom werkt rood goed met vlees?', '["Door suiker", "Door tannines en eiwit", "Door bubbels", "Door zuur"]', 1, 'Correct: Door tannines en eiwit'),
  ('pairing-red-wine', 'rode-wijn-vlees', 2, 'Wat verzacht tannines?', '["Zuur", "Eiwit", "Water", "Hout"]', 1, 'Correct: Eiwit'),
  ('pairing-red-wine', 'rode-wijn-vlees', 3, 'Welke pairing is klassiek?', '["Cabernet + biefstuk", "Riesling + biefstuk", "Port + sushi", "Moscato + wild"]', 0, 'Correct: Cabernet + biefstuk'),
  ('pairing-red-wine', 'rode-wijn-vlees', 4, 'Vetter vlees vraagt:', '["Minder structuur", "Meer structuur", "Minder alcohol", "Minder aroma"]', 1, 'Correct: Meer structuur'),
  ('pairing-red-wine', 'rode-wijn-vlees', 5, 'Waarom kan umami uit gerijpt vlees juist averechts werken bij zeer tanninerijke, sterk gehoute rode wijn?', '["Umami kan de perceptie van bitterheid en een metaalachtige bijsmaak versterken zonder voldoende fruitconcentratie", "Umami verwijdert alle tannine uit de wijn", "Umami verhoogt het suikergehalte van het gerecht", "Umami heeft nooit effect op wijnperceptie"]', 0, 'Correct: Umami kan de perceptie van bitterheid en een metaalachtige bijsmaak versterken zonder voldoende fruitconcentratie'),
  ('pairing-red-wine', 'rode-wijn-kaas', 1, 'Wat doet vet in kaas?', '["Verhardt tannines", "Verzacht tannines", "Verhoogt zuur", "Verhoogt alcohol"]', 1, 'Correct: Verzacht tannines'),
  ('pairing-red-wine', 'rode-wijn-kaas', 2, 'Welke wijn past goed bij Brie?', '["Pinot Noir", "Cabernet Sauvignon", "Malbec", "Syrah"]', 0, 'Correct: Pinot Noir'),
  ('pairing-red-wine', 'rode-wijn-kaas', 3, 'Blauwschimmel werkt vaak beter met:', '["Droge rode wijn", "Port", "Rosé", "Mousserend"]', 1, 'Correct: Port'),
  ('pairing-red-wine', 'rode-wijn-kaas', 4, 'Te veel zout met hoge tannines kan:', '["Bitter maken", "Zoeter maken", "Zachter maken", "Frisser maken"]', 0, 'Correct: Bitter maken'),
  ('pairing-red-wine', 'rode-wijn-kaas', 5, 'Waarom is de combinatie rode wijn en kaas fragieler dan vaak wordt aangenomen?', '["Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees", "Kaas bevat altijd meer tannine dan vlees", "Kaas heeft nooit vet", "Rode wijn bevat geen eiwit"]', 0, 'Correct: Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees'),
  ('pairing-red-wine', 'rode-wijn-wild', 1, 'Wild vraagt meestal:', '["Lichte wijn", "Complexe wijn", "Zoete wijn", "Mousserende wijn"]', 1, 'Correct: Complexe wijn'),
  ('pairing-red-wine', 'rode-wijn-wild', 2, 'Welke pairing is klassiek?', '["Hert + Nebbiolo", "Hert + Riesling", "Haas + Moscato", "Wild + Rosé"]', 0, 'Correct: Hert + Nebbiolo'),
  ('pairing-red-wine', 'rode-wijn-wild', 3, 'Wat speelt grote rol?', '["Glas", "Saus", "Kurk", "Flesvorm"]', 1, 'Correct: Saus'),
  ('pairing-red-wine', 'rode-wijn-wild', 4, 'Aardse sauzen vragen vaak:', '["Jong fruit", "Tertiaire aroma's", "Lage zuren", "Zoetheid"]', 1, 'Correct: Tertiaire aroma''s'),
  ('pairing-red-wine', 'rode-wijn-wild', 5, 'Waarom werkt het tannine-vet-mechanisme minder sterk bij wild dan bij gefokt rood vlees?', '["Wild heeft minder intramusculair vet, waardoor pairing meer op aromatische resonantie leunt", "Wild bevat geen eiwit", "Wild bevat altijd meer tannine dan gefokt vlees", "Wild wordt nooit met rode wijn gecombineerd"]', 0, 'Correct: Wild heeft minder intramusculair vet, waardoor pairing meer op aromatische resonantie leunt'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 1, 'Welke druif heeft meestal hogere tannines?', '["Pinot Noir", "Nebbiolo", "Gamay", "Grenache"]', 1, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 2, 'Welke druif ruikt vaker naar rozen?', '["Nebbiolo", "Pinot Noir", "Merlot", "Syrah"]', 0, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 3, 'Welke voelt vaak zachter?', '["Pinot Noir", "Nebbiolo", "Cabernet", "Mourvèdre"]', 0, 'Correct: Pinot Noir'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 4, 'Welke heeft vaak teer?', '["Nebbiolo", "Pinot Noir", "Gamay", "Barbera"]', 0, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 5, 'Welke wordt vaak onderschat door kleur?', '["Nebbiolo", "Syrah", "Malbec", "Cabernet"]', 0, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'merlot-vs-cabernet', 1, 'Welke is vaak ronder?', '["Merlot", "Cabernet Sauvignon", "Nebbiolo", "Syrah"]', 0, 'Correct: Merlot'),
  ('examen-red-wine', 'merlot-vs-cabernet', 2, 'Welke heeft vaker cassis?', '["Cabernet Sauvignon", "Merlot", "Pinot Noir", "Gamay"]', 0, 'Correct: Cabernet Sauvignon'),
  ('examen-red-wine', 'merlot-vs-cabernet', 3, 'Welke heeft stevigere tannines?', '["Cabernet Sauvignon", "Merlot", "Barbera", "Grenache"]', 0, 'Correct: Cabernet Sauvignon'),
  ('examen-red-wine', 'merlot-vs-cabernet', 4, 'Welke voelt zachter?', '["Merlot", "Cabernet Sauvignon", "Syrah", "Nebbiolo"]', 0, 'Correct: Merlot'),
  ('examen-red-wine', 'merlot-vs-cabernet', 5, 'Welke vormt vaak de backbone in Bordeaux?', '["Cabernet Sauvignon", "Merlot", "Pinot Noir", "Zinfandel"]', 0, 'Correct: Cabernet Sauvignon'),
  ('examen-red-wine', 'red-wine-final-exam', 1, 'Wat is het belangrijkste doel van schilcontact bij rode wijnproductie?', '["Extractie van kleur en tannine uit de schil", "Suiker verhogen", "Zuur verlagen", "Alcohol verwijderen"]', 0, 'Correct: Extractie van kleur en tannine uit de schil'),
  ('examen-red-wine', 'red-wine-final-exam', 2, 'Wat gebeurt er tijdens alcoholische gisting?', '["Suiker wordt omgezet in alcohol en CO₂", "Tannine wordt afgebroken", "Appelzuur wordt omgezet in melkzuur", "Kleurstof wordt verwijderd"]', 0, 'Correct: Suiker wordt omgezet in alcohol en CO₂'),
  ('examen-red-wine', 'red-wine-final-exam', 3, 'Welke techniek is klassiek voor Gamay in Beaujolais?', '["Koolzuurmaceratie", "Fortificatie", "Solera-blending", "Botrytisconcentratie"]', 0, 'Correct: Koolzuurmaceratie'),
  ('examen-red-wine', 'red-wine-final-exam', 4, 'Welke druif staat bekend om hoge zuren en lage tot medium tannines, gekoppeld aan sterke terroirgevoeligheid?', '["Pinot Noir", "Cabernet Sauvignon", "Mourvèdre", "Malbec"]', 0, 'Correct: Pinot Noir'),
  ('examen-red-wine', 'red-wine-final-exam', 5, 'Met welke regio wordt Sangiovese het sterkst geassocieerd?', '["Chianti (Toscane)", "Rioja", "Barossa Valley", "Mendoza"]', 0, 'Correct: Chianti (Toscane)'),
  ('examen-red-wine', 'red-wine-final-exam', 6, 'Wat verklaart de genetische afkomst van Cabernet Sauvignon?', '["Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc", "Een kloon van Nebbiolo", "Een kruising van Merlot en Malbec", "Een mutatie van Grenache"]', 0, 'Correct: Een natuurlijke kruising van Cabernet Franc en Sauvignon Blanc'),
  ('examen-red-wine', 'red-wine-final-exam', 7, 'Welke stof veroorzaakt de zwarte-pepertoon in Syrah?', '["Rotundone", "Diacetyl", "Linalool", "TDN"]', 0, 'Correct: Rotundone'),
  ('examen-red-wine', 'red-wine-final-exam', 8, 'Waar werd Malbec beroemd nadat de druif bijna uit Frankrijk verdween?', '["Mendoza, Argentinië", "Rioja, Spanje", "Barossa Valley, Australië", "Douro, Portugal"]', 0, 'Correct: Mendoza, Argentinië'),
  ('examen-red-wine', 'red-wine-final-exam', 9, 'Wat is het meest opvallende structurele kenmerk van Nebbiolo?', '["Bleke kleur gecombineerd met extreem hoge tannine", "Diepe kleur gecombineerd met lage tannine", "Zeer lage zuurgraad", "Volledige afwezigheid van tannine"]', 0, 'Correct: Bleke kleur gecombineerd met extreem hoge tannine'),
  ('examen-red-wine', 'red-wine-final-exam', 10, 'Welke druif vormt traditioneel de ruggengraat van GSM-blends?', '["Mourvèdre", "Pinot Noir", "Sangiovese", "Tempranillo"]', 0, 'Correct: Mourvèdre'),
  ('examen-red-wine', 'red-wine-final-exam', 11, 'Op welke temperatuur serveer je een krachtige, hooggetanninerijke rode wijn meestal?', '["8–10 °C", "12–14 °C", "16–18 °C", "22–24 °C"]', 2, 'Correct: 16–18 °C'),
  ('examen-red-wine', 'red-wine-final-exam', 12, 'Waarom past een breed Bourgondië-glas beter bij Nebbiolo dan een smal glas?', '["Het grotere oppervlak trechtert subtiele secundaire aroma's beter naar de neus", "Het verhoogt het alcoholpercentage", "Het verlaagt de temperatuur sneller", "Het is uitsluitend bedoeld voor mousserende wijn"]', 0, 'Correct: Het grotere oppervlak trechtert subtiele secundaire aroma''s beter naar de neus'),
  ('examen-red-wine', 'red-wine-final-exam', 13, 'Waarom decanteer je een jonge, tanninerijke rode wijn?', '["Om tannine te laten polymeriseren en de perceptie van astringentie te verzachten", "Om het suikergehalte te verlagen", "Om kleur toe te voegen", "Om het alcoholpercentage te verhogen"]', 0, 'Correct: Om tannine te laten polymeriseren en de perceptie van astringentie te verzachten'),
  ('examen-red-wine', 'red-wine-final-exam', 14, 'Wat verklaart de kleurevolutie van paars naar baksteenrood bij het rijpen van rode wijn?', '["Antocyanen binden geleidelijk aan tannine tot grotere, minder felgekleurde pigmentpolymeren", "De alcohol verdampt langzaam", "Contact met een schroefdop", "Een daling van het suikergehalte"]', 0, 'Correct: Antocyanen binden geleidelijk aan tannine tot grotere, minder felgekleurde pigmentpolymeren'),
  ('examen-red-wine', 'red-wine-final-exam', 15, 'Waarom voelt een rode wijn met tannine vaak zachter aan bij vet, eiwitrijk vlees?', '["Tannine bindt bij voorkeur aan eiwit en vet in het vlees in plaats van aan speekseleiwitten", "Vlees verwijdert alle tannine uit de wijn", "Vlees verhoogt het suikergehalte van de wijn", "Vlees heeft geen effect op tannineperceptie"]', 0, 'Correct: Tannine bindt bij voorkeur aan eiwit en vet in het vlees in plaats van aan speekseleiwitten'),
  ('examen-red-wine', 'red-wine-final-exam', 16, 'Waarom is de combinatie rode wijn en kaas fragieler dan vaak wordt aangenomen?', '["Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees", "Kaas bevat altijd meer tannine dan vlees", "Kaas heeft nooit vet", "Rode wijn bevat geen eiwit"]', 0, 'Correct: Caseïne en vet in kaas binden tannine vaak nog agressiever dan eiwitten in vlees'),
  ('examen-red-wine', 'red-wine-final-exam', 17, 'Waarom leunt pairing bij wild sterker op een aromatische brug dan op tannine-vetbuffering?', '["Wild heeft minder intramusculair vet dan gefokt vlees", "Wild bevat geen eiwit", "Wild wordt nooit met rode wijn gecombineerd", "Wild bevat altijd meer tannine dan rundvlees"]', 0, 'Correct: Wild heeft minder intramusculair vet dan gefokt vlees'),
  ('examen-red-wine', 'red-wine-final-exam', 18, 'Wat is bij Pinot Noir versus Nebbiolo het meest betrouwbare onderscheidende signaal?', '["Kleurintensiteit", "Tanninegrip op de mond", "Het gebruikte glas", "De flesvorm"]', 1, 'Correct: Tanninegrip op de mond'),
  ('examen-red-wine', 'red-wine-final-exam', 19, 'Wat verklaart het rijpingsverschil tussen Merlot en Cabernet Sauvignon het beste?', '["Een dunnere schil en grotere bessen bij Merlot zorgen voor vroegere, betrouwbaardere rijping", "Merlot heeft altijd meer suiker nodig", "Cabernet Sauvignon heeft geen schil", "Merlot wordt nooit gehout gelagerd"]', 0, 'Correct: Een dunnere schil en grotere bessen bij Merlot zorgen voor vroegere, betrouwbaardere rijping'),
  ('examen-red-wine', 'red-wine-final-exam', 20, 'Wat is de kern van systematisch blindproeven bij rode wijn?', '["Een vaste keten van kleur, neus, mond en structuur, met een hypothese vóór de conclusie", "Direct naar het etiket kijken vóór het proeven", "Alleen op kleur vertrouwen", "Alleen op de regio van herkomst gokken"]', 0, 'Correct: Een vaste keten van kleur, neus, mond en structuur, met een hypothese vóór de conclusie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
