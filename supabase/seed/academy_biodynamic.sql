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
    'Na deze les kun jij uitleggen wat biodynamisch proeven is en waarom timing volgens biodynamische principes invloed kan hebben op smaakbeleving.
',
    'Biodynamisch proeven is het idee dat de smaakbeleving van wijn en andere dranken niet altijd hetzelfde is.

Volgens deze visie verandert expressie onder invloed van:

- maanstanden
- planetaire ritmes
- dagtypes
- atmosferische omstandigheden

Een wijn kan op de ene dag gesloten zijn.

En op een andere dag volledig open.

Dit principe wordt al jaren gebruikt door:

- wijnmakers
- sommeliers
- proevers
- verzamelaars

Biodynamisch proeven draait niet om magie.

Het draait om observatie.

En patroonherkenning.
',
    '- biodynamic
- timing
- observation
- rhythm
- tasting
',
    'Veel toonaangevende wijndomeinen plannen hun proefmomenten op Vruchtdagen.
',
    '- Smaakbeleving is niet altijd constant
- Biodynamische ritmes kunnen invloed hebben
- Timing kan proefkwaliteit verbeteren
- Observatie is de kern
',
    '### Opdracht

Open een fles wijn en noteer hoe hij smaakt.

### Checklist

- Ik heb de datum genoteerd
- Ik heb de smaak genoteerd
- Ik weet welk dagtype het is

### Reflectievraag

Denk je dat dezelfde wijn morgen anders smaakt?


---

### Reflectievraag

