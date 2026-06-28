-- Bier 0.0 track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 45 lessons · quizvragen per les

delete from academy.tracks where slug = 'beer-zero';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'beer-zero',
  'Bier 0.0',
  'Leer alcoholvrij bier van Fundament tot Master: productie, proeven, stijlen, markt, service en examen.',
  4,
  now()
);

with t as (select id from academy.tracks where slug = 'beer-zero')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-beer-zero', 'Fundament', 1),
  ('explorer', 'productie-beer-zero', 'Productie', 2),
  ('explorer', 'proeven-beer-zero', 'Proeven', 3),
  ('specialist', 'klassieke-stijlen-beer-zero', 'Klassieke stijlen', 4),
  ('specialist', 'markt-innovatie-beer-zero', 'Markt & Innovatie', 5),
  ('specialist', 'gezondheid-beer-zero', 'Gezondheid & Lifestyle', 6),
  ('master', 'service-beer-zero', 'Service', 7),
  ('master', 'pairing-beer-zero', 'Pairing & Gastronomie', 8),
  ('master', 'examen-beer-zero', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'intro-beer-zero'
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
    'wat-is-bier-0-0',
    'Wat is bier 0.0?',
    'Na deze les kun jij uitleggen wat bier 0.0 is, wanneer een bier écht alcoholvrij is en waarom deze categorie zo snel groeit.
',
    'Bier 0.0 is bier waarin vrijwel geen alcohol aanwezig is.

In Europa mag bier met maximaal 0.05% alcohol als 0.0 worden verkocht.

Dat betekent dat het technisch gezien nog minimale sporen alcohol kan bevatten.

Bier 0.0 wordt meestal op dezelfde manier gebrouwen als regulier bier.

Het verschil zit in het beperken of verwijderen van alcohol.

De smaakbeleving blijft daardoor zoveel mogelijk behouden.

Steeds meer consumenten kiezen bewust voor alcoholvrij vanwege gezondheid, sport, werk of sociale situaties.

Hierdoor groeit de categorie wereldwijd enorm.
',
    '- 0.0
- alcoholvrij
- bier
- groei
- categorie
',
    'Heineken 0.0 was één van de eerste alcoholvrije bieren die wereldwijd echt succesvol werd.
',
    '- Bier 0.0 bevat maximaal 0.05% alcohol
- Het wordt als echt bier gebrouwen
- Alcohol wordt beperkt of verwijderd
- De categorie groeit wereldwijd snel
',
    '### Opdracht

Bekijk drie alcoholvrije bieren online of in een winkel.

### Checklist

- Ik heb drie labels bekeken
- Ik heb het alcoholpercentage gevonden
- Ik heb de bierstijl herkend

### Reflectievraag

Welke stijl zie jij het meest?
',
    8,
    1
  ),
  (
    'hoe-wordt-alcohol-verwijderd',
    'Hoe wordt alcohol verwijderd?',
    'Na deze les begrijp je de belangrijkste technieken om alcohol uit bier te verwijderen.
',
    'Er zijn verschillende manieren om alcoholvrij bier te maken.

De meest gebruikte technieken zijn:

- gestopte fermentatie
- vacuümdestillatie
- reverse osmosis

Bij gestopte fermentatie stopt de brouwer vroeg, waardoor minder alcohol ontstaat.

Bij vacuümdestillatie verdampt alcohol op lage temperatuur.

Bij reverse osmosis wordt alcohol via filtratie gescheiden.

Elke techniek heeft invloed op smaak, body en aroma.
',
    '- de-alcoholisatie
- vacuümdestillatie
- reverse osmosis
- fermentatie
- techniek
',
    'Vacuümdestillatie wordt vaak gebruikt voor premium 0.0-bieren.
',
    '- Er zijn meerdere technieken
- Elke techniek beïnvloedt smaak anders
- Technologie bepaalt kwaliteit
',
    '### Opdracht

Zoek uit welke methode jouw favoriete 0.0-bier gebruikt.

### Checklist

- Ik heb een merk gekozen
- Ik heb de methode opgezocht
- Ik begrijp het proces

### Reflectievraag

Welke methode lijkt jou het beste?
',
    8,
    2
  ),
  (
    'waarom-is-bier-0-0-uniek',
    'Waarom is bier 0.0 uniek?',
    'Na deze les kun je uitleggen waarom bier 0.0 een unieke drankcategorie is.
',
    'Bier 0.0 is uniek omdat het bierbeleving geeft zonder alcohol.

Dat maakt het bruikbaar in veel situaties:

- sport
- lunch
- werk
- rijden
- herstel

Het behoudt vaak:

- bitterheid
- koolzuur
- frisheid

Maar mist soms body door het ontbreken van alcohol.

Dat maakt productie complex.

De uitdaging is smaak behouden zonder alcohol.
',
    '- body
- balans
- functionaliteit
- herstel
- smaak
',
    'Veel topsporters drinken alcoholvrij bier als herstelmoment.
',
    '- Bierervaring zonder alcohol
- Functioneel inzetbaar
- Moeilijk om body te behouden
',
    '### Opdracht

Bedenk drie momenten waarop jij bier 0.0 zou drinken.

### Checklist

- Ik heb drie momenten bedacht
- Ik heb uitgelegd waarom
- Ik heb een stijl gekozen

### Reflectievraag

Wanneer past 0.0 het beste voor jou?
',
    8,
    3
  ),
  (
    'geschiedenis-van-alcoholvrij-bier',
    'Geschiedenis van alcoholvrij bier',
    'Na deze les begrijp je hoe alcoholvrij bier zich ontwikkeld heeft.
',
    'Alcoholvrij bier bestaat al tientallen jaren.

Vroeger was kwaliteit vaak laag.

Veel bieren waren te zoet, dun of vlak.

Door nieuwe technologie verbeterde de kwaliteit enorm.

De afgelopen 10 jaar groeide de markt explosief.

Steeds meer craft-brouwers maken nu ook premium 0.0.

Alcoholvrij bier is geen niche meer.

Het is een volwaardige biercategorie.
',
    '- geschiedenis
- groei
- innovatie
- markt
- kwaliteit
',
    'Nederland behoort tot de grootste alcoholvrije biermarkten van Europa.
',
    '- Vroeger lagere kwaliteit
- Technologie verbeterde veel
- Nu wereldwijd sterk groeiend
',
    '### Opdracht

Zoek drie bekende 0.0-merken.

### Checklist

- Ik heb drie merken gevonden
- Ik herken het type bier
- Ik ken het land van herkomst

### Reflectievraag

Welk merk kende je al?
',
    8,
    4
  ),
  (
    'belangrijkste-categorieen',
    'Belangrijkste categorieën',
    'Na deze les herken jij de belangrijkste bier 0.0-stijlen.
',
    'Bier 0.0 bestaat in meerdere stijlen.

De belangrijkste zijn:

- pils
- IPA
- witbier
- blond
- donker

Elke stijl heeft zijn eigen smaakprofiel.

Pils is fris en droog.

IPA is hoppig en bitter.

Witbier is zacht en kruidig.

Blond is rond en toegankelijk.

Donker is voller en geroosterd.

Deze basis helpt je later beter proeven.
',
    '- pils
- IPA
- witbier
- blond
- donker',
    'IPA is momenteel de snelst groeiende 0.0-categorie.
',
    '- Er zijn meerdere stijlen
- Elke stijl heeft eigen kenmerken
- Stijlherkenning is essentieel
',
    '### Opdracht

Schrijf bij elke stijl één smaakkenmerk op.

### Checklist

- Ik heb pils beschreven
- Ik heb IPA beschreven
- Ik heb witbier beschreven
- Ik heb blond beschreven
- Ik heb donker beschreven

### Reflectievraag

Welke stijl past het best bij jou?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'productie-beer-zero'
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
    'gestopte-fermentatie',
    'Gestopte fermentatie',
    'Na deze les kun jij uitleggen wat gestopte fermentatie is en waarom deze methode gebruikt wordt.
',
    'Bij gestopte fermentatie stopt de brouwer het gistingsproces vroegtijdig.

Normaal zetten gisten suikers om in alcohol.

Door vroeg te stoppen ontstaat minder alcohol.

Het voordeel is dat de brouwer minder alcohol hoeft te verwijderen.

Het nadeel is dat er meer restsuiker achterblijft.

Daardoor kan het bier zoeter smaken.

Deze methode wordt vaak gebruikt bij lichtere alcoholvrije bieren.
',
    '- fermentatie
- restsuiker
- zoetheid
- gist
- alcohol
',
    'Veel goedkope 0.0-bieren gebruiken deze techniek.
',
    '- Fermentatie stopt vroeg
- Minder alcohol ontstaat
- Meer restsuiker blijft over
- Vaak zoetere smaak
',
    '### Opdracht

Vergelijk twee 0.0-bieren op zoetheid.

### Checklist

- Ik heb twee bieren gekozen
- Ik heb zoetheid geproefd
- Ik heb verschil genoteerd

### Reflectievraag

Welke voelde zoeter?
',
    8,
    1
  ),
  (
    'vacuümdestillatie',
    'Vacuümdestillatie',
    'Na deze les begrijp je hoe vacuümdestillatie werkt.
',
    'Bij vacuümdestillatie wordt alcohol uit bier verwijderd.

Door vacuüm verlaagt het kookpunt.

Daardoor verdampt alcohol al bij lage temperatuur.

Dit is belangrijk omdat hoge hitte aroma’s kan beschadigen.

Deze techniek bewaart meer smaak dan traditionele verhitting.

Veel premium merken gebruiken dit.
',
    '- vacuüm
- destillatie
- alcohol
- aroma
- temperatuur
',
    'Alcohol kookt sneller dan water.
',
    '- Alcohol wordt verwijderd
- Lage temperatuur beschermt aroma
- Vaak hogere kwaliteit
',
    '### Opdracht

Zoek drie premium 0.0-bieren op.

### Checklist

- Ik heb drie merken gevonden
- Ik heb productiemethode gezocht
- Ik heb verschillen genoteerd

### Reflectievraag

Welke lijkt het meest premium?
',
    8,
    2
  ),
  (
    'reverse-osmosis',
    'Reverse osmosis',
    'Na deze les kun jij uitleggen wat reverse osmosis is.
',
    'Reverse osmosis is een filtratietechniek.

Hierbij wordt bier door extreem fijne membranen gedrukt.

Deze membranen scheiden alcohol van water en smaakstoffen.

Na filtratie wordt het bier opnieuw opgebouwd.

Dit zorgt voor veel controle.

Het resultaat kan heel dicht bij normaal bier liggen.

Het is een dure en geavanceerde techniek.
',
    '- reverse osmosis
- membraan
- filtratie
- precisie
- technologie
',
    'Deze techniek wordt ook gebruikt in waterzuivering.
',
    '- Filtratie op moleculair niveau
- Hoge precisie
- Duurdere methode
',
    '### Opdracht

Zoek uit welk groot merk deze techniek gebruikt.

### Checklist

- Ik heb een merk gevonden
- Ik heb de techniek begrepen
- Ik kan het uitleggen

### Reflectievraag

Vind jij dit technisch indrukwekkend?
',
    8,
    3
  ),
  (
    'aroma-retentie',
    'Aroma-retentie',
    'Na deze les begrijp je waarom aroma-behoud cruciaal is.
',
    'Alcohol draagt aroma.

Wanneer alcohol verwijderd wordt, verdwijnen vaak ook geurstoffen.

Dat maakt bier vlakker.

Daarom is aroma-retentie één van de grootste uitdagingen.

Brouwers proberen dit op te lossen via:

- dry hopping
- extra moutgebruik
- geavanceerde technieken

Hoe beter aroma behouden blijft, hoe beter de bierbeleving.
',
    '- aroma
- geur
- retentie
- dry hopping
- balans
',
    'Veel consumenten herkennen aroma-verlies sneller dan smaakverlies.
',
    '- Alcohol draagt aroma
- Verwijderen kost geur
- Retentie bepaalt kwaliteit
',
    '### Opdracht

Ruik twee 0.0-bieren blind.

### Checklist

- Ik heb blind geroken
- Ik heb intensiteit vergeleken
- Ik heb verschil benoemd

### Reflectievraag

Welk bier had meer aroma?
',
    8,
    4
  ),
  (
    'balans-zonder-alcohol',
    'Balans zonder alcohol',
    'Na deze les begrijp je waarom balans de moeilijkste uitdaging is bij 0.0-bier.
',
    'Alcohol geeft bier structuur, warmte en mondgevoel.

Zonder alcohol mist bier vaak:

- body
- lengte
- rondheid

Brouwers moeten dat compenseren.

Dat kan via:

- moutkeuze
- koolzuur
- hop
- restsuiker

De beste 0.0-bieren voelen nog steeds compleet aan.

Dat noemen we balans.
',
    '- body
- balans
- mondgevoel
- structuur
- lengte',
    'Body is vaak het eerste wat ervaren proevers missen.
',
    '- Alcohol draagt body
- Zonder alcohol ontstaat leegte
- Balans is essentieel
',
    '### Opdracht

Proef een gewone pils en een 0.0 pils naast elkaar.

### Checklist

- Ik heb beide geproefd
- Ik heb body vergeleken
- Ik heb lengte vergeleken

### Reflectievraag

Waar zat het grootste verschil?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'proeven-beer-zero'
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
    'hoe-proef-je-bier-0-0',
    'Hoe proef je bier 0.0?',
    'Na deze les kun jij bier 0.0 systematisch analyseren.
',
    'Bier 0.0 proef je op dezelfde manier als regulier bier.

Je kijkt naar:

- kleur
- helderheid
- schuim

Je ruikt naar:

- mout
- hop
- fruit
- kruiden

Je proeft op:

- body
- zoetheid
- bitterheid
- lengte

Bij 0.0 is body vaak extra belangrijk.

Daar zit vaak het grootste verschil.

Een goede proefstructuur helpt je objectief te beoordelen.
',
    '- proefstructuur
- kijken
- ruiken
- proeven
- analyse
',
    'Veel professionele proevers herkennen 0.0 direct aan het mondgevoel.
',
    '- Kijk
- Ruik
- Proef
- Analyseer body en balans
',
    '### Opdracht

Proef een alcoholvrij bier met deze structuur.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb body beoordeeld

### Reflectievraag

Wat viel jou direct op?
',
    8,
    1
  ),
  (
    'body-analyseren',
    'Body analyseren',
    'Na deze les herken je body in bier 0.0.
',
    'Body is het gewicht en volume van bier in de mond.

Alcohol draagt veel bij aan body.

Bij 0.0 ontbreekt dat.

Daarom voelt alcoholvrij bier soms dunner.

Body wordt beïnvloed door:

- mout
- restsuiker
- koolzuur
- eiwitten

Sterke body zorgt voor meer tevredenheid.

Zwakke body maakt bier snel vlak.
',
    '- body
- mondgevoel
- volume
- structuur
- gewicht
',
    'Body bepaalt vaak hoe “echt” bier aanvoelt.
',
    '- Body is mondvolume
- Alcohol draagt body
- 0.0 mist dat soms
',
    '### Opdracht

Vergelijk body van twee verschillende 0.0-bieren.

### Checklist

- Ik heb twee stijlen gekozen
- Ik heb body vergeleken
- Ik heb verschil benoemd

### Reflectievraag

Welke voelde voller?
',
    8,
    2
  ),
  (
    'zoetheid-herkennen',
    'Zoetheid herkennen',
    'Na deze les kun je restzoetheid in bier 0.0 herkennen.
',
    'Veel alcoholvrije bieren bevatten meer restsuiker.

Dat komt vaak door gestopte fermentatie.

Zoetheid kan positief zijn.

Het geeft body en rondheid.

Maar teveel zoetheid maakt bier log.

Balans is essentieel.

Zoetheid herken je vooral op het puntje van je tong.
',
    '- zoetheid
- restsuiker
- balans
- rondheid
- smaak
',
    'Veel beginners verwarren body met zoetheid.
',
    '- Zoetheid komt vaak van restsuiker
- Kan body ondersteunen
- Teveel verstoort balans
',
    '### Opdracht

Proef twee 0.0-bieren en beoordeel zoetheid.

### Checklist

- Ik heb geproefd
- Ik heb zoetheid herkend
- Ik heb balans beoordeeld

### Reflectievraag

Was de zoetheid prettig?
',
    8,
    3
  ),
  (
    'bitterheid-en-balans',
    'Bitterheid en balans',
    'Na deze les begrijp je hoe bitterheid helpt bij balans.
',
    'Hop zorgt voor bitterheid.

Bitterheid compenseert zoetheid.

Bij 0.0 is dit extra belangrijk.

Zonder voldoende bitterheid voelt bier snel te zoet.

Bij IPA’s speelt bitterheid een grote rol.

Maar teveel bitterheid kan agressief worden.

De beste bieren hebben balans tussen:

- zoet
- bitter
- zuur
- body

Balans bepaalt drinkbaarheid.
',
    '- bitterheid
- hop
- balans
- drinkbaarheid
- structuur
',
    'IPA 0.0 wordt vaak gebruikt om balans te testen.
',
    '- Bitterheid komt van hop
- Bitter balanceert zoet
- Balans is cruciaal
',
    '### Opdracht

Vergelijk een 0.0 pils en 0.0 IPA.

### Checklist

- Ik heb bitterheid beoordeeld
- Ik heb balans vergeleken
- Ik heb verschil benoemd

### Reflectievraag

Welke voelde beter in balans?
',
    8,
    4
  ),
  (
    'mini-toets-0-0',
    'Mini-toets 0.0',
    'Na deze les kun je de basis van bier 0.0 analyseren en toepassen.
',
    'Deze les is een herhaling van module 1 t/m 3.

Je combineert:

- productie
- proeven
- body
- zoetheid
- bitterheid
- balans

Dit vormt jouw Explorer-basis.

Vanaf module 4 ga je verdiepen in stijlen.
',
    '- body
- balans
- zoetheid
- bitterheid
- stijlherkenning',
    '',
    '',
    '### Opdracht

Voer een mini blindproeverij uit met twee bier 0.0-stijlen.

Analyseer:

- body
- zoetheid
- bitterheid
- lengte
- stijl

### Checklist

- Ik heb blind geproefd
- Ik heb kenmerken genoteerd
- Ik heb stijl benoemd
- Ik heb mijn keuze onderbouwd

### Reflectievraag

Welke stijl kon je het snelst herkennen en waarom?

---
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klassieke-stijlen-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'klassieke-stijlen-beer-zero'
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
    'alcoholvrije-pils',
    'Alcoholvrije pils',
    'Na deze les herken je de kenmerken van alcoholvrije pils.
',
    'Pils is wereldwijd de meest gedronken bierstijl.

Ook binnen 0.0 is pils dominant.

Kenmerken:

- licht van kleur
- fris
- droog
- subtiele bitterheid

Alcoholvrije pils is vaak technisch lastig.

Omdat pils weinig smaakverberging heeft, vallen fouten sneller op.

Balans en frisheid zijn cruciaal.

Een goede 0.0 pils moet dorstlessend blijven.
',
    '- pils
- frisheid
- bitterheid
- balans
- drinkbaarheid
',
    'De meeste consumenten starten met alcoholvrij pils.
',
    '- Pils is licht en fris
- Fouten zijn snel herkenbaar
- Balans is essentieel
',
    '### Opdracht

Proef twee verschillende 0.0 pilseners.

### Checklist

- Ik heb kleur bekeken
- Ik heb body beoordeeld
- Ik heb bitterheid beoordeeld

### Reflectievraag

Welke was het meest verfrissend?
',
    8,
    1
  ),
  (
    'alcoholvrije-ipa',
    'Alcoholvrije IPA',
    'Na deze les herken je de kenmerken van alcoholvrije IPA.
',
    'IPA draait om hop.

Dat maakt IPA interessant voor alcoholvrij bier.

Hop kan namelijk bodyverlies deels compenseren.

Typische kenmerken:

- tropisch fruit
- citrus
- hars
- bitterheid

0.0 IPA heeft vaak meer smaakimpact dan pils.

Daardoor voelt het vaak completer.

Maar bitterheid moet goed in balans zijn.
',
    '- IPA
- hop
- bitterheid
- citrus
- tropisch fruit
',
    'IPA is één van de snelst groeiende alcoholvrije stijlen.
',
    '- IPA is hopgedreven
- Meer smaakimpact
- Bitterheid bepaalt kwaliteit
',
    '### Opdracht

Vergelijk een 0.0 IPA met een 0.0 pils.

### Checklist

- Ik heb aroma vergeleken
- Ik heb bitterheid vergeleken
- Ik heb body vergeleken

### Reflectievraag

Welke voelde voller?
',
    8,
    2
  ),
  (
    'alcoholvrije-witbieren',
    'Alcoholvrije witbieren',
    'Na deze les herken je alcoholvrije witbieren.
',
    'Witbier is zacht, troebel en fris.

Traditioneel bevat het:

- tarwe
- koriander
- sinaasappelschil

Deze aromatische stijl werkt goed zonder alcohol.

De kruidigheid helpt veel smaak te behouden.

0.0 witbier voelt vaak toegankelijk.

Het is populair bij lunch en lichte gerechten.
',
    '- witbier
- tarwe
- koriander
- citrus
- frisheid
',
    'Witbier is vaak één van de makkelijkst drinkbare 0.0-stijlen.
',
    '- Zacht en fris
- Aromatisch
- Goed inzetbaar bij eten
',
    '### Opdracht

Proef een 0.0 witbier.

### Checklist

- Ik heb kruidigheid herkend
- Ik heb body beoordeeld
- Ik heb frisheid beoordeeld

### Reflectievraag

Welke aroma’s herkende je?
',
    8,
    3
  ),
  (
    'alcoholvrije-blond',
    'Alcoholvrije blond',
    'Na deze les herken je alcoholvrije blond.
',
    'Blond bier is ronder en zachter dan pils.

Het heeft vaak:

- lichte moutigheid
- fruitigheid
- zachte bitterheid

In alcoholvrije vorm werkt blond goed.

De natuurlijke rondheid helpt body te behouden.

Daardoor voelt blond vaak voller dan pils.

Het is een brug tussen fris en rijk.
',
    '- blond
- mout
- fruitigheid
- body
- rondheid
',
    'Veel Belgische brouwers kiezen blond als eerste premium 0.0-stijl.
',
    '- Rond en toegankelijk
- Meer body dan pils
- Goede balans
',
    '### Opdracht

Vergelijk een blond 0.0 met pils 0.0.

### Checklist

- Ik heb body vergeleken
- Ik heb zoetheid vergeleken
- Ik heb balans beoordeeld

### Reflectievraag

Welke vond je complexer?
',
    8,
    4
  ),
  (
    'alcoholvrije-donker',
    'Alcoholvrije donker',
    'Na deze les herken je donkere alcoholvrije bierstijlen.
',
    'Donkere bierstijlen hebben meer geroosterde mout.

Dat geeft:

- koffie
- chocolade
- karamel
- toast

Deze smaken kunnen veel body suggereren.

Daardoor werkt donker bier verrassend goed als 0.0.

Het voelt vaak rijker.

Maar balans blijft belangrijk.

Teveel zoetheid maakt het zwaar.
',
    '- donker
- geroosterd
- koffie
- chocolade
- karamel',
    'Donkere 0.0-bieren worden steeds populairder in foodpairing.
',
    '- Donker geeft meer smaakdiepte
- Geroosterde mout helpt body
- Interessant voor pairing
',
    '### Opdracht

Proef een donker 0.0-bier.

### Checklist

- Ik heb geroosterde tonen herkend
- Ik heb body beoordeeld
- Ik heb zoetheid beoordeeld

### Reflectievraag

Welke smaken vielen op?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- markt-innovatie-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'markt-innovatie-beer-zero'
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
    'grote-merken',
    'Grote merken',
    'Na deze les herken je de grootste spelers in bier 0.0.
',
    'De alcoholvrije biermarkt wordt grotendeels gedreven door grote brouwerijen.

Deze hebben schaal, distributie en marketingkracht.

Belangrijke spelers zijn:

- Heineken
- Bavaria
- Jupiler
- Budweiser
- Guinness

Grote merken zorgen voor normalisatie.

Zij maken 0.0 mainstream.

Door hun bereik groeit acceptatie snel.

Kwaliteit is de laatste jaren sterk verbeterd.
',
    '- merken
- distributie
- schaal
- mainstream
- groei
',
    'Heineken 0.0 wordt in meer dan 100 landen verkocht.
',
    '- Grote merken domineren
- Zij versnellen marktgroei
- Kwaliteit stijgt wereldwijd
',
    '### Opdracht

Zoek vijf grote alcoholvrije merken.

### Checklist

- Ik heb vijf merken gevonden
- Ik ken het moederbedrijf
- Ik herken hun positionering

### Reflectievraag

Welk merk zie jij het meest?
',
    8,
    1
  ),
  (
    'craft-0-0',
    'Craft 0.0',
    'Na deze les begrijp je de rol van craft-brouwers binnen 0.0.
',
    'Craft-brouwers brengen innovatie.

Waar grote merken veiligheid bieden, brengen craft-brouwers creativiteit.

Denk aan:

- nieuwe hopsoorten
- barrel-inspired stijlen
- sour 0.0
- experimentele IPA’s

Craft 0.0 groeit hard.

Vooral onder ervaren bierdrinkers.

De uitdaging blijft technische kwaliteit.

Smaakverwachting ligt hoog.
',
    '- craft
- innovatie
- experiment
- premium
- niche
',
    'Veel craft 0.0-bieren winnen inmiddels internationale prijzen.
',
    '- Craft zorgt voor innovatie
- Meer experiment
- Hogere smaakverwachting
',
    '### Opdracht

Zoek drie craft alcoholvrije bieren.

### Checklist

- Ik heb drie gevonden
- Ik heb stijl bekeken
- Ik heb innovatie herkend

### Reflectievraag

Welke stijl vond je verrassend?
',
    8,
    2
  ),
  (
    'isotone-positionering',
    'Isotone positionering',
    'Na deze les begrijp je waarom bier 0.0 vaak als sportdrank wordt gepositioneerd.
',
    'Alcoholvrij bier bevat water, koolhydraten en mineralen.

Daardoor wordt het soms gepositioneerd als isotone drank.

Vooral na sport.

Het idee:

- hydrateren
- koolhydraten aanvullen
- ontspanning bieden

Vooral in Duitsland is deze positionering sterk.

Toch verschilt kwaliteit sterk per merk.

Niet elk 0.0-bier is echt functioneel.
',
    '- isotoon
- sport
- hydratatie
- herstel
- mineralen
',
    'Sommige marathonlopers drinken bewust alcoholvrij bier na de finish.
',
    '- Sportpositionering groeit
- Isotoon betekent functionele inzet
- Niet elk bier is gelijk
',
    '### Opdracht

Vergelijk een sportdrank en een 0.0-bier op voedingswaarde.

### Checklist

- Ik heb suiker bekeken
- Ik heb koolhydraten bekeken
- Ik heb mineralen bekeken

### Reflectievraag

Wat viel op?
',
    8,
    3
  ),
  (
    'functionele-bieren',
    'Functionele bieren',
    'Na deze les begrijp je wat functionele alcoholvrije bieren zijn.
',
    'Nieuwe 0.0-bieren voegen extra functies toe.

Denk aan:

- vitamines
- elektrolyten
- adaptogenen
- extra eiwitten

Hierdoor verschuift bier van genotsproduct naar lifestyleproduct.

Dit opent nieuwe markten.

Vooral sport, wellness en health.

De grens tussen bier en functionele drank vervaagt.
',
    '- functioneel
- vitamines
- elektrolyten
- herstel
- wellness
',
    'Sommige alcoholvrije bieren worden verkocht als recovery drink.
',
    '- Nieuwe functies ontstaan
- Bier wordt lifestyle
- Markt wordt breder
',
    '### Opdracht

Zoek twee functionele alcoholvrije bieren.

### Checklist

- Ik heb ingrediënten bekeken
- Ik heb claims gelezen
- Ik begrijp de functie

### Reflectievraag

Zou jij dit drinken?
',
    8,
    4
  ),
  (
    'premium-alcoholvrij',
    'Premium alcoholvrij',
    'Na deze les begrijp je hoe premium positionering werkt binnen bier 0.0.
',
    'Premium alcoholvrij draait om kwaliteit.

Belangrijke elementen:

- betere ingrediënten
- geavanceerde techniek
- complexere smaak
- luxere branding

Consumenten betalen steeds vaker meer voor betere 0.0.

De markt beweegt omhoog.

Net als bij wijn en koffie ontstaat segmentatie.

Goedkoop, mainstream en premium.

Dat maakt 0.0 volwassen.
',
    '- premium
- segmentatie
- kwaliteit
- branding
- innovatie',
    'Sommige alcoholvrije craft IPA’s zijn duurder dan reguliere IPA’s.
',
    '- Premium groeit snel
- Kwaliteit bepaalt prijs
- Markt segmenteert
',
    '### Opdracht

Vergelijk een goedkoop en premium 0.0-bier.

### Checklist

- Ik heb prijs vergeleken
- Ik heb smaak vergeleken
- Ik heb branding bekeken

### Reflectievraag

Was premium het waard?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- gezondheid-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'gezondheid-beer-zero'
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
    'sport-en-herstel',
    'Sport en herstel',
    'Na deze les begrijp je waarom bier 0.0 vaak wordt gekoppeld aan sport en herstel.
',
    'Alcoholvrij bier wordt steeds vaker geconsumeerd na sport.

Dat komt door:

- vocht
- koolhydraten
- mineralen

Na inspanning helpt hydratatie bij herstel.

Alcoholvrij bier kan daarin een rol spelen.

Vooral lichte stijlen.

Belangrijk is wel dat het geen vervanging is voor water.

Het is vooral aanvullend.

Voor veel sporters biedt het ook een mentaal beloningsmoment.
',
    '- sport
- herstel
- hydratatie
- koolhydraten
- mineralen
',
    'In Duitsland is alcoholvrij bier al jarenlang onderdeel van sportcultuur.
',
    '- Bier 0.0 wordt vaak na sport gebruikt
- Hydratatie en koolhydraten spelen rol
- Geen vervanging voor water
',
    '### Opdracht

Bekijk de voedingswaarden van jouw favoriete 0.0-bier.

### Checklist

- Ik heb koolhydraten bekeken
- Ik heb calorieën bekeken
- Ik heb mineralen bekeken

### Reflectievraag

Past dit bij sport?
',
    8,
    1
  ),
  (
    'calorieen-vergelijken',
    'Calorieën vergelijken',
    'Na deze les kun jij calorieën van bier 0.0 vergelijken met regulier bier.
',
    'Bier 0.0 bevat meestal minder calorieën dan normaal bier.

Gemiddeld:

- regulier pils: 40–50 kcal per 100 ml
- bier 0.0: 15–30 kcal per 100 ml

Dat verschil ontstaat vooral door minder alcohol.

Alcohol bevat namelijk veel energie.

Toch kunnen sommige 0.0-bieren relatief veel suiker bevatten.

Daarom is caloriearm niet altijd suikerarm.

Etiketten lezen is belangrijk.
',
    '- calorieën
- alcohol
- suiker
- etiketten
- energie
',
    'Alcohol levert bijna net zoveel calorieën als vet.
',
    '- Bier 0.0 is vaak caloriearmer
- Alcohol draagt veel calorieën
- Suiker blijft belangrijk
',
    '### Opdracht

Vergelijk drie 0.0-bieren op calorieën.

### Checklist

- Ik heb calorieën bekeken
- Ik heb suiker bekeken
- Ik heb verschillen genoteerd

### Reflectievraag

Wat verraste je?
',
    8,
    2
  ),
  (
    'suiker-en-restsuiker',
    'Suiker en restsuiker',
    'Na deze les begrijp je de rol van suiker in bier 0.0.
',
    'Veel alcoholvrije bieren bevatten restsuiker.

Dat komt doordat fermentatie soms vroeg wordt gestopt.

Restsuiker geeft:

- body
- rondheid
- zachtheid

Maar teveel suiker kan nadelen hebben.

Vooral bij:

- gewichtsbeheersing
- bloedsuiker
- dagelijkse consumptie

Niet elk 0.0-bier is dus automatisch “gezond”.

Bewust kiezen blijft belangrijk.
',
    '- suiker
- restsuiker
- fermentatie
- gezondheid
- keuze
',
    'Sommige 0.0 IPA’s bevatten minder suiker dan alcoholvrije pils.
',
    '- Restsuiker beïnvloedt smaak
- Meer suiker betekent niet altijd beter
- Gezonde keuze vraagt inzicht
',
    '### Opdracht

Lees van twee 0.0-bieren de suikerwaarde.

### Checklist

- Ik heb suiker per 100 ml bekeken
- Ik heb het vergeleken
- Ik heb mijn voorkeur gekozen

### Reflectievraag

Maakt suiker jouw keuze anders?
',
    8,
    3
  ),
  (
    'hydratatie',
    'Hydratatie',
    'Na deze les begrijp je hoe bier 0.0 past binnen hydratatie.
',
    'Alcohol werkt vochtafdrijvend.

Dat doet bier 0.0 niet of nauwelijks.

Daardoor past het beter binnen hydratatie.

Het bevat vooral:

- water
- koolhydraten
- kleine hoeveelheden mineralen

Vooral na warmte of sport kan dit aantrekkelijk zijn.

Maar water blijft de basis.

Bier 0.0 is een aanvulling, geen fundament.
',
    '- hydratatie
- vocht
- water
- herstel
- balans
',
    'Veel wielerevenementen sponsoren tegenwoordig alcoholvrije bieren.
',
    '- Geen uitdrogend effect
- Hydratatievriendelijker
- Water blijft basis
',
    '### Opdracht

Bekijk wanneer jij bier 0.0 drinkt in relatie tot hydratatie.

### Checklist

- Ik heb mijn momenten bekeken
- Ik heb watergebruik vergeleken
- Ik heb mijn routine geëvalueerd

### Reflectievraag

Waar past 0.0 logisch?
',
    8,
    4
  ),
  (
    'alcoholvrij-in-sociale-context',
    'Alcoholvrij in sociale context',
    'Na deze les begrijp je waarom bier 0.0 sociaal steeds normaler wordt.
',
    'Alcoholvrij bier is sterk veranderd in imago.

Waar het vroeger uitzondering was, is het nu normaal.

Redenen:

- bewust leven
- rijden
- werk
- gezondheid
- sport

Sociale acceptatie groeit snel.

Daardoor kiezen steeds meer mensen bewust voor afwisseling.

Niet altijd alcohol, maar soms 0.0.

Dit verandert drinkcultuur.
',
    '- lifestyle
- sociaal
- gezondheid
- keuze
- bewustzijn',
    'In veel restaurants is alcoholvrij bier nu standaard op de kaart.
',
    '- Imago is sterk verbeterd
- Sociaal volledig geaccepteerd
- Onderdeel van moderne lifestyle
',
    '### Opdracht

Observeer een sociale setting waar bier 0.0 aanwezig is.

### Checklist

- Ik heb keuzegedrag bekeken
- Ik heb redenen herkend
- Ik heb trends gezien

### Reflectievraag

Hoe zie jij deze ontwikkeling?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'service-beer-zero'
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
    'Na deze les begrijp je hoe temperatuur de smaak van bier 0.0 beïnvloedt.
',
    'Temperatuur heeft enorme invloed op smaak.

Te koud:

- minder aroma
- minder smaakbeleving

Te warm:

- sneller vlak
- minder fris

Algemene richtlijnen:

- pils: 3–5°C
- witbier: 4–6°C
- IPA: 6–8°C
- blond: 6–8°C
- donker: 8–10°C

Bij bier 0.0 is frisheid vaak extra belangrijk.

Daarom wordt het meestal iets koeler geserveerd.
',
    '- temperatuur
- frisheid
- aroma
- stijl
- service
',
    'Te koud serveren maskeert fouten.
',
    '- Temperatuur beïnvloedt aroma
- Elke stijl heeft ideale range
- 0.0 profiteert vaak van frisheid
',
    '### Opdracht

Proef hetzelfde bier op twee temperaturen.

### Checklist

- Ik heb koud geproefd
- Ik heb warmer geproefd
- Ik heb verschil genoteerd

### Reflectievraag

Welke temperatuur werkte beter?
',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp je waarom glaswerk belangrijk is bij bier 0.0.
',
    'Glaswerk beïnvloedt:

- aroma
- schuimvorming
- temperatuur
- presentatie

Pils werkt goed in slanke glazen.

IPA profiteert van bredere opening.

Witbier vraagt vaak groter volume.

Donkere bieren mogen compacter en aromatischer.

Een goed glas versterkt beleving.

Bij 0.0 is dat extra belangrijk omdat aroma cruciaal is.
',
    '- glaswerk
- aroma
- schuim
- presentatie
- mondgevoel
',
    'Een vet glas vernietigt schuim.
',
    '- Glas beïnvloedt beleving
- Aroma en schuim zijn verbonden
- Schoon glas is essentieel
',
    '### Opdracht

Drink hetzelfde bier uit twee verschillende glazen.

### Checklist

- Ik heb aroma vergeleken
- Ik heb schuim vergeleken
- Ik heb mondgevoel vergeleken

### Reflectievraag

Welke werkte beter?
',
    8,
    2
  ),
  (
    'presentatie',
    'Presentatie',
    'Na deze les begrijp je hoe presentatie de ervaring beïnvloedt.
',
    'Presentatie bepaalt verwachting.

Dat begint bij:

- fles of blik
- glas
- inschenken
- schuimkraag

Een nette presentatie verhoogt waardering.

Bij horeca is dit cruciaal.

Ook thuis maakt het verschil.

Bij bier 0.0 helpt presentatie om het product serieus te nemen.

Het normaliseert alcoholvrij drinken.
',
    '- presentatie
- inschenken
- visueel
- verwachting
- service
',
    'Mensen beoordelen smaak deels op basis van visuele verwachting.
',
    '- Presentatie beïnvloedt beleving
- Eerste indruk is belangrijk
- Visuele kwaliteit telt
',
    '### Opdracht

Serveer een 0.0-bier alsof je in horeca werkt.

### Checklist

- Ik heb correct glas gekozen
- Ik heb goed ingeschonken
- Ik heb schuim gecontroleerd

### Reflectievraag

Voelde het professioneler?
',
    8,
    3
  ),
  (
    'bewaren',
    'Bewaren',
    'Na deze les begrijp je hoe bier 0.0 correct bewaard wordt.
',
    'Alcoholvrij bier is vaak gevoeliger voor kwaliteitsverlies.

Belangrijke factoren:

- licht
- warmte
- zuurstof
- tijd

Bewaar bier:

- koel
- donker
- rechtop

Licht kan skunky aroma’s veroorzaken.

Warmte versnelt veroudering.

Ook alcoholvrij bier heeft houdbaarheid.

Vers is bijna altijd beter.
',
    '- bewaren
- houdbaarheid
- oxidatie
- versheid
- licht
',
    'Hop-aroma verliest sneller intensiteit bij warmte.
',
    '- Koel en donker bewaren
- Vermijd warmte
- Versheid is belangrijk
',
    '### Opdracht

Controleer jouw voorraad bier 0.0.

### Checklist

- Ik heb houdbaarheid bekeken
- Ik heb opslag bekeken
- Ik heb verbeterpunten gevonden

### Reflectievraag

Bewaar jij goed?
',
    8,
    4
  ),
  (
    'service-in-de-praktijk',
    'Service in de praktijk',
    'Na deze les kun jij bier 0.0 professioneel serveren in praktijk.
',
    'Nu combineer je alles:

- temperatuur
- glaswerk
- presentatie
- bewaren

Professionele service maakt groot verschil.

Zeker bij alcoholvrij bier.

Omdat perceptie hier extra belangrijk is.

Een perfecte service verhoogt kwaliteit, waardering en drinkervaring.

Dat geldt thuis én in horeca.
',
    '- service
- glaswerk
- temperatuur
- presentatie
- praktijk',
    '',
    '',
    '### Opdracht

Serveer twee verschillende bier 0.0-stijlen volledig professioneel.

Let op:

- juiste temperatuur
- juiste glaskeuze
- correcte inschenktechniek
- presentatie
- schuimkraag

### Checklist

- Ik heb correct gekoeld
- Ik heb juiste glazen gekozen
- Ik heb correct ingeschonken
- Ik heb presentatie beoordeeld
- Ik heb aroma gecontroleerd

### Reflectievraag

Welke servicekeuze had de meeste invloed op de totale beleving?

---
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'pairing-beer-zero'
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
    '0-0-en-lunch',
    '0.0 & lunch',
    'Na deze les begrijp je waarom bier 0.0 ideaal kan zijn bij lunch.
',
    'Lunch vraagt vaak om lichtere dranken.

Bier 0.0 past hier goed.

Waarom?

- lager alcohol
- hogere frisheid
- minder vermoeiend
- meer functioneel

Goede combinaties:

- pils met sandwiches
- witbier met salades
- blond met quiche

Bij lunch draait pairing om frisheid en verteerbaarheid.

0.0 ondersteunt dat uitstekend.
',
    '- lunch
- frisheid
- licht
- pairing
- balans
',
    'Steeds meer lunchrestaurants bieden alcoholvrije pairings aan.
',
    '- Lunch vraagt lichte pairings
- 0.0 biedt frisheid
- Functioneel én gastronomisch inzetbaar
',
    '### Opdracht

Combineer een lunchgerecht met een bier 0.0.

### Checklist

- Ik koos gerecht
- Ik koos bierstijl
- Ik noteerde waarom

### Reflectievraag

Werkte de pairing logisch?
',
    8,
    1
  ),
  (
    '0-0-en-kaas',
    '0.0 & kaas',
    'Na deze les kun jij basiscombinaties maken tussen bier 0.0 en kaas.
',
    'Kaas en bier zijn klassieke partners.

Ook alcoholvrij werkt dat goed.

Belangrijk:

- vet vraagt frisheid
- zout vraagt bitterheid
- romigheid vraagt koolzuur

Voorbeelden:

- pils + jonge kaas
- IPA + oude kaas
- blond + zachte witschimmel
- donker + blauwschimmel

Kaas maakt bodyverschillen extra duidelijk.

Dat is leerzaam.
',
    '- kaas
- vet
- zout
- koolzuur
- bitterheid
',
    'Koolzuur helpt vet van kaas weg te spoelen.
',
    '- Vet en koolzuur werken samen
- Bitter ondersteunt zout
- Kaas test body
',
    '### Opdracht

Proef twee kazen met één bier 0.0.

### Checklist

- Ik proefde los
- Ik proefde samen
- Ik noteerde verschil

### Reflectievraag

Wat veranderde?
',
    8,
    2
  ),
  (
    '0-0-en-lichte-gerechten',
    '0.0 & lichte gerechten',
    'Na deze les begrijp je hoe bier 0.0 werkt bij lichte gerechten.
',
    'Lichte gerechten vragen subtiele pairings.

Denk aan:

- vis
- kip
- salades
- groente
- sushi

Geschikte stijlen:

- pils
- witbier
- blond

Belangrijk is balans.

Het bier mag niet domineren.

Frisheid ondersteunt vaak beter dan kracht.

Bij alcoholvrij is dit extra logisch.
',
    '- lichte gerechten
- balans
- subtiliteit
- frisheid
- pairing
',
    'Witbier is vaak één van de meest veelzijdige foodpairing-stijlen.
',
    '- Licht eten vraagt lichte pairing
- Balans is cruciaal
- Witbier en pils zijn sterk inzetbaar
',
    '### Opdracht

Maak een pairing met een licht gerecht.

### Checklist

- Ik koos gerecht
- Ik koos bier
- Ik beoordeelde balans

### Reflectievraag

Was het bier ondersteunend?
',
    8,
    3
  ),
  (
    'contrast-en-harmonie',
    'Contrast & harmonie',
    'Na deze les begrijp je de twee belangrijkste pairingprincipes.
',
    'Er zijn twee basisstrategieën:

### Harmonie

Je zoekt overeenkomst.

Bijvoorbeeld:

- zacht bier + zacht gerecht
- romig bier + romige kaas

### Contrast

Je zoekt spanning.

Bijvoorbeeld:

- bitter bier + vet gerecht
- fris bier + zout gerecht

Beide werken.

De keuze hangt af van doel en stijl.

Goede sommeliers beheersen beide.
',
    '- harmonie
- contrast
- spanning
- pairing
- structuur
',
    'Veel top-pairings werken juist op contrast.
',
    '- Harmonie zoekt overeenkomst
- Contrast zoekt spanning
- Beide zijn belangrijk
',
    '### Opdracht

Maak één harmonie-pairing en één contrast-pairing.

### Checklist

- Ik heb beide gemaakt
- Ik heb verschil geproefd
- Ik heb voorkeur bepaald

### Reflectievraag

Welke werkte beter?
',
    8,
    4
  ),
  (
    'bier-0-0-in-gastronomie',
    'Bier 0.0 in gastronomie',
    'Na deze les begrijp je hoe bier 0.0 professioneel ingezet wordt binnen gastronomie.
',
    'Alcoholvrije pairings groeien snel.

Restaurants bieden steeds vaker:

- alcoholvrije pairing menus
- lunchpairings
- sportgerichte pairings
- wellnessconcepten

Bier 0.0 speelt hierin een belangrijke rol.

Waarom?

- breed inzetbaar
- fris
- toegankelijk
- betaalbaar

De toekomst van gastronomie is hybride:

soms alcohol, soms niet.

Bier 0.0 wordt daarin steeds belangrijker.
',
    '- gastronomie
- pairing
- menu
- alcoholvrij
- foodpairing',
    '',
    '',
    '### Opdracht

Bouw een mini tasting-menu met drie gangen.

Koppel per gerecht:

- één bier 0.0
- één pairing-logica
- één argumentatie

### Checklist

- Ik heb drie gerechten gekozen
- Ik heb drie bierstijlen gekozen
- Ik heb de pairing uitgelegd
- Ik heb balans beoordeeld

### Reflectievraag

Welke pairing werkte het sterkst en waarom?

---
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-beer-zero (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero' and m.slug = 'examen-beer-zero'
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
    '0-0-pils-vs-gewone-pils',
    '0.0 pils vs gewone pils',
    'Na deze les kun jij de verschillen herkennen tussen alcoholvrije pils en gewone pils.
',
    'Pils lijkt simpel, maar is technisch moeilijk.

Bij vergelijking vallen vooral op:

Bij gewone pils:

- meer body
- langere afdronk
- warmere structuur

Bij 0.0 pils:

- lichtere body
- vaak iets zoeter
- kortere lengte

Blind vergelijken helpt je deze nuances begrijpen.

Dit is één van de belangrijkste oefeningen.
',
    '- pils
- body
- vergelijking
- lengte
- structuur
',
    'Veel beginners herkennen het verschil vooral via mondgevoel.
',
    '- Body is vaak grootste verschil
- 0.0 voelt lichter
- Blind vergelijken versnelt leren
',
    '### Opdracht

Proef blind één gewone pils en één 0.0 pils.

### Checklist

- Ik heb body vergeleken
- Ik heb zoetheid vergeleken
- Ik heb lengte vergeleken

### Reflectievraag

Wat viel het meest op?
',
    8,
    1
  ),
  (
    '0-0-ipa-vs-gewone-ipa',
    '0.0 IPA vs gewone IPA',
    'Na deze les herken je verschillen tussen alcoholvrije en reguliere IPA.
',
    'IPA is interessanter dan pils voor blindproeven.

Waarom?

Hop maskeert veel verschillen.

Maar toch merk je:

Gewone IPA:

- meer body
- langere bitterheid
- warmere afdronk

0.0 IPA:

- vaak frisser
- korter
- soms iets zoeter

Hop maakt stijlherkenning uitdagender.

Dat maakt deze oefening waardevol.
',
    '- IPA
- hop
- bitterheid
- body
- blindproeven
',
    'Ervaren proevers maken hier vaker fouten dan bij pils.
',
    '- IPA is complexer blind
- Hop maskeert verschillen
- Body blijft sleutel
',
    '### Opdracht

Vergelijk blind twee IPA’s.

### Checklist

- Ik heb aroma vergeleken
- Ik heb body beoordeeld
- Ik heb alcohol ingeschat

### Reflectievraag

Welke was moeilijker?
',
    8,
    2
  ),
  (
    'stijlherkenning-blind',
    'Stijlherkenning blind',
    'Na deze les kun jij de belangrijkste bier 0.0-stijlen blind herkennen.
',
    'Nu combineer je alles wat je geleerd hebt.

Herkenning draait om:

- kleur
- aroma
- body
- bitterheid
- zoetheid

Belangrijkste stijlen:

- pils
- IPA
- witbier
- blond
- donker

Blindproeven maakt je objectiever.

Je leert sneller nuances herkennen.

Dat is essentieel voor Master-niveau.
',
    '- blindproeven
- stijl
- analyse
- herkenning
- structuur
',
    'Professionele sommeliers trainen vaak blind.
',
    '- Blindproeven scherpt analyse
- Stijlherkenning vraagt structuur
- Herhaling versterkt kennis
',
    '### Opdracht

Proef drie bier 0.0 blind.

### Checklist

- Ik heb stijl benoemd
- Ik heb body beoordeeld
- Ik heb aroma genoteerd

### Reflectievraag

Welke stijl herkende je direct?
',
    8,
    3
  ),
  (
    'theorie-examen',
    'Theorie-examen',
    'Na deze les toets je jouw volledige theoretische kennis.
',
    'Dit examen behandelt:

- fundament
- productie
- proeven
- stijlen
- markt
- gezondheid
- service
- pairing

Je toont aan dat je de theorie beheerst.

Het examen vormt de afsluiting van jouw kennisbasis.

Bij voldoende score ontvang je jouw Bier 0.0-certificering.
',
    '- theorie
- examen
- certificering
- kennis
- toetsing
',
    '',
    '- Volledige theoretische toets
- Alle modules komen terug
- Certificeringsmoment
',
    '### Opdracht

Maak jouw eigen examenvoorbereiding.

Herhaal:

- productiemethoden
- stijlkenmerken
- serviceprincipes
- pairinglogica

Maak een lijst van jouw zwakste onderdelen.

### Checklist

- Ik heb mijn theorie herhaald
- Ik heb mijn zwakke punten benoemd
- Ik heb een leerplan gemaakt

### Reflectievraag

Waar voel jij nog de meeste onzekerheid?

---
',
    15,
    4
  ),
  (
    'praktijk-examen',
    'Praktijkexamen',
    'Na deze les toon jij jouw praktische vaardigheid in bier 0.0.
',
    'Praktijk is het hoogste niveau.

Je voert uit:

- blindproeven
- stijlherkenning
- service
- pairing

Je laat zien dat je bier 0.0 professioneel begrijpt.

Dit is de finale stap binnen deze track.

Na afronding beheers je:

- theorie
- praktijk
- service
- gastronomie

Daarmee ben je officieel klaar voor het Bier 0.0 Master-niveau.
',
    '- praktijk
- examen
- blindproeven
- service
- pairing',
    '',
    '',
    '### Opdracht

Voer jouw volledige praktijkproef uit:

1. Blindproef drie bier 0.0-stijlen  
2. Benoem stijl en argumentatie  
3. Serveer één bier professioneel  
4. Maak één foodpairing  
5. Onderbouw jouw keuzes

### Checklist

- Ik heb blind geanalyseerd
- Ik heb stijlen benoemd
- Ik heb service correct uitgevoerd
- Ik heb pairing logisch opgebouwd

### Reflectievraag

Waar ben jij het meest in gegroeid?

---
',
    20,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- Quizvragen
with l as (
  select l.id, m.slug as module_slug, l.slug as lesson_slug
  from academy.lessons l
  join academy.modules m on m.id = l.module_id
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer-zero'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-beer-zero', 'wat-is-bier-0-0', 1, 'Hoeveel alcohol mag bier 0.0 maximaal bevatten?', '["0.05%", "0.5%", "1%", "2%"]', 0, 'Correct: 0.05%'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 2, 'Wordt bier 0.0 als bier gebrouwen?', '["Ja", "Nee", "Soms", "Alleen pils"]', 0, 'Correct: Ja'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 3, 'Wat gebeurt er daarna?', '["Alcohol wordt verwijderd", "Water toegevoegd", "Koolzuur toegevoegd", "Pasteurisatie"]', 0, 'Correct: Alcohol wordt verwijderd'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 4, 'Waarom groeit bier 0.0?', '["Gezondheid", "Hogere alcohol", "Goedkoper", "Meer bitter"]', 0, 'Correct: Gezondheid'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 5, '0.0 betekent:', '["Praktisch alcoholvrij", "Volledig zonder bier", "Zonder hop", "Zonder gist"]', 0, 'Correct: Praktisch alcoholvrij'),
  ('intro-beer-zero', 'hoe-wordt-alcohol-verwijderd', 1, 'Welke methode stopt vroegtijdig?', '["Gestopte fermentatie", "Filtering", "Pasteurisatie", "Koeling"]', 0, 'Correct: Gestopte fermentatie'),
  ('intro-beer-zero', 'hoe-wordt-alcohol-verwijderd', 2, 'Welke techniek gebruikt hitte?', '["Vacuümdestillatie", "Koeling", "Carbonisatie", "Lagering"]', 0, 'Correct: Vacuümdestillatie'),
  ('intro-beer-zero', 'hoe-wordt-alcohol-verwijderd', 3, 'Welke techniek gebruikt membranen?', '["Reverse osmosis", "Koken", "Dry hopping", "Mouten"]', 0, 'Correct: Reverse osmosis'),
  ('intro-beer-zero', 'hoe-wordt-alcohol-verwijderd', 4, 'Wat verandert altijd?', '["Smaak", "Glaswerk", "Schuim", "Kleur"]', 0, 'Correct: Smaak'),
  ('intro-beer-zero', 'hoe-wordt-alcohol-verwijderd', 5, 'Welke methode is technisch het meest geavanceerd?', '["Reverse osmosis", "Koeling", "Bottelen", "Lagering"]', 0, 'Correct: Reverse osmosis'),
  ('intro-beer-zero', 'waarom-is-bier-0-0-uniek', 1, 'Wat maakt bier 0.0 uniek?', '["Geen alcohol", "Meer alcohol", "Geen hop", "Geen schuim"]', 0, 'Correct: Geen alcohol'),
  ('intro-beer-zero', 'waarom-is-bier-0-0-uniek', 2, 'Waarvoor is 0.0 populair?', '["Sport", "Distillatie", "Wijnproeven", "Rijping"]', 0, 'Correct: Sport'),
  ('intro-beer-zero', 'waarom-is-bier-0-0-uniek', 3, 'Wat mist soms?', '["Body", "Kleur", "Koolzuur", "Bitterheid"]', 0, 'Correct: Body'),
  ('intro-beer-zero', 'waarom-is-bier-0-0-uniek', 4, 'Waarom is het moeilijk?', '["Smaakbehoud", "Flesvorm", "Etiket", "Glas"]', 0, 'Correct: Smaakbehoud'),
  ('intro-beer-zero', 'waarom-is-bier-0-0-uniek', 5, '0.0 is vooral:', '["Functioneel", "Sterk", "Zoet", "Oud"]', 0, 'Correct: Functioneel'),
  ('intro-beer-zero', 'geschiedenis-van-alcoholvrij-bier', 1, 'Waarom was alcoholvrij bier vroeger minder populair?', '["Te duur", "Minder smaakkwaliteit", "Verboden", "Te sterk"]', 1, 'Correct: Minder smaakkwaliteit'),
  ('intro-beer-zero', 'geschiedenis-van-alcoholvrij-bier', 2, 'Wat heeft de kwaliteit sterk verbeterd?', '["Nieuwe etiketten", "Nieuwe technologie", "Meer water", "Minder hop"]', 1, 'Correct: Nieuwe technologie'),
  ('intro-beer-zero', 'geschiedenis-van-alcoholvrij-bier', 3, 'Wanneer groeide de markt explosief?', '["Laatste 10 jaar", "Jaren 50", "Jaren 70", "Jaren 80"]', 0, 'Correct: Laatste 10 jaar'),
  ('intro-beer-zero', 'geschiedenis-van-alcoholvrij-bier', 4, 'Wat veranderde vooral?', '["Glaswerk", "Productietechnieken", "Flessen", "Schuim"]', 1, 'Correct: Productietechnieken'),
  ('intro-beer-zero', 'geschiedenis-van-alcoholvrij-bier', 5, 'Is alcoholvrij bier vandaag nog niche?', '["Ja", "Nee", "Alleen sport", "Alleen horeca"]', 1, 'Correct: Nee'),
  ('intro-beer-zero', 'belangrijkste-categorieen', 1, 'Welke stijl is meestal het lichtst en meest dorstlessend?', '["Pils", "Donker", "Blond", "IPA"]', 0, 'Correct: Pils'),
  ('intro-beer-zero', 'belangrijkste-categorieen', 2, 'Welke stijl staat bekend om sterke hoparoma’s?', '["IPA", "Witbier", "Blond", "Donker"]', 0, 'Correct: IPA'),
  ('intro-beer-zero', 'belangrijkste-categorieen', 3, 'Welke stijl bevat vaak tarwe en kruiden?', '["Witbier", "Pils", "IPA", "Donker"]', 0, 'Correct: Witbier'),
  ('intro-beer-zero', 'belangrijkste-categorieen', 4, 'Welke stijl heeft vaak geroosterde smaken?', '["Donker", "Pils", "Blond", "Witbier"]', 0, 'Correct: Donker'),
  ('intro-beer-zero', 'belangrijkste-categorieen', 5, 'Waarom is stijlherkenning belangrijk?', '["Voor temperatuur", "Voor pairing en proeven", "Voor etiketten", "Voor marketing"]', 1, 'Correct: Voor pairing en proeven'),
  ('productie-beer-zero', 'gestopte-fermentatie', 1, 'Wat stopt vroeg?', '["Fermentatie", "Filtering", "Botteling", "Rijping"]', 0, 'Correct: Fermentatie'),
  ('productie-beer-zero', 'gestopte-fermentatie', 2, 'Wat blijft vaker over?', '["Restsuiker", "Hop", "Water", "Koolzuur"]', 0, 'Correct: Restsuiker'),
  ('productie-beer-zero', 'gestopte-fermentatie', 3, 'Wat is voordeel?', '["Minder alcohol verwijderen", "Meer bitterheid", "Meer kleur", "Meer schuim"]', 0, 'Correct: Minder alcohol verwijderen'),
  ('productie-beer-zero', 'gestopte-fermentatie', 4, 'Wat is nadeel?', '["Meer zoetheid", "Minder schuim", "Minder glaswerk", "Minder kleur"]', 0, 'Correct: Meer zoetheid'),
  ('productie-beer-zero', 'gestopte-fermentatie', 5, 'Deze techniek is vaak:', '["Simpel", "Complex", "Duur", "Oud"]', 0, 'Correct: Simpel'),
  ('productie-beer-zero', 'vacuümdestillatie', 1, 'Waarom wordt vacuüm gebruikt?', '["Meer schuim", "Lager kookpunt", "Meer kleur", "Minder hop"]', 1, 'Correct: Lager kookpunt'),
  ('productie-beer-zero', 'vacuümdestillatie', 2, 'Wat wordt verwijderd?', '["Water", "Alcohol", "Gist", "Schuim"]', 1, 'Correct: Alcohol'),
  ('productie-beer-zero', 'vacuümdestillatie', 3, 'Wat is het grootste voordeel?', '["Minder hitteschade", "Meer suiker", "Meer bitterheid", "Meer alcohol"]', 0, 'Correct: Minder hitteschade'),
  ('productie-beer-zero', 'vacuümdestillatie', 4, 'Waarom is dit interessant voor premium bier?', '["Meer aroma blijft behouden", "Meer kleur", "Meer schuim", "Goedkoper"]', 0, 'Correct: Meer aroma blijft behouden'),
  ('productie-beer-zero', 'vacuümdestillatie', 5, 'Welke factor is hier cruciaal?', '["Temperatuur", "Glaswerk", "Etiket", "Flesvorm"]', 0, 'Correct: Temperatuur'),
  ('productie-beer-zero', 'reverse-osmosis', 1, 'Wat gebruikt reverse osmosis?', '["Membranen", "Hout", "Vuur", "Gist"]', 0, 'Correct: Membranen'),
  ('productie-beer-zero', 'reverse-osmosis', 2, 'Wat wordt gescheiden?', '["Alcohol en vloeistof", "Hop en mout", "Schuim en water", "Kleur en geur"]', 0, 'Correct: Alcohol en vloeistof'),
  ('productie-beer-zero', 'reverse-osmosis', 3, 'Waarom is deze techniek bijzonder?', '["Hoge precisie", "Lage kosten", "Veel schuim", "Snelle fermentatie"]', 0, 'Correct: Hoge precisie'),
  ('productie-beer-zero', 'reverse-osmosis', 4, 'Waar wordt deze techniek ook gebruikt?', '["Waterzuivering", "Kaasmakerij", "Distillatie", "Broodbakken"]', 0, 'Correct: Waterzuivering'),
  ('productie-beer-zero', 'reverse-osmosis', 5, 'Wat is een nadeel?', '["Hoge kosten", "Weinig aroma", "Geen body", "Te veel suiker"]', 0, 'Correct: Hoge kosten'),
  ('productie-beer-zero', 'aroma-retentie', 1, 'Waarom is aroma-retentie belangrijk?', '["Voor geurbeleving", "Voor kleur", "Voor schuim", "Voor temperatuur"]', 0, 'Correct: Voor geurbeleving'),
  ('productie-beer-zero', 'aroma-retentie', 2, 'Wat gebeurt vaak bij alcoholverwijdering?', '["Aroma gaat verloren", "Meer alcohol ontstaat", "Meer bitter ontstaat", "Meer schuim ontstaat"]', 0, 'Correct: Aroma gaat verloren'),
  ('productie-beer-zero', 'aroma-retentie', 3, 'Wat kan helpen aroma terug te brengen?', '["Dry hopping", "Koeling", "Water", "Glaswerk"]', 0, 'Correct: Dry hopping'),
  ('productie-beer-zero', 'aroma-retentie', 4, 'Wat merken consumenten vaak eerst?', '["Geurverlies", "Kleurverlies", "Glasvorm", "Temperatuur"]', 0, 'Correct: Geurverlies'),
  ('productie-beer-zero', 'aroma-retentie', 5, 'Wat bepaalt aroma-retentie sterk?', '["Productiemethode", "Etiket", "Flesvorm", "Prijs"]', 0, 'Correct: Productiemethode'),
  ('productie-beer-zero', 'balans-zonder-alcohol', 1, 'Wat geeft alcohol normaal aan bier?', '["Body", "Kleur", "Schuim", "Zuur"]', 0, 'Correct: Body'),
  ('productie-beer-zero', 'balans-zonder-alcohol', 2, 'Wat mist vaak zonder alcohol?', '["Lengte", "Glas", "Kleur", "Bitterheid"]', 0, 'Correct: Lengte'),
  ('productie-beer-zero', 'balans-zonder-alcohol', 3, 'Wat helpt body opbouwen?', '["Mout en restsuiker", "Licht", "Glaswerk", "Etiket"]', 0, 'Correct: Mout en restsuiker'),
  ('productie-beer-zero', 'balans-zonder-alcohol', 4, 'Wat is het doel van balans?', '["Compleet mondgevoel", "Meer alcohol", "Meer bitter", "Meer schuim"]', 0, 'Correct: Compleet mondgevoel'),
  ('productie-beer-zero', 'balans-zonder-alcohol', 5, 'Waar letten ervaren proevers sterk op?', '["Bodyverlies", "Etiket", "Temperatuur", "Flesvorm"]', 0, 'Correct: Bodyverlies'),
  ('proeven-beer-zero', 'hoe-proef-je-bier-0-0', 1, 'Wat beoordeel je eerst?', '["Kleur", "Bitterheid", "Afdronk", "Zoetheid"]', 0, 'Correct: Kleur'),
  ('proeven-beer-zero', 'hoe-proef-je-bier-0-0', 2, 'Wat is bij 0.0 extra belangrijk?', '["Body", "Etiket", "Temperatuur", "Flesvorm"]', 0, 'Correct: Body'),
  ('proeven-beer-zero', 'hoe-proef-je-bier-0-0', 3, 'Wat komt na ruiken?', '["Proeven", "Serveren", "Koelen", "Bewaren"]', 0, 'Correct: Proeven'),
  ('proeven-beer-zero', 'hoe-proef-je-bier-0-0', 4, 'Wat analyseer je bij smaak?', '["Balans", "Glaswerk", "Prijs", "Schuimkleur"]', 0, 'Correct: Balans'),
  ('proeven-beer-zero', 'hoe-proef-je-bier-0-0', 5, 'Professioneel proeven is:', '["Systematisch", "Snel", "Willekeurig", "Persoonlijk"]', 0, 'Correct: Systematisch'),
  ('proeven-beer-zero', 'body-analyseren', 1, 'Wat betekent body in bier?', '["Kleur", "Mondvolume en gewicht", "Schuim", "Temperatuur"]', 1, 'Correct: Mondvolume en gewicht'),
  ('proeven-beer-zero', 'body-analyseren', 2, 'Wat draagt sterk bij aan body?', '["Alcohol", "Glas", "Etiket", "Licht"]', 0, 'Correct: Alcohol'),
  ('proeven-beer-zero', 'body-analyseren', 3, 'Waarom voelt 0.0 soms dunner?', '["Minder alcohol", "Minder kleur", "Minder schuim", "Minder flesdruk"]', 0, 'Correct: Minder alcohol'),
  ('proeven-beer-zero', 'body-analyseren', 4, 'Wat kan body ondersteunen?', '["Mout en eiwitten", "Water", "Glaswerk", "Koeling"]', 0, 'Correct: Mout en eiwitten'),
  ('proeven-beer-zero', 'body-analyseren', 5, 'Waarom is body belangrijk?', '["Het bepaalt realisme", "Het bepaalt prijs", "Het bepaalt kleur", "Het bepaalt merk"]', 0, 'Correct: Het bepaalt realisme'),
  ('proeven-beer-zero', 'zoetheid-herkennen', 1, 'Waar komt zoetheid vaak vandaan?', '["Hop", "Restsuiker", "Glas", "Schuim"]', 1, 'Correct: Restsuiker'),
  ('proeven-beer-zero', 'zoetheid-herkennen', 2, 'Wat kan zoetheid positief doen?', '["Body geven", "Bitter verhogen", "Schuim verlagen", "Temperatuur verhogen"]', 0, 'Correct: Body geven'),
  ('proeven-beer-zero', 'zoetheid-herkennen', 3, 'Wat gebeurt bij teveel zoetheid?', '["Onbalans", "Meer frisheid", "Meer droogte", "Meer zuur"]', 0, 'Correct: Onbalans'),
  ('proeven-beer-zero', 'zoetheid-herkennen', 4, 'Wat veroorzaakt vaak restsuiker?', '["Gestopte fermentatie", "Dry hopping", "Koeling", "Rijping"]', 0, 'Correct: Gestopte fermentatie'),
  ('proeven-beer-zero', 'zoetheid-herkennen', 5, 'Wat verwarren beginners vaak?', '["Body en zoetheid", "Bitter en zuur", "Schuim en kleur", "Glas en aroma"]', 0, 'Correct: Body en zoetheid'),
  ('proeven-beer-zero', 'bitterheid-en-balans', 1, 'Waar komt bitterheid meestal vandaan?', '["Hop", "Mout", "Water", "Gist"]', 0, 'Correct: Hop'),
  ('proeven-beer-zero', 'bitterheid-en-balans', 2, 'Wat doet bitterheid met zoetheid?', '["Balanceert het", "Verhoogt het", "Verwijdert het", "Verbergt het"]', 0, 'Correct: Balanceert het'),
  ('proeven-beer-zero', 'bitterheid-en-balans', 3, 'Welke stijl gebruikt bitterheid vaak sterk?', '["IPA", "Blond", "Witbier", "Donker"]', 0, 'Correct: IPA'),
  ('proeven-beer-zero', 'bitterheid-en-balans', 4, 'Wat gebeurt bij teveel bitterheid?', '["Hardheid", "Zachtheid", "Rondheid", "Zoetheid"]', 0, 'Correct: Hardheid'),
  ('proeven-beer-zero', 'bitterheid-en-balans', 5, 'Wat bepaalt drinkbaarheid?', '["Balans", "Etiket", "Glas", "Flesvorm"]', 0, 'Correct: Balans'),
  ('proeven-beer-zero', 'mini-toets-0-0', 1, 'Wat analyseer je als eerste?', '["Kleur", "Bitterheid", "Prijs", "Glas"]', 0, 'Correct: Kleur'),
  ('proeven-beer-zero', 'mini-toets-0-0', 2, 'Wat is vaak het grootste verschil bij 0.0?', '["Body", "Kleur", "Schuim", "Flesvorm"]', 0, 'Correct: Body'),
  ('proeven-beer-zero', 'mini-toets-0-0', 3, 'Wat balanceert zoetheid?', '["Bitterheid", "Glas", "Licht", "Tijd"]', 0, 'Correct: Bitterheid'),
  ('proeven-beer-zero', 'mini-toets-0-0', 4, 'Waarom is blindproeven belangrijk?', '["Meer objectiviteit", "Meer marketing", "Meer schuim", "Meer prijsbewustzijn"]', 0, 'Correct: Meer objectiviteit'),
  ('proeven-beer-zero', 'mini-toets-0-0', 5, 'Wat beheers je nu?', '["Explorer-basis proeven", "Distilleren", "Export", "Lagering"]', 0, 'Correct: Explorer-basis proeven'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 1, 'Waarom is pils technisch moeilijk als 0.0?', '["Teveel kleur", "Weinig smaakverberging", "Teveel schuim", "Teveel suiker"]', 1, 'Correct: Weinig smaakverberging'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 2, 'Wat valt bij pils sneller op?', '["Fouten in balans", "Glaswerk", "Etiket", "Flesvorm"]', 0, 'Correct: Fouten in balans'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 3, 'Wat is cruciaal in pils?', '["Frisheid", "Zoetheid", "Zuur", "Hout"]', 0, 'Correct: Frisheid'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 4, 'Welke eigenschap hoort het meest bij pils?', '["Licht en droog", "Zwaar en zoet", "Rijk en oxidatief", "Vol en warm"]', 0, 'Correct: Licht en droog'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 5, 'Wat test pils goed?', '["Productiekwaliteit", "Rijping", "Export", "Barrel aging"]', 0, 'Correct: Productiekwaliteit'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 1, 'Wat domineert IPA?', '["Hop", "Mout", "Suiker", "Gist"]', 0, 'Correct: Hop'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 2, 'Waarom werkt IPA goed als 0.0?', '["Hop maskeert bodyverlies", "Minder schuim", "Meer suiker", "Minder koolzuur"]', 0, 'Correct: Hop maskeert bodyverlies'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 3, 'Welke aroma’s zijn typisch?', '["Citrus en tropisch fruit", "Chocolade en koffie", "Karamel en hout", "Honing en bloemen"]', 0, 'Correct: Citrus en tropisch fruit'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 4, 'Wat maakt IPA complexer dan pils?', '["Hogere aromatische intensiteit", "Minder alcohol", "Minder hop", "Minder bitter"]', 0, 'Correct: Hogere aromatische intensiteit'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 5, 'Waar let je sterk op?', '["Bitterbalans", "Flesvorm", "Temperatuur", "Schuimkleur"]', 0, 'Correct: Bitterbalans'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-witbieren', 1, 'Welke grondstof is typisch?', '["Tarwe", "Rogge", "Mais", "Rijst"]', 0, 'Correct: Tarwe'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-witbieren', 2, 'Welke kruiden komen vaak voor?', '["Koriander en sinaasappel", "Kaneel en kruidnagel", "Vanille en cacao", "Rozemarijn en tijm"]', 0, 'Correct: Koriander en sinaasappel'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-witbieren', 3, 'Waarom werkt witbier goed als 0.0?', '["Aromatische complexiteit blijft goed overeind", "Meer alcohol", "Minder koolzuur", "Meer restsuiker"]', 0, 'Correct: Aromatische complexiteit blijft goed overeind'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-witbieren', 4, 'Welke pairing past goed?', '["Salades", "Stoofvlees", "Wild", "Chocolade"]', 0, 'Correct: Salades'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-witbieren', 5, 'Hoe voelt witbier vaak?', '["Fris en zacht", "Hard en droog", "Warm en rijk", "Oxidatief"]', 0, 'Correct: Fris en zacht'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-blond', 1, 'Hoe verschilt blond van pils?', '["Meer rondheid", "Meer zuur", "Minder mout", "Minder body"]', 0, 'Correct: Meer rondheid'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-blond', 2, 'Wat ondersteunt body in blond?', '["Moutigheid", "Glaswerk", "Licht", "Schuim"]', 0, 'Correct: Moutigheid'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-blond', 3, 'Welke smaak komt vaak voor?', '["Fruitigheid", "Turf", "Zout", "Rook"]', 0, 'Correct: Fruitigheid'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-blond', 4, 'Waarom werkt blond goed als 0.0?', '["Natuurlijke rondheid helpt balans", "Meer bitterheid", "Minder suiker", "Minder hop"]', 0, 'Correct: Natuurlijke rondheid helpt balans'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-blond', 5, 'Blond zit vaak tussen:', '["Fris en rijk", "Zuur en zout", "Bitter en zuur", "Warm en oxidatief"]', 0, 'Correct: Fris en rijk'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-donker', 1, 'Waar komt de donkere smaak vooral vandaan?', '["Geroosterde mout", "Hop", "Water", "Gist"]', 0, 'Correct: Geroosterde mout'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-donker', 2, 'Welke aroma’s zijn typisch?', '["Koffie en chocolade", "Citrus en mango", "Appel en peer", "Honing en bloemen"]', 0, 'Correct: Koffie en chocolade'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-donker', 3, 'Waarom werkt donker bier goed als 0.0?', '["Geroosterde tonen suggereren body", "Minder schuim", "Minder hop", "Minder kleur"]', 0, 'Correct: Geroosterde tonen suggereren body'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-donker', 4, 'Waar wordt donker bier vaak sterk in?', '["Pairing", "Sport", "Hydratatie", "Lunch"]', 0, 'Correct: Pairing'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-donker', 5, 'Wat is risico?', '["Teveel zoetheid", "Teveel zuur", "Teveel zout", "Teveel koolzuur"]', 0, 'Correct: Teveel zoetheid'),
  ('markt-innovatie-beer-zero', 'grote-merken', 1, 'Waarom domineren grote merken de 0.0-markt?', '["Meer alcohol", "Schaal en distributie", "Minder hop", "Minder water"]', 1, 'Correct: Schaal en distributie'),
  ('markt-innovatie-beer-zero', 'grote-merken', 2, 'Wat zorgt voor normalisatie?', '["Grote beschikbaarheid", "Meer bitterheid", "Andere glazen", "Nieuwe flessen"]', 0, 'Correct: Grote beschikbaarheid'),
  ('markt-innovatie-beer-zero', 'grote-merken', 3, 'Welke speler is wereldwijd marktleider?', '["Heineken", "Guinness", "Budweiser", "Bavaria"]', 0, 'Correct: Heineken'),
  ('markt-innovatie-beer-zero', 'grote-merken', 4, 'Wat versnellen grote merken?', '["Acceptatie", "Fermentatie", "Oxidatie", "Rijping"]', 0, 'Correct: Acceptatie'),
  ('markt-innovatie-beer-zero', 'grote-merken', 5, 'Wat is hun grootste kracht?', '["Marketing en bereik", "Barrel-aging", "Houtlagering", "Craft-productie"]', 0, 'Correct: Marketing en bereik'),
  ('markt-innovatie-beer-zero', 'craft-0-0', 1, 'Wat brengen craft-brouwers vooral?', '["Innovatie", "Lagere prijzen", "Minder smaak", "Minder keuze"]', 0, 'Correct: Innovatie'),
  ('markt-innovatie-beer-zero', 'craft-0-0', 2, 'Wat onderscheidt craft 0.0?', '["Creativiteit", "Minder hop", "Minder mout", "Minder schuim"]', 0, 'Correct: Creativiteit'),
  ('markt-innovatie-beer-zero', 'craft-0-0', 3, 'Voor wie is craft 0.0 vaak aantrekkelijk?', '["Ervaren bierdrinkers", "Beginners", "Kinderen", "Wijnmakers"]', 0, 'Correct: Ervaren bierdrinkers'),
  ('markt-innovatie-beer-zero', 'craft-0-0', 4, 'Wat is de uitdaging?', '["Hoge kwaliteitsverwachting", "Teveel marketing", "Teveel glaswerk", "Teveel schuim"]', 0, 'Correct: Hoge kwaliteitsverwachting'),
  ('markt-innovatie-beer-zero', 'craft-0-0', 5, 'Wat is vaak het voordeel?', '["Nieuwe stijlen", "Minder keuze", "Minder body", "Minder aroma"]', 0, 'Correct: Nieuwe stijlen'),
  ('markt-innovatie-beer-zero', 'isotone-positionering', 1, 'Waarom wordt bier 0.0 soms als isotoon gezien?', '["Door water en koolhydraten", "Door alcohol", "Door hop", "Door schuim"]', 0, 'Correct: Door water en koolhydraten'),
  ('markt-innovatie-beer-zero', 'isotone-positionering', 2, 'Welke doelgroep spreekt dit aan?', '["Sporters", "Sommeliers", "Distillateurs", "Brouwers"]', 0, 'Correct: Sporters'),
  ('markt-innovatie-beer-zero', 'isotone-positionering', 3, 'Waar is deze positionering sterk?', '["Duitsland", "Italië", "Frankrijk", "Spanje"]', 0, 'Correct: Duitsland'),
  ('markt-innovatie-beer-zero', 'isotone-positionering', 4, 'Is elk 0.0-bier functioneel?', '["Nee", "Ja", "Altijd", "Alleen pils"]', 0, 'Correct: Nee'),
  ('markt-innovatie-beer-zero', 'isotone-positionering', 5, 'Wat is het belangrijkste inzicht?', '["Positionering ≠ inhoud", "Meer suiker", "Meer alcohol", "Meer hop"]', 0, 'Correct: Positionering ≠ inhoud'),
  ('markt-innovatie-beer-zero', 'functionele-bieren', 1, 'Wat voegen functionele bieren vaak toe?', '["Vitamines", "Meer alcohol", "Meer suiker", "Meer schuim"]', 0, 'Correct: Vitamines'),
  ('markt-innovatie-beer-zero', 'functionele-bieren', 2, 'Welke markt groeit hierdoor?', '["Wellness", "Whisky", "Cognac", "Port"]', 0, 'Correct: Wellness'),
  ('markt-innovatie-beer-zero', 'functionele-bieren', 3, 'Wat vervaagt?', '["De grens tussen bier en functionele drank", "De schuimlaag", "De kleur", "De temperatuur"]', 0, 'Correct: De grens tussen bier en functionele drank'),
  ('markt-innovatie-beer-zero', 'functionele-bieren', 4, 'Welke doelgroep groeit?', '["Health-conscious consumers", "Alleen brouwers", "Alleen horeca", "Alleen verzamelaars"]', 0, 'Correct: Health-conscious consumers'),
  ('markt-innovatie-beer-zero', 'functionele-bieren', 5, 'Wat is de kern van functioneel bier?', '["Extra waarde naast smaak", "Meer alcohol", "Minder smaak", "Meer bitter"]', 0, 'Correct: Extra waarde naast smaak'),
  ('markt-innovatie-beer-zero', 'premium-alcoholvrij', 1, 'Wat bepaalt premium 0.0 vooral?', '["Kwaliteit", "Grootte", "Kleur", "Flesvorm"]', 0, 'Correct: Kwaliteit'),
  ('markt-innovatie-beer-zero', 'premium-alcoholvrij', 2, 'Waarom betalen mensen meer?', '["Betere smaak en techniek", "Meer alcohol", "Meer schuim", "Meer volume"]', 0, 'Correct: Betere smaak en techniek'),
  ('markt-innovatie-beer-zero', 'premium-alcoholvrij', 3, 'Wat hoort bij premium?', '["Complexiteit", "Simpelheid", "Minder aroma", "Minder keuze"]', 0, 'Correct: Complexiteit'),
  ('markt-innovatie-beer-zero', 'premium-alcoholvrij', 4, 'Welke ontwikkeling zie je?', '["Marktsegmentatie", "Minder merken", "Minder stijlen", "Minder vraag"]', 0, 'Correct: Marktsegmentatie'),
  ('markt-innovatie-beer-zero', 'premium-alcoholvrij', 5, 'Wat maakt premium volwassen?', '["Differentiatie in kwaliteit", "Meer etiketten", "Meer glazen", "Meer koeling"]', 0, 'Correct: Differentiatie in kwaliteit'),
  ('gezondheid-beer-zero', 'sport-en-herstel', 1, 'Waarom drinken sporters soms bier 0.0?', '["Voor alcohol", "Voor hydratatie en koolhydraten", "Voor bitterheid", "Voor schuim"]', 1, 'Correct: Voor hydratatie en koolhydraten'),
  ('gezondheid-beer-zero', 'sport-en-herstel', 2, 'Is bier 0.0 een vervanger voor water?', '["Ja", "Nee", "Soms", "Altijd"]', 1, 'Correct: Nee'),
  ('gezondheid-beer-zero', 'sport-en-herstel', 3, 'Welke component helpt bij herstel?', '["Koolhydraten", "Glaswerk", "Etiket", "Temperatuur"]', 0, 'Correct: Koolhydraten'),
  ('gezondheid-beer-zero', 'sport-en-herstel', 4, 'In welk land is dit cultureel sterk?', '["Duitsland", "Frankrijk", "Portugal", "Spanje"]', 0, 'Correct: Duitsland'),
  ('gezondheid-beer-zero', 'sport-en-herstel', 5, 'Wat is ook belangrijk na sport?', '["Mentaal herstelmoment", "Meer alcohol", "Meer suiker", "Meer schuim"]', 0, 'Correct: Mentaal herstelmoment'),
  ('gezondheid-beer-zero', 'calorieen-vergelijken', 1, 'Waarom bevat bier 0.0 meestal minder calorieën?', '["Minder alcohol", "Minder water", "Minder schuim", "Minder kleur"]', 0, 'Correct: Minder alcohol'),
  ('gezondheid-beer-zero', 'calorieen-vergelijken', 2, 'Wat levert veel calorieën?', '["Alcohol", "Glas", "Hop", "Gist"]', 0, 'Correct: Alcohol'),
  ('gezondheid-beer-zero', 'calorieen-vergelijken', 3, 'Betekent minder calorieën automatisch minder suiker?', '["Nee", "Ja", "Altijd", "Soms niet"]', 0, 'Correct: Nee'),
  ('gezondheid-beer-zero', 'calorieen-vergelijken', 4, 'Waarom zijn etiketten belangrijk?', '["Voor inzicht in voedingswaarden", "Voor kleur", "Voor branding", "Voor prijs"]', 0, 'Correct: Voor inzicht in voedingswaarden'),
  ('gezondheid-beer-zero', 'calorieen-vergelijken', 5, 'Wat is de belangrijkste nuance?', '["Caloriearm ≠ automatisch gezond", "Minder bitter = beter", "Meer schuim = beter", "Meer water = beter"]', 0, 'Correct: Caloriearm ≠ automatisch gezond'),
  ('gezondheid-beer-zero', 'suiker-en-restsuiker', 1, 'Waar komt restsuiker vaak vandaan?', '["Gestopte fermentatie", "Dry hopping", "Koeling", "Houtlagering"]', 0, 'Correct: Gestopte fermentatie'),
  ('gezondheid-beer-zero', 'suiker-en-restsuiker', 2, 'Wat kan restsuiker positief doen?', '["Body ondersteunen", "Bitter verhogen", "Zuur verhogen", "Alcohol verhogen"]', 0, 'Correct: Body ondersteunen'),
  ('gezondheid-beer-zero', 'suiker-en-restsuiker', 3, 'Wat is risico van teveel suiker?', '["Minder gezonde keuze", "Meer frisheid", "Meer bitterheid", "Meer droogte"]', 0, 'Correct: Minder gezonde keuze'),
  ('gezondheid-beer-zero', 'suiker-en-restsuiker', 4, 'Zijn alle 0.0-bieren laag in suiker?', '["Nee", "Ja", "Altijd", "Alleen IPA"]', 0, 'Correct: Nee'),
  ('gezondheid-beer-zero', 'suiker-en-restsuiker', 5, 'Wat vraagt een goede keuze?', '["Bewust etiketten lezen", "Alleen merkkeuze", "Alleen prijs", "Alleen stijl"]', 0, 'Correct: Bewust etiketten lezen'),
  ('gezondheid-beer-zero', 'hydratatie', 1, 'Waarom hydrateert bier 0.0 beter dan regulier bier?', '["Minder alcohol", "Minder hop", "Minder schuim", "Minder kleur"]', 0, 'Correct: Minder alcohol'),
  ('gezondheid-beer-zero', 'hydratatie', 2, 'Wat doet alcohol normaal?', '["Vocht afdrijven", "Meer hydrateren", "Meer schuim maken", "Meer body geven"]', 0, 'Correct: Vocht afdrijven'),
  ('gezondheid-beer-zero', 'hydratatie', 3, 'Wat blijft de basis van hydratatie?', '["Water", "Bier 0.0", "Sportdrank", "Koffie"]', 0, 'Correct: Water'),
  ('gezondheid-beer-zero', 'hydratatie', 4, 'Waar past bier 0.0 goed?', '["Als aanvulling", "Als vervanging", "Als medicatie", "Als hoofdvoeding"]', 0, 'Correct: Als aanvulling'),
  ('gezondheid-beer-zero', 'hydratatie', 5, 'Wat maakt 0.0 aantrekkelijk?', '["Frisheid + hydratatiegevoel", "Meer alcohol", "Meer suiker", "Meer schuim"]', 0, 'Correct: Frisheid + hydratatiegevoel'),
  ('gezondheid-beer-zero', 'alcoholvrij-in-sociale-context', 1, 'Wat is sterk veranderd rond bier 0.0?', '["Imago", "Schuim", "Kleur", "Glaswerk"]', 0, 'Correct: Imago'),
  ('gezondheid-beer-zero', 'alcoholvrij-in-sociale-context', 2, 'Waarom kiezen mensen vaker 0.0?', '["Bewust leven", "Meer alcohol", "Meer schuim", "Minder smaak"]', 0, 'Correct: Bewust leven'),
  ('gezondheid-beer-zero', 'alcoholvrij-in-sociale-context', 3, 'Waar zie je dit sterk?', '["Restaurants en sociale settings", "Alleen thuis", "Alleen sport", "Alleen festivals"]', 0, 'Correct: Restaurants en sociale settings'),
  ('gezondheid-beer-zero', 'alcoholvrij-in-sociale-context', 4, 'Wat verandert hierdoor?', '["Drinkcultuur", "Productiekosten", "Gisting", "Schuimvorming"]', 0, 'Correct: Drinkcultuur'),
  ('gezondheid-beer-zero', 'alcoholvrij-in-sociale-context', 5, 'Wat is de kern?', '["Bewuste flexibiliteit", "Volledige abstinentie", "Meer alcohol", "Minder keuze"]', 0, 'Correct: Bewuste flexibiliteit'),
  ('service-beer-zero', 'serveertemperatuur', 1, 'Wat maskeert te koude temperatuur vaak?', '["Fouten en aroma’s", "Schuim", "Kleur", "Glaswerk"]', 0, 'Correct: Fouten en aroma’s'),
  ('service-beer-zero', 'serveertemperatuur', 2, 'Waarom mag donker bier warmer geserveerd worden?', '["Meer aroma-ontwikkeling", "Meer schuim", "Minder alcohol", "Minder kleur"]', 0, 'Correct: Meer aroma-ontwikkeling'),
  ('service-beer-zero', 'serveertemperatuur', 3, 'Welke stijl serveer je meestal het koudst?', '["Pils", "Donker", "Blond", "IPA"]', 0, 'Correct: Pils'),
  ('service-beer-zero', 'serveertemperatuur', 4, 'Wat gebeurt als bier te warm is?', '["Minder frisheid", "Meer koolzuur", "Meer bitter", "Meer body"]', 0, 'Correct: Minder frisheid'),
  ('service-beer-zero', 'serveertemperatuur', 5, 'Waarom is temperatuur extra belangrijk bij 0.0?', '["Frisheid draagt sterk bij aan beleving", "Meer alcohol", "Minder glaswerk", "Meer schuim"]', 0, 'Correct: Frisheid draagt sterk bij aan beleving'),
  ('service-beer-zero', 'glaswerk', 1, 'Wat beïnvloedt glaswerk sterk?', '["Aroma en schuim", "Alcoholpercentage", "Kleur", "Bitterheid"]', 0, 'Correct: Aroma en schuim'),
  ('service-beer-zero', 'glaswerk', 2, 'Waarom is schoon glas essentieel?', '["Voor schuimvorming", "Voor temperatuur", "Voor kleur", "Voor prijs"]', 0, 'Correct: Voor schuimvorming'),
  ('service-beer-zero', 'glaswerk', 3, 'Welke stijl profiteert vaak van een brede opening?', '["IPA", "Pils", "Donker", "Witbier"]', 0, 'Correct: IPA'),
  ('service-beer-zero', 'glaswerk', 4, 'Wat doet glaswerk met beleving?', '["Versterkt ervaring", "Verlaagt bitterheid", "Verhoogt alcohol", "Verandert suiker"]', 0, 'Correct: Versterkt ervaring'),
  ('service-beer-zero', 'glaswerk', 5, 'Wat vernietigt schuim snel?', '["Vetresten in glas", "Water", "Koeling", "Licht"]', 0, 'Correct: Vetresten in glas'),
  ('service-beer-zero', 'presentatie', 1, 'Wat bepaalt presentatie als eerste?', '["Verwachting", "Alcohol", "Suiker", "Body"]', 0, 'Correct: Verwachting'),
  ('service-beer-zero', 'presentatie', 2, 'Wat hoort bij goede presentatie?', '["Correct inschenken", "Warme fles", "Geen schuim", "Halfvol glas"]', 0, 'Correct: Correct inschenken'),
  ('service-beer-zero', 'presentatie', 3, 'Waarom is presentatie belangrijk bij 0.0?', '["Het helpt normaliseren en waarderen", "Meer alcohol", "Minder bitter", "Meer kleur"]', 0, 'Correct: Het helpt normaliseren en waarderen'),
  ('service-beer-zero', 'presentatie', 4, 'Wat beïnvloedt visuele kwaliteit?', '["Schuimkraag", "Alcohol", "Restsuiker", "Hop"]', 0, 'Correct: Schuimkraag'),
  ('service-beer-zero', 'presentatie', 5, 'Waar begint beleving?', '["Zien", "Drinken", "Betalen", "Ruiken"]', 0, 'Correct: Zien'),
  ('service-beer-zero', 'bewaren', 1, 'Wat is schadelijk voor bierkwaliteit?', '["Licht en warmte", "Glaswerk", "Etiket", "Schuim"]', 0, 'Correct: Licht en warmte'),
  ('service-beer-zero', 'bewaren', 2, 'Hoe bewaar je bier het beste?', '["Koel en donker", "Warm en licht", "Open", "Liggend in zon"]', 0, 'Correct: Koel en donker'),
  ('service-beer-zero', 'bewaren', 3, 'Wat versnelt veroudering?', '["Warmte", "Kou", "Schaduw", "Glas"]', 0, 'Correct: Warmte'),
  ('service-beer-zero', 'bewaren', 4, 'Wat tast hop-aroma aan?', '["Licht en oxidatie", "Water", "Schuim", "Glas"]', 0, 'Correct: Licht en oxidatie'),
  ('service-beer-zero', 'bewaren', 5, 'Wat is meestal beter?', '["Vers bier", "Oud bier", "Warm bier", "Geopend bier"]', 0, 'Correct: Vers bier'),
  ('service-beer-zero', 'service-in-de-praktijk', 1, 'Wat combineer je in deze praktijkles?', '["Alle service-elementen", "Alleen temperatuur", "Alleen glas", "Alleen opslag"]', 0, 'Correct: Alle service-elementen'),
  ('service-beer-zero', 'service-in-de-praktijk', 2, 'Wat beïnvloedt service het meest?', '["Totale beleving", "Alcoholpercentage", "Kleur", "Prijs"]', 0, 'Correct: Totale beleving'),
  ('service-beer-zero', 'service-in-de-praktijk', 3, 'Wat is cruciaal bij inschenken?', '["Schuimcontrole", "Flesvorm", "Etiket", "Gewicht"]', 0, 'Correct: Schuimcontrole'),
  ('service-beer-zero', 'service-in-de-praktijk', 4, 'Waarom is praktijk essentieel?', '["Theorie wordt tastbaar", "Meer alcohol", "Minder aroma", "Meer schuim"]', 0, 'Correct: Theorie wordt tastbaar'),
  ('service-beer-zero', 'service-in-de-praktijk', 5, 'Wat beheers je nu?', '["Professionele servicebasis", "Distillatie", "Rijping", "Export"]', 0, 'Correct: Professionele servicebasis'),
  ('pairing-beer-zero', '0-0-en-lunch', 1, 'Waarom werkt bier 0.0 goed bij lunch?', '["Meer alcohol", "Meer frisheid en minder belasting", "Meer bitterheid", "Meer suiker"]', 1, 'Correct: Meer frisheid en minder belasting'),
  ('pairing-beer-zero', '0-0-en-lunch', 2, 'Welke stijl past vaak goed bij salade?', '["Witbier", "Donker", "Stout", "Porter"]', 0, 'Correct: Witbier'),
  ('pairing-beer-zero', '0-0-en-lunch', 3, 'Wat is belangrijk bij lunchpairing?', '["Verteerbaarheid", "Zwaarte", "Intensiteit", "Warmte"]', 0, 'Correct: Verteerbaarheid'),
  ('pairing-beer-zero', '0-0-en-lunch', 4, 'Waarom is pils geschikt?', '["Fris en licht", "Zoet en zwaar", "Oxidatief", "Houtgerijpt"]', 0, 'Correct: Fris en licht'),
  ('pairing-beer-zero', '0-0-en-lunch', 5, 'Wat is kern van lunchpairing?', '["Balans en frisheid", "Bitter en zout", "Zoet en vet", "Zuur en warm"]', 0, 'Correct: Balans en frisheid'),
  ('pairing-beer-zero', '0-0-en-kaas', 1, 'Waarom werkt bier goed bij kaas?', '["Koolzuur snijdt door vet", "Meer alcohol", "Meer kleur", "Meer schuim"]', 0, 'Correct: Koolzuur snijdt door vet'),
  ('pairing-beer-zero', '0-0-en-kaas', 2, 'Wat vraagt zout in kaas?', '["Bitterheid", "Zoetheid", "Zuur", "Water"]', 0, 'Correct: Bitterheid'),
  ('pairing-beer-zero', '0-0-en-kaas', 3, 'Welke pairing past bij oude kaas?', '["IPA", "Pils", "Witbier", "Water"]', 0, 'Correct: IPA'),
  ('pairing-beer-zero', '0-0-en-kaas', 4, 'Wat doet koolzuur met romigheid?', '["Reinigt het gehemelte", "Verhoogt vet", "Verhoogt zout", "Verhoogt alcohol"]', 0, 'Correct: Reinigt het gehemelte'),
  ('pairing-beer-zero', '0-0-en-kaas', 5, 'Wat test kaas goed?', '["Body en structuur", "Temperatuur", "Glaswerk", "Prijs"]', 0, 'Correct: Body en structuur'),
  ('pairing-beer-zero', '0-0-en-lichte-gerechten', 1, 'Wat vraagt een licht gerecht meestal?', '["Subtiele pairing", "Zware pairing", "Zoete pairing", "Oxidatieve pairing"]', 0, 'Correct: Subtiele pairing'),
  ('pairing-beer-zero', '0-0-en-lichte-gerechten', 2, 'Welke stijl is veelzijdig bij vis?', '["Witbier", "Donker", "Porter", "Stout"]', 0, 'Correct: Witbier'),
  ('pairing-beer-zero', '0-0-en-lichte-gerechten', 3, 'Wat is risico bij te zwaar bier?', '["Dominantie", "Meer frisheid", "Meer balans", "Meer subtiliteit"]', 0, 'Correct: Dominantie'),
  ('pairing-beer-zero', '0-0-en-lichte-gerechten', 4, 'Wat ondersteunt lichte gerechten goed?', '["Frisheid", "Zwaarte", "Warmte", "Zoetheid"]', 0, 'Correct: Frisheid'),
  ('pairing-beer-zero', '0-0-en-lichte-gerechten', 5, 'Wat is kern bij pairing?', '["Balans in intensiteit", "Alleen bitter", "Alleen zoet", "Alleen zout"]', 0, 'Correct: Balans in intensiteit'),
  ('pairing-beer-zero', 'contrast-en-harmonie', 1, 'Wat betekent harmonie?', '["Overeenkomst in stijl of structuur", "Tegenstelling", "Bitterheid", "Zoetheid"]', 0, 'Correct: Overeenkomst in stijl of structuur'),
  ('pairing-beer-zero', 'contrast-en-harmonie', 2, 'Wat betekent contrast?', '["Spanning tussen smaken", "Exact dezelfde smaak", "Minder intensiteit", "Minder structuur"]', 0, 'Correct: Spanning tussen smaken'),
  ('pairing-beer-zero', 'contrast-en-harmonie', 3, 'Welke pairing is contrast?', '["Bitter bier + vet gerecht", "Zacht bier + zacht gerecht", "Witbier + witvis", "Blond + kip"]', 0, 'Correct: Bitter bier + vet gerecht'),
  ('pairing-beer-zero', 'contrast-en-harmonie', 4, 'Welke pairing is harmonie?', '["Romig bier + romige kaas", "IPA + blauwschimmel", "Pils + bitterballen", "Donker + sushi"]', 0, 'Correct: Romig bier + romige kaas'),
  ('pairing-beer-zero', 'contrast-en-harmonie', 5, 'Wat beheersen goede sommeliers?', '["Beide principes", "Alleen harmonie", "Alleen contrast", "Alleen bitter"]', 0, 'Correct: Beide principes'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 1, 'Waarom groeit bier 0.0 in gastronomie?', '["Meer flexibiliteit en toegankelijkheid", "Meer alcohol", "Minder keuze", "Minder smaak"]', 0, 'Correct: Meer flexibiliteit en toegankelijkheid'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 2, 'Wat biedt alcoholvrije pairing?', '["Alternatief zonder kwaliteitsverlies", "Minder service", "Minder smaak", "Minder structuur"]', 0, 'Correct: Alternatief zonder kwaliteitsverlies'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 3, 'Wat maakt bier 0.0 interessant?', '["Breed inzetbaar", "Alleen goedkoop", "Alleen zoet", "Alleen licht"]', 0, 'Correct: Breed inzetbaar'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 4, 'Wat is de toekomst?', '["Hybride drinken", "Alleen alcohol", "Geen bier", "Alleen wijn"]', 0, 'Correct: Hybride drinken'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 5, 'Wat vraagt gastronomie?', '["Doordachte pairing", "Alleen temperatuur", "Alleen glas", "Alleen prijs"]', 0, 'Correct: Doordachte pairing'),
  ('examen-beer-zero', '0-0-pils-vs-gewone-pils', 1, 'Wat is vaak het grootste verschil tussen pils en 0.0 pils?', '["Body", "Kleur", "Schuim", "Glaswerk"]', 0, 'Correct: Body'),
  ('examen-beer-zero', '0-0-pils-vs-gewone-pils', 2, 'Welke heeft vaak langere afdronk?', '["Gewone pils", "0.0 pils", "Beide gelijk", "Geen van beide"]', 0, 'Correct: Gewone pils'),
  ('examen-beer-zero', '0-0-pils-vs-gewone-pils', 3, 'Wat merk je vaak bij 0.0 pils?', '["Meer restzoetheid", "Meer alcoholwarmte", "Meer zuur", "Meer oxidatie"]', 0, 'Correct: Meer restzoetheid'),
  ('examen-beer-zero', '0-0-pils-vs-gewone-pils', 4, 'Waarom is blind vergelijken nuttig?', '["Objectieve herkenning", "Meer marketing", "Meer schuim", "Meer branding"]', 0, 'Correct: Objectieve herkenning'),
  ('examen-beer-zero', '0-0-pils-vs-gewone-pils', 5, 'Waar letten ervaren proevers sterk op?', '["Mondgevoel", "Fleskleur", "Prijs", "Etiket"]', 0, 'Correct: Mondgevoel'),
  ('examen-beer-zero', '0-0-ipa-vs-gewone-ipa', 1, 'Waarom is IPA moeilijker blind?', '["Hop maskeert verschillen", "Minder schuim", "Minder kleur", "Minder geur"]', 0, 'Correct: Hop maskeert verschillen'),
  ('examen-beer-zero', '0-0-ipa-vs-gewone-ipa', 2, 'Wat blijft vaak het belangrijkste verschil?', '["Body", "Glas", "Schuim", "Fles"]', 0, 'Correct: Body'),
  ('examen-beer-zero', '0-0-ipa-vs-gewone-ipa', 3, 'Wat kan 0.0 IPA vaak hebben?', '["Kortere lengte", "Meer alcoholwarmte", "Meer tannine", "Meer oxidatie"]', 0, 'Correct: Kortere lengte'),
  ('examen-beer-zero', '0-0-ipa-vs-gewone-ipa', 4, 'Waarom is hop relevant?', '["Het verhoogt aromatische complexiteit", "Het verlaagt bitterheid", "Het verwijdert suiker", "Het koelt bier"]', 0, 'Correct: Het verhoogt aromatische complexiteit'),
  ('examen-beer-zero', '0-0-ipa-vs-gewone-ipa', 5, 'Wat test IPA goed?', '["Balans tussen aroma en structuur", "Glaswerk", "Etiket", "Koeling"]', 0, 'Correct: Balans tussen aroma en structuur'),
  ('examen-beer-zero', 'stijlherkenning-blind', 1, 'Welke factor helpt stijlherkenning sterk?', '["Aroma", "Etiket", "Glas", "Prijs"]', 0, 'Correct: Aroma'),
  ('examen-beer-zero', 'stijlherkenning-blind', 2, 'Wat helpt pils herkennen?', '["Frisheid en droogte", "Chocolade", "Zuur", "Turf"]', 0, 'Correct: Frisheid en droogte'),
  ('examen-beer-zero', 'stijlherkenning-blind', 3, 'Wat verraadt witbier vaak?', '["Tarwe en kruiden", "Turf", "Hout", "Zout"]', 0, 'Correct: Tarwe en kruiden'),
  ('examen-beer-zero', 'stijlherkenning-blind', 4, 'Wat verraadt donker bier vaak?', '["Geroosterde tonen", "Citrus", "Zuur", "Mineraliteit"]', 0, 'Correct: Geroosterde tonen'),
  ('examen-beer-zero', 'stijlherkenning-blind', 5, 'Waarom train je blind?', '["Objectiviteit en precisie", "Sneller drinken", "Meer schuim", "Meer prijskennis"]', 0, 'Correct: Objectiviteit en precisie'),
  ('examen-beer-zero', 'praktijk-examen', 1, 'Wat combineert het praktijkexamen?', '["Analyse, service en pairing", "Alleen theorie", "Alleen service", "Alleen blindproeven"]', 0, 'Correct: Analyse, service en pairing'),
  ('examen-beer-zero', 'praktijk-examen', 2, 'Wat is de kern van blindproeven?', '["Objectieve analyse", "Snelheid", "Branding", "Etiket"]', 0, 'Correct: Objectieve analyse'),
  ('examen-beer-zero', 'praktijk-examen', 3, 'Wat test pairing?', '["Toepassing van smaaklogica", "Temperatuur", "Glasgewicht", "Fleskleur"]', 0, 'Correct: Toepassing van smaaklogica'),
  ('examen-beer-zero', 'praktijk-examen', 4, 'Waarom is service onderdeel?', '["Beleving is onderdeel van kwaliteit", "Meer alcohol", "Meer schuim", "Meer suiker"]', 0, 'Correct: Beleving is onderdeel van kwaliteit'),
  ('examen-beer-zero', 'praktijk-examen', 5, 'Wat toont dit examen aan?', '["Volledige Master-competentie", "Alleen productkennis", "Alleen theorie", "Alleen smaak"]', 0, 'Correct: Volledige Master-competentie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
