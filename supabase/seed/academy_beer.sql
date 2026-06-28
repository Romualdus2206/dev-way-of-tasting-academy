-- Bier track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'beer';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'beer',
  'Bier',
  'Leer bier van Fundament tot Master: productie, proeven, stijlen, service, pairing en examen.',
  3,
  now()
);

with t as (select id from academy.tracks where slug = 'beer')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-beer', 'Fundament', 1),
  ('explorer', 'productie-beer', 'Productie', 2),
  ('explorer', 'proeven-beer', 'Proeven', 3),
  ('specialist', 'klassieke-stijlen-beer', 'Klassieke stijlen', 4),
  ('specialist', 'belgische-stijlen-beer', 'Belgische stijlen', 5),
  ('specialist', 'moderne-stijlen-beer', 'Moderne stijlen', 6),
  ('master', 'service-beer', 'Service', 7),
  ('master', 'pairing-beer', 'Pairing & Gastronomie', 8),
  ('master', 'examen-beer', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'intro-beer'
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
    'wat-is-bier',
    'Wat is bier?',
    'Na deze les kun jij uitleggen wat bier is, hoe het wordt gemaakt en waarom bier wereldwijd zo belangrijk is.
',
    'Bier is een alcoholische drank die wordt gemaakt van vier basisingrediënten: water, mout, hop en gist.

Door vergisting worden suikers omgezet in alcohol en koolzuur.

Bier is één van de oudste door mensen gemaakte dranken en wordt wereldwijd in duizenden stijlen geproduceerd.

De basis is altijd vergelijkbaar, maar kleine verschillen in ingrediënten en techniek zorgen voor enorme variatie.

Bier kan licht, donker, bitter, zoet, fris, zuur of zwaar zijn.

Dat maakt bier één van de meest veelzijdige dranken ter wereld.
',
    '- bier
- fermentatie
- alcohol
- CO2
- bierstijl
',
    'De oudste sporen van bierproductie zijn meer dan 7000 jaar oud.
',
    '- Bier is een gefermenteerde drank
- Bier bestaat uit vier basisingrediënten
- Gisting maakt alcohol en CO2
- Bier kent enorme stijlvariatie
- Bier is cultureel wereldwijd belangrijk
',
    '### Opdracht

Pak een bierfles of blik en bekijk het etiket.

### Checklist

- Ik heb het alcoholpercentage gevonden
- Ik heb de bierstijl gevonden
- Ik heb de ingrediënten bekeken

### Reflectievraag

Welke bierstijl heb jij gekozen?
',
    8,
    1
  ),
  (
    'vier-basisingredienten',
    'De vier basisingrediënten',
    'Na deze les kun jij uitleggen welke vier ingrediënten bier vormen en wat hun functie is.
',
    'Water vormt meestal meer dan 90% van bier.

Mout levert de suikers die later alcohol worden.

Hop zorgt voor bitterheid, aroma en stabiliteit.

Gist zet suiker om in alcohol en ontwikkelt aroma’s.

De balans tussen deze vier bepaalt de stijl.

Zelfs kleine aanpassingen kunnen grote smaakverschillen geven.
',
    '- water
- mout
- hop
- gist
- ingrediënten
',
    'De waterkwaliteit bepaalt historisch vaak welke bierstijl in een regio ontstond.
',
    '- Water is de basis
- Mout levert suiker
- Hop geeft bitterheid
- Gist maakt alcohol
',
    '### Opdracht

Bekijk drie verschillende bieretiketten.

### Checklist

- Ik heb ingrediënten vergeleken
- Ik heb verschillen gezien
- Ik herken de basiscomponenten

### Reflectievraag

Welke ingrediënten vielen extra op?
',
    8,
    2
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting uitgelegd',
    'Na deze les begrijp jij hoe alcohol ontstaat in bier.
',
    'Gisting is het proces waarbij gist suikers opeet.

Tijdens dat proces ontstaan alcohol, CO2 en aroma’s.

Dit gebeurt in afgesloten tanks.

Temperatuur is hierbij cruciaal.

Te warm geeft andere aroma’s dan te koud.

De gist bepaalt voor een groot deel het karakter van het bier.
',
    '- gisting
- fermentatie
- alcohol
- CO2
- temperatuur
',
    'Veel fruitige aroma’s in bier komen direct uit de gist.
',
    '- Gist eet suikers
- Alcohol ontstaat door gisting
- CO2 is een bijproduct
- Temperatuur beïnvloedt smaak
',
    '### Opdracht

Vergelijk twee bieren en let op fruitigheid.

### Checklist

- Ik heb aroma’s vergeleken
- Ik heb fruitigheid herkend
- Ik heb verschillen benoemd

### Reflectievraag

Welk bier leek gistiger?
',
    8,
    3
  ),
  (
    'ondergisting-vs-bovengisting',
    'Ondergisting vs bovengisting',
    'Na deze les kun jij het verschil uitleggen tussen ondergistende en bovengistende bieren.
',
    'Ondergisting gebeurt bij lagere temperaturen.

Dit levert vaak frisse, strakke en schone smaken op.

Pils is het bekendste voorbeeld.

Bovengisting gebeurt warmer.

Dit geeft vaak fruitigere, kruidigere en complexere aroma’s.

Veel Belgische en ambachtelijke stijlen gebruiken bovengisting.
',
    '- ondergisting
- bovengisting
- pils
- ale
- lager
',
    'Meer dan 80% van al het bier wereldwijd is ondergistend.
',
    '- Ondergisting = koud en strak
- Bovengisting = warmer en aromatischer
- Pils is ondergistend
- Tripel is bovengistend
',
    '### Opdracht

Vergelijk een pils met een blond bier.

### Checklist

- Ik heb geur vergeleken
- Ik heb smaak vergeleken
- Ik herken verschillen

### Reflectievraag

Welke stijl vond jij expressiever?
',
    8,
    4
  ),
  (
    'biercategorieen',
    'Belangrijkste biercategorieën',
    'Na deze les herken jij de belangrijkste biercategorieën.
',
    'Bier wordt vaak verdeeld in hoofdgroepen.

Lager is fris en strak.

Ale is fruitiger en voller.

Tarwebier is vaak zacht en fris.

Donkere bieren zoals stout en porter zijn rijker en geroosterder.

IPA draait sterk om hop.

Deze basisgroepen vormen de fundering voor alle latere lessen.
',
    '- lager
- ale
- wheat
- stout
- IPA

# Way of Tasting Academy',
    'IPA is wereldwijd één van de snelst groeiende biercategorieën.
',
    '- Lager = fris
- Ale = fruitig
- Wheat = zacht
- Dark = geroosterd
- IPA = hopgedreven
',
    '### Opdracht

Maak een lijst van vijf bieren die je kent.

### Checklist

- Ik heb vijf bieren genoteerd
- Ik heb stijlen bepaald
- Ik heb categorieën gekoppeld

### Reflectievraag

Welke categorie drink jij het meest?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'productie-beer'
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
    'mouten-uitgelegd',
    'Mouten uitgelegd',
    'Na deze les kun jij uitleggen wat mout is en waarom het essentieel is voor bier.
',
    'Mout ontstaat door granen — meestal gerst — gecontroleerd te laten kiemen en daarna te drogen.

Tijdens dit proces ontstaan enzymen die later zetmeel kunnen omzetten in suiker.

Die suikers zijn nodig voor alcoholproductie.

De manier van drogen bepaalt ook kleur en smaak.

Licht gedroogde mout geeft frisse tonen.

Donker geroosterde mout geeft smaken zoals karamel, koffie en chocolade.

Mout is dus de basis van body, kleur en alcohol.
',
    '- mout
- gerst
- kleur
- suikers
- body
',
    'Bijna alle bierkleur komt uit mout.
',
    '- Mout is gekiemd graan
- Mout levert suikers
- Mout bepaalt kleur
- Mout beïnvloedt smaak
',
    '### Opdracht

Bekijk drie verschillende bieren en vergelijk kleur.

### Checklist

- Ik heb lichte bieren bekeken
- Ik heb donkere bieren bekeken
- Ik heb kleurverschillen herkend

### Reflectievraag

Welke moutstijl lijkt jou het interessantst?
',
    8,
    1
  ),
  (
    'maischen',
    'Maischen',
    'Na deze les begrijp jij wat maischen is en waarom het belangrijk is.
',
    'Maischen is het mengen van gemalen mout met warm water.

Tijdens dit proces zetten enzymen zetmeel om in vergistbare suikers.

Temperatuur speelt hierbij een grote rol.

Lagere temperaturen zorgen vaak voor drogere bieren.

Hogere temperaturen geven vaak vollere bieren.

Na het maischen ontstaat wort: de zoete vloeistof waar bier van gemaakt wordt.
',
    '- maischen
- wort
- enzymen
- temperatuur
- suiker
',
    'Kleine temperatuurverschillen kunnen grote smaakverschillen veroorzaken.
',
    '- Maischen zet zetmeel om
- Water en mout worden gemengd
- Temperatuur is cruciaal
- Wort ontstaat
',
    '### Opdracht

Zoek op hoe een brouwerij maischt.

### Checklist

- Ik heb het proces bekeken
- Ik begrijp de rol van temperatuur
- Ik weet wat wort is

### Reflectievraag

Waarom zou temperatuur zo belangrijk zijn?
',
    8,
    2
  ),
  (
    'hop-en-bitterheid',
    'Hop en bitterheid',
    'Na deze les begrijp jij hoe hop bier beïnvloedt.
',
    'Hop is de plant die bier bitter maakt.

Hop zorgt voor balans tegenover de zoetheid van mout.

Daarnaast geeft hop aroma’s zoals citrus, bloemen, hars en tropisch fruit.

De kookduur bepaalt hoeveel bitterheid wordt afgegeven.

Vroege hopgiften geven vooral bitterheid.

Late hopgiften geven vooral aroma.

Dit wordt vaak gemeten in IBU.
',
    '- hop
- IBU
- bitterheid
- aroma
- balans
',
    'IPA’s bevatten vaak veel meer hop dan pils.
',
    '- Hop geeft bitterheid
- Hop geeft aroma
- Timing is belangrijk
- IBU meet bitterheid
',
    '### Opdracht

Vergelijk een pils met een IPA.

### Checklist

- Ik heb bitterheid vergeleken
- Ik heb aroma vergeleken
- Ik herken hopinvloed

### Reflectievraag

Welke hopstijl sprak jou meer aan?
',
    8,
    3
  ),
  (
    'gist-en-aroma',
    'Gist en aromaontwikkeling',
    'Na deze les begrijp jij hoe gist smaak beïnvloedt.
',
    'Gist maakt niet alleen alcohol.

Tijdens fermentatie ontstaan ook esters en fenolen.

Esters geven fruitige aroma’s.

Fenolen geven kruidige of peperige tonen.

Elke gistsoort werkt anders.

Daarom smaken stijlen zo verschillend.

Gist is misschien wel de meest onderschatte smaakmaker in bier.
',
    '- gist
- esters
- fenolen
- aroma
- fermentatie
',
    'Bananenaroma in Weizen komt vooral van gist.
',
    '- Gist maakt alcohol
- Gist maakt aroma
- Esters zijn fruitig
- Fenolen zijn kruidig
',
    '### Opdracht

Proef een Weizen en een Pils.

### Checklist

- Ik heb fruitigheid herkend
- Ik heb verschillen benoemd
- Ik herken gistinvloed

### Reflectievraag

Welke stijl had meer gistkarakter?
',
    8,
    4
  ),
  (
    'lagering-en-rijping',
    'Lagering & rijping',
    'Na deze les begrijp jij waarom bier na fermentatie vaak nog rust krijgt.
',
    'Na de hoofdgisting is bier vaak nog ruw.

Tijdens lagering krijgt bier tijd om smaken te stabiliseren.

Ongewenste aroma’s verdwijnen.

De smaak wordt zachter en ronder.

Bij sommige stijlen duurt dit weken.

Bij zware bieren soms maanden.

Lagering zorgt vaak voor balans en drinkbaarheid.
',
    '- lagering
- rijping
- stabilisatie
- balans
- bewaren

# Way of Tasting Academy',
    'Het woord “lager” komt van het Duitse “lagern” — bewaren.
',
    '- Lagering volgt op gisting
- Smaken stabiliseren
- Bier wordt zachter
- Balans verbetert
',
    '### Opdracht

Zoek een bier op dat gerijpt is.

### Checklist

- Ik heb de rijpingstijd gevonden
- Ik heb de stijl bekeken
- Ik begrijp waarom het gerijpt werd

### Reflectievraag

Denk jij dat rijping bier beter maakt?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'proeven-beer'
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
    'hoe-proef-je-bier',
    'Hoe proef je bier?',
    'Na deze les kun jij bier systematisch analyseren zoals professionals dat doen.
',
    'Bier proeven doe je in vier stappen:

1. Kijken  
2. Ruiken  
3. Proeven  
4. Evalueren

Bij kijken let je op kleur, helderheid en schuim.

Bij ruiken zoek je aroma’s.

Bij proeven let je op smaak, body, bitterheid, zoetheid en balans.

De afdronk vertelt veel over kwaliteit.

Systematisch proeven helpt je stijlen beter herkennen.
',
    '- proeven
- kijken
- ruiken
- smaak
- evaluatie
',
    'Veel smaakbeleving begint al vóór de eerste slok.
',
    '- Bier proeven is systematisch
- Kijken komt eerst
- Ruiken bepaalt veel
- Smaak en balans zijn essentieel
',
    '### Opdracht

Pak een bier en proef het volgens de vier stappen.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb geëvalueerd

### Reflectievraag

Welke stap gaf jou de meeste informatie?
',
    8,
    1
  ),
  (
    'schuim-analyseren',
    'Schuim analyseren',
    'Na deze les begrijp jij wat schuim vertelt over bier.
',
    'Schuim is belangrijk voor presentatie en aroma.

Goed schuim beschermt bier tegen snelle oxidatie.

Bij analyse let je op:

- schuimhoogte
- stabiliteit
- textuur
- kleur

Romig schuim wijst vaak op kwaliteit.

Snel verdwijnend schuim kan duiden op fouten of vervuiling.

Verschillende stijlen hebben verschillende schuimprofielen.
',
    '- schuim
- stabiliteit
- textuur
- presentatie
- oxidatie
',
    'Vet in een glas kan schuim direct afbreken.
',
    '- Schuim beschermt aroma
- Stabiliteit is belangrijk
- Textuur zegt veel
- Glasreinheid beïnvloedt schuim
',
    '### Opdracht

Schenk twee verschillende bieren.

### Checklist

- Ik heb schuimhoogte vergeleken
- Ik heb stabiliteit bekeken
- Ik heb structuur beoordeeld

### Reflectievraag

Welk bier had het beste schuim?
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les kun jij basisaroma’s in bier herkennen.
',
    'Aroma’s komen vooral van mout, hop en gist.

Mout kan geven:

- brood
- karamel
- chocolade

Hop kan geven:

- citrus
- bloemen
- hars

Gist kan geven:

- banaan
- kruidnagel
- peper

Door vaker te ruiken ontwikkel je sneller herkenning.
',
    '- aroma
- mout
- hop
- gist
- geur
',
    'Je neus kan duizenden geurstoffen onderscheiden.
',
    '- Mout geeft warme aroma’s
- Hop geeft frisse aroma’s
- Gist geeft fermentatie-aroma’s
- Oefening vergroot herkenning
',
    '### Opdracht

Ruik aan drie verschillende bierstijlen.

### Checklist

- Ik heb moutaroma’s gezocht
- Ik heb hoparoma’s gezocht
- Ik heb gistaroma’s gezocht

### Reflectievraag

Welke aroma’s herkende jij direct?
',
    8,
    3
  ),
  (
    'structuur-en-mondgevoel',
    'Structuur en mondgevoel',
    'Na deze les kun jij body, koolzuur en textuur in bier herkennen.
',
    'Mondgevoel is hoe bier fysiek aanvoelt.

Belangrijke onderdelen:

- body
- koolzuur
- viscositeit
- alcoholwarmte

Een pils voelt vaak licht.

Een stout voelt vaak vol en romig.

Veel koolzuur maakt bier levendiger.

Alcohol kan warmte geven.

Mondgevoel bepaalt sterk hoe bier ervaren wordt.
',
    '- body
- mondgevoel
- koolzuur
- viscositeit
- alcoholwarmte
',
    'Body wordt vaak beïnvloed door maischschema en restsuiker.
',
    '- Mondgevoel is fysiek
- Body varieert per stijl
- Koolzuur beïnvloedt frisheid
- Alcohol geeft warmte
',
    '### Opdracht

Vergelijk een pils met een stout.

### Checklist

- Ik heb body vergeleken
- Ik heb koolzuur vergeleken
- Ik heb warmte beoordeeld

### Reflectievraag

Welk bier voelde voller?
',
    8,
    4
  ),
  (
    'mini-toets-bier',
    'Mini-toets bier',
    'Na deze les toets jij jouw kennis van de eerste drie modules.
',
    'In deze toets combineer je:

- fundament
- productie
- proeven

Dit is jouw eerste echte integratiemoment.

Je laat zien dat je begrijpt:

- wat bier is
- hoe bier gemaakt wordt
- hoe bier geanalyseerd wordt
',
    '- integratie
- bieranalyse
- fundament
- productie
- proeven

# Way of Tasting Academy',
    '',
    '- Fundament + Productie + Proeven
- Eerste integratie
- Basis voor specialistniveau
',
    '### Opdracht

Proef één bier volledig en schrijf een korte analyse.

### Checklist

- Uiterlijk beschreven
- Aroma benoemd
- Mondgevoel benoemd
- Balans beoordeeld

### Reflectievraag

Waar voel jij nog onzekerheid?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klassieke-stijlen-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'klassieke-stijlen-beer'
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
    'pilsner',
    'Pilsner',
    'Na deze les kun jij uitleggen wat een Pilsner is en hoe je deze stijl herkent.
',
    'Pilsner is de meest gedronken bierstijl ter wereld.

De stijl ontstond in 1842 in :contentReference[oaicite:1]{index=1}.

Pils is ondergistend en wordt koud vergist.

Daardoor ontstaat een strak, schoon en fris smaakprofiel.

Typische kenmerken:

- licht goudgeel
- hoge doordrinkbaarheid
- frisse bitterheid
- droge afdronk

Pils lijkt eenvoudig, maar fouten vallen direct op.

Daarom is het technisch één van de moeilijkste stijlen om perfect te brouwen.
',
    '- pilsner
- lager
- bitterheid
- frisheid
- afdronk
',
    'Vrijwel alle moderne lagers zijn afgeleid van Pilsner.
',
    '- Pils is ondergistend
- Fris en strak
- Hoge drinkbaarheid
- Technisch moeilijke stijl
',
    '### Opdracht

Proef twee verschillende pilseners.

### Checklist

- Ik heb bitterheid vergeleken
- Ik heb frisheid beoordeeld
- Ik heb afdronk vergeleken

### Reflectievraag

Welke pils vond jij het meest “clean”?
',
    8,
    1
  ),
  (
    'blond',
    'Blond',
    'Na deze les herken jij Blond bier.
',
    'Blond bier is meestal goudkleurig en bovengistend.

Het heeft vaak:

- fruitigheid
- lichte kruidigheid
- zachte moutigheid

Blond is toegankelijk, maar vaak rijker dan pils.

Veel Belgische blond bieren combineren frisheid met complexiteit.

Alcohol ligt vaak tussen 6% en 8%.
',
    '- blond
- fruitig
- kruidig
- bovengisting
- complexiteit
',
    'Veel Blond bieren lijken licht, maar kunnen behoorlijk krachtig zijn.
',
    '- Blond is bovengistend
- Fruitig en zacht kruidig
- Vaak hoger in alcohol
- Meer complexiteit dan pils
',
    '### Opdracht

Vergelijk een Blond met een Pils.

### Checklist

- Fruitigheid vergeleken
- Body vergeleken
- Alcoholgevoel beoordeeld

### Reflectievraag

Welke stijl vond jij rijker?
',
    8,
    2
  ),
  (
    'weizen',
    'Weizen',
    'Na deze les kun jij Weizen herkennen.
',
    'Weizen is een Duits tarwebier.

Het bevat veel tarwemout.

Typische aroma’s:

- banaan
- kruidnagel
- lichte citrus

Deze aroma’s komen vooral uit gist.

Weizen is vaak troebel, zacht en fris.

Door hoog koolzuur voelt het levendig aan.
',
    '- weizen
- tarwe
- banaan
- kruidnagel
- gist
',
    'Volgens Duitse wet moet Weizen minimaal 50% tarwe bevatten.
',
    '- Weizen is tarwebier
- Banaan en kruidnagel zijn klassiek
- Troebel en fris
- Hoog koolzuur
',
    '### Opdracht

Proef een Weizen.

### Checklist

- Banaan herkend
- Kruidnagel herkend
- Koolzuur beoordeeld

### Reflectievraag

Welke geur viel het meest op?
',
    8,
    3
  ),
  (
    'witbier',
    'Witbier',
    'Na deze les herken jij Witbier.
',
    'Witbier is een Belgische stijl met ongemoute tarwe.

Vaak worden toegevoegd:

- koriander
- sinaasappelschil

Dit geeft frisse citrusachtige aroma’s.

Witbier is licht, zacht en verfrissend.

Vaak laag in bitterheid.

Perfect voor warm weer.
',
    '- witbier
- koriander
- citrus
- frisheid
- tarwe
',
    ':contentReference[oaicite:2]{index=2} bracht Witbier opnieuw tot leven in de 20e eeuw.
',
    '- Witbier bevat tarwe
- Citrus en koriander zijn typisch
- Licht en fris
- Lage bitterheid
',
    '### Opdracht

Proef een Witbier.

### Checklist

- Citrus herkend
- Kruidigheid herkend
- Frisheid beoordeeld

### Reflectievraag

Vond jij Witbier zachter dan Weizen?
',
    8,
    4
  ),
  (
    'bockbier',
    'Bockbier',
    'Na deze les herken jij Bockbier.
',
    'Bockbier is een moutige, krachtige bierstijl.

Typische kenmerken:

- karamel
- toast
- noten
- brood

Bock is vaak seizoensgebonden.

In Nederland vooral populair in de herfst.

Alcohol is meestal hoger dan pils.

De focus ligt op mout, niet op hop.
',
    '- bockbier
- mout
- karamel
- seizoensbier
- body

# Way of Tasting Academy',
    'De oorsprong van Bock ligt in :contentReference[oaicite:3]{index=3}.
',
    '- Bock is moutgedreven
- Vaak herfstbier
- Rijke smaken
- Hogere alcohol
',
    '### Opdracht

Proef een Bockbier.

### Checklist

- Moutigheid herkend
- Zoetheid beoordeeld
- Body beoordeeld

### Reflectievraag

Past Bock volgens jou beter bij eten?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- belgische-stijlen-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'belgische-stijlen-beer'
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
    'dubbel',
    'Dubbel',
    'Na deze les kun jij een Dubbel herkennen en uitleggen.
',
    'Dubbel is een klassieke Belgische bierstijl.

Het bier is meestal donkerbruin tot kastanjekleurig.

Typische aroma’s:

- karamel
- rozijnen
- gedroogde vijgen
- broodkorst

Dubbel heeft vaak een zachte zoetheid en milde kruidigheid.

Alcohol ligt meestal tussen 6% en 8%.

De stijl draait vooral om mout en gistcomplexiteit.
',
    '- dubbel
- mout
- rozijnen
- karamel
- gist
',
    ':contentReference[oaicite:1]{index=1} speelde een grote rol in de ontwikkeling van Dubbel.
',
    '- Donkere Belgische stijl
- Moutgedreven
- Gedroogd fruit
- Medium tot hoog alcohol
',
    '### Opdracht

Proef een Dubbel.

### Checklist

- Ik herken karamel
- Ik herken gedroogd fruit
- Ik beoordeel de balans

### Reflectievraag

Vind jij Dubbel meer dessertachtig of gastronomisch?
',
    8,
    1
  ),
  (
    'tripel',
    'Tripel',
    'Na deze les herken jij Tripel en begrijp je waarom deze stijl zo iconisch is.
',
    'Tripel is goudkleurig, krachtig en complex.

Het combineert:

- hoge alcohol
- droge afdronk
- fruitigheid
- kruidigheid

Ondanks het hoge alcoholpercentage blijft Tripel vaak elegant.

Typische aroma’s:

- peer
- banaan
- peper
- honing

Tripel is één van de meest complexe klassieke bierstijlen.
',
    '- tripel
- alcohol
- droog
- complexiteit
- fruitigheid
',
    ':contentReference[oaicite:2]{index=2} wordt gezien als de bakermat van de moderne Tripel.
',
    '- Goudkleurig
- Sterk
- Droog
- Complex
',
    '### Opdracht

Proef een Tripel.

### Checklist

- Fruitigheid herkend
- Alcoholwarmte beoordeeld
- Droogheid geanalyseerd

### Reflectievraag

Voelt de alcohol goed geïntegreerd?
',
    8,
    2
  ),
  (
    'quadrupel',
    'Quadrupel',
    'Na deze les herken jij Quadrupel.
',
    'Quadrupel is zwaar, rijk en intens.

De stijl bouwt voort op Dubbel, maar is groter in alles.

Typische kenmerken:

- donkere kleur
- hoge viscositeit
- rijke zoetheid
- gedroogd fruit
- kruiden

Alcohol ligt vaak tussen 9% en 12%.

Quadrupel heeft vaak uitstekend rijpingspotentieel.
',
    '- quadrupel
- intensiteit
- rijping
- alcohol
- body
',
    ':contentReference[oaicite:3]{index=3} gebruikte als eerste officieel de naam Quadrupel.
',
    '- Zwaar en rijk
- Hoge alcohol
- Donker fruit
- Goed rijpbaar
',
    '### Opdracht

Proef een Quadrupel.

### Checklist

- Zoetheid beoordeeld
- Alcoholwarmte herkend
- Body beoordeeld

### Reflectievraag

Voelt Quadrupel als een “sipping beer”?
',
    8,
    3
  ),
  (
    'saison',
    'Saison',
    'Na deze les herken jij Saison.
',
    'Saison ontstond als boerenbier in :contentReference[oaicite:4]{index=4}.

Het werd oorspronkelijk gebrouwen voor seizoensarbeiders.

Saison is droog, kruidig en levendig.

Typische aroma’s:

- peper
- citrus
- kruiden
- lichte funk

De stijl is vaak hoog in koolzuur en zeer verfrissend.

Saison is gastronomisch extreem veelzijdig.
',
    '- saison
- droog
- peper
- koolzuur
- gastronomie
',
    'Saison was historisch vaak laag in alcohol, maar moderne versies zijn vaak sterker.
',
    '- Boerenbier
- Droog
- Kruidig
- Gastronomisch sterk
',
    '### Opdracht

Proef een Saison.

### Checklist

- Droogheid beoordeeld
- Kruidigheid herkend
- Koolzuur geanalyseerd

### Reflectievraag

Zou jij Saison combineren met eten?
',
    8,
    4
  ),
  (
    'abdijbier-vs-trappist',
    'Abdijbier vs Trappist',
    'Na deze les begrijp jij het verschil tussen Abdijbier en Trappist.
',
    'Veel mensen verwarren deze twee.

Trappistbier moet aan strenge voorwaarden voldoen:

- gebrouwen binnen een abdij
- onder toezicht van monniken
- winst voor de gemeenschap

Abdijbier volgt vaak dezelfde traditie, maar wordt commercieel gebrouwen.

Niet elk abdijbier is dus Trappist.

Maar elke Trappist heeft wel abdijwortels.

Kwalitatief kunnen beide uitstekend zijn.
',
    '- abdijbier
- trappist
- authenticiteit
- monniken
- classificatie

# Way of Tasting Academy',
    'De officiële organisatie heet :contentReference[oaicite:5]{index=5}.
',
    '- Trappist is strikt beschermd
- Abdijbier is breder
- Herkomst bepaalt classificatie
- Kwaliteit kan bij beide hoog zijn
',
    '### Opdracht

Zoek twee bieren op: één Trappist en één Abdijbier.

### Checklist

- Herkomst gevonden
- Brouwerij onderzocht
- Verschillen begrepen

### Reflectievraag

Maakt oorsprong voor jou verschil?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- moderne-stijlen-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'moderne-stijlen-beer'
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
    'ipa',
    'IPA',
    'Na deze les herken jij IPA en begrijp je waarom deze stijl zo invloedrijk is.
',
    'IPA staat voor India Pale Ale.

De stijl ontstond in :contentReference[oaicite:1]{index=1}.

Historisch werd extra hop toegevoegd om bier langer houdbaar te maken voor export.

Moderne IPA draait vooral om hoparoma.

Typische aroma’s:

- citrus
- tropisch fruit
- dennen
- hars

IPA is meestal bitterder dan klassieke stijlen.

Binnen craft beer is IPA één van de belangrijkste stijlen.
',
    '- IPA
- hop
- bitterheid
- citrus
- craft
',
    'IPA was de motor achter de wereldwijde craft beer revolutie.
',
    '- IPA is hopgedreven
- Bitter en aromatisch
- Historisch exportbier
- Moderne craft-klassieker
',
    '### Opdracht

Proef een IPA.

### Checklist

- Bitterheid beoordeeld
- Aroma geanalyseerd
- Afdronk beoordeeld

### Reflectievraag

Vond jij de bitterheid prettig of dominant?
',
    8,
    1
  ),
  (
    'neipa',
    'NEIPA',
    'Na deze les herken jij NEIPA en begrijp je het verschil met klassieke IPA.
',
    'NEIPA staat voor New England IPA.

De stijl ontstond in :contentReference[oaicite:2]{index=2}.

NEIPA is troebel, sappig en zacht bitter.

De focus ligt op fruitig hoparoma.

Typische kenmerken:

- mango
- ananas
- perzik
- citrus

Minder bitter dan klassieke IPA.

Vaak voller en zachter in mondgevoel.
',
    '- NEIPA
- troebel
- juicy
- fruitigheid
- soft bitterness
',
    'Troebelheid is hier juist gewenst.
',
    '- Troebel
- Fruitig
- Minder bitter
- Zachter mondgevoel
',
    '### Opdracht

Vergelijk een IPA met een NEIPA.

### Checklist

- Troebelheid vergeleken
- Bitterheid vergeleken
- Fruitigheid vergeleken

### Reflectievraag

Welke stijl vond jij toegankelijker?
',
    8,
    2
  ),
  (
    'porter',
    'Porter',
    'Na deze les herken jij Porter.
',
    'Porter is een klassieke donkere bierstijl uit :contentReference[oaicite:3]{index=3}.

De stijl ontstond in de 18e eeuw.

Porter is donker, maar vaak zachter dan Stout.

Typische aroma’s:

- chocolade
- toast
- karamel
- lichte koffie

Porter heeft vaak medium body en milde roast.
',
    '- porter
- roast
- chocolade
- toast
- body
',
    'Stout is oorspronkelijk een sterkere variant van Porter.
',
    '- Donkere stijl
- Zachter dan stout
- Chocolade en toast
- Historische stijl
',
    '### Opdracht

Proef een Porter.

### Checklist

- Roast beoordeeld
- Body beoordeeld
- Chocoladetonen herkend

### Reflectievraag

Voelde Porter zachter dan verwacht?
',
    8,
    3
  ),
  (
    'stout',
    'Stout',
    'Na deze les herken jij Stout.
',
    'Stout is intens, donker en geroosterd.

Typische smaken:

- koffie
- pure chocolade
- espresso
- geroosterd brood

Stout heeft vaak meer body en intensiteit dan Porter.

Bekende subcategorieën:

- Dry Stout
- Milk Stout
- Imperial Stout

Stout is vaak gastronomisch sterk.
',
    '- stout
- roast
- koffie
- chocolade
- intensiteit
',
    ':contentReference[oaicite:4]{index=4} is wereldwijd het bekendste stoutmerk.
',
    '- Donker en krachtig
- Roastgedreven
- Veel body
- Gastronomisch breed
',
    '### Opdracht

Proef een Stout.

### Checklist

- Roast beoordeeld
- Bitterheid beoordeeld
- Body beoordeeld

### Reflectievraag

Past Stout voor jou beter bij dessert of vlees?
',
    8,
    4
  ),
  (
    'barleywine',
    'Barleywine',
    'Na deze les herken jij Barleywine.
',
    'Barleywine is één van de zwaarste bierstijlen.

Alcohol ligt vaak tussen 9% en 14%.

Ondanks de naam is het bier.

De stijl combineert:

- hoge moutconcentratie
- rijke zoetheid
- oxidatieve tonen
- lange rijping

Typische aroma’s:

- toffee
- gedroogd fruit
- karamel
- noten

Barleywine wordt vaak langzaam gedronken.
',
    '- barleywine
- rijping
- toffee
- alcohol
- complexiteit

# Way of Tasting Academy',
    'Veel Barleywines verbeteren sterk door flesrijping.
',
    '- Zeer krachtig
- Hoog alcohol
- Rijpingspotentieel
- Complex en rijk
',
    '### Opdracht

Zoek een Barleywine op en analyseer het alcoholpercentage.

### Checklist

- Alcohol bekeken
- Smaakprofiel gelezen
- Rijpingsadvies gelezen

### Reflectievraag

Zou jij Barleywine bewaren?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-beer (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'service-beer'
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
    'Na deze les begrijp jij waarom temperatuur cruciaal is bij bier.
',
    'Temperatuur beïnvloedt hoe aroma’s en smaken worden ervaren.

Te koud:

- onderdrukt aroma
- maakt bier vlakker

Te warm:

- benadrukt alcohol
- kan balans verstoren

Algemene richtlijnen:

- Pils: 4–6°C
- Witbier: 5–7°C
- IPA: 6–8°C
- Tripel: 8–10°C
- Stout: 10–13°C

Hoe complexer het bier, hoe warmer het meestal geserveerd wordt.
',
    '- temperatuur
- aroma
- service
- balans
- stijl
',
    'Veel speciaalbier wordt te koud geserveerd.
',
    '- Temperatuur beïnvloedt smaak
- Te koud maskeert aroma
- Complexere stijlen mogen warmer
- Service begint bij temperatuur
',
    '### Opdracht

Meet de temperatuur van een bier vóór het drinken.

### Checklist

- Temperatuur gemeten
- Stijl bepaald
- Vergeleken met advies

### Reflectievraag

Was het bier te koud of juist goed?
',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij waarom glaswerk belangrijk is.
',
    'Het juiste glas versterkt geur, schuim en presentatie.

Belangrijke effecten:

- aroma concentratie
- schuimvorming
- mondgevoel
- temperatuurbehoud

Voorbeelden:

- Pils → slank glas
- Weizen → hoog glas
- Tripel → kelk
- IPA → tulpglas
- Stout → breed glas

Het verkeerde glas kan aroma’s verzwakken.
',
    '- glaswerk
- aroma
- presentatie
- schuim
- mondgevoel
',
    'Veel brouwerijen ontwikkelen hun eigen glasvormen.
',
    '- Glas beïnvloedt aroma
- Glas beïnvloedt schuim
- Glas beïnvloedt mondgevoel
- Correct glas verhoogt kwaliteit
',
    '### Opdracht

Drink hetzelfde bier uit twee verschillende glazen.

### Checklist

- Geur vergeleken
- Schuim vergeleken
- Mondgevoel vergeleken

### Reflectievraag

Welk glas werkte beter?
',
    8,
    2
  ),
  (
    'schenktechniek',
    'Schenktechniek',
    'Na deze les kun jij bier correct uitschenken.
',
    'Goed schenken beïnvloedt schuim, koolzuur en aroma.

Basisregels:

- schoon glas
- juiste hoek (45°)
- geleidelijk rechtop zetten
- laatste deel eventueel apart beoordelen

Bij veel Belgische bieren blijft gist vaak in de fles.

Bij Weizen wordt die juist vaak mee geschonken.

Te hard schenken geeft teveel schuim.

Te zacht schenken kan aroma beperken.
',
    '- schenken
- schuim
- hoek
- gist
- presentatie
',
    'Sommige brouwerijen trainen personeel specifiek op hun eigen schenktechniek.
',
    '- Schoon glas is essentieel
- Hoek van schenken is belangrijk
- Schuim moet gecontroleerd zijn
- Gist kan meespelen
',
    '### Opdracht

Schenk één bier zorgvuldig uit.

### Checklist

- Glas schoon
- Juiste hoek gebruikt
- Schuim gecontroleerd

### Reflectievraag

Hoe stabiel bleef jouw schuim?
',
    8,
    3
  ),
  (
    'bewaren-en-rijping',
    'Bewaren & rijping',
    'Na deze les begrijp jij hoe bier correct bewaard wordt en welke stijlen kunnen rijpen.
',
    'Niet elk bier is bedoeld om lang te bewaren.

Frisse stijlen zoals pils, IPA en witbier drink je jong.

Zwaardere stijlen zoals:

- Quadrupel
- Imperial Stout
- Barleywine

kunnen vaak goed rijpen.

Belangrijke opslagregels:

- donker
- koel
- stabiele temperatuur
- rechtop bewaren

Oxidatie verandert smaken.

Soms positief, soms negatief.
',
    '- bewaren
- rijping
- oxidatie
- temperatuur
- opslag

# Way of Tasting Academy',
    'Oude Barleywines kunnen sherryachtige tonen ontwikkelen.
',
    '- Niet elk bier rijpt goed
- Zware stijlen hebben potentieel
- Opslag is cruciaal
- Oxidatie beïnvloedt smaak
',
    '### Opdracht

Bekijk drie bieren in je voorraad.

### Checklist

- Ik heb stijlen bepaald
- Ik heb rijpingspotentieel beoordeeld
- Ik heb opslagcondities bekeken

### Reflectievraag

Welke zou jij bewaren?
',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-beer (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'pairing-beer'
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
    'bier-en-kaas',
    'Bier & kaas',
    'Na deze les begrijp jij hoe bier en kaas elkaar kunnen versterken.
',
    'Bier en kaas vormen één van de sterkste klassieke pairings.

Waarom?

Bier heeft:

- koolzuur
- bitterheid
- moutzoetheid

Dat helpt vet en zout van kaas in balans te brengen.

Voorbeelden:

- Tripel + oude kaas
- Dubbel + blauwader
- Weizen + jonge geitenkaas
- Stout + gerijpte cheddar

De sleutel is balans tussen intensiteit.

Zware kaas vraagt vaak krachtiger bier.
',
    '- kaas
- koolzuur
- zout
- vet
- pairing
',
    'Bier pairt vaak makkelijker met kaas dan wijn door het koolzuur.
',
    '- Koolzuur snijdt door vet
- Bitterheid balanceert zout
- Intensiteit moet matchen
- Kaas en bier zijn klassiek
',
    '### Opdracht

Maak thuis één bier-kaas pairing.

### Checklist

- Intensiteit vergeleken
- Vetgehalte beoordeeld
- Balans getest

### Reflectievraag

Was de pairing complementair of contrasterend?
',
    8,
    1
  ),
  (
    'bier-en-vlees',
    'Bier & vlees',
    'Na deze les kun jij bier combineren met verschillende vleessoorten.
',
    'Bier werkt uitstekend met vlees door zijn breedte in smaak.

Belangrijke regels:

Licht vlees:
- witbier
- pils
- saison

Gegrild vlees:
- IPA
- blond
- amber

Zwaar vlees:
- dubbel
- stout
- quadrupel

Hop werkt sterk met grill en vet.

Mout werkt goed met karamellisatie.

Roast werkt goed met geroosterde smaken.
',
    '- vlees
- grill
- roast
- hop
- intensiteit
',
    'Stout en barbecue zijn wereldwijd een bekende pairing.
',
    '- Licht bier bij licht vlees
- Donker bier bij zwaar vlees
- Hop werkt met grill
- Roast werkt met barbecue
',
    '### Opdracht

Bedenk drie bier-vlees combinaties.

### Checklist

- Vleestype gekozen
- Bier gekozen
- Match verklaard

### Reflectievraag

Werk jij meer met contrast of intensiteit?
',
    8,
    2
  ),
  (
    'bier-en-desserts',
    'Bier & desserts',
    'Na deze les begrijp jij hoe bier desserts kan versterken.
',
    'Dessertpairing draait vaak om gelijkwaardigheid of contrast.

Belangrijke regel:

Het bier moet minstens even intens zijn als het dessert.

Voorbeelden:

- Stout + chocoladetaart
- Quadrupel + sticky toffee pudding
- Barleywine + pecannotentaart
- Fruitige NEIPA + citrustaart

Roast en chocolade versterken elkaar sterk.

Oxidatieve tonen kunnen goed werken met karamel en noten.
',
    '- dessert
- chocolade
- roast
- karamel
- intensiteit

# Way of Tasting Academy',
    'Imperial Stout wordt vaak gezien als één van de beste dessertbieren.
',
    '- Bier moet intens genoeg zijn
- Roast werkt goed met chocolade
- Zoet en zoet kan werken
- Oxidatie helpt bij karamel
',
    '### Opdracht

Kies een dessert en zoek een bier erbij.

### Checklist

- Zoetheid beoordeeld
- Intensiteit beoordeeld
- Structuur vergeleken

### Reflectievraag

Zou jij voor contrast of match kiezen?
',
    8,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-beer (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'examen-beer'
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
    'lager-vs-ale-blind',
    'Lager vs Ale blind',
    'Na deze les kun jij het verschil herkennen tussen Lager en Ale zonder etiket.
',
    'Lager en Ale vormen de basis van bijna alle bierstijlen.

Blind herkennen draait om structuur en aroma.

Lager:

- cleaner
- strakker
- frisser
- neutraler

Ale:

- fruitiger
- kruidiger
- expressiever
- complexer

Let op:

- gistkarakter
- body
- bitterheid
- afdronk

Blindproeven is de snelste manier om je bierkennis te verdiepen.
',
    '- lager
- ale
- blindproeven
- gist
- structuur
',
    'Veel beginners herkennen Ale sneller door de fruitigheid.
',
    '- Lager = strak
- Ale = expressiever
- Gist is vaak de sleutel
- Structuur helpt bij herkenning
',
    '### Opdracht

Proef blind één Lager en één Ale.

### Checklist

- Ik heb geur geanalyseerd
- Ik heb body beoordeeld
- Ik heb gistkarakter gezocht

### Reflectievraag

Wat gaf jou de doorslag?
',
    10,
    1
  ),
  (
    'ipa-vs-stout-blind',
    'IPA vs Stout blind',
    'Na deze les kun jij IPA en Stout blind onderscheiden.
',
    'IPA en Stout zijn totaal verschillende werelden.

IPA herken je vaak aan:

- citrus
- tropisch fruit
- hars
- bitterheid

Stout herken je vaak aan:

- koffie
- chocolade
- roast
- body

Belangrijke verschillen:

- kleur
- aroma
- bittertype
- textuur

Bij blindproeven kijk je niet.

Dus geur en mondgevoel worden extra belangrijk.
',
    '- IPA
- stout
- hop
- roast
- aroma
',
    'Veel ervaren proevers herkennen Stout sneller door roast.
',
    '- IPA = hop
- Stout = roast
- Aroma bepaalt veel
- Mondgevoel bevestigt
',
    '### Opdracht

Proef blind één IPA en één Stout.

### Checklist

- Aroma geanalyseerd
- Bitterheid geanalyseerd
- Body beoordeeld

### Reflectievraag

Welke stijl herkende jij sneller?
',
    10,
    2
  ),
  (
    'theorie-praktijk-examen',
    'Theorie- en praktijkexamen',
    'Na deze les toon jij aan dat je Beer Academy volledig beheerst.
',
    'Dit examen combineert alle negen modules:

Explorer:
- fundament
- productie
- proeven

Specialist:
- klassieke stijlen
- Belgische stijlen
- moderne stijlen

Master:
- service
- pairing
- blindproeven

Het examen test:

- kennis
- stijlherkenning
- service
- pairing
- analyse

Dit is jouw certificeringsmoment.
',
    '- examen
- integratie
- blindproeven
- certificering
- mastery',
    '',
    '- Volledige integratie
- Theorie + praktijk
- Stijlherkenning
- Service
- Gastronomie
',
    '### Opdracht

Voer het volledige praktijkexamen uit.

### Checklist

- Twee bieren blind geanalyseerd
- Drie pairings gemaakt
- Theorie afgerond

### Reflectievraag

Waar ligt jouw grootste kracht: stijlkennis, proeven of pairing?
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
  where t.slug = 'beer'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-beer', 'wat-is-bier', 1, 'Waaruit bestaat bier altijd?', '["Druiven", "Water, mout, hop en gist", "Vruchten", "Suiker en melk"]', 1, 'Correct: Water, mout, hop en gist'),
  ('intro-beer', 'wat-is-bier', 2, 'Wat maakt alcohol in bier?', '["Water", "Hop", "Gist", "Glas"]', 2, 'Correct: Gist'),
  ('intro-beer', 'wat-is-bier', 3, 'Wat ontstaat ook tijdens vergisting?', '["Zuurstof", "CO2", "Zout", "Stikstof"]', 1, 'Correct: CO2'),
  ('intro-beer', 'wat-is-bier', 4, 'Bier is:', '["Een versterkte drank", "Een gefermenteerde drank", "Een gedistilleerde drank", "Een mousserende wijn"]', 1, 'Correct: Een gefermenteerde drank'),
  ('intro-beer', 'wat-is-bier', 5, 'Bier bestaat al:', '["100 jaar", "500 jaar", "Duizenden jaren", "50 jaar"]', 2, 'Correct: Duizenden jaren'),
  ('intro-beer', 'vier-basisingredienten', 1, 'Wat vormt het grootste deel van bier?', '["Mout", "Water", "Hop", "Gist"]', 1, 'Correct: Water'),
  ('intro-beer', 'vier-basisingredienten', 2, 'Wat levert de suikers?', '["Hop", "Gist", "Mout", "Water"]', 2, 'Correct: Mout'),
  ('intro-beer', 'vier-basisingredienten', 3, 'Wat zorgt voor bitterheid?', '["Mout", "Hop", "Water", "Gist"]', 1, 'Correct: Hop'),
  ('intro-beer', 'vier-basisingredienten', 4, 'Wat zet suiker om in alcohol?', '["Hop", "Gist", "Mout", "Water"]', 1, 'Correct: Gist'),
  ('intro-beer', 'vier-basisingredienten', 5, 'Welke factor beïnvloedt aroma sterk?', '["Gist", "Glas", "Etiket", "Licht"]', 0, 'Correct: Gist'),
  ('intro-beer', 'alcoholische-gisting', 1, 'Wat doet gist?', '["Verbrandt alcohol", "Eet suiker", "Koelt bier", "Filtert bier"]', 1, 'Correct: Eet suiker'),
  ('intro-beer', 'alcoholische-gisting', 2, 'Wat ontstaat?', '["Alcohol en CO2", "Alleen water", "Alleen zuurstof", "Alleen suiker"]', 0, 'Correct: Alcohol en CO2'),
  ('intro-beer', 'alcoholische-gisting', 3, 'Temperatuur beïnvloedt:', '["Etiket", "Aroma", "Glas", "Fles"]', 1, 'Correct: Aroma'),
  ('intro-beer', 'alcoholische-gisting', 4, 'Waar vindt gisting plaats?', '["Glas", "Tank", "Vat", "Flesdop"]', 1, 'Correct: Tank'),
  ('intro-beer', 'alcoholische-gisting', 5, 'Fruitige tonen komen vaak van:', '["Water", "Gist", "Hop", "Glas"]', 1, 'Correct: Gist'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 1, 'Pils is meestal:', '["Bovengistend", "Ondergistend", "Mousserend", "Versterkt"]', 1, 'Correct: Ondergistend'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 2, 'Bovengisting gebeurt:', '["Kouder", "Warmer", "Zonder gist", "Zonder alcohol"]', 1, 'Correct: Warmer'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 3, 'Welke is vaak fruitiger?', '["Ondergisting", "Bovengisting", "Water", "Mout"]', 1, 'Correct: Bovengisting'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 4, 'Welke stijl is klassiek ondergistend?', '["Pils", "Tripel", "Saison", "Weizen"]', 0, 'Correct: Pils'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 5, 'Welke stijl is vaak complexer?', '["Bovengisting", "Ondergisting", "Water", "Mout"]', 0, 'Correct: Bovengisting'),
  ('intro-beer', 'biercategorieen', 1, 'Welke categorie is vaak strak en fris?', '["Lager", "Stout", "Porter", "Barleywine"]', 0, 'Correct: Lager'),
  ('intro-beer', 'biercategorieen', 2, 'Welke categorie is hopgedreven?', '["IPA", "Stout", "Wheat", "Bock"]', 0, 'Correct: IPA'),
  ('intro-beer', 'biercategorieen', 3, 'Welke categorie is vaak zacht?', '["Wheat", "IPA", "Porter", "Stout"]', 0, 'Correct: Wheat'),
  ('intro-beer', 'biercategorieen', 4, 'Welke categorie is geroosterd?', '["Dark beer", "Lager", "Ale", "Wheat"]', 0, 'Correct: Dark beer'),
  ('intro-beer', 'biercategorieen', 5, 'Welke categorie is vaak fruitig?', '["Ale", "Lager", "Pils", "Water"]', 0, 'Correct: Ale'),
  ('productie-beer', 'mouten-uitgelegd', 1, 'Waar wordt mout meestal van gemaakt?', '["Druiven", "Gerst", "Appels", "Haver"]', 1, 'Correct: Gerst'),
  ('productie-beer', 'mouten-uitgelegd', 2, 'Wat levert mout?', '["Suikers", "Zuurstof", "Koolzuur", "Alcohol"]', 0, 'Correct: Suikers'),
  ('productie-beer', 'mouten-uitgelegd', 3, 'Wat bepaalt mout sterk?', '["Kleur", "Glas", "Etiket", "Schuim"]', 0, 'Correct: Kleur'),
  ('productie-beer', 'mouten-uitgelegd', 4, 'Donkere mout geeft vaak:', '["Citrus", "Chocolade", "Zout", "Gras"]', 1, 'Correct: Chocolade'),
  ('productie-beer', 'mouten-uitgelegd', 5, 'Mout is de basis van:', '["Alcohol", "Fles", "Schuim", "Kurk"]', 0, 'Correct: Alcohol'),
  ('productie-beer', 'maischen', 1, 'Wat ontstaat na het maischen?', '["Wort", "Bier", "Alcohol", "Hop"]', 0, 'Correct: Wort'),
  ('productie-beer', 'maischen', 2, 'Wat wordt omgezet?', '["Zetmeel", "Alcohol", "Water", "CO2"]', 0, 'Correct: Zetmeel'),
  ('productie-beer', 'maischen', 3, 'Wat bepaalt het proces sterk?', '["Temperatuur", "Glas", "Schuim", "Fles"]', 0, 'Correct: Temperatuur'),
  ('productie-beer', 'maischen', 4, 'Lagere temperatuur geeft vaak:', '["Droger bier", "Zoeter bier", "Donker bier", "Bitter bier"]', 0, 'Correct: Droger bier'),
  ('productie-beer', 'maischen', 5, 'Maischen gebeurt vóór:', '["Gisting", "Bottelen", "Drinken", "Serveren"]', 0, 'Correct: Gisting'),
  ('productie-beer', 'hop-en-bitterheid', 1, 'Wat geeft hop?', '["Bitterheid", "Alcohol", "Schuim", "Water"]', 0, 'Correct: Bitterheid'),
  ('productie-beer', 'hop-en-bitterheid', 2, 'Wat meet IBU?', '["Bitterheid", "Alcohol", "Schuim", "Temperatuur"]', 0, 'Correct: Bitterheid'),
  ('productie-beer', 'hop-en-bitterheid', 3, 'Late hopgiften geven vooral:', '["Aroma", "Alcohol", "Water", "Zuur"]', 0, 'Correct: Aroma'),
  ('productie-beer', 'hop-en-bitterheid', 4, 'IPA is vaak:', '["Hoprijk", "Zoet", "Zuur", "Plat"]', 0, 'Correct: Hoprijk'),
  ('productie-beer', 'hop-en-bitterheid', 5, 'Hop balanceert:', '["Zoetheid", "Alcohol", "Water", "Schuim"]', 0, 'Correct: Zoetheid'),
  ('productie-beer', 'gist-en-aroma', 1, 'Wat maakt gist naast alcohol?', '["Aroma", "Glas", "Schuim", "Water"]', 0, 'Correct: Aroma'),
  ('productie-beer', 'gist-en-aroma', 2, 'Esters zijn:', '["Fruitig", "Bitter", "Zout", "Plat"]', 0, 'Correct: Fruitig'),
  ('productie-beer', 'gist-en-aroma', 3, 'Fenolen zijn vaak:', '["Kruidig", "Zoet", "Zuur", "Droog"]', 0, 'Correct: Kruidig'),
  ('productie-beer', 'gist-en-aroma', 4, 'Weizen staat bekend om:', '["Banaan", "Chocolade", "Koffie", "Citrus"]', 0, 'Correct: Banaan'),
  ('productie-beer', 'gist-en-aroma', 5, 'Gist beïnvloedt:', '["Stijl", "Glas", "Etiket", "Fles"]', 0, 'Correct: Stijl'),
  ('productie-beer', 'lagering-en-rijping', 1, 'Wanneer gebeurt lagering?', '["Voor maischen", "Na gisting", "Voor hop", "Voor mout"]', 1, 'Correct: Na gisting'),
  ('productie-beer', 'lagering-en-rijping', 2, 'Wat gebeurt tijdens lagering?', '["Stabilisatie", "Distillatie", "Fortificatie", "Pasteurisatie"]', 0, 'Correct: Stabilisatie'),
  ('productie-beer', 'lagering-en-rijping', 3, 'Wat wordt vaak zachter?', '["Smaak", "Glas", "Schuim", "Fles"]', 0, 'Correct: Smaak'),
  ('productie-beer', 'lagering-en-rijping', 4, 'Lagering kan duren:', '["Minuten", "Weken of maanden", "Seconden", "Jaren altijd"]', 1, 'Correct: Weken of maanden'),
  ('productie-beer', 'lagering-en-rijping', 5, 'Wat betekent “lagern”?', '["Bewaren", "Schenken", "Filteren", "Koken"]', 0, 'Correct: Bewaren'),
  ('proeven-beer', 'hoe-proef-je-bier', 1, 'Wat is de eerste stap?', '["Proeven", "Ruiken", "Kijken", "Evalueren"]', 2, 'Correct: Kijken'),
  ('proeven-beer', 'hoe-proef-je-bier', 2, 'Waar let je visueel op?', '["Kleur", "Geluid", "Gewicht", "Flesvorm"]', 0, 'Correct: Kleur'),
  ('proeven-beer', 'hoe-proef-je-bier', 3, 'Wat vertelt veel over kwaliteit?', '["Afdronk", "Dop", "Glas", "Temperatuur"]', 0, 'Correct: Afdronk'),
  ('proeven-beer', 'hoe-proef-je-bier', 4, 'Waarom systematisch proeven?', '["Meer structuur", "Sneller drinken", "Minder smaak", "Minder schuim"]', 0, 'Correct: Meer structuur'),
  ('proeven-beer', 'hoe-proef-je-bier', 5, 'Wat komt vóór proeven?', '["Ruiken", "Schenken", "Serveren", "Bewaren"]', 0, 'Correct: Ruiken'),
  ('proeven-beer', 'schuim-analyseren', 1, 'Waarom is schuim belangrijk?', '["Beschermt aroma", "Maakt bier warmer", "Verhoogt alcohol", "Verlaagt bitterheid"]', 0, 'Correct: Beschermt aroma'),
  ('proeven-beer', 'schuim-analyseren', 2, 'Wat beïnvloedt schuim negatief?', '["Vet", "Water", "Licht", "Tijd"]', 0, 'Correct: Vet'),
  ('proeven-beer', 'schuim-analyseren', 3, 'Wat zegt romig schuim vaak?', '["Kwaliteit", "Oud bier", "Slechte gisting", "Lage alcohol"]', 0, 'Correct: Kwaliteit'),
  ('proeven-beer', 'schuim-analyseren', 4, 'Waar let je op?', '["Stabiliteit", "Dop", "Etiket", "Prijs"]', 0, 'Correct: Stabiliteit'),
  ('proeven-beer', 'schuim-analyseren', 5, 'Schuim beïnvloedt:', '["Aroma", "Alcohol", "Kleur", "Mout"]', 0, 'Correct: Aroma'),
  ('proeven-beer', 'aromas-herkennen', 1, 'Welke aroma hoort bij hop?', '["Citrus", "Chocolade", "Karamel", "Koffie"]', 0, 'Correct: Citrus'),
  ('proeven-beer', 'aromas-herkennen', 2, 'Welke aroma hoort bij mout?', '["Brood", "Gras", "Peper", "Citroen"]', 0, 'Correct: Brood'),
  ('proeven-beer', 'aromas-herkennen', 3, 'Banaan komt vaak van:', '["Gist", "Water", "Glas", "Schuim"]', 0, 'Correct: Gist'),
  ('proeven-beer', 'aromas-herkennen', 4, 'Hop geeft vaak:', '["Bloemen", "Melk", "Honing", "Zout"]', 0, 'Correct: Bloemen'),
  ('proeven-beer', 'aromas-herkennen', 5, 'Aromaherkenning ontwikkel je door:', '["Oefening", "Kijken", "Schudden", "Koelen"]', 0, 'Correct: Oefening'),
  ('proeven-beer', 'structuur-en-mondgevoel', 1, 'Wat is mondgevoel?', '["Fysieke sensatie", "Alleen geur", "Alleen kleur", "Alleen schuim"]', 0, 'Correct: Fysieke sensatie'),
  ('proeven-beer', 'structuur-en-mondgevoel', 2, 'Wat voelt vaak voller?', '["Stout", "Pils", "Lager", "Witbier"]', 0, 'Correct: Stout'),
  ('proeven-beer', 'structuur-en-mondgevoel', 3, 'Wat geeft frisheid?', '["Koolzuur", "Alcohol", "Mout", "Glas"]', 0, 'Correct: Koolzuur'),
  ('proeven-beer', 'structuur-en-mondgevoel', 4, 'Wat geeft warmte?', '["Alcohol", "Water", "Hop", "Gist"]', 0, 'Correct: Alcohol'),
  ('proeven-beer', 'structuur-en-mondgevoel', 5, 'Body wordt mede beïnvloed door:', '["Restsuiker", "Glas", "Dop", "Etiket"]', 0, 'Correct: Restsuiker'),
  ('klassieke-stijlen-beer', 'pilsner', 1, 'Waar ontstond Pilsner?', '["België", "Duitsland", "Tsjechië", "Nederland"]', 2, 'Correct: Tsjechië'),
  ('klassieke-stijlen-beer', 'pilsner', 2, 'Pils is:', '["Bovengistend", "Ondergistend", "Versterkt", "Zuur"]', 1, 'Correct: Ondergistend'),
  ('klassieke-stijlen-beer', 'pilsner', 3, 'Pils is meestal:', '["Donker", "Licht goudgeel", "Rood", "Bruin"]', 1, 'Correct: Licht goudgeel'),
  ('klassieke-stijlen-beer', 'pilsner', 4, 'Pils heeft vaak:', '["Droge afdronk", "Zoete afdronk", "Zoute afdronk", "Geen afdronk"]', 0, 'Correct: Droge afdronk'),
  ('klassieke-stijlen-beer', 'pilsner', 5, 'Pils is technisch:', '["Eenvoudig", "Moeilijk", "Onmogelijk", "Simpel"]', 1, 'Correct: Moeilijk'),
  ('klassieke-stijlen-beer', 'blond', 1, 'Blond is meestal:', '["Bovengistend", "Ondergistend", "Versterkt", "Zuur"]', 0, 'Correct: Bovengistend'),
  ('klassieke-stijlen-beer', 'blond', 2, 'Blond heeft vaak:', '["Fruitigheid", "Zout", "Rook", "As"]', 0, 'Correct: Fruitigheid'),
  ('klassieke-stijlen-beer', 'blond', 3, 'Alcohol ligt vaak:', '["2–3%", "6–8%", "10–12%", "15%"]', 1, 'Correct: 6–8%'),
  ('klassieke-stijlen-beer', 'blond', 4, 'Blond is vaak:', '["Complexer dan pils", "Simpeler dan pils", "Donkerder dan stout", "Zoeter dan Port"]', 0, 'Correct: Complexer dan pils'),
  ('klassieke-stijlen-beer', 'blond', 5, 'Blond komt sterk voor in:', '["België", "Spanje", "Portugal", "Italië"]', 0, 'Correct: België'),
  ('klassieke-stijlen-beer', 'weizen', 1, 'Weizen bevat veel:', '["Tarwe", "Rijst", "Druiven", "Mais"]', 0, 'Correct: Tarwe'),
  ('klassieke-stijlen-beer', 'weizen', 2, 'Typisch aroma:', '["Banaan", "Koffie", "Rook", "As"]', 0, 'Correct: Banaan'),
  ('klassieke-stijlen-beer', 'weizen', 3, 'Weizen is vaak:', '["Troebel", "Helder", "Zwart", "Rood"]', 0, 'Correct: Troebel'),
  ('klassieke-stijlen-beer', 'weizen', 4, 'Kruidnagel komt van:', '["Gist", "Hop", "Water", "Glas"]', 0, 'Correct: Gist'),
  ('klassieke-stijlen-beer', 'weizen', 5, 'Weizen voelt vaak:', '["Levendig", "Plat", "Stil", "Hard"]', 0, 'Correct: Levendig'),
  ('klassieke-stijlen-beer', 'witbier', 1, 'Witbier komt uit:', '["België", "Duitsland", "Portugal", "Spanje"]', 0, 'Correct: België'),
  ('klassieke-stijlen-beer', 'witbier', 2, 'Typisch ingrediënt:', '["Sinaasappelschil", "Koffie", "Vanille", "Chocolade"]', 0, 'Correct: Sinaasappelschil'),
  ('klassieke-stijlen-beer', 'witbier', 3, 'Bitterheid is vaak:', '["Laag", "Hoog", "Extreem", "Niet aanwezig"]', 0, 'Correct: Laag'),
  ('klassieke-stijlen-beer', 'witbier', 4, 'Witbier is vaak:', '["Fris", "Zwaar", "Donker", "Rokerig"]', 0, 'Correct: Fris'),
  ('klassieke-stijlen-beer', 'witbier', 5, 'Typisch kruid:', '["Koriander", "Kaneel", "Tijm", "Rozemarijn"]', 0, 'Correct: Koriander'),
  ('klassieke-stijlen-beer', 'bockbier', 1, 'Bock draait vooral om:', '["Hop", "Mout", "Gist", "Water"]', 1, 'Correct: Mout'),
  ('klassieke-stijlen-beer', 'bockbier', 2, 'Bock is vaak:', '["Seizoensgebonden", "Zomerbier", "Licht bier", "Zuur bier"]', 0, 'Correct: Seizoensgebonden'),
  ('klassieke-stijlen-beer', 'bockbier', 3, 'Typische smaak:', '["Karamel", "Citrus", "Gras", "Azijn"]', 0, 'Correct: Karamel'),
  ('klassieke-stijlen-beer', 'bockbier', 4, 'Bock heeft vaak:', '["Meer alcohol dan pils", "Minder alcohol dan pils", "Geen alcohol", "Zelfde als wijn"]', 0, 'Correct: Meer alcohol dan pils'),
  ('klassieke-stijlen-beer', 'bockbier', 5, 'Bock komt oorspronkelijk uit:', '["Duitsland", "België", "Nederland", "Frankrijk"]', 0, 'Correct: Duitsland'),
  ('belgische-stijlen-beer', 'dubbel', 1, 'Dubbel is meestal:', '["Licht", "Donker", "Troebel wit", "Zuur"]', 1, 'Correct: Donker'),
  ('belgische-stijlen-beer', 'dubbel', 2, 'Typische aroma:', '["Rozijnen", "Citrus", "Gras", "Rook"]', 0, 'Correct: Rozijnen'),
  ('belgische-stijlen-beer', 'dubbel', 3, 'Alcohol is vaak:', '["6–8%", "2–3%", "10–12%", "15%"]', 0, 'Correct: 6–8%'),
  ('belgische-stijlen-beer', 'dubbel', 4, 'Dubbel draait om:', '["Mout en gist", "Alleen hop", "Alleen water", "Alleen koolzuur"]', 0, 'Correct: Mout en gist'),
  ('belgische-stijlen-beer', 'dubbel', 5, 'Dubbel is meestal:', '["Belgisch", "Duits", "Portugees", "Engels"]', 0, 'Correct: Belgisch'),
  ('belgische-stijlen-beer', 'tripel', 1, 'Tripel is vaak:', '["Donker", "Goudkleurig", "Zwart", "Rood"]', 1, 'Correct: Goudkleurig'),
  ('belgische-stijlen-beer', 'tripel', 2, 'Tripel heeft meestal:', '["Hoge alcohol", "Lage alcohol", "Geen alcohol", "Versterkte alcohol"]', 0, 'Correct: Hoge alcohol'),
  ('belgische-stijlen-beer', 'tripel', 3, 'Afdronk is vaak:', '["Droog", "Zoet", "Zout", "Zuur"]', 0, 'Correct: Droog'),
  ('belgische-stijlen-beer', 'tripel', 4, 'Typisch aroma:', '["Peer", "Koffie", "Rook", "As"]', 0, 'Correct: Peer'),
  ('belgische-stijlen-beer', 'tripel', 5, 'Tripel is:', '["Complex", "Simpel", "Licht", "Plat"]', 0, 'Correct: Complex'),
  ('belgische-stijlen-beer', 'quadrupel', 1, 'Quadrupel heeft vaak:', '["2–3%", "9–12%", "5–6%", "14–16%"]', 1, 'Correct: 9–12%'),
  ('belgische-stijlen-beer', 'quadrupel', 2, 'Quadrupel is meestal:', '["Licht", "Donker", "Troebel wit", "Rosé"]', 1, 'Correct: Donker'),
  ('belgische-stijlen-beer', 'quadrupel', 3, 'Typisch aroma:', '["Gedroogd fruit", "Citrus", "Gras", "Zout"]', 0, 'Correct: Gedroogd fruit'),
  ('belgische-stijlen-beer', 'quadrupel', 4, 'Quadrupel heeft vaak:', '["Rijpingspotentieel", "Geen bewaarpotentieel", "Alleen koude opslag", "Geen ontwikkeling"]', 0, 'Correct: Rijpingspotentieel'),
  ('belgische-stijlen-beer', 'quadrupel', 5, 'Quadrupel is:', '["Intens", "Simpel", "Licht", "Fris"]', 0, 'Correct: Intens'),
  ('belgische-stijlen-beer', 'saison', 1, 'Saison komt uit:', '["België", "Duitsland", "Engeland", "Spanje"]', 0, 'Correct: België'),
  ('belgische-stijlen-beer', 'saison', 2, 'Saison is vaak:', '["Droog", "Zoet", "Rijk zoet", "Zwaar moutig"]', 0, 'Correct: Droog'),
  ('belgische-stijlen-beer', 'saison', 3, 'Typische aroma:', '["Peper", "Chocolade", "Koffie", "Rook"]', 0, 'Correct: Peper'),
  ('belgische-stijlen-beer', 'saison', 4, 'Saison heeft vaak:', '["Hoog koolzuur", "Geen koolzuur", "Lage zuren", "Lage complexiteit"]', 0, 'Correct: Hoog koolzuur'),
  ('belgische-stijlen-beer', 'saison', 5, 'Saison is vaak:', '["Gastronomisch sterk", "Moeilijk te pairen", "Alleen dessertbier", "Alleen zomerbier"]', 0, 'Correct: Gastronomisch sterk'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 1, 'Trappist moet gebrouwen worden:', '["In abdij", "In fabriek", "In stad", "In kelder"]', 0, 'Correct: In abdij'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 2, 'Wie houdt toezicht?', '["Monniken", "Handelaren", "Sommeliers", "Exporteurs"]', 0, 'Correct: Monniken'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 3, 'Abdijbier is vaak:', '["Commercieel gebrouwen", "Altijd monastiek", "Altijd klein", "Altijd biologisch"]', 0, 'Correct: Commercieel gebrouwen'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 4, 'Welke organisatie bewaakt Trappist?', '["International Trappist Association", "Beer Alliance", "Belgian Brewers", "Monastic Guild"]', 0, 'Correct: International Trappist Association'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 5, 'Is elk Abdijbier Trappist?', '["Ja", "Nee", "Soms altijd", "Alleen in België"]', 1, 'Correct: Nee'),
  ('moderne-stijlen-beer', 'ipa', 1, 'Waar staat IPA voor?', '["India Pale Ale", "International Pale Ale", "Imperial Pale Ale", "Indian Porter Ale"]', 0, 'Correct: India Pale Ale'),
  ('moderne-stijlen-beer', 'ipa', 2, 'IPA draait vooral om:', '["Hop", "Mout", "Water", "Gist"]', 0, 'Correct: Hop'),
  ('moderne-stijlen-beer', 'ipa', 3, 'Typisch aroma:', '["Citrus", "Karamel", "Chocolade", "Koffie"]', 0, 'Correct: Citrus'),
  ('moderne-stijlen-beer', 'ipa', 4, 'IPA is vaak:', '["Bitter", "Zoet", "Zuur", "Plat"]', 0, 'Correct: Bitter'),
  ('moderne-stijlen-beer', 'ipa', 5, 'IPA hoort sterk bij:', '["Craft beer", "Wijn", "Distillaten", "Cider"]', 0, 'Correct: Craft beer'),
  ('moderne-stijlen-beer', 'neipa', 1, 'NEIPA komt uit:', '["België", "New England", "Duitsland", "Engeland"]', 1, 'Correct: New England'),
  ('moderne-stijlen-beer', 'neipa', 2, 'NEIPA is vaak:', '["Troebel", "Helder", "Donker", "Rood"]', 0, 'Correct: Troebel'),
  ('moderne-stijlen-beer', 'neipa', 3, 'NEIPA is meestal:', '["Zachter bitter", "Bitterder", "Zuurder", "Zoeter dan stout"]', 0, 'Correct: Zachter bitter'),
  ('moderne-stijlen-beer', 'neipa', 4, 'Typisch aroma:', '["Mango", "Koffie", "Toast", "Noten"]', 0, 'Correct: Mango'),
  ('moderne-stijlen-beer', 'neipa', 5, 'Mondgevoel is vaak:', '["Vol en zacht", "Licht en strak", "Plat", "Hard"]', 0, 'Correct: Vol en zacht'),
  ('moderne-stijlen-beer', 'porter', 1, 'Porter komt uit:', '["Londen", "Dublin", "Brussel", "München"]', 0, 'Correct: Londen'),
  ('moderne-stijlen-beer', 'porter', 2, 'Porter is:', '["Donker", "Licht", "Wit", "Rosé"]', 0, 'Correct: Donker'),
  ('moderne-stijlen-beer', 'porter', 3, 'Typisch aroma:', '["Chocolade", "Citrus", "Gras", "Zout"]', 0, 'Correct: Chocolade'),
  ('moderne-stijlen-beer', 'porter', 4, 'Porter is vaak:', '["Zachter dan stout", "Bitterder dan IPA", "Lichter dan pils", "Zoeter dan tripel"]', 0, 'Correct: Zachter dan stout'),
  ('moderne-stijlen-beer', 'porter', 5, 'Porter ontstond in:', '["18e eeuw", "12e eeuw", "20e eeuw", "21e eeuw"]', 0, 'Correct: 18e eeuw'),
  ('moderne-stijlen-beer', 'stout', 1, 'Typische smaak:', '["Koffie", "Citrus", "Mango", "Gras"]', 0, 'Correct: Koffie'),
  ('moderne-stijlen-beer', 'stout', 2, 'Stout is vaak:', '["Intens", "Licht", "Troebel wit", "Fris"]', 0, 'Correct: Intens'),
  ('moderne-stijlen-beer', 'stout', 3, 'Bekend stoutmerk:', '["Guinness", "Heineken", "Corona", "Duvel"]', 0, 'Correct: Guinness'),
  ('moderne-stijlen-beer', 'stout', 4, 'Stout heeft vaak:', '["Meer body dan Porter", "Minder body dan Pils", "Geen body", "Minder smaak"]', 0, 'Correct: Meer body dan Porter'),
  ('moderne-stijlen-beer', 'stout', 5, 'Stout is vaak:', '["Gastronomisch sterk", "Alleen zomerbier", "Alleen aperitief", "Alleen licht"]', 0, 'Correct: Gastronomisch sterk'),
  ('moderne-stijlen-beer', 'barleywine', 1, 'Barleywine is:', '["Wijn", "Bier", "Cider", "Port"]', 1, 'Correct: Bier'),
  ('moderne-stijlen-beer', 'barleywine', 2, 'Alcohol is vaak:', '["2–4%", "9–14%", "5–6%", "15–18%"]', 1, 'Correct: 9–14%'),
  ('moderne-stijlen-beer', 'barleywine', 3, 'Typisch aroma:', '["Toffee", "Citrus", "Gras", "Zout"]', 0, 'Correct: Toffee'),
  ('moderne-stijlen-beer', 'barleywine', 4, 'Barleywine heeft vaak:', '["Rijpingspotentieel", "Geen rijping", "Alleen koude opslag", "Geen ontwikkeling"]', 0, 'Correct: Rijpingspotentieel'),
  ('moderne-stijlen-beer', 'barleywine', 5, 'Drinktempo is vaak:', '["Langzaam", "Snel", "Shot", "IJskoud"]', 0, 'Correct: Langzaam'),
  ('service-beer', 'serveertemperatuur', 1, 'Te koud bier:', '["Versterkt aroma", "Onderdrukt aroma", "Verhoogt zoetheid", "Maakt bitterheid sterker"]', 1, 'Correct: Onderdrukt aroma'),
  ('service-beer', 'serveertemperatuur', 2, 'Pils drink je vaak op:', '["4–6°C", "10–12°C", "14–16°C", "18°C"]', 0, 'Correct: 4–6°C'),
  ('service-beer', 'serveertemperatuur', 3, 'Stout wordt vaak:', '["Warmer geserveerd", "IJskoud geserveerd", "Bevroren", "Altijd op kamertemperatuur"]', 0, 'Correct: Warmer geserveerd'),
  ('service-beer', 'serveertemperatuur', 4, 'Complex bier vraagt vaak:', '["Hogere temperatuur", "Lagere temperatuur", "Geen temperatuur", "IJs"]', 0, 'Correct: Hogere temperatuur'),
  ('service-beer', 'serveertemperatuur', 5, 'Service begint bij:', '["Temperatuur", "Etiket", "Prijs", "Fleskleur"]', 0, 'Correct: Temperatuur'),
  ('service-beer', 'glaswerk', 1, 'Wat beïnvloedt glas sterk?', '["Aroma", "Alcoholpercentage", "Ingrediënten", "Gisting"]', 0, 'Correct: Aroma'),
  ('service-beer', 'glaswerk', 2, 'Weizen wordt vaak geschonken in:', '["Hoog glas", "Tumbler", "Flute", "Klein glas"]', 0, 'Correct: Hoog glas'),
  ('service-beer', 'glaswerk', 3, 'Tripel past vaak in:', '["Kelk", "Shotglas", "Martini", "Flute"]', 0, 'Correct: Kelk'),
  ('service-beer', 'glaswerk', 4, 'Glas beïnvloedt:', '["Schuim", "Alcohol", "Mout", "Gist"]', 0, 'Correct: Schuim'),
  ('service-beer', 'glaswerk', 5, 'Veel brouwers:', '["Ontwerpen eigen glaswerk", "Gebruiken alleen flessen", "Gebruiken wijnflessen", "Gebruiken plastic"]', 0, 'Correct: Ontwerpen eigen glaswerk'),
  ('service-beer', 'schenktechniek', 1, 'Starthoek is vaak:', '["45°", "90°", "10°", "0°"]', 0, 'Correct: 45°'),
  ('service-beer', 'schenktechniek', 2, 'Te hard schenken geeft:', '["Te veel schuim", "Minder aroma", "Minder alcohol", "Minder bitterheid"]', 0, 'Correct: Te veel schuim'),
  ('service-beer', 'schenktechniek', 3, 'Wat moet altijd schoon zijn?', '["Glas", "Flesdop", "Tafel", "Etiket"]', 0, 'Correct: Glas'),
  ('service-beer', 'schenktechniek', 4, 'Weizen gist:', '["Wordt vaak mee geschonken", "Wordt weggegooid", "Wordt gefilterd", "Is verboden"]', 0, 'Correct: Wordt vaak mee geschonken'),
  ('service-beer', 'schenktechniek', 5, 'Schenken beïnvloedt:', '["Aroma en schuim", "Alcoholpercentage", "Ingrediënten", "Leeftijd"]', 0, 'Correct: Aroma en schuim'),
  ('service-beer', 'bewaren-en-rijping', 1, 'IPA drink je meestal:', '["Jong", "Oud", "Na 10 jaar", "Alleen warm"]', 0, 'Correct: Jong'),
  ('service-beer', 'bewaren-en-rijping', 2, 'Welke stijl kan goed rijpen?', '["Barleywine", "Pils", "Witbier", "Lager"]', 0, 'Correct: Barleywine'),
  ('service-beer', 'bewaren-en-rijping', 3, 'Hoe bewaar je bier?', '["Donker en koel", "Warm en licht", "Buiten", "In zonlicht"]', 0, 'Correct: Donker en koel'),
  ('service-beer', 'bewaren-en-rijping', 4, 'Oxidatie kan:', '["Smaken veranderen", "Alcohol verwijderen", "Schuim verhogen", "Gist stoppen"]', 0, 'Correct: Smaken veranderen'),
  ('service-beer', 'bewaren-en-rijping', 5, 'Bier bewaar je vaak:', '["Rechtop", "Liggend", "Ondersteboven", "Open"]', 0, 'Correct: Rechtop'),
  ('pairing-beer', 'bier-en-kaas', 1, 'Wat helpt vet doorbreken?', '["Koolzuur", "Alcohol", "Schuim", "Glas"]', 0, 'Correct: Koolzuur'),
  ('pairing-beer', 'bier-en-kaas', 2, 'Welke pairing klopt?', '["Tripel + oude kaas", "Pils + blauwe kaas", "Witbier + Stilton", "IPA + mascarpone"]', 0, 'Correct: Tripel + oude kaas'),
  ('pairing-beer', 'bier-en-kaas', 3, 'Kaas bevat vaak veel:', '["Vet en zout", "Bitterheid", "Koolzuur", "Alcohol"]', 0, 'Correct: Vet en zout'),
  ('pairing-beer', 'bier-en-kaas', 4, 'Bij pairing moet je letten op:', '["Intensiteit", "Kleur", "Etiket", "Prijs"]', 0, 'Correct: Intensiteit'),
  ('pairing-beer', 'bier-en-kaas', 5, 'Bier pairt vaak goed door:', '["Koolzuur", "Suiker", "Kurk", "Houtlagering"]', 0, 'Correct: Koolzuur'),
  ('pairing-beer', 'bier-en-vlees', 1, 'Wat past goed bij barbecue?', '["Stout", "Witbier", "Pils", "Sour"]', 0, 'Correct: Stout'),
  ('pairing-beer', 'bier-en-vlees', 2, 'IPA werkt goed met:', '["Grill", "Yoghurt", "Room", "Fruit"]', 0, 'Correct: Grill'),
  ('pairing-beer', 'bier-en-vlees', 3, 'Licht vlees vraagt vaak:', '["Lichter bier", "Quadrupel", "Barleywine", "Imperial stout"]', 0, 'Correct: Lichter bier'),
  ('pairing-beer', 'bier-en-vlees', 4, 'Roast werkt met:', '["Geroosterde smaken", "Zure smaken", "Zoete fruitigheid", "Citrus"]', 0, 'Correct: Geroosterde smaken'),
  ('pairing-beer', 'bier-en-vlees', 5, 'Mout werkt goed met:', '["Karamellisatie", "Zuur", "Zout", "Bitterheid"]', 0, 'Correct: Karamellisatie'),
  ('pairing-beer', 'bier-en-desserts', 1, 'Wat past klassiek bij chocolade?', '["Stout", "Pils", "Saison", "Lager"]', 0, 'Correct: Stout'),
  ('pairing-beer', 'bier-en-desserts', 2, 'Welke stijl werkt goed met karamel?', '["Barleywine", "Witbier", "Pils", "Sour"]', 0, 'Correct: Barleywine'),
  ('pairing-beer', 'bier-en-desserts', 3, 'Belangrijkste regel?', '["Bier even intens als dessert", "Bier altijd lichter", "Bier altijd bitter", "Bier altijd koud"]', 0, 'Correct: Bier even intens als dessert'),
  ('pairing-beer', 'bier-en-desserts', 4, 'Roast versterkt:', '["Chocolade", "Citrus", "Zuur", "Zout"]', 0, 'Correct: Chocolade'),
  ('pairing-beer', 'bier-en-desserts', 5, 'Quadrupel werkt vaak met:', '["Sticky toffee pudding", "Sorbet", "Salade", "Sushi"]', 0, 'Correct: Sticky toffee pudding'),
  ('examen-beer', 'lager-vs-ale-blind', 1, 'Welke stijl is meestal cleaner?', '["Ale", "Lager", "Stout", "Porter"]', 1, 'Correct: Lager'),
  ('examen-beer', 'lager-vs-ale-blind', 2, 'Welke stijl is fruitiger?', '["Ale", "Lager", "Pils", "Bock"]', 0, 'Correct: Ale'),
  ('examen-beer', 'lager-vs-ale-blind', 3, 'Wat helpt bij blindproeven?', '["Gistkarakter", "Etiket", "Fleskleur", "Prijs"]', 0, 'Correct: Gistkarakter'),
  ('examen-beer', 'lager-vs-ale-blind', 4, 'Lager is meestal:', '["Neutraler", "Zwaarder", "Zoeter", "Donkerder"]', 0, 'Correct: Neutraler'),
  ('examen-beer', 'lager-vs-ale-blind', 5, 'Ale is vaak:', '["Complexer", "Simpeler", "Kouder", "Helderder"]', 0, 'Correct: Complexer'),
  ('examen-beer', 'ipa-vs-stout-blind', 1, 'Welke stijl geeft citrus?', '["IPA", "Stout", "Porter", "Dubbel"]', 0, 'Correct: IPA'),
  ('examen-beer', 'ipa-vs-stout-blind', 2, 'Welke stijl geeft koffie?', '["Stout", "IPA", "Weizen", "Saison"]', 0, 'Correct: Stout'),
  ('examen-beer', 'ipa-vs-stout-blind', 3, 'Welke stijl heeft vaak roast?', '["Stout", "IPA", "Witbier", "Blond"]', 0, 'Correct: Stout'),
  ('examen-beer', 'ipa-vs-stout-blind', 4, 'Welke stijl is vaak fruitiger?', '["IPA", "Stout", "Porter", "Bock"]', 0, 'Correct: IPA'),
  ('examen-beer', 'ipa-vs-stout-blind', 5, 'Wat helpt het meest?', '["Geur en body", "Etiket", "Temperatuur", "Flesvorm"]', 0, 'Correct: Geur en body')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
