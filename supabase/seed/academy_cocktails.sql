-- Cocktails track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'cocktails';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'cocktails',
  'Cocktails',
  'Leer cocktails van Fundament tot Master: technieken, ingrediënten, klassiekers, service, pairing en examen.',
  9,
  now()
);

with t as (select id from academy.tracks where slug = 'cocktails')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-cocktails', 'Fundament', 1),
  ('explorer', 'technieken-cocktails', 'Technieken', 2),
  ('explorer', 'ingredienten-cocktails', 'Ingrediënten', 3),
  ('specialist', 'klassiek-cocktails', 'Klassieke cocktails', 4),
  ('specialist', 'sour-family-cocktails', 'Sour Family', 5),
  ('specialist', 'highballs-cocktails', 'Highballs & Longdrinks', 6),
  ('master', 'service-cocktails', 'Service', 7),
  ('master', 'pairing-cocktails', 'Pairing & Gastronomie', 8),
  ('master', 'examen-cocktails', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-cocktails (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'intro-cocktails'
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
    'wat-is-een-cocktail',
    'Wat is een cocktail?',
    'Na deze les kun jij uitleggen wat een cocktail is en uit welke basiselementen een cocktail bestaat.
',
    'Een cocktail is een gemixte drank waarbij meerdere ingrediënten samenkomen om balans, complexiteit en drinkplezier te creëren.

De meeste cocktails bestaan uit:

- een base spirit
- een zuur component
- een zoet component
- soms bitters of modifiers

De kunst van cocktails draait om balans.

Te veel zuur maakt een cocktail scherp.

Te veel suiker maakt hem log.

Te veel alcohol maakt hem hard.

Een goede cocktail voelt in balans.

Dat maakt cocktails uniek.
',
    '- cocktail
- balance
- spirit
- sour
- sweet
',
    'De officiële definitie van een cocktail werd al in 1806 gepubliceerd.
',
    '- Een cocktail is een gemixte drank
- Balans is essentieel
- Cocktails combineren meerdere smaken
- Structuur bepaalt stijl
- Iedere cocktail heeft een basisopbouw
',
    '### Opdracht

Bekijk de kaart van een cocktailbar.

### Checklist

- Ik heb 5 cocktails bekeken
- Ik heb ingrediënten herkend
- Ik heb een base spirit geïdentificeerd

### Reflectievraag

Welke cocktail spreekt jou het meeste aan?
',
    8,
    1
  ),
  (
    'geschiedenis-van-cocktails',
    'De geschiedenis van cocktails',
    'Na deze les begrijp jij hoe cocktails zijn ontstaan.
',
    'Cocktails ontstonden begin 19e eeuw.

De eerste cocktails waren simpel:

- spirit
- suiker
- water
- bitters

Later groeide cocktailcultuur via hotels, bars en internationale handel.

De Amerikaanse drooglegging (Prohibition) had grote invloed.

Bartenders verhuisden naar Europa en Cuba.

Daardoor verspreidde cocktailkennis zich wereldwijd.

De moderne cocktailrenaissance begon rond 1990.
',
    '- history
- prohibition
- bitters
- classics
- bars
',
    'Veel klassieke cocktails ontstonden in hotels.
',
    '- Cocktails bestaan al ruim 200 jaar
- De eerste basis was simpel
- Prohibition veranderde de cocktailwereld
- Europa hielp klassieke recepten bewaren
',
    '### Opdracht

Zoek drie klassieke cocktails op.

### Checklist

- Ik heb drie klassiekers gevonden
- Ik weet wanneer ze ontstonden
- Ik herken de base spirit

### Reflectievraag

Welke klassieke cocktail kende je al?
',
    8,
    2
  ),
  (
    'spirit-modifier-balance',
    'Spirit, modifier en balance',
    'Na deze les begrijp jij hoe cocktailstructuur wordt opgebouwd.
',
    'Elke cocktail heeft meestal drie bouwstenen:

**Base spirit**  
De hoofdalcohol.

Bijvoorbeeld:

- gin
- rum
- whisky
- vodka
- tequila

**Modifier**  
Geeft extra smaak.

Bijvoorbeeld:

- vermouth
- likeuren
- bitters

**Balance**  
Zorgt voor harmonie.

Balans ontstaat tussen:

- zoet
- zuur
- bitter
- alcohol

Zonder balans is een cocktail niet compleet.
',
    '- base spirit
- modifier
- balance
- bitters
- structure
',
    'Veel topbartenders beginnen altijd met balansdenken.
',
    '- Base spirit is de kern
- Modifiers bouwen complexiteit
- Balans bepaalt kwaliteit
',
    '### Opdracht

Kies één cocktail en ontleed de structuur.

### Checklist

- Base spirit gevonden
- Modifier gevonden
- Balans geanalyseerd

### Reflectievraag

Welke component viel het meest op?
',
    8,
    3
  ),
  (
    'basisstructuren-cocktails',
    'De basisstructuren van cocktails',
    'Na deze les herken jij de vier belangrijkste cocktailstructuren.
',
    'Vrijwel alle cocktails vallen in één van deze structuren:

**Spirit-forward**  
Voorbeeld: Martini

Sterk, puur, weinig verdunning.

**Sour**  
Voorbeeld: Daiquiri

Balans tussen zuur en zoet.

**Bitter**  
Voorbeeld: Negroni

Complex, kruidig en bitter.

**Longdrink / Highball**  
Voorbeeld: Mojito

Langer, frisser, toegankelijker.

Deze structuren helpen je cocktails begrijpen.
',
    '- structure
- sour
- bitter
- spirit-forward
- highball
',
    'Als je structuur begrijpt, kun je makkelijker nieuwe cocktails leren.
',
    '- Cocktails volgen vaak vaste structuren
- Structuur bepaalt stijl
- Structuur helpt herkennen
',
    '### Opdracht

Zoek van elke structuur één voorbeeld.

### Checklist

- Spirit-forward gevonden
- Sour gevonden
- Bitter gevonden
- Highball gevonden

### Reflectievraag

Welke structuur past het beste bij jouw smaak?
',
    8,
    4
  ),
  (
    'klassieke-cocktailcategorieen',
    'Klassieke cocktailcategorieën',
    'Na deze les herken jij de belangrijkste cocktailcategorieën.
',
    'Cocktails worden vaak ingedeeld in categorieën:

- stirred
- shaken
- sour
- fizz
- highball

**Stirred** = helder en elegant  
**Shaken** = luchtig en fris  
**Sour** = zuur-zoet balans  
**Fizz** = bruisend en licht  
**Highball** = lang en verfrissend

Deze categorieën vormen de basis voor de rest van de academy.
',
    '- shaken
- stirred
- sour
- fizz
- highball',
    'Veel moderne cocktails zijn variaties op klassieke families.
',
    '- Cocktailcategorieën maken leren eenvoudiger
- Families keren steeds terug
- Variaties bouwen op dezelfde structuur
',
    '### Opdracht

Maak een lijst van 10 cocktails en groepeer ze.

### Checklist

- Ik heb 10 cocktails gevonden
- Ik heb ze ingedeeld
- Ik begrijp de verschillen

### Reflectievraag

Welke categorie vind jij het interessantst?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- technieken-cocktails (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'technieken-cocktails'
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
    'shaken',
    'Shaken',
    'Na deze les kun jij uitleggen wanneer je een cocktail moet shaken en waarom.
',
    'Shaken is één van de belangrijkste cocktailtechnieken.

Je gebruikt shaken vooral bij ingrediënten die goed gemengd moeten worden:

- citrus
- vruchtensappen
- eiwit
- siropen

Door shaken gebeurt er drie dingen tegelijk:

- koelen
- verdunnen
- beluchten

Beluchting zorgt voor textuur.

Dat zie je vooral bij cocktails met eiwit.

Voorbeelden:

- Daiquiri
- Margarita
- Whiskey Sour

Een goede shake is krachtig en gecontroleerd.
',
    '- shaken
- aeration
- citrus
- texture
- dilution
',
    'Een harde shake kan de textuur van een cocktail volledig veranderen.
',
    '- Shaken mengt intensief
- Shaken koelt snel
- Shaken geeft lucht
- Shaken geeft textuur
',
    '### Opdracht

Bekijk drie cocktailrecepten en bepaal welke shaken nodig hebben.

### Checklist

- Ik heb 3 recepten bekeken
- Ik heb citrus herkend
- Ik heb gekozen voor shaken

### Reflectievraag

Waarom zou jij shaken kiezen?
',
    8,
    1
  ),
  (
    'stirred',
    'Stirred',
    'Na deze les begrijp jij wanneer je een cocktail stirred.
',
    'Stirred betekent roeren.

Deze techniek gebruik je bij heldere cocktails zonder sap of citrus.

Doel:

- koelen
- verdunnen
- helder houden

Stirred cocktails blijven elegant en strak.

Voorbeelden:

- Martini
- Manhattan
- Negroni

Roeren gebeurt meestal 20–30 seconden.

Lang genoeg voor balans.

Kort genoeg voor structuur.
',
    '- stirred
- clarity
- dilution
- control
- structure
',
    'Overstirren maakt een cocktail vlak.
',
    '- Stirred houdt cocktails helder
- Minder lucht dan shaken
- Meer controle op verdunning
',
    '### Opdracht

Zoek drie stirred cocktails.

### Checklist

- Ik heb drie recepten gevonden
- Ik herken heldere ingrediënten
- Ik begrijp waarom stirred nodig is

### Reflectievraag

Wat is het voordeel van stirred?
',
    8,
    2
  ),
  (
    'built',
    'Built',
    'Na deze les weet jij wat built betekent.
',
    'Built betekent direct opbouwen in het glas.

Er wordt niet geshaket of geroerd in mixing glass.

De ingrediënten gaan direct in het serveerglas.

Voordelen:

- snel
- efficiënt
- minder materiaal

Vaak gebruikt bij:

- Gin Tonic
- Dark ’n Stormy
- Cuba Libre

Built is simpel, maar precisie blijft belangrijk.
',
    '- built
- highball
- efficiency
- direct
- service
',
    'Veel highballs worden built gemaakt.
',
    '- Built = direct in glas
- Snel en efficiënt
- Vaak voor longdrinks
',
    '### Opdracht

Maak thuis een eenvoudige built-drink.

### Checklist

- Glas gekozen
- IJs toegevoegd
- Volgorde bepaald

### Reflectievraag

Waarom werkt built goed?
',
    8,
    3
  ),
  (
    'layering',
    'Layering',
    'Na deze les begrijp jij hoe layering werkt.
',
    'Layering is het opbouwen van vloeistoffen in lagen.

Dit werkt door verschil in dichtheid.

Suikerrijke likeuren zakken sneller.

Lichtere alcohol blijft bovenop.

Layering vraagt:

- precisie
- rustige schenktechniek
- kennis van dichtheid

Vaak gebruikt voor:

- pousse-café
- shooters
- visuele presentatie
',
    '- layering
- density
- precision
- visual
- spoon
',
    'Een barspoon wordt vaak gebruikt om lagen te bouwen.
',
    '- Layering draait om dichtheid
- Visuele techniek
- Hoge precisie nodig
',
    '### Opdracht

Bekijk online een layered cocktail.

### Checklist

- Ik herken de lagen
- Ik begrijp de volgorde
- Ik zie dichtheidsverschillen

### Reflectievraag

Waarom is layering lastig?
',
    8,
    4
  ),
  (
    'muddling',
    'Muddling',
    'Na deze les weet jij hoe muddling werkt.
',
    'Muddling betekent kneuzen.

Hiermee haal je aroma’s uit:

- kruiden
- fruit
- suiker

Belangrijk:

niet kapot slaan.

Je wilt extractie, geen bitterheid.

Voorbeelden:

- Mojito
- Caipirinha
- Smash cocktails

Goede muddling is gecontroleerd.
',
    '- muddling
- extraction
- herbs
- mint
- aroma',
    'Te hard muddlen maakt munt bitter.
',
    '- Muddling haalt aroma’s vrij
- Vooral kruiden en fruit
- Controle is belangrijk
',
    '### Opdracht

Bekijk een Mojito-recept.

### Checklist

- Ik herken muddling
- Ik begrijp waarom munt wordt gebruikt
- Ik begrijp extractie

### Reflectievraag

Wat gebeurt er bij te hard muddlen?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- ingredienten-cocktails (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'ingredienten-cocktails'
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
    'base-spirits',
    'Base Spirits',
    'Na deze les kun jij de belangrijkste base spirits herkennen.
',
    'De base spirit vormt de kern van een cocktail.

Dit is meestal de grootste alcoholcomponent.

De vijf belangrijkste zijn:

- gin
- vodka
- rum
- whisky
- tequila

Elke spirit geeft zijn eigen karakter.

Gin = kruidig  
Vodka = neutraal  
Rum = vaak zoeter  
Whisky = rijk en diep  
Tequila = fris en plantaardig

De keuze van de base spirit bepaalt de stijl.
',
    '- gin
- vodka
- rum
- whisky
- tequila
',
    'Veel klassieke cocktails zijn gebouwd rond slechts één spirit.
',
    '- Base spirit is de basis
- Elke spirit heeft eigen karakter
- Base spirit bepaalt stijl
',
    '### Opdracht

Maak een lijst van 5 cocktails en noteer de base spirit.

### Checklist

- Ik heb 5 cocktails gevonden
- Ik herken de base spirit
- Ik zie verschillen

### Reflectievraag

Welke spirit spreekt jou het meeste aan?
',
    8,
    1
  ),
  (
    'likeuren',
    'Likeuren',
    'Na deze les begrijp jij wat likeuren doen in cocktails.
',
    'Likeuren zijn gearomatiseerde en gezoete alcoholische dranken.

Ze voegen toe:

- smaak
- zoetheid
- diepte

Voorbeelden:

- Triple Sec
- Cointreau
- Amaretto
- Campari
- Coffee liqueur

Likeuren worden vaak gebruikt als modifier.

Ze maken cocktails complexer.
',
    '- liqueur
- modifier
- sweetness
- complexity
- flavor
',
    'Campari is technisch ook een likeur.
',
    '- Likeuren geven smaak
- Likeuren geven zoetheid
- Likeuren bouwen complexiteit
',
    '### Opdracht

Zoek drie cocktails met likeur.

### Checklist

- Ik heb 3 cocktails gevonden
- Ik herken de likeur
- Ik begrijp de rol

### Reflectievraag

Welke likeur zie je het vaakst?
',
    8,
    2
  ),
  (
    'bitters',
    'Bitters',
    'Na deze les weet jij wat bitters doen.
',
    'Bitters zijn geconcentreerde smaakextracten.

Ze worden in kleine hoeveelheden gebruikt.

Maar hun impact is groot.

Bitters voegen toe:

- bitterheid
- kruidigheid
- lengte
- complexiteit

Bekende bitters:

- Angostura
- Orange bitters
- Peychaud’s

Veel klassieke cocktails gebruiken bitters.
',
    '- bitters
- angostura
- complexity
- spice
- balance
',
    'De originele cocktaildefinitie bevatte bitters.
',
    '- Bitters zijn krachtig
- Kleine hoeveelheid
- Grote invloed
',
    '### Opdracht

Zoek drie cocktails met bitters.

### Checklist

- Ik heb bitters gevonden
- Ik herken de functie
- Ik zie de dosering

### Reflectievraag

Waarom zijn bitters belangrijk?
',
    8,
    3
  ),
  (
    'citrus-en-suikers',
    'Citrus en suikers',
    'Na deze les begrijp jij de balans tussen zuur en zoet.
',
    'Citrus geeft frisheid.

Suiker geeft ronding.

Samen vormen ze de basis van veel cocktails.

Belangrijk:

- lemon
- lime
- simple syrup
- sugar syrup

Zonder goede balans wordt een cocktail:

te scherp  
of  
te zoet

Dit is vooral belangrijk in sour-cocktails.
',
    '- citrus
- acidity
- sugar
- syrup
- balance
',
    'Limoen heeft vaak meer directe scherpte dan citroen.
',
    '- Citrus = zuur
- Suiker = zoet
- Balans bepaalt drinkbaarheid
',
    '### Opdracht

Bekijk een Daiquiri-recept.

### Checklist

- Ik herken zuur
- Ik herken zoet
- Ik begrijp balans

### Reflectievraag

Wat gebeurt er zonder suiker?
',
    8,
    4
  ),
  (
    'mini-toets-cocktails',
    'Mini-toets Cocktails',
    'Na deze les toets jij jouw kennis van Module 1–3.
',
    'Je hebt nu geleerd:

- wat cocktails zijn
- geschiedenis
- techniek
- ingrediënten
- structuur

Dit vormt de volledige Explorer-basis.

Vanaf module 4 ga je werken met klassieke cocktails.
',
    '- foundation
- ingredients
- structure
- technique
- cocktail families',
    '',
    '- Basis is gelegd
- Structuur is duidelijk
- Ingrediënten herkenbaar
- Technieken begrijpelijk
',
    '### Opdracht

Kies jouw favoriete cocktail en analyseer:

- base spirit
- modifier
- techniek
- structuur

### Checklist

- Ik heb alles geanalyseerd
- Ik begrijp de opbouw
- Ik herken de familie

### Reflectievraag

Welke cocktailfamilie past het beste bij jou?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klassiek-cocktails (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'klassiek-cocktails'
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
    'martini',
    'Martini',
    'Na deze les begrijp jij waarom de Martini één van de belangrijkste cocktails ter wereld is.
',
    'De Martini is de ultieme spirit-forward cocktail.

Klassieke opbouw:

- gin
- dry vermouth

Soms met:

- orange bitters

Techniek:

stirred

Belangrijk:

- koud serveren
- minimale verdunning
- maximale helderheid

De verhouding bepaalt stijl.

Dryer Martini = minder vermouth.
',
    '- martini
- gin
- vermouth
- dry
- stirred
',
    'De Martini kent honderden variaties.
',
    '- Spirit-forward klassieker
- Gin + vermouth
- Stirred techniek
- Hoge precisie nodig
',
    '### Opdracht

Bekijk drie Martini-variaties.

### Checklist

- Ik herken de basis
- Ik herken de verschillen
- Ik begrijp dry vs wet

### Reflectievraag

Welke Martini-stijl spreekt jou aan?
',
    8,
    1
  ),
  (
    'old-fashioned',
    'Old Fashioned',
    'Na deze les begrijp jij de structuur van de Old Fashioned.
',
    'De Old Fashioned is één van de oudste cocktails.

Structuur:

- whisky
- suiker
- bitters

Soms met sinaasappelzeste.

Dit is de oervorm van cocktails.

Balans draait om:

- kracht
- bitterheid
- zoetheid

Techniek:

built of stirred
',
    '- old fashioned
- whisky
- sugar
- bitters
- classic
',
    'De Old Fashioned lijkt sterk op de originele cocktaildefinitie.
',
    '- Eén van de oudste cocktails
- Zeer pure structuur
- Spirit-forward
',
    '### Opdracht

Analyseer een Old Fashioned recept.

### Checklist

- Spirit gevonden
- Zoetcomponent gevonden
- Bitters gevonden

### Reflectievraag

Waarom is deze cocktail zo tijdloos?
',
    8,
    2
  ),
  (
    'manhattan',
    'Manhattan',
    'Na deze les begrijp jij de structuur van de Manhattan.
',
    'De Manhattan is elegant en krachtig.

Structuur:

- whisky
- sweet vermouth
- bitters

Techniek:

stirred

De vermouth maakt hem zachter dan Old Fashioned.

Bitters geven diepte.

Klassieke garnish:

kers.
',
    '- manhattan
- whisky
- sweet vermouth
- bitters
- cherry
',
    'De Manhattan ontstond waarschijnlijk in New York.
',
    '- Whiskycocktail
- Vermouth als modifier
- Stirred klassieker
',
    '### Opdracht

Vergelijk Manhattan met Old Fashioned.

### Checklist

- Spirit vergeleken
- Modifier vergeleken
- Structuur vergeleken

### Reflectievraag

Welke lijkt complexer?
',
    8,
    3
  ),
  (
    'negroni',
    'Negroni',
    'Na deze les begrijp jij waarom de Negroni uniek is.
',
    'De Negroni is bitter en perfect in balans.

Structuur:

- gin
- Campari
- sweet vermouth

Gelijke delen.

Techniek:

stirred

Smaak:

- bitter
- kruidig
- sinaasappelachtig

Eén van de meest herkenbare cocktails.
',
    '- negroni
- campari
- equal parts
- bitter
- gin
',
    'Negroni is een klassiek voorbeeld van bitter balance.
',
    '- Bitter klassieker
- Equal parts
- Zeer herkenbare structuur
',
    '### Opdracht

Bekijk een Negroni-variant.

### Checklist

- Base spirit gevonden
- Bitter component gevonden
- Modifier gevonden

### Reflectievraag

Waarom werkt equal parts zo goed?
',
    8,
    4
  ),
  (
    'daiquiri',
    'Daiquiri',
    'Na deze les begrijp jij waarom de Daiquiri de perfecte sour-structuur is.
',
    'De Daiquiri is simpel maar technisch perfect.

Structuur:

- rum
- lime
- sugar

Techniek:

shaken

Dit is de pure sour-structuur.

Balans is alles.

Te veel lime = te zuur.

Te veel sugar = te zoet.

Perfecte training voor elke bartender.
',
    '- daiquiri
- rum
- lime
- sugar
- sour',
    'Veel bartenders testen bars op hun Daiquiri.
',
    '- Pure sourstructuur
- Rum als basis
- Balans is cruciaal
',
    '### Opdracht

Analyseer een Daiquiri.

### Checklist

- Spirit gevonden
- Zuur gevonden
- Zoet gevonden

### Reflectievraag

Waarom is eenvoud vaak moeilijk?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- sour-family-cocktails (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'sour-family-cocktails'
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
    'whiskey-sour',
    'Whiskey Sour',
    'Na deze les begrijp jij waarom de Whiskey Sour een klassieke sour is.
',
    'De Whiskey Sour is één van de bekendste sour-cocktails.

Structuur:

- whisky
- citroen
- suikersiroop

Optioneel:

- eiwit

Eiwit zorgt voor:

- schuim
- zachtheid
- textuur

Balans is essentieel.

Te veel zuur maakt hem scherp.

Te veel suiker maakt hem zwaar.
',
    '- whiskey sour
- egg white
- texture
- lemon
- balance
',
    'De Whiskey Sour werd al in de 19e eeuw gedronken.
',
    '- Klassieke sour
- Whisky als basis
- Balans tussen zuur en zoet
- Eiwit geeft textuur
',
    '### Opdracht

Vergelijk een Whiskey Sour met en zonder eiwit.

### Checklist

- Ik heb textuur vergeleken
- Ik heb schuim beoordeeld
- Ik begrijp het verschil

### Reflectievraag

Welke versie heeft jouw voorkeur?
',
    8,
    1
  ),
  (
    'margarita',
    'Margarita',
    'Na deze les begrijp jij waarom de Margarita één van de belangrijkste cocktails is.
',
    'De Margarita is de bekendste tequila sour.

Structuur:

- tequila
- lime
- Triple Sec

Balans:

- fris
- strak
- citrusgedreven

De Triple Sec voegt toe:

- zoetheid
- sinaasappel
- diepte

Vaak met zoutrand.
',
    '- margarita
- tequila
- triple sec
- lime
- salt rim
',
    'De Margarita is wereldwijd één van de meest verkochte cocktails.
',
    '- Tequila sour
- Triple Sec als modifier
- Lime als zuur
- Klassieke balanscocktail
',
    '### Opdracht

Bekijk drie Margarita-variaties.

### Checklist

- Ik herken de basis
- Ik herken de modifier
- Ik zie variaties

### Reflectievraag

Waarom is Margarita zo populair?
',
    8,
    2
  ),
  (
    'sidecar',
    'Sidecar',
    'Na deze les begrijp jij de structuur van de Sidecar.
',
    'De Sidecar is een cognac sour.

Structuur:

- cognac
- Triple Sec
- citroen

Elegant en krachtig.

De cognac geeft:

- warmte
- diepte
- houttonen

De citrus maakt hem levendig.
',
    '- sidecar
- cognac
- citrus
- elegance
- balance
',
    'De Sidecar is één van de oudste Europese klassiekers.
',
    '- Cognac sour
- Elegant en krachtig
- Triple Sec als brug tussen spirit en citrus
',
    '### Opdracht

Vergelijk Sidecar met Margarita.

### Checklist

- Spirit vergeleken
- Citrus vergeleken
- Modifier vergeleken

### Reflectievraag

Welke is krachtiger?
',
    8,
    3
  ),
  (
    'white-lady',
    'White Lady',
    'Na deze les begrijp jij waarom de White Lady een verfijnde sour is.
',
    'De White Lady is een gin sour.

Structuur:

- gin
- Triple Sec
- citroen

Vergelijkbaar met Sidecar, maar frisser.

Gin geeft:

- kruiden
- botanicals
- spanning

De White Lady is strak en elegant.
',
    '- white lady
- gin
- botanicals
- sour
- citrus
',
    'Veel bartenders zien White Lady als “gin Sidecar”.
',
    '- Gin sour
- Elegant
- Citrusgedreven
- Botanische spanning
',
    '### Opdracht

Vergelijk White Lady met Sidecar.

### Checklist

- Spirit vergeleken
- Structuur vergeleken
- Smaakprofiel geanalyseerd

### Reflectievraag

Welke vind jij verfijnder?
',
    8,
    4
  ),
  (
    'pisco-sour',
    'Pisco Sour',
    'Na deze les begrijp jij waarom de Pisco Sour uniek is.
',
    'De Pisco Sour is Zuid-Amerika’s bekendste cocktail.

Structuur:

- pisco
- lime
- sugar
- eiwit
- bitters

Uniek door:

- aromatische pisco
- romige textuur
- frisse spanning

De bitters bovenop geven extra aroma.
',
    '- pisco sour
- egg white
- bitters
- aromatic
- sour family',
    'Peru en Chili discussiëren al jaren over de oorsprong.
',
    '- Pisco sour
- Aromatisch
- Eiwit voor textuur
- Bitters voor afwerking
',
    '### Opdracht

Analyseer de structuur van Pisco Sour.

### Checklist

- Spirit gevonden
- Eiwit herkend
- Bitters herkend

### Reflectievraag

Waarom is deze sour anders dan de rest?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- highballs-cocktails (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'highballs-cocktails'
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
    'mojito',
    'Mojito',
    'Na deze les begrijp jij waarom de Mojito één van de meest iconische highballs is.
',
    'De Mojito combineert frisheid, kruiden en bruis.

Structuur:

- rum
- lime
- sugar
- mint
- soda

Belangrijk:

- muddling van munt
- juiste balans
- frisse carbonatie

De Mojito lijkt simpel, maar is technisch gevoelig.

Te hard muddlen maakt munt bitter.

Te weinig soda maakt hem zwaar.
',
    '- mojito
- mint
- soda
- rum
- freshness
',
    'De Mojito heeft Cubaanse roots.
',
    '- Rum highball
- Munt en lime zijn essentieel
- Soda brengt lengte
- Balans en frisheid zijn cruciaal
',
    '### Opdracht

Analyseer de Mojito-structuur.

### Checklist

- Base spirit gevonden
- Kruidencomponent gevonden
- Carbonatie herkend

### Reflectievraag

Waarom is munt zo belangrijk?
',
    8,
    1
  ),
  (
    'tom-collins',
    'Tom Collins',
    'Na deze les begrijp jij de klassieke Collins-structuur.
',
    'De Tom Collins is een gin-based longdrink.

Structuur:

- gin
- lemon
- sugar
- soda

Eigenlijk een verlengde sour.

De soda maakt hem lichter en toegankelijker.

Belangrijk:

- balans
- carbonatie
- frisheid
',
    '- tom collins
- gin
- soda
- lemon
- highball
',
    'De Collins-familie is één van de oudste cocktailfamilies.
',
    '- Gin longdrink
- Sour + soda
- Licht en verfrissend
',
    '### Opdracht

Vergelijk Tom Collins met Daiquiri.

### Checklist

- Base spirit vergeleken
- Citrus vergeleken
- Carbonatie vergeleken

### Reflectievraag

Wat maakt Collins toegankelijker?
',
    8,
    2
  ),
  (
    'moscow-mule',
    'Moscow Mule',
    'Na deze les begrijp jij waarom ginger beer een unieke modifier is.
',
    'De Moscow Mule is een moderne klassieker.

Structuur:

- vodka
- lime
- ginger beer

De ginger beer zorgt voor:

- kruidigheid
- pittigheid
- bruis

Vodka blijft neutraal.

Daardoor komt ginger sterk naar voren.

Klassieke service:

koperen mug.
',
    '- moscow mule
- ginger beer
- vodka
- spice
- copper mug
',
    'De koperen beker werd onderdeel van de marketing.
',
    '- Vodka highball
- Ginger beer bepaalt karakter
- Frisse en pittige stijl
',
    '### Opdracht

Vergelijk ginger beer met soda.

### Checklist

- Carbonatie bekeken
- Smaak vergeleken
- Structuur geanalyseerd

### Reflectievraag

Waarom werkt vodka hier goed?
',
    8,
    3
  ),
  (
    'dark-n-stormy',
    'Dark ’n Stormy',
    'Na deze les begrijp jij de structuur van Dark ’n Stormy.
',
    'De Dark ’n Stormy lijkt op de Moscow Mule.

Structuur:

- dark rum
- ginger beer
- lime

Verschil:

rum geeft meer:

- diepte
- zoetheid
- kruidigheid

Hierdoor is de cocktail voller.

Klassiek geassocieerd met Bermuda.
',
    '- dark n stormy
- rum
- ginger beer
- bermuda
- depth
',
    'Alleen Goslings Rum mag officieel Dark ’n Stormy heten.
',
    '- Rum-based Mule variant
- Meer diepte dan Moscow Mule
- Ginger beer blijft dominant
',
    '### Opdracht

Vergelijk Dark ’n Stormy met Moscow Mule.

### Checklist

- Spirit vergeleken
- Body vergeleken
- Structuur geanalyseerd

### Reflectievraag

Welke voelt krachtiger?
',
    8,
    4
  ),
  (
    'paloma',
    'Paloma',
    'Na deze les begrijp jij waarom de Paloma één van de meest onderschatte tequila-cocktails is.
',
    'De Paloma is fris, bitter en verfrissend.

Structuur:

- tequila
- grapefruit soda
- lime

De grapefruit geeft:

- bitterheid
- frisheid
- citrusdiepte

De Paloma is vaak toegankelijker dan Margarita.

Minder strak.

Meer doordrinkbaar.
',
    '- paloma
- tequila
- grapefruit
- carbonation
- refreshing',
    'In Mexico is Paloma populairder dan Margarita.
',
    '- Tequila highball
- Grapefruit bepaalt stijl
- Bitter-frisse balans
',
    '### Opdracht

Vergelijk Paloma met Margarita.

### Checklist

- Structuur vergeleken
- Citrus vergeleken
- Carbonatie vergeleken

### Reflectievraag

Welke is frisser?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-cocktails (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'service-cocktails'
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
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij waarom glaswerk essentieel is in cocktailservice.
',
    'Glaswerk beïnvloedt:

- temperatuur
- aroma
- presentatie
- drinkervaring

Belangrijke types:

**Coupe**  
Voor shaken/stirred zonder ijs.

**Martini glas**  
Voor aromatische, elegante cocktails.

**Rocks glas**  
Voor spirit-forward en on the rocks.

**Highball glas**  
Voor longdrinks.

**Collins glas**  
Voor langere, slankere highballs.

Het juiste glas ondersteunt de cocktail.
',
    '- glassware
- coupe
- martini
- rocks
- highball
',
    'Een verkeerde glaskeuze kan de aromabeleving sterk verminderen.
',
    '- Glas beïnvloedt ervaring
- Elk glas heeft functie
- Presentatie is onderdeel van kwaliteit
',
    '### Opdracht

Zoek vijf klassieke cocktails en noteer het glas.

### Checklist

- Ik heb 5 cocktails bekeken
- Ik herken het glaswerk
- Ik begrijp waarom

### Reflectievraag

Welke glazen zie je het meest?
',
    8,
    1
  ),
  (
    'ijsgebruik',
    'IJsgebruik',
    'Na deze les begrijp jij hoe ijs de kwaliteit van cocktails beïnvloedt.
',
    'IJs bepaalt:

- temperatuur
- verdunning
- textuur

Belangrijk:

**Grote blokken**  
Smelten langzaam.

**Crushed ice**  
Smelt snel.

**Cubed ice**  
Universeel.

Meer smelt = meer verdunning.

Verdunning is geen fout.

Verdunning is onderdeel van balans.
',
    '- ice
- dilution
- temperature
- texture
- balance
',
    'Veel beginners gebruiken te weinig ijs.
',
    '- IJs bepaalt balans
- IJs bepaalt temperatuur
- IJs bepaalt mondgevoel
',
    '### Opdracht

Bekijk drie cocktails met verschillend ijs.

### Checklist

- Ik herken de ijsvorm
- Ik begrijp waarom
- Ik zie effect op stijl

### Reflectievraag

Waarom werkt crushed ice anders?
',
    8,
    2
  ),
  (
    'garnishes',
    'Garnishes',
    'Na deze les begrijp jij waarom garnishes functioneel zijn.
',
    'Een garnish is meer dan decoratie.

Een garnish beïnvloedt:

- aroma
- eerste indruk
- visuele balans

Voorbeelden:

- citrus zest
- mint
- cherry
- olive

Belangrijk:

de garnish moet functioneel zijn.

Geen overdaad.

Altijd ondersteunend.
',
    '- garnish
- aroma
- mint
- zest
- olive
',
    'Aroma bepaalt een groot deel van smaakbeleving.
',
    '- Garnish beïnvloedt aroma
- Garnish ondersteunt de cocktail
- Minder is vaak beter
',
    '### Opdracht

Bekijk vijf cocktails en noteer de garnish.

### Checklist

- Ik heb de garnish herkend
- Ik begrijp de functie
- Ik zie de logica

### Reflectievraag

Welke garnish zie je het meest?
',
    8,
    3
  ),
  (
    'serveertechniek',
    'Serveertechniek',
    'Na deze les begrijp jij hoe serviceflow kwaliteit bepaalt.
',
    'Goede service draait om:

- timing
- precisie
- hospitality
- presentatie

Belangrijk:

- glas klaarzetten
- ijs voorbereiden
- garnish klaar
- direct serveren

Een cocktail wacht niet.

Verlies van:

- temperatuur
- carbonatie
- textuur

kan direct kwaliteit kosten.

Service is onderdeel van het product.
',
    '- service
- timing
- hospitality
- precision
- presentation',
    'Topbars trainen service net zo intensief als recepten.
',
    '- Timing is cruciaal
- Voorbereiding verhoogt kwaliteit
- Hospitality maakt verschil
',
    '### Opdracht

Observeer een bartender.

### Checklist

- Ik zie voorbereiding
- Ik zie timing
- Ik zie presentatie

### Reflectievraag

Wat viel je op?
',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-cocktails (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'pairing-cocktails'
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
    'cocktails-als-aperitief',
    'Cocktails als aperitief',
    'Na deze les begrijp jij welke cocktails geschikt zijn als aperitief.
',
    'Een aperitiefcocktail heeft één doel:

de eetlust openen.

Belangrijke eigenschappen:

- fris
- licht bitter
- droog
- verfrissend

Typische aperitiefcocktails:

- Martini
- Negroni
- Americano
- Spritz

Waarom werkt bitter?

Bitter activeert speekselproductie.

Dat stimuleert eetlust.

Te zoet werkt vaak minder goed.
',
    '- aperitif
- bitter
- dry
- freshness
- appetite
',
    'Aperitiefcultuur is diep geworteld in Italië en Frankrijk.
',
    '- Aperitief opent de maaltijd
- Bitterheid werkt goed
- Frisheid verhoogt spanning
- Droogte helpt balans
',
    '### Opdracht

Kies drie aperitiefcocktails en analyseer waarom ze werken.

### Checklist

- Ik herken bitterheid
- Ik herken frisheid
- Ik begrijp de functie

### Reflectievraag

Welke zou jij voor een diner serveren?
',
    8,
    1
  ),
  (
    'cocktails-bij-foodpairing',
    'Cocktails bij foodpairing',
    'Na deze les begrijp jij hoe cocktails met gerechten gecombineerd worden.
',
    'Cocktailpairing werkt op dezelfde principes als wijnpairing:

- intensiteit
- contrast
- harmonie

Belangrijk:

**Zuur** snijdt door vet.

**Zoet** verzacht spice.

**Bitter** werkt goed bij rijke gerechten.

**Carbonatie** reinigt het gehemelte.

Voorbeelden:

Oesters + Martini  
BBQ + Old Fashioned  
Ceviche + Margarita  
Kaas + Negroni

Cocktails geven vaak meer speelruimte dan wijn.
',
    '- pairing
- intensity
- acidity
- contrast
- harmony
',
    'Steeds meer fine dining restaurants werken met cocktailpairing.
',
    '- Structuur bepaalt pairing
- Intensiteit moet kloppen
- Cocktails kunnen veelzijdiger zijn dan wijn
',
    '### Opdracht

Koppel drie gerechten aan cocktails.

### Checklist

- Intensiteit bekeken
- Structuur bekeken
- Balans gemaakt

### Reflectievraag

Welke pairing lijkt jou spannend?
',
    8,
    2
  ),
  (
    'cocktails-als-digestief',
    'Cocktails als digestief',
    'Na deze les begrijp jij welke cocktails geschikt zijn na de maaltijd.
',
    'Digestiefcocktails sluiten de maaltijd af.

Ze zijn vaak:

- bitter
- kruidig
- rijk
- aromatisch

Typische digestiefcocktails:

- Old Fashioned
- Boulevardier
- Espresso Martini
- Black Manhattan

Na eten mag een cocktail voller zijn.

Meer body.

Meer complexiteit.

Minder frisheid nodig.
',
    '- digestif
- bitter
- rich
- aromatic
- finish',
    'Bittere digestieven worden al eeuwen gebruikt in Europa.
',
    '- Digestief sluit af
- Vaak rijker en bitterder
- Complexiteit is belangrijk
',
    '### Opdracht

Zoek drie digestiefcocktails.

### Checklist

- Ik herken bitterheid
- Ik herken rijkdom
- Ik begrijp afsluiting

### Reflectievraag

Welke zou jij na dessert kiezen?
',
    8,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-cocktails (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'cocktails' and m.slug = 'examen-cocktails'
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
    'spirit-blind-herkennen',
    'Spirit blind herkennen',
    'Na deze les kun jij de belangrijkste base spirits blind herkennen op aroma en structuur.
',
    'Blindproeven begint met basisherkenning.

Belangrijkste spirits:

- gin
- vodka
- rum
- whisky
- tequila

Waar let je op?

**Aroma**
- botanicals
- hout
- agave
- suikerriet

**Structuur**
- body
- warmte
- mondgevoel

Voorbeelden:

Gin → kruiden  
Rum → zoet/koloniaal  
Whisky → hout/kracht  
Tequila → groen/agave  
Vodka → neutraal

Herkenning begint met patronen.
',
    '- blind tasting
- aroma
- spirit
- recognition
- structure
',
    'Professionele bartenders trainen blindproeven net als sommeliers.
',
    '- Blind herkennen begint met aroma
- Structuur helpt bevestigen
- Base spirits hebben duidelijke profielen
',
    '### Opdracht

Proef drie spirits blind (of lees tasting notes).

### Checklist

- Ik heb aroma geanalyseerd
- Ik heb structuur geanalyseerd
- Ik heb een gok gedaan

### Reflectievraag

Welke spirit vond je het makkelijkst?
',
    8,
    1
  ),
  (
    'cocktailstructuren-blind',
    'Cocktailstructuren blind analyseren',
    'Na deze les kun jij blind herkennen in welke cocktailfamilie een cocktail valt.
',
    'Blind analyseren draait om structuur.

Vraag jezelf af:

Is hij:
- spirit-forward?
- sour?
- bitter?
- highball?

Herkenningspunten:

**Spirit-forward**
weinig zuur, veel alcohol

**Sour**
duidelijke spanning tussen zuur en zoet

**Bitter**
lange, kruidige afdronk

**Highball**
licht, bruisend, verfrissend

Structuur is vaak belangrijker dan exacte ingrediënten.
',
    '- structure
- family
- sour
- bitter
- highball
',
    'Veel klassieke cocktails zijn variaties op dezelfde families.
',
    '- Structuur herkennen versnelt analyse
- Families zijn voorspelbaar
- Balans verraadt de stijl
',
    '### Opdracht

Bekijk vijf cocktailrecepten en classificeer blind op structuur.

### Checklist

- Ik herken spirit-forward
- Ik herken sour
- Ik herken bitter
- Ik herken highball

### Reflectievraag

Welke structuur vind jij het makkelijkst?
',
    8,
    2
  ),
  (
    'theorie-praktijkexamen',
    'Theorie- en praktijkexamen',
    'Na deze les toon jij aan dat je de volledige Cocktail Track beheerst.
',
    'Dit examen combineert alles:

**Fundament**
- geschiedenis
- structuur
- balans

**Technieken**
- shaken
- stirred
- built
- layering
- muddling

**Ingrediënten**
- spirits
- modifiers
- bitters
- citrus
- suiker

**Klassiekers**
- Martini
- Old Fashioned
- Manhattan
- Negroni
- Daiquiri

**Families**
- Sour
- Highball
- Longdrink

**Service**
- glaswerk
- ijs
- garnish
- hospitality

**Pairing**
- aperitief
- foodpairing
- digestief

**Blindproeven**
- spiritherkenning
- structuuranalyse

Dit is de integratie van alle kennis.
',
    '- exam
- integration
- mastery
- blind tasting
- cocktail academy',
    '',
    '',
    '### Opdracht

Voer een volledige eindassessment uit.

Onderdeel 1:
Blind analyseer één cocktail.

Onderdeel 2:
Benoem:

- base spirit
- modifier
- techniek
- structuur
- balans

Onderdeel 3:
Maak een complete foodpairing:

- aperitief
- hoofdgerecht
- digestief

Onderdeel 4:
Leg uit waarom jouw keuzes logisch zijn.

---

### Checklist

- Ik heb blind geanalyseerd
- Ik heb structuur benoemd
- Ik heb techniek uitgelegd
- Ik heb pairing gebouwd
- Ik heb mijn keuzes onderbouwd

---

### Reflectievraag

Waar ligt jouw grootste kracht binnen cocktails: techniek, smaak, service of pairing?
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
  where t.slug = 'cocktails'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-cocktails', 'wat-is-een-cocktail', 1, 'Wat is een cocktail?', '["Een pure spirit", "Een gemixte drank", "Een wijn", "Een likeur"]', 1, 'Correct: Een gemixte drank'),
  ('intro-cocktails', 'wat-is-een-cocktail', 2, 'Wat is meestal de basis?', '["Water", "Base spirit", "Fruit", "Bier"]', 1, 'Correct: Base spirit'),
  ('intro-cocktails', 'wat-is-een-cocktail', 3, 'Wat is essentieel in cocktails?', '["Balans", "Schuim", "Warmte", "Zout"]', 0, 'Correct: Balans'),
  ('intro-cocktails', 'wat-is-een-cocktail', 4, 'Welke smaakcomponent komt vaak voor?', '["Zoet", "Umami", "Rook", "Vet"]', 0, 'Correct: Zoet'),
  ('intro-cocktails', 'wat-is-een-cocktail', 5, 'Cocktails bestaan meestal uit:', '["Eén ingrediënt", "Meerdere ingrediënten", "Alleen alcohol", "Alleen suiker"]', 1, 'Correct: Meerdere ingrediënten'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 1, 'Wanneer ontstonden cocktails?', '["1600", "1800", "1950", "2000"]', 1, 'Correct: 1800'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 2, 'Welke periode beïnvloedde cocktails sterk?', '["Renaissance", "Prohibition", "Middeleeuwen", "Industriële revolutie"]', 1, 'Correct: Prohibition'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 3, 'Waar gingen bartenders heen?', '["Afrika", "Europa en Cuba", "Azië", "Australië"]', 1, 'Correct: Europa en Cuba'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 4, 'Wat zat in vroege cocktails?', '["Bier", "Bitters", "Melk", "Wijn"]', 1, 'Correct: Bitters'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 5, 'De moderne cocktailrenaissance begon rond:', '["1970", "1990", "2010", "2020"]', 1, 'Correct: 1990'),
  ('intro-cocktails', 'spirit-modifier-balance', 1, 'Wat is de base spirit?', '["Hoofdalcohol", "Garnering", "Glaswerk", "IJs"]', 0, 'Correct: Hoofdalcohol'),
  ('intro-cocktails', 'spirit-modifier-balance', 2, 'Wat doet een modifier?', '["Koelt", "Geeft smaak", "Verwarmt", "Verdunt"]', 1, 'Correct: Geeft smaak'),
  ('intro-cocktails', 'spirit-modifier-balance', 3, 'Balans bestaat uit:', '["Zoet en zuur", "Alleen alcohol", "Alleen suiker", "Alleen bitter"]', 0, 'Correct: Zoet en zuur'),
  ('intro-cocktails', 'spirit-modifier-balance', 4, 'Bitters zijn vaak:', '["Modifier", "Base spirit", "Water", "IJs"]', 0, 'Correct: Modifier'),
  ('intro-cocktails', 'spirit-modifier-balance', 5, 'Zonder balans is een cocktail:', '["Compleet", "Onstabiel", "Perfect", "Klassiek"]', 1, 'Correct: Onstabiel'),
  ('intro-cocktails', 'basisstructuren-cocktails', 1, 'Wat is een spirit-forward cocktail?', '["Sterk en puur", "Zoet", "Koolzuurhoudend", "Fruitig"]', 0, 'Correct: Sterk en puur'),
  ('intro-cocktails', 'basisstructuren-cocktails', 2, 'Wat is de basis van een sour?', '["Bitter", "Zoet en zuur", "Melk", "Bier"]', 1, 'Correct: Zoet en zuur'),
  ('intro-cocktails', 'basisstructuren-cocktails', 3, 'Negroni is:', '["Sour", "Bitter", "Highball", "Fizz"]', 1, 'Correct: Bitter'),
  ('intro-cocktails', 'basisstructuren-cocktails', 4, 'Mojito is:', '["Highball", "Bitter", "Spirit-forward", "Dessert"]', 0, 'Correct: Highball'),
  ('intro-cocktails', 'basisstructuren-cocktails', 5, 'Structuur helpt bij:', '["Begrijpen", "Koelen", "Distilleren", "Fermenteren"]', 0, 'Correct: Begrijpen'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 1, 'Welke categorie is bruisend?', '["Fizz", "Sour", "Stirred", "Bitter"]', 0, 'Correct: Fizz'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 2, 'Welke categorie is luchtiger?', '["Shaken", "Stirred", "Built", "Layered"]', 0, 'Correct: Shaken'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 3, 'Highballs zijn meestal:', '["Kort", "Lang", "Warm", "Dik"]', 1, 'Correct: Lang'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 4, 'Sours draaien om:', '["Zoet en zuur", "Bitter en zout", "Water en ijs", "Koffie"]', 0, 'Correct: Zoet en zuur'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 5, 'Veel moderne cocktails zijn:', '["Nieuw", "Variaties op klassiekers", "Zonder structuur", "Random"]', 1, 'Correct: Variaties op klassiekers'),
  ('technieken-cocktails', 'shaken', 1, 'Wanneer gebruik je shaken?', '["Bij citrus", "Bij pure whisky", "Bij bier", "Bij water"]', 0, 'Correct: Bij citrus'),
  ('technieken-cocktails', 'shaken', 2, 'Wat doet shaken?', '["Koelen", "Verhitten", "Fermenteren", "Oxideren"]', 0, 'Correct: Koelen'),
  ('technieken-cocktails', 'shaken', 3, 'Wat ontstaat door shaken?', '["Aeratie", "Carbonatie", "Rijping", "Oxidatie"]', 0, 'Correct: Aeratie'),
  ('technieken-cocktails', 'shaken', 4, 'Welke cocktail wordt vaak geshaket?', '["Daiquiri", "Martini", "Negroni", "Manhattan"]', 0, 'Correct: Daiquiri'),
  ('technieken-cocktails', 'shaken', 5, 'Shaken geeft:', '["Textuur", "Houtlagering", "Koolzuur", "Zoetheid"]', 0, 'Correct: Textuur'),
  ('technieken-cocktails', 'stirred', 1, 'Stirred betekent:', '["Roeren", "Schudden", "Bouwen", "Stampen"]', 0, 'Correct: Roeren'),
  ('technieken-cocktails', 'stirred', 2, 'Wanneer stirred?', '["Heldere cocktails", "Citrus cocktails", "Milk punches", "Frozen drinks"]', 0, 'Correct: Heldere cocktails'),
  ('technieken-cocktails', 'stirred', 3, 'Wat blijft helder?', '["Cocktail", "Glas", "IJs", "Barspoon"]', 0, 'Correct: Cocktail'),
  ('technieken-cocktails', 'stirred', 4, 'Martini is meestal:', '["Stirred", "Shaken", "Built", "Layered"]', 0, 'Correct: Stirred'),
  ('technieken-cocktails', 'stirred', 5, 'Te lang roeren geeft:', '["Te veel verdunning", "Meer aroma", "Meer alcohol", "Meer kleur"]', 0, 'Correct: Te veel verdunning'),
  ('technieken-cocktails', 'built', 1, 'Built betekent:', '["Direct in glas", "In shaker", "In blender", "In vat"]', 0, 'Correct: Direct in glas'),
  ('technieken-cocktails', 'built', 2, 'Built is vaak:', '["Snel", "Langzaam", "Complex", "Warm"]', 0, 'Correct: Snel'),
  ('technieken-cocktails', 'built', 3, 'Gin Tonic is meestal:', '["Built", "Shaken", "Stirred", "Layered"]', 0, 'Correct: Built'),
  ('technieken-cocktails', 'built', 4, 'Built wordt vaak gebruikt voor:', '["Highballs", "Sours", "Dessertcocktails", "Punches"]', 0, 'Correct: Highballs'),
  ('technieken-cocktails', 'built', 5, 'Built vraagt:', '["Precisie", "Fermentatie", "Rijping", "Carbonatie"]', 0, 'Correct: Precisie'),
  ('technieken-cocktails', 'layering', 1, 'Layering draait om:', '["Dichtheid", "Temperatuur", "Zuur", "Schuim"]', 0, 'Correct: Dichtheid'),
  ('technieken-cocktails', 'layering', 2, 'Wat zakt sneller?', '["Zwaardere likeuren", "Water", "Soda", "Gin"]', 0, 'Correct: Zwaardere likeuren'),
  ('technieken-cocktails', 'layering', 3, 'Wat helpt bij layering?', '["Barspoon", "Shaker", "Blender", "Zeef"]', 0, 'Correct: Barspoon'),
  ('technieken-cocktails', 'layering', 4, 'Layering is vooral:', '["Visueel", "Bitter", "Warm", "Droog"]', 0, 'Correct: Visueel'),
  ('technieken-cocktails', 'layering', 5, 'Layering vraagt:', '["Precisie", "Snelheid", "Kracht", "Hitte"]', 0, 'Correct: Precisie'),
  ('technieken-cocktails', 'muddling', 1, 'Muddling betekent:', '["Kneuzen", "Schudden", "Roeren", "Gieten"]', 0, 'Correct: Kneuzen'),
  ('technieken-cocktails', 'muddling', 2, 'Waarvoor gebruik je muddling?', '["Kruiden", "IJs", "Wijn", "Bier"]', 0, 'Correct: Kruiden'),
  ('technieken-cocktails', 'muddling', 3, 'Welke cocktail gebruikt muddling?', '["Mojito", "Martini", "Manhattan", "Negroni"]', 0, 'Correct: Mojito'),
  ('technieken-cocktails', 'muddling', 4, 'Te hard muddlen geeft:', '["Bitterheid", "Zoetheid", "Minder aroma", "Minder kleur"]', 0, 'Correct: Bitterheid'),
  ('technieken-cocktails', 'muddling', 5, 'Muddling draait om:', '["Extractie", "Koeling", "Rijping", "Carbonatie"]', 0, 'Correct: Extractie'),
  ('ingredienten-cocktails', 'base-spirits', 1, 'Wat is de base spirit?', '["Hoofdalcohol", "Garnering", "Suiker", "IJs"]', 0, 'Correct: Hoofdalcohol'),
  ('ingredienten-cocktails', 'base-spirits', 2, 'Welke spirit is vaak neutraal?', '["Vodka", "Gin", "Rum", "Tequila"]', 0, 'Correct: Vodka'),
  ('ingredienten-cocktails', 'base-spirits', 3, 'Welke spirit is plantaardig?', '["Tequila", "Whisky", "Vodka", "Cognac"]', 0, 'Correct: Tequila'),
  ('ingredienten-cocktails', 'base-spirits', 4, 'Welke spirit is vaak kruidig?', '["Gin", "Rum", "Vodka", "Port"]', 0, 'Correct: Gin'),
  ('ingredienten-cocktails', 'base-spirits', 5, 'De base spirit bepaalt:', '["Stijl", "Glaswerk", "Temperatuur", "Kleur"]', 0, 'Correct: Stijl'),
  ('ingredienten-cocktails', 'likeuren', 1, 'Wat doet likeur?', '["Geeft smaak", "Geeft ijs", "Geeft water", "Geeft glaswerk"]', 0, 'Correct: Geeft smaak'),
  ('ingredienten-cocktails', 'likeuren', 2, 'Likeuren zijn vaak:', '["Gezoet", "Zout", "Droog", "Koolzuurhoudend"]', 0, 'Correct: Gezoet'),
  ('ingredienten-cocktails', 'likeuren', 3, 'Triple Sec is:', '["Likeur", "Whisky", "Rum", "Bier"]', 0, 'Correct: Likeur'),
  ('ingredienten-cocktails', 'likeuren', 4, 'Campari is:', '["Likeur", "Wijn", "Soda", "Water"]', 0, 'Correct: Likeur'),
  ('ingredienten-cocktails', 'likeuren', 5, 'Likeuren zijn vaak:', '["Modifier", "Base spirit", "Ice", "Garnish"]', 0, 'Correct: Modifier'),
  ('ingredienten-cocktails', 'bitters', 1, 'Bitters zijn:', '["Geconcentreerd", "Waterig", "Koolzuurhoudend", "Zoet"]', 0, 'Correct: Geconcentreerd'),
  ('ingredienten-cocktails', 'bitters', 2, 'Hoeveel gebruik je?', '["Klein beetje", "Veel", "Hele fles", "Geen idee"]', 0, 'Correct: Klein beetje'),
  ('ingredienten-cocktails', 'bitters', 3, 'Angostura is:', '["Bitters", "Rum", "Gin", "Likeur"]', 0, 'Correct: Bitters'),
  ('ingredienten-cocktails', 'bitters', 4, 'Bitters geven:', '["Complexiteit", "Meer ijs", "Minder alcohol", "Koolzuur"]', 0, 'Correct: Complexiteit'),
  ('ingredienten-cocktails', 'bitters', 5, 'Bitters zijn vaak:', '["Essentieel", "Overbodig", "Garnish", "Base spirit"]', 0, 'Correct: Essentieel'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 1, 'Citrus geeft:', '["Zuur", "Zoet", "Bitter", "Zout"]', 0, 'Correct: Zuur'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 2, 'Suiker geeft:', '["Zoetheid", "Bitterheid", "Zuur", "Rook"]', 0, 'Correct: Zoetheid'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 3, 'Wat is simple syrup?', '["Suikersiroop", "Bitter", "Likeur", "Soda"]', 0, 'Correct: Suikersiroop'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 4, 'Daiquiri gebruikt:', '["Lime + sugar", "Bier + ijs", "Vermouth", "Wijn"]', 0, 'Correct: Lime + sugar'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 5, 'Balans is:', '["Essentieel", "Optioneel", "Onbelangrijk", "Alleen voor experts"]', 0, 'Correct: Essentieel'),
  ('klassiek-cocktails', 'martini', 1, 'Wat is de basis van Martini?', '["Gin + vermouth", "Rum + lime", "Whisky + bitters", "Vodka + soda"]', 0, 'Correct: Gin + vermouth'),
  ('klassiek-cocktails', 'martini', 2, 'Welke techniek?', '["Stirred", "Shaken", "Built", "Muddled"]', 0, 'Correct: Stirred'),
  ('klassiek-cocktails', 'martini', 3, 'Martini is:', '["Spirit-forward", "Sour", "Highball", "Fizz"]', 0, 'Correct: Spirit-forward'),
  ('klassiek-cocktails', 'martini', 4, 'Dry betekent:', '["Minder vermouth", "Meer suiker", "Meer citrus", "Meer water"]', 0, 'Correct: Minder vermouth'),
  ('klassiek-cocktails', 'martini', 5, 'Martini moet zijn:', '["Koud", "Warm", "Zoet", "Bruisend"]', 0, 'Correct: Koud'),
  ('klassiek-cocktails', 'old-fashioned', 1, 'Welke spirit wordt vaak gebruikt?', '["Whisky", "Gin", "Rum", "Vodka"]', 0, 'Correct: Whisky'),
  ('klassiek-cocktails', 'old-fashioned', 2, 'Wat geeft bitterheid?', '["Bitters", "Syrup", "Citrus", "Soda"]', 0, 'Correct: Bitters'),
  ('klassiek-cocktails', 'old-fashioned', 3, 'Old Fashioned is:', '["Spirit-forward", "Highball", "Fizz", "Sour"]', 0, 'Correct: Spirit-forward'),
  ('klassiek-cocktails', 'old-fashioned', 4, 'Wat geeft zoetheid?', '["Suiker", "Soda", "Ice", "Vermouth"]', 0, 'Correct: Suiker'),
  ('klassiek-cocktails', 'old-fashioned', 5, 'Deze cocktail is:', '["Klassiek", "Modern", "Tropisch", "Layered"]', 0, 'Correct: Klassiek'),
  ('klassiek-cocktails', 'manhattan', 1, 'Welke modifier gebruikt Manhattan?', '["Sweet vermouth", "Lime", "Syrup", "Soda"]', 0, 'Correct: Sweet vermouth'),
  ('klassiek-cocktails', 'manhattan', 2, 'Welke techniek?', '["Stirred", "Shaken", "Built", "Layered"]', 0, 'Correct: Stirred'),
  ('klassiek-cocktails', 'manhattan', 3, 'Wat geeft bitters?', '["Complexiteit", "Zoetheid", "Schuim", "Kleur"]', 0, 'Correct: Complexiteit'),
  ('klassiek-cocktails', 'manhattan', 4, 'Welke garnish?', '["Kers", "Munt", "Olijf", "Citroen"]', 0, 'Correct: Kers'),
  ('klassiek-cocktails', 'manhattan', 5, 'Manhattan is:', '["Klassiek", "Tiki", "Frozen", "Sour"]', 0, 'Correct: Klassiek'),
  ('klassiek-cocktails', 'negroni', 1, 'Wat is de bitter component?', '["Campari", "Gin", "Rum", "Soda"]', 0, 'Correct: Campari'),
  ('klassiek-cocktails', 'negroni', 2, 'Negroni gebruikt:', '["Equal parts", "Veel suiker", "Sap", "Eiwit"]', 0, 'Correct: Equal parts'),
  ('klassiek-cocktails', 'negroni', 3, 'Welke techniek?', '["Stirred", "Shaken", "Built", "Muddled"]', 0, 'Correct: Stirred'),
  ('klassiek-cocktails', 'negroni', 4, 'Negroni is vooral:', '["Bitter", "Zoet", "Zuur", "Romig"]', 0, 'Correct: Bitter'),
  ('klassiek-cocktails', 'negroni', 5, 'Welke spirit?', '["Gin", "Vodka", "Tequila", "Cognac"]', 0, 'Correct: Gin'),
  ('klassiek-cocktails', 'daiquiri', 1, 'Welke spirit?', '["Rum", "Gin", "Whisky", "Vodka"]', 0, 'Correct: Rum'),
  ('klassiek-cocktails', 'daiquiri', 2, 'Wat geeft zuur?', '["Lime", "Sugar", "Bitters", "Soda"]', 0, 'Correct: Lime'),
  ('klassiek-cocktails', 'daiquiri', 3, 'Welke techniek?', '["Shaken", "Stirred", "Built", "Layered"]', 0, 'Correct: Shaken'),
  ('klassiek-cocktails', 'daiquiri', 4, 'Daiquiri is:', '["Sour", "Highball", "Bitter", "Fizz"]', 0, 'Correct: Sour'),
  ('klassiek-cocktails', 'daiquiri', 5, 'Wat bepaalt kwaliteit?', '["Balans", "Kleur", "Glas", "IJs"]', 0, 'Correct: Balans'),
  ('sour-family-cocktails', 'whiskey-sour', 1, 'Welke spirit?', '["Whisky", "Gin", "Vodka", "Rum"]', 0, 'Correct: Whisky'),
  ('sour-family-cocktails', 'whiskey-sour', 2, 'Wat geeft zuur?', '["Citroen", "Sugar", "Bitters", "Soda"]', 0, 'Correct: Citroen'),
  ('sour-family-cocktails', 'whiskey-sour', 3, 'Wat doet eiwit?', '["Textuur", "Bitterheid", "Alcohol", "Koolzuur"]', 0, 'Correct: Textuur'),
  ('sour-family-cocktails', 'whiskey-sour', 4, 'Welke techniek?', '["Shaken", "Stirred", "Built", "Layered"]', 0, 'Correct: Shaken'),
  ('sour-family-cocktails', 'whiskey-sour', 5, 'Whiskey Sour is:', '["Sour family", "Highball", "Bitter family", "Fizz"]', 0, 'Correct: Sour family'),
  ('sour-family-cocktails', 'margarita', 1, 'Welke spirit?', '["Tequila", "Gin", "Rum", "Vodka"]', 0, 'Correct: Tequila'),
  ('sour-family-cocktails', 'margarita', 2, 'Wat is de modifier?', '["Triple Sec", "Vermouth", "Soda", "Port"]', 0, 'Correct: Triple Sec'),
  ('sour-family-cocktails', 'margarita', 3, 'Welke citrus?', '["Lime", "Lemon", "Orange", "Grapefruit"]', 0, 'Correct: Lime'),
  ('sour-family-cocktails', 'margarita', 4, 'Margarita behoort tot:', '["Sour family", "Highball", "Bitter family", "Fizz"]', 0, 'Correct: Sour family'),
  ('sour-family-cocktails', 'margarita', 5, 'Wat geeft vaak extra contrast?', '["Zout randje", "Munt", "Olijf", "Kers"]', 0, 'Correct: Zout randje'),
  ('sour-family-cocktails', 'sidecar', 1, 'Welke spirit?', '["Cognac", "Whisky", "Rum", "Vodka"]', 0, 'Correct: Cognac'),
  ('sour-family-cocktails', 'sidecar', 2, 'Welke modifier?', '["Triple Sec", "Vermouth", "Soda", "Campari"]', 0, 'Correct: Triple Sec'),
  ('sour-family-cocktails', 'sidecar', 3, 'Welke citrus?', '["Citroen", "Lime", "Orange", "Apple"]', 0, 'Correct: Citroen'),
  ('sour-family-cocktails', 'sidecar', 4, 'Sidecar is:', '["Sour family", "Highball", "Bitter family", "Fizz"]', 0, 'Correct: Sour family'),
  ('sour-family-cocktails', 'sidecar', 5, 'Cognac geeft:', '["Diepte", "Koolzuur", "Bitterheid", "Schuim"]', 0, 'Correct: Diepte'),
  ('sour-family-cocktails', 'white-lady', 1, 'Welke spirit?', '["Gin", "Cognac", "Whisky", "Rum"]', 0, 'Correct: Gin'),
  ('sour-family-cocktails', 'white-lady', 2, 'Welke modifier?', '["Triple Sec", "Vermouth", "Bitters", "Soda"]', 0, 'Correct: Triple Sec'),
  ('sour-family-cocktails', 'white-lady', 3, 'White Lady is:', '["Sour family", "Bitter family", "Highball", "Fizz"]', 0, 'Correct: Sour family'),
  ('sour-family-cocktails', 'white-lady', 4, 'Gin geeft:', '["Botanicals", "Hout", "Zoetheid", "Schuim"]', 0, 'Correct: Botanicals'),
  ('sour-family-cocktails', 'white-lady', 5, 'White Lady is vaak:', '["Elegant", "Zwaar", "Zoet", "Bruisend"]', 0, 'Correct: Elegant'),
  ('sour-family-cocktails', 'pisco-sour', 1, 'Welke spirit?', '["Pisco", "Rum", "Gin", "Vodka"]', 0, 'Correct: Pisco'),
  ('sour-family-cocktails', 'pisco-sour', 2, 'Wat geeft schuim?', '["Eiwit", "Soda", "Syrup", "Vermouth"]', 0, 'Correct: Eiwit'),
  ('sour-family-cocktails', 'pisco-sour', 3, 'Wat ligt vaak bovenop?', '["Bitters", "Zout", "Munt", "Kers"]', 0, 'Correct: Bitters'),
  ('sour-family-cocktails', 'pisco-sour', 4, 'Pisco Sour is:', '["Sour family", "Highball", "Bitter family", "Fizz"]', 0, 'Correct: Sour family'),
  ('sour-family-cocktails', 'pisco-sour', 5, 'Pisco geeft:', '["Aroma", "Koolzuur", "Zoetheid", "Bitterheid"]', 0, 'Correct: Aroma'),
  ('highballs-cocktails', 'mojito', 1, 'Welke spirit?', '["Rum", "Gin", "Vodka", "Tequila"]', 0, 'Correct: Rum'),
  ('highballs-cocktails', 'mojito', 2, 'Wat geeft bruis?', '["Soda", "Syrup", "Bitters", "Vermouth"]', 0, 'Correct: Soda'),
  ('highballs-cocktails', 'mojito', 3, 'Welke kruiden?', '["Mint", "Basilicum", "Tijm", "Rozemarijn"]', 0, 'Correct: Mint'),
  ('highballs-cocktails', 'mojito', 4, 'Welke techniek hoort erbij?', '["Muddling", "Stirred", "Layering", "Blending"]', 0, 'Correct: Muddling'),
  ('highballs-cocktails', 'mojito', 5, 'Mojito is:', '["Highball", "Sour", "Bitter", "Martini"]', 0, 'Correct: Highball'),
  ('highballs-cocktails', 'tom-collins', 1, 'Welke spirit?', '["Gin", "Rum", "Whisky", "Tequila"]', 0, 'Correct: Gin'),
  ('highballs-cocktails', 'tom-collins', 2, 'Welke citrus?', '["Lemon", "Lime", "Orange", "Grapefruit"]', 0, 'Correct: Lemon'),
  ('highballs-cocktails', 'tom-collins', 3, 'Wat maakt hem langer?', '["Soda", "Bitters", "Vermouth", "Eiwit"]', 0, 'Correct: Soda'),
  ('highballs-cocktails', 'tom-collins', 4, 'Tom Collins is:', '["Longdrink", "Martini", "Bitter cocktail", "Layered"]', 0, 'Correct: Longdrink'),
  ('highballs-cocktails', 'tom-collins', 5, 'Collins is gebaseerd op:', '["Sour structuur", "Bitter structuur", "Martini structuur", "Punch structuur"]', 0, 'Correct: Sour structuur'),
  ('highballs-cocktails', 'moscow-mule', 1, 'Welke spirit?', '["Vodka", "Rum", "Gin", "Whisky"]', 0, 'Correct: Vodka'),
  ('highballs-cocktails', 'moscow-mule', 2, 'Wat geeft pit?', '["Ginger beer", "Syrup", "Bitters", "Vermouth"]', 0, 'Correct: Ginger beer'),
  ('highballs-cocktails', 'moscow-mule', 3, 'Welke citrus?', '["Lime", "Lemon", "Orange", "Apple"]', 0, 'Correct: Lime'),
  ('highballs-cocktails', 'moscow-mule', 4, 'Moscow Mule is:', '["Highball", "Sour", "Martini", "Bitter"]', 0, 'Correct: Highball'),
  ('highballs-cocktails', 'moscow-mule', 5, 'Klassiek geserveerd in:', '["Copper mug", "Coupe", "Martini glas", "Rocks glas"]', 0, 'Correct: Copper mug'),
  ('highballs-cocktails', 'dark-n-stormy', 1, 'Welke spirit?', '["Dark rum", "Vodka", "Gin", "Whisky"]', 0, 'Correct: Dark rum'),
  ('highballs-cocktails', 'dark-n-stormy', 2, 'Wat blijft centraal?', '["Ginger beer", "Vermouth", "Syrup", "Port"]', 0, 'Correct: Ginger beer'),
  ('highballs-cocktails', 'dark-n-stormy', 3, 'Dark ’n Stormy komt uit:', '["Bermuda", "Cuba", "Mexico", "Frankrijk"]', 0, 'Correct: Bermuda'),
  ('highballs-cocktails', 'dark-n-stormy', 4, 'Wat geeft rum extra?', '["Diepte", "Minder smaak", "Minder alcohol", "Minder body"]', 0, 'Correct: Diepte'),
  ('highballs-cocktails', 'dark-n-stormy', 5, 'Dit is:', '["Highball", "Martini", "Fizz", "Layered"]', 0, 'Correct: Highball'),
  ('highballs-cocktails', 'paloma', 1, 'Welke spirit?', '["Tequila", "Vodka", "Rum", "Whisky"]', 0, 'Correct: Tequila'),
  ('highballs-cocktails', 'paloma', 2, 'Welke soda?', '["Grapefruit", "Lemon", "Cola", "Ginger"]', 0, 'Correct: Grapefruit'),
  ('highballs-cocktails', 'paloma', 3, 'Paloma is:', '["Highball", "Sour", "Martini", "Layered"]', 0, 'Correct: Highball'),
  ('highballs-cocktails', 'paloma', 4, 'Welke smaak valt op?', '["Bitter-fris", "Zoet-zwaar", "Romig", "Hartig"]', 0, 'Correct: Bitter-fris'),
  ('highballs-cocktails', 'paloma', 5, 'In welk land is Paloma groot?', '["Mexico", "Cuba", "Italië", "Peru"]', 0, 'Correct: Mexico'),
  ('service-cocktails', 'glaswerk', 1, 'Waar serveer je vaak een Martini in?', '["Martini glas", "Highball", "Rocks", "Collins"]', 0, 'Correct: Martini glas'),
  ('service-cocktails', 'glaswerk', 2, 'Waar serveer je Mojito in?', '["Highball", "Coupe", "Martini glas", "Rocks"]', 0, 'Correct: Highball'),
  ('service-cocktails', 'glaswerk', 3, 'Rocks glas wordt vaak gebruikt voor:', '["Old Fashioned", "Daiquiri", "Collins", "Paloma"]', 0, 'Correct: Old Fashioned'),
  ('service-cocktails', 'glaswerk', 4, 'Glas beïnvloedt:', '["Aroma", "Alcoholpercentage", "Kleur", "Fermentatie"]', 0, 'Correct: Aroma'),
  ('service-cocktails', 'glaswerk', 5, 'Goede glaskeuze is:', '["Belangrijk", "Onbelangrijk", "Optioneel", "Decoratief"]', 0, 'Correct: Belangrijk'),
  ('service-cocktails', 'ijsgebruik', 1, 'Wat bepaalt ijs?', '["Verdunning", "Alcoholpercentage", "Kleur", "Bitterheid"]', 0, 'Correct: Verdunning'),
  ('service-cocktails', 'ijsgebruik', 2, 'Wat smelt sneller?', '["Crushed ice", "Groot blok", "Geen ijs", "Steen"]', 0, 'Correct: Crushed ice'),
  ('service-cocktails', 'ijsgebruik', 3, 'Groot ijs geeft:', '["Minder snelle verdunning", "Meer suiker", "Meer alcohol", "Meer bitterheid"]', 0, 'Correct: Minder snelle verdunning'),
  ('service-cocktails', 'ijsgebruik', 4, 'Verdunning is:', '["Onderdeel van balans", "Altijd fout", "Onbelangrijk", "Vermijdbaar"]', 0, 'Correct: Onderdeel van balans'),
  ('service-cocktails', 'ijsgebruik', 5, 'Beginners gebruiken vaak:', '["Te weinig ijs", "Te veel suiker", "Te veel glaswerk", "Geen garnish"]', 0, 'Correct: Te weinig ijs'),
  ('service-cocktails', 'garnishes', 1, 'Garnish is:', '["Functioneel", "Alleen decoratie", "Overbodig", "Optioneel"]', 0, 'Correct: Functioneel'),
  ('service-cocktails', 'garnishes', 2, 'Wat beïnvloedt garnish?', '["Aroma", "Alcoholpercentage", "Rijping", "Koolzuur"]', 0, 'Correct: Aroma'),
  ('service-cocktails', 'garnishes', 3, 'Welke garnish hoort vaak bij Martini?', '["Olive", "Mint", "Cherry", "Pineapple"]', 0, 'Correct: Olive'),
  ('service-cocktails', 'garnishes', 4, 'Mint wordt vaak gebruikt bij:', '["Mojito", "Manhattan", "Martini", "Negroni"]', 0, 'Correct: Mojito'),
  ('service-cocktails', 'garnishes', 5, 'Goede garnish is:', '["Ondersteunend", "Overdreven", "Onlogisch", "Random"]', 0, 'Correct: Ondersteunend'),
  ('service-cocktails', 'serveertechniek', 1, 'Wat is cruciaal?', '["Timing", "Leeftijd", "Muziek", "Licht"]', 0, 'Correct: Timing'),
  ('service-cocktails', 'serveertechniek', 2, 'Wat verlies je bij wachten?', '["Temperatuur", "Alcohol", "Glas", "Kleur"]', 0, 'Correct: Temperatuur'),
  ('service-cocktails', 'serveertechniek', 3, 'Service is onderdeel van:', '["Product", "Decoratie", "Muziek", "Marketing"]', 0, 'Correct: Product'),
  ('service-cocktails', 'serveertechniek', 4, 'Wat helpt kwaliteit?', '["Voorbereiding", "Haast", "Chaos", "Wachten"]', 0, 'Correct: Voorbereiding'),
  ('service-cocktails', 'serveertechniek', 5, 'Hospitality betekent:', '["Beleving", "Snelheid", "Koeling", "Bitterheid"]', 0, 'Correct: Beleving'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 1, 'Wat is het doel van aperitief?', '["Eetlust openen", "Dessert vervangen", "Slapen", "Opwarmen"]', 0, 'Correct: Eetlust openen'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 2, 'Welke eigenschap werkt goed?', '["Bitterheid", "Extreme zoetheid", "Melkachtig", "Warm"]', 0, 'Correct: Bitterheid'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 3, 'Welke cocktail is aperitief?', '["Negroni", "White Russian", "Irish Coffee", "Mudslide"]', 0, 'Correct: Negroni'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 4, 'Wat stimuleert bitter?', '["Speekselproductie", "Alcoholproductie", "Zoetheid", "Warmte"]', 0, 'Correct: Speekselproductie'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 5, 'Aperitief is meestal:', '["Droog/fris", "Zoet/zwaar", "Romig", "Heet"]', 0, 'Correct: Droog/fris'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 1, 'Wat snijdt door vet?', '["Zuur", "Zoet", "Zout", "Warmte"]', 0, 'Correct: Zuur'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 2, 'Wat helpt bij spice?', '["Zoetheid", "Bitterheid", "Hout", "Tannine"]', 0, 'Correct: Zoetheid'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 3, 'Wat reinigt gehemelte?', '["Carbonatie", "Suiker", "Room", "Hout"]', 0, 'Correct: Carbonatie'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 4, 'Martini past goed bij:', '["Oesters", "Chocolade", "Curry", "Burger"]', 0, 'Correct: Oesters'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 5, 'Cocktailpairing werkt met:', '["Structuur", "Alleen alcohol", "Alleen zoet", "Alleen bitter"]', 0, 'Correct: Structuur'),
  ('pairing-cocktails', 'cocktails-als-digestief', 1, 'Digestief is bedoeld voor:', '["Na de maaltijd", "Voor ontbijt", "Tijdens lunch", "Voor sport"]', 0, 'Correct: Na de maaltijd'),
  ('pairing-cocktails', 'cocktails-als-digestief', 2, 'Digestiefcocktails zijn vaak:', '["Bitter/rijk", "Licht/fris", "Zuur/strak", "Bruisend/licht"]', 0, 'Correct: Bitter/rijk'),
  ('pairing-cocktails', 'cocktails-als-digestief', 3, 'Welke past goed?', '["Old Fashioned", "Mojito", "Tom Collins", "Paloma"]', 0, 'Correct: Old Fashioned'),
  ('pairing-cocktails', 'cocktails-als-digestief', 4, 'Na eten mag meer:', '["Complexiteit", "Water", "Koolzuur", "Lichtheid"]', 0, 'Correct: Complexiteit'),
  ('pairing-cocktails', 'cocktails-als-digestief', 5, 'Digestief draait vaak om:', '["Afsluiting", "Opening", "Hydratatie", "Energie"]', 0, 'Correct: Afsluiting'),
  ('examen-cocktails', 'spirit-blind-herkennen', 1, 'Welke spirit is vaak neutraal?', '["Vodka", "Gin", "Rum", "Whisky"]', 0, 'Correct: Vodka'),
  ('examen-cocktails', 'spirit-blind-herkennen', 2, 'Welke spirit herken je vaak aan botanicals?', '["Gin", "Vodka", "Tequila", "Rum"]', 0, 'Correct: Gin'),
  ('examen-cocktails', 'spirit-blind-herkennen', 3, 'Welke spirit is agave-based?', '["Tequila", "Rum", "Whisky", "Vodka"]', 0, 'Correct: Tequila'),
  ('examen-cocktails', 'spirit-blind-herkennen', 4, 'Rum komt vaak van:', '["Suikerriet", "Druiven", "Granen", "Appels"]', 0, 'Correct: Suikerriet'),
  ('examen-cocktails', 'spirit-blind-herkennen', 5, 'Blindproeven begint met:', '["Aroma", "Glaswerk", "Kleur", "Garnish"]', 0, 'Correct: Aroma'),
  ('examen-cocktails', 'cocktailstructuren-blind', 1, 'Wat is vaak spirit-forward?', '["Martini", "Mojito", "Daiquiri", "Paloma"]', 0, 'Correct: Martini'),
  ('examen-cocktails', 'cocktailstructuren-blind', 2, 'Wat is sour?', '["Daiquiri", "Negroni", "Old Fashioned", "Manhattan"]', 0, 'Correct: Daiquiri'),
  ('examen-cocktails', 'cocktailstructuren-blind', 3, 'Wat is bitter?', '["Negroni", "Mojito", "Collins", "Margarita"]', 0, 'Correct: Negroni'),
  ('examen-cocktails', 'cocktailstructuren-blind', 4, 'Wat is highball?', '["Paloma", "Sidecar", "White Lady", "Martini"]', 0, 'Correct: Paloma'),
  ('examen-cocktails', 'cocktailstructuren-blind', 5, 'Structuur is:', '["Belangrijker dan exacte ingrediënten", "Minder belangrijk", "Overbodig", "Alleen voor experts"]', 0, 'Correct: Belangrijker dan exacte ingrediënten')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
