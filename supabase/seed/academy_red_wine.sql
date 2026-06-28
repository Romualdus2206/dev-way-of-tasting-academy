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
    'Rode wijn wordt gemaakt van blauwe druiven.

Het bijzondere aan rode wijn is dat tijdens de vergisting de schillen in contact blijven met het sap. Dit noemen we schilcontact.

Juist in de schillen zitten:

- kleurstoffen
- tannines
- aroma’s

Daardoor krijgt rode wijn:

- kleur
- structuur
- grip
- bewaarpotentieel

Niet alle rode wijn is zwaar.

Er bestaan lichte, elegante stijlen en krachtige, complexe stijlen.

Rode wijn is één van de meest veelzijdige wijncategorieën ter wereld.
',
    '- rode wijn
- schilcontact
- tannine
- blauwe druiven
- kleur
',
    'Zonder schilcontact zou rode wijn bijna kleurloos zijn.
',
    '- Rode wijn komt van blauwe druiven
- De kleur komt uit de schillen
- Tannines geven structuur
- Rode wijn kent veel stijlen
- Schilcontact is essentieel
',
    '### Opdracht

Zoek thuis of online een fles rode wijn.

### Checklist

- Ik heb de druivensoort bekeken
- Ik heb het alcoholpercentage bekeken
- Ik heb het land van herkomst bekeken
- Ik heb de stijl ingeschat

### Reflectievraag

