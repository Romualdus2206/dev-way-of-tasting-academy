-- Sparkling / Mousserend track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'sparkling';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'sparkling',
  'Mousserende wijn',
  'Leer mousserende wijn van Fundament tot Master: productie, proeven, Champagne, stijlen, service en examen.',
  2,
  now()
);

with t as (select id from academy.tracks where slug = 'sparkling')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-sparkling', 'Fundament', 1),
  ('explorer', 'productie-sparkling', 'Productie', 2),
  ('explorer', 'proeven-sparkling', 'Proeven', 3),
  ('specialist', 'champagne-sparkling', 'Champagne', 4),
  ('specialist', 'wereldstijlen-sparkling', 'Wereldstijlen', 5),
  ('specialist', 'suiker-stijl-sparkling', 'Suiker & Stijl', 6),
  ('master', 'service-sparkling', 'Service', 7),
  ('master', 'pairing-sparkling', 'Pairing & Gastronomie', 8),
  ('master', 'examen-sparkling', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-sparkling (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'intro-sparkling'
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
    'wat-is-mousserende-wijn',
    'Wat is mousserende wijn?',
    'Na deze les kun jij uitleggen wat mousserende wijn is, hoe het verschilt van stille wijn en waarom bubbels zo belangrijk zijn.
',
    'Mousserende wijn is wijn waarin koolzuurgas opgelost zit.

Dat gas zorgt voor bubbels.

Dit koolzuur ontstaat meestal tijdens een tweede gisting.

Bij stille wijn ontsnapt het koolzuur direct tijdens de eerste gisting.

Bij mousserende wijn wordt het gas gevangen.

Daardoor ontstaat druk in de fles.

Bij Champagne loopt die druk vaak op tot 5 à 6 bar.

Dat is vergelijkbaar met ongeveer drie keer de druk van een autoband.

Niet alle mousserende wijn is hetzelfde.

De manier waarop de bubbels ontstaan, bepaalt voor een groot deel de kwaliteit.

Hoe fijner en langer de mousse zichtbaar blijft, hoe hoger vaak de kwaliteit wordt ingeschat.
',
    '- mousse
- CO2
- druk
- tweede gisting
- sparkling
',
    'Een standaardfles Champagne bevat ongeveer 49 miljoen bubbels.
',
    '- Mousserende wijn bevat opgelost CO2
- Bubbels ontstaan meestal via tweede gisting
- Druk in de fles is essentieel
- Productiemethode beïnvloedt kwaliteit
- Mousse is een belangrijk kwaliteitskenmerk
',
    '### Opdracht

Pak een fles mousserende wijn en bestudeer het etiket.

### Checklist

- Ik heb gekeken waar de wijn vandaan komt
- Ik heb gekeken welke methode vermeld staat
- Ik heb gekeken hoeveel alcohol de wijn bevat
- Ik heb gekeken of het een brut, extra brut of andere stijl is

### Reflectievraag

Wat viel je het meeste op aan het etiket?
',
    8,
    1
  ),
  (
    'hoe-ontstaan-bubbels',
    'Hoe ontstaan bubbels?',
    'Na deze les begrijp jij hoe bubbels ontstaan en waarom natuurlijke mousse belangrijk is.
',
    'Tijdens gisting zetten gisten suiker om in alcohol en koolzuur.

Bij gewone wijn verdwijnt dat gas.

Bij mousserende wijn wordt dat gas gevangen.

Dat kan in fles of in tank.

Wanneer het gas opgesloten blijft, lost het op in de wijn.

Bij het openen ontsnapt het gas weer.

Daardoor ontstaan bubbels.

Hoe lang de wijn contact houdt met de gistcellen heeft veel invloed.

Dit heet autolyse.

Autolyse zorgt voor aroma’s zoals brioche, toast en noten.

Dit zie je vooral bij kwaliteitsmousserend.
',
    '- gisting
- CO2
- autolyse
- mousse
- gist
',
    'Hoe langer autolyse duurt, hoe complexer mousserende wijn vaak wordt.
',
    '- Gisting produceert CO2
- Bij mousserend blijft CO2 gevangen
- Bubbels ontstaan bij openen
- Autolyse zorgt voor extra complexiteit
',
    '### Opdracht

Open een mousserende wijn en observeer de bubbels.

### Checklist

- Ik heb gekeken hoe snel de bubbels opstijgen
- Ik heb gekeken hoe lang ze blijven
- Ik heb de grootte beoordeeld

### Reflectievraag

Zijn de bubbels fijn of grof?
',
    8,
    2
  ),
  (
    'waarom-is-mousserend-uniek',
    'Waarom is mousserend uniek?',
    'Na deze les kun jij uitleggen waarom mousserende wijn zo breed inzetbaar is.
',
    'Mousserende wijn combineert meerdere eigenschappen tegelijk.

Het heeft frisheid door hoge zuren.

Het heeft textuur door mousse.

Het heeft spanning door druk.

En vaak complexiteit door rijping.

Daardoor is mousserend uniek.

Het werkt als aperitief.

Maar ook als volledige maaltijdwijn.

Bubbels reinigen het gehemelte.

Dat maakt pairing vaak makkelijker.

Zeker bij vet, zout en romige gerechten.
',
    '- pairing
- zuur
- mousse
- textuur
- frisheid
',
    'Mousserende wijn is één van de meest veelzijdige wijnstijlen voor foodpairing.
',
    '- Hoge zuren geven frisheid
- Bubbels geven textuur
- Mousserend is breed inzetbaar
- Pairingpotentieel is zeer groot
',
    '### Opdracht

Bedenk drie gerechten waarbij mousserend goed zou passen.

### Checklist

- Ik heb drie gerechten gekozen
- Ik heb gekeken naar vet, zout of zuur
- Ik heb nagedacht over contrast

### Reflectievraag

Welk gerecht lijkt jou de beste match?
',
    8,
    3
  ),
  (
    'geschiedenis-mousserende-wijn',
    'Geschiedenis van mousserende wijn',
    'Na deze les begrijp jij hoe mousserende wijn zich heeft ontwikkeld.
',
    'In het verleden werden bubbels gezien als fout.

De gisting stopte soms in de winter.

Wanneer het warmer werd, startte de gisting opnieuw.

Daardoor ontstond koolzuur.

Dit zorgde soms voor exploderende flessen.

Men noemde dit vroeger “de duivelswijn”.

Later ontdekte men dat dit juist interessant was.

In Frankrijk werd Champagne de bekendste regio.

Monniken en producenten verbeterden de technieken.

Daardoor groeide mousserende wijn uit tot luxeproduct.
',
    '- Champagne
- tweede gisting
- geschiedenis
- luxe
- methode
',
    'Champagne werd ooit “vin du diable” genoemd.
',
    '- Bubbels waren vroeger een fout
- Tweede gisting gebeurde vaak spontaan
- Champagne perfectioneerde het proces
- Mousserend werd later luxe
',
    '### Opdracht

Onderzoek de geschiedenis van mousserende wijn en Champagne.

### Checklist

- Ik heb gekeken naar spontane tweede gisting
- Ik heb gekeken naar de rol van Champagne
- Ik heb gekeken naar historische productiefouten

### Reflectievraag

Wat verraste jou het meest aan de geschiedenis?
',
    8,
    4
  ),
  (
    'belangrijkste-categorieen',
    'Belangrijkste categorieën',
    'Na deze les herken jij de belangrijkste mousserende wijncategorieën.
',
    'Er zijn wereldwijd veel mousserende stijlen.

Champagne komt uit Frankrijk.

Cava komt uit Spanje.

Prosecco komt uit Italië.

Crémant is Franse mousserende wijn buiten Champagne.

Franciacorta is Italiaanse topkwaliteit.

Sekt komt vooral uit Duitsland.

English Sparkling groeit sterk.

Elke stijl heeft eigen regels, druiven en methodes.

Die ga je later uitgebreid leren.
',
    '- Champagne
- Cava
- Prosecco
- Franciacorta
- Sekt',
    'Engeland wordt steeds vaker gezien als serieuze speler in kwaliteitsmousserend.
',
    '- Champagne is de bekendste stijl
- Cava gebruikt vaak traditionele methode
- Prosecco gebruikt meestal tankmethode
- Wereldwijd groeit kwaliteit sterk
',
    '### Opdracht

Zoek drie verschillende mousserende stijlen online.

### Checklist

- Ik heb drie landen gevonden
- Ik heb gekeken naar productiemethode
- Ik heb gekeken naar prijsniveau

### Reflectievraag

Welke stijl lijkt jou het interessantst?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-sparkling (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'productie-sparkling'
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
    'methode-traditionnelle',
    'Méthode Traditionnelle',
    'Na deze les kun jij uitleggen hoe de traditionele methode werkt en waarom deze als hoogste kwaliteitsmethode wordt gezien.
',
    'De méthode traditionnelle is de bekendste kwaliteitsmethode voor mousserende wijn.

Bij deze methode vindt de tweede gisting plaats in de fles.

Eerst wordt een basiswijn gemaakt.

Daarna voegt de producent suiker en gist toe.

Dit heet liqueur de tirage.

De fles wordt afgesloten.

De tweede gisting begint.

Het koolzuur blijft gevangen.

Na de gisting rijpt de wijn vaak maanden of jaren op de gist.

Dit zorgt voor complexiteit.

Daarna volgt dégorgement.

Dan worden de gistcellen verwijderd.

Tot slot wordt vaak dosage toegevoegd.

Deze methode wordt gebruikt voor:

- Champagne
- Cava
- Crémant
- Franciacorta
',
    '- traditionele methode
- autolyse
- tirage
- dégorgement
- Champagne
',
    'Champagne moet minimaal 15 maanden rijpen voordat hij verkocht mag worden.
',
    '- Tweede gisting vindt plaats op fles
- Autolyse zorgt voor complexiteit
- Dégorgement verwijdert gist
- Dit is de klassieke kwaliteitsmethode
',
    '### Opdracht

Zoek drie mousserende wijnen die deze methode gebruiken.

### Checklist

- Ik heb drie voorbeelden gevonden
- Ik heb het land bekeken
- Ik heb het prijsniveau bekeken

### Reflectievraag

Zie je verschil in prijs tussen traditionele en tankmethode?
',
    10,
    1
  ),
  (
    'charmat-tankmethode',
    'Charmat / Tankmethode',
    'Na deze les begrijp jij hoe de Charmatmethode werkt en waarom deze anders is.
',
    'Bij de Charmatmethode vindt de tweede gisting plaats in een afgesloten tank.

Niet in de fles.

Dit is sneller en goedkoper.

Daardoor blijft het fruitige karakter beter behouden.

Er is meestal minder autolyse.

Dus minder brioche en toast.

Meer fruit.

Deze methode wordt veel gebruikt voor Prosecco.

Voor frisse en jonge stijlen is dit ideaal.
',
    '- Charmat
- tank
- Prosecco
- fruitigheid
- tweede gisting
',
    'De Charmatmethode werd populair door de groei van Prosecco.
',
    '- Tweede gisting gebeurt in tank
- Sneller en goedkoper
- Meer fruitigheid
- Minder gistcomplexiteit
',
    '### Opdracht

Vergelijk een Prosecco met een Champagne.

### Checklist

- Ik heb geur vergeleken
- Ik heb mousse vergeleken
- Ik heb smaak vergeleken

### Reflectievraag

Welke stijl voelt frisser?
',
    8,
    2
  ),
  (
    'transfermethode',
    'Transfermethode',
    'Na deze les kun jij uitleggen wat de transfermethode is.
',
    'De transfermethode begint hetzelfde als de traditionele methode.

Tweede gisting vindt plaats op fles.

Daarna worden de flessen geleegd in een tank.

De gist wordt gefilterd.

De wijn wordt opnieuw gebotteld.

Dit is efficiënter.

Maar minder ambachtelijk.

Kwalitatief zit het vaak tussen traditioneel en tank in.
',
    '- transfer
- filtering
- efficiëntie
- fles
- tank
',
    'Deze methode wordt soms gebruikt voor kleine flesformaten.
',
    '- Start als traditionele methode
- Eindigt via tank
- Efficiënter proces
- Minder individueel fleswerk
',
    '### Opdracht

Vergelijk de transfermethode met de traditionele methode.

### Checklist

- Ik heb het beginproces vergeleken
- Ik heb gekeken waar filtering plaatsvindt
- Ik heb efficiëntie vergeleken

### Reflectievraag

Waarom zou een producent deze methode kiezen?
',
    7,
    3
  ),
  (
    'methode-ancestrale',
    'Méthode Ancestrale (Pet-Nat)',
    'Na deze les begrijp jij hoe Pet-Nat ontstaat.
',
    'Méthode ancestrale is de oudste manier van mousserend maken.

De wijn wordt tijdens de eerste gisting gebotteld.

De gisting gaat verder in de fles.

Daardoor ontstaat koolzuur.

Er is vaak geen dosage.

En soms geen dégorgement.

Daardoor kan de wijn troebel zijn.

Pet-Nat staat voor pétillant naturel.

Deze stijl is puur, spontaan en vaak onvoorspelbaar.
',
    '- Pet-Nat
- ancestrale
- natuurwijn
- troebel
- spontane gisting
',
    'Pet-Nat is momenteel populair in de natuurwijnwereld.
',
    '- Oudste methode
- Eén gisting
- Vaak ongefilterd
- Pure en wilde stijl
',
    '### Opdracht

Zoek een Pet-Nat en lees het etiket.

### Checklist

- Ik heb gekeken naar troebelheid
- Ik heb gekeken naar alcohol
- Ik heb gekeken naar druif

### Reflectievraag

Lijkt deze stijl jou interessant?
',
    8,
    4
  ),
  (
    'dosage-uitgelegd',
    'Dosage uitgelegd',
    'Na deze les kun jij uitleggen wat dosage is en hoe dit de stijl beïnvloedt.
',
    'Na dégorgement verliest de fles een klein beetje wijn.

Dit wordt aangevuld.

Vaak met een mengsel van wijn en suiker.

Dit heet liqueur d’expédition.

Dit bepaalt de uiteindelijke zoetheid.

Belangrijke categorieën:

- Brut Nature (0–3 g/l)
- Extra Brut (0–6 g/l)
- Brut (0–12 g/l)
- Extra Dry (12–17 g/l)
- Sec (17–32 g/l)
- Demi-Sec (32–50 g/l)

Dosage beïnvloedt balans, mondgevoel en pairing.
',
    '- dosage
- dégorgement
- brut
- restsuiker
- expédition',
    'Extra Dry klinkt droger dan Brut, maar is vaak juist zoeter.
',
    '- Dosage bepaalt restsuiker
- Dosage gebeurt na dégorgement
- Brut is de meest voorkomende stijl
- Zoetheid beïnvloedt pairing
',
    '### Opdracht

Bekijk drie flessen en noteer hun dosage.

### Checklist

- Ik heb drie stijlen gevonden
- Ik heb de suikerklasse genoteerd
- Ik heb prijsverschillen bekeken

### Reflectievraag

Welke stijl drink jij het liefst?
',
    9,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-sparkling (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'proeven-sparkling'
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
    'hoe-proef-je-mousserend',
    'Hoe proef je mousserende wijn?',
    'Na deze les kun jij mousserende wijn systematisch beoordelen.
',
    'Het proeven van mousserende wijn lijkt op stille wijn.

Maar bubbels voegen extra elementen toe.

Je kijkt eerst naar:

- kleur
- helderheid
- mousse
- persistentie

Daarna ruik je.

Zoek naar fruit, gist en rijpingstonen.

Bij het proeven let je op:

- zuur
- mousse
- body
- dosage
- lengte

Mousserende wijn draait sterk om balans.

Te veel zuur maakt het hard.

Te veel dosage maakt het log.

De beste wijnen combineren spanning en finesse.
',
    '- proeven
- mousse
- persistentie
- balans
- structuur
',
    'Bij mousserende wijn beïnvloeden bubbels direct hoe aroma’s vrijkomen.
',
    '- Kijken blijft belangrijk
- Mousse is uniek voor mousserend
- Aroma’s ontwikkelen anders
- Balans is cruciaal
',
    '### Opdracht

Proef een mousserende wijn volgens deze stappen.

### Checklist

- Ik heb kleur beoordeeld
- Ik heb mousse bekeken
- Ik heb aroma’s benoemd
- Ik heb structuur geanalyseerd

### Reflectievraag

Wat viel het meeste op?
',
    8,
    1
  ),
  (
    'mousse-analyseren',
    'Mousse analyseren',
    'Na deze les kun jij de kwaliteit van mousse beoordelen.
',
    'Mousse is de bubbelstructuur van mousserende wijn.

Niet alle mousse is gelijk.

Belangrijke factoren:

- grootte van de bubbels
- snelheid van opstijgen
- duur van de mousse

Kleine bubbels wijzen vaak op hogere kwaliteit.

Langdurige mousse wijst vaak op goede druk en techniek.

Grove bubbels verdwijnen vaak sneller.

De productiemethode speelt hierin een grote rol.

Traditionele methode geeft vaak fijnere mousse.

Tankmethode vaak iets grover.
',
    '- mousse
- kwaliteit
- bubbels
- persistentie
- mondgevoel
',
    'Hoe fijner de bubbels, hoe romiger de wijn vaak aanvoelt.
',
    '- Kleine bubbels = vaak hogere kwaliteit
- Persistentie is belangrijk
- Mousse zegt veel over techniek
- Mousse beïnvloedt mondgevoel
',
    '### Opdracht

Vergelijk twee mousserende wijnen.

### Checklist

- Ik heb bubbelgrootte vergeleken
- Ik heb snelheid vergeleken
- Ik heb duur vergeleken

### Reflectievraag

Welke wijn lijkt kwalitatief hoger?
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les herken jij de belangrijkste aromalagen in mousserende wijn.
',
    'Aroma’s worden verdeeld in drie lagen.

Primair = afkomstig van de druif.

Voorbeelden:

- appel
- peer
- citrus
- witte bloemen

Secundair = afkomstig van gisting en autolyse.

Voorbeelden:

- brioche
- toast
- gist
- brooddeeg

Tertiair = afkomstig van rijping.

Voorbeelden:

- honing
- noten
- gedroogd fruit

Bij mousserend zijn secundaire aroma’s vaak extra belangrijk.

Vooral bij traditionele methode.
',
    '- aroma
- autolyse
- brioche
- fruit
- rijping
',
    'Champagne staat bekend om sterke secundaire aroma’s.
',
    '- Primair = fruit
- Secundair = gist en autolyse
- Tertiair = rijping
- Mousserend heeft vaak duidelijke autolysetonen
',
    '### Opdracht

Maak een aromalijst bij een mousserende wijn.

### Checklist

- Ik heb primaire aroma’s gevonden
- Ik heb secundaire aroma’s gezocht
- Ik heb tertiaire aroma’s beoordeeld

### Reflectievraag

Welke aromalaag domineert?
',
    9,
    3
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij de structuur van mousserende wijn analyseren.
',
    'Structuur is hoe de wijn aanvoelt.

Bij mousserend kijk je vooral naar:

- zuur
- mousse
- body
- dosage
- lengte

Zuur geeft frisheid.

Mousse geeft spanning en textuur.

Body geeft gewicht.

Dosage bepaalt zachtheid.

Lengte zegt iets over kwaliteit.

Topwijnen combineren al deze elementen in balans.

Een wijn kan technisch correct zijn.

Maar zonder balans voelt hij minder compleet.
',
    '- structuur
- zuur
- dosage
- lengte
- body
',
    'Veel beginners focussen te veel op zoetheid en te weinig op structuur.
',
    '- Structuur is mondgevoel
- Zuur is de ruggengraat
- Dosage verzacht
- Lengte is kwaliteitsindicator
',
    '### Opdracht

Proef een mousserende wijn en beoordeel de structuur.

### Checklist

- Ik heb zuur beoordeeld
- Ik heb mousse beoordeeld
- Ik heb body benoemd
- Ik heb lengte beoordeeld

### Reflectievraag

Waar zit de meeste kracht in deze wijn?
',
    8,
    4
  ),
  (
    'mini-toets-explorer',
    'Mini-toets Explorer',
    'Testen of jij de basis van mousserend begrijpt.
',
    'Deze toets combineert:

- fundament
- productie
- proeven

Je kennis wordt getest op:

- bubbels
- productiemethoden
- aroma’s
- mousse
- dosage
- structuur

Dit is jouw voorbereiding op Specialist-niveau.
',
    '- blindproeven
- mousse
- productie
- aroma
- structuur',
    '',
    '',
    '### Opdracht

Proef blind twee mousserende wijnen.

### Checklist

- Ik heb de mousse beoordeeld
- Ik heb aroma’s beschreven
- Ik heb structuur beoordeeld
- Ik heb productiemethode geschat

### Reflectievraag

Welke methode denk je dat gebruikt is?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- champagne-sparkling (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'champagne-sparkling'
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
    'champagne-regio',
    'De Champagne-regio',
    'Na deze les kun jij de Champagne-regio en haar belangrijkste subregio’s benoemen.
',
    'Champagne ligt in Noord-Frankrijk.

Het koele klimaat is ideaal voor hoge zuren.

Dat is essentieel voor mousserende wijn.

De regio bestaat uit meerdere belangrijke subregio’s:

- Montagne de Reims
- Vallée de la Marne
- Côte des Blancs
- Côte des Bar

Elke subregio heeft een eigen stijl.

Montagne de Reims is sterk in Pinot Noir.

Côte des Blancs staat bekend om Chardonnay.

Vallée de la Marne is het thuis van Meunier.

Côte des Bar heeft vaak rijpere Pinot Noir.

Het krijtrijke terroir speelt een grote rol.

Krijt houdt water vast en geeft spanning.
',
    '- Champagne
- terroir
- krijt
- regio
- subregio
',
    'Champagne heeft meer dan 34.000 hectare wijngaard.
',
    '- Champagne ligt in koel Noord-Frankrijk
- Vier hoofdsubregio’s domineren
- Krijtbodems zijn cruciaal
- Druivenkeuze verschilt per regio
',
    '### Opdracht

Zoek een Champagnekaart en markeer de vier subregio’s.

### Checklist

- Ik heb alle vier gevonden
- Ik heb de druiven per regio bekeken
- Ik heb klimaatverschillen onderzocht

### Reflectievraag

Welke regio lijkt jou het interessantst?
',
    10,
    1
  ),
  (
    'druiven-van-champagne',
    'Druiven van Champagne',
    'Na deze les herken jij de drie belangrijkste Champagne-druiven.
',
    'Champagne draait vooral om drie druiven:

Chardonnay  
Pinot Noir  
Meunier

Chardonnay geeft:

- frisheid
- spanning
- citrus
- mineraliteit

Pinot Noir geeft:

- body
- structuur
- rood fruit

Meunier geeft:

- fruitigheid
- toegankelijkheid
- zachtheid

De meeste Champagnes zijn blends.

Door te blenden ontstaat balans.
',
    '- Chardonnay
- Pinot Noir
- Meunier
- blend
- stijl
',
    'Meer dan 99% van Champagne wordt gemaakt van deze drie druiven.
',
    '- Chardonnay = fris
- Pinot Noir = structuur
- Meunier = fruit
- Blends zorgen voor balans
',
    '### Opdracht

Zoek drie Champagnes en noteer de blend.

### Checklist

- Ik heb druiven bekeken
- Ik heb percentages genoteerd
- Ik heb stijlverschillen gezien

### Reflectievraag

Welke druif spreekt jou het meest aan?
',
    8,
    2
  ),
  (
    'blanc-de-blancs-vs-blanc-de-noirs',
    'Blanc de Blancs vs Blanc de Noirs',
    'Na deze les begrijp jij het verschil tussen deze twee belangrijke stijlen.
',
    'Blanc de Blancs betekent “wit van wit”.

Dit is meestal 100% Chardonnay.

Kenmerken:

- strak
- fris
- mineraal
- elegant

Blanc de Noirs betekent “wit van zwart”.

Dit wordt gemaakt van blauwe druiven.

Meestal Pinot Noir en/of Meunier.

Kenmerken:

- voller
- krachtiger
- rijper fruit
- meer body

Beide stijlen zijn belangrijk voor blindproeven.
',
    '- Blanc de Blancs
- Blanc de Noirs
- Chardonnay
- Pinot Noir
- stijlverschil
',
    'Blanc de Blancs rijpt vaak prachtig op fles.
',
    '- Blanc de Blancs = witte druiven
- Blanc de Noirs = blauwe druiven
- BdB is strakker
- BdN is krachtiger
',
    '### Opdracht

Vergelijk proefnotities van beide stijlen.

### Checklist

- Ik heb fruitverschillen gezien
- Ik heb structuurverschillen gezien
- Ik heb body vergeleken

### Reflectievraag

Welke stijl lijkt jou aantrekkelijker?
',
    8,
    3
  ),
  (
    'vintage-vs-non-vintage',
    'Vintage vs Non-Vintage',
    'Na deze les kun jij uitleggen wat Vintage en Non-Vintage betekent.
',
    'Non-Vintage (NV) is de standaard in Champagne.

Dit is een blend van meerdere jaren.

Zo blijft de huisstijl consistent.

Vintage komt uit één specifiek oogstjaar.

Alleen goede jaren worden Vintage.

Vintage rijpt meestal langer.

Vaak geeft dit meer diepte en bewaarpotentieel.

NV is vaak toegankelijker.

Vintage is vaak serieuzer.
',
    '- vintage
- non-vintage
- blend
- oogstjaar
- huisstijl
',
    'Sommige topjaren worden door bijna alle huizen gedeclareerd.
',
    '- NV = blend van meerdere jaren
- Vintage = één oogstjaar
- Vintage heeft vaak meer complexiteit
- NV draait om huisstijl
',
    '### Opdracht

Zoek een NV en Vintage Champagne.

### Checklist

- Ik heb jaartal gecontroleerd
- Ik heb prijs vergeleken
- Ik heb rijpingsduur bekeken

### Reflectievraag

Waarom is Vintage vaak duurder?
',
    9,
    4
  ),
  (
    'prestige-cuvee',
    'Prestige Cuvée',
    'Na deze les begrijp jij wat Prestige Cuvée betekent.
',
    'Prestige Cuvée is het topniveau van een Champagnehuis.

Dit zijn vaak de beste druiven.

Beste percelen.

Langste rijping.

Meeste selectie.

Bekende voorbeelden:

- Dom Pérignon
- Cristal
- La Grande Dame
- Comtes de Champagne

Prestige Cuvées zijn vaak duur.

Maar tonen het hoogste niveau van vakmanschap.

Ze hebben vaak groot bewaarpotentieel.

En hoge verzamelwaarde.
',
    '- prestige
- cuvée
- vintage
- topkwaliteit
- rijping',
    'Sommige Prestige Cuvées rijpen meer dan 10 jaar voor release.
',
    '- Hoogste kwaliteitsniveau
- Beste druiven en selectie
- Langste rijping
- Groot bewaarpotentieel
',
    '### Opdracht

Onderzoek drie Prestige Cuvées.

### Checklist

- Ik heb producent bekeken
- Ik heb prijs bekeken
- Ik heb druiven bekeken
- Ik heb rijping bekeken

### Reflectievraag

Zou jij Prestige Cuvée blind herkennen?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- wereldstijlen-sparkling (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'wereldstijlen-sparkling'
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
    'cava',
    'Cava',
    'Na deze les kun jij uitleggen wat Cava is en hoe het verschilt van Champagne.
',
    'Cava is de bekendste mousserende wijn van Spanje.

De meeste Cava komt uit Penedès in Catalonië.

Cava wordt gemaakt via de traditionele methode.

Net als Champagne.

Belangrijkste druiven zijn:

- Macabeo
- Xarel-lo
- Parellada

Steeds vaker ook Chardonnay en Pinot Noir.

Cava is vaak iets rijper, zachter en minder strak dan Champagne.

Prijs-kwaliteit is vaak zeer sterk.

Topcategorieën zoals Cava de Guarda Superior bieden hoge kwaliteit.
',
    '- Cava
- Spanje
- traditionele methode
- Xarel-lo
- Penedès
',
    'Xarel-lo is de ruggengraat van veel kwaliteits-Cava.
',
    '- Cava komt vooral uit Spanje
- Traditionele methode
- Eigen druivenrassen
- Vaak goede prijs-kwaliteit
',
    '### Opdracht

Vergelijk een Cava met een Champagne.

### Checklist

- Ik heb druiven bekeken
- Ik heb prijs vergeleken
- Ik heb aroma’s vergeleken

### Reflectievraag

Welke stijl voelt frisser?
',
    8,
    1
  ),
  (
    'prosecco',
    'Prosecco',
    'Na deze les begrijp jij hoe Prosecco wordt gemaakt en waarom het zo populair is.
',
    'Prosecco komt uit Noord-Italië.

Vooral uit Veneto en Friuli.

De belangrijkste druif is Glera.

Prosecco wordt meestal gemaakt via de Charmatmethode.

Daardoor blijft de wijn fris en fruitig.

Typische aroma’s zijn:

- peer
- appel
- witte bloemen
- perzik

Prosecco is vaak toegankelijk, licht en speels.

De hoogste kwaliteit komt uit Conegliano-Valdobbiadene DOCG.
',
    '- Prosecco
- Glera
- Charmat
- DOCG
- Veneto
',
    'Prosecco is wereldwijd één van de meest verkochte mousserende wijnen.
',
    '- Glera is de hoofd­druif
- Charmatmethode is dominant
- Fruitige stijl
- DOCG is hoogste niveau
',
    '### Opdracht

Zoek drie Prosecco’s.

### Checklist

- Ik heb DOC of DOCG bekeken
- Ik heb prijsniveau bekeken
- Ik heb dosage bekeken

### Reflectievraag

Zie je veel prijsverschil?
',
    8,
    2
  ),
  (
    'cremant',
    'Crémant',
    'Na deze les weet jij wat Crémant is en waarom het interessant is.
',
    'Crémant is Franse mousserende wijn buiten Champagne.

Altijd gemaakt via de traditionele methode.

Bekende regio’s:

- Alsace
- Bourgogne
- Loire
- Jura
- Limoux

Elke regio gebruikt andere druiven.

Daardoor varieert de stijl sterk.

Crémant biedt vaak veel kwaliteit voor minder geld dan Champagne.

Het is een belangrijke categorie voor sommeliers.
',
    '- Crémant
- Frankrijk
- traditionele methode
- regio
- stijl
',
    'Crémant de Limoux claimt ouder te zijn dan Champagne.
',
    '- Franse mousserende wijn buiten Champagne
- Traditionele methode
- Grote regionale verschillen
- Vaak sterke prijs-kwaliteit
',
    '### Opdracht

Zoek twee Crémants uit verschillende regio’s.

### Checklist

- Ik heb druiven vergeleken
- Ik heb stijl vergeleken
- Ik heb prijs vergeleken

### Reflectievraag

Welke regio lijkt het meest interessant?
',
    8,
    3
  ),
  (
    'franciacorta',
    'Franciacorta',
    'Na deze les begrijp jij waarom Franciacorta vaak als topniveau buiten Champagne wordt gezien.
',
    'Franciacorta komt uit Lombardije in Italië.

Het wordt gemaakt via de traditionele methode.

Belangrijkste druiven:

- Chardonnay
- Pinot Noir
- Pinot Bianco

Franciacorta heeft strenge regels.

Vaak langere rijping dan veel andere mousserende wijnen.

De stijl is vaak rijk, romig en verfijnd.

Veel professionals zien Franciacorta als één van de beste alternatieven voor Champagne.
',
    '- Franciacorta
- Italië
- Satèn
- kwaliteit
- rijping
',
    'Franciacorta Satèn is een unieke zachtere stijl met lagere druk.
',
    '- Topniveau uit Italië
- Traditionele methode
- Hoge kwaliteit
- Vaak complex en romig
',
    '### Opdracht

Zoek een Franciacorta en noteer de rijping.

### Checklist

- Ik heb druiven bekeken
- Ik heb dosage bekeken
- Ik heb rijping bekeken

### Reflectievraag

Wat maakt deze stijl premium?
',
    9,
    4
  ),
  (
    'sekt-en-english-sparkling',
    'Sekt & English Sparkling',
    'Na deze les kun jij Sekt en English Sparkling herkennen en plaatsen.
',
    'Sekt is de mousserende wijn van Duitsland en Oostenrijk.

Kwaliteit varieert sterk.

Top-Sekt wordt vaak gemaakt van:

- Riesling
- Pinot Noir
- Chardonnay

Steeds vaker via traditionele methode.

English Sparkling groeit snel.

Door klimaatverandering is Zuid-Engeland zeer geschikt geworden.

Veel Engelse producenten gebruiken dezelfde druiven als Champagne.

De stijl is vaak strak, zuur en mineraal.

Sommige kenners zien English Sparkling als grote toekomstige concurrent van Champagne.
',
    '- wereldstijlen
- Cava
- Prosecco
- Crémant
- Franciacorta',
    'Veel Champagnehuizen investeren inmiddels in Engeland.
',
    '- Sekt varieert sterk in kwaliteit
- Top-Sekt is serieus
- English Sparkling groeit snel
- Klimaat speelt grote rol
',
    '### Opdracht

Zoek één Sekt en één English Sparkling.

### Checklist

- Ik heb druiven bekeken
- Ik heb methode bekeken
- Ik heb prijs bekeken

### Reflectievraag

Welke zou jij eerder kopen?
',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- suiker-stijl-sparkling (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'suiker-stijl-sparkling'
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
    'brut-nature',
    'Brut Nature',
    'Na deze les kun jij Brut Nature herkennen en begrijpen waarom dit de droogste stijl is.
',
    'Brut Nature is de droogste officiële categorie.

Deze stijl bevat maximaal 3 gram restsuiker per liter.

Vaak wordt geen dosage toegevoegd.

Daardoor proef je de wijn heel puur.

Alles ligt open:

- zuur
- terroir
- structuur
- kwaliteit

Er is weinig ruimte om fouten te maskeren.

Brut Nature vraagt daarom vaak hoge kwaliteit basiswijn.

De stijl is strak, mineraal en direct.

Perfect voor liefhebbers van pure, droge wijn.
',
    '- Brut Nature
- Zero Dosage
- droog
- puur
- terroir
',
    'Brut Nature wordt ook wel Zero Dosage genoemd.
',
    '- Droogste categorie
- Maximaal 3 g/l suiker
- Vaak geen dosage
- Zeer puur en direct
',
    '### Opdracht

Zoek een Brut Nature en lees het etiket.

### Checklist

- Ik heb dosage gecontroleerd
- Ik heb alcohol bekeken
- Ik heb regio bekeken

### Reflectievraag

Zou jij deze droge stijl waarderen?
',
    8,
    1
  ),
  (
    'extra-brut',
    'Extra Brut',
    'Na deze les begrijp jij de stijl van Extra Brut.
',
    'Extra Brut bevat 0 tot 6 gram restsuiker per liter.

Dit geeft iets meer zachtheid dan Brut Nature.

Maar blijft duidelijk droog.

Veel kwaliteitsproducenten kiezen hiervoor.

Waarom?

Omdat het net iets meer balans geeft.

Vooral bij hoge zuren.

Extra Brut combineert strakheid met toegankelijkheid.

Het is populair bij sommeliers.
',
    '- Extra Brut
- balans
- restsuiker
- zuur
- finesse
',
    'Extra Brut wordt steeds populairder bij premium Champagne.
',
    '- Zeer droog
- Maximaal 6 g/l suiker
- Meer balans dan Brut Nature
- Populair in topsegment
',
    '### Opdracht

Vergelijk Brut Nature met Extra Brut.

### Checklist

- Ik heb zoetheid vergeleken
- Ik heb zuur vergeleken
- Ik heb balans vergeleken

### Reflectievraag

Welke voelt completer?
',
    8,
    2
  ),
  (
    'brut',
    'Brut',
    'Na deze les weet jij waarom Brut de standaard is.
',
    'Brut is de meest voorkomende stijl.

Brut bevat maximaal 12 gram restsuiker per liter.

Dit niveau geeft vaak de beste balans.

Niet te droog.

Niet te zoet.

Daardoor is Brut zeer breed inzetbaar.

Bij veel Champagnes is Brut de huisstijl.

Het werkt goed als aperitief.

Maar ook bij veel gerechten.

Voor beginners is Brut vaak de ideale start.
',
    '- Brut
- balans
- standaard
- aperitief
- veelzijdig
',
    'Meer dan de helft van alle Champagne wordt als Brut verkocht.
',
    '- Meest voorkomende stijl
- Maximaal 12 g/l suiker
- Veelzijdig inzetbaar
- Goede balans
',
    '### Opdracht

Proef een Brut en beoordeel balans.

### Checklist

- Ik heb zuur geproefd
- Ik heb dosage gevoeld
- Ik heb lengte beoordeeld

### Reflectievraag

Voelt deze stijl in balans?
',
    8,
    3
  ),
  (
    'extra-dry-dry',
    'Extra Dry / Dry',
    'Na deze les begrijp jij waarom de naam Extra Dry verwarrend is.
',
    'Extra Dry klinkt droger dan Brut.

Maar dat klopt niet.

Extra Dry bevat meer suiker:

12–17 gram per liter.

Dry bevat zelfs:

17–32 gram per liter.

Historisch werden deze stijlen ontwikkeld voor bredere smaakvoorkeuren.

Ze voelen zachter en fruitiger.

Vaak populair bij:

- brunch
- lichte desserts
- Aziatische gerechten

Voor veel beginners voelt Extra Dry toegankelijker.
',
    '- Extra Dry
- Dry
- restsuiker
- toegankelijk
- fruitig
',
    'Veel mensen denken verkeerd dat Extra Dry droger is dan Brut.
',
    '- Extra Dry is zoeter dan Brut
- Dry is nog zoeter
- Naamgeving is misleidend
- Toegankelijke stijlen
',
    '### Opdracht

Vergelijk Brut met Extra Dry.

### Checklist

- Ik heb zoetheid vergeleken
- Ik heb fruitigheid vergeleken
- Ik heb pairingmogelijkheden bedacht

### Reflectievraag

Welke voelt makkelijker drinkbaar?
',
    8,
    4
  ),
  (
    'demi-sec-en-zoet',
    'Demi-Sec & Zoet',
    'Na deze les kun jij Demi-Sec en zoetere stijlen herkennen en correct inzetten.
',
    'Demi-Sec bevat 32–50 gram restsuiker per liter.

Daarboven komen nog zoetere categorieën.

Deze stijlen zijn veel minder populair dan vroeger.

Maar ze hebben belangrijke toepassingen.

Vooral bij:

- desserts
- blauwschimmelkaas
- foie gras
- pittige gerechten

Zoete mousserende wijn vraagt om slimme pairing.

Als de wijn minder zoet is dan het gerecht, kan hij zuur of hard overkomen.

Balans is hier essentieel.
',
    '- dosage
- restsuiker
- Brut
- Extra Dry
- Demi-Sec',
    'Demi-Sec was vroeger populairder dan Brut.
',
    '- Demi-Sec is duidelijk zoet
- Sterk in dessertpairing
- Minder populair als aperitief
- Balans met eten is cruciaal
',
    '### Opdracht

Bedenk drie pairings voor Demi-Sec.

### Checklist

- Ik heb dessert gekozen
- Ik heb kaas gekozen
- Ik heb pittig gerecht gekozen

### Reflectievraag

Welke pairing lijkt het spannendst?
',
    9,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-sparkling (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'service-sparkling'
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
    'Na deze les weet jij welke serveertemperatuur ideaal is voor verschillende mousserende stijlen.
',
    'Temperatuur bepaalt hoe mousserende wijn wordt ervaren.

Te koud?

Dan sluiten aroma’s zich.

Te warm?

Dan verliest de wijn spanning en frisheid.

Algemene richtlijnen:

- Champagne: 8–10°C
- Cava: 6–8°C
- Prosecco: 6–8°C
- Prestige Cuvée: 10–12°C
- Demi-Sec: 6–8°C

Jongere en frissere stijlen mogen koeler.

Complexe en gerijpte stijlen mogen warmer.

Te koud serveren is één van de meest gemaakte fouten.
',
    '- temperatuur
- frisheid
- aroma
- spanning
- service
',
    'Veel restaurants serveren Champagne te koud, waardoor complexiteit verloren gaat.
',
    '- Temperatuur beïnvloedt aroma
- Jong = kouder
- Complex = iets warmer
- Te koud remt expressie
',
    '### Opdracht

Meet de temperatuur van een fles voor en na 15 minuten.

### Checklist

- Ik heb starttemperatuur gemeten
- Ik heb eindtemperatuur gemeten
- Ik heb smaakverschil geproefd

### Reflectievraag

Welke temperatuur werkte beter?
',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les kun jij het juiste glas kiezen voor mousserende wijn.
',
    'Glaswerk heeft grote invloed.

Traditioneel werd vaak een flute gebruikt.

Voordeel:

- mooie bubbelpresentatie

Nadeel:

- beperkte aromatische ontwikkeling

Steeds vaker gebruiken professionals wittewijnglazen.

Voordelen:

- betere aroma-expressie
- meer zuurstofcontact
- betere analyse

Coupe-glazen zijn vooral visueel.

Maar minder praktisch.

Voor top-Champagne is een witwijnglas vaak het beste.
',
    '- flute
- coupe
- witwijnglas
- aroma
- presentatie
',
    'Veel sommeliers serveren prestige-Champagne in Bourgogneglazen.
',
    '- Flute toont bubbels
- Witwijnglas toont aroma
- Coupe is minder praktisch
- Glas beïnvloedt ervaring
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik heb aroma vergeleken
- Ik heb mousse vergeleken
- Ik heb structuur vergeleken

### Reflectievraag

Uit welk glas kwam de wijn beter uit?
',
    8,
    2
  ),
  (
    'openen-zonder-verlies',
    'Openen zonder verlies',
    'Na deze les kun jij mousserende wijn veilig en professioneel openen.
',
    'Veel mensen openen mousserend te explosief.

Dat kost druk.

En dus kwaliteit.

Professioneel openen betekent:

1. Folie verwijderen
2. Muselet losmaken
3. Kurk vasthouden
4. Fles draaien (niet de kurk)
5. Langzaam druk laten ontsnappen

Het doel is een zachte zucht.

Geen knal.

Zo blijft mousse beter behouden.

En is het veiliger.
',
    '- openen
- kurk
- druk
- veiligheid
- mousse
',
    'Een Champagnekurk kan meer dan 50 km/u bereiken.
',
    '- Altijd controle houden
- Fles draaien
- Niet knallen
- Druk behouden
',
    '### Opdracht

Open een fles volgens de professionele methode.

### Checklist

- Ik hield de kurk vast
- Ik draaide de fles
- Ik maakte geen harde knal
- Ik hield controle

### Reflectievraag

Hoe voelde dit verschil?
',
    9,
    3
  ),
  (
    'bewaren-en-rijping',
    'Bewaren & Rijping',
    'Na deze les begrijp jij hoe mousserende wijn bewaard en gerijpt wordt.
',
    'Niet elke mousserende wijn is bedoeld om te rijpen.

Veel basiswijnen zijn gemaakt om jong te drinken.

Top-Champagne kan echter prachtig ouderen.

Belangrijke factoren:

- constante temperatuur
- weinig licht
- geen trillingen
- liggende opslag

Rijping zorgt voor:

- meer brioche
- noten
- honing
- complexiteit

Maar verlies ook:

- fruit
- frisheid

Balans is essentieel.

Te lang bewaren kan kwaliteit verminderen.
',
    '- bewaren
- rijping
- service
- temperatuur
- complexiteit',
    'Sommige top-Champagnes kunnen tientallen jaren rijpen.
',
    '- Niet alles is voor lange rijping
- Topkwaliteit rijpt vaak prachtig
- Goede opslag is essentieel
- Rijping verandert stijl sterk
',
    '### Opdracht

Bekijk je eigen voorraad mousserend.

### Checklist

- Ik heb gekeken welke wijnen jong moeten
- Ik heb gekeken welke kunnen ouderen
- Ik heb opslagomstandigheden beoordeeld

### Reflectievraag

Welke fles zou jij bewaren?
',
    10,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-sparkling (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'pairing-sparkling'
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
    'mousserend-en-oesters',
    'Mousserend & Oesters',
    'Na deze les begrijp jij waarom mousserende wijn en oesters een klassieke pairing zijn.
',
    'Oesters zijn zilt, fris en rijk aan umami.

Mousserende wijn sluit hier perfect op aan.

Waarom?

Door:

- hoge zuren
- frisheid
- mineraliteit
- mousse

De bubbels reinigen het gehemelte.

De zuren snijden door het zilte en romige karakter.

Champagne en oesters zijn één van de bekendste klassieke pairings ter wereld.

Vooral:

- Brut Nature
- Extra Brut
- Blanc de Blancs

werken vaak uitstekend.
',
    '- oesters
- zout
- umami
- Brut Nature
- Blanc de Blancs
',
    'Oesters versterken vaak de mineraliteit in Champagne.
',
    '- Zilt en zuur werken samen
- Mousse reinigt
- Mineraliteit versterkt spanning
- Klassieke topcombinatie
',
    '### Opdracht

Bedenk drie mousserende stijlen bij oesters.

### Checklist

- Ik koos een droge stijl
- Ik keek naar zuur
- Ik keek naar mineraliteit

### Reflectievraag

Waarom zou Demi-Sec hier minder goed werken?
',
    8,
    1
  ),
  (
    'mousserend-en-kaas',
    'Mousserend & Kaas',
    'Na deze les kun jij mousserende wijn combineren met verschillende kaassoorten.
',
    'Kaas is één van de beste partners voor mousserende wijn.

Waarom?

Door vet.

Vet vraagt zuur.

Mousserende wijn biedt:

- zuur
- frisheid
- textuur

Bij zachte kazen werkt frisse Brut vaak sterk.

Bij harde kazen werkt Vintage of Franciacorta goed.

Bij blauwschimmel kan Demi-Sec verrassend sterk zijn.

Belangrijk is intensiteit.

De wijn mag niet ondergesneeuwd raken.
',
    '- kaas
- vet
- zuur
- Comté
- blauwschimmel
',
    'Champagne met Comté is een klassieke pairing in Frankrijk.
',
    '- Vet vraagt zuur
- Mousse reinigt
- Intensiteit moet kloppen
- Zoete stijlen werken soms verrassend goed
',
    '### Opdracht

Maak drie kaas-wijn combinaties.

### Checklist

- Ik koos zachte kaas
- Ik koos harde kaas
- Ik koos blauwschimmel

### Reflectievraag

Welke pairing lijkt het spannendst?
',
    9,
    2
  ),
  (
    'mousserend-als-maaltijdwijn',
    'Mousserend als maaltijdwijn',
    'Na deze les begrijp jij waarom mousserende wijn de hele maaltijd kan begeleiden.
',
    'Veel mensen zien mousserende wijn alleen als aperitief.

Dat is een misvatting.

Door de combinatie van:

- zuur
- mousse
- frisheid
- complexiteit

kan mousserend door een hele maaltijd heen werken.

Voorbeelden:

Voorgerecht:
- oesters
- sashimi
- ceviche

Hoofdgerecht:
- gevogelte
- romige sauzen
- risotto

Kaas:
- Comté
- Brie
- Parmezaan

Dessert:
- fruitdesserts
- millefeuille
- tarte tatin

De sleutel is stijlkeuze.

Niet elke mousserende wijn past overal.

Droogte en intensiteit zijn cruciaal.
',
    '- maaltijdwijn
- pairing
- gastronomie
- stijlkeuze
- intensiteit',
    'Sommige Michelin-restaurants serveren complete menus met alleen Champagnepairing.
',
    '- Mousserend is meer dan aperitief
- Grote gastronomische breedte
- Stijlkeuze bepaalt succes
- Structuur maakt breed inzetbaar
',
    '### Opdracht

Bouw een 4-gangenmenu met alleen mousserende wijn.

### Checklist

- Ik koos aperitief
- Ik koos hoofdgerecht
- Ik koos kaas
- Ik koos dessert

### Reflectievraag

Waar zat de grootste uitdaging?
',
    10,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-sparkling (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'sparkling' and m.slug = 'examen-sparkling'
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
    'champagne-vs-cava-blind',
    'Champagne vs Cava blind',
    'Na deze les kun jij de belangrijkste verschillen tussen Champagne en Cava blind herkennen.
',
    'Champagne en Cava gebruiken beide de traditionele methode.

Toch zijn er duidelijke verschillen.

Champagne:

- vaak strakkere zuren
- meer krijt/mineraliteit
- vaak fijnere mousse
- meer autolyse

Cava:

- vaak rijper fruit
- zachtere structuur
- andere druiven
- soms minder spanning

Belangrijke herkenningspunten:

- zuurintensiteit
- moussekwaliteit
- aromatische complexiteit
- lengte

Blindproeven draait niet om perfect raden.

Maar om logisch analyseren.
',
    '- blind
- Champagne
- Cava
- vergelijking
- analyse
',
    'Veel top-Cava’s kunnen blind verrassend dicht bij Champagne komen.
',
    '- Zelfde methode
- Andere druiven
- Andere terroirs
- Analyse is cruciaal
',
    '### Opdracht

Proef blind een Champagne en Cava.

### Checklist

- Ik analyseerde mousse
- Ik analyseerde zuur
- Ik analyseerde autolyse
- Ik maakte een keuze

### Reflectievraag

Welke factor gaf de doorslag?
',
    10,
    1
  ),
  (
    'traditioneel-vs-tank-blind',
    'Traditioneel vs Tank blind',
    'Na deze les kun jij traditionele methode en tankmethode blind onderscheiden.
',
    'Dit is één van de belangrijkste blindskills.

Traditionele methode herken je vaak aan:

- fijnere mousse
- brioche
- toast
- complexiteit
- langere afdronk

Tankmethode herken je vaak aan:

- meer primair fruit
- eenvoudiger structuur
- minder autolyse
- directere stijl

Voorbeelden:

Traditioneel:
- Champagne
- Cava
- Franciacorta

Tank:
- Prosecco

Deze skill is essentieel in praktijk en examen.
',
    '- traditionele methode
- tankmethode
- autolyse
- blind
- structuur
',
    'Autolyse is vaak de snelste blindhint.
',
    '- Traditioneel = complexer
- Tank = fruitiger
- Autolyse is sleutel
- Structuur helpt herkennen
',
    '### Opdracht

Proef blind twee stijlen.

### Checklist

- Ik zocht autolyse
- Ik beoordeelde mousse
- Ik keek naar fruitniveau
- Ik maakte mijn conclusie

### Reflectievraag

Waar twijfelde je het meest?
',
    10,
    2
  ),
  (
    'theorie-praktijkexamen',
    'Theorie- en praktijkexamen',
    'Aantonen dat jij de basis van mousserende wijn op Master-niveau beheerst.
',
    'Dit examen test alles uit de volledige track:

### Fundament
- Wat is mousserend?
- Hoe ontstaan bubbels?

### Productie
- Méthode Traditionnelle
- Charmat
- Transfer
- Pet-Nat
- Dosage

### Proeven
- mousse
- aroma
- structuur

### Champagne
- regio
- druiven
- stijl

### Wereldstijlen
- Cava
- Prosecco
- Crémant
- Franciacorta
- Sekt

### Suiker & stijl
- Brut Nature
- Extra Brut
- Brut
- Extra Dry
- Demi-Sec

### Service
- temperatuur
- glaswerk
- openen
- bewaren

### Pairing
- oesters
- kaas
- gastronomie

### Blindproeven
- methodeherkenning
- regioherkenning
- stijlanalyse
',
    '- examen
- blindproeven
- analyse
- pairing
- certificering',
    '',
    '',
    '### Examenonderdeel 1 — Theorie

20 vragen.

Minimaal 75% goed.

---

### Examenonderdeel 2 — Blindproeven

2 glazen:

Glas A:
analyseer:
- mousse
- aroma
- structuur
- dosage
- methode

Glas B:
analyseer:
- mousse
- aroma
- structuur
- dosage
- methode

---

### Examenonderdeel 3 — Pairing

Kies voor drie gerechten:

- een passende mousserende stijl
- motiveer waarom
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
  where t.slug = 'sparkling'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-sparkling', 'wat-is-mousserende-wijn', 1, 'Wat maakt mousserende wijn mousserend?', '["Suiker", "Zuur", "Koolzuur", "Alcohol"]', 2, 'Correct: Koolzuur'),
  ('intro-sparkling', 'wat-is-mousserende-wijn', 2, 'Wanneer ontstaat meestal het koolzuur?', '["Tijdens botteling", "Tijdens tweede gisting", "Tijdens oogst", "Tijdens filtering"]', 1, 'Correct: Tijdens tweede gisting'),
  ('intro-sparkling', 'wat-is-mousserende-wijn', 3, 'Hoeveel bar druk zit gemiddeld in Champagne?', '["1–2", "3–4", "5–6", "8–9"]', 2, 'Correct: 5–6'),
  ('intro-sparkling', 'wat-is-mousserende-wijn', 4, 'Wat betekent mousse?', '["Kleur", "Bubbelstructuur", "Alcohol", "Zoetheid"]', 1, 'Correct: Bubbelstructuur'),
  ('intro-sparkling', 'wat-is-mousserende-wijn', 5, 'Wat bepaalt vaak de kwaliteit?', '["Fleskleur", "Productiemethode", "Etiket", "Kurk"]', 1, 'Correct: Productiemethode'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 1, 'Wat zetten gisten om?', '["Suiker in alcohol en CO2", "Water in alcohol", "Zuur in alcohol", "Zuurstof in alcohol"]', 0, 'Correct: Suiker in alcohol en CO2'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 2, 'Waar wordt CO2 gevangen?', '["In glas", "In fles of tank", "In vat", "In druif"]', 1, 'Correct: In fles of tank'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 3, 'Wat is autolyse?', '["Oxidatie", "Rijping op gistcellen", "Filtering", "Koeling"]', 1, 'Correct: Rijping op gistcellen'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 4, 'Autolyse geeft vaak:', '["Citrus", "Brioche", "Peper", "Kers"]', 1, 'Correct: Brioche'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 5, 'Bij openen:', '["Verdwijnt alcohol", "Ontstaat CO2 zichtbaar", "Stopt zuur", "Daalt suiker"]', 1, 'Correct: Ontstaat CO2 zichtbaar'),
  ('intro-sparkling', 'waarom-is-mousserend-uniek', 1, 'Wat geeft mousse aan wijn?', '["Bitterheid", "Textuur", "Tannine", "Hout"]', 1, 'Correct: Textuur'),
  ('intro-sparkling', 'waarom-is-mousserend-uniek', 2, 'Waarom werkt mousserend goed bij eten?', '["Door zuur en mousse", "Door tannine", "Door alcohol", "Door kleur"]', 0, 'Correct: Door zuur en mousse'),
  ('intro-sparkling', 'waarom-is-mousserend-uniek', 3, 'Wat doet mousse in de mond?', '["Verhoogt alcohol", "Reinigt het gehemelte", "Verhoogt zoetheid", "Verlaagt zuur"]', 1, 'Correct: Reinigt het gehemelte'),
  ('intro-sparkling', 'waarom-is-mousserend-uniek', 4, 'Waarom is mousserend veelzijdig?', '["Door combinatie van zuur, frisheid en mousse", "Alleen door alcohol", "Alleen door suiker", "Alleen door kleur"]', 0, 'Correct: Door combinatie van zuur, frisheid en mousse'),
  ('intro-sparkling', 'waarom-is-mousserend-uniek', 5, 'Waar werkt mousserend vaak goed bij?', '["Alleen dessert", "Veel verschillende gerechten", "Alleen vlees", "Alleen kaas"]', 1, 'Correct: Veel verschillende gerechten'),
  ('intro-sparkling', 'geschiedenis-mousserende-wijn', 1, 'Hoe werden bubbels vroeger vaak gezien?', '["Luxe", "Fout", "Zoet", "Modern"]', 1, 'Correct: Fout'),
  ('intro-sparkling', 'geschiedenis-mousserende-wijn', 2, 'Wat gebeurde vaak in de winter?', '["Gisting stopte", "Wijn bevroor", "Alcohol verdween", "Suiker verdween"]', 0, 'Correct: Gisting stopte'),
  ('intro-sparkling', 'geschiedenis-mousserende-wijn', 3, 'Waarom ontstond later druk in de fles?', '["Tweede gisting startte opnieuw", "Door hitte", "Door kurk", "Door glas"]', 0, 'Correct: Tweede gisting startte opnieuw'),
  ('intro-sparkling', 'geschiedenis-mousserende-wijn', 4, 'Welke regio perfectioneerde mousserende wijn?', '["Bordeaux", "Champagne", "Rioja", "Mosel"]', 1, 'Correct: Champagne'),
  ('intro-sparkling', 'geschiedenis-mousserende-wijn', 5, 'Hoe wordt Champagne nu gezien?', '["Fout", "Luxeproduct", "Basiswijn", "Dessertdrank"]', 1, 'Correct: Luxeproduct'),
  ('intro-sparkling', 'belangrijkste-categorieen', 1, 'Waar komt Champagne vandaan?', '["Spanje", "Italië", "Frankrijk", "Duitsland"]', 2, 'Correct: Frankrijk'),
  ('intro-sparkling', 'belangrijkste-categorieen', 2, 'Waar komt Cava vandaan?', '["Frankrijk", "Spanje", "Italië", "Oostenrijk"]', 1, 'Correct: Spanje'),
  ('intro-sparkling', 'belangrijkste-categorieen', 3, 'Welke stijl gebruikt vaak Charmat?', '["Champagne", "Prosecco", "Cava", "Crémant"]', 1, 'Correct: Prosecco'),
  ('intro-sparkling', 'belangrijkste-categorieen', 4, 'Wat is Franciacorta?', '["Spaanse wijn", "Italiaanse mousserende wijn", "Duitse wijn", "Engelse wijn"]', 1, 'Correct: Italiaanse mousserende wijn'),
  ('intro-sparkling', 'belangrijkste-categorieen', 5, 'Sekt komt vooral uit:', '["Portugal", "Duitsland", "België", "Frankrijk"]', 1, 'Correct: Duitsland'),
  ('productie-sparkling', 'methode-traditionnelle', 1, 'Waar vindt de tweede gisting plaats?', '["Tank", "Fles", "Vat", "Glas"]', 1, 'Correct: Fles'),
  ('productie-sparkling', 'methode-traditionnelle', 2, 'Wat is liqueur de tirage?', '["Suiker en gist", "Alcohol en water", "Druivensap", "Dosage"]', 0, 'Correct: Suiker en gist'),
  ('productie-sparkling', 'methode-traditionnelle', 3, 'Wat doet autolyse?', '["Koelt wijn", "Geeft complexiteit", "Verhoogt alcohol", "Verlaagt zuur"]', 1, 'Correct: Geeft complexiteit'),
  ('productie-sparkling', 'methode-traditionnelle', 4, 'Wat is dégorgement?', '["Filteren", "Gist verwijderen", "Bottelen", "Oogsten"]', 1, 'Correct: Gist verwijderen'),
  ('productie-sparkling', 'methode-traditionnelle', 5, 'Welke wijn gebruikt dit?', '["Prosecco", "Champagne", "Lambrusco", "Moscato"]', 1, 'Correct: Champagne'),
  ('productie-sparkling', 'charmat-tankmethode', 1, 'Waar vindt de tweede gisting plaats bij Charmat?', '["In de fles", "In tank", "In vat", "In glas"]', 1, 'Correct: In tank'),
  ('productie-sparkling', 'charmat-tankmethode', 2, 'Welke stijl gebruikt meestal Charmat?', '["Champagne", "Prosecco", "Cava", "Crémant"]', 1, 'Correct: Prosecco'),
  ('productie-sparkling', 'charmat-tankmethode', 3, 'Wat is een belangrijk kenmerk van Charmat?', '["Veel autolyse", "Meer fruitigheid", "Meer tannine", "Minder mousse"]', 1, 'Correct: Meer fruitigheid'),
  ('productie-sparkling', 'charmat-tankmethode', 4, 'Waarom is Charmat goedkoper?', '["Minder druiven", "Sneller proces", "Minder alcohol", "Minder druk"]', 1, 'Correct: Sneller proces'),
  ('productie-sparkling', 'charmat-tankmethode', 5, 'Welke aroma’s domineren vaak?', '["Brioche", "Toast", "Primair fruit", "Noten"]', 2, 'Correct: Primair fruit'),
  ('productie-sparkling', 'transfermethode', 1, 'Hoe begint de transfermethode?', '["In tank", "In fles", "In vat", "In glas"]', 1, 'Correct: In fles'),
  ('productie-sparkling', 'transfermethode', 2, 'Wat gebeurt daarna?', '["Rijping stopt", "Wijn gaat naar tank", "Wijn wordt gedistilleerd", "Wijn wordt verwarmd"]', 1, 'Correct: Wijn gaat naar tank'),
  ('productie-sparkling', 'transfermethode', 3, 'Waarom gebruikt men transfer?', '["Meer smaak", "Efficiëntie", "Meer alcohol", "Minder druk"]', 1, 'Correct: Efficiëntie'),
  ('productie-sparkling', 'transfermethode', 4, 'Is transfer volledig traditioneel?', '["Ja", "Nee", "Soms", "Altijd"]', 1, 'Correct: Nee'),
  ('productie-sparkling', 'transfermethode', 5, 'Waar wordt gist verwijderd?', '["In de fles", "In tank", "In glas", "In vat"]', 1, 'Correct: In tank'),
  ('productie-sparkling', 'methode-ancestrale', 1, 'Wat is de oudste mousserende methode?', '["Charmat", "Méthode Ancestrale", "Transfer", "Traditioneel"]', 1, 'Correct: Méthode Ancestrale'),
  ('productie-sparkling', 'methode-ancestrale', 2, 'Wanneer wordt Pet-Nat gebotteld?', '["Na gisting", "Tijdens gisting", "Voor oogst", "Na dosage"]', 1, 'Correct: Tijdens gisting'),
  ('productie-sparkling', 'methode-ancestrale', 3, 'Heeft Pet-Nat altijd dégorgement?', '["Ja", "Nee", "Soms nooit", "Altijd verplicht"]', 1, 'Correct: Nee'),
  ('productie-sparkling', 'methode-ancestrale', 4, 'Hoe oogt Pet-Nat vaak?', '["Helder", "Troebel", "Donker", "Oranje"]', 1, 'Correct: Troebel'),
  ('productie-sparkling', 'methode-ancestrale', 5, 'Waar is Pet-Nat populair?', '["Dessertwereld", "Natuurwijnwereld", "Portwereld", "Bierwereld"]', 1, 'Correct: Natuurwijnwereld'),
  ('productie-sparkling', 'dosage-uitgelegd', 1, 'Wanneer wordt dosage toegevoegd?', '["Voor gisting", "Na dégorgement", "Tijdens oogst", "Tijdens filtering"]', 1, 'Correct: Na dégorgement'),
  ('productie-sparkling', 'dosage-uitgelegd', 2, 'Wat bepaalt dosage?', '["Kleur", "Zoetheid", "Alcohol", "Zuur"]', 1, 'Correct: Zoetheid'),
  ('productie-sparkling', 'dosage-uitgelegd', 3, 'Welke is het droogst?', '["Demi-Sec", "Brut", "Brut Nature", "Extra Dry"]', 2, 'Correct: Brut Nature'),
  ('productie-sparkling', 'dosage-uitgelegd', 4, 'Wat is liqueur d’expédition?', '["Suikeroplossing", "Druivensap", "Gist", "Alcohol"]', 0, 'Correct: Suikeroplossing'),
  ('productie-sparkling', 'dosage-uitgelegd', 5, 'Welke is vaak zoeter?', '["Brut", "Extra Dry", "Brut Nature", "Extra Brut"]', 1, 'Correct: Extra Dry'),
  ('proeven-sparkling', 'hoe-proef-je-mousserend', 1, 'Waar kijk je eerst naar?', '["Alcohol", "Kleur en mousse", "Etiket", "Druif"]', 1, 'Correct: Kleur en mousse'),
  ('proeven-sparkling', 'hoe-proef-je-mousserend', 2, 'Wat is persistentie?', '["Kleurintensiteit", "Hoe lang bubbels blijven", "Alcoholniveau", "Zoetheid"]', 1, 'Correct: Hoe lang bubbels blijven'),
  ('proeven-sparkling', 'hoe-proef-je-mousserend', 3, 'Wat bepaalt balans?', '["Alleen suiker", "Zuur, mousse en dosage", "Alleen kleur", "Alleen alcohol"]', 1, 'Correct: Zuur, mousse en dosage'),
  ('proeven-sparkling', 'hoe-proef-je-mousserend', 4, 'Waarom zijn bubbels belangrijk?', '["Ze geven textuur", "Ze maken wijn rood", "Ze verlagen alcohol", "Ze verhogen suiker"]', 0, 'Correct: Ze geven textuur'),
  ('proeven-sparkling', 'hoe-proef-je-mousserend', 5, 'Wat analyseer je niet?', '["Lengte", "Structuur", "Dopkleur", "Body"]', 2, 'Correct: Dopkleur'),
  ('proeven-sparkling', 'mousse-analyseren', 1, 'Wat is mousse?', '["Suiker", "Bubbelstructuur", "Alcohol", "Zuur"]', 1, 'Correct: Bubbelstructuur'),
  ('proeven-sparkling', 'mousse-analyseren', 2, 'Wat wijst vaak op hogere kwaliteit?', '["Grote bubbels", "Kleine fijne bubbels", "Geen bubbels", "Snelle verdamping"]', 1, 'Correct: Kleine fijne bubbels'),
  ('proeven-sparkling', 'mousse-analyseren', 3, 'Wat betekent persistentie?', '["Alcoholpercentage", "Hoe lang de bubbels blijven", "Zoetheid", "Kleurintensiteit"]', 1, 'Correct: Hoe lang de bubbels blijven'),
  ('proeven-sparkling', 'mousse-analyseren', 4, 'Welke methode geeft vaak fijnere mousse?', '["Charmat", "Traditionele methode", "Pet-Nat", "Transfer"]', 1, 'Correct: Traditionele methode'),
  ('proeven-sparkling', 'mousse-analyseren', 5, 'Wat beïnvloedt mousse direct?', '["Mondgevoel", "Alcohol", "Tannine", "Kleur"]', 0, 'Correct: Mondgevoel'),
  ('proeven-sparkling', 'aromas-herkennen', 1, 'Wat zijn primaire aroma’s?', '["Rijping", "Druif", "Hout", "Oxidatie"]', 1, 'Correct: Druif'),
  ('proeven-sparkling', 'aromas-herkennen', 2, 'Wat geeft brioche?', '["Primair", "Secundair", "Tertiair", "Oxidatief"]', 1, 'Correct: Secundair'),
  ('proeven-sparkling', 'aromas-herkennen', 3, 'Wat geeft honing?', '["Primair", "Secundair", "Tertiair", "Dosage"]', 2, 'Correct: Tertiair'),
  ('proeven-sparkling', 'aromas-herkennen', 4, 'Welke methode geeft vaak veel autolyse?', '["Charmat", "Traditioneel", "Carbonic", "Rosé"]', 1, 'Correct: Traditioneel'),
  ('proeven-sparkling', 'aromas-herkennen', 5, 'Wat is brooddeeg?', '["Primair", "Secundair", "Tertiair", "Fruit"]', 1, 'Correct: Secundair'),
  ('proeven-sparkling', 'structuur-herkennen', 1, 'Wat is de ruggengraat van mousserende wijn?', '["Alcohol", "Zuur", "Tannine", "Suiker"]', 1, 'Correct: Zuur'),
  ('proeven-sparkling', 'structuur-herkennen', 2, 'Wat geeft mousse?', '["Bitterheid", "Textuur", "Zout", "Hout"]', 1, 'Correct: Textuur'),
  ('proeven-sparkling', 'structuur-herkennen', 3, 'Wat verzacht de wijn?', '["Dosage", "Zuur", "Tannine", "Glaswerk"]', 0, 'Correct: Dosage'),
  ('proeven-sparkling', 'structuur-herkennen', 4, 'Wat zegt lengte vaak?', '["Leeftijd", "Kwaliteit", "Alcohol", "Druif"]', 1, 'Correct: Kwaliteit'),
  ('proeven-sparkling', 'structuur-herkennen', 5, 'Wat bepaalt complete structuur?', '["Alleen zuur", "Alleen dosage", "Balans van alle elementen", "Alleen mousse"]', 2, 'Correct: Balans van alle elementen'),
  ('champagne-sparkling', 'champagne-regio', 1, 'Waar ligt Champagne?', '["Zuid-Frankrijk", "Noord-Frankrijk", "Spanje", "Italië"]', 1, 'Correct: Noord-Frankrijk'),
  ('champagne-sparkling', 'champagne-regio', 2, 'Welke bodem is belangrijk?', '["Graniet", "Kalk/krijt", "Leisteen", "Zand"]', 1, 'Correct: Kalk/krijt'),
  ('champagne-sparkling', 'champagne-regio', 3, 'Waar domineert Chardonnay?', '["Côte des Blancs", "Côte des Bar", "Marne", "Reims"]', 0, 'Correct: Côte des Blancs'),
  ('champagne-sparkling', 'champagne-regio', 4, 'Waar domineert Meunier?', '["Reims", "Marne", "Blancs", "Bar"]', 1, 'Correct: Marne'),
  ('champagne-sparkling', 'champagne-regio', 5, 'Wat geeft koel klimaat?', '["Lage zuren", "Hoge zuren", "Veel suiker", "Lage alcohol"]', 1, 'Correct: Hoge zuren'),
  ('champagne-sparkling', 'druiven-van-champagne', 1, 'Welke drie druiven domineren Champagne?', '["Merlot, Cabernet, Syrah", "Chardonnay, Pinot Noir, Meunier", "Riesling, Pinot Blanc, Chardonnay", "Glera, Xarel-lo, Parellada"]', 1, 'Correct: Chardonnay, Pinot Noir, Meunier'),
  ('champagne-sparkling', 'druiven-van-champagne', 2, 'Welke druif geeft vooral frisheid?', '["Meunier", "Chardonnay", "Pinot Noir", "Syrah"]', 1, 'Correct: Chardonnay'),
  ('champagne-sparkling', 'druiven-van-champagne', 3, 'Welke druif geeft vooral body?', '["Pinot Noir", "Chardonnay", "Meunier", "Sauvignon Blanc"]', 0, 'Correct: Pinot Noir'),
  ('champagne-sparkling', 'druiven-van-champagne', 4, 'Welke druif geeft toegankelijk fruit?', '["Meunier", "Pinot Noir", "Chardonnay", "Riesling"]', 0, 'Correct: Meunier'),
  ('champagne-sparkling', 'druiven-van-champagne', 5, 'Waarom blenden producenten?', '["Voor kleur", "Voor balans", "Voor meer alcohol", "Voor minder mousse"]', 1, 'Correct: Voor balans'),
  ('champagne-sparkling', 'blanc-de-blancs-vs-blanc-de-noirs', 1, 'Wat betekent Blanc de Blancs?', '["Wit van wit", "Wit van zwart", "Rosé blend", "Oude wijn"]', 0, 'Correct: Wit van wit'),
  ('champagne-sparkling', 'blanc-de-blancs-vs-blanc-de-noirs', 2, 'Welke druif wordt meestal gebruikt voor Blanc de Blancs?', '["Pinot Noir", "Chardonnay", "Meunier", "Syrah"]', 1, 'Correct: Chardonnay'),
  ('champagne-sparkling', 'blanc-de-blancs-vs-blanc-de-noirs', 3, 'Wat betekent Blanc de Noirs?', '["Alleen witte druiven", "Wit van zwarte druiven", "Rosé", "Vintage"]', 1, 'Correct: Wit van zwarte druiven'),
  ('champagne-sparkling', 'blanc-de-blancs-vs-blanc-de-noirs', 4, 'Welke stijl is vaak strakker?', '["Blanc de Blancs", "Blanc de Noirs", "Rosé", "Demi-Sec"]', 0, 'Correct: Blanc de Blancs'),
  ('champagne-sparkling', 'blanc-de-blancs-vs-blanc-de-noirs', 5, 'Welke stijl heeft vaak meer body?', '["Blanc de Blancs", "Blanc de Noirs", "Brut Nature", "Extra Brut"]', 1, 'Correct: Blanc de Noirs'),
  ('champagne-sparkling', 'vintage-vs-non-vintage', 1, 'Wat betekent Non-Vintage?', '["Geen wijn", "Blend van meerdere jaren", "Oude wijn", "Zoete wijn"]', 1, 'Correct: Blend van meerdere jaren'),
  ('champagne-sparkling', 'vintage-vs-non-vintage', 2, 'Wat betekent Vintage?', '["Blend", "Eén oogstjaar", "Zoete stijl", "Houtgerijpt"]', 1, 'Correct: Eén oogstjaar'),
  ('champagne-sparkling', 'vintage-vs-non-vintage', 3, 'Waarom maken huizen NV?', '["Huisstijl behouden", "Minder werk", "Meer alcohol", "Meer mousse"]', 0, 'Correct: Huisstijl behouden'),
  ('champagne-sparkling', 'vintage-vs-non-vintage', 4, 'Wat heeft vaak meer bewaarpotentieel?', '["Non-Vintage", "Vintage", "Rosé", "Demi-Sec"]', 1, 'Correct: Vintage'),
  ('champagne-sparkling', 'vintage-vs-non-vintage', 5, 'Wordt Vintage elk jaar gemaakt?', '["Ja", "Nee, alleen topjaren", "Alleen in Frankrijk", "Alleen bij rosé"]', 1, 'Correct: Nee, alleen topjaren'),
  ('champagne-sparkling', 'prestige-cuvee', 1, 'Wat is Prestige Cuvée?', '["Basiswijn", "Topwijn", "Rosé", "Dessertwijn"]', 1, 'Correct: Topwijn'),
  ('champagne-sparkling', 'prestige-cuvee', 2, 'Vintage betekent:', '["Blend", "Eén jaar", "Zoet", "Oud"]', 1, 'Correct: Eén jaar'),
  ('champagne-sparkling', 'prestige-cuvee', 3, 'NV betekent:', '["Geen vintagejaar", "Geen wijn", "Geen dosage", "Geen rijping"]', 0, 'Correct: Geen vintagejaar'),
  ('champagne-sparkling', 'prestige-cuvee', 4, 'Welke is Prestige?', '["Dom Pérignon", "Basis Prosecco", "Pet-Nat", "Cava Brut"]', 0, 'Correct: Dom Pérignon'),
  ('champagne-sparkling', 'prestige-cuvee', 5, 'Prestige Cuvée heeft vaak:', '["Minder rijping", "Meer rijping", "Minder kwaliteit", "Minder selectie"]', 1, 'Correct: Meer rijping'),
  ('wereldstijlen-sparkling', 'cava', 1, 'Waar komt de meeste Cava vandaan?', '["Rioja", "Penedès", "Champagne", "Veneto"]', 1, 'Correct: Penedès'),
  ('wereldstijlen-sparkling', 'cava', 2, 'Welke methode gebruikt Cava?', '["Charmat", "Traditionele methode", "Transfer", "Pet-Nat"]', 1, 'Correct: Traditionele methode'),
  ('wereldstijlen-sparkling', 'cava', 3, 'Welke druif is belangrijk in Cava?', '["Glera", "Xarel-lo", "Riesling", "Meunier"]', 1, 'Correct: Xarel-lo'),
  ('wereldstijlen-sparkling', 'cava', 4, 'Hoe wordt Cava vaak omschreven?', '["Zoet", "Fris en rijper dan Champagne", "Oxidatief", "Stil"]', 1, 'Correct: Fris en rijper dan Champagne'),
  ('wereldstijlen-sparkling', 'cava', 5, 'Wat is een sterke eigenschap van Cava?', '["Hoge prijs", "Goede prijs-kwaliteit", "Lage zuren", "Veel tannine"]', 1, 'Correct: Goede prijs-kwaliteit'),
  ('wereldstijlen-sparkling', 'prosecco', 1, 'Welke druif is dominant in Prosecco?', '["Chardonnay", "Glera", "Pinot Noir", "Xarel-lo"]', 1, 'Correct: Glera'),
  ('wereldstijlen-sparkling', 'prosecco', 2, 'Welke methode gebruikt Prosecco meestal?', '["Traditioneel", "Charmat", "Transfer", "Pet-Nat"]', 1, 'Correct: Charmat'),
  ('wereldstijlen-sparkling', 'prosecco', 3, 'Waar komt Prosecco vooral vandaan?', '["Toscane", "Veneto", "Champagne", "Rioja"]', 1, 'Correct: Veneto'),
  ('wereldstijlen-sparkling', 'prosecco', 4, 'Welke aroma’s zijn typisch?', '["Brioche", "Peer en appel", "Tabak", "Noten"]', 1, 'Correct: Peer en appel'),
  ('wereldstijlen-sparkling', 'prosecco', 5, 'Wat is het hoogste kwaliteitsniveau?', '["DOCG", "IGT", "VDP", "Reserva"]', 0, 'Correct: DOCG'),
  ('wereldstijlen-sparkling', 'cremant', 1, 'Wat is Crémant?', '["Spaanse mousserende wijn", "Franse mousserende wijn buiten Champagne", "Duitse mousserende wijn", "Italiaanse dessertwijn"]', 1, 'Correct: Franse mousserende wijn buiten Champagne'),
  ('wereldstijlen-sparkling', 'cremant', 2, 'Welke methode wordt gebruikt?', '["Charmat", "Traditionele methode", "Transfer", "Carbonic"]', 1, 'Correct: Traditionele methode'),
  ('wereldstijlen-sparkling', 'cremant', 3, 'Waar kan Crémant vandaan komen?', '["Alsace", "Champagne", "Rioja", "Veneto"]', 0, 'Correct: Alsace'),
  ('wereldstijlen-sparkling', 'cremant', 4, 'Waarom is Crémant interessant?', '["Lage kwaliteit", "Goede prijs-kwaliteit", "Zoete stijl", "Geen regels"]', 1, 'Correct: Goede prijs-kwaliteit'),
  ('wereldstijlen-sparkling', 'cremant', 5, 'Heeft elke regio dezelfde druiven?', '["Ja", "Nee", "Alleen Chardonnay", "Alleen Pinot Noir"]', 1, 'Correct: Nee'),
  ('wereldstijlen-sparkling', 'franciacorta', 1, 'Waar ligt Franciacorta?', '["Frankrijk", "Italië", "Spanje", "Duitsland"]', 1, 'Correct: Italië'),
  ('wereldstijlen-sparkling', 'franciacorta', 2, 'Welke methode gebruikt Franciacorta?', '["Charmat", "Traditionele methode", "Pet-Nat", "Transfer"]', 1, 'Correct: Traditionele methode'),
  ('wereldstijlen-sparkling', 'franciacorta', 3, 'Welke druif is belangrijk?', '["Glera", "Chardonnay", "Riesling", "Xarel-lo"]', 1, 'Correct: Chardonnay'),
  ('wereldstijlen-sparkling', 'franciacorta', 4, 'Hoe wordt Franciacorta vaak gezien?', '["Basisniveau", "Topniveau buiten Champagne", "Dessertwijn", "Natuurwijn"]', 1, 'Correct: Topniveau buiten Champagne'),
  ('wereldstijlen-sparkling', 'franciacorta', 5, 'Wat is Satèn?', '["Zoete stijl", "Zachtere stijl met lagere druk", "Rode stijl", "Houtstijl"]', 1, 'Correct: Zachtere stijl met lagere druk'),
  ('wereldstijlen-sparkling', 'sekt-en-english-sparkling', 1, 'Waar komt Cava vandaan?', '["Italië", "Spanje", "Duitsland", "Frankrijk"]', 1, 'Correct: Spanje'),
  ('wereldstijlen-sparkling', 'sekt-en-english-sparkling', 2, 'Welke druif is Prosecco?', '["Glera", "Xarel-lo", "Riesling", "Pinot Noir"]', 0, 'Correct: Glera'),
  ('wereldstijlen-sparkling', 'sekt-en-english-sparkling', 3, 'Crémant komt uit:', '["Frankrijk", "Italië", "Spanje", "Portugal"]', 0, 'Correct: Frankrijk'),
  ('wereldstijlen-sparkling', 'sekt-en-english-sparkling', 4, 'Franciacorta komt uit:', '["Frankrijk", "Italië", "Spanje", "Engeland"]', 1, 'Correct: Italië'),
  ('wereldstijlen-sparkling', 'sekt-en-english-sparkling', 5, 'Welke stijl groeit snel?', '["English Sparkling", "Port", "Madeira", "Sherry"]', 0, 'Correct: English Sparkling'),
  ('suiker-stijl-sparkling', 'brut-nature', 1, 'Wat is Brut Nature?', '["Zoetste stijl", "Droogste stijl", "Fruitigste stijl", "Oudste stijl"]', 1, 'Correct: Droogste stijl'),
  ('suiker-stijl-sparkling', 'brut-nature', 2, 'Hoeveel restsuiker bevat Brut Nature maximaal?', '["3 g/l", "6 g/l", "12 g/l", "32 g/l"]', 0, 'Correct: 3 g/l'),
  ('suiker-stijl-sparkling', 'brut-nature', 3, 'Welke naam wordt ook gebruikt?', '["Demi-Sec", "Zero Dosage", "Dry", "Vintage"]', 1, 'Correct: Zero Dosage'),
  ('suiker-stijl-sparkling', 'brut-nature', 4, 'Wat proef je extra duidelijk?', '["Suiker", "Terroir en structuur", "Hout", "Tannine"]', 1, 'Correct: Terroir en structuur'),
  ('suiker-stijl-sparkling', 'brut-nature', 5, 'Waarom vraagt Brut Nature hoge kwaliteit?', '["Minder alcohol", "Minder maskering door suiker", "Meer druk", "Minder zuur"]', 1, 'Correct: Minder maskering door suiker'),
  ('suiker-stijl-sparkling', 'extra-brut', 1, 'Hoeveel restsuiker bevat Extra Brut maximaal?', '["3 g/l", "6 g/l", "12 g/l", "32 g/l"]', 1, 'Correct: 6 g/l'),
  ('suiker-stijl-sparkling', 'extra-brut', 2, 'Hoe voelt Extra Brut vaak?', '["Zoet", "Zeer droog", "Zwaar", "Bitter"]', 1, 'Correct: Zeer droog'),
  ('suiker-stijl-sparkling', 'extra-brut', 3, 'Waarom kiezen veel topmakers hiervoor?', '["Meer suiker", "Meer balans bij hoge zuren", "Goedkoper", "Sneller"]', 1, 'Correct: Meer balans bij hoge zuren'),
  ('suiker-stijl-sparkling', 'extra-brut', 4, 'Extra Brut zit tussen:', '["Brut en Demi-Sec", "Brut Nature en Brut", "Dry en Sec", "Vintage en NV"]', 1, 'Correct: Brut Nature en Brut'),
  ('suiker-stijl-sparkling', 'extra-brut', 5, 'Bij wie is Extra Brut populair?', '["Bierdrinkers", "Sommeliers", "Portmakers", "Dessertchefs"]', 1, 'Correct: Sommeliers'),
  ('suiker-stijl-sparkling', 'brut', 1, 'Wat is de meest voorkomende mousserende stijl?', '["Brut", "Demi-Sec", "Dry", "Doux"]', 0, 'Correct: Brut'),
  ('suiker-stijl-sparkling', 'brut', 2, 'Hoeveel restsuiker bevat Brut maximaal?', '["3 g/l", "6 g/l", "12 g/l", "20 g/l"]', 2, 'Correct: 12 g/l'),
  ('suiker-stijl-sparkling', 'brut', 3, 'Waarom is Brut populair?', '["Veel tannine", "Goede balans", "Veel alcohol", "Lage zuren"]', 1, 'Correct: Goede balans'),
  ('suiker-stijl-sparkling', 'brut', 4, 'Waar werkt Brut goed?', '["Alleen dessert", "Aperitief én maaltijd", "Alleen kaas", "Alleen vlees"]', 1, 'Correct: Aperitief én maaltijd'),
  ('suiker-stijl-sparkling', 'brut', 5, 'Voor wie is Brut ideaal?', '["Beginners én gevorderden", "Alleen experts", "Alleen verzamelaars", "Alleen chefs"]', 0, 'Correct: Beginners én gevorderden'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 1, 'Hoeveel restsuiker bevat Extra Dry?', '["0–3 g/l", "12–17 g/l", "17–32 g/l", "32–50 g/l"]', 1, 'Correct: 12–17 g/l'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 2, 'Hoeveel bevat Dry?', '["0–3 g/l", "6–12 g/l", "17–32 g/l", "50–60 g/l"]', 2, 'Correct: 17–32 g/l'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 3, 'Waarom is de naam verwarrend?', '["Het klinkt droger dan het is", "Het is zoeter dan Demi-Sec", "Het is altijd Brut Nature", "Het heeft geen suiker"]', 0, 'Correct: Het klinkt droger dan het is'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 4, 'Waar werkt Extra Dry goed?', '["Brunch en lichte gerechten", "Wild", "Steak", "Oude kaas"]', 0, 'Correct: Brunch en lichte gerechten'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 1, 'Wat is de droogste stijl?', '["Brut", "Extra Dry", "Brut Nature", "Demi-Sec"]', 2, 'Correct: Brut Nature'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 2, 'Wat is de standaardstijl?', '["Brut", "Dry", "Demi-Sec", "Doux"]', 0, 'Correct: Brut'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 3, 'Extra Dry is:', '["Droger dan Brut", "Zoeter dan Brut", "Gelijk aan Brut", "Zoeter dan Demi-Sec"]', 1, 'Correct: Zoeter dan Brut'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 4, 'Demi-Sec past goed bij:', '["Oesters", "Desserts", "Steak", "Zoutchips"]', 1, 'Correct: Desserts'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 5, 'Wat bepaalt zoetheid?', '["Alcohol", "Dosage", "Druif", "Glaswerk"]', 1, 'Correct: Dosage'),
  ('service-sparkling', 'serveertemperatuur', 1, 'Wat is de ideale serveertemperatuur voor standaard Champagne?', '["2–4°C", "8–10°C", "14–16°C", "18–20°C"]', 1, 'Correct: 8–10°C'),
  ('service-sparkling', 'serveertemperatuur', 2, 'Waarom is te koud serveren een fout?', '["Meer alcohol", "Aroma’s sluiten zich", "Meer mousse", "Minder druk"]', 1, 'Correct: Aroma’s sluiten zich'),
  ('service-sparkling', 'serveertemperatuur', 3, 'Welke stijl mag warmer geserveerd worden?', '["Prestige Cuvée", "Basis Prosecco", "Demi-Sec", "Rosé Moscato"]', 0, 'Correct: Prestige Cuvée'),
  ('service-sparkling', 'serveertemperatuur', 4, 'Wat versterkt lagere temperatuur?', '["Zoetheid", "Frisheid", "Bitterheid", "Hout"]', 1, 'Correct: Frisheid'),
  ('service-sparkling', 'serveertemperatuur', 5, 'Wat verlies je bij te warme service?', '["Zuur", "Spanning en frisheid", "Kleur", "Alcohol"]', 1, 'Correct: Spanning en frisheid'),
  ('service-sparkling', 'glaswerk', 1, 'Welk glas wordt traditioneel gebruikt?', '["Bourgogneglas", "Flute", "Coupe", "Portglas"]', 1, 'Correct: Flute'),
  ('service-sparkling', 'glaswerk', 2, 'Wat is het nadeel van een flute?', '["Slechte mousse", "Minder aromatische ontwikkeling", "Meer oxidatie", "Minder druk"]', 1, 'Correct: Minder aromatische ontwikkeling'),
  ('service-sparkling', 'glaswerk', 3, 'Welk glas gebruiken veel sommeliers voor top-Champagne?', '["Shotglas", "Witwijnglas", "Flute", "Bierglas"]', 1, 'Correct: Witwijnglas'),
  ('service-sparkling', 'glaswerk', 4, 'Waarom werkt een witwijnglas beter?', '["Meer zuurstofcontact", "Meer suiker", "Meer druk", "Meer alcohol"]', 0, 'Correct: Meer zuurstofcontact'),
  ('service-sparkling', 'glaswerk', 5, 'Waarvoor is een coupe minder praktisch?', '["Presentatie", "Aroma en moussebehoud", "Kleur", "Temperatuur"]', 1, 'Correct: Aroma en moussebehoud'),
  ('service-sparkling', 'openen-zonder-verlies', 1, 'Wat draai je?', '["Kurk", "Fles", "Glas", "Muselet"]', 1, 'Correct: Fles'),
  ('service-sparkling', 'openen-zonder-verlies', 2, 'Wat wil je horen?', '["Knal", "Zachte zucht", "Niets", "Klik"]', 1, 'Correct: Zachte zucht'),
  ('service-sparkling', 'openen-zonder-verlies', 3, 'Waarom rustig openen?', '["Veiligheid en kwaliteit", "Meer alcohol", "Minder schuim", "Minder smaak"]', 0, 'Correct: Veiligheid en kwaliteit'),
  ('service-sparkling', 'openen-zonder-verlies', 4, 'Wat houd je vast?', '["Hals", "Kurk", "Glas", "Bodem"]', 1, 'Correct: Kurk'),
  ('service-sparkling', 'openen-zonder-verlies', 5, 'Wat verlies je bij explosief openen?', '["Suiker", "Mousse en druk", "Alcohol", "Zuur"]', 1, 'Correct: Mousse en druk'),
  ('service-sparkling', 'bewaren-en-rijping', 1, 'Wat is ideaal voor opslag?', '["Warmte", "Licht", "Constante koelte", "Zonlicht"]', 2, 'Correct: Constante koelte'),
  ('service-sparkling', 'bewaren-en-rijping', 2, 'Wat ontwikkelt zich bij rijping?', '["Meer fruit", "Meer brioche", "Minder aroma", "Minder structuur"]', 1, 'Correct: Meer brioche'),
  ('service-sparkling', 'bewaren-en-rijping', 3, 'Hoe bewaar je flessen?', '["Staand", "Liggend", "Schuin", "Open"]', 1, 'Correct: Liggend'),
  ('service-sparkling', 'bewaren-en-rijping', 4, 'Wat verliest vaak kracht?', '["Fruitigheid", "Complexiteit", "Structuur", "Diepte"]', 0, 'Correct: Fruitigheid'),
  ('service-sparkling', 'bewaren-en-rijping', 5, 'Kan Champagne ouderen?', '["Nee", "Soms", "Ja", "Alleen rosé"]', 2, 'Correct: Ja'),
  ('pairing-sparkling', 'mousserend-en-oesters', 1, 'Waarom werken oesters goed met mousserende wijn?', '["Door tannine", "Door zuur en mineraliteit", "Door hout", "Door alcohol"]', 1, 'Correct: Door zuur en mineraliteit'),
  ('pairing-sparkling', 'mousserend-en-oesters', 2, 'Wat doet mousse bij oesters?', '["Verhoogt zoetheid", "Reinigt het gehemelte", "Verlaagt zuur", "Verhoogt tannine"]', 1, 'Correct: Reinigt het gehemelte'),
  ('pairing-sparkling', 'mousserend-en-oesters', 3, 'Welke stijl werkt vaak het beste?', '["Demi-Sec", "Brut Nature", "Doux", "Zoete Prosecco"]', 1, 'Correct: Brut Nature'),
  ('pairing-sparkling', 'mousserend-en-oesters', 4, 'Wat versterkt de ziltigheid van oesters?', '["Hout", "Mineraliteit", "Tannine", "Zoetheid"]', 1, 'Correct: Mineraliteit'),
  ('pairing-sparkling', 'mousserend-en-oesters', 5, 'Waarom is Demi-Sec hier minder logisch?', '["Te zuur", "Te zoet", "Te droog", "Te bitter"]', 1, 'Correct: Te zoet'),
  ('pairing-sparkling', 'mousserend-en-kaas', 1, 'Waarom werkt mousserend goed met kaas?', '["Door alcohol", "Door zuur en mousse", "Door kleur", "Door tannine"]', 1, 'Correct: Door zuur en mousse'),
  ('pairing-sparkling', 'mousserend-en-kaas', 2, 'Wat vraagt vet?', '["Bitter", "Zuur", "Zoet", "Tannine"]', 1, 'Correct: Zuur'),
  ('pairing-sparkling', 'mousserend-en-kaas', 3, 'Welke kaas past goed bij Demi-Sec?', '["Geitenkaas", "Blauwschimmel", "Mozzarella", "Feta"]', 1, 'Correct: Blauwschimmel'),
  ('pairing-sparkling', 'mousserend-en-kaas', 4, 'Wat is belangrijk?', '["Temperatuur", "Intensiteit", "Kleur", "Leeftijd"]', 1, 'Correct: Intensiteit'),
  ('pairing-sparkling', 'mousserend-en-kaas', 5, 'Comté past klassiek bij:', '["Prosecco", "Champagne", "Rosé", "Port"]', 1, 'Correct: Champagne'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 1, 'Wat maakt mousserend breed inzetbaar?', '["Alleen alcohol", "Zuur en mousse", "Alleen suiker", "Alleen druif"]', 1, 'Correct: Zuur en mousse'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 2, 'Wat past goed bij risotto?', '["Champagne", "Port", "Madeira", "Sherry"]', 0, 'Correct: Champagne'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 3, 'Wat is cruciaal?', '["Etiket", "Stijlkeuze", "Flesvorm", "Leeftijd"]', 1, 'Correct: Stijlkeuze'),
  ('examen-sparkling', 'champagne-vs-cava-blind', 1, 'Welke methode gebruiken zowel Champagne als Cava?', '["Charmat", "Traditionele methode", "Transfer", "Pet-Nat"]', 1, 'Correct: Traditionele methode'),
  ('examen-sparkling', 'champagne-vs-cava-blind', 2, 'Wat is vaak een herkenningspunt van Champagne?', '["Meer krijt/mineraliteit", "Meer zoetheid", "Meer tannine", "Meer kleur"]', 0, 'Correct: Meer krijt/mineraliteit'),
  ('examen-sparkling', 'champagne-vs-cava-blind', 3, 'Welke stijl heeft vaak rijper fruit?', '["Champagne", "Cava", "Sekt", "Crémant"]', 1, 'Correct: Cava'),
  ('examen-sparkling', 'champagne-vs-cava-blind', 4, 'Wat helpt sterk bij blind onderscheid?', '["Etiket", "Moussekwaliteit", "Prijs", "Flesvorm"]', 1, 'Correct: Moussekwaliteit'),
  ('examen-sparkling', 'champagne-vs-cava-blind', 5, 'Wat is belangrijker dan “goed raden”?', '["Snel drinken", "Logisch analyseren", "Prijs kennen", "Producent herkennen"]', 1, 'Correct: Logisch analyseren'),
  ('examen-sparkling', 'traditioneel-vs-tank-blind', 1, 'Wat wijst op traditionele methode?', '["Brioche", "Peer", "Lychee", "Druivensap"]', 0, 'Correct: Brioche'),
  ('examen-sparkling', 'traditioneel-vs-tank-blind', 2, 'Wat is vaak fruitiger?', '["Tankmethode", "Traditioneel", "Vintage", "Rosé"]', 0, 'Correct: Tankmethode'),
  ('examen-sparkling', 'traditioneel-vs-tank-blind', 3, 'Wat is autolyse?', '["Rijping op gistcellen", "Filtering", "Koeling", "Persing"]', 0, 'Correct: Rijping op gistcellen'),
  ('examen-sparkling', 'traditioneel-vs-tank-blind', 4, 'Welke stijl is meestal tank?', '["Champagne", "Prosecco", "Cava", "Crémant"]', 1, 'Correct: Prosecco'),
  ('examen-sparkling', 'traditioneel-vs-tank-blind', 5, 'Wat helpt bij blindproeven?', '["Etiket", "Structuur", "Prijs", "Producent"]', 1, 'Correct: Structuur')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
