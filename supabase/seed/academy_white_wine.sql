-- White Wine track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'white-wine';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'white-wine',
  'Witte wijn',
  'Leer witte wijn van Fundament tot Master: productie, proeven, druiven, service, pairing en examen.',
  7,
  now()
);

with t as (select id from academy.tracks where slug = 'white-wine')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-white-wine', 'Fundament', 1),
  ('explorer', 'productie-white-wine', 'Productie', 2),
  ('explorer', 'proeven-white-wine', 'Proeven', 3),
  ('specialist', 'frisse-druiven-white-wine', 'Frisse witte druiven', 4),
  ('specialist', 'rijke-druiven-white-wine', 'Rijke witte druiven', 5),
  ('specialist', 'aromatische-druiven-white-wine', 'Aromatische witte druiven', 6),
  ('master', 'service-white-wine', 'Service', 7),
  ('master', 'pairing-white-wine', 'Pairing & Gastronomie', 8),
  ('master', 'examen-white-wine', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-white-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'intro-white-wine'
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
    'wat-is-witte-wijn',
    'Wat is witte wijn?',
    'Na deze les kun jij uitleggen wat witte wijn is, hoe het wordt gemaakt en waarin het verschilt van rode wijn.
',
    'Witte wijn is wijn die meestal wordt gemaakt zonder langdurig contact tussen het druivensap en de schillen.

Dat lijkt simpel, maar juist daar ontstaat een groot verschil.

Bij rode wijn zorgen schillen voor kleur, tannine en structuur.

Bij witte wijn draait het veel meer om:

- frisheid  
- zuren  
- aroma’s  
- precisie  

Witte wijn kan gemaakt worden van witte druiven, maar ook van rode druiven zolang de schillen snel worden verwijderd.

Een goed voorbeeld hiervan is Champagne.

Witte wijn is wereldwijd één van de meest gedronken wijnstijlen.

Van strak en mineraal tot rijk en romig.
',
    '- witte wijn
- schilcontact
- frisheid
- zuur
- aroma
',
    'Het sap van bijna alle druiven is kleurloos. De kleur komt vooral uit de schil.
',
    '- Witte wijn heeft meestal weinig schilcontact  
- Zuren spelen een grote rol  
- Aroma’s zijn vaak belangrijker dan tannines  
- Witte wijn kent veel stijlen  
',
    '### Opdracht

Pak een fles witte wijn en lees het etiket.

### Checklist

- Ik heb het druivenras gevonden  
- Ik heb het alcoholpercentage gevonden  
- Ik heb het land van herkomst gevonden  
- Ik heb de stijl geprobeerd te herkennen  

### Reflectievraag

Denk je dat deze wijn fris of rijk zal zijn?
',
    8,
    1
  ),
  (
    'hoe-ontstaat-witte-wijn',
    'Hoe ontstaat witte wijn?',
    'Na deze les begrijp jij hoe witte wijn technisch wordt gemaakt.
',
    'De basis van witte wijn begint in de wijngaard.

Na de oogst worden de druiven meestal direct geperst.

Dit noemen we direct press.

Het sap wordt gescheiden van schillen, pitten en steeltjes.

Daarna begint de fermentatie.

Gisten zetten druivensuikers om in alcohol.

Bij witte wijn gebeurt dit vaak op lagere temperaturen.

Waarom?

Omdat lagere temperaturen frisse aroma’s beter behouden.

Na fermentatie kan de wijn:

- op RVS rijpen  
- op hout rijpen  
- op de lies blijven  

Elke keuze beïnvloedt de stijl.
',
    '- direct press
- fermentatie
- gisting
- RVS
- houtrijping
',
    'Koele fermentatie is essentieel voor veel aromatische witte wijnen.
',
    '- Oogst  
- Persing  
- Sap scheiden  
- Fermentatie  
- Rijping  
',
    '### Opdracht

Zoek online een wijnmakerij en bekijk hun productieproces.

### Checklist

- Ik heb persing gevonden  
- Ik heb fermentatie gevonden  
- Ik heb rijping gevonden  

### Reflectievraag

Waar denk jij dat de meeste stijlverschillen ontstaan?
',
    8,
    2
  ),
  (
    'waarom-is-witte-wijn-uniek',
    'Waarom is witte wijn uniek?',
    'Na deze les kun jij uitleggen waarom witte wijn zo veelzijdig is.
',
    'Witte wijn is uniek omdat het veel stijlen kent.

Van extreem fris tot rijk en vol.

Dat komt door:

- druivenrassen  
- klimaat  
- terroir  
- productiekeuzes  

Zuur is vaak de ruggengraat.

Dat maakt witte wijn gastronomisch sterk.

Witte wijn kan:

- verfrissend zijn  
- complex zijn  
- ouderen  
- perfect pairen met eten  

Dat maakt het een van de meest veelzijdige wijncategorieën.
',
    '- veelzijdigheid
- terroir
- stijl
- zuur
- gastronomie
',
    'Veel topwijnen uit Bourgogne zijn wit.
',
    '- Grote stijlverschillen  
- Hoge gastronomische inzetbaarheid  
- Zuur als structuur  
- Veel terroir-invloed  
',
    '### Opdracht

Noem drie momenten waarop jij witte wijn zou serveren.
',
    8,
    3
  ),
  (
    'geschiedenis-witte-wijn',
    'Geschiedenis van witte wijn',
    'Na deze les begrijp jij hoe witte wijn historisch is ontwikkeld.
',
    'Witte wijn bestaat al duizenden jaren.

De oude Grieken en Romeinen maakten al lichte wijnen.

Later groeiden gebieden zoals:

- Bourgogne  
- Mosel  
- Loire  
- Tokaj  

uit tot wereldklassiekers.

Door moderne technieken zoals temperatuurcontrole werd witte wijn nog preciezer.

Daardoor explodeerde de kwaliteit in de 20e eeuw.
',
    '- geschiedenis
- Bourgogne
- Mosel
- Loire
- Tokaj
',
    'Riesling wordt vaak gezien als één van de oudste kwaliteitsdruiven.
',
    '- Oude oorsprong  
- Europese dominantie  
- Moderne technieken verbeterden kwaliteit  
',
    'Zoek de oudste witte wijnregio die jij kent.
',
    8,
    4
  ),
  (
    'witte-wijncategorieen',
    'Belangrijkste witte wijncategorieën',
    'Na deze les herken jij de belangrijkste stijlen binnen witte wijn.
',
    'Witte wijn kent grofweg vijf hoofdgroepen:

### Fris & strak
Bijvoorbeeld:
- Sauvignon Blanc  
- Riesling  

### Rijk & romig
Bijvoorbeeld:
- Chardonnay  
- Viognier  

### Aromatisch
Bijvoorbeeld:
- Gewürztraminer  
- Muscat  

### Mineraal & strak
Bijvoorbeeld:
- Chablis  
- Albariño  

### Zoet
Bijvoorbeeld:
- Sauternes  
- Tokaji  

Deze categorieën vormen de basis voor de rest van de opleiding.
',
    '- fris
- rijk
- aromatisch
- mineraal
- zoet',
    'Chardonnay is wereldwijd het meest aangeplante witte druivenras.
',
    '- Fris  
- Rijk  
- Aromatisch  
- Mineraal  
- Zoet  
',
    '### Opdracht

Schrijf bij elke categorie één wijn die jij kent.
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-white-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'productie-white-wine'
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
    'direct-press',
    'Direct Press uitgelegd',
    'Na deze les begrijp jij waarom direct press de basis vormt van de meeste witte wijnproductie.
',
    'Bij witte wijn wil de wijnmaker meestal pure frisheid en heldere aroma’s behouden.

Daarom worden druiven vaak direct geperst.

Dit betekent:

- druiven worden snel na de oogst geperst  
- schillen worden vrijwel direct verwijderd  
- oxidatie blijft beperkt  

Dit zorgt voor:

- lichtere kleur  
- minder bitterheid  
- meer fruitexpressie  

Bij sommige stijlen wordt bewust kort schilcontact gebruikt om meer structuur te geven.

Maar direct press blijft wereldwijd de standaard.
',
    '- direct press
- persing
- schilcontact
- oxidatie
- frisheid
',
    'Champagne wordt ook vaak via direct press gemaakt.
',
    '- Snelle persing  
- Weinig schilcontact  
- Meer frisheid  
- Minder bitterheid  
',
    'Bekijk online hoe een pneumatische pers werkt.
',
    8,
    1
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting',
    'Na deze les kun jij uitleggen hoe alcohol ontstaat in witte wijn.
',
    'Alcoholische gisting is het proces waarbij gisten suiker omzetten in alcohol.

Formule:

Suiker → Alcohol + CO₂ + warmte

Bij witte wijn gebeurt dit meestal tussen 12–20°C.

Koel vergisten zorgt voor:

- meer fruit  
- meer precisie  
- minder verlies van aroma’s  

Te warm vergisten geeft minder frisse resultaten.

De wijnmaker stuurt dit proces heel nauwkeurig.
',
    '- fermentatie
- gist
- suiker
- alcohol
- temperatuur
',
    'Sauvignon Blanc wordt vaak extra koel vergist.
',
    '- Gist zet suiker om  
- Temperatuur is cruciaal  
- Koele fermentatie behoudt aroma’s  
',
    'Zoek drie witte druiven die vaak koel vergist worden.
',
    8,
    2
  ),
  (
    'rvs-vs-hout',
    'RVS vs hout',
    'Na deze les begrijp jij het verschil tussen RVS-rijping en houtrijping.
',
    'Na fermentatie kan witte wijn rijpen in verschillende materialen.

### RVS

Geeft:

- frisheid  
- precisie  
- puur fruit  

Veel gebruikt bij:

- Sauvignon Blanc  
- Riesling  
- Albariño  

### Hout

Geeft:

- structuur  
- romigheid  
- complexiteit  
- vanilletonen  

Veel gebruikt bij:

- Chardonnay  
- Viognier  
- Semillon  

Materiaal bepaalt dus sterk de stijl.
',
    '- RVS
- hout
- eikenhout
- structuur
- complexiteit
',
    'Nieuwe eikenhouten vaten geven meer smaak af dan oude.
',
    '- RVS = strak  
- Hout = rijk  
- Stijl wordt sterk beïnvloed  
',
    'Vergelijk een houtgelagerde Chardonnay met een RVS-Chardonnay.
',
    8,
    3
  ),
  (
    'malolactische-gisting',
    'Malolactische gisting',
    'Na deze les kun jij uitleggen wat malolactische gisting doet.
',
    'Malolactische gisting (MLF) zet scherp appelzuur om in zachter melkzuur.

Dit maakt de wijn:

- ronder  
- zachter  
- romiger  

MLF wordt veel gebruikt bij Chardonnay.

Minder vaak bij frisse stijlen zoals Sauvignon Blanc.

Typische smaak:

- boter  
- room  
- zachtere textuur  

Dit is een belangrijke stijlkeuze.
',
    '- malolactisch
- appelzuur
- melkzuur
- boter
- romigheid
',
    'Boterachtige Chardonnay komt vaak door MLF.
',
    '- Appelzuur wordt melkzuur  
- Zachtere wijn  
- Meer romigheid  
',
    'Proef een romige Chardonnay en let op boterige tonen.
',
    8,
    4
  ),
  (
    'rijping-witte-wijn',
    'Rijping van witte wijn',
    'Na deze les begrijp jij hoe rijping witte wijn verandert.
',
    'Niet alle witte wijn is bedoeld om jong te drinken.

Sommige witte wijnen ontwikkelen met tijd:

- honing  
- noten  
- toast  
- gedroogd fruit  

Belangrijke factoren:

- zuur  
- concentratie  
- suiker  
- structuur  

Voorbeelden van rijpingskampioenen:

- Riesling  
- Chenin Blanc  
- Chardonnay  
- Semillon  

Rijping kan op fles of vat plaatsvinden.
',
    '- rijping
- bewaarpotentieel
- zuur
- complexiteit
- evolutie
',
    'Top Riesling kan tientallen jaren rijpen.
',
    '- Niet alles is voor snelle consumptie  
- Zuur helpt rijpen  
- Complexiteit neemt toe  
',
    'Zoek drie witte wijnen met bewaarpotentieel.
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-white-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'proeven-white-wine'
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
    'hoe-proef-je-witte-wijn',
    'Hoe proef je witte wijn?',
    'Na deze les kun jij witte wijn systematisch proeven volgens een vaste methode.
',
    'Professioneel proeven gebeurt altijd in drie stappen:

### 1. Kijken

Je beoordeelt:

- kleur  
- intensiteit  
- helderheid  
- viscositeit  

### 2. Ruiken

Je zoekt naar:

- fruit  
- bloemen  
- kruiden  
- mineraliteit  
- hout  

### 3. Proeven

Je analyseert:

- zuur  
- zoet  
- alcohol  
- body  
- balans  
- lengte  

Bij witte wijn zijn zuren vaak extra belangrijk.

Die bepalen spanning, frisheid en bewaarpotentieel.
',
    '- proeven
- structuur
- aroma
- zuur
- balans
',
    'Veel sommeliers gebruiken wereldwijd de WSET-structuur.
',
    '- Kijken  
- Ruiken  
- Proeven  
- Structuur analyseren  
- Balans bepalen  
',
    'Proef een witte wijn volgens deze drie stappen.

### Checklist

- Ik heb gekeken  
- Ik heb geroken  
- Ik heb geproefd  
- Ik heb zuur beoordeeld  
',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij uit kleur belangrijke informatie halen.
',
    'Kleur vertelt veel over:

- leeftijd  
- druivenras  
- oxidatie  
- houtrijping  

Jonge witte wijn:

- bleekgeel  
- groenig  
- helder  

Rijpere witte wijn:

- goudgeel  
- amber  
- dieper van kleur  

Voorbeelden:

Riesling → vaak licht  
Chardonnay hout → vaak dieper goud  

Oxidatie maakt kleur donkerder.
',
    '- kleur
- oxidatie
- goud
- bleek
- leeftijd
',
    'Oude witte Bourgogne wordt vaak diep goudkleurig.
',
    '- Licht = vaak jong  
- Goud = vaak rijper  
- Kleur geeft veel signalen  
',
    'Vergelijk twee witte wijnen op kleur.
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les kun jij aroma’s indelen en herkennen.
',
    'Aroma’s delen we in drie groepen:

### Primair

Van de druif zelf:

- citrus  
- appel  
- peer  
- perzik  
- bloemen  

### Secundair

Van productie:

- gist  
- boter  
- brood  
- vanille  

### Tertiair

Van rijping:

- honing  
- noten  
- toast  
- petrol  

Door deze indeling kun je wijn beter analyseren.
',
    '- primair
- secundair
- tertiair
- aroma
- petrol
',
    'Petrol is typisch voor oudere Riesling.
',
    '- Primair = druif  
- Secundair = productie  
- Tertiair = rijping  
',
    'Maak een lijst van aroma’s uit een witte wijn.
',
    8,
    3
  ),
  (
    'zuur-herkennen',
    'Zuur herkennen',
    'Na deze les kun jij zuurgehalte herkennen en beoordelen.
',
    'Zuur is essentieel in witte wijn.

Het zorgt voor:

- frisheid  
- spanning  
- lengte  
- balans  

Je herkent zuur aan:

- speekselvorming  
- strak mondgevoel  
- levendigheid  

Hoge zuren vind je vaak in:

- Riesling  
- Sauvignon Blanc  
- Albariño  

Lagere zuren vaker in warmere klimaten.
',
    '- zuur
- spanning
- frisheid
- lengte
- balans
',
    'Zuur is één van de belangrijkste factoren voor bewaarpotentieel.
',
    '- Zuur = frisheid  
- Zuur = spanning  
- Hoge zuren geven bewaarpotentieel  
',
    'Vergelijk een Sauvignon Blanc met een Viognier op zuurgevoel.
',
    8,
    4
  ),
  (
    'mini-toets-witte-wijn',
    'Mini-toets witte wijn',
    'Na deze les toets jij jouw kennis van module 1–3.
',
    'In deze mini-toets combineer je:

- fundament  
- productie  
- proeven  

De toets is bedoeld als voorbereiding op Specialist-niveau.
',
    '- mini-toets
- blindproeven
- analyse
- deductie
- integratie
',
    '',
    '',
    'Proef blind één witte wijn en noteer:

- kleur  
- aroma’s  
- zuur  
- body  
- stijl  
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- frisse-druiven-white-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'frisse-druiven-white-wine'
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
    'sauvignon-blanc',
    'Sauvignon Blanc',
    'Na deze les herken jij Sauvignon Blanc op stijl, aroma en structuur.
',
    'Sauvignon Blanc is één van de meest herkenbare witte druiven ter wereld.

Typische kenmerken:

- hoge zuren  
- citrus  
- kruisbes  
- gras  
- limoen  
- groene paprika  

Koele klimaten geven:

- strak  
- mineraal  
- fris  

Warme klimaten geven:

- tropischer fruit  
- rijpere stijl  

Belangrijke regio’s:

- Loire  
- Marlborough  
- Stellenbosch  
- Friuli  

Sauvignon Blanc is vaak zeer gastronomisch.
',
    '- Sauvignon Blanc
- kruisbes
- gras
- citrus
- Marlborough
',
    'Marlborough zette Sauvignon Blanc wereldwijd op de kaart.
',
    '- Hoge zuren  
- Expressieve aroma’s  
- Breed inzetbaar  
- Sterke terroir-expressie  
',
    'Proef een Loire Sauvignon en een Nieuw-Zeelandse Sauvignon naast elkaar.
',
    8,
    1
  ),
  (
    'riesling',
    'Riesling',
    'Na deze les herken jij Riesling op zuur, mineraliteit en aromatische opbouw.
',
    'Riesling is één van de meest pure terroirdruiven.

Typische kenmerken:

- hoge zuren  
- limoen  
- groene appel  
- witte bloemen  
- mineraliteit  

Riesling kent veel stijlen:

- droog  
- off-dry  
- zoet  

Belangrijke regio’s:

- Mosel  
- Rheingau  
- Alsace  
- Clare Valley  

Met rijping ontstaat vaak petrol.
',
    '- Riesling
- petrol
- Mosel
- mineraliteit
- limoen
',
    'Riesling kan tientallen jaren rijpen.
',
    '- Hoge zuren  
- Veel terroir-invloed  
- Groot bewaarpotentieel  
',
    'Proef een jonge en oudere Riesling.
',
    8,
    2
  ),
  (
    'albarino',
    'Albariño',
    'Na deze les herken jij Albariño op frisheid, ziltigheid en citrus.
',
    'Albariño komt vooral uit Galicië.

Typische kenmerken:

- hoge zuren  
- citrus  
- perzik  
- ziltigheid  
- witte bloemen  

Door de Atlantische invloed blijft de wijn fris.

Bekende regio:

- Rías Baixas  

Albariño is een top pairingwijn voor seafood.
',
    '- Albariño
- Rías Baixas
- zilt
- citrus
- Atlantisch
',
    'Albariño wordt vaak “de witte wijn van de zee” genoemd.
',
    '- Zilt  
- Fris  
- Citrusgedreven  
- Sterk gastronomisch  
',
    'Proef Albariño met oesters of schaaldieren.
',
    8,
    3
  ),
  (
    'gruner-veltliner',
    'Grüner Veltliner',
    'Na deze les herken jij Grüner Veltliner op frisheid en kruidigheid.
',
    'Grüner Veltliner is Oostenrijks vlaggenschip.

Typische kenmerken:

- groene appel  
- limoen  
- witte peper  
- hoge zuren  

Belangrijk:

de peperige toets is vaak heel herkenbaar.

Topregio’s:

- Wachau  
- Kamptal  
- Kremstal  

Veel inzetbaar bij groenten en Aziatische keuken.
',
    '- Grüner Veltliner
- peper
- Oostenrijk
- Wachau
- frisheid
',
    'Grüner combineert opvallend goed met asperges.
',
    '- Kruidig  
- Fris  
- Peperig  
- Gastronomisch veelzijdig  
',
    'Proef Grüner met gegrilde groenten.
',
    8,
    4
  ),
  (
    'verdejo',
    'Verdejo',
    'Na deze les herken jij Verdejo op aroma, bittertje en stijl.
',
    'Verdejo is dé witte specialiteit van Rueda.

Typische kenmerken:

- citrus  
- venkel  
- groene kruiden  
- amandel  
- lichte bitterheid  

Verdejo wordt vaak jong gedronken.

Belangrijkste regio:

- Rueda  

Goede Verdejo combineert frisheid met structuur.

Dat maakt het een toegankelijke maar serieuze wijn.
',
    '- Verdejo
- Rueda
- venkel
- bittertje
- kruidigheid
',
    'Verdejo werd vroeger vaak oxidatief gemaakt.
',
    '- Kruidig  
- Fris  
- Licht bitter  
- Mediterrane stijl  
',
    'Vergelijk Verdejo met Sauvignon Blanc.
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- rijke-druiven-white-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'rijke-druiven-white-wine'
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
    'chardonnay',
    'Chardonnay',
    'Na deze les herken jij Chardonnay op stijl, structuur en productiekeuze.
',
    'Chardonnay is de meest veelzijdige witte druif ter wereld.

Waarom?

Omdat Chardonnay sterk reageert op:

- klimaat  
- terroir  
- wijnmaakstijl  

Koele klimaten geven:

- citrus  
- appel  
- hoge zuren  
- mineraliteit  

Warme klimaten geven:

- tropisch fruit  
- rijpere body  
- zachtere zuren  

Hout en malolactische gisting worden vaak gebruikt.

Dat geeft:

- boter  
- vanille  
- toast  
- romigheid  

Belangrijke regio’s:

- Bourgogne  
- Californië  
- Australië  
- Chili  
',
    '- Chardonnay
- Bourgogne
- Chablis
- MLF
- hout
',
    'Chablis is pure Chardonnay zonder uitgesproken houtinvloed.
',
    '- Zeer veelzijdig  
- Klimaatgevoelig  
- Sterk beïnvloedbaar door wijnmaker  
',
    'Proef een Chablis en een houtgelagerde Meursault naast elkaar.
',
    8,
    1
  ),
  (
    'chenin-blanc',
    'Chenin Blanc',
    'Na deze les herken jij Chenin Blanc op veelzijdigheid en zuurstructuur.
',
    'Chenin Blanc is één van de meest onderschatte witte druiven.

De druif kent extreem veel stijlen:

- strak droog  
- rijk droog  
- mousserend  
- edelzoet  

Typische kenmerken:

- appel  
- peer  
- honing  
- wol  
- hoge zuren  

Belangrijke regio’s:

- Loire  
- Zuid-Afrika  

Door hoge zuren heeft Chenin vaak uitstekend bewaarpotentieel.
',
    '- Chenin Blanc
- Vouvray
- Loire
- honing
- zuur
',
    'Vouvray is één van de beroemdste Chenin-regio’s.
',
    '- Veelzijdig  
- Hoge zuren  
- Sterke rijpingscapaciteit  
',
    'Vergelijk een droge Vouvray met een zoete Chenin.
',
    8,
    2
  ),
  (
    'viognier',
    'Viognier',
    'Na deze les herken jij Viognier op aromatische rijkdom en body.
',
    'Viognier is beroemd om zijn rijke en expressieve stijl.

Typische kenmerken:

- abrikoos  
- perzik  
- bloemen  
- honing  
- specerijen  

Viognier heeft meestal:

- lage tot middelhoge zuren  
- volle body  
- zachte textuur  

Belangrijkste regio:

- Condrieu  

Viognier draait meer om textuur dan spanning.
',
    '- Viognier
- Condrieu
- abrikoos
- body
- bloemen
',
    'Condrieu is vrijwel volledig Viognier.
',
    '- Vol  
- Aromatisch  
- Zacht  
- Exotisch  
',
    'Proef Viognier blind naast Chardonnay.
',
    8,
    3
  ),
  (
    'semillon',
    'Semillon',
    'Na deze les herken jij Semillon op textuur en rijpingspotentieel.
',
    'Semillon is een druif met subtiele kracht.

Jong vaak:

- citroen  
- wasachtig  
- zacht  

Met rijping:

- honing  
- toast  
- noten  

Belangrijke regio’s:

- Bordeaux  
- Hunter Valley  

Semillon wordt vaak geblend met Sauvignon Blanc.

Ook essentieel in Sauternes.
',
    '- Semillon
- Bordeaux
- Sauternes
- botrytis
- wasachtig
',
    'Botrytis speelt een grote rol bij Sauternes.
',
    '- Subtiel  
- Structuur  
- Rijping belangrijk  
',
    'Zoek een Bordeaux Blanc blend met Semillon.
',
    8,
    4
  ),
  (
    'marsanne-roussanne',
    'Marsanne & Roussanne',
    'Na deze les begrijp jij hoe Marsanne en Roussanne samenwerken.
',
    'Deze Rhône-druiven worden vaak samen gebruikt.

### Marsanne

Geeft:

- body  
- textuur  
- rijkdom  

### Roussanne

Geeft:

- aroma  
- zuur  
- elegantie  

Samen vormen ze rijke, complexe witte wijnen.

Belangrijke regio’s:

- Hermitage  
- Saint-Joseph  

Vaak geschikt voor rijping.
',
    '- Marsanne
- Roussanne
- Rhône
- textuur
- complexiteit
',
    'Witte Hermitage behoort tot de meest krachtige witte wijnen ter wereld.
',
    '- Marsanne = body  
- Roussanne = finesse  
- Samen = complexiteit  
',
    'Vergelijk Rhône-white blends met Chardonnay.
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- aromatische-druiven-white-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'aromatische-druiven-white-wine'
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
    'gewurztraminer',
    'Gewürztraminer',
    'Na deze les herken jij Gewürztraminer op aroma, textuur en stijl.
',
    'Gewürztraminer is één van de meest aromatische druiven ter wereld.

Typische kenmerken:

- lychee  
- rozen  
- gember  
- specerijen  
- tropisch fruit  

De wijn heeft vaak:

- lage zuren  
- volle body  
- hoge aromatische intensiteit  

Belangrijke regio’s:

- Alsace  
- Alto Adige  
- Duitsland  

Gewürztraminer is uniek omdat geur en smaak extreem uitgesproken zijn.
',
    '- Gewürztraminer
- lychee
- roos
- specerijen
- Alsace
',
    'Gewürz betekent letterlijk “kruidig”.
',
    '- Zeer aromatisch  
- Kruidig  
- Vol  
- Lage zuren  
',
    'Proef Gewürztraminer blind en noteer drie opvallende aroma’s.
',
    8,
    1
  ),
  (
    'muscat',
    'Muscat',
    'Na deze les herken jij Muscat op druivigheid en florale expressie.
',
    'Muscat is één van de oudste druivenrassen ter wereld.

Wat Muscat uniek maakt:

de wijn ruikt vaak letterlijk naar druiven.

Typische kenmerken:

- druif  
- sinaasappelbloesem  
- perzik  
- abrikoos  
- honing  

Muscat komt in veel stijlen:

- droog  
- zoet  
- mousserend  
- versterkt  

Belangrijke regio’s:

- Piemonte  
- Zuid-Frankrijk  
- Australië  
',
    '- Muscat
- druivig
- floraal
- Moscato
- honing
',
    'Moscato d’Asti is een lichte mousserende Muscat.
',
    '- Zeer florale stijl  
- Druivig karakter  
- Veel stijlen mogelijk  
',
    'Vergelijk Muscat met Gewürztraminer.
',
    8,
    2
  ),
  (
    'torrontes',
    'Torrontés',
    'Na deze les herken jij Torrontés op geurintensiteit en frisheid.
',
    'Torrontés is Argentinië’s bekendste witte druif.

Typische kenmerken:

- bloemen  
- citrus  
- perzik  
- tropisch fruit  
- kruidigheid  

Wat Torrontés bijzonder maakt:

de geur is vaak rijker dan de smaak.

Belangrijkste regio:

- Salta  

Door hoogte behoudt de wijn frisse zuren.
',
    '- Torrontés
- Salta
- bloemen
- hoogte
- frisheid
',
    'Salta ligt op extreem hoge wijngaardhoogtes.
',
    '- Zeer aromatisch  
- Frisse structuur  
- Argentijnse specialiteit  
',
    'Proef Torrontés blind naast Muscat.
',
    8,
    3
  ),
  (
    'pinot-gris',
    'Pinot Gris',
    'Na deze les herken jij Pinot Gris op textuur, stijl en aromatische balans.
',
    'Pinot Gris heeft veel gezichten.

In Italië (Pinot Grigio):

- lichter  
- frisser  
- neutraler  

In Alsace (Pinot Gris):

- rijker  
- kruidiger  
- voller  

Typische kenmerken:

- peer  
- appel  
- kruiden  
- rook  
- honing  

Pinot Gris zit tussen fris en rijk in.
',
    '- Pinot Gris
- Pinot Grigio
- Alsace
- peer
- textuur
',
    'Pinot Gris en Pinot Grigio zijn dezelfde druif.
',
    '- Veel stijlverschillen  
- Italië = lichter  
- Alsace = rijker  
',
    'Vergelijk Pinot Grigio met Pinot Gris.
',
    8,
    4
  ),
  (
    'vermentino',
    'Vermentino',
    'Na deze les herken jij Vermentino op mediterrane frisheid en kruidigheid.
',
    'Vermentino is typisch mediterraan.

Belangrijkste regio’s:

- Sardinië  
- Ligurië  
- Toscane  
- Zuid-Frankrijk  

Typische kenmerken:

- citrus  
- kruiden  
- witte bloemen  
- amandel  
- ziltigheid  

Vermentino combineert frisheid met mediterrane warmte.

Dat maakt het perfect voor zomerse gastronomie.
',
    '- Vermentino
- Rolle
- Sardinië
- mediterraan
- zilt
',
    'Vermentino heet in Zuid-Frankrijk vaak Rolle.
',
    '- Mediterraan  
- Fris  
- Kruidig  
- Zilt  
',
    'Proef Vermentino met gegrilde vis.
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-white-wine (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'service-white-wine'
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
    'Na deze les weet jij hoe temperatuur de beleving van witte wijn beïnvloedt.
',
    'Temperatuur is cruciaal.

Te koud:

- aroma’s sluiten  
- structuur verdwijnt  
- zuur domineert  

Te warm:

- alcohol wordt dominant  
- frisheid verdwijnt  
- wijn voelt log aan  

Richtlijnen:

### Licht & fris
(Sauvignon Blanc, Albariño, Riesling)

**6–9°C**

### Medium body
(Verdejo, Grüner, Chenin)

**8–11°C**

### Rijk & houtgelagerd
(Chardonnay, Viognier)

**10–13°C**

Belangrijk:

te koud serveren is de meest gemaakte fout.
',
    '- temperatuur
- frisheid
- alcohol
- aroma
- balans
',
    'Top Bourgogne wordt vaak bewust warmer geserveerd.
',
    '- Temperatuur bepaalt aroma  
- Te koud sluit wijn  
- Te warm maakt wijn zwaar  
',
    'Meet de temperatuur van drie witte wijnen voor het serveren.
',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij hoe glaswerk invloed heeft op witte wijn.
',
    'Het juiste glas maakt een groot verschil.

Belangrijke factoren:

- opening  
- inhoud  
- vorm  
- hoogte  

Smaller glas:

- behoudt frisheid  
- focust aroma’s  

Breder glas:

- opent complexe aroma’s  
- geeft meer zuurstof  

Voorbeelden:

Sauvignon Blanc → smaller  
Chardonnay → breder  
Riesling → middelgroot  

Professionele service vraagt bewust glasgebruik.
',
    '- glaswerk
- aroma
- vorm
- opening
- zuurstof
',
    'Veel toprestaurants gebruiken verschillende wittewijnglazen.
',
    '- Glas beïnvloedt geur  
- Glas beïnvloedt structuur  
- Complexiteit vraagt ruimte  
',
    'Proef dezelfde wijn uit twee verschillende glazen.
',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren van witte wijn',
    'Na deze les weet jij wanneer witte wijn decanteren zinvol is.
',
    'Veel mensen denken dat decanteren alleen voor rood is.

Dat klopt niet.

Sommige witte wijnen profiteren sterk van zuurstof.

Voorbeelden:

- oude Riesling  
- witte Bourgogne  
- Chenin Blanc  
- witte Rhône  

Decanteren helpt bij:

- reductie  
- gesloten aroma’s  
- complexiteit openen  

Niet alle witte wijn heeft dit nodig.

Jonge frisse stijlen meestal niet.
',
    '- decanteren
- reductie
- zuurstof
- complexiteit
- openen
',
    'Top witte Bourgogne wordt soms standaard gedecanteerd.
',
    '- Niet alleen voor rood  
- Helpt bij reductie  
- Vooral complexe wijnen  
',
    'Open een rijke witte wijn en proef direct en na 30 minuten.
',
    8,
    3
  ),
  (
    'bewaren-en-rijping',
    'Bewaren & rijping',
    'Na deze les begrijp jij hoe witte wijn correct wordt bewaard en hoe rijping werkt.
',
    'Niet elke witte wijn is bedoeld om te bewaren.

Belangrijke factoren:

- zuur  
- suiker  
- concentratie  
- structuur  

Goede bewaarkandidaten:

- Riesling  
- Chardonnay  
- Chenin Blanc  
- Semillon  

Ideale opslag:

- 10–14°C  
- donker  
- trillingsvrij  
- constante temperatuur  

Fouten:

- te warm  
- licht  
- temperatuurschommelingen  
',
    '- bewaren
- rijping
- temperatuur
- stabiliteit
- evolutie
',
    'Sommige Rieslings leven langer dan veel rode wijnen.
',
    '- Bewaarpotentieel verschilt sterk  
- Zuur helpt rijpen  
- Opslag is cruciaal  
',
    'Controleer jouw wijnopslag thuis.
',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-white-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'pairing-white-wine'
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
    'witte-wijn-vis',
    'Witte wijn & vis',
    'Na deze les begrijp jij waarom witte wijn zo sterk werkt met vis.
',
    'Vis en witte wijn vormen één van de sterkste klassieke pairings.

Waarom?

Omdat witte wijn vaak:

- fris is  
- hoge zuren heeft  
- weinig tannine bevat  

Dat werkt goed met:

- delicate eiwitten  
- ziltigheid  
- zachte texturen  

Belangrijke regels:

### Lichte vis → lichte wijn

Bijvoorbeeld:

Zeebaars + Sauvignon Blanc

### Vettere vis → rijkere wijn

Bijvoorbeeld:

Zalm + houtgelagerde Chardonnay

### Rauwe vis → hoge zuren

Bijvoorbeeld:

Oesters + Albariño
',
    '- vis
- zuur
- zilt
- pairing
- intensiteit
',
    'Rode wijn kan vis metaalachtig laten smaken door tannines.
',
    '- Frisheid werkt goed  
- Zuur snijdt door vet  
- Intensiteit moet matchen  
',
    'Combineer drie visgerechten met drie witte wijnen.
',
    8,
    1
  ),
  (
    'witte-wijn-kaas',
    'Witte wijn & kaas',
    'Na deze les begrijp jij waarom witte wijn vaak beter werkt met kaas dan rood.
',
    'Veel kazen bevatten:

- vet  
- zout  
- romigheid  
- umami  

Witte wijn heeft vaak:

- zuur  
- frisheid  
- precisie  

Dat zorgt voor balans.

Voorbeelden:

Geitenkaas + Sauvignon Blanc  
Brie + Chardonnay  
Comté + Chenin Blanc  
Blauwschimmel + zoete Riesling

Belangrijk:

zuren reinigen het gehemelte.
',
    '- kaas
- vet
- zout
- umami
- zuur
',
    'Veel sommeliers kiezen liever wit dan rood bij kaas.
',
    '- Zuur snijdt door vet  
- Witte wijn behoudt frisheid  
- Kaas en wit zijn vaak topcombinaties  
',
    'Maak thuis een kleine kaasplank met drie witte wijnen.
',
    8,
    2
  ),
  (
    'witte-wijn-gevogelte',
    'Witte wijn & gevogelte',
    'Na deze les kun jij witte wijn combineren met gevogelte.
',
    'Gevogelte is veelzijdig.

De bereiding bepaalt de wijn.

### Licht bereid

Bijvoorbeeld:

kipfilet, kalkoen

Past goed bij:

- Sauvignon Blanc  
- Verdejo  
- Grüner Veltliner  

### Rijk bereid

Bijvoorbeeld:

roomsaus, boter, gebraden kip

Past goed bij:

- Chardonnay  
- Viognier  
- Chenin Blanc  

Belangrijk:

saus is vaak belangrijker dan het vlees.
',
    '- gevogelte
- saus
- structuur
- pairing
- balans
',
    'Een romige saus kan een pairing volledig veranderen.
',
    '- Bereiding bepaalt pairing  
- Licht = fris  
- Rijk = voller  
',
    'Bedenk drie wijncombinaties bij kip.
',
    8,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-white-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'white-wine' and m.slug = 'examen-white-wine'
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
    'sauvignon-vs-riesling-blind',
    'Sauvignon Blanc vs Riesling blind',
    'Na deze les kun jij Sauvignon Blanc en Riesling blind van elkaar onderscheiden.
',
    'Dit is één van de belangrijkste witte blindvergelijkingen.

Beide hebben:

- hoge zuren  
- frisheid  
- aromatische precisie  

Maar de verschillen zijn groot.

### Sauvignon Blanc

Typisch:

- gras  
- kruisbes  
- groene paprika  
- limoen  
- vaak expressiever groen  

### Riesling

Typisch:

- limoen  
- groene appel  
- witte bloemen  
- mineraliteit  
- soms petrol (rijping)  

Belangrijk onderscheid:

Sauvignon is vaak agressiever groen.

Riesling is vaak strakker, puurder en mineraler.
',
    '- Sauvignon Blanc
- Riesling
- kruisbes
- petrol
- mineraliteit
',
    'Veel blindproevers verwarren jonge Riesling en Loire Sauvignon.
',
    '- Beide fris  
- Sauvignon = groener  
- Riesling = mineraler  
- Petrol helpt bij oudere Riesling  
',
    'Proef beide blind naast elkaar.

### Checklist

- Zuur vergelijken  
- Aroma vergelijken  
- Structuur vergelijken  
- Conclusie trekken  
',
    10,
    1
  ),
  (
    'chardonnay-vs-chenin-blind',
    'Chardonnay vs Chenin Blanc blind',
    'Na deze les kun jij Chardonnay en Chenin Blanc blind onderscheiden.
',
    'Dit is een moeilijkere vergelijking.

Beide kunnen:

- rijk zijn  
- hout hebben  
- rijpen  
- complex zijn  

### Chardonnay

Typisch:

- boter  
- vanille  
- toast  
- ronde textuur  

Vaak door:

- hout  
- malolactische gisting  

### Chenin Blanc

Typisch:

- appel  
- honing  
- wol  
- hogere zuren  

Belangrijk verschil:

Chenin heeft bijna altijd meer spanning.

Chardonnay voelt vaak ronder.
',
    '- Chardonnay
- Chenin Blanc
- boter
- honing
- spanning
',
    'Oude Chenin kan verrassend Bourgondisch overkomen.
',
    '- Chardonnay = ronder  
- Chenin = strakker  
- Chenin heeft vaak meer zuur  
',
    'Proef beide blind naast elkaar.
',
    10,
    2
  ),
  (
    'white-final-exam',
    'Theorie- en praktijkexamen',
    'Na deze les toon jij aan dat je de White Wine Track beheerst op Master-niveau.
',
    '',
    '- examen
- blindproeven
- integratie
- service
- pairing
',
    '',
    '',
    '### Eindopdracht

Voer een volledige blindanalyse uit van twee witte wijnen.

Analyseer:

- kleur  
- geur  
- zuur  
- body  
- stijl  
- vermoedelijk druivenras  
- herkomst  
- bewaarpotentieel  
- mogelijke pairing  

---

### Checklist

- Ik heb beide wijnen blind geanalyseerd  
- Ik heb structuur beoordeeld  
- Ik heb aroma’s benoemd  
- Ik heb druivenrassen ingeschat  
- Ik heb passende pairings gekozen  
- Ik heb serviceadvies gegeven  

---

### Reflectievraag

Waar zit jouw grootste groeipotentieel:

- theorie  
- blindproeven  
- druivenkennis  
- service  
- pairing  
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
  where t.slug = 'white-wine'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-white-wine', 'wat-is-witte-wijn', 1, 'Witte wijn wordt meestal gemaakt met:', '["Lang schilcontact", "Kort schilcontact", "Geen fermentatie", "Koolzuur"]', 1, 'Correct: Kort schilcontact'),
  ('intro-white-wine', 'wat-is-witte-wijn', 2, 'Wat is belangrijk in witte wijn?', '["Tannine", "Zuur", "Bitterheid", "Alcohol"]', 1, 'Correct: Zuur'),
  ('intro-white-wine', 'wat-is-witte-wijn', 3, 'Witte wijn kan ook van blauwe druiven worden gemaakt:', '["Ja", "Nee", "Alleen in Italië", "Alleen mousserend"]', 0, 'Correct: Ja'),
  ('intro-white-wine', 'wat-is-witte-wijn', 4, 'Waar komt de kleur meestal vandaan?', '["Sap", "Schil", "Kurk", "Hout"]', 1, 'Correct: Schil'),
  ('intro-white-wine', 'wat-is-witte-wijn', 5, 'Witte wijn draait vaak om:', '["Frisheid", "Tannine", "Bitter", "Zout"]', 0, 'Correct: Frisheid'),
  ('intro-white-wine', 'hoe-ontstaat-witte-wijn', 1, 'Hoe heet direct persen?', '["Direct press", "Carbonic", "Blending", "Maceratie"]', 0, 'Correct: Direct press'),
  ('intro-white-wine', 'hoe-ontstaat-witte-wijn', 2, 'Wat doen gisten?', '["Maken zuur", "Maken alcohol", "Maken kleur", "Maken tannine"]', 1, 'Correct: Maken alcohol'),
  ('intro-white-wine', 'hoe-ontstaat-witte-wijn', 3, 'Waarom koele fermentatie?', '["Meer alcohol", "Aroma behouden", "Minder zuur", "Meer tannine"]', 1, 'Correct: Aroma behouden'),
  ('intro-white-wine', 'hoe-ontstaat-witte-wijn', 4, 'Waar kan witte wijn rijpen?', '["Alleen hout", "Alleen RVS", "Beide", "Beton niet"]', 2, 'Correct: Beide'),
  ('intro-white-wine', 'hoe-ontstaat-witte-wijn', 5, 'Wat beïnvloedt stijl?', '["Productiekeuzes", "Alleen druif", "Alleen leeftijd", "Alleen land"]', 0, 'Correct: Productiekeuzes'),
  ('intro-white-wine', 'waarom-is-witte-wijn-uniek', 1, 'Wat maakt witte wijn vaak uniek?', '["Hoge tannine", "Hoge zuren", "Koolzuur", "Fortificatie"]', 1, 'Correct: Hoge zuren'),
  ('intro-white-wine', 'waarom-is-witte-wijn-uniek', 2, 'Wat bepaalt witte wijnstijl sterk?', '["Klimaat", "Flesvorm", "Kurk", "Leeftijd"]', 0, 'Correct: Klimaat'),
  ('intro-white-wine', 'waarom-is-witte-wijn-uniek', 3, 'Waarom is witte wijn gastronomisch sterk?', '["Door hoge zuren", "Door tannines", "Door kleur", "Door alcohol"]', 0, 'Correct: Door hoge zuren'),
  ('intro-white-wine', 'waarom-is-witte-wijn-uniek', 4, 'Wat geeft spanning in witte wijn?', '["Alcohol", "Zuur", "Hout", "Restsuiker"]', 1, 'Correct: Zuur'),
  ('intro-white-wine', 'waarom-is-witte-wijn-uniek', 5, 'Witte wijn kan zijn:', '["Alleen fris", "Alleen rijk", "Zeer veelzijdig", "Alleen zoet"]', 2, 'Correct: Zeer veelzijdig'),
  ('intro-white-wine', 'geschiedenis-witte-wijn', 1, 'Wie maakten al vroeg witte wijn?', '["Grieken en Romeinen", "Nederlanders", "Zweden", "Amerikanen"]', 0, 'Correct: Grieken en Romeinen'),
  ('intro-white-wine', 'geschiedenis-witte-wijn', 2, 'Welke regio is historisch belangrijk?', '["Bourgogne", "Douro", "Porto", "Jerez"]', 0, 'Correct: Bourgogne'),
  ('intro-white-wine', 'geschiedenis-witte-wijn', 3, 'Welke druif geldt als zeer oud?', '["Riesling", "Sauvignon Blanc", "Verdejo", "Muscat"]', 0, 'Correct: Riesling'),
  ('intro-white-wine', 'geschiedenis-witte-wijn', 4, 'Wat verbeterde witte wijnkwaliteit sterk?', '["Temperatuurcontrole", "Fortificatie", "Distillatie", "Carbonatie"]', 0, 'Correct: Temperatuurcontrole'),
  ('intro-white-wine', 'geschiedenis-witte-wijn', 5, 'Wanneer explodeerde de kwaliteit sterk?', '["20e eeuw", "15e eeuw", "16e eeuw", "18e eeuw"]', 0, 'Correct: 20e eeuw'),
  ('intro-white-wine', 'witte-wijncategorieen', 1, 'Welke stijl is meestal het meest fris?', '["Sauvignon Blanc", "Viognier", "Marsanne", "Semillon"]', 0, 'Correct: Sauvignon Blanc'),
  ('intro-white-wine', 'witte-wijncategorieen', 2, 'Welke stijl is vaak romig?', '["Chardonnay", "Riesling", "Verdejo", "Muscat"]', 0, 'Correct: Chardonnay'),
  ('intro-white-wine', 'witte-wijncategorieen', 3, 'Welke stijl is sterk aromatisch?', '["Gewürztraminer", "Chablis", "Albariño", "Chenin Blanc"]', 0, 'Correct: Gewürztraminer'),
  ('intro-white-wine', 'witte-wijncategorieen', 4, 'Welke stijl is zoet?', '["Tokaji", "Chablis", "Verdejo", "Pinot Grigio"]', 0, 'Correct: Tokaji'),
  ('intro-white-wine', 'witte-wijncategorieen', 5, 'Welke stijl is vaak mineraal?', '["Chablis", "Muscat", "Viognier", "Gewürztraminer"]', 0, 'Correct: Chablis'),
  ('productie-white-wine', 'direct-press', 1, 'Waarom direct press?', '["Meer tannine", "Minder schilinvloed", "Meer alcohol", "Meer kleur"]', 1, 'Correct: Minder schilinvloed'),
  ('productie-white-wine', 'direct-press', 2, 'Wat blijft beter behouden?', '["Tannine", "Aroma’s", "Bitterheid", "Alcohol"]', 1, 'Correct: Aroma’s'),
  ('productie-white-wine', 'direct-press', 3, 'Wat vermindert?', '["Schilcontact", "Zuur", "Gisting", "Alcohol"]', 0, 'Correct: Schilcontact'),
  ('productie-white-wine', 'direct-press', 4, 'Welke wijn gebruikt dit ook?', '["Champagne", "Port", "Sherry", "Madeira"]', 0, 'Correct: Champagne'),
  ('productie-white-wine', 'direct-press', 5, 'Direct press zorgt vaak voor:', '["Frissere wijn", "Zoetere wijn", "Oudere wijn", "Zwaardere wijn"]', 0, 'Correct: Frissere wijn'),
  ('productie-white-wine', 'alcoholische-gisting', 1, 'Wat zet suiker om in alcohol?', '["Bacteriën", "Gist", "Zuurstof", "Tannine"]', 1, 'Correct: Gist'),
  ('productie-white-wine', 'alcoholische-gisting', 2, 'Wat ontstaat tijdens fermentatie?', '["Alcohol", "Tannine", "Kleur", "Zout"]', 0, 'Correct: Alcohol'),
  ('productie-white-wine', 'alcoholische-gisting', 3, 'Waarom koel vergisten?', '["Meer alcohol", "Aroma behouden", "Minder zuur", "Meer kleur"]', 1, 'Correct: Aroma behouden'),
  ('productie-white-wine', 'alcoholische-gisting', 4, 'Wat ontstaat naast alcohol?', '["Zuur", "CO₂", "Hout", "Bitter"]', 1, 'Correct: CO₂'),
  ('productie-white-wine', 'alcoholische-gisting', 5, 'Te warme fermentatie geeft vaak:', '["Meer frisheid", "Minder precisie", "Minder alcohol", "Meer zuur"]', 1, 'Correct: Minder precisie'),
  ('productie-white-wine', 'rvs-vs-hout', 1, 'Wat geeft RVS meestal?', '["Vanille", "Frisheid", "Boter", "Toast"]', 1, 'Correct: Frisheid'),
  ('productie-white-wine', 'rvs-vs-hout', 2, 'Wat geeft hout vaak?', '["Meer frisheid", "Structuur", "Minder aroma", "Minder body"]', 1, 'Correct: Structuur'),
  ('productie-white-wine', 'rvs-vs-hout', 3, 'Welke druif wordt vaak op hout opgevoed?', '["Chardonnay", "Riesling", "Verdejo", "Albariño"]', 0, 'Correct: Chardonnay'),
  ('productie-white-wine', 'rvs-vs-hout', 4, 'Nieuwe vaten geven:', '["Minder smaak", "Meer smaak", "Minder zuur", "Minder body"]', 1, 'Correct: Meer smaak'),
  ('productie-white-wine', 'rvs-vs-hout', 5, 'Materiaal beïnvloedt:', '["Alleen kleur", "Stijl sterk", "Alleen alcohol", "Alleen leeftijd"]', 1, 'Correct: Stijl sterk'),
  ('productie-white-wine', 'malolactische-gisting', 1, 'Wat zet MLF om?', '["Suiker", "Appelzuur", "Alcohol", "Tannine"]', 1, 'Correct: Appelzuur'),
  ('productie-white-wine', 'malolactische-gisting', 2, 'Waar verandert appelzuur in?', '["Citroenzuur", "Melkzuur", "Koolzuur", "Wijnsteenzuur"]', 1, 'Correct: Melkzuur'),
  ('productie-white-wine', 'malolactische-gisting', 3, 'Wat geeft MLF vaak?', '["Boterigheid", "Gras", "Citrus", "Zout"]', 0, 'Correct: Boterigheid'),
  ('productie-white-wine', 'malolactische-gisting', 4, 'Bij welke druif wordt MLF vaak gebruikt?', '["Chardonnay", "Riesling", "Sauvignon Blanc", "Albariño"]', 0, 'Correct: Chardonnay'),
  ('productie-white-wine', 'malolactische-gisting', 5, 'Wat doet MLF met structuur?', '["Zachter", "Harder", "Bitterder", "Zouter"]', 0, 'Correct: Zachter'),
  ('productie-white-wine', 'rijping-witte-wijn', 1, 'Wat helpt rijping?', '["Zuur", "Lage alcohol", "Bitter", "Lage kleur"]', 0, 'Correct: Zuur'),
  ('productie-white-wine', 'rijping-witte-wijn', 2, 'Welke druif rijpt goed?', '["Riesling", "Verdejo", "Airén", "Trebbiano"]', 0, 'Correct: Riesling'),
  ('productie-white-wine', 'rijping-witte-wijn', 3, 'Wat ontstaat vaak?', '["Honingtonen", "Meer fruit", "Minder aroma", "Meer koolzuur"]', 0, 'Correct: Honingtonen'),
  ('productie-white-wine', 'rijping-witte-wijn', 4, 'Waar kan rijping plaatsvinden?', '["Alleen fles", "Alleen vat", "Beide", "Geen van beide"]', 2, 'Correct: Beide'),
  ('productie-white-wine', 'rijping-witte-wijn', 5, 'Wat neemt toe?', '["Complexiteit", "Suiker", "Kleurverlies", "Alcohol"]', 0, 'Correct: Complexiteit'),
  ('proeven-white-wine', 'hoe-proef-je-witte-wijn', 1, 'Wat is de eerste stap?', '["Ruiken", "Proeven", "Kijken", "Schenken"]', 2, 'Correct: Kijken'),
  ('proeven-white-wine', 'hoe-proef-je-witte-wijn', 2, 'Wat beoordeel je bij kijken?', '["Zuur", "Kleur", "Body", "Alcohol"]', 1, 'Correct: Kleur'),
  ('proeven-white-wine', 'hoe-proef-je-witte-wijn', 3, 'Wat zoek je bij ruiken?', '["Structuur", "Aroma’s", "Tannine", "Koolzuur"]', 1, 'Correct: Aroma’s'),
  ('proeven-white-wine', 'hoe-proef-je-witte-wijn', 4, 'Wat bepaalt spanning?', '["Alcohol", "Zuur", "Suiker", "Hout"]', 1, 'Correct: Zuur'),
  ('proeven-white-wine', 'hoe-proef-je-witte-wijn', 5, 'Wat analyseer je als laatste?', '["Kleur", "Body", "Glas", "Herkomst"]', 1, 'Correct: Body'),
  ('proeven-white-wine', 'kleur-analyseren', 1, 'Wat zegt kleur vaak?', '["Leeftijd", "Alcohol", "Kurk", "Druivenpitten"]', 0, 'Correct: Leeftijd'),
  ('proeven-white-wine', 'kleur-analyseren', 2, 'Welke kleur past vaak bij jonge witte wijn?', '["Amber", "Bleekgeel", "Bruin", "Rood"]', 1, 'Correct: Bleekgeel'),
  ('proeven-white-wine', 'kleur-analyseren', 3, 'Wat wijst op oxidatie?', '["Donkerdere kleur", "Lichtere kleur", "Meer koolzuur", "Meer zuur"]', 0, 'Correct: Donkerdere kleur'),
  ('proeven-white-wine', 'kleur-analyseren', 4, 'Welke wijn is vaak licht van kleur?', '["Riesling", "Hout-Chardonnay", "Semillon oud", "Viognier"]', 0, 'Correct: Riesling'),
  ('proeven-white-wine', 'kleur-analyseren', 5, 'Kleur geeft informatie over:', '["Structuur en leeftijd", "Alleen alcohol", "Alleen prijs", "Alleen herkomst"]', 0, 'Correct: Structuur en leeftijd'),
  ('proeven-white-wine', 'aromas-herkennen', 1, 'Wat is citrus?', '["Primair", "Secundair", "Tertiair", "Oxidatief"]', 0, 'Correct: Primair'),
  ('proeven-white-wine', 'aromas-herkennen', 2, 'Wat is boter?', '["Primair", "Secundair", "Tertiair", "Geen aroma"]', 1, 'Correct: Secundair'),
  ('proeven-white-wine', 'aromas-herkennen', 3, 'Wat is honing?', '["Primair", "Secundair", "Tertiair", "Zuur"]', 2, 'Correct: Tertiair'),
  ('proeven-white-wine', 'aromas-herkennen', 4, 'Waar hoort petrol?', '["Primair", "Secundair", "Tertiair", "Hout"]', 2, 'Correct: Tertiair'),
  ('proeven-white-wine', 'aromas-herkennen', 5, 'Waarom is indeling belangrijk?', '["Betere analyse", "Meer alcohol", "Minder geur", "Minder zuur"]', 0, 'Correct: Betere analyse'),
  ('proeven-white-wine', 'zuur-herkennen', 1, 'Wat geeft zuur?', '["Frisheid", "Bitter", "Zoet", "Tannine"]', 0, 'Correct: Frisheid'),
  ('proeven-white-wine', 'zuur-herkennen', 2, 'Hoe herken je zuur?', '["Speekselvorming", "Warmte", "Bitterheid", "Zout"]', 0, 'Correct: Speekselvorming'),
  ('proeven-white-wine', 'zuur-herkennen', 3, 'Welke druif heeft vaak hoge zuren?', '["Riesling", "Viognier", "Marsanne", "Semillon"]', 0, 'Correct: Riesling'),
  ('proeven-white-wine', 'zuur-herkennen', 4, 'Waarom helpt zuur bij rijping?', '["Stabiliteit", "Meer kleur", "Minder aroma", "Meer alcohol"]', 0, 'Correct: Stabiliteit'),
  ('proeven-white-wine', 'zuur-herkennen', 5, 'Zuur bepaalt vaak:', '["Spanning", "Tannine", "Kleur", "Zoetheid"]', 0, 'Correct: Spanning'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 1, 'Typisch aroma?', '["Vanille", "Gras", "Karamel", "Noten"]', 1, 'Correct: Gras'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 2, 'Zuurgehalte?', '["Laag", "Hoog", "Middel", "Geen"]', 1, 'Correct: Hoog'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 3, 'Bekende regio?', '["Rioja", "Marlborough", "Porto", "Douro"]', 1, 'Correct: Marlborough'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 4, 'Warme klimaatzone geeft vaak:', '["Meer tropisch fruit", "Minder fruit", "Meer tannine", "Minder zuur"]', 0, 'Correct: Meer tropisch fruit'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 5, 'Sauvignon Blanc is vaak:', '["Gastronomisch sterk", "Alleen dessert", "Altijd houtgelagerd", "Zoet"]', 0, 'Correct: Gastronomisch sterk'),
  ('frisse-druiven-white-wine', 'riesling', 1, 'Welke eigenschap hoort typisch bij Riesling?', '["Hoge zuren", "Hoge tannines", "Lage aroma’s", "Hoog bitter"]', 0, 'Correct: Hoge zuren'),
  ('frisse-druiven-white-wine', 'riesling', 2, 'Welk aroma komt vaak voor?', '["Limoen", "Vanille", "Chocolade", "Koffie"]', 0, 'Correct: Limoen'),
  ('frisse-druiven-white-wine', 'riesling', 3, 'Welke regio is klassiek voor Riesling?', '["Mosel", "Rioja", "Douro", "Bordeaux"]', 0, 'Correct: Mosel'),
  ('frisse-druiven-white-wine', 'riesling', 4, 'Wat ontstaat vaak bij rijping?', '["Petrol", "Gras", "Vanille", "Boter"]', 0, 'Correct: Petrol'),
  ('frisse-druiven-white-wine', 'riesling', 5, 'Riesling heeft vaak:', '["Sterke terroir-expressie", "Veel hout", "Veel tannine", "Lage zuren"]', 0, 'Correct: Sterke terroir-expressie'),
  ('frisse-druiven-white-wine', 'albarino', 1, 'Waar komt Albariño vooral vandaan?', '["Rías Baixas", "Rioja", "Porto", "Mosel"]', 0, 'Correct: Rías Baixas'),
  ('frisse-druiven-white-wine', 'albarino', 2, 'Welke eigenschap is typisch?', '["Ziltigheid", "Vanille", "Boter", "Tannine"]', 0, 'Correct: Ziltigheid'),
  ('frisse-druiven-white-wine', 'albarino', 3, 'Wat beïnvloedt Albariño sterk?', '["Atlantisch klimaat", "Woestijnklimaat", "Hoogte", "Hout"]', 0, 'Correct: Atlantisch klimaat'),
  ('frisse-druiven-white-wine', 'albarino', 4, 'Welke pairing is klassiek?', '["Schaaldieren", "Wild", "Steak", "Chocolade"]', 0, 'Correct: Schaaldieren'),
  ('frisse-druiven-white-wine', 'albarino', 5, 'Albariño is vaak:', '["Fris en strak", "Zoet en zwaar", "Tanninerijk", "Versterkt"]', 0, 'Correct: Fris en strak'),
  ('frisse-druiven-white-wine', 'gruner-veltliner', 1, 'Waar komt Grüner Veltliner vandaan?', '["Oostenrijk", "Italië", "Spanje", "Portugal"]', 0, 'Correct: Oostenrijk'),
  ('frisse-druiven-white-wine', 'gruner-veltliner', 2, 'Welke smaak is kenmerkend?', '["Witte peper", "Vanille", "Karamel", "Petrol"]', 0, 'Correct: Witte peper'),
  ('frisse-druiven-white-wine', 'gruner-veltliner', 3, 'Welke regio is top?', '["Wachau", "Rioja", "Douro", "Loire"]', 0, 'Correct: Wachau'),
  ('frisse-druiven-white-wine', 'gruner-veltliner', 4, 'Waar past Grüner goed bij?', '["Asperges", "Chocolade", "Wild", "Port"]', 0, 'Correct: Asperges'),
  ('frisse-druiven-white-wine', 'gruner-veltliner', 5, 'Grüner is vaak:', '["Fris en kruidig", "Zoet en zwaar", "Tanninerijk", "Oxidatief"]', 0, 'Correct: Fris en kruidig'),
  ('frisse-druiven-white-wine', 'verdejo', 1, 'Waar komt Verdejo vooral vandaan?', '["Rueda", "Rioja", "Douro", "Loire"]', 0, 'Correct: Rueda'),
  ('frisse-druiven-white-wine', 'verdejo', 2, 'Typisch aroma?', '["Venkel", "Boter", "Petrol", "Karamel"]', 0, 'Correct: Venkel'),
  ('frisse-druiven-white-wine', 'verdejo', 3, 'Typisch mondgevoel?', '["Licht bitter", "Zoet", "Zwaar tanninerijk", "Mousserend"]', 0, 'Correct: Licht bitter'),
  ('frisse-druiven-white-wine', 'verdejo', 4, 'Verdejo wordt vaak:', '["Jong gedronken", "20 jaar gerijpt", "Versterkt", "Oxidatief bewaard"]', 0, 'Correct: Jong gedronken'),
  ('frisse-druiven-white-wine', 'verdejo', 5, 'Verdejo combineert:', '["Frisheid en structuur", "Zoet en alcohol", "Tannine en kleur", "Hout en suiker"]', 0, 'Correct: Frisheid en structuur'),
  ('rijke-druiven-white-wine', 'chardonnay', 1, 'Welke druif is het meest veelzijdig?', '["Chardonnay", "Riesling", "Verdejo", "Muscat"]', 0, 'Correct: Chardonnay'),
  ('rijke-druiven-white-wine', 'chardonnay', 2, 'Wat geeft MLF vaak?', '["Boter", "Petrol", "Zout", "Tannine"]', 0, 'Correct: Boter'),
  ('rijke-druiven-white-wine', 'chardonnay', 3, 'Welke regio is beroemd?', '["Bourgogne", "Douro", "Porto", "Mosel"]', 0, 'Correct: Bourgogne'),
  ('rijke-druiven-white-wine', 'chardonnay', 4, 'Chablis is:', '["Chardonnay", "Riesling", "Chenin", "Viognier"]', 0, 'Correct: Chardonnay'),
  ('rijke-druiven-white-wine', 'chardonnay', 5, 'Warm klimaat geeft vaker:', '["Tropisch fruit", "Meer zuur", "Minder body", "Minder aroma"]', 0, 'Correct: Tropisch fruit'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 1, 'Welke eigenschap hoort sterk bij Chenin Blanc?', '["Hoge zuren", "Hoge tannines", "Lage aroma’s", "Geen bewaarpotentieel"]', 0, 'Correct: Hoge zuren'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 2, 'Welke regio is beroemd voor Chenin Blanc?', '["Vouvray", "Rioja", "Mosel", "Porto"]', 0, 'Correct: Vouvray'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 3, 'Welke stijl kan Chenin zijn?', '["Alleen droog", "Alleen zoet", "Veel stijlen", "Alleen mousserend"]', 2, 'Correct: Veel stijlen'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 4, 'Welke aroma’s komen vaak voor?', '["Honing en appel", "Gras en paprika", "Vanille en chocolade", "Koffie en leer"]', 0, 'Correct: Honing en appel'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 5, 'Waarom rijpt Chenin goed?', '["Hoge zuren", "Lage zuren", "Veel tannines", "Lage alcohol"]', 0, 'Correct: Hoge zuren'),
  ('rijke-druiven-white-wine', 'viognier', 1, 'Welke aroma’s zijn typisch voor Viognier?', '["Abrikoos en bloemen", "Gras en limoen", "Petrol en appel", "Chocolade en koffie"]', 0, 'Correct: Abrikoos en bloemen'),
  ('rijke-druiven-white-wine', 'viognier', 2, 'Hoe is de body vaak?', '["Licht", "Vol", "Dun", "Mousserend"]', 1, 'Correct: Vol'),
  ('rijke-druiven-white-wine', 'viognier', 3, 'Welke regio is klassiek?', '["Condrieu", "Mosel", "Rioja", "Douro"]', 0, 'Correct: Condrieu'),
  ('rijke-druiven-white-wine', 'viognier', 4, 'Hoe zijn de zuren meestal?', '["Hoog", "Middel tot laag", "Extreem hoog", "Geen"]', 1, 'Correct: Middel tot laag'),
  ('rijke-druiven-white-wine', 'viognier', 5, 'Viognier draait veel om:', '["Textuur", "Tannine", "Bitter", "Koolzuur"]', 0, 'Correct: Textuur'),
  ('rijke-druiven-white-wine', 'semillon', 1, 'Waar wordt Semillon veel gebruikt?', '["Bordeaux", "Mosel", "Douro", "Rueda"]', 0, 'Correct: Bordeaux'),
  ('rijke-druiven-white-wine', 'semillon', 2, 'Semillon wordt vaak geblend met:', '["Sauvignon Blanc", "Riesling", "Viognier", "Muscat"]', 0, 'Correct: Sauvignon Blanc'),
  ('rijke-druiven-white-wine', 'semillon', 3, 'Welke stijl is beroemd met Semillon?', '["Sauternes", "Chablis", "Port", "Prosecco"]', 0, 'Correct: Sauternes'),
  ('rijke-druiven-white-wine', 'semillon', 4, 'Wat ontwikkelt Semillon met rijping?', '["Honing en noten", "Gras en citrus", "Koffie en cacao", "Karamel en rook"]', 0, 'Correct: Honing en noten'),
  ('rijke-druiven-white-wine', 'semillon', 5, 'Semillon heeft vaak:', '["Structuur en rijpingspotentieel", "Hoge tannine", "Koolzuur", "Lage body"]', 0, 'Correct: Structuur en rijpingspotentieel'),
  ('rijke-druiven-white-wine', 'marsanne-roussanne', 1, 'Welke druif geeft body?', '["Marsanne", "Roussanne", "Riesling", "Albariño"]', 0, 'Correct: Marsanne'),
  ('rijke-druiven-white-wine', 'marsanne-roussanne', 2, 'Welke druif geeft finesse?', '["Marsanne", "Roussanne", "Viognier", "Chenin"]', 1, 'Correct: Roussanne'),
  ('rijke-druiven-white-wine', 'marsanne-roussanne', 3, 'Belangrijke regio?', '["Hermitage", "Mosel", "Porto", "Marlborough"]', 0, 'Correct: Hermitage'),
  ('rijke-druiven-white-wine', 'marsanne-roussanne', 4, 'Zijn ze vaak blends?', '["Ja", "Nee", "Alleen mousserend", "Alleen zoet"]', 0, 'Correct: Ja'),
  ('rijke-druiven-white-wine', 'marsanne-roussanne', 5, 'Deze wijnen zijn vaak:', '["Rijk en complex", "Licht en strak", "Zoet", "Versterkt"]', 0, 'Correct: Rijk en complex'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 1, 'Typisch aroma?', '["Lychee", "Petrol", "Gras", "Boter"]', 0, 'Correct: Lychee'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 2, 'Zuurgehalte?', '["Hoog", "Middel", "Laag", "Geen"]', 2, 'Correct: Laag'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 3, 'Belangrijke regio?', '["Alsace", "Douro", "Porto", "Rioja"]', 0, 'Correct: Alsace'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 4, 'Gewürz betekent:', '["Zoet", "Kruidig", "Hout", "Rijk"]', 1, 'Correct: Kruidig'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 5, 'Gewürztraminer is vaak:', '["Zeer aromatisch", "Zeer neutraal", "Tanninerijk", "Mousserend"]', 0, 'Correct: Zeer aromatisch'),
  ('aromatische-druiven-white-wine', 'muscat', 1, 'Wat maakt Muscat uniek?', '["Het ruikt vaak letterlijk naar druiven", "Het heeft veel tannines", "Het is altijd droog", "Het is altijd houtgelagerd"]', 0, 'Correct: Het ruikt vaak letterlijk naar druiven'),
  ('aromatische-druiven-white-wine', 'muscat', 2, 'Welke stijl kan Muscat zijn?', '["Alleen droog", "Alleen zoet", "Veel stijlen", "Alleen mousserend"]', 2, 'Correct: Veel stijlen'),
  ('aromatische-druiven-white-wine', 'muscat', 3, 'Welke wijn is een bekende Muscat?', '["Moscato d’Asti", "Chablis", "Tawny Port", "Sancerre"]', 0, 'Correct: Moscato d’Asti'),
  ('aromatische-druiven-white-wine', 'muscat', 4, 'Welke aroma’s zijn typisch?', '["Sinaasappelbloesem en perzik", "Gras en kruisbes", "Vanille en boter", "Chocolade en koffie"]', 0, 'Correct: Sinaasappelbloesem en perzik'),
  ('aromatische-druiven-white-wine', 'muscat', 5, 'Muscat is vaak:', '["Zeer floraal", "Zeer tanninerijk", "Zeer neutraal", "Zeer bitter"]', 0, 'Correct: Zeer floraal'),
  ('aromatische-druiven-white-wine', 'torrontes', 1, 'Waar komt Torrontés vooral vandaan?', '["Argentinië", "Frankrijk", "Portugal", "Duitsland"]', 0, 'Correct: Argentinië'),
  ('aromatische-druiven-white-wine', 'torrontes', 2, 'Welke regio is beroemd?', '["Salta", "Rioja", "Douro", "Mosel"]', 0, 'Correct: Salta'),
  ('aromatische-druiven-white-wine', 'torrontes', 3, 'Wat is typisch voor Torrontés?', '["Geur rijker dan smaak", "Meer tannine dan aroma", "Altijd houtgelagerd", "Altijd zoet"]', 0, 'Correct: Geur rijker dan smaak'),
  ('aromatische-druiven-white-wine', 'torrontes', 4, 'Welke aroma’s zijn vaak aanwezig?', '["Bloemen en citrus", "Boter en toast", "Koffie en cacao", "Leer en tabak"]', 0, 'Correct: Bloemen en citrus'),
  ('aromatische-druiven-white-wine', 'torrontes', 5, 'Waarom blijft Torrontés fris?', '["Door hoogte", "Door hout", "Door fortificatie", "Door suiker"]', 0, 'Correct: Door hoogte'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 1, 'Zijn Pinot Gris en Pinot Grigio dezelfde druif?', '["Ja", "Nee", "Alleen deels", "Alleen in Italië"]', 0, 'Correct: Ja'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 2, 'Waar is Pinot Gris vaak rijker?', '["Alsace", "Veneto", "Rueda", "Mosel"]', 0, 'Correct: Alsace'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 3, 'Typisch aroma?', '["Peer", "Gras", "Petrol", "Karamel"]', 0, 'Correct: Peer'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 4, 'Italiaanse stijl is vaak:', '["Lichter", "Zwaarder", "Zoeter", "Versterkt"]', 0, 'Correct: Lichter'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 5, 'Pinot Gris zit vaak tussen:', '["Fris en rijk", "Zoet en bitter", "Tannine en zuur", "Port en wijn"]', 0, 'Correct: Fris en rijk'),
  ('aromatische-druiven-white-wine', 'vermentino', 1, 'Waar komt Vermentino veel voor?', '["Sardinië", "Mosel", "Douro", "Rioja"]', 0, 'Correct: Sardinië'),
  ('aromatische-druiven-white-wine', 'vermentino', 2, 'Typisch aroma?', '["Citrus", "Boter", "Petrol", "Chocolade"]', 0, 'Correct: Citrus'),
  ('aromatische-druiven-white-wine', 'vermentino', 3, 'Vermentino is vaak:', '["Zilt", "Zoet", "Tanninerijk", "Versterkt"]', 0, 'Correct: Zilt'),
  ('aromatische-druiven-white-wine', 'vermentino', 4, 'Hoe heet Vermentino in Zuid-Frankrijk?', '["Rolle", "Verdejo", "Glera", "Arinto"]', 0, 'Correct: Rolle'),
  ('aromatische-druiven-white-wine', 'vermentino', 5, 'Welke keuken past goed?', '["Mediterrane keuken", "BBQ ribs", "Wildstoof", "Portdesserts"]', 0, 'Correct: Mediterrane keuken'),
  ('service-white-wine', 'serveertemperatuur', 1, 'Te koud betekent vaak:', '["Meer aroma", "Minder aroma", "Meer body", "Meer alcohol"]', 1, 'Correct: Minder aroma'),
  ('service-white-wine', 'serveertemperatuur', 2, 'Sauvignon Blanc serveer je meestal:', '["6–9°C", "14–16°C", "18°C", "22°C"]', 0, 'Correct: 6–9°C'),
  ('service-white-wine', 'serveertemperatuur', 3, 'Houtgelagerde Chardonnay?', '["5°C", "7°C", "10–13°C", "20°C"]', 2, 'Correct: 10–13°C'),
  ('service-white-wine', 'serveertemperatuur', 4, 'Te warm geeft vaak:', '["Meer frisheid", "Meer alcoholgevoel", "Minder geur", "Minder smaak"]', 1, 'Correct: Meer alcoholgevoel'),
  ('service-white-wine', 'serveertemperatuur', 5, 'Meest gemaakte fout?', '["Te warm", "Te koud", "Te oud", "Te zoet"]', 1, 'Correct: Te koud'),
  ('service-white-wine', 'glaswerk', 1, 'Wat beïnvloedt glaswerk sterk?', '["Alleen kleur", "Aroma’s", "Alleen alcohol", "Alleen prijs"]', 1, 'Correct: Aroma’s'),
  ('service-white-wine', 'glaswerk', 2, 'Een smaller glas helpt vaak bij:', '["Meer zuurstof", "Meer frisheid behouden", "Meer warmte", "Minder aroma"]', 1, 'Correct: Meer frisheid behouden'),
  ('service-white-wine', 'glaswerk', 3, 'Een breder glas helpt vaak bij:', '["Complexe aroma’s openen", "Minder geur", "Minder body", "Minder zuur"]', 0, 'Correct: Complexe aroma’s openen'),
  ('service-white-wine', 'glaswerk', 4, 'Welke wijn krijgt vaak een breder glas?', '["Chardonnay", "Sauvignon Blanc", "Albariño", "Verdejo"]', 0, 'Correct: Chardonnay'),
  ('service-white-wine', 'glaswerk', 5, 'Waarom is glaswerk belangrijk?', '["Het beïnvloedt de proefervaring", "Alleen voor uiterlijk", "Alleen voor temperatuur", "Alleen voor prijs"]', 0, 'Correct: Het beïnvloedt de proefervaring'),
  ('service-white-wine', 'decanteren', 1, 'Is decanteren alleen voor rode wijn?', '["Ja", "Nee", "Alleen oude wijn", "Alleen jonge wijn"]', 1, 'Correct: Nee'),
  ('service-white-wine', 'decanteren', 2, 'Waarom decanteer je witte wijn soms?', '["Meer kleur", "Om reductie te openen", "Minder zuur", "Meer suiker"]', 1, 'Correct: Om reductie te openen'),
  ('service-white-wine', 'decanteren', 3, 'Welke wijn profiteert vaak?', '["Oude Riesling", "Jonge Verdejo", "Jonge Pinot Grigio", "Moscato"]', 0, 'Correct: Oude Riesling'),
  ('service-white-wine', 'decanteren', 4, 'Wat doet zuurstof?', '["Opent aroma’s", "Verlaagt alcohol", "Verhoogt suiker", "Verhoogt tannine"]', 0, 'Correct: Opent aroma’s'),
  ('service-white-wine', 'decanteren', 5, 'Welke wijn heeft meestal géén decantering nodig?', '["Jonge frisse Sauvignon Blanc", "Oude Bourgogne", "Oude Chenin", "Witte Rhône"]', 0, 'Correct: Jonge frisse Sauvignon Blanc'),
  ('service-white-wine', 'bewaren-en-rijping', 1, 'Wat helpt rijping?', '["Zuur", "Lage alcohol", "Lage kleur", "Bitterheid"]', 0, 'Correct: Zuur'),
  ('service-white-wine', 'bewaren-en-rijping', 2, 'Ideale temperatuur?', '["25°C", "18°C", "10–14°C", "2°C"]', 2, 'Correct: 10–14°C'),
  ('service-white-wine', 'bewaren-en-rijping', 3, 'Wat is slecht?', '["Donker", "Trillingsvrij", "Zonlicht", "Constante temperatuur"]', 2, 'Correct: Zonlicht'),
  ('service-white-wine', 'bewaren-en-rijping', 4, 'Welke druif rijpt goed?', '["Riesling", "Airén", "Trebbiano", "Pinot Grigio"]', 0, 'Correct: Riesling'),
  ('service-white-wine', 'bewaren-en-rijping', 5, 'Belangrijk voor opslag?', '["Stabiliteit", "Warmte", "Licht", "Open lucht"]', 0, 'Correct: Stabiliteit'),
  ('pairing-white-wine', 'witte-wijn-vis', 1, 'Waarom werkt witte wijn goed?', '["Hoge tannine", "Hoge zuren", "Hoge bitterheid", "Hoge suiker"]', 1, 'Correct: Hoge zuren'),
  ('pairing-white-wine', 'witte-wijn-vis', 2, 'Wat past bij zalm?', '["Riesling", "Chardonnay", "Muscat", "Port"]', 1, 'Correct: Chardonnay'),
  ('pairing-white-wine', 'witte-wijn-vis', 3, 'Wat past bij oesters?', '["Albariño", "Viognier", "Semillon", "Marsanne"]', 0, 'Correct: Albariño'),
  ('pairing-white-wine', 'witte-wijn-vis', 4, 'Wat is belangrijk?', '["Intensiteit matchen", "Alcohol verhogen", "Meer bitter", "Minder aroma"]', 0, 'Correct: Intensiteit matchen'),
  ('pairing-white-wine', 'witte-wijn-vis', 5, 'Rode wijn met vis geeft soms:', '["Meer frisheid", "Metaalachtig gevoel", "Meer zout", "Minder smaak"]', 1, 'Correct: Metaalachtig gevoel'),
  ('pairing-white-wine', 'witte-wijn-kaas', 1, 'Waarom werkt witte wijn vaak goed met kaas?', '["Door hoge tannines", "Door zuren", "Door bitterheid", "Door koolzuur"]', 1, 'Correct: Door zuren'),
  ('pairing-white-wine', 'witte-wijn-kaas', 2, 'Wat doen zuren bij vet?', '["Verzwaren", "Snijden erdoorheen", "Maken zoeter", "Verlagen aroma"]', 1, 'Correct: Snijden erdoorheen'),
  ('pairing-white-wine', 'witte-wijn-kaas', 3, 'Welke wijn past goed bij geitenkaas?', '["Sauvignon Blanc", "Viognier", "Port", "Syrah"]', 0, 'Correct: Sauvignon Blanc'),
  ('pairing-white-wine', 'witte-wijn-kaas', 4, 'Welke combinatie is logisch?', '["Brie + Chardonnay", "Brie + Riesling droog", "Brie + Port", "Brie + Tawny"]', 0, 'Correct: Brie + Chardonnay'),
  ('pairing-white-wine', 'witte-wijn-kaas', 5, 'Waarom kiezen sommeliers vaak wit bij kaas?', '["Meer balans", "Meer alcohol", "Meer tannine", "Meer bitter"]', 0, 'Correct: Meer balans'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 1, 'Wat bepaalt vaak de pairing?', '["Bord", "Saus", "Glas", "Temperatuur"]', 1, 'Correct: Saus'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 2, 'Lichte kip past goed bij:', '["Sauvignon Blanc", "Port", "Tawny", "Madeira"]', 0, 'Correct: Sauvignon Blanc'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 3, 'Romige kip past goed bij:', '["Chardonnay", "Muscat", "Torrontés", "Riesling droog"]', 0, 'Correct: Chardonnay'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 4, 'Wat is belangrijk?', '["Structuur matchen", "Alleen alcohol", "Alleen suiker", "Alleen kleur"]', 0, 'Correct: Structuur matchen'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 5, 'Gevogelte is:', '["Zeer beperkt", "Veelzijdig", "Moeilijk", "Altijd rood"]', 1, 'Correct: Veelzijdig'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 1, 'Welke druif geeft vaak kruisbes?', '["Riesling", "Sauvignon Blanc", "Chardonnay", "Chenin"]', 1, 'Correct: Sauvignon Blanc'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 2, 'Welke druif geeft vaak petrol?', '["Sauvignon", "Riesling", "Verdejo", "Albariño"]', 1, 'Correct: Riesling'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 3, 'Welke is vaak groener?', '["Sauvignon Blanc", "Riesling", "Viognier", "Muscat"]', 0, 'Correct: Sauvignon Blanc'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 4, 'Welke is vaak mineraler?', '["Riesling", "Sauvignon", "Muscat", "Viognier"]', 0, 'Correct: Riesling'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 5, 'Welke heeft vaker paprika?', '["Sauvignon Blanc", "Riesling", "Chenin", "Semillon"]', 0, 'Correct: Sauvignon Blanc'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 1, 'Welke druif heeft vaker boter?', '["Chardonnay", "Chenin Blanc", "Riesling", "Vermentino"]', 0, 'Correct: Chardonnay'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 2, 'Welke heeft vaker hoge zuren?', '["Chenin Blanc", "Chardonnay", "Viognier", "Semillon"]', 0, 'Correct: Chenin Blanc'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 3, 'Welke voelt vaak ronder?', '["Chardonnay", "Chenin", "Riesling", "Muscat"]', 0, 'Correct: Chardonnay'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 4, 'Welke heeft vaker honing?', '["Chenin Blanc", "Chardonnay", "Sauvignon", "Albariño"]', 0, 'Correct: Chenin Blanc'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 5, 'Wat is vaak het sleutelverschil?', '["Zuurstructuur", "Alcohol", "Kleur", "Flesgewicht"]', 0, 'Correct: Zuurstructuur')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
