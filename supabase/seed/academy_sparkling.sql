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
    'Mousserende wijn onderscheidt zich door één structureel element: opgelost koolzuurgas. Waar stille wijn CO₂ tijdens de eerste gisting laat ontsnappen, houdt mousserend dat gas vast — en daarmee ontstaat druk als actieve smaakcomponent, niet alleen als schuim op het oppervlak.

Die druk is geen detail op het etiket. In een klassieke fles Champagne ligt ze vaak rond 5 à 6 bar — vergelijkbaar met drie keer de bandenspanning van een personenauto. Die spanning voel je in de mond als prikkeling, lift en textuur. Daarom proef je mousserend anders dan stille wijn, zelfs bij dezelfde druiven en hetzelfde zuurgehalte.

Het gas komt in de meeste kwaliteitsstijlen uit een tweede gisting: suiker wordt omgezet, CO₂ wordt opgesloten en lost op in de wijn. Wat je in het glas ziet — de mousse — is het zichtbare gevolg van productiemethode, druk en rijping. Fijne, langzame bubbels die van de wand opstijgen wijzen meestal op zorgvuldigere productie; grove, snel verdwijnende schuim wijst vaker op lagere druk of tankmethode zonder lange gistcontact.

Voor service betekent dit: mousserend beoordeel je nooit alleen op smaak, maar op drie lagen tegelijk — zuur als ruggengraat, druk als structuur en mousse als textuur. Wie die drie apart leest, kan beter uitleggen waarom de ene fles als aperitief wint en de andere als gastronomische partner.


## Food pairing

### Beste pairing

Oesters nature, sashimi met citroen en licht gezouten amuse-bouche.

### Waarom dit werkt

Hoge zuren en fijne mousse snijden door zout en vet zonder het gerecht te domineren; de druk reinigt het gehemelte zodat minerale en umami-tonen scherper blijven.

### Vermijd

Zware roomsaus of zoete barbecuesaus — die verdoezelen fijne mousse en maken zuur hard in plaats van verfrissend.

## Pro insight

Lees het etiket in drie seconden — herkomst, methode en dosage — vóórdat je een aanbeveling doet; die volgorde voorkomt dat je een gast per ongeluk een tankwijn als ''Champagne-light'' verkoopt en achteraf een prijsklacht krijgt. Verwachtingsmanagement begint hier: noem het woord ''mousserend'' eerst, de regio pas daarna, zodat de gast op smaak kiest in plaats van op naam.',
    '- mousse
- CO₂
- druk
- tweede gisting
- methode-hypothese
',
    'De druk in een fles mousserende wijn ligt doorgaans rond 5 à 6 bar — ongeveer drie keer de bandenspanning van een personenauto — waardoor service en glaswerk nooit een esthetische keuze zijn, maar altijd ook een veiligheidskwestie.
',
    '- Mousserende wijn bevat opgelost CO₂ dat druk en mousse creëert
- Bubbels ontstaan meestal via een tweede gisting met opgesloten gas
- Druk is een structurele smaakcomponent, niet alleen schuim
- Productiemethode bepaalt fijnheid, persistentie en kwaliteitsniveau van de mousse
- Proeven en adviseren vraagt zuur, druk en textuur tegelijk te lezen
',
    '### Opdracht

Pak een fles mousserende wijn en bestudeer het etiket.

### Checklist

- Ik heb gekeken waar de wijn vandaan komt
- Ik heb gekeken welke methode vermeld staat
- Ik heb gekeken hoeveel alcohol de wijn bevat
- Ik heb gekeken of het een brut, extra brut of andere stijl is


### Reflectievraag

