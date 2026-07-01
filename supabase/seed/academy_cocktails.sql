-- Cocktails track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 41 lessons · quizvragen per les

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
    'Na deze les kun jij uitleggen wat een cocktail is en waarom balans, structuur en verdunning de kwaliteit bepalen.
',
    'Een cocktail is een samengesteld drankje waarbij twee of meer ingrediënten samen een nieuw geheel vormen. De term dateert uit vroeg negentiende-eeuwse Amerika.

Wat een cocktail onderscheidt van een mixdrankje is vakmanschap en balans. Elk bestanddeel heeft een functie: de base geeft kracht, de modifier stuurt het smaakprofiel, de accenten verfijnen het eindresultaat.

Een doordacht smaakprofiel — zoet, zuur, bitter en sterk in balans — is de handtekening van iedere goede bartender. Vakmanschap zit in ingrediënten, techniek en intentie.


## Food pairing

### Beste pairing

Zoute amandelen, oesters en gefrituurde snacks.

### Waarom dit werkt

Zout en vet vragen koolzuur, alcoholsnede en gecontroleerde zoetdruk; lichte bitterheid houdt spanning in het palet en voorkomt plakkerig mondgevoel.

### Vermijd

Suikerzware desserts zonder zuurcomponent.

## Pro insight

In service verkoop je geen recept maar zekerheid: benoem structuur en verdunning in gewone taal. Dat verlaagt keuzestress, versnelt upsell en houdt retouren laag.',
    '- cocktaildefinitie
- balans
- structuur
- verdunning
- mondgevoel
',
    'De vroegste gedrukte definitie van ''cocktail'' stamt uit 1806 en omschrijft het als een mengsel van spirits, suiker, water en bitters — vrijwel identiek aan de moderne Old Fashioned.
',
    '- Cocktails draaien om structuur, niet om decoratie.
- Balans ontstaat uit zuur, zoet, bitter, alcohol en temperatuur.
- Verdunning is een ingrediënt, geen bijeffect.
- Servicekwaliteit begint bij reproduceerbaarheid.
',
    '### Opdracht

Bestel of maak een eenvoudige cocktail naar keuze. Analyseer hem bewust: welk ingrediënt is de base, wat is de modifier en welk accent is toegevoegd? Noteer je bevindingen per component.

### Checklist

- Ik kan de drie componenten (base, modifier, accent) benoemen in een cocktail
- Ik proef bewust op balans: zoet, zuur, sterk, bitter
- Ik kan uitleggen wat deze cocktail onderscheidt van een simpel mixdrankje


### Reflectievraag

