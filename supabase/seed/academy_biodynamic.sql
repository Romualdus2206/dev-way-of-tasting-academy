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
    'Na deze les kun jij uitleggen wat biodynamisch proeven is, waarom timing relevant kan zijn en hoe je observatie centraal zet — zonder het als geloof te framen.
',
    'Biodynamisch proeven is de observatie dat dezelfde wijn zich niet altijd identiek presenteert. Binnen de biodynamische filosofie wordt aangenomen dat natuurlijke ritmes — zoals maanstanden, planetaire cycli en kosmische bewegingen — invloed kunnen hebben op de vitaliteit en expressie van planten, en daarmee indirect op wijn.
In de praktijk betekent dit dat een wijn op de ene dag aromatisch gesloten kan aanvoelen, terwijl dezelfde fles enkele dagen later opener, fruitiger en harmonieuzer overkomt.
Voor sommeliers, wijnmakers en verzamelaars is dit relevant omdat timing daarmee een strategische factor wordt. Niet alleen wat je opent is belangrijk, maar ook wanneer.
Vooral complexe wijnen zoals Bourgogne, Barolo en Vintage Port lijken volgens veel proevers sterk op deze ritmes te reageren. Biodynamisch proeven draait daarom niet om geloof, maar om systematische observatie, vergelijking en patroonherkenning.
',
    '- biodynamic
- timing
- observation
- rhythm
- tasting
',
    'Bij oudere Bourgogne of Vintage Port kiezen ervaren sommeliers vaak bewust een Vruchtdag, omdat aromatische openheid en balans dan doorgaans duidelijker naar voren komen.
',
    '- Smaakbeleving is niet constant; timing kan expressie veranderen
- Biodynamisch proeven = observatie en patroonherkenning, geen geloof
- Complexe wijnen (Bourgogne, Barolo, Vintage Port) lijken gevoelig voor ritme
- In de app: tab Advies helpt beoordelen of vandaag een slim openingsmoment is
',
    '### Opdracht

Kies een fles uit je huidige voorraad die binnen twee jaar op dronk is en noteer:

- fruitintensiteit
- aromatische openheid
- zuurgraad
- structuur
- lengte
Herhaal dit op een ander dagtype.

### Reflectievraag

Welke sensorische verschillen verwacht je tussen vandaag en een Vruchtdag, en hoe zou dat jouw beoordeling veranderen?


---

### Reflectievraag