Denk je dat dezelfde wijn morgen anders smaakt?
',
    8,
    1
  ),
  (
    'maria-thun-oorsprong',
    'Maria Thun en de oorsprong',
    'Na deze les begrijp jij wie Maria Thun was en waarom haar werk zo belangrijk is.
',
    'Maria Thun was een Duitse onderzoekster.

Zij onderzocht jarenlang de invloed van kosmische ritmes op landbouw.

Haar bekendste werk:

de biodynamische kalender.

Zij koppelde maanstanden aan:

- wortel
- blad
- bloem
- vrucht

Haar observaties worden wereldwijd gebruikt.

Vooral in biodynamische wijnbouw.
',
    '- maria thun
- calendar
- lunar cycles
- biodynamics
- agriculture
',
    'De Maria Thun kalender verschijnt nog steeds jaarlijks.
',
    '- Maria Thun legde de basis
- Haar kalender wordt wereldwijd gebruikt
- Zij koppelde ritmes aan plantdelen
',
    '### Opdracht

Bekijk een biodynamische kalender.

### Checklist

- Ik heb de vier dagtypes gezien
- Ik begrijp de structuur
- Ik herken de symboliek

### Reflectievraag

Waarom zou landbouw hiermee werken?


---

### Reflectievraag

Waarom zou landbouw hiermee werken?
',
    8,
    2
  ),
  (
    'vier-dagtypen',
    'De vier dagtypen',
    'Na deze les kun jij de vier biodynamische dagtypen benoemen en herkennen.
',
    'De biodynamische kalender kent vier hoofdtypen:

**Worteldag**  
Focus op structuur en aarde.

**Bladdag**  
Focus op frisheid en vegetale tonen.

**Bloemdag**  
Focus op aroma en finesse.

**Vruchtdag**  
Focus op fruitexpressie en openheid.

Veel proevers ervaren op Vruchtdagen meer expressie.

Worteldagen worden vaak als strakker ervaren.
',
    '- root day
- leaf day
- flower day
- fruit day
- energy
',
    'Vruchtdagen zijn vaak favoriet voor belangrijke proefmomenten.
',
    '- Er zijn vier dagtypen
- Elk dagtype heeft een eigen energie
- Ze beïnvloeden proefervaring anders
',
    '### Opdracht

Zoek het huidige dagtype op.

### Checklist

- Ik weet welk type vandaag actief is
- Ik begrijp wat dat betekent
- Ik noteer mijn ervaring

### Reflectievraag

Welk type lijkt jou het meest interessant?


---

### Reflectievraag

Welk type lijkt jou het meest interessant?
',
    8,
    3
  ),
  (
    'elementen-biodynamiek',
    'Aarde, water, lucht en vuur',
    'Na deze les begrijp jij hoe de vier elementen gekoppeld zijn aan de dagtypen.
',
    'Elk dagtype is gekoppeld aan een element:

- Aarde = Wortel
- Water = Blad
- Lucht = Bloem
- Vuur = Vrucht

Deze elementen geven karakter aan de energie van de dag.

Vuur wordt vaak gezien als expressief.

Aarde als stabiel.

Water als gevoelig.

Lucht als verfijnd.

Deze logica helpt bij interpretatie.
',
    '- earth
- water
- air
- fire
- elements
',
    'Veel biodynamische wijnmakers werken actief met deze elementen.
',
    '- Elk dagtype heeft een element
- Elementen geven extra betekenis
- Ze helpen interpretatie verdiepen
',
    '### Opdracht

Koppel elk dagtype aan het juiste element.

### Checklist

- Alle vier gekoppeld
- Betekenis begrepen
- Praktisch toepasbaar

### Reflectievraag

Welk element past bij jouw smaak?


---

### Reflectievraag

Welk element past bij jouw smaak?
',
    8,
    4
  ),
  (
    'waarom-gebruiken-professionals-dit',
    'Waarom gebruiken sommeliers en wijnmakers dit?',
    'Na deze les begrijp jij waarom professionals biodynamische timing serieus nemen.
',
    'Sommeliers willen het beste moment kiezen.

Voor:

- openen
- decanteren
- proeven
- serveren

Wijnmakers gebruiken het voor:

- bottelen
- proeven
- blends beoordelen

Het doel is simpel:

maximale expressie.

Niet elke dag is ideaal.

Timing kan kwaliteit verhogen.

Voor verzamelaars betekent dit:

betere drinkmomenten.
',
    '- sommelier
- winemaker
- timing
- expression
- strategy',
    'Sommige grote proefpanels plannen uitsluitend op Vruchtdagen.
',
    '- Professionals gebruiken timing strategisch
- Het doel is optimale expressie
- Timing kan kwaliteit verhogen
',
    '### Opdracht

Plan jouw volgende fles bewust op een Vruchtdag.

### Checklist

- Dag gekozen
- Fles gekozen
- Verwachting genoteerd

### Reflectievraag

Denk je dat je verschil zult merken?


---

### Reflectievraag

Denk je dat je verschil zult merken?
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
    'Na deze les begrijp jij wat een Worteldag is en hoe dit invloed kan hebben op proefervaring.
',
    'Worteldagen zijn gekoppeld aan het element aarde.

Ze worden vaak geassocieerd met:

- structuur
- mineraliteit
- strengheid
- aardse tonen

Veel proevers ervaren wijn op Worteldagen als:

- gesloten
- strakker
- minder fruitig

Niet slechter.

Maar anders.

Worteldagen kunnen juist heel interessant zijn voor:

- terroiranalyse
- structuurstudie
- blindproeven
',
    '- root day
- structure
- earth
- minerality
- tension
',
    'Sommige Bourgognes tonen juist extra mineraliteit op Worteldagen.
',
    '- Worteldagen zijn aardegericht
- Structuur staat centraal
- Fruit is vaak minder dominant
',
    '### Opdracht

Proef een wijn op een Worteldag.

### Checklist

- Ik noteer structuur
- Ik noteer fruitintensiteit
- Ik noteer spanning

### Reflectievraag

Voelt de wijn strakker dan normaal?


---

### Reflectievraag

Voelt de wijn strakker dan normaal?
',
    8,
    1
  ),
  (
    'bladdagen-uitgelegd',
    'Bladdagen uitgelegd',
    'Na deze les begrijp jij wat Bladdagen zijn en waarom deze vaak minder ideaal zijn voor topwijnen.
',
    'Bladdagen zijn gekoppeld aan water.

Ze benadrukken vaak:

- vegetale tonen
- frisheid
- groene aroma’s
- zachtere zuren

Veel proevers ervaren minder focus.

Soms zelfs vlakheid.

Bij sommige wijnen kunnen Bladdagen juist werken.

Vooral:

- frisse witte wijnen
- jonge Sauvignon Blanc
- lichte 0.0 alternatieven
',
    '- leaf day
- freshness
- green notes
- water
- softness
',
    'Bladdagen worden vaak minder gekozen voor belangrijke proeverijen.
',
    '- Waterdag
- Vegetale expressie
- Minder focus op fruit
',
    '### Opdracht

Proef een frisse witte wijn op Bladdag.

### Checklist

- Ik noteer frisheid
- Ik noteer vegetale tonen
- Ik noteer balans

### Reflectievraag

Voelt de wijn lichter?


---

### Reflectievraag

Voelt de wijn lichter?
',
    8,
    2
  ),
  (
    'bloemdagen-uitgelegd',
    'Bloemdagen uitgelegd',
    'Na deze les begrijp jij waarom Bloemdagen interessant zijn voor aromatische wijnen.
',
    'Bloemdagen zijn gekoppeld aan lucht.

Ze benadrukken:

- aroma
- finesse
- elegantie
- florale tonen

Veel aromatische druiven profiteren hiervan.

Bijvoorbeeld:

- Riesling
- Muscat
- Gewürztraminer

Bloemdagen zijn subtieler dan Vruchtdagen.

Maar vaak verfijnder.
',
    '- flower day
- aroma
- finesse
- elegance
- air
',
    'Champagneproevers kiezen vaak Bloemdagen voor finesse-analyse.
',
    '- Lucht = Bloem
- Aroma en finesse centraal
- Subtiele expressie
',
    '### Opdracht

Proef een aromatische wijn.

### Checklist

- Ik noteer geur
- Ik noteer elegantie
- Ik noteer florale tonen

### Reflectievraag

Is de geur expressiever?


---

### Reflectievraag

Is de geur expressiever?
',
    8,
    3
  ),
  (
    'vruchtdagen-uitgelegd',
    'Vruchtdagen uitgelegd',
    'Na deze les begrijp jij waarom Vruchtdagen als beste proefdagen worden gezien.
',
    'Vruchtdagen zijn gekoppeld aan vuur.

Dit zijn vaak de meest expressieve dagen.

Kenmerken:

- open fruit
- energie
- lengte
- balans
- intensiteit

Veel professionals plannen belangrijke proefmomenten op Vruchtdagen.

Ook openen veel verzamelaars topflessen op deze dagen.
',
    '- fruit day
- fire
- expression
- energy
- balance
',
    'Veel Grand Cru proeverijen worden bewust op Vruchtdagen gepland.
',
    '- Vruchtdagen zijn vaak het meest expressief
- Fruit en energie staan centraal
- Populair bij professionals
',
    '### Opdracht

Plan een fles op Vruchtdag.

### Checklist

- Dag gekozen
- Fles gekozen
- Verwachting genoteerd

### Reflectievraag

Waarom voelt dit logisch?


---

### Reflectievraag

Waarom voelt dit logisch?
',
    8,
    4
  ),
  (
    'hoe-lees-je-de-kalender',
    'Hoe lees je de biodynamische kalender?',
    'Na deze les kun jij zelfstandig een biodynamische kalender lezen.
',
    'Een biodynamische kalender toont:

- dagtype
- begin- en eindtijd
- maanknoopdagen
- perigee
- apogee

Belangrijk:

Niet elke dag is volledig één type.

Soms wisselt dit midden op de dag.

Ook zijn er “kritische momenten”:

- nodes
- eclipsinvloeden
- overgangen

Voor optimaal proeven:

kies stabiele blokken.
',
    '- calendar
- node
- perigee
- apogee
- timing',
    'Veel apps combineren dit nu met weerdata en luchtdruk.
',
    '- Kalenders zijn dynamisch
- Tijdsblokken zijn belangrijk
- Niet elke dag is volledig gelijk
',
    '### Opdracht

Lees de kalender van vandaag.

### Checklist

- Ik herken het dagtype
- Ik herken het tijdsblok
- Ik herken eventuele nodes

### Reflectievraag

Wanneer zou jij vandaag openen?


---

### Reflectievraag

Wanneer zou jij vandaag openen?
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
    'Na deze les kun jij herkennen hoe wijn zich op een Worteldag vaak gedraagt.
',
    'Op Worteldagen verschuift de focus vaak naar:

- structuur
- tannine
- zuren
- mineraliteit

Fruit lijkt vaak minder open.

Sommige wijnen voelen:

- strakker
- harder
- minder charmant

Maar dit kan juist waardevol zijn.

Vooral om:

- bewaarpotentieel
- terroir
- structuur

beter te beoordelen.
',
    '- structure
- tannin
- acidity
- minerality
- root day
',
    'Veel Bordeaux-wijnen tonen op Worteldagen hun ruggengraat duidelijker.
',
    '- Worteldagen versterken structuur
- Fruit kan gesloten zijn
- Interessant voor analyse
',
    '### Opdracht

Proef een rode wijn op Worteldag.

### Checklist

- Ik noteer tannine
- Ik noteer zuur
- Ik noteer mineraliteit

### Reflectievraag

Voelt de wijn strenger?


---

### Reflectievraag

Voelt de wijn strenger?
',
    8,
    1
  ),
  (
    'wijn-op-bladdag',
    'Wijn op een Bladdag',
    'Na deze les begrijp jij hoe Bladdagen invloed kunnen hebben op frisheid en vegetale tonen.
',
    'Bladdagen leggen vaak nadruk op:

- groenheid
- vegetale tonen
- frisheid
- sapgevoel

Bij sommige wijnen kan dit prettig zijn.

Bij andere minder.

Vooral wijnen met al veel kruidigheid kunnen:

- hoekiger
- minder gebalanceerd

aanvoelen.
',
    '- leaf day
- green notes
- freshness
- vegetal
- balance
',
    'Sauvignon Blanc kan op Bladdagen soms extra groen overkomen.
',
    '- Bladdagen versterken vegetale tonen
- Niet altijd ideaal
- Kan stijlgevoel veranderen
',
    '### Opdracht

Proef een frisse witte wijn.

### Checklist

- Ik noteer groenheid
- Ik noteer zuren
- Ik noteer balans

### Reflectievraag

Voelt de wijn groener?


---

### Reflectievraag

Voelt de wijn groener?
',
    8,
    2
  ),
  (
    'wijn-op-bloemdag',
    'Wijn op een Bloemdag',
    'Na deze les herken jij hoe aromatische finesse op Bloemdagen kan toenemen.
',
    'Bloemdagen geven vaak:

- meer geur
- meer verfijning
- zachtere elegantie

Dit werkt goed bij:

- Riesling
- Champagne
- Pinot Noir
- Muscat

De wijn voelt soms luchtiger.

Minder kracht.

Meer finesse.
',
    '- flower day
- aroma
- elegance
- finesse
- perfume
',
    'Veel Champagnehuizen proeven blends graag op Bloemdagen.
',
    '- Bloemdagen versterken geur
- Elegantie komt naar voren
- Goede dag voor finesse-analyse
',
    '### Opdracht

Proef een aromatische wijn.

### Checklist

- Ik noteer geurintensiteit
- Ik noteer finesse
- Ik noteer elegantie

### Reflectievraag

Is de geur opener?


---

### Reflectievraag

Is de geur opener?
',
    8,
    3
  ),
  (
    'wijn-op-vruchtdag',
    'Wijn op een Vruchtdag',
    'Na deze les herken jij maximale expressie op Vruchtdagen.
',
    'Vruchtdagen worden vaak gezien als de ideale proefdagen.

Typische kenmerken:

- open fruit
- lengte
- energie
- balans
- complexiteit

Wijnen voelen vaak:

- toegankelijker
- expressiever
- harmonieuzer

Dit is vaak het beste moment voor:

- topflessen
- belangrijke diners
- beoordelingen
',
    '- fruit day
- expression
- harmony
- energy
- openness
',
    'Veel verzamelaars plannen grote Bordeaux of Bourgogne uitsluitend op Vruchtdagen.
',
    '- Vruchtdagen geven maximale expressie
- Fruit en balans komen samen
- Ideaal voor topmomenten
',
    '### Opdracht

Open een topfles op Vruchtdag.

### Checklist

- Ik noteer fruit
- Ik noteer balans
- Ik noteer lengte

### Reflectievraag

Is de wijn opener dan verwacht?


---

### Reflectievraag

Is de wijn opener dan verwacht?
',
    8,
    4
  ),
  (
    'eerste-proefexperiment',
    'Eerste proefexperiment',
    'Na deze les kun jij jouw eerste biodynamische vergelijkproef zelfstandig uitvoeren.
',
    'Nu combineer je alles.

Kies één wijn.

Proef deze op meerdere dagtypes.

Observeer:

- geur
- smaak
- structuur
- lengte
- balans

Belangrijk:

Niet zoeken naar "goed" of "fout".

Maar naar verschillen.

Dat is de basis van biodynamisch leren.
',
    '- comparative tasting
- observation
- pattern recognition
- tasting memory
- experiment',
    '',
    '- Vergelijken is de sleutel
- Patronen ontstaan door herhaling
- Biodynamiek draait om observatie
',
    '### Opdracht

Plan één fles over 4 verschillende dagtypes.

### Checklist

- Zelfde fles
- Zelfde glas
- Zelfde temperatuur
- Verschillen genoteerd

### Reflectievraag

Welk dagtype gaf de mooiste ervaring?


---

### Reflectievraag

Welk dagtype gaf de mooiste ervaring?
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
    'Na deze les begrijp jij hoe omgevingstemperatuur invloed heeft op smaakwaarneming.
',
    'Temperatuur beïnvloedt hoe wij proeven.

Niet alleen de wijn.

Maar ook ons lichaam.

Warme dagen versterken vaak:

- alcoholgevoel
- rijp fruit
- zoetheid

Koude dagen versterken vaak:

- zuren
- spanning
- structuur

Daardoor kan dezelfde wijn heel anders overkomen.

Zowel in glas als perceptie.
',
    '- temperature
- perception
- sweetness
- acidity
- balance
',
    'Een rode wijn op een warme zomerdag kan sneller log aanvoelen.
',
    '- Temperatuur beïnvloedt smaakperceptie
- Warm = meer rijpheid
- Koud = meer spanning
',
    '### Opdracht

Proef dezelfde wijn op een warme en koelere dag.

### Checklist

- Ik noteer fruit
- Ik noteer alcoholgevoel
- Ik noteer balans

### Reflectievraag

Welke temperatuur gaf betere balans?


---

### Reflectievraag

Welke temperatuur gaf betere balans?
',
    8,
    1
  ),
  (
    'luchtdruk-en-expressie',
    'Luchtdruk en expressie',
    'Na deze les begrijp jij hoe luchtdruk mogelijk invloed heeft op aromatische expressie.
',
    'Luchtdruk is één van de meest besproken factoren.

Veel proevers ervaren:

Hoge luchtdruk:

- meer stabiliteit
- meer helderheid
- meer focus

Lage luchtdruk:

- diffusie
- geslotenheid
- minder precisie

Vooral rond weerswisselingen wordt dit vaak opgemerkt.

Dit is geen absolute wetenschap.

Maar wel veel geobserveerd.
',
    '- air pressure
- stability
- focus
- expression
- weather systems
',
    'Veel sommeliers vermijden grote proeverijen bij zware lage druksystemen.
',
    '- Hoge druk geeft vaak helderheid
- Lage druk kan geslotenheid geven
- Weersystemen spelen mee
',
    '### Opdracht

Vergelijk een proefmoment bij hoge en lage druk.

### Checklist

- Ik noteer luchtdruk
- Ik noteer geur
- Ik noteer openheid

### Reflectievraag

Voelde één moment opener?


---

### Reflectievraag

Voelde één moment opener?
',
    8,
    2
  ),
  (
    'luchtvochtigheid-en-perceptie',
    'Luchtvochtigheid en perceptie',
    'Na deze les begrijp jij hoe luchtvochtigheid invloed kan hebben op geur en mondgevoel.
',
    'Vochtigheid beïnvloedt hoe aroma’s bewegen.

Hoge luchtvochtigheid kan:

- aroma dempen
- frisheid verzachten
- mondgevoel ronder maken

Lage luchtvochtigheid kan:

- spanning verhogen
- aroma scherper maken
- droger laten voelen

Vooral subtiele wijnen reageren hierop.
',
    '- humidity
- aroma
- softness
- dryness
- texture
',
    'Champagne kan op droge lucht vaak strakker aanvoelen.
',
    '- Vochtigheid beïnvloedt aroma
- Hoog = zachter
- Laag = strakker
',
    '### Opdracht

Noteer luchtvochtigheid tijdens je volgende proefmoment.

### Checklist

- Waarde genoteerd
- Aroma geanalyseerd
- Mondgevoel geanalyseerd

### Reflectievraag

Voelde de wijn ronder of strakker?


---

### Reflectievraag

Voelde de wijn ronder of strakker?
',
    8,
    3
  ),
  (
    'weersomslag-en-proeven',
    'Weersomslag en proefmomenten',
    'Na deze les begrijp jij waarom weersomslagen vaak instabiele proefmomenten geven.
',
    'Weersomslag betekent verandering.

Bijvoorbeeld:

- frontwissel
- stormopbouw
- drukval
- plotselinge temperatuurwissel

Veel proevers ervaren dan:

- onrust
- minder focus
- wisselende expressie

Dit zijn vaak minder ideale momenten voor topflessen.

Stabiliteit geeft meestal betrouwbaardere indrukken.
',
    '- weather front
- instability
- pressure drop
- storm
- timing
',
    'Veel verzamelaars vermijden openingsmomenten vlak voor onweer.
',
    '- Weersomslag geeft instabiliteit
- Minder voorspelbare proefervaring
- Stabiliteit is vaak beter
',
    '### Opdracht

Controleer het weer voor je volgende fles.

### Checklist

- Weersituatie bekeken
- Stabiliteit beoordeeld
- Moment gekozen

### Reflectievraag

Was de atmosfeer stabiel?


---

### Reflectievraag

Was de atmosfeer stabiel?
',
    8,
    4
  ),
  (
    'dynamic-vs-strategic-advice',
    'Dynamic vs Strategic Advice',
    'Na deze les begrijp jij het verschil tussen direct drinkadvies en langetermijn drinkstrategie.
',
    'Binnen Way of Tasting werken twee systemen:

**Dynamic Advice**

Gebaseerd op:

- huidige dagtype
- weer
- luchtdruk
- luchtvochtigheid

Dit geeft:

"Wat drink ik vandaag?"

**Strategic Advice**

Gebaseerd op:

- biodynamische kalender vooruit
- drinkvensters
- voorraadplanning

Dit geeft:

"Wanneer drink ik deze fles?"

Belangrijk:

Weerdata gaan meestal maximaal 14 dagen vooruit.

Daarna werkt alleen de biodynamische kalender.

Dit is exact hoe jouw systeem slim plant.
',
    '- dynamic advice
- strategic advice
- weather
- planning
- timing',
    'Strategisch plannen verhoogt vaak de kwaliteit van topfles-momenten.
',
    '- Dynamic = nu
- Strategic = later
- Weer = max 14 dagen
- Kalender = lange termijn
',
    '### Opdracht

Kies één fles voor vandaag en één voor later.

### Checklist

- Dynamic gekozen
- Strategic gekozen
- Verschil begrepen

### Reflectievraag

Welke methode gebruik jij het meest?


---

### Reflectievraag

Welke methode gebruik jij het meest?
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
    'Na deze les begrijp jij hoe rode wijn verschillend reageert op biodynamische dagtypes.
',
    'Rode wijn reageert vaak sterk op dagtypes.

Op:

**Vruchtdag**
- meer open fruit
- rondere tannine
- meer balans

**Worteldag**
- meer structuur
- strakkere tannine
- minder charme

**Bloemdag**
- meer geur
- meer elegantie

**Bladdag**
- soms groener
- minder focus

Voor grote rode wijnen is Vruchtdag vaak ideaal.
',
    '- red wine
- tannin
- fruit
- structure
- harmony
',
    'Veel Barolo- en Bordeauxproevers plannen hun topmomenten op Vruchtdagen.
',
    '- Rood reageert sterk
- Vruchtdagen zijn vaak optimaal
- Worteldagen tonen structuur
',
    '### Opdracht

Proef dezelfde rode wijn op twee verschillende dagtypes.

### Checklist

- Structuur vergeleken
- Fruit vergeleken
- Balans vergeleken

### Reflectievraag

Welk moment gaf meer harmonie?


---

### Reflectievraag

Welk moment gaf meer harmonie?
',
    8,
    1
  ),
  (
    'witte-wijn-per-dagtype',
    'Witte wijn per dagtype',
    'Na deze les begrijp jij hoe witte wijn reageert op biodynamische ritmes.
',
    'Witte wijn reageert vaak subtieler.

Op:

**Bloemdag**
- meer finesse
- meer geur

**Vruchtdag**
- meer fruit
- opener

**Bladdag**
- meer frisheid
- meer groenheid

**Worteldag**
- meer mineraliteit

Voor aromatische witte wijnen is Bloemdag vaak sterk.

Voor volle witte wijnen vaak Vruchtdag.
',
    '- white wine
- aromatics
- minerality
- freshness
- elegance
',
    'Riesling laat vaak grote verschillen zien tussen Bloem- en Vruchtdagen.
',
    '- Witte wijn reageert subtiel
- Bloem = aroma
- Vrucht = expressie
',
    '### Opdracht

Proef een witte wijn op Bloemdag.

### Checklist

- Geur genoteerd
- Frisheid genoteerd
- Structuur genoteerd

### Reflectievraag

Kwam aroma sterker naar voren?


---

### Reflectievraag

Kwam aroma sterker naar voren?
',
    8,
    2
  ),
  (
    'rose-per-dagtype',
    'Rosé per dagtype',
    'Na deze les begrijp jij hoe rosé het best tot zijn recht komt.
',
    'Rosé draait om:

- frisheid
- fruit
- lichtheid

Daarom zijn vooral:

**Vruchtdagen**
en
**Bloemdagen**

sterk.

Bladdagen kunnen rosé groener maken.

Worteldagen kunnen rosé soms te strak maken.

Rosé vraagt openheid.

Niet geslotenheid.
',
    '- rosé
- freshness
- fruit
- lightness
- openness
',
    'Provençaalse rosé wordt vaak als expressiever ervaren op Vruchtdagen.
',
    '- Rosé houdt van openheid
- Vrucht en bloem zijn vaak ideaal
- Wortel is vaak strakker
',
    '### Opdracht

Plan rosé op een warme Vruchtdag.

### Checklist

- Temperatuur genoteerd
- Dagtype genoteerd
- Balans genoteerd

### Reflectievraag

Kwam het fruit goed door?


---

### Reflectievraag

Kwam het fruit goed door?
',
    8,
    3
  ),
  (
    'mousserend-per-dagtype',
    'Mousserende wijn per dagtype',
    'Na deze les begrijp jij hoe mousserende wijn reageert op dagtypes.
',
    'Mousserend is zeer gevoelig.

Vooral op:

**Bloemdagen**
- finesse
- mousse
- aroma

en

**Vruchtdagen**
- openheid
- fruit
- spanning

Worteldagen tonen meer krijt en structuur.

Bladdagen kunnen mousse minder levendig laten voelen.

Champagne presteert vaak sterk op Bloemdag.
',
    '- sparkling
- mousse
- finesse
- aroma
- tension
',
    'Veel Champagnehuizen plannen blending-sessies bewust op Bloemdagen.
',
    '- Mousserend is gevoelig
- Bloem = finesse
- Vrucht = openheid
',
    '### Opdracht

Open een mousserende wijn op Bloemdag.

### Checklist

- Mousse beoordeeld
- Geur beoordeeld
- Lengte beoordeeld

### Reflectievraag

Was de wijn verfijnder?


---

### Reflectievraag

Was de wijn verfijnder?
',
    8,
    4
  ),
  (
    'port-per-dagtype',
    'Port per dagtype',
    'Na deze les begrijp jij hoe Port reageert op biodynamische dagtypes.
',
    'Port reageert anders dan stille wijn.

Door:

- hogere alcohol
- restsuiker
- oxidatieve invloeden

Vruchtdagen geven vaak:

- opener fruit
- zachtere alcohol
- meer harmonie

Worteldagen tonen:

- structuur
- alcohol
- scherpte

Tawny en Vintage kunnen sterk verschillen.

Voor Vintage Port is Vruchtdag vaak ideaal.
',
    '- port
- vintage port
- tawny
- alcohol
- harmony',
    'Oude Vintage Ports kunnen op Worteldagen opvallend gesloten zijn.
',
    '- Port reageert duidelijk
- Vrucht geeft harmonie
- Wortel toont structuur
',
    '### Opdracht

Open een Port op Vruchtdag.

### Checklist

- Fruit beoordeeld
- Alcohol beoordeeld
- Balans beoordeeld

### Reflectievraag

Voelde de Port zachter?


---

### Reflectievraag

Voelde de Port zachter?
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
    'Na deze les begrijp jij hoe bier verschillend kan overkomen op biodynamische dagtypes.
',
    'Bier reageert anders dan wijn.

Maar ook bier bevat:

- aroma
- bitterheid
- body
- frisheid

Op:

**Vruchtdag**
- fruitiger hop komt opener
- mout voelt ronder

**Bloemdag**
- aroma’s komen vaak eleganter

**Worteldag**
- bitterheid en body kunnen domineren

**Bladdag**
- vegetale hoptonen kunnen sterker lijken

Vooral craftbier reageert duidelijk.
',
    '- beer
- hops
- bitterness
- malt
- timing
',
    'IPA’s worden door veel proevers als expressiever ervaren op Vruchtdagen.
',
    '- Bier reageert ook op timing
- Hop en mout verschuiven in perceptie
- Vruchtdagen zijn vaak opener
',
    '### Opdracht

Proef hetzelfde bier op twee verschillende dagtypes.

### Checklist

- Bitterheid genoteerd
- Fruitigheid genoteerd
- Body genoteerd

### Reflectievraag

Welk moment gaf meer balans?


---

### Reflectievraag

Welk moment gaf meer balans?
',
    8,
    1
  ),
  (
    'bier-0-0-en-timing',
    'Bier 0.0 en timing',
    'Na deze les begrijp jij waarom alcoholvrije bieren soms nog gevoeliger reageren.
',
    '0.0 bier heeft minder alcoholstructuur.

Daardoor worden andere componenten zichtbaarder:

- zoetheid
- bitterheid
- mout
- frisheid

Vruchtdagen helpen vaak om:

- balans te verbeteren
- fruitigheid te openen

Worteldagen kunnen soms harder aanvoelen.

Voor lichte 0.0 blond of IPA is timing verrassend belangrijk.
',
    '- alcohol-free
- bitterness
- sweetness
- balance
- structure
',
    'Alcoholvrije IPA’s kunnen op Worteldagen opvallend bitterder lijken.
',
    '- 0.0 is gevoeliger
- Minder alcohol = meer focus op andere lagen
- Timing maakt verschil
',
    '### Opdracht

Vergelijk jouw favoriete 0.0 bier op twee dagen.

### Checklist

- Bitterheid genoteerd
- Zoetheid genoteerd
- Frisheid genoteerd

### Reflectievraag

Voelde het bier anders dan verwacht?


---

### Reflectievraag

Voelde het bier anders dan verwacht?
',
    8,
    2
  ),
  (
    'cocktails-en-dagtypes',
    'Cocktails en dagtypes',
    'Na deze les begrijp jij hoe cocktails biodynamisch kunnen verschillen.
',
    'Cocktails reageren vooral via hun componenten.

Bijvoorbeeld:

- citrus
- bitters
- kruiden
- base spirit

Vruchtdagen versterken vaak:

- fruit
- openheid
- drinkbaarheid

Bloemdagen versterken vaak:

- aroma
- botanicals
- finesse

Worteldagen kunnen bitters en alcohol dominanter maken.

Voor gin-cocktails zijn Bloemdagen vaak sterk.
',
    '- cocktail
- botanicals
- bitters
- citrus
- balance
',
    'Een Martini kan op Bloemdagen aromatisch opvallend verfijnder zijn.
',
    '- Cocktails reageren via ingrediënten
- Bloem en vrucht zijn vaak sterk
- Wortel versterkt bitter en structuur
',
    '### Opdracht

Drink dezelfde cocktail op twee verschillende dagtypes.

### Checklist

- Aroma genoteerd
- Bitterheid genoteerd
- Balans genoteerd

### Reflectievraag

Welk moment werkte beter?


---

### Reflectievraag

Welk moment werkte beter?
',
    8,
    3
  ),
  (
    'barrel-aged-dranken',
    'Barrel-aged dranken',
    'Na deze les begrijp jij hoe vatgerijpte dranken reageren op dagtypes.
',
    'Vatrijping brengt:

- hout
- oxidatie
- complexiteit
- diepte

Voorbeelden:

- whisky
- bourbon
- rum
- barrel-aged cocktails

Vruchtdagen geven vaak:

- rondheid
- openheid

Worteldagen:

- hout
- droogte
- structuur

Bloemdagen:

- subtiele aroma’s

Oudere vatdranken reageren vaak duidelijk.
',
    '- barrel-aged
- wood
- oxidation
- complexity
- maturity
',
    'Oude whisky’s worden door sommige verzamelaars bewust op Vruchtdagen geopend.
',
    '- Vatrijping versterkt complexiteit
- Vrucht opent
- Wortel structureert
',
    '### Opdracht

Proef een vatgerijpte drank bewust.

### Checklist

- Hout genoteerd
- Alcohol genoteerd
- Lengte genoteerd

### Reflectievraag

Voelde de drank rond of strak?


---

### Reflectievraag

Voelde de drank rond of strak?
',
    8,
    4
  ),
  (
    'alcoholvrij-en-proefmomenten',
    'Alcoholvrij en proefmomenten',
    'Na deze les begrijp jij hoe alcoholvrije dranken strategisch gekozen kunnen worden.
',
    'Alcoholvrij is vaak gevoeliger.

Waarom?

Omdat alcohol normaal:

- body geeft
- warmte geeft
- structuur geeft

Zonder alcohol vallen nuances sterker op.

Dat maakt timing belangrijk.

Vruchtdagen helpen vaak:

- fruit openen
- balans verbeteren

Bloemdagen helpen bij:

- aroma
- finesse

Vooral alcoholvrije wijn en bier profiteren hiervan.
',
    '- alcohol-free
- sensitivity
- fruit day
- flower day
- timing',
    'Alcoholvrije mousserende dranken reageren vaak opvallend sterk op Bloemdagen.
',
    '- Alcoholvrij is gevoeliger
- Timing wordt belangrijker
- Vrucht en bloem werken vaak het best
',
    '### Opdracht

Plan een alcoholvrij proefmoment op Vruchtdag.

### Checklist

- Drank gekozen
- Dagtype gekozen
- Resultaat genoteerd

### Reflectievraag

Was de balans beter?


---

### Reflectievraag

Was de balans beter?
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
    'Na deze les kun jij bepalen welke fles het best past bij welk moment.
',
    'Niet elke fles past bij elk moment.

Factoren:

- leeftijd
- stijl
- complexiteit
- drinkvenster
- dagtype

Jonge wijnen:

vaak flexibeler.

Oude wijnen:

vragen precisie.

Topflessen verdienen optimale omstandigheden.

Dat betekent:

- juiste dag
- stabiel weer
- goede voorbereiding

Timing verhoogt waarde.
',
    '- bottle selection
- timing
- maturity
- strategy
- precision
',
    'Veel verzamelaars wachten bewust weken op een ideale Vruchtdag.
',
    '- Elke fles heeft een ideaal moment
- Oudere wijnen vragen meer precisie
- Timing verhoogt kwaliteit
',
    '### Opdracht

Kies drie flessen en bepaal hun ideale moment.

### Checklist

- Leeftijd beoordeeld
- Stijl beoordeeld
- Dagtype gekozen

### Reflectievraag

Welke fles vraagt de meeste precisie?


---

### Reflectievraag

Welke fles vraagt de meeste precisie?
',
    8,
    1
  ),
  (
    'openen-of-wachten',
    'Wanneer openen en wanneer wachten?',
    'Na deze les kun jij inschatten wanneer wachten beter is dan openen.
',
    'Niet elke fles moet direct open.

Soms is wachten beter.

Bijvoorbeeld:

- slecht dagtype
- weersomslag
- onstabiele luchtdruk
- verkeerde gelegenheid

Wachten kan betekenen:

- meer openheid
- betere balans
- betere ervaring

Geduld is onderdeel van intelligent drinken.
',
    '- patience
- waiting
- stability
- better timing
- strategy
',
    'Een verschil van drie dagen kan soms een enorme impact geven.
',
    '- Wachten kan kwaliteit verhogen
- Timing is soms belangrijker dan verlangen
- Geduld is strategie
',
    '### Opdracht

Kies een fles die je wilde openen en plan bewust later.

### Checklist

- Nieuwe datum gekozen
- Dagtype gekozen
- Verwachting genoteerd

### Reflectievraag

Hoe voelt bewust wachten?


---

### Reflectievraag

Hoe voelt bewust wachten?
',
    8,
    2
  ),
  (
    'drinkvensters-en-dagtypes',
    'Drinkvensters en dagtypes',
    'Na deze les kun jij drinkvensters koppelen aan biodynamische planning.
',
    'Elke fles heeft een drinkvenster:

- te jong
- optimaal
- over de top

Binnen dat optimale venster kun je nóg slimmer plannen.

Bijvoorbeeld:

een top-Barolo in piekfase op Vruchtdag.

Of een Champagne op Bloemdag.

Zo combineer je:

- maturiteit
- dagtype
- atmosfeer

Dat is peak drinking.
',
    '- drinking window
- peak drinking
- maturity
- planning
- timing
',
    'Veel verzamelaars noteren niet alleen drinkvensters maar ook voorkeursdagtypes.
',
    '- Drinkvenster bepaalt fase
- Dagtype bepaalt moment
- Samen geven ze maximale kans op topkwaliteit
',
    '### Opdracht

Bekijk jouw voorraad en markeer 5 flessen in hun drinkvenster.

### Checklist

- Venster bepaald
- Dagtype gekoppeld
- Prioriteit gezet

### Reflectievraag

Welke fles is nu op zijn piek?


---

### Reflectievraag

Welke fles is nu op zijn piek?
',
    8,
    3
  ),
  (
    'slim-voorraadbeheer',
    'Slim voorraadbeheer met kalender',
    'Na deze les kun jij jouw voorraad vooruit plannen met biodynamische logica.
',
    'Slim voorraadbeheer betekent:

niet reactief.

Maar proactief.

Je plant:

- topflessen
- dagelijkse flessen
- pairings
- diners
- proefmomenten

Door vooruit te kijken kun je:

- piekmomenten benutten
- verkeerde openingen vermijden
- voorraad slimmer roteren

Dit maakt drinken strategischer.
',
    '- cellar management
- planning
- ready now
- rotation
- calendar logic
',
    'Veel verzamelaars bouwen een “ready now” lijst voor komende Vruchtdagen.
',
    '- Vooruit plannen geeft controle
- Kalender helpt voorraadbeheer
- Slim roteren verhoogt kwaliteit
',
    '### Opdracht

Maak een lijst van 10 flessen voor de komende 30 dagen.

### Checklist

- Flessen geselecteerd
- Dagtypes gekoppeld
- Prioriteit gegeven

### Reflectievraag

Voelt dit slimmer dan spontaan kiezen?


---

### Reflectievraag

Voelt dit slimmer dan spontaan kiezen?
',
    8,
    4
  ),
  (
    'strategic-opening-planning',
    'Strategic opening planning',
    'Na deze les kun jij volledige openingstrategieën bouwen voor jouw collectie.
',
    'Strategic opening planning combineert alles:

- biodynamische kalender
- weersvoorspelling (max 14 dagen)
- drinkvenster
- gelegenheid
- pairing
- persoonlijke voorkeur

Dit is de hoogste vorm van drinkintelligentie.

Niet:

"Wat heb ik zin in?"

Maar:

"Wat is nu het beste moment?"

Dat is precies waar jouw app naartoe werkt.
',
    '- strategic planning
- weather forecast
- calendar logic
- inventory
- drinking intelligence',
    'De beste verzamelaars plannen soms maanden vooruit.
',
    '- Alles komt hier samen
- Strategie verhoogt beleving
- Planning is drinkintelligentie
',
    '### Opdracht

Plan één topfles voor de komende maand.

### Checklist

- Dagtype gekozen
- Weer bekeken
- Gelegenheid bepaald
- Pairing gekozen

### Reflectievraag

Voelt dit als hoger niveau drinken?


---

### Reflectievraag

Voelt dit als hoger niveau drinken?
',
    10,
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
    'tasting-journal-gebruiken',
    'Tasting journal gebruiken',
    'Na deze les begrijp jij waarom een tasting journal essentieel is.
',
    'Zonder notities vervliegt ervaring.

Een tasting journal helpt je:

- smaak onthouden
- verschillen herkennen
- dagtypes vergelijken
- voorkeuren vastleggen

Belangrijk om te noteren:

- datum
- dagtype
- weer
- luchtdruk
- wijn
- pairing
- score

Data bouwen geheugen.

Geheugen bouwt inzicht.
',
    '- tasting journal
- notes
- data
- memory
- tracking
',
    'Topproevers bouwen hun expertise vaak op duizenden tasting notes.
',
    '- Noteren maakt leren sneller
- Data maakt patronen zichtbaar
- Journal = basis van groei
',
    '### Opdracht

Maak jouw eerste biodynamische tasting note.

### Checklist

- Datum genoteerd
- Dagtype genoteerd
- Smaak genoteerd
- Score gegeven

### Reflectievraag

Wat viel je het meest op?


---

### Reflectievraag

Wat viel je het meest op?
',
    8,
    1
  ),
  (
    'patronen-herkennen',
    'Patronen herkennen',
    'Na deze les kun jij terugkerende patronen herkennen in jouw proefdata.
',
    'Na meerdere tastings ontstaan patronen.

Bijvoorbeeld:

- betere scores op Vruchtdagen
- meer finesse op Bloemdagen
- minder balans bij lage druk

Dit zijn persoonlijke patronen.

Niet universeel.

Maar waardevol.

Patronen geven voorspelbaarheid.

En voorspelbaarheid geeft betere keuzes.
',
    '- patterns
- repetition
- comparison
- recognition
- personal logic
',
    'Veel ervaren proevers ontwikkelen onbewust sterke persoonlijke timingpatronen.
',
    '- Patronen ontstaan uit herhaling
- Niet alles is universeel
- Persoonlijke logica is waardevol
',
    '### Opdracht

Bekijk je laatste 5 tasting notes.

### Checklist

- Scores vergeleken
- Dagtypes vergeleken
- Omstandigheden vergeleken

### Reflectievraag

Zie je al een patroon?


---

### Reflectievraag

Zie je al een patroon?
',
    8,
    2
  ),
  (
    'eigen-smaakprofiel',
    'Je eigen smaakprofiel bouwen',
    'Na deze les kun jij jouw persoonlijke smaakprofiel opbouwen.
',
    'Iedereen proeft anders.

Jouw profiel bestaat uit:

- voorkeurstypes
- favoriete stijlen
- ideale dagtypes
- ideale omstandigheden

Misschien ontdek je:

- rood op Vruchtdagen
- Champagne op Bloemdagen
- Port alleen bij hoge luchtdruk

Dit wordt jouw persoonlijke drinklogica.
',
    '- taste profile
- preferences
- conditions
- identity
- style
',
    'Veel topverzamelaars kennen hun ideale openingscondities zeer precies.
',
    '- Jouw profiel is uniek
- Data bouwt voorkeuren
- Timing wordt persoonlijk
',
    '### Opdracht

Maak jouw top 5 favoriete proefomstandigheden.

### Checklist

- Dagtypes gekozen
- Dranktypes gekozen
- Omstandigheden gekozen

### Reflectievraag

Wat past het best bij jou?


---

### Reflectievraag

Wat past het best bij jou?
',
    8,
    3
  ),
  (
    'data-en-voorkeuren',
    'Data en persoonlijke voorkeuren',
    'Na deze les begrijp jij hoe data jouw keuzes slimmer maakt.
',
    'Data maakt intuïtie sterker.

Voorbeelden:

- gemiddeld hogere scores op Vruchtdagen
- lagere scores bij stormfronten
- betere pairings op koelere dagen

Dit verandert jouw keuzes.

Van gevoel.

Naar onderbouwde intuïtie.

Dit is waar technologie en proeven samenkomen.
',
    '- data
- scoring
- preferences
- patterns
- analytics
',
    'Veel professionele wijnapps bouwen nu persoonlijke recommendation engines.
',
    '- Data versterkt intuïtie
- Patronen maken keuzes slimmer
- Persoonlijke voorkeuren worden meetbaar
',
    '### Opdracht

Bekijk jouw hoogste en laagste scores.

### Checklist

- Scores bekeken
- Omstandigheden vergeleken
- Conclusie getrokken

### Reflectievraag

Wat valt op?


---

### Reflectievraag

Wat valt op?
',
    8,
    4
  ),
  (
    'persoonlijke-drinkintelligentie',
    'Jouw persoonlijke drinkintelligentie',
    'Na deze les kun jij al jouw kennis samenbrengen in één persoonlijke drinkstrategie.
',
    'Drinkintelligentie is de optelsom van:

- kennis
- ervaring
- timing
- observatie
- data
- gevoel

Dit is jouw persoonlijke systeem.

Niet alleen:

"Wat drink ik?"

Maar:

"Waarom nu?"

Dat is het hoogste niveau van bewust drinken.

Hier komt alles samen.

Dit is de kern van Way of Tasting.
',
    '- drink intelligence
- personal system
- observation
- timing
- data',
    'De beste proevers vertrouwen op gevoel én data tegelijk.
',
    '- Alles komt samen
- Timing wordt intuïtief
- Data maakt gevoel slimmer
- Jij bouwt je eigen systeem
',
    '### Opdracht

Schrijf jouw persoonlijke drinkfilosofie in 5 regels.

### Checklist

- Voorkeuren benoemd
- Timing benoemd
- Strategie benoemd

### Reflectievraag

Wat is voor jou het perfecte drinkmoment?


---

### Reflectievraag

Wat is voor jou het perfecte drinkmoment?
',
    10,
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
    'theorie-examen-biodynamisch',
    'Theorie-examen Biodynamisch Proeven',
    'Na dit examen kan jij aantonen dat je de theorie volledig beheerst.
',
    'Dit examen test:

- dagtypes
- elementen
- Maria Thun
- luchtdruk
- luchtvochtigheid
- weersinvloeden
- wijnstijlen
- bier
- cocktails
- voorraadplanning

Dit is jouw theoretische eindtoets.
',
    '- theory exam
- knowledge
- biodynamics
- timing
- structure
',
    '',
    '- Volledige theorietoets
- Alle modules komen terug
- Basis voor praktijkdeel
',
    '- 20 multiple choice vragen
- minimaal 80% goed
- herkansing mogelijk
',
    20,
    1
  ),
  (
    'praktijkproef-worteldag',
    'Praktijkproef op Worteldag',
    'Na deze praktijkproef kun jij structurele kenmerken analyseren op een Worteldag.
',
    '',
    '- root day
- structure
- tannin
- acidity
- minerality
',
    '',
    '',
    'Open één wijn op een Worteldag.

Analyseer:

- structuur
- tannine
- zuren
- mineraliteit
- openheid


---

### Checklist

- Dagtype bevestigd
- Weer genoteerd
- Luchtdruk genoteerd
- Proefnotities gemaakt
- Score gegeven


---

### Reflectievraag

Welke structurele elementen vielen het meest op?


---

### Beoordeling

De student moet aantonen:

- correcte observatie
- juiste terminologie
- duidelijke analyse
',
    20,
    2
  ),
  (
    'praktijkproef-vruchtdag',
    'Praktijkproef op Vruchtdag',
    'Na deze praktijkproef kun jij maximale expressie analyseren op een Vruchtdag.
',
    '',
    '- fruit day
- harmony
- expression
- balance
- openness
',
    '',
    '',
    'Open dezelfde wijn (of vergelijkbare fles) op een Vruchtdag.

Analyseer:

- fruit
- openheid
- balans
- lengte
- harmonie


---

### Checklist

- Dagtype bevestigd
- Weer genoteerd
- Proefnotities gemaakt
- Vergelijking voorbereid


---

### Reflectievraag

Welke verschillen merk je met de Worteldag?


---

### Beoordeling

De student moet aantonen:

- fruitanalyse
- balansherkenning
- expressiebeoordeling
',
    20,
    3
  ),
  (
    'vergelijking-en-analyse',
    'Vergelijking en analyse',
    'Na deze les kun jij verschillen objectief vergelijken en onderbouwen.
',
    'Vergelijk:

Worteldag vs Vruchtdag.

Analyseer:

- geur
- smaak
- structuur
- lengte
- balans
- voorkeur

Belangrijk:

Niet "beter".

Maar "anders".

Analyse is belangrijker dan oordeel.
',
    '- comparison
- analysis
- pattern
- tasting memory
- difference
',
    '',
    '',
    '### Vergelijkingsmatrix

| Onderdeel | Worteldag | Vruchtdag |
|---|---|---|
| Fruit |   |   |
| Structuur |   |   |
| Openheid |   |   |
| Balans |   |   |
| Lengte |   |   |


---

### Reflectievraag

Welke dag gaf jouw beste ervaring?


---

### Beoordeling

De student toont:

- objectieve vergelijking
- patroonherkenning
- persoonlijke analyse
',
    20,
    4
  ),
  (
    'eindassessment-biodynamic-intelligence',
    'Eindassessment Biodynamic Intelligence',
    'Na dit eindassessment kun jij jouw persoonlijke biodynamische drinkintelligentie formuleren.
',
    'Dit is jouw eindreflectie.

Je combineert:

- theorie
- praktijk
- observatie
- data
- voorkeuren

Beantwoord:

1. Welke dagtypes passen het best bij jou?
2. Welke drankcategorie reageert het sterkst?
3. Welke weersfactor beïnvloedt jou het meest?
4. Hoe ga jij dit toepassen in je eigen voorraad?
5. Wat is jouw persoonlijke openingsstrategie?

Dit is jouw persoonlijke biodynamische profiel.
',
    '- mastery
- personal intelligence
- strategy
- biodynamic profile
- final certification',
    '',
    '',
    'Schrijf jouw:

**Personal Biodynamic Drinking Manifest**

Minimaal:

- 10 observaties
- 5 conclusies
- 3 concrete openingsstrategieën


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
  ('voorraad-biodynamic', 'slim-voorraadbeheer', 1, 'Slim voorraadbeheer is:', '["Proactief", "Reactief", "Willekeurig", "Chaotisch"]', 0, 'Correct: Proactief'),
  ('voorraad-biodynamic', 'slim-voorraadbeheer', 2, 'Wat helpt plannen?', '["Kalender", "Etiket", "Kleur", "Kurk"]', 0, 'Correct: Kalender'),
  ('voorraad-biodynamic', 'slim-voorraadbeheer', 3, 'Wat kun je vermijden?', '["Verkeerde opening", "Goede pairing", "Goed glas", "Goed weer"]', 0, 'Correct: Verkeerde opening'),
  ('voorraad-biodynamic', 'slim-voorraadbeheer', 4, 'Wat verhoogt dit?', '["Controle", "Alcohol", "Leeftijd", "Koolzuur"]', 0, 'Correct: Controle'),
  ('voorraad-biodynamic', 'slim-voorraadbeheer', 5, 'Ready now betekent:', '["Klaar om te openen", "Nog te jong", "Over zijn piek", "Onbekend"]', 0, 'Correct: Klaar om te openen'),
  ('voorraad-biodynamic', 'strategic-opening-planning', 1, 'Strategic planning combineert:', '["Alles", "Alleen weer", "Alleen dagtype", "Alleen leeftijd"]', 0, 'Correct: Alles'),
  ('voorraad-biodynamic', 'strategic-opening-planning', 2, 'Weerdata gaan meestal vooruit:', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('voorraad-biodynamic', 'strategic-opening-planning', 3, 'Daarna gebruik je:', '["Kalenderlogica", "Alleen temperatuur", "Alleen prijs", "Alleen kleur"]', 0, 'Correct: Kalenderlogica'),
  ('voorraad-biodynamic', 'strategic-opening-planning', 4, 'Wat verhoogt planning?', '["Beleving", "Alcohol", "Leeftijd", "Schuim"]', 0, 'Correct: Beleving'),
  ('voorraad-biodynamic', 'strategic-opening-planning', 5, 'Dit is de hoogste vorm van:', '["Drinkintelligentie", "Marketing", "Productie", "Opslag"]', 0, 'Correct: Drinkintelligentie'),
  ('intelligence-biodynamic', 'tasting-journal-gebruiken', 1, 'Waarom noteren?', '["Patronen herkennen", "Alleen bewaren", "Alleen delen", "Alleen scoren"]', 0, 'Correct: Patronen herkennen'),
  ('intelligence-biodynamic', 'tasting-journal-gebruiken', 2, 'Wat noteer je?', '["Dagtype", "Alleen kleur", "Alleen prijs", "Alleen glas"]', 0, 'Correct: Dagtype'),
  ('intelligence-biodynamic', 'tasting-journal-gebruiken', 3, 'Wat bouwt data?', '["Inzicht", "Alcohol", "Leeftijd", "Zuur"]', 0, 'Correct: Inzicht'),
  ('intelligence-biodynamic', 'tasting-journal-gebruiken', 4, 'Wat helpt een journal?', '["Vergelijken", "Vergeten", "Sneller drinken", "Minder proeven"]', 0, 'Correct: Vergelijken'),
  ('intelligence-biodynamic', 'tasting-journal-gebruiken', 5, 'Wat groeit?', '["Geheugen", "Alcoholpercentage", "Druivenras", "Voorraad"]', 0, 'Correct: Geheugen'),
  ('intelligence-biodynamic', 'patronen-herkennen', 1, 'Wanneer ontstaan patronen?', '["Na herhaling", "Na één fles", "Nooit", "Alleen bij topwijn"]', 0, 'Correct: Na herhaling'),
  ('intelligence-biodynamic', 'patronen-herkennen', 2, 'Zijn patronen universeel?', '["Nee", "Ja", "Altijd", "Alleen bij experts"]', 0, 'Correct: Nee'),
  ('intelligence-biodynamic', 'patronen-herkennen', 3, 'Wat geven patronen?', '["Voorspelbaarheid", "Meer alcohol", "Meer suiker", "Minder geur"]', 0, 'Correct: Voorspelbaarheid'),
  ('intelligence-biodynamic', 'patronen-herkennen', 4, 'Wat helpt analyseren?', '["Vergelijken", "Willekeur", "Snelheid", "Prijs"]', 0, 'Correct: Vergelijken'),
  ('intelligence-biodynamic', 'patronen-herkennen', 5, 'Patronen zijn:', '["Persoonlijk", "Vast", "Altijd hetzelfde", "Wetenschappelijk bewezen"]', 0, 'Correct: Persoonlijk'),
  ('intelligence-biodynamic', 'eigen-smaakprofiel', 1, 'Is smaak persoonlijk?', '["Ja", "Nee", "Altijd gelijk", "Alleen bij experts"]', 0, 'Correct: Ja'),
  ('intelligence-biodynamic', 'eigen-smaakprofiel', 2, 'Wat bouw je?', '["Profiel", "Voorraad", "Alcohol", "Leeftijd"]', 0, 'Correct: Profiel'),
  ('intelligence-biodynamic', 'eigen-smaakprofiel', 3, 'Wat helpt hierbij?', '["Data", "Willekeur", "Snel drinken", "Alleen ervaring"]', 0, 'Correct: Data'),
  ('intelligence-biodynamic', 'eigen-smaakprofiel', 4, 'Wat kan onderdeel zijn?', '["Ideaal dagtype", "Alleen prijs", "Alleen glas", "Alleen kleur"]', 0, 'Correct: Ideaal dagtype'),
  ('intelligence-biodynamic', 'eigen-smaakprofiel', 5, 'Wat wordt hierdoor sterker?', '["Besluitvorming", "Alcohol", "Zuur", "Bitter"]', 0, 'Correct: Besluitvorming'),
  ('intelligence-biodynamic', 'data-en-voorkeuren', 1, 'Wat versterkt data?', '["Intuïtie", "Alcohol", "Leeftijd", "Zoetheid"]', 0, 'Correct: Intuïtie'),
  ('intelligence-biodynamic', 'data-en-voorkeuren', 2, 'Wat maakt data?', '["Meetbaar", "Onzichtbaar", "Willekeurig", "Emotioneel"]', 0, 'Correct: Meetbaar'),
  ('intelligence-biodynamic', 'data-en-voorkeuren', 3, 'Wat bouwt dit?', '["Slimmere keuzes", "Meer voorraad", "Meer suiker", "Meer alcohol"]', 0, 'Correct: Slimmere keuzes'),
  ('intelligence-biodynamic', 'data-en-voorkeuren', 4, 'Wat kun je analyseren?', '["Scores", "Alleen etiketten", "Alleen glazen", "Alleen prijzen"]', 0, 'Correct: Scores'),
  ('intelligence-biodynamic', 'data-en-voorkeuren', 5, 'Data helpt:', '["Beslissen", "Fermenteren", "Carboneren", "Filteren"]', 0, 'Correct: Beslissen'),
  ('intelligence-biodynamic', 'persoonlijke-drinkintelligentie', 1, 'Drinkintelligentie is:', '["Alles samen", "Alleen kennis", "Alleen data", "Alleen smaak"]', 0, 'Correct: Alles samen'),
  ('intelligence-biodynamic', 'persoonlijke-drinkintelligentie', 2, 'Wat maakt timing sterker?', '["Observatie", "Snelheid", "Leeftijd", "Prijs"]', 0, 'Correct: Observatie'),
  ('intelligence-biodynamic', 'persoonlijke-drinkintelligentie', 3, 'Wat bouw jij?', '["Eigen systeem", "Nieuwe wijn", "Nieuwe kalender", "Nieuwe druif"]', 0, 'Correct: Eigen systeem'),
  ('intelligence-biodynamic', 'persoonlijke-drinkintelligentie', 4, 'Wat helpt samen?', '["Gevoel en data", "Alleen gevoel", "Alleen weer", "Alleen kalender"]', 0, 'Correct: Gevoel en data'),
  ('intelligence-biodynamic', 'persoonlijke-drinkintelligentie', 5, 'Wat is de kern?', '["Waarom nu?", "Hoe duur?", "Hoe oud?", "Hoeveel alcohol?"]', 0, 'Correct: Waarom nu?'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 1, 'Wie ontwikkelde de biodynamische kalender?', '["Maria Thun", "Rudolf Steiner", "Louis Pasteur", "Dom Pérignon"]', 0, 'Correct: Maria Thun'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 2, 'Welke dag hoort bij vuur?', '["Vruchtdag", "Bladdag", "Bloemdag", "Worteldag"]', 0, 'Correct: Vruchtdag'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 3, 'Welke dag hoort bij aarde?', '["Worteldag", "Vruchtdag", "Bloemdag", "Bladdag"]', 0, 'Correct: Worteldag'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 4, 'Welke dag versterkt aroma?', '["Bloemdag", "Worteldag", "Bladdag", "Vruchtdag"]', 0, 'Correct: Bloemdag'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 5, 'Welke dag versterkt vegetale tonen?', '["Bladdag", "Bloemdag", "Worteldag", "Vruchtdag"]', 0, 'Correct: Bladdag'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 6, 'Wat doet hoge luchtdruk vaak?', '["Meer focus geven", "Minder balans", "Meer alcohol", "Meer suiker"]', 0, 'Correct: Meer focus geven'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 7, 'Wat doet lage luchtdruk soms?', '["Geslotenheid geven", "Meer fruit geven", "Meer mousse geven", "Meer suiker geven"]', 0, 'Correct: Geslotenheid geven'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 8, 'Wat beïnvloedt luchtvochtigheid?', '["Aroma en mondgevoel", "Leeftijd", "Alcoholpercentage", "Druivenras"]', 0, 'Correct: Aroma en mondgevoel'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 9, 'Welke dag is vaak ideaal voor Champagne?', '["Bloemdag", "Bladdag", "Worteldag", "Willekeurig"]', 0, 'Correct: Bloemdag'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 10, 'Welke dag is vaak ideaal voor Vintage Port?', '["Vruchtdag", "Bladdag", "Worteldag", "Bloemdag"]', 0, 'Correct: Vruchtdag'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 11, 'Wat betekent Dynamic Advice?', '["Drinkadvies voor nu", "Drinkadvies over 6 maanden", "Alleen voorraadbeheer", "Alleen weer"]', 0, 'Correct: Drinkadvies voor nu'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 12, 'Wat betekent Strategic Advice?', '["Lange termijn planning", "Alleen vandaag", "Alleen pairing", "Alleen weer"]', 0, 'Correct: Lange termijn planning'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 13, 'Hoe ver gaat weerdata meestal?', '["14 dagen", "30 dagen", "90 dagen", "365 dagen"]', 0, 'Correct: 14 dagen'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 14, 'Wat gebruik je daarna?', '["Biodynamische kalender", "Alleen temperatuur", "Alleen voorraad", "Alleen prijs"]', 0, 'Correct: Biodynamische kalender'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 15, 'Wat bouw je met tasting notes?', '["Patronen", "Alcohol", "Leeftijd", "Kleur"]', 0, 'Correct: Patronen'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 16, 'Wat helpt patronen herkennen?', '["Herhaling", "Willekeur", "Snelheid", "Leeftijd"]', 0, 'Correct: Herhaling'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 17, 'Wat bouw je met data?', '["Persoonlijk smaakprofiel", "Nieuwe wijn", "Nieuwe kalender", "Nieuwe druif"]', 0, 'Correct: Persoonlijk smaakprofiel'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 18, 'Wat is peak drinking?', '["Optimale combinatie van rijpheid en timing", "Jong drinken", "Te laat drinken", "Blind proeven"]', 0, 'Correct: Optimale combinatie van rijpheid en timing'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 19, 'Wat is de kern van drinkintelligentie?', '["Waarom nu?", "Hoe duur?", "Hoe oud?", "Hoeveel alcohol?"]', 0, 'Correct: Waarom nu?'),
  ('examen-biodynamic', 'theorie-examen-biodynamisch', 20, 'Wat is het hoogste doel van biodynamisch proeven?', '["Optimale timing en expressie", "Meer alcohol", "Meer suiker", "Sneller drinken"]', 0, 'Correct: Optimale timing en expressie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