Welke fout in jouw huidige cocktaildefinitie zorgt het vaakst voor verkeerde verwachting bij gasten?',
    8,
    1
  ),
  (
    'geschiedenis-van-cocktails',
    'De geschiedenis van cocktails',
    'Na deze les kun jij de belangrijkste periodes uit cocktailgeschiedenis koppelen aan hedendaagse barkeuzes.
',
    'De cocktailgeschiedenis begint vroeg negentiende eeuw in Amerika, waar apothekers bitters vermengden met sterkedrank. De eerste cocktailcultuur groeide in saloons langs de Oostkust.

De Prohibition (1920–1933) dreef bartenders underground maar versterkte hun creativiteit. Clandestiene bars verfijnden recepten en creëerden klassiekers — van de Bee''s Knees tot de Sidecar.

Na de Tweede Wereldoorlog bloeide de cocktailcultuur opnieuw op. De craft-renaissance bracht de moderne bartender terug naar eeuwenoude recepten met eigentijdse precisie.


## Food pairing

### Beste pairing

Klassieke canapes, paté en gerijpte kaas.

### Waarom dit werkt

Historische classics werken op vet-zout-umami; bitter en verdunning maken rijke happen lichter zodat aroma langer blijft staan.

### Vermijd

Zeer zure gerechten die de alcoholintegratie breken.

## Pro insight

Gebruik geschiedenis als verkoopscript in 20 seconden: oorsprong, reden van techniek, wat de gast nu proeft. Dat maakt klassieke cocktails premium zonder elitair te klinken.',
    '- cocktailgeschiedenis
- klassieker
- prohibition
- craft
- barcontext
',
    'Tijdens de Prohibition werden cocktails bewust zoeter en sterker gemaakt om de slechte kwaliteit van illegaal gedistilleerde spirits te maskeren — zo ontstonden veel van onze geliefdste klassiekers.
',
    '- Geschiedenis verklaart waarom klassiekers zo gebouwd zijn.
- Elke periode voegde techniek en taal toe.
- Kennis van context verhoogt gastvertrouwen.
- Traditie is bruikbaar als besliskader voor nu.
',
    '### Opdracht

Kies één klassieke cocktail die tijdens of vlak na de Prohibition ontstond (bijv. Bee''s Knees, Last Word of Sidecar). Zoek de oorsprong op en proef hem bewust. Beschrijf hoe de historische context de samenstelling verklaart.

### Checklist

- Ik ken minimaal drie mijlpalen in de cocktailgeschiedenis
- Ik kan uitleggen waarom de Prohibition cocktails zoeter en sterker maakte
- Ik heb een Prohibition-klassieke geproefd en de connectie met zijn context beschreven


### Reflectievraag

Welke historische les helpt jou vandaag het meest om een klassieker sneller en beter uit te leggen?',
    8,
    2
  ),
  (
    'spirit-modifier-balance',
    'Spirit, modifier en balans',
    'Na deze les kun jij de verhouding tussen spirit en modifiers analyseren en technisch bijsturen naar balans.
',
    'Elke cocktail rust op drie pijlers: de base spirit geeft sterkte en karakter, de modifier voegt diepte toe, en aanvullende elementen brengen balans. Dit drieluik bepaalt de cocktailstructuur van elk klassiek recept.

De modifier kan een likeur, vermouth of sap zijn. Een te dominante modifier overspoelt de base spirit; te weinig laat de drank vlak aanvoelen.

Echte balans proef je wanneer geen element domineert. De kunst is proportie: de juiste verhouding tussen kracht, zoetheid, zuurheid en bitterheid die samen een samenhangend smaak-verhaal vertellen en één heldere smaak opleveren.


## Food pairing

### Beste pairing

Citroenkip, gegrilde garnalen en jonge geitenkaas.

### Waarom dit werkt

De spirit-modifier-balans vangt zout en vet; zuur lift aroma, zoet dempt scherpe randen en bitter houdt de afdronk droog.

### Vermijd

Overmatig zoete sauzen zonder tegengewicht.

## Pro insight

Maak een correctievolgorde zichtbaar voor het team: eerst zuur-zoet, dan bitter, dan verdunning. Zo voorkom je dat junior bartenders tegelijk aan alle knoppen draaien.',
    '- base spirit
- modifier
- integratie
- spanning
- correctievolgorde
',
    'De klassieke Negroni — gin, vermouth rosso en Campari in gelijke delen — is het schoolvoorbeeld van perfecte spirit-modifier-balans: drie gelijkwaardige stemmen die samen één karakter vormen.
',
    '- Base spirit zet gewicht en richting.
- Modifiers sturen spanning en aromatische lift.
- Correctievolgorde voorkomt oversturen.
- Integratie is belangrijker dan intensiteit alleen.
',
    '### Opdracht

Maak een Negroni met de standaardverhouding (1:1:1). Proef hem bewust. Pas daarna één element aan: verhoog de gin naar 1,5 deel en houd de rest gelijk. Wat verandert er aan de balans en het smaakprofiel?

### Checklist

- Ik kan base spirit en modifier in een recept benoemen
- Ik proef het effect van een proportieverandering op de balans
- Ik kan uitleggen waarom de standaardverhouding voor dit recept werkt
- Ik begrijp hoe cocktailstructuur en proportie samenhangen


### Reflectievraag

Wanneer stuur jij te laat op modifierbalans, en welk signaal had je eerder moeten herkennen?',
    8,
    3
  ),
  (
    'basisstructuren-cocktails',
    'De basisstructuren van cocktails',
    'Na deze les kun jij basisstructuren herkennen en per structuur de juiste techniek en ijsstrategie kiezen.
',
    'Cocktailstructuren zijn herhaalbare smaakarchitecturen. De sour-structuur draait om spirit, zuur en zoet; de old-fashioned-structuur om spirit, suiker, bitters en gecontroleerde verdunning; de martini-structuur om spirit plus aromatische versterker met hoge helderheid; en de highball-structuur om lengte, koolzuur en frisheid.

Wie structuren beheerst, kan sneller corrigeren: eerst zuur-zoet, daarna bitteras, dan verdunning. Zo blijft het glas in balans zonder overmixen of overgarnish.


## Food pairing

### Beste pairing

Steak tartaar, charcuterie en citrusrijke salades.

### Waarom dit werkt

Sour-structuur werkt met zuur op vet, old-fashioned-structuur met bitter op umami, highball-structuur met koolzuur op zout en textuur.

### Vermijd

Eenzijdige pairing op alleen intensiteit of alleen kleur.

## Pro insight

Werk met structuurstations in mise-en-place en batch de neutrale componenten per familietype. Dat verhoogt snelheid terwijl balans en textuur stabiel blijven tijdens piekdrukte.',
    '- sour-structuur
- old-fashioned-structuur
- martini-structuur
- highball-structuur
- ijsstrategie
',
    'Met kennis van slechts vijf basisstructuren kun je meer dan negentig procent van alle klassieke cocktailrecepten analyseren en reproduceren — het is het alfabet van de bar.
',
    '- Vier basisstructuren dekken het grootste deel van de kaart.
- Techniek volgt structuur, niet andersom.
- Ijs en glas bepalen mee het eindresultaat.
- Snelle diagnose voorkomt serviceverlies.
',
    '### Opdracht

Kies één cocktail uit elk van de drie structuren (sour, highball, old fashioned). Maak ze na en schrijf voor elk de ratio op. Proef ze naast elkaar en beschrijf wat de structuur doet met het drinkgemak en de alcoholperceptie.

### Checklist

- Ik herken de drie basisstructuren in een cocktailrecept
- Ik kan de standaardratio van elke structuur benoemen
- Ik heb de drie structuren naast elkaar geproefd en vergeleken


### Reflectievraag

Welke basisstructuur op jouw kaart veroorzaakt de meeste inconsistentie en waarom precies daar?',
    8,
    4
  ),
  (
    'klassieke-cocktailcategorieen',
    'Klassieke cocktailcategorieën',
    'Na deze les kun jij cocktailcategorieen inzetten om kaartadvies, servicevolgorde en gastverwachting te sturen.
',
    'Cocktails worden ingedeeld naar functie en serveermoment. Een aperitief bereidt de maag voor: licht, droog en smaakontwikkelend. Een digestief sluit de maaltijd af met rijkere, aromatische eigenschappen.

Een short drink wordt in een klein glas geserveerd met hogere alcoholconcentratie. Een long drink is groter van volume en bevat koolzuur of sap — een verfrissende categorie voor een langere avond.

Kennis van categorie helpt bij drankenkaartadvies. Een goede bartender denkt in functie, timing en de juiste categorie per moment.


## Food pairing

### Beste pairing

Aperitiefhapjes, blauwschimmelkaas en pure chocolade.

### Waarom dit werkt

Categoriekeuze stuurt chemie: fris/highball voor zout en vet, stirred klassiek voor umami, bitter-gedragen drinks voor cacao-bitter.

### Vermijd

Een zware digestiefstijl als standaard voor elk gerecht.

## Pro insight

Categorieen sturen marge: zet toegankelijke highballs als entree en stuur daarna naar stirred klassiekers met hogere waarde. Heldere routekaart verhoogt bonwaarde per tafel.',
    '- categorie
- kaartsegmentatie
- serviceflow
- upsell
- gastprofiel
',
    'De Negroni Sbagliato — met prosecco in plaats van gin — begon als een vergissing maar groeide uit tot een geliefde aperitief-cocktail die de grens tussen wijn en cocktailcultuur vervaagt.
',
    '- Categorieen helpen gasten kiezen zonder jargon.
- Kaartopbouw moet op context en moment werken.
- Short en long drinks vragen andere flow.
- Goede segmentatie verhoogt conversie en tevredenheid.
',
    '### Opdracht

Stel een mini-drankenkaart samen van zes cocktails: twee aperitief, twee digestief en twee long drinks. Schrijf per cocktail op waarom hij in die categorie past. Bespreek je keuzes met een collega of vriend.

### Checklist

- Ik kan het verschil tussen aperitief en digestief benoemen
- Ik onderscheid short drink van long drink op basis van structuur en volume
- Ik kan een mini-drankenkaart indelen naar functie en moment
- Ik gebruik categorie-logica bij gastadvies


### Reflectievraag

Welke categorie op jouw kaart wordt te breed gecommuniceerd, waardoor upsellkansen verloren gaan?',
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
    'Na deze les kun jij shaken correct uitvoeren met controle op temperatuur, textuur en aromatische lift.
',
    'Shaken transformeert de textuur van een cocktail. Door krachtig mengen in een cocktailshaker ontstaat ijsverdunning, koeling en luchtigheid die roeren nooit biedt.

Het shaken zorgt voor emulsificatie: vet, sap en alcohol worden samengebracht tot een homogeen geheel. Essentieel bij citrus, eiwit of roomachtige ingrediënten.

De vuistregel: shaken bij citrus of troebele ingrediënten. Te lang shaken geeft overmatige ijsverdunning. Tien tot vijftien seconden in een gekoelde cocktailshaker is de standaard.


## Food pairing

### Beste pairing

Ceviche, tempura en geitenkaas.

### Waarom dit werkt

Shaken-drinks leveren hogere zuurspanning en koel mondgevoel; dat snijdt vet en tilt delicate aroma''s zonder verlies van textuur.

### Vermijd

Warme, zoete desserts die de citruslijn platdrukken.

## Pro insight

Train shake-rondes op geluid en gewicht in de shaker: te lang = oververdunning en textuurverlies; te kort = scherpe zuur zonder integratie. Gebruik dat als teamcalibratie vóór shift — gasten merken temperatuur en mondgevoel eerder dan jouw handtechniek.',
    '- shaken
- airatie
- dubbelzeven
- koudeopbouw
- textuur
',
    'Een goed geshaken cocktail bereikt een temperatuur van min zes graden Celsius — kouder dan de meeste koelkasten — en dat is bepalend voor de textuur en de perceptie van zoetheid.
',
    '- Shaken brengt koeling, verdunning en textuur samen.
- Te lang shaken maakt dun en vlak.
- Dubbelzeven houdt textuur strak.
- Citrusdrinks vragen direct service tempo.
',
    '### Opdracht

Maak een Whiskey Sour twee keer: één keer 8 seconden en één keer 15 seconden geshaken. Vergelijk textuur, temperatuur en smaak direct na het uitschenken. Noteer wat de extra schudtijd doet met de balans en het mondgevoel.

### Checklist

- Ik weet wanneer shaken de voorkeur heeft boven roeren
- Ik proef het effect van schudtijd op textuur en ijsverdunning
- Ik kan emulsificatie herkennen in een geshaken cocktail


### Reflectievraag

Welke technische stap in jouw shake-routine geeft de grootste variatie in textuur tussen rondes?',
    8,
    1
  ),
  (
    'stirred',
    'Stirred',
    'Na deze les kun jij stirred cocktails bouwen met maximale helderheid, integratie en gecontroleerde verdunning.
',
    'Stirred cocktails worden geroerd in een mixing glass met ijs, niet geschud. Deze methode behoudt transparantie en een zijdezachte textuur.

Roeren brengt geleidelijke verdunning tot stand zonder lucht. Cruciaal voor spirit-forward cocktails waar aroma''s niet vertroebeld mogen worden.

Dertig tot veertig rotaties in een voorgekoelde mixing glass is de standaard. Transparantie is het zichtbare kwaliteitsteken van stirred vakmanschap.


## Food pairing

### Beste pairing

Gerookte vis, oude kaas en paddenstoelen-toast.

### Waarom dit werkt

Stirred-profielen koppelen bitter, umami en vet met gecontroleerde verdunning; lage temperatuur houdt structuur scherp en aromatische lift strak.

### Vermijd

Kruidige chili-gerechten die de subtiele integratie overschreeuwen.

## Pro insight

Bij stirred cocktails wint verwachtingsmanagement op ijsvolume: te veel ijs in een kleine mixing glass forceert haast en oververdunning. Werk met vaste ijsblokken en roertijd per recept; dat is senior dilution management, geen persoonlijke stijl.',
    '- stirred
- helderheid
- viscositeit
- smeltcurve
- aromabehoud
',
    'James Bond''s ''shaken, not stirred'' is vanuit bartenderperspectief een blunder: shaken maakt een Martini troebel en verwaterd — stirred geeft de gin de ruimte die hij verdient.
',
    '- Stirred cocktails vragen rust en precisie.
- Helderheid en viscositeit zijn kwaliteitsmarkers.
- Ijsdichtheid stuurt verdunningssnelheid.
- Garnish moet aroma steunen, niet overschreeuwen.
',
    '### Opdracht

Maak een Manhattan twee keer: één keer geshaken, één keer geroerd in de mixing glass. Vergelijk kleur, textuur en mondgevoel direct naast elkaar. Welke versie toont meer karakter van de whisky?

### Checklist

- Ik begrijp waarom stirred beter is voor spirit-forward cocktails
- Ik proef het verschil in verdunning en textuur tussen shaken en roeren
- Ik beheers de techniek van 30–40 rotaties in de mixing glass
- Ik kan transparantie als kwaliteitsmeter benoemen


### Reflectievraag

Waar verlies jij bij stirred drinks het meeste aan helderheid: ijs, roertijd of snelheid?',
    8,
    2
  ),
  (
    'built',
    'Built',
    'Na deze les kun jij built cocktails snel en consistent serveren met behoud van koolzuur en structuur.
',
    'Built cocktails worden direct in het serveerglas opgebouwd — geen extra mengvat nodig. Directe opbouw is toegankelijk en vereist precisie in volgorde.

De opbouw volgt altijd dezelfde logica: ijs eerst, dan spirits, dan aanvullers, en carbonatie als allerlaatste. Zo blijft de koolzuur bewaard.

Eenvoud is de kracht van built cocktails: kwaliteitsijs, het juiste glas en ingrediënten op temperatuur. Minimaal omroeren na carbonatie behoudt de textuur.


## Food pairing

### Beste pairing

Oesters, sushi en lichte borrelplanken.

### Waarom dit werkt

Built-stijl met koolzuur neutraliseert zout en vet, terwijl citrus of bittercomponent de mond schoon houdt voor volgende happen.

### Vermijd

Romige desserts met hoge suikerdruk.

## Pro insight

Built-drinks lijken simpel maar fouten schuilen in top-up discipline. Meet koolzuurverlies door stilstand en pas je servicevolgorde aan op piekmomenten.',
    '- built
- koolzuurbehoud
- top-up
- ijsmanagement
- tempo
',
    'De beste Gin & Tonic wordt gebouwd in een copa-glas met grote ijsblokken, niet kleine stukjes — groot ijs smelt trager, verdunt minder en houdt de carbonatie langer intact.
',
    '- Built drinks winnen op snelheid en frisheid.
- Koolzuurbehoud is kernkwaliteit.
- Roeren gebeurt kort en doelgericht.
- Consistente opbouw voorkomt verschil per ronde.
',
    '### Opdracht

Maak een Gin & Tonic op twee manieren: met klein crushed ijs en met grote ijsblokken. Observeer na vijf minuten het verschil in verdunning. Noteer wat dit doet met de carbonatie en het smaakprofiel.

### Checklist

- Ik volg de juiste opbouwvolgorde bij een built cocktail
- Ik begrijp waarom carbonatie als laatste wordt toegevoegd
- Ik proef het effect van ijsgrootte op verdunning en frisheid


### Reflectievraag

Welke built-cocktail op jouw kaart lijdt het meest onder koolzuurverlies tijdens piekservice?',
    8,
    3
  ),
  (
    'layering',
    'Layering',
    'Na deze les kun jij layering toepassen op een veilige, stabiele en smaaklogische manier.
',
    'Layering is het stapelen van vloeistoffen op basis van soortelijk gewicht. Hogere densiteit zakt naar de bodem; lichtere vloeistoffen drijven erop.

De techniek vereist een barlepel en een beheerste hand. Gieten langs de glaswand of via de bolle kant van de barlepel houdt elke laag stabiel.

Layering levert een indrukwekkend visueel effect en smaakevolutie: de gast ervaart elke laag afzonderlijk, van licht en fris naar diep en complex.


## Food pairing

### Beste pairing

Desserts met roomlaag en notige petit fours.

### Waarom dit werkt

Layering kan textuursequentie afstemmen op vet en zoet, waarbij bitter en alcohol de finale droogte terugbrengen.

### Vermijd

Zoutarme, neutrale bites die geen structuurcontrast geven.

## Pro insight

Layering verkoopt op zicht, maar alleen als smaaksequentie klopt. Train met water-suiker proeflagen voordat je met premium spirits werkt om waste te beperken.',
    '- layering
- dichtheid
- smaaksequentie
- presentatie
- foutreductie
',
    'De B-52 shot — Kahlúa, Baileys en Grand Marnier in lagen — is een klassieker die uitsluitend op soortelijk gewicht gebouwd is: elke laag heeft een exact meetbare densiteit.
',
    '- Layering is techniek met risico op show boven smaak.
- Dichtheid en temperatuur bepalen stabiliteit.
- Smaakvolgorde moet logisch blijven.
- Visuals mogen structuur niet breken.
',
    '### Opdracht

Maak een B-52 of een eenvoudige gelaagde drank met drie vloeistoffen van verschillende densiteit. Gebruik de bolle kant van de barlepel voor elke laag. Maak een foto van het resultaat en beschrijf de smaakevolutie van eerste tot laatste slok.

### Checklist

- Ik begrijp het principe van soortelijk gewicht en densiteit bij layering
- Ik gebruik de barlepel correct voor gecontroleerd gieten
- Ik creëer een zichtbaar visueel effect met minimaal twee lagen
- Ik beschrijf de smaakevolutie van licht naar zwaar


### Reflectievraag

Wanneer levert layering visuele winst maar smaaktechnisch verlies op in jouw huidige uitvoering?',
    8,
    4
  ),
  (
    'muddling',
    'Muddling',
    'Na deze les kun jij muddling doelgericht inzetten zonder bitterextractie of textuurverlies.
',
    'Muddling is het zachtjes kneuzen van verse ingrediënten in het glas om etherische oliën, sappen en aroma''s vrij te maken. Een muddler — een houten of stalen stamper — is hiervoor het juiste gereedschap.

De techniek vereist dosering: te hard stampen breekt celwanden en geeft bitterheid, te zacht leidt tot onvoldoende extractie. Verse ingrediënten als munt, komkommer of citrusschil reageren elk anders op druk.

Muddling is een uitdrukking van vakmanschap: wie de juiste druk beheerst, haalt het maximale uit verse ingrediënten zonder onaangename bijsmaken te introduceren in het eindresultaat.


## Food pairing

### Beste pairing

Munt-rijke salades, gegrilde perzik en lichte geitenkaas.

### Waarom dit werkt

Muddled kruiden werken met aroma en fris zuur; beperkte extractie bewaart groene lift zonder bitter bladprofiel.

### Vermijd

Overmuddled schilcomponenten bij delicate gerechten.

## Pro insight

Muddling moet je behandelen als extractietechniek met limieten. Batch je siroop slim zodat je minder hoeft te forceren in de shaker en bitters in de schil vermijdt.',
    '- muddling
- extractiecontrole
- kruidenlift
- bitterrisico
- drukdosering
',
    'Mojito-munt wordt gemuddled met suiker, niet met rum — de suikerkristallen fungeren als schuurmiddel dat de etherische oliën efficiënter uit de muntblaadjes losmaakt.
',
    '- Muddling is extractiecontrole.
- Te hard muddlen geeft bitter en troebel.
- Zachte druk bewaart frisse aroma''s.
- Muddle alleen wat functioneel bijdraagt.
',
    '### Opdracht

Maak een Mojito en focus specifiek op de muddling: kneus de munt met suiker, zachtjes en bewust. Ruik tussendoor aan het glas. Maak daarna een tweede versie waarbij je te hard stampt en vergelijk het smaakresultaat naast elkaar.

### Checklist

- Ik muddel met de juiste druk — geen overmatige kracht
- Ik proef het verschil tussen correcte en te agressieve muddling
- Ik herken etherische oliën in geur voor en na de extractie


### Reflectievraag

Hoe toets je of jouw muddling nog extractiecontrole is en geen brute kracht?',
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
    'Na deze les kun jij base spirits technisch vergelijken op mondgevoel, aromaprofiel en inzetbaarheid.
',
    'De base spirit vormt het fundament van elke cocktail. De zes klassieke categorieën zijn gin, vodka, rum, tequila, whisky en cognac.

Elk distillaat heeft een eigen smaakprofiel gevormd door grondstof en rijping. Rum put uit suikerriet, whisky uit graan, tequila uit agave — de origine is altijd smaakbepalend.

Een goede bartender kent zijn base spirits en kiest bewust. Het distillaat dicteert de richting van het recept en de keuze van modifiers.


## Food pairing

### Beste pairing

Gerookt vlees, harde kazen en pure chocolade.

### Waarom dit werkt

Rijke base spirits dragen umami en vet via alcoholwarmte, bitteras en mondvulling; zuurcomponenten moeten ondersteunend blijven.

### Vermijd

Te lichte, waterige gerechten zonder tegenkracht.

## Pro insight

Koppel base spirit-keuze aan gastintentie: strak, rond of aromatisch. Dat verkort adviesgesprekken en maakt verkoop van hogere segmenten natuurlijker.',
    '- base spirit
- body
- distillaatstijl
- aromaprofiel
- inzetbaarheid
',
    'Tequila is de enige grote spirit ter wereld met een beschermde geografische oorsprong én een verplicht gehalte aan één specifieke plant: de blauwe Weber-agave uit de Mexicaanse staat Jalisco.
',
    '- Base spirits verschillen in mondgevoel en aromaprojectie.
- ABV alleen zegt weinig over mondgevoel.
- Distillaatstijl stuurt cocktailarchitectuur.
- Spiritkeuze bepaalt batchstrategie en marge.
',
    '### Opdracht

Proef drie verschillende base spirits puur, op kamertemperatuur, in een klein glas. Beschrijf voor elk: geur, smaak, mondgevoel en afdronk. Noteer welke cocktail je bij elk distillaat zou maken en waarom.

### Checklist

- Ik kan de zes klassieke base spirits benoemen
- Ik beschrijf het smaakprofiel van minimaal drie distillaten
- Ik leg de link tussen origine en smaakkarakter
- Ik koppel elk distillaat aan een passend cocktailrecept


### Reflectievraag

Welke base spirit wordt in jouw bar te vaak gekozen op merk in plaats van structuurfit?',
    8,
    1
  ),
  (
    'likeuren',
    'Likeuren',
    'Na deze les kun jij likeuren functioneel selecteren op zoetkracht, aromatische brug en integratie.
',
    'Likeuren zijn gedistilleerde dranken verrijkt met suiker, kruiden, fruit of specerijen. Als modifier geven ze zoetheid, kleur en aromatisering in één beweging.

De zoetingsgraad varieert: van droge amaro''s tot suikerrijke crèmelikeuren. Ken de zoetingsgraad om de juiste balans te bewaken en zoete resultaten te voorkomen.

Curaçao, Campari en Chartreuse tonen wat een likeur vermag als modifier. Kwaliteitslikeuren bieden aromatisering die kunstmatige alternatieven niet evenaren.


## Food pairing

### Beste pairing

Fruitdesserts, eendenlever en blauwaderkaas.

### Waarom dit werkt

Likeurzoet vangt zout en bitter, terwijl aromatische verbinding de brug slaat tussen gerecht en basisdistillaat.

### Vermijd

Likeur-op-likeur combinaties zonder zuur of bittercorrectie.

## Pro insight

Likeuren zijn je snelste knop voor gastpersonalisatie, maar ze verhogen ook foutkans. Werk met halve stapjes in ml en proef direct op integratie, niet op zoetheid alleen.',
    '- likeur
- zoetkracht
- aromatische brug
- integratie
- dosering
',
    'Chartreuse Verte wordt gemaakt door Karthuizer monniken in de Franse Alpen op basis van 130 botanicals — het exacte recept is een van de best bewaarde geheimen in de drankenwereld.
',
    '- Likeuren zijn smaaktools, geen suikertruc.
- Zoetkracht moet in verhouding tot zuur.
- Aromatische brug maakt integratie sneller.
- Te veel likeur maskeert structuur.
',
    '### Opdracht

Proef drie likeuren puur: één droge (bijv. Campari), één middelzoete (Cointreau) en één rijke (Chambord of crème de cassis). Rangschik ze op zoetingsgraad en bedenk voor elk een klassiek recept waarbij ze als modifier functioneren.

### Checklist

- Ik begrijp de rol van de likeur als modifier in een cocktail
- Ik rangschik likeuren op zoetingsgraad na proeven
- Ik koppel elke likeur aan een passend cocktailrecept
- Ik vermijd zoetigheidsonevenwicht door bewust te doseren


### Reflectievraag

Waar gebruik jij likeur als snelle oplossing terwijl een zuur- of bittercorrectie beter was?',
    8,
    2
  ),
  (
    'bitters',
    'Bitters',
    'Na deze les kun jij bitters doseren als structurele tool voor spanning, lengte en droogte-indruk.
',
    'Bitters zijn geconcentreerde extracten van botanicals — kruiden, wortels, bast en specerijen. Enkele druppels geven diepte en complexiteit die geen ander ingrediënt levert.

Angostura is het klassieke voorbeeld: een iconische blend die eeuwenlang recepten definieerde. Het spectrum reikt van sinaasappelbitters tot aromatische kruidenvarianten.

Bitters zijn de finishing touch die een drankje van goed naar uitzonderlijk tilt. Zonder bitters ontbreekt structuur; met de juiste bitters vindt een cocktail voltooiing.


## Food pairing

### Beste pairing

Donkere chocolade, oude kaas en geroosterde noten.

### Waarom dit werkt

Bitters versterken lengte en droogte, waardoor vet en zoet in balans komen; umami blijft helder door gecontroleerde bitterdosering.

### Vermijd

Zeer tanninerijke bites met extra bittere sauzen.

## Pro insight

Bitters zijn margeneutraal maar kwaliteitskritisch. Met consistente dash-techniek kun je dezelfde batch ineens strakker laten smaken zonder extra kosten.',
    '- bitters
- spanning
- droogte-indruk
- lengte
- dash-techniek
',
    'Angostura bitters hebben altijd een label dat te groot is voor de fles — dit was een vergissing bij de eerste productie, maar werd zo''n herkenbaar handelsmerk dat het nooit gecorrigeerd werd.
',
    '- Bitters leveren spanning en lengte.
- Dosis werkt in druppels, niet in shots.
- Bitters kunnen zoetdruk verlagen.
- Correct gebruik verbetert droge finish.
',
    '### Opdracht

Maak een Old Fashioned twee keer: één met Angostura bitters en één zonder. Proef ze naast elkaar. Wat verdwijnt er zonder de finishing touch? Noteer het verschil in complexiteit, structuur en afdronk.

### Checklist

- Ik begrijp de functie van bitters als finishing touch
- Ik proef het verschil in complexiteit met en zonder bitters
- Ik ken Angostura en minimaal één alternatieve bitter


### Reflectievraag

Welke cocktail op jouw kaart zou met een andere bittersdosering direct consistenter worden?',
    8,
    3
  ),
  (
    'citrus-en-suikers',
    'Citrus en suikers',
    'Na deze les kun jij citrus en suikers combineren tot gecontroleerde zuur-zoetbalans in verschillende structuren.
',
    'Citrus en suiker vormen het zuur-zoet-paar van talloze klassiekers. Versgeperst sap geeft levendigheid; flessensap geeft een platte smaak die afzwakt.

Suikersiroop is de meest gebruikte zoetmaker — lost sneller op dan kristalsuiker en geeft egale zoetheid. Rijke suikersiroop (2:1) voegt ook mondgevoel toe.

Zuurbalans is het gevoeligste aspect van cocktailmaken. Een kwart citroen extra of een halve barlepel zoetmaker meer maakt het verschil tussen vlak en gebalanceerd.


## Food pairing

### Beste pairing

Citrustart, ceviche en romige kazen.

### Waarom dit werkt

Zuur snijdt door vet en activeert speeksel; gecontroleerde zoetheid balanceert citrus zonder umami te vervlakken; zout versterkt aromatische lift op het palet.

### Vermijd

Ongebalanceerde zure gerechten met te weinig zout of vet.

## Pro insight

Citrus verandert elk uur. Plan micro-batches siroop en line-check elke serviceblokkade; zo blijft je zuur-zoet-as stabiel en voorkom je klachten over scherpe sours.',
    '- citrus
- suiker
- zuur-zoetbalans
- sirooptype
- kalibratie
',
    'Citroensap en limoensap zijn niet uitwisselbaar: citroen is milder en fruitiger, limoen is scherper en tropischer — de keuze verandert het karakter van een sour fundamenteel.
',
    '- Citrus en suiker bepalen het hart van veel classics.
- Verhouding verandert met ijs en temperatuur.
- Sirooptype stuurt textuur.
- Consistente meting voorkomt schommelingen.
',
    '### Opdracht

Maak een Daiquiri met versgeperst limoensap én een versie met flessenap. Proef ze naast elkaar. Wissel daarna in de versversie de limoen door citroen. Beschrijf het karakterverschil tussen alle drie de versies.

### Checklist

- Ik proef het verschil tussen versgeperst en flessenap
- Ik begrijp het onderscheid tussen citroen en limoen in een sour
- Ik pas suikersiroop-dosering aan op basis van smaak en zuurbalans
- Ik gebruik zuurbalans bewust als sturingselement


### Reflectievraag

Hoe ga jij om met variatie in citruskracht tussen middag en avondservice?',
    8,
    4
  ),
  (
    'mini-toets-cocktails',
    'Mini-toets Cocktails',
    'Na deze les kun jij in een mini-toets theorie en techniek integreren en onderbouwde keuzes verantwoorden.
',
    'Deze mini-toets meet integratie, niet losse feiten. Je toont dat je techniek, smaaklogica en servicetempo tegelijk kunt managen. Het doel is reproduceerbaarheid: een cocktail moet onder druk hetzelfde niveau halen.

Fouten zijn vooral leerdata. Analyseer of de afwijking komt uit receptdiscipline, ijsmanagement of timing, en vertaal dat direct naar je volgende service-setup.


## Food pairing

### Beste pairing

Driegangen oefenmenu: zout, umami, zoet.

### Waarom dit werkt

Toetspairing meet of je zuur, zoet, bitter, vet en zout als variabelen kunt verbinden met techniek en verdunning.

### Vermijd

Ad-hoc pairen zonder vooraf smaakanalyse.

## Pro insight

Gebruik toetsdata als operationeel dashboard: welke fouten komen terug, in welke shift, bij welke techniek. Dat maakt training gericht en direct winstgevend.',
    '- mini-toets
- integratie
- beslisvaardigheid
- reproduceerbaarheid
- foutenanalyse
',
    'De beste bartenders ter wereld bereiden hun mise-en-place alsof elke shift een wedstrijd is — niet om indruk te maken, maar omdat voorbereiding de ruimte geeft om volledig aanwezig te zijn voor de gast.
',
    '- Toetsing meet beslisvaardigheid onder druk.
- Techniek en theorie moeten samenkomen.
- Foutenanalyse geeft snelste groei.
- Herhaalbare output is de norm.
',
    '### Opdracht

Bereid een mise-en-place voor vier cocktails die elk een andere techniek vereisen: één geshaken sour, één stirred spirit-forward, één built highball en één gemuddlede cocktail. Voer ze achter elkaar uit alsof het een echte barshift is. Evalueer daarna eerlijk: welke techniek vraagt nog de meeste verfijning?

### Checklist

- Ik bereid een volledige mise-en-place voor alle vier technieken
- Ik voer alle vier cocktails correct en sequentieel uit
- Ik evalueer techniek, balans en timing na afloop
- Ik benoem concreet welke techniek ik verder wil oefenen


### Reflectievraag

Welke terugkerende fout uit jouw mini-toets moet eerst opgelost worden voor schaalbare kwaliteit?',
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
    'Na deze les kun jij een Martini technisch zuiver opbouwen en afstellen op gastvoorkeur.
',
    'De Martini is een precisiecocktail waarin kleine afwijkingen direct hoorbaar worden in de smaak. Temperatuur, roertijd, vermoutverhouding en garnish bepalen samen of het glas scherp, vlak of perfect integraal overkomt.

Professionele uitvoering betekent vooraf kaderen: dry, wet of 50/50, met heldere uitleg voor de gast en strakke herhaalbaarheid achter de bar.


## Food pairing

### Beste pairing

Ziltige olijven, oesters en amandelchips.

### Waarom dit werkt

Martini-structuur werkt met zout en vet via droge spanning, lage temperatuur en aromatische lift uit garnish.

### Vermijd

Zoete desserts of sterk gekruide sauzen.

## Pro insight

Martini-verkoop stijgt als je vooraf twee vragen stelt: droogte en garnish. Dat levert controle op verwachting, minder remakes en meer vertrouwen in premium gin-upsell.',
    '- martini
- vermouth
- roertijd
- garnish
- precisie
',
    'Winston Churchill bereidde de ''droogste Martini ooit'' door slechts in de richting van de vermouthfles te kijken terwijl hij gin inschonk.
',
    '- Martini vraagt maximale precisie.
- Vermoutkwaliteit is niet optioneel.
- Roerduur stuurt integratie en mondgevoel.
- Garnishkeuze verandert aromatische richting.
',
    '### Opdracht
Bereid drie Martini-varianten met verhoudingen 3:1, 6:1 en 9:1 (gin:vermouth). Proef elke versie en beschrijf het verschil in droogheid en textuur.

### Checklist
- Glas voorgekoeld
- Roertijd minimaal 30 seconden
- Smaak beoordeeld op droogheid en mondgevoel
- Garnering correct aangebracht (citroentuit uitgedrukt over glas)


### Reflectievraag

Wanneer wijk jij in Martini-service af van standaard en hoe onderbouw je die afwijking?',
    8,
    1
  ),
  (
    'old-fashioned',
    'Old Fashioned',
    'Na deze les kun jij een Old Fashioned als kerncocktail bouwen met strakke suiker-bitter-balans en verdunning.
',
    'De Old Fashioned is een van de oudste cocktailrecepten ter wereld en legt de basis van het ''Sling''-format: sterkedrank, suiker en bitters. Bourbon of rye whiskey vormt de ruggengraat van dit tijdloze recept.

Suiker wordt traditioneel opgelost via een suikerklontje met een scheutje water en angostura bitters. Moderne bartenders kiezen voor suikersiroop als consistentere methode. Bitters geven diepte en aromatische complexiteit die suiker alleen niet kan bieden.

Een sinaasappelschil — uitgedrukt boven het glas — voegt etherische oliën toe die het aroma verheffen. Het grote ijsblok smelt langzaam; minimale verdunning houdt de smaak geconcentreerd tot het laatste slokje.

De keuze tussen bourbon en rye bepaalt het karakter: bourbon is zachter met vanille en karamel, rye scherper met peper en kruidigheid.


## Food pairing

### Beste pairing

Old Fashioned bij oude kaas en pecannoot.

### Waarom dit werkt

Suiker-bitter-balans vangt zout en notige umami; gecontroleerde verdunning voorkomt plakkerigheid en houdt textuur strak.

### Vermijd

Overzoete desserts die bitterstructuur platmaken.

## Pro insight

Old Fashioned faalt vaak op te snelle verdunning. Voor piekservice kun je spirit-suiker-bitters deels pre-batchen en pas op ijs afmaken voor constante textuur.',
    '- old fashioned
- suiker
- bitters
- verdunning
- ijsblok
',
    'De term ''cocktail'' verscheen voor het eerst in druk in 1806 en beschreef exact dit format: spirits, sugar, water en bitters — de oervorm van de Old Fashioned.
',
    '- Old Fashioned draait om eenvoud en controle.
- Suiker, bitters en verdunning moeten strak staan.
- Te veel water maakt het glas vlak.
- Servicegesprek bepaalt personalisatie zonder chaos.
',
    '### Opdracht
Bereid een Old Fashioned met een suikerklontje én een versie met suikersiroop. Vergelijk smaak, textuur en oplostijd.

### Checklist
- Bitters gelijkmatig verdeeld over suiker
- Suiker volledig opgelost vóór whiskey toevoegen
- IJsblok minimaal 4×4 cm
- Sinaasappelschil uitgedrukt én langs glasrand gewreven


### Reflectievraag

Welke stap in jouw Old Fashioned-proces vergroot de kans op oververdunning het meest?',
    8,
    2
  ),
  (
    'manhattan',
    'Manhattan',
    'Na deze les kun jij een Manhattan consistent bouwen met focus op vermoutkwaliteit, integratie en garnishdiscipline.
',
    'De Manhattan is de verfijnde oudere broer van de Old Fashioned. Sweet vermouth vervangt suiker als zoete component, wat meer kruidigheid en aromatische complexiteit toevoegt aan het profiel.

Rye whiskey geeft een scherpe, peperige toon die goed contrasteert met de zoetheid van de vermouth. Bourbon werkt ook maar levert een zachtere, vanilleachtige stijl op. De keuze van de spiritbasis bepaalt het gehele karakter van de cocktail.

Angostura bitters verbinden de twee werelden en voegen laagdiepte toe. De verhouding 2:1 (whiskey:vermouth) is de klassieke standaard, maar 3:1 geeft een drogere, whiskeygedreven stijl die door velen wordt geprefereerd.

De Luxardo-kers als garnish is niet louter decoratief — de zoete, amandelachtige smaak interacteert subtiel met elke slok.


## Food pairing

### Beste pairing

Manhattan bij eendenrillette en paddenstoel.

### Waarom dit werkt

Whiskey, vermout en bitters dragen vet en umami; zoete vermout rondt bitter af zonder de droge finish te verliezen.

### Vermijd

Citrusdominante gerechten die de vermoutintegratie breken.

## Pro insight

Manhattan vraagt verse vermoutdiscipline. Werk met gekoelde kleine flessen en datumlabels; oxidatie sloopt integratie sneller dan veel teams denken.',
    '- manhattan
- rye
- zoete vermout
- integratie
- garnishdiscipline
',
    'De Manhattan zou zijn uitgevonden op een feest voor Lady Randolph Churchill in New York in 1874, hoewel dit historisch omstreden blijft.
',
    '- Manhattan vraagt balans tussen whiskey en vermout.
- Bitters verbinden en drogen het profiel.
- Helderheid en temperatuur zijn essentieel.
- Garnishdiscipline bepaalt finale aromatische lift.
',
    '### Opdracht
Bereid een Manhattan met rye en een met bourbon. Noteer het smaak- en aromaverschil op een proefkaart.

### Checklist
- Verhouding 2:1 (whiskey:vermouth) aangehouden
- Minimaal 3 dashes bitters toegevoegd
- Geroerd op ijs, niet geschud
- Luxardo-kers correct aangebracht


### Reflectievraag

Hoe borg jij vermoutversheid in Manhattan-service zonder snelheid te verliezen?',
    8,
    3
  ),
  (
    'negroni',
    'Negroni',
    'Na deze les kun jij een Negroni nauwkeurig bouwen en de bitter-zoet-spanning professioneel sturen.
',
    'De Negroni is een meesterstuk van eenvoud: gelijke verhoudingen gin, Campari en sweet vermouth (1:1:1). Geen enkel ingrediënt domineert; elk speelt zijn rol in een perfecte bitterzoete balans die de cocktail tijdloos maakt.

Campari brengt bitterheid en een kenmerkende dieprode kleur. Gin voegt botanisch karakter toe, terwijl sweet vermouth zorgt voor mondgevoel en zoetheid. Samen creëren ze een cocktail met opmerkelijke diepte ondanks de minimalistische opbouw.

De Negroni wordt geroerd — roertechniek houdt hem helder en zijdezacht. Een sinaasappelschil — of plak — dient als garnering en voegt citrusaroma toe dat de bitterheid subtiel verzacht en het glas completeert.

Variaties zijn legio: de Boulevardier vervangt gin door bourbon, de Sbagliato gebruikt prosecco. Elk biedt een ander perspectief op dezelfde structuur.


## Food pairing

### Beste pairing

Negroni bij charcuterie en harde kaas.

### Waarom dit werkt

Bitter-zoet-spanning grijpt op zout en vet; aromatische kruiden tillen umami en de verdunning maakt het geheel drinkbaar.

### Vermijd

Lichtzure desserts met lage vetscore.

## Pro insight

Negroni profiteert van mini-batches per drukblok. Zo houd je verhouding en temperatuur constant, en kun je garnishfocus gebruiken als laatste aromatische lift.',
    '- negroni
- bitter-zoet-spanning
- gin
- campari
- verdunningsvenster
',
    'De Negroni Sbagliato — ''mislukte Negroni'' — is bedacht per ongeluk door een Milanese barman in de jaren zestig die prosecco pakte in plaats van gin.
',
    '- Negroni werkt op bittere spanning en zoete ruggengraat.
- Gelijke delen vragen precieze kwaliteit per component.
- Verdunning maakt of breekt drinkbaarheid.
- Varianten vragen duidelijke communicatie aan tafel.
',
    '### Opdracht
Bereid een klassieke Negroni en een Boulevardier (met bourbon i.p.v. gin). Vergelijk de bitterzoete balans en het mondgevoel.

### Checklist
- Gelijke verhoudingen aangehouden (1:1:1)
- Geroerd op ijs, niet geschud
- Sinaasappelschil correct uitgedrukt boven glas
- Kleur: helder robijnrood


### Reflectievraag

Welke component in jouw Negroni veroorzaakt het vaakst disbalans en hoe check je dat vooraf?',
    8,
    4
  ),
  (
    'daiquiri',
    'Daiquiri',
    'Na deze les kun jij een Daiquiri exact balanceren op zuren, suikers en textuur onder hoge service snelheid.
',
    'De Daiquiri is een van de meest heldere uitdrukkingen van cocktaillogica: rum, limoensap en suiker. Drie ingrediënten, drie smaakvlakken — sterk, zuur en zoet — in perfecte, transparante harmonie.

Witte rum laat de citrushelderheid schijnen; aged rum voegt vanille en hout toe. De suikerverhouding bepaalt of de cocktail fris en scherp blijft of aangenamer afrond naar zoetheid. Versgeperst limoensap is onontbeerlijk — flesversie geeft een vlakke, kunstmatige smaak.

De Daiquiri wordt geschud met ijs en fijn gezeefd via double strain om een zijdezachte, licht schuimige textuur te verkrijgen. De zuur-zoet balans is de echte technische uitdaging voor elke bartender.

Variaties als de Hemingway Special (grapefruitsap, geen suiker) of de Banana Daiquiri tonen hoeveel creatieve ruimte dit eenvoudige format biedt.


## Food pairing

### Beste pairing

Daiquiri bij ceviche en schaaldieren.

### Waarom dit werkt

Hoge zuurspanning en lage suikerdruk reinigen vet en zout; frisse textuur versterkt maritieme aroma''s zonder bitter conflict.

### Vermijd

Romige zoete nagerechten.

## Pro insight

Daiquiri is je kwaliteitsmeter per shift. Laat elke bartender een referentieglas bouwen bij start; verkoopgesprekken worden scherper als het team dezelfde balans proeft.',
    '- daiquiri
- lime
- siroop
- shakecontrole
- frisse textuur
',
    'Ernest Hemingway dronk zijn ''Papa Doble'': een dubbele Daiquiri zonder suiker maar met grapefruitsap — speciaal voor hem bedacht in El Floridita, Havana.
',
    '- Daiquiri is de lakmoesproef voor zuur-zoet-balans.
- Limekwaliteit verandert elke shift.
- Korte shake met juiste ijsbelasting werkt het best.
- Directe uitgifte behoudt textuur en lift.
',
    '### Opdracht
Bereid een Daiquiri met witte rum en een met aged rum. Noteer het aroma- en smaakverschil op een vergelijkingskaart.

### Checklist
- Limoensap vers geperst (niet uit fles)
- Double strain toegepast
- Suikersiroop op kamertemperatuur
- Smaak gecontroleerd vóór gieten in glas


### Reflectievraag

Welke meetbare routine gebruik je om Daiquiri-balans constant te houden tussen bartenders?',
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
    'Na deze les kun jij een Whiskey Sour stabiel uitvoeren met juiste foam, zuurspanning en verdunningscontrole.
',
    'De Whiskey Sour combineert bourbon, citroensap en suiker in het klassieke ''sour''-format. Een scheutje vers eiwit — of aquafaba als veganistische optie — transformeert de textuur naar een fluweelzachte ervaring.

Eiwit wordt via dry shake — schudden zonder ijs — geëmulgeerd voordat ijs wordt toegevoegd voor koudte en verdunning. De eiwit emulsie geeft een dichte, romige schuimlaag die aroma''s vasthoudt en visueel aantrekt.

Bitters worden op het schuim gedruppeld als finishing touch — zowel visueel element als aromatisch accent dat de neus prikkelt vóór de eerste slok. Bourbon en citroen vormen een klassieke citrus balans die warmte en frisheid combineert.

De Amaretto Sour van Jeffrey Morgenthaler toont hoe dit format vernieuwend kan worden: bourbon én amaretto, plus eiwit, creëren een rijke hertaling van het klassieke recept.


## Food pairing

### Beste pairing

Whiskey Sour bij fried chicken en comte.

### Waarom dit werkt

Zuur + foam + alcohol brengen vet in evenwicht; bitters in garnishlaag verhogen droge lengte en aromatische spanning.

### Vermijd

Sterk bittere groentegerechten zonder vetbuffer.

## Pro insight

Whiskey Sour met stabiele foam vereist protocol: dry shake, wet shake, direct service. Gebruik duidelijke garnishregels zodat bitters en aroma niet willekeurig uitpakken.',
    '- whiskey sour
- foamstabiliteit
- zuurspanning
- dry shake
- bitters-garnish
',
    'De Amaretto Sour van Jeffrey Morgenthaler werd verkozen tot de meest invloedrijke heruitvinding van een klassieke cocktail van het afgelopen decennium.
',
    '- Whiskey Sour combineert structuur en textuur.
- Foamstabiliteit vraagt techniekdiscipline.
- Zuurspanning moet helder maar niet scherp zijn.
- Verdunning en garnish sturen finale beleving.
',
    '### Opdracht
Bereid een Whiskey Sour met en zonder eiwit. Vergelijk textuur, mondgevoel en hoe de schuimlaag aroma''s vasthoudt.

### Checklist
- Dry shake minimaal 15 seconden
- Wet shake met ijs minimaal 10 seconden
- Double strain toegepast
- Bitters zorgvuldig op schuim gedruppeld


### Reflectievraag

Op welk punt in jouw Whiskey Sour-routine gaat foamstabiliteit meestal verloren, en waarom?',
    8,
    1
  ),
  (
    'margarita',
    'Margarita',
    'Na deze les kun jij een Margarita consistent balanceren op zuur, zoet, zout en textuur binnen strakke service-timing.
',
    'De Margarita lijkt eenvoudig, maar presteert pas op topniveau wanneer je vier assen tegelijk beheerst: zuurintensiteit, suikerdemping, zoutaccent en gecontroleerde verdunning. Kleine afwijkingen in limekwaliteit of shake-duur geven direct merkbare verschuivingen in balans.

Professioneel werken betekent dus kalibreren per batch en per service-moment. Je stuurt niet op vast recept alleen, maar op sensorische referentiepunten: heldere aanzet, strak middenpalet en droge, schone finale.


## Food pairing

### Beste pairing

Ceviche, gegrilde gamba of taco met limoen en koriander.

### Waarom dit werkt

Hoge citraatdruk en zoutaccent snijden door vet en versterken maritieme zoetheid; tequila-structuur sluit aan op geroosterde tonen.

### Vermijd

Zware roomsaus of sterk zoete componenten die de droge finale blokkeren.

## Pro insight

Een premium Margarita verkoop je via controle: wie zout, zuur en verdunning actief benoemt, straalt direct autoriteit uit.',
    '- zuurkalibratie
- zoutaccent
- verdunningscontrole
- shake-discipline
- droge-finale
',
    'De Margarita zou in 1938 zijn bedacht door Margarita Sames in Acapulco, hoewel meerdere bartenders de uitvinding claimen — een van de meest betwiste herkomstverhalen in cocktailgeschiedenis.
',
    '- Margarita draait om zuuras, zoutaccent en gecontroleerde verdunning.
- Limekwaliteit en shake-duur bepalen de precisie van het resultaat.
- Consistentie vraagt kalibratie per service-moment.
- Topuitvoering is strak, droog en helder.
',
    '### Opdracht
Bereid een Margarita met blanco én reposado tequila. Noteer het aroma- en smaakverschil in beide versies.

### Checklist
- Zoutrand alleen op buitenkant glas aangebracht
- Limoensap vers geperst
- Geschud en gefilterd via double strain
- Garnering: limoenwig of -wiel


### Reflectievraag

Welke variabele veroorzaakt bij jouw Margarita''s de meeste spreiding, en welke meetstap maakt dat proces aantoonbaar stabieler?',
    8,
    2
  ),
  (
    'sidecar',
    'Sidecar',
    'Na deze les kun jij een Sidecar verfijnd afstellen op citrusdruk, cognacstructuur en dry finish voor verschillende gastenprofielen.
',
    'Een Sidecar draait om spanning tussen druif en citrus. Cognac levert breedte en warmte, terwijl sinaasappellikeur de overgang naar citroen afrondt. De kunst is om de finish droog te houden zonder de drank hoekig te maken.

In premium service bepaal je eerst doelprofiel en pas daarna exacte ratio. Zo voorkom je zowel plakkerigheid als onderextractie van aroma. Sidecar-kwaliteit is vooral precisie in randen.


## Food pairing

### Beste pairing

Eendenrillettes, paté en licht gekaramelliseerde ui-elementen.

### Waarom dit werkt

Cognacdiepte draagt hartige umami, citrusscherpte reinigt vetfilm en houdt de volgende hap open.

### Vermijd

Extreem pikante gerechten; die versterken alcoholprikkel en verstoren de finesse.

## Pro insight

Bij Sidecar zit het onderscheid in finishdiscipline; topservice laat de drank elegant uitdrogen zonder hard te worden.',
    '- cognacstructuur
- citrusspanning
- finishbeheer
- ratio-afstelling
- sour-elegantie
',
    'De naam ''Sidecar'' verwijst naar de zijspan van de motorfietsen waarmee officieren na de Eerste Wereldoorlog de Parijse bars bezochten.
',
    '- Sidecar balanceert cognacwarmte met citrusscherpte.
- Een droge finish verhoogt elegantie en doordrinkbaarheid.
- Ratio volgt doelprofiel, niet routine.
- Finesse zit in overgang tussen middenpalet en finale.
',
    '### Opdracht
Bereid een Sidecar met en zonder suikerrand. Vergelijk de smaakervaring bij de eerste slok en noteer het contrast.

### Checklist
- Cognac VS of VSOP gebruikt
- Citroensap vers geperst
- Suikerrand correct aangebracht (alleen buitenkant glas)
- Glas voorgekoeld


### Reflectievraag

Hoe bepaal jij bij Sidecar of een drogere finish elegant is of juist te streng voor de context van de gast?',
    8,
    3
  ),
  (
    'white-lady',
    'White Lady',
    'Na deze les kun jij een White Lady technisch zuiver opbouwen met heldere aromatische spanning en gecontroleerd mondgevoel.
',
    'De White Lady is technisch een textuurcocktail vermomd als frisse sour. Gin-botanicals dragen het aromatisch kader, terwijl triple sec en citroen de spanning opbouwen. Te veel citrus maakt de drank vlak; te veel likeur maakt hem zwaar.

Topuitvoering vereist dus nauwe controle op verdunning en temperatuur. Een koude, scherp gefilterde serve zet de botanische lift centraal en houdt de afdronk elegant.


## Food pairing

### Beste pairing

Oesters, geitenkaascrème, witvis met citrusboter.

### Waarom dit werkt

Botanical lift en citroenspan geven verticale frisheid; subtiele sinaasappelnuance overbrugt zuivel en zeezout.

### Vermijd

Rokerige of zeer tanninerijke gerechten die de delicate aromalijn overstemmen.

## Pro insight

White Lady presteert commercieel beter wanneer je hem positioneert als botanische precision sour in plaats van een simpele klassieker.',
    '- botanische-lift
- textuurcontrole
- temperatuurregie
- citrusprecisie
- finessebalans
',
    'Harry MacElhone bedacht de White Lady twee keer: zijn eerste versie uit 1919 gebruikte crème de menthe als basis — pas later werd gin de standaard.
',
    '- White Lady vraagt botanische helderheid met subtiele body.
- Verdunning en temperatuur sturen textuurkwaliteit.
- Citrus en likeur moeten in spanning blijven.
- Precisie voorkomt zowel vlakheid als zwaarte.
',
    '### Opdracht
Bereid een White Lady met en zonder eiwit. Beschrijf het verschil in mondgevoel, aroma en visuele presentatie.

### Checklist
- Dry shake minimaal 15 seconden
- Gin op kamertemperatuur (niet uit vriezer)
- Double strain toegepast
- Glas voorgekoeld


### Reflectievraag

Welke technische keuze in jouw White Lady beïnvloedt het middenpalet het sterkst, en waarom precies die keuze?',
    8,
    4
  ),
  (
    'pisco-sour',
    'Pisco Sour',
    'Na deze les kun jij een Pisco Sour stabiel produceren met correcte schuimstructuur, zurenbalans en veilige werkwijze.
',
    'Pisco Sour vraagt dubbele discipline: sensorische balans en procesveiligheid. Het eiwit geeft structuur en romigheid, maar alleen wanneer dry shake en wet shake consequent worden uitgevoerd. Ook zuurkwaliteit en bittersdosering zijn kritisch voor definitie in de finale.

Professionele standaarden vereisen vers product, heldere hygiëne en reproduceerbare timing. Zo blijft de schuimkraag stabiel en de smaak kernachtig, ook in piekservice.


## Food pairing

### Beste pairing

Peruviaanse ceviche, tempura van groenten, milde geitenkaas.

### Waarom dit werkt

Schuimtextuur en zuurfrisheid creëren lift; bitters op de top structureren nasmaak en houden de pairing droog.

### Vermijd

Zeer zoete desserts of zware chocolade die het zuurkader uit balans trekken.

## Pro insight

Pisco Sour toont vakmanschap omdat techniek zichtbaar wordt in schuimstabiliteit en textuur over tijd, niet alleen in smaak.',
    '- schuimstabiliteit
- dry-shake
- proceshygiëne
- bittersdosering
- sour-veiligheid
',
    'De Nationale Dag van de Pisco Sour wordt gevierd op de eerste zaterdag van februari in Peru — een officiële feestdag gewijd aan één cocktail.
',
    '- Pisco Sour vereist techniek, hygiëne en procescontrole.
- Schuimstructuur is een kwaliteitsindicator over tijd.
- Bitters doseren betekent focus, geen decoratie.
- Reproduceerbare timing maakt piekservice veilig.
',
    '### Opdracht
Bereid een Pisco Sour en vergelijk hem met een klassieke Daiquiri. Noteer textuur- en smaakverschillen op een proefkaart.

### Checklist
- Dry shake minimaal 20 seconden (eiwit volledig geëmulgeerd)
- Angostura bitters in druppelpatroon op schuim aangebracht
- Limoensap vers geperst
- Geserveerd zonder ijs in gekoeld glas


### Reflectievraag

Waar zit in jouw Pisco Sour-procedure het grootste risico op inconsistentie: eiwit, shake-ritme of bittersdosering?',
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
    'Na deze les kun jij een Mojito strak uitvoeren met gecontroleerde extractie van munt, suikermanagement en bruisbehoud.
',
    'Mojito-fouten ontstaan meestal door overextractie van munt en onderschatting van verdunning. Muddle je te hard, dan krijg je chlorofylbitter. Muddle je te zacht, dan mis je frisse topnoten en lijkt de drank vlak.

Een sterke Mojito-aanpak gebruikt gecontroleerde druk, fijn crushed ice en snelle opbouw in lagen. Daarmee blijft de drank levendig tot de laatste slok.


## Food pairing

### Beste pairing

Frisse salades, lichte taco''s, gegrilde courgette en groene kruiden.

### Waarom dit werkt

Muntaroma en limezuur geven verkoelende topnoot; bruis en ijsverdunning verlagen vetperceptie.

### Vermijd

Krachtige umami-sauzen of overmatige knoflook die muntaroma platdrukken.

## Pro insight

Mojito-kwaliteit is in de praktijk een test op handcontrole: minder kracht, meer precisie levert meer smaak op.',
    '- muntextractie
- crushed-ice
- laagopbouw
- verdunningsritme
- frisheidsbehoud
',
    'Ernest Hemingway dronk zijn Mojito''s in La Bodeguita del Medio in Havana — zijn handgeschreven quote ''My mojito in La Bodeguita'' hangt er nog steeds aan de muur.
',
    '- Mojito staat of valt met muntextractiecontrole.
- Crushed ice en layering bepalen frisheidsbeleving.
- Overmuddling geeft bitter en ruwe textuur.
- Strakke uitvoering houdt de cocktail levendig.
',
    '### Opdracht
Bereid een Mojito met correcte muddlingtechniek. Maak daarna een versie met te hard gemuddelede munt. Vergelijk smaak en bitterheid.

### Checklist
- Alleen muntblaadjes gebruikt (geen stelen)
- Suiker volledig opgelost vóór munt toevoegen
- Soda koud en vers geopend
- Glas gevuld met voldoende ijs


### Reflectievraag

Hoe borg jij dat muntextractie in Mojito''s op piekmomenten nog steeds subtiel en niet bitter blijft?',
    8,
    1
  ),
  (
    'tom-collins',
    'Tom Collins',
    'Na deze les kun jij een Tom Collins bouwen met juiste verdunning, koolzuurregie en lengte die serviceproof blijft.
',
    'Tom Collins is een test op highball-beheersing. De cocktail moet lang, helder en verfrissend blijven zonder dat de gin verdwijnt. Dat vraagt juiste pre-chill, correcte ijskolom en late koolzuurintegratie.

Professioneel stuur je vooral op behoud van structuur na uitgifte. De gast ervaart kwaliteit niet bij de eerste slok alleen, maar over het volledige drinkvenster.


## Food pairing

### Beste pairing

Fish and chips, gefrituurde snacks, kip met citroen-kruiden.

### Waarom dit werkt

Hoge carbonatie en citrusscherpte reinigen palet; gin-botanicals verlengen kruidige tonen van het gerecht.

### Vermijd

Te zoete side-dishes waardoor de Collins dun en zuur aanvoelt.

## Pro insight

Tom Collins is je servicebenchmark: als deze op piekmomenten scherp blijft, klopt je highball-systeem.',
    '- highball-architectuur
- carbonatiebehoud
- ijskolom
- pre-chill
- lengte-in-glas
',
    'In 1874 veroorzaakte de ''Tom Collins Hoax'' een Amerikaans mediaschandaal: mensen werden ervan overtuigd dat een man genaamd Tom Collins hen had beledigd in een bar — de witz leidde uiteindelijk tot de naam van de cocktail.
',
    '- Tom Collins test highball-discipline in praktijk.
- Carbonatie en verdunning moeten lang stabiel blijven.
- Pre-chill is cruciaal voor lengte in het glas.
- Kwaliteit meet je over het hele drinkvenster.
',
    '### Opdracht
Bereid een Tom Collins met London Dry gin én met een botanisch-rijkere gin. Noteer het karakterverschil in profiel.

### Checklist
- Citroensap vers geperst
- Soda koud en vers geopend
- Minimaal geroerd na sodatoevoeging
- Garnering: citroenwig en maraschino-kers


### Reflectievraag

Welk onderdeel van jouw Collins-opbouw verliest als eerste kwaliteit tijdens drukte, en hoe corrigeer je dat structureel?',
    8,
    2
  ),
  (
    'moscow-mule',
    'Moscow Mule',
    'Na deze les kun jij een Moscow Mule afstemmen op pittigheid, zuurfrisheid en temperatuurbehoud in drukke service.
',
    'Moscow Mule staat of valt met gemberarchitectuur. Te scherpe ginger beer domineert, te zachte variant verliest ruggengraat. Lime werkt als focuslens en moet dus strak gedoseerd worden.

Operationeel is temperatuurbehoud doorslaggevend. Werk met diepgekoelde componenten en minimale vertraging tussen build en uitgifte om de prikkel en lengte stabiel te houden.


## Food pairing

### Beste pairing

Gember-kip, Aziatische slaw, pittige dumplings met frisse dip.

### Waarom dit werkt

Gemberwarmte en citrussnede sluiten aan op kruidigheid; koude service houdt capsaicineperceptie beheerst.

### Vermijd

Zeer subtiele gerechten met lage smaakintensiteit; die raken overstemd door ginger beer.

## Pro insight

Moscow Mule wint aan waarde wanneer je ginger intensity als stuurknop gebruikt per gastprofiel en temperatuurcontext.',
    '- gemberintensiteit
- temperatuurdiscipline
- limefocus
- prikkelbalans
- uitgiftesnelheid
',
    'De Moscow Mule introduceerde vodka in Amerika in een era dat whiskey domineerde — het koperen bekertje was bedacht door twee zakenmensen die elk een overtollig product hadden: vodka én koperen mokken.
',
    '- Moscow Mule vraagt beheersing van gemberintensiteit.
- Lime moet focussen, niet domineren.
- Diepgekoelde componenten beschermen structuur.
- Temperatuurmanagement is deel van het recept.
',
    '### Opdracht
Bereid een Moscow Mule met twee verschillende gemberbiermerken (mild vs. intens). Noteer het smaakverschil.

### Checklist
- Koperen mok voorgekoeld vóór gebruik
- Limoensap vers geperst
- Gemberbier koud en vers geopend
- Garnering: limoenwig en verse gemberplak


### Reflectievraag

Wanneer besluit jij bij een Moscow Mule om gemberintensiteit te verlagen ondanks een gastvraag om ''meer pit''?',
    8,
    3
  ),
  (
    'dark-n-stormy',
    'Dark ’n Stormy',
    'Na deze les kun jij een Dark ''n'' Stormy onderscheiden van varianten en correct uitserveren met focus op gemberstructuur.
',
    'Dark ''n'' Stormy is geen generieke rum-gembermix, maar een stijl met duidelijke functionele hiërarchie: donkere rum als dragende laag, ginger beer als motor en lime als precisie-instrument. Identiteit zit in contrast, niet in zoetkracht.

Voor professionele service betekent dit heldere productkeuze en doseringsdiscipline. Zo blijft het profiel spannend, schoon en herkenbaar.


## Food pairing

### Beste pairing

BBQ ribs, jerk chicken, gerookte aubergine met limoen.

### Waarom dit werkt

Donkere rumtones verbinden met rook en karamellisatie; gemberzuur doorbreekt vet en zoetresten.

### Vermijd

Delicate rauwe visbereidingen die te weinig tegengewicht hebben.

## Pro insight

Dark ''n'' Stormy wordt premium zodra je herkomst en balans uitlegt; dan verschuift de perceptie van ''easy'' naar ''doordacht''.',
    '- stijlidentiteit
- rumdiepte
- ginger-contrast
- lime-precisie
- build-discipline
',
    'Gosling''s Brothers registreerde ''Dark ''n'' Stormy'' als officieel handelsmerk — een van de weinige cocktails ter wereld waarvan de naam juridisch eigendom is van één merk.
',
    '- Dark ''n'' Stormy heeft een duidelijke stijlidentiteit.
- Rumdiepte en gemberprikkel moeten in contrast blijven.
- Lime werkt als precisiehefboom in de finale.
- Productkeuze bepaalt geloofwaardigheid van de serve.
',
    '### Opdracht
Bereid een Dark ''n'' Stormy met correcte float-techniek. Observeer het visuele effect en proef de gelaagdheid voor en na mengen.

### Checklist
- Dark rum over lepelrug gefloat (niet direct gegoten)
- Gemberbier koud en vers geopend
- Limoensap vers geperst
- Garnering: limoenwig op glasrand


### Reflectievraag

Wat maakt volgens jou het verschil tussen een correcte en een echt overtuigende Dark ''n'' Stormy in service?',
    8,
    4
  ),
  (
    'paloma',
    'Paloma',
    'Na deze les kun jij een Paloma professioneel kalibreren op zoutheid, grapefruitbitter en carbonatie voor hoge doordrinkbaarheid.
',
    'Een goede Paloma heeft meer nodig dan tequila en grapefruit. Je bouwt bewust spanning tussen bitter, zout, zuur en zachte zoetrest. Vooral zoutgebruik moet ondersteunend blijven, niet dominant.

In servicecontext werkt Paloma uitstekend door hoge doordrinkbaarheid en aanpasbaarheid. Correcte carbonatie en koeling maken het verschil tussen een verfrissende klassieker en een fletse longdrink.


## Food pairing

### Beste pairing

Carnitas taco, gegrilde maïs, ceviche met grapefruitsegmenten.

### Waarom dit werkt

Grapefruitbitter en zoutaccent verhogen speekselsecretie; tequila-structuur ondersteunt geroosterde tonen zonder overbelasting.

### Vermijd

Overmatige suikercomponenten die bitterbalans vlak maken.

## Pro insight

Een sterke Paloma-line verhoogt doorloopsnelheid zonder kwaliteitsverlies, ideaal voor terrasmomenten met hoge druk.',
    '- grapefruitbitter
- zoutkalibratie
- bruisdruk
- doordrinkbaarheid
- paloma-structuur
',
    'In Mexico wordt de Paloma traditioneel gemaakt met Squirt grapefruitsoda — een frisdrankmerk dat buiten Mexico nauwelijks bekend is maar de cocktail zijn authentieke Mexicaanse karakter geeft.
',
    '- Paloma vraagt bitter-zout-zuurbalans met hoge frisheid.
- Zout ondersteunt structuur maar mag niet overheersen.
- Carbonatie bepaalt een groot deel van de drinkervaring.
- Doordrinkbaarheid is de centrale prestatiefactor.
',
    '### Opdracht
Bereid een Paloma met grapefruitsoda én een met vers grapefruitsap. Vergelijk smaakintensiteit, complexiteit en textuur.

### Checklist
- Zout of Tajín-rand correct aangebracht (buitenkant glas)
- Blanco tequila voor frisheid gebruikt
- Vers limoensap toegevoegd
- Geserveerd op ijs in highball-glas


### Reflectievraag

Welke parameter in Paloma''s (zout, bitter, bruis, zuur) onderschat jij meestal, en wat is het gevolg in pairing?',
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
    'Na deze les kun jij glaswerk kiezen op basis van aroma-uitsturing, temperatuurverlies en operationele haalbaarheid.
',
    'Glaswerk is geen decor, maar een technisch instrument. Vorm bepaalt aromatische concentratie, randdikte beïnvloedt mondgevoel en volume stuurt smeltsnelheid en perceived strength.

Professioneel kiezen betekent dus afwegen tussen smaakdoel en operationele realiteit. Het beste glas is datgene dat kwaliteit verhoogt zonder serviceflow te breken.


## Food pairing

### Beste pairing

Kies pairing na glaskeuze: coupe voor aromatische finesse, rocks voor textuur en volume.

### Waarom dit werkt

Het glas stuurt volatiliteit en slokgrootte; dit beïnvloedt hoe zuur, zoet en alcohol zich naast food gedragen.

### Vermijd

Een random glas gebruiken waardoor temperatuur en aromadichtheid onvoorspelbaar worden.

## Pro insight

Teams met glaswerkdiscipline maken minder receptfouten omdat het juiste glas automatisch de juiste build afdwingt.',
    '- glasfysica
- aroma-uitsturing
- randdikte
- smeltmanagement
- operationele-fit
',
    'De Nick & Nora — vernoemd naar de detectivefiguren uit de Thin Man-films — keerde de afgelopen tien jaar terug als favoriet van bartenders die de elegantie van de coupe willen zonder de brede rand die temperatuurverlies versnelt.
',
    '- Glaswerk stuurt aroma, mondgevoel en smelttempo.
- Juiste vorm verhoogt technische consistentie.
- Keuze moet smaakdoel en operatie verbinden.
- Decoratief denken leidt vaak tot kwaliteitsverlies.
',
    '### Opdracht

Kies vijf klassieke cocktails en koppel elk aan het meest geschikte glas. Noteer per glas: glasvorm en functie, effect op aroma (open vs. geconcentreerd), temperatuurbehoud (wel/geen ijs, gekoeld?), visuele presentatie.

Probeer daarna één cocktail in twee verschillende glazen en noteer het verschil in aroma-openheid en drinkbaarheid.

### Checklist

- Ik heb elk glas aan een cocktailstijl gekoppeld
- Ik herken het verschil tussen coupe en Nick & Nora
- Ik begrijp waarom het rocks-glas past bij spirit-forward
- Ik heb gekoeld glas getest en het effect genoteerd


### Reflectievraag

Welke glaswerkkeuze maak jij nu op gewoonte in plaats van op technisch effect, en wat zou een beter alternatief zijn?',
    8,
    1
  ),
  (
    'ijsgebruik',
    'IJsgebruik',
    'Na deze les kun jij ijs strategisch inzetten op smeltcurve, verdunning en textuurbeleving per cocktailfamilie.
',
    'IJs beheerst de drie kernvariabelen van een cocktail in het glas: temperatuur, verdunning en textuur. Groot, hard ijs smelt langzamer; crushed ice koelt sneller maar verdunt agressiever. Vormkeuze is daarom stijlkeuze.

Topbars behandelen ijs als ingrediënt met specificaties. Consistente opslag, handling en timing zorgen dat smaakarchitectuur ook onder druk intact blijft.


## Food pairing

### Beste pairing

Vette of gefrituurde gerechten vragen vaak groot, hard ijs in de cocktail.

### Waarom dit werkt

Langzame smelt bewaart structuur terwijl voldoende koeling vetperceptie verlaagt; zo blijft pairing stabiel in tijd.

### Vermijd

Te nat of zacht ijs dat direct oververdunt en smaakbruggen breekt.

## Pro insight

Ijskwaliteit is gastpsychologie: troebel, klein of smeltend ijs signaleert slordigheid vóór de eerste slok. Label vriezers per dag en vervang batches op piekmoment — goedkoper dan retourcocktails.',
    '- smeltcurve
- ijskwaliteit
- temperatuurcontrole
- textuursturing
- ice-handling
',
    'De Japanse bartendingtraditie — met handgesneden ijsbollen en -kubussen van kristalhelder blokijs — werd internationaal overgenomen omdat de langzamere smelting en optische kwaliteit de totale drinkervaring wezenlijk verbeteren.
',
    '- IJs is een volwaardig ingrediënt met specificaties.
- Vorm en dichtheid bepalen smeltcurve en textuur.
- Consistente opslag voorkomt service-ruis.
- IJsdiscipline verhoogt kwaliteit en voorspelbaarheid.
',
    '### Opdracht

Maak dezelfde cocktail (bijv. Whisky Sour) twee keer: één met een groot ijsblok, één met standaard blokjes. Proef na 3 en na 8 minuten. Noteer:

- bitterheid en zoetheid
- alcoholwarmte
- textuur
- balansverloop in de tijd

### Checklist

- Ik heb beide varianten op twee momenten geproefd
- Ik heb het verdunningsverschil genoteerd
- Ik begrijp wanneer crushed ice functioneel is
- Ik herken hoe ''nat'' ijs de shaker-verdunning vroegtijdig beïnvloedt


### Reflectievraag

Hoe meet jij of je ijskeuze daadwerkelijk bijdraagt aan kwaliteit over tijd in plaats van alleen aan eerste indruk?',
    8,
    2
  ),
  (
    'garnishes',
    'Garnishes',
    'Na deze les kun jij garnishes functioneel ontwerpen zodat aroma, visuele cue en werkbaarheid tegelijk kloppen.
',
    'Garnishes moeten functie hebben: aromatische lift, visuele richting of tactiele ondersteuning. Decoratie zonder bijdrage verhoogt complexiteit in mise-en-place maar levert weinig kwaliteitswinst.

Professionele garnishing koppelt daarom doel, snelheid en houdbaarheid. Je kiest minder elementen, maar met hogere impact en betere reproduceerbaarheid.


## Food pairing

### Beste pairing

Gebruik citruszest of kruidgarnish die direct verwijst naar dominante smaak in het gerecht.

### Waarom dit werkt

Aromatische priming voor de eerste slok verhoogt coherentie tussen neus en hap, vooral bij subtiele pairings.

### Vermijd

Garnishes met sterke parfumtonen die een fout signaal geven ten opzichte van het bord.

## Pro insight

Functionele garnish-keuzes besparen prep-tijd en verhogen toch de waargenomen luxe, mits elk element een duidelijke rol heeft.',
    '- functionele-garnish
- aromatische-priming
- visuele-cue
- prep-efficiency
- houdbaarheid
',
    'Bartenders als Audrey Saunders en Dick Bradsell zetten in de jaren negentig de ''expressed peel'' opnieuw op de kaart na decennia van louter decoratief garnishgebruik. Sindsdien is functionele garnish standaard in premium barwerk.
',
    '- Garnishes moeten functioneel bijdragen aan aroma of structuur.
- Minder elementen met hogere impact werkt beter.
- Houdbaarheid en snelheid horen bij ontwerp.
- Visuele luxe zonder functie is operationele ruis.
',
    '### Opdracht

Maak één cocktail (bijv. Negroni) drie keer met verschillende garnishes:

1. zonder garnish
2. met uitgeknepen sinaasappelschil
3. met uitgeknepen citroenschil

Proef telkens direct na serveren. Noteer de aromatische eerste indruk, het smaakverschil en de algehele beleving.

### Checklist

- Ik heb drie varianten direct na expressie geproefd
- Ik heb het aroma-effect van elke citrus genoteerd
- Ik begrijp de keuze voor sinaasappel versus citroen
- Ik heb het verschil tussen decoratieve en functionele garnish verwoord


### Reflectievraag

Welke garnish gebruik jij vooral visueel, en hoe kun je die omvormen tot een functioneel aroma-instrument?',
    8,
    3
  ),
  (
    'serveertechniek',
    'Serveertechniek',
    'Na deze les kun jij serveertechniek gebruiken om beleving, snelheid en productintegriteit consequent te verhogen.
',
    'Serveertechniek vertaalt barvakmanschap naar gastbeleving. Glaspositionering, uitlegtempo en handbewegingen bepalen samen hoe kwaliteit wordt waargenomen nog voor de eerste slok.

In premium context is consistente techniek een kwaliteitsvermenigvuldiger: minder fouten, hogere rust op de vloer en duidelijkere vertrouwenssignalen naar de gast.


## Food pairing

### Beste pairing

Serveer in vaste volgorde: uitleg, geurcue, eerste slok, eerste hap.

### Waarom dit werkt

Gestuurde sequencing zorgt dat gast de juiste structuurcomponenten op het juiste moment ervaart.

### Vermijd

Cocktail en gerecht tegelijk zonder context droppen; dan verlies je een deel van de pairingwaarde.

## Pro insight

Serveerfouten zijn upsell-momenten als je ze zichtbaar corrigeert: koud glas, schone rand, bewuste citrusexpressie. Gasten betalen voor tempo mét zorg, niet voor show zonder integratie.',
    '- service-sequencing
- taalregie
- handtechniek
- belevingsopbouw
- vloerconsistentie
',
    'De term ''mise-en-place'' — alles op zijn plek vóór de service — komt uit de professionele keuken maar is inmiddels standaard in hoge bars. Bartender Tony Conigliaro (Londen) introduceerde het als systematische barmethode.
',
    '- Serveertechniek beïnvloedt kwaliteit vóór de eerste slok.
- Sequencing van uitleg en proefmoment verhoogt beleving.
- Consistente handelingen verlagen foutkans in teamservice.
- Rustige uitvoering bouwt gastvertrouwen.
',
    '### Opdracht

Bereid dezelfde Daiquiri twee keer: één keer met volledig serviceprotocol (gekoeld glas, double strain, directe citrusexpressie, bewust aanreikmoment), één keer zonder enig protocol. Noteer:

- textuur en helderheid
- eerste temperatuurindruk
- aromabeleving bij aanreik
- algehele indruk van vakmanschap

### Checklist

- Ik heb het glas gekoeld vóór serveren
- Ik heb double strained en het resultaat vergeleken
- Ik heb de presentatie bewust en volledig uitgevoerd
- Ik begrijp het verschil in waargenomen kwaliteit


### Reflectievraag

Welke stap in jouw serveerroutine verhoogt aantoonbaar vertrouwen bij gasten, en welke stap veroorzaakt ruis?',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-cocktails (4 lessons)
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
    'Na deze les kun jij aperitiefcocktails positioneren op eetluststimulatie, lage verzadiging en ritmische opbouw van de service.
',
    'Aperitiefcocktails hebben een duidelijke taak: eetlust openen, mondgevoel activeren en de tafel in ritme brengen zonder vroegtijdige verzadiging. Daarom sturen professionals op frisheid, bitterspanning en gematigd alcoholvolume.

De beste aperitiefservice bouwt een zachte intensiteitscurve richting het eerste gerecht. Keuzes worden onderbouwd vanuit functie aan tafel, niet vanuit novelty of volume.


## Food pairing

### Beste pairing

Olijven, ansjovis-toast, zilt-hartige amuses met lage vetdichtheid.

### Waarom dit werkt

Aperitiefbitter activeert eetlust; frisse zuuras en licht mondgevoel bereiden mond en tempo voor op volgende gang.

### Vermijd

Te zoete of zware pre-dinner pairings die vroegtijdige verzadiging veroorzaken.

## Pro insight

Aperitiefadvies op functie in plaats van trend levert een sterkere start van de besteding en een stabielere avondcurve.',
    '- aperitief-functie
- eetluststimulatie
- lage-verzadiging
- abv-regie
- service-opbouw
',
    'In Italië is de aperitivo een sociaal ritueel, niet louter een drankje. De eetlust-activerende traditie gaat terug tot Romeinse pharmacist-geneesheren die bittere kruideninfusies prescribeerden vóór maaltijden.
',
    '- Aperitiefcocktails moeten eetlust openen, niet vullen.
- Frisheid, bitterspanning en matige ABV zijn leidend.
- Intensiteitscurve moet richting gerecht werken.
- Functie aan tafel gaat boven trenddenken.
',
    '### Opdracht

Kies drie verschillende aperitiefcocktails (bijv. Negroni, Droge Martini, Aperol Spritz) en analyseer elk:

- welke component activeert de eetlust?
- is carbonatie aanwezig en wat doet dat?
- past deze cocktail bij warm of koel weer?
- voor welk type diner zou jij hem adviseren?

### Checklist

- Ik herken het bittercomponent in elke cocktail
- Ik begrijp het verschil tussen droog en licht zoet bij aperitief
- Ik kan een gastadvies formuleren op basis van seizoen en context


### Reflectievraag

Hoe definieer jij een aperitief dat eetlust opent zonder de smaakboog van het menu te verstoren?',
    8,
    1
  ),
  (
    'cocktails-bij-foodpairing',
    'Cocktails bij food pairing',
    'Na deze les kun jij food pairing met cocktails technisch onderbouwen via intensiteit, brugsmaken, vet-/zuurspel en nasmaakarchitectuur.
',
    'Foodpairing met cocktails werkt via structuurmatching en contrastregie. Vet vraagt zuur of bitterlift, zout vraagt aromatische diepte, en umami vraagt vaak droge of kruidige brugcomponenten om overlap te voorkomen.

Sterke pairingbeslissingen blijven technisch: je vergelijkt intensiteit, textuur en nasmaaklengte in beide richtingen. Zo ontstaan combinaties die gerecht en cocktail tegelijk laten groeien.


## Food pairing

### Beste pairing

Werk met technische matrix: vet + zuur, zout + bitter, umami + kruiden-droogte, zoet + specerijcontrast.

### Waarom dit werkt

Zuur reinigt vet tussen happen; zoetheid vangt umami en spice op; bitterheid en alcoholwarmte geven lengte; koolzuur lift zout; aromatisch contrast houdt het palet wakker zonder disharmonie.

### Vermijd

Pairings kiezen op populariteit alleen; dat verhoogt mismatchrisico bij complexe gerechten.

## Pro insight

Foodpairing wordt schaalbaar zodra je team dezelfde technische taal gebruikt voor intensiteit, brug en nasmaak.',
    '- pairingmatrix
- intensiteitsmatch
- brugsmaken
- nasmaakarchitectuur
- structuurvergelijking
',
    'Restaurants als Eleven Madison Park (New York) en Noma (Kopenhagen) bieden cocktail-pairingmenu''s als volwaardig alternatief voor wijn. Sommige cocktails worden specifiek voor één gang ontwikkeld door de chef en bartender samen.
',
    '- Foodpairing vraagt structurele analyse in twee richtingen.
- Vet, zuur, zout, bitter en umami sturen de keuze.
- Technische matrix maakt pairings reproduceerbaar.
- Doel is versterking van zowel gerecht als cocktail.
',
    '### Opdracht

Stel een mini-pairingmenu op van drie gangen met bijpassende cocktails:

- voorgerecht: licht, zuur of rauw
- hoofdgerecht: rijker, gebakken of gegrild
- dessert: zoet (kies hier bewust geen zoete cocktail)

Noteer per keuze het pairing-principe (match, contrast of harmonie) en de specifieke component die de koppeling draagt.

### Checklist

- Ik heb drie gangen met drie verschillende cocktails gekozen
- Ik heb per pairing het principe benoemd
- Ik vermijd zoet-op-zoet bij dessert bewust
- Ik kan mijn keuzes mondeling onderbouwen


### Reflectievraag

Bij welk gerecht op jouw kaart faalde food pairing het laatst door verkeerde zuur- of bitterstructuur, en welke ene meting zou je nu eerst doen vóór je opnieuw adviseert?',
    8,
    2
  ),
  (
    'cocktails-als-digestief',
    'Cocktails als digestief',
    'Na deze les kun jij digestiefcocktails ontwerpen die afronden zonder te verzwaren en die passen bij tafelmoment en energieniveau.
',
    'Digestiefcocktails ronden een ervaring af op comfort en helderheid. Ze mogen complex zijn, maar moeten het energiepeil van de gast respecteren. Te veel suiker, bitter of alcoholwarmte maakt de finale log.

In theorie kun je spirit-forward referenties zoals Boulevardier-varianten of Espresso Martini noemen om stijlgrenzen uit te leggen, maar in praktijk blijft digestiefdesign gericht op balans, verteerbaarheid en tafelcontext.


## Food pairing

### Beste pairing

Pure chocolade 70%, notentaart met lage suiker, oude harde kaas in kleine portie.

### Waarom dit werkt

Digestieve bitters en alcoholwarmte ondersteunen vet en umami na de maaltijd; gecontroleerde zoetheid rondt af zonder dessertgevoel; lage temperatuur houdt integratie strak.

### Vermijd

Koffie- en suikerdominante combinaties die de finale zwaar en eendimensionaal maken.

## Pro insight

Bij digestieven scoort subtiliteit hoger dan spektakel; gasten onthouden hoe ze zich voelen na de laatste slok.',
    '- digestiefbalans
- afsluitingsritme
- zoetbeheer
- alcoholwarmte
- verteerbaarheid
',
    'Fernet-Branca werd in 1845 gelanceerd als medicinale likeur. In Argentinië is Fernet con Coca inmiddels de nationale cocktail geworden — maar in Europa blijft het primair een digestief op eigen kracht, puur of on the rocks.
',
    '- Digestiefcocktails ronden af met comfort en helderheid.
- Balans weegt zwaarder dan pure intensiteit.
- Zoet- en bitterdruk moeten gecontroleerd blijven.
- Finale kwaliteit is voelbaar in energieniveau na service.
',
    '### Opdracht

Kies drie digestief-cocktails (bijv. Old Fashioned, Boulevardier, Espresso Martini) en analyseer elk op:

- mondgevoel en alcoholwarmte
- aanwezigheid van bitterheid of kruidigheid
- waarom dit vóór een maaltijd niet zou werken
- welk type maaltijd of gezelschap past het beste

### Checklist

- Ik kan het verschil uitleggen tussen aperitief- en digestief-profiel
- Ik herken spirit-forward structuur in een digestief-cocktail
- Ik kan een gastadvies formuleren voor na de maaltijd


### Reflectievraag

Hoe bewaak jij digestiefbalans zodat de afsluiting memorabel blijft zonder suikerdominantie of vermoeidheid?',
    8,
    3
  ),
  (
    'aperol-spritz',
    'Aperol Spritz als aperitief',
    'Na deze les kun jij een Aperol Spritz consistent bouwen met correcte bitter-zoetbalans, bubbeldruk en serveertemperatuur.
',
    'Aperol Spritz lijkt eenvoudig, maar balansfouten zijn direct zichtbaar: te warm, te zoet of te plat. Correcte verhouding, koude componenten en gecontroleerde carbonatie zijn de kern.

Professioneel is de Spritz een benchmark voor discipline. Een perfect glas toont dat een team basisexecutie beheerst op hoog volume.


## Food pairing

### Beste pairing

Prosciutto, zoute chips, lichte fritto misto en citrusamuses.

### Waarom dit werkt

Bitter-zoet profiel en hoge bubbelactiviteit snijden door zout en vet; lage complexiteit houdt aperitiefritme hoog.

### Vermijd

Zeer kruidige of pikante bereidingen die de bitteras uit verhouding trekken.

## Pro insight

Aperol Spritz op hoog niveau is procesdiscipline in vloeibare vorm: simpel recept, nul ruimte voor slordigheid.',
    '- spritz-ratio
- bitter-zoet-as
- bubbelbehoud
- koudeketen
- hoogvolume-precisie
',
    'De ''Aperol Spritz'' als merk en formaat werd pas in 2011 actief gepromoot door Campari Group in een internationale campagne. Daarvoor was het jarenlang een Veneto-streekgewoonte die nauwelijks buiten Noord-Italië bekend was.
',
    '- Aperol Spritz vraagt strakke verhouding en koude componenten.
- Bubbeldruk moet behouden blijven tot uitgifte.
- Te warm of te zoet breekt direct de stijl.
- Simpel recept vraagt maximale discipline.
',
    '### Opdracht

Maak een Aperol Spritz volgens de klassieke 3-2-1-structuur. Analyseer:

- bitterheid (Aperol) op schaal 1–5
- frisheid en bruis (prosecco + bruiswater)
- lichte zoetheid versus droogte
- het aperitiefeffect na de eerste twee slokken

Maak daarna een variant met minder Aperol (2-3-1) en noteer het balans-verschil.

### Checklist

- Ik heb de 3-2-1-structuur correct toegepast
- Ik heb het bittercomponent herkend en geanalyseerd
- Ik heb een variant gemaakt en het verschil genoteerd
- Ik begrijp waarom dit een aperitiefcocktail is en geen digestief


### Reflectievraag

Welke kleine processtap maakt in jouw Aperol Spritz het grootste verschil tussen ''ok'' en ''strak''?',
    8,
    4
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
    'Na deze les kun jij spirit-blind analyses uitvoeren met reproduceerbare logica en duidelijke onzekerheidscommunicatie.
',
    'Spirit-blind gaat over hypothesevorming onder onzekerheid. Je leest eerst structuur (alcoholwarmte, body, zoetrest), daarna aroma en pas dan categorie. Deze volgorde verlaagt gokbias.

Topkandidaten communiceren waarschijnlijkheid in plaats van schijnzekerheid. Dat maakt de analyse bruikbaar voor service en examen.


## Food pairing

### Beste pairing

Gebruik spirit-blind uitkomsten om pairings te herijken op basis van gemeten structuur.

### Waarom dit werkt

Objectieve detectie van mondgevoel en warmte voorkomt dat je food pairing bouwt op foutieve merkassumpties.

### Vermijd

Blindresultaten negeren wanneer ze je oorspronkelijke plan tegenspreken.

## Pro insight

Spirit-blind vaardigheid versnelt servicebesluiten omdat je minder afhankelijk wordt van etiketdenken.',
    '- spirit-blind
- hypothesevorming
- biasreductie
- waarschijnlijkheidstaal
- analyselogica
',
    'De Court of Master Sommeliers vereist dat Masters elk spirit kunnen identificeren — inclusief herkomst en productiemethode — als onderdeel van het praktijkexamen. Hetzelfde geldt voor de Bar Professionale-titel in het VK.
',
    '- Spirit-blind begint met structuur, niet met naam.
- Hypotheses zijn sterker dan snelle claims.
- Waarschijnlijkheid communiceren verhoogt professionaliteit.
- Biasreductie maakt analyses service-relevant.
',
    '### Opdracht

Bereid vijf afgedekte glazen met 10–15 ml van gin, wodka, rum, whisky en tequila in willekeurige volgorde. Gebruik hetzelfde neutrale glas. Analyseer elk:

- dominante aroma
- alcoholwarmte (scherp/glad)
- mondgevoel en textuur
- jouw hypothesis (welke spirit?)

Noteer je score en vergelijk na afloop met de werkelijkheid.

### Checklist

- Ik heb alle vijf spirits geneusd vóór proeven
- Ik heb een gestructureerde aantekening per glas gemaakt
- Ik heb mijn hypothesis vóór het antwoord genoteerd
- Ik begrijp waar ik afweek en welke aanwijzing ik miste


### Reflectievraag

Waar in jouw spirit-blind redenering sluipt de meeste merkbias binnen, en hoe neutraliseer je die?',
    8,
    1
  ),
  (
    'cocktailstructuren-blind',
    'Cocktailstructuren blind analyseren',
    'Na deze les kun jij structuur-blind beoordelen op mondgevoel, zuur, zoet, bitter en alcoholwarmte met service-relevante conclusies.
',
    'Structuren-blind verschuift focus van merkherkenning naar bouwstenen. Je beoordeelt zuur, zoet, bitter, mondgevoel en verdunning als systeem en vertaalt dat naar stijlidentiteit en serveeradvies.

Professionele waarde zit in toepasbaarheid: niet alleen benoemen wat je proeft, maar ook aangeven welke baractie logisch volgt.


## Food pairing

### Beste pairing

Koppel structuuranalyse direct aan gerechtarchitectuur: hoge zuurstructuur bij vet, hoge bitterstructuur bij zoet-vet, vol mondgevoel bij eiwitrijke gerechten.

### Waarom dit werkt

Zo vertaal je proefdata naar concrete servicebesluiten met lagere foutmarge.

### Vermijd

Alleen aroma gebruiken als basis voor pairing zonder structurele check.

## Pro insight

Structuren-blind is de brug tussen training en vloer: je ziet sneller welke cocktail in welke context echt werkt.',
    '- structuren-blind
- bodymapping
- zuuras
- bitterindex
- servicevertaling
',
    'De IBA (International Bartenders Association) organiseert jaarlijks een ''structure blind''-onderdeel in haar wedstrijdformaat, waarbij deelnemers onbekende cocktails analyseren en reconstrueren. De beste bartenders doen dit in minder dan 90 seconden.
',
    '- Structuren-blind ontleedt een cocktail in bouwstenen.
- Body, zuur, zoet en bitter vormen het besliskader.
- Analyse moet leiden tot concrete baractie.
- Toepasbaarheid is belangrijker dan theoretische perfectie.
',
    '### Opdracht

Laat iemand anders drie cocktails voor jou maken zonder de namen te noemen: één sour, één old fashioned-stijl, één highball. Analyseer elk op:

- structurele familie
- base spirit (hypothesis)
- modifier type
- techniek (geschud/geroerd/gebouwd)
- jouw reconstructie van het recept

Vergelijk daarna met de werkelijkheid en bespreek de afwijkingen.

### Checklist

- Ik heb de structurele familie correct bepaald
- Ik heb een hypothesis per glas vóór controle geformuleerd
- Ik heb modifier-type herkend
- Ik begrijp hoe ik mijn analyse kan verbeteren


### Reflectievraag

Hoe vertaal jij structuren-blind observaties naar concrete serviceacties die een team direct kan uitvoeren?',
    8,
    2
  ),
  (
    'theorie-praktijkexamen',
    'Theorie- en praktijkexamen',
    'Na deze les kun jij in het examen integraal presteren door techniek, smaaklogica, servicekeuzes en argumentatie overtuigend te combineren.
',
    'Het examen toetst integratie, niet losse kunstjes. Kandidaten moeten laten zien dat techniek, smaaklogica, tempo en communicatie elkaar versterken in realistische servicescenario''s.

Hoge scores komen van transparante redenering: aannames expliciet maken, keuzes motiveren, alternatieven benoemen en rustig bijsturen op nieuwe informatie.


## Food pairing

### Beste pairing

In examencasus: motiveer pairingkeuze met meetbare structuurargumenten en een fallback-optie.

### Waarom dit werkt

Beoordelaars waarderen reproduceerbare redenering: primaire match, risico-inschatting en correctiemechanisme.

### Vermijd

Vage smaaktaal zonder technische koppeling aan gerecht of servicecontext.

## Pro insight

Examenmeesterschap toont zich in kalmte en redenering; overtuiging groeit wanneer je keuze én alternatief beheerst.',
    '- examensynthese
- beslisargumentatie
- risicokaders
- adaptief-bijsturen
- professionele-verdediging
',
    'De beste baropleidingen ter wereld — Diageo World Class, Tales of the Cocktail, de Bar Institute — brengen examens altijd terug naar drie kernvragen: kun je een cocktail maken, kun je uitleggen waarom, en kun je iets onbekends analyseren?
',
    '- Examen toetst integratie van techniek en redenering.
- Transparante keuzes scoren beter dan losse feiten.
- Alternatieven en risico''s benoemen toont niveau.
- Kalm bijsturen onder druk is kerncompetentie.
',
    '### Opdracht — Theorie-review

Beantwoord zonder hulpmiddelen:

1. Leg de vijf basiscocktailstructuren uit en geef per structuur één voorbeeld.
2. Wat is het verschil tussen aperitief en digestief — noem drie concrete eigenschappen.
3. Beschrijf hoe je een Negroni maakt: techniek, volgorde, glas en garnish.
4. Noem de primaire aroma-aanwijzing voor elk van de vijf base spirits.
5. Waarom is verdunning een bewuste variabele en geen bijverschijnsel?

### Opdracht — Praktijk-review

- Maak een Whisky Sour zonder recept te raadplegen
- Maak een Negroni zonder recept te raadplegen
- Laat iemand een onbekende cocktail maken; identificeer structuur en base spirit

### Checklist

- Ik heb alle vijf theorievragen beantwoord zonder hulp
- Ik heb beide klassieke cocktails op geheugen gemaakt
- Ik heb de blind structuuranalyse uitgevoerd
- Ik heb notities gemaakt over mijn zwakste punten voor verdere studie


### Reflectievraag

Welke examenvaardigheid wil jij bewust demonstreren om te tonen dat je onder druk nog steeds systematisch beslist?',
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
  ('intro-cocktails', 'wat-is-een-cocktail', 1, 'Wat maakt een cocktail fundamenteel anders dan een simpele mixdrank?', '["Het glaswerk", "Bewuste balans tussen componenten", "Het alcoholpercentage", "Het aantal ingrediënten"]', 1, 'Correct: Bewuste balans tussen componenten'),
  ('intro-cocktails', 'wat-is-een-cocktail', 2, 'Je proeft een cocktail waarin de base spirit volledig verdwijnt achter zoetheid. Wat is het meest waarschijnlijke probleem?', '["Te weinig ijs", "Overdosis modifier", "Te weinig garnish", "Verkeerd glaswerk"]', 1, 'Correct: Overdosis modifier'),
  ('intro-cocktails', 'wat-is-een-cocktail', 3, 'Welke cocktailstructuur past het best bij een aperitief vóór een diner?', '["Zware dessertcocktail", "Bittere en droge cocktail", "Romige cocktail", "Zoete milk punch"]', 1, 'Correct: Bittere en droge cocktail'),
  ('intro-cocktails', 'wat-is-een-cocktail', 4, 'Een gast zegt: ''Ik wil iets fris maar niet zuur.'' Wat is je beste eerste stap?', '["Meteen een random sour maken", "Kort peilen naar zoetheid en spiritvoorkeur, dan structuur kiezen", "Alleen vragen naar budget", "Een extra bittere klassieker serveren"]', 1, 'Correct: Kort peilen naar zoetheid en spiritvoorkeur, dan structuur kiezen'),
  ('intro-cocktails', 'wat-is-een-cocktail', 5, 'Je team levert wisselende resultaten op dezelfde cocktail. Wat corrigeer je eerst?', '["Decoratie", "Recepttaal rond balans en verdunning standaardiseren", "Muziekvolume", "Glaslogo"]', 1, 'Correct: Recepttaal rond balans en verdunning standaardiseren'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 1, 'Waarom werd citrus tijdens Prohibition extra belangrijk?', '["Voor kleur", "Om slechte spirits te maskeren", "Voor meer alcohol", "Voor schuim"]', 1, 'Correct: Om slechte spirits te maskeren'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 2, 'Welke moderne bartenderles komt direct voort uit Prohibition?', '["Minder balans", "Creatief omgaan met imperfecte ingrediënten", "Minder techniek", "Minder structuur"]', 1, 'Correct: Creatief omgaan met imperfecte ingrediënten'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 3, 'Waarom blijven klassieke recepten vandaag relevant?', '["Omdat ze goedkoop zijn", "Omdat hun structuur tijdloos werkt", "Omdat ze makkelijk zijn", "Omdat ze oud zijn"]', 1, 'Correct: Omdat hun structuur tijdloos werkt'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 4, 'Een gast wil een klassieker, maar kent de naam niet. Wat werkt professioneel?', '["Geschiedenis negeren en gokken", "Korte historische context gebruiken om smaakverwachting te kaderen", "Alleen de duurste optie voorstellen", "Meteen shotservice aanbieden"]', 1, 'Correct: Korte historische context gebruiken om smaakverwachting te kaderen'),
  ('intro-cocktails', 'geschiedenis-van-cocktails', 5, 'Waarom helpt cocktailgeschiedenis in verkoop?', '["Omdat elke gast detailjaren wil horen", "Omdat context vertrouwen bouwt en keuze vergemakkelijkt", "Omdat techniek dan niet meer nodig is", "Omdat alle klassiekers hetzelfde smaken"]', 1, 'Correct: Omdat context vertrouwen bouwt en keuze vergemakkelijkt'),
  ('intro-cocktails', 'spirit-modifier-balance', 1, 'Wat gebeurt er als je in een Negroni de Campari verdubbelt?', '["Minder bitterheid", "Bitterheid domineert sterker", "Meer zoetheid", "Minder kleur"]', 1, 'Correct: Bitterheid domineert sterker'),
  ('intro-cocktails', 'spirit-modifier-balance', 2, 'Welke rol heeft vermouth meestal?', '["Base spirit", "Modifier", "Garnish", "Carbonatie"]', 1, 'Correct: Modifier'),
  ('intro-cocktails', 'spirit-modifier-balance', 3, 'Waarom voelt een cocktail “vlak” aan?', '["Te weinig alcohol", "Gebrek aan contrast of balans", "Te veel ijs", "Te koud"]', 1, 'Correct: Gebrek aan contrast of balans'),
  ('intro-cocktails', 'spirit-modifier-balance', 4, 'Je Daiquiri is te scherp. Wat corrigeer je als eerste?', '["Meer bitters", "Zoetcomponent in kleine stap verhogen en herproeven", "Dubbele alcohol", "Extra garnish"]', 1, 'Correct: Zoetcomponent in kleine stap verhogen en herproeven'),
  ('intro-cocktails', 'spirit-modifier-balance', 5, 'Een cocktail smaakt vlak ondanks juiste ratio. Wat check je daarna?', '["Integratie en verdunning door ijscontact", "Alleen glasvorm", "Alleen merknaam", "Alleen kleur"]', 0, 'Correct: Integratie en verdunning door ijscontact'),
  ('intro-cocktails', 'basisstructuren-cocktails', 1, 'Waarom is de sour-structuur zo universeel?', '["Omdat hij goedkoop is", "Omdat zuur en zoet spanning creëren", "Omdat hij altijd sterk is", "Omdat hij bruisend is"]', 1, 'Correct: Omdat zuur en zoet spanning creëren'),
  ('intro-cocktails', 'basisstructuren-cocktails', 2, 'Wat gebeurt er als je in een sour te weinig suiker gebruikt?', '["Meer mondgevoel", "De zuurheid domineert harder", "Meer bitterheid", "Meer mousse"]', 1, 'Correct: De zuurheid domineert harder'),
  ('intro-cocktails', 'basisstructuren-cocktails', 3, 'Welke structuur is het meest spirit-forward?', '["Sour", "Old Fashioned", "Highball", "Fizz"]', 1, 'Correct: Old Fashioned'),
  ('intro-cocktails', 'basisstructuren-cocktails', 4, 'Bij een old-fashioned-structuur valt het glas te zoet uit. Beste ingreep?', '["Meer suiker toevoegen", "Bitteras verhogen of verdunning verfijnen", "Citrussap toevoegen zonder plan", "Koolzuur bijvullen"]', 1, 'Correct: Bitteras verhogen of verdunning verfijnen'),
  ('intro-cocktails', 'basisstructuren-cocktails', 5, 'Waarom start je diagnose met structuur in plaats van ingredientenlijst?', '["Structuur toont welke smaakas fout staat", "Ingredienten zijn onbelangrijk", "Omdat garnish alles oplost", "Omdat ijs nooit invloed heeft"]', 0, 'Correct: Structuur toont welke smaakas fout staat'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 1, 'Waarom kies je een aperitief vaak droger?', '["Om alcohol te verhogen", "Om eetlust te activeren", "Om het zoeter te maken", "Om ijs te besparen"]', 1, 'Correct: Om eetlust te activeren'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 2, 'Wat maakt een digestief functioneel?', '["Meer zuren", "Meer rijkdom en aromatische diepte", "Minder alcohol", "Meer koolzuur"]', 1, 'Correct: Meer rijkdom en aromatische diepte'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 3, 'Welke categorie past het best bij een warme zomerdag?', '["Long drink", "Digestief", "Short drink", "Spirit-forward"]', 0, 'Correct: Long drink'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 4, 'Een gast wil ''iets lichts voor nu en iets diepers daarna''. Wat doe je?', '["Twee zware digestiefs aanbieden", "Categorieen gebruiken om servicevolgorde logisch op te bouwen", "Alleen house special pushen", "Zonder vragen random mixen"]', 1, 'Correct: Categorieen gebruiken om servicevolgorde logisch op te bouwen'),
  ('intro-cocktails', 'klassieke-cocktailcategorieen', 5, 'Welke kaartkeuze ondersteunt snelle piekservice het best?', '["Ongeordende lijst", "Segmentatie op structuur en drinkmoment", "Alleen op kleur geordend", "Alleen op prijs oplopend"]', 1, 'Correct: Segmentatie op structuur en drinkmoment'),
  ('technieken-cocktails', 'shaken', 1, 'Waarom shake je citruscocktails?', '["Voor helderheid", "Voor emulsie en integratie", "Voor minder temperatuur", "Voor minder ijs"]', 1, 'Correct: Voor emulsie en integratie'),
  ('technieken-cocktails', 'shaken', 2, 'Wat is het grootste risico van te lang shaken?', '["Te weinig kou", "Oververdunning", "Te weinig textuur", "Minder zuur"]', 1, 'Correct: Oververdunning'),
  ('technieken-cocktails', 'shaken', 3, 'Waarom wordt een Daiquiri geshaket?', '["Vanwege vermouth", "Vanwege citrusintegratie", "Vanwege bitters", "Vanwege suiker"]', 1, 'Correct: Vanwege citrusintegratie'),
  ('technieken-cocktails', 'shaken', 4, 'Na shaken is je cocktail waterig. Waarschijnlijke oorzaak?', '["Te korte shake", "Te lange shake of zwakke ijsmassa", "Te koude coupe", "Te weinig garnish"]', 1, 'Correct: Te lange shake of zwakke ijsmassa'),
  ('technieken-cocktails', 'shaken', 5, 'Wat borgt bij shaken de beste consistentie tussen bartenders?', '["Vrije interpretatie per persoon", "Vaste ijsratio en tijdsvenster per recept", "Alleen smaak op gevoel", "Geen line-checks"]', 1, 'Correct: Vaste ijsratio en tijdsvenster per recept'),
  ('technieken-cocktails', 'stirred', 1, 'Waarom wordt een Manhattan geroerd?', '["Om schuim te maken", "Om helderheid te bewaren", "Om zuur te activeren", "Om sneller te koelen"]', 1, 'Correct: Om helderheid te bewaren'),
  ('technieken-cocktails', 'stirred', 2, 'Wat gebeurt er als je een Martini shaket?', '["Meer helderheid", "Troebelheid en extra verdunning", "Minder kou", "Minder aroma"]', 1, 'Correct: Troebelheid en extra verdunning'),
  ('technieken-cocktails', 'stirred', 3, 'Waarom is stirred ideaal voor spirit-forward cocktails?', '["Minder integratie", "Meer controle over verdunning", "Meer schuim", "Meer koolzuur"]', 1, 'Correct: Meer controle over verdunning'),
  ('technieken-cocktails', 'stirred', 4, 'Je stirred drink oogt troebel. Eerste technische check?', '["Roeren langer met nat, brekend ijs", "Ijskwaliteit en roerritme op helderheid controleren", "Extra citrussap toevoegen", "Direct serveren zonder proef"]', 1, 'Correct: Ijskwaliteit en roerritme op helderheid controleren'),
  ('technieken-cocktails', 'stirred', 5, 'Waarom is garnishdiscipline bij stirred drinks cruciaal?', '["Omdat visuals het enige doel zijn", "Omdat kleine aromasignalen de integratie sterk sturen", "Omdat garnish bitterheid verlaagt", "Omdat stirred drinks geen verdunning kennen"]', 1, 'Correct: Omdat kleine aromasignalen de integratie sterk sturen'),
  ('technieken-cocktails', 'built', 1, 'Waarom voeg je carbonatie als laatste toe?', '["Voor kleur", "Om bruis te behouden", "Voor extra alcohol", "Voor bitterheid"]', 1, 'Correct: Om bruis te behouden'),
  ('technieken-cocktails', 'built', 2, 'Wat gebeurt er bij te veel roeren na soda?', '["Meer spanning", "Verlies van carbonatie", "Meer mondgevoel", "Meer aroma"]', 1, 'Correct: Verlies van carbonatie'),
  ('technieken-cocktails', 'built', 3, 'Waarom is ijskwaliteit cruciaal bij built?', '["Voor uiterlijk", "Voor gecontroleerde verdunning", "Voor meer alcohol", "Voor kleur"]', 1, 'Correct: Voor gecontroleerde verdunning'),
  ('technieken-cocktails', 'built', 4, 'Een highball verliest snel prik aan tafel. Wat pas je eerst aan?', '["Meer roeren in het glas", "Opbouwvolgorde en minimale agitatie voor koolzuurbehoud", "Warmer ijs gebruiken", "Extra suikersiroop"]', 1, 'Correct: Opbouwvolgorde en minimale agitatie voor koolzuurbehoud'),
  ('technieken-cocktails', 'built', 5, 'Welke built-routine is het meest professioneel tijdens piek?', '["Top-up op gevoel zonder meting", "Gestandaardiseerde vulhoogte en korte finish-stir", "Elk glas eerst lang shaken", "Geen ijs gebruiken"]', 1, 'Correct: Gestandaardiseerde vulhoogte en korte finish-stir'),
  ('technieken-cocktails', 'layering', 1, 'Waar draait layering technisch om?', '["Temperatuur", "Densiteit", "Alcoholpercentage", "Kleur"]', 1, 'Correct: Densiteit'),
  ('technieken-cocktails', 'layering', 2, 'Wat gebeurt als je te snel schenkt?', '["Meer lagen", "Lagen breken door elkaar", "Meer aroma", "Meer textuur"]', 1, 'Correct: Lagen breken door elkaar'),
  ('technieken-cocktails', 'layering', 3, 'Waarom is layering vooral visueel krachtig?', '["Het vertraagt alcohol", "Het toont structuur per component", "Het maakt kouder", "Het maakt zoeter"]', 1, 'Correct: Het toont structuur per component'),
  ('technieken-cocktails', 'layering', 4, 'Je layered cocktail mixt direct in elkaar. Wat is meest waarschijnlijk?', '["Te groot dichtheidsverschil", "Te weinig dichtheidsverschil of verkeerde schenksnelheid", "Te koud glas", "Te kleine garnish"]', 1, 'Correct: Te weinig dichtheidsverschil of verkeerde schenksnelheid'),
  ('technieken-cocktails', 'layering', 5, 'Wanneer is layering af te raden in service?', '["Als visuele winst ten koste gaat van smaakintegratie", "Als de gast foto wil maken", "Als de bar rustig is", "Als het glas helder is"]', 0, 'Correct: Als visuele winst ten koste gaat van smaakintegratie'),
  ('technieken-cocktails', 'muddling', 1, 'Waarom muddle je munt voorzichtig?', '["Voor kleur", "Om bitterheid te vermijden", "Om alcohol te verlagen", "Om schuim te maken"]', 1, 'Correct: Om bitterheid te vermijden'),
  ('technieken-cocktails', 'muddling', 2, 'Wat gebeurt er als je citrusschil te agressief muddlet?', '["Meer zoetheid", "Meer bitterheid", "Minder aroma", "Minder olie"]', 1, 'Correct: Meer bitterheid'),
  ('technieken-cocktails', 'muddling', 3, 'Wat is het doel van muddling?', '["Extractie van aroma’s", "Koeling", "Carbonatie", "Verdunning"]', 0, 'Correct: Extractie van aroma’s'),
  ('technieken-cocktails', 'muddling', 4, 'Muntcocktail smaakt bitter-groen. Waardoor meestal?', '["Te zachte muddling", "Te harde muddling met bladbeschadiging", "Te koud ijs", "Te weinig limoen"]', 1, 'Correct: Te harde muddling met bladbeschadiging'),
  ('technieken-cocktails', 'muddling', 5, 'Wat is een goede muddlingregel?', '["Altijd maximale kracht", "Net genoeg druk voor aroma-extractie zonder pulp", "Alleen roeren met bladeren", "Muddling altijd overslaan"]', 1, 'Correct: Net genoeg druk voor aroma-extractie zonder pulp'),
  ('ingredienten-cocktails', 'base-spirits', 1, 'Waarom werkt gin vaak beter dan vodka in aromatische cocktails?', '["Meer alcohol", "Meer botanische complexiteit", "Meer suiker", "Minder geur"]', 1, 'Correct: Meer botanische complexiteit'),
  ('ingredienten-cocktails', 'base-spirits', 2, 'Wat gebeurt er als je witte rum vervangt door aged rum in een Daiquiri?', '["Minder mondgevoel", "Meer hout en diepte", "Minder aroma", "Meer zuur"]', 1, 'Correct: Meer hout en diepte'),
  ('ingredienten-cocktails', 'base-spirits', 3, 'Welke spirit geeft meestal de meest neutrale basis?', '["Vodka", "Gin", "Rum", "Tequila"]', 0, 'Correct: Vodka'),
  ('ingredienten-cocktails', 'base-spirits', 4, 'Gast wil ''krachtig maar niet zwaar''. Wat stuur je eerst?', '["Hoogste ABV kiezen", "Base spirit op mondgevoel en aromaprojectie kiezen", "Alleen kleur van de drank", "Alleen merkbekendheid"]', 1, 'Correct: Base spirit op mondgevoel en aromaprojectie kiezen'),
  ('ingredienten-cocktails', 'base-spirits', 5, 'Welke teamfout zie je vaak bij spiritkeuze?', '["Structuurfit negeren en op merknaam bouwen", "Te weinig decoratie", "Te veel ijs in freezer", "Te snelle pinbetaling"]', 0, 'Correct: Structuurfit negeren en op merknaam bouwen'),
  ('ingredienten-cocktails', 'likeuren', 1, 'Wat gebeurt er als je in een Margarita Cointreau vervangt door een zoetere likeur?', '["Meer droogheid", "Minder balans door extra zoetheid", "Meer zuur", "Minder mondgevoel"]', 1, 'Correct: Minder balans door extra zoetheid'),
  ('ingredienten-cocktails', 'likeuren', 2, 'Waarom zijn likeuren gevaarlijk in overdosering?', '["Ze geven kleur", "Ze kunnen balans overnemen", "Ze maken kouder", "Ze verlagen alcohol"]', 1, 'Correct: Ze kunnen balans overnemen'),
  ('ingredienten-cocktails', 'likeuren', 3, 'Welke likeur voegt vooral bitterheid toe?', '["Campari", "Cointreau", "Chambord", "Triple Sec"]', 0, 'Correct: Campari'),
  ('ingredienten-cocktails', 'likeuren', 4, 'Een cocktail wordt plakkerig zoet na likeurtoevoeging. Wat doe je?', '["Nog meer likeur", "Dosering terug en zuur/bitteras herstellen", "Alleen garnishes wisselen", "Water toevoegen zonder proef"]', 1, 'Correct: Dosering terug en zuur/bitteras herstellen'),
  ('ingredienten-cocktails', 'likeuren', 5, 'Waarom is likeur een risicocomponent in piekservice?', '["Omdat likeuren geen aroma hebben", "Omdat kleine ml-afwijkingen balans sterk verschuiven", "Omdat likeuren altijd goedkoop zijn", "Omdat ze geen suiker bevatten"]', 1, 'Correct: Omdat kleine ml-afwijkingen balans sterk verschuiven'),
  ('ingredienten-cocktails', 'bitters', 1, 'Wat gebeurt er als je bitters weglaat uit een Old Fashioned?', '["Meer structuur", "Minder diepte en spanning", "Meer bitterheid", "Meer balans"]', 1, 'Correct: Minder diepte en spanning'),
  ('ingredienten-cocktails', 'bitters', 2, 'Waarom gebruik je bitters in kleine hoeveelheden?', '["Ze zijn zwak", "Ze zijn extreem geconcentreerd", "Ze koelen snel", "Ze geven volume"]', 1, 'Correct: Ze zijn extreem geconcentreerd'),
  ('ingredienten-cocktails', 'bitters', 3, 'Welke cocktail is het meest afhankelijk van bitters?', '["Old Fashioned", "Mojito", "Margarita", "Daiquiri"]', 0, 'Correct: Old Fashioned'),
  ('ingredienten-cocktails', 'bitters', 4, 'Een cocktail mist lengte in de afdronk. Welke tool helpt vaak?', '["Extra siroop", "Precisiedosering bitters voor spanning en droge finish", "Minder ijs", "Extra room"]', 1, 'Correct: Precisiedosering bitters voor spanning en droge finish'),
  ('ingredienten-cocktails', 'bitters', 5, 'Wat is professioneel bittergebruik?', '["Op gevoel grote scheuten", "Reproduceerbare dash-techniek per recept", "Bitters alleen als kleur", "Bitters altijd vervangen door zout"]', 1, 'Correct: Reproduceerbare dash-techniek per recept'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 1, 'Wat gebeurt er als je in een Daiquiri 10 ml extra lime toevoegt?', '["Meer balans", "Hogere zuurdominantie", "Meer mondgevoel", "Minder spanning"]', 1, 'Correct: Hogere zuurdominantie'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 2, 'Waarom werkt verse citrus beter dan flessensap?', '["Meer alcohol", "Hogere aromatische frisheid", "Meer suiker", "Minder zuur"]', 1, 'Correct: Hogere aromatische frisheid'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 3, 'Wat doet rich syrup (2:1) anders dan simple syrup?', '["Minder mondgevoel", "Meer textuur en gewicht", "Minder zoet", "Meer bitter"]', 1, 'Correct: Meer textuur en gewicht'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 4, 'Je sour smaakt in avondshift zuurder dan middagshift. Waarschijnlijk?', '["Citrussterkte veranderde, ratio niet mee aangepast", "Glas werd te schoon", "IJs was te hard", "Barspoon te lang"]', 0, 'Correct: Citrussterkte veranderde, ratio niet mee aangepast'),
  ('ingredienten-cocktails', 'citrus-en-suikers', 5, 'Welke routine houdt zuur-zoetbalans stabiel?', '["Geen checks, alleen vertrouwen op receptkaart", "Shiftgewijze line-check met kleine ratio-correcties", "Alleen extra suiker klaarzetten", "Elke cocktail dezelfde garnish"]', 1, 'Correct: Shiftgewijze line-check met kleine ratio-correcties'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 1, 'Wat meet een mini-toets primair?', '["Alleen theoriekennis", "Integratie van techniek, balans en besluitvorming", "Alleen snelheid", "Alleen glaswerk"]', 1, 'Correct: Integratie van techniek, balans en besluitvorming'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 2, 'Welke techniek hoort bij een spirit-forward cocktail in de toets?', '["Shaken", "Stirred", "Muddling", "Layering"]', 1, 'Correct: Stirred'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 3, 'Wat is de grootste risicofactor bij vier cocktails achter elkaar?', '["Te weinig ijs in voorraad", "Verlies van verdunningscontrole en tempo", "Te veel garnish", "Te koude coupe"]', 1, 'Correct: Verlies van verdunningscontrole en tempo'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 4, 'Je mini-toets toont consistente oververdunning in sours. Beste opvolging?', '["Meer shakekracht zonder analyse", "IJsmanagement en shakevenster gericht retrainen", "Alle recepten herschrijven", "Minder meten aan de bar"]', 1, 'Correct: IJsmanagement en shakevenster gericht retrainen'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 5, 'Waarom is foutenanalyse na de toets essentieel?', '["Omdat cijfers genoeg zeggen", "Omdat patroonherkenning directe serviceverbetering oplevert", "Omdat trainen niet nodig is", "Omdat gasten geen verschil proeven"]', 1, 'Correct: Omdat patroonherkenning directe serviceverbetering oplevert'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 6, 'Welke cocktail in de toets vraagt muddling?', '["Martini", "Mojito of mojito-achtige opdracht", "Manhattan", "Negroni"]', 1, 'Correct: Mojito of mojito-achtige opdracht'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 7, 'Wat hoort in mise-en-place vóór een mini-toets?', '["Alleen spirits", "IJs, tools, glaswerk en vooraf gemeten modifiers", "Alleen citrus", "Alleen receptkaart"]', 1, 'Correct: IJs, tools, glaswerk en vooraf gemeten modifiers'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 8, 'Highball in de toets: kritische succesfactor?', '["Maximale shakekracht", "Build-volgorde en koolzuurbehoud", "Dubbele fine strain", "Warm serveren"]', 1, 'Correct: Build-volgorde en koolzuurbehoud'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 9, 'Stirred cocktail valt waterig uit. Eerste hypothese?', '["Te weinig vermout", "Te lang roeren of te klein ijscontact", "Te weinig garnish", "Verkeerde coupe"]', 1, 'Correct: Te lang roeren of te klein ijscontact'),
  ('ingredienten-cocktails', 'mini-toets-cocktails', 10, 'Wat maakt mini-toetsresultaat schaalbaar?', '["Eenmalige perfecte run", "Herhaalbare standaard en gedocumenteerde correcties", "Improvisatie per shift", "Minder proeven tijdens service"]', 1, 'Correct: Herhaalbare standaard en gedocumenteerde correcties'),
  ('klassiek-cocktails', 'martini', 1, 'Wat gebeurt er als je meer vermouth toevoegt?', '["Meer droogte", "Zachtere textuur en meer aromatische breedte", "Minder aroma", "Meer bitterheid"]', 1, 'Correct: Zachtere textuur en meer aromatische breedte'),
  ('klassiek-cocktails', 'martini', 2, 'Waarom is oude vermouth problematisch?', '["Minder kleur", "Oxidatie verlaagt precisie", "Meer alcohol", "Minder kou"]', 1, 'Correct: Oxidatie verlaagt precisie'),
  ('klassiek-cocktails', 'martini', 3, 'Welke garnish geeft de meeste aromatische lift?', '["Olive", "Lemon twist", "Cherry", "Mint"]', 1, 'Correct: Lemon twist'),
  ('klassiek-cocktails', 'martini', 4, 'Martini valt vlak uit ondanks premium gin. Eerste correctie?', '["Meer olive brine", "Vermoutverhouding en roertijd herkalibreren", "Extra suikersiroop", "Langer shaken"]', 1, 'Correct: Vermoutverhouding en roertijd herkalibreren'),
  ('klassiek-cocktails', 'martini', 5, 'Welke vraag voorkomt de meeste Martini-remakes?', '["Alleen 'met ijs?'", "Dry/wet-voorkeur en gewenste garnish vooraf", "'Ken je James Bond?'", "'Wil je een foto?'"]', 1, 'Correct: Dry/wet-voorkeur en gewenste garnish vooraf'),
  ('klassiek-cocktails', 'old-fashioned', 1, 'Wat is de kernstructuur van een Old Fashioned?', '["Spirit, citrus, suiker, eiwit", "Spirit, suiker, bitters, verdunning", "Spirit, vermout, bitters", "Spirit, soda, citrus"]', 1, 'Correct: Spirit, suiker, bitters, verdunning'),
  ('klassiek-cocktails', 'old-fashioned', 2, 'Welke fout maakt een Old Fashioned het snelst vlak?', '["Te weinig garnish", "Oververdunning door slecht ijsmanagement", "Te kleine coupe", "Te koude barspoon"]', 1, 'Correct: Oververdunning door slecht ijsmanagement'),
  ('klassiek-cocktails', 'old-fashioned', 3, 'Welke techniek past het best bij klassieke Old Fashioned-service?', '["Hard shaken", "Direct build en korte gecontroleerde stir op ijs", "Dry shake en fine strain", "Layering in shotglas"]', 1, 'Correct: Direct build en korte gecontroleerde stir op ijs'),
  ('klassiek-cocktails', 'old-fashioned', 4, 'Een gast wil minder zoet maar wel rond. Beste aanpassing?', '["Meer suiker en minder bitters", "Suiker licht verlagen en bitter/verdunning preciezer sturen", "Citroensap toevoegen", "Soda top-up toevoegen"]', 1, 'Correct: Suiker licht verlagen en bitter/verdunning preciezer sturen'),
  ('klassiek-cocktails', 'old-fashioned', 5, 'Welke garnishkeuze ondersteunt de Old Fashioned meestal het best?', '["Muntbos", "Citruszeste met gecontroleerde aromatische lift", "Komkommerschijf", "Zout rand"]', 1, 'Correct: Citruszeste met gecontroleerde aromatische lift'),
  ('klassiek-cocktails', 'manhattan', 1, 'Wat is de klassieke basis van een Manhattan?', '["Rye of bourbon met zoete vermout en bitters", "Gin met droge vermout", "Rum met limoensap", "Tequila met agave"]', 0, 'Correct: Rye of bourbon met zoete vermout en bitters'),
  ('klassiek-cocktails', 'manhattan', 2, 'Welke techniek hoort bij Manhattan-bouw?', '["Shaken met crushed ice", "Stirred met koud compact ijs voor helderheid", "Layered in highball", "Built met soda"]', 1, 'Correct: Stirred met koud compact ijs voor helderheid'),
  ('klassiek-cocktails', 'manhattan', 3, 'Waarom is vermoutversheid cruciaal in een Manhattan?', '["Alleen voor kleur", "Oude vermout verliest integratie en maakt het profiel vlak", "Omdat bitters dan overbodig zijn", "Omdat whiskey dan minder alcohol heeft"]', 1, 'Correct: Oude vermout verliest integratie en maakt het profiel vlak'),
  ('klassiek-cocktails', 'manhattan', 4, 'Een Manhattan smaakt log. Wat corrigeer je eerst?', '["Meer suiker", "Verhouding whiskey-vermouth en verdunningsniveau", "Alleen garnish verwijderen", "Extra citrussap"]', 1, 'Correct: Verhouding whiskey-vermouth en verdunningsniveau'),
  ('klassiek-cocktails', 'manhattan', 5, 'Welke garnish sluit klassiek het best aan bij een Manhattan?', '["Selderij", "Cocktailkers met gecontroleerde dosage-impact", "Sinaasappelsap", "Rietsuiker rand"]', 1, 'Correct: Cocktailkers met gecontroleerde dosage-impact'),
  ('klassiek-cocktails', 'negroni', 1, 'Wat is de klassieke ratio van een Negroni?', '["2:1:1", "1:1:1", "3:2:1", "1:2:1"]', 1, 'Correct: 1:1:1'),
  ('klassiek-cocktails', 'negroni', 2, 'Welke component levert de kern van de bittere spanning?', '["Zoete vermout", "Campari of vergelijkbare bittercomponent", "Soda", "Eiwit"]', 1, 'Correct: Campari of vergelijkbare bittercomponent'),
  ('klassiek-cocktails', 'negroni', 3, 'Welke techniek is standaard voor Negroni-service?', '["Hard shaken", "Build over ijs met korte gecontroleerde stir", "Dry shake", "Layering in flute"]', 1, 'Correct: Build over ijs met korte gecontroleerde stir'),
  ('klassiek-cocktails', 'negroni', 4, 'De Negroni smaakt scherp en kort. Wat helpt het meest?', '["Meer campari toevoegen", "Verdunning finetunen en componentkwaliteit checken", "Suikerrand toevoegen", "Koolzuur toevoegen"]', 1, 'Correct: Verdunning finetunen en componentkwaliteit checken'),
  ('klassiek-cocktails', 'negroni', 5, 'Waarom is duidelijke variantcommunicatie bij Negroni belangrijk?', '["Omdat varianten identiek smaken", "Omdat bitter-zoetprofiel sterk kan verschuiven per twist", "Omdat garnish altijd hetzelfde is", "Omdat gin geen rol speelt"]', 1, 'Correct: Omdat bitter-zoetprofiel sterk kan verschuiven per twist'),
  ('klassiek-cocktails', 'daiquiri', 1, 'Wat gebeurt als lime zuurder is dan normaal?', '["Meer balans", "Meer scherpe zuurspanning", "Meer mondgevoel", "Minder lengte"]', 1, 'Correct: Meer scherpe zuurspanning'),
  ('klassiek-cocktails', 'daiquiri', 2, 'Wat doet aged rum?', '["Minder diepte", "Meer hout en gewicht op het palet", "Minder aroma", "Minder mondgevoel"]', 1, 'Correct: Meer hout en gewicht op het palet'),
  ('klassiek-cocktails', 'daiquiri', 3, 'Waarom is double strain belangrijk?', '["Meer ijs", "Schonere textuur", "Meer suiker", "Meer bitter"]', 1, 'Correct: Schonere textuur'),
  ('klassiek-cocktails', 'daiquiri', 4, 'Daiquiri smaakt plots vlak in drukke service. Wat check je eerst?', '["Of de limebatch nog voldoende zuurspanning heeft", "Alleen coupekleur", "Alleen rietjesvoorraad", "Alleen gastfeedback achteraf"]', 0, 'Correct: Of de limebatch nog voldoende zuurspanning heeft'),
  ('klassiek-cocktails', 'daiquiri', 5, 'Welke routine borgt Daiquiri-consistentie het best?', '["Iedereen eigen ratio laten kiezen", "Startshift referentieglas en periodieke line-check", "Altijd extra siroop toevoegen", "Nooit proeven tijdens service"]', 1, 'Correct: Startshift referentieglas en periodieke line-check'),
  ('sour-family-cocktails', 'whiskey-sour', 1, 'Wat is de kern van een Whiskey Sour-structuur?', '["Whiskey, citrus, zoet, optionele textuurlaag", "Whiskey, vermout, bitters", "Whiskey, soda, zout", "Whiskey, room, likeur"]', 0, 'Correct: Whiskey, citrus, zoet, optionele textuurlaag'),
  ('sour-family-cocktails', 'whiskey-sour', 2, 'Welke techniek verhoogt foamstabiliteit het meest?', '["Alleen wet shake", "Dry shake gevolgd door wet shake", "Alleen roeren", "Layering met lepel"]', 1, 'Correct: Dry shake gevolgd door wet shake'),
  ('sour-family-cocktails', 'whiskey-sour', 3, 'Een Whiskey Sour smaakt te scherp. Eerste correctie?', '["Extra citrussap", "Zoetcomponent in kleine stap verhogen en herkalibreren", "Meer bitters direct in bulk", "Minder ijs gebruiken"]', 1, 'Correct: Zoetcomponent in kleine stap verhogen en herkalibreren'),
  ('sour-family-cocktails', 'whiskey-sour', 4, 'Welke rol heeft bitters-garnish op de foamlaag?', '["Alleen decoratie", "Extra aromatische lift en subtiele bitterspanning", "Verhoogt ABV direct", "Vervangt citrus"]', 1, 'Correct: Extra aromatische lift en subtiele bitterspanning'),
  ('sour-family-cocktails', 'whiskey-sour', 5, 'Welke servicefout ondermijnt Whiskey Sour het vaakst?', '["Te koude coupe", "Te late uitgifte waardoor foam en textuur instorten", "Te korte menukaart", "Te veel barlicht"]', 1, 'Correct: Te late uitgifte waardoor foam en textuur instorten'),
  ('sour-family-cocktails', 'margarita', 1, 'Wat is het grootste verschil met een klassieke Margarita?', '["Minder citrus", "Geen orange liqueur, puur agave-focus", "Meer alcohol", "Minder tequila"]', 1, 'Correct: Geen orange liqueur, puur agave-focus'),
  ('sour-family-cocktails', 'margarita', 2, 'Wat doet agave syrup anders?', '["Meer bitter", "Rondere sweetness textuur", "Minder mondgevoel", "Minder lengte"]', 1, 'Correct: Rondere sweetness textuur'),
  ('sour-family-cocktails', 'margarita', 3, 'Waarom is tequila-kwaliteit hier cruciaal?', '["Minder belangrijk", "Minder modifiers om fouten te verbergen", "Meer suiker", "Meer garnish"]', 1, 'Correct: Minder modifiers om fouten te verbergen'),
  ('sour-family-cocktails', 'margarita', 4, 'Scenario: tijdens piekservice smaakt je Margarita plots vlak en kort.', '["Meer zout op de rand zonder proeven", "Limezuur en verdunning opnieuw kalibreren op referentiesmaak", "Triple sec verdubbelen", "Minder ijs gebruiken zodat de cocktail warmer blijft"]', 1, 'Correct: Limezuur en verdunning opnieuw kalibreren op referentiesmaak'),
  ('sour-family-cocktails', 'margarita', 5, 'Scenario: gast wil "frisser en droger" dan je huis-Margarita.', '["Suikercomponent licht verlagen en zuuras strak houden", "Extra siroop toevoegen", "Geen citrus meer gebruiken", "Alleen glas wisselen"]', 0, 'Correct: Suikercomponent licht verlagen en zuuras strak houden'),
  ('sour-family-cocktails', 'sidecar', 1, 'Wat doet de suikerrand?', '["Meer zuur", "Verzacht zuuraanval", "Meer bitter", "Meer alcohol"]', 1, 'Correct: Verzacht zuuraanval'),
  ('sour-family-cocktails', 'sidecar', 2, 'Wat gebeurt bij extra citroen?', '["Hogere zuurspanning", "Meer mondgevoel", "Minder frisheid", "Meer zachtheid"]', 0, 'Correct: Hogere zuurspanning'),
  ('sour-family-cocktails', 'sidecar', 3, 'Waarom is cognac uniek in een sour?', '["Meer neutraliteit", "Meer oak en fruit complexity", "Minder structuur", "Minder lengte"]', 1, 'Correct: Meer oak en fruit complexity'),
  ('sour-family-cocktails', 'sidecar', 4, 'Scenario: je Sidecar eindigt plakkerig in plaats van strak.', '["Cognac verhogen", "Sinaasappellikeur verlagen en citrussnede herijken", "Extra suikerrand toevoegen", "Meer ijs in het serveerglas"]', 1, 'Correct: Sinaasappellikeur verlagen en citrussnede herijken'),
  ('sour-family-cocktails', 'sidecar', 5, 'Scenario: gast ervaart je Sidecar als te scherp.', '["Citroen weglaten", "Subtiel meer ronding via likeur of rijpere cognac, zonder zoet te maken", "Dubbele portie serveren", "Cocktail vervangen door shot"]', 1, 'Correct: Subtiel meer ronding via likeur of rijpere cognac, zonder zoet te maken'),
  ('sour-family-cocktails', 'white-lady', 1, 'Wat bepaalt het aromatische profiel het meest?', '["Triple sec", "Gin botanicals", "Sugar", "Ice"]', 1, 'Correct: Gin botanicals'),
  ('sour-family-cocktails', 'white-lady', 2, 'Wat doet egg white?', '["Meer bitter", "Meer textural softness", "Meer zuur", "Minder mondgevoel"]', 1, 'Correct: Meer textural softness'),
  ('sour-family-cocktails', 'white-lady', 3, 'Waarom is lemon freshness cruciaal?', '["Voor kleur", "Voor aromatische lift en spanning", "Voor alcohol", "Voor schuim"]', 1, 'Correct: Voor aromatische lift en spanning'),
  ('sour-family-cocktails', 'white-lady', 4, 'Scenario: White Lady mist aromatische lift in de neus.', '["Meer suiker toevoegen", "Verse citrusexpressie en kortere shake voor integratie", "Warmer glas", "Minder ijs"]', 1, 'Correct: Verse citrusexpressie en kortere shake voor integratie'),
  ('sour-family-cocktails', 'white-lady', 5, 'Scenario: de cocktail komt vol en zwaar over.', '["Meer likeur toevoegen", "Citrus-likoorbalans herijken richting lichter middenpalet", "Langzamer serveren zonder aanpassing", "Alleen garnish veranderen"]', 1, 'Correct: Citrus-likoorbalans herijken richting lichter middenpalet'),
  ('sour-family-cocktails', 'pisco-sour', 1, 'Wat maakt Pisco Sour aromatisch anders dan Whiskey Sour?', '["Minder alcohol", "Meer floral aromatische lift", "Meer bitter", "Minder structuur"]', 1, 'Correct: Meer floral aromatische lift'),
  ('sour-family-cocktails', 'pisco-sour', 2, 'Waarom zijn bitters op foam belangrijk?', '["Alleen decoratie", "Eerste aromatic entry via de neus", "Meer kleur", "Meer zoetheid"]', 1, 'Correct: Eerste aromatic entry via de neus'),
  ('sour-family-cocktails', 'pisco-sour', 3, 'Wat gebeurt bij te veel lime?', '["Meer elegance", "Over-aggressive zuurspanning", "Meer softness", "Minder scherpte"]', 1, 'Correct: Over-aggressive zuurspanning'),
  ('sour-family-cocktails', 'pisco-sour', 4, 'Scenario: Pisco Sour zakt snel in en verliest textuur.', '["Serveerglas kleur", "Shake-protocol en eiwitkwaliteit", "Muziekvolume in de bar", "Aantal bitters op het eind"]', 1, 'Correct: Shake-protocol en eiwitkwaliteit'),
  ('sour-family-cocktails', 'pisco-sour', 5, 'Scenario: gast vraagt om "zelfde cocktail, maar iets droger".', '["Zuuras scherp houden en suikerdeel minimaal reduceren", "Alle citrus verwijderen", "Meer siroop toevoegen", "Cocktail zonder schuim serveren"]', 0, 'Correct: Zuuras scherp houden en suikerdeel minimaal reduceren'),
  ('highballs-cocktails', 'mojito', 1, 'Welke spirit?', '["Rum", "Gin", "Vodka", "Tequila"]', 0, 'Correct: Rum'),
  ('highballs-cocktails', 'mojito', 2, 'Wat geeft bruis?', '["Soda", "Syrup", "Bitters", "Vermouth"]', 0, 'Correct: Soda'),
  ('highballs-cocktails', 'mojito', 3, 'Welke kruiden?', '["Mint", "Basilicum", "Tijm", "Rozemarijn"]', 0, 'Correct: Mint'),
  ('highballs-cocktails', 'mojito', 4, 'Scenario: Mojito smaakt bittergroen in de afdronk.', '["Te weinig soda", "Overmatige muntextractie door te hard muddlen", "Te veel ijsblokken", "Te koud glaswerk"]', 1, 'Correct: Overmatige muntextractie door te hard muddlen'),
  ('highballs-cocktails', 'mojito', 5, 'Scenario: de Mojito wordt na twee minuten waterig.', '["Zachter ijs gebruiken", "Vers, droger crushed ice en snellere uitgifte", "Extra suikersiroop", "Geen limoen meer toevoegen"]', 1, 'Correct: Vers, droger crushed ice en snellere uitgifte'),
  ('highballs-cocktails', 'tom-collins', 1, 'Welke spirit?', '["Gin", "Rum", "Whisky", "Tequila"]', 0, 'Correct: Gin'),
  ('highballs-cocktails', 'tom-collins', 2, 'Welke citrus?', '["Lemon", "Lime", "Orange", "Grapefruit"]', 0, 'Correct: Lemon'),
  ('highballs-cocktails', 'tom-collins', 3, 'Wat maakt hem langer?', '["Soda", "Bitters", "Vermouth", "Eiwit"]', 0, 'Correct: Soda'),
  ('highballs-cocktails', 'tom-collins', 4, 'Scenario: Tom Collins verliest snel bruis en spanning.', '["Meer suiker toevoegen", "Carbonatie later toevoegen en componenten kouder houden", "Minder ijs gebruiken", "Gin vervangen door wodka"]', 1, 'Correct: Carbonatie later toevoegen en componenten kouder houden'),
  ('highballs-cocktails', 'tom-collins', 5, 'Scenario: gast wil meer diepte zonder verlies van frisheid.', '["Juiste gin kiezen met meer botanische lengte, ratio gelijk houden", "Dubbele citroendosering", "Soda volledig schrappen", "Cocktail serveren op kamertemperatuur"]', 0, 'Correct: Juiste gin kiezen met meer botanische lengte, ratio gelijk houden'),
  ('highballs-cocktails', 'moscow-mule', 1, 'Welke spirit?', '["Vodka", "Rum", "Gin", "Whisky"]', 0, 'Correct: Vodka'),
  ('highballs-cocktails', 'moscow-mule', 2, 'Wat geeft pit?', '["Ginger beer", "Syrup", "Bitters", "Vermouth"]', 0, 'Correct: Ginger beer'),
  ('highballs-cocktails', 'moscow-mule', 3, 'Welke citrus?', '["Lime", "Lemon", "Orange", "Apple"]', 0, 'Correct: Lime'),
  ('highballs-cocktails', 'moscow-mule', 4, 'Scenario: Moscow Mule is te agressief pittig voor de tafel.', '["Meer alcohol toevoegen", "Ginger beer-intensiteit verlagen en zuurbalans herijken", "Limoen volledig weglaten", "Alleen extra ijs toevoegen zonder herproef"]', 1, 'Correct: Ginger beer-intensiteit verlagen en zuurbalans herijken'),
  ('highballs-cocktails', 'moscow-mule', 5, 'Scenario: je Mule smaakt vlak ondanks correcte ratio.', '["Te warme componenten bij build", "Te veel koper in de mok", "Te weinig garnishkleur", "Te veel uitleg aan tafel"]', 0, 'Correct: Te warme componenten bij build'),
  ('highballs-cocktails', 'dark-n-stormy', 1, 'Welke spirit?', '["Dark rum", "Vodka", "Gin", "Whisky"]', 0, 'Correct: Dark rum'),
  ('highballs-cocktails', 'dark-n-stormy', 2, 'Wat blijft centraal?', '["Ginger beer", "Vermouth", "Syrup", "Port"]', 0, 'Correct: Ginger beer'),
  ('highballs-cocktails', 'dark-n-stormy', 3, 'Dark ’n Stormy komt uit:', '["Bermuda", "Cuba", "Mexico", "Frankrijk"]', 0, 'Correct: Bermuda'),
  ('highballs-cocktails', 'dark-n-stormy', 4, 'Scenario: Dark ''n'' Stormy wordt door gasten ervaren als "te zoet".', '["Rum verhogen naar dubbele hoeveelheid", "Ginger beer-profiel en limeprecisie herkalibreren", "IJs weglaten", "Meer siroop toevoegen"]', 1, 'Correct: Ginger beer-profiel en limeprecisie herkalibreren'),
  ('highballs-cocktails', 'dark-n-stormy', 5, 'Scenario: team serveert verschillende varianten onder dezelfde naam.', '["Vrij laten voor creativiteit", "Stijlidentiteit vastleggen met vaste productspecificatie", "Alleen op drukke avonden aanpassen", "Geen briefing geven"]', 1, 'Correct: Stijlidentiteit vastleggen met vaste productspecificatie'),
  ('highballs-cocktails', 'paloma', 1, 'Welke spirit?', '["Tequila", "Vodka", "Rum", "Whisky"]', 0, 'Correct: Tequila'),
  ('highballs-cocktails', 'paloma', 2, 'Welke soda?', '["Grapefruit", "Lemon", "Cola", "Ginger"]', 0, 'Correct: Grapefruit'),
  ('highballs-cocktails', 'paloma', 3, 'Paloma is:', '["Highball", "Sour", "Martini", "Layered"]', 0, 'Correct: Highball'),
  ('highballs-cocktails', 'paloma', 4, 'Scenario: Paloma mist spanning en komt flets over.', '["Zout- en bitterbalans in relatie tot zuur", "Kleur van de garnish", "Vorm van de barlepel", "Grootte van de rekening"]', 0, 'Correct: Zout- en bitterbalans in relatie tot zuur'),
  ('highballs-cocktails', 'paloma', 5, 'Scenario: gast wil Paloma met hogere doordrinkbaarheid.', '["Zoetcomponent fors verhogen", "Strakke carbonatie en lichte zoutkalibratie behouden", "Grapefruit schrappen", "Serveren zonder ijs"]', 1, 'Correct: Strakke carbonatie en lichte zoutkalibratie behouden'),
  ('service-cocktails', 'glaswerk', 1, 'Waar serveer je vaak een Martini in?', '["Martini glas", "Highball", "Rocks", "Collins"]', 0, 'Correct: Martini glas'),
  ('service-cocktails', 'glaswerk', 2, 'Waar serveer je Mojito in?', '["Highball", "Coupe", "Martini glas", "Rocks"]', 0, 'Correct: Highball'),
  ('service-cocktails', 'glaswerk', 3, 'Rocks glas wordt vaak gebruikt voor:', '["Old Fashioned", "Daiquiri", "Collins", "Paloma"]', 0, 'Correct: Old Fashioned'),
  ('service-cocktails', 'glaswerk', 4, 'Scenario: dezelfde cocktail smaakt anders bij twee stations.', '["Verschil in glasvorm en randdikte", "Te veel barlicht", "Verschillende muziek", "Ander logo op glas"]', 0, 'Correct: Verschil in glasvorm en randdikte'),
  ('service-cocktails', 'glaswerk', 5, 'Scenario: je wilt aromatische precisie verhogen bij een korte sour.', '["Breed longdrinkglas", "Compact coupe-/Nick&Nora-profiel", "Pintglas", "Plastic beker"]', 1, 'Correct: Compact coupe-/Nick&Nora-profiel'),
  ('service-cocktails', 'ijsgebruik', 1, 'Wat bepaalt ijs?', '["Verdunning", "Alcoholpercentage", "Kleur", "Bitterheid"]', 0, 'Correct: Verdunning'),
  ('service-cocktails', 'ijsgebruik', 2, 'Wat smelt sneller?', '["Crushed ice", "Groot blok", "Geen ijs", "Steen"]', 0, 'Correct: Crushed ice'),
  ('service-cocktails', 'ijsgebruik', 3, 'Groot ijs geeft:', '["Minder snelle verdunning", "Meer suiker", "Meer alcohol", "Meer bitterheid"]', 0, 'Correct: Minder snelle verdunning'),
  ('service-cocktails', 'ijsgebruik', 4, 'Scenario: cocktail verliest structuur te snel op warme avond.', '["Van hard blokijs naar nat crushed ice", "Groter, harder ijs inzetten met strakke pre-chill", "Minder ijs in het glas", "IJs vooraf spoelen in warm water"]', 1, 'Correct: Groter, harder ijs inzetten met strakke pre-chill'),
  ('service-cocktails', 'ijsgebruik', 5, 'Scenario: team gebruikt inconsistent ijs uit verschillende bins.', '["Alleen esthetische variatie", "Onvoorspelbare verdunning en temperatuurspreiding", "Lagere fooi", "Snellere service"]', 1, 'Correct: Onvoorspelbare verdunning en temperatuurspreiding'),
  ('service-cocktails', 'garnishes', 1, 'Garnish is:', '["Functioneel", "Alleen decoratie", "Overbodig", "Optioneel"]', 0, 'Correct: Functioneel'),
  ('service-cocktails', 'garnishes', 2, 'Wat beïnvloedt garnish?', '["Aroma", "Alcoholpercentage", "Rijping", "Koolzuur"]', 0, 'Correct: Aroma'),
  ('service-cocktails', 'garnishes', 3, 'Welke garnish hoort vaak bij Martini?', '["Olive", "Mint", "Cherry", "Pineapple"]', 0, 'Correct: Olive'),
  ('service-cocktails', 'garnishes', 4, 'Scenario: garnish ziet er mooi uit maar versterkt de cocktail niet.', '["Extra kleur", "Functioneel aroma-doel gekoppeld aan recept", "Groter glas", "Meer ijs"]', 1, 'Correct: Functioneel aroma-doel gekoppeld aan recept'),
  ('service-cocktails', 'garnishes', 5, 'Scenario: prep-tijd loopt op door complexe garnishset.', '["Nog meer decor toevoegen", "Reduceren naar impactvolle, reproduceerbare garnish", "Garnish schrappen zonder alternatief", "Alleen in weekend toepassen"]', 1, 'Correct: Reduceren naar impactvolle, reproduceerbare garnish'),
  ('service-cocktails', 'serveertechniek', 1, 'Wat voorkomt de meeste fouten tijdens rush?', '["Meer garnish", "Sterke mise-en-place", "Meer ijs", "Minder gasten"]', 1, 'Correct: Sterke mise-en-place'),
  ('service-cocktails', 'serveertechniek', 2, 'Waarom helpt batching?', '["Meer flair", "Minder execution pressure", "Meer aroma", "Minder alcohol"]', 1, 'Correct: Minder execution pressure'),
  ('service-cocktails', 'serveertechniek', 3, 'Wat breekt service vaak als eerste?', '["Glaswerk", "Ice logistics", "Muziek", "Licht"]', 1, 'Correct: Ice logistics'),
  ('service-cocktails', 'serveertechniek', 4, 'Scenario: gasten begrijpen je pairing niet ondanks goede smaken.', '["Te koude glazen", "Onvoldoende serveersequencing en contextuitleg", "Te veel ijsvoorraad", "Te weinig barlicht"]', 1, 'Correct: Onvoldoende serveersequencing en contextuitleg'),
  ('service-cocktails', 'serveertechniek', 5, 'Scenario: team levert technisch goede cocktails maar wisselende beleving.', '["Individuele stijl zonder richtlijn", "Gestandaardiseerde serveertechniek met duidelijke stappen", "Hogere muziek", "Snellere rekeningpresentatie"]', 1, 'Correct: Gestandaardiseerde serveertechniek met duidelijke stappen'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 1, 'Wat is het doel van aperitief?', '["Eetlust openen", "Dessert vervangen", "Slapen", "Opwarmen"]', 0, 'Correct: Eetlust openen'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 2, 'Welke eigenschap werkt goed?', '["Bitterheid", "Extreme zoetheid", "Melkachtig", "Warm"]', 0, 'Correct: Bitterheid'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 3, 'Welke cocktail is aperitief?', '["Negroni", "White Russian", "Irish Coffee", "Mudslide"]', 0, 'Correct: Negroni'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 4, 'Scenario: aperitiefronde maakt gasten snel verzadigd.', '["Te lage alcohol", "Te zware, zoete of volumineuze aperitiefkeuze", "Te veel glaswerk", "Te korte uitleg"]', 1, 'Correct: Te zware, zoete of volumineuze aperitiefkeuze'),
  ('pairing-cocktails', 'cocktails-als-aperitief', 5, 'Scenario: je wilt aperitiefservice functioneler maken.', '["Trenddrank van het moment", "Eetluststimulatie en ritmische opbouw richting diner", "Maximale portiegrootte", "Zoetheid als hoofdstrategie"]', 1, 'Correct: Eetluststimulatie en ritmische opbouw richting diner'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 1, 'Wat is het startpunt?', '["Spirit choice", "Het gerecht", "Garnish", "Glaswerk"]', 1, 'Correct: Het gerecht'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 2, 'Wat is belangrijkste pairing-model?', '["Salt-fat-acid triangle", "Alleen suiker", "Alleen bitter", "Alleen alcohol"]', 0, 'Correct: Salt-fat-acid triangle'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 3, 'Wat moet een pairing-cocktail doen?', '["Domineren", "Ondersteunen en versterken", "Zoeter maken", "Sterker maken"]', 1, 'Correct: Ondersteunen en versterken'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 4, 'Scenario: cocktailpairing botst met vet hoofdgerecht.', '["Meer zoet toevoegen", "Zuur- of bitterlift inzetten om vetfilm te snijden", "Alcohol verhogen zonder heranalyse", "Pairing stoppen"]', 1, 'Correct: Zuur- of bitterlift inzetten om vetfilm te snijden'),
  ('pairing-cocktails', 'cocktails-bij-foodpairing', 5, 'Scenario: team discussieert over "beste pairing" zonder consistent resultaat.', '["Een technische structuurmatrix voor beslissingen", "Meer Instagram-referenties", "Groter budget", "Langere dranknamen"]', 0, 'Correct: Een technische structuurmatrix voor beslissingen'),
  ('pairing-cocktails', 'cocktails-als-digestief', 1, 'Digestief is bedoeld voor:', '["Na de maaltijd", "Voor ontbijt", "Tijdens lunch", "Voor sport"]', 0, 'Correct: Na de maaltijd'),
  ('pairing-cocktails', 'cocktails-als-digestief', 2, 'Digestiefcocktails zijn vaak:', '["Bitter/rijk", "Licht/fris", "Zuur/strak", "Bruisend/licht"]', 0, 'Correct: Bitter/rijk'),
  ('pairing-cocktails', 'cocktails-als-digestief', 3, 'Welke past goed?', '["Old Fashioned", "Mojito", "Tom Collins", "Paloma"]', 0, 'Correct: Old Fashioned'),
  ('pairing-cocktails', 'cocktails-als-digestief', 4, 'Scenario: digestiefcocktail voelt zwaar na een rijk menu.', '["Zoet en alcoholwarmte reduceren, finale droger maken", "Meer room toevoegen", "Dubbele portie serveren", "Bitter volledig schrappen"]', 0, 'Correct: Zoet en alcoholwarmte reduceren, finale droger maken'),
  ('pairing-cocktails', 'cocktails-als-digestief', 5, 'Scenario: gast vraagt om "iets krachtigs" na dessert.', '["Alleen maximale intensiteit aanbieden", "Kracht combineren met verteerbaarheid en tafelmoment", "Willekeurig sterkste cocktail kiezen", "Geen vragen stellen"]', 1, 'Correct: Kracht combineren met verteerbaarheid en tafelmoment'),
  ('pairing-cocktails', 'aperol-spritz', 1, 'Wat is de klassieke verhouding?', '["2-2-2", "3-2-1", "1-3-2", "4-1-1"]', 1, 'Correct: 3-2-1'),
  ('pairing-cocktails', 'aperol-spritz', 2, 'Welke component geeft bitterheid?', '["Aperol", "Prosecco", "Soda", "IJs"]', 0, 'Correct: Aperol'),
  ('pairing-cocktails', 'aperol-spritz', 3, 'Waarom werkt bitter als aperitief?', '["Stimuleert eetlust", "Verhoogt alcohol", "Verlaagt temperatuur", "Verhoogt suiker"]', 0, 'Correct: Stimuleert eetlust'),
  ('pairing-cocktails', 'aperol-spritz', 4, 'Scenario: Aperol Spritz smaakt vlak en zoet op terras.', '["Componenttemperatuur en bubbeldruk", "Grootte van het rietje", "Kleur van de sinaasappel", "Tempo van de playlist"]', 0, 'Correct: Componenttemperatuur en bubbeldruk'),
  ('pairing-cocktails', 'aperol-spritz', 5, 'Scenario: drukke service, kwaliteit van Spritz zakt.', '["Vrije ratio per bartender", "Vaste build-volgorde en koudeketen borgen", "Minder prosecco gebruiken zonder meten", "Spritz alleen nog op aanvraag"]', 1, 'Correct: Vaste build-volgorde en koudeketen borgen'),
  ('examen-cocktails', 'spirit-blind-herkennen', 1, 'Wat verraadt slechte shaking vaak?', '["Kleur", "Waterige textuur", "Glaswerk", "Garnish"]', 1, 'Correct: Waterige textuur'),
  ('examen-cocktails', 'spirit-blind-herkennen', 2, 'Wat verraadt oude citrus?', '["Meer kleur", "Minder aromatische lift", "Meer mondgevoel", "Meer alcohol"]', 1, 'Correct: Minder aromatische lift'),
  ('examen-cocktails', 'spirit-blind-herkennen', 3, 'Wat verraadt slechte verdunning?', '["Flat mid-palate", "Meer schuim", "Meer aroma", "Meer kleur"]', 0, 'Correct: Flat mid-palate'),
  ('examen-cocktails', 'spirit-blind-herkennen', 4, 'Scenario: kandidaat noemt direct een merk bij blindproef.', '["Te veel detail", "Merkbias vóór structuuranalyse", "Te weinig glaswerk", "Te lage temperatuur"]', 1, 'Correct: Merkbias vóór structuuranalyse'),
  ('examen-cocktails', 'spirit-blind-herkennen', 5, 'Scenario: je bent 70% zeker over categorie, 40% over substijl.', '["Absoluut antwoord geven zonder nuance", "Waarschijnlijkheid expliciet maken per niveau", "Geen conclusie delen", "Alleen vragen terugstellen"]', 1, 'Correct: Waarschijnlijkheid expliciet maken per niveau'),
  ('examen-cocktails', 'cocktailstructuren-blind', 1, 'Wat is vaak spirit-forward?', '["Martini", "Mojito", "Daiquiri", "Paloma"]', 0, 'Correct: Martini'),
  ('examen-cocktails', 'cocktailstructuren-blind', 2, 'Wat is sour?', '["Daiquiri", "Negroni", "Old Fashioned", "Manhattan"]', 0, 'Correct: Daiquiri'),
  ('examen-cocktails', 'cocktailstructuren-blind', 3, 'Wat is bitter?', '["Negroni", "Mojito", "Collins", "Margarita"]', 0, 'Correct: Negroni'),
  ('examen-cocktails', 'cocktailstructuren-blind', 4, 'Scenario: structuren-blind toont vol mondgevoel en hoge zoetrest.', '["Delicate rauwe oester", "Rijk of hartig gerecht met voldoende tegengewicht", "Alleen bruiswater", "Bittere salade zonder vet"]', 1, 'Correct: Rijk of hartig gerecht met voldoende tegengewicht'),
  ('examen-cocktails', 'cocktailstructuren-blind', 5, 'Wat is de beste vervolgstap na structuren-blind?', '["Direct merk raden", "Matrix invullen voor zuur/zoet/bitter/mondgevoel/alcoholwarmte", "Alleen garnish wijzigen", "Recept online opzoeken"]', 1, 'Correct: Matrix invullen voor zuur/zoet/bitter/mondgevoel/alcoholwarmte'),
  ('examen-cocktails', 'theorie-praktijkexamen', 1, 'Wat onderscheidt een cocktail van een simpele mixdrank?', '["Alleen het glas", "Bewuste balans tussen componenten", "Hoger alcoholpercentage", "Meer ingrediënten"]', 1, 'Correct: Bewuste balans tussen componenten'),
  ('examen-cocktails', 'theorie-praktijkexamen', 2, 'Welke structuur hoort bij een Daiquiri?', '["Spirit-forward stirred", "Sour: spirit, citrus, zoet", "Highball build", "Layered digestief"]', 1, 'Correct: Sour: spirit, citrus, zoet'),
  ('examen-cocktails', 'theorie-praktijkexamen', 3, 'Aperitief versus digestief: wat klopt?', '["Aperitief activeert; digestief sluit af", "Beide zijn zoet en zwaar", "Digestief altijd zonder alcohol", "Aperitief alleen met eiwit"]', 0, 'Correct: Aperitief activeert; digestief sluit af'),
  ('examen-cocktails', 'theorie-praktijkexamen', 4, 'Scenario: examencontext verandert plots. Beste reactie?', '["Plan blind uitvoeren", "Keuze bijstellen en onderbouwen", "Casus weigeren", "Alleen intuïtie"]', 1, 'Correct: Keuze bijstellen en onderbouwen'),
  ('examen-cocktails', 'theorie-praktijkexamen', 5, 'Waarom is verdunning een variabele?', '["Onvermijdelijk bijval", "Stuurt balans en textuur bewust", "Alleen voor beginners", "Niet meetbaar"]', 1, 'Correct: Stuurt balans en textuur bewust'),
  ('examen-cocktails', 'theorie-praktijkexamen', 6, 'Negroni: juiste techniek?', '["Shaken hard", "Stirred op ijs", "Muddling", "Blenden"]', 1, 'Correct: Stirred op ijs'),
  ('examen-cocktails', 'theorie-praktijkexamen', 7, 'Welke base spirit past bij rokerige aroma''s in blind?', '["Vodka", "Mezcal of gerookte whisky", "Gin zonder botanicals", "Witte rum alleen"]', 1, 'Correct: Mezcal of gerookte whisky'),
  ('examen-cocktails', 'theorie-praktijkexamen', 8, 'Margarita: kritische balansas?', '["Zout-zuur-zoet integratie", "Alleen alcohol", "Alleen garnish", "Alleen ijsvorm"]', 0, 'Correct: Zout-zuur-zoet integratie'),
  ('examen-cocktails', 'theorie-praktijkexamen', 9, 'Highball succesfactor?', '["Koolzuurbehoud en build-volgorde", "Dubbele shake", "Warm serveren", "Geen ijs"]', 0, 'Correct: Koolzuurbehoud en build-volgorde'),
  ('examen-cocktails', 'theorie-praktijkexamen', 10, 'Old Fashioned: typische fout?', '["Oververdunning", "Te weinig spirit", "Te veel citrus", "Te veel soda"]', 0, 'Correct: Oververdunning'),
  ('examen-cocktails', 'theorie-praktijkexamen', 11, 'Martini: droogte sturen via?', '["Vermoutverhouding en roertijd", "Extra suiker", "Muddling", "Crushed ice"]', 0, 'Correct: Vermoutverhouding en roertijd'),
  ('examen-cocktails', 'theorie-praktijkexamen', 12, 'Food pairing: Negroni bij charcuterie werkt door?', '["Bitter-zoet tegen vet en zout", "Alleen kleurcontrast", "Lage alcohol", "Geen umami"]', 0, 'Correct: Bitter-zoet tegen vet en zout'),
  ('examen-cocktails', 'theorie-praktijkexamen', 13, 'Whiskey Sour: eiwitfunctie?', '["Textuur en schuimintegratie", "Meer alcohol", "Minder zuur", "Koolzuur"]', 0, 'Correct: Textuur en schuimintegratie'),
  ('examen-cocktails', 'theorie-praktijkexamen', 14, 'Garnish citrus-express: effect?', '["Aromatische lift boven glas", "Meer zoetheid in vloeistof", "Lagere temperatuur", "Meer verdunning"]', 0, 'Correct: Aromatische lift boven glas'),
  ('examen-cocktails', 'theorie-praktijkexamen', 15, 'Blind structuur: eerste stap?', '["Merk raden", "Familie bepalen (sour/spirit-forward/highball)", "Garnish kiezen", "Prijs schatten"]', 1, 'Correct: Familie bepalen (sour/spirit-forward/highball)'),
  ('examen-cocktails', 'theorie-praktijkexamen', 16, 'Digestief profiel: wat past?', '["Spirit-forward, weinig restsuiker", "Zoete frozen cocktail", "Lichte spritz", "Alcoholvrije sour"]', 0, 'Correct: Spirit-forward, weinig restsuiker'),
  ('examen-cocktails', 'theorie-praktijkexamen', 17, 'Batchcocktail risico?', '["Verlies van frisheid zonder tijdsvenster", "Te weinig integratie", "Te veel ijs", "Geen garnish"]', 0, 'Correct: Verlies van frisheid zonder tijdsvenster'),
  ('examen-cocktails', 'theorie-praktijkexamen', 18, 'Moscow Mule: signature element?', '["Koperen munt en gemberstructuur", "Vermout", "Eiwit", "Layering"]', 0, 'Correct: Koperen munt en gemberstructuur'),
  ('examen-cocktails', 'theorie-praktijkexamen', 19, 'Service: remakes voorkomen door?', '["Vooraf voorkeur en structuur checken", "Minder uitleg", "Alleen snelheid", "Geen proeven"]', 0, 'Correct: Vooraf voorkeur en structuur checken'),
  ('examen-cocktails', 'theorie-praktijkexamen', 20, 'Examenmeesterschap betekent?', '["Alles uit het hoofd", "Integratie van techniek, smaak en argumentatie", "Alleen creativiteit", "Alleen snelheid"]', 1, 'Correct: Integratie van techniek, smaak en argumentatie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