Welke sensorische verschillen verwacht je tussen vandaag en een Vruchtdag, en hoe zou dat jouw beoordeling veranderen?
',
    8,
    1
  ),
  (
    'maria-thun-oorsprong',
    'Maria Thun en de oorsprong',
    'Na deze les begrijp jij Maria Thuns bijdrage en waarom haar kalender vandaag nog wordt gebruikt om drinkmomenten strategisch te kiezen.
',
    'Maria Thun was een Duitse onderzoekster die tientallen jaren experimenteerde met biodynamische landbouw. Haar werk bouwde voort op de ideeën van Rudolf Steiner en richtte zich op de invloed van kosmische ritmes op plantontwikkeling.
Door jarenlang observaties te vergelijken ontdekte zij patronen waarbij bepaalde dagen gunstiger leken voor specifieke plantdelen: wortel, blad, bloem en vrucht.
Deze observaties vormden de basis van de biodynamische kalender, die vandaag wereldwijd wordt gebruikt door wijnmakers, sommeliers en verzamelaars.
Voor wijnliefhebbers is haar werk relevant omdat het een praktisch hulpmiddel biedt om drinkmomenten bewuster en strategischer te kiezen.
',
    '- maria thun
- calendar
- lunar cycles
- biodynamics
- agriculture
',
    'Veel biodynamische domeinen plannen blends en bottelingen op Vruchtdagen, omdat wijnen dan vaak het meest open en expressief geanalyseerd kunnen worden.
',
    '- Maria Thun was een Duitse onderzoekster die tientallen jaren experimenteerde met biodynamische landbouw
- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
- In de app: In **Advies → vooruitblik** zie je komende Vrucht- en Worteldagen om flessen vooraf te koppelen.
',
    '### Opdracht

Bekijk de actuele biodynamische kalender en markeer:

Koppel drie flessen uit je voorraad aan deze momenten.
- de huidige dag
- de volgende Vruchtdag
- de volgende Worteldag

### Reflectievraag

Welke fles uit jouw collectie zou het meest profiteren van een strategisch gekozen openingsmoment?


---

### Reflectievraag

Welke fles uit jouw collectie zou het meest profiteren van een strategisch gekozen openingsmoment?
',
    8,
    2
  ),
  (
    'vier-dagtypen',
    'De vier dagtypen',
    'Na deze les kun jij de vier dagtypen benoemen, herkennen en hun effect op wijnstructuur en fruit inschatten.
',
    'De biodynamische kalender werkt met vier dagtypen: Wortel, Blad, Bloem en Vrucht. Elk type correspondeert met een element en benadrukt andere eigenschappen in wijn.
Worteldagen leggen doorgaans meer nadruk op structuur, spanning en mineraliteit. Bladdagen versterken vaak vegetale en frisse componenten.
Bloemdagen brengen aroma, finesse en elegantie duidelijker naar voren. Vruchtdagen zorgen meestal voor maximale openheid, fruitexpressie en balans.
Bij een wijn als Barolo kunnen tannines op een Worteldag harder aanvoelen, terwijl dezelfde wijn op een Vruchtdag zachter en toegankelijker overkomt.
Dit maakt dagtypes een krachtig instrument voor vergelijking en beoordeling.
',
    '- root day
- leaf day
- flower day
- fruit day
- energy
',
    'Bij blindproeverijen kan het dagtype soms verklaren waarom dezelfde wijn op verschillende momenten anders scoort.
',
    '- De biodynamische kalender werkt met vier dagtypen: Wortel, Blad, Bloem en Vrucht
- Elk type correspondeert met een element en benadrukt andere eigenschappen in wijn
- Worteldagen leggen doorgaans meer nadruk op structuur, spanning en mineraliteit
',
    '### Opdracht

Proef dezelfde wijn op:

Vergelijk:
- een Worteldag
- een Vruchtdag

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Checklist

- fruit
- tannine
- lengte
- balans
- drinkbaarheid

### Reflectievraag

Welk dagtype geeft jou de meeste informatie over bewaarpotentieel?


---

### Reflectievraag

Welk dagtype geeft jou de meeste informatie over bewaarpotentieel?
',
    8,
    3
  ),
  (
    'elementen-biodynamiek',
    'Aarde, water, lucht en vuur',
    'Na deze les begrijp jij hoe aarde, water, lucht en vuur de vier dagtypen verklaren en hoe je dat toepast per drankcategorie.
',
    'De vier dagtypen zijn gekoppeld aan vier klassieke elementen:
- Aarde → Wortel
- Water → Blad
- Lucht → Bloem
- Vuur → Vrucht
Deze elementen helpen om smaakbeleving verder te interpreteren.
Aarde staat voor structuur, stabiliteit en mineraliteit. Water vergroot frisheid en vegetale tonen. Lucht versterkt aromatische finesse en elegantie. Vuur verhoogt expressie, energie en fruitintensiteit.
Bij mousserende wijn is Bloem vaak interessant vanwege finesse en mousse, terwijl Vrucht juist meer openheid en spanning geeft.
Deze koppeling helpt proevers strategischer te denken over timing.
',
    '- earth
- water
- air
- fire
- elements
',
    'Veel Champagnehuizen kiezen Bloemdagen om blends op finesse en precisie te beoordelen.
',
    '- Aarde staat voor structuur, stabiliteit en mineraliteit
- Vuur verhoogt expressie, energie en fruitintensiteit
- Deze koppeling helpt proevers strategischer te denken over timing
- In de app: Dagtype in Advies bepaalt mede welke stijlen worden aanbevolen bij warm of koel weer.
',
    '### Opdracht

Kies vier dranken:

Bepaal welk element daar volgens jou het sterkst bij past en onderbouw waarom.
- rode wijn
- witte wijn
- mousserend
- bier

### Reflectievraag

Welke drankcategorie lijkt volgens jou het meest gevoelig voor elementwisselingen?


---

### Reflectievraag

Welke drankcategorie lijkt volgens jou het meest gevoelig voor elementwisselingen?
',
    8,
    4
  ),
  (
    'waarom-gebruiken-professionals-dit',
    'Waarom gebruiken sommeliers en wijnmakers dit?',
    'Na deze les begrijp jij waarom sommeliers en wijnmakers biodynamische timing inzetten voor topflessen, blends en belangrijke diners.
',
    'Voor professionals draait biodynamische timing om precisie.
Sommeliers gebruiken het om topflessen op hun beste moment te openen, pairings scherper af te stemmen en belangrijke diners strategisch te plannen.
Wijnmakers gebruiken het om blends te beoordelen, bottelmomenten te kiezen en kwaliteitscontroles uit te voeren.
Een jonge Bordeaux op een Vruchtdag laat doorgaans zijn volledige fruitpotentieel en balans zien, terwijl diezelfde wijn op een Worteldag strenger en hoekiger kan overkomen.
Voor verzamelaars betekent dit dat timing direct invloed kan hebben op de kwaliteit van de ervaring, zeker bij zeldzame of oudere flessen.
',
    '- sommelier
- winemaker
- timing
- expression
- strategy',
    'Bij topflessen kan de juiste dag soms meer impact hebben dan de perfecte serveertemperatuur.
',
    '- Voor professionals draait biodynamische timing om precisie
- Wijnmakers gebruiken het om blends te beoordelen, bottelmomenten te kiezen en kwaliteitscontroles uit te voeren
- Observatie en vergelijking zijn belangrijker dan vaste regels
- In de app: Voorraad, pairing en educatie komen samen in kelder **Drank** + **Advies**.
',
    '### Opdracht

Kies één topfles uit je voorraad en plan:

Gebruik hiervoor de biodynamische kalender.
- openingsdag

### Checklist

- serveertemperatuur
- pairing
- decanteertijd

### Reflectievraag

Welke factoren wegen voor jou zwaarder: dagtype, gezelschap, gerecht of ontwikkelingsfase van de wijn?


---

### Reflectievraag

Welke factoren wegen voor jou zwaarder: dagtype, gezelschap, gerecht of ontwikkelingsfase van de wijn?
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
    'Na deze les herken jij wanneer een Worteldag analytisch waardevoller is dan charmant, en wat dat betekent voor structuur en bewaarpotentieel.
',
    'Worteldagen zijn gekoppeld aan het element aarde en leggen in de praktijk meer nadruk op structuur, mineraliteit en spanning. Veel proevers ervaren op deze dagen minder open fruit en meer focus op tannine, zuren en terroir.
Voor krachtige wijnen zoals Barolo, Bordeaux en jonge Vintage Port kan dit zeer waardevol zijn, omdat de architectuur van de wijn duidelijker zichtbaar wordt.
Een Worteldag is daardoor niet altijd de meest charmante dag om te drinken, maar vaak wel de meest analytische dag om te leren.
Juist wanneer je bewaarpotentieel wilt inschatten, geven Worteldagen vaak veel informatie.
',
    '- root day
- structure
- earth
- minerality
- tension
',
    'Veel professionals proeven jonge Nebbiolo bewust op Worteldagen om tanninestructuur en levensduur beter te analyseren.
',
    '- Veel proevers ervaren op deze dagen minder open fruit en meer focus op tannine, zuren en terroir
- Juist wanneer je bewaarpotentieel wilt inschatten, geven Worteldagen vaak veel informatie
- Observatie en vergelijking zijn belangrijker dan vaste regels
- In de app: Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.
',
    '### Opdracht

Open een jonge Nebbiolo of Cabernet Sauvignon en noteer:
- tanninestructuur
- spanning
- mineraliteit
- fruitintensiteit
- bewaarpotentieel

### Reflectievraag

Geeft een strengere wijn jou meer inzicht of minder drinkplezier?


---

### Reflectievraag

Geeft een strengere wijn jou meer inzicht of minder drinkplezier?
',
    8,
    1
  ),
  (
    'bladdagen-uitgelegd',
    'Bladdagen uitgelegd',
    'Na deze les begrijp jij hoe Bladdagen frisheid en vegetale tonen versterken en wanneer dat minder ideaal is voor topwijnen.
',
    'Bladdagen zijn gekoppeld aan het element water en versterken doorgaans vegetale, frisse en groene tonen. Vooral wijnen met natuurlijke kruidigheid of uitgesproken frisheid kunnen op deze dagen scherper of hoekiger aanvoelen.
Sauvignon Blanc, jonge Grüner Veltliner en sommige alcoholvrije alternatieven tonen dit vaak duidelijk.
Voor topwijnen worden Bladdagen minder vaak gekozen, omdat fruitexpressie doorgaans minder dominant is.
Toch kunnen Bladdagen nuttig zijn om precisie in frisheid en groene componenten te analyseren.
',
    '- leaf day
- freshness
- green notes
- water
- softness
',
    'Een ervaren sommelier gebruikt Bladdagen soms bewust om te testen of een wijn balans houdt zonder fruitdominantie.
',
    '- Bladdagen zijn gekoppeld aan het element water en versterken doorgaans vegetale, frisse en groene tonen
- Vooral wijnen met natuurlijke kruidigheid of uitgesproken frisheid kunnen op deze dagen scherper of hoekiger aanvoelen
- Voor topwijnen worden Bladdagen minder vaak gekozen, omdat fruitexpressie doorgaans minder dominant is
- In de app: Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.
',
    '### Opdracht

Open een Sauvignon Blanc of frisse 0.0 wijn en analyseer:
- groenheid
- frisheid
- zuren
- balans
- aromatische spanning

### Reflectievraag

Wanneer wordt frisheid een kwaliteit en wanneer wordt het een verstoring?


---

### Reflectievraag

Wanneer wordt frisheid een kwaliteit en wanneer wordt het een verstoring?
',
    8,
    2
  ),
  (
    'bloemdagen-uitgelegd',
    'Bloemdagen uitgelegd',
    'Na deze les begrijp jij waarom Bloemdagen finesse en aromatische elegantie naar voren brengen.
',
    'Bloemdagen zijn gekoppeld aan lucht en versterken doorgaans aroma, finesse en elegantie. Vooral aromatische druivenrassen zoals Riesling, Muscat en Gewürztraminer reageren hier vaak sterk op.
Bij mousserende wijn en Champagne kunnen Bloemdagen extra precisie geven in mousse, geurontwikkeling en verfijning.
In tegenstelling tot Vruchtdagen draait Bloem minder om volume en meer om subtiliteit.
Dat maakt deze dagen bijzonder waardevol voor aromatische analyse.
',
    '- flower day
- aroma
- finesse
- elegance
- air
',
    'Champagneproevers gebruiken Bloemdagen vaak om blends en dosage nauwkeuriger te beoordelen.
',
    '- Bloemdagen zijn gekoppeld aan lucht en versterken doorgaans aroma, finesse en elegantie
- Bij mousserende wijn en Champagne kunnen Bloemdagen extra precisie geven in mousse, geurontwikkeling en verfijning
- In tegenstelling tot Vruchtdagen draait Bloem minder om volume en meer om subtiliteit
- Tab **Advies**: dagscore en weer helpen deze les in de praktijk te toetsen.
',
    '### Opdracht

Open een Riesling of mousserende wijn en analyseer:
- geurintensiteit
- finesse
- elegantie
- mousse
- lengte

### Reflectievraag

Welke rol speelt finesse in jouw persoonlijke wijnwaardering?


---

### Reflectievraag

Welke rol speelt finesse in jouw persoonlijke wijnwaardering?
',
    8,
    3
  ),
  (
    'vruchtdagen-uitgelegd',
    'Vruchtdagen uitgelegd',
    'Na deze les begrijp jij waarom Vruchtdagen vaak de meest open en harmonieuze proefmomenten geven.
',
    'Vruchtdagen zijn gekoppeld aan vuur en worden door veel professionals gezien als de meest ideale proefdagen. Op deze dagen tonen wijnen doorgaans maximale openheid, fruitexpressie, balans en harmonie.
Voor jonge én rijpere wijnen betekent dit vaak dat hun volledige potentieel beter zichtbaar wordt.
Bij topflessen zoals Bourgogne, Bordeaux of Vintage Port is een Vruchtdag vaak de voorkeurskeuze.
Dat maakt deze dagen strategisch belangrijk voor zowel drinkplezier als beoordeling.
',
    '- fruit day
- fire
- expression
- energy
- balance
',
    'Veel verzamelaars openen grote flessen uitsluitend op Vruchtdagen om het risico op geslotenheid te minimaliseren.
',
    '- Vruchtdagen zijn gekoppeld aan vuur en worden door veel professionals gezien als de meest ideale proefdagen
- Op deze dagen tonen wijnen doorgaans maximale openheid, fruitexpressie, balans en harmonie
- Voor jonge én rijpere wijnen betekent dit vaak dat hun volledige potentieel beter zichtbaar wordt
- In de app: Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.
',
    '### Opdracht

Kies een wijn uit je voorraad die je hoog waardeert en open deze bewust op een Vruchtdag.

Noteer:
- fruit
- balans
- openheid
- lengte
- complexiteit

### Reflectievraag

Zou jij een topfles liever op een Vruchtdag bewaren dan direct openen?


---

### Reflectievraag

Zou jij een topfles liever op een Vruchtdag bewaren dan direct openen?
',
    8,
    4
  ),
  (
    'hoe-lees-je-de-kalender',
    'Hoe lees je de biodynamische kalender?',
    'Na deze les kun jij zelfstandig de biodynamische kalender lezen en dagtypes vooruit plannen.
',
    'Een biodynamische kalender toont veel meer dan alleen het dagtype. Belangrijk zijn ook begin- en eindtijden, overgangsmomenten, maanknopen, perigee en apogee.
Een dag is zelden volledig één type. Het kan bijvoorbeeld zijn dat een Worteldag om 14:00 overgaat in een Vruchtdag. Voor een wijnliefhebber betekent dit dat timing binnen de dag net zo belangrijk kan zijn als de dag zelf.
Maanknopen worden vaak gezien als instabiele momenten, waarbij wijnen minder consistent kunnen presteren. Perigee en apogee worden gebruikt om extra nuance toe te voegen aan interpretatie.
Voor optimale drinkmomenten zoeken ervaren proevers doorgaans stabiele blokken zonder overgang of node.
',
    '- calendar
- node
- perigee
- apogee
- timing',
    'Bij grote proeverijen kijken sommeliers niet alleen naar het dagtype, maar ook naar het exacte tijdsblok waarin de wijn geopend wordt.
',
    '- Een biodynamische kalender toont veel meer dan alleen het dagtype
- Het kan bijvoorbeeld zijn dat een Worteldag om 14:00 overgaat in een Vruchtdag
- Voor een wijnliefhebber betekent dit dat timing binnen de dag net zo belangrijk kan zijn als de dag zelf
- In de app: Open de maandkalender via Advies voor het volledige dagdetail per datum.
',
    '### Opdracht

Bekijk de kalender van vandaag en noteer:

Koppel hier één fles uit je voorraad aan.
- actief dagtype
- wisselmomenten
- eventuele nodes
- stabielste tijdsblok

### Reflectievraag

Wat zou jij belangrijker vinden: een Vruchtdag met onstabiel weer of een Bloemdag met volledige atmosferische stabiliteit?


---

### Reflectievraag

Wat zou jij belangrijker vinden: een Vruchtdag met onstabiel weer of een Bloemdag met volledige atmosferische stabiliteit?
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
    'Na deze les herken jij hoe wijn zich op een Worteldag gedraagt: meer structuur, minder open fruit.
',
    'Op Worteldagen verschuift de focus van wijn vaak duidelijk naar structuur. Tannines, zuren en mineraliteit komen sterker naar voren, terwijl fruitexpressie doorgaans meer gesloten blijft.
Voor krachtige rode wijnen zoals Bordeaux, Barolo en jonge Rioja maakt dit de wijn analytischer en soms strenger.
Dat betekent niet dat de wijn slechter is, maar dat zijn bouwstenen beter zichtbaar worden.
Voor wie bewaarpotentieel wil inschatten, zijn Worteldagen vaak waardevoller dan Vruchtdagen, omdat de wijn minder charme gebruikt om indruk te maken.
',
    '- structure
- tannin
- acidity
- minerality
- root day
',
    'Veel sommeliers gebruiken Worteldagen om te beoordelen of een jonge wijn voldoende ruggengraat heeft om verder te rijpen.
',
    '- Op Worteldagen verschuift de focus van wijn vaak duidelijk naar structuur
- Tannines, zuren en mineraliteit komen sterker naar voren, terwijl fruitexpressie doorgaans meer gesloten blijft
- Voor krachtige rode wijnen zoals Bordeaux, Barolo en jonge Rioja maakt dit de wijn analytischer en soms strenger
- In de app: Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.
',
    '### Opdracht

Open een jonge Bordeaux of Nebbiolo en noteer:
- tanninestructuur
- zuren
- mineraliteit
- fruitexpressie
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Reflectievraag

Hoe verandert jouw oordeel over een wijn als structuur belangrijker wordt dan charme?


---

### Reflectievraag

Hoe verandert jouw oordeel over een wijn als structuur belangrijker wordt dan charme?
',
    8,
    1
  ),
  (
    'wijn-op-bladdag',
    'Wijn op een Bladdag',
    'Na deze les herken jij hoe Bladdagen wijn frisser en soms groener laten overkomen.
',
    'Bladdagen versterken vaak vegetale en frisse componenten. Bij witte wijnen zoals Sauvignon Blanc of Grüner Veltliner kan dit extra spanning en groenheid geven.
Bij rode wijnen met veel kruidigheid kan het de wijn juist scherper en minder gebalanceerd maken.
Bladdagen zijn daarom zelden de voorkeursdagen voor topflessen, maar kunnen leerzaam zijn omdat ze laten zien hoe een wijn presteert wanneer fruit minder dominant aanwezig is.
Voor alcoholvrije alternatieven is dit effect vaak nog duidelijker.
',
    '- leaf day
- green notes
- freshness
- vegetal
- balance
',
    'Een wijn die op een Bladdag in balans blijft, heeft vaak een sterke intrinsieke kwaliteit.
',
    '- Bladdagen versterken vaak vegetale en frisse componenten
- Bij witte wijnen zoals Sauvignon Blanc of Grüner Veltliner kan dit extra spanning en groenheid geven
- Bij rode wijnen met veel kruidigheid kan het de wijn juist scherper en minder gebalanceerd maken
- Tab **Advies**: dagscore en weer helpen deze les in de praktijk te toetsen.
',
    '### Opdracht

Open een Sauvignon Blanc of alcoholvrije witte wijn en noteer:
- vegetale tonen
- frisheid
- spanning
- balans
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Reflectievraag

Kun jij frisheid los beoordelen van fruitexpressie?


---

### Reflectievraag

Kun jij frisheid los beoordelen van fruitexpressie?
',
    8,
    2
  ),
  (
    'wijn-op-bloemdag',
    'Wijn op een Bloemdag',
    'Na deze les herken jij aromatische finesse en elegantie op Bloemdagen.
',
    'Bloemdagen brengen doorgaans meer aromatische verfijning en elegantie naar voren. Vooral bij druivenrassen met een uitgesproken geurprofiel, zoals Riesling, Muscat en Pinot Noir, wordt dit vaak duidelijk zichtbaar.
De wijn voelt op deze dagen vaak subtieler en preciezer aan, met minder nadruk op volume en meer op finesse.
Voor mousserende wijn en Champagne zijn Bloemdagen bijzonder waardevol, omdat mousse, geur en spanning scherper waarneembaar worden.
Bloemdagen zijn daarom ideaal voor aromatische analyse.
',
    '- flower day
- aroma
- elegance
- finesse
- perfume
',
    'Bij het beoordelen van finesse en geurontwikkeling kiezen professionals vaak liever een Bloemdag dan een Vruchtdag.
',
    '- Bloemdagen brengen doorgaans meer aromatische verfijning en elegantie naar voren
- De wijn voelt op deze dagen vaak subtieler en preciezer aan, met minder nadruk op volume en meer op finesse
- Bloemdagen zijn daarom ideaal voor aromatische analyse
- In de app: Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.
',
    '### Opdracht

Open een Riesling, Champagne of Pinot Noir en analyseer:
- geurintensiteit
- finesse
- elegantie
- spanning
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Reflectievraag

Wat weegt voor jou zwaarder: kracht of finesse?


---

### Reflectievraag

Wat weegt voor jou zwaarder: kracht of finesse?
',
    8,
    3
  ),
  (
    'wijn-op-vruchtdag',
    'Wijn op een Vruchtdag',
    'Na deze les herken jij maximale fruitexpressie en balans op Vruchtdagen.
',
    'Vruchtdagen worden vaak beschouwd als de ideale proefdagen omdat wijnen doorgaans hun maximale openheid en harmonie tonen.
Fruitexpressie komt sterker naar voren, tannines voelen ronder en zuren beter geïntegreerd.
Bij grote wijnen zoals Bourgogne, Bordeaux en Vintage Port betekent dit vaak dat de wijn toegankelijker en expressiever overkomt.
Voor drinkplezier zijn Vruchtdagen vaak de beste keuze, maar voor pure analyse kunnen andere dagtypes soms meer informatie geven.
',
    '- fruit day
- expression
- harmony
- energy
- openness
',
    'Veel topverzamelaars plannen grote openingen bewust op Vruchtdagen om de kans op geslotenheid zo klein mogelijk te maken.
',
    '- Fruitexpressie komt sterker naar voren, tannines voelen ronder en zuren beter geïntegreerd
- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
- In de app: Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.
',
    '### Opdracht

Open een topfles of favoriete wijn op een Vruchtdag en noteer:
- fruit
- openheid
- balans
- lengte
- complexiteit

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Reflectievraag

Wanneer kies jij voor maximaal drinkplezier en wanneer voor maximale analyse?


---

### Reflectievraag

Wanneer kies jij voor maximaal drinkplezier en wanneer voor maximale analyse?
',
    8,
    4
  ),
  (
    'eerste-proefexperiment',
    'Eerste proefexperiment',
    'Na deze les kun jij een eerste vergelijkproef op verschillende dagtypes zelfstandig opzetten en documenteren.
',
    'Het eerste echte biodynamische experiment draait om vergelijking. Door exact dezelfde wijn op verschillende dagtypes te proeven, leer je patronen herkennen.
Belangrijk is dat je alle externe factoren gelijk houdt:
- zelfde fles
- zelfde glas
- zelfde temperatuur
- zelfde context

Alleen zo kun je beoordelen welke verschillen werkelijk samenhangen met timing.
Dit experiment vormt de kern van biodynamisch leren: niet theorie geloven, maar zelf observeren.
Voor serieuze wijnliefhebbers is dit vaak het moment waarop biodynamische logica echt tastbaar wordt.
',
    '- comparative tasting
- observation
- pattern recognition
- tasting memory
- experiment',
    'Professionals vertrouwen nooit op één proefmoment, maar zoeken herhaling om patronen te bevestigen.
',
    '- Het eerste echte biodynamische experiment draait om vergelijking
- Door exact dezelfde wijn op verschillende dagtypes te proeven, leer je patronen herkennen
- Dit experiment vormt de kern van biodynamisch leren: niet theorie geloven, maar zelf observeren
- In de app: Noteer proefmomenten in je eigen journal; koppel later aan Advies-scores.
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

### Reflectievraag

Welk dagtype gaf de meest complete ervaring, en waarom?


---

### Reflectievraag

Welk dagtype gaf de meest complete ervaring, en waarom?
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
    'Na deze les begrijp jij hoe buitentemperatuur smaakwaarneming beïnvloedt, los van serveertemperatuur.
',
    'Temperatuur beïnvloedt niet alleen de wijn, maar ook jouw eigen sensorische waarneming. Op warme dagen komen alcohol, rijp fruit en zoetindruk doorgaans sterker naar voren, terwijl op koelere dagen zuren, spanning en structuur juist scherper zichtbaar worden.
Daardoor kan dezelfde wijn compleet anders overkomen, zelfs als de serveertemperatuur identiek blijft.
Bij volle rode wijnen zoals Amarone of Zinfandel kan warmte de wijn zwaarder en logischer maken, terwijl koelere omstandigheden juist meer balans geven.
Temperatuur is daarom een onderschatte factor in timing.
',
    '- temperature
- perception
- sweetness
- acidity
- balance
',
    'Veel sommeliers vermijden zware rode wijnen op extreem warme dagen, omdat alcohol dan sneller dominant wordt.
',
    '- Temperatuur beïnvloedt niet alleen de wijn, maar ook jouw eigen sensorische waarneming
- Daardoor kan dezelfde wijn compleet anders overkomen, zelfs als de serveertemperatuur identiek blijft
- Temperatuur is daarom een onderschatte factor in timing
- Tab **Advies**: dagscore en weer helpen deze les in de praktijk te toetsen.
',
    '### Opdracht

Open dezelfde wijn op:

Vergelijk:
- een warme dag
- een koelere dag

### Checklist

- alcoholgevoel
- fruit
- balans
- lengte
- drinkbaarheid

### Reflectievraag

Wanneer voelde de wijn het meest in balans, en waarom?


---

### Reflectievraag

Wanneer voelde de wijn het meest in balans, en waarom?
',
    8,
    1
  ),
  (
    'luchtdruk-en-expressie',
    'Luchtdruk en expressie',
    'Na deze les begrijp jij hoe luchtdruk aromatische helderheid kan beïnvloeden en waarom proevers daar rekening mee houden.
',
    'Luchtdruk is één van de meest besproken factoren onder ervaren proevers. Hoge luchtdruk wordt vaak geassocieerd met meer focus, aromatische helderheid en precisie.
Lage luchtdruk kan daarentegen zorgen voor diffusie, minder openheid en een wat vlakker profiel.
Vooral bij complexe wijnen zoals Bourgogne en Champagne wordt dit verschil regelmatig opgemerkt.
Hoewel dit niet als absolute wetenschap geldt, zijn de observaties onder professionals opvallend consistent.
',
    '- air pressure
- stability
- focus
- expression
- weather systems
',
    'Veel proevers vermijden belangrijke beoordelingsmomenten tijdens zware lage druksystemen of vlak voor stormfronten.
',
    '- Vooral bij complexe wijnen zoals Bourgogne en Champagne wordt dit verschil regelmatig opgemerkt
- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
- In de app: Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.
',
    '### Opdracht

Vergelijk een proefmoment op:

Analyseer:
- geurintensiteit
- openheid
- focus
- precisie
- lengte
- hoge luchtdruk
- lage luchtdruk

### Reflectievraag

Merk jij verschil tussen helderheid en diffusie in wijnexpressie?


---

### Reflectievraag

Merk jij verschil tussen helderheid en diffusie in wijnexpressie?
',
    8,
    2
  ),
  (
    'luchtvochtigheid-en-perceptie',
    'Luchtvochtigheid en perceptie',
    'Na deze les begrijp jij hoe luchtvochtigheid geur en mondgevoel kan veranderen.
',
    'Luchtvochtigheid beïnvloedt hoe aroma’s zich gedragen en hoe mondgevoel wordt waargenomen. Hoge luchtvochtigheid kan aroma’s verzachten en de wijn ronder doen aanvoelen.
Lage luchtvochtigheid maakt aroma’s vaak scherper en verhoogt de waargenomen spanning.
Voor subtiele wijnen zoals Champagne, Riesling en elegante Bourgogne is dit effect vaak het duidelijkst merkbaar.
Voor krachtige rode wijnen speelt het meestal een kleinere rol, maar nog steeds relevant.
',
    '- humidity
- aroma
- softness
- dryness
- texture
',
    'Champagne voelt op droge dagen vaak strakker en preciezer, terwijl hoge luchtvochtigheid de mousse zachter kan maken.
',
    '- Hoge luchtvochtigheid kan aroma’s verzachten en de wijn ronder doen aanvoelen
- Voor subtiele wijnen zoals Champagne, Riesling en elegante Bourgogne is dit effect vaak het duidelijkst merkbaar
- Voor krachtige rode wijnen speelt het meestal een kleinere rol, maar nog steeds relevant
- In de app: Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.
',
    '### Opdracht

Open een mousserende wijn of Riesling en noteer:

- geurontwikkeling
- mondgevoel
- spanning
- mousse
- frisheid
Controleer tegelijk de luchtvochtigheid.

### Reflectievraag

Voelde de wijn scherper of ronder dan je had verwacht?


---

### Reflectievraag

Voelde de wijn scherper of ronder dan je had verwacht?
',
    8,
    3
  ),
  (
    'weersomslag-en-proeven',
    'Weersomslag en proefmomenten',
    'Na deze les begrijp jij waarom weersomslagen instabiele proefmomenten geven en wanneer wachten slimmer is.
',
    'Weersomslagen zorgen vaak voor instabiliteit. Denk aan plotselinge drukdalingen, temperatuurwisselingen, stormopbouw of naderend onweer.
Veel proevers ervaren op zulke momenten minder focus, onrustige aroma’s en wisselende expressie.
Bij topflessen is dit ongewenst, omdat je een zo zuiver mogelijke indruk wilt krijgen.
Stabiele omstandigheden geven doorgaans betrouwbaardere en consistenter leesbare proefmomenten.
',
    '- weather front
- instability
- pressure drop
- storm
- timing
',
    'Veel verzamelaars vermijden het openen van zeldzame flessen vlak voor een stormfront of zware weersomslag.
',
    '- Weersomslagen zorgen vaak voor instabiliteit
- Denk aan plotselinge drukdalingen, temperatuurwisselingen, stormopbouw of naderend onweer
- Stabiele omstandigheden geven doorgaans betrouwbaardere en consistenter leesbare proefmomenten
- In de app: Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.
',
    '### Opdracht

Controleer voor je volgende fles:

Bepaal daarna of je opent of wacht.
- luchtdruktrend

### Checklist

- temperatuurtrend
- kans op neerslag
- weersstabiliteit

### Reflectievraag

Ben jij bereid een fles uit te stellen voor betere omstandigheden?


---

### Reflectievraag

Ben jij bereid een fles uit te stellen voor betere omstandigheden?
',
    8,
    4
  ),
  (
    'dynamic-vs-strategic-advice',
    'Dynamic vs Strategic Advice',
    'Na deze les begrijp jij het verschil tussen vandaag-advies (Dynamic Advice) en vooruitplanning (Strategic Advice) in de kelder-app.
',
    'Binnen Way of Tasting bestaan twee vormen van advies: Dynamic Advice (vandaag-advies in de app) en Strategic Advice (vooruitblik / langetermijnplanning).
Dynamic Advice (vandaag-advies in de app) kijkt naar het huidige moment en combineert:
- dagtype
- luchtdruk
- luchtvochtigheid
- weersstabiliteit

Dit helpt bij de vraag: wat drink ik vandaag?

Strategic Advice (vooruitblik / langetermijnplanning) kijkt vooruit en gebruikt:
- biodynamische kalender
- drinkvensters
- voorraadstatus
- toekomstige Vrucht- en Bloemdagen

Dit helpt bij de vraag: wanneer drink ik deze fles?

Samen vormen ze een systeem waarbij spontane keuzes en lange termijn planning elkaar versterken.
',
    '- dynamic advice
- strategic advice
- weather
- planning
- timing',
    'Professionals werken bijna altijd strategisch bij topflessen, maar blijven dynamisch bij dagelijkse keuzes.
',
    '- Vandaag-advies (Dynamic): dagtype + weer → wat drink ik nu?
- Vooruitblik (Strategic): kalender + drinkvenster → wanneer open ik deze fles?
- Spontane keuzes en lange-termijnplanning versterken elkaar
- In de app: Advies-dashboard combineert beide lagen
',
    '### Opdracht

Kies:

Plan voor beide:
- één fles voor vandaag (Dynamic)
- één topfles voor later (Strategic)

### Checklist

- moment
- temperatuur
- pairing
- openingsstrategie

### Reflectievraag

Gebruik jij wijn vooral spontaan, of ben jij bereid strategisch te plannen voor betere momenten?


---

### Reflectievraag

Gebruik jij wijn vooral spontaan, of ben jij bereid strategisch te plannen voor betere momenten?
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
    'Na deze les begrijp jij hoe rode wijn per dagtype verschilt in tannine, fruit en drinkbaarheid.
',
    'Rode wijn reageert doorgaans sterk op biodynamische dagtypes, omdat tannine, structuur en rijp fruit gevoelig zijn voor timing.
Op Vruchtdagen tonen rode wijnen vaak meer open fruit, rondere tannines en meer harmonie. Op Worteldagen verschuift de focus juist naar structuur, spanning en mineraliteit.
Bloemdagen brengen vaak meer aromatische finesse naar voren, vooral bij Pinot Noir en elegante Bourgogne.
Bladdagen kunnen kruidigheid en vegetale tonen versterken, waardoor de wijn soms strenger of groener overkomt.
Voor grote rode wijnen is timing daarom een belangrijke kwaliteitsfactor.
',
    '- red wine
- tannin
- fruit
- structure
- harmony
',
    'Veel Barolo- en Bordeauxproevers kiezen Vruchtdagen voor drinkplezier, maar Worteldagen voor analyse.
',
    '- Op Vruchtdagen tonen rode wijnen vaak meer open fruit, rondere tannines en meer harmonie
- Op Worteldagen verschuift de focus juist naar structuur, spanning en mineraliteit
- Bloemdagen brengen vaak meer aromatische finesse naar voren, vooral bij Pinot Noir en elegante Bourgogne
- In de app: Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.
',
    '### Opdracht

Open dezelfde rode wijn op:

Vergelijk:
- een Worteldag
- een Vruchtdag

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Checklist

- fruit
- tannine
- balans
- lengte
- drinkbaarheid

### Reflectievraag

Welke dag gaf jou meer inzicht: de charmante of de analytische?


---

### Reflectievraag

Welke dag gaf jou meer inzicht: de charmante of de analytische?
',
    8,
    1
  ),
  (
    'witte-wijn-per-dagtype',
    'Witte wijn per dagtype',
    'Na deze les begrijp jij hoe witte wijn per dagtype verschilt in mineraliteit, finesse en frisheid.
',
    'Witte wijn reageert vaak subtieler dan rood, maar de verschillen kunnen juist daardoor zeer leerzaam zijn.
Bloemdagen versterken doorgaans geur, finesse en elegantie. Vruchtdagen geven vaak meer open fruit en toegankelijkheid.
Bladdagen benadrukken frisheid en groene tonen, wat bij Sauvignon Blanc of jonge Riesling extra duidelijk kan zijn.
Worteldagen laten vaak meer mineraliteit en spanning zien, vooral bij Chablis of droge Riesling.
Voor witte wijn draait timing minder om kracht en meer om precisie.
',
    '- white wine
- aromatics
- minerality
- freshness
- elegance
',
    'Veel sommeliers kiezen Bloemdagen voor aromatische witte wijnen, omdat finesse dan het zuiverst leesbaar is.
',
    '- Witte wijn reageert vaak subtieler dan rood, maar de verschillen kunnen juist daardoor zeer leerzaam zijn
- Bloemdagen versterken doorgaans geur, finesse en elegantie
- Vruchtdagen geven vaak meer open fruit en toegankelijkheid
- In de app: Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.
',
    '### Opdracht

Open een Riesling, Chablis of Sauvignon Blanc en analyseer:
- geur
- mineraliteit
- frisheid
- fruit
- lengte

### Reflectievraag

Wat zegt mineraliteit jou over kwaliteit?


---

### Reflectievraag

Wat zegt mineraliteit jou over kwaliteit?
',
    8,
    2
  ),
  (
    'rose-per-dagtype',
    'Rosé per dagtype',
    'Na deze les begrijp jij hoe rosé het sterkst reageert op Vrucht- en Bloemdagen.
',
    'Rosé draait om frisheid, lichtheid en directe fruitexpressie. Daardoor reageren rosés doorgaans het sterkst op Vruchtdagen en Bloemdagen.
Vruchtdagen geven vaak meer open fruit en zachtere balans. Bloemdagen brengen meer finesse en aromatische elegantie.
Bladdagen kunnen rosé groener en scherper maken, terwijl Worteldagen de wijn soms te strak en minder speels laten aanvoelen.
Omdat rosé vaak draait om toegankelijkheid, is timing hier direct gekoppeld aan drinkplezier.
',
    '- rosé
- freshness
- fruit
- lightness
- openness
',
    'Provençaalse rosé presteert vaak opvallend sterk op warme Vruchtdagen met stabiel weer.
',
    '- Rosé draait om frisheid, lichtheid en directe fruitexpressie
- Daardoor reageren rosés doorgaans het sterkst op Vruchtdagen en Bloemdagen
- Vruchtdagen geven vaak meer open fruit en zachtere balans
- In de app: Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.
',
    '### Opdracht

Open een rosé op:

Vergelijk:
- een Vruchtdag
- een Bloemdag

### Checklist

- fruit
- frisheid
- finesse
- spanning
- drinkbaarheid

### Reflectievraag

Zoek jij in rosé meer energie of meer verfijning?


---

### Reflectievraag

Zoek jij in rosé meer energie of meer verfijning?
',
    8,
    3
  ),
  (
    'mousserend-per-dagtype',
    'Mousserende wijn per dagtype',
    'Na deze les begrijp jij hoe mousserende wijn per dagtype verschilt in finesse, mousse en spanning.
',
    'Mousserende wijn is één van de meest gevoelige categorieën binnen biodynamisch proeven.
Bloemdagen versterken vaak finesse, mousse en geurontwikkeling, terwijl Vruchtdagen meer open fruit en spanning geven.
Worteldagen leggen meer nadruk op krijt, mineraliteit en structuur. Bladdagen kunnen de mousse vlakker laten aanvoelen en de wijn minder levendig maken.
Voor Champagne, Cava en kwalitatieve mousserende wijn zijn Bloemdagen en Vruchtdagen daarom meestal de beste keuze.
Timing speelt hier niet alleen in smaak, maar ook in textuur een grote rol.
',
    '- sparkling
- mousse
- finesse
- aroma
- tension
',
    'Veel Champagnehuizen plannen blendsessies op Bloemdagen omdat finesse dan het zuiverst beoordeeld kan worden.
',
    '- Mousserende wijn is één van de meest gevoelige categorieën binnen biodynamisch proeven
- Bloemdagen versterken vaak finesse, mousse en geurontwikkeling, terwijl Vruchtdagen meer open fruit en spanning geven
- Worteldagen leggen meer nadruk op krijt, mineraliteit en structuur
- Tab **Advies**: dagscore en weer helpen deze les in de praktijk te toetsen.
',
    '### Opdracht

Open een Champagne of mousserende wijn en noteer:

- mousse
- geur
- spanning
- finesse
- lengte
Vergelijk dit op een ander dagtype.

### Reflectievraag

Wat vind jij belangrijker in mousserend: spanning of finesse?


---

### Reflectievraag

Wat vind jij belangrijker in mousserend: spanning of finesse?
',
    8,
    4
  ),
  (
    'port-per-dagtype',
    'Port per dagtype',
    'Na deze les begrijp jij hoe Port per dagtype verschilt in zoetheid, structuur en rijpingsexpressie.
',
    'Port reageert anders dan stille wijn door hogere alcohol, restsuiker en oxidatieve invloeden.
Op Vruchtdagen tonen Vintage Port en Ruby Port vaak meer open fruit, zachtere alcohol en meer harmonie.
Worteldagen laten doorgaans meer structuur, alcoholwarmte en strengheid zien, wat vooral nuttig is voor analyse.
Bij Tawny Port kunnen Bloemdagen extra finesse geven, terwijl Vruchtdagen meer rondheid laten zien.
Voor serieuze Portliefhebbers kan timing een groot verschil maken in hoe toegankelijk of complex een fles overkomt.
',
    '- port
- vintage port
- tawny
- alcohol
- harmony',
    'Oude Vintage Ports kunnen op Worteldagen verrassend gesloten blijven, zelfs wanneer ze technisch perfect zijn.
',
    '- Port reageert anders dan stille wijn door hogere alcohol, restsuiker en oxidatieve invloeden
- Op Vruchtdagen tonen Vintage Port en Ruby Port vaak meer open fruit, zachtere alcohol en meer harmonie
- Worteldagen laten doorgaans meer structuur, alcoholwarmte en strengheid zien, wat vooral nuttig is voor analyse
- In de app: Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.
',
    '### Opdracht

Open een Vintage Port of Tawny en analyseer:
- openheid
- alcoholintegratie
- zoetbalans
- lengte
- complexiteit

### Reflectievraag

Welke Portstijl lijkt jou het meest gevoelig voor timing, en waarom?


---

### Reflectievraag

Welke Portstijl lijkt jou het meest gevoelig voor timing, en waarom?
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
    'Na deze les begrijp jij hoe bier anders kan overkomen op biodynamische dagtypes.
',
    'Bier reageert anders dan wijn, maar timing kan ook hier een duidelijke rol spelen. Vooral bij craftbier, waar hop, mout, bitterheid en aromatische lagen complexer zijn, kunnen dagtypes merkbare verschillen geven.
Vruchtdagen versterken vaak fruitige hoptonen en geven een ronder mondgevoel. Bloemdagen laten aromatische finesse en subtiliteit beter naar voren komen.
Worteldagen leggen vaak meer nadruk op bitterheid, body en moutstructuur. Bladdagen kunnen vegetale hopkarakters scherper laten aanvoelen.
Bij IPA’s en Saisons zijn deze verschillen vaak het duidelijkst merkbaar.
',
    '- beer
- hops
- bitterness
- malt
- timing
',
    'Veel craftbierproevers kiezen Vruchtdagen voor IPA’s omdat tropische hoparoma’s dan doorgaans expressiever overkomen.
',
    '- Bier reageert anders dan wijn, maar timing kan ook hier een duidelijke rol spelen
- Vruchtdagen versterken vaak fruitige hoptonen en geven een ronder mondgevoel
- Bloemdagen laten aromatische finesse en subtiliteit beter naar voren komen
',
    '### Opdracht

Open een IPA of Saison en analyseer:

- hoparoma
- bitterheid
- body
- frisheid
- balans
Herhaal op een ander dagtype.

### Reflectievraag

Wanneer wordt bitterheid een kracht en wanneer een verstoring?


---

### Reflectievraag

Wanneer wordt bitterheid een kracht en wanneer een verstoring?
',
    8,
    1
  ),
  (
    'bier-0-0-en-timing',
    'Bier 0.0 en timing',
    'Na deze les begrijp jij waarom alcoholvrije bieren soms extra gevoelig zijn voor timing.
',
    'Alcoholvrije bieren zijn vaak nog gevoeliger voor timing, omdat alcohol als dragende structuurlaag ontbreekt.
Daardoor worden zoetheid, bitterheid en moutkarakter sneller dominant.
Vruchtdagen kunnen helpen om balans en fruitigheid beter naar voren te brengen, terwijl Worteldagen bitterheid vaak harder laten aanvoelen.
Bij alcoholvrije IPA’s of blond bier zijn deze verschillen soms opvallend groot.
Voor 0.0 drinkers is timing daarom relevanter dan vaak wordt gedacht.
',
    '- alcohol-free
- bitterness
- sweetness
- balance
- structure
',
    'Een alcoholvrij bier dat op een Worteldag nog steeds in balans blijft, heeft meestal een sterkere receptuur.
',
    '- Alcoholvrije bieren zijn vaak nog gevoeliger voor timing, omdat alcohol als dragende structuurlaag ontbreekt
- Voor 0.0 drinkers is timing daarom relevanter dan vaak wordt gedacht
- Observatie en vergelijking zijn belangrijker dan vaste regels
- In de app: Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.
',
    '### Opdracht

Open jouw favoriete 0.0 bier en noteer:

- zoetheid
- bitterheid
- frisheid
- body
- balans
Herhaal op een Vruchtdag.

### Reflectievraag

Voelt alcoholvrij voor jou stabieler of juist gevoeliger dan regulier bier?


---

### Reflectievraag

Voelt alcoholvrij voor jou stabieler of juist gevoeliger dan regulier bier?
',
    8,
    2
  ),
  (
    'cocktails-en-dagtypes',
    'Cocktails en dagtypes',
    'Na deze les begrijp jij hoe cocktails en dagtypes samenhangen in balans en frisheid.
',
    'Cocktails reageren biodynamisch via hun ingrediënten. Citrus, bitters, kruiden en base spirits kunnen per dagtype anders naar voren komen.
Vruchtdagen versterken doorgaans fruit, openheid en drinkbaarheid. Bloemdagen geven vaak meer finesse en aromatische precisie, vooral bij gin-cocktails en aperitiefstijlen.
Worteldagen kunnen bitters en alcoholstructuur dominanter maken, wat bij Negroni of Old Fashioned extra zichtbaar wordt.
Daardoor kunnen cocktails verrassend gevoelig zijn voor timing.
',
    '- cocktail
- botanicals
- bitters
- citrus
- balance
',
    'Een Martini op een Bloemdag kan aromatisch veel verfijnder overkomen dan op een Worteldag.
',
    '- Cocktails reageren biodynamisch via hun ingrediënten
- Citrus, bitters, kruiden en base spirits kunnen per dagtype anders naar voren komen
- Vruchtdagen versterken doorgaans fruit, openheid en drinkbaarheid
',
    '### Opdracht

Maak dezelfde cocktail op:

Vergelijk:
- een Bloemdag
- een Worteldag
- aroma

### Checklist

- bitterheid
- balans
- openheid
- lengte

### Reflectievraag

Welke cocktailstijl lijkt jou het meest gevoelig voor timing?


---

### Reflectievraag

Welke cocktailstijl lijkt jou het meest gevoelig voor timing?
',
    8,
    3
  ),
  (
    'barrel-aged-dranken',
    'Barrel-aged dranken',
    'Na deze les begrijp jij hoe barrel-aged dranken reageren op structuur- versus fruitdagen.
',
    'Vatgerijpte dranken zoals whisky, bourbon en rum reageren vaak sterk op timing, omdat hout, oxidatie en complexiteit gevoelige lagen zijn.
Vruchtdagen geven doorgaans meer openheid en rondheid. Worteldagen benadrukken structuur, droogte en houtinvloed.
Bloemdagen kunnen subtiele aroma’s zoals vanille, kruiden en florale tonen beter laten spreken.
Bij oudere whisky’s of complexe barrel-aged cocktails kan dit verschil groot genoeg zijn om de totale beleving te veranderen.
',
    '- barrel-aged
- wood
- oxidation
- complexity
- maturity
',
    'Veel verzamelaars openen oude whisky’s bewust op Vruchtdagen om maximale aromatische openheid te krijgen.
',
    '- Vruchtdagen geven doorgaans meer openheid en rondheid
- Worteldagen benadrukken structuur, droogte en houtinvloed
- Bloemdagen kunnen subtiele aroma’s zoals vanille, kruiden en florale tonen beter laten spreken
',
    '### Opdracht

Open een vatgerijpte drank en analyseer:
- houtinvloed
- alcoholintegratie
- rondheid
- complexiteit
- lengte

### Reflectievraag

Wat zegt houtinvloed jou over rijping en timing?


---

### Reflectievraag

Wat zegt houtinvloed jou over rijping en timing?
',
    8,
    4
  ),
  (
    'alcoholvrij-en-proefmomenten',
    'Alcoholvrij en proefmomenten',
    'Na deze les begrijp jij hoe je alcoholvrije momenten strategisch kiest op basis van dagtype en context.
',
    'Alcoholvrije dranken zijn vaak gevoeliger voor timing omdat de dragende structuur van alcohol ontbreekt. Daardoor komen fruit, zuur, bitterheid en aromatische lagen sneller uit balans.
Vruchtdagen helpen vaak om fruit en harmonie beter zichtbaar te maken. Bloemdagen versterken finesse en geur, vooral bij alcoholvrije mousserende wijn of witte wijn.
Bij Worteldagen kunnen harde of droge elementen juist sneller domineren.
Voor alcoholvrij geldt daarom dat timing een grotere rol speelt dan veel mensen verwachten.
',
    '- alcohol-free
- sensitivity
- fruit day
- flower day
- timing',
    'Bij alcoholvrije mousserende dranken kan een Bloemdag het verschil maken tussen vlak en verfijnd.
',
    '- Alcoholvrije dranken zijn vaak gevoeliger voor timing omdat de dragende structuur van alcohol ontbreekt
- Daardoor komen fruit, zuur, bitterheid en aromatische lagen sneller uit balans
- Vruchtdagen helpen vaak om fruit en harmonie beter zichtbaar te maken
- In de app: Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.
',
    '### Opdracht

Kies een alcoholvrije wijn of bier en analyseer:

- fruit
- balans
- aroma
- frisheid
- structuur
Herhaal dit op een ander dagtype.

### Reflectievraag

Welke rol speelt timing bij alcoholvrije dranken in vergelijking met reguliere dranken?


---

### Reflectievraag

Welke rol speelt timing bij alcoholvrije dranken in vergelijking met reguliere dranken?
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
    'Na deze les kun jij bepalen welke fles het best past bij welk moment in je voorraad.
',
    'Niet elke fles past bij elk moment. Binnen biodynamisch denken draait het niet alleen om de kwaliteit van de wijn, maar ook om de combinatie van rijpingsfase, dagtype en context.
Jonge wijnen zijn doorgaans flexibeler, terwijl oudere wijnen veel gevoeliger zijn voor timing. Een mature Bourgogne of Vintage Port kan op een verkeerde dag gesloten of onevenwichtig aanvoelen.
Daarom is fleskeuze niet alleen een kwestie van verlangen, maar ook van strategie.
Door het juiste moment te kiezen verhoog je niet alleen drinkplezier, maar ook de kans om de wijn op zijn hoogste niveau te ervaren.
',
    '- bottle selection
- timing
- maturity
- strategy
- precision
',
    'Veel verzamelaars wachten bewust weken op een ideale Vruchtdag voordat zij een topfles openen.
',
    '- Jonge wijnen zijn doorgaans flexibeler, terwijl oudere wijnen veel gevoeliger zijn voor timing
- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
',
    '### Opdracht

Kies drie flessen uit je voorraad:

Bepaal voor elke fles:
- jong
- op dronk
- rijp
- beste dagtype
- ideale context

### Checklist

- serveermoment

### Reflectievraag

Welke fles uit jouw voorraad vraagt de meeste precisie?


---

### Reflectievraag

Welke fles uit jouw voorraad vraagt de meeste precisie?
',
    8,
    1
  ),
  (
    'openen-of-wachten',
    'Wanneer openen en wanneer wachten?',
    'Na deze les kun jij inschatten wanneer wachten beter is dan openen.
',
    'Niet elke fles hoeft direct open. Soms is wachten de beste keuze, zelfs als de verleiding groot is.
Een slecht dagtype, instabiel weer of ongunstige luchtdruk kunnen een wijn minder goed laten presteren.
Vooral bij topflessen of oudere wijnen kan een paar dagen verschil een merkbare impact hebben op balans en openheid.
Geduld is daarom geen passiviteit, maar een strategische keuze.
Binnen biodynamisch drinken is wachten vaak onderdeel van kwaliteit.
',
    '- patience
- waiting
- stability
- better timing
- strategy
',
    'Veel ervaren proevers stellen een topopening zonder twijfel uit als omstandigheden niet optimaal zijn.
',
    '- Een slecht dagtype, instabiel weer of ongunstige luchtdruk kunnen een wijn minder goed laten presteren
- Vooral bij topflessen of oudere wijnen kan een paar dagen verschil een merkbare impact hebben op balans en openheid
- Binnen biodynamisch drinken is wachten vaak onderdeel van kwaliteit
',
    '### Opdracht

Kies een fles die je binnenkort wilt openen en bepaal:

Gebruik kalender en weerdata.

### Checklist

- waarom nu?
- waarom later?
- wat is de betere keuze?

### Reflectievraag

Ben jij iemand die makkelijk wacht op kwaliteit, of kies je sneller voor spontaniteit?


---

### Reflectievraag

Ben jij iemand die makkelijk wacht op kwaliteit, of kies je sneller voor spontaniteit?
',
    8,
    2
  ),
  (
    'drinkvensters-en-dagtypes',
    'Drinkvensters en dagtypes',
    'Na deze les kun jij drinkvensters koppelen aan biodynamische dagtypes voor optimale timing.
',
    'Elke wijn heeft een drinkvenster: een periode waarin de wijn zijn optimale balans tussen fruit, structuur en complexiteit bereikt.
Binnen dat venster kun je nog verder verfijnen met biodynamische timing.
Een Barolo in piekrijpheid op een Vruchtdag kan veel completer aanvoelen dan dezelfde wijn op een Bladdag.
Drinkvensters bepalen dus de fase, terwijl dagtypes het exacte moment bepalen.
Samen geven ze maximale kans op topkwaliteit.
',
    '- drinking window
- peak drinking
- maturity
- planning
- timing
',
    'Veel verzamelaars noteren niet alleen drinkvensters, maar ook hun favoriete dagtypes per wijnstijl.
',
    '- Binnen dat venster kun je nog verder verfijnen met biodynamische timing
- Een Barolo in piekrijpheid op een Vruchtdag kan veel completer aanvoelen dan dezelfde wijn op een Bladdag
- Drinkvensters bepalen dus de fase, terwijl dagtypes het exacte moment bepalen
- In de app: Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.
',
    '### Opdracht

Bekijk vijf flessen uit je voorraad en noteer:
- huidige fase
- resterend drinkvenster
- ideaal dagtype

### Reflectievraag

Welke fles uit jouw collectie zit nu op zijn piek?


---

### Reflectievraag

Welke fles uit jouw collectie zit nu op zijn piek?
',
    8,
    3
  ),
  (
    'voorraadstrategie-topflessen',
    'Voorraadstrategie voor topflessen',
    'Na deze les kun jij topflessen in je voorraad strategisch markeren en vooruit plannen.
',
    'Topflessen vragen een andere strategie dan dagelijkse drinkwijnen. Niet alleen vanwege hun waarde, maar vooral vanwege hun gevoeligheid voor timing en context.
Een grote Bordeaux, Bourgogne of Vintage Port verdient voorbereiding:
- juiste dagtype
- stabiel weer
- juiste pairing
- voldoende tijd
Door deze factoren vooraf te plannen, verhoog je de kans op een memorabel moment.
Strategie maakt het verschil tussen “goed” en “uitzonderlijk”.
',
    '- cellar management
- planning
- ready now
- rotation
- calendar logic
',
    'Bij iconische flessen wordt voorbereiding vaak als onderdeel van de totale ervaring gezien.
',
    '- Topflessen vragen een andere strategie dan dagelijkse drinkwijnen
- Niet alleen vanwege hun waarde, maar vooral vanwege hun gevoeligheid voor timing en context
- Observatie en vergelijking zijn belangrijker dan vaste regels
- In de app: Markeer topflessen in Drank en plan openingsdagen via de kalender in Advies.
',
    '### Opdracht

Kies jouw drie meest waardevolle flessen en plan:
- ideale openingsperiode
- voorkeursdagtype

### Checklist

- ideale pairing
- decanteertijd

### Reflectievraag

Wat maakt voor jou een fles écht het wachten waard?


---

### Reflectievraag

Wat maakt voor jou een fles écht het wachten waard?
',
    8,
    4
  ),
  (
    'reserves-lange-termijn',
    'Reserves en lange termijn denken',
    'Na deze les kun jij reserveflessen en lange-termijn openingsmomenten bewust plannen.
',
    'Niet elke fles hoeft een directe bestemming te hebben. Sommige wijnen zijn bedoeld als reserve: flessen die je bewust bewaart voor een toekomstig topmoment.
Deze reserve-strategie vraagt discipline, omdat het doel niet dagelijkse consumptie is, maar het creëren van uitzonderlijke ervaringen op de lange termijn.
Bij reservewijnen wordt timing nog belangrijker, omdat rijping, dagtype en gelegenheid samen moeten vallen.
Voor serieuze verzamelaars is dit vaak het hoogste niveau van wijnplanning.
',
    '- strategic planning
- weather forecast
- calendar logic
- inventory
- drinking intelligence',
    'De beste collecties zijn niet alleen opgebouwd op kwaliteit, maar op geduld en timing.
',
    '- Sommige wijnen zijn bedoeld als reserve: flessen die je bewust bewaart voor een toekomstig topmoment
- Bij reservewijnen wordt timing nog belangrijker, omdat rijping, dagtype en gelegenheid samen moeten vallen
- Voor serieuze verzamelaars is dit vaak het hoogste niveau van wijnplanning
',
    '### Opdracht

Selecteer drie reserveflessen en noteer:
- verwachte piekperiode
- ideale dagtypes
- ideale gelegenheid

### Reflectievraag

Welke fles in jouw collectie zie jij als jouw ultieme toekomstige topmoment?


---

### Reflectievraag

Welke fles in jouw collectie zie jij als jouw ultieme toekomstige topmoment?
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
    'Na deze les begrijp jij hoe vertical tastings en dagtypes samenwerken bij jaargangsvergelijking.
',
    'Een vertical tasting is het proeven van meerdere jaargangen van dezelfde wijn. Dit geeft inzicht in rijping, vintage-verschillen en ontwikkelingspotentieel.
Binnen biodynamisch proeven wordt dit nog interessanter, omdat timing invloed kan hebben op hoe iedere jaargang zich presenteert.
Een jonge jaargang kan op een Worteldag harder en strakker overkomen, terwijl een oudere jaargang op een Vruchtdag juist volledig openbloeit.
Bij verticals is consistentie cruciaal. Daarom kiezen veel professionals bewust één stabiel dagtype om alle flessen onder gelijke omstandigheden te beoordelen.
',
    '- tasting journal
- notes
- data
- memory
- tracking
',
    'Bij grote Bordeaux verticals kiezen professionals vaak Vruchtdagen om maximale vergelijkbaarheid in openheid en fruitexpressie te krijgen.
',
    '- Een vertical tasting is het proeven van meerdere jaargangen van dezelfde wijn
- Daarom kiezen veel professionals bewust één stabiel dagtype om alle flessen onder gelijke omstandigheden te beoordelen
- Observatie en vergelijking zijn belangrijker dan vaste regels
- Tab **Advies**: dagscore en weer helpen deze les in de praktijk te toetsen.
',
    '### Opdracht

Kies twee of drie jaargangen van dezelfde wijn en noteer:
- openheid
- structuur
- fruitontwikkeling
- lengte
- complexiteit

### Reflectievraag

Welke rol speelt rijping in jouw beoordeling vergeleken met timing?


---

### Reflectievraag

Welke rol speelt rijping in jouw beoordeling vergeleken met timing?
',
    8,
    1
  ),
  (
    'blindproeven-timing',
    'Blindproeven en timing',
    'Na deze les begrijp jij hoe timing blindproefresultaten kan beïnvloeden en waarom je dagtype noteert.
',
    'Blindproeven draait om objectiviteit, maar timing kan ook hier een verborgen factor zijn.
Een wijn die op een Vruchtdag volledig open is, kan gemakkelijker herkenbaar zijn dan dezelfde wijn op een Worteldag.
Dit betekent dat timing soms invloed heeft op je interpretatie van druivenras, regio of kwaliteit.
Voor serieuze proevers is het daarom waardevol om timing mee te nemen als variabele.
Niet als excuus, maar als extra analysetool.
',
    '- patterns
- repetition
- comparison
- recognition
- personal logic
',
    'Veel professionele proefpanels noteren het dagtype, zelfs wanneer het niet direct besproken wordt.
',
    '- Blindproeven draait om objectiviteit, maar timing kan ook hier een verborgen factor zijn
- Een wijn die op een Vruchtdag volledig open is, kan gemakkelijker herkenbaar zijn dan dezelfde wijn op een Worteldag
- Dit betekent dat timing soms invloed heeft op je interpretatie van druivenras, regio of kwaliteit
',
    '### Opdracht

Blindproef twee wijnen op een Vruchtdag en herhaal dit op een Worteldag.

Vergelijk:
- herkenbaarheid
- openheid
- complexiteit
- balans

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Reflectievraag

Hoe objectief kun je proeven als timing invloed heeft op expressie?


---

### Reflectievraag

Hoe objectief kun je proeven als timing invloed heeft op expressie?
',
    8,
    2
  ),
  (
    'grote-flessen-biodynamiek',
    'Grote flessen en biodynamiek',
    'Na deze les begrijp jij hoe grote formaten anders rijpen en waarom timing bij Magnums extra belangrijk is.
',
    'Magnums en grotere formaten rijpen anders dan standaardflessen. Door hun tragere ontwikkeling en grotere massa reageren ze vaak subtieler, maar soms ook gevoeliger op timing.
Een Magnum Bourgogne op een Vruchtdag kan indrukwekkend veel openheid tonen, terwijl dezelfde fles op een Worteldag nog gesloten blijft.
Bij grote formaten wordt timing extra belangrijk omdat de inzet vaak hoger is: grotere gelegenheden, meer gasten en grotere verwachtingen.
Strategie en timing worden hier één geheel.
',
    '- taste profile
- preferences
- conditions
- identity
- style
',
    'Veel verzamelaars plannen Magnums weken vooruit, juist omdat de impact van een verkeerd moment groter voelt.
',
    '- Door hun tragere ontwikkeling en grotere massa reageren ze vaak subtieler, maar soms ook gevoeliger op timing
- Strategie en timing worden hier één geheel
- Observatie en vergelijking zijn belangrijker dan vaste regels
',
    '### Opdracht

Kies een Magnum of grotere fles en bepaal:
- ideale openingsperiode
- dagtype

### Checklist

- decanteertijd
- pairing

### Reflectievraag

Zou jij bij een Magnum meer voorbereiding doen dan bij een standaardfles?


---

### Reflectievraag

Zou jij bij een Magnum meer voorbereiding doen dan bij een standaardfles?
',
    8,
    3
  ),
  (
    'pairing-dagtypes',
    'Pairing en dagtypes',
    'Na deze les begrijp jij hoe food pairing verandert door dagtype en expressie van de wijn.
',
    'Food pairing wordt meestal bekeken vanuit smaakbalans, maar timing voegt een extra laag toe.
Een wijn op een Vruchtdag kan meer fruit en openheid geven, waardoor pairing met rijke gerechten beter werkt.
Op een Worteldag komt structuur sterker naar voren, waardoor dezelfde wijn misschien beter past bij aardse of krachtige gerechten.
Timing beïnvloedt dus niet alleen de wijn, maar ook de interactie met eten.
Voor sommeliers is dit een belangrijk strategisch hulpmiddel.
',
    '- data
- scoring
- preferences
- patterns
- analytics
',
    'Een pairing die op een Vruchtdag perfect voelt, kan op een Bladdag minder harmonieus aanvoelen.
',
    '- Food pairing wordt meestal bekeken vanuit smaakbalans, maar timing voegt een extra laag toe
- Een wijn op een Vruchtdag kan meer fruit en openheid geven, waardoor pairing met rijke gerechten beter werkt
- Timing beïnvloedt dus niet alleen de wijn, maar ook de interactie met eten
- In de app: Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.
',
    '### Opdracht

Kies één wijn en combineer deze op twee verschillende dagtypes met hetzelfde gerecht.

Analyseer:
- harmonie
- spanning
- contrast
- lengte

*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*

### Reflectievraag

Hoeveel invloed denk jij dat timing heeft op pairing?


---

### Reflectievraag

Hoeveel invloed denk jij dat timing heeft op pairing?
',
    8,
    4
  ),
  (
    'eigen-biodynamisch-systeem',
    'Je eigen biodynamische systeem bouwen',
    'Na deze les kun jij een persoonlijk biodynamisch observatiesysteem opbouwen op basis van eigen data.
',
    'Het hoogste niveau van biodynamisch proeven is niet blind vertrouwen op theorie, maar het bouwen van je eigen observatiesysteem.
Door herhaaldelijk te noteren hoe jouw wijnen reageren op verschillende dagtypes, weersomstandigheden en contexten, ontstaat persoonlijke data.
Na verloop van tijd herken je patronen:
- welke stijlen voor jou beter werken op Vruchtdagen
- welke wijnen op Worteldagen analytisch sterker zijn
- welke omstandigheden jouw ideale drinkmoment vormen

Dit maakt biodynamiek persoonlijk en praktisch.
',
    '- drink intelligence
- personal system
- observation
- timing
- data',
    'De beste proevers bouwen hun eigen geheugenbank van ervaringen en vertrouwen niet uitsluitend op algemene regels.
',
    '- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
- Noteer dagtype en weer bij elke serieuze proef
- In de app: Bouw je profiel op via herhaalde observaties — Advies wordt persoonlijker naarmate je meer proeft.
',
    '### Opdracht

Maak jouw eigen biodynamische profiel:
- favoriete dagtype
- gevoeligste wijnstijl
- ideale weerscondities

### Checklist

- beste pairingmomenten

### Reflectievraag

Welke patronen heb jij tot nu toe al bij jezelf ontdekt?


---

### Reflectievraag

Welke patronen heb jij tot nu toe al bij jezelf ontdekt?
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
    'Na deze les herken jij wanneer dagtype, weer, drinkvenster en context samenkomen in een topmoment.
',
    'Het perfecte drinkmoment is zelden toeval. Het ontstaat wanneer meerdere factoren samenvallen: de wijn zit in zijn optimale drinkvenster, het dagtype ondersteunt de stijl, de atmosfeer is stabiel en de context klopt.
Een grote Bourgogne op een Vruchtdag met stabiele luchtdruk en de juiste pairing zal vaak veel completer overkomen dan dezelfde fles op een willekeurig moment.
Voor ervaren proevers draait dit om het herkennen van die zeldzame overlap.
Daar ligt de essentie van biodynamisch drinken: maximale kwaliteit uit één moment halen.
',
    '- theory exam
- knowledge
- biodynamics
- timing
- structure
',
    'De beste sommeliers leren niet alleen wát goed is, maar vooral wannéér iets op zijn best is.
',
    '- Daar ligt de essentie van biodynamisch drinken: maximale kwaliteit uit één moment halen
- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
',
    '### Opdracht

Kies één fles uit je voorraad en bepaal:
- drinkvenster
- ideale dagtype
- weersomstandigheden

### Checklist

- pairing
- context

### Reflectievraag

Welke factor onderschat jij momenteel het meest?


---

### Reflectievraag

Welke factor onderschat jij momenteel het meest?
',
    8,
    1
  ),
  (
    'timing-versus-kwaliteit',
    'Timing versus kwaliteit',
    'Na deze les begrijp jij dat timing kwaliteit ontsluit — niet vervangt.
',
    'Niet elke geweldige wijn geeft automatisch een geweldige ervaring. Kwaliteit is de basis, maar timing bepaalt vaak hoe zichtbaar die kwaliteit wordt.
Een top-Barolo op een slechte dag kan minder indrukwekkend zijn dan een goede Chianti op een ideale Vruchtdag.
Dit betekent niet dat timing kwaliteit vervangt, maar dat het kwaliteit ontsluit.
Voor serieuze wijnliefhebbers is dit een fundamenteel inzicht: potentieel en moment zijn onlosmakelijk verbonden.
',
    '- root day
- structure
- tannin
- acidity
- minerality
',
    'Professionals weten dat timing soms het verschil maakt tussen “goed” en “onvergetelijk”.
',
    '- Niet elke geweldige wijn geeft automatisch een geweldige ervaring
- Kwaliteit is de basis, maar timing bepaalt vaak hoe zichtbaar die kwaliteit wordt
- Een top-Barolo op een slechte dag kan minder indrukwekkend zijn dan een goede Chianti op een ideale Vruchtdag
- In de app: Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.
',
    '### Opdracht

Vergelijk:
- een topwijn op een minder gunstig moment
- een goede wijn op een sterk moment

Analyseer:
- balans
- plezier
- expressie
- memorabiliteit

### Reflectievraag

Wat betekent kwaliteit voor jou zonder de juiste timing?


---

### Reflectievraag

Wat betekent kwaliteit voor jou zonder de juiste timing?
',
    8,
    2
  ),
  (
    'persoonlijke-voorkeurspatronen',
    'Jouw persoonlijke voorkeurspatronen',
    'Na deze les herken jij je persoonlijke voorkeurspatronen per dagtype en wijnstijl.
',
    'Niet iedere proever reageert hetzelfde op biodynamische timing. Sommige mensen geven de voorkeur aan de analytische strengheid van Worteldagen, anderen zoeken juist de openheid van Vruchtdagen.
Ook persoonlijke smaak speelt mee: wie houdt van spanning, zal vaak andere ideale momenten kiezen dan iemand die vooral op zoek is naar charme en fruit.
Door je eigen voorkeuren te herkennen, maak je biodynamisch drinken persoonlijker en effectiever.
Dit is waar theorie verandert in individuele stijl.
',
    '- fruit day
- harmony
- expression
- balance
- openness
',
    'De beste proevers kennen niet alleen wijn, maar ook hun eigen voorkeurspatronen.
',
    '- Niet iedere proever reageert hetzelfde op biodynamische timing
- Door je eigen voorkeuren te herkennen, maak je biodynamisch drinken persoonlijker en effectiever
- Observatie en vergelijking zijn belangrijker dan vaste regels
',
    '### Opdracht

Maak een overzicht van:
- jouw favoriete dagtype
- jouw minst favoriete dagtype
- jouw meest gevoelige wijnstijl
- jouw ideale drinkcontext

### Reflectievraag

Wat zegt jouw voorkeur over hoe jij kwaliteit beleeft?


---

### Reflectievraag

Wat zegt jouw voorkeur over hoe jij kwaliteit beleeft?
',
    8,
    3
  ),
  (
    'open-examen-biodynamisch',
    'Open examen',
    'Na deze les voer je een open integratie-analyse uit over alle geleerde lagen van biodynamisch proeven.
',
    'Deze les is geen traditionele les, maar een open evaluatie van alles wat je hebt geleerd.
Het doel is om zelfstandig een fles te analyseren zonder vaste begeleiding.
Je gebruikt daarbij alle lagen van biodynamisch proeven:
- dagtype
- weersomstandigheden
- luchtdruk
- drinkvenster
- pairing
- context

Dit is het moment waarop kennis verandert in intuïtie.
',
    '- comparison
- analysis
- pattern
- tasting memory
- difference
',
    'Echte expertise begint wanneer je zonder hulpmiddelen dezelfde patronen blijft herkennen.
',
    '- Observatie en vergelijking zijn belangrijker dan vaste regels
- Timing kan expressie versterken of afzwakken
- Noteer dagtype en weer bij elke serieuze proef
',
    '### Opdracht

Kies één serieuze fles en maak een volledige analyse:
- waarom vandaag?
- welk dagtype?
- welke atmosfeer?
- hoe presteerde de wijn?
- wat zou je anders doen?

### Reflectievraag

Welke inzichten uit deze track gebruik je inmiddels automatisch?


---

### Reflectievraag

Welke inzichten uit deze track gebruik je inmiddels automatisch?
',
    20,
    4
  ),
  (
    'biodynamisch-meesterschap',
    'Biodynamisch meesterschap',
    'Na deze les formuleer jij je persoonlijke biodynamische drinkstrategie als actieve proever.
',
    'Meesterschap in biodynamisch proeven betekent niet dat je altijd gelijk hebt, maar dat je patronen steeds beter leert herkennen.
Je begrijpt nu hoe timing, atmosfeer, rijping en context elkaar beïnvloeden.
Dat maakt je geen passieve drinker meer, maar een actieve strateeg in je eigen wijnervaring.
Of het nu gaat om een eenvoudige fles Sauvignon Blanc of een oude Vintage Port: je weet nu dat timing het verschil kan maken.
Daarmee is biodynamiek geen theorie meer, maar een onderdeel van jouw manier van proeven.
',
    '- mastery
- personal intelligence
- strategy
- biodynamic profile
- final certification',
    'De grootste verzamelaars en sommeliers onderscheiden zich niet alleen door kennis, maar door timingdiscipline.
',
    '- Je begrijpt nu hoe timing, atmosfeer, rijping en context elkaar beïnvloeden
- Dat maakt je geen passieve drinker meer, maar een actieve strateeg in je eigen wijnervaring
- Daarmee is biodynamiek geen theorie meer, maar een onderdeel van jouw manier van proeven
- In de app: Je persoonlijke strategie gebruik je dagelijks via Advies, voorraad en Academy-voortgang.
',
    '### Opdracht

Maak jouw biodynamische masterprofiel:
- favoriete dagtypes
- ideale weersomstandigheden
- gevoeligste wijnstijlen

### Checklist

- beste pairingmomenten
- reserveflessenstrategie

### Reflectievraag

Hoe heeft biodynamisch denken jouw manier van drinken veranderd?


---

Schrijf jouw:

**Personal Biodynamic Drinking Manifest**

Minimaal:

- 10 observaties
- 5 conclusies
- 3 concrete openingsstrategieën


---

### Reflectievraag

Hoe heeft biodynamisch denken jouw manier van drinken veranderd?


---

### Beoordeling

Master-level vereist:

- diepe zelfanalyse
- praktische toepasbaarheid
- strategisch inzicht
- persoonlijke consistentie
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
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 4, 'Wat is de kern?', '["Observatie", "Geloof", "Marketing", "Fermentatie"]', 0, 'Correct: Observatie'),
  ('intro-biodynamic', 'wat-is-biodynamisch-proeven', 5, 'Kan wijn anders smaken op verschillende dagen?', '["Ja", "Nee", "Alleen rood", "Alleen oud"]', 0, 'Correct: Ja'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 1, 'Wie ontwikkelde de kalender?', '["Maria Thun", "Rudolf Steiner", "Louis Pasteur", "Dom Pérignon"]', 0, 'Correct: Maria Thun'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 2, 'Waar kwam zij vandaan?', '["Duitsland", "Frankrijk", "Italië", "Spanje"]', 0, 'Correct: Duitsland'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 3, 'Wat onderzocht zij?', '["Kosmische ritmes", "Alleen regen", "Alleen temperatuur", "Alleen druiven"]', 0, 'Correct: Kosmische ritmes'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 4, 'Hoeveel dagtypes?', '["Vier", "Twee", "Drie", "Vijf"]', 0, 'Correct: Vier'),
  ('intro-biodynamic', 'maria-thun-oorsprong', 5, 'Waar wordt haar werk veel gebruikt?', '["Wijnbouw", "Bierindustrie", "Distillatie", "Koffie"]', 0, 'Correct: Wijnbouw'),
  ('intro-biodynamic', 'vier-dagtypen', 1, 'Hoeveel dagtypes?', '["Vier", "Drie", "Vijf", "Twee"]', 0, 'Correct: Vier'),
  ('intro-biodynamic', 'vier-dagtypen', 2, 'Welke dag is vaak fruitiger?', '["Vruchtdag", "Bladdag", "Worteldag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('intro-biodynamic', 'vier-dagtypen', 3, 'Welke dag draait om aroma?', '["Bloemdag", "Worteldag", "Vruchtdag", "Bladdag"]', 0, 'Correct: Bloemdag'),
  ('intro-biodynamic', 'vier-dagtypen', 4, 'Welke dag is aardser?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('intro-biodynamic', 'vier-dagtypen', 5, 'Welke dag is vegetaler?', '["Bladdag", "Bloemdag", "Vruchtdag", "Worteldag"]', 0, 'Correct: Bladdag'),
  ('intro-biodynamic', 'elementen-biodynamiek', 1, 'Wortel hoort bij:', '["Aarde", "Water", "Lucht", "Vuur"]', 0, 'Correct: Aarde'),
  ('intro-biodynamic', 'elementen-biodynamiek', 2, 'Vrucht hoort bij:', '["Vuur", "Aarde", "Water", "Lucht"]', 0, 'Correct: Vuur'),
  ('intro-biodynamic', 'elementen-biodynamiek', 3, 'Bloem hoort bij:', '["Lucht", "Water", "Vuur", "Aarde"]', 0, 'Correct: Lucht'),
  ('intro-biodynamic', 'elementen-biodynamiek', 4, 'Blad hoort bij:', '["Water", "Vuur", "Aarde", "Lucht"]', 0, 'Correct: Water'),
  ('intro-biodynamic', 'elementen-biodynamiek', 5, 'Elementen helpen bij:', '["Interpretatie", "Koeling", "Fermentatie", "Glaswerk"]', 0, 'Correct: Interpretatie'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 1, 'Waarom gebruiken sommeliers dit?', '["Voor timing", "Voor marketing", "Voor prijs", "Voor etiketten"]', 0, 'Correct: Voor timing'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 2, 'Waarom gebruiken wijnmakers dit?', '["Voor bottelen", "Voor glaswerk", "Voor opslag", "Voor labels"]', 0, 'Correct: Voor bottelen'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 3, 'Wat is het doel?', '["Maximale expressie", "Meer alcohol", "Minder zuur", "Meer suiker"]', 0, 'Correct: Maximale expressie'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 4, 'Welke dag wordt vaak gekozen?', '["Vruchtdag", "Bladdag", "Worteldag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('intro-biodynamic', 'waarom-gebruiken-professionals-dit', 5, 'Wat helpt timing?', '["Kwaliteit verbeteren", "Fermentatie versnellen", "Koeling vervangen", "Kurk verbeteren"]', 0, 'Correct: Kwaliteit verbeteren'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 1, 'Worteldag hoort bij:', '["Aarde", "Water", "Lucht", "Vuur"]', 0, 'Correct: Aarde'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 2, 'Wat staat centraal?', '["Structuur", "Fruit", "Aroma", "Zoetheid"]', 0, 'Correct: Structuur'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 3, 'Hoe voelt wijn vaak?', '["Strakker", "Zoeter", "Zachter", "Romiger"]', 0, 'Correct: Strakker'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 4, 'Waarvoor is Worteldag nuttig?', '["Terroiranalyse", "Cocktails", "Carbonatie", "Distillatie"]', 0, 'Correct: Terroiranalyse'),
  ('kalender-biodynamic', 'worteldagen-uitgelegd', 5, 'Fruit is vaak:', '["Minder dominant", "Sterker", "Zoeter", "Rijper"]', 0, 'Correct: Minder dominant'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 1, 'Bladdag hoort bij:', '["Water", "Aarde", "Vuur", "Lucht"]', 0, 'Correct: Water'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 2, 'Wat wordt versterkt?', '["Vegetaal", "Hout", "Zoet", "Alcohol"]', 0, 'Correct: Vegetaal'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 3, 'Welke stijl past soms goed?', '["Frisse witte wijn", "Vintage Port", "Barleywine", "Cognac"]', 0, 'Correct: Frisse witte wijn'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 4, 'Fruit is vaak:', '["Minder dominant", "Dominant", "Intenser", "Zoeter"]', 0, 'Correct: Minder dominant'),
  ('kalender-biodynamic', 'bladdagen-uitgelegd', 5, 'Bladdagen worden vaak gezien als:', '["Minder ideaal voor topwijn", "Beste voor rood", "Beste voor Port", "Beste voor bubbels"]', 0, 'Correct: Minder ideaal voor topwijn'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 1, 'Bloemdagen horen bij:', '["Lucht", "Water", "Vuur", "Aarde"]', 0, 'Correct: Lucht'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 2, 'Wat wordt versterkt?', '["Aroma", "Structuur", "Alcohol", "Zoetheid"]', 0, 'Correct: Aroma'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 3, 'Welke druif past?', '["Riesling", "Cabernet Sauvignon", "Syrah", "Malbec"]', 0, 'Correct: Riesling'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 4, 'Bloemdagen zijn vaak:', '["Verfijnd", "Grof", "Gesloten", "Zwaar"]', 0, 'Correct: Verfijnd'),
  ('kalender-biodynamic', 'bloemdagen-uitgelegd', 5, 'Wat staat centraal?', '["Finesse", "Tannine", "Hout", "Suiker"]', 0, 'Correct: Finesse'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 1, 'Vruchtdag hoort bij:', '["Vuur", "Aarde", "Water", "Lucht"]', 0, 'Correct: Vuur'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 2, 'Wat wordt versterkt?', '["Fruit", "Structuur", "Vegetaal", "Bitterheid"]', 0, 'Correct: Fruit'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 3, 'Welke energie hoort erbij?', '["Expressie", "Rust", "Geslotenheid", "Neutraliteit"]', 0, 'Correct: Expressie'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 4, 'Professionals kiezen vaak:', '["Vruchtdag", "Bladdag", "Worteldag", "Geen voorkeur"]', 0, 'Correct: Vruchtdag'),
  ('kalender-biodynamic', 'vruchtdagen-uitgelegd', 5, 'Waarom?', '["Maximale expressie", "Minder alcohol", "Minder zuur", "Meer suiker"]', 0, 'Correct: Maximale expressie'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 1, 'Wat toont de kalender?', '["Dagtypes", "Alleen temperatuur", "Alleen wijnadvies", "Alleen regen"]', 0, 'Correct: Dagtypes'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 2, 'Kan een dag wisselen?', '["Ja", "Nee", "Alleen in winter", "Alleen bij regen"]', 0, 'Correct: Ja'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 3, 'Wat zijn nodes?', '["Kritische momenten", "Druivenrassen", "Glastypes", "Wijnfouten"]', 0, 'Correct: Kritische momenten'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 4, 'Wat is belangrijk?', '["Tijdsblok", "Kleur wijn", "Prijs", "Leeftijd"]', 0, 'Correct: Tijdsblok'),
  ('kalender-biodynamic', 'hoe-lees-je-de-kalender', 5, 'Voor optimaal proeven kies je:', '["Stabiele blokken", "Willekeurig", "Nacht", "Alleen ochtend"]', 0, 'Correct: Stabiele blokken'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 1, 'Wat wordt versterkt?', '["Structuur", "Zoetheid", "Alcohol", "Fruit"]', 0, 'Correct: Structuur'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 2, 'Fruit is vaak:', '["Geslotener", "Open", "Zoeter", "Rijper"]', 0, 'Correct: Geslotener'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 3, 'Waarvoor is dit nuttig?', '["Structuuranalyse", "Cocktails", "Bierpairing", "Carbonatie"]', 0, 'Correct: Structuuranalyse'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 4, 'Worteldag is vaak:', '["Serieuzer", "Speelser", "Zoeter", "Lichter"]', 0, 'Correct: Serieuzer'),
  ('proeven-biodynamic', 'wijn-op-worteldag', 5, 'Wat kan beter zichtbaar worden?', '["Tannine", "Suiker", "Koolzuur", "Alcohol"]', 0, 'Correct: Tannine'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 1, 'Wat wordt vaak versterkt?', '["Vegetaal", "Hout", "Suiker", "Oxidatie"]', 0, 'Correct: Vegetaal'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 2, 'Welke stijl reageert sterk?', '["Sauvignon Blanc", "Port", "Stout", "Tawny"]', 0, 'Correct: Sauvignon Blanc'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 3, 'Hoe voelt wijn soms?', '["Groener", "Zoeter", "Dikker", "Ouder"]', 0, 'Correct: Groener'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 4, 'Bladdagen horen bij:', '["Water", "Aarde", "Lucht", "Vuur"]', 0, 'Correct: Water'),
  ('proeven-biodynamic', 'wijn-op-bladdag', 5, 'Wat kan veranderen?', '["Balansbeleving", "Alcoholpercentage", "Kleur", "Leeftijd"]', 0, 'Correct: Balansbeleving'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 1, 'Wat wordt versterkt?', '["Aroma", "Tannine", "Alcohol", "Bitterheid"]', 0, 'Correct: Aroma'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 2, 'Welke stijl past goed?', '["Riesling", "Barolo", "Vintage Port", "Stout"]', 0, 'Correct: Riesling'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 3, 'Hoe voelt wijn vaak?', '["Verfijnder", "Harder", "Zoeter", "Zwaarder"]', 0, 'Correct: Verfijnder'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 4, 'Bloemdagen horen bij:', '["Lucht", "Water", "Vuur", "Aarde"]', 0, 'Correct: Lucht'),
  ('proeven-biodynamic', 'wijn-op-bloemdag', 5, 'Wat analyseer je goed?', '["Finesse", "Koolzuur", "Alcohol", "Zoetheid"]', 0, 'Correct: Finesse'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 1, 'Wat wordt versterkt?', '["Fruit", "Vegetaal", "Bitter", "Zout"]', 0, 'Correct: Fruit'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 2, 'Hoe voelt wijn vaak?', '["Harmonieuzer", "Strenger", "Groener", "Geslotener"]', 0, 'Correct: Harmonieuzer'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 3, 'Welke dag is populair voor topflessen?', '["Vruchtdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Vruchtdag'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 4, 'Vruchtdag hoort bij:', '["Vuur", "Water", "Aarde", "Lucht"]', 0, 'Correct: Vuur'),
  ('proeven-biodynamic', 'wijn-op-vruchtdag', 5, 'Wat komt vaak samen?', '["Balans en fruit", "Hout en zout", "Suiker en bitter", "Tannine en rook"]', 0, 'Correct: Balans en fruit'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 1, 'Welke dag toont meestal de meeste structuur?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 2, 'Welke dag geeft vaak de meeste fruitexpressie?', '["Vruchtdag", "Worteldag", "Bladdag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 3, 'Welke dag is vaak ideaal voor aromatische finesse?', '["Bloemdag", "Worteldag", "Vruchtdag", "Bladdag"]', 0, 'Correct: Bloemdag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 4, 'Welke dag versterkt vegetale tonen?', '["Bladdag", "Bloemdag", "Worteldag", "Vruchtdag"]', 0, 'Correct: Bladdag'),
  ('proeven-biodynamic', 'eerste-proefexperiment', 5, 'Wat is het doel van een biodynamische vergelijkproef?', '["Verschillen herkennen", "Alcohol meten", "Leeftijd bepalen", "Druivenras raden"]', 0, 'Correct: Verschillen herkennen'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 1, 'Warmte versterkt vaak:', '["Zoetheid", "Bitterheid", "Koolzuur", "Zout"]', 0, 'Correct: Zoetheid'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 2, 'Kou versterkt vaak:', '["Zuren", "Alcohol", "Zoet", "Hout"]', 0, 'Correct: Zuren'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 3, 'Kan temperatuur perceptie veranderen?', '["Ja", "Nee", "Alleen bij bier", "Alleen bij Port"]', 0, 'Correct: Ja'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 4, 'Warmte maakt wijn soms:', '["Logger", "Strakker", "Groener", "Bitterder"]', 0, 'Correct: Logger'),
  ('weer-biodynamic', 'temperatuur-en-smaak', 5, 'Wat verandert?', '["Smaakbeleving", "Alcoholpercentage", "Leeftijd", "Druivenras"]', 0, 'Correct: Smaakbeleving'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 1, 'Hoge luchtdruk geeft vaak:', '["Focus", "Chaos", "Bitterheid", "Zoetheid"]', 0, 'Correct: Focus'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 2, 'Lage druk geeft soms:', '["Geslotenheid", "Open fruit", "Meer alcohol", "Minder zuur"]', 0, 'Correct: Geslotenheid'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 3, 'Wat verandert vaak?', '["Aromatische expressie", "Kleur", "Leeftijd", "Tannine"]', 0, 'Correct: Aromatische expressie'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 4, 'Wordt dit veel geobserveerd?', '["Ja", "Nee", "Alleen bij bier", "Alleen bij cocktails"]', 0, 'Correct: Ja'),
  ('weer-biodynamic', 'luchtdruk-en-expressie', 5, 'Is dit absolute wetenschap?', '["Nee", "Ja", "Altijd", "Nooit"]', 0, 'Correct: Nee'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 1, 'Hoge vochtigheid kan aroma:', '["Dempen", "Versterken", "Oxideren", "Fermenteren"]', 0, 'Correct: Dempen'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 2, 'Lage vochtigheid geeft vaak:', '["Meer spanning", "Meer zoet", "Meer alcohol", "Meer rijping"]', 0, 'Correct: Meer spanning'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 3, 'Wat verandert?', '["Mondgevoel", "Leeftijd", "Kleur", "Glaswerk"]', 0, 'Correct: Mondgevoel'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 4, 'Welke stijl reageert sterk?', '["Champagne", "Port", "Cognac", "Stout"]', 0, 'Correct: Champagne'),
  ('weer-biodynamic', 'luchtvochtigheid-en-perceptie', 5, 'Vochtigheid beïnvloedt:', '["Perceptie", "Alcoholpercentage", "Druivenras", "Leeftijd"]', 0, 'Correct: Perceptie'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 1, 'Weersomslag betekent:', '["Verandering", "Stabiliteit", "Zon", "Nacht"]', 0, 'Correct: Verandering'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 2, 'Wat gebeurt vaak?', '["Minder focus", "Meer balans", "Meer fruit", "Meer suiker"]', 0, 'Correct: Minder focus'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 3, 'Is dit ideaal voor topflessen?', '["Vaak niet", "Altijd wel", "Alleen rood", "Alleen wit"]', 0, 'Correct: Vaak niet'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 4, 'Wat helpt meestal?', '["Stabiliteit", "Chaos", "Regen", "Wind"]', 0, 'Correct: Stabiliteit'),
  ('weer-biodynamic', 'weersomslag-en-proeven', 5, 'Welke situatie vermijden sommeliers soms?', '["Onweerfront", "Zon", "Winter", "Ochtend"]', 0, 'Correct: Onweerfront'),
  ('weer-biodynamic', 'dynamic-vs-strategic-advice', 1, 'Dynamic advice kijkt naar:', '["Nu", "Over 6 maanden", "Alleen voorraad", "Alleen prijs"]', 0, 'Correct: Nu'),
  ('weer-biodynamic', 'dynamic-vs-strategic-advice', 2, 'Strategic advice kijkt naar:', '["Toekomst", "Alleen vandaag", "Alleen temperatuur", "Alleen druivenras"]', 0, 'Correct: Toekomst'),
  ('weer-biodynamic', 'dynamic-vs-strategic-advice', 3, 'Weerdata gaan meestal vooruit:', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('weer-biodynamic', 'dynamic-vs-strategic-advice', 4, 'Na 14 dagen gebruik je:', '["Biodynamische kalender", "Alleen temperatuur", "Alleen voorraad", "Alleen etiketten"]', 0, 'Correct: Biodynamische kalender'),
  ('weer-biodynamic', 'dynamic-vs-strategic-advice', 5, 'Wat helpt topflessen plannen?', '["Strategic advice", "Willekeur", "Alleen prijs", "Alleen leeftijd"]', 0, 'Correct: Strategic advice'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 1, 'Beste dag voor open fruit?', '["Vruchtdag", "Worteldag", "Bladdag", "Willekeurig"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 2, 'Welke dag toont structuur?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 3, 'Bloemdagen versterken:', '["Geur", "Alcohol", "Zoet", "Bitter"]', 0, 'Correct: Geur'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 4, 'Bladdagen kunnen rood:', '["Groener maken", "Zoeter maken", "Ouder maken", "Lichter maken"]', 0, 'Correct: Groener maken'),
  ('stijlen-biodynamic', 'rode-wijn-per-dagtype', 5, 'Toprood wordt vaak gepland op:', '["Vruchtdag", "Bladdag", "Worteldag", "Nacht"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 1, 'Beste dag voor finesse?', '["Bloemdag", "Worteldag", "Bladdag", "Vruchtdag"]', 0, 'Correct: Bloemdag'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 2, 'Vruchtdag versterkt:', '["Fruit", "Bitter", "Hout", "Zout"]', 0, 'Correct: Fruit'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 3, 'Bladdag geeft vaak:', '["Groenheid", "Zoet", "Rook", "Rijping"]', 0, 'Correct: Groenheid'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 4, 'Worteldag kan geven:', '["Mineraliteit", "Suiker", "Alcohol", "Schuim"]', 0, 'Correct: Mineraliteit'),
  ('stijlen-biodynamic', 'witte-wijn-per-dagtype', 5, 'Aromatische witte wijn past vaak op:', '["Bloemdag", "Worteldag", "Bladdag", "Willekeurig"]', 0, 'Correct: Bloemdag'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 1, 'Beste dag voor rosé?', '["Vruchtdag", "Worteldag", "Willekeurig", "Nacht"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 2, 'Bloemdag geeft vaak:', '["Finesse", "Meer tannine", "Meer alcohol", "Meer hout"]', 0, 'Correct: Finesse'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 3, 'Worteldag maakt rosé soms:', '["Strakker", "Zoeter", "Ouder", "Zwaarder"]', 0, 'Correct: Strakker'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 4, 'Rosé draait vooral om:', '["Fruit en frisheid", "Tannine", "Hout", "Bitter"]', 0, 'Correct: Fruit en frisheid'),
  ('stijlen-biodynamic', 'rose-per-dagtype', 5, 'Bladdag kan rosé:', '["Groener maken", "Rijper maken", "Zoeter maken", "Zwaarder maken"]', 0, 'Correct: Groener maken'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 1, 'Beste dag voor finesse?', '["Bloemdag", "Worteldag", "Bladdag", "Willekeurig"]', 0, 'Correct: Bloemdag'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 2, 'Vruchtdag geeft:', '["Openheid", "Bitterheid", "Zout", "Hout"]', 0, 'Correct: Openheid'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 3, 'Worteldag toont meer:', '["Structuur", "Zoet", "Fruit", "Schuim"]', 0, 'Correct: Structuur'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 4, 'Bladdag kan mousse:', '["Minder levendig maken", "Meer bruisend maken", "Zoeter maken", "Ouder maken"]', 0, 'Correct: Minder levendig maken'),
  ('stijlen-biodynamic', 'mousserend-per-dagtype', 5, 'Champagnehuizen kiezen vaak:', '["Bloemdag", "Bladdag", "Worteldag", "Nacht"]', 0, 'Correct: Bloemdag'),
  ('stijlen-biodynamic', 'port-per-dagtype', 1, 'Vruchtdag geeft vaak:', '["Harmonie", "Scherpte", "Bitter", "Vegetaal"]', 0, 'Correct: Harmonie'),
  ('stijlen-biodynamic', 'port-per-dagtype', 2, 'Worteldag toont vaak:', '["Structuur", "Fruit", "Zoet", "Mousse"]', 0, 'Correct: Structuur'),
  ('stijlen-biodynamic', 'port-per-dagtype', 3, 'Vintage Port profiteert vaak van:', '["Vruchtdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Vruchtdag'),
  ('stijlen-biodynamic', 'port-per-dagtype', 4, 'Port heeft vaak meer:', '["Alcohol en suiker", "Koolzuur", "Zuur", "Mousse"]', 0, 'Correct: Alcohol en suiker'),
  ('stijlen-biodynamic', 'port-per-dagtype', 5, 'Kan Port gesloten zijn?', '["Ja", "Nee", "Alleen Tawny", "Alleen Ruby"]', 0, 'Correct: Ja'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 1, 'Welke dag geeft vaak opener hopfruit?', '["Vruchtdag", "Worteldag", "Bladdag", "Nacht"]', 0, 'Correct: Vruchtdag'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 2, 'Worteldagen versterken vaak:', '["Bitterheid", "Zoetheid", "Alcohol", "Schuim"]', 0, 'Correct: Bitterheid'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 3, 'Bloemdagen geven vaak:', '["Elegantie", "Meer body", "Meer bitter", "Meer zuur"]', 0, 'Correct: Elegantie'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 4, 'Bladdagen kunnen hop:', '["Groener maken", "Zoeter maken", "Ronder maken", "Ouder maken"]', 0, 'Correct: Groener maken'),
  ('cross-biodynamic', 'bier-en-biodynamische-dagen', 5, 'Welke bierstijl reageert sterk?', '["IPA", "Pilsener", "Radler", "Maltbier"]', 0, 'Correct: IPA'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 1, 'Waarom is 0.0 gevoeliger?', '["Minder alcoholstructuur", "Meer suiker", "Meer zuur", "Meer koolzuur"]', 0, 'Correct: Minder alcoholstructuur'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 2, 'Vruchtdag helpt vaak:', '["Balans verbeteren", "Bitterheid verhogen", "Schuim verlagen", "Alcohol verhogen"]', 0, 'Correct: Balans verbeteren'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 3, 'Worteldag kan geven:', '["Hardere bitterheid", "Meer fruit", "Meer mousse", "Meer zuur"]', 0, 'Correct: Hardere bitterheid'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 4, 'Wat wordt sneller zichtbaar?', '["Zoetheid", "Leeftijd", "Herkomst", "Vatrijping"]', 0, 'Correct: Zoetheid'),
  ('cross-biodynamic', 'bier-0-0-en-timing', 5, 'Timing bij 0.0 is:', '["Belangrijker dan gedacht", "Onbelangrijk", "Alleen voor wijn", "Random"]', 0, 'Correct: Belangrijker dan gedacht'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 1, 'Wat reageert vooral?', '["Ingrediënten", "Glaswerk", "IJs", "Leeftijd"]', 0, 'Correct: Ingrediënten'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 2, 'Vruchtdag versterkt vaak:', '["Fruit", "Bitter", "Zout", "Water"]', 0, 'Correct: Fruit'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 3, 'Bloemdagen versterken vaak:', '["Botanicals", "Tannine", "Schuim", "Hout"]', 0, 'Correct: Botanicals'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 4, 'Worteldagen maken vaak sterker:', '["Bitters", "Fruit", "Suiker", "Koolzuur"]', 0, 'Correct: Bitters'),
  ('cross-biodynamic', 'cocktails-en-dagtypes', 5, 'Gin-cocktails werken vaak goed op:', '["Bloemdagen", "Worteldagen", "Bladdagen", "Nacht"]', 0, 'Correct: Bloemdagen'),
  ('cross-biodynamic', 'barrel-aged-dranken', 1, 'Vatrijping geeft:', '["Complexiteit", "Koolzuur", "Minder alcohol", "Schuim"]', 0, 'Correct: Complexiteit'),
  ('cross-biodynamic', 'barrel-aged-dranken', 2, 'Vruchtdagen geven vaak:', '["Openheid", "Bitter", "Vegetaal", "Droogte"]', 0, 'Correct: Openheid'),
  ('cross-biodynamic', 'barrel-aged-dranken', 3, 'Worteldagen tonen vaak:', '["Structuur", "Fruit", "Zoet", "Mousse"]', 0, 'Correct: Structuur'),
  ('cross-biodynamic', 'barrel-aged-dranken', 4, 'Bloemdagen tonen vaak:', '["Subtiele aroma’s", "Meer alcohol", "Minder geur", "Meer bitter"]', 0, 'Correct: Subtiele aroma’s'),
  ('cross-biodynamic', 'barrel-aged-dranken', 5, 'Welke drank past hierbij?', '["Whisky", "Pils", "Cider", "Soda"]', 0, 'Correct: Whisky'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 1, 'Waarom is alcoholvrij gevoeliger?', '["Minder structuur", "Meer suiker", "Meer zuur", "Meer koolzuur"]', 0, 'Correct: Minder structuur'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 2, 'Vruchtdag helpt vaak:', '["Fruit openen", "Bitterheid verhogen", "Alcohol verhogen", "Zout verhogen"]', 0, 'Correct: Fruit openen'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 3, 'Bloemdagen helpen bij:', '["Aroma", "Tannine", "Koolzuur", "Rijping"]', 0, 'Correct: Aroma'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 4, 'Welke categorie profiteert?', '["Alcoholvrije wijn", "Water", "Koffie", "Thee"]', 0, 'Correct: Alcoholvrije wijn'),
  ('cross-biodynamic', 'alcoholvrij-en-proefmomenten', 5, 'Timing is bij alcoholvrij:', '["Belangrijk", "Onbelangrijk", "Alleen voor experts", "Random"]', 0, 'Correct: Belangrijk'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 1, 'Welke factor is belangrijk?', '["Leeftijd", "Alleen prijs", "Alleen label", "Alleen kleur"]', 0, 'Correct: Leeftijd'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 2, 'Welke wijnen vragen meer precisie?', '["Oude wijnen", "Jonge wijnen", "Rosé", "0.0 bier"]', 0, 'Correct: Oude wijnen'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 3, 'Wat verhoogt kwaliteit?', '["Timing", "Koelkast", "Etiket", "Glasdikte"]', 0, 'Correct: Timing'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 4, 'Topflessen verdienen:', '["Optimale omstandigheden", "Willekeur", "Snelle opening", "Alleen kou"]', 0, 'Correct: Optimale omstandigheden'),
  ('voorraad-biodynamic', 'juiste-fles-juiste-moment', 5, 'Wat helpt kiezen?', '["Dagtype", "Muziek", "Tijdstip alleen", "Kleur van het etiket"]', 0, 'Correct: Dagtype'),
  ('voorraad-biodynamic', 'openen-of-wachten', 1, 'Waarom wachten?', '["Betere omstandigheden", "Minder alcohol", "Meer suiker", "Sneller rijpen"]', 0, 'Correct: Betere omstandigheden'),
  ('voorraad-biodynamic', 'openen-of-wachten', 2, 'Wat kan slecht zijn?', '["Weersomslag", "Zon", "Ochtend", "Glaswerk"]', 0, 'Correct: Weersomslag'),
  ('voorraad-biodynamic', 'openen-of-wachten', 3, 'Geduld is onderdeel van:', '["Strategie", "Marketing", "Productie", "Etiket"]', 0, 'Correct: Strategie'),
  ('voorraad-biodynamic', 'openen-of-wachten', 4, 'Wat kan wachten geven?', '["Meer balans", "Meer alcohol", "Minder smaak", "Meer zuur"]', 0, 'Correct: Meer balans'),
  ('voorraad-biodynamic', 'openen-of-wachten', 5, 'Timing kan soms belangrijker zijn dan:', '["Direct openen", "Prijs", "Leeftijd", "Druif"]', 0, 'Correct: Direct openen'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 1, 'Wat is een drinkvenster?', '["Optimale drinkfase", "Openingstijd", "Glaskeuze", "Koelkasttijd"]', 0, 'Correct: Optimale drinkfase'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 2, 'Wat voeg je toe met biodynamiek?', '["Timing", "Alcohol", "Suiker", "Leeftijd"]', 0, 'Correct: Timing'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 3, 'Peak drinking betekent:', '["Optimale combinatie", "Jong drinken", "Te laat drinken", "Sneller drinken"]', 0, 'Correct: Optimale combinatie'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 4, 'Welke dag past vaak bij top-Barolo?', '["Vruchtdag", "Bladdag", "Willekeurig", "Worteldag"]', 0, 'Correct: Vruchtdag'),
  ('voorraad-biodynamic', 'drinkvensters-en-dagtypes', 5, 'Champagne past vaak goed op:', '["Bloemdag", "Worteldag", "Bladdag", "Nacht"]', 0, 'Correct: Bloemdag'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 1, 'Slim voorraadbeheer is:', '["Proactief", "Reactief", "Willekeurig", "Chaotisch"]', 0, 'Correct: Proactief'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 2, 'Wat helpt plannen?', '["Kalender", "Etiket", "Kleur", "Kurk"]', 0, 'Correct: Kalender'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 3, 'Wat kun je vermijden?', '["Verkeerde opening", "Goede pairing", "Goed glas", "Goed weer"]', 0, 'Correct: Verkeerde opening'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 4, 'Wat verhoogt dit?', '["Controle", "Alcohol", "Leeftijd", "Koolzuur"]', 0, 'Correct: Controle'),
  ('voorraad-biodynamic', 'voorraadstrategie-topflessen', 5, 'Ready now betekent:', '["Klaar om te openen", "Nog te jong", "Over zijn piek", "Onbekend"]', 0, 'Correct: Klaar om te openen'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 1, 'Strategic planning combineert:', '["Alles", "Alleen weer", "Alleen dagtype", "Alleen leeftijd"]', 0, 'Correct: Alles'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 2, 'Weerdata gaan meestal vooruit:', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 3, 'Daarna gebruik je:', '["Kalenderlogica", "Alleen temperatuur", "Alleen prijs", "Alleen kleur"]', 0, 'Correct: Kalenderlogica'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 4, 'Wat verhoogt planning?', '["Beleving", "Alcohol", "Leeftijd", "Schuim"]', 0, 'Correct: Beleving'),
  ('voorraad-biodynamic', 'reserves-lange-termijn', 5, 'Dit is de hoogste vorm van:', '["Drinkintelligentie", "Marketing", "Productie", "Opslag"]', 0, 'Correct: Drinkintelligentie'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 1, 'Waarom noteren?', '["Patronen herkennen", "Alleen bewaren", "Alleen delen", "Alleen scoren"]', 0, 'Correct: Patronen herkennen'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 2, 'Wat noteer je?', '["Dagtype", "Alleen kleur", "Alleen prijs", "Alleen glas"]', 0, 'Correct: Dagtype'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 3, 'Wat bouwt data?', '["Inzicht", "Alcohol", "Leeftijd", "Zuur"]', 0, 'Correct: Inzicht'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 4, 'Wat helpt een journal?', '["Vergelijken", "Vergeten", "Sneller drinken", "Minder proeven"]', 0, 'Correct: Vergelijken'),
  ('intelligence-biodynamic', 'vertical-tasting-biodynamiek', 5, 'Wat groeit?', '["Geheugen", "Alcoholpercentage", "Druivenras", "Voorraad"]', 0, 'Correct: Geheugen'),
  ('intelligence-biodynamic', 'blindproeven-timing', 1, 'Wanneer ontstaan patronen?', '["Na herhaling", "Na één fles", "Nooit", "Alleen bij topwijn"]', 0, 'Correct: Na herhaling'),
  ('intelligence-biodynamic', 'blindproeven-timing', 2, 'Zijn patronen universeel?', '["Nee", "Ja", "Altijd", "Alleen bij experts"]', 0, 'Correct: Nee'),
  ('intelligence-biodynamic', 'blindproeven-timing', 3, 'Wat geven patronen?', '["Voorspelbaarheid", "Meer alcohol", "Meer suiker", "Minder geur"]', 0, 'Correct: Voorspelbaarheid'),
  ('intelligence-biodynamic', 'blindproeven-timing', 4, 'Wat helpt analyseren?', '["Vergelijken", "Willekeur", "Snelheid", "Prijs"]', 0, 'Correct: Vergelijken'),
  ('intelligence-biodynamic', 'blindproeven-timing', 5, 'Patronen zijn:', '["Persoonlijk", "Vast", "Altijd hetzelfde", "Wetenschappelijk bewezen"]', 0, 'Correct: Persoonlijk'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 1, 'Is smaak persoonlijk?', '["Ja", "Nee", "Altijd gelijk", "Alleen bij experts"]', 0, 'Correct: Ja'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 2, 'Wat bouw je?', '["Profiel", "Voorraad", "Alcohol", "Leeftijd"]', 0, 'Correct: Profiel'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 3, 'Wat helpt hierbij?', '["Data", "Willekeur", "Snel drinken", "Alleen ervaring"]', 0, 'Correct: Data'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 4, 'Wat kan onderdeel zijn?', '["Ideaal dagtype", "Alleen prijs", "Alleen glas", "Alleen kleur"]', 0, 'Correct: Ideaal dagtype'),
  ('intelligence-biodynamic', 'grote-flessen-biodynamiek', 5, 'Wat wordt hierdoor sterker?', '["Besluitvorming", "Alcohol", "Zuur", "Bitter"]', 0, 'Correct: Besluitvorming'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 1, 'Wat versterkt data?', '["Intuïtie", "Alcohol", "Leeftijd", "Zoetheid"]', 0, 'Correct: Intuïtie'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 2, 'Wat maakt data?', '["Meetbaar", "Onzichtbaar", "Willekeurig", "Emotioneel"]', 0, 'Correct: Meetbaar'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 3, 'Wat bouwt dit?', '["Slimmere keuzes", "Meer voorraad", "Meer suiker", "Meer alcohol"]', 0, 'Correct: Slimmere keuzes'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 4, 'Wat kun je analyseren?', '["Scores", "Alleen etiketten", "Alleen glazen", "Alleen prijzen"]', 0, 'Correct: Scores'),
  ('intelligence-biodynamic', 'pairing-dagtypes', 5, 'Data helpt:', '["Beslissen", "Fermenteren", "Carboneren", "Filteren"]', 0, 'Correct: Beslissen'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 1, 'Drinkintelligentie is:', '["Alles samen", "Alleen kennis", "Alleen data", "Alleen smaak"]', 0, 'Correct: Alles samen'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 2, 'Wat maakt timing sterker?', '["Observatie", "Snelheid", "Leeftijd", "Prijs"]', 0, 'Correct: Observatie'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 3, 'Wat bouw jij?', '["Eigen systeem", "Nieuwe wijn", "Nieuwe kalender", "Nieuwe druif"]', 0, 'Correct: Eigen systeem'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 4, 'Wat helpt samen?', '["Gevoel en data", "Alleen gevoel", "Alleen weer", "Alleen kalender"]', 0, 'Correct: Gevoel en data'),
  ('intelligence-biodynamic', 'eigen-biodynamisch-systeem', 5, 'Wat is de kern?', '["Waarom nu?", "Hoe duur?", "Hoe oud?", "Hoeveel alcohol?"]', 0, 'Correct: Waarom nu?'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 1, 'Wat kenmerkt een perfect drinkmoment?', '["Meerdere factoren vallen samen", "Alleen een hoge prijs", "Willekeurige timing", "Alleen het juiste glas"]', 0, 'Correct: Meerdere factoren vallen samen'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 2, 'Welke factor hoort niet bij een topmoment?', '["Alleen etiketkleur", "Drinkvenster", "Dagtype", "Weersstabiliteit"]', 0, 'Correct: Alleen etiketkleur'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 3, 'Waarom is context belangrijk?', '["Expressie hangt ook van moment af", "Wijn verandert nooit", "Alleen pairing telt", "Kalender is optioneel"]', 0, 'Correct: Expressie hangt ook van moment af'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 4, 'Wat doen ervaren sommeliers vooral goed?', '["Herkennen wannér iets op zijn best is", "Alleen veel flessen kopen", "Altijd direct openen", "Dagtypes negeren"]', 0, 'Correct: Herkennen wannér iets op zijn best is'),
  ('examen-biodynamic', 'perfect-drinkmoment-herkennen', 5, 'Wat is het doel van deze les?', '["Topmomenten herkennen en plannen", "Alleen theorie-examen halen", "Blindproeven vermijden", "Voorraad minimaliseren"]', 0, 'Correct: Topmomenten herkennen en plannen'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 1, 'Wat doet timing met kwaliteit?', '["Ontsluit potentieel", "Vervangt kwaliteit", "Maakt wijn zoeter", "Verlaagt altijd tannine"]', 0, 'Correct: Ontsluit potentieel'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 2, 'Wat kan op een minder gunstig moment gebeuren?', '["Topwijn presteert onder verwachting", "Wijn wordt permanent slecht", "Alcohol verdwijnt", "Kurk breekt altijd"]', 0, 'Correct: Topwijn presteert onder verwachting'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 3, 'Wat is de juiste houding?', '["Kwaliteit en moment zijn verbonden", "Alleen prijs telt", "Timing is onbelangrijk", "Alleen blindproeven telt"]', 0, 'Correct: Kwaliteit en moment zijn verbonden'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 4, 'Wat analyseer je in de praktijkopdracht?', '["Balans, plezier en expressie", "Alleen alcoholpercentage", "Alleen flesvorm", "Alleen jaartal"]', 0, 'Correct: Balans, plezier en expressie'),
  ('examen-biodynamic', 'timing-versus-kwaliteit', 5, 'Wat is memorabiliteit?', '["Hoe onvergetelijk een ervaring voelt", "Het etiketontwerp", "De kurklengte", "De glasvorm"]', 0, 'Correct: Hoe onvergetelijk een ervaring voelt'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 1, 'Waarom verschillen voorkeuren per proever?', '["Smaak en dagtype-respons zijn persoonlijk", "Iedereen proeft identiek", "Alleen prijs verschilt", "Kalender is voor iedereen gelijk"]', 0, 'Correct: Smaak en dagtype-respons zijn persoonlijk'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 2, 'Wat helpt bij persoonlijke stijl?', '["Eigen patronen herkennen", "Alleen scores van anderen volgen", "Nooit vergelijken", "Dagtypes vermijden"]', 0, 'Correct: Eigen patronen herkennen'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 3, 'Wat noteer je in de praktijkopdracht?', '["Favoriete en minst favoriete dagtype", "Alleen kurkleverancier", "Alleen serveertemperatuur", "Alleen winkelprijs"]', 0, 'Correct: Favoriete en minst favoriete dagtype'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 4, 'Wat betekent individuele stijl hier?', '["Theorie toegepast op jouw smaak", "Blind kopiëren van experts", "Geen observatie", "Alleen wiskunde"]', 0, 'Correct: Theorie toegepast op jouw smaak'),
  ('examen-biodynamic', 'persoonlijke-voorkeurspatronen', 5, 'Wat is het einddoel?', '["Bewuster kiezen op basis van eigen patronen", "Minder proeven", "Geen voorraad bijhouden", "Kalender negeren"]', 0, 'Correct: Bewuster kiezen op basis van eigen patronen'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 1, 'Wie ontwikkelde de biodynamische kalender?', '["Maria Thun", "Rudolf Steiner", "Louis Pasteur", "Dom Pérignon"]', 0, 'Correct: Maria Thun'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 2, 'Welke dag hoort bij vuur?', '["Vruchtdag", "Bladdag", "Bloemdag", "Worteldag"]', 0, 'Correct: Vruchtdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 3, 'Welke dag hoort bij aarde?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 4, 'Welke dag versterkt aroma?', '["Bloemdag", "Worteldag", "Bladdag", "Vruchtdag"]', 0, 'Correct: Bloemdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 5, 'Welke dag versterkt vegetale tonen?', '["Bladdag", "Bloemdag", "Worteldag", "Vruchtdag"]', 0, 'Correct: Bladdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 6, 'Wat doet hoge luchtdruk vaak?', '["Meer focus geven", "Minder balans", "Meer alcohol", "Meer suiker"]', 0, 'Correct: Meer focus geven'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 7, 'Wat doet lage luchtdruk soms?', '["Geslotenheid geven", "Meer fruit geven", "Meer mousse geven", "Meer suiker geven"]', 0, 'Correct: Geslotenheid geven'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 8, 'Wat beïnvloedt luchtvochtigheid?', '["Aroma en mondgevoel", "Leeftijd", "Alcoholpercentage", "Druivenras"]', 0, 'Correct: Aroma en mondgevoel'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 9, 'Welke dag is vaak ideaal voor Champagne?', '["Bloemdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Bloemdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 10, 'Welke dag is vaak ideaal voor Vintage Port?', '["Vruchtdag", "Bladdag", "Worteldag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 11, 'Wat betekent Dynamic Advice?', '["Drinkadvies voor nu", "Drinkadvies over 6 maanden", "Alleen voorraadbeheer", "Alleen weer"]', 0, 'Correct: Drinkadvies voor nu'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 12, 'Wat betekent Strategic Advice?', '["Lange termijn planning", "Alleen vandaag", "Alleen pairing", "Alleen weer"]', 0, 'Correct: Lange termijn planning'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 13, 'Hoe ver gaat weerdata meestal?', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 14, 'Wat gebruik je daarna?', '["Biodynamische kalender", "Alleen temperatuur", "Alleen voorraad", "Alleen prijs"]', 0, 'Correct: Biodynamische kalender'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 15, 'Wat bouw je met tasting notes?', '["Patronen", "Alcohol", "Leeftijd", "Kleur"]', 0, 'Correct: Patronen'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 16, 'Wat helpt patronen herkennen?', '["Herhaling", "Willekeur", "Snelheid", "Leeftijd"]', 0, 'Correct: Herhaling'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 17, 'Wat bouw je met data?', '["Persoonlijk smaakprofiel", "Nieuwe wijn", "Nieuwe kalender", "Nieuwe druif"]', 0, 'Correct: Persoonlijk smaakprofiel'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 18, 'Wat is peak drinking?', '["Optimale combinatie van rijpheid en timing", "Jong drinken", "Te laat drinken", "Blind proeven"]', 0, 'Correct: Optimale combinatie van rijpheid en timing'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 19, 'Wat is de kern van drinkintelligentie?', '["Waarom nu?", "Hoe duur?", "Hoe oud?", "Hoeveel alcohol?"]', 0, 'Correct: Waarom nu?'),
  ('examen-biodynamic', 'open-examen-biodynamisch', 20, 'Wat is het hoogste doel van biodynamisch proeven?', '["Optimale timing en expressie", "Meer alcohol", "Meer suiker", "Sneller drinken"]', 0, 'Correct: Optimale timing en expressie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