Welk element op het etiket — herkomst, methode of dosage — zou jij als eerste aan een collega uitleggen om verwachtingen over mousse en frisheid te sturen?',
    8,
    1
  ),
  (
    'hoe-ontstaan-bubbels',
    'Hoe ontstaan bubbels?',
    'Na deze les begrijp jij hoe bubbels ontstaan en waarom natuurlijke mousse belangrijk is.
',
    'Bubbels zijn geen decoratie — ze zijn het zichtbare bewijs van opgelost CO₂ onder druk. Tijdens gisting zet gist suiker om in alcohol en koolzuur; bij stille wijn ontsnapt dat gas, bij mousserend blijft het gevangen in fles of tank tot het in de wijn oplost.

Waarom proef je dat verschil meteen? Opgelost gas verandert mondgevoel: meer lift, meer prikkeling, meer textuur. Bij het openen daalt de druk plots; CO₂ komt vrij en vormt kernen op oneffenheden in glas en vloeistof. Hoe fijner die kernen en hoe langzamer de opstijging, hoe eleganter de mousse overkomt — onafhankelijk van het aroma zelf.

De productieroute bepaalt het bubbelbeeld. Traditionele flesgisting met lang contact op de gist levert meestal fijnere, persistentere mousse dan snelle tankgisting. Dat is nog geen kwaliteitsoordeel op smaak, wel op textuur en verwachting in service: tankwijnen schenk je vaker jong en fris; fleswijnen tolereerden doorgaans meer gastronomische pairing.

Autolyse — rijping op dode gistcellen — voegt in latere modules aroma toe (brioche, toast). In deze les volstaat de kern: bubbels vertellen je hoe het gas is gevangen en vrijgekomen. Lees mousse daarom als eerste diagnostisch signaal, vóór je naar fruit of dosage kijkt.


## Food pairing

### Beste pairing

Krokante gougères, tempura of licht gefrituurd hapje met zeezout.

### Waarom dit werkt

Fijne mousse en hoge zuren snijden door vet en geven contrast op krokantheid; de druk houdt het gehemelte fris tussen happen door.

### Vermijd

Zwaar gebakken of zoet gefrituurd gerecht — grove mousse verdient dan niet mee en zuur voelt scherp in plaats van schoon.

## Pro insight

Schenk één glas rustig en observeer 30 seconden de wand: een fijne, gelijkmatige perlage is een gratis kwaliteitsargument dat je zonder woorden kunt tonen aan een twijfelende gast. Gebruik dat moment bewust vóór je over prijs praat — wie eerst ziet dat een wijn werkt, accepteert de prijs daarna makkelijker.',
    '- gisting
- CO₂
- autolyse
- mousse
- gist
',
    'Autolyse-integratie verloopt niet lineair: de eerste twaalf maanden op gist leveren doorgaans de grootste smaakwinst, daarna vertraagt de complexiteitsopbouw merkbaar — een nuttig argument om jonge non-vintage niet zomaar als onvolwassen af te schrijven.
',
    '- Gisting produceert CO₂; bij mousserend blijft dat gas opgelost onder druk
- Bubbels worden zichtbaar wanneer druk daalt bij openen en schenken
- Fijnheid en persistentie van mousse wijzen op productieroute en drukbeheer
- Mousse is een textuurdiagnose, los van aroma en suiker
- In service: eerst mousse lezen, daarna smaak en stijl duiden
',
    '### Opdracht

Open een mousserende wijn en observeer de bubbels.

### Checklist

- Ik heb gekeken hoe snel de bubbels opstijgen
- Ik heb gekeken hoe lang ze blijven
- Ik heb de grootte beoordeeld


### Reflectievraag

Welk signaal in de mousse — snelheid, fijnheid of persistentie — vertelt jou het snelst of de wijn waarschijnlijk fles- of tankgisting is?',
    8,
    2
  ),
  (
    'waarom-is-mousserend-uniek',
    'Waarom is mousserend uniek?',
    'Na deze les kun jij uitleggen waarom mousserende wijn zo breed inzetbaar is.
',
    'Mousserend wint zijn plaats op de kaart niet door één smaak, maar door drie gelijktijdige functies: zuur als ruggengraat, druk als structuur en mousse als textuur. Die combinatie bestaat in geen enkele stille wijn in dezelfde vorm — en verklaart waarom dezelfde fles zowel als aperitief als als maaltijdwijn kan werken.

Waarom is dat relevant voor advies? Hoge zuren geven frisheid en snijden door vet; druk verhoogt spanning en houdt het gehemelte actief; mousse voegt volume toe zonder zwaarte. Samen creëren ze een “reinigend” effect tussen happen — ideaal bij zout, vet, umami en romige texturen. Daarom past mousserend breder dan veel gasten verwachten, mits je dosage en body meeneemt.

Hoe proef je die veelzijdigheid? Eerst zuur en mousse apart, daarna integratie op het middenpalet. Een brut met fijne mousse voelt gastronomisch strak; een demi-sec met zachte mousse voelt meer dessertgericht. Verwar textuur niet met zoetheid: een droge wijn kan romig aanvoelen door mousse alleen.

Wanneer zet je het in? Als aperitief wint mousserend op verfrissing en verwachtingsmanagement; aan tafel wint het op contrast en herhaalbaarheid over meerdere gangen. De fout in service is mousserend te beperken tot feest of dessert — juist de pairingbreedte is de commerciële kracht.


## Food pairing

### Beste pairing

Friet met zeezout, sashimi met sojasaus of geitenkaas met honing en noten.

### Waarom dit werkt

Zuur snijdt door vet en zout; mousse en druk resetten het gehemelte zodat umami en romigheid niet verzwaren.

### Vermijd

Zoet-dessert met droge brut zonder compensatie — restsuiker in het gerecht maakt zuur hard en de wijn uit balans.

## Pro insight

Vraag niet ''wilt u Champagne erbij'', maar ''zoekt u iets dat de hele maaltijd meegaat of net het begin opent'' — die vraag stuurt dosage, methode en prijsklasse zonder de gast in een regio te duwen. Mousserend is het enige wijntype dat je zo breed kunt positioneren; gebruik dat actief om couverts te verhogen in plaats van het tot aperitief te beperken.',
    '- zuur
- mousse
- textuur
- frisheid
- moussepersistentie
',
    'Koolzuur werkt als actieve reiniger op het palet: het is de enige smaakdrager in wijn die fysiek vet en residu van de tong spoelt, wat verklaart waarom mousserend zo breed inzetbaar is bij vette of zoute gerechten.
',
    '- Zuur, druk en mousse werken tegelijk — dat maakt de stijl uniek
- Mousse reinigt het gehemelte en vergroot pairingbereik bij vet en zout
- Textuur en zoetheid zijn los te lezen; dosage bepaalt het gastronomische venster
- Aperitief en maaltijdwijn zijn twee service-modi van dezelfde technologie
- Adviseren vraagt context (gerecht, moment, verwachting) vóór stijlkeuze
',
    '### Opdracht

Bedenk drie gerechten waarbij mousserend goed zou passen.

### Checklist

- Ik heb drie gerechten gekozen
- Ik heb gekeken naar vet, zout of zuur
- Ik heb nagedacht over contrast


### Reflectievraag

Bij welk van je drie gerechten draait de match vooral op zuur-mousse-contrast — en waar zou verkeerde dosage die logica breken?',
    8,
    3
  ),
  (
    'geschiedenis-mousserende-wijn',
    'Geschiedenis van mousserende wijn',
    'Na deze les begrijp jij hoe mousserende wijn zich heeft ontwikkeld.
',
    'De geschiedenis van mousserend leest als een ommekeer in perceptie: wat eerst als productiefout gold, werd de benchmark van luxe. In koude kelders stopte gisting in de winter; bij warmte startte fermentatie opnieuw — spontane tweede gisting bouwde druk op tot flessen barsten. Vroegere producenten spraken van “de duivelswijn”; vandaag is diezelfde druk het kernmerk van kwaliteit.

Waarom mattert dit voor professionals? Omdat Champagne niet “toevallig beroemd” werd, maar doordat regio en makers de druk geleerd beheersen: selectie van druiven, blend, flesrijping, riddling, dégorgement. Die keten maakte mousserend reproduceerbaar en verkoopbaar als premium product — niet als curiositeit.

Hoe gebruik je dit in service? Het verhaal verklaart waarom methode en tijd prijs rechtvaardigen: traditionele flesgisting kost kelder, arbeid en risico. Dat helpt gasten begrijpen waarom Cava, Franciacorta of grower-Champagne andere proposities zijn dan tank-Prosecco — zonder elkaar weg te concurreren.

Wanneer pas je het toe? Bij upsell van aperitief naar gastronomische fles, bij collectieverhalen en bij het temperen van verwachtingen: mousserend is geen moderne marketingtruc, maar eeuwenoude druktechnologie die pas laat tot luxe werd verheven.


## Food pairing

### Beste pairing

Klassieke oesterbar, kleine choucroute of luxe amuse met boter en kaviaar.

### Waarom dit werkt

Het “feestelijke” verhaal van mousserend sluit aan bij zout, vet en ceremonie; fijne mousse en zuur houden rijke hapjes elegant in plaats van zwaar.

### Vermijd

Casual fastfood zonder serveerritus — het verhaal en de textuur verliezen dan hun premium context.

## Pro insight

Gebruik geschiedenis nooit als opsomming van jaartallen, maar als één herkadering: ''dit was ooit een productiefout, nu is het premium textuur.'' Die framing werkt psychologisch sterker dan een prijsargument, omdat de gast het gevoel krijgt iets te begrijpen dat de meeste mensen niet weten — en dat rechtvaardigt vanzelf een hogere prijsacceptatie.',
    '- Champagne
- tweede gisting
- drukbeheersing
- prestigepositionering
- methode-evolutie
',
    'De vroege angst voor ongecontroleerde tweede gisting in zwakke flessen verdween pas toen glasproductie en drukbeheersing verbeterden — daarna werd bubbels een bewust verkoopargument in plaats van een productierisico.
',
    '- Bubbels waren ooit ongewenst; druk was een productierisico
- Spontane tweede gisting legde de basis voor bewuste mousserende productie
- Champagne professionaliseerde drukbeheer en kelderdiscipline
- Luxe-imago volgt uit methode, tijd en consistentie — niet uit alleen regio
- Het historische kader helpt gasten prijs, methode en verwachting te verbinden
',
    '### Opdracht

Onderzoek de geschiedenis van mousserende wijn en Champagne.

### Checklist

- Ik heb gekeken naar spontane tweede gisting
- Ik heb gekeken naar de rol van Champagne
- Ik heb gekeken naar historische productiefouten


### Reflectievraag

Welk historisch detail — barstende flessen, winterrust of kelderdiscipline — gebruik jij het liefst om een gast te laten begrijpen waarom flesgisting tijd en prijs kost?',
    8,
    4
  ),
  (
    'belangrijkste-categorieen',
    'Belangrijkste categorieën',
    'Na deze les herken jij de belangrijkste mousserende wijncategorieën.
',
    'De wereld van mousserend is geen kopie van Champagne — het is een spectrum van methodes, druiven en prijsniveaus. Champagne (Frankrijk) is het referentiepunt voor traditionele flesgisting en lange autolyse; Cava (Spanje) volgt vaak dezelfde methode met andere druiven en rijpingsnormen; Prosecco (Italië) domineert in tankgisting met nadruk op fruit en directe verkoop.

Crémant dekt Franse mousserend buiten Champagne; Franciacorta positioneert Italië op fleskwaliteit; Sekt en English Sparkling tonen dat koel klimaat en fijne zuren wereldwijd competitief zijn. Waarom deze indeling cruciaal is: methode bepaalt mousse en prijs vóór regio het verhaal vertelt. Tankwijn levert vaak toegankelijke aperitiefstijl; fleswijn levert gastronomische diepte en celpotential.

Hoe proef je het verschil in de praktijk? Vergelijk niet “welke het lekkerst is”, maar welke textuur en zuurlijn je nodig hebt: Prosecco voor volume en feest, Cava voor waarde met fijne mousse, Champagne of Franciacorta voor lange autolyse en schaal aan tafel. English Sparkling wint steeds vaker blind door zuren en fijne bubbels — geen niche meer.

Wanneer adviseer je wat? Aperitief en hoge rotatie: tankstijlen. Gastronomische lunch of pairingmenu: flesmethodes met lagere dosage. Collectie of prestige: regio’s met strenge rijpingsregels. Zo blijft Champagne referentie zonder dat elke andere stijl “minder” voelt — alleen anders ingezet.


## Food pairing

### Beste pairing

Drie-gangen vergelijking: Prosecco bij aperitief, Cava bij tapas, Champagne of Franciacorta bij hoofdgang met vis of gevogelte.

### Waarom dit werkt

Tankstijl wint op toegankelijkheid en fruit; flesstijl wint op textuur, autolyse en spanning over langere maaltijd — zo ervaart de gast het methodeverschil direct.

### Vermijd

Alleen regio benoemen zonder gerecht — dan koopt de gast merk in plaats van functie.

## Pro insight

Bouw je kaart in drie functionele slots — aperitief/feest, waarde+finesse, gastronomisch+rijp — in plaats van een landenlijst. Dat voorkomt dat een gast Cava afschrijft als goedkoop alternatief: je verkoopt een moment en een stijl, niet een nationaliteit, en dat verhoogt de gemiddelde besteding per fles.',
    '- Champagne
- Cava
- Prosecco
- Franciacorta
- Sekt
',
    'Elke mousserende categorie communiceert impliciet een prijsverwachting: zodra een gast ''Cava'' of ''Crémant'' hoort, ligt het prijsanker al lager dan bij ''Champagne'' — ook als de kwaliteit in het glas vergelijkbaar is.
',
    '- Wereldstijlen verschillen vooral in productiemethode, niet alleen in land
- Champagne en Cava: flesgisting; Prosecco: vooral tank — ander mousseprofiel
- Crémant, Franciacorta, Sekt en English Sparkling vullen prijs en stijl in
- Advies start bij moment (aperitief vs gastronomisch), daarna methode en dosage
- Geen enkele categorie is Champagne-light; elke heeft eigen servicepositie
',
    '### Opdracht

Zoek drie verschillende mousserende stijlen online.

### Checklist

- Ik heb drie landen gevonden
- Ik heb gekeken naar productiemethode
- Ik heb gekeken naar prijsniveau


### Reflectievraag

Welke van de drie stijlen die je vond past het best bij aperitiefrotatie — en welke bij een gastronomische pairingwaarde, ongeacht het land op het etiket?',
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
    'De méthode traditionnelle is het productiekader achter de meeste premium flessen: tweede gisting op fles, lang gistcontact en gecontroleerd dégorgement. Waarom investeren producenten hier tijd en kelder in? Omdat druk, autolyse en rijping samen textuur en complexiteit opbouwen die tankprocessen zelden evenaren.

De keten start met een droge basiswijn. Liqueur de tirage — suiker plus gisten — start de tweede gisting in een hermetisch gesloten fles; CO₂ kan niet ontsnappen en lost op. Maanden tot jaren contact met de dode gist (autolyse) bouwt secundaire aroma’s op: brioche, toast, noten. Dat is geen “extra smaakje”, maar structurele diepte die gastronomische pairing verlengt.

Hoe proef je het verschil? Fijne, persistente mousse, geïntegreerde zuurlijn en lagen naast primair fruit. Dégorgement verwijdert de gistplug en maakt de wijn helder; daarna volgt dosage (volgende les) voor balans. In blindproef wijst lang autolyse-contact vaker op traditionele flesgisting dan op tank.

Wanneer adviseer je traditioneel? Bij gastronomische service, langzame aperitiefmomenten en pairing met schaal, gevogelte of romige vis — waar textuur en lengte de marge rechtvaardigen. Champagne, Cava, Crémant en Franciacorta delen de methode; regio en rijpingsnorm bepalen het prijsniveau, niet het principe.


## Food pairing

### Beste pairing

Gegrilde zeebaars met botersaus, kalfszwezerik of oude Comté.

### Waarom dit werkt

Autolyse en fijne mousse geven romige textuur zonder zwaarte; zuur en druk snijden door vet en houden mineraliteit levend naast rijke gerechten.

### Vermijd

Zoet fruitdessert met brut traditionnel — restsuiker in het gerecht maakt zuur hard zonder dosage-compensatie.

## Pro insight

Vergelijk in interne training twee flessen op prijs in plaats van op land: een rijpe Cava traditionnelle wint blind regelmatig van een jonge non-vintage Champagne op mousse-integratie. Gebruik die ervaring om je team prijspsychologisch te wapenen, zodat ze met overtuiging verkopen in plaats van met excuses wanneer een gast naar iets goedkoper dan Champagne vraagt.',
    '- traditionele methode
- autolyse
- tirage
- dégorgement
- Champagne
',
    'De wettelijke minimumrijping van 15 maanden is een ondergrens, geen kwaliteitsdoel: de meeste premium huizen rijpen drie tot vijf keer langer, omdat autolyse-integratie pas na maanden echt versnelt.
',
    '- Tweede gisting op fles met liqueur de tirage creëert druk en basis voor autolyse
- Lang gistcontact bouwt brioche-, toast- en notentonen naast fruit
- Dégorgement maakt de wijn helder en sluit het flesproces af
- Traditionele methode is kwaliteitsdriver voor mousse, lengte en gastronomische inzet
- Advies: flesgisting wanneer textuur en complexiteit de pairing dragen
',
    '### Opdracht

Zoek drie mousserende wijnen die deze methode gebruiken.

### Checklist

- Ik heb drie voorbeelden gevonden
- Ik heb het land bekeken
- Ik heb het prijsniveau bekeken


### Reflectievraag

Welk sensorisch signaal — mousse, autolyse-aroma of lengte — gebruik jij om een gast uit te leggen waarom flesgisting meer kost dan tank?',
    10,
    1
  ),
  (
    'charmat-tankmethode',
    'Charmat / Tankmethode',
    'Na deze les begrijp jij hoe de Charmatmethode werkt en waarom deze anders is.
',
    'Charmat — tankmethode — kiest snelheid en fruitbehoud boven kelderlange autolyse. De tweede gisting gebeurt in een drukvat; na gistwerk wordt de wijn gefilterd en gebotteld onder druk. Waarom bestaat deze route naast flesgisting? Omdat volume, frisheid en prijs in veel markten belangrijker zijn dan celpotential.

Het sensorische profiel volgt de logica: korter gistcontact betekent minder brioche en toast, meer primair fruit en directe toegankelijkheid. Mousse is vaak grover en korter van adem dan bij traditionele flessen — geen kwaliteitsfout, wel een ander servicecontract. Prosecco is het bekendste voorbeeld; de methode past bij jonge consumptie en hoge rotatie.

Hoe proef je tank versus fles? In tankwijnen domineert fruit en zachte mousse vaak boven gelaagdheid; zuur voelt ronder, autolyse-tonen zijn subtieler of afwezig. Blind: fijne lijn van bubbels + broodachtige diepte wijst weg van pure Charmat.

Wanneer zet je Charmat in? Aperitief, feest, spritz-context en eerste fles van de avond — waar verfrissing en herkenbaarheid winnen. Positioneer het niet als “goedkope Champagne”, maar als fruitgedreven mousserend met eigen textuurprofiel.


## Food pairing

### Beste pairing

Aperitief met olijven en citrus, lichte antipasti of perzik-Aperol-spritz bij borrel.

### Waarom dit werkt

Fruitige tankwijnen geven directe frisheid zonder autolyse-zwaarte; lichte zout- en zuurprikkels versterken de mousse zonder gastronomische diepte te eisen.

### Vermijd

Zware truffelgerechten of langzaam braised vlees — daar ontbreekt de structurele lengte die flesgisting levert.

## Pro insight

Schenk Prosecco en andere tankwijnen iets koeler dan flesgegiste Champagne om grovere mousse te maskeren en het primaire fruit scherp te houden. Leg dat verschil uit aan de gast als bewuste stijlkeuze, niet als minderwaardigheid — dat voorkomt dat tankwijn wordt weggezet als goedkope bubbels en behoudt de marge op je huiswijn.',
    '- Charmat
- tank
- Prosecco
- fruitigheid
- tweede gisting
',
    'Charmat is geen ''snelle'' methode omdat ze slechter is, maar omdat de tankdruk gelijkmatiger en groter is dan in een fles — daardoor blijft het primaire fruit van Glera bewaard in plaats van overschaduwd door autolyse.
',
    '- Tweede gisting in gesloten tank; sneller en schaalbaarder dan fleswerk
- Minder autolyse: meer fruit, minder brioche/toast
- Mousseprofiel is vaak directer en minder persistent
- Charmat is service-optimalisatie voor volume en frisse aperitiefstijl
- Advies: tankmethode voor toegankelijkheid, niet voor lange gastronomische arc
',
    '### Opdracht

Vergelijk een Prosecco met een Champagne.

### Checklist

- Ik heb geur vergeleken
- Ik heb mousse vergeleken
- Ik heb smaak vergeleken


### Reflectievraag

Welk verschil in mousse of aroma zou jij in één zin aan een gast uitleggen zonder de tankwijn kleiner te maken?',
    8,
    2
  ),
  (
    'transfermethode',
    'Transfermethode',
    'Na deze les kun jij uitleggen wat de transfermethode is.
',
    'Transfermethode is de hybride tussen flesdiscipline en tankschaal: tweede gisting start op fles — met autolyse-potential — maar na rijping gaat de wijn naar tank voor filtering en her botteling. Waarom kiezen producenten deze middenweg? Efficiëntie bij grote volumes, uniformiteit en lagere arbeidskosten per fles, vooral bij kleinere formaten.

Sensorisch landt transfer meestal tussen traditioneel en Charmat: meer gistcontact dan pure tank, maar minder individueel fleskarakter dan hand-dégorged Champagne. Mousse kan verfijnd zijn, maar de “per fles” identiteit is verzwakt door bulkstap. In blindproef: autolyse-hints zonder de extreme finesse van top flesgisting.

Hoe herken je het commercieel? Minder nadruk op “traditionele methode” op het etiket, vaker bij value-segment of speciale formaten. Proef focus op consistentie en prijs-kwaliteit, niet op collectieverhaal.

Wanneer adviseer je transfer? Bij grote events, horeca met hoge rotatie of wanneer gastronomische diepte nodig is maar budget fles-Champagne niet toelaat — mits je mousse en zuur eerst valideert.


## Food pairing

### Beste pairing

Canapés bij receptie, grote borrel met gevarieerde hapjes of brunch met roerei en gerookte zalm.

### Waarom dit werkt

Consistente mousse en zuur werken over veel hapjes heen; transferwijnen hoeven geen top gastronomische focus te dragen.

### Vermijd

Multi-gangen fine dining waar finesse en lengte het verhaal zijn — daar wint traditionele flesgisting.

## Pro insight

Vraag bij ''traditioneel geproduceerd'' op een etiket altijd door: op fles gedegorgeerd, of via transfer naar tank verplaatst? Dat ene detail bepaalt of de gast echte flesrijpingswaarde krijgt of vooral een marketingterm betaalt — als sommelier bescherm je zo zowel de gast als je eigen geloofwaardigheid bij een volgend advies.',
    '- transfer
- filtering
- efficiëntie
- fles
- tank
',
    'Transfermethode bestaat vooral om grote of onregelmatige flesformaten te kunnen degorgeren zonder elke fles individueel op het riddlingrek te zetten — een logistieke oplossing, geen smaakkeuze.
',
    '- Start als flesgisting; eindigt met tankfiltering en her botteling
- Autolyse-potential blijft deels, individueel fleskarakter vermindert
- Efficiënter en schaalbaarder dan hand-dégorgement
- Sensorisch vaak midden tussen traditioneel en Charmat
- Advies: test mousse en integratie — methode op etiket is hier minder doorslaggevend
',
    '### Opdracht

Vergelijk de transfermethode met de traditionele methode.

### Checklist

- Ik heb het beginproces vergeleken
- Ik heb gekeken waar filtering plaatsvindt
- Ik heb efficiëntie vergeleken


### Reflectievraag

Bij welk service-moment rechtvaardigt transfer volgens jou de compromis op individueel fleskarakter — en wanneer niet?',
    7,
    3
  ),
  (
    'methode-ancestrale',
    'Méthode Ancestrale (Pet-Nat)',
    'Na deze les begrijp jij hoe Pet-Nat ontstaat.
',
    'Méthode ancestrale — Pet-Nat — is de meest minimale route naar mousserend: bottelen tijdens de eerste gisting, zodat restsuiker en gist samen CO₂ produceren in de fles. Geen liqueur de tirage, vaak geen dégorgement, soms geen filtering. Waarom kiezen makers dit? Voor rauwe expressie, laag ingrijpen en verhaal rond natuurwijn — niet voor reproduceerbare finesse.

Het proefprofiel wijkt bewust af: troebelheid mogelijk, druk variabel, fruit vaak primair en “wild”, mousse onregelmatiger. Dosage ontbreekt meestal — balans komt uit druif en timing, niet uit expédition. Dat is geen fout maar een andere categorie: spontaan mousserend in plaats van gecontroleerd mousserend.

Hoe proef je Pet-Nat professioneel? Eerst druk en integratie checken (overcarbonation risico), dan zuur en restsuiker inschatten. Troebelheid is geen defect per se; wel signaal van lees en minimale filtering.

Wanneer serveer je het? Informele settings, natuurwijnpubliek, korte kaartrotatie — koel schenken, verwachting managen (“andere stijl mousserend”). Niet inzetten waar gasten Champagne-finesse verwachten zonder voorbereiding.


## Food pairing

### Beste pairing

Fermierte groenten, lichte charcuterie, geitenkaas of informele borrel met dips.

### Waarom dit werkt

Levendige zuur en ruwe mousse snijden door vet en zout; informele gerechten matchen de informele stijl zonder finesse te eisen.

### Vermijd

Formele oesterbar of luxe tasting menu — context en verwachting botsen met de rauwe stijl.

## Pro insight

Draai de fles rustig en laat hem 30 seconden staan vóór schenken, zodat troebelheid niet onnodig in het glas terechtkomt en de gast schrikt van wat normaal is voor de stijl. Positioneer Pet-Nat vooraf als rauw en authentiek in plaats van als risico — die verwachtingsmanagement-zin voorkomt negatieve eerste indrukken en maakt de stijl makkelijker te verkopen aan een nieuwsgierige gast.',
    '- Pet-Nat
- ancestrale
- natuurwijn
- troebel
- spontane gisting
',
    'Omdat Pet-Nat zonder dosage en vaak zonder filtering wordt gebotteld, varieert elke partij merkbaar in troebelheid en koolzuurniveau — wat het tot de minst voorspelbare maar meest authentieke mousserende stijl maakt.
',
    '- Botteling tijdens eerste gisting; geen klassieke tweede gistingstap
- Vaak geen dégorgement of dosage; troebelheid en variatie zijn normaal
- Mousse en druk zijn minder gestandaardiseerd dan bij traditioneel
- Pet-Nat is expressie- en authenticiteitsdriver, geen finesse-benchmark
- Service vraagt verwachtingsmanagement en temperatuurdiscipline
',
    '### Opdracht

Zoek een Pet-Nat en lees het etiket.

### Checklist

- Ik heb gekeken naar troebelheid
- Ik heb gekeken naar alcohol
- Ik heb gekeken naar druif


### Reflectievraag

Welk risico — druk, troebelheid of restsuiker — check jij eerst vóór je Pet-Nat op een reguliere mousserende kaart zet?',
    8,
    4
  ),
  (
    'dosage-uitgelegd',
    'Dosage uitgelegd',
    'Na deze les kun jij uitleggen wat dosage is en hoe dit de stijl beïnvloedt.
',
    'Dosage is de laatste balancerende handeling bij traditionele flesgisting: na dégorgement vult liqueur d’expédition (wijn, soms suiker) het volume aan en zet de restsuiker. Waarom is dit geen detail? Omdat dezelfde basiswijn met andere dosage voelt als een andere wijn — ronder, rijper of strakker — zonder dat alcohol of druk verandert.

De schaal loopt van Brut Nature (0–3 g/l) tot Demi-Sec (32–50 g/l). Let op de valkuil: “Extra Dry” is zoeter dan Brut — taal en smaak lopen uiteen. Dosage maskeert geen slechte zuur, maar kan scherpte temperen en fruit ronder maken; te veel maakt pairing lineair en dessert-afhankelijk.

Hoe proef je dosage los van zoetheid? Eerst restsuiker inschatten op het einde van de smaak, daarna balans met zuur en mousse. Hoge autolyse + lage dosage geeft strak gastronomisch profiel; lagere autolyse + hogere dosage geeft toegankelijke aperitiefstijl.

Wanneer kies je welke klasse? Brut en Extra Brut voor maaltijd en schaalgerechten; Extra Dry/Demi-Sec voor spicy of zoete elementen; Brut Nature voor puristen en scherpe pairing. Dosage is pairing-instrument — geen suikerlabyrint.


## Food pairing

### Beste pairing

Brut met oesters; Extra Brut met sashimi; Demi-Sec met fruitterrine of pittige Aziatische hapjes.

### Waarom dit werkt

Lagere dosage laat zuur en mineraliteit pairing dragen; hogere dosage vangt spice en fruitzoet op zonder dessertwijn te worden.

### Vermijd

Demi-Sec bij zeer zoute oesters zonder contrapunt — zoetheid en zout botsen zonder gastronomische logica.

## Pro insight

Eén zin volstaat om de meest gemaakte verkoopfout te voorkomen: ''Extra Dry is zoeter dan Brut.'' Gebruik dat moment meteen om door te vragen naar gewenste zoetheid in plaats van alleen het label te benoemen — zo voorkom je een retourfles én open je de deur naar een duurdere, beter passende aanbeveling.',
    '- dosage
- dégorgement
- brut
- restsuiker
- expédition
',
    'Dosagebalans werkt niet lineair met perceptie: een paar gram restsuiker extra kan een wijn van streng naar rond kantelen, terwijl het analytische verschil in het lab nauwelijks meetbaar is.
',
    '- Liqueur d’expédition na dégorgement bepaalt restsuiker en mondgevoel
- Brut Nature tot Demi-Sec: etikettermen zijn niet intuïtief (Extra Dry ≠ droog)
- Dosage balanceert zuur en autolyse; verandert pairingvenster direct
- Restsuiker en waargenomen zoetheid zijn verwant maar niet identiek
- Advies: dosage kiezen op gerecht en moment, niet op gewoonte
',
    '### Opdracht

Bekijk drie flessen en noteer hun dosage.

### Checklist

- Ik heb drie stijlen gevonden
- Ik heb de suikerklasse genoteerd
- Ik heb prijsverschillen bekeken


### Reflectievraag

Welke dosage zou jij kiezen voor een gerecht met subtiele zoetheid (bijv. gemarineerde gamba) — en welk zuur-mousse-signaal bevestigt die keuze?',
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
    'Mousserend proeven vraagt dezelfde discipline als stille wijn — met één extra analyse-as: mousse en druk. Waarom eerst kijken? Omdat bubbelgrootte, opstijging en persistentie je vóór de neus al vertellen welke productieroute waarschijnlijk is, zonder dat je naar het etiket grijpt.

Visueel lees je helderheid, kleur en mousse. Daarna de neus: primair fruit, autolyse (brioche, toast) en eventuele rijping. In de mond scheid je bewust zuur, mousse-textuur, body, dosage-effect en lengte. Dosage voel je niet als “suiker” maar als ronding; mousse niet als “schuim” maar als spanning.

Hoe test je balans? Een wijn met scherp zuur maar grove, korte mousse voelt onafgemaakt; een wijn met zachte mousse maar vlak zuur voelt log. Topmousserend combineert lift, frisheid en een schone afdronk.

Wanneer gebruik je dit protocol? Bij elke servicebeslissing, blindproef en kwaliteitscontrole — vaste volgorde voorkomt dat je te snel naar fruit of merk springt.


## Food pairing

### Beste pairing

Amuse met citroen, zeezout en lichte boter.

### Waarom dit werkt

Het proefprotocol test direct of zuur en mousse het gerecht verfrissen zonder te domineren.

### Vermijd

Zware umami-bouillon als eerste proef — die verdoezelt fijne mousse-details.

## Pro insight

Noteer in service altijd vier woorden na de eerste slok: mousse, zuur, dosage, lengte. Dat vocabulaire is genoeg om team en gast op één lijn te krijgen.',
    '- mousse
- retronasale waarneming
- moussepersistentie
- dosagebalans
- mondgevoelstructuur
',
    'Koolzuur versnelt de afgifte van vluchtige aromastoffen aan het glasoppervlak — daarom ruik je net geschonken mousserende wijn intenser dan vijf minuten later, wanneer de mousse al gedeeltelijk is uitgewerkt.
',
    '- Visuele mousse-analyse gaat vóór aroma en smaak
- Proefprotocol: zuur, mousse, body, dosage-effect, lengte
- Balans = spanning zonder hardheid, textuur zonder zoetheidsmasker
- Druk beïnvloedt hoe aroma''s vrijkomen in neus en mond
- Vaste volgorde maakt service- en blindadvies reproduceerbaar
',
    '### Opdracht

Proef een mousserende wijn volgens deze stappen.

### Checklist

- Ik heb kleur beoordeeld
- Ik heb mousse bekeken
- Ik heb aroma’s benoemd
- Ik heb structuur geanalyseerd


### Reflectievraag

Welke stap in jouw huidige proefroutine sla je het vaakst over — visuele mousse, neus of dosage-inschatting — en welk foutadvies levert dat op?',
    8,
    1
  ),
  (
    'mousse-analyseren',
    'Mousse analyseren',
    'Na deze les kun jij de kwaliteit van mousse beoordelen.
',
    'Mousse-analyse is de snelste kwaliteitsbarometer in mousserend. Waarom? Bubbelgrootte, snelheid en persistentie vertalen direct druk, gistcontact en productiemethode naar textuur — los van fruit of dosage.

Fijne, langzaam opstijgende bubbels wijzen meestal op hogere druk en zorgvuldiger fleswerk; grove, agressieve schuim wijst vaker op tankgisting of te warme service. Persistentie aan de wand na 30 seconden zegt meer over integratie dan de eerste schuimkop.

Hoe vergelijk je twee glazen? Houd temperatuur en glasreinheid gelijk; kijk eerst naar lijn aan de wand, daarna naar mondgevoel. Traditionele methode wint vaak op persistentie; tank wint soms op direct fruit maar verliest op fijnheid.

Wanneer gebruik je mousse als diagnose? Bij blindproef, kwaliteitsklacht (“te plat”) en upsell: fijne mousse rechtvaardigt gastronomische fles beter dan aroma-woorden alleen.


## Food pairing

### Beste pairing

Twee blind geproefde mousserende wijnen bij krokante gougères.

### Waarom dit werkt

Krokant vet test of mousse de afdronk schoon houdt; verschil in persistentie wordt meteen tastbaar.

### Vermijd

Zoet glazuur op het hapje — dat maskeert mousseverschillen.

## Pro insight

Film 20 seconden tegen het licht vóór je ruikt. Gasten die “geen verschil” proeven tussen fles en tank zien vaak wél verschil zodra je de wandlijn benoemt.',
    '- mousse
- perlage
- wandlijn-analyse
- persistentie
- mondgevoel
',
    'Fijne, langzame perlage ontstaat niet toevallig: ze wijst op lange gistcontacttijd en een schoon glas, terwijl grove, snelle bubbels vaker duiden op jonge tankwijn of vetresidu op het glas.
',
    '- Bubbelgrootte, snelheid en persistentie = textuurdiagnose
- Fijne wandlijn wijst op druk en methode; grove schuim op tank of servicefout
- Mousse beïnvloedt mondgevoel los van aroma en restsuiker
- Vergelijk altijd bij gelijke temperatuur en glasreinheid
- Mousse is de eerste blindhint tussen traditioneel en tank
',
    '### Opdracht

Vergelijk twee mousserende wijnen.

### Checklist

- Ik heb bubbelgrootte vergeleken
- Ik heb snelheid vergeleken
- Ik heb duur vergeleken


### Reflectievraag

Welk mousse-signaal — fijnheid, snelheid of persistentie — gebruik jij als eerste om methode te gokken bij blindproef?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les herken jij de belangrijkste aromalagen in mousserende wijn.
',
    'Aromalagen geven mousserend zijn identiteit naast mousse. Primair fruit (appel, peer, citrus, witte bloemen) komt uit de druif; secundaire tonen (brioche, toast, brooddeeg) uit gist en autolyse; tertiair (honing, noten, gedroogd fruit) uit flesrijping. Waarom scheiden? Omdat blindproef meestal draait om secundair versus primair dominantie.

Bij traditionele flesgisting is secundair vaak de differentiator; bij tank domineert primair. Dosage maskeert niet autolyse maar kan rijpere tonen versterken — lees lagen vóór je “zoet” zegt.

Hoe train je herkenning? Eén descriptor per laag, maximaal drie per categorie. Vermijd parfumtaal zonder koppeling aan productie.

Wanneer inzetten? Bij gastadvies (“fris en fruitig” = tank/jong; “toast en noten” = fles/rijper) en bij foutcorrectie wanneer iemand alleen primair fruit benoemt op oude Champagne.


## Food pairing

### Beste pairing

Gerijpte Champagne met brioche-tonen bij gevogelte met room.

### Waarom dit werkt

Secundaire autolyse-echo''s harmoniseren met geroosterde en romige elementen zonder zoetheid.

### Vermijd

Zeer jonge tankwijn met alleen primair fruit — die verliest culinair tegen romige saus.

## Pro insight

Vraag in training: “proef je druif of proef je gist?” Die ene vraag scheidt Explorer van Specialist-blindniveau.',
    '- aroma
- autolyse
- brioche
- fruit
- rijping
',
    'Brioche- en gistnoten in Champagne zijn geen extra smaakje maar het directe gevolg van autolyse-integratie — hoe langer het gistcontact, hoe dominanter die laag wordt over het primaire fruit.
',
    '- Primair = druif; secundair = gist/autolyse; tertiair = flesrijping
- Traditioneel wint vaak op secundaire diepte; tank op primair fruit
- Dosage beïnvloedt waarneming maar vervangt geen autolyse
- Blindhint: brioche/toast wijst weg van pure tankstijl
- Drie lagen apart benoemen voorkomt vage proefnotities
',
    '### Opdracht

Maak een aromalijst bij een mousserende wijn.

### Checklist

- Ik heb primaire aroma’s gevonden
- Ik heb secundaire aroma’s gezocht
- Ik heb tertiaire aroma’s beoordeeld


### Reflectievraag

Bij welke wijn op je lijst verwacht je het sterkste secundaire profiel — en welk productiesignaal onderbouwt dat?',
    9,
    3
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij de structuur van mousserende wijn analyseren.
',
    'Structuur bij mousserend is mondarchitectuur: zuur als ruggengraat, mousse als spanning, body als gewicht, dosage als afronding, lengte als kwaliteitsbewijs. Waarom niet alleen “zoet of droog”? Omdat een brut technisch droog kan aanvoelen als rond door mousse alleen.

Zuur geeft richting en pairing-snijkracht; mousse geeft textuur en gehemelte-activiteit; body bepaalt of de wijn gastronomisch kan dragen; dosage tempert scherpte; lengte toont integratie. Technisch correct zonder balans voelt kort of plakkerig.

Hoe evalueer je? Score elk element 1–5, zoek de zwakste schakel. Zwak zuur + hoge dosage = snel vermoeiend; sterk zuur + fijne mousse + lage dosage = gastronomische motor.

Wanneer gebruik je structuuranalyse? Bij maaltijdwijnkeuze, retouranalyse (“te zuur”) en blindconclusies — structuur wint van merknaam.


## Food pairing

### Beste pairing

Brut met hoge zuurlijn bij citroen-geglazuurd visgerecht.

### Waarom dit werkt

Zuur en mousse dragen het gerecht; body en lengte bepalen of de wijn overleeft zonder hard te worden.

### Vermijd

Demi-Sec bij hetzelfde gerecht zonder zoet element — balans kantelt.

## Pro insight

Bij klacht “te scherp”: check temperatuur en dosage vóór je een zoetere fles adviseert — te koude brut voelt vaak agressiever dan de wijn is.',
    '- structuur
- zuur
- dosage
- lengte
- body
',
    'Structuur weegt zwaarder dan zoetheid in de perceptie van kwaliteit: een droge wijn met fijne mousse en lang zuur voelt vaak rijker aan dan een zoetere wijn met grove bubbels.
',
    '- Structuur = zuur + mousse + body + dosage-effect + lengte
- Mousse is textuur; dosage is afronding — niet verwarren
- Lengte wijst op integratie en kwaliteit van basiswijn
- Balans betekent geen dominante schakel
- Structuurschema maakt retouren en pairing objectief
',
    '### Opdracht

Proef een mousserende wijn en beoordeel de structuur.

### Checklist

- Ik heb zuur beoordeeld
- Ik heb mousse beoordeeld
- Ik heb body benoemd
- Ik heb lengte beoordeeld


### Reflectievraag

In je laatste proefnotitie: welk structuurelement droeg de wijn, en welke schakel beperkte de gastronomische inzet?',
    8,
    4
  ),
  (
    'mini-toets-explorer',
    'Mini-toets Explorer',
    'Testen of jij de basis van mousserend begrijpt.
',
    'Deze mini-toets integreert fundamente, productie en proeftechniek. Waarom blind twee glazen? Omdat mousse, autolyse en structuur pas echt scoren wanneer je methode moet afleiden zonder etiket — precies het moment waar Explorer overgaat in Specialist-denken.

Je toetst: bubbelkwaliteit en persistentie; aromadominantie (primair vs secundair); balans van zuur, dosage en lengte; hypothese over traditioneel, tank, transfer of ancestrale productie. Documenteer hypothese vóór de onthulling — dat traint professionele calibratie.

Hoe bereid je je voor? Vaste volgorde visueel → neus → mond; noteer één tegenargument bij je conclusie. Fouten zitten meestal in temperatuur, glas of te snelle methode-gok.

Wanneer herhaal je deze toets? Maandelijks met twee willekeurige flessen uit je voorraad — zo bouw je een persoonlijke referentiebibliotheek op.


## Food pairing

### Beste pairing

Neutraal palate cleanser (water, ongezouten crackertje) tussen proeven.

### Waarom dit werkt

Blind protocol vraagt een schoon palet; food pairing zou aroma-hypotheses vertekenen.

### Vermijd

Zout, umami of vet vóór of tijdens de blindronde.

## Pro insight

Leg na elke blindronde je topfout vast in één zin (“te veel naar fruit, te weinig naar mousse”). Dat versnelt leren meer dan tien perfecte proeven zonder reflectie.',
    '- blindproeven
- mousse
- methode-hypothese
- aromaherkenning
- structuuranalyse
',
    'Een mini-toets test niet je geheugen van losse feiten, maar of je een waarneming — mousse, zuur, aroma — kunt koppelen aan de juiste productiemethode; precies die vertaalslag maak je aan tafel ook.
',
    '- Mini-toets integreert fundamente, productie en blind protocol
- Mousse, aroma en structuur sturen methode-hypothese
- Documenteer vóór onthulling voor professionele calibratie
- Maandelijks herhalen bouwt referentiebibliotheek op
- Praktijkgerichte Explorer-afsluiting zonder MC-quiz
',
    '### Opdracht

Proef blind twee mousserende wijnen.

### Checklist

- Ik heb de mousse beoordeeld
- Ik heb aroma’s beschreven
- Ik heb structuur beoordeeld
- Ik heb productiemethode geschat


### Reflectievraag

Welke ene observatie — mousse, autolyse of structuur — had je methode-hypothese het sterkst moeten sturen?',
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
    'Champagne is niet alleen een merk maar een koel-klimaat systeem: hoge zuren behouden, alcohol gematigd, druk en autolyse als kwaliteitsmotor. Waarom subregio''s matteren? Omdat druivenbalans per helling verschilt en blenders daarop sturen.

Montagne de Reims levert vaak Pinot Noir-structuur; Côte des Blancs Chardonnay-finesse en krijtmineraliteit; Vallée de la Marne Meunier-ronding; Côte des Bar rijper Pinot met meer body. Krijt slaat water op en geeft spanning in de wijn — terroir als zuurbuffer.

Hoe proef je terroir? Mineraliteit en zuurlijn versus rijp fruit; niet “welke dorp” maar welke bouwsteen domineert in de blend.

Wanneer gebruik je regiokennis? Bij upsell naar Blanc de Blancs (Côte des Blancs-logica), bij gastronomische pairing en bij blind-Champagne versus warmere wereldstijlen.


## Food pairing

### Beste pairing

Blanc de Blancs uit Côte des Blancs-logica bij oesters of zachte schaal.

### Waarom dit werkt

Krijtmineraliteit en strakke zuur versterken zout en umami zonder zwoele mousse.

### Vermijd

Zoete Demi-Sec bij oesters — klassieke mismatch op dosage.

## Pro insight

Verkoop Champagne niet als ''regio met 34.000 hectare'' maar als ''koude-klimaat zuurmachine die nergens anders zo precies repliceerbaar is.'' Die ene zin verbindt terroir direct aan smaak en geeft de gast een concreet argument om de hogere prijs te accepteren, in plaats van een geografisch feitje te onthouden.',
    '- Champagne
- terroir
- krijt
- regio
- subregio
',
    'Krijtbodem in de Champagne werkt als natuurlijke waterbuffer: hij houdt vocht vast in droge periodes en draineert overtollig water snel, wat de wijnstok onder constante, milde stress houdt — een sleutelfactor voor de signatuurzuurgraad.
',
    '- Koel klimaat = hoge zuren, essentieel voor mousserend
- Vier subregio''s leveren verschillende blend-bouwstenen
- Krijt ondersteunt spanning en mineraliteit
- Terroir lees je via zuur/mineraal versus rijp fruit
- Regiokennis ondersteunt advies, geen elitaire opsomming
',
    '### Opdracht

Zoek een Champagnekaart en markeer de vier subregio’s.

### Checklist

- Ik heb alle vier gevonden
- Ik heb de druiven per regio bekeken
- Ik heb klimaatverschillen onderzocht


### Reflectievraag

Welke subregio-bouwsteen — Pinot-structuur, Chardonnay-finesse of Meunier-ronding — past het best bij je huidige food pairing-kaart?',
    10,
    1
  ),
  (
    'druiven-van-champagne',
    'Druiven van Champagne',
    'Na deze les herken jij de drie belangrijkste Champagne-druiven.
',
    'Champagne is blend-architectuur met drie druiven. Chardonnay levert spanning, citrus en mineraliteit; Pinot Noir body, structuur en rood fruit; Meunier fruitigheid, toegankelijkheid en zachte afronding. Waarom bijna altijd blend? Omdat één druif zelden alle service-momenten dekt.

Hoe proef je de blend? Chardonnay-dominant = strakker en gastronomischer; Pinot-dominant = voller en rijper op het middenpalet; Meunier-dominant = directer en feestelijker. Percentages op het etiket zijn zeldzaam — leer de signatuur van het huis.

Wanneer kies je welke bouwsteen? Aperitief met finesse: meer Chardonnay; maaltijd met romige saus: meer Pinot; hoge rotatie borrel: Meunier-ronding kan converteren.


## Food pairing

### Beste pairing

Pinot-dominante NV bij gevogelte met jus; Chardonnay-dominant bij sashimi.

### Waarom dit werkt

Structuur volgt druif: Pinot draagt umami en vet; Chardonnay snijdt en verfrist.

### Vermijd

Meunier-zware blend bij zeer delicate vis zonder saus — te rond, te weinig snijkracht.

## Pro insight

Vraag een producent niet ''welke druiven gebruikt u'', maar ''wie bepaalt vandaag de blendarchitectuur voor uw gastronomische cuvée''. Dat geeft je bruikbare verkooptaal aan tafel: je kunt uitleggen waarom een fles meer body of meer finesse heeft, en dat verschil rechtvaardigt prijsverschillen tussen huizen beter dan een druivenlijstje.',
    '- Chardonnay
- Pinot Noir
- Meunier
- blendarchitectuur
- assemblagelogica
',
    'Chardonnay, Pinot Noir en Meunier spelen elk een andere structurele rol in de blend: Chardonnay levert finesse en bewaarpotentieel, Pinot Noir lichaam en kracht, Meunier vroege toegankelijkheid — blendarchitectuur is een bewuste rolverdeling, geen willekeurige mix.
',
    '- Chardonnay = spanning; Pinot Noir = structuur; Meunier = toegankelijk fruit
- Blends balanceren frisheid, body en huisstijl
- Dominantie proef je via zuurlijn versus middenpalet
- Druifkeuze is service-instrument, geen trivia
- Huisstijl begrijpen wint van percentage-obsessie
',
    '### Opdracht

Zoek drie Champagnes en noteer de blend.

### Checklist

- Ik heb druiven bekeken
- Ik heb percentages genoteerd
- Ik heb stijlverschillen gezien


### Reflectievraag

Welke druif mis je het vaakst in je eigen proefnotities bij Champagne — en hoe vervormt dat je advies?',
    8,
    2
  ),
  (
    'blanc-de-blancs-vs-blanc-de-noirs',
    'Blanc de Blancs vs Blanc de Noirs',
    'Na deze les begrijp jij het verschil tussen deze twee belangrijke stijlen.
',
    'Blanc de Blancs (wit van wit) en Blanc de Noirs (wit van zwart) zijn stijlcontracten, geen marketinglabels. BdB — meestal Chardonnay — levert strakheid, mineraliteit en elegante mousse; ideaal voor finesse-pairing. BdN — Pinot en/of Meunier zonder kleur — levert body, rijper fruit en gastronomische breedte.

Waarom belangrijk voor blind? BdB voelt lichter en verticaler; BdN voller en ronder op het middenpalet. Verwar kleur niet: BdN blijft wit wijn met rode druiven.

Hoe kies je in service? BdB voor schaal, citrus en delicate vis; BdN voor kalf, kip met room, oudere kaas. Rijping versterkt BdB-noten; BdN blijft vaak toegankelijker jong.

Wanneer upsellen? BdB voor mineraliteit-verhalen; BdN voor “Champagne die mee eet”.


## Food pairing

### Beste pairing

BdB bij oesters; BdN bij kalfszwezerik met champignon.

### Waarom dit werkt

BdB snijdt zout en mineraliteit; BdN draagt vet en umami met meer middenpalet.

### Vermijd

BdB bij zware braad met jus zonder finesse in de saus.

## Pro insight

Zet Blanc de Blancs en Blanc de Noirs naast elkaar op de kaart met telkens één concrete gerechtsuggestie. Zo verkoop je een stijlkeuze in plaats van alleen het merk Champagne, en geef je de gast een laagdrempelige reden om de duurdere optie te proberen omdat het past bij het gerecht in plaats van omdat het duurder is.',
    '- Blanc de Blancs
- Blanc de Noirs
- Chardonnay
- Pinot Noir
- stijlverschil
',
    'Blanc de Blancs heeft doorgaans een langer bewaarpotentieel dan Blanc de Noirs omdat Chardonnay van nature meer zuur en minder kleurstof bevat, wat de wijn langer reductief en strak houdt op fles.
',
    '- Blanc de Blancs = finesse, zuur, mineraliteit (meestal Chardonnay)
- Blanc de Noirs = body, rijper fruit (Pinot/Meunier)
- Stijlkeuze bepaalt gastronomisch venster
- Blind: BdB strakker; BdN voller op het palet
- Geen rosé — puur wit stijlspectrum binnen Champagne
',
    '### Opdracht

Vergelijk proefnotities van beide stijlen.

### Checklist

- Ik heb fruitverschillen gezien
- Ik heb structuurverschillen gezien
- Ik heb body vergeleken


### Reflectievraag

Welk blindsignaal — zuurlijn of middenpalet-gewicht — gebruik jij eerst om BdB van BdN te scheiden?',
    8,
    3
  ),
  (
    'vintage-vs-non-vintage',
    'Vintage vs Non-Vintage',
    'Na deze les kun jij uitleggen wat Vintage en Non-Vintage betekent.
',
    'NV versus Vintage is het verschil tussen huisstijl en oogstverhaal. NV blendt jaren voor consistentie — de motor van commerciële Champagne. Vintage declareert één topjaar, rijpt langer en toont terroir en tijd met meer diepte en bewaarpotentieel.

Waarom prijsverschil? Selectie, lagere volume, langere kelder. Sensorisch: NV directer en toegankelijker; Vintage meer gelaagd, meer autolyse en lengte.

Hoe adviseer je? NV voor aperitief en hoge rotatie; Vintage voor gastronomische hoofdgang, verjaardag en celrinvestering. Niet elke jaar wordt vintage — dat is kwaliteitsfilter.

Wanneer wachten met openen? Jong vintage kan strakker zijn; geef flesrust of kies NV voor directe service.


## Food pairing

### Beste pairing

NV bij receptie; Vintage bij hoofdgang met gevogelte of zeevruchten in botersaus.

### Waarom dit werkt

NV verfrissend vóór tafel; Vintage combineert autolyse-diepte met rijkere gerechten.

### Vermijd

Jonge Vintage bij delicate sashimi — te veel rijpingstoon voor het gerecht.

## Pro insight

Leg in je voorraadbeheer vooraf vast welke non-vintage voor volume dient en welke vintage voor topmomenten gereserveerd blijft. Zonder die scheiding open je per ongeluk een schaarse fles op een gewone donderdagavond — een verwachtingsmanagement-fout die je marge en je verhaal richting belangrijke gasten ondermijnt.',
    '- vintage
- non-vintage
- blend
- oogstjaar
- huisstijl
',
    'Een gedeclareerd topjaar betekent dat het huis zijn beste basiswijn reserveert voor een eenmalige blend uit één oogst — daardoor proef je in Vintage een ander, smaller productieverhaal dan in de jaarlijks herhaalbare non-vintage stijl.
',
    '- NV = consistente huisstijl, multi-vintage blend
- Vintage = topjaar, meer rijping en diepte
- Vintage heeft vaak meer bewaarpotentieel
- NV wint op toegankelijkheid; Vintage op gastronomische lengte
- Jaar op fles is kwaliteitsstatement, geen garantie voor smaakvoorkeur
',
    '### Opdracht

Zoek een NV en Vintage Champagne.

### Checklist

- Ik heb jaartal gecontroleerd
- Ik heb prijs vergeleken
- Ik heb rijpingsduur bekeken


### Reflectievraag

Voor welk gastmoment op je planning zou jij bewust NV kiezen boven Vintage — en welk risico neem je met Vintage als je dat niet doet?',
    9,
    4
  ),
  (
    'prestige-cuvee',
    'Prestige Cuvée',
    'Na deze les begrijp jij wat Prestige Cuvée betekent.
',
    'Prestige Cuvée is het maximale expressiepunt van een huis: beste percelen, strengste selectie, langste rijping, hoogste integratie van mousse en autolyse. Waarom bestaan ze? Omdat sommige oogsten en parcelles een niveau tonen dat NV niet hoeft te dragen.

Sensorisch: extreme finesse, lange afdronk, diepe autolyse, vaak jaren celpotential. Niet “meer zoet” of “meer alcohol” — meer textuurcohesie en tijd.

Hoe herken je blind? Fijne mousse + gelaagde autolyse + lengte die blijft na slikken. Prijs en hype zijn geen proefpunten.

Wanneer serveren? Mijlpaal, collector, gastronomisch hoogtepunt — koeler dan te warm, witwijnglas, geen knal bij openen. Prestige vraagt rust in service.


## Food pairing

### Beste pairing

Prestige Cuvée bij kreeft, turbot of sublieme gevogelte-gang.

### Waarom dit werkt

Textuur en lengte matchen premium ingrediënten; autolyse echo''t met boter en umami zonder zoetheid.

### Vermijd

Zware BBQ-saus of agressief spice — die vernietigen finesse.

## Pro insight

Verkoop een Prestige Cuvée nooit op naam alleen, maar op moment: ''deze fles is gemaakt voor één topgang, welke wordt dat bij u vanavond?'' Die vraag verschuift het gesprek van prijsrechtvaardiging naar ervaringsplanning, wat de psychologische drempel voor een hoge besteding aanzienlijk verlaagt.',
    '- prestige
- cuvée
- vintage
- topkwaliteit
- rijping
',
    'Prestigepositionering wordt niet alleen bepaald door rijpingsduur, maar door de keuze om de beste percelen en oogstjaren exclusief te reserveren — dat schaarste-principe rechtvaardigt de prijs net zo veel als de smaak.
',
    '- Topselectie, langste rijping, hoogste huisexpressie
- Sensorisch: finesse, autolyse-diepte, extreme lengte
- Groot bewaarpotentieel en verzamelwaarde
- Blind: mousse + autolyse + lengte-cluster
- Service vraagt temperatuur, glas en openentechniek op niveau
',
    '### Opdracht

Onderzoek drie Prestige Cuvées.

### Checklist

- Ik heb producent bekeken
- Ik heb prijs bekeken
- Ik heb druiven bekeken
- Ik heb rijping bekeken


### Reflectievraag

Welke drie sensorische criteria — niet prijs of merk — zou jij hanteren om Prestige blind te scheiden van goede NV?',
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
    'Cava bewijst dat traditionele methode niet exclusief Champagne is. Penedès levert Macabeo, Xarel·lo en Parellada — eigen aromatisch palet, vaak rijper en ronder dan Noord-Franse blends. Waarom relevant? Sterke prijs-kwaliteit en fijne mousse zonder Champagne-budget.

Guarda Superior en lange rijpingstermen tillen Cava naar gastronomisch niveau. Sensorisch: autolyse mogelijk, maar fruit vaak zachter en zuidelijker; zuur minder messcherp dan Champagne.

Hoe blind onderscheiden? Minder krijt-mineraliteit, rijper fruit, iets rondere zuurlijn bij zelfde methode.

Wanneer adviseren? Gastronomische lunch, bruiloft zonder prestige-tarief, pairing met Spaanse keuken.


## Food pairing

### Beste pairing

Guarda Superior Cava bij paella, gegrilde sardines of jamón.

### Waarom dit werkt

Autolyse en zachte mousse dragen umami en olijfolie; zuur houdt het geheel levend.

### Vermijd

Zeer strakke Brut Nature bij zoete romesco zonder compensatie.

## Pro insight

Zet Cava niet onder “alternatief” maar onder “traditioneel met Mediterrane fruitlijn” — dan vermijd je Champagne-vergelijkingsangst.',
    '- Cava
- Spanje
- traditionele methode
- Xarel-lo
- Penedès
',
    'Xarel-lo levert van nature hoge zuurgraad en structuur, wat verklaart waarom veel kwaliteits-Cava ook zonder lange gistrijping al stevig en gastronomisch aanvoelt.
',
    '- Spanje, Penedès, traditionele methode
- Eigen druivenrassen, vaak rijper fruitprofiel
- Guarda Superior = langere rijping, hogere kwaliteit
- Blind: methode gelijk, terroir en druif verschillen
- Commercieel: waarde+finesse zonder Champagne-label
',
    '### Opdracht

Vergelijk een Cava met een Champagne.

### Checklist

- Ik heb druiven bekeken
- Ik heb prijs vergeleken
- Ik heb aroma’s vergeleken


### Reflectievraag

Welk blindsignaal gebruik jij het eerst om Cava van Champagne te scheiden — fruitrijpheid, mineraliteit of mousse?',
    8,
    1
  ),
  (
    'prosecco',
    'Prosecco',
    'Na deze les begrijp jij hoe Prosecco wordt gemaakt en waarom het zo populair is.
',
    'Prosecco is de wereldwijde motor van toegankelijk mousserend: Glera, tankmethode, fruit voorop. Waarom geen Champagne-concurrent? Andere productielogica — volume, frisheid, directe verkoop. DOCG Conegliano-Valdobbiadene levert de meeste structuur binnen Prosecco.

Sensorisch: peer, appel, witte bloemen; mousse directer; weinig autolyse. Superiore DOCG kan meer finesse tonen maar blijft fruitgedreven.

Hoe positioneren? Aperitief, spritz, feest — niet gastronomische topgang. Dosage meestal brut; check etiket bij zoetere exportstijlen.

Wanneer upsellen binnen Prosecco? Van DOC naar DOCG wanneer gast finesse wil zonder fles-Champagne-prijs.


## Food pairing

### Beste pairing

DOCG Extra Brut bij cicchetti, lichte frituur of fruitige amuse.

### Waarom dit werkt

Fruitige mousse en zuur passen bij borrel-intensiteit zonder gastronomische zwaarte.

### Vermijd

Gastronomische hoofdgang met redux — Prosecco verliest structuur.

## Pro insight

Schenk Prosecco nooit in flute voor upsell-gesprek — fruit verdwijnt. Tulippe of witwijnglas verkoopt DOCG beter.',
    '- Prosecco
- Glera
- Charmat
- DOCG
- Veneto
',
    'Het commerciële succes van Prosecco komt direct uit de Charmatmethode: tankgisting is sneller en schaalbaarder dan flesgisting, waardoor volume kan groeien zonder dat elke fles individueel moet rijpen of degorgeren.
',
    '- Glera + Charmat = fruit en toegankelijkheid
- DOCG is kwaliteitsanker binnen Prosecco
- Mousse directer; weinig brioche/toast
- Service: aperitief, borrel, cocktails
- Geen Champagne-light — eigen categorie
',
    '### Opdracht

Zoek drie Prosecco’s.

### Checklist

- Ik heb DOC of DOCG bekeken
- Ik heb prijsniveau bekeken
- Ik heb dosage bekeken


### Reflectievraag

Wanneer stuur jij bewust naar Prosecco in plaats van Cava — welk gastsignaal bepaalt die keuze?',
    8,
    2
  ),
  (
    'cremant',
    'Crémant',
    'Na deze les weet jij wat Crémant is en waarom het interessant is.
',
    'Crémant is Frankrijk buiten de Champagne-lijn — altijd traditionele methode, maximale regionale diversiteit. Alsace, Bourgogne, Loire, Jura, Limoux: elk eigen druivenpalet en stijl. Waarom interessant voor sommeliers? Kwaliteit vaak dicht bij Champagne tegen lagere drempel.

Crémant d''Alsace: fruit en body; Loire: frisheid; Limoux: historische claim, vaak rijke mousse. Lees regio als smaakvoorspeller.

Hoe blind? Traditionele autolyse-hints met regionaal fruitprofiel; minder krijt-Champagne-signatuur.

Wanneer kaart? Wanneer je gastronomische flesgisting nodig hebt zonder prestige-tarief.


## Food pairing

### Beste pairing

Crémant de Loire bij geitenkaas en salade; Crémant d''Alsace bij terrine.

### Waarom dit werkt

Regionale zuur en autolyse matchen lokale gastronomie; mousse reinigt vet.

### Vermijd

Zware port-stijl dessert bij droge Crémant zonder suikercontrast.

## Pro insight

Bouw een Crémant-lijst per regio, niet per prijs — gasten kiezen sneller als ze smaakrichting snappen.',
    '- Crémant
- Frankrijk
- traditionele methode
- appellatiediversiteit
- prijspositionering
',
    'Crémant gebruikt wettelijk dezelfde traditionele methode als Champagne, maar toegestane druivenrassen en regio''s verschillen per appellatie — daardoor proef je per Crémantregio een eigen druivensignatuur in plaats van één uniforme stijl.
',
    '- Franse mousserend buiten AOC Champagne
- Altijd traditionele methode; druiven per regio
- Sterke prijs-kwaliteit en diversiteit
- Regio bepaalt fruit- en bodyprofiel
- Sommelier-categorie: finesse zonder Champagne-prijs
',
    '### Opdracht

Zoek twee Crémants uit verschillende regio’s.

### Checklist

- Ik heb druiven vergeleken
- Ik heb stijl vergeleken
- Ik heb prijs vergeleken


### Reflectievraag

Welke Crémant-regio zou jij koppelen aan je huidige lunchkaart — en welk druivenprofiel maakt dat logisch?',
    8,
    3
  ),
  (
    'franciacorta',
    'Franciacorta',
    'Na deze les begrijp jij waarom Franciacorta vaak als topniveau buiten Champagne wordt gezien.
',
    'Franciacorta positioneert Italië op traditioneel topniveau: strenge normen, lange rijping, Chardonnay/Pinot-dominantie. Satèn — lagere druk, zachtere mousse — is uniek Italiaans antwoord op gastronomische finesse.

Sensorisch vaak rijker en romiger dan Champagne bij gelijke methode; autolyse duidelijk. Niet “kopie” maar parallel universum.

Hoe onderscheiden van Champagne blind? Vaak rondere textuur, zuidelijker fruit, Satèn-signatuur.

Wanneer adviseren? Gastronomische Italiaanse keuken, premium vegetarisch, kaasgang.


## Food pairing

### Beste pairing

Satèn bij risotto met Parmezaan; klassieke Franciacorta bij kalf of zeebaars.

### Waarom dit werkt

Romige mousse en autolyse dragen room en umami; zuur houdt balans.

### Vermijd

Zeer pittige curry zonder zoet element — Satèn verliest textuur.

## Pro insight

Noem Satèn expliciet en met naam op de kaart in plaats van het te verstoppen onder ''Italiaanse mousserend''. Frame het als ''de Italiaanse stijl die nooit bijt'' — die ene zin opent een upsell naar gasten die Champagne als te streng ervaren, zonder dat je kwaliteit hoeft te bewijzen met jaartallen of methodedetails.',
    '- Franciacorta
- Satèn-stijl
- lagere druk
- autolyse-integratie
- flesrijping
',
    'Satèn heeft wettelijk een lagere flesdruk dan standaard Franciacorta, wat de mousse zachter en de textuur ronder maakt — een bewuste stijlkeuze, geen mindere kwaliteit.
',
    '- Lombardije, traditionele methode, hoge normen
- Chardonnay/Pinot-centraal; Satèn = zachte mousse
- Vaak rijk, romig, autolyse-forward
- Internationaal topalternatief voor Champagne
- Satèn voor zachte gastronomische pairing
',
    '### Opdracht

Zoek een Franciacorta en noteer de rijping.

### Checklist

- Ik heb druiven bekeken
- Ik heb dosage bekeken
- Ik heb rijping bekeken


### Reflectievraag

Welk Franciacorta-signaal — Satèn-textuur of autolyse-diepte — zou jij gebruiken om een gast van Prosecco naar Italiaans flesgisting te leiden?',
    9,
    4
  ),
  (
    'sekt-en-english-sparkling',
    'Sekt & English Sparkling',
    'Na deze les kun jij Sekt en English Sparkling herkennen en plaatsen.
',
    'Sekt en English Sparkling tonen dat mousserend geen Frans monopolie is. Duits Sekt varieert van basis tot Deutscher Sekt b.A. en winzersekt traditionell — laatste categorie serieus traditioneel. Riesling en Spätburgunder geven eigen zuur- en fruitprofielen.

English Sparkling profiteert van koel klimaat en krijtachtige bodems in Sussex/Hampshire: strak, mineraal, fijne mousse — steeds vaker blind verward met Champagne. Champagnehuizen investeren in Engeland — klimaat als kwaliteitsdriver.

Hoe positioneren? Sekt top bij frisheid en brunch; English bij gastronomische finesse en Champagne-alternatief op Britse pairing.

Blind: English vaak mineraliger en strakker; basis-Sekt fruitiger en eenvoudiger.


## Food pairing

### Beste pairing

English Sparkling bij oesters of fish & chips (verfijnde versie); Duitse Sekt b.A. bij brunch.

### Waarom dit werkt

Engelse zuren snijden schaal en vet; Duitse fruitzuur past bij late ochtend pairing.

### Vermijd

Basis-Sekt bij gastronomische hoofdgang — structuur ontbreekt.

## Pro insight

Voeg één English Sparkling of Duitse Sekt b.A. toe aan een blindproeverij als bewuste verrassing — het doorbreekt Champagne-arrogantie in één ronde en maakt gasten ontvankelijker voor je volgende, minder voor de hand liggende aanbeveling. Gebruik dat psychologische momentum direct om een tweede, net zo onverwachte fles te verkopen.',
    '- wereldstijlen
- Cava
- Prosecco
- Crémant
- Franciacorta
',
    'Engelse mousserende wijn deelt klimaat en kalkbodem met de Champagne, wat verklaart waarom internationale Champagnehuizen er zelf wijngaarden hebben aangekocht in plaats van het als concurrent af te schrijven.
',
    '- Sekt: breed spectrum; top = traditioneel en terroir-gedreven
- English Sparkling: snelle kwaliteitsgroei, koel klimaat
- Beide tonen: methode + klimaat > alleen regio-reputatie
- Blind: mineraliteit en zuur helpen English herkennen
- Wereldstijlen vullen Champagne in prijs en profiel in
',
    '### Opdracht

Zoek één Sekt en één English Sparkling.

### Checklist

- Ik heb druiven bekeken
- Ik heb methode bekeken
- Ik heb prijs bekeken


### Reflectievraag

Tussen Sekt en English Sparkling: welke zou jij blind het lastigst vinden naast Champagne — en welk signaal gebruik je om te kiezen?',
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
    'Brut Nature (max. 3 g/l, vaak zero dosage) is de meest onverbloemde test van basiswijn en kelderwerk. Waarom geen suikermasker? Omdat zuur, terroir en mousse direct zichtbaar worden — fouten vallen meteen op.

Sensorisch: strak, mineraal, soms scherp; mousse moet compenseren met finesse, niet met zoetheid. Ideaal om productiekwaliteit te beoordelen en voor pairing met zout en umami.

Hoe verschilt het van Extra Brut? Minder afronding; meer transparantie. Wanneer adviseren? Oesters, sashimi, gastronomische start — niet voor gasten die ronde middenpalet verwachten.


## Food pairing

### Beste pairing

Oesters nature, sashimi, zee-urchin.

### Waarom dit werkt

Maximale transparantie vraagt maximale zuiverheid in het gerecht; zout versterkt mineraliteit.

### Vermijd

Romige pasta zonder zoutcontrast — Brut Nature voelt hard en kaal.

## Pro insight

Zet Brut Nature nooit op de kaart zonder serveertip: iets minder ijskoud dan standaard, anders lijkt elke fles te zuur en verlies je de gast voordat de wijn een kans krijgt. Beheer die verwachting actief vooraf — ''dit is puur, niet streng'' — in plaats van achteraf te moeten verdedigen waarom een gast het te scherp vond.',
    '- Brut Nature
- Zero Dosage
- droog
- puur
- terroir
',
    'Zonder dosage is er geen suiker om productiefouten of scherp zuur te maskeren — Brut Nature vraagt daarom een perfecte basiswijn, wat verklaart waarom niet elk huis deze stijl voert.
',
    '- Droogste categorie: max. 3 g/l, vaak geen dosage
- Geen suikermasker: zuur, terroir en mousse staan bloot
- Vraagt hoge kwaliteit basiswijn en fijne mousse
- Pairing: zout, umami, minerale gerechten
- Niet voor gasten die zachte afronding zoeken
',
    '### Opdracht

Zoek een Brut Nature en lees het etiket.

### Checklist

- Ik heb dosage gecontroleerd
- Ik heb alcohol bekeken
- Ik heb regio bekeken


### Reflectievraag

Welk kwaliteitsprobleem in een basiswijn wordt het snelst zichtbaar zonder dosage — vlakke mousse of scherp zuur?',
    8,
    1
  ),
  (
    'extra-brut',
    'Extra Brut',
    'Na deze les begrijp jij de stijl van Extra Brut.
',
    'Extra Brut (0–6 g/l) is het sweet spot-niveau voor veel premium huizen: bijna droog, maar net genoeg afronding om hoge zuren te temperen zonder zoetheid te tonen. Waarom populair bij sommeliers? Gastronomische precisie met toegankelijkheid.

Vergelijk met Brut Nature: iets ronder mondgevoel; vergelijk met Brut: strakker en moderner. In pairing snijdt Extra Brut door vet zonder dessertassociatie.

Wanneer kiezen? Maaltijdstart, vis met boter, lichte kaas — wanneer Brut Nature te scherp zou aanvoelen.


## Food pairing

### Beste pairing

Gegrilde vis met citroen-botersaus, witte truffel-amuse.

### Waarom dit werkt

Minimale dosage rondt zuur af zonder zoet te tonen; mousse reinigt vet.

### Vermijd

Fruitdessert — Extra Brut mist de suiker om contrast te bieden.

## Pro insight

Bij twijfel tussen Brut en Extra Brut op de kaart: noteer welke fles je koppelt aan je vis-hoofdgang. Dat voorkomt willekeurige upsell-gokjes en geeft je team een concreet, herhaalbaar verkoopargument in plaats van een vage ''dit is ook lekker''-aanbeveling.',
    '- Extra Brut
- dosagebalans
- restsuiker
- zuur
- finesse
',
    'Extra Brut wordt vaak gekozen door huizen die hun basiswijn sterk genoeg vinden om met minimale dosage te presenteren — in de praktijk een impliciet kwaliteitsstatement van de producent.
',
    '- 0–6 g/l: zeer droog met minimale afronding
- Populair in premium segment voor balans bij hoge zuren
- Tussen Brut Nature en Brut in mondgevoel
- Gastronomisch veelzijdiger dan Brut Nature voor brede tafel
- Dosage als fine-tuning, niet als stijl
',
    '### Opdracht

Vergelijk Brut Nature met Extra Brut.

### Checklist

- Ik heb zoetheid vergeleken
- Ik heb zuur vergeleken
- Ik heb balans vergeleken


### Reflectievraag

In een verticale van Nature → Extra Brut → Brut: welk punt voelt voor jou het meest “compleet” bij hetzelfde gerecht?',
    8,
    2
  ),
  (
    'brut',
    'Brut',
    'Na deze les weet jij waarom Brut de standaard is.
',
    'Brut (max. 12 g/l) is de wereldstandaard omdat het de breedste balans biedt: droog genoeg voor gastronomie, rond genoeg voor aperitief. Waarom domineert het verkoop? Omdat het de meeste gasten en gerechten dekt zonder educatie.

Sensorisch: fris maar niet scherp; mousse geïntegreerd; dosage maskeert kleine onevenheden. Niet “minder kwaliteit” dan Extra Brut — vaak huisstijl-keuze.

Wanneer default? Onbekende gast, gemengde tafel, eerste fles van de avond. Upgrade naar Extra Brut/ Nature wanneer gerecht strakker is.


## Food pairing

### Beste pairing

Gemengde borrel, canapés, lichte voorgerechten, eerste gang vis of gevogelte.

### Waarom dit werkt

Brut dekt brede intensiteit; zuur en mousse werken over meerdere hapjes.

### Vermijd

Zoet dessert zonder expliciete Demi-Sec-keuze.

## Pro insight

Train je team op één zin: ''Brut is niet zoet.'' Die ene correctie in verwachtingsmanagement bespaart de meeste retourflessen op mousserend en voorkomt dat een onzekere gast standaard naar het goedkoopste glas wijst uit angst voor een te zoete verrassing.',
    '- Brut
- dosagebalans
- marktstandaard
- aperitief
- inzetbreedte
',
    'Brut werd de marktstandaard omdat de dosagebalans breed genoeg is om zowel als aperitief als bij een hoofdgerecht te functioneren — een compromis tussen droogte en toegankelijkheid, niet een toevallige norm.
',
    '- Meest voorkomende stijl: max. 12 g/l
- Optimale balans aperitief én maaltijd voor brede doelgroep
- Dosage maskeert lichte onevenheden; mousse blijft leidend
- Veilige default in service en verkoop
- Upgrade-pad naar droger wanneer pairing strakker wordt
',
    '### Opdracht

Proef een Brut en beoordeel balans.

### Checklist

- Ik heb zuur geproefd
- Ik heb dosage gevoeld
- Ik heb lengte beoordeeld


### Reflectievraag

Bij welk type gast of gerecht schakel jij bewust van Brut naar droger — en welk signaal triggert dat?',
    8,
    3
  ),
  (
    'extra-dry-dry',
    'Extra Dry / Dry',
    'Na deze les begrijp jij waarom de naam Extra Dry verwarrend is.
',
    'Extra Dry (12–17 g/l) en Dry (17–32 g/l) zijn de grootste valkuilen in mousserende taal: de naam zegt droog, de suiker zegt iets anders. Historisch ontwikkeld voor bredere smaak; vandaag niche maar culinair nuttig.

Extra Dry voelt zachter en fruitiger dan Brut — populair bij brunch en lichte Aziatische keuken met zoete componenten. Dry nog ronder; Demi-Sec module volgt voor zoetere pairing.

Hoe verkoop je zonder verwarring? Noem altijd “zoeter dan Brut” vóór je het etiket noemt. Blind: meer fruitige afronding op het einde van de slok.


## Food pairing

### Beste pairing

Brunch met fruit en pannenkoek; lichte spicy tuna of zoetzure Aziatische hapjes.

### Waarom dit werkt

Restsuiker vangt spice en fruitzoet; mousse houdt het geheel fris genoeg.

### Vermijd

Oesters met Extra Dry — zout maakt de wijn vreemd zoet.

## Pro insight

Schrijf letterlijk op je kaart: ''Extra Dry = zoeter dan Brut.'' Die ene regel voorkomt het grootste deel van de dosage-verwarring aan tafel en geeft je de ruimte om door te vragen naar wat de gast echt zoekt, in plaats van een misverstand te moeten herstellen na de eerste slok.',
    '- Extra Dry
- Dry
- restsuiker
- toegankelijk
- fruitig
',
    'De naam Extra Dry is een historisch overblijfsel uit een tijd dat alle mousserende wijn zoeter was; vergeleken met die oude standaard was het destijds extra droog, terwijl het volgens de huidige dosageschaal juist zoeter is dan Brut.
',
    '- Extra Dry is zoeter dan Brut (12–17 g/l); Dry nog zoeter (17–32 g/l)
- Naamgeving is historisch en misleidend
- Zachtere afronding, meer fruitige perceptie
- Brunch, lichte Aziatische en toegankelijke pairing
- Altijd uitleggen vóór schenken om teleurstelling te voorkomen
',
    '### Opdracht

Vergelijk Brut met Extra Dry.

### Checklist

- Ik heb zoetheid vergeleken
- Ik heb fruitigheid vergeleken
- Ik heb pairingmogelijkheden bedacht


### Reflectievraag

Welke gastvraag (“iets droogs maar niet te scherp”) zou jij naar Extra Brut sturen in plaats van Extra Dry — en waarom?',
    8,
    4
  ),
  (
    'demi-sec-en-zoet',
    'Demi-Sec & Zoet',
    'Na deze les kun jij Demi-Sec en zoetere stijlen herkennen en correct inzetten.
',
    'Demi-Sec en zoetere stijlen (32–50 g/l en hoger) zijn minder trendy maar gastronomisch scherp wanneer correct ingezet. Waarom terug in beeld? Omdat blauwschimmel, foie gras, pittige keuken en fruitdessert suiker in de wijn nodig kunnen hebben.

Gouden regel: wijn moet zoeter of even zoet zijn als het gerecht — anders zuur domineert. Mousse houdt zoetheid levendig in plaats van plakkerig.

Wanneer niet? Aperitief, oesters, strakke sashimi. Wanneer wel? Dessertgang, kaas met blauwschimmel, contrast met zout en vet.


## Food pairing

### Beste pairing

Demi-Sec bij blauwschimmelkaas, foie gras of fruitterrine.

### Waarom dit werkt

Suiker in wijn en gerecht balanceert; zuur en mousse houden het levend.

### Vermijd

Demi-Sec als aperitief zonder food — te zoet, te vermoeiend.

## Pro insight

Eén Demi-Sec op de kaart voor bij kaas of dessert verhoogt de gemiddelde besteding vaak meer dan drie extra Brut-opties — gasten die toch al voor een dessertwijn zouden kiezen, blijven nu binnen je mousserend-segment. Positioneer hem expliciet als dessertfles, niet als alternatief voor Brut, anders concurreert hij met je eigen aanbod.',
    '- dosage
- restsuiker
- Brut
- Extra Dry
- Demi-Sec
',
    'Demi-Sec was lang de dominante stijl omdat vroege dosagetechniek minder precies was — pas met betere controle over restsuiker kon de markt overstappen naar de drogere, gastronomischer geachte Brut-stijl.
',
    '- Demi-Sec = duidelijk zoet (32–50 g/l)
- Pairing: dessert, blauwschimmel, foie gras, pittig met zoet element
- Wijn-suiker moet gerecht evenaren of overtreffen
- Mousse voorkomt plakkerige zoetheidsbeleving
- Minder aperitief; meer gastronomisch finaal
',
    '### Opdracht

Bedenk drie pairings voor Demi-Sec.

### Checklist

- Ik heb dessert gekozen
- Ik heb kaas gekozen
- Ik heb pittig gerecht gekozen


### Reflectievraag

Welk gerecht op je menu vraagt volgens jou Demi-Sec in plaats van “gewoon een zoete wijn” — en welk zuur-mousse-signaal bevestigt dat?',
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
    'Temperatuur is de stille kwaliteitskill in mousserend service. Te koud: aroma''s en autolyse dicht, alleen zuur en koude mousse. Te warm: CO₂ ontsnapt sneller, spanning weg, alcohol dominant.

Richtlijnen: jonge tankwijn 4–6 °C; standaard brut 6–8 °C; Champagne en gastronomische fles 8–10 °C; Prestige en gerijpt 10–12 °C. Demi-Sec koeler om zoetheid strak te houden.

Hoe test je? Zelfde fles op twee temperaturen proeven — verschil in mousse en fruit is leerzaam.

Wanneer corrigeren? Fles uit ijs na 10 minuten voor top-Champagne; tankwijn direct koel serveren.


## Food pairing

### Beste pairing

Zelfde oesterplateau bij 6 °C versus 10 °C Champagne.

### Waarom dit werkt

Temperatuur-test toont hoe mineraliteit en mousse veranderen met het gerecht.

### Vermijd

Ijskoude Prestige — verspilde autolyse bij dure pairing.

## Pro insight

Zet een thermometer in de kelder, niet in de marketing: één graad verschil verklaart een groot deel van de te-zuur-klachten aan tafel. Wanneer je dat structureel bewaakt, voorkom je dat een technisch correcte wijn onterecht als slecht wordt beoordeeld — en dat beschermt zowel de gasttevredenheid als je inkoopkeuzes.',
    '- serveervenster
- frisheid
- aromaopening
- koolzuurspanning
- schenkprotocol
',
    'Te koud schenken onderdrukt niet alleen aroma maar ook de waargenomen zuurgraad — een wijn die bij 4 °C agressief zuur lijkt, kan bij 8-10 °C plots in balans ogen zonder dat er iets aan de wijn zelf is veranderd.
',
    '- Te koud remt aroma; te warm kost spanning en frisheid
- Jong/tank koeler; complex/fles warmer
- Prestige vraagt warmere band voor autolyse-expressie
- Temperatuur beïnvloedt mousse-perceptie direct
- Meten en bijstellen is professionele standaard
',
    '### Opdracht

Meet de temperatuur van een fles voor en na 15 minuten.

### Checklist

- Ik heb starttemperatuur gemeten
- Ik heb eindtemperatuur gemeten
- Ik heb smaakverschil geproefd


### Reflectievraag

Welke fles in je assortiment serveer je waarschijnlijk te koud — en welk aromasignaal zou je na 10 minuten anders moeten proeven?',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les kun jij het juiste glas kiezen voor mousserende wijn.
',
    'Glaswerk bepaalt hoe mousse en aroma samenkomen. Flute: visuele bubbelshow, beperkte neusontwikkeling. Witwijnglas/Bourgogne: meer aromatische expressie, betere analyse en gastronomische ervaring. Coupe: historisch, snel druk- en aromaverlies.

Waarom verschuift de industrie? Omdat topmousserend meer autolyse en lengte heeft dan schuimshow. Breder glas = meer reductie-ontwikkeling en complexiteit.

Wanneer flute? Massa-events en visuele impact. Wanneer witwijnglas? Proeverij, Prestige, pairingmenu.


## Food pairing

### Beste pairing

Zelfde Champagne in flute versus witwijnglas bij amuse met boter en zeezout.

### Waarom dit werkt

Breed glas toont of autolyse het gerecht versterkt; flute maskeert die laag.

### Vermijd

Coupe bij fine-dining pairing — aromatisch snel dood.

## Pro insight

Schenk interne proeverijen altijd in een witwijnglas en bewaar de flute voor gastpresentatie als bewust beleid. Zo trainen je medewerkers hun neus op het echte aromaprofiel, terwijl de gast bij het schenken nog het feestelijke, verwachte beeld krijgt — twee doelen, twee glazen, geen compromis op smaak of beleving.',
    '- flute
- coupe
- witwijnglas
- aroma
- presentatie
',
    'Een breder wijnglas in plaats van een flute laat meer oppervlak voor aromaverdamping toe, wat secundaire brioche- en gistnoten beter laat openen — bij eenvoudige tankwijn werkt dat averechts omdat er simpelweg minder complexiteit is om te tonen.
',
    '- Flute = presentatie; witwijnglas = aroma en analyse
- Coupe verliest snel mousse en geur
- Glasvorm beïnvloedt gastbeleving en upsell
- Prestige verdient breed glas voor autolyse
- Consistent glaswerk = consistente kwaliteitsbeoordeling
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik heb aroma vergeleken
- Ik heb mousse vergeleken
- Ik heb structuur vergeleken


### Reflectievraag

Welk glas in jouw zaak doet de meeste autolyse-aroma’s tekort — en wat is de service-impact op upsell?',
    8,
    2
  ),
  (
    'openen-zonder-verlies',
    'Openen zonder verlies',
    'Na deze les kun jij mousserende wijn veilig en professioneel openen.
',
    'Openen is drukbeheer: explosief openen kost CO₂, mousse en kwaliteit. Protocol: folie en muselet los, duim op kurk, hand op kroon, fles draaien (niet kurk trekken), gecontroleerde “zucht”.

Waarom professioneel? Veiligheid (kurkprojectiel) én smaak (mousse blijft geïntegreerd). Na openen: direct schenken of doppen; druk daalt snel in het glas.

Wanneer trainen? Elke nieuwe medewerker vóór eerste service; fouten zijn zichtbaar aan schuimexplosie.


## Food pairing

### Beste pairing

Service-first: open en schenk vóór pairing — mousse begint bij correct openen.

### Waarom dit werkt

Techniek bepaalt druk en schuim in het glas; pairing kan pas ná stabiele mousse.

### Vermijd

Knallende fles bij gast — verliest premium context ongeacht gerecht.

## Pro insight

Laat nieuwe medewerkers eerst op een lege fles oefenen met de muselet voordat ze ooit een gast bedienen. Spiermemorie voorkomt knallen onder druk tijdens een drukke service, en dat is zowel een veiligheidskwestie als een verwachtingsmanagement-kwestie — een gast die schrikt van een knal, onthoudt dat langer dan de smaak van de wijn.',
    '- ontkurkingstechniek
- kurk
- druk
- schenkveiligheid
- moussebehoud
',
    'Een mousserende kurk verliest zijn schroefdraadvorm zodra hij de fles verlaat, wat onvoorspelbare baanafwijking geeft — daarom is de hand op de kurk tijdens het hele ontkurkingsproces een veiligheidsregel, geen service-detail.
',
    '- Fles draaien, kurk onder controle; zachte ontluchting
- Explosief openen = druk- en mousseverlies
- Veiligheid en kwaliteit gaan samen
- Direct schenken na openen voor consistente mousse
- Techniek is onderdeel van premium service
',
    '### Opdracht

Open een fles volgens de professionele methode.

### Checklist

- Ik hield de kurk vast
- Ik draaide de fles
- Ik maakte geen harde knal
- Ik hield controle


### Reflectievraag

Hoeveel mousse denk jij dat je verliest bij een harde knal versus een gecontroleerde zucht — en hoe merk je dat in het eerste glas?',
    9,
    3
  ),
  (
    'bewaren-en-rijping',
    'Bewaren & Rijping',
    'Na deze les begrijp jij hoe mousserende wijn bewaard en gerijpt wordt.
',
    'Bewaren en rijping bepalen of mousserend verbetert of vervalt. Niet alles is voor de kelder: basis tankwijn en jonge Prosecco zijn voor nu; top Champagne, Vintage en Prestige kunnen jaren winnen.

Opslag: constant koel (10–12 °C), donker, rustig, liggend, vochtig maar niet nat. Rijping ontwikkelt brioche, noten, honing; verliest fruit en extreme frisheid. Balans verschuift naar gastronomische diepte.

Wanneer drinken? NV jong tot medium; Vintage/Presige volgens producent of proef. Te lang = fruit weg, mousse kan verzachten.


## Food pairing

### Beste pairing

Jonge NV bij aperitief; 5-jaar Vintage bij gastronomische hoofdgang.

### Waarom dit werkt

Rijping verhoogt umami-pairing-potential; jonge wijn wint op frisheid bij eerste gang.

### Vermijd

Oude Vintage bij lichte citrus-amuse — fruit en frisheid zijn weg.

## Pro insight

Label je voorraad zichtbaar met ''drink nu / 2-5 jaar / bewaar'' in plaats van te vertrouwen op geheugen. Zonder dat systeem open je per ongeluk je beste investering te vroeg, en dat is een kostbare fout die je met een simpel etiket volledig kunt voorkomen.',
    '- bewaren
- rijping
- drinkvenster
- keldercondities
- complexiteit
',
    'Niet elke mousserende wijn deelt hetzelfde drinkvenster: Prestige Cuvées kunnen decennia rijpen, terwijl jonge tankwijnen zoals basis-Prosecco binnen één à twee jaar hun primaire fruit en frisheid verliezen.
',
    '- Niet elke mousserende wijn is voor lang bewaren
- Top flesgisting kan jaren rijpen met autolyse-winst
- Koel, donker, liggend, zonder trilling
- Rijping: meer autolyse, minder primair fruit
- Voorraadsegmenteren: nu vs later
',
    '### Opdracht

Bekijk je eigen voorraad mousserend.

### Checklist

- Ik heb gekeken welke wijnen jong moeten
- Ik heb gekeken welke kunnen ouderen
- Ik heb opslagomstandigheden beoordeeld


### Reflectievraag

Welke fles in je kelder rijpt waarschijnlijk — en welke moet je binnen zes maanden serveren om mousse optimaal te vangen?',
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
    'Oesters en mousserend zijn het klassieke zuur-zout-umami-driehoeksparing. Waarom werkt het? Hoge zuren snijden door brine; mineraliteit versterkt zee-signatuur; mousse reinigt vet en herhaalt elke hap zonder vermoeidheid.

Stijlkeuze: Brut Nature, Extra Brut, Blanc de Blancs voor maximale precisie. Demi-Sec botst met zout. Temperatuur: niet ijskoud — 8–10 °C laat mineraliteit ademen.

Wanneer upsellen? Oesterbar = moment voor Prestige of Grand Cru Blanc de Blancs als verhaal.


## Food pairing

### Beste pairing

Brut Nature Blanc de Blancs bij Gillardeau of Creuse nr. 2.

### Waarom dit werkt

Maximale droogte en mineraliteit versterken brine zonder zoetheidsconflict.

### Vermijd

Demi-Sec of zoete Prosecco bij oesters — klassieke dosage-fout.

## Pro insight

Serveer de oesters altijd vóór je de prijs van de Champagne noemt — smaak verkoopt overtuigender dan een argument. Wanneer de combinatie eerst in de mond bewijst hoe goed ze samenwerkt, daalt de prijsweerstand vanzelf en wordt de volgende fles makkelijker te adviseren.',
    '- oesters
- zout
- umami
- Brut Nature
- Blanc de Blancs
',
    'Zout in oesters dempt de waargenomen zuurgraad van mousserende wijn — daardoor is precies een strakke, dosagearme stijl als Brut Nature de beste partner, en geen zoetere fles.
',
    '- Zout + umami vraagt zuur, mineraliteit en mousse
- Droge stijlen winnen; zoete stijlen verliezen
- Blanc de Blancs en Brut Nature zijn klassieke match
- Mousse reinigt gehemelte tussen oesters
- Temperatuur bepaalt of mineraliteit arriveert
',
    '### Opdracht

Bedenk drie mousserende stijlen bij oesters.

### Checklist

- Ik koos een droge stijl
- Ik keek naar zuur
- Ik keek naar mineraliteit


### Reflectievraag

Welk element — zuur, mineraliteit of mousse — zou jij benadrukken als een gast Demi-Sec bij oesters vraagt?',
    8,
    1
  ),
  (
    'mousserend-en-kaas',
    'Mousserend & Kaas',
    'Na deze les kun jij mousserende wijn combineren met verschillende kaassoorten.
',
    'Kaas en mousserend zijn vet-zuur-mousse-driehoek. Zachte kaas (Brie, triple crème) vraagt frisse Brut; harde gerijpte kaas (Comté, Parmezaan) vraagt Vintage of Franciacorta met autolyse; blauwschimmel kan Demi-Sec verrassen door suiker-zout-balans.

Intensiteit moet matchen: jonge kaas + jonge wijn; rijpe kaas + rijpe fles. Mousse reinigt vet zodat umami niet verzwaart.

Wanneer kaasplateau? Eindgang met één zoete en één droge optie — gast kiest, jij motiveert.


## Food pairing

### Beste pairing

NV Brut bij Brie; 5-jaar Vintage bij Comté; Demi-Sec bij Roquefort.

### Waarom dit werkt

Drie zuur-suiker-niveaus voor drie kaastypes — zo toon je dosage-logica.

### Vermijd

Zware blauwschimmel met Brut Nature zonder uitleg — gast ervaart hard zuur.

## Pro insight

Bouw je kaaspairing op naar intensiteit, niet naar land van herkomst — één rij van droog naar zoet volstaat en is voor de gast direct te begrijpen. Die eenvoud verlaagt de keuzedrempel en leidt vaker tot een extra glas erbij, omdat de gast zelf kan zien waar hij in de rij zit.',
    '- kaas
- vet
- zuur
- Comté
- blauwschimmel
',
    'Vet in kaas wordt fysiek doorgesneden door koolzuur en alcohol, terwijl zuur in mousserende wijn de romigheid balanceert — daarom werkt deze combinatie structureel beter dan kaas met stille witte wijn, die geen koolzuur heeft om te reinigen.
',
    '- Vet vraagt zuur; mousse reinigt
- Zachte kaas: frisse Brut; harde kaas: gerijpte flesgisting
- Blauwschimmel: soms Demi-Sec voor suiker-zout balans
- Intensiteit kaas en wijn moeten gelijk lopen
- Kaasplateau is upsell-moment voor Vintage
',
    '### Opdracht

Maak drie kaas-wijn combinaties.

### Checklist

- Ik koos zachte kaas
- Ik koos harde kaas
- Ik koos blauwschimmel


### Reflectievraag

Bij welke kaas op je plank zou Demi-Sec logischer zijn dan een droge rode wijn — en welk zout-vet-signaal bepaalt dat?',
    9,
    2
  ),
  (
    'mousserend-als-maaltijdwijn',
    'Mousserend als maaltijdwijn',
    'Na deze les begrijp jij waarom mousserende wijn de hele maaltijd kan begeleiden.
',
    'Mousserend als maaltijdwijn is geen luxe-truc maar structuurlogica: zuur snijdt door gangen heen, mousse reset het gehemelte, autolyse draagt romige sauzen. Fout: één fles voor alles zonder dosage- of intensiteitswissel.

Voorgerecht: droog en mineraal. Hoofdgang: meer body (BdN, Vintage). Kaas: zie module 8. Dessert: Demi-Sec of zeer zoet afhankelijk van gerecht.

Wanneer volledig mousserend menu? Wanneer je team dosage en temperatuur beheerst — anders wissel per gang bewust.


## Food pairing

### Beste pairing

4-gangen: Extra Brut amuse → Brut vis → Vintage gevogelte → Demi-Sec kaas/dessert.

### Waarom dit werkt

Dosage-escalatie volgt intensiteit; mousse houdt verhaal coherent.

### Vermijd

Eén Brut Nature voor heel menu inclusief dessert — structureel onderbemand.

## Pro insight

Pitch een volledig mousserend menu als ''één drukcurve door de avond'' — dat klinkt technisch en premium, en rechtvaardigt meteen een hogere prijs per gang dan losse glazen wijn. Gebruik die framing actief bij gasten die twijfelen tussen een wijnarrangement en losse glazen: het verhaal verkoopt het concept, niet alleen de flessen.',
    '- maaltijdwijn
- drukcurve
- stijlkeuze
- intensiteitsopbouw
- serveerritme
',
    'Een mousserend menu werkt als één doorlopende drukcurve: mousse en zuurgraad bouwen op naar het hoofdgerecht en weer af richting dessert — wie dat ritme bewust plant, voorkomt paletvermoeidheid.
',
    '- Mousserend kan volledige maaltijd dragen met stijlwissel
- Droog → rijker → eventueel zoet per gang
- Dosage en intensiteit bepalen succes
- Mousse maakt herhaalde gangen mogelijk zonder vermoeidheid
- Geen enkele fles past elke gang optimaal
',
    '### Opdracht

Bouw een 4-gangenmenu met alleen mousserende wijn.

### Checklist

- Ik koos aperitief
- Ik koos hoofdgerecht
- Ik koos kaas
- Ik koos dessert


### Reflectievraag

In een vier-gangenmenu: bij welke gang zou jouw huidige assortiment het zwakst zijn — en welke stijl zou je toevoegen?',
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
    'Champagne versus Cava blind: zelfde methode, ander terroir en druif. Champagne vaak strakkere zuur, meer krijt/mineraliteit, fijnere mousse, diepere autolyse. Cava vaak rijper fruit, rondere structuur, Macabeo/Xarel·lo-signatuur.

Analysevolgorde: mousse → zuurintensiteit → fruitkarakter → autolyse → lengte. Niet raden op prestige — argumenteren op sensoriek.

Wanneer Cava wint blind? Rijpe Guarda Superior kan NV-Champagne benaderen op integratie tegen lagere verwachting.


## Food pairing

### Beste pairing

Blindproef-context: geen pairing — focus op vergelijkende analyse.

### Waarom dit werkt

Blind module meet methode- en terroir-lezen.

### Vermijd

Pairing tijdens blindronde — vervuilt methode-conclusie.

## Pro insight

Noteer na elke blindronde altijd je ''bijna-raak''-fout in één zin, zoals ''te veel op land vertrouwd, te weinig op mousse-integratie geproefd''. Diezelfde discipline kun je aan tafel gebruiken: wanneer een gast twijfelt tussen prijsklassen, leid het gesprek naar smaakbewijs in plaats van reputatie, en verkoop zo met meer overtuiging dan met merknaam.',
    '- blind
- Champagne
- Cava
- mousse-integratievergelijking
- blindproefprotocol
',
    'Blind proeven elimineert vooroordeel over land van herkomst: een goed gerijpte traditionele Cava scoort vaak hoger op mousse-integratie dan een jonge non-vintage Champagne, simpelweg omdat gistcontacttijd zwaarder weegt dan reputatie.
',
    '- Zelfde traditionele methode; verschillend terroir en druif
- Champagne: strakker, mineraliger, fijnere mousse
- Cava: rijper fruit, rondere zuurlijn
- Blind: mousse + zuur + autolyse-cluster
- Analyse belangrijker dan correct label
',
    '### Opdracht

Proef blind een Champagne en Cava.

### Checklist

- Ik analyseerde mousse
- Ik analyseerde zuur
- Ik analyseerde autolyse
- Ik maakte een keuze


### Reflectievraag

Welke ene sensorische factor gaf bij je laatste Champagne-vs-Cava blind de doorslag — en had je die vóór de proef verwacht?',
    10,
    1
  ),
  (
    'traditioneel-vs-tank-blind',
    'Traditioneel vs Tank blind',
    'Na deze les kun jij traditionele methode en tankmethode blind onderscheiden.
',
    'Traditioneel versus tank blind is de kern-Master-skill. Traditioneel: fijne mousse, brioche/toast, complexiteit, langere afdronk. Tank: primair fruit, directe stijl, minder autolyse, kortere afdronk.

Autolyse is vaak de snelste hint — maar check mousse en structuur ter bevestiging. Prosecco is niet de enige tankwijn; context helpt.

Fout bij blind: te snel naar druif; juist: methode eerst, regio daarna.


## Food pairing

### Beste pairing

Blindproef-context: twee onbekende glazen, geen food.

### Waarom dit werkt

Methode-herkenning vraagt neutrale proefomstandigheden.

### Vermijd

Rijke pairing tijdens methode-blind — maskeert autolyse-signaal.

## Pro insight

Twijfel je blind tussen tankmethode en traditionele methode, kies dan traditioneel bij een afdronk langer dan vijf seconden — die vuistregel klopt vaker dan niet. Gebruik dezelfde logica aan tafel: leg een gast uit dat lengte in de afdronk een eerlijker kwaliteitssignaal is dan de naam op het etiket, en je advies wordt meteen geloofwaardiger.',
    '- traditionele methode
- tankmethode
- autolyse
- blind
- structuur
',
    'Lengte van de afdronk is vaak de snelste blindindicator voor methode: traditionele flesgisting met autolyse-integratie geeft doorgaans een afdronk van meer dan vijf seconden, terwijl tankwijn sneller wegvalt.
',
    '- Traditioneel = autolyse + fijne mousse + lengte
- Tank = primair fruit + directe mousse
- Autolyse is primaire blindhint
- Structuur bevestigt methode-hypothese
- Methode vóór regio in conclusie
',
    '### Opdracht

Proef blind twee stijlen.

### Checklist

- Ik zocht autolyse
- Ik beoordeelde mousse
- Ik keek naar fruitniveau
- Ik maakte mijn conclusie


### Reflectievraag

Bij twijfel tussen brioche en rijp peer: welke extra check — mousse of afdronk — gebruik jij om de methode te bevestigen?',
    10,
    2
  ),
  (
    'theorie-praktijkexamen',
    'Theorie- en praktijkexamen',
    'Aantonen dat jij de basis van mousserende wijn op Master-niveau beheerst.
',
    'Dit Master-examen integreert de volledige track: fundamente, productie, proeven, Champagne, wereldstijlen, dosage, service, pairing en blindanalyse. Waarom drie onderdelen? Theorie toetst kennis; blind toetst sensorische methode; pairing toetst professioneel advies onder druk.

Succes vraagt: vaste proefvolgorde; dosage- en methode-hypotheses met argumenten; servicebewustzijn (temperatuur, glas); pairing per intensiteit en suiker. Fouten clusteren rond haast, verkeerde temperatuur en dosage-verwarring.

Bereid je voor met twee blinde sets per week en één schriftelijke pairing-case — dat dekt 90% van het examenpatroon.


## Food pairing

### Beste pairing

Examenonderdeel 3: kies per gerecht stijl op zuur, mousse, dosage en intensiteit.

### Waarom dit werkt

Pairing-examen test advieslogica, niet memoriseren van merken.

### Vermijd

Eén mousserende stijl voor alle drie gerechten — toont geen dosage-inzicht.

## Pro insight

Lees examenvragen als servicecases: wat zou je vrijdagavond om 20:00 uur schenken bij deze gast en dit gerecht? Diezelfde denkstap — waarneming, methode, advies — is precies wat een gast aan tafel van je verwacht, en wie dat onder examendruk kan, kan het zeker tijdens een drukke service.',
    '- examenprotocol
- blindproeven
- servicecasusanalyse
- gastronomische casuïstiek
- examenstrategie
',
    'Een examenvraag test zelden losse kennis, maar vraagt om drie stappen tegelijk: waarneming benoemen, methode of stijl herleiden, en daaruit een serviceadvies formuleren — wie die volgorde traint, scoort hoger dan wie alleen feiten stampt.
',
    '- Examen dekt volledige track: theorie, blind en pairing
- Theorie: minimaal 75% op 20 vragen
- Blind: twee glazen, vijf analyse-aspecten per glas
- Pairing: drie gerechten met gemotiveerde stijlkeuze
- Certificaten op 75%, 85% en 90% plus correcte blindanalyse
',
    '### Examenonderdeel 1 — Theorie

20 vragen. Minimaal 75% goed.

### Examenonderdeel 2 — Blindproeven

2 glazen:

Glas A — analyseer mousse, aroma, structuur, dosage en methode.

Glas B — analyseer mousse, aroma, structuur, dosage en methode.

### Examenonderdeel 3 — Pairing

Kies voor drie gerechten een passende mousserende stijl en motiveer waarom.

### Beoordeling

Explorer-certificaat: 75%

Specialist-certificaat: 85%

Master-certificaat: 90% + correcte blindanalyse


### Reflectievraag

Welk examenonderdeel — theorie, blind of pairing — is jouw zwakste schakel, en welke ene weekroutine zou dat het meest verkleinen?',
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
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 1, 'Wat zetten gisten om?', '["Suiker in alcohol en CO₂", "Water in alcohol", "Zuur in alcohol", "Zuurstof in alcohol"]', 0, 'Correct: Suiker in alcohol en CO₂'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 2, 'Waar wordt CO₂ gevangen?', '["In glas", "In fles of tank", "In vat", "In druif"]', 1, 'Correct: In fles of tank'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 3, 'Wat is autolyse?', '["Oxidatie", "Rijping op gistcellen", "Filtering", "Koeling"]', 1, 'Correct: Rijping op gistcellen'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 4, 'Autolyse geeft vaak:', '["Citrus", "Brioche", "Peper", "Kers"]', 1, 'Correct: Brioche'),
  ('intro-sparkling', 'hoe-ontstaan-bubbels', 5, 'Bij openen:', '["Verdwijnt alcohol", "Ontstaat CO₂ zichtbaar", "Stopt zuur", "Daalt suiker"]', 1, 'Correct: Ontstaat CO₂ zichtbaar'),
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
  ('suiker-stijl-sparkling', 'extra-dry-dry', 1, 'Is Extra Dry droger dan Brut?', '["Ja", "Nee", "Alleen bij hogere alcohol", "Ja, want 'Extra' verwijst naar extra droogheid"]', 1, 'Correct: Nee'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 2, 'Hoeveel restsuiker bevat Extra Dry?', '["0–3 g/l", "12–17 g/l", "17–32 g/l", "32–50 g/l"]', 1, 'Correct: 12–17 g/l'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 3, 'Hoeveel bevat Dry?', '["0–3 g/l", "6–12 g/l", "17–32 g/l", "50–60 g/l"]', 2, 'Correct: 17–32 g/l'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 4, 'Waarom is de naam verwarrend?', '["Het klinkt droger dan het is", "Het is zoeter dan Demi-Sec", "Het is altijd Brut Nature", "Het heeft geen suiker"]', 0, 'Correct: Het klinkt droger dan het is'),
  ('suiker-stijl-sparkling', 'extra-dry-dry', 5, 'Waar werkt Extra Dry goed?', '["Brunch en lichte gerechten", "Wild", "Steak", "Oude kaas"]', 0, 'Correct: Brunch en lichte gerechten'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 1, 'Wat is de droogste stijl?', '["Brut", "Extra Dry", "Brut Nature", "Demi-Sec"]', 2, 'Correct: Brut Nature'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 2, 'Wat is de standaardstijl?', '["Brut", "Dry", "Demi-Sec", "Doux"]', 0, 'Correct: Brut'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 3, 'Extra Dry is:', '["Droger dan Brut", "Zoeter dan Brut", "Gelijk aan Brut", "Zoeter dan Demi-Sec"]', 1, 'Correct: Zoeter dan Brut'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 4, 'Demi-Sec past goed bij:', '["Oesters", "Desserts", "Steak", "Zoutchips"]', 1, 'Correct: Desserts'),
  ('suiker-stijl-sparkling', 'demi-sec-en-zoet', 5, 'Wat bepaalt zoetheid?', '["Alcohol", "Dosage", "Druif", "Glaswerk"]', 1, 'Correct: Dosage'),
  ('service-sparkling', 'serveertemperatuur', 1, 'Wat is de ideale serveertemperatuur voor standaard Champagne?', '["2–4 °C", "8–10 °C", "14–16 °C", "18–20 °C"]', 1, 'Correct: 8–10 °C'),
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
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 1, 'Mousserend is alleen geschikt als aperitief.', '["Waar", "Niet waar", "Alleen bij Demi-Sec", "Alleen bij oude millésime"]', 1, 'Correct: Niet waar'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 2, 'Wat maakt mousserend breed inzetbaar?', '["Alleen alcohol", "Zuur en mousse", "Alleen suiker", "Alleen druif"]', 1, 'Correct: Zuur en mousse'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 3, 'Wat past goed bij risotto?', '["Champagne", "Port", "Madeira", "Sherry"]', 0, 'Correct: Champagne'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 4, 'Wat is cruciaal?', '["Etiket", "Stijlkeuze", "Flesvorm", "Leeftijd"]', 1, 'Correct: Stijlkeuze'),
  ('pairing-sparkling', 'mousserend-als-maaltijdwijn', 5, 'Kan mousserend bij dessert?', '["Nee", "Ja", "Alleen als het Brut Nature is", "Nooit bij kaas"]', 1, 'Correct: Ja'),
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
