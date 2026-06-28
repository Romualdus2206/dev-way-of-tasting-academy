-- Rosé Wine track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 43 lessons · quizvragen per les

delete from academy.tracks where slug = 'rose-wine';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'rose-wine',
  'Rosé',
  'Leer rosé van Fundament tot Master: productie, proeven, stijlen, druiven, service, pairing en examen.',
  8,
  now()
);

with t as (select id from academy.tracks where slug = 'rose-wine')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-rose-wine', 'Fundament', 1),
  ('explorer', 'productie-rose-wine', 'Productie', 2),
  ('explorer', 'proeven-rose-wine', 'Proeven', 3),
  ('specialist', 'klassieke-stijlen-rose-wine', 'Klassieke stijlen', 4),
  ('specialist', 'druivenrassen-rose-wine', 'Druivenrassen', 5),
  ('specialist', 'stijl-gastronomie-rose-wine', 'Stijl & Gastronomie', 6),
  ('master', 'service-rose-wine', 'Service', 7),
  ('master', 'pairing-rose-wine', 'Pairing & Gastronomie', 8),
  ('master', 'examen-rose-wine', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'intro-rose-wine'
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
    'wat-is-rose',
    'Wat is rosé?',
    'Na deze les kun jij uitleggen wat rosé is, hoe rosé zich onderscheidt van witte en rode wijn en waarom rosé een eigen wijncategorie is.
',
    'Rosé is wijn gemaakt van blauwe druiven, maar met veel korter schilcontact dan rode wijn.

De kleur van rosé ontstaat doordat het sap slechts korte tijd in contact blijft met de schillen.

Daardoor krijgt rosé zijn typische roze tint.

Rosé zit qua stijl vaak tussen wit en rood:

- frisser dan rood
- meer fruit dan wit
- lichter van structuur

Rosé is wereldwijd populair door zijn toegankelijkheid, frisheid en veelzijdigheid.

Maar rosé is veel meer dan alleen zomerwijn.
',
    '- rosé
- schilcontact
- blauwe druiven
- frisheid
- fruit
',
    'Rosé behoort tot de oudste wijnstijlen ter wereld. Veel vroege rode wijnen waren eigenlijk licht van kleur.
',
    '- Rosé wordt gemaakt van blauwe druiven
- Kort schilcontact bepaalt de kleur
- Rosé zit tussen wit en rood in
- Rosé is veelzijdig inzetbaar
- Rosé is een volwaardige wijnstijl
',
    '### Opdracht

Zoek drie flessen rosé en vergelijk hun kleur.

### Checklist

- Ik heb drie rosés bekeken
- Ik heb kleurverschillen gezien
- Ik heb het alcoholpercentage bekeken
- Ik heb het land van herkomst bekeken

### Reflectievraag

Welke rosé zag er het lichtst uit?
',
    8,
    1
  ),
  (
    'hoe-ontstaat-rose',
    'Hoe ontstaat rosé?',
    'Na deze les kun jij uitleggen hoe rosé geproduceerd wordt.
',
    'Rosé ontstaat door gecontroleerd schilcontact.

Na het persen laten wijnmakers het sap korte tijd contact maken met de schillen.

Dit kan variëren van enkele uren tot soms een dag.

Daarna worden de schillen verwijderd.

Hoe langer het contact:

- hoe donkerder de kleur
- hoe meer structuur
- hoe meer extractie

De twee belangrijkste methodes zijn:

- direct press
- saignée

Deze leer je later uitgebreider.
',
    '- schilcontact
- extractie
- kleur
- blauwe druiven
- vinificatie
',
    'Soms is slechts 2 uur schilcontact al genoeg voor kleur.
',
    '- Rosé ontstaat via kort schilcontact
- Tijd bepaalt kleur en structuur
- Schillen worden snel verwijderd
- Productiemethode beïnvloedt stijl
',
    '### Opdracht

Bekijk online drie roséwijnen en noteer hun kleurintensiteit.

### Checklist

- Ik heb drie kleuren genoteerd
- Ik heb verschillen gezien
- Ik heb over extractie nagedacht

### Reflectievraag

Welke kleur zou volgens jou het meeste structuur geven?
',
    8,
    2
  ),
  (
    'waarom-is-rose-uniek',
    'Waarom is rosé uniek?',
    'Na deze les kun jij uitleggen waarom rosé een unieke wijncategorie is.
',
    'Rosé combineert meerdere eigenschappen:

- frisheid van witte wijn
- fruit van rode wijn
- lichte structuur

Dit maakt rosé zeer breed inzetbaar.

Rosé kan:

- aperitief zijn
- gastronomisch werken
- perfect pairen met zomerse gerechten
- zelfs krachtig genoeg zijn voor barbecue

Veel mensen onderschatten rosé.

Toprosés kunnen complex en serieus zijn.
',
    '- balans
- frisheid
- fruit
- body
- gastronomie
',
    'Tavel uit Zuid-Frankrijk wordt vaak beschouwd als één van de meest serieuze roséstijlen.
',
    '- Rosé combineert wit en rood
- Rosé is breed inzetbaar
- Rosé kan gastronomisch zijn
- Rosé heeft meer diepgang dan vaak gedacht
',
    '### Opdracht

Bedenk drie gerechten waar rosé goed bij zou passen.

### Checklist

- Ik heb drie gerechten bedacht
- Ik heb de stijl gekoppeld
- Ik heb over frisheid nagedacht

### Reflectievraag

Bij welk gerecht lijkt rosé jou het meest logisch?
',
    8,
    3
  ),
  (
    'geschiedenis-van-rose',
    'Geschiedenis van rosé',
    'Na deze les begrijp jij de historische ontwikkeling van rosé.
',
    'Rosé is één van de oudste wijnvormen.

In de oudheid waren veel rode wijnen licht gekleurd.

Dat kwam doordat technieken voor lange extractie nog niet ontwikkeld waren.

Pas later werden rode wijnen donkerder.

Rosé bleef bestaan als aparte stijl.

In de moderne tijd werd Provence dé referentie voor lichte, elegante rosé.

Vandaag wordt rosé wereldwijd gemaakt.

Van Frankrijk tot Spanje, Italië en de Nieuwe Wereld.
',
    '- historie
- Provence
- oorsprong
- evolutie
- wijnstijl
',
    'Provence is verantwoordelijk voor een groot deel van de wereldwijde premium roséproductie.
',
    '- Rosé is historisch zeer oud
- Vroege rode wijn leek vaak op rosé
- Provence werd moderne benchmark
- Rosé is wereldwijd populair
',
    '### Opdracht

Zoek drie roségebieden op.

### Checklist

- Ik heb drie gebieden gevonden
- Ik heb hun klimaat bekeken
- Ik heb hun stijl bekeken

### Reflectievraag

Welk gebied kende jij al?
',
    8,
    4
  ),
  (
    'belangrijkste-rosestijlen',
    'Belangrijkste roséstijlen',
    'Na deze les herken jij de belangrijkste stijlen van rosé.
',
    'Rosé kent meerdere stijlen.

De belangrijkste zijn:

### Licht & strak
Bijvoorbeeld Provence.

Kenmerken:

- bleek zalmroze
- citrus
- fris
- droog

### Krachtig & gastronomisch
Bijvoorbeeld Tavel.

Kenmerken:

- donkerder roze
- rood fruit
- kruidigheid
- meer body

### Fruitig & sappig
Bijvoorbeeld Spaanse rosado.

Kenmerken:

- veel fruit
- toegankelijk
- voller

### Mediterrane rosé
Vaak kruidiger en rijper.

Deze stijlen vormen de basis voor verdere verdieping.
',
    '- Provence
- Tavel
- rosado
- stijl
- body',
    'Niet alle rosé is bedoeld om ijskoud te drinken.
',
    '- Rosé kent veel stijlen
- Provence is licht en elegant
- Tavel is krachtiger
- Rosado is fruitiger
- Stijl bepaalt pairing
',
    '### Opdracht

Kies welke roséstijl jij het liefst zou drinken.

### Checklist

- Ik heb de stijlen bekeken
- Ik heb mijn voorkeur gekozen
- Ik kan uitleggen waarom

### Reflectievraag

Welke stijl past het best bij jouw smaak?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'productie-rose-wine'
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
    'direct-press-methode',
    'Direct press methode',
    'Na deze les kun jij uitleggen hoe de direct press methode werkt en welke stijl rosé dit meestal oplevert.
',
    'Bij de direct press methode worden blauwe druiven vrijwel direct na de oogst geperst.

Hierdoor is het contact tussen sap en schillen zeer kort.

Dit levert:

- lichte kleur
- hoge frisheid
- elegante structuur
- subtiele aroma’s

Deze methode is de standaard in veel premium roségebieden zoals Provence.

Omdat de extractie minimaal is, blijft de wijn vaak strak en verfijnd.
',
    '- direct press
- extractie
- finesse
- elegantie
- Provence
',
    'Veel Provence-rosés hebben minder dan twee uur schilcontact.
',
    '- Direct press geeft lichte rosé
- Zeer kort schilcontact
- Minder extractie
- Meer elegantie
',
    '### Opdracht

Bekijk drie Provence rosés en vergelijk de kleur.

### Checklist

- Ik heb drie kleuren bekeken
- Ik heb de lichtste gekozen
- Ik herken de stijl

### Reflectievraag

Waarom zou een lichte kleur aantrekkelijk zijn?
',
    8,
    1
  ),
  (
    'saignee-methode',
    'Saignée methode',
    'Na deze les begrijp jij hoe de saignée methode werkt.
',
    'Saignée betekent letterlijk "bloeden".

Bij deze methode wordt een deel sap afgetapt uit een tank rode wijn in wording.

Dat sap wordt vervolgens apart vergist als rosé.

Dit levert meestal:

- diepere kleur
- meer extractie
- meer body
- krachtigere aroma’s

Saignée-rosé is vaak gastronomischer.
',
    '- saignée
- extractie
- body
- kleur
- concentratie
',
    'Saignée verhoogt tegelijk ook de concentratie van de rode wijn die achterblijft.
',
    '- Saignée betekent aftappen
- Meer kleur
- Meer body
- Vaak krachtiger stijl
',
    '### Opdracht

Vergelijk online een Provence rosé met een saignée rosé.

### Reflectievraag

Welke lijkt krachtiger?
',
    8,
    2
  ),
  (
    'kleurcontrole',
    'Kleurcontrole',
    'Na deze les begrijp jij hoe wijnmakers kleur sturen.
',
    'Kleur in rosé is volledig afhankelijk van:

- duur van schilcontact
- druivenras
- temperatuur
- persdruk

Korte extractie geeft bleek zalmroze.

Langere extractie geeft:

- dieper roze
- meer oranje tonen
- meer structuur

Kleur is dus geen toeval, maar een bewuste keuze.
',
    '- kleur
- extractie
- schilcontact
- persdruk
- druivenras
',
    'Grenache geeft vaak lichtere rosé dan Syrah.
',
    '- Schilcontact bepaalt kleur
- Druivenras speelt mee
- Persdruk beïnvloedt extractie
- Kleur is stijlbepalend
',
    '### Opdracht

Zoek vijf rosés en zet ze op volgorde van licht naar donker.
',
    8,
    3
  ),
  (
    'fermentatie-van-rose',
    'Fermentatie van rosé',
    'Na deze les begrijp jij hoe vergisting roséstijl beïnvloedt.
',
    'Rosé wordt meestal koel vergist.

Vaak tussen:

14–18°C

Koele fermentatie helpt om:

- fruitigheid te behouden
- frisheid te versterken
- aroma’s zuiver te houden

Hogere temperaturen geven vaak:

- meer structuur
- minder primair fruit
- meer complexiteit

De meeste rosés zijn reductief gemaakt.

Dat betekent:

zo min mogelijk zuurstof.
',
    '- fermentatie
- temperatuur
- reductief
- aroma
- frisheid
',
    'Koel vergisten is één van de belangrijkste technieken voor moderne frisse rosé.
',
    '- Koele fermentatie behoudt fruit
- Temperatuur stuurt stijl
- Reductief werken behoudt frisheid
',
    '### Opdracht

Vergelijk aroma’s van een jonge rosé en een rijpere rosé.
',
    8,
    4
  ),
  (
    'frisse-vs-gastronomische-rose',
    'Frisse stijl vs gastronomische stijl',
    'Na deze les kun jij het verschil uitleggen tussen lichte en gastronomische rosé.
',
    'Niet alle rosé is hetzelfde.

### Frisse rosé:

Kenmerken:

- licht
- strak
- citrus
- mineraal
- aperitiefgericht

Voorbeelden:

- Provence
- Navarra

### Gastronomische rosé:

Kenmerken:

- voller
- kruidiger
- meer body
- meer textuur

Voorbeelden:

- Tavel
- Bandol

De stijl bepaalt:

- serveertemperatuur
- glaskeuze
- foodpairing

Dit maakt stijlkennis essentieel.
',
    '- direct press
- saignée
- fermentatie
- reductief
- extractie',
    'Sommige top Bandol rosés kunnen jaren rijpen.
',
    '- Frisse rosé = licht en strak
- Gastronomische rosé = voller en complexer
- Productie bepaalt stijl
- Stijl bepaalt pairing
',
    '### Opdracht

Kies één gerecht en bepaal of frisse of gastronomische rosé beter past.

### Checklist

- Ik heb het gerecht gekozen
- Ik heb de stijl bepaald
- Ik kan mijn keuze uitleggen

### Reflectievraag

Welke stijl drink jij liever?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'proeven-rose-wine'
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
    'hoe-proef-je-rose',
    'Hoe proef je rosé?',
    'Na deze les kun jij rosé systematisch proeven volgens een vaste structuur.
',
    'Professioneel proeven gebeurt altijd in dezelfde volgorde:

1. Kijken  
2. Ruiken  
3. Proeven  
4. Concluderen

Bij rosé is structuur extra belangrijk omdat kleine verschillen veel zeggen.

Je let op:

- kleur
- helderheid
- geurintensiteit
- fruitprofiel
- zuren
- body
- lengte

Rosé lijkt eenvoudig, maar subtiele verschillen zijn cruciaal.
',
    '- proefvolgorde
- analyse
- structuur
- aroma
- conclusie
',
    'Veel beginners onderschatten rosé omdat de aroma’s vaak fijner en subtieler zijn.
',
    '- Proeven is systematisch
- Eerst kijken
- Dan ruiken
- Dan proeven
- Structuur bepaalt stijl
',
    '### Opdracht

Open een rosé en proef hem in vier stappen.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb een conclusie gemaakt

### Reflectievraag

Welke stap vond je het moeilijkst?
',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij kleur gebruiken om stijl en extractie te herkennen.
',
    'Bij rosé is kleur een belangrijk signaal.

Belangrijke tinten:

- bleek zalm
- licht roze
- framboos
- zalm-oranje
- diep roze

Wat kleur kan vertellen:

### Zeer licht:
- korte extractie
- fris
- elegant

### Donkerder:
- langere extractie
- meer body
- krachtiger

Kleur zegt niet alles, maar vaak veel.
',
    '- kleur
- intensiteit
- extractie
- tint
- visueel
',
    'Provence is meestal zeer bleek; Tavel vaak duidelijk donkerder.
',
    '- Kleur geeft stijlinformatie
- Licht = vaak elegant
- Donker = vaak krachtiger
- Extractie speelt grote rol
',
    '### Opdracht

Vergelijk drie rosés op kleur.

### Reflectievraag

Welke lijkt het meest gastronomisch?
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les kun jij typische roséaroma’s herkennen.
',
    'Rosé draait vaak om primaire aroma’s.

Veelvoorkomende aroma’s:

### Rood fruit
- aardbei
- framboos
- rode bes
- kers

### Citrus
- grapefruit
- citroen
- sinaasappelzest

### Bloemen
- roos
- viooltjes

### Kruidigheid
- witte peper
- Provençaalse kruiden

De combinatie zegt veel over regio en druivenras.
',
    '- aroma
- fruit
- citrus
- kruiden
- geurprofiel
',
    'Grenache geeft vaak aardbei; Syrah eerder kruidigheid.
',
    '- Rosé is vaak primair fruitgedreven
- Rood fruit is dominant
- Citrus geeft frisheid
- Kruiden geven diepgang
',
    '### Opdracht

Maak een geurlijst van jouw rosé.
',
    8,
    3
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij structuur in rosé analyseren.
',
    'Structuur betekent hoe de wijn voelt.

Bij rosé kijk je naar:

### Zuren
Hoge zuren = frisheid.

### Body
Licht, medium of voller.

### Alcohol
Geeft warmte en gewicht.

### Textuur
Strak, rond of romig.

Structuur bepaalt of rosé aperitiefwijn is of maaltijdwijn.
',
    '- body
- zuur
- alcohol
- textuur
- structuur
',
    'Veel gastronomische rosé heeft verrassend veel structuur.
',
    '- Structuur bepaalt inzetbaarheid
- Zuren geven spanning
- Body geeft gewicht
- Textuur geeft mondgevoel
',
    '### Opdracht

Proef twee rosés en vergelijk body.

### Reflectievraag

Welke voelde voller?
',
    8,
    4
  ),
  (
    'mini-toets-rose',
    'Mini-toets rosé',
    'Na deze les toets jij je kennis van de eerste drie modules.
',
    'Je beheerst nu:

- wat rosé is
- hoe rosé gemaakt wordt
- hoe je rosé proeft

Deze mini-toets is bedoeld als checkpoint.
',
    '- kleur
- aroma
- zuur
- body
- proeftechniek
- balans
- typiciteit',
    '',
    '',
    '### Opdracht

Proef blind één rosé en beschrijf:

- kleur
- aroma
- zuur
- body
- stijl

### Checklist

- Ik heb de kleur beschreven
- Ik heb drie aroma’s genoemd
- Ik heb zuren benoemd
- Ik heb body beoordeeld
- Ik heb stijl gekozen
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klassieke-stijlen-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'klassieke-stijlen-rose-wine'
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
    'provence-rose',
    'Provence rosé',
    'Na deze les kun jij de stijl van Provence rosé herkennen en uitleggen.
',
    'Provence is wereldwijd dé referentie voor premium rosé.

De stijl is meestal:

- bleek zalmroze
- droog
- strak
- fris
- elegant

Belangrijke druiven:

- Grenache
- Cinsault
- Syrah
- Mourvèdre

Het warme mediterrane klimaat zorgt voor rijp fruit, terwijl vroege oogst frisheid behoudt.

Provence draait om balans en finesse.
',
    '- Provence
- finesse
- elegantie
- citrus
- mineraliteit
',
    'Meer dan de helft van alle wijnproductie in Provence is rosé.
',
    '- Provence = benchmark
- Licht van kleur
- Elegant
- Fris
- Droog
',
    '### Opdracht

Proef een Provence rosé.

### Reflectievraag

Welke aroma’s domineren?
',
    8,
    1
  ),
  (
    'tavel',
    'Tavel',
    'Na deze les herken jij Tavel als unieke krachtige roséstijl.
',
    'Tavel is één van de meest serieuze rosé-appellaties ter wereld.

Tavel produceert uitsluitend rosé.

Kenmerken:

- donkerder kleur
- meer extractie
- meer body
- kruidigheid
- gastronomische inzetbaarheid

Belangrijke druiven:

- Grenache
- Syrah
- Mourvèdre
- Cinsault

Tavel is vaak krachtiger dan Provence.
',
    '- Tavel
- body
- kruiden
- extractie
- kracht
',
    'Tavel wordt soms de “koning van rosé” genoemd.
',
    '- Tavel is krachtig
- Donkerder kleur
- Meer body
- Gastronomisch
',
    '### Opdracht

Vergelijk Tavel met Provence.
',
    8,
    2
  ),
  (
    'rosado-spanje',
    'Rosado uit Spanje',
    'Na deze les begrijp jij de stijl van Spaanse rosado.
',
    'Rosado is de Spaanse term voor rosé.

Spaanse rosado is vaak:

- fruitiger
- voller
- directer
- soms iets krachtiger

Belangrijke regio’s:

- Navarra
- Rioja
- Cigales

Belangrijke druiven:

- Garnacha
- Tempranillo

Rosado combineert fruit met structuur.
',
    '- rosado
- Spanje
- Navarra
- Garnacha
- fruitigheid
',
    'Navarra was jarenlang hét rosado-gebied van Spanje.
',
    '- Rosado = Spaanse rosé
- Fruitiger
- Voller
- Meer direct fruit
',
    '### Opdracht

Zoek een Navarra rosado.
',
    8,
    3
  ),
  (
    'rosato-italie',
    'Italiaanse rosato',
    'Na deze les kun jij Italiaanse rosato plaatsen.
',
    'Rosato is vaak divers.

Italië kent geen één vaste stijl.

Voorbeelden:

### Chiaretto (Lago di Garda)
Licht en fris.

### Cerasuolo d’Abruzzo
Donkerder en voller.

### Rosato Puglia
Rijp en fruitig.

Italiaanse rosato varieert sterk door terroir en druiven.
',
    '- rosato
- Italië
- Chiaretto
- Cerasuolo
- terroir
',
    'Cerasuolo betekent letterlijk “kersenkleur”.
',
    '- Italië is divers
- Chiaretto = licht
- Cerasuolo = krachtiger
- Veel regionale verschillen
',
    '### Opdracht

Vergelijk twee Italiaanse rosati.
',
    8,
    4
  ),
  (
    'nieuwe-wereld-rose',
    'Nieuwe Wereld rosé',
    'Na deze les begrijp jij hoe Nieuwe Wereld rosé verschilt van klassieke Europese stijlen.
',
    'Nieuwe Wereld rosé is vaak:

- expressiever
- rijper
- fruitgedrevener
- toegankelijker

Belangrijke landen:

- Verenigde Staten
- Australië
- Zuid-Afrika
- Chili

Vaak minder terroirgedreven en meer stijlgedreven.

Meer focus op:

- fruit
- direct drinkplezier
- moderne wijnmaakstijl
',
    '- Provence
- Tavel
- Rosado
- Rosato
- Nieuwe Wereld
- stijlverschillen
- terroir',
    'Californië speelde een grote rol in de wereldwijde popularisering van rosé.
',
    '- Nieuwe Wereld = fruitiger
- Rijpere stijl
- Meer toegankelijk
- Minder klassiek
',
    '### Opdracht

Vergelijk een Europese rosé met een Nieuwe Wereld rosé.

### Checklist

- Ik heb kleur vergeleken
- Ik heb aroma’s vergeleken
- Ik heb structuur vergeleken
- Ik heb body vergeleken

### Reflectievraag

Welke stijl past beter bij jou?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- druivenrassen-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'druivenrassen-rose-wine'
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
    'grenache',
    'Grenache',
    'Na deze les begrijp jij waarom Grenache de belangrijkste rosédruif ter wereld is.
',
    'Grenache is dé basisdruif voor veel rosé.

Vooral in Zuid-Frankrijk en Spanje.

Grenache geeft:

- aardbei
- framboos
- watermeloen
- zachte kruiden

Structuur:

- medium body
- zachte tannines
- ronde textuur

Grenache levert vaak elegante, fruitige rosé met toegankelijk karakter.

Het is de kern van veel Provence blends.
',
    '- Grenache
- rood fruit
- blend
- body
- finesse
',
    'Grenache oxideert relatief snel en vraagt zorgvuldige vinificatie.
',
    '- Belangrijkste rosédruif
- Veel rood fruit
- Rond mondgevoel
- Veel gebruikt in blends
',
    '### Opdracht

Zoek drie rosés met Grenache.

### Reflectievraag

Welke fruitaroma’s herken je?
',
    8,
    1
  ),
  (
    'cinsault',
    'Cinsault',
    'Na deze les begrijp jij de rol van Cinsault in rosé.
',
    'Cinsault is één van de elegantste rosédruiven.

Bekend om:

- lichte kleur
- florale tonen
- frisse zuren
- fijne textuur

Aroma’s:

- rozen
- aardbei
- citrus
- witte bloemen

Cinsault wordt vaak gebruikt om finesse toe te voegen.

Veel Provence rosés bevatten Cinsault.
',
    '- Cinsault
- finesse
- bloemen
- elegantie
- frisheid
',
    'Cinsault wordt vaak gezien als de finesse-druif van rosé.
',
    '- Elegant
- Licht van kleur
- Florale tonen
- Hoge finesse
',
    '### Opdracht

Vergelijk Grenache en Cinsault in rosé.
',
    8,
    2
  ),
  (
    'syrah',
    'Syrah',
    'Na deze les kun jij de bijdrage van Syrah herkennen.
',
    'Syrah geeft rosé meer kracht.

Typische kenmerken:

- donkerder kleur
- meer body
- peperigheid
- donkerder fruit

Aroma’s:

- braam
- zwarte bes
- peper
- kruiden

Syrah verhoogt de structuur in blends.

In Tavel en Bandol vaak belangrijk.
',
    '- Syrah
- peper
- kleur
- body
- structuur
',
    'Syrah geeft vaak meer kleur dan Grenache.
',
    '- Meer body
- Meer kruidigheid
- Meer kleur
- Meer structuur
',
    '### Opdracht

Zoek een Syrah-dominante rosé.
',
    8,
    3
  ),
  (
    'mourvedre',
    'Mourvèdre',
    'Na deze les begrijp jij waarom Mourvèdre rosé gastronomisch sterker maakt.
',
    'Mourvèdre geeft:

- body
- diepgang
- kruidigheid
- aardse tonen

Aroma’s:

- kruiden
- donkere kers
- leer
- mediterrane kruiden

In rosé zorgt Mourvèdre voor:

- lengte
- complexiteit
- bewaarpotentieel

Veel gebruikt in Bandol.
',
    '- Mourvèdre
- kracht
- kruiden
- rijping
- complexiteit
',
    'Bandol rosé kan vaak meerdere jaren rijpen door Mourvèdre.
',
    '- Krachtig
- Complex
- Gastronomisch
- Rijpingspotentieel
',
    '### Opdracht

Vergelijk Bandol met Provence.
',
    8,
    4
  ),
  (
    'tempranillo-rosado',
    'Tempranillo rosado',
    'Na deze les herken jij Tempranillo in Spaanse rosado.
',
    'Tempranillo is belangrijk in Spanje.

Rosado op basis van Tempranillo geeft vaak:

- kersen
- aardbei
- kruiden
- meer body

Structuur:

- medium tot vol
- zachte tannines
- rijper fruit

Vaak minder strak dan Provence.

Meer gericht op fruit en toegankelijkheid.
',
    '- Grenache
- Cinsault
- Syrah
- Mourvèdre
- Tempranillo
- blend
- body
- finesse',
    'Tempranillo rosado is populair in Rioja en Navarra.
',
    '- Belangrijk in Spanje
- Meer fruitgedreven
- Vaak voller
- Toegankelijk
',
    '### Opdracht

Vergelijk Tempranillo rosado met Grenache rosé.

### Checklist

- Ik heb kleur vergeleken
- Ik heb fruit vergeleken
- Ik heb body vergeleken
- Ik heb zuren vergeleken

### Reflectievraag

Welke druif geeft volgens jou meer structuur?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- stijl-gastronomie-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'stijl-gastronomie-rose-wine'
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
    'licht-en-fris',
    'Licht en fris',
    'Na deze les begrijp jij hoe lichte rosé gastronomisch werkt.
',
    'Lichte rosé draait om:

- hoge frisheid
- lage body
- strakke zuren
- subtiele fruitigheid

Typische voorbeelden:

- Provence
- Chiaretto
- lichte Navarra rosado

Deze stijl werkt uitstekend als:

- aperitief
- bij salades
- bij lichte vis
- bij schaal- en schelpdieren

Belangrijk:

lichte rosé vraagt verfijnde gerechten.

Te zware gerechten maken de wijn kleiner.
',
    '- licht
- fris
- zuur
- elegantie
- aperitief
',
    'Hoe hoger de zuren, hoe beter rosé vaak werkt met frisse gerechten.
',
    '- Licht = elegant
- Hoge frisheid
- Minder body
- Beste bij lichte gerechten
',
    '### Opdracht

Bedenk drie gerechten voor een Provence rosé.

### Reflectievraag

Waarom passen zware sauzen minder goed?
',
    8,
    1
  ),
  (
    'fruitig-en-sappig',
    'Fruitig en sappig',
    'Na deze les kun jij fruitige rosé herkennen en inzetten.
',
    'Fruitige rosé draait om direct drinkplezier.

Typische aroma’s:

- aardbei
- framboos
- kers
- watermeloen

Deze stijl is vaak:

- toegankelijk
- vriendelijk
- soepel

Typische regio’s:

- Spanje
- Californië
- Australië

Foodpairing:

- tapas
- gegrilde groenten
- pizza
- lichte barbecue

Fruitige rosé werkt goed bij casual dining.
',
    '- fruit
- sappig
- toegankelijk
- rood fruit
- casual
',
    'Fruitige rosé is wereldwijd de grootste commerciële stijl.
',
    '- Veel primair fruit
- Toegankelijk
- Breed inzetbaar
- Casual stijl
',
    '### Opdracht

Zoek een fruitige rosé en beschrijf drie fruitaroma’s.
',
    8,
    2
  ),
  (
    'kruidig-en-droog',
    'Kruidig en droog',
    'Na deze les begrijp jij de rol van kruidigheid in rosé.
',
    'Sommige rosés zijn droger en kruidiger.

Kenmerken:

- mediterrane kruiden
- witte peper
- tijm
- rozemarijn
- lavendel

Deze stijl zie je vaak in:

- Tavel
- Bandol
- Zuid-Italië

Kruidigheid geeft:

- meer complexiteit
- meer gastronomische waarde
- langere inzetbaarheid aan tafel

Perfect bij:

- gegrilde vis
- kruidige kip
- Provençaalse gerechten
',
    '- kruiden
- droog
- complexiteit
- Syrah
- Mourvèdre
',
    'Kruidigheid komt vaak van Syrah en Mourvèdre.
',
    '- Minder fruitig
- Meer kruidigheid
- Meer complexiteit
- Sterker gastronomisch
',
    '### Opdracht

Proef een kruidige rosé en noteer kruiden.
',
    8,
    3
  ),
  (
    'structuur-en-body',
    'Structuur en body',
    'Na deze les kun jij body en textuur inzetten bij pairing.
',
    'Niet alle rosé is licht.

Body bepaalt:

- gewicht
- mondgevoel
- inzetbaarheid

Lichte body:

- aperitief
- salades
- schaaldieren

Medium body:

- vis
- kip
- pasta

Volle body:

- barbecue
- kalf
- kruidige gerechten

Belangrijk:

De wijn moet het gerecht kunnen dragen.
',
    '- body
- structuur
- gewicht
- textuur
- pairing
',
    'Bandol rosé heeft vaak bijna rode-wijn-achtige structuur.
',
    '- Body is cruciaal
- Meer body = meer pairingopties
- Structuur bepaalt kracht
',
    '### Opdracht

Maak een lijst van drie rosés op body.
',
    8,
    4
  ),
  (
    'rose-als-maaltijdwijn',
    'Rosé als maaltijdwijn',
    'Na deze les begrijp jij waarom rosé een serieuze gastronomische wijn is.
',
    'Rosé wordt vaak onderschat aan tafel.

Maar rosé heeft unieke voordelen:

- fris genoeg voor lichte gerechten
- body genoeg voor complexere gerechten
- fruit genoeg voor kruidigheid
- zuren genoeg voor vet

Rosé werkt sterk met:

- Mediterrane keuken
- Aziatische keuken
- barbecue
- charcuterie
- gegrilde vis

Rosé is vaak de perfecte middenweg tussen wit en rood.

Dat maakt rosé extreem flexibel.
',
    '- body
- pairing
- frisheid
- kruidigheid
- gastronomische rosé
- structuur
- balans',
    'Toprestaurants werken steeds vaker met rosépairings.
',
    '- Rosé is gastronomisch sterk
- Breed inzetbaar
- Veelzijdiger dan vaak gedacht
- Perfect tussen wit en rood
',
    '### Opdracht

Maak een 3-gangenmenu met rosépairing.

### Checklist

- Ik heb voorgerecht gekozen
- Ik heb hoofdgerecht gekozen
- Ik heb roséstijl gekoppeld
- Ik kan mijn keuzes uitleggen

### Reflectievraag

Bij welk gerecht zou rosé volgens jou het sterkst werken?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-rose-wine (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'service-rose-wine'
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
    'serveertemperatuur',
    'Serveertemperatuur',
    'Na deze les weet jij welke temperatuur ideaal is voor verschillende roséstijlen.
',
    'Temperatuur bepaalt hoe rosé smaakt.

Te koud:

- aroma’s sluiten
- structuur verdwijnt
- zuren domineren

Te warm:

- alcohol wordt opvallender
- frisheid daalt
- wijn voelt log

Richtlijnen:

### Lichte rosé:
8–10°C

Voorbeelden:
- Provence
- Chiaretto

### Fruitige rosé:
9–11°C

Voorbeelden:
- Rosado
- Nieuwe Wereld

### Gastronomische rosé:
11–13°C

Voorbeelden:
- Tavel
- Bandol

Hoe voller de rosé, hoe warmer je mag serveren.
',
    '- temperatuur
- service
- aroma
- balans
- expressie
',
    'Veel rosé wordt structureel te koud geserveerd.
',
    '- Temperatuur bepaalt expressie
- Licht = koeler
- Vol = warmer
- Te koud sluit aroma’s
',
    '### Opdracht

Serveer dezelfde rosé op 8°C en op 12°C.

### Reflectievraag

Welke temperatuur gaf meer aroma?
',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij welk glas het beste werkt voor rosé.
',
    'Glaswerk beïnvloedt geur en smaak.

Voor rosé geldt meestal:

### Licht en fris:
kleiner witwijnglas

Voordelen:
- behoud frisheid
- focus op zuren

### Volle rosé:
groter witwijnglas

Voordelen:
- meer aromatische opening
- betere textuurbeleving

Vermijd:

- te kleine glazen
- dikke horeca-glazen
- rodewijnglazen voor lichte rosé

Het juiste glas versterkt balans.
',
    '- glaswerk
- aroma
- expressie
- service
- textuur
',
    'Veel top-sommeliers gebruiken Bourgogne-witwijnglazen voor serieuze rosé.
',
    '- Glas beïnvloedt beleving
- Licht = kleiner glas
- Vol = groter glas
- Glas stuurt aroma
',
    '### Opdracht

Proef rosé uit twee verschillende glazen.
',
    8,
    2
  ),
  (
    'bewaren',
    'Bewaren',
    'Na deze les weet jij hoe rosé correct wordt opgeslagen.
',
    'De meeste rosés zijn bedoeld om jong te drinken.

Ideale opslag:

- donker
- koel
- stabiele temperatuur
- liggend (bij kurk)

Belangrijkste risico’s:

- warmte
- licht
- zuurstof
- temperatuurschommelingen

Rosé verliest relatief snel:

- frisheid
- fruit
- spanning

Jonge rosé is vaak het best binnen 1–3 jaar.
',
    '- opslag
- oxidatie
- licht
- temperatuur
- bewaarpotentieel
',
    'Lichte Provence rosé verliest vaak sneller zijn optimale frisheid dan krachtigere rosés.
',
    '- Jong drinken is meestal ideaal
- Koele opslag is belangrijk
- Licht en warmte schaden kwaliteit
',
    '### Opdracht

Controleer jouw wijnopslag.
',
    8,
    3
  ),
  (
    'jong-drinken-vs-rijping',
    'Jong drinken vs rijping',
    'Na deze les kun jij bepalen welke rosés rijpingspotentieel hebben.
',
    'De meeste rosés zijn niet bedoeld voor lange rijping.

Maar uitzonderingen bestaan.

Rosés met rijpingspotentieel:

- Bandol
- Tavel
- sommige top Rosado’s

Waarom?

Door:

- meer structuur
- meer extractie
- hogere concentratie
- betere balans

Rijping kan ontwikkelen:

- kruiden
- gedroogd fruit
- aardse tonen
- complexiteit

Belangrijk:

Niet elke rosé wordt beter met tijd.
',
    '- temperatuur
- glaswerk
- opslag
- rijping
- oxidatie
- presentatie
- bewaarpotentieel',
    'Bandol rosé kan soms 5–10 jaar rijpen.
',
    '- Meeste rosé jong drinken
- Enkele stijlen rijpen goed
- Structuur bepaalt potentieel
',
    '### Opdracht

Zoek drie rosés en schat hun bewaarpotentieel.

### Checklist

- Ik heb de stijl bekeken
- Ik heb body beoordeeld
- Ik heb extractie ingeschat
- Ik heb bewaarpotentieel bepaald

### Reflectievraag

Welke rosé zou jij laten rijpen?
',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-rose-wine (6 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'pairing-rose-wine'
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
    'rose-en-salades',
    'Rosé & salades',
    'Na deze les begrijp jij waarom rosé uitstekend werkt met salades.
',
    'Salades lijken licht, maar kunnen lastig pairen.

Door:

- zuur uit dressing
- bitterheid uit bladgroenten
- vet uit kaas of noten

Rosé werkt goed door:

- frisse zuren
- fruitigheid
- lichte body

Beste stijlen:

- Provence
- Chiaretto
- Navarra rosado

Rosé ondersteunt zonder te domineren.
',
    '- salade
- zuur
- frisheid
- pairing
- balans
',
    'Zure vinaigrettes maken veel rode wijn hard, maar rosé blijft vaak in balans.
',
    '- Rosé matcht goed met frisheid
- Salades vragen zuren
- Lichtgewicht werkt het best
',
    '### Opdracht

Kies drie salades en bepaal passende roséstijl.

### Reflectievraag

Welke salade lijkt het lastigst?
',
    8,
    1
  ),
  (
    'rose-en-vis',
    'Rosé & vis',
    'Na deze les kun jij rosé koppelen aan visgerechten.
',
    'Rosé werkt verrassend goed met vis.

Waarom?

Omdat rosé combineert:

- frisheid van wit
- structuur van rood

Beste combinaties:

### Lichte rosé:
- gegrilde dorade
- ceviche
- tonijn tartaar

### Vollere rosé:
- zalm
- tonijn steak
- mediterrane visgerechten

Belangrijk:

hoe vetter de vis, hoe meer body rosé mag hebben.
',
    '- vis
- vet
- structuur
- zuur
- rosé
',
    'Rosé is één van de beste wijnen bij tonijn.
',
    '- Rosé werkt sterk met vis
- Vet bepaalt bodykeuze
- Tonijn is topcombinatie
',
    '### Opdracht

Bedenk drie visgerechten en kies stijl.
',
    8,
    2
  ),
  (
    'rose-en-barbecue',
    'Rosé & barbecue',
    'Na deze les begrijp jij waarom rosé perfect werkt bij barbecue.
',
    'Barbecue combineert:

- rook
- vet
- kruiden
- grillaroma

Rosé werkt goed omdat:

- zuren vet snijden
- fruit rook opvangt
- body voldoende structuur geeft

Beste stijlen:

- Tavel
- Bandol
- Rosado
- Syrah rosé

Goede pairings:

- gegrilde kip
- lamskotelet
- groentespies
- pulled chicken

Rosé is vaak veelzijdiger dan rood bij barbecue.
',
    '- barbecue
- rook
- vet
- kruiden
- body
',
    'Kruidige rosé kan rooktonen beter integreren dan veel lichte rode wijnen.
',
    '- Rosé werkt uitstekend bij barbecue
- Vet + zuur = sterke combinatie
- Krachtige rosé werkt het best
',
    '### Opdracht

Maak een barbecue-menu met rosépairing.
',
    8,
    3
  ),
  (
    'rose-en-aziatisch',
    'Rosé & Aziatische keuken',
    'Na deze les kun jij rosé koppelen aan Aziatische gerechten.
',
    'Aziatische keuken bevat vaak:

- spice
- umami
- zoet-zout
- zuur

Rosé werkt sterk door:

- fruitigheid
- frisse zuren
- zachte structuur

Goede pairings:

- sushi
- Thaise curry
- Vietnamese gerechten
- poke bowls

Belangrijk:

vermijd te zware rosé bij delicate gerechten.
',
    '- Aziatisch
- spice
- umami
- fruit
- zuur
',
    'Rosé is vaak veiliger dan rood bij pittige gerechten.
',
    '- Rosé is flexibel in Aziatische pairing
- Fruit helpt spice
- Frisheid houdt balans
',
    '### Opdracht

Kies een sushi-menu en selecteer rosé.
',
    8,
    4
  ),
  (
    'rose-en-charcuterie',
    'Rosé & charcuterie',
    'Na deze les begrijp jij waarom rosé goed werkt met charcuterie.
',
    'Charcuterie bevat:

- zout
- vet
- kruiden
- umami

Rosé biedt:

- frisheid
- fruit
- structuur

Goede combinaties:

- prosciutto
- salami
- jamón
- terrines

Rosé voorkomt dat zout de wijn hard maakt.

Dat maakt rosé vaak beter dan zware rode wijn.
',
    '- charcuterie
- zout
- vet
- umami
- frisheid
',
    'Rosé is één van de meest onderschatte charcuterie-wijnen.
',
    '- Zout + rosé werkt sterk
- Vet vraagt zuur
- Rosé houdt spanning
',
    '### Opdracht

Maak een charcuterie-plank en kies rosé.
',
    8,
    5
  ),
  (
    'rose-en-fine-dining',
    'Rosé & fine dining',
    'Na deze les begrijp jij hoe rosé op hoog gastronomisch niveau wordt ingezet.
',
    'Toprestaurants gebruiken rosé steeds vaker.

Waarom?

Omdat rosé:

- flexibel is
- breed inzetbaar is
- tussen wit en rood beweegt

Perfect bij:

- langoustine
- kreeft
- truffelgerechten
- kalf
- gegrilde groenten

Topstijlen:

- Bandol
- Tavel
- prestige Provence

Rosé vraagt precisie.

De juiste stijl maakt het verschil.
',
    '- pairing
- vis
- barbecue
- charcuterie
- fine dining
- zuur
- body
- balans',
    'Steeds meer Michelin-restaurants bouwen rosé in pairing-menu’s.
',
    '- Rosé hoort thuis in fine dining
- Topstijlen hebben complexiteit
- Structuur bepaalt inzetbaarheid
',
    '### Opdracht

Maak een 5-gangen rosépairingmenu.

### Checklist

- Ik heb vijf gerechten gekozen
- Ik heb stijlen gekoppeld
- Ik heb body afgestemd
- Ik heb zuren afgestemd

### Reflectievraag

Bij welke gang zou rosé het moeilijkst zijn?
',
    8,
    6
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-rose-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'examen-rose-wine'
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
    'provence-vs-tavel-blind',
    'Provence vs Tavel blind',
    'Na deze les kun jij Provence en Tavel blind onderscheiden.
',
    'Dit is één van de belangrijkste rosévergelijkingen.

### Provence:

Kenmerken:

- zeer bleek
- strak
- citrus
- mineraal
- licht

### Tavel:

Kenmerken:

- donkerder
- krachtiger
- kruidiger
- voller
- langer

Focuspunten:

- kleur
- geurintensiteit
- body
- kruidigheid

Dit is de basis van roséblindproeven.
',
    '- blindproeven
- Provence
- Tavel
- structuur
- stijlherkenning
',
    'Tavel wordt vaak warmer geserveerd dan Provence.
',
    '- Provence = licht
- Tavel = krachtig
- Kleur geeft eerste aanwijzing
- Structuur bevestigt
',
    '### Opdracht

Proef twee rosés blind en bepaal welke Provence of Tavel is.

### Reflectievraag

Welke indicator gaf de doorslag?
',
    10,
    1
  ),
  (
    'rose-vs-lichte-rode-wijn-blind',
    'Rosé vs lichte rode wijn blind',
    'Na deze les kun jij rosé onderscheiden van lichte rode wijn.
',
    'Dit is moeilijker dan veel mensen denken.

Overeenkomsten:

- rood fruit
- frisse zuren
- lichte body

Verschillen:

### Rosé:
- minder tannine
- lichtere kleur
- frissere textuur

### Lichte rode wijn:
- meer extractie
- meer tannine
- meer diepte

Belangrijk:

let op textuur en grip.
',
    '- blindproeven
- tannine
- rosé
- lichte rode wijn
- textuur
',
    'Koude lichte rode wijn wordt vaak verward met krachtige rosé.
',
    '- Tannine is sleutel
- Rosé is lichter
- Rood heeft meer grip
- Structuur geeft duidelijkheid
',
    '### Opdracht

Proef blind een rosé en een Pinot Noir.
',
    10,
    2
  ),
  (
    'theorie-praktijkexamen',
    'Theorie- en praktijkexamen',
    'Na deze les toets jij jouw volledige rosékennis.
',
    'Je wordt getest op:

### Fundament
- Wat is rosé?
- Productiemethoden

### Stijlen
- Provence
- Tavel
- Rosado
- Rosato

### Druiven
- Grenache
- Cinsault
- Syrah
- Mourvèdre
- Tempranillo

### Service
- temperatuur
- glaswerk
- opslag

### Pairing
- salades
- vis
- barbecue
- Aziatisch
- fine dining

### Blindproeven
- stijlherkenning
- structuur
- kleur
- regio
',
    '- examen
- blindproeven
- stijlherkenning
- pairing
- service
- druivenkennis
- productiekennis
- analyse
',
    '',
    '',
    '### Examenopdracht

Voer een volledige blindanalyse uit van één rosé.

Beschrijf:

- kleur
- geur
- fruit
- kruidigheid
- zuur
- body
- stijl
- regio-inschatting
- druiveninschatting
- foodpairing
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
  where t.slug = 'rose-wine'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-rose-wine', 'wat-is-rose', 1, 'Van welke druiven wordt rosé meestal gemaakt?', '["Witte druiven", "Blauwe druiven", "Groene druiven", "Gedroogde druiven"]', 1, 'Correct: Blauwe druiven'),
  ('intro-rose-wine', 'wat-is-rose', 2, 'Hoe ontstaat de kleur?', '["Houtrijping", "Kort schilcontact", "Suiker toevoegen", "Oxidatie"]', 1, 'Correct: Kort schilcontact'),
  ('intro-rose-wine', 'wat-is-rose', 3, 'Rosé zit qua stijl tussen:', '["Bier en wijn", "Wit en rood", "Port en sherry", "Mousserend en stil"]', 1, 'Correct: Wit en rood'),
  ('intro-rose-wine', 'wat-is-rose', 4, 'Rosé is meestal:', '["Zeer zwaar", "Fris en fruitig", "Altijd zoet", "Altijd houtgerijpt"]', 1, 'Correct: Fris en fruitig'),
  ('intro-rose-wine', 'wat-is-rose', 5, 'Rosé wordt gemaakt van:', '["Alleen Grenache", "Alleen Syrah", "Verschillende blauwe druiven", "Alleen witte druiven"]', 2, 'Correct: Verschillende blauwe druiven'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 1, 'Hoe ontstaat rosé?', '["Door lange houtrijping", "Door kort schilcontact", "Door distillatie", "Door koolzuurvorming"]', 1, 'Correct: Door kort schilcontact'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 2, 'Welke druiven worden gebruikt voor rosé?', '["Alleen witte druiven", "Alleen groene druiven", "Blauwe druiven", "Gedroogde druiven"]', 2, 'Correct: Blauwe druiven'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 3, 'Wat gebeurt na het schilcontact?', '["Schillen blijven aanwezig", "Sap wordt gescheiden van schillen", "Wijn wordt gedistilleerd", "Suiker wordt toegevoegd"]', 1, 'Correct: Sap wordt gescheiden van schillen'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 4, 'Langere extractie geeft meestal:', '["Minder kleur", "Meer kleur", "Minder smaak", "Minder alcohol"]', 1, 'Correct: Meer kleur'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 5, 'Roséproductie lijkt technisch het meest op:', '["Witte wijn", "Port", "Bier", "Sherry"]', 0, 'Correct: Witte wijn'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 1, 'Waarom is rosé uniek?', '["Omdat het versterkt is", "Omdat het wit en rood combineert", "Omdat het mousserend is", "Omdat het altijd zoet is"]', 1, 'Correct: Omdat het wit en rood combineert'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 2, 'Rosé combineert vaak:', '["Tannine en hout", "Frisheid en fruit", "Zoet en oxidatie", "Bitter en zout"]', 1, 'Correct: Frisheid en fruit'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 3, 'Welke stijl staat bekend als serieuze rosé?', '["Tavel", "Cava", "Port", "Sauternes"]', 0, 'Correct: Tavel'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 4, 'Rosé wordt vaak onderschat omdat:', '["Het te oud is", "Het als simpele zomerwijn wordt gezien", "Het teveel alcohol heeft", "Het te duur is"]', 1, 'Correct: Het als simpele zomerwijn wordt gezien'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 1, 'Rosé is historisch:', '["Een moderne stijl", "Een oude wijnstijl", "Een nieuwe trend", "Een dessertwijn"]', 1, 'Correct: Een oude wijnstijl'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 2, 'Waarom waren oude rode wijnen vaak lichter?', '["Minder extractietechniek", "Meer hout", "Meer alcohol", "Minder druiven"]', 0, 'Correct: Minder extractietechniek'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 3, 'Welke regio werd de moderne benchmark?', '["Douro", "Provence", "Mosel", "Rioja"]', 1, 'Correct: Provence'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 4, 'Rosé wordt tegenwoordig:', '["Alleen in Frankrijk gemaakt", "Wereldwijd gemaakt", "Alleen in Spanje gemaakt", "Alleen in Italië gemaakt"]', 1, 'Correct: Wereldwijd gemaakt'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 5, 'Rosé ontwikkelde zich uit:', '["Port", "Oude rode wijnstijlen", "Mousserende wijn", "Dessertwijn"]', 1, 'Correct: Oude rode wijnstijlen'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 1, 'Welke regio staat bekend om lichte rosé?', '["Douro", "Provence", "Mosel", "Rioja"]', 1, 'Correct: Provence'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 2, 'Welke stijl is vaak krachtiger?', '["Tavel", "Provence", "Sancerre", "Chablis"]', 0, 'Correct: Tavel'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 3, 'Rosado komt vooral uit:', '["Spanje", "Duitsland", "Oostenrijk", "Zuid-Afrika"]', 0, 'Correct: Spanje'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 4, 'Welke stijl heeft vaak meer body?', '["Tavel", "Provence", "Pinot Grigio", "Riesling"]', 0, 'Correct: Tavel'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 5, 'Rosé kan zijn:', '["Alleen licht", "Alleen zoet", "Alleen eenvoudig", "Licht of gastronomisch"]', 3, 'Correct: Licht of gastronomisch'),
  ('productie-rose-wine', 'direct-press-methode', 1, 'Wat betekent direct press?', '["Lang schilcontact", "Direct persen", "Geen vergisting", "Houtrijping"]', 1, 'Correct: Direct persen'),
  ('productie-rose-wine', 'direct-press-methode', 2, 'Welke stijl ontstaat vaak?', '["Donker en zwaar", "Licht en fris", "Zoet", "Oxidatief"]', 1, 'Correct: Licht en fris'),
  ('productie-rose-wine', 'direct-press-methode', 3, 'Welke regio gebruikt dit veel?', '["Douro", "Provence", "Rioja", "Piemonte"]', 1, 'Correct: Provence'),
  ('productie-rose-wine', 'direct-press-methode', 4, 'Wat blijft vaak behouden?', '["Houttonen", "Frisheid", "Oxidatie", "Bitterheid"]', 1, 'Correct: Frisheid'),
  ('productie-rose-wine', 'direct-press-methode', 5, 'Kleur is meestal:', '["Diep rood", "Licht roze", "Oranje", "Bruin"]', 1, 'Correct: Licht roze'),
  ('productie-rose-wine', 'saignee-methode', 1, 'Wat betekent saignée?', '["Koelen", "Bloeden", "Rijpen", "Filteren"]', 1, 'Correct: Bloeden'),
  ('productie-rose-wine', 'saignee-methode', 2, 'Waar komt het sap vandaan?', '["Uit witte wijn", "Uit rode wijn in wording", "Uit mousserende wijn", "Uit Port"]', 1, 'Correct: Uit rode wijn in wording'),
  ('productie-rose-wine', 'saignee-methode', 3, 'Saignée geeft vaak:', '["Minder kleur", "Meer kleur", "Minder body", "Minder aroma"]', 1, 'Correct: Meer kleur'),
  ('productie-rose-wine', 'saignee-methode', 4, 'Saignée geeft vaak:', '["Meer body", "Minder body", "Minder structuur", "Minder alcohol"]', 0, 'Correct: Meer body'),
  ('productie-rose-wine', 'saignee-methode', 5, 'Saignée beïnvloedt ook:', '["Rode wijnconcentratie", "Flesgrootte", "Kurksoort", "Etiket"]', 0, 'Correct: Rode wijnconcentratie'),
  ('productie-rose-wine', 'kleurcontrole', 1, 'Wat bepaalt vooral de kleur van rosé?', '["Kurk", "Schilcontactduur", "Alcohol", "Leeftijd"]', 1, 'Correct: Schilcontactduur'),
  ('productie-rose-wine', 'kleurcontrole', 2, 'Meer schilcontact geeft:', '["Minder kleur", "Meer kleur", "Minder body", "Minder geur"]', 1, 'Correct: Meer kleur'),
  ('productie-rose-wine', 'kleurcontrole', 3, 'Welke factor speelt ook mee?', '["Druivenras", "Flesvorm", "Label", "Glas"]', 0, 'Correct: Druivenras'),
  ('productie-rose-wine', 'kleurcontrole', 4, 'Grenache geeft vaak:', '["Donkere rosé", "Lichtere rosé", "Bruine rosé", "Mousserende rosé"]', 1, 'Correct: Lichtere rosé'),
  ('productie-rose-wine', 'kleurcontrole', 5, 'Kleur is:', '["Toeval", "Bewuste keuze", "Altijd hetzelfde", "Onbelangrijk"]', 1, 'Correct: Bewuste keuze'),
  ('productie-rose-wine', 'fermentatie-van-rose', 1, 'Rosé wordt vaak vergist op:', '["Hoge temperatuur", "Lage temperatuur", "Geen temperatuur", "Kamertemperatuur"]', 1, 'Correct: Lage temperatuur'),
  ('productie-rose-wine', 'fermentatie-van-rose', 2, 'Koele fermentatie behoudt:', '["Fruitigheid", "Oxidatie", "Bitterheid", "Tannines"]', 0, 'Correct: Fruitigheid'),
  ('productie-rose-wine', 'fermentatie-van-rose', 3, 'Wat is reductief werken?', '["Veel zuurstof", "Weinig zuurstof", "Meer alcohol", "Meer suiker"]', 1, 'Correct: Weinig zuurstof'),
  ('productie-rose-wine', 'fermentatie-van-rose', 4, 'Hogere temperatuur geeft vaak:', '["Minder structuur", "Meer structuur", "Minder geur", "Minder alcohol"]', 1, 'Correct: Meer structuur'),
  ('productie-rose-wine', 'fermentatie-van-rose', 5, 'Moderne rosé draait vaak om:', '["Frisheid", "Oxidatie", "Hout", "Zoetheid"]', 0, 'Correct: Frisheid'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 1, 'Welke stijl heeft vaak meer body?', '["Frisse rosé", "Gastronomische rosé", "Mousserende rosé", "Witte wijn"]', 1, 'Correct: Gastronomische rosé'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 2, 'Welke regio staat bekend om gastronomische rosé?', '["Tavel", "Mosel", "Loire", "Bourgogne"]', 0, 'Correct: Tavel'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 3, 'Koele vergisting behoudt:', '["Bitterheid", "Fruitigheid", "Hout", "Oxidatie"]', 1, 'Correct: Fruitigheid'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 4, 'Welke methode geeft vaak meer extractie?', '["Direct press", "Saignée", "Carbonic", "Ice wine"]', 1, 'Correct: Saignée'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 5, 'Frisse rosé is vaak:', '["Zwaarder", "Lichter", "Zoeter", "Ouder"]', 1, 'Correct: Lichter'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 1, 'Wat is stap 1?', '["Proeven", "Kijken", "Ruiken", "Schrijven"]', 1, 'Correct: Kijken'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 2, 'Wat analyseer je als tweede?', '["Ruiken", "Kijken", "Drinken", "Serveren"]', 0, 'Correct: Ruiken'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 3, 'Waarom is structuur belangrijk?', '["Voor kleur", "Voor stijlherkenning", "Voor alcohol", "Voor temperatuur"]', 1, 'Correct: Voor stijlherkenning'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 4, 'Wat komt als laatste?', '["Concluderen", "Kijken", "Ruiken", "Spoelen"]', 0, 'Correct: Concluderen'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 5, 'Rosé proeven vraagt:', '["Minder aandacht", "Meer aandacht voor subtiliteit", "Alleen geur", "Alleen kleur"]', 1, 'Correct: Meer aandacht voor subtiliteit'),
  ('proeven-rose-wine', 'kleur-analyseren', 1, 'Wat analyseer je als eerste?', '["Geur", "Kleur", "Alcohol", "Afdronk"]', 1, 'Correct: Kleur'),
  ('proeven-rose-wine', 'kleur-analyseren', 2, 'Bleek zalm wijst vaak op:', '["Lange extractie", "Korte extractie", "Oxidatie", "Houtlagering"]', 1, 'Correct: Korte extractie'),
  ('proeven-rose-wine', 'kleur-analyseren', 3, 'Donkere rosé wijst vaak op:', '["Minder body", "Meer extractie", "Minder fruit", "Minder structuur"]', 1, 'Correct: Meer extractie'),
  ('proeven-rose-wine', 'kleur-analyseren', 4, 'Welke stijl is meestal het lichtst?', '["Provence", "Tavel", "Bandol", "Rosado"]', 0, 'Correct: Provence'),
  ('proeven-rose-wine', 'kleur-analyseren', 5, 'Kleur geeft informatie over:', '["Extractie", "Kurk", "Leeftijd", "Prijs"]', 0, 'Correct: Extractie'),
  ('proeven-rose-wine', 'aromas-herkennen', 1, 'Welke aroma is typisch voor rosé?', '["Aardbei", "Koffie", "Tabak", "Teer"]', 0, 'Correct: Aardbei'),
  ('proeven-rose-wine', 'aromas-herkennen', 2, 'Citrusaroma’s geven vaak:', '["Frisheid", "Bitterheid", "Hout", "Oxidatie"]', 0, 'Correct: Frisheid'),
  ('proeven-rose-wine', 'aromas-herkennen', 3, 'Syrah geeft vaak:', '["Meer kruiden", "Minder geur", "Minder kleur", "Minder body"]', 0, 'Correct: Meer kruiden'),
  ('proeven-rose-wine', 'aromas-herkennen', 4, 'Grenache geeft vaak:', '["Rood fruit", "Petroleum", "Honing", "Nootmuskaat"]', 0, 'Correct: Rood fruit'),
  ('proeven-rose-wine', 'aromas-herkennen', 5, 'Roséaroma’s zijn vaak:', '["Primair fruitgedreven", "Oxidatief", "Houtgedreven", "Gerijpt"]', 0, 'Correct: Primair fruitgedreven'),
  ('proeven-rose-wine', 'structuur-herkennen', 1, 'Wat geeft frisheid?', '["Alcohol", "Zuren", "Hout", "Tannine"]', 1, 'Correct: Zuren'),
  ('proeven-rose-wine', 'structuur-herkennen', 2, 'Wat bepaalt gewicht?', '["Body", "Kurk", "Etiket", "Leeftijd"]', 0, 'Correct: Body'),
  ('proeven-rose-wine', 'structuur-herkennen', 3, 'Wat geeft warmte?', '["Alcohol", "Suiker", "Glas", "Kurk"]', 0, 'Correct: Alcohol'),
  ('proeven-rose-wine', 'structuur-herkennen', 4, 'Wat beschrijft mondgevoel?', '["Textuur", "Aroma", "Kleur", "Herkomst"]', 0, 'Correct: Textuur'),
  ('proeven-rose-wine', 'structuur-herkennen', 5, 'Structuur helpt bij:', '["Stijlherkenning", "Kurkkeuze", "Prijsbepaling", "Oogstjaar"]', 0, 'Correct: Stijlherkenning'),
  ('proeven-rose-wine', 'mini-toets-rose', 1, 'Welke kleur wijst vaak op lichte extractie?', '["Diep roze", "Bleek zalm", "Bruin", "Oranje"]', 1, 'Correct: Bleek zalm'),
  ('proeven-rose-wine', 'mini-toets-rose', 2, 'Wat is typisch roséfruit?', '["Aardbei", "Banaan", "Kokos", "Koffie"]', 0, 'Correct: Aardbei'),
  ('proeven-rose-wine', 'mini-toets-rose', 3, 'Wat geeft frisheid?', '["Alcohol", "Suiker", "Zuren", "Hout"]', 2, 'Correct: Zuren'),
  ('proeven-rose-wine', 'mini-toets-rose', 4, 'Welke stijl is vaak gastronomischer?', '["Tavel", "Provence", "Pinot Grigio", "Sauvignon Blanc"]', 0, 'Correct: Tavel'),
  ('proeven-rose-wine', 'mini-toets-rose', 5, 'Wat beoordeel je eerst?', '["Geur", "Kleur", "Smaak", "Afdronk"]', 1, 'Correct: Kleur'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 1, 'Provence rosé is meestal:', '["Zoet", "Licht en droog", "Donker en zwaar", "Oxidatief"]', 1, 'Correct: Licht en droog'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 2, 'Welke druif is belangrijk?', '["Grenache", "Riesling", "Nebbiolo", "Chenin Blanc"]', 0, 'Correct: Grenache'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 3, 'Kleur is vaak:', '["Dieprood", "Bleek zalmroze", "Oranje", "Bruin"]', 1, 'Correct: Bleek zalmroze'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 4, 'Stijl draait om:', '["Zwaarte", "Elegantie", "Hout", "Restsuiker"]', 1, 'Correct: Elegantie'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 5, 'Provence ligt in:', '["Noord-Frankrijk", "Zuid-Frankrijk", "Spanje", "Italië"]', 1, 'Correct: Zuid-Frankrijk'),
  ('klassieke-stijlen-rose-wine', 'tavel', 1, 'Tavel produceert:', '["Alleen rode wijn", "Alleen rosé", "Alleen witte wijn", "Mousserende wijn"]', 1, 'Correct: Alleen rosé'),
  ('klassieke-stijlen-rose-wine', 'tavel', 2, 'Tavel is meestal:', '["Lichter dan Provence", "Krachtiger dan Provence", "Zoeter dan Provence", "Minder gastronomisch"]', 1, 'Correct: Krachtiger dan Provence'),
  ('klassieke-stijlen-rose-wine', 'tavel', 3, 'Welke eigenschap hoort bij Tavel?', '["Bleek en strak", "Donker en krachtig", "Oxidatief", "Mousserend"]', 1, 'Correct: Donker en krachtig'),
  ('klassieke-stijlen-rose-wine', 'tavel', 4, 'Tavel wordt vaak genoemd:', '["Koning van rosé", "Koning van Port", "Koning van bier", "Koning van Champagne"]', 0, 'Correct: Koning van rosé'),
  ('klassieke-stijlen-rose-wine', 'tavel', 5, 'Tavel heeft vaak:', '["Meer body", "Minder body", "Minder structuur", "Minder kleur"]', 0, 'Correct: Meer body'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 1, 'Rosado is de term voor rosé in:', '["Italië", "Spanje", "Frankrijk", "Portugal"]', 1, 'Correct: Spanje'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 2, 'Rosado is vaak:', '["Fruitiger", "Oxidatief", "Zoeter", "Mousserend"]', 0, 'Correct: Fruitiger'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 3, 'Belangrijke druif in rosado?', '["Garnacha", "Riesling", "Pinot Blanc", "Chenin Blanc"]', 0, 'Correct: Garnacha'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 4, 'Belangrijke regio?', '["Navarra", "Mosel", "Loire", "Bourgogne"]', 0, 'Correct: Navarra'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 5, 'Rosado heeft vaak:', '["Meer direct fruit", "Minder fruit", "Geen body", "Geen zuur"]', 0, 'Correct: Meer direct fruit'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 1, 'Rosato is afkomstig uit:', '["Spanje", "Italië", "Frankrijk", "Portugal"]', 1, 'Correct: Italië'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 2, 'Welke stijl is vaak licht?', '["Chiaretto", "Tavel", "Bandol", "Syrah"]', 0, 'Correct: Chiaretto'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 3, 'Welke stijl is donkerder?', '["Chiaretto", "Cerasuolo d’Abruzzo", "Provence", "Navarra"]', 1, 'Correct: Cerasuolo d’Abruzzo'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 4, 'Cerasuolo betekent:', '["Aardbei", "Kersenkleur", "Citrus", "Bloemig"]', 1, 'Correct: Kersenkleur'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 5, 'Italiaanse rosato is:', '["Zeer uniform", "Zeer divers", "Altijd licht", "Altijd zwaar"]', 1, 'Correct: Zeer divers'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 1, 'Welke regio produceert alleen rosé?', '["Provence", "Tavel", "Rioja", "Toscana"]', 1, 'Correct: Tavel'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 2, 'Welke stijl is vaak het lichtst?', '["Tavel", "Provence", "Rosado", "Cerasuolo"]', 1, 'Correct: Provence'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 3, 'Rosado komt uit:', '["Italië", "Spanje", "Frankrijk", "Portugal"]', 1, 'Correct: Spanje'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 4, 'Nieuwe Wereld rosé is vaak:', '["Oxidatief", "Fruitiger", "Minder fruitig", "Minder rijp"]', 1, 'Correct: Fruitiger'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 5, 'Welke stijl is vaak het krachtigst?', '["Provence", "Tavel", "Chiaretto", "Pinot Grigio"]', 1, 'Correct: Tavel'),
  ('druivenrassen-rose-wine', 'grenache', 1, 'Grenache geeft vaak:', '["Tropisch fruit", "Rood fruit", "Petroleum", "Gras"]', 1, 'Correct: Rood fruit'),
  ('druivenrassen-rose-wine', 'grenache', 2, 'Grenache is belangrijk in:', '["Provence", "Mosel", "Loire", "Elzas"]', 0, 'Correct: Provence'),
  ('druivenrassen-rose-wine', 'grenache', 3, 'Grenache geeft meestal:', '["Zware tannines", "Zachte structuur", "Hoge bitterheid", "Zeer hoge zuren"]', 1, 'Correct: Zachte structuur'),
  ('druivenrassen-rose-wine', 'grenache', 4, 'Grenache wordt vaak:', '["Solo gebruikt", "In blends gebruikt", "Gedroogd", "Versterkt"]', 1, 'Correct: In blends gebruikt'),
  ('druivenrassen-rose-wine', 'grenache', 5, 'Typisch aroma?', '["Aardbei", "Boter", "Vanille", "Koffie"]', 0, 'Correct: Aardbei'),
  ('druivenrassen-rose-wine', 'cinsault', 1, 'Cinsault staat bekend om:', '["Kracht", "Finesse", "Hoge tannines", "Veel hout"]', 1, 'Correct: Finesse'),
  ('druivenrassen-rose-wine', 'cinsault', 2, 'Welke aroma’s geeft Cinsault vaak?', '["Bloemen", "Koffie", "Tabak", "Teer"]', 0, 'Correct: Bloemen'),
  ('druivenrassen-rose-wine', 'cinsault', 3, 'Cinsault geeft vaak:', '["Lichte kleur", "Donkere kleur", "Bruine kleur", "Geen kleur"]', 0, 'Correct: Lichte kleur'),
  ('druivenrassen-rose-wine', 'cinsault', 4, 'Cinsault wordt vaak gebruikt voor:', '["Meer elegantie", "Meer tannines", "Meer alcohol", "Meer oxidatie"]', 0, 'Correct: Meer elegantie'),
  ('druivenrassen-rose-wine', 'cinsault', 5, 'Cinsault komt veel voor in:', '["Provence", "Mosel", "Douro", "Champagne"]', 0, 'Correct: Provence'),
  ('druivenrassen-rose-wine', 'syrah', 1, 'Syrah geeft vaak:', '["Meer kruiden", "Minder kleur", "Minder body", "Minder geur"]', 0, 'Correct: Meer kruiden'),
  ('druivenrassen-rose-wine', 'syrah', 2, 'Syrah geeft vaak:', '["Donkerder kleur", "Lichtere kleur", "Geen kleur", "Oranje kleur"]', 0, 'Correct: Donkerder kleur'),
  ('druivenrassen-rose-wine', 'syrah', 3, 'Typisch Syrah-aroma?', '["Peper", "Honing", "Petroleum", "Citrus"]', 0, 'Correct: Peper'),
  ('druivenrassen-rose-wine', 'syrah', 4, 'Syrah verhoogt:', '["Structuur", "Zoetheid", "Hout", "Oxidatie"]', 0, 'Correct: Structuur'),
  ('druivenrassen-rose-wine', 'syrah', 5, 'Syrah wordt vaak gebruikt in:', '["Tavel", "Mosel", "Elzas", "Chablis"]', 0, 'Correct: Tavel'),
  ('druivenrassen-rose-wine', 'mourvedre', 1, 'Mourvèdre geeft vaak:', '["Meer body", "Minder body", "Minder geur", "Minder kleur"]', 0, 'Correct: Meer body'),
  ('druivenrassen-rose-wine', 'mourvedre', 2, 'Welke stijl gebruikt veel Mourvèdre?', '["Bandol", "Mosel", "Loire", "Chablis"]', 0, 'Correct: Bandol'),
  ('druivenrassen-rose-wine', 'mourvedre', 3, 'Mourvèdre geeft vaak:', '["Meer complexiteit", "Minder structuur", "Minder rijping", "Minder alcohol"]', 0, 'Correct: Meer complexiteit'),
  ('druivenrassen-rose-wine', 'mourvedre', 4, 'Typisch Mourvèdre-karakter?', '["Aards en kruidig", "Zoet en fris", "Citrus en licht", "Tropisch"]', 0, 'Correct: Aards en kruidig'),
  ('druivenrassen-rose-wine', 'mourvedre', 5, 'Mourvèdre draagt bij aan:', '["Bewaarpotentieel", "Minder lengte", "Minder kracht", "Minder kleur"]', 0, 'Correct: Bewaarpotentieel'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 1, 'Welke druif is de belangrijkste rosédruif?', '["Riesling", "Grenache", "Chardonnay", "Merlot"]', 1, 'Correct: Grenache'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 2, 'Welke druif geeft vaak finesse?', '["Cinsault", "Syrah", "Mourvèdre", "Tempranillo"]', 0, 'Correct: Cinsault'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 3, 'Welke druif geeft peperigheid?', '["Syrah", "Grenache", "Cinsault", "Pinot Blanc"]', 0, 'Correct: Syrah'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 4, 'Welke druif geeft veel body?', '["Mourvèdre", "Cinsault", "Riesling", "Sauvignon Blanc"]', 0, 'Correct: Mourvèdre'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 5, 'Tempranillo is vooral belangrijk in:', '["Italië", "Frankrijk", "Spanje", "Duitsland"]', 2, 'Correct: Spanje'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 1, 'Lichte rosé heeft vaak:', '["Lage zuren", "Hoge zuren", "Veel tannine", "Veel hout"]', 1, 'Correct: Hoge zuren'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 2, 'Beste pairing?', '["Steak", "Salade", "Stoofpot", "Wild"]', 1, 'Correct: Salade'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 3, 'Welke regio is klassiek?', '["Provence", "Douro", "Bordeaux", "Mosel"]', 0, 'Correct: Provence'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 4, 'Lichte rosé is vaak:', '["Zwaar", "Elegant", "Zoet", "Oxidatief"]', 1, 'Correct: Elegant'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 5, 'Structuur is meestal:', '["Licht", "Zwaar", "Tanninerijk", "Volledig houtgerijpt"]', 0, 'Correct: Licht'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 1, 'Fruitige rosé draait vaak om:', '["Houtrijping", "Direct fruitplezier", "Oxidatie", "Tannines"]', 1, 'Correct: Direct fruitplezier'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 2, 'Typisch aroma?', '["Aardbei", "Tabak", "Leer", "Teer"]', 0, 'Correct: Aardbei'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 3, 'Fruitige rosé is vaak:', '["Toegankelijk", "Moeilijk", "Zeer zwaar", "Zeer oud"]', 0, 'Correct: Toegankelijk'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 4, 'Welke regio produceert vaak fruitige rosé?', '["Californië", "Douro", "Mosel", "Jura"]', 0, 'Correct: Californië'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 5, 'Fruitige rosé werkt goed bij:', '["Tapas", "Stilton", "Wildzwijn", "Truffel"]', 0, 'Correct: Tapas'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 1, 'Kruidige rosé bevat vaak:', '["Mediterrane kruiden", "Banaan", "Karamel", "Vanille"]', 0, 'Correct: Mediterrane kruiden'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 2, 'Welke druiven dragen hier vaak aan bij?', '["Syrah en Mourvèdre", "Riesling en Chardonnay", "Pinot Blanc en Chenin", "Sémillon en Muscat"]', 0, 'Correct: Syrah en Mourvèdre'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 3, 'Kruidige rosé is vaak:', '["Complexer", "Simpeler", "Zoeter", "Minder body"]', 0, 'Correct: Complexer'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 4, 'Welke regio is klassiek?', '["Bandol", "Mosel", "Elzas", "Chablis"]', 0, 'Correct: Bandol'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 5, 'Kruidigheid helpt bij:', '["Gastronomie", "Minder pairing", "Minder structuur", "Minder lengte"]', 0, 'Correct: Gastronomie'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 1, 'Wat bepaalt het gewicht van rosé?', '["Body", "Kurk", "Etiket", "Leeftijd"]', 0, 'Correct: Body'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 2, 'Lichte body past goed bij:', '["Salades", "Wild", "Stoofpot", "Oude kaas"]', 0, 'Correct: Salades'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 3, 'Volle body past goed bij:', '["Barbecue", "Sorbet", "Oesters", "Citroen"]', 0, 'Correct: Barbecue'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 4, 'Body helpt bij:', '["Pairing", "Kurkkeuze", "Oogstjaar", "Prijs"]', 0, 'Correct: Pairing'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 5, 'Bandol heeft vaak:', '["Veel body", "Zeer weinig body", "Geen body", "Alleen zuur"]', 0, 'Correct: Veel body'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 1, 'Welke stijl heeft vaak de meeste body?', '["Provence", "Bandol", "Pinot Grigio", "Sauvignon Blanc"]', 1, 'Correct: Bandol'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 2, 'Lichte rosé werkt goed bij:', '["Salades", "Stoofpot", "Wild", "Oude kaas"]', 0, 'Correct: Salades'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 3, 'Kruidige rosé past goed bij:', '["Gegrilde kip", "Sorbet", "Oesters", "Chocolade"]', 0, 'Correct: Gegrilde kip'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 4, 'Fruitige rosé past goed bij:', '["Tapas", "Wildzwijn", "Stilton", "Truffel"]', 0, 'Correct: Tapas'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 5, 'Rosé is gastronomisch:', '["Beperkt", "Breed inzetbaar", "Alleen zomers", "Alleen aperitief"]', 1, 'Correct: Breed inzetbaar'),
  ('service-rose-wine', 'serveertemperatuur', 1, 'Te koud serveren zorgt voor:', '["Meer aroma", "Minder aroma", "Meer body", "Meer rijping"]', 1, 'Correct: Minder aroma'),
  ('service-rose-wine', 'serveertemperatuur', 2, 'Lichte rosé serveer je meestal op:', '["8–10°C", "14–16°C", "18–20°C", "5°C"]', 0, 'Correct: 8–10°C'),
  ('service-rose-wine', 'serveertemperatuur', 3, 'Bandol serveer je vaak op:', '["6°C", "11–13°C", "3°C", "18°C"]', 1, 'Correct: 11–13°C'),
  ('service-rose-wine', 'serveertemperatuur', 4, 'Te warm geeft vaak:', '["Minder alcohol", "Meer frisheid", "Meer alcoholgevoel", "Meer zuur"]', 2, 'Correct: Meer alcoholgevoel'),
  ('service-rose-wine', 'serveertemperatuur', 5, 'Volle rosé drink je:', '["Kouder", "Warmer", "Altijd ijskoud", "Alleen gekoeld"]', 1, 'Correct: Warmer'),
  ('service-rose-wine', 'glaswerk', 1, 'Waarom is glaswerk belangrijk?', '["Voor kleur", "Voor geur en smaak", "Voor prijs", "Voor alcohol"]', 1, 'Correct: Voor geur en smaak'),
  ('service-rose-wine', 'glaswerk', 2, 'Lichte rosé drink je vaak uit:', '["Klein witwijnglas", "Groot roodwijnglas", "Champagneflûte", "Portglas"]', 0, 'Correct: Klein witwijnglas'),
  ('service-rose-wine', 'glaswerk', 3, 'Volle rosé werkt beter in:', '["Groter witwijnglas", "Klein shotglas", "Bierglas", "Portglas"]', 0, 'Correct: Groter witwijnglas'),
  ('service-rose-wine', 'glaswerk', 4, 'Wat doet een groter glas?', '["Minder aroma", "Meer aromatische opening", "Minder textuur", "Minder zuur"]', 1, 'Correct: Meer aromatische opening'),
  ('service-rose-wine', 'glaswerk', 5, 'Voor serieuze rosé gebruiken sommeliers soms:', '["Bourgogne-witwijnglas", "Bierpul", "Flûte", "Shotglas"]', 0, 'Correct: Bourgogne-witwijnglas'),
  ('service-rose-wine', 'bewaren', 1, 'Hoe drink je de meeste rosés?', '["Jong", "Na 15 jaar", "Na oxidatie", "Na houtrijping"]', 0, 'Correct: Jong'),
  ('service-rose-wine', 'bewaren', 2, 'Wat schaadt rosé het meest?', '["Licht", "Kurk", "Etiket", "Flesvorm"]', 0, 'Correct: Licht'),
  ('service-rose-wine', 'bewaren', 3, 'Waar bewaar je rosé idealiter?', '["Warm", "Donker en koel", "In zonlicht", "Naast verwarming"]', 1, 'Correct: Donker en koel'),
  ('service-rose-wine', 'bewaren', 4, 'Wat verliest rosé relatief snel?', '["Frisheid", "Alcohol", "Zuren", "Suiker"]', 0, 'Correct: Frisheid'),
  ('service-rose-wine', 'bewaren', 5, 'Temperatuurschommelingen zijn:', '["Goed", "Slecht", "Onbelangrijk", "Noodzakelijk"]', 1, 'Correct: Slecht'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 1, 'Welke stijl heeft vaak rijpingspotentieel?', '["Bandol", "Provence basic", "Pinot Grigio", "Cava"]', 0, 'Correct: Bandol'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 2, 'Te koud serveren zorgt voor:', '["Meer geur", "Minder geur", "Meer rijping", "Meer body"]', 1, 'Correct: Minder geur'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 3, 'Licht beschadigt:', '["Kwaliteit", "Zuren", "Alcohol", "Tannines"]', 0, 'Correct: Kwaliteit'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 4, 'Het beste glas voor lichte rosé is vaak:', '["Klein witwijnglas", "Groot roodwijnglas", "Champagneflûte", "Portglas"]', 0, 'Correct: Klein witwijnglas'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 5, 'De meeste rosés drink je:', '["Jong", "Na 15 jaar", "Na oxidatie", "Alleen na houtrijping"]', 0, 'Correct: Jong'),
  ('pairing-rose-wine', 'rose-en-salades', 1, 'Wat maakt salade lastig?', '["Alcohol", "Dressingzuur", "Suiker", "Temperatuur"]', 1, 'Correct: Dressingzuur'),
  ('pairing-rose-wine', 'rose-en-salades', 2, 'Welke stijl werkt goed?', '["Provence", "Vintage Port", "Amarone", "Sherry PX"]', 0, 'Correct: Provence'),
  ('pairing-rose-wine', 'rose-en-salades', 3, 'Wat helpt pairing?', '["Frisheid", "Hout", "Tannine", "Oxidatie"]', 0, 'Correct: Frisheid'),
  ('pairing-rose-wine', 'rose-en-salades', 4, 'Rosé ondersteunt door:', '["Lage zuren", "Balans", "Bitterheid", "Tannine"]', 1, 'Correct: Balans'),
  ('pairing-rose-wine', 'rose-en-salades', 5, 'Lichte gerechten vragen:', '["Zware wijn", "Lichtere wijn", "Zoete wijn", "Oude wijn"]', 1, 'Correct: Lichtere wijn'),
  ('pairing-rose-wine', 'rose-en-vis', 1, 'Waarom werkt rosé goed met vis?', '["Veel tannine", "Frisheid + structuur", "Oxidatie", "Houtrijping"]', 1, 'Correct: Frisheid + structuur'),
  ('pairing-rose-wine', 'rose-en-vis', 2, 'Welke vis is een topcombinatie?', '["Tonijn", "Haring met room", "Gerookte paling", "Wildzwijn"]', 0, 'Correct: Tonijn'),
  ('pairing-rose-wine', 'rose-en-vis', 3, 'Vettere vis vraagt:', '["Lichtere rosé", "Vollere rosé", "Zoetere rosé", "Warmere rosé"]', 1, 'Correct: Vollere rosé'),
  ('pairing-rose-wine', 'rose-en-vis', 4, 'Lichte rosé past goed bij:', '["Ceviche", "Stoofpot", "Wild", "Truffel"]', 0, 'Correct: Ceviche'),
  ('pairing-rose-wine', 'rose-en-vis', 5, 'Rosé combineert eigenschappen van:', '["Wit en rood", "Port en Sherry", "Bier en wijn", "Cider en wijn"]', 0, 'Correct: Wit en rood'),
  ('pairing-rose-wine', 'rose-en-barbecue', 1, 'Barbecue bevat vaak:', '["Alleen zuur", "Vet en rook", "Alleen zoet", "Geen kruiden"]', 1, 'Correct: Vet en rook'),
  ('pairing-rose-wine', 'rose-en-barbecue', 2, 'Waarom werkt rosé goed?', '["Door hoge tannines", "Door zuur en fruit", "Door oxidatie", "Door restsuiker"]', 1, 'Correct: Door zuur en fruit'),
  ('pairing-rose-wine', 'rose-en-barbecue', 3, 'Welke stijl past goed?', '["Bandol", "Pinot Grigio", "Riesling", "Sancerre"]', 0, 'Correct: Bandol'),
  ('pairing-rose-wine', 'rose-en-barbecue', 4, 'Welke pairing is logisch?', '["Gegrilde kip", "Citroensorbet", "Oesters", "Stilton"]', 0, 'Correct: Gegrilde kip'),
  ('pairing-rose-wine', 'rose-en-barbecue', 5, 'Rosé bij barbecue is vaak:', '["Zwakker dan rood", "Veelzijdiger dan rood", "Onmogelijk", "Alleen licht"]', 1, 'Correct: Veelzijdiger dan rood'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 1, 'Aziatische keuken bevat vaak:', '["Spice en umami", "Alleen zout", "Alleen vet", "Geen zuur"]', 0, 'Correct: Spice en umami'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 2, 'Rosé helpt door:', '["Fruit en frisheid", "Tannine", "Oxidatie", "Houtrijping"]', 0, 'Correct: Fruit en frisheid'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 3, 'Welke pairing is logisch?', '["Sushi", "Wildzwijn", "Stilton", "Port"]', 0, 'Correct: Sushi'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 4, 'Pittige gerechten vragen vaak:', '["Minder tannine", "Meer tannine", "Meer hout", "Minder fruit"]', 0, 'Correct: Minder tannine'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 5, 'Rosé is bij Aziatisch vaak:', '["Veiliger dan rood", "Moeilijker dan rood", "Slechter dan rood", "Te licht"]', 0, 'Correct: Veiliger dan rood'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 1, 'Charcuterie bevat vaak:', '["Vet en zout", "Alleen zuur", "Alleen suiker", "Geen umami"]', 0, 'Correct: Vet en zout'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 2, 'Rosé helpt door:', '["Frisheid", "Oxidatie", "Hoge tannine", "Zoetheid"]', 0, 'Correct: Frisheid'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 3, 'Welke pairing is logisch?', '["Prosciutto", "Sorbet", "Chocolade", "Espresso"]', 0, 'Correct: Prosciutto'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 4, 'Waarom werkt rosé goed?', '["Vet + zuur balans", "Meer alcohol", "Minder fruit", "Meer tannine"]', 0, 'Correct: Vet + zuur balans'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 5, 'Rosé is bij charcuterie vaak:', '["Zwakker dan rood", "Sterker inzetbaar dan zware rood", "Onlogisch", "Te fris"]', 1, 'Correct: Sterker inzetbaar dan zware rood'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 1, 'Welke stijl werkt goed bij barbecue?', '["Bandol", "Pinot Grigio", "Riesling", "Sauternes"]', 0, 'Correct: Bandol'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 2, 'Welke pairing is klassiek?', '["Rosé + tonijn", "Rosé + blue cheese", "Rosé + PX", "Rosé + espresso"]', 0, 'Correct: Rosé + tonijn'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 3, 'Waarom werkt rosé met Aziatisch?', '["Tannine", "Fruit + frisheid", "Oxidatie", "Houtrijping"]', 1, 'Correct: Fruit + frisheid'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 4, 'Wat vraagt charcuterie?', '["Zuur en fruit", "Alleen tannine", "Zoet", "Oxidatie"]', 0, 'Correct: Zuur en fruit'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 5, 'Rosé in fine dining is:', '["Onlogisch", "Serieus inzetbaar", "Alleen zomer", "Alleen aperitief"]', 1, 'Correct: Serieus inzetbaar'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 1, 'Welke stijl is meestal bleker?', '["Tavel", "Provence", "Bandol", "Rosado"]', 1, 'Correct: Provence'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 2, 'Welke stijl heeft meer body?', '["Provence", "Tavel", "Chiaretto", "Cinsault"]', 1, 'Correct: Tavel'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 3, 'Welke stijl is kruidiger?', '["Tavel", "Provence", "Navarra", "Chiaretto"]', 0, 'Correct: Tavel'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 4, 'Wat analyseer je eerst?', '["Kleur", "Alcohol", "Leeftijd", "Kurk"]', 0, 'Correct: Kleur'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 5, 'Welke stijl is gastronomischer?', '["Provence", "Tavel", "Basic rosé", "Zoete rosé"]', 1, 'Correct: Tavel'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 1, 'Wat is vaak het grootste verschil tussen rosé en lichte rode wijn?', '["Suiker", "Tannine", "Alcohol", "Flesvorm"]', 1, 'Correct: Tannine'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 2, 'Rosé heeft meestal:', '["Meer tannine", "Minder tannine", "Meer hout", "Meer oxidatie"]', 1, 'Correct: Minder tannine'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 3, 'Lichte rode wijn heeft vaak:', '["Meer grip", "Minder extractie", "Minder kleur", "Minder structuur"]', 0, 'Correct: Meer grip'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 4, 'Wat helpt het meest bij blind herkennen?', '["Textuur", "Etiket", "Prijs", "Flesgewicht"]', 0, 'Correct: Textuur'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 5, 'Koude lichte rode wijn wordt soms verward met:', '["Port", "Krachtige rosé", "Mousserend", "Dessertwijn"]', 1, 'Correct: Krachtige rosé')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
