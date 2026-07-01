-- Biodynamisch Proeven track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 45 lessons · quizvragen per les

delete from academy.tracks where slug = 'biodynamic';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'biodynamic',
  'Biodynamisch Proeven',
  'Leer biodynamische kalender, dagtypes, weer en timing — van Fundament tot Master-examen.',
  10,
  now()
);

with t as (select id from academy.tracks where slug = 'biodynamic')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-biodynamic', 'Fundament', 1),
  ('explorer', 'kalender-biodynamic', 'De kalender begrijpen', 2),
  ('explorer', 'proeven-biodynamic', 'Proeven per dagtype', 3),
  ('specialist', 'weer-biodynamic', 'Weer & atmosfeer', 4),
  ('specialist', 'stijlen-biodynamic', 'Wijnstijlen & dagtypes', 5),
  ('specialist', 'cross-biodynamic', 'Bier, cocktails & 0.0', 6),
  ('master', 'voorraad-biodynamic', 'Voorraad & drinkstrategie', 7),
  ('master', 'intelligence-biodynamic', 'Persoonlijke tasting intelligence', 8),
  ('master', 'examen-biodynamic', 'Praktijkexamen', 9)
) as v(level, slug, title, sort_order);

-- intro-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'intro-biodynamic'
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
    'wat-is-biodynamisch-proeven',
    'Wat is biodynamisch proeven?',
    'Na deze les kun je biodynamisch proeven helder definiëren en plaatsen naast klassieke proefmethodes.
',
    'Biodynamisch proeven vertrekt niet vanuit een claim dat natuurkrachten smaak lineair sturen, maar vanuit het idee dat context de waarneming mee kleurt. Veel proevers ervaren dat dezelfde wijn op verschillende dagen anders overkomt in structuur, geurprojectie en lengte. In professionele settings is die observatie waardevol zolang je haar systematisch noteert en naast klassieke indicatoren legt.

In de praktijk werkt dit als hypothese: je verwacht op basis van dagtype een bepaalde nadruk en test die tegen wat je echt proeft. Daardoor vermijd je zowel blind geloof als blind cynisme. Je team bouwt stap voor stap een lokale dataset op waarin glaswerk, temperatuur en openingsduur mee geregistreerd worden.

Het doel is beslisondersteuning niet dogma. Biodynamische taal helpt je betere vragen stellen: moet deze fles nu open, later op de avond, of morgen? Die verschuiving van gelijk willen hebben naar beter beslissen maakt het direct bruikbaar voor sommeliers en kelderteams.


## Drinkmoment & advies

### Beste moment

Plan deze les als openingsbriefing voor een nieuwe proefweek, liefst voor de eerste service.

### Waarom dit werkt

Je zet direct een gedeeld vocabulaire neer en voorkomt dat teamleden door elkaar praten over context en kwaliteit.

### Wanneer wachten slimmer is

Wacht als het team geen tijd heeft voor notitieprotocol; zonder discipline verlies je de meerwaarde van het kader.

## Pro insight

Een sterk biodynamisch gesprek start met grenzen benoemen: dit is een extra beslislaag, geen waarheidssysteem. Die transparantie vergroot gastvertrouwen.',
    '- biodynamisch proeven
- proefcontext
- dagtype
- besliskader
- servicevenster
',
    'Bij oudere Bourgogne of Vintage Port kiezen ervaren sommeliers vaak bewust een Vruchtdag.
Aromatische openheid en balans komen dan doorgaans duidelijker naar voren.
',
    '- Biodynamisch proeven is een contextkader naast klassieke analyse.
- Daginvloed wordt professioneel getest, niet blind aangenomen.
- Notitiekwaliteit bepaalt of inzichten bruikbaar worden.
- Doel: betere timing en betere servicebeslissingen.
',
    '### Opdracht

Kies een fles uit je huidige voorraad die binnen twee jaar op dronk is. Noteer fruitintensiteit, aromatische openheid, zuurgraad, structuur en lengte. Herhaal dit op een ander dagtype.

### Checklist

- Ik formuleerde een hypothese over het dagtype-effect
- Ik noteerde dezelfde serveercondities bij beide momenten
- Ik vergeleek observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde het resultaat aan een openings- of adviesbesluit


### Reflectievraag