Denk je dat deze wijn licht, medium of krachtig is?
',
    8,
    1
  ),
  (
    'hoe-ontstaat-rode-wijn',
    'Hoe ontstaat rode wijn?',
    'Na deze les kun jij het basisproces van rode wijn uitleggen.
',
    'Het maken van rode wijn begint met de oogst.

Daarna volgen deze stappen:

1. Ontstelen
2. Kneuzen
3. Vergisten
4. Schilcontact
5. Persen
6. Rijping
7. Botteling

Tijdens de vergisting zetten gisten suiker om in alcohol.

Omdat schillen aanwezig blijven, ontstaat extractie.

Extractie betekent dat kleur, tannines en aroma’s uit de schillen vrijkomen.

Hoe langer dit duurt, hoe krachtiger de wijn vaak wordt.
',
    '- fermentatie
- extractie
- vergisting
- persen
- rijping
',
    'Sommige topwijnen vergisten meer dan 30 dagen op schil.
',
    '- Rode wijn ontstaat via fermentatie
- Schillen spelen een hoofdrol
- Extractie bepaalt kracht
- Rijping verfijnt de wijn
',
    '### Opdracht

Maak een simpel schema van het productieproces.

### Checklist

- Ik heb alle stappen genoteerd
- Ik begrijp waar extractie plaatsvindt
- Ik begrijp waar alcohol ontstaat

### Reflectievraag

Welke stap lijkt jou het belangrijkst?
',
    8,
    2
  ),
  (
    'waarom-is-rode-wijn-uniek',
    'Waarom is rode wijn uniek?',
    'Na deze les begrijp jij waarom rode wijn anders is dan andere wijnstijlen.
',
    'Rode wijn onderscheidt zich door:

- tannines
- structuur
- body
- rijpingspotentieel

Tannines geven grip in je mond.

Ze zorgen ervoor dat rode wijn vaak goed combineert met eten.

Daarnaast kan rode wijn zich jarenlang ontwikkelen.

Met rijping ontstaan complexe aroma’s zoals:

- leer
- tabak
- bosgrond
- truffel

Geen andere wijnstijl combineert kracht, elegantie en bewaarpotentieel op dezelfde manier.
',
    '- tannine
- body
- rijping
- complexiteit
- pairing
',
    'Top Bordeaux kan tientallen jaren rijpen.
',
    '- Rode wijn heeft tannines
- Rode wijn heeft body
- Rode wijn kan rijpen
- Rode wijn is gastronomisch sterk
',
    '### Opdracht

Bedenk drie gerechten waarbij rode wijn goed past.

### Checklist

- Ik heb drie gerechten bedacht
- Ik heb rekening gehouden met kracht
- Ik heb over tannines nagedacht

### Reflectievraag

Welke combinatie lijkt jou het beste?
',
    8,
    3
  ),
  (
    'geschiedenis-rode-wijn',
    'Geschiedenis van rode wijn',
    'Na deze les begrijp jij hoe rode wijn zich historisch ontwikkelde.
',
    'Rode wijn bestaat al duizenden jaren.

De oudste wijnsporen zijn meer dan 8000 jaar oud.

De Romeinen verspreidden wijnbouw door Europa.

Later ontwikkelden regio’s zoals:

- Bordeaux
- Bourgogne
- Rioja
- Piemonte

hun eigen rode wijnstijlen.

Vandaag is rode wijn wereldwijd de meest bekende wijncategorie.
',
    '- geschiedenis
- Romeinen
- Bordeaux
- Rioja
- Piemonte
',
    'De Romeinen plantten al wijnstokken in Bordeaux.
',
    '- Rode wijn bestaat al duizenden jaren
- Romeinen verspreidden wijnbouw
- Europa ontwikkelde klassieke stijlen
- Rode wijn werd wereldwijd dominant
',
    '### Opdracht

Zoek de drie oudste beroemde rode wijngebieden.

### Checklist

- Ik heb drie regio’s gevonden
- Ik weet in welk land ze liggen
- Ik weet welke druiven daar groeien

### Reflectievraag

Welke regio wil jij ooit bezoeken?
',
    8,
    4
  ),
  (
    'rode-wijncategorieen',
    'Belangrijkste rode wijncategorieën',
    'Na deze les herken jij de belangrijkste stijlcategorieën van rode wijn.
',
    'Rode wijn kun je grofweg verdelen in:

- licht
- medium body
- krachtig
- houtgelagerd
- bewaarpotentieel

Lichte rode wijn:
fris, elegant, vaak minder tannine.

Medium body:
meer balans tussen fruit en structuur.

Krachtige rode wijn:
veel tannine, alcohol en concentratie.

Dit helpt je later sneller herkennen wat je proeft.
',
    '- body
- stijl
- tannine
- licht
- krachtig',
    'Pinot Noir en Nebbiolo kunnen qua kleur vergelijkbaar lijken, maar totaal anders smaken.
',
    '- Rode wijn kent verschillende stijlen
- Body is een belangrijk onderscheid
- Tannine bepaalt structuur
- Kracht zegt niet altijd kwaliteit
',
    '### Opdracht

Zoek drie rode wijnen en deel ze in.

### Checklist

- Ik heb drie wijnen bekeken
- Ik heb body ingeschat
- Ik heb de druif bekeken

### Reflectievraag

Welke stijl drink jij het liefst?
',
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
    'Schilcontact betekent dat het druivensap tijdens de vergisting in contact blijft met de schillen.

Dit is cruciaal voor rode wijn.

De schillen geven:

- kleur
- tannines
- aroma’s

Hoe langer het schilcontact duurt:

- hoe donkerder de kleur
- hoe steviger de structuur
- hoe hoger de tannines

Bij sommige lichte rode wijnen is schilcontact kort.

Bij krachtige rode wijnen duurt dit vaak veel langer.
',
    '- schilcontact
- kleur
- tannine
- structuur
- extractie
',
    'Pinot Noir heeft vaak dunne schillen en daardoor lichtere kleur.
',
    '- Schilcontact geeft kleur
- Schilcontact geeft tannine
- Duur bepaalt intensiteit
- Zonder schillen geen echte rode wijnstijl
',
    '### Opdracht

Vergelijk een lichte en een krachtige rode wijn.

### Checklist

- Ik heb de kleur bekeken
- Ik heb het mondgevoel vergeleken
- Ik heb de tannines vergeleken

### Reflectievraag

Welke wijn had waarschijnlijk langer schilcontact?
',
    8,
    1
  ),
  (
    'extractie-kleur-tannine',
    'Extractie van kleur en tannine',
    'Na deze les begrijp jij wat extractie betekent.
',
    'Extractie is het proces waarbij stoffen uit schillen vrijkomen.

Belangrijkste stoffen:

- anthocyanen (kleur)
- tannines
- aroma’s

Extractie wordt beïnvloed door:

- temperatuur
- tijd
- beweging

Wijnmakers kunnen sturen hoeveel kracht een wijn krijgt.

Meer extractie betekent meestal:

- meer body
- meer structuur
- meer bewaarpotentieel

Maar te veel extractie kan wijn hard maken.

Balans is essentieel.
',
    '- extractie
- anthocyanen
- tannines
- body
- balans
',
    'Nebbiolo heeft veel tannine maar relatief lichte kleur.
',
    '- Extractie haalt stoffen uit schillen
- Tijd en temperatuur zijn belangrijk
- Meer extractie geeft meer kracht
- Balans blijft cruciaal
',
    '### Opdracht

Proef een jonge rode wijn.

### Checklist

- Ik lette op grip
- Ik lette op kleur
- Ik lette op intensiteit

### Reflectievraag

Voelde de wijn stevig of zacht?
',
    8,
    2
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting',
    'Na deze les kun jij uitleggen hoe alcohol ontstaat.
',
    'Tijdens de gisting zetten gisten suiker om in alcohol.

Dit gebeurt vanzelf.

De formule is simpel:

Suiker → Alcohol + CO₂ + warmte

Bij rode wijn gebeurt dit meestal warmer dan bij witte wijn.

Warmte helpt extractie.

Typische temperatuur:

25–32°C

Te warm kan aroma’s beschadigen.

Te koud geeft minder extractie.
',
    '- gisting
- alcohol
- gist
- temperatuur
- fermentatie
',
    'Tijdens gisting komt zoveel warmte vrij dat tanks gekoeld moeten worden.
',
    '- Gist maakt alcohol
- Suiker is de basis
- Warmte is belangrijk
- Temperatuur beïnvloedt stijl
',
    '### Opdracht

Bekijk een fermentatietank online.

### Checklist

- Ik heb een tank gezien
- Ik weet waarom temperatuur belangrijk is
- Ik begrijp waarom koeling nodig is

### Reflectievraag

Waarom zou temperatuurcontrole belangrijk zijn?
',
    8,
    3
  ),
  (
    'houtlagering',
    'Houtlagering',
    'Na deze les begrijp jij wat hout doet met rode wijn.
',
    'Veel rode wijn rijpt op houten vaten.

Meestal eikenhout.

Hout kan geven:

- vanille
- toast
- koffie
- specerijen

Daarnaast laat hout kleine hoeveelheden zuurstof door.

Dat helpt tannines zachter maken.

Nieuw hout geeft meer smaak.

Oud hout geeft minder smaak.

Niet elke wijn heeft hout nodig.
',
    '- houtlagering
- eikenhout
- barrique
- zuurstof
- vanille
',
    'Barrique is vaak 225 liter.
',
    '- Hout geeft smaak
- Hout verzacht tannines
- Nieuw hout is krachtiger
- Niet elke wijn gebruikt hout
',
    '### Opdracht

Zoek een wijn met houtrijping.

### Checklist

- Ik heb houtrijping op het etiket gevonden
- Ik heb aroma’s benoemd
- Ik heb het verschil met niet-hout bedacht

### Reflectievraag

Welke houtaroma’s herken jij het liefst?
',
    8,
    4
  ),
  (
    'rijping-rode-wijn',
    'Rijping van rode wijn',
    'Na deze les begrijp jij wat rijping doet met rode wijn.
',
    'Rijping verandert wijn.

Jonge wijn heeft vaak:

- veel fruit
- stevige tannines
- frisse energie

Oudere wijn ontwikkelt:

- zachtere tannines
- meer complexiteit
- tertiaire aroma’s

Voorbeelden:

- leer
- tabak
- aarde
- truffel

Niet elke wijn wordt beter met leeftijd.

Structuur en balans bepalen bewaarpotentieel.
',
    '- rijping
- tertiair
- bewaarpotentieel
- complexiteit
- evolutie',
    'Sommige topwijnen rijpen 30+ jaar.
',
    '- Rijping verandert smaak
- Tannines worden zachter
- Complexiteit neemt toe
- Niet elke wijn is geschikt om te bewaren
',
    '### Opdracht

Vergelijk een jonge en oudere rode wijn.

### Checklist

- Ik heb kleur vergeleken
- Ik heb aroma’s vergeleken
- Ik heb structuur vergeleken

### Reflectievraag

Welke stijl vond jij interessanter?
',
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
    'Wijn proef je altijd in drie stappen:

1. Kijken
2. Ruiken
3. Proeven

Bij kijken let je op:

- kleur
- helderheid
- intensiteit

Bij ruiken let je op:

- fruit
- kruiden
- hout
- ontwikkeling

Bij proeven let je op:

- zuurgraad
- tannines
- alcohol
- body
- lengte

Een vaste structuur helpt je sneller en beter herkennen.

Professionals proeven altijd op deze manier.
',
    '- proeven
- kijken
- ruiken
- structuur
- balans
',
    'De eerste indruk van kleur vertelt vaak al veel over druif en leeftijd.
',
    '- Proeven gebeurt in drie stappen
- Kijken geeft veel informatie
- Ruiken onthult aroma’s
- Proeven laat structuur zien
',
    '### Opdracht

Proef een rode wijn volgens de drie stappen.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb mijn indrukken genoteerd

### Reflectievraag

Welke stap vond je het meest leerzaam?
',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij kleur en intensiteit van rode wijn analyseren.
',
    'Kleur geeft veel informatie.

Je kijkt naar:

- intensiteit
- tint
- rand

Voorbeelden:

Licht:
- Pinot Noir
- Gamay

Diep:
- Cabernet Sauvignon
- Syrah
- Malbec

Een jonge wijn heeft vaak:

- paarse tonen

Een oudere wijn:

- granaat
- baksteen

De rand van de wijn vertelt vaak iets over leeftijd.
',
    '- kleur
- intensiteit
- rand
- granaat
- evolutie
',
    'Nebbiolo kan licht van kleur zijn maar extreem krachtig smaken.
',
    '- Kleur zegt iets over druif
- Kleur zegt iets over leeftijd
- De rand is belangrijk
- Licht betekent niet altijd licht van smaak
',
    '### Opdracht

Bekijk twee rode wijnen naast elkaar.

### Checklist

- Ik heb kleur vergeleken
- Ik heb intensiteit vergeleken
- Ik heb leeftijd ingeschat

### Reflectievraag

Welke wijn leek ouder?
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les herken jij de drie aroma-lagen.
',
    'Aroma’s zijn verdeeld in drie groepen:

Primair:
uit de druif

Voorbeelden:
- kers
- braam
- pruim

Secundair:
uit de wijnmaak

Voorbeelden:
- toast
- vanille
- boter

Tertiair:
uit rijping

Voorbeelden:
- leer
- tabak
- aarde

Door deze lagen te herkennen kun je veel sneller wijn begrijpen.
',
    '- primair
- secundair
- tertiair
- complexiteit
- aroma
',
    'Oude Bordeaux ruikt vaak naar sigarenkistje.
',
    '- Primair = druif
- Secundair = productie
- Tertiair = rijping
- Samen vormen ze complexiteit
',
    '### Opdracht

Ruik aan een rode wijn en benoem drie aroma’s.

### Checklist

- Ik vond fruit
- Ik vond hout of kruiden
- Ik dacht na over rijping

### Reflectievraag

Welke geur vond je het makkelijkst?
',
    8,
    3
  ),
  (
    'tannines-herkennen',
    'Tannines herkennen',
    'Na deze les kun jij tannines herkennen en beoordelen.
',
    'Tannines geven grip.

Ze voelen drogend in je mond.

Je merkt ze vooral:

- op je tandvlees
- op je tong
- in je wangen

Lichte tannines:
zacht en soepel.

Hoge tannines:
droog en stevig.

Druiven met veel tannines:

- Cabernet Sauvignon
- Nebbiolo
- Syrah

Tannines zijn belangrijk voor rijping.
',
    '- tannine
- grip
- droog
- structuur
- rijping
',
    'Water neutraliseert tannines niet goed; eiwit wel.
',
    '- Tannines geven grip
- Ze drogen de mond
- Ze helpen bij rijping
- Ze combineren sterk met vlees
',
    '### Opdracht

Proef een jonge Cabernet Sauvignon.

### Checklist

- Ik voelde grip
- Ik voelde droogte
- Ik beoordeelde de intensiteit

### Reflectievraag

Waren de tannines zacht of stevig?
',
    8,
    4
  ),
  (
    'mini-toets-rode-wijn',
    'Mini-toets Rode Wijn',
    'Na deze les toets jij jouw kennis van Module 1–3.
',
    'Je hebt nu geleerd:

- wat rode wijn is
- hoe het wordt gemaakt
- hoe je het proeft
- hoe je kleur analyseert
- hoe aroma’s werken
- hoe tannines voelen

Deze toets combineert alles.
',
    '- proeven
- kleur
- aroma
- tannine
- balans',
    '',
    '',
    '### Opdracht

Proef blind één rode wijn.

### Checklist

- Ik keek systematisch
- Ik rook systematisch
- Ik proefde systematisch
- Ik noteerde body, tannines en aroma’s

### Reflectievraag

Wat vond je het moeilijkst?
',
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
    ':contentReference[oaicite:0]{index=0} is één van de meest beroemde blauwe druiven ter wereld.

De druif staat bekend om:

- lichte kleur
- hoge zuren
- lage tot medium tannines
- elegantie

Typische aroma’s:

- kers
- aardbei
- framboos
- bosgrond
- paddenstoel

Pinot Noir is gevoelig in de wijngaard en lastig te verbouwen.

Belangrijke regio’s:

- :contentReference[oaicite:1]{index=1}
- :contentReference[oaicite:2]{index=2}
- :contentReference[oaicite:3]{index=3}
',
    '- Pinot Noir
- elegantie
- zuur
- rood fruit
- terroir
',
    'Pinot Noir is genetisch één van de oudste druivenrassen.
',
    '- Licht en elegant
- Hoge zuren
- Lage tannines
- Grote terroirgevoeligheid
',
    'Proef een Pinot Noir en let op elegantie en frisheid.
',
    10,
    1
  ),
  (
    'gamay',
    'Gamay',
    'Na deze les herken jij Gamay.
',
    ':contentReference[oaicite:4]{index=4} staat vooral bekend uit :contentReference[oaicite:5]{index=5}.

Kenmerken:

- sappig fruit
- lage tannines
- frisse stijl
- directe drinkbaarheid

Typische aroma’s:

- banaan
- aardbei
- framboos
- violet

Vaak gemaakt via carbonic maceration.

Dat geeft extra fruitigheid.
',
    '- Gamay
- Beaujolais
- fruitig
- carbonic
- fris
',
    'Beaujolais Nouveau is wereldwijd één van de snelst uitgebrachte wijnen.
',
    '- Fruitig
- Licht
- Sappig
- Lage tannines
',
    'Vergelijk Gamay met Pinot Noir.
',
    10,
    2
  ),
  (
    'grenache',
    'Grenache',
    'Na deze les begrijp jij Grenache.
',
    ':contentReference[oaicite:6]{index=6} geeft vaak warme, rijpe en alcoholrijke wijnen.

Kenmerken:

- rijp rood fruit
- kruiden
- zachte tannines
- hogere alcohol

Belangrijke regio’s:

- :contentReference[oaicite:7]{index=7}
- :contentReference[oaicite:8]{index=8}

Grenache houdt van warmte.

Vaak onderdeel van blends.
',
    '- Grenache
- blend
- alcohol
- kruidig
- warm
',
    'Grenache is één van de meest aangeplante druiven ter wereld.
',
    '- Warm klimaat
- Rijp fruit
- Kruidig
- Vaak blendpartner
',
    'Zoek een Grenache-blend.
',
    10,
    3
  ),
  (
    'cinsault',
    'Cinsault',
    'Na deze les herken jij Cinsault.
',
    ':contentReference[oaicite:9]{index=9} is licht, zacht en aromatisch.

Kenmerken:

- lage tannines
- rood fruit
- bloemig
- soepel

Vaak gebruikt in blends.

Belangrijk in:

- Zuid-Frankrijk
- Zuid-Afrika
- Libanon

Cinsault speelt ook een rol in roséproductie.
',
    '- Cinsault
- soepel
- licht
- blend
- rosé
',
    'Cinsault is ouder van Pinotage.
',
    '- Licht
- Soepel
- Aromatisch
- Blenddruif
',
    'Vergelijk Cinsault met Grenache.
',
    8,
    4
  ),
  (
    'mencia',
    'Mencía',
    'Na deze les begrijp jij Mencía.
',
    ':contentReference[oaicite:10]{index=10} is een Spaanse druif met veel finesse.

Belangrijk in:

- :contentReference[oaicite:11]{index=11}
- :contentReference[oaicite:12]{index=12}

Kenmerken:

- rood fruit
- florale tonen
- mineraliteit
- frisse zuren
- medium tannines

Mencía combineert elegantie met spanning.

Daardoor is het een opkomende favoriet.
',
    '- Mencía
- Spanje
- mineraliteit
- fris
- elegant

---

# Module afsluiting

Je beheerst nu de belangrijkste lichte rode druiven.

Hierna ga je verder met:

**Module 5 — Medium Body Druiven**
- Merlot
- Sangiovese
- Tempranillo
- Barbera
- Zinfandel

Dit vormt de brug tussen elegantie en kracht.',
    'Veel top-Mencía komt van extreem steile wijngaarden.
',
    '- Fris
- Bloemig
- Mineraal
- Elegant
',
    'Zoek een Mencía en vergelijk met Pinot Noir.
',
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
    ':contentReference[oaicite:0]{index=0} is één van de meest aangeplante rode druiven ter wereld.

Merlot staat bekend om:

- zachte tannines
- rijp fruit
- ronde structuur
- toegankelijkheid

Typische aroma’s:

- pruim
- zwarte kers
- chocolade
- kruiden

Merlot is vaak zachter dan Cabernet Sauvignon.

Belangrijke regio’s:

- :contentReference[oaicite:1]{index=1}
- :contentReference[oaicite:2]{index=2}
- :contentReference[oaicite:3]{index=3}
',
    '- Merlot
- pruim
- rond
- zacht
- Bordeaux
',
    ':contentReference[oaicite:4]{index=4} is één van de beroemdste Merlot-wijnen ter wereld.
',
    '- Zacht
- Rond
- Fruitig
- Toegankelijk
',
    'Vergelijk Merlot met Cabernet Sauvignon.
',
    10,
    1
  ),
  (
    'sangiovese',
    'Sangiovese',
    'Na deze les herken jij Sangiovese.
',
    ':contentReference[oaicite:5]{index=5} is de belangrijkste druif van Italië.

Belangrijk in:

- :contentReference[oaicite:6]{index=6}
- :contentReference[oaicite:7]{index=7}

Kenmerken:

- hoge zuren
- medium tannines
- kersenfruit
- aardse tonen

Sangiovese combineert frisheid met structuur.

Daardoor is hij zeer gastronomisch.
',
    '- Sangiovese
- Chianti
- Brunello
- zuur
- kers
',
    'Brunello is een pure Sangiovese-kloon.
',
    '- Hoge zuren
- Kers
- Aards
- Gastronomisch
',
    'Proef een Chianti.
',
    10,
    2
  ),
  (
    'tempranillo',
    'Tempranillo',
    'Na deze les herken jij Tempranillo.
',
    ':contentReference[oaicite:8]{index=8} is de koningsdruif van Spanje.

Belangrijk in:

- :contentReference[oaicite:9]{index=9}
- :contentReference[oaicite:10]{index=10}

Kenmerken:

- rood fruit
- leer
- tabak
- kruiden

Tempranillo rijpt vaak op Amerikaans of Frans eiken.

Dat geeft extra complexiteit.
',
    '- Tempranillo
- Rioja
- hout
- leer
- tabak
',
    'Rioja Reserva moet wettelijk rijpen.
',
    '- Klassiek Spaans
- Leer
- Tabak
- Structuur
',
    'Vergelijk jonge en gerijpte Rioja.
',
    10,
    3
  ),
  (
    'barbera',
    'Barbera',
    'Na deze les herken jij Barbera.
',
    ':contentReference[oaicite:11]{index=11} komt vooral uit :contentReference[oaicite:12]{index=12}.

Kenmerken:

- hoge zuren
- laag tannine
- sappig fruit
- soepel mondgevoel

Typische aroma’s:

- kers
- pruim
- specerijen

Barbera is vaak direct drinkbaar.
',
    '- Barbera
- zuur
- soepel
- Piemonte
- sappig
',
    'Barbera heeft vaak meer zuren dan Nebbiolo.
',
    '- Veel zuur
- Weinig tannine
- Sappig
- Toegankelijk
',
    'Vergelijk Barbera met Sangiovese.
',
    8,
    4
  ),
  (
    'zinfandel',
    'Zinfandel',
    'Na deze les begrijp jij Zinfandel.
',
    ':contentReference[oaicite:13]{index=13} is vooral beroemd in Californië.

Belangrijk in:

- :contentReference[oaicite:14]{index=14}
- :contentReference[oaicite:15]{index=15}

Kenmerken:

- rijp zwart fruit
- jammy stijl
- peper
- hogere alcohol

Zinfandel kan krachtig zijn, maar behoudt vaak sappigheid.
',
    '- Zinfandel
- Primitivo
- Californië
- jammy
- peper

---

# Module afsluiting

Je beheerst nu de belangrijkste medium body rode druiven.

Hierna ga je verder met:

**Module 6 — Krachtige Rode Druiven**
- Cabernet Sauvignon
- Syrah
- Malbec
- Nebbiolo
- Mourvèdre

Dit is het zwaarste en meest gestructureerde deel van rode wijn.',
    'Zinfandel is genetisch hetzelfde als Primitivo.
',
    '- Rijk
- Rijp
- Jammy
- Alcoholrijk
',
    'Vergelijk Zinfandel met Grenache.
',
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
    ':contentReference[oaicite:0]{index=0} is misschien wel de bekendste rode druif ter wereld.

Kenmerken:

- hoge tannines
- hoge structuur
- veel bewaarpotentieel
- donker fruit

Typische aroma’s:

- cassis
- zwarte bes
- ceder
- tabak
- paprika

Belangrijke regio’s:

- :contentReference[oaicite:1]{index=1}
- :contentReference[oaicite:2]{index=2}
- :contentReference[oaicite:3]{index=3}

Cabernet is vaak de ruggengraat van blends.
',
    '- Cabernet Sauvignon
- cassis
- ceder
- tannine
- structuur
',
    'Cabernet Sauvignon ontstond uit een kruising van Cabernet Franc en Sauvignon Blanc.
',
    '- Hoge tannines
- Donker fruit
- Groot bewaarpotentieel
- Structuurrijk
',
    'Vergelijk Cabernet met Merlot.
',
    10,
    1
  ),
  (
    'syrah',
    'Syrah',
    'Na deze les herken jij Syrah.
',
    ':contentReference[oaicite:4]{index=4} is beroemd om zijn kracht en kruidigheid.

Belangrijke regio’s:

- :contentReference[oaicite:5]{index=5}
- :contentReference[oaicite:6]{index=6}

Kenmerken:

- zwarte peper
- braam
- olijf
- rook
- viooltjes

Koel klimaat geeft meer peper.

Warm klimaat geeft meer rijp fruit.
',
    '- Syrah
- Shiraz
- peper
- braam
- Rhône
',
    'In Australië heet Syrah meestal Shiraz.
',
    '- Peperig
- Donker fruit
- Krachtig
- Klimaatgevoelig
',
    'Vergelijk Rhône Syrah met Australische Shiraz.
',
    10,
    2
  ),
  (
    'malbec',
    'Malbec',
    'Na deze les herken jij Malbec.
',
    ':contentReference[oaicite:7]{index=7} komt oorspronkelijk uit Frankrijk, maar werd beroemd in Argentinië.

Belangrijke regio’s:

- :contentReference[oaicite:8]{index=8}
- :contentReference[oaicite:9]{index=9}

Kenmerken:

- donker fruit
- zachte textuur
- chocolade
- viooltjes
- medium tot hoge tannines

Malbec is vaak toegankelijker dan Cabernet.
',
    '- Malbec
- Mendoza
- Cahors
- donker fruit
- vol
',
    'Cahors werd vroeger “de zwarte wijn” genoemd.
',
    '- Donker
- Zacht
- Vol
- Fruitgedreven
',
    'Proef Malbec naast Cabernet.
',
    10,
    3
  ),
  (
    'nebbiolo',
    'Nebbiolo',
    'Na deze les herken jij Nebbiolo.
',
    ':contentReference[oaicite:10]{index=10} is de koning van :contentReference[oaicite:11]{index=11}.

Belangrijk in:

- :contentReference[oaicite:12]{index=12}
- :contentReference[oaicite:13]{index=13}

Nebbiolo is uniek:

- lichte kleur
- extreem hoge tannines
- hoge zuren
- groot bewaarpotentieel

Typische aroma’s:

- roos
- teer
- truffel
- kers
',
    '- Nebbiolo
- Barolo
- teer
- roos
- tannine
',
    'Nebbiolo kan decennia rijpen.
',
    '- Licht van kleur
- Extreem krachtig
- Hoog zuur
- Hoog tannine
',
    'Vergelijk Nebbiolo met Pinot Noir.
',
    10,
    4
  ),
  (
    'mourvedre',
    'Mourvèdre',
    'Na deze les herken jij Mourvèdre.
',
    ':contentReference[oaicite:14]{index=14} is krachtig, kruidig en vaak wild van karakter.

Belangrijk in:

- :contentReference[oaicite:15]{index=15}
- :contentReference[oaicite:16]{index=16}

Kenmerken:

- donker fruit
- kruiden
- leer
- vleesachtige tonen
- stevige tannines

Vaak gebruikt in blends met Grenache en Syrah.
',
    '- Mourvèdre
- Bandol
- Jumilla
- kruidig
- wild

---

# Module afsluiting

Je beheerst nu de belangrijkste krachtige rode druiven.

Hierna start het Master-niveau:

**Module 7 — Service**
- Serveertemperatuur
- Glaswerk
- Decanteren
- Bewaren & kelderen

Vanaf hier verschuift de focus van druif naar praktijk.',
    'Mourvèdre rijpt laat en heeft veel zon nodig.
',
    '- Wild
- Kruidig
- Structuurrijk
- Blendpartner
',
    'Zoek een GSM-blend (Grenache-Syrah-Mourvèdre).
',
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
    'Temperatuur heeft enorme invloed op smaak.

Te warm:

- alcohol wordt dominant
- wijn wordt log
- fruit verliest frisheid

Te koud:

- tannines worden harder
- aroma’s sluiten zich
- structuur wordt strakker

Richtlijnen:

Lichte rode wijn:
12–14°C

Medium body:
14–16°C

Krachtige rode wijn:
16–18°C

Oude complexe wijnen:
17–18°C

“Kamertemperatuur” is vaak te warm.
',
    '- temperatuur
- balans
- aroma
- alcohol
- structuur
',
    'Vroeger was kamertemperatuur rond de 16°C.
',
    '- Temperatuur verandert smaak
- Te warm is onbalans
- Te koud sluit aroma’s
- Type wijn bepaalt temperatuur
',
    '### Opdracht

Meet thuis de temperatuur van een rode wijn.

### Checklist

- Ik heb de temperatuur gemeten
- Ik heb geproefd
- Ik heb temperatuur aangepast
- Ik proefde het verschil

### Reflectievraag

Wat veranderde het meest?
',
    8,
    1
  ),
  (
    'glaswerk-rode-wijn',
    'Glaswerk',
    'Na deze les begrijp jij welk glas bij welke rode wijn past.
',
    'Glasvorm beïnvloedt geur en smaak.

Een groter glas:

- geeft meer zuurstof
- opent aroma’s
- verzacht tannines

Basisregels:

Pinot Noir:
breed en bol glas

Cabernet Sauvignon:
hoog en breed

Syrah:
iets smaller

Nebbiolo:
groot en open

Te kleine glazen beperken expressie.

Goed glaswerk verhoogt de wijnervaring.
',
    '- glaswerk
- aroma
- zuurstof
- vorm
- concentratie
',
    'Professionele proevers gebruiken vaak universele glazen om objectief te blijven.
',
    '- Glasvorm beïnvloedt aroma
- Groot glas helpt krachtige wijn
- Smalle glazen concentreren geur
- Goed glaswerk is belangrijk
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik rook verschil
- Ik proefde verschil
- Ik noteerde mijn bevindingen

### Reflectievraag

Welk glas werkte beter?
',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren',
    'Na deze les weet jij wanneer en waarom je rode wijn decanteert.
',
    'Decanteren betekent wijn overgieten in een karaf.

Doelen:

- zuurstof geven
- aroma openen
- bezinksel scheiden

Jonge wijnen:
vooral voor zuurstof

Oude wijnen:
vooral voor bezinksel

Niet elke wijn hoeft gedecanteerd te worden.

Voorbeelden:

Vaak wel:
- Cabernet Sauvignon
- Syrah
- Nebbiolo

Vaak minder:
- Gamay
- jonge Pinot Noir

Te lang decanteren kan kwetsbare wijn beschadigen.
',
    '- decanteren
- karaf
- zuurstof
- bezinksel
- opening
',
    'Oude Barolo kan soms al na 20 minuten volledig open zijn.
',
    '- Decanteren opent wijn
- Helpt bij jonge krachtige wijnen
- Verwijdert bezinksel bij oude wijnen
- Timing is belangrijk
',
    '### Opdracht

Decanteer een jonge rode wijn.

### Checklist

- Ik schonk rustig
- Ik proefde voor en na
- Ik noteerde verschillen

### Reflectievraag

Wat veranderde het meest?
',
    10,
    3
  ),
  (
    'bewaren-en-kelderen',
    'Bewaren & kelderen',
    'Na deze les begrijp jij hoe rode wijn correct wordt opgeslagen.
',
    'Niet elke wijn is geschikt om te bewaren.

Bewaarwijn heeft meestal:

- hoge tannines
- goede zuren
- concentratie
- balans

Ideale omstandigheden:

- 12–14°C
- donkere ruimte
- constante temperatuur
- juiste luchtvochtigheid
- liggende flessen

Vijanden van wijn:

- licht
- warmte
- trillingen
- zuurstof

Een goede kelder vertraagt ontwikkeling.
',
    '- bewaren
- kelderen
- stabiliteit
- kurk
- rijping

---

# Module afsluiting

Je beheerst nu de servicekant van rode wijn.

Hierna volgt:

**Module 8 — Pairing & Gastronomie**
- Rode wijn & vlees
- Rode wijn & kaas
- Rode wijn & wild

Vanaf daar ga je wijn koppelen aan eten — het echte sommelierwerk.',
    'Temperatuurschommelingen zijn schadelijker dan een constante iets hogere temperatuur.
',
    '- Niet alle wijn is bewaarwijn
- Stabiliteit is cruciaal
- Licht en warmte zijn vijanden
- Liggend bewaren beschermt kurk
',
    '### Opdracht

Controleer jouw wijnopslag.

### Checklist

- Ik heb temperatuur bekeken
- Ik heb licht gecontroleerd
- Ik heb positie gecontroleerd

### Reflectievraag

Wat kan beter?
',
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
    'Rode wijn en vlees vormen één van de sterkste klassieke pairings.

Waarom?

Vlees bevat:

- eiwitten
- vetten
- umami

Tannines in rode wijn binden zich aan eiwitten.

Daardoor:

- voelt wijn zachter
- wordt fruit expressiever
- ontstaat balans

Voorbeelden:

Biefstuk + Cabernet Sauvignon  
Lamsrack + Syrah  
Entrecote + Malbec

Hoe vetter het vlees, hoe meer structuur de wijn mag hebben.
',
    '- vlees
- tannines
- eiwit
- vet
- balans
',
    'Een tanninerijke wijn zonder eten kan veel harder aanvoelen.
',
    '- Eiwit verzacht tannines
- Vet draagt smaak
- Umami versterkt complexiteit
- Structuur moet matchen
',
    '### Opdracht

Combineer een rode wijn met rood vlees.

### Checklist

- Ik proefde de wijn apart
- Ik proefde met het gerecht
- Ik noteerde het verschil

### Reflectievraag

Voelde de wijn zachter?
',
    10,
    1
  ),
  (
    'rode-wijn-kaas',
    'Rode wijn & kaas',
    'Na deze les begrijp jij hoe rode wijn met kaas werkt.
',
    'Kaas is complex.

Vet en zout veranderen wijn sterk.

Belangrijke regels:

Zachte kaas:
lichte rode wijn

Gerijpte kaas:
meer structuur

Blauwschimmel:
meestal géén droge rode wijn

Voorbeelden:

Brie + Pinot Noir  
Comté + Nebbiolo  
Manchego + Tempranillo

Pas op met hoge tannines en veel zout.

Dat kan bitter maken.
',
    '- kaas
- zout
- vet
- bitter
- intensiteit
',
    'Port werkt vaak beter bij blauwe kaas dan droge rode wijn.
',
    '- Vet verzacht tannines
- Zout versterkt structuur
- Niet elke kaas past bij rood
- Intensiteit moet kloppen
',
    '### Opdracht

Proef drie kazen met één rode wijn.

### Checklist

- Ik proefde apart
- Ik proefde samen
- Ik noteerde verschillen

### Reflectievraag

Welke kaas werkte het beste?
',
    10,
    2
  ),
  (
    'rode-wijn-wild',
    'Rode wijn & wild',
    'Na deze les begrijp jij waarom wild klassieke rode wijnpairing is.
',
    'Wild heeft:

- veel smaak
- hoge intensiteit
- aardse tonen

Dat vraagt om wijn met:

- structuur
- complexiteit
- rijping

Klassieke combinaties:

Hert + Nebbiolo  
Eend + Pinot Noir  
Wildzwijn + Syrah  
Haas + Sangiovese

Sauzen spelen grote rol.

Zoete saus vraagt zachtere wijn.

Aardse saus vraagt meer tertiaire tonen.
',
    '- wild
- complexiteit
- tertiair
- structuur
- saus

---

# Module afsluiting

Je beheerst nu de gastronomische basis van rode wijn.

Hierna volgt de eindmodule:

**Module 9 — Blindproeven & Examen**
- Pinot Noir vs Nebbiolo blind
- Merlot vs Cabernet blind
- Theorie- en praktijkexamen

Hier komt alles samen.',
    'Barolo en truffel zijn een legendarische combinatie.
',
    '- Wild vraagt complexiteit
- Structuur moet hoog zijn
- Saus bepaalt veel
- Oudere wijn werkt vaak beter
',
    '### Opdracht

Bedenk drie wildpairings.

### Checklist

- Ik koos het vlees
- Ik koos de wijn
- Ik dacht na over saus

### Reflectievraag

Welke pairing lijkt het sterkst?
',
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
    'Na deze les kun jij :contentReference[oaicite:0]{index=0} en :contentReference[oaicite:1]{index=1} blind onderscheiden.
',
    'Dit is één van de moeilijkste vergelijkingen.

Waarom?

Beide wijnen kunnen:

- licht van kleur zijn
- hoge zuren hebben
- elegant ogen

Maar verschillen sterk.

Pinot Noir:

- lagere tannines
- rood fruit
- aardbei
- kers
- bosgrond

Nebbiolo:

- extreem hoge tannines
- rozen
- teer
- truffel
- hogere structuur

Belangrijk verschil:

Pinot voelt zachter.  
Nebbiolo voelt strakker en droger.
',
    '- Pinot Noir
- Nebbiolo
- tannine
- elegantie
- deductie
',
    'Veel beginners verwarren Nebbiolo door de lichte kleur.
',
    '- Kleur kan misleiden
- Tannines geven de sleutel
- Pinot is zachter
- Nebbiolo is strenger
',
    '### Opdracht

Proef blind twee lichte rode wijnen.

### Checklist

- Ik analyseerde kleur
- Ik beoordeelde tannines
- Ik noteerde aroma’s
- Ik trok een conclusie

### Reflectievraag

Waar twijfelde je?
',
    12,
    1
  ),
  (
    'merlot-vs-cabernet',
    'Merlot vs Cabernet blind',
    'Na deze les kun jij :contentReference[oaicite:2]{index=2} en :contentReference[oaicite:3]{index=3} blind onderscheiden.
',
    'Deze vergelijking draait om structuur.

Merlot:

- zachter
- ronder
- rijper fruit
- minder strakke tannines

Cabernet:

- steviger
- cassis
- ceder
- hogere tannines
- meer spanning

Belangrijke vraag:

Voelt de wijn rond of strak?

Dat is vaak de snelste sleutel.
',
    '- Merlot
- Cabernet
- structuur
- cassis
- rondheid
',
    'In veel Bordeaux-blends zijn deze druiven samen aanwezig.
',
    '- Merlot = rond
- Cabernet = strak
- Structuur is doorslaggevend
- Aroma helpt bevestigen
',
    '### Opdracht

Proef blind twee Bordeaux-blends.

### Checklist

- Ik zocht structuur
- Ik zocht fruitprofiel
- Ik noteerde tannines

### Reflectievraag

Welke vond je makkelijker?
',
    12,
    2
  ),
  (
    'red-wine-final-exam',
    'Theorie- en praktijkexamen',
    'Na deze les toon jij dat je de volledige Red Wine Track beheerst.
',
    'Dit examen test:

### Fundament
- Wat is rode wijn?
- Productie
- Schilcontact
- Extractie

### Proeven
- Kleur
- Aroma
- Tannines
- Structuur

### Druiven
- lichte stijlen
- medium body
- krachtige stijlen

### Service
- temperatuur
- glaswerk
- decanteren
- bewaren

### Pairing
- vlees
- kaas
- wild

### Blindproeven
- deductie
- vergelijking
- conclusie
',
    '- blindproeven
- integratie
- examen
- druifherkenning
- certificering',
    '',
    '',
    '### Opdracht

Voer een volledige blindproeverij uit met één rode wijn.

### Checklist

- Ik analyseerde kleur
- Ik analyseerde aroma’s
- Ik beoordeelde tannines
- Ik beoordeelde zuren
- Ik schatte body
- Ik bepaalde mogelijke druif
- Ik bepaalde mogelijke regio
- Ik koos een logische food pairing

### Reflectievraag

Welke analyse-stap gaf jou de meeste zekerheid?
',
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
  ('intro-red-wine', 'waarom-is-rode-wijn-uniek', 1, 'Wat geeft grip?', '["Suiker", "Tannine", "Alcohol", "Water"]', 1, 'Correct: Tannine'),
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
  ('productie-red-wine', 'alcoholische-gisting', 3, 'Welke temperatuur is normaal?', '["5°C", "10°C", "25–32°C", "40°C"]', 2, 'Correct: 25–32°C'),
  ('productie-red-wine', 'alcoholische-gisting', 4, 'Te warm is:', '["Goed", "Riskant", "Verplicht", "Onmogelijk"]', 1, 'Correct: Riskant'),
  ('productie-red-wine', 'alcoholische-gisting', 5, 'Warmte helpt:', '["Extractie", "Koeling", "Botteling", "Filtering"]', 0, 'Correct: Extractie'),
  ('productie-red-wine', 'houtlagering', 1, 'Welk hout wordt vaak gebruikt?', '["Eik", "Den", "Beuk", "Spar"]', 0, 'Correct: Eik'),
  ('productie-red-wine', 'houtlagering', 2, 'Wat geeft hout?', '["Vanille", "Citrus", "Gras", "Lychee"]', 0, 'Correct: Vanille'),
  ('productie-red-wine', 'houtlagering', 3, 'Nieuw hout geeft:', '["Meer smaak", "Minder smaak", "Geen smaak", "Minder kleur"]', 0, 'Correct: Meer smaak'),
  ('productie-red-wine', 'houtlagering', 4, 'Wat doet zuurstof?', '["Verzacht tannines", "Verhoogt suiker", "Verlaagt alcohol", "Verhoogt zuur"]', 0, 'Correct: Verzacht tannines'),
  ('productie-red-wine', 'houtlagering', 5, 'Barrique is:', '["50 liter", "100 liter", "225 liter", "500 liter"]', 2, 'Correct: 225 liter'),
  ('productie-red-wine', 'rijping-rode-wijn', 1, 'Wat gebeurt met tannines?', '["Worden zachter", "Worden harder", "Verdwijnen direct", "Worden zoeter"]', 0, 'Correct: Worden zachter'),
  ('productie-red-wine', 'rijping-rode-wijn', 2, 'Wat ontstaat later?', '["Tertiaire aroma’s", "Minder geur", "Meer suiker", "Meer zuur"]', 0, 'Correct: Tertiaire aroma’s'),
  ('productie-red-wine', 'rijping-rode-wijn', 3, 'Wat is een tertiair aroma?', '["Tabak", "Citrus", "Banaan", "Gras"]', 0, 'Correct: Tabak'),
  ('productie-red-wine', 'rijping-rode-wijn', 4, 'Wordt elke wijn beter oud?', '["Ja", "Nee", "Alleen wit", "Alleen rosé"]', 1, 'Correct: Nee'),
  ('productie-red-wine', 'rijping-rode-wijn', 5, 'Wat bepaalt bewaarpotentieel?', '["Structuur", "Kleur", "Flesvorm", "Etiket"]', 0, 'Correct: Structuur'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 1, 'Wat is stap één?', '["Proeven", "Kijken", "Schudden", "Decanteren"]', 1, 'Correct: Kijken'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 2, 'Wat beoordeel je bij kijken?', '["Tannine", "Kleur", "Alcohol", "Hout"]', 1, 'Correct: Kleur'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 3, 'Wat beoordeel je bij ruiken?', '["Aroma’s", "Temperatuur", "Glas", "Kurk"]', 0, 'Correct: Aroma’s'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 4, 'Wat beoordeel je bij proeven?', '["Structuur", "Etiket", "Oogstjaar", "Producent"]', 0, 'Correct: Structuur'),
  ('proeven-red-wine', 'hoe-proef-je-rode-wijn', 5, 'Waarom systematisch?', '["Sneller leren herkennen", "Mooier glas", "Meer alcohol", "Minder geur"]', 0, 'Correct: Sneller leren herkennen'),
  ('proeven-red-wine', 'kleur-analyseren', 1, 'Wat zegt kleur vaak?', '["Leeftijd", "Prijs", "Regio", "Kurk"]', 0, 'Correct: Leeftijd'),
  ('proeven-red-wine', 'kleur-analyseren', 2, 'Wat heeft vaak lichte kleur?', '["Pinot Noir", "Malbec", "Syrah", "Cabernet"]', 0, 'Correct: Pinot Noir'),
  ('proeven-red-wine', 'kleur-analyseren', 3, 'Wat zie je vaak bij jonge wijn?', '["Oranje", "Paars", "Bruin", "Goud"]', 1, 'Correct: Paars'),
  ('proeven-red-wine', 'kleur-analyseren', 4, 'Wat zie je bij oudere wijn?', '["Groen", "Granaat", "Paars", "Wit"]', 1, 'Correct: Granaat'),
  ('proeven-red-wine', 'kleur-analyseren', 5, 'Nebbiolo is:', '["Licht én krachtig", "Donker en licht", "Zoet", "Mousserend"]', 0, 'Correct: Licht én krachtig'),
  ('proeven-red-wine', 'aromas-herkennen', 1, 'Wat is primair?', '["Rijping", "Druif", "Hout", "Fles"]', 1, 'Correct: Druif'),
  ('proeven-red-wine', 'aromas-herkennen', 2, 'Wat is secundair?', '["Productie", "Druif", "Leeftijd", "Kelder"]', 0, 'Correct: Productie'),
  ('proeven-red-wine', 'aromas-herkennen', 3, 'Wat is tertiair?', '["Rijping", "Gisting", "Schilcontact", "Persing"]', 0, 'Correct: Rijping'),
  ('proeven-red-wine', 'aromas-herkennen', 4, 'Wat hoort bij tertiair?', '["Tabak", "Citroen", "Gras", "Banaan"]', 0, 'Correct: Tabak'),
  ('proeven-red-wine', 'aromas-herkennen', 5, 'Wat hoort bij primair?', '["Braam", "Leer", "Toast", "Aarde"]', 0, 'Correct: Braam'),
  ('proeven-red-wine', 'tannines-herkennen', 1, 'Wat doen tannines?', '["Zoeten", "Drogen", "Koelen", "Verzachten"]', 1, 'Correct: Drogen'),
  ('proeven-red-wine', 'tannines-herkennen', 2, 'Waar voel je tannines?', '["Tandvlees", "Oren", "Ogen", "Handen"]', 0, 'Correct: Tandvlees'),
  ('proeven-red-wine', 'tannines-herkennen', 3, 'Welke druif heeft vaak hoge tannines?', '["Pinot Noir", "Nebbiolo", "Riesling", "Sauvignon Blanc"]', 1, 'Correct: Nebbiolo'),
  ('proeven-red-wine', 'tannines-herkennen', 4, 'Waarom belangrijk?', '["Rijping", "Kleur", "Bubbels", "Suiker"]', 0, 'Correct: Rijping'),
  ('proeven-red-wine', 'tannines-herkennen', 5, 'Waar passen tannines goed bij?', '["Vlees", "IJs", "Fruit", "Vis"]', 0, 'Correct: Vlees'),
  ('lichte-druiven-red-wine', 'pinot-noir', 1, 'Waar staat Pinot Noir vooral om bekend?', '["Hoge tannines", "Lichte elegantie", "Hoge alcohol", "Veel hout"]', 1, 'Correct: Lichte elegantie'),
  ('lichte-druiven-red-wine', 'pinot-noir', 2, 'Welke regio is klassiek voor Pinot Noir?', '["Rioja", "Burgundy", "Douro", "Mosel"]', 1, 'Correct: Burgundy'),
  ('lichte-druiven-red-wine', 'pinot-noir', 3, 'Welke aroma hoort vaak bij Pinot Noir?', '["Cassis", "Aardbei", "Lychee", "Peper"]', 1, 'Correct: Aardbei'),
  ('lichte-druiven-red-wine', 'pinot-noir', 4, 'Pinot Noir heeft meestal:', '["Lage tot medium tannines", "Zeer hoge tannines", "Geen zuren", "Veel restsuiker"]', 0, 'Correct: Lage tot medium tannines'),
  ('lichte-druiven-red-wine', 'pinot-noir', 5, 'Pinot Noir is sterk beïnvloed door:', '["Hout", "Terroir", "Fortificatie", "Oxidatie"]', 1, 'Correct: Terroir'),
  ('lichte-druiven-red-wine', 'gamay', 1, 'Waar komt Gamay vooral vandaan?', '["Beaujolais", "Bordeaux", "Napa", "Douro"]', 0, 'Correct: Beaujolais'),
  ('lichte-druiven-red-wine', 'gamay', 2, 'Gamay heeft meestal:', '["Lage tannines", "Hoge tannines", "Veel hout", "Veel alcohol"]', 0, 'Correct: Lage tannines'),
  ('lichte-druiven-red-wine', 'gamay', 3, 'Welke techniek hoort vaak bij Gamay?', '["Houtrijping", "Carbonic maceration", "Fortificatie", "Solera"]', 1, 'Correct: Carbonic maceration'),
  ('lichte-druiven-red-wine', 'gamay', 4, 'Welke aroma is typisch?', '["Banaan", "Cassis", "Teer", "Tabak"]', 0, 'Correct: Banaan'),
  ('lichte-druiven-red-wine', 'gamay', 5, 'Gamay is vaak:', '["Zwaar", "Licht en sappig", "Zoet", "Oxidatief"]', 1, 'Correct: Licht en sappig'),
  ('lichte-druiven-red-wine', 'grenache', 1, 'Grenache houdt van:', '["Koude klimaten", "Warme klimaten", "Nat klimaat", "Hoogte"]', 1, 'Correct: Warme klimaten'),
  ('lichte-druiven-red-wine', 'grenache', 2, 'Grenache heeft vaak:', '["Hoge zuren", "Hoge alcohol", "Lage alcohol", "Geen fruit"]', 1, 'Correct: Hoge alcohol'),
  ('lichte-druiven-red-wine', 'grenache', 3, 'Grenache wordt vaak gebruikt in:', '["Blends", "Port only", "Dessert only", "Sparkling only"]', 0, 'Correct: Blends'),
  ('lichte-druiven-red-wine', 'grenache', 4, 'Typisch aroma?', '["Rijp rood fruit", "Gras", "Citrus", "Krijt"]', 0, 'Correct: Rijp rood fruit'),
  ('lichte-druiven-red-wine', 'grenache', 5, 'Belangrijke regio?', '["Châteauneuf-du-Pape", "Champagne", "Mosel", "Tokaj"]', 0, 'Correct: Châteauneuf-du-Pape'),
  ('lichte-druiven-red-wine', 'cinsault', 1, 'Cinsault is meestal:', '["Licht en soepel", "Zeer krachtig", "Zoet", "Oxidatief"]', 0, 'Correct: Licht en soepel'),
  ('lichte-druiven-red-wine', 'cinsault', 2, 'Cinsault wordt vaak gebruikt voor:', '["Rosé", "Port", "Sherry", "Madeira"]', 0, 'Correct: Rosé'),
  ('lichte-druiven-red-wine', 'cinsault', 3, 'Welke stijl hoort erbij?', '["Lage tannines", "Hoge tannines", "Veel zuur", "Hoog alcohol"]', 0, 'Correct: Lage tannines'),
  ('lichte-druiven-red-wine', 'cinsault', 4, 'Cinsault is vaak:', '["Blendpartner", "Altijd single vineyard", "Mousserend", "Versterkt"]', 0, 'Correct: Blendpartner'),
  ('lichte-druiven-red-wine', 'cinsault', 5, 'Pinotage is familie van:', '["Cinsault", "Syrah", "Nebbiolo", "Merlot"]', 0, 'Correct: Cinsault'),
  ('lichte-druiven-red-wine', 'mencia', 1, 'Mencía komt vooral uit:', '["Spanje", "Frankrijk", "Italië", "Argentinië"]', 0, 'Correct: Spanje'),
  ('lichte-druiven-red-wine', 'mencia', 2, 'Belangrijke regio?', '["Bierzo", "Rioja", "Bordeaux", "Chianti"]', 0, 'Correct: Bierzo'),
  ('lichte-druiven-red-wine', 'mencia', 3, 'Typische stijl?', '["Elegant", "Zeer zwaar", "Zoet", "Oxidatief"]', 0, 'Correct: Elegant'),
  ('lichte-druiven-red-wine', 'mencia', 4, 'Mencía heeft vaak:', '["Mineraliteit", "Veel hout", "Veel suiker", "Lage zuren"]', 0, 'Correct: Mineraliteit'),
  ('lichte-druiven-red-wine', 'mencia', 5, 'Mencía combineert:', '["Kracht en finesse", "Zoet en zout", "Alcohol en restsuiker", "Bubbels en tannines"]', 0, 'Correct: Kracht en finesse'),
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
  ('medium-druiven-red-wine', 'barbera', 5, 'Barbera heeft meestal:', '["Minder tannine dan Nebbiolo", "Meer tannine dan Nebbiolo", "Geen zuur", "Meer alcohol dan Zinfandel"]', 0, 'Correct: Minder tannine dan Nebbiolo'),
  ('medium-druiven-red-wine', 'zinfandel', 1, 'Zinfandel is beroemd in:', '["Californië", "Bordeaux", "Mosel", "Douro"]', 0, 'Correct: Californië'),
  ('medium-druiven-red-wine', 'zinfandel', 2, 'Typische stijl?', '["Jammy", "Strak mineraal", "Zeer zuur", "Mousserend"]', 0, 'Correct: Jammy'),
  ('medium-druiven-red-wine', 'zinfandel', 3, 'Zinfandel is genetisch gelijk aan:', '["Primitivo", "Merlot", "Syrah", "Mourvèdre"]', 0, 'Correct: Primitivo'),
  ('medium-druiven-red-wine', 'zinfandel', 4, 'Typisch aroma?', '["Zwart fruit", "Citrus", "Groene appel", "Gras"]', 0, 'Correct: Zwart fruit'),
  ('medium-druiven-red-wine', 'zinfandel', 5, 'Zinfandel heeft vaak:', '["Hogere alcohol", "Lage alcohol", "Lage body", "Geen fruit"]', 0, 'Correct: Hogere alcohol'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 1, 'Cabernet Sauvignon heeft vaak:', '["Hoge tannines", "Lage tannines", "Zoetheid", "Lage structuur"]', 0, 'Correct: Hoge tannines'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 2, 'Typisch aroma?', '["Cassis", "Aardbei", "Banaan", "Lychee"]', 0, 'Correct: Cassis'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 3, 'Bekende regio?', '["Napa Valley", "Mosel", "Tokaj", "Chianti"]', 0, 'Correct: Napa Valley'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 4, 'Cabernet heeft vaak:', '["Groot bewaarpotentieel", "Geen rijping", "Lage alcohol", "Geen zuur"]', 0, 'Correct: Groot bewaarpotentieel'),
  ('krachtige-druiven-red-wine', 'cabernet-sauvignon', 5, 'Cabernet is vaak:', '["Blendbasis", "Rosédruif", "Portdruif", "Dessertwijn"]', 0, 'Correct: Blendbasis'),
  ('krachtige-druiven-red-wine', 'syrah', 1, 'Syrah staat bekend om:', '["Peper", "Citrus", "Honing", "Zout"]', 0, 'Correct: Peper'),
  ('krachtige-druiven-red-wine', 'syrah', 2, 'Australische naam?', '["Shiraz", "Grenache", "Merlot", "Zinfandel"]', 0, 'Correct: Shiraz'),
  ('krachtige-druiven-red-wine', 'syrah', 3, 'Koel klimaat geeft meer:', '["Peper", "Jam", "Suiker", "Hout"]', 0, 'Correct: Peper'),
  ('krachtige-druiven-red-wine', 'syrah', 4, 'Belangrijke regio?', '["Rhône", "Rioja", "Mosel", "Douro"]', 0, 'Correct: Rhône'),
  ('krachtige-druiven-red-wine', 'syrah', 5, 'Syrah is vaak:', '["Krachtig", "Licht", "Zoet", "Oxidatief"]', 0, 'Correct: Krachtig'),
  ('krachtige-druiven-red-wine', 'malbec', 1, 'Malbec is beroemd in:', '["Argentinië", "Duitsland", "Portugal", "Oostenrijk"]', 0, 'Correct: Argentinië'),
  ('krachtige-druiven-red-wine', 'malbec', 2, 'Belangrijkste regio?', '["Mendoza", "Douro", "Mosel", "Bordeaux"]', 0, 'Correct: Mendoza'),
  ('krachtige-druiven-red-wine', 'malbec', 3, 'Malbec is vaak:', '["Donker en vol", "Licht en fris", "Zoet", "Mousserend"]', 0, 'Correct: Donker en vol'),
  ('krachtige-druiven-red-wine', 'malbec', 4, 'Typisch aroma?', '["Chocolade", "Citrus", "Banaan", "Appel"]', 0, 'Correct: Chocolade'),
  ('krachtige-druiven-red-wine', 'malbec', 5, 'Malbec is vaak:', '["Zachter dan Cabernet", "Harder dan Nebbiolo", "Zoeter dan Port", "Lager in alcohol dan Gamay"]', 0, 'Correct: Zachter dan Cabernet'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 1, 'Nebbiolo heeft:', '["Zeer hoge tannines", "Lage tannines", "Geen zuren", "Veel suiker"]', 0, 'Correct: Zeer hoge tannines'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 2, 'Belangrijke regio?', '["Barolo", "Rioja", "Napa", "Mosel"]', 0, 'Correct: Barolo'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 3, 'Typisch aroma?', '["Rozen", "Mango", "Citrus", "Banaan"]', 0, 'Correct: Rozen'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 4, 'Nebbiolo heeft vaak:', '["Hoge zuren", "Lage zuren", "Geen structuur", "Lage alcohol"]', 0, 'Correct: Hoge zuren'),
  ('krachtige-druiven-red-wine', 'nebbiolo', 5, 'Nebbiolo kan:', '["Lang rijpen", "Niet rijpen", "Alleen jong drinken", "Alleen gekoeld"]', 0, 'Correct: Lang rijpen'),
  ('krachtige-druiven-red-wine', 'mourvedre', 1, 'Mourvèdre is vaak:', '["Krachtig en kruidig", "Licht en fris", "Zoet", "Mousserend"]', 0, 'Correct: Krachtig en kruidig'),
  ('krachtige-druiven-red-wine', 'mourvedre', 2, 'Belangrijke regio?', '["Bandol", "Mosel", "Rioja", "Chianti"]', 0, 'Correct: Bandol'),
  ('krachtige-druiven-red-wine', 'mourvedre', 3, 'Mourvèdre wordt vaak gebruikt in:', '["GSM-blends", "Port", "Sherry", "Champagne"]', 0, 'Correct: GSM-blends'),
  ('krachtige-druiven-red-wine', 'mourvedre', 4, 'Typisch aroma?', '["Leer", "Citrus", "Gras", "Appel"]', 0, 'Correct: Leer'),
  ('krachtige-druiven-red-wine', 'mourvedre', 5, 'Mourvèdre rijpt:', '["Laat", "Vroeg", "Niet", "Onder water"]', 0, 'Correct: Laat'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 1, 'Wat gebeurt er als rode wijn te warm wordt geserveerd?', '["Meer frisheid", "Alcohol wordt dominanter", "Minder geur", "Meer zuur"]', 1, 'Correct: Alcohol wordt dominanter'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 2, 'Wat gebeurt er als rode wijn te koud wordt geserveerd?', '["Aroma’s openen meer", "Tannines voelen harder aan", "Meer zoetheid", "Meer fruit"]', 1, 'Correct: Tannines voelen harder aan'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 3, 'Lichte rode wijn serveer je meestal op:', '["8–10°C", "12–14°C", "16–18°C", "20–22°C"]', 1, 'Correct: 12–14°C'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 4, 'Krachtige rode wijn serveer je meestal op:', '["8–10°C", "12–14°C", "16–18°C", "22–24°C"]', 2, 'Correct: 16–18°C'),
  ('service-red-wine', 'serveertemperatuur-rode-wijn', 5, 'Waarom is “kamertemperatuur” misleidend?', '["Omdat wijn dan te koud is", "Omdat moderne kamers vaak te warm zijn", "Omdat wijn dan te zuur wordt", "Omdat tannines verdwijnen"]', 1, 'Correct: Omdat moderne kamers vaak te warm zijn'),
  ('service-red-wine', 'glaswerk-rode-wijn', 1, 'Wat doet een groter glas meestal?', '["Minder aroma", "Meer zuurstof en opening", "Meer alcohol", "Minder tannine"]', 1, 'Correct: Meer zuurstof en opening'),
  ('service-red-wine', 'glaswerk-rode-wijn', 2, 'Pinot Noir wordt vaak geserveerd in:', '["Smal glas", "Breed bol glas", "Flute", "Klein proefglas"]', 1, 'Correct: Breed bol glas'),
  ('service-red-wine', 'glaswerk-rode-wijn', 3, 'Waarom is glasvorm belangrijk?', '["Voor de kleur", "Voor geur en smaakontwikkeling", "Voor alcoholpercentage", "Voor bewaarpotentieel"]', 1, 'Correct: Voor geur en smaakontwikkeling'),
  ('service-red-wine', 'glaswerk-rode-wijn', 4, 'Nebbiolo profiteert vaak van:', '["Klein glas", "Groot open glas", "Champagneglas", "Shotglas"]', 1, 'Correct: Groot open glas'),
  ('service-red-wine', 'glaswerk-rode-wijn', 5, 'Professionele proevers gebruiken vaak:', '["Universele glazen", "Alleen flutes", "Alleen Bordeauxglazen", "Alleen Bourgogneglazen"]', 0, 'Correct: Universele glazen'),
  ('service-red-wine', 'decanteren', 1, 'Waarom decanteer je jonge rode wijn?', '["Voor suiker", "Voor zuurstof", "Voor koeling", "Voor kleur"]', 1, 'Correct: Voor zuurstof'),
  ('service-red-wine', 'decanteren', 2, 'Waarom decanteer je oude wijn?', '["Voor alcohol", "Voor bezinksel", "Voor tannines", "Voor bubbels"]', 1, 'Correct: Voor bezinksel'),
  ('service-red-wine', 'decanteren', 3, 'Welke wijn profiteert vaak van decanteren?', '["Cabernet Sauvignon", "Gamay", "Rosé", "Moscato"]', 0, 'Correct: Cabernet Sauvignon'),
  ('service-red-wine', 'decanteren', 4, 'Te lang decanteren kan:', '["Wijn openen", "Kwetsbare wijn beschadigen", "Suiker verhogen", "Alcohol verlagen"]', 1, 'Correct: Kwetsbare wijn beschadigen'),
  ('service-red-wine', 'decanteren', 5, 'Wat gebruik je meestal?', '["Fles", "Karaf", "Glas", "Emmer"]', 1, 'Correct: Karaf'),
  ('service-red-wine', 'bewaren-en-kelderen', 1, 'Ideale bewaartemperatuur?', '["4°C", "8°C", "12–14°C", "20°C"]', 2, 'Correct: 12–14°C'),
  ('service-red-wine', 'bewaren-en-kelderen', 2, 'Wat is slecht voor wijn?', '["Donkerte", "Stabiliteit", "Licht", "Liggend bewaren"]', 2, 'Correct: Licht'),
  ('service-red-wine', 'bewaren-en-kelderen', 3, 'Waarom flessen liggend?', '["Voor uitstraling", "Kurk vochtig houden", "Meer alcohol", "Minder zuur"]', 1, 'Correct: Kurk vochtig houden'),
  ('service-red-wine', 'bewaren-en-kelderen', 4, 'Wat is belangrijk?', '["Temperatuurschommelingen", "Constante temperatuur", "Hoge warmte", "Open lucht"]', 1, 'Correct: Constante temperatuur'),
  ('service-red-wine', 'bewaren-en-kelderen', 5, 'Niet elke wijn is:', '["Drinkbaar", "Bewaarbaar", "Rood", "Droog"]', 1, 'Correct: Bewaarbaar'),
  ('pairing-red-wine', 'rode-wijn-vlees', 1, 'Waarom werkt rood goed met vlees?', '["Door suiker", "Door tannines en eiwit", "Door bubbels", "Door zuur"]', 1, 'Correct: Door tannines en eiwit'),
  ('pairing-red-wine', 'rode-wijn-vlees', 2, 'Wat verzacht tannines?', '["Zuur", "Eiwit", "Water", "Hout"]', 1, 'Correct: Eiwit'),
  ('pairing-red-wine', 'rode-wijn-vlees', 3, 'Welke pairing is klassiek?', '["Cabernet + biefstuk", "Riesling + biefstuk", "Port + sushi", "Moscato + wild"]', 0, 'Correct: Cabernet + biefstuk'),
  ('pairing-red-wine', 'rode-wijn-vlees', 4, 'Vetter vlees vraagt:', '["Minder structuur", "Meer structuur", "Minder alcohol", "Minder aroma"]', 1, 'Correct: Meer structuur'),
  ('pairing-red-wine', 'rode-wijn-vlees', 5, 'Wat versterkt complexiteit?', '["Umami", "Water", "Bitter", "Suiker"]', 0, 'Correct: Umami'),
  ('pairing-red-wine', 'rode-wijn-kaas', 1, 'Wat doet vet in kaas?', '["Verhardt tannines", "Verzacht tannines", "Verhoogt zuur", "Verhoogt alcohol"]', 1, 'Correct: Verzacht tannines'),
  ('pairing-red-wine', 'rode-wijn-kaas', 2, 'Welke wijn past goed bij Brie?', '["Pinot Noir", "Cabernet Sauvignon", "Malbec", "Syrah"]', 0, 'Correct: Pinot Noir'),
  ('pairing-red-wine', 'rode-wijn-kaas', 3, 'Blauwschimmel werkt vaak beter met:', '["Droge rode wijn", "Port", "Rosé", "Mousserend"]', 1, 'Correct: Port'),
  ('pairing-red-wine', 'rode-wijn-kaas', 4, 'Te veel zout met hoge tannines kan:', '["Bitter maken", "Zoeter maken", "Zachter maken", "Frisser maken"]', 0, 'Correct: Bitter maken'),
  ('pairing-red-wine', 'rode-wijn-kaas', 5, 'Welke factor is belangrijk?', '["Intensiteit matchen", "Alcohol verhogen", "Zuur verlagen", "Temperatuur verhogen"]', 0, 'Correct: Intensiteit matchen'),
  ('pairing-red-wine', 'rode-wijn-wild', 1, 'Wild vraagt meestal:', '["Lichte wijn", "Complexe wijn", "Zoete wijn", "Mousserende wijn"]', 1, 'Correct: Complexe wijn'),
  ('pairing-red-wine', 'rode-wijn-wild', 2, 'Welke pairing is klassiek?', '["Hert + Nebbiolo", "Hert + Riesling", "Haas + Moscato", "Wild + Rosé"]', 0, 'Correct: Hert + Nebbiolo'),
  ('pairing-red-wine', 'rode-wijn-wild', 3, 'Wat speelt grote rol?', '["Glas", "Saus", "Kurk", "Flesvorm"]', 1, 'Correct: Saus'),
  ('pairing-red-wine', 'rode-wijn-wild', 4, 'Aardse sauzen vragen vaak:', '["Jong fruit", "Tertiaire aroma’s", "Lage zuren", "Zoetheid"]', 1, 'Correct: Tertiaire aroma’s'),
  ('pairing-red-wine', 'rode-wijn-wild', 5, 'Welke wijn past goed bij eend?', '["Pinot Noir", "Zinfandel", "Port", "Sherry"]', 0, 'Correct: Pinot Noir'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 1, 'Welke druif heeft meestal hogere tannines?', '["Pinot Noir", "Nebbiolo", "Gamay", "Grenache"]', 1, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 2, 'Welke druif ruikt vaker naar rozen?', '["Nebbiolo", "Pinot Noir", "Merlot", "Syrah"]', 0, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 3, 'Welke voelt vaak zachter?', '["Pinot Noir", "Nebbiolo", "Cabernet", "Mourvèdre"]', 0, 'Correct: Pinot Noir'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 4, 'Welke heeft vaak teer?', '["Nebbiolo", "Pinot Noir", "Gamay", "Barbera"]', 0, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'pinot-noir-vs-nebbiolo', 5, 'Welke wordt vaak onderschat door kleur?', '["Nebbiolo", "Syrah", "Malbec", "Cabernet"]', 0, 'Correct: Nebbiolo'),
  ('examen-red-wine', 'merlot-vs-cabernet', 1, 'Welke is vaak ronder?', '["Merlot", "Cabernet Sauvignon", "Nebbiolo", "Syrah"]', 0, 'Correct: Merlot'),
  ('examen-red-wine', 'merlot-vs-cabernet', 2, 'Welke heeft vaker cassis?', '["Cabernet Sauvignon", "Merlot", "Pinot Noir", "Gamay"]', 0, 'Correct: Cabernet Sauvignon'),
  ('examen-red-wine', 'merlot-vs-cabernet', 3, 'Welke heeft stevigere tannines?', '["Cabernet Sauvignon", "Merlot", "Barbera", "Grenache"]', 0, 'Correct: Cabernet Sauvignon'),
  ('examen-red-wine', 'merlot-vs-cabernet', 4, 'Welke voelt zachter?', '["Merlot", "Cabernet Sauvignon", "Syrah", "Nebbiolo"]', 0, 'Correct: Merlot'),
  ('examen-red-wine', 'merlot-vs-cabernet', 5, 'Welke vormt vaak de backbone in Bordeaux?', '["Cabernet Sauvignon", "Merlot", "Pinot Noir", "Zinfandel"]', 0, 'Correct: Cabernet Sauvignon')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