Welke beslissing nam je vorige week op gevoel, en hoe had een expliciet dagtypekader die keuze kunnen verbeteren?
',
    8,
    1
  ),
  (
    'maria-thun-oorsprong',
    'Maria Thun en de oorsprong',
    'Na deze les kun je de rol van Maria Thun uitleggen en vertalen naar bruikbare proefdiscipline.
',
    'Maria Thun maakte de zaaikalender praktisch bruikbaar door ritmes te vertalen naar werkbare dagindelingen. Veel proevers ervaren haar model als een nuttig startpunt omdat het discipline brengt in planning en observatie, ook wanneer men verschilt in overtuiging over de oorzaken achter het effect.

Voor een proefteam is dit vooral interessant als hypothese: je voorspelt een accent per dag en controleert die voorspelling in identieke omstandigheden. Door dezelfde fles op meerdere momenten te testen, zie je sneller of verschillen uit dagtype komen of uit servicevariabelen zoals temperatuur en zuurstof.

Professioneel blijft het beslisondersteuning niet dogma. De kalender is een kader dat je helpt prioriteren, niet een vervanging van vakkennis. Juist die combinatie - klassieke oenologie plus ritmische planning - levert vaak de grootste kwaliteitswinst op.


## Drinkmoment & advies

### Beste moment

Gebruik deze les op een rustige prep-middag met tijd voor logboekinrichting.

### Waarom dit werkt

De inhoud wordt sterker als je theorie meteen vertaalt naar jullie eigen operationele ritme.

### Wanneer wachten slimmer is

Wacht op piekdagen zonder focus, want losse kennis zonder toepassing verdwijnt snel uit de service.

## Pro insight

Laat nieuwe sommeliers eerst logdiscipline leren. Zonder consistente notities worden kalenderclaims snel ruis in plaats van waarde.',
    '- Maria Thun
- zaaikalender
- maanknoop
- ritmisch venster
- herhaalbaarheid
',
    'Veel biodynamische domeinen plannen blends en bottelingen op Vruchtdagen, omdat wijnen dan vaak het meest open en expressief geanalyseerd kunnen worden.
',
    '- Maria Thun geeft ritme aan planning en observatie.
- Kalendergebruik start met discipline, niet met overtuiging.
- Herhaalbare tests maken teamkennis robuust.
- Operationele vertaling is belangrijker dan theorie alleen.
',
    '### Opdracht

Maak een mini-logboek voor drie opeenvolgende proefdagen. Noteer per dagtype dezelfde wijn op exact dezelfde serveertemperatuur en in hetzelfde glas. Schrijf vooraf een hypothese en toets die na het proeven.

### Checklist

- Ik noteerde dagtype, tijdstip en basisweer
- Ik hield glas en temperatuur constant
- Ik schreef vooraf een verwachtingszin
- Ik evalueerde achteraf wat klopte en wat niet


### Reflectievraag

Waar in je huidige workflow ontbreekt ritme: bij openen, adviseren of evalueren, en wat verander je morgen concreet?
',
    8,
    2
  ),
  (
    'vier-dagtypen',
    'De vier dagtypen',
    'Na deze les kun je de vier dagtypen onderscheiden en koppelen aan concrete smaakverwachtingen.
',
    'De vier dagtypen bieden een hanteerbare taal om proefverschillen te ordenen: aarde, water, lucht en vuur krijgen elk een eigen stijlverwachting. Veel proevers ervaren daardoor minder ruis in notities, omdat ze gericht kijken naar structuur, sap, aromatiek of fruitexpressie in plaats van losse indrukken op te sommen.

Methodisch werkt dit als hypothese: je verwacht niet dat elk glas exact het leerboek volgt, maar je test of de dominante richting herkenbaar is. Zodra observaties afwijken, onderzoek je eerst praktische factoren zoals serving, flesconditie en vermoeidheid van het panel.

Daarmee blijft het beslisondersteuning niet dogma. Het dagtype is een lens, geen oordeel. De professional gebruikt die lens om sneller te beslissen over openmoment, tafelinzet en communicatietoon richting gast.


## Drinkmoment & advies

### Beste moment

Zet deze les in vlak voor een flight met verschillende stijlen om dagtypen tastbaar te maken.

### Waarom dit werkt

Directe vergelijking scherpt herkenning en versnelt beslissingen bij kaartadvies.

### Wanneer wachten slimmer is

Wacht wanneer je slechts een enkele referentiewijn hebt; dan is het onderscheid te dun voor betrouwbare conclusies.

## Pro insight

Gebruik dagtypen als pre-shift checklist. Wie vooraf hypothesen benoemt, maakt tijdens service minder impulsbeslissingen.',
    '- Worteldag
- Bladdag
- Bloemdag
- Vruchtdag
- smaakas
',
    'Bij blindproeverijen kan het dagtype soms verklaren waarom dezelfde wijn op verschillende momenten anders scoort.
',
    '- Vier dagtypen geven structuur aan proefverwachtingen.
- Elke verwachting wordt getoetst als hypothese.
- Afwijkingen zijn leermomenten, geen fouten.
- Dagtypen versnellen briefing en tafelkeuzes.
',
    '### Opdracht

Proef dezelfde wijn op een Worteldag en een Vruchtdag. Noteer fruit, tannine, lengte, balans en drinkbaarheid. Plan het experiment over 2–4 weken onder vergelijkbare omstandigheden.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Bij welke twee wijnen op je kaart verwacht je het grootste dagtypeverschil, en hoe ga je dat gecontroleerd testen?
',
    8,
    3
  ),
  (
    'elementen-biodynamiek',
    'Aarde, water, lucht en vuur',
    'Na deze les kun je de vier elementen gebruiken als operationele taal in proefbeslissingen.
',
    'Elementen werken in biodynamische context als geheugensteun voor proefaccenten. Veel proevers ervaren dat deze symbolische taal verrassend effectief is in teamcommunicatie: iedereen begrijpt sneller wat bedoeld wordt met aardse grip, waterige soepelheid, luchtige geurdruk of vurige fruitdrive.

Ook hier gebruik je het als hypothese. Je voorspelt een elementair profiel en checkt of het in je setting terugkomt. Waar dat niet gebeurt, leer je vaak minstens evenveel: afwijkingen tonen waar service, glas of temperatuur sterker doorwerkt dan het verwachte ritme.

Voor specialistische teams is het beslisondersteuning niet dogma. Elementtaal maakt briefing en debriefing korter en scherper, maar de finale keuze blijft gebaseerd op het glas in het moment.


## Drinkmoment & advies

### Beste moment

Plan deze les als teamkalibratie voorafgaand aan premium avonden.

### Waarom dit werkt

Elementtaal maakt communicatie compact en bruikbaar onder tijdsdruk in de zaal.

### Wanneer wachten slimmer is

Wacht als nieuwe teamleden nog basisproefstructuur missen; bouw eerst observatiehygiëne op.

## Pro insight

Elementtaal werkt uitstekend in teamcoaching omdat het snel blijft onder druk. Kort, concreet, direct toepasbaar.',
    '- aarde-element
- water-element
- lucht-element
- vuur-element
- elementlogica
',
    'Veel Champagnehuizen kiezen Bloemdagen om blends op finesse en precisie te beoordelen.
',
    '- Elementtaal maakt proefcommunicatie compact.
- Aarde, water, lucht en vuur sturen observatiefocus.
- Symboliek is nuttig zolang waarneming leidend blijft.
- Teams winnen snelheid zonder analytische diepte te verliezen.
',
    '### Opdracht

Kies vier dranken uit je assortiment en koppel elk aan het dominante element (aarde, water, lucht, vuur). Onderbouw per keuze met één sensorisch signaal en één service-implicatie.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Wanneer gebruik jij te brede proefwoorden, en welk elementair vocabulaire maakt je feedback preciezer naar het team?
',
    8,
    4
  ),
  (
    'waarom-gebruiken-professionals-dit',
    'Waarom gebruiken sommeliers en wijnmakers dit?',
    'Na deze les kun je onderbouwen waarom professionals biodynamische data inzetten als extra beslislaag.
',
    'Professionals gebruiken biodynamisch proeven zelden als ideologisch statement, maar als extra informatiekanaal. Veel proevers ervaren dat adviesgesprekken consistenter worden wanneer dagcontext expliciet wordt meegenomen, vooral bij topflessen waar timing grote impact heeft op gastbeleving.

In operationele termen blijft dit een hypothese-gedreven methode. Je vergelijkt verwachte dagdynamiek met werkelijke tafelresultaten en stuurt bij op basis van servicefeedback, retourpercentages en gastreacties. Zo koppel je zachte signalen aan harde KPI''s.

Daarom noemen we het beslisondersteuning niet dogma. Het vergroot je beslisruimte: niet alleen welke fles past, maar ook wanneer die fles het meeste rendement geeft in kwaliteit en vertrouwen.


## Drinkmoment & advies

### Beste moment

Gebruik deze les in een managementmoment met sommelier en floor lead samen.

### Waarom dit werkt

Je koppelt kwaliteitsambitie direct aan commerciële en operationele keuzes.

### Wanneer wachten slimmer is

Wacht wanneer alleen theorie besproken kan worden zonder echte servicecases; dan blijft het abstract.

## Pro insight

De grootste winst zit vaak niet in smaakverschil maar in timing: topflessen openen op het juiste venster verlaagt retourrisico.',
    '- sommelierworkflow
- kaartadvies
- kelderplanning
- biascontrole
- topflesbeleid
',
    'Bij topflessen kan de juiste dag soms meer impact hebben dan de perfecte serveertemperatuur.
',
    '- Professionals gebruiken biodynamiek als beslisintelligentie.
- De grootste winst zit vaak in timing van service.
- KPI-koppeling voorkomt vrijblijvend gebruik.
- Extra context verhoogt kwaliteit en gastvertrouwen.
',
    '### Opdracht

Kies één topfles uit je voorraad en plan met de biodynamische kalender: openingsdag, serveertemperatuur, pairing en decanteertijd.

### Checklist

- Ik noteerde het gekozen dagtype en tijdsblok
- Ik koppelde openingsdag aan serveertemperatuur en decanteertijd
- Ik legde pairing en gastcontext vast
- Ik formuleerde een concreet topflesmoment voor het team


### Reflectievraag

Welke professionele KPI zou jij koppelen aan biodynamisch plannen: retouren, upsell, of gastwaardering, en waarom juist die?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- kalender-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'kalender-biodynamic'
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
    'worteldagen-uitgelegd',
    'Worteldagen uitgelegd',
    'Na deze les kun je Worteldagen herkennen en toepassen in service, glaskeuze en timing.
',
    'Worteldagen worden vaak geassocieerd met strakkere structuur, aardse precisie en duidelijkere zuren. Veel proevers ervaren dat vooral bij wijnen met stevige ruggengraat: tanninecontouren lijken scherper en de wijn vraagt vaker om gedoseerde beluchting of iets hogere serveertemperatuur.

Toch behandel je dit als hypothese en niet als gegarandeerd patroon. Wanneer een wijn onverwacht gesloten blijft, test je eerst praktische stappen: glas wisselen, temperatuurcorrectie, later opnieuw beoordelen. Die routine voorkomt overhaaste conclusies.

In service is het beslisondersteuning niet dogma. Op een Worteldag kies je mogelijk eerder voor klassiekere structuurwijnen per glas, terwijl je fragiele topflessen nog even in reserve houdt.


## Drinkmoment & advies

### Beste moment

Kies een avond met structuurgedreven rode wijnen per glas.

### Waarom dit werkt

Worteldag-analyse helpt bij nauwkeurig decanteren en voorkomt te vroege topfles-openingen.

### Wanneer wachten slimmer is

Wacht bij hittegolfservice met instabiele koelketen; temperatuurfouten maskeren de les.

## Pro insight

Op Worteldagen loont het om beluchting in kortere intervallen te testen; overdecanteren maakt structuurwijnen snel hard.',
    '- aardse precisie
- zuurstructuur
- tanninekader
- openingsvenster
- servicetoets
',
    'Veel professionals proeven jonge Nebbiolo bewust op Worteldagen om tanninestructuur en levensduur beter te analyseren.
',
    '- Worteldag legt nadruk op structuur en precisie.
- Beluchting en temperatuur vragen extra aandacht.
- Strakke wijnen kunnen technisch helder presteren.
- Topfleskeuze blijft afhankelijk van actuele conditie.
',
    '### Opdracht

Open een jonge Nebbiolo of Cabernet Sauvignon en noteer:
- tanninestructuur
- spanning
- mineraliteit
- fruitintensiteit
- bewaarpotentieel

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Noem een rode wijn die je op Worteldag wel zou openen en een die je juist zou uitstellen; welke signalen bepalen dat verschil?
',
    8,
    1
  ),
  (
    'bladdagen-uitgelegd',
    'Bladdagen uitgelegd',
    'Na deze les kun je Bladdagen interpreteren en je advies afstemmen op textuur en sapbeleving.
',
    'Bladdagen geven volgens veel professionals een zachtere, sappigere indruk met minder strakke contouren. Veel proevers ervaren dat zuren milder lijken en textuur prominenter wordt, wat zowel charmant als misleidend kan zijn bij wijnen die normaal op spanning geselecteerd worden.

Gebruik dat effect als hypothese. Je checkt of sappigheid echt uit de wijn komt of vooral uit context, door parallel te vergelijken met notities van andere dagtypen en door temperatuurstabiele flights te gebruiken. Zo voorkom je dat je te vroeg spreekt van kwaliteitsverschil.

De professionele conclusie blijft beslisondersteuning niet dogma. Op Bladdagen is advies vaak gastvriendelijk en toegankelijk, maar je bewaakt dat premiumkeuzes niet alleen op onmiddellijke soepelheid worden gemaakt.


## Drinkmoment & advies

### Beste moment

Plan deze les op een dag met veel gasten die toegankelijk advies vragen.

### Waarom dit werkt

Bladdag-logica ondersteunt soepele aanbevelingen zonder technische overbelasting.

### Wanneer wachten slimmer is

Wacht als de kaart tijdelijk extreem tanninerijk is; dan kan de waarneming scheef trekken.

## Pro insight

Bladdagen zijn ideaal om twijfelgasten over de streep te trekken, maar bewaak marges: toegankelijkheid mag niet tot onderadvies leiden.',
    '- sapindruk
- romige textuur
- zuurspanning
- waterinvloed
- adviesnuance
',
    'Een ervaren sommelier gebruikt Bladdagen soms bewust om te testen of een wijn balans houdt zonder fruitdominantie.
',
    '- Bladdag geeft vaak meer sap en soepelheid.
- Toegankelijkheid stijgt, maar selectie vraagt discipline.
- Textuur kan zuren tijdelijk minder scherp tonen.
- Advies blijft sterk met heldere contextcheck.
',
    '### Opdracht

Open een Sauvignon Blanc of frisse 0.0 wijn en analyseer:
- groenheid
- frisheid
- zuren
- balans
- aromatische spanning

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Wanneer maakt Bladdag een wijn aantrekkelijker voor tafelverkoop maar minder geschikt voor examenproeven?
',
    8,
    2
  ),
  (
    'bloemdagen-uitgelegd',
    'Bloemdagen uitgelegd',
    'Na deze les kun je Bloemdagen inzetten voor aromatische precisie en presentatiewaarde.
',
    'Bloemdagen staan bekend om verhoogde geurexpressie, finesse en florale precisie. Veel proevers ervaren dat aroma''s sneller uit het glas komen en dat subtiele lagen gemakkelijker benoembaar worden, wat ideaal is voor educatieve proeverijen en tafelpresentaties met hoge verwachtingsdruk.

Als hypothese betekent dit: je plant aromatisch kwetsbare flessen op zulke dagen en toetst of de meerwaarde echt merkbaar is in blind vergelijk. Wanneer het effect uitblijft, wijst dat vaak op teveel koeling of een ongeschikt glas in plaats van op een fout in het model.

Daarmee blijft het beslisondersteuning niet dogma. Je benut mogelijke aromavoorsprong, maar je houdt altijd ruimte om op basis van actuele flesconditie van plan te veranderen.


## Drinkmoment & advies

### Beste moment

Gebruik deze les voor aroma-gedreven flights en storytelling aan tafel.

### Waarom dit werkt

Bloemdag-focus versterkt geurpresentatie en verhoogt de beleving bij premium labels.

### Wanneer wachten slimmer is

Wacht bij drukke banquetingservice waar snelheid boven precisie gaat.

## Pro insight

Bloemdagen zijn uitstekende momenten voor glasupgrade-advies. Geurwinst is tastbaar en commercieel uitlegbaar.',
    '- geurintensiteit
- vluchtig aroma
- parfumlaag
- finessebehoud
- aromacaptatie
',
    'Champagneproevers gebruiken Bloemdagen vaak om blends en dosage nauwkeuriger te beoordelen.
',
    '- Bloemdag vergroot vaak aromatische leesbaarheid.
- Finessewijnen profiteren van dit servicevenster.
- Glaswerk en snelheid bepalen het echte effect.
- Aromavoordeel is bruikbaar maar niet gegarandeerd.
',
    '### Opdracht

Open een Riesling of mousserende wijn en analyseer:
- geurintensiteit
- finesse
- elegantie
- mousse
- lengte

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke aromatische stijl op je kaart verdient expliciet Bloemdag-inzet, en hoe communiceer je dat zonder absolute claims?
',
    8,
    3
  ),
  (
    'vruchtdagen-uitgelegd',
    'Vruchtdagen uitgelegd',
    'Na deze les kun je Vruchtdagen strategisch benutten voor expressie, verkoop en gastbeleving.
',
    'Vruchtdagen worden in de praktijk vaak ervaren als directer, rijper en commercieel toegankelijker. Veel proevers ervaren dat fruitdefinitie en mondvulling sneller overtuigen, waardoor gasten sneller tot aankoop of upgrade beslissen bij dezelfde wijnkaart.

Ook dit behandel je als hypothese. Je test niet alleen smaak, maar ook gedrag: hoeveel tafelgesprekken converteren, welke flessen draaien sneller, en of retouren dalen. Dat maakt biodynamische observatie relevant voor businessbeslissingen zonder dat je causaliteit overschat.

In de kern blijft het beslisondersteuning niet dogma. Vruchtdagen zijn kansdagen voor expressieve service, maar een topfles gaat alleen open als het volledige plaatje klopt: gast, moment en conditie.


## Drinkmoment & advies

### Beste moment

Zet deze les in op avonden met veel by-the-glass rotatie.

### Waarom dit werkt

Vruchtdag-benadering ondersteunt snelle aankoopbeslissingen en hogere tevredenheid.

### Wanneer wachten slimmer is

Wacht als het team onvoldoende herproeft tijdens de shift; dan wordt advies te statisch.

## Pro insight

Vruchtdagen kunnen verkoop versnellen; monitor wel bias: snelle ja''s betekenen niet automatisch betere langetermijnkeuze voor de gast.',
    '- rijpingsbeleving
- mondvulling
- lengteperceptie
- vuurdynamiek
- scenario-evaluatie
',
    'Veel verzamelaars openen grote flessen uitsluitend op Vruchtdagen om het risico op geslotenheid te minimaliseren.
',
    '- Vruchtdag voelt vaak direct en commercieel sterk.
- Fruitexpressie ondersteunt snelle gastbeslissingen.
- Monitor conversie met kwaliteitsbewaking tegelijk.
- Gebruik het venster zonder automatisme.
',
    '### Opdracht

Kies een wijn uit je voorraad die je hoog waardeert en open deze bewust op een Vruchtdag.

Noteer:
- fruit
- balans
- openheid
- lengte
- complexiteit

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Op welke manier kan Vruchtdag je verkoop helpen zonder dat je te vroeg naar de duurste fles stuurt?
',
    8,
    4
  ),
  (
    'hoe-lees-je-de-kalender',
    'Hoe lees je de biodynamische kalender?',
    'Na deze les kun je een biodynamische kalender lezen en vertalen naar een weekplanning.
',
    'Een biodynamische kalender lezen is meer dan een icoon herkennen; het is tijdmanagement voor smaakrisico. Veel proevers ervaren dat planning rust geeft: je voorkomt ad-hoc openingen en kunt flights bewuster opbouwen rond dagvensters en weersignalen.

Methodisch blijft de kalender een hypothese-instrument. Je plant verwachtingen, test uitkomsten en corrigeert achteraf in je logboek. Daardoor groeit een huisstijl in beslissen: minder improvisatie, meer reproduceerbare kwaliteit over teams en shifts heen.

Zo blijft het beslisondersteuning niet dogma. De kalender dicteert niet, maar prioriteert: welke fles nu, welke later, en welke beter bewaren voor een gunstiger venster.


## Drinkmoment & advies

### Beste moment

Plan dit vlak voor rooster- en kelderplanning van de komende week.

### Waarom dit werkt

Je vertaalt kalenderinformatie direct naar praktische keuzes per servicevenster.

### Wanneer wachten slimmer is

Wacht wanneer planning al vastligt zonder flexibiliteit; dan kun je inzichten niet implementeren.

## Pro insight

Een kalender is pas professioneel als hij gekoppeld is aan voorraadstatus, teambezetting en eventdrukte.',
    '- kalenderlezing
- tijdvenster
- weekplanning
- prioritering
- servicecapaciteit
',
    'Bij grote proeverijen kijken sommeliers niet alleen naar het dagtype, maar ook naar het exacte tijdsblok waarin de wijn geopend wordt.
',
    '- Kalender lezen is planning, geen bijgeloof.
- Dagvensters helpen prioriteren in opening en inzet.
- Weekrooster en kelderlog horen samen.
- Flexibiliteit maakt kalenderinformatie rendabel.
',
    '### Opdracht

Bekijk de kalender van vandaag en noteer actief dagtype, wisselmomenten, eventuele nodes en het stabielste tijdsblok. Koppel hier één fles uit je voorraad aan.

### Checklist

- Ik noteerde dagtype en wisselmomenten
- Ik identificeerde het stabielste tijdsblok
- Ik koppelde één concrete fles aan de kalendercontext
- Ik formuleerde een servicebesluit voor vandaag


### Reflectievraag

Waar in je weekplanning zit nu het grootste conflict tussen kalenderkans en personeelsrealiteit, en hoe los je dat op?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'proeven-biodynamic'
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
    'wijn-op-worteldag',
    'Wijn op een Worteldag',
    'Na deze les kun je een wijn op Worteldag analyseren met focus op structuur en lengte.
',
    'Wijn op Worteldag kan in veel settings strakker en lineairder tonen, met nadruk op kernstructuur. Veel proevers ervaren dat vooral zuren en tannine duidelijker gearticuleerd zijn, waardoor technische beoordeling soms gemakkelijker wordt dan op meer aromatische dagen.

Behandel die waarneming als hypothese. Laat dezelfde wijn gecontroleerd terugkomen op een ander dagtype en vergelijk alleen vaste parameters. Zo zie je of je conclusie werkelijk uit het ritme komt of uit servicefouten zoals te koude inschenking.

In professioneel gebruik blijft dit beslisondersteuning niet dogma. Worteldag is vaak geschikt voor structuurgerichte training en serieuze kelderselectie, maar niet automatisch voor elke tafel.


## Drinkmoment & advies

### Beste moment

Gebruik deze les in een technische proefsessie met rode referentiewijnen.

### Waarom dit werkt

Worteldagtraining scherpt analyse op zuur, tannine en lijn in de afdronk.

### Wanneer wachten slimmer is

Wacht als het panel vermoeid is; structurele nuances vragen frisse concentratie.

## Pro insight

Train op Worteldag met blind flights van vergelijkbare prijsniveaus; zo voorkom je labelbias in structuurbeoordeling.',
    '- structuuranalyse
- zuurcontour
- tannineprojectie
- lineaire lengte
- technische calibratie
',
    'Veel sommeliers gebruiken Worteldagen om te beoordelen of een jonge wijn voldoende ruggengraat heeft om verder te rijpen.
',
    '- Worteldag-proeven traint technische scherpte.
- Structuurwoorden worden preciezer met vaste routine.
- Vergelijkingen over dagen verhogen bewijskracht.
- Servicebeslissingen verbeteren met stricte notities.
',
    '### Opdracht

Open een jonge Bordeaux of Nebbiolo en noteer:
- tanninestructuur
- zuren
- mineraliteit
- fruitexpressie
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke drie observaties noteer jij verplicht voordat je op Worteldag concludeert dat een wijn ''strak'' is?
',
    8,
    1
  ),
  (
    'wijn-op-bladdag',
    'Wijn op een Bladdag',
    'Na deze les kun je een wijn op Bladdag beoordelen op sap, spanning en balans.
',
    'Op Bladdag lijkt wijn voor veel panelleden ronder en direct drinkbaar, met nadruk op sap in plaats van ruggengraat. Veel proevers ervaren daardoor een vriendelijkere eerste indruk, vooral bij witte wijn en lichte rode stijlen.

Als hypothese test je dit met identieke schenkroutine en strakke temperatuurcontrole. Wanneer een wijn te vlak wordt ervaren, kan dat een signaal zijn om glaswerk of serveermoment aan te passen in plaats van de wijn af te schrijven.

De professionele lijn blijft beslisondersteuning niet dogma. Bladdag helpt bij gastgerichte toegankelijkheid, maar je bewaakt dat selectie en prijspositionering analytisch verantwoord blijven.


## Drinkmoment & advies

### Beste moment

Plan deze les voor lunchservicevoorbereiding met lichte tot medium stijlen.

### Waarom dit werkt

Bladdag-evaluatie helpt om gastvriendelijke keuzes te maken zonder kwaliteit te verliezen.

### Wanneer wachten slimmer is

Wacht bij groot temperatuurverloop in de ruimte; textuurindruk wordt dan onbetrouwbaar.

## Pro insight

Op Bladdag wordt overschenken een risico: zachtere indruk kan teamleden verleiden tot te royale service.',
    '- sapbeleving
- ronding
- toegankelijkheid
- temperatuurbewaking
- textuurweging
',
    'Een wijn die op een Bladdag in balans blijft, heeft vaak een sterke intrinsieke kwaliteit.
',
    '- Bladdag legt nadruk op sap en ronding.
- Gastvriendelijkheid kan stijgen zonder kwaliteitsverlies.
- Temperatuurstabiliteit blijft cruciaal voor betrouwbare lezing.
- Toegankelijkheid mag geen onderadvies veroorzaken.
',
    '### Opdracht

Open een Sauvignon Blanc of alcoholvrije witte wijn en noteer:
- vegetale tonen
- frisheid
- spanning
- balans
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Wanneer kan Bladdag-jeugdige charme je misleiden over bewaarpotentieel van een wijn?
',
    8,
    2
  ),
  (
    'wijn-op-bloemdag',
    'Wijn op een Bloemdag',
    'Na deze les kun je een wijn op Bloemdag proeven met nadruk op aroma en finesse.
',
    'Bloemdag-proeven draait om aromatische leesbaarheid: neuslagen openen vaak sneller en preciezer. Veel proevers ervaren dat florale en kruidige tonen beter te scheiden zijn, wat nuttig is in opleiding en in high-touch service.

Ook dit gebruik je als hypothese. Je controleert of aromavoordeel standhoudt over meerdere glazen en of panelleden consistent dezelfde descriptors gebruiken. Die discipline voorkomt dat suggestie wordt verward met waarneming.

Daarmee blijft het beslisondersteuning niet dogma. Bloemdagen zijn ideale etalagemomenten voor finessewijnen, maar finale keuzes blijven afhankelijk van actuele flesprestatie.


## Drinkmoment & advies

### Beste moment

Zet deze les in voorafgaand aan een fine-dining service met aromatische focus.

### Waarom dit werkt

Bloemdag geeft vaak meer detail in de neus, ideaal voor verfijnde tafeluitleg.

### Wanneer wachten slimmer is

Wacht wanneer glasvoorraad suboptimaal is; aromawinst valt weg bij verkeerd glas.

## Pro insight

Gebruik Bloemdag voor topflespresentaties met hoge verwachtingswaarde; geurexpressie ondersteunt premium storytelling.',
    '- aromadifferentiatie
- descriptorprecisie
- finessepresentatie
- neusarchitectuur
- blindcontrole
',
    'Bij het beoordelen van finesse en geurontwikkeling kiezen professionals vaak liever een Bloemdag dan een Vruchtdag.
',
    '- Bloemdag helpt bij aromatische differentiatie.
- Descriptoren worden bruikbaarder in teamtraining.
- Suggestiegevaar vraagt blind en dubbelcheck.
- Finessepresentatie krijgt extra impact aan tafel.
',
    '### Opdracht

Open een Riesling, Champagne of Pinot Noir en analyseer:
- geurintensiteit
- finesse
- elegantie
- spanning
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Wat is je protocol als panelleden op Bloemdag verschillende aroma''s benoemen bij dezelfde wijn?
',
    8,
    3
  ),
  (
    'wijn-op-vruchtdag',
    'Wijn op een Vruchtdag',
    'Na deze les kun je een wijn op Vruchtdag evalueren op rijpheid, mondvulling en directheid.
',
    'Vruchtdag laat veel wijnen opener en meer onmiddellijk overtuigend overkomen, vooral in het middenpalet. Veel proevers ervaren dat fruitlagen beter verbonden lijken met textuur, waardoor de wijn toegankelijker wordt voor niet-technische gasten.

Gebruik dit als hypothese door verkoopdata en proefnotities te combineren. Als fruitexpressie hoog is maar lengte kort blijft, kan een kortere beluchting of aangepaste serveertemperatuur betere balans geven.

Operationeel blijft het beslisondersteuning niet dogma. Vruchtdag kan een sterk commercieel venster zijn, maar je vermijdt automatische aanbevelingen zonder contextcheck per tafel.


## Drinkmoment & advies

### Beste moment

Gebruik deze les op verkoopgerichte avonden met een dynamische wijnkaart.

### Waarom dit werkt

Vruchtdag-assessment ondersteunt overtuigende suggesties per glas en per fles.

### Wanneer wachten slimmer is

Wacht als je geen ruimte hebt voor herproefmomenten gedurende de service.

## Pro insight

Vruchtdag is vaak geschikt voor conversie aan tafel, maar zet een herproefalarm in om consistentie per fles te bewaken.',
    '- fruitdefinitie
- middenpalet
- directe expressie
- serviceconversie
- herproefmoment
',
    'Veel topverzamelaars plannen grote openingen bewust op Vruchtdagen om de kans op geslotenheid zo klein mogelijk te maken.
',
    '- Vruchtdag ondersteunt direct overtuigende service.
- Fruit en mondvulling worden vaak prominenter ervaren.
- Herproeven tijdens de shift blijft noodzakelijk.
- Commerciele winst vraagt tegelijk analytische controle.
',
    '### Opdracht

Open een topfles of favoriete wijn op een Vruchtdag en noteer:
- fruit
- openheid
- balans
- lengte
- complexiteit

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke keuze maak je anders op Vruchtdag: glas, temperatuur of openingstijd, en wat is je bewijs?
',
    8,
    4
  ),
  (
    'eerste-proefexperiment',
    'Eerste proefexperiment',
    'Na deze les kun je een gecontroleerd proefexperiment opzetten over meerdere dagtypen.
',
    'Een proefexperiment over meerdere dagtypen maakt impliciete aannames zichtbaar. Veel proevers ervaren dat hun eigen bias pas opvalt zodra dezelfde wijn in een vast protocol op verschillende momenten wordt geproefd.

De kern is werken als hypothese: vooraf voorspellen, achteraf toetsen, en afwijkingen verklaren. Door identieke flesconditie, glaswerk en volgorde te borgen, verhoog je de bewijskracht van je observaties aanzienlijk.

In professionele teams is dit beslisondersteuning niet dogma. Het experiment levert geen universele waarheid, wel een robuuste beslisbasis voor je kelder, je kaart en je gasten.


## Drinkmoment & advies

### Beste moment

Plan het experiment verspreid over meerdere dagen met identieke condities.

### Waarom dit werkt

Alleen gespreide meting maakt verschillen zichtbaar en verdedigbaar.

### Wanneer wachten slimmer is

Wacht als je geen consistente fles- of glasopstelling kunt garanderen.

## Pro insight

Een goed experiment logt ook mislukkingen. Juist afwijkingen leveren de beste beslisregels voor toekomstige service op.',
    '- proefexperiment
- conditiecontrole
- biasdetectie
- vergelijkingsmatrix
- datagestuurd leren
',
    'Professionals vertrouwen nooit op één proefmoment, maar zoeken herhaling om patronen te bevestigen.
',
    '- Experimenten maken verborgen bias zichtbaar.
- Identieke condities zijn essentieel voor vergelijkbaarheid.
- Vooraf voorspellen verhoogt leerwaarde van resultaten.
- Lokale data is waardevoller dan algemene claims.
',
    '### Opdracht

Voer één gecontroleerd vergelijkexperiment uit met dezelfde fles op vier dagtypes.

Kies één fles en proef deze op:
- Worteldag
- Bladdag
- Bloemdag
- Vruchtdag

Noteer telkens:
- fruit
- structuur
- openheid
- balans
- drinkbaarheid

*Plan dit over minimaal twee weken; houd glas, temperatuur en context gelijk.*

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welk onderdeel van je experiment dreigt bias te introduceren: volgorde, verwachting of paneldiscussie?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- weer-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'weer-biodynamic'
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
    'temperatuur-en-smaak',
    'Temperatuur en smaakbeleving',
    'Na deze les kun je temperatuur meenemen als beslisfactor bij biodynamische proefresultaten.
',
    'Temperatuur is een sterke modulator van biodynamische indrukken en kan dagtype-signalen versterken of maskeren. Veel proevers ervaren dat te koude service verschillen tussen dagtypen afvlakt, terwijl te warme service fruit overschreeuwt en structuur diffuus maakt.

Behandel dit als hypothese door in kleine stappen te werken, bijvoorbeeld per halve graad. Je test hoe hetzelfde glas evolueert en noteert waar balans, aromadetail en lengte optimaal samenkomen voor het gekozen dagvenster.

Zo blijft het beslisondersteuning niet dogma. Temperatuurcorrectie is vaak de snelste professionele hefboom om een middelmatige indruk om te zetten in overtuigende service.


## Drinkmoment & advies

### Beste moment

Gebruik deze les bij seizoenswissel, wanneer temperatuurmanagement extra kritisch is.

### Waarom dit werkt

Je ziet direct hoe kleine gradenverschillen biodynamische signalen versterken of afzwakken.

### Wanneer wachten slimmer is

Wacht als koelapparatuur onstabiel is; eerst techniek fixen, dan pas evalueren.

## Pro insight

Temperatuur is je snelste correctieknop. Professionele teams sturen eerst graden, dan pas narratief.',
    '- temperatuurstap
- serveercurve
- balanspunt
- koelketen
- correctieprotocol
',
    'Veel sommeliers vermijden zware rode wijnen op extreem warme dagen, omdat alcohol dan sneller dominant wordt.
',
    '- Temperatuur kan dagtype-effecten versterken of maskeren.
- Kleine correcties geven vaak grote kwaliteitswinst.
- Meet en noteer per halve graad voor precisie.
- Techniek eerst, interpretatie daarna.
',
    '### Opdracht

Test eenzelfde wijn op drie temperaturen met kleine stappen (bijvoorbeeld 9, 10 en 11 graden voor wit, of 15, 16 en 17 graden voor rood). Vergelijk hoe dagtype-signalen veranderen per temperatuur.

### Checklist

- Ik werkte met kleine temperatuurstappen
- Ik noteerde per stap aroma, structuur en lengte
- Ik koppelde observaties aan het actuele dagtype
- Ik formuleerde een concreet service-advies


### Reflectievraag

Bij welke temperatuurstap zie je meestal de grootste kwaliteitswinst in jouw serviceomgeving?
',
    8,
    1
  ),
  (
    'luchtdruk-en-expressie',
    'Luchtdruk en expressie',
    'Na deze les kun je luchtdruk verbinden aan waargenomen openheid of geslotenheid van wijn.
',
    'Luchtdruk wordt door ervaren proefteams vaak genoemd bij plotselinge verschillen in openheid en precisie. Veel proevers ervaren op lage drukdagen meer diffusie in aroma en minder strakke contouren, al varieert dit per wijnstijl.

Gebruik luchtdruk als hypothesevariabele in je logboek. Combineer kalenderdag, druktrend en proefuitkomst, zodat je na verloop van tijd ziet wanneer extra beluchting of juist voorzichtig openen het beste werkt.

Daarmee blijft het beslisondersteuning niet dogma. Luchtdruk is een richtinggevend signaal, geen excuus voor zwakke service: techniek en timing blijven doorslaggevend.


## Drinkmoment & advies

### Beste moment

Plan deze les op dagen met duidelijke druktrend in de weersverwachting.

### Waarom dit werkt

Koppeling tussen proefnotities en luchtdruk maakt servicebeslissingen voorspelbaarder.

### Wanneer wachten slimmer is

Wacht wanneer er geen betrouwbare drukdata beschikbaar is voor je logboek.

## Pro insight

Koppel luchtdruktrends aan open-tijden in je kelderlog. Na enkele weken ontstaat een bruikbare voorspelkaart voor topflessen.',
    '- luchtdruktrend
- openheid
- aromadiffusie
- druklogboek
- timingbesluit
',
    'Veel proevers vermijden belangrijke beoordelingsmomenten tijdens zware lage druksystemen of vlak voor stormfronten.
',
    '- Luchtdruk is een bruikbaar contextsignaal.
- Druktrend koppelen aan openmoment verbetert planning.
- Signaalsterkte verschilt per stijl en situatie.
- Geen drukdata betekent voorzichtiger conclusies.
',
    '### Opdracht

Proef dezelfde wijn op twee momenten met meetbaar verschil in luchtdruk (hoge versus lage druk volgens weerdata of kelderlogboek). Houd glas, temperatuur en beluchting constant en vergelijk geurintensiteit, openheid, focus, precisie en lengte.

### Checklist

- Ik noteerde luchtdruk en tijdstip per proefmoment
- Ik hield serveercondities constant tussen beide momenten
- Ik vergeleek geurintensiteit, openheid, focus, precisie en lengte
- Ik formuleerde een openingsbesluit op basis van het drukverschil


### Reflectievraag

Hoe onderscheid je in je notities luchtdrukeffect van simpelweg onvoldoende beluchting?
',
    8,
    2
  ),
  (
    'luchtvochtigheid-en-perceptie',
    'Luchtvochtigheid en perceptie',
    'Na deze les kun je luchtvochtigheid meenemen in textuur- en aromainterpretatie.
',
    'Luchtvochtigheid kan subtiel meespelen in hoe textuur en geurintensiteit worden beleefd. Veel proevers ervaren bij hoge vochtigheid een zachtere mondindruk, terwijl droge lucht soms scherpere contouren en snellere aromaverlies laat zien in warme serviceomgevingen.

Professioneel behandel je dit als hypothese met praktische metingen. Door vochtigheid naast temperatuur en dagtype te registreren, kun je verklaren waarom dezelfde wijn niet elke avond identiek presteert in glas.

De werkhouding blijft beslisondersteuning niet dogma. Vochtigheid helpt je anticiperen, maar je beslissing volgt altijd uit actuele waarneming en niet uit een enkel getal.


## Drinkmoment & advies

### Beste moment

Gebruik deze les in ruimtes met meetbare verschillen in luchtvochtigheid.

### Waarom dit werkt

Je leert om textuur- en geurwaarneming beter te duiden bij veranderende zaalcondities.

### Wanneer wachten slimmer is

Wacht als je geen hygrometerdata hebt; dan blijft interpretatie te speculatief.

## Pro insight

Bij hoge luchtvochtigheid helpt extra glasdiscipline: naschenken in vers glas houdt aromadefinitie beter overeind.',
    '- luchtvochtigheid
- textuurwaarneming
- zaalconditie
- hygrometerdata
- interpretatiekader
',
    'Champagne voelt op droge dagen vaak strakker en preciezer, terwijl hoge luchtvochtigheid de mousse zachter kan maken.
',
    '- Luchtvochtigheid kan textuurbeleving mee kleuren.
- Meetwaarden helpen speculatie te vermijden.
- Zaalcondities horen in het proeflogboek.
- Vochtigheid is richtinggevend, niet beslissend op zichzelf.
',
    '### Opdracht

Open een mousserende wijn of Riesling en noteer geurontwikkeling, mondgevoel, spanning, mousse en frisheid. Meet tegelijk de luchtvochtigheid in de proefruimte en herhaal de observatie na 15 minuten in dezelfde setting.

### Checklist

- Ik noteerde luchtvochtigheid vóór en tijdens de proef
- Ik beschreef geur, mondgevoel, spanning, mousse en frisheid
- Ik vergeleek beide meetmomenten op aromadefinitie
- Ik vertaalde het resultaat naar een glas- of zaalbesluit


### Reflectievraag

Welke aanpassing in zaalsetting zou je testen om vochtigheidseffecten op aroma te minimaliseren?
',
    8,
    3
  ),
  (
    'weersomslag-en-proeven',
    'Weersomslag en proefmomenten',
    'Na deze les kun je weersomslag vertalen naar risicobeheer in service en topflesmomenten.
',
    'Weersomslag brengt vaak onrust in proefperceptie: wat gisteren open was, kan vandaag geremd lijken. Veel proevers ervaren rond frontwisselingen grotere spreiding in panelnotities, vooral bij aromatisch gevoelige wijnen.

Gebruik dit als hypothese voor risicobeheer. Je maakt vooraf een A-plan en B-plan: welke fles kan veilig open, welke houd je achter de hand, en op welk moment herproef je voordat je aan tafel adviseert.

Zo blijft het beslisondersteuning niet dogma. Weersomslag vraagt om scenario-denken en rustige communicatie, niet om absolute claims richting gast of team.


## Drinkmoment & advies

### Beste moment

Plan deze les rond aangekondigde weersomslag met een A/B-flesplan.

### Waarom dit werkt

Scenario-denken voorkomt teleurstelling bij topflesmomenten en verhoogt teamrust.

### Wanneer wachten slimmer is

Wacht wanneer je geen alternatief assortiment achter de hand hebt.

## Pro insight

Weersomslag vraagt dubbel voorraadplan. Houd altijd een veilige tweede keuze per prijspunt klaar.',
    '- weersomslag
- risicobeheer
- A-plan
- B-plan
- topflesmoment
',
    'Veel verzamelaars vermijden het openen van zeldzame flessen vlak voor een stormfront of zware weersomslag.
',
    '- Weersomslag verhoogt perceptierisico in service.
- Scenario A/B voorkomt stress bij topflessen.
- Teambriefing moet expliciet alternatieven bevatten.
- Rustige communicatie voorkomt overselling en teleurstelling.
',
    '### Opdracht

Controleer vóór je volgende topflesopening de weerscontext: luchtdruktrend, temperatuurtrend, neerslagkans en weersstabiliteit. Bepaal daarna of je opent, wacht of naar je B-plan schakelt.

### Checklist

- Ik noteerde luchtdruktrend en temperatuurtrend
- Ik checkte neerslagkans en weersstabiliteit
- Ik koos tussen openen, wachten of B-plan
- Ik legde het servicebesluit in één zin vast voor het team


### Reflectievraag

Wat is je B-plan als weersomslag samenvalt met een gereserveerde topfles aan een belangrijke tafel?
',
    8,
    4
  ),
  (
    'dynamisch-vs-strategisch-advies',
    'Dynamisch versus strategisch advies',
    'Na deze les kun je dynamisch versus strategisch advies professioneel kiezen en uitleggen.
',
    'Dynamisch adviseren betekent inspelen op het huidige glas; strategisch adviseren betekent sturen op doel over tijd. Veel proevers ervaren dat beide nodig zijn: het ene voor directe tafelkwaliteit, het andere voor voorraad, marge en topflesplanning over weken of maanden.

In methodiek werkt dit als hypothese-gestuurd beslisontwerp. Je test of dagtype en omgevingssignalen vandaag voldoende sterk zijn voor een premium opening, en je weegt tegelijk de strategische consequenties voor komende servicevensters.

De professionele standaard blijft beslisondersteuning niet dogma. Dynamisch versus strategisch advies is geen kampkeuze maar een kader om op het juiste moment de juiste verantwoordelijkheid te nemen.


## Drinkmoment & advies

### Beste moment

Gebruik deze les in de weekstart met sommelier, manager en kelderverantwoordelijke.

### Waarom dit werkt

Dynamisch versus strategisch advies wordt dan meteen gekoppeld aan voorraad en servicekansen.

### Wanneer wachten slimmer is

Wacht als alleen operationeel personeel aanwezig is zonder beslisbevoegdheid voor planning.

## Pro insight

Dynamisch advies wint service vandaag; strategisch advies beschermt marge en reputatie morgen. Topteams beheersen beide.',
    '- dynamisch advies
- strategisch advies
- openingsbesluit
- voorraadplanning
- servicebesluit
',
    'Professionals werken bijna altijd strategisch bij topflessen, maar blijven dynamisch bij dagelijkse keuzes.
',
    '- Dynamisch advies reageert op het moment.
- Strategisch advies beschermt voorraad en reputatie.
- Topteams combineren beide perspectieven bewust.
- Keuzekader werkt beter dan ideologische voorkeur.
',
    '### Opdracht

Ontwerp voor komende week twee besluitregels: een dynamische regel voor live service en een strategische regel voor kelderplanning. Pas beide toe op minimaal een topfles-scenario.

### Checklist

- Ik beschreef wanneer ik dynamisch stuur
- Ik beschreef wanneer ik strategisch wacht
- Ik testte de regels op een echte servicecase
- Ik legde de uitkomst uit in teamtaal


### Reflectievraag

In welke situatie kies jij bewust voor strategisch nee zeggen tegen een opening die dynamisch aantrekkelijk lijkt?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- stijlen-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'stijlen-biodynamic'
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
    'rode-wijn-per-dagtype',
    'Rode wijn per dagtype',
    'Na deze les kun je biodynamische beslisintelligentie toepassen op rode wijn in servicecontext.
',
    'Rode wijn reageert vaak duidelijk op dagcontext omdat tannine, zuur en fruitbalans sterk meespelen in beleving. Veel proevers ervaren op structuurgerichte dagen meer definitie, terwijl op expressieve dagen vooral middenpalet en aromatische charme sneller overtuigen.

Gebruik deze observatie als hypothese door rode wijnen in stijlclusters te testen: strak klassiek, rijp modern en elegant koelklimaat. Zo zie je per cluster wanneer biodynamische timing echt voordeel oplevert in service.

Voor de professional blijft het beslisondersteuning niet dogma. De keuze om een toprode te openen rust op glas, gastprofiel en operationele context, niet op kalenderinformatie alleen.


## Drinkmoment & advies

### Beste moment

Plan deze les voor een rode-wijnavond met mix van klassiek en modern profiel.

### Waarom dit werkt

Je oefent keuze-intelligentie per stijlcluster en verhoogt precisie bij advies.

### Wanneer wachten slimmer is

Wacht op avonden met uitsluitend eenvoudige huiswijnen; dan is leerrendement beperkt.

## Pro insight

Rode topflessen vragen biascontrole: verwacht je grandeur, dan proef je die al snel. Laat altijd een kalibratiefles meelopen.',
    '- rode stijlcluster
- tanninebias
- decanteringskeuze
- structuurvenster
- openingsdiscipline
',
    'Veel Barolo- en Bordeauxproevers kiezen Vruchtdagen voor drinkplezier, maar Worteldagen voor analyse.
',
    '- Rode wijn toont dagcontext vaak duidelijk.
- Stijlclusters helpen gerichte beslissingen nemen.
- Biascontrole blijft essentieel bij toprode labels.
- Opening gebeurt pas na contextcheck.
',
    '### Opdracht

Open dezelfde rode wijn op een Worteldag en een Vruchtdag. Noteer fruit, tannine, balans, lengte en drinkbaarheid. Plan het experiment over 2–4 weken onder vergelijkbare omstandigheden.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke rode wijn op je kaart vraagt de strengste calibratie tegen tannine-bias, en hoe organiseer je die?
',
    8,
    1
  ),
  (
    'witte-wijn-per-dagtype',
    'Witte wijn per dagtype',
    'Na deze les kun je biodynamische beslisintelligentie toepassen op witte wijn in servicecontext.
',
    'Witte wijn toont daginvloed vaak in aromatische projectie, zuurbeleving en textuurbreedte. Veel proevers ervaren dat frisse stijlen op sommige dagen strakker lijken, terwijl rijpere stijlen juist meer gelaagdheid laten zien.

Als hypothese test je wit in gecontroleerde temperatuurbanden en met passend glaswerk. Kleine afwijkingen in koeling kunnen anders ten onrechte als dagtype-effect worden gelezen, wat advieskwaliteit direct schaadt.

Daarom blijft het beslisondersteuning niet dogma. Biodynamische signalen helpen prioriteren, maar de finale servicelijn volgt uit precisie in techniek en actuele proefprestatie.


## Drinkmoment & advies

### Beste moment

Gebruik deze les bij menu''s met meerdere witte wijnmomenten.

### Waarom dit werkt

Fijne verschillen in zuur, aroma en textuur worden direct relevant voor pairing en upsell.

### Wanneer wachten slimmer is

Wacht wanneer serveertemperaturen niet stabiel gehouden kunnen worden.

## Pro insight

Witte wijn wordt het meest verkeerd beoordeeld door temperatuurfouten. Controleer eerst de fles, dan pas de kalenderverklaring.',
    '- witte precisie
- zuurbeleving
- aromaprojectie
- koelband
- glasselectie
',
    'Veel sommeliers kiezen Bloemdagen voor aromatische witte wijnen, omdat finesse dan het zuiverst leesbaar is.
',
    '- Witte wijn vraagt precieze temperatuurdiscipline.
- Daginvloed toont zich vaak in aroma en zuur.
- Glaswerk en koeling bepalen interpretatiekwaliteit.
- Kalender is nuttig, techniek blijft fundament.
',
    '### Opdracht

Open een Riesling, Chablis of Sauvignon Blanc en analyseer:
- geur
- mineraliteit
- frisheid
- fruit
- lengte

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke witte stijl laat in jouw ervaring de grootste schijnverschillen zien door temperatuur in plaats van dagtype?
',
    8,
    2
  ),
  (
    'rose-per-dagtype',
    'Rosé per dagtype',
    'Na deze les kun je biodynamische beslisintelligentie toepassen op rose met commerciële scherpte.
',
    'Rose is een uitstekende stresstest voor biodynamische besluitvorming omdat de categorie snel reageert op context en presentatie. Veel proevers ervaren dat fruitlift, bitters en zuren opvallend kunnen kantelen per dagvenster, vooral bij gastronomische rose in plaats van puur terrasstijl.

Benader dit als hypothese met scenariovergelijking: aperitiefrose, gastronomische rose en houtgerijpte rose krijgen elk een eigen besliskader rond temperatuur, glas en timing. Zo voorkom je dat alle rose onder een enkele serviceformule valt.

Ook hier geldt beslisondersteuning niet dogma. De beste keuze combineert dagtype, weer en gastdoel in een professionele afweging die uitlegbaar blijft aan team en tafel.


## Drinkmoment & advies

### Beste moment

Plan deze les op een dag met zowel aperitief- als gastronomische rose in rotatie.

### Waarom dit werkt

Je leert snel schakelen tussen stijlverwachting, gastdoel en margedoel.

### Wanneer wachten slimmer is

Wacht als de kaart slechts een enkel generiek rose-label bevat; vergelijkingswaarde ontbreekt.

## Pro insight

Rose biedt een kans om specialistisch te adviseren zonder elitair te klinken: context, temperatuur en dagtype in drie zinnen.',
    '- rose-scenario
- aperitiefkader
- gastronomisch kader
- presentatietiming
- contextadvies
',
    'Provençaalse rosé presteert vaak opvallend sterk op warme Vruchtdagen met stabiel weer.
',
    '- Rose is gevoelig voor context en presentatie.
- Aperitief- en gastronomische rose vragen ander kader.
- Dagtype helpt prioriteren van servicekeuzes.
- Professionele uitleg blijft compact en concreet.
',
    '### Opdracht

Open een rosé op een Vruchtdag en een Bloemdag. Vergelijk fruit, frisheid, finesse, spanning en drinkbaarheid onder identieke serveercondities.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Hoe bepaal je bij rose of je advies moet sturen op aperitiefsnelheid of op gastronomische diepgang?
',
    8,
    3
  ),
  (
    'mousserend-per-dagtype',
    'Mousserende wijn per dagtype',
    'Na deze les kun je mousserende stijlen per dagtype adviseren op energie, context en gewenst tempo.
',
    'Mousserend per dagtype vraagt doorgaans om meer nuance dan alleen stijlnaam of prijsniveau. In de ochtend en vroege middag werkt vaak een slanker profiel met hogere frisheid, terwijl de avond vaker ruimte geeft aan meer diepte, autolyse en textuur.

Toch is dat geen harde wet. Klimaat, eettempo, gezelschap en de mentale energie van de gast kunnen de optimale keuze verschuiven. Een energieke lunch met zilt eten kan bijvoorbeeld meer spanning verdragen dan een rustige avonddrink zonder food.

Professioneel gezien helpt het om dagtypes te zien als dynamische kaders. Je vertrekt vanuit verwachte behoefte, test met gerichte vragen en schaalt dan op of af. Zo blijft mousserend functioneel, niet dogmatisch.


## Drinkmoment & advies

### Beste moment

Brunch, middagterras en vroege aperitiefmomenten met behoefte aan lift.

### Waarom dit werkt

Mousserend kan energie verhogen zonder zwaarte, mits stijl en dosage kloppen.

### Wanneer wachten slimmer is

Start slank en fris; schaal pas op naar rijpere stijlen als tempo en tafel dat vragen.

## Pro insight

Bij mousserend per dagtype verkoop je geen etiket maar energiemanagement: leg uit waarom een slanke stijl overdag vaak beter presteert dan een rijke prestigecuvee.',
    '- dagtype-kalibratie
- mousserende structuur
- energiemanagement
- dosage
- contextsturing
',
    'Veel Champagnehuizen plannen blendsessies op Bloemdagen omdat finesse dan het zuiverst beoordeeld kan worden.
',
    '- Dagtype stuurt keuze in stijlgewicht en dosage.
- Mousserend werkt als energieregisseur, niet alleen als feestwijn.
- Context kan klassieke tijdsregels doorbreken.
- Professionele keuzes blijven adaptief en onderbouwd.
',
    '### Opdracht

Open een Champagne of mousserende wijn en noteer mousse, geur, spanning, finesse en lengte. Herhaal dezelfde proef op een ander dagtype met identieke serveercondities en vergelijk de resultaten.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke drie signalen gebruik jij om te beslissen of een mousserende keuze overdag spanning geeft of juist energie wegneemt?
',
    8,
    4
  ),
  (
    'port-per-dagtype',
    'Port per dagtype',
    'Na deze les kun je Port per dagtype positioneren zonder terug te vallen op alleen zoetheid of leeftijd.
',
    'Port per dagtype werkt meestal beter wanneer je eerst het moment definieert en pas daarna de categorie kiest. Overdag is er vaker behoefte aan frisheid en lagere zwaarte, terwijl laat op de avond meer concentratie en warmte geaccepteerd worden.

Die observatie is nuttig, maar niet absoluut. Een informele zomerdag kan juist baat hebben bij White Port met tonic, terwijl een herfstlunch met kaas verrassend goed kan werken met een jonge LBV in kleine schenking.

Voor professionals ligt de kern in dosering en framing. Door portie, temperatuur en context actief te sturen, maak je Port breder inzetbaar door de hele dag heen zonder het product te forceren.


## Drinkmoment & advies

### Beste moment

Late lunch met kaas, pre-dinner op het terras of digestief na rustig diner.

### Waarom dit werkt

Port is breed inzetbaar wanneer portie, temperatuur en stijl op moment zijn afgestemd.

### Wanneer wachten slimmer is

Gebruik kleinere schenking en benoem functie: aperitief, food-bridge of digestief.

## Pro insight

Port wordt commercieel sterker wanneer je het moment benoemt voor je categorie noemt; daarmee verschuif je gesprek van zoetheid naar functie.',
    '- Port-positionering
- momentfunctie
- portiecontrole
- temperatuursturing
- scenario-denken
',
    'Oude Vintage Ports kunnen op Worteldagen verrassend gesloten blijven, zelfs wanneer ze technisch perfect zijn.
',
    '- Port past in meerdere dagtypes met juiste framing.
- Functie gaat voor categorie-denken.
- Portie en temperatuur bepalen inzetbaarheid sterk.
- Scenario-denken voorkomt stereotype Port-service.
',
    '### Opdracht

Open een Vintage Port of Tawny en analyseer:
- openheid
- alcoholintegratie
- zoetbalans
- lengte
- complexiteit

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Wanneer je Port overdag adviseert, welke variabele weegt voor jou het zwaarst: stijl, portie, temperatuur of context?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- cross-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'cross-biodynamic'
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
    'bier-en-biodynamische-dagen',
    'Bier en biodynamische dagen',
    'Na deze les kun je bier inzetten per dagtype op basis van structuur, koolzuur en aromatische impact.
',
    'Bier per dagtype vraagt om calibratie van koolzuur, bitterheid en body. In actieve dagfases werken vaak strakkere, frissere stijlen; in tragere avondfases kunnen rijkere moutprofielen of complexere gistkarakters beter landen.

Tegelijk blijft individuele tolerantie bepalend. Sommige gasten ervaren hopbitterheid vroeg op de dag als verfrissend, anderen als vermoeiend. De keuze wordt daarom sterker wanneer je ook kijkt naar voedsel, hydratatie en verwacht drinktempo.

Een professionele aanpak gebruikt bier als ritmeregelaar. Je kiest niet alleen op smaak, maar op hoe een stijl de rest van het dagverloop ondersteunt. Dat verhoogt tevredenheid en voorkomt overbelasting.


## Drinkmoment & advies

### Beste moment

Actieve middag met food-sharing of avond met comfortgerechten.

### Waarom dit werkt

Bier stuurt ritme via koolzuur, bitterheid en body en kan zeer precies pairen.

### Wanneer wachten slimmer is

Kies op structuur eerst, dan op stijlnaam; bewaak drinktempo bij hoppige of zware opties.

## Pro insight

Bieradvies per dagtype werkt het best met structuurtaal (koolzuur, body, bitterlijn) in plaats van stijljargon; dat verlaagt keuzeangst direct.',
    '- bierstructuur
- koolzuurdynamiek
- bitterlijn
- bodybeheer
- ritmeregie
',
    'Veel craftbierproevers kiezen Vruchtdagen voor IPA’s omdat tropische hoparoma’s dan doorgaans expressiever overkomen.
',
    '- Bier per dagtype vraagt structuurkalibratie.
- Koolzuur en body sturen energieniveau van de gast.
- Individuele tolerantie blijft bepalend.
- Ritmeregie maakt bieradvies professioneler.
',
    '### Opdracht

Open een IPA of Saison en analyseer:

- hoparoma
- bitterheid
- body
- frisheid
- balans. Herhaal op een ander dagtype.

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke bierstructuurcomponent veroorzaakt in jouw ervaring de meeste mismatch per dagtype, en hoe corrigeer je die vooraf?
',
    8,
    1
  ),
  (
    'bier-0-0-en-timing',
    'Bier 0.0 en timing',
    'Na deze les kun je 0.0-bier professioneel adviseren als volwaardige keuze per moment en gerecht.
',
    '0.0-bier is in moderne service geen noodoptie meer, maar een volwaardige categorie met eigen stijlverschillen. Per dagtype kan het zelfs strategisch sterker zijn dan alcoholisch bier, vooral wanneer focus, mobiliteit of langere sociale duur een rol spelen.

De kwaliteit varieert wel per producent en stijl. Sommige 0.0-profielen missen middenpalet of afdronkspanning, terwijl andere bijna volledig stijltypisch blijven. Blind vergelijken helpt om echte kwaliteit te scheiden van marketingclaims.

Professionals positioneren 0.0 daarom positief en inhoudelijk. Niet als beperking, maar als keuze die prestatie, comfort en smaak kan combineren. Dat vergroot vertrouwen en verbreedt omzetkansen.


## Drinkmoment & advies

### Beste moment

Werkdaglunch, sportieve avond of lange social waarin helderheid gewenst blijft.

### Waarom dit werkt

0.0 kan smaak en functionaliteit combineren zonder cognitieve of logistieke frictie.

### Wanneer wachten slimmer is

Presenteer 0.0 als premium keuze met stijlargument, niet als compromis.

## Pro insight

0.0 verkoopt premium zodra je dezelfde professionele vocabulaire gebruikt als bij alcoholische opties; framing bepaalt perceptie.',
    '- 0.0-kwaliteit
- premiumframing
- stijltypiciteit
- functioneel drinken
- inclusieve service
',
    'Een alcoholvrij bier dat op een Worteldag nog steeds in balans blijft, heeft meestal een sterkere receptuur.
',
    '- 0.0 is een volwaardige premiumcategorie.
- Kwaliteit verschilt zichtbaar per stijl en producent.
- Blind vergelijken verhoogt objectiviteit.
- Positieve positionering vergroot acceptatie en omzet.
',
    '### Opdracht

Open je favoriete 0.0 bier en noteer:

- zoetheid
- bitterheid
- frisheid
- body
- balans. Herhaal op een Vruchtdag.

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Hoe toets je objectief of een 0.0-optie echt premium presteert en niet alleen marketingmatig overtuigt?
',
    8,
    2
  ),
  (
    'cocktails-en-dagtypes',
    'Cocktails en dagtypes',
    'Na deze les kun je cocktails per dagtype kalibreren op intensiteit, balans en functioneel drinktempo.
',
    'Cocktails per dagtype vragen om sturing van alcoholvolume, zoet-zuurbalans en aromatische druk. Overdag functioneren vaak lichtere highballs of spritz-achtige structuren, terwijl de avond ruimte biedt aan meer concentratie en complexere bitters.

Ook hier gelden geen absolute schema''s. Weer, muziek, groepsgrootte en serviceflow kunnen de optimale cocktailkeuze sterk verschuiven. Een lage-abv keuze kan in een late setting functioneler zijn dan een klassieke spirit-forward bereiding.

De professionele meerwaarde zit in tempo-management. Je ontwerpt niet alleen een lekker glas, maar een duurzaam drinkverloop. Zo blijft de gastervaring hoog van eerste tot laatste ronde.


## Drinkmoment & advies

### Beste moment

Aperitiefstart, feestelijke piek of late digestieve fase.

### Waarom dit werkt

Cocktails kunnen per dagtype exact op tempo en energie worden gekalibreerd.

### Wanneer wachten slimmer is

Werk met ABV-ladder: licht starten, midden consolideren, zwaar alleen waar passend.

## Pro insight

Cocktailkwaliteit is niet alleen receptnauwkeurigheid maar ritmeregie: de beste bars sturen ABV over de avond, niet alleen per glas.',
    '- cocktail-ABV-ladder
- balansregie
- drinktempo
- serviceflow
- dagcurve
',
    'Een Martini op een Bloemdag kan aromatisch veel verfijnder overkomen dan op een Worteldag.
',
    '- Cocktails vragen dagtype-specifieke ABV-sturing.
- Balans en tempo zijn even belangrijk als smaak.
- Contextfactoren verschuiven ideale receptkeuzes.
- Serviceflow bepaalt totale cocktailprestatie.
',
    '### Opdracht

Maak dezelfde cocktail op:

Vergelijk - een Bloemdag
- een Worteldag
- aroma. Noteer: bitterheid, balans, openheid, lengte.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke ABV-strategie past het best bij jouw servicecontext, en waar zie je momenteel de grootste timingfout?
',
    8,
    3
  ),
  (
    'barrel-aged-dranken',
    'Barrel-aged dranken',
    'Na deze les kun je barrel-aged dranken per dagtype inzetten met controle op concentratie en vermoeidheid.
',
    'Barrel-aged dranken geven vaak hoge aromatische dichtheid door houtinvloed, oxidatieve nuances en soms verhoogde alcoholperceptie. Daardoor passen ze meestal beter in rustiger dagfases waarin de aandacht hoger en het tempo lager ligt.

Dat betekent niet dat barrel-aged nooit vroeg kan. In kleine proefvolumes of in educatieve context kan een vroeg moment juist didactisch waardevol zijn. De sleutel is dan strakkere portiecontrole en heldere begeleiding.

Voor professionals draait deze categorie om energiebudget. Je bewaakt vermoeidheid, smaakverzadiging en timing. Zo blijft complexiteit een voordeel in plaats van een belasting.


## Drinkmoment & advies

### Beste moment

Rustige avond, educatieve tasting of afsluitend contemplatief moment.

### Waarom dit werkt

Barrel-aged vraagt aandacht en laag tempo om diepte te laten renderen.

### Wanneer wachten slimmer is

Schenk klein, geef context en plan waterpauzes om smaakverzadiging te voorkomen.

## Pro insight

Barrel-aged inzetten zonder portiebeleid leidt snel tot palate fatigue; kleine schenking verhoogt waardering en verlengt servicekwaliteit.',
    '- barrel-aged
- smaakverzadiging
- portiebeleid
- complexiteitsbeheer
- avondcontext
',
    'Veel verzamelaars openen oude whisky’s bewust op Vruchtdagen om maximale aromatische openheid te krijgen.
',
    '- Barrel-aged vraagt aandacht en lager tempo.
- Kleine porties beschermen focus en smaakgevoeligheid.
- Complexiteit is waardevol maar energetisch zwaar.
- Professionele inzet voorkomt palate fatigue.
',
    '### Opdracht

Open een vatgerijpte drank en analyseer:
- houtinvloed
- alcoholintegratie
- rondheid
- complexiteit
- lengte

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Op welk moment wordt barrel-aged voor jouw gasten te zwaar, en welke interventie verlaagt dat risico het meest?
',
    8,
    4
  ),
  (
    'alcoholvrij-en-proefmomenten',
    'Alcoholvrij en proefmomenten',
    'Na deze les kun je alcoholvrije opties strategisch bouwen voor premium beleving zonder kwaliteitsverlies.
',
    'Alcoholvrij positioneren vraagt meer dan het schrappen van alcohol. De uitdaging ligt in behoud van textuur, lengte en gastronomische bruikbaarheid, zodat de ervaring premium blijft op elk dagtype.

Niet elke alcoholvrije stijl presteert gelijk in elke context. Sommige opties werken beter als aperitief, andere juist bij food of in lange sessies. Praktijkdata uit service is daarom waardevoller dan theorie alleen.

Professioneel bouw je een alcoholvrije lijn met duidelijke rollen: fris, gastronomisch, contemplatief. Die segmentatie voorkomt dat alcoholvrij als uniforme categorie wordt gezien en verhoogt keuzezekerheid.


## Drinkmoment & advies

### Beste moment

Zakelijke lunch, lange rij-avond of mixed-group events met uiteenlopende grenzen.

### Waarom dit werkt

Alcoholvrij houdt inclusie en kwaliteit hoog in settings met functionele eisen.

### Wanneer wachten slimmer is

Bouw een kaart met verschillende alcoholvrije profielen: fris, gastronomisch en complex.

## Pro insight

Een sterke alcoholvrije kaart verlaagt uitval in lange avonden en verhoogt gemiddeld bestedingsvertrouwen in gemengde groepen.',
    '- alcoholvrije architectuur
- rolsegmentatie
- textuurbehoud
- smaaklengte
- keuzezekerheid
',
    'Bij alcoholvrije mousserende dranken kan een Bloemdag het verschil maken tussen vlak en verfijnd.
',
    '- Alcoholvrij vereist premium ontwerp, niet vervanging.
- Segmentatie per rol verhoogt bruikbaarheid.
- Service-data moet keuzes valideren.
- Inclusie en kwaliteit kunnen tegelijk groeien.
',
    '### Opdracht

Kies een alcoholvrije wijn of bier en analyseer:

- fruit
- balans
- aroma
- frisheid
- structuur. Herhaal dit op een ander dagtype.

---

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke alcoholvrije categorie ontbreekt nog in jouw aanbod om alle dagtypes professioneel af te dekken?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- voorraad-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'voorraad-biodynamic'
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
    'juiste-fles-juiste-moment',
    'De juiste fles op het juiste moment',
    'Na deze les kun je de juiste fles kiezen op dagtype, context en ontwikkelpotentieel.
',
    'De juiste fles kiezen is een combinatie van productkennis en situatieduiding. Dagtype, groepsgrootte, budget en beoogde sfeer bepalen samen welke fles functioneel en emotioneel klopt.

Er is zelden een universeel beste keuze. Een topfles kan op het verkeerde moment onderpresteren, terwijl een bescheidener wijn in de juiste context sterk kan overkomen. Timing en framing zijn daarom onderdeel van de kwaliteit, niet alleen de vloeistof zelf.

Voor professionals is fleskeuze besliskunde. Je werkt met scenario''s, niet met lijstjes. Dat maakt keuzes reproduceerbaar en verdedigbaar, ook onder tijdsdruk.


## Drinkmoment & advies

### Beste moment

Momenten met keuzevrijheid uit meerdere topflessen en duidelijk doel.

### Waarom dit werkt

Fleskeuze bepaalt niet alleen smaak, maar ook verwachting en serviceflow.

### Wanneer wachten slimmer is

Beslis via matrix: dagtype, gezelschap, budget, bewaardoel en food-context.

## Pro insight

De juiste fles kiezen begint met risico-inschatting: mismatch op context schaadt meer dan een lagere prestigegraad.',
    '- flesselectie
- contextmatrix
- prestige-risico
- besliskunde
- situatieanalyse
',
    'Veel verzamelaars wachten bewust weken op een ideale Vruchtdag voordat zij een topfles openen.
',
    '- Fleskeuze is contextbesluit, geen etiketwedstrijd.
- Prestige zonder timing kan onderpresteren.
- Matrix-denken verhoogt trefzekerheid.
- Goede keuzes zijn reproduceerbaar en uitlegbaar.
',
    '### Opdracht

Bouw een fleskeuze-matrix voor drie scenario''s (zakelijke lunch, privédiner, verzamelaarsavond). Leg per scenario je primaire en secundaire keuze vast met argumenten op context, budget en drinkdoel.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke beslisfout maak jij het vaakst bij fleskeuze: te veel prestige, te veel veiligheid of te weinig contextanalyse?
',
    8,
    1
  ),
  (
    'openen-of-wachten',
    'Wanneer openen en wanneer wachten?',
    'Na deze les kun je openen en wachten plannen met focus op zuurstof, temperatuur en servicevenster.
',
    'Openen en wachten gaat over gecontroleerde zuurstofinteractie, niet over een vaste minutenregel. Sommige flessen openen snel, andere hebben baat bij geleidelijke beluchting voordat ze hun volledige structuur tonen.

De variatie komt door leeftijd, sluiting, stijl en bewaarcondities. Daarom werkt een observatiegedreven aanpak meestal beter dan een standaardprotocol. Je beoordeelt neus, spanning en textuur in tijdslijnen.

Professioneel wordt wachten een service-instrument. Je communiceert waarom je wacht, test tussendoor en past bij. Zo ontstaat precisie zonder ritualisme.


## Drinkmoment & advies

### Beste moment

Premiumservice waarbij de fles mogelijk gesloten of hoekig start.

### Waarom dit werkt

Openen en wachten kan textuur en aromatische gelaagdheid zichtbaar maken.

### Wanneer wachten slimmer is

Test in intervallen van enkele minuten en communiceer actief wat je waarneemt.

## Pro insight

Openen-wachten wordt professioneel wanneer je tastmomenten in tijd plant en communiceert; anders lijkt het op theater zonder resultaat.',
    '- zuurstofregie
- openprotocol
- wachtstrategie
- realtime-evaluatie
- servicevenster
',
    'Veel ervaren proevers stellen een topopening zonder twijfel uit als omstandigheden niet optimaal zijn.
',
    '- Openen-wachten gaat over gecontroleerde zuurstof.
- Vaste minutenregels zijn vaak te simplistisch.
- Realtime observatie leidt tot betere timing.
- Heldere communicatie maakt wachten waardevol.
',
    '### Opdracht

Voer een openen-wachten-protocol uit met twee flessen van verschillende stijl. Noteer observaties op 0, 10 en 20 minuten en formuleer per meetpunt een servicebesluit.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Hoe bepaal jij in realtime of extra wachten kwaliteitswinst oplevert of juist het servicemoment beschadigt?
',
    8,
    2
  ),
  (
    'drinkvensters-en-dagtypes',
    'Drinkvensters en dagtypes',
    'Na deze les kun je drinkvensters bepalen met scenario-denken in plaats van absolute regels.
',
    'Drinkvensters zijn kanszones, geen exacte data. Een venster beschrijft wanneer een fles waarschijnlijk de beste balans tussen fruit, structuur en complexiteit laat zien, maar individuele flessen kunnen afwijken.

Afwijkingen ontstaan door opslag, kurkvariatie en flesformaat. Daarom is vensterdenken sterker dan puntvoorspellingen. Je plant breed genoeg voor onzekerheid en verfijnt op basis van proefsignalen.

Voor professionals is dit vooral risicobeheer. Goede vensterinschatting verhoogt trefzekerheid in service en verlaagt teleurstelling bij premiummomenten.


## Drinkmoment & advies

### Beste moment

Kelderplanning, aankoopbeslissingen en speciale service-events.

### Waarom dit werkt

Drinkvensters verkleinen risico op openen buiten piekprestatie.

### Wanneer wachten slimmer is

Werk met vensterzones en herijk na elke proefdata van vergelijkbare flessen.

## Pro insight

Drinkvensters zijn een waarschijnlijkheidsmodel; topteams actualiseren dat model met eigen proefdata in plaats van alleen externe scores te volgen.',
    '- drinkvenster
- kanszone
- flesvariatie
- risicobeheer
- vensterplanning
',
    'Veel verzamelaars noteren niet alleen drinkvensters, maar ook hun favoriete dagtypes per wijnstijl.
',
    '- Drinkvensters zijn kanszones, geen exacte data.
- Flesvariatie vraagt scenario-denken.
- Vensterplanning verlaagt premium-risico.
- Eigen proefdata verscherpt voorspellingen.
',
    '### Opdracht

Maak voor tien flessen een drinkvenster-kaart met drie zones: nu, binnenkort, later. Koppel elke inschatting aan minimaal twee concrete signalen of databronnen.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke data zou jouw drinkvenster-inschattingen aantoonbaar betrouwbaarder maken dan je huidige aanpak?
',
    8,
    3
  ),
  (
    'voorraadstrategie-topflessen',
    'Voorraadstrategie voor topflessen',
    'Na deze les kun je een topflessen-voorraad opbouwen met rotatie, liquiditeit en piekmomenten.
',
    'Topflessen-voorraad vraagt balans tussen ambitie en liquiditeit. Wie alleen op prestige koopt, bouwt snel een kelder met lage rotatie; wie alleen op snelheid koopt, mist piekmomenten met hoge beleving.

De optimale mix verschilt per concept. Een restaurant met veel arrangementen vraagt andere verhoudingen dan een private cellar met lange horizon. Data over verbruik en seizoenspatronen is hier cruciaal.

Professioneel voorraadbeheer behandelt topflessen als strategische assets. Je plant instroom, uitstroom en vervanging op voorhand. Dat maakt kwaliteit schaalbaar en financieel gezond.


## Drinkmoment & advies

### Beste moment

Voorraadopbouw voor seizoenspieken, events en high-end menu''s.

### Waarom dit werkt

Topflessen vragen planning zodat prestige en cashflow tegelijk gezond blijven.

### Wanneer wachten slimmer is

Verdeel voorraad over snel, midden en lang ritme en monitor rotatie maandelijks.

## Pro insight

Topvoorraad zonder rotatie is prestige op papier maar verlies in praktijk; KPI''s op uitstroom horen bij kelderdiscipline.',
    '- topvoorraad
- rotatiesnelheid
- kelderliquiditeit
- seizoensplanning
- assetbeheer
',
    'Bij iconische flessen wordt voorbereiding vaak als onderdeel van de totale ervaring gezien.
',
    '- Topvoorraad vraagt balans tussen prestige en rotatie.
- Concepttype bepaalt optimale keldermix.
- Seizoensdata moet aankoop sturen.
- Voorraad is strategisch assetbeheer.
',
    '### Opdracht

Ontwerp een topvoorraadplan voor zes maanden met segmenten snel, midden en lang ritme. Benoem per segment gewenste rotatiesnelheid en triggers voor herbevoorrading.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke voorraadratio tussen snelle en langzame topflessen is voor jouw setting logisch, en waarom?
',
    8,
    4
  ),
  (
    'reserves-lange-termijn',
    'Reserves en lange termijn denken',
    'Na deze les kun je reserves beheren met discipline in allocatie, vervanging en risicospreiding.
',
    'Reserves zijn functioneel wanneer ze een duidelijke rol hebben: continuity, opportuniteit of prestige. Zonder rol worden reserves vaak emotionele aankopen die kapitaal blokkeren.

Een robuuste reserve-aanpak combineert spreiding over regio, stijl en rijpingsfase. Dat vermindert de impact van marktschommelingen en onverwachte vraagpieken. Reservebeleid is dus ook risicopolitiek.

Professioneel werken met reserves betekent periodiek herijken. Je toetst of de reserve nog past bij je actuele doelgroep en service-intentie. Zo blijft de kelder levend in plaats van statisch.


## Drinkmoment & advies

### Beste moment

Strategische keldermomenten met focus op continuiteit en onzekerheidsbuffer.

### Waarom dit werkt

Reserves beschermen servicekwaliteit bij markt- of leveringsschokken.

### Wanneer wachten slimmer is

Definieer reservecategorieen en stel per categorie heldere releasevoorwaarden vast.

## Pro insight

Reserves beschermen servicecontinuiteit alleen als releasecriteria vooraf vastliggen; ad-hoc vrijgeven maakt reservebeleid betekenisloos.',
    '- reservebeleid
- allocatiediscipline
- risicospreiding
- releasecriteria
- keldercontinuiteit
',
    'De beste collecties zijn niet alleen opgebouwd op kwaliteit, maar op geduld en timing.
',
    '- Reserves werken alleen met duidelijke rol.
- Spreiding verlaagt markt- en vraagrisico.
- Reservebeleid vraagt periodieke herijking.
- Discipline voorkomt kapitaalblokkade.
',
    '### Opdracht

Evalueer je reservekelder op spreiding en concentratierisico. Stel een reservebeleid op met releasecriteria, vervangregels en kwartaalreview.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Waar zit in jouw reservebeleid het grootste concentratierisico, en hoe zou je dat pragmatisch spreiden?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- intelligence-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'intelligence-biodynamic'
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
    'vertical-tasting-biodynamiek',
    'Vertical tasting en biodynamiek',
    'Na deze les kun je vertical tastings ontwerpen die evolutie zichtbaar maken zonder interpretatiebias.
',
    'Vertical tasting maakt tijd zichtbaar door meerdere jaargangen van dezelfde producent of cuvee naast elkaar te zetten. Het doel is doorgaans niet rangschikken, maar begrijpen hoe stijl en klimaat evolueren.

Interpretatie blijft gevoelig voor volgorde-effecten en verwachting. Daarom helpt een strak protocol met blokken, pauzes en neutrale notatie. Zo verklein je bias en verhoog je vergelijkbaarheid.

Professioneel is vertical tasting een intelligentie-instrument. De inzichten voeden aankoop, drinkvensters en gastadvies. Daarmee levert het direct operationele waarde op.


## Drinkmoment & advies

### Beste moment

Educatieve avonden, teamtrainingen of collector-sessies.

### Waarom dit werkt

Vertical tasting maakt jaargangsevolutie en huisstijl zichtbaar.

### Wanneer wachten slimmer is

Gebruik vaste proefvolgorde, neutrale notatie en korte rustblokken tussen flights.

## Pro insight

Vertical tastings leveren pas intelligence wanneer notities direct worden vertaald naar aankoop- en servicebeslissingen.',
    '- vertical tasting
- jaargangsevolutie
- protocolproeven
- biasreductie
- proefintelligentie
',
    'Bij grote Bordeaux verticals kiezen professionals vaak Vruchtdagen om maximale vergelijkbaarheid in openheid en fruitexpressie te krijgen.
',
    '- Vertical tasting toont evolutie over tijd.
- Protocol is nodig om bias te beperken.
- Inzichten moeten operationeel landen.
- Vergelijkbaarheid is belangrijker dan snelheid.
',
    '### Opdracht

Ontwerp en leid een mini-vertical met minimaal drie jaargangen. Gebruik een vast protocol en sluit af met drie operationele conclusies voor aankoop of service.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke bias zie je het vaakst terug in jouw vertical tastings, en welke protocolstap kan die bias reduceren?
',
    8,
    1
  ),
  (
    'blindproeven-timing',
    'Blindproeven en timing',
    'Na deze les kun je blindproef-timing sturen zodat concentratie, ritme en betrouwbaarheid hoog blijven.
',
    'Blindproeven onder tijdsdruk vraagt ritmebeheersing. Te snel leidt vaak tot gokgedrag, te traag tot sensorische vermoeidheid. De beste timing zit meestal in vaste, korte observatiecycli.

Timing verschilt per context. In training kun je langer analyseren; in service moet je sneller convergeren naar bruikbare waarschijnlijkheden. Een adaptief schema presteert meestal beter dan een rigide timer.

Professioneel blindproeven is dus besluitvorming onder onzekerheid. Je bewaakt tempo, bewaart methodiek en communiceert betrouwbaarheidsniveau expliciet.


## Drinkmoment & advies

### Beste moment

Blindtraining, examenvoorbereiding en high-pressure servicebeslissingen.

### Waarom dit werkt

Juiste timing verhoogt betrouwbaarheid en verlaagt gokgedrag.

### Wanneer wachten slimmer is

Werk in microcycli: kijken, ruiken, proeven, besluiten; houd elke stap tijdgebonden.

## Pro insight

Blindproef-timing moet getraind worden als vaardigheid; wie alleen smaak traint maar geen ritme, blijft onstabiel presteren onder druk.',
    '- blindritme
- microcycli
- tijdsdrukanalyse
- besliszekerheid
- kalibratietempo
',
    'Veel professionele proefpanels noteren het dagtype, zelfs wanneer het niet direct besproken wordt.
',
    '- Blindproeven is timing plus sensoriek.
- Te snel of te traag verlaagt betrouwbaarheid.
- Microcycli verbeteren beslisritme.
- Betrouwbaarheidsniveau hoort bij de conclusie.
',
    '### Opdracht

Blindproef twee wijnen op een Vruchtdag en herhaal dit op een Worteldag. Vergelijk herkenbaarheid, openheid, structuur en advieskwaliteit per dagtype.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Bij blindproeven onder tijdsdruk: welke fase kost jou disproportioneel veel tijd en wat is je correctieplan?
',
    8,
    2
  ),
  (
    'grote-flessen-biodynamiek',
    'Grote flessen en biodynamiek',
    'Na deze les kun je grote flessen functioneel inzetten voor rijping, service en groepsdynamiek.
',
    'Grote flessen veranderen rijpingsdynamiek door een andere verhouding tussen zuurstof en volume. Daardoor ontwikkelen aroma''s vaak langzamer en kunnen texturen langer fris blijven, afhankelijk van stijl en opslag.

Toch is groot niet automatisch beter. Servicecomplexiteit, koelcapaciteit en restvolume na openen kunnen de praktische waarde verminderen. Context bepaalt of magnum-logica echt voordeel geeft.

Professioneel gebruik van grote formaten combineert kelderstrategie met operationele planning. Je kiest ze wanneer ritueel, kwaliteit en logistiek tegelijk kloppen.


## Drinkmoment & advies

### Beste moment

Groepsdiners, jubilea en keldermomenten met langere consumptieduur.

### Waarom dit werkt

Grote flessen kunnen ontwikkeling vertragen en beleving vergroten.

### Wanneer wachten slimmer is

Plan koeling, schenklogistiek en restvolume vooraf; kies formaat op functie.

## Pro insight

Grote flessen vragen logistieke voorbereiding; zonder koeling en serviceplan verlies je het kwaliteitsvoordeel dat ze potentieel bieden.',
    '- groot formaat
- rijpingsdynamiek
- service-logistiek
- magnumstrategie
- groepsbeleving
',
    'Veel verzamelaars plannen Magnums weken vooruit, juist omdat de impact van een verkeerd moment groter voelt.
',
    '- Grote flessen veranderen rijpingsdynamiek.
- Formaatkeuze hangt af van logistieke haalbaarheid.
- Niet elk moment vraagt magnum.
- Kwaliteit en operatie moeten samen kloppen.
',
    '### Opdracht

Kies een Magnum of grotere fles en bepaal:
- ideale openingsperiode
- dagtype. Noteer: decanteertijd, pairing.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Wanneer kies jij bewust tegen een groot formaat, ondanks keldervoordeel, vanwege operationele realiteit?
',
    8,
    3
  ),
  (
    'pairing-dagtypes',
    'Pairing en dagtypes',
    'Na deze les kun je pairing per dagtype ontwerpen met prioriteit voor energiecurve en context.
',
    'Pairing per dagtype koppelt productkeuze aan energiecurve van de gast. In vroege fasen werkt vaak meer frisheid en spanning; later kan meer diepte en lengte zinvol zijn, mits het gerecht dat ondersteunt.

Dit blijft een probabilistisch model. Individuele voorkeur, culturele context en menustructuur kunnen de curve verschuiven. Daarom blijft doorvragen belangrijker dan blind volgen van schema''s.

Professioneel gezien is dagtype-pairing een ontwerpdiscipline. Je bouwt een traject dat de gast activeert in plaats van vermoeit. Dat verhoogt totale menu-ervaring.


## Drinkmoment & advies

### Beste moment

Meergangenmenu''s die over dagdelen of lange avonden lopen.

### Waarom dit werkt

Dagtype-pairing bewaakt energie zodat het menu opbouwt zonder te vermoeien.

### Wanneer wachten slimmer is

Start met frisse spanning, bouw middencomplexiteit en eindig met gecontroleerde diepte.

## Pro insight

Pairing per dagtype verhoogt gastcomfort merkbaar: energiecurve sturen is vaak belangrijker dan een spectaculaire losse match.',
    '- dagtype-pairing
- energiecurve
- menu-opbouw
- contextgevoeligheid
- gastcomfort
',
    'Een pairing die op een Vruchtdag perfect voelt, kan op een Bladdag minder harmonieus aanvoelen.
',
    '- Pairing per dagtype volgt energiecurve.
- Schema''s zijn richtinggevend, niet absoluut.
- Doorvragen blijft essentieel voor precisie.
- Opbouw over menu bepaalt gastcomfort.
',
    '### Opdracht

Kies één wijn en combineer deze op twee verschillende dagtypes met hetzelfde gerecht. Analyseer harmonie, spanning, contrast en lengte. Plan het experiment over 2–4 weken onder vergelijkbare omstandigheden.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Hoe ontwerp jij een pairing-opbouw die de energiecurve ondersteunt zonder midden in het menu te verzwaren?
',
    8,
    4
  ),
  (
    'eigen-biodynamisch-systeem',
    'Je eigen biodynamische systeem bouwen',
    'Na deze les kun je een eigen beslissysteem bouwen dat reproduceerbaar werkt in echte service.
',
    'Een eigen systeem is nuttig wanneer het keuzes versnelt zonder nuance te verliezen. Het systeem vertaalt complexe variabelen naar een hanteerbare beslisvolgorde die je consequent kunt toepassen.

Het risico is oververeenvoudiging. Een systeem dat geen uitzonderingen toelaat, presteert slecht in de echte wereld. Daarom bouw je feedbacklussen in waarmee je aannames periodiek test en bijstelt.

Professioneel gezien is een goed systeem zowel strikt als flexibel. Strikt in volgorde, flexibel in uitkomst. Dat maakt kwaliteit reproduceerbaar en toch menselijk.


## Drinkmoment & advies

### Beste moment

Operationele settings waar snelle maar betrouwbare keuzes nodig zijn.

### Waarom dit werkt

Een eigen systeem maakt beslissingen consistent tussen teamleden en shifts.

### Wanneer wachten slimmer is

Gebruik vaste volgorde van vragen, maar laat ruimte voor contextafwijking.

## Pro insight

Een eigen systeem moet auditbaar zijn: als teamleden niet kunnen uitleggen waarom ze kozen, werkt het systeem nog niet.',
    '- eigen systeem
- beslisvolgorde
- feedbacklus
- auditbaarheid
- teamconsistentie
',
    'De beste proevers bouwen hun eigen geheugenbank van ervaringen en vertrouwen niet uitsluitend op algemene regels.
',
    '- Eigen systeem versnelt consistente keuzes.
- Starre systemen falen bij uitzonderingen.
- Feedbacklussen houden systeem relevant.
- Auditbaarheid verhoogt teamkwaliteit.
',
    '### Opdracht

Bouw je eigen beslissysteem in maximaal zeven stappen, van contextcheck tot eindadvies. Test het systeem op vijf uiteenlopende cases en noteer waar het moet worden bijgesteld.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke twee regels moeten in jouw eigen systeem absoluut vastliggen om keuzeconsistentie te garanderen?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-biodynamic (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic' and m.slug = 'examen-biodynamic'
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
    'perfect-drinkmoment-herkennen',
    'Het perfecte drinkmoment herkennen',
    'Na deze les kun je een perfect drinkmoment ontwerpen met integratie van product, persoon en situatie.
',
    'Het perfecte drinkmoment ontstaat meestal uit alignment tussen drank, persoon en situatie. Kwaliteit van het product blijft belangrijk, maar timing, sfeer en verwachting bepalen vaak de uiteindelijke impact.

Omdat context fluctueert, is perfectie zelden absoluut. Wat op papier optimaal lijkt, kan in praktijk minder werken door tempo, stemming of groepsdynamiek. Daarom is realtime bijsturen essentieel.

Professioneel ontwerp je geen statisch perfect moment, maar een robuust moment met aanpasbare parameters. Dat vergroot de kans op een topbeleving in verschillende omstandigheden.


## Drinkmoment & advies

### Beste moment

Belangrijke tafelmomenten: vieringen, signing dinner of intieme afsluiting.

### Waarom dit werkt

Perfectie ontstaat wanneer timing, persoon en product samen resoneren.

### Wanneer wachten slimmer is

Check stemming, energie en verwachting kort voor serveren en pas laatste details aan.

## Pro insight

Perfect drinkmoment ontstaat zelden toevallig; topservice bouwt het via microchecks op stemming, tempo en tafelcontext.',
    '- perfect drinkmoment
- contextalignment
- stemmingsscan
- microbijsturing
- belevingsontwerp
',
    'De beste sommeliers leren niet alleen wát goed is, maar vooral wannéér iets op zijn best is.
',
    '- Perfect moment vraagt alignment van drie assen.
- Context kan productkwaliteit versterken of verzwakken.
- Realtime bijsturen verhoogt trefkans.
- Robuust ontwerp wint van statische perfectie.
',
    '### Opdracht

Kies één fles uit je voorraad en bepaal:
- drinkvenster
- ideale dagtype
- weersomstandigheden. Noteer: pairing, context.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke contextvariabele onderschat jij het vaakst bij het ontwerpen van een perfect drinkmoment?
',
    8,
    1
  ),
  (
    'timing-versus-kwaliteit',
    'Timing versus kwaliteit',
    'Na deze les kun je timing versus kwaliteit afwegen en onderbouwen in concrete keuzes.
',
    'Timing versus kwaliteit is geen binaire keuze maar een afwegingsmatrix. Soms levert wachten merkbare kwaliteitswinst op, soms vernietigt wachten juist het momentum van de tafel.

De optimale beslissing hangt af van doel van het moment. Bij educatieve of premium setting kan extra tijd gerechtvaardigd zijn; bij snelle servicecontext weegt flow vaak zwaarder. Beide uitkomsten kunnen professioneel zijn.

Professioneel handelen betekent expliciet kiezen en die keuze kunnen uitleggen. Je maakt de trade-off zichtbaar voor team en gast, zodat kwaliteit en timing niet als concurrenten maar als ontwerpkeuzes worden gezien.


## Drinkmoment & advies

### Beste moment

Servicemomenten met spanning tussen wachten en direct serveren.

### Waarom dit werkt

Soms wint kwaliteit door tijd, soms wint beleving door momentum.

### Wanneer wachten slimmer is

Beslis expliciet welke waarde prioriteit krijgt en leg die keuze kort uit aan tafel.

## Pro insight

Timing versus kwaliteit is een leiderschapskeuze: benoem de trade-off hardop in het team zodat iedereen hetzelfde servicebesluit draagt.',
    '- timing-kwaliteit
- trade-offmatrix
- serviceprioriteit
- momentumbeheer
- expliciete keuze
',
    'Professionals weten dat timing soms het verschil maakt tussen “goed” en “onvergetelijk”.
',
    '- Timing en kwaliteit vormen een trade-off.
- Beste keuze verschilt per service-doel.
- Expliciete afweging voorkomt teamruis.
- Professionalisme zit in onderbouwde prioriteit.
',
    '### Opdracht

Vergelijk een topwijn op een minder gunstig moment met een goede wijn op een sterk moment. Analyseer balans, plezier, expressie en memorabiliteit — en formuleer welke timingbeslissing je voortaan anders neemt.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Noem een recente situatie waarin je timing boven maximale kwaliteit koos: was dat achteraf de juiste trade-off?
',
    8,
    2
  ),
  (
    'persoonlijke-voorkeurspatronen',
    'Jouw persoonlijke voorkeurspatronen',
    'Na deze les kun je voorkeurspatronen analyseren en vertalen naar betere adviezen en voorraadkeuzes.
',
    'Voorkeurspatronen ontstaan uit herhaalde interacties tussen smaak, context en emotie. Wie patronen ziet, kan voorspellen welke keuzes kansrijk zijn zonder in stereotypering te vervallen.

Patronen zijn echter tijdelijk en contextgevoelig. Een gast met vaste voorkeur kan in een andere setting plots ander gedrag tonen. Daarom moet patroonanalyse altijd gecombineerd worden met actuele observatie.

Professioneel gebruik je patronen als startpunt, niet als eindbesluit. Zo combineer je data-intelligentie met menselijke aandacht, wat advieskwaliteit structureel verhoogt.


## Drinkmoment & advies

### Beste moment

Terugkerende gasten, clubevents en langdurige adviesrelaties.

### Waarom dit werkt

Patroonkennis verhoogt relevantie en versnelt goede keuzes.

### Wanneer wachten slimmer is

Combineer historische voorkeuren met een actuele checkvraag per service.

## Pro insight

Voorkeurspatronen zijn commercieel goud wanneer je ze dynamisch gebruikt; statische profielen leiden juist tot voorspelbare missers.',
    '- voorkeurspatronen
- gedragsdata
- contextcorrectie
- adviespredictie
- dynamische segmentatie
',
    'De beste proevers kennen niet alleen wijn, maar ook hun eigen voorkeurspatronen.
',
    '- Voorkeurspatronen verbeteren voorspelkracht.
- Patronen blijven contextgevoelig en tijdelijk.
- Data moet worden getoetst aan actuele observatie.
- Dynamisch patroongebruik verhoogt advieskwaliteit.
',
    '### Opdracht

Maak een overzicht van je favoriete dagtype, je minst favoriete dagtype en je meest gevoelige wijnstijl. Koppel elk patroon aan minimaal twee concrete service- of voorraadbesluiten.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke voorkeurspatronen bij jouw gasten zijn echt voorspellend, en welke blijken vooral ruis?
',
    8,
    3
  ),
  (
    'open-examen-biodynamisch',
    'Open examen',
    'Na deze les kun je in een open examen alle biodynamische competenties integraal toepassen en verdedigen.
',
    'Het open examen toetst integratievermogen: theorie, service, timing, voorraadlogica en sensorische analyse komen samen in onvoorspelbare scenario''s. De nadruk ligt meestal op redenering, niet op reproduceren van losse feiten.

Omdat casussen open zijn, bestaat er vaak meer dan een verdedigbare route. Kandidaten scoren doorgaans hoger wanneer zij aannames expliciteren, alternatieven benoemen en consequent onderbouwen waarom een keuze past.

Professioneel gezien simuleert het examen de werkelijkheid. Succes betekent dat je ook onder onzekerheid stabiel beslist en transparant communiceert over je afwegingen.


## Drinkmoment & advies

### Beste moment

Open examen met integratiecasussen en variabele randvoorwaarden.

### Waarom dit werkt

Succes vraagt compositie van kennis, timing en argumentatie onder onzekerheid.

### Wanneer wachten slimmer is

Werk met transparante redenering: aannames, keuze, alternatief, risico, evaluatie.

## Pro insight

In open examens scoort heldere redenering vaak hoger dan het ene ''juiste'' antwoord; beoordelaars zoeken professioneel denken onder onzekerheid.',
    '- open examen
- integratiecasus
- argumentatielijn
- onzekerheidsbesluit
- professionele verdediging
',
    'Echte expertise begint wanneer je zonder hulpmiddelen dezelfde patronen blijft herkennen.
',
    '- Open examen test integratie onder onzekerheid.
- Meerdere routes kunnen valide zijn.
- Argumentatiekwaliteit weegt zwaar.
- Transparant redeneren is kernvaardigheid.
',
    '### Opdracht

Werk een open examen-casus uit met volledige redenering: aannames, opties, keuze, risico en evaluatie. Laat je uitwerking peer-reviewen en verwerk minimaal twee kritische verbeterpunten.

### Checklist

- Ik formuleerde een hypothese vóór het testen
- Ik noteerde observaties in vaste volgorde (aroma → structuur → lengte)
- Ik koppelde resultaat aan context (dagtype, weer, service)
- Ik evalueerde mijn openings- of adviesbesluit


### Reflectievraag

Welke integratievaardigheid wil je in het open examen expliciet demonstreren om je professionele niveau te bewijzen?
',
    20,
    4
  ),
  (
    'biodynamisch-meesterschap',
    'Biodynamisch meesterschap',
    'Na deze les toon je meesterschap door consistente topkeuzes te maken in complexe, veranderlijke contexten.
',
    'Meesterschap in de biodynamische track betekent consistente kwaliteit over tijd, niet incidentele perfectie. De kern is dat je in wisselende contexten betrouwbaar kunt kiezen, bijsturen en evalueren.

Dit niveau vraagt doorgaans metacognitie: je observeert niet alleen product en gast, maar ook je eigen beslispatronen en bias. Daardoor verbetert je systeem terwijl je werkt.

Professioneel meesterschap is dus een praktijk van permanente kalibratie. Je combineert inhoud, timing en menselijke sensitiviteit tot een stijl die tegelijk scherp en adaptief blijft.


## Drinkmoment & advies

### Beste moment

Capstone-momenten waarin je volledige trackidentiteit zichtbaar wordt.

### Waarom dit werkt

Meesterschap toont zich in herhaalbare topbeslissingen bij veranderlijke context.

### Wanneer wachten slimmer is

Evalueer na elk hoogmoment wat werkte, waarom, en hoe je systeem nog scherper kan.

## Pro insight

Meesterschap herken je aan consistente besluitkwaliteit over maanden, niet aan incidentele topavonden; stuur op procesdiscipline.',
    '- meesterschap
- consistente uitvoering
- metacognitie
- permanente kalibratie
- adaptieve excellentie
',
    'De grootste verzamelaars en sommeliers onderscheiden zich niet alleen door kennis, maar door timingdiscipline.
',
    '- Meesterschap is consistente kwaliteit over tijd.
- Metacognitie versnelt professionele groei.
- Kalibratie blijft permanent proces.
- Topniveau combineert scherpte met adaptiviteit.
',
    '### Opdracht

Maak je **Personal Biodynamic Drinking Manifest** met minimaal tien observaties, vijf conclusies en drie concrete openingsstrategieën. Koppel elk punt aan een voorbeeld uit je voorraad of service.

### Checklist

- Ik noteerde favoriete dagtypes en gevoelige stijlen
- Ik beschreef ideale weersomstandigheden per scenario
- Ik formuleerde drie openingsstrategieën met risico-inschatting
- Ik definieerde hoe ik mijn systeem de komende 90 dagen kalibreer


### Reflectievraag

Welke drie beslissingen uit deze track pas je volgende week toe op topfles, voorraad en gastadvies — en welk risico mitigeer je daarmee?
',
    15,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- Quizvragen
with l as (
  select l.id, m.slug as module_slug, l.slug as lesson_slug
  from academy.lessons l
  join academy.modules m on m.id = l.module_id
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'biodynamic'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 1, 'Waar draait biodynamisch proeven om?', '["Alleen terroir", "Timing en ritme", "Alleen temperatuur", "Alleen druivenras"]', 1, 'Correct: Timing en ritme'),
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 2, 'Wat beïnvloedt volgens deze visie smaak?', '["Dagtypes", "Alleen glaswerk", "Alleen luchtvochtigheid", "Alleen alcohol"]', 0, 'Correct: Dagtypes'),
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 3, 'Wie gebruiken dit?', '["Sommeliers", "Alleen boeren", "Alleen bartenders", "Niemand"]', 0, 'Correct: Sommeliers'),
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 4, 'Je team twijfelt of een topfles nu open moet. Welk eerste signaal gebruik je volgens de les?', '["Alleen de prijs van de fles", "Dagtype plus actuele proefcheck", "Alleen wat gisteren werkte", "Wat de drukste ober zegt"]', 1, 'Correct: Dagtype plus actuele proefcheck'),
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 5, 'Een gast vraagt waarom je biodynamische context noemt. Wat is professioneel?', '["Zeggen dat het altijd zo is", "Uitleggen dat het beslisondersteuning is, geen dogma", "De vraag negeren", "Meteen een duurdere fles adviseren"]', 1, 'Correct: Uitleggen dat het beslisondersteuning is, geen dogma'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 1, 'Wie ontwikkelde de kalender?', '["Maria Thun", "Rudolf Steiner", "Louis Pasteur", "Dom Pérignon"]', 0, 'Correct: Maria Thun'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 2, 'Waar kwam zij vandaan?', '["Duitsland", "Frankrijk", "Italië", "Spanje"]', 0, 'Correct: Duitsland'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 3, 'Wat onderzocht zij?', '["Kosmische ritmes", "Alleen regen", "Alleen temperatuur", "Alleen druiven"]', 0, 'Correct: Kosmische ritmes'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 4, 'Je bouwt een nieuw teamprotocol. Welke stap hoort direct bij Maria Thun-werkstijl?', '["Geen notities maken", "Vaste voorspelling en latere toetsing per dagtype", "Alleen op geheugen vertrouwen", "Slechts een keer per maand proeven"]', 1, 'Correct: Vaste voorspelling en latere toetsing per dagtype'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 5, 'Het weer is instabiel en de app toont Bladdag. Wat doe je eerst?', '["Kalendersignaal combineren met proefcontrole", "Alles annuleren", "Topflessen blind openen", "Temperatuur negeren"]', 0, 'Correct: Kalendersignaal combineren met proefcontrole'),
  ('intro-biodynamic', 'vier-dagtypen', 1, 'Hoeveel dagtypes?', '["Vier", "Drie", "Vijf", "Twee"]', 0, 'Correct: Vier'),
  ('intro-biodynamic', 'vier-dagtypen', 2, 'Welke dag is vaak fruitiger?', '["Vruchtdag", "Bladdag", "Worteldag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('intro-biodynamic', 'vier-dagtypen', 3, 'Welke dag draait om aroma?', '["Bloemdag", "Worteldag", "Vruchtdag", "Bladdag"]', 0, 'Correct: Bloemdag'),
  ('intro-biodynamic', 'vier-dagtypen', 4, 'Je app toont Vruchtdag maar de wijn oogt gesloten. Wat is de beste vervolgstap?', '["Meteen afserveren zonder check", "Hypothese herzien en servicevariabelen testen", "Dagtype verwijderen uit planning", "Alleen op etiketreputatie varen"]', 1, 'Correct: Hypothese herzien en servicevariabelen testen'),
  ('intro-biodynamic', 'vier-dagtypen', 5, 'Voor een topflesavond kies je welke aanpak?', '["Een dagtype aannemen zonder herproef", "Dagtype als lens gebruiken en live valideren", "Geen teambriefing doen", "Altijd dezelfde openingstijd hanteren"]', 1, 'Correct: Dagtype als lens gebruiken en live valideren'),
  ('intro-biodynamic', 'elementen-biodynamiek', 1, 'Wortel hoort bij:', '["Aarde", "Water", "Lucht", "Vuur"]', 0, 'Correct: Aarde'),
  ('intro-biodynamic', 'elementen-biodynamiek', 2, 'Vrucht hoort bij:', '["Vuur", "Aarde", "Water", "Lucht"]', 0, 'Correct: Vuur'),
  ('intro-biodynamic', 'elementen-biodynamiek', 3, 'Bloem hoort bij:', '["Lucht", "Water", "Vuur", "Aarde"]', 0, 'Correct: Lucht'),
  ('intro-biodynamic', 'elementen-biodynamiek', 4, 'In briefing zegt iemand ''lucht-element = altijd beter''. Wat corrigeer je?', '["Dat elementtaal een werkhypothese blijft", "Dat lucht geen rol kan spelen", "Dat alleen prijzen tellen", "Dat je zonder proeven beslist"]', 0, 'Correct: Dat elementtaal een werkhypothese blijft'),
  ('intro-biodynamic', 'elementen-biodynamiek', 5, 'Welke app-notitie helpt bij elementvergelijking over weken?', '["Alleen scorecijfers", "Element + glas + temperatuur + uitkomst", "Alleen weersverwachting", "Alleen gastnaam"]', 1, 'Correct: Element + glas + temperatuur + uitkomst'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 1, 'Waarom gebruiken sommeliers dit?', '["Voor timing", "Voor marketing", "Voor prijs", "Voor etiketten"]', 0, 'Correct: Voor timing'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 2, 'Waarom gebruiken wijnmakers dit?', '["Voor bottelen", "Voor glaswerk", "Voor opslag", "Voor labels"]', 0, 'Correct: Voor bottelen'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 3, 'Wat is het doel?', '["Maximale expressie", "Meer alcohol", "Minder zuur", "Meer suiker"]', 0, 'Correct: Maximale expressie'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 4, 'Een sommelier wil biodynamiek inzetten. Welke professionele KPI past het best?', '["Alleen social media likes", "Retouren en conversie per servicevenster", "Aantal lege dozen", "Muziekvolume in de zaal"]', 1, 'Correct: Retouren en conversie per servicevenster'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 5, 'Bij een mogelijke topfles-opening op app-signaal kies je eerst voor:', '["Direct openen zonder herproef", "Contextcheck met gastdoel en flesconditie", "Alleen margedoel", "Alleen weerbericht"]', 1, 'Correct: Contextcheck met gastdoel en flesconditie'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 1, 'Worteldag hoort bij:', '["Aarde", "Water", "Lucht", "Vuur"]', 0, 'Correct: Aarde'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 2, 'Wat staat centraal?', '["Structuur", "Fruit", "Aroma", "Zoetheid"]', 0, 'Correct: Structuur'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 3, 'Hoe voelt wijn vaak?', '["Strakker", "Zoeter", "Zachter", "Romiger"]', 0, 'Correct: Strakker'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 4, 'Op Worteldag lijkt een rode wijn hard. Welke stap is logisch?', '["Temperatuur licht verhogen en opnieuw proeven", "Meteen uit kaart halen", "Alleen karafduur verdubbelen", "Blind op app-score vertrouwen"]', 0, 'Correct: Temperatuur licht verhogen en opnieuw proeven'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 5, 'Je wilt een topfles openen op Worteldag. Wat weegt het zwaarst?', '["Alleen dagtype", "Dagtype plus actuele glasprestatie", "Alleen gastbudget", "Alleen flesleeftijd"]', 1, 'Correct: Dagtype plus actuele glasprestatie'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 1, 'Bladdag hoort bij:', '["Water", "Aarde", "Vuur", "Lucht"]', 0, 'Correct: Water'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 2, 'Wat wordt versterkt?', '["Vegetaal", "Hout", "Zoet", "Alcohol"]', 0, 'Correct: Vegetaal'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 3, 'Welke stijl past soms goed?', '["Frisse witte wijn", "Vintage Port", "Barleywine", "Cognac"]', 0, 'Correct: Frisse witte wijn'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 4, 'App meldt Bladdag en je tafel wil iets direct drinkbaars. Beste keuze?', '["Soepel profiel adviseren met heldere contextuitleg", "Alleen de duurste optie pushen", "Geen vergelijking aanbieden", "Temperatuurcontrole overslaan"]', 0, 'Correct: Soepel profiel adviseren met heldere contextuitleg'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 5, 'Wanneer wacht je op een topfles ondanks Bladdag?', '["Als de fles nog gesloten en onevenwichtig toont", "Als de gast interesse heeft", "Als de kaart nieuw is", "Als het weekend is"]', 0, 'Correct: Als de fles nog gesloten en onevenwichtig toont'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 1, 'Bloemdagen horen bij:', '["Lucht", "Water", "Vuur", "Aarde"]', 0, 'Correct: Lucht'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 2, 'Wat wordt versterkt?', '["Aroma", "Structuur", "Alcohol", "Zoetheid"]', 0, 'Correct: Aroma'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 3, 'Welke druif past?', '["Riesling", "Cabernet Sauvignon", "Syrah", "Malbec"]', 0, 'Correct: Riesling'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 4, 'Tijdens Bloemdag-service blijft aroma zwak. Wat test je eerst?', '["Glasvorm en serveertemperatuur", "Alleen prijsniveau", "Alleen etiketjaar", "Alleen menukaartvolgorde"]', 0, 'Correct: Glasvorm en serveertemperatuur'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 5, 'Voor een topfles met parfumlaag kies je op app-signaal:', '["Snelle opening zonder briefing", "Gecontroleerde opening met aromavalidatie", "Geen decantering ooit", "Alleen verkoopdruk volgen"]', 1, 'Correct: Gecontroleerde opening met aromavalidatie'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 1, 'Vruchtdag hoort bij:', '["Vuur", "Aarde", "Water", "Lucht"]', 0, 'Correct: Vuur'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 2, 'Wat wordt versterkt?', '["Fruit", "Structuur", "Vegetaal", "Bitterheid"]', 0, 'Correct: Fruit'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 3, 'Welke energie hoort erbij?', '["Expressie", "Rust", "Geslotenheid", "Neutraliteit"]', 0, 'Correct: Expressie'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 4, 'Op Vruchtdag stijgt verkoop van rode wijn sterk. Wat bewaak je extra?', '["Bias door te snelle positieve indruk", "Alleen voorraad van water", "Muziekkeuze", "Alleen dessertkaart"]', 0, 'Correct: Bias door te snelle positieve indruk'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 5, 'Je app geeft gunstig venster voor topfles. Wat doe je?', '["Openen zonder teamafstemming", "Teambriefing plus herproef op tafelmoment", "Alleen manager laten beslissen zonder proeven", "Fles naar morgen verschuiven zonder reden"]', 1, 'Correct: Teambriefing plus herproef op tafelmoment'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 1, 'Wat toont de kalender?', '["Dagtypes", "Alleen temperatuur", "Alleen wijnadvies", "Alleen regen"]', 0, 'Correct: Dagtypes'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 2, 'Kan een dag wisselen?', '["Ja", "Nee", "Alleen in winter", "Alleen bij regen"]', 0, 'Correct: Ja'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 3, 'Wat zijn nodes?', '["Kritische momenten", "Druivenrassen", "Glastypes", "Wijnfouten"]', 0, 'Correct: Kritische momenten'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 4, 'Welke kalenderactie is professioneel voor de weekplanning?', '["Alleen dagtype noteren", "Dagtype koppelen aan bezetting en kelderkeuzes", "Geen evaluatie doen", "Elke dag hetzelfde plan"]', 1, 'Correct: Dagtype koppelen aan bezetting en kelderkeuzes'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 5, 'Je verwacht slecht weer bij een topflesreservering. Wat plan je?', '["Geen alternatief", "Een A/B-scenario met vervangende fles", "Alleen dessertwijn meenemen", "Alle reserveringen annuleren"]', 1, 'Correct: Een A/B-scenario met vervangende fles'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 1, 'Wat wordt versterkt?', '["Structuur", "Zoetheid", "Alcohol", "Fruit"]', 0, 'Correct: Structuur'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 2, 'Fruit is vaak:', '["Geslotener", "Open", "Zoeter", "Rijper"]', 0, 'Correct: Geslotener'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 3, 'Waarvoor is dit nuttig?', '["Structuuranalyse", "Cocktails", "Bierpairing", "Carbonatie"]', 0, 'Correct: Structuuranalyse'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 4, 'Worteldag, rode flight, hoge drukte. Welke stap voorkomt foutadvies?', '["Herproef met vaste structuurchecklist", "Alleen op eerste slok afgaan", "Temperatuur niet meten", "App-notities overslaan"]', 0, 'Correct: Herproef met vaste structuurchecklist'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 5, 'Wanneer open je een topfles op deze dag?', '["Zodra een tafel erom vraagt", "Na bevestiging van balans in proefglas", "Alleen na social media post", "Altijd direct na levering"]', 1, 'Correct: Na bevestiging van balans in proefglas'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 1, 'Wat wordt vaak versterkt?', '["Vegetaal", "Hout", "Suiker", "Oxidatie"]', 0, 'Correct: Vegetaal'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 2, 'Welke stijl reageert sterk?', '["Sauvignon Blanc", "Port", "Stout", "Tawny"]', 0, 'Correct: Sauvignon Blanc'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 3, 'Hoe voelt wijn soms?', '["Groener", "Zoeter", "Dikker", "Ouder"]', 0, 'Correct: Groener'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 4, 'Bladdag geeft zachte indruk, maar wijn mist spanning. Wat doe je?', '["Koeling licht aanscherpen en opnieuw proeven", "Meteen afkeuren", "Alleen karaf gebruiken", "Geen verslag maken"]', 0, 'Correct: Koeling licht aanscherpen en opnieuw proeven'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 5, 'App toont gunstig venster voor topfles wit. Welke check is cruciaal?', '["Alleen dagtype", "Temperatuurband plus glasprestatie", "Alleen voorraadhoogte", "Alleen gastnaam"]', 1, 'Correct: Temperatuurband plus glasprestatie'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 1, 'Wat wordt versterkt?', '["Aroma", "Tannine", "Alcohol", "Bitterheid"]', 0, 'Correct: Aroma'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 2, 'Welke stijl past goed?', '["Riesling", "Barolo", "Vintage Port", "Stout"]', 0, 'Correct: Riesling'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 3, 'Hoe voelt wijn vaak?', '["Verfijnder", "Harder", "Zoeter", "Zwaarder"]', 0, 'Correct: Verfijnder'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 4, 'Bloemdag en fine-dining tafel vragen complex wit. Beste aanpak?', '["Presenteren met aromafocus en korte herproef", "Snel schenken zonder uitleg", "Alleen jonge wijn adviseren", "Kalendersignaal verbergen"]', 0, 'Correct: Presenteren met aromafocus en korte herproef'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 5, 'Wanneer wacht je met topfles op Bloemdag?', '["Als aroma ondanks correct glas gesloten blijft", "Als de gast enthousiast is", "Als menu kort is", "Als er muziek speelt"]', 0, 'Correct: Als aroma ondanks correct glas gesloten blijft'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 1, 'Wat wordt versterkt?', '["Fruit", "Vegetaal", "Bitter", "Zout"]', 0, 'Correct: Fruit'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 2, 'Hoe voelt wijn vaak?', '["Harmonieuzer", "Strenger", "Groener", "Geslotener"]', 0, 'Correct: Harmonieuzer'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 3, 'Welke dag is populair voor topflessen?', '["Vruchtdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Vruchtdag'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 4, 'Vruchtdag en app tonen positief venster. Welke servicefout ligt op de loer?', '["Te snelle upsell zonder tweede check", "Te veel water aanbieden", "Teveel notitiepapier", "Te lang uitleggen over glasproductie"]', 0, 'Correct: Te snelle upsell zonder tweede check'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 5, 'Topflesbesluit op Vruchtdag hoort te steunen op:', '["Alleen verkoopdoel", "Dagtype, proefbalans en gastcontext", "Alleen weerapp", "Alleen openingsprijs"]', 1, 'Correct: Dagtype, proefbalans en gastcontext'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 1, 'Welke dag toont meestal de meeste structuur?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 2, 'Welke dag geeft vaak de meeste fruitexpressie?', '["Vruchtdag", "Worteldag", "Bladdag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 3, 'Welke dag is vaak ideaal voor aromatische finesse?', '["Bloemdag", "Worteldag", "Vruchtdag", "Bladdag"]', 0, 'Correct: Bloemdag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 4, 'Je proefexperiment toont gemengde resultaten. Wat is professioneel?', '["Alle data negeren", "Afwijkingen analyseren op condities en volgorde", "Alleen beste score publiceren", "Teamdiscussie stoppen"]', 1, 'Correct: Afwijkingen analyseren op condities en volgorde'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 5, 'Een topfles meenemen in experiment doe je wanneer:', '["Nooit", "Condities controleerbaar en vergelijkbaar zijn", "Alleen bij lege zaal", "Alleen op Bladdag"]', 1, 'Correct: Condities controleerbaar en vergelijkbaar zijn'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 1, 'Warmte versterkt vaak:', '["Zoetheid", "Bitterheid", "Koolzuur", "Zout"]', 0, 'Correct: Zoetheid'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 2, 'Kou versterkt vaak:', '["Zuren", "Alcohol", "Zoet", "Hout"]', 0, 'Correct: Zuren'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 3, 'Kan temperatuur perceptie veranderen?', '["Ja", "Nee", "Alleen bij bier", "Alleen bij Port"]', 0, 'Correct: Ja'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 4, 'Temperatuur fluctueert in de zaal. Eerste prioriteit?', '["Graden stabiliseren voor je conclusies trekt", "App uitschakelen", "Alleen oudere jaargangen schenken", "Geen notities meer maken"]', 0, 'Correct: Graden stabiliseren voor je conclusies trekt'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 5, 'Topfles op warme avond en gunstig dagtype: wat doe je?', '["Meteen op kamertemperatuur serveren", "Gecontroleerd koelen en gefaseerd herproeven", "Uitsluitend decanteren", "Alleen prijs verhogen"]', 1, 'Correct: Gecontroleerd koelen en gefaseerd herproeven'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 1, 'Hoge luchtdruk geeft vaak:', '["Focus", "Chaos", "Bitterheid", "Zoetheid"]', 0, 'Correct: Focus'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 2, 'Lage druk geeft soms:', '["Geslotenheid", "Open fruit", "Meer alcohol", "Minder zuur"]', 0, 'Correct: Geslotenheid'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 3, 'Wat verandert vaak?', '["Aromatische expressie", "Kleur", "Leeftijd", "Tannine"]', 0, 'Correct: Aromatische expressie'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 4, 'Luchtdruk daalt snel en aroma lijkt diffuus. Beste stap?', '["Korter beluchten en tussentijds valideren", "Alles langer karafen", "Geen verschil noteren", "Alleen mousserend schenken"]', 0, 'Correct: Korter beluchten en tussentijds valideren'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 5, 'App geeft sterk venster maar druktrend is ongunstig. Topfles?', '["Altijd openen", "Alleen openen na proefbevestiging in context", "Nooit openen", "Openen zonder teammelding"]', 1, 'Correct: Alleen openen na proefbevestiging in context'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 1, 'Hoge vochtigheid kan aroma:', '["Dempen", "Versterken", "Oxideren", "Fermenteren"]', 0, 'Correct: Dempen'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 2, 'Lage vochtigheid geeft vaak:', '["Meer spanning", "Meer zoet", "Meer alcohol", "Meer rijping"]', 0, 'Correct: Meer spanning'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 3, 'Wat verandert?', '["Mondgevoel", "Leeftijd", "Kleur", "Glaswerk"]', 0, 'Correct: Mondgevoel'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 4, 'Hoge luchtvochtigheid, aromadetail zakt weg. Welke correctie past?', '["Vers glas en strakke schenkdosis testen", "Alleen koeler zetten", "Alleen op etiket afgaan", "Geen evaluatie doen"]', 0, 'Correct: Vers glas en strakke schenkdosis testen'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 5, 'Je overweegt topflesservice bij vochtige condities. Wat helpt het meest?', '["Geen protocol", "Vooraf proefmoment met condities in logboek", "Alleen prijscommunicatie", "Alleen wijnkaartvolgorde wijzigen"]', 1, 'Correct: Vooraf proefmoment met condities in logboek'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 1, 'Weersomslag betekent:', '["Verandering", "Stabiliteit", "Zon", "Nacht"]', 0, 'Correct: Verandering'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 2, 'Wat gebeurt vaak?', '["Minder focus", "Meer balans", "Meer fruit", "Meer suiker"]', 0, 'Correct: Minder focus'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 3, 'Is dit ideaal voor topflessen?', '["Vaak niet", "Altijd wel", "Alleen rood", "Alleen wit"]', 0, 'Correct: Vaak niet'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 4, 'Weersomslag op komst en een VIP-tafel reserveert topfles. Wat doe je?', '["Alleen op forecast vertrouwen", "A/B-plan met alternatieve fles voorbereiden", "Meteen annuleren", "Geen briefing geven"]', 1, 'Correct: A/B-plan met alternatieve fles voorbereiden'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 5, 'In de app lijkt het venster nog goed, maar proefglas twijfelt. Keuze?', '["Toch openen voor de show", "Voorzichtig blijven en alternatief aanbieden", "Gast laten kiezen zonder uitleg", "Alleen manager laten proeven"]', 1, 'Correct: Voorzichtig blijven en alternatief aanbieden'),
  ('weer-biodynamic', 'dynamisch-vs-strategisch-advies', 1, 'Dynamisch advies kijkt naar:', '["Nu", "Over 6 maanden", "Alleen voorraad", "Alleen prijs"]', 0, 'Correct: Nu'),
  ('weer-biodynamic', 'dynamisch-vs-strategisch-advies', 2, 'Strategisch advies kijkt naar:', '["Toekomst", "Alleen vandaag", "Alleen temperatuur", "Alleen druivenras"]', 0, 'Correct: Toekomst'),
  ('weer-biodynamic', 'dynamisch-vs-strategisch-advies', 3, 'Weerdata gaan meestal vooruit:', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('weer-biodynamic', 'dynamisch-vs-strategisch-advies', 4, 'Je moet kiezen tussen direct tafelgeluk en kelderstrategie. Welke vraag helpt?', '["Wat levert vandaag het hoogste fooibedrag", "Wat optimaliseert zowel nu als komende servicevensters", "Wat zegt alleen de app", "Wat kost de fles inkoop"]', 1, 'Correct: Wat optimaliseert zowel nu als komende servicevensters'),
  ('weer-biodynamic', 'dynamisch-vs-strategisch-advies', 5, 'Dynamisch versus strategisch advies in praktijk bij topfles betekent:', '["Altijd dynamisch handelen", "Contextgewogen keuze met expliciete verantwoording", "Altijd strategisch wachten", "Geen evaluatie achteraf"]', 1, 'Correct: Contextgewogen keuze met expliciete verantwoording'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 1, 'Beste dag voor open fruit?', '["Vruchtdag", "Worteldag", "Bladdag", "Willekeurig"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 2, 'Welke dag toont structuur?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 3, 'Bloemdagen versterken:', '["Geur", "Alcohol", "Zoet", "Bitter"]', 0, 'Correct: Geur'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 4, 'Rode wijn op structuurdag toont harde tannine. Wat is beste route?', '["Fles afserveren zonder check", "Decantering en temperatuur finetunen, dan herproeven", "Alleen op vintage vertrouwen", "Alleen op gastverwachting sturen"]', 1, 'Correct: Decantering en temperatuur finetunen, dan herproeven'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 5, 'Wanneer is topfles rood verantwoord bij sterk app-signaal?', '["Zodra omzetdoel hoog is", "Als stijlcluster en proefbalans beide kloppen", "Alleen op vrijdag", "Alleen met foodpairing"]', 1, 'Correct: Als stijlcluster en proefbalans beide kloppen'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 1, 'Beste dag voor finesse?', '["Bloemdag", "Worteldag", "Bladdag", "Vruchtdag"]', 0, 'Correct: Bloemdag'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 2, 'Vruchtdag versterkt:', '["Fruit", "Bitter", "Hout", "Zout"]', 0, 'Correct: Fruit'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 3, 'Bladdag geeft vaak:', '["Groenheid", "Zoet", "Rook", "Rijping"]', 0, 'Correct: Groenheid'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 4, 'Witte wijn lijkt vlak op een gunstige dag. Wat controleer je eerst?', '["Temperatuurband en glasselectie", "Alleen druivenras", "Alleen wijnkaartpositie", "Alleen margedoel"]', 0, 'Correct: Temperatuurband en glasselectie'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 5, 'Topfles wit bij wisselweer en app-signaal: welke keuze is professioneel?', '["Direct openen zonder proef", "Gefaseerd openen met realtime validatie", "Nooit openen", "Alleen halve fles schenken"]', 1, 'Correct: Gefaseerd openen met realtime validatie'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 1, 'Beste dag voor rosé?', '["Vruchtdag", "Worteldag", "Willekeurig", "Nacht"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 2, 'Bloemdag geeft vaak:', '["Finesse", "Meer tannine", "Meer alcohol", "Meer hout"]', 0, 'Correct: Finesse'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 3, 'Worteldag maakt rosé soms:', '["Strakker", "Zoeter", "Ouder", "Zwaarder"]', 0, 'Correct: Strakker'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 4, 'Rose-service op druk terras, dagtype oogt gunstig. Waar let je op?', '["Alleen snelheid van schenken", "Doel van het moment: aperitief of gastronomisch", "Alleen kleurintensiteit", "Alleen prijsrange"]', 1, 'Correct: Doel van het moment: aperitief of gastronomisch'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 5, 'Een tafel vraagt om je beste rose-topfles. Welke volgorde klopt?', '["Meteen openen, dan uitleg", "Contextcheck, proefcheck, daarna opening", "Eerst dessert aanbevelen", "Alleen app-score tonen"]', 1, 'Correct: Contextcheck, proefcheck, daarna opening'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 1, 'Beste dag voor finesse?', '["Bloemdag", "Worteldag", "Bladdag", "Willekeurig"]', 0, 'Correct: Bloemdag'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 2, 'Vruchtdag geeft:', '["Openheid", "Bitterheid", "Zout", "Hout"]', 0, 'Correct: Openheid'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 3, 'Worteldag toont meer:', '["Structuur", "Zoet", "Fruit", "Schuim"]', 0, 'Correct: Structuur'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 4, 'Scenario: zaterdag 12:30, zonnig terras, zilt lunchgerecht, groep wil fris starten.', '["Zware houtgerijpte mousserende wijn op 12C", "Slanke brut-stijl met hoge spanning op 8-9C", "Zoete stille dessertwijn", "Rode krachtwijn op kamertemperatuur"]', 1, 'Correct: Slanke brut-stijl met hoge spanning op 8-9C'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 5, 'Scenario: zelfde groep bestelt tweede ronde en eet nu rijkere gerechtjes met boter.', '["Meteen stoppen met mousserend", "Opschalen naar iets meer textuur en rijpere autolyse", "Terug naar water zonder uitleg", "Alles op exact dezelfde schenking houden"]', 1, 'Correct: Opschalen naar iets meer textuur en rijpere autolyse'),
  ('stijlen-biodynamic', 'port-per-dagtype', 1, 'Vruchtdag geeft vaak:', '["Harmonie", "Scherpte", "Bitter", "Vegetaal"]', 0, 'Correct: Harmonie'),
  ('stijlen-biodynamic', 'port-per-dagtype', 2, 'Worteldag toont vaak:', '["Structuur", "Fruit", "Zoet", "Mousse"]', 0, 'Correct: Structuur'),
  ('stijlen-biodynamic', 'port-per-dagtype', 3, 'Vintage Port profiteert vaak van:', '["Vruchtdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'port-per-dagtype', 4, 'Scenario: gast wil overdag Port maar zegt "niet te zwaar, ik moet nog door".', '["Vintage in groot glas", "White Port (evt. met tonic) in gecontroleerde serveermaat", "Tawny 40 Years op 18C", "LBV in dubbele portie"]', 1, 'Correct: White Port (evt. met tonic) in gecontroleerde serveermaat'),
  ('stijlen-biodynamic', 'port-per-dagtype', 5, 'Scenario: na diner vraagt dezelfde gast om meer diepte zonder plakkerigheid.', '["Gerichte stap naar LBV of jonge Tawny in kleine schenking", "Zoetste optie op de kaart in groot volume", "Alleen koffie, geen alternatief", "Blend alles in een cocktail"]', 0, 'Correct: Gerichte stap naar LBV of jonge Tawny in kleine schenking'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 1, 'Welke dag geeft vaak opener hopfruit?', '["Vruchtdag", "Worteldag", "Bladdag", "Nacht"]', 0, 'Correct: Vruchtdag'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 2, 'Worteldagen versterken vaak:', '["Bitterheid", "Zoetheid", "Alcohol", "Schuim"]', 0, 'Correct: Bitterheid'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 3, 'Bloemdagen geven vaak:', '["Elegantie", "Meer body", "Meer bitter", "Meer zuur"]', 0, 'Correct: Elegantie'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 4, 'Scenario: lunchservice met vettige streetfood, gasten willen frisheid en tempo.', '["Strak, koolzuurrijk bier met matige body", "Zware barleywine als eerste glas", "Laag-koolzuur dessertstijl", "Warm geserveerde quadrupel"]', 0, 'Correct: Strak, koolzuurrijk bier met matige body'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 5, 'Scenario: avondshift, zelfde tafel wil langer tafelen met comfortfood.', '["Niets, lunchprofiel altijd herhalen", "Gecontroleerd opschalen naar meer moutdiepte en aromatische lengte", "Alleen shots serveren", "Koolzuur volledig vermijden"]', 1, 'Correct: Gecontroleerd opschalen naar meer moutdiepte en aromatische lengte'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 1, 'Waarom is 0.0 gevoeliger?', '["Minder alcoholstructuur", "Meer suiker", "Meer zuur", "Meer koolzuur"]', 0, 'Correct: Minder alcoholstructuur'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 2, 'Vruchtdag helpt vaak:', '["Balans verbeteren", "Bitterheid verhogen", "Schuim verlagen", "Alcohol verhogen"]', 0, 'Correct: Balans verbeteren'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 3, 'Worteldag kan geven:', '["Hardere bitterheid", "Meer fruit", "Meer mousse", "Meer zuur"]', 0, 'Correct: Hardere bitterheid'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 4, 'Scenario: zakelijke lunch, team wil scherp blijven maar wel volwaardige smaak.', '["Alleen water aanbieden", "Kwalitatief 0.0-profiel met stijltoelichting", "Hoog alcoholpercentage omdat \"meer smaak\"", "Random keuze zonder contextvraag"]', 1, 'Correct: Kwalitatief 0.0-profiel met stijltoelichting'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 5, 'Scenario: gast twijfelt en noemt 0.0 "minderwaardig".', '["Verdedigend reageren", "Koppelen aan stijlkenmerken en food-match zoals bij premium bier", "Meteen prijs verlagen", "Thema negeren"]', 1, 'Correct: Koppelen aan stijlkenmerken en food-match zoals bij premium bier'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 1, 'Wat reageert vooral?', '["Ingrediënten", "Glaswerk", "IJs", "Leeftijd"]', 0, 'Correct: Ingrediënten'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 2, 'Vruchtdag versterkt vaak:', '["Fruit", "Bitter", "Zout", "Water"]', 0, 'Correct: Fruit'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 3, 'Bloemdagen versterken vaak:', '["Botanicals", "Tannine", "Schuim", "Hout"]', 0, 'Correct: Botanicals'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 4, 'Scenario: vroege aperitief met groot gezelschap en lang event.', '["Start met zwaar spirit-forward profiel", "Start met lagere ABV en heldere balans", "Alleen zoete cocktails serveren", "Iedereen hetzelfde zonder vraag"]', 1, 'Correct: Start met lagere ABV en heldere balans'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 5, 'Scenario: midden van de avond daalt energie, tafel wil meer diepte.', '["Gecontroleerd verhogen in complexiteit zonder tempo te verliezen", "Direct hoogste alcohol voor iedereen", "Stoppen met service", "Alle bitters schrappen"]', 0, 'Correct: Gecontroleerd verhogen in complexiteit zonder tempo te verliezen'),
  ('cross-biodynamic', 'barrel-aged-dranken', 1, 'Vatrijping geeft:', '["Complexiteit", "Koolzuur", "Minder alcohol", "Schuim"]', 0, 'Correct: Complexiteit'),
  ('cross-biodynamic', 'barrel-aged-dranken', 2, 'Vruchtdagen geven vaak:', '["Openheid", "Bitter", "Vegetaal", "Droogte"]', 0, 'Correct: Openheid'),
  ('cross-biodynamic', 'barrel-aged-dranken', 3, 'Worteldagen tonen vaak:', '["Structuur", "Fruit", "Zoet", "Mousse"]', 0, 'Correct: Structuur'),
  ('cross-biodynamic', 'barrel-aged-dranken', 4, 'Scenario: educatieve avond met barrel-aged flight, deelnemers raken snel vermoeid.', '["Portiegrootte en pauzeritme", "Alleen glaswerk wisselen", "Muziek harder zetten", "Extra suiker serveren"]', 0, 'Correct: Portiegrootte en pauzeritme'),
  ('cross-biodynamic', 'barrel-aged-dranken', 5, 'Scenario: gast wil barrel-aged om 14:00 tijdens werkdag.', '["Altijd weigeren", "Klein proefvolume met duidelijke context en verwachting", "Dubbele schenking zonder uitleg", "Vervangen door willekeurige cocktail"]', 1, 'Correct: Klein proefvolume met duidelijke context en verwachting'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 1, 'Waarom is alcoholvrij gevoeliger?', '["Minder structuur", "Meer suiker", "Meer zuur", "Meer koolzuur"]', 0, 'Correct: Minder structuur'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 2, 'Vruchtdag helpt vaak:', '["Fruit openen", "Bitterheid verhogen", "Alcohol verhogen", "Zout verhogen"]', 0, 'Correct: Fruit openen'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 3, 'Bloemdagen helpen bij:', '["Aroma", "Tannine", "Koolzuur", "Rijping"]', 0, 'Correct: Aroma'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 4, 'Scenario: mixed groep met bestuurders en niet-drinkers wil premium beleving.', '["Een enkele zoete alcoholvrije optie", "Meerdere alcoholvrije profielen met verschillende functies", "Alleen frisdrank", "Geen alcoholvrij omdat \"niet nodig\""]', 1, 'Correct: Meerdere alcoholvrije profielen met verschillende functies'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 5, 'Scenario: gast vraagt alcoholvrij bij gastronomisch gerecht met hoge intensiteit.', '["Water als enige optie", "Alcoholvrije optie met voldoende textuur en lengte", "Laagste prijsproduct ongeacht stijl", "Serveer niets bij het gerecht"]', 1, 'Correct: Alcoholvrije optie met voldoende textuur en lengte'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 1, 'Welke factor is belangrijk?', '["Leeftijd", "Alleen prijs", "Alleen label", "Alleen kleur"]', 0, 'Correct: Leeftijd'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 2, 'Welke wijnen vragen meer precisie?', '["Oude wijnen", "Jonge wijnen", "Rosé", "0.0 bier"]', 0, 'Correct: Oude wijnen'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 3, 'Wat verhoogt kwaliteit?', '["Timing", "Koelkast", "Etiket", "Glasdikte"]', 0, 'Correct: Timing'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 4, 'Scenario: twee topflessen beschikbaar, tafel is informeel en budgetbewust.', '["Hoogste score op internet", "Match met context, doel en gezelschap", "Oudste fles altijd eerst", "Etiket met meeste prestige"]', 1, 'Correct: Match met context, doel en gezelschap'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 5, 'Scenario: viering met klein gezelschap en rustig tempo.', '["Te dure fles kiezen", "Fles kiezen zonder rekening met servicemoment en drinkdoel", "Vooraf koelen", "Korte toelichting geven"]', 1, 'Correct: Fles kiezen zonder rekening met servicemoment en drinkdoel'),
  ('voorraad-biodynamic', 'openen-of-wachten', 1, 'Waarom wachten?', '["Betere omstandigheden", "Minder alcohol", "Meer suiker", "Sneller rijpen"]', 0, 'Correct: Betere omstandigheden'),
  ('voorraad-biodynamic', 'openen-of-wachten', 2, 'Wat kan slecht zijn?', '["Weersomslag", "Zon", "Ochtend", "Glaswerk"]', 0, 'Correct: Weersomslag'),
  ('voorraad-biodynamic', 'openen-of-wachten', 3, 'Geduld is onderdeel van:', '["Strategie", "Marketing", "Productie", "Etiket"]', 0, 'Correct: Strategie'),
  ('voorraad-biodynamic', 'openen-of-wachten', 4, 'Scenario: premiumfles opent gesloten en hoekig.', '["Meteen uitschenken zonder check", "Tijdgestuurde herproefmomenten plannen en observeren", "Fles warm zetten naast warmtebron", "Alles overhevelen en vergeten"]', 1, 'Correct: Tijdgestuurde herproefmomenten plannen en observeren'),
  ('voorraad-biodynamic', 'openen-of-wachten', 5, 'Scenario: tafel vraagt waarom je wacht met serveren.', '["\"Dat doen we altijd.\"", "Korte toelichting over zuurstofontwikkeling en kwaliteitswinst", "Geen uitleg nodig", "Verwijzen naar prijskaart"]', 1, 'Correct: Korte toelichting over zuurstofontwikkeling en kwaliteitswinst'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 1, 'Wat is een drinkvenster?', '["Optimale drinkfase", "Openingstijd", "Glaskeuze", "Koelkasttijd"]', 0, 'Correct: Optimale drinkfase'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 2, 'Wat voeg je toe met biodynamiek?', '["Timing", "Alcohol", "Suiker", "Leeftijd"]', 0, 'Correct: Timing'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 3, 'Peak drinking betekent:', '["Optimale combinatie", "Jong drinken", "Te laat drinken", "Sneller drinken"]', 0, 'Correct: Optimale combinatie'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 4, 'Scenario: je moet beslissen of een fles binnen of buiten venster valt.', '["Exacte jaardatum als absolute waarheid", "Vensterzone combineren met opslag- en proefsignalen", "Alleen kleur beoordelen", "Beslissen op etiketontwerp"]', 1, 'Correct: Vensterzone combineren met opslag- en proefsignalen'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 5, 'Scenario: twee identieke flessen presteren verschillend.', '["Drinkvensters werken nooit", "Flesvariatie en bewaarhistorie kunnen verschillen geven", "Alleen glaswerk is oorzaak", "Altijd serverfout"]', 1, 'Correct: Flesvariatie en bewaarhistorie kunnen verschillen geven'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 1, 'Strategische planning combineert:', '["Alles", "Alleen weer", "Alleen dagtype", "Alleen leeftijd"]', 0, 'Correct: Alles'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 2, 'Wat helpt plannen?', '["Kalender", "Etiket", "Kleur", "Kurk"]', 0, 'Correct: Kalender'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 3, 'Wat kun je vermijden?', '["Verkeerde opening", "Goede pairing", "Goed glas", "Goed weer"]', 0, 'Correct: Verkeerde opening'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 4, 'Scenario: kelder vol prestigeflessen maar lage rotatie.', '["Nog meer prestige inkopen", "Rotatie- en allocatieplan opstellen per segment", "Prijzen willekeurig verhogen", "Data negeren"]', 1, 'Correct: Rotatie- en allocatieplan opstellen per segment'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 5, 'Scenario: je verwacht seizoenspiek over zes maanden.', '["Last-minute beslissen", "Instroom, uitstroom en vervanging vooraf modelleren", "Alleen op gevoel inkopen", "Topvoorraad bevriezen"]', 1, 'Correct: Instroom, uitstroom en vervanging vooraf modelleren'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 1, 'Strategische planning combineert:', '["Alles", "Alleen weer", "Alleen dagtype", "Alleen leeftijd"]', 0, 'Correct: Alles'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 2, 'Weerdata gaan meestal vooruit:', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 3, 'Daarna gebruik je:', '["Kalenderlogica", "Alleen temperatuur", "Alleen prijs", "Alleen kleur"]', 0, 'Correct: Kalenderlogica'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 4, 'Scenario: reservekelder is sterk geconcentreerd in een regio.', '["Te veel variatie", "Concentratierisico bij markt- of vraagschokken", "Te veel liquiditeit", "Overmatig educatief potentieel"]', 1, 'Correct: Concentratierisico bij markt- of vraagschokken'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 5, 'Scenario: team wil reservefles vrijgeven bij drukke service.', '["Spontane beslissing ter plekke", "Vooraf gedefinieerde releasecriteria", "Toeval en intuïtie", "Alleen toestemming van gasten"]', 1, 'Correct: Vooraf gedefinieerde releasecriteria'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 1, 'Waarom noteren?', '["Patronen herkennen", "Alleen bewaren", "Alleen delen", "Alleen scoren"]', 0, 'Correct: Patronen herkennen'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 2, 'Wat noteer je?', '["Dagtype", "Alleen kleur", "Alleen prijs", "Alleen glas"]', 0, 'Correct: Dagtype'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 3, 'Wat bouwt data?', '["Inzicht", "Alcohol", "Leeftijd", "Zuur"]', 0, 'Correct: Inzicht'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 4, 'Scenario: vertical tasting levert veel discussie maar weinig bruikbare output.', '["Nog meer jaargangen toevoegen", "Strakker protocol met neutrale notatie en vaste volgorde", "Blind vervangen door vrije impressies", "Minder pauzes inbouwen"]', 1, 'Correct: Strakker protocol met neutrale notatie en vaste volgorde'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 5, 'Scenario: na tasting wil je directe operationele waarde.', '["Alleen sociale media posten", "Inzichten vertalen naar aankoop- en servicebeslissingen", "Notities wegleggen zonder vervolg", "Slechts een winnaar benoemen"]', 1, 'Correct: Inzichten vertalen naar aankoop- en servicebeslissingen'),
  ('intelligence-biodynamic', 'blindproeven-timing', 1, 'Wanneer ontstaan patronen?', '["Na herhaling", "Na één fles", "Nooit", "Alleen bij topwijn"]', 0, 'Correct: Na herhaling'),
  ('intelligence-biodynamic', 'blindproeven-timing', 2, 'Zijn patronen universeel?', '["Nee", "Ja", "Altijd", "Alleen bij experts"]', 0, 'Correct: Nee'),
  ('intelligence-biodynamic', 'blindproeven-timing', 3, 'Wat geven patronen?', '["Voorspelbaarheid", "Meer alcohol", "Meer suiker", "Minder geur"]', 0, 'Correct: Voorspelbaarheid'),
  ('intelligence-biodynamic', 'blindproeven-timing', 4, 'Scenario: team scoort blind lager onder tijdsdruk dan in training.', '["Duurdere glazen", "Getrainde timingcycli naast sensorische kennis", "Langere muziekpauzes", "Meer willekeurige samples"]', 1, 'Correct: Getrainde timingcycli naast sensorische kennis'),
  ('intelligence-biodynamic', 'blindproeven-timing', 5, 'Scenario: proever blijft te lang hangen in neusanalyse.', '["Stap overslaan", "Tijdsgrens per fase en door naar volgende observatie", "Onbeperkte tijd toestaan", "Meteen stijl roepen zonder proeven"]', 1, 'Correct: Tijdsgrens per fase en door naar volgende observatie'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 1, 'Is smaak persoonlijk?', '["Ja", "Nee", "Altijd gelijk", "Alleen bij experts"]', 0, 'Correct: Ja'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 2, 'Wat bouw je?', '["Profiel", "Voorraad", "Alcohol", "Leeftijd"]', 0, 'Correct: Profiel'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 3, 'Wat helpt hierbij?', '["Data", "Willekeur", "Snel drinken", "Alleen ervaring"]', 0, 'Correct: Data'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 4, 'Scenario: je overweegt magnum voor groot diner.', '["Alleen statuswaarde", "Logistiek: koeling, schenksnelheid en restvolume", "Kleur van etiket", "Hoogte van de tafel"]', 1, 'Correct: Logistiek: koeling, schenksnelheid en restvolume'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 5, 'Scenario: kleine tafel met laag verbruikstempo.', '["Groot formaat forceren", "Kleiner formaat kiezen om kwaliteit na openen te borgen", "Alles vooraf openen", "Geen temperatuurcontrole"]', 1, 'Correct: Kleiner formaat kiezen om kwaliteit na openen te borgen'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 1, 'Wat versterkt data?', '["Intuïtie", "Alcohol", "Leeftijd", "Zoetheid"]', 0, 'Correct: Intuïtie'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 2, 'Wat maakt data?', '["Meetbaar", "Onzichtbaar", "Willekeurig", "Emotioneel"]', 0, 'Correct: Meetbaar'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 3, 'Wat bouwt dit?', '["Slimmere keuzes", "Meer voorraad", "Meer suiker", "Meer alcohol"]', 0, 'Correct: Slimmere keuzes'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 4, 'Scenario: lang menu start om 16:00 en eindigt laat.', '["Meteen zwaar beginnen", "Frisse start, middencomplexiteit, gecontroleerde diepte op einde", "Constant zelfde intensiteit", "Alleen zoete pairings"]', 1, 'Correct: Frisse start, middencomplexiteit, gecontroleerde diepte op einde'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 5, 'Scenario: gast raakt halverwege verzadigd.', '["Intensiteit verhogen", "Terugschakelen naar lichtere, energieke structuur", "Pairing stopzetten zonder alternatief", "Alleen water serveren"]', 1, 'Correct: Terugschakelen naar lichtere, energieke structuur'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 1, 'Drinkintelligentie is:', '["Alles samen", "Alleen kennis", "Alleen data", "Alleen smaak"]', 0, 'Correct: Alles samen'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 2, 'Wat maakt timing sterker?', '["Observatie", "Snelheid", "Leeftijd", "Prijs"]', 0, 'Correct: Observatie'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 3, 'Wat bouw je?', '["Eigen systeem", "Nieuwe wijn", "Nieuwe kalender", "Nieuwe druif"]', 0, 'Correct: Eigen systeem'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 4, 'Scenario: teamleden maken verschillende keuzes bij vergelijkbare tafels.', '["Meer individuele vrijheid", "Gemeenschappelijke beslisvolgorde met contextruimte", "Hogere prijzen", "Langere menukaart"]', 1, 'Correct: Gemeenschappelijke beslisvolgorde met contextruimte'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 5, 'Scenario: je eigen systeem werkt niet bij uitzonderingen.', '["Meer rigiditeit toevoegen", "Feedbacklus inbouwen en regels periodiek herijken", "Systeem schrappen zonder vervanging", "Alleen intuities volgen"]', 1, 'Correct: Feedbacklus inbouwen en regels periodiek herijken'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 1, 'Wat kenmerkt een perfect drinkmoment?', '["Meerdere factoren vallen samen", "Alleen een hoge prijs", "Willekeurige timing", "Alleen het juiste glas"]', 0, 'Correct: Meerdere factoren vallen samen'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 2, 'Welke factor hoort niet bij een topmoment?', '["Alleen etiketkleur", "Drinkvenster", "Dagtype", "Weersstabiliteit"]', 0, 'Correct: Alleen etiketkleur'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 3, 'Waarom is context belangrijk?', '["Expressie hangt ook van moment af", "Wijn verandert nooit", "Alleen pairing telt", "Kalender is optioneel"]', 0, 'Correct: Expressie hangt ook van moment af'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 4, 'Scenario: topfles, maar tafel is gehaast en afgeleid.', '["Productkwaliteit", "Context-mismatch tussen tempo en servicekeuze", "Glasinhoud", "Menukaarttaal"]', 1, 'Correct: Context-mismatch tussen tempo en servicekeuze'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 5, 'Scenario: vlak voor serveren verandert stemming aan tafel.', '["Plan negeren", "Microbijsturen op tempo, toelichting en eventueel stijlrichting", "Service uitstellen zonder uitleg", "Alles annuleren"]', 1, 'Correct: Microbijsturen op tempo, toelichting en eventueel stijlrichting'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 1, 'Wat doet timing met kwaliteit?', '["Ontsluit potentieel", "Vervangt kwaliteit", "Maakt wijn zoeter", "Verlaagt altijd tannine"]', 0, 'Correct: Ontsluit potentieel'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 2, 'Wat kan op een minder gunstig moment gebeuren?', '["Topwijn presteert onder verwachting", "Wijn wordt permanent slecht", "Alcohol verdwijnt", "Kurk breekt altijd"]', 0, 'Correct: Topwijn presteert onder verwachting'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 3, 'Wat is de juiste houding?', '["Kwaliteit en moment zijn verbonden", "Alleen prijs telt", "Timing is onbelangrijk", "Alleen blindproeven telt"]', 0, 'Correct: Kwaliteit en moment zijn verbonden'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 4, 'Scenario: wijn opent nog gesloten, maar hoofdgerecht staat klaar.', '["Altijd wachten tot maximale expressie", "Trade-off expliciet maken en keuze afstemmen op tafelmoment", "Alleen keuken laten beslissen", "Fles direct vervangen zonder reden"]', 1, 'Correct: Trade-off expliciet maken en keuze afstemmen op tafelmoment'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 5, 'Scenario: team discussieert over snelheid versus kwaliteit.', '["Onuitgesproken laten", "Prioriteit helder benoemen en consequent uitvoeren", "Besluit per medewerker laten wisselen", "Alleen op senioriteit varen"]', 1, 'Correct: Prioriteit helder benoemen en consequent uitvoeren'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 1, 'Waarom verschillen voorkeuren per proever?', '["Smaak en dagtype-respons zijn persoonlijk", "Iedereen proeft identiek", "Alleen prijs verschilt", "Kalender is voor iedereen gelijk"]', 0, 'Correct: Smaak en dagtype-respons zijn persoonlijk'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 2, 'Wat helpt bij persoonlijke stijl?', '["Eigen patronen herkennen", "Alleen scores van anderen volgen", "Nooit vergelijken", "Dagtypes vermijden"]', 0, 'Correct: Eigen patronen herkennen'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 3, 'Wat noteer je in de praktijkopdracht?', '["Favoriete en minst favoriete dagtype", "Alleen kurkleverancier", "Alleen serveertemperatuur", "Alleen winkelprijs"]', 0, 'Correct: Favoriete en minst favoriete dagtype'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 4, 'Scenario: terugkerende gast bestelt onverwacht buiten eerder patroon.', '["Oud patroon afdwingen", "Huidige context checken en patroon als hypothese gebruiken", "Advies volledig stoppen", "Alleen goedkoopste optie noemen"]', 1, 'Correct: Huidige context checken en patroon als hypothese gebruiken'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 5, 'Scenario: je wilt patroondata inzetten voor beter advies.', '["Data statisch opslaan zonder update", "Patronen periodiek herijken met recente interacties", "Alleen leeftijd registreren", "Patroon gelijkstellen aan identiteit"]', 1, 'Correct: Patronen periodiek herijken met recente interacties'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 1, 'Wie ontwikkelde de biodynamische kalender?', '["Maria Thun", "Rudolf Steiner", "Louis Pasteur", "Dom Pérignon"]', 0, 'Correct: Maria Thun'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 2, 'Welke dag hoort bij vuur?', '["Vruchtdag", "Bladdag", "Bloemdag", "Worteldag"]', 0, 'Correct: Vruchtdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 3, 'Welke dag hoort bij aarde?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 4, 'Scenario: open examen casus geeft meerdere verdedigbare routes.', '["Snelste antwoord zonder uitleg", "Transparante redenering met aannames, keuze en alternatief", "Alleen memoriseerde theorie reproduceren", "Casus herhalen zonder besluit"]', 1, 'Correct: Transparante redenering met aannames, keuze en alternatief'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 5, 'Scenario: beoordelaar bevraagt je keuze kritisch.', '["Verdedigen met autoriteit", "Onderbouwen met context, risico en evaluatieplan", "Antwoord terugtrekken zonder argument", "Verwijzen naar persoonlijke smaak"]', 1, 'Correct: Onderbouwen met context, risico en evaluatieplan'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 6, 'Wat doet hoge luchtdruk vaak?', '["Meer focus geven", "Minder balans", "Meer alcohol", "Meer suiker"]', 0, 'Correct: Meer focus geven'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 7, 'Wat doet lage luchtdruk soms?', '["Geslotenheid geven", "Meer fruit geven", "Meer mousse geven", "Meer suiker geven"]', 0, 'Correct: Geslotenheid geven'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 8, 'Wat beïnvloedt luchtvochtigheid?', '["Aroma en mondgevoel", "Leeftijd", "Alcoholpercentage", "Druivenras"]', 0, 'Correct: Aroma en mondgevoel'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 9, 'Welke dag is vaak ideaal voor Champagne?', '["Bloemdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Bloemdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 10, 'Welke dag is vaak ideaal voor Vintage Port?', '["Vruchtdag", "Bladdag", "Worteldag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 11, 'Wat betekent Dynamisch advies?', '["Drinkadvies voor nu", "Drinkadvies over 6 maanden", "Alleen voorraadbeheer", "Alleen weer"]', 0, 'Correct: Drinkadvies voor nu'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 12, 'Wat betekent Strategisch advies?', '["Lange-termijnplanning", "Alleen vandaag", "Alleen pairing", "Alleen weer"]', 0, 'Correct: Lange-termijnplanning'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 13, 'Hoe ver gaat weerdata meestal?', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 14, 'Wat gebruik je daarna?', '["Biodynamische kalender", "Alleen temperatuur", "Alleen voorraad", "Alleen prijs"]', 0, 'Correct: Biodynamische kalender'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 15, 'Wat bouw je met proefnotities?', '["Patronen", "Alcohol", "Leeftijd", "Kleur"]', 0, 'Correct: Patronen'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 16, 'Wat helpt patronen herkennen?', '["Herhaling", "Willekeur", "Snelheid", "Leeftijd"]', 0, 'Correct: Herhaling'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 17, 'Wat bouw je met data?', '["Persoonlijk smaakprofiel", "Nieuwe wijn", "Nieuwe kalender", "Nieuwe druif"]', 0, 'Correct: Persoonlijk smaakprofiel'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 18, 'Wat is peak drinking?', '["Optimale combinatie van rijpheid en timing", "Jong drinken", "Te laat drinken", "Blind proeven"]', 0, 'Correct: Optimale combinatie van rijpheid en timing'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 19, 'Wat is de kern van drinkintelligentie?', '["Waarom nu?", "Hoe duur?", "Hoe oud?", "Hoeveel alcohol?"]', 0, 'Correct: Waarom nu?'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 20, 'Wat is het hoogste doel van biodynamisch proeven?', '["Optimale timing en expressie", "Meer alcohol", "Meer suiker", "Sneller drinken"]', 0, 'Correct: Optimale timing en expressie'),
  ('examen-biodynamic', 'biodynamisch-meesterschap', 1, 'Wat definieert biodynamisch meesterschap het best?', '["Altijd hetzelfde dagtype volgen", "Consistente besluitkwaliteit onder veranderende context", "Alleen dure flessen openen", "Volledig intuïtief werken zonder notities"]', 1, 'Correct: Consistente besluitkwaliteit onder veranderende context'),
  ('examen-biodynamic', 'biodynamisch-meesterschap', 2, 'Welke gewoonte ondersteunt permanente kalibratie?', '["Eenmalig systeem ontwerpen en nooit wijzigen", "Periodieke review van beslissingen met meetbare indicatoren", "Alleen blindproeven op feestdagen", "Voorraad nooit roteren"]', 1, 'Correct: Periodieke review van beslissingen met meetbare indicatoren'),
  ('examen-biodynamic', 'biodynamisch-meesterschap', 3, 'Wat hoort in een capstone-manifest?', '["Alleen favoriete wijnen", "Observaties, conclusies en concrete openingsstrategieën", "Lijst met prijzen", "Alleen app-screenshots"]', 1, 'Correct: Observaties, conclusies en concrete openingsstrategieën'),
  ('examen-biodynamic', 'biodynamisch-meesterschap', 4, 'Scenario: je presteert soms briljant maar niet consequent.', '["Meer toeval", "Reproduceerbaar proces met continue kalibratie", "Hogere prijskaart", "Striktere dresscode"]', 1, 'Correct: Reproduceerbaar proces met continue kalibratie'),
  ('examen-biodynamic', 'biodynamisch-meesterschap', 5, 'Scenario: complexe servicecontext verandert voortdurend.', '["Star vasthouden aan eerste keuze", "Scherp beslissen en adaptief bijsturen op nieuwe signalen", "Besluiten uitstellen tot perfectie", "Alleen op eerdere successen vertrouwen"]', 1, 'Correct: Scherp beslissen en adaptief bijsturen op nieuwe signalen')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
