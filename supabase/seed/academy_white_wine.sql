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
    'Witte wijn definieer je niet via de kleur van de druif, maar via het contactmoment tussen sap en schil. Het overgrote deel van druivenrassen — wit én blauw — heeft kleurloze pulp; de kleurstoffen zitten vrijwel uitsluitend in de schil. Zodra je die schil snel van het sap scheidt, houd je een kleurloos tot lichtgeel most over, ongeacht de druif waarmee je begint. Dat is precies waarom Champagne en andere blanc de noirs-stijlen witte wijn maken van blauwe druiven zoals Pinot Noir en Meunier: de techniek, niet de druif, bepaalt het eindresultaat.

Dat korte schilcontact heeft een structureel gevolg dat verder reikt dan kleur alleen: zonder extractie van tannine uit schil en pit mist witte wijn de tanninestructuur die rode wijn draagt. De architectuur verschuift daardoor volledig naar de zuurruggengraat — het samenspel van wijnsteenzuur, appelzuur en citroenzuur bepaalt spanning, lengte en bewaarpotentieel op een manier die bij rode wijn wordt gedeeld met tannine. Dat is de kern van ''wit denken'': je beoordeelt balans via zuur-alcohol-extract, niet via zuur-tannine-alcohol.

Hoe je dat gebruikt in de praktijk: bij een onbekend glas witte wijn zoek je eerst naar de zuurspanning, niet naar body in isolatie — body zonder voldoende zuur voelt plat aan, terwijl datzelfde gewicht mét een scherpe zuurlijn juist verfijnd overkomt. Fenolen — bittere, structurerende verbindingen die via licht schil- of pitcontact toch in het sap terechtkomen — verklaren waarom sommige witte wijnen een lichte grip hebben ondanks de afwezigheid van klassieke tannine.

Je valt op dit onderscheid terug telkens wanneer een gast vraagt waarom een witte wijn ''structuur'' kan hebben zonder tannine: het antwoord ligt in zuur, extract en soms een spoor fenolen — nooit in tannine zoals bij rood.


## Pro insight

Een gast die zegt dat witte wijn ''geen pit'' heeft omdat er geen tannine in zit, mist het punt: leg uit dat structuur bij wit via zuur en extract loopt, niet via grip op het tandvlees. Serveer ter demonstratie een blanc de noirs-stijl naast een klassieke witte wijn — die vergelijking laat sneller zien dat kleur en structuur twee losse variabelen zijn dan welke uitleg ook.',
    '- schilcontact
- blanc de noirs
- zuurruggengraat
- druivenpulp
- fenolen
',
    'Bij Champagne mag zelfs 100% Pinot Noir of Meunier — twee blauwe druiven — tot volledig kleurloze blanc de noirs worden verwerkt, mits het sap binnen enkele uren van de schillen wordt gescheiden.
',
    '- Kleur komt uit de schil, niet uit het sap — vrijwel alle druivenpulp is kleurloos
- Kort schilcontact maakt witte wijn tot witte wijn, niet de druif zelf
- Blanc de noirs bewijst dat blauwe druiven witte wijn kunnen opleveren
- Zonder tannine-extractie verschuift de structuur volledig naar de zuurruggengraat
- Lichte fenolen kunnen toch grip geven, los van klassieke tannine
',
    '### Opdracht

Pak een fles witte wijn en lees het etiket.

### Checklist

- Ik heb het druivenras gevonden
- Ik heb het alcoholpercentage gevonden
- Ik heb het land van herkomst gevonden
- Ik heb de stijl geprobeerd te herkennen


### Reflectievraag

Kun jij bij een onbekende witte wijn aangeven of de structuur voornamelijk van zuur, extract of een spoor fenolen komt — en welk kenmerk proef je daarvoor het eerst?',
    8,
    1
  ),
  (
    'hoe-ontstaat-witte-wijn',
    'Hoe ontstaat witte wijn?',
    'Na deze les begrijp jij hoe witte wijn technisch wordt gemaakt.
',
    'Witte wijn ontstaat via een keten waarin timing en zuurstofbeheer strenger zijn dan bij vrijwel elke andere wijnstijl — elke stap is erop gericht primair fruit en zuur te bewaren vóór iets daarvan kan wegvallen. Veel producenten kiezen bewust voor een nachtoogst of vroege ochtendoogst: bij lagere temperaturen blijft het zuur beter behouden en start oxidatie van het sap trager zodra de druiven worden geplukt en vervoerd.

Na direct persen volgt débourbage: het most krijgt enkele uren tot een dag rust, vaak gekoeld, zodat grove deeltjes — schilresten, stof, plantaardig materiaal — bezinken vóór de gisting begint. Een helder gestart most geeft een zuiverdere aromatische basis dan most dat troebel de tank ingaat, omdat grove deeltjes tijdens gisting bittere en groene tonen kunnen afgeven.

Na de gisting valt de beslissing over élevage: blijft de wijn sur lie — op de fijne gistlees — liggen voor extra textuur en complexiteit, of wordt er vroeg van de lees gehaald voor een strakker, puurder profiel? Die keuze werkt samen met het vat: RVS voor precisie, hout voor structuur.

Je gebruikt deze keten als diagnosemiddel: proef je opvallend puur fruit en een strakke zuurlijn, dan vermoed je een korte débourbage en weinig sur-lie-contact; proef je romigheid en een subtiele broodachtige toon, dan wijst dat op langere lees-opvoeding vóór de botteling.


## Pro insight

Herken je romigheid en een licht broodachtige toon in een RVS-witte wijn, wijs dat dan toe aan sur-lie-contact vóórdat je ''hout'' noemt — dat voorkomt dat je een gast een duurdere, houtgerijpte stijl aanpraat terwijl de gevraagde textuur al zonder vat te vinden is. Vraag bij twijfel altijd door naar wat de gast precies bedoelt met ''romig'': textuur of aroma.',
    '- nachtoogst
- débourbage
- koude vergisting
- sur lie
- élevage
',
    'Débourbage duurt bij de meeste producenten niet langer dan 24 uur — te lang wachten laat het most zelf beginnen met ongewenste, wilde gisting nog vóór de geselecteerde gist is toegevoegd.
',
    '- Nachtoogst of vroege ochtendoogst behoudt zuur en vertraagt oxidatie
- Débourbage klaart het most vóór de gisting begint, voor een zuiverdere basis
- Sur lie geeft textuur en complexiteit, vroeg raken geeft een strakker profiel
- De élevage-keuze na gisting bepaalt samen met het vat het uiteindelijke profiel
- Elke stap in de keten is gericht op het bewaren van fruit en zuur, niet op extractie
',
    '### Opdracht

Zoek online een wijnmakerij en bekijk hun productieproces.

### Checklist

- Ik heb persing gevonden
- Ik heb fermentatie gevonden
- Ik heb rijping gevonden


### Reflectievraag

Welke stap in de productieketen — oogsttiming, débourbage of sur-lie-keuze — zou jij als eerste vraag stellen aan een producent om snel het profiel van een witte wijn in te schatten?',
    8,
    2
  ),
  (
    'waarom-is-witte-wijn-uniek',
    'Waarom is witte wijn uniek?',
    'Na deze les kun jij uitleggen waarom witte wijn zo veelzijdig is.
',
    'Witte wijn is uniek omdat één enkel element — zuur — een extreem breed spectrum aan stijlen bij elkaar houdt: van bloedstrak en mineraal tot romig en zelfs botrytis-zoet. Bij rode wijn delen zuur en tannine de structurele rol; bij wit draagt zuur die rol vrijwel alleen, wat verklaart waarom zuurspanning het eerste kenmerk is waarop professionals een witte wijn beoordelen, nog vóór aroma of lengte.

Diezelfde zuurspanning maakt witte wijn gastronomisch de meest inzetbare categorie: hoge zuren snijden door vet, romige sauzen en zilte smaken op een manier die tannine niet kan. Daarnaast laat de afwezigheid van tannine het terroir directer doorklinken — zonder tanninesluier proef je bodem, klimaat en druif vaak scherper, wat terroirtransparantie oplevert die bij zware, tanninerijke rode wijn minder vanzelfsprekend is.

Aan het zoete uiteinde van het spectrum zorgt botrytis — edelrot — voor geconcentreerde, hooggezoete witte wijnen zoals Sauternes en Tokaji, waarbij diezelfde hoge zuurgraad voorkomt dat de wijn plakkerig zoet aanvoelt. Zuur is dus niet alleen het kenmerk van droge, frisse stijlen — het is de rode draad door het hele witte spectrum.

Je gebruikt dit inzicht wanneer je moet uitleggen waarom witte wijn zo breed inzetbaar is aan tafel: niet omdat er ''iets voor iedereen'' bij zit, maar omdat één en hetzelfde structuurprincipe — zuur — elke stijl in dat spectrum draagbaar houdt.


## Pro insight

Verkoop witte wijn bij vette of romige gerechten op basis van zuurspanning, niet met de vuistregel ''wit bij vis'' — die regel dekt de gastronomische breedte van wit niet en laat kansen liggen bij saus- of vleesgerechten. Vraag een gast die twijfelt tussen wit en rood bij een romig gerecht simpelweg: ''wil je dat de wijn het gerecht doorsnijdt of begeleidt?''',
    '- zuurspanning
- terroirtransparantie
- botrytis
- gastronomische inzetbaarheid
- mineraliteit
',
    'Sauternes en andere botrytis-zoete wijnen bevatten vaak een hogere absolute zuurgraad dan menig droge, frisse witte wijn — die zuur is precies wat voorkomt dat de wijn plakkerig aanvoelt.
',
    '- Zuur draagt bij witte wijn de structurele rol die bij rood wordt gedeeld met tannine
- Zuurspanning is het eerste kenmerk waarop professionals witte wijn beoordelen
- Hoge zuren maken witte wijn gastronomisch zeer breed inzetbaar
- Afwezigheid van tannine geeft vaak meer terroirtransparantie
- Botrytis-zoete stijlen blijven dankzij hoge zuurgraad in balans, niet plakkerig
',
    '### Opdracht

Noem drie momenten waarop jij witte wijn zou serveren.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Bij welk gerecht dat jij normaal met rode wijn serveert, zou een witte wijn met hoge zuurspanning eigenlijk een sterkere match kunnen zijn?',
    8,
    3
  ),
  (
    'geschiedenis-witte-wijn',
    'Geschiedenis van witte wijn',
    'Na deze les begrijp jij hoe witte wijn historisch is ontwikkeld.
',
    'De geschiedenis van witte wijn is korter en technischer dan die van wijn in het algemeen: de heldere, frisse, direct geperste witte wijn die we vandaag als standaard zien, is grotendeels een uitvinding van de twintigste eeuw. Antieke wijnbereiding — inclusief de Georgische qvevri-traditie — liet wit druivensap vaak wél lang met de schillen in contact, wat resulteerde in oranjegekleurde, tanninerijke wijnen die dichter bij het huidige ''oranje wijn'' liggen dan bij een moderne, strakke Sauvignon Blanc.

De omslag kwam met temperatuurbeheersing. Vóór koeltechniek beschikbaar was, vergiste wit most vaak te warm, wat aroma verloor en oxidatieve, zwaardere stijlen opleverde. De koelrevolutie — eerst in Duitsland langs de Mosel en Rijn, later wereldwijd verspreid door vliegende wijnmakers vanaf de jaren zeventig en tachtig — maakte gecontroleerde koude vergisting overal toegankelijk en veranderde witte wijn definitief in een precisieproduct.

Tegelijk bouwden specifieke terroirs hun eigen witte-wijnidentiteit op: het Kimmeridgien-kalksteen van Chablis leverde eeuwenlang de mineraliteit waarmee die regio nog steeds wordt geassocieerd, terwijl Duitsland via het Prädikatsysteem al vroeg rijpheidsniveaus van Riesling classificeerde — een systeem dat draait om precies de suiker-zuurbalans die witte wijn zo veelzijdig maakt.

Je gebruikt deze geschiedenis om ''traditioneel'' en ''modern'' bij witte wijn scherp uit elkaar te houden: een eeuwenoude regio zoals Chablis bouwt op oud terroir, maar de strakke, frisse stijl die je vandaag proeft, is technisch gezien pas enkele decennia oud.


## Pro insight

Wanneer een gast ''traditionele witte wijn'' vraagt, vraag dan door: bedoelt hij een oude regio zoals Chablis, of een oxidatieve, oranje stijl die dichter bij de werkelijk antieke techniek ligt? Die twee liggen verder uit elkaar dan het woord ''traditioneel'' doet vermoeden, en het verkeerde glas op tafel zetten kost je meteen geloofwaardigheid.',
    '- oranjewijntraditie
- koelrevolutie
- vliegende wijnmakers
- Prädikatsysteem
- Kimmeridgien
',
    'Vóór de jaren zeventig hadden veel wijnmakers geen koeling in de kelder; een hittegolf tijdens de oogst kon een hele jaargang witte wijn onbedoeld oxidatief en zwaar maken, zonder dat iemand dat als bewuste stijlkeuze had gepland.
',
    '- Antieke wijnbereiding gaf wit sap vaak lang schilcontact — dichter bij oranje wijn
- De koelrevolutie maakte gecontroleerde koude vergisting wereldwijd toegankelijk
- Vliegende wijnmakers verspreidden die techniek vanaf de jaren zeventig en tachtig
- Kimmeridgien-kalksteen bouwde de mineraliteitsreputatie van Chablis op
- Het Prädikatsysteem classificeert Riesling op basis van de suiker-zuurbalans
',
    '### Opdracht

Zoek de oudste witte wijnregio die jij kent.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij een moderne, koel-vergiste witte wijn nog ''traditioneel'' noemen als de techniek zelf pas enkele decennia oud is — en waarom wel of niet?',
    8,
    4
  ),
  (
    'witte-wijncategorieen',
    'Belangrijkste witte wijncategorieën',
    'Na deze les herken jij de belangrijkste stijlen binnen witte wijn.
',
    'De vijf hoofdgroepen binnen witte wijn — fris & strak, rijk & romig, aromatisch, mineraal & strak en zoet — zijn geen smaakvoorkeuren maar het resultaat van meetbare technische keuzes. Het onderscheid begint bij het druivenras zelf: aromatische druiven zoals Gewürztraminer, Muscat en in mindere mate Riesling zijn rijk aan terpenen, geurstoffen die al vóór de gisting in de druif aanwezig zijn en een direct herkenbare, bloemige geur geven. Sauvignon Blanc en verwante rassen leunen juist op thiolen, zwavelhoudende aromastoffen die tijdens de gisting vrijkomen en zorgen voor de kenmerkende citrus-, grapefruit- en soms groene, kruidige tonen.

De rijke, romige categorie ontstaat zelden puur uit de druif: dat profiel wordt meestal opgebouwd via houtcontact, sur lie en malolactische gisting, technieken die in latere lessen apart worden behandeld. De mineraal & strakke categorie hangt sterk samen met bodemtype en een bewust beperkte productiekeuze — weinig hout, weinig malolactisch, gericht op puurheid.

De zoete categorie tot slot ontstaat via drie technieken die niet uitwisselbaar zijn: edelrot concentreert suiker en geeft een kenmerkende honing- en gedroogd-fruittoon (Sauternes, Tokaji), passerillage laat druiven drogen aan de plant of na de oogst voor concentratie zonder schimmel, en een late oogst zonder edelrot geeft een puurdere, fruitigere zoete stijl. Het restsuikerspectrum dat hieruit ontstaat, loopt van nauwelijks merkbaar tot extreem geconcentreerd.

Je gebruikt deze technische lens om categorieën te herkennen zonder het etiket te hoeven lezen: ruik je sterke bloemige terpenen, denk aan Muscat of Gewürztraminer; ruik je citrus en een groene, kruidige rand, denk aan thiolen en dus vaak Sauvignon Blanc-achtige stijlen.


## Pro insight

Wil je een gast snel richting een categorie sturen zonder jargon: vraag naar bloemig versus citrus/kruidig in plaats van naar ''fris of rijk'' — dat onderscheid wijst direct naar terpeen- versus thiolgedreven druiven en dus naar de juiste fles op de kaart.',
    '- thiolen
- terpenen
- edelrot
- passerillage
- restsuikerspectrum
',
    'Muscat is een van de weinige druiven waarbij de wijn bijna exact ruikt zoals de druif zelf aan de wijnstok ruikt — bij de meeste andere rassen ontstaat het aroma pas grotendeels tijdens gisting en rijping.
',
    '- Terpenen geven de directe, bloemige geur van aromatische druiven als Muscat
- Thiolen ontstaan tijdens gisting en geven de citrus- en kruidentonen van Sauvignon Blanc
- De rijke, romige categorie wordt meestal opgebouwd via hout, lees en malolactisch
- Edelrot en passerillage zijn twee losstaande technieken achter zoete witte wijn
- Het restsuikerspectrum loopt van nauwelijks merkbaar tot extreem geconcentreerd
',
    '### Opdracht

Schrijf bij elke categorie één wijn die jij kent.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Kun jij bij drie witte wijnen die je kent aangeven of het aromaprofiel vooral van terpenen, van thiolen of van élevage-technieken komt?',
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
    'Direct press is geen simpele handeling maar een precisiestap waarin elke minuut en elke druk-instelling het eindresultaat beïnvloedt. Moderne pneumatische persen werken met een opblaasbare membraan die de druiven zacht tegen de wand van de perscilinder duwt, in herhaalde, lage-drukcycli. Dat voorkomt het openbreken van pitten en het verscheuren van schillen, twee bronnen van bittere fenolen die je bij een ruwere pers wél zou extraheren.

Tijdens het persen ontstaan verschillende sapfracties. Het vrijloopsap — sap dat vrijkomt vóór er überhaupt druk wordt gezet, puur door het gewicht van de druiven zelf — is het meest verfijnd en het minst fenolisch. Naarmate de druk oploopt, leveren de daaropvolgende persfracties steeds meer volume maar ook meer fenolen en bitterheid op. Veel producenten scheiden deze fracties bewust en gebruiken alleen de eerste, mildste fracties voor hun topcuvées.

Omdat sap zonder schilbescherming razendsnel oxideert, wordt het hele proces vaak onder inertisering uitgevoerd: stikstof of CO₂ verdringt zuurstof in pers, leidingen en tank, zodat het kwetsbare, kleurloze most zijn frisheid behoudt tot aan de gisting.

Je gebruikt deze kennis om kwaliteit op etiket of prijs te duiden: cuvées die expliciet ''vrijloop'' of ''free-run juice'' vermelden, beloven doorgaans meer verfijning en minder bitterheid dan wijnen gemaakt van de volledige persing zonder fractiescheiding.


## Pro insight

Bij een prijsverschil tussen twee vergelijkbare witte wijnen van dezelfde producent kun je vaak wijzen naar persfractie: een cuvée op basis van vrijloopsap rechtvaardigt een hogere prijs door minder fenolen en meer verfijning, niet door marketing alleen. Proef dat verschil zelf blind vóór je het aan een gast uitlegt.',
    '- vrijloopsap
- persfracties
- pneumatische pers
- inertisering
- fenolextractie
',
    'Sommige topcuvées gebruiken uitsluitend het eerste tiental procenten vrijloopsap en verkopen de rest van de persing als tweede of derde wijnlijn — dezelfde druiven, uit dezelfde pers, maar met een compleet ander kwaliteitsprofiel.
',
    '- Pneumatische persen werken met lage-drukcycli om pitten en schillen te sparen
- Vrijloopsap is het meest verfijnde en minst fenolische deel van de persing
- Latere persfracties geven meer volume, maar ook meer fenolen en bitterheid
- Inertisering met stikstof of CO₂ beschermt het kwetsbare most tegen oxidatie
- Fractiescheiding bepaalt mede of most richting topcuvée of tweede lijn gaat
',
    '### Opdracht

Bekijk online hoe een pneumatische pers werkt.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij bij een blinde proeverij het verschil durven benoemen tussen een wijn op basis van vrijloopsap en een wijn uit een latere, fenolrijkere persfractie?',
    8,
    1
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting',
    'Na deze les kun jij uitleggen hoe alcohol ontstaat in witte wijn.
',
    'Bij witte wijn wordt gisting veel strakker gestuurd dan bij rode wijn, met als doel niet extractie maar aromabehoud. Waar rode wijn vaak boven de twintig graden vergist, blijft witte wijn doorgaans tussen twaalf en achttien graden — soms zelfs kouder bij extreem aromatische cuvées. Die lage temperatuur vertraagt de gisting aanzienlijk, waardoor het proces weken in plaats van dagen kan duren.

Die vertraging is precies waar de winst zit: bij lage temperatuur produceren gisten meer esters, vluchtige aromastoffen die fruitige, bloemige tonen geven die bij warmere gisting grotendeels zouden verdampen. Voor rassen zoals Sauvignon Blanc selecteren wijnmakers bovendien specifieke thiolvrijzettende gisten, die de aromastoffen die al gebonden in het most aanwezig zijn, tijdens de gisting actief vrijmaken.

Die precisie brengt wel risico''s mee. Koude, langzame gisting kan vastlopen — een vastzittende gisting waarbij de gist voortijdig stopt vóór alle suiker is omgezet — vaak door onvoldoende stikstofbeheer. Gisten hebben voldoende assimileerbare stikstof (YAN) nodig om door te vergisten; te weinig stikstof bij lage temperatuur verhoogt bovendien het reductierisico, waarbij zwavelverbindingen ontstaan die naar lucifer of gekookte kool kunnen ruiken.

Je gebruikt dit om onbedoelde reductie te onderscheiden van een wijnfout: een lichte, vluchtige zwavelgeur bij het openen van een fles verdwijnt vaak na beluchting en wijst eerder op een krappe, koude gisting dan op een structureel probleem met de wijn.


## Pro insight

Ruikt een gast bij het inschenken een vluchtige, zwavelachtige geur die na even zwenken verdwijnt, leg dan uit dat dit reductie is uit een koude, precieze gisting — geen kurkfout. Test dat zelf eerst met een korte swirl vóór je de fles terugstuurt naar de kelder; onterecht een technisch prima fles afkeuren kost meer dan het beluchten.',
    '- thiolvrijzetting
- vastzittende gisting
- stikstofbeheer
- estervorming
- reductierisico
',
    'Een vastzittende gisting kan soms weken na het schijnbare einde van de fermentatie alsnog hervatten zodra de temperatuur licht stijgt — wijnmakers houden dat risico daarom nauwlettend in de gaten tot de fles daadwerkelijk gebotteld is.
',
    '- Witte wijn vergist doorgaans tussen twaalf en achttien graden, veel kouder dan rood
- Lage temperatuur geeft meer estervorming en dus meer fruitige, bloemige aroma''s
- Thiolvrijzettende gisten maken gebonden aromastoffen actief vrij tijdens gisting
- Onvoldoende stikstofbeheer (YAN) kan leiden tot een vastzittende gisting
- Te weinig stikstof bij lage temperatuur verhoogt het reductierisico
',
    '### Opdracht

Zoek drie witte druiven die vaak koel vergist worden.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Zou jij het verschil durven benoemen tussen reductie die verdwijnt na beluchting en een structurele wijnfout die blijft hangen — en welke stap zet je eerst om dat te checken?',
    8,
    2
  ),
  (
    'rvs-vs-hout',
    'RVS vs hout',
    'Na deze les begrijp jij het verschil tussen RVS-rijping en houtrijping.
',
    'RVS en hout zijn geen simpele smaaktoevoeging-versus-geen-smaaktoevoeging keuze: beide vaten beïnvloeden de wijn via een ander fysiek mechanisme. RVS is volledig inert en luchtdicht — er vindt geen zuurstofuitwisseling plaats, waardoor primair fruit en de scherpe zuurlijn ongewijzigd bewaard blijven. Hout daarentegen laat via zijn poriën langzaam micro-oxygenatie toe: minieme hoeveelheden zuurstof dringen geleidelijk door het hout, wat textuur verrondt en de wijn laat evolueren zonder haar bloot te stellen aan de plotse oxidatie die een open vat zou geven.

Vatformaat verandert die dynamiek fundamenteel: een kleine barrique van tweehonderdvijfentwintig liter heeft een hoge oppervlakte-volumeverhouding, wat veel directe houtsmaak en relatief snelle micro-oxygenatie geeft. Een foudre — een groot houten vat van soms duizenden liters — heeft juist een lage oppervlakte-volumeverhouding, waardoor de wijn wel structuur en een subtiele textuurverandering krijgt, maar nauwelijks directe houtsmaak.

Binnen beide vatformaten wordt vaak bâtonnage toegepast: het periodiek opnieuw opwerven van de fijne gistlees door de wijn te roeren. Dat geeft extra romigheid en textuur, versterkt door de zuurstof die al via het hout binnenkomt. Wie zuurstof wil zonder houtsmaak, kan kiezen voor een betonei — een eivormig betonnen vat dat micro-oxygenatie en interne convectie biedt zonder enige aromatische bijdrage van het materiaal zelf.

Je gebruikt dit onderscheid om een wijn te lezen zonder het etiket: proef je subtiele romigheid en structuur zonder duidelijke vanille of toast, dan wijst dat eerder op foudre, betonei of oud, neutraal hout dan op een nieuwe barrique.


## Pro insight

Verwar bij gasten ''zacht en rond'' niet automatisch met ''houtgerijpt'' — vraag door of ze vanille of toast proeven vóór je hout aanwijst. Laat twijfelaars een foudre- of betonei-wijn naast een barrique-wijn proeven: dat onderscheid tussen structuur en houtsmaak overtuigt sneller dan elke uitleg.',
    '- micro-oxygenatie
- foudre
- bâtonnage
- betonei
- vatformaat
',
    'Een drie- tot vier keer gebruikte barrique geeft nog maar een fractie van de houtsmaak van een nieuw vat af — veel kelders combineren daarom bewust oud en nieuw hout om de intensiteit te doseren in plaats van simpelweg ''op hout'' te labelen.
',
    '- RVS is volledig inert: geen zuurstofuitwisseling, primair fruit blijft puur bewaard
- Hout laat via micro-oxygenatie geleidelijk zuurstof door, wat textuur verrondt
- Vatformaat bepaalt de verhouding tussen directe houtsmaak en micro-oxygenatie
- Bâtonnage roert de gistlees op voor extra romigheid en textuur
- Een betonei geeft micro-oxygenatie zonder enige aromatische bijdrage van het vat
',
    '### Opdracht

Vergelijk een houtgelagerde Chardonnay met een RVS-Chardonnay.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij bij een romige witte wijn zonder duidelijke vanille durven inschatten of dat van foudre, een betonei of bâtonnage komt in plaats van een nieuwe barrique?',
    8,
    3
  ),
  (
    'malolactische-gisting',
    'Malolactische gisting',
    'Na deze les kun jij uitleggen wat malolactische gisting doet.
',
    'Malolactische gisting is geen tweede alcoholische gisting maar een bacteriële omzetting: de bacterie Oenococcus oeni zet scherp appelzuur om in zachter melkzuur en koolzuur. Chemisch daalt daarmee de totale zuurgraad slechts licht, maar sensorisch voelt de wijn veel ronder aan — melkzuur wordt door de tong als aanzienlijk zachter ervaren dan appelzuur, ook al is het effect op de pH bescheiden.

Een bijproduct van deze omzetting is diacetyl, de verbinding die verantwoordelijk is voor de klassieke boter- en roomtoon in veel Chardonnay. Hoeveel diacetyl waarneembaar is, hangt af van de mate waarin MLF wordt toegelaten: bij volledige MLF domineert die boterigheid vaak, terwijl partiële MLF — waarbij slechts een deel van de partij de omzetting ondergaat en wordt teruggeblend met niet-MLF-wijn — een subtielere, meer beheerste romigheid geeft.

Bij aromatische, zuurgedreven rassen zoals Riesling, Albariño of Sauvignon Blanc wordt MLF vaak juist bewust geblokkeerd: de winemaker gebruikt zwaveldioxide, koeling of filtratie om de bacterie te remmen, zodat de scherpe, frisse appelzuurstructuur intact blijft. Die keuze is net zo bewust als het toelaten van MLF bij Chardonnay — geen van beide is een standaard, het is telkens een stijlbeslissing.

Je gebruikt dit inzicht om boterige tonen correct te duiden: proef je duidelijke diacetyl, dan weet je dat MLF volledig is doorgevoerd; proef je romigheid zonder uitgesproken boter, dan is partiële MLF of alleen sur-lie-contact waarschijnlijker.


## Pro insight

Als een gast ''geen boterige Chardonnay'' wil, vraag dan niet alleen naar de druif maar specifiek naar het MLF-beleid — een RVS-Chardonnay zonder MLF kan verrassend strak zijn, terwijl een houtgerijpte met volledige MLF juist de stijl is die de gast wil mijden. Dat ene woord bespaart je een retourfles.',
    '- Oenococcus oeni
- diacetyl
- pH-verhoging
- partiële MLF
- MLF-blokkade
',
    'Sommige producenten laten slechts 20 tot 30% van een partij MLF ondergaan en blenden dat terug met niet-MLF-wijn — een precisietechniek om net genoeg rondheid te geven zonder de boterigheid te laten domineren.
',
    '- Oenococcus oeni zet scherp appelzuur om in zachter melkzuur en koolzuur
- Het effect op de pH is bescheiden, maar het sensorische effect op rondheid is groot
- Diacetyl is de verbinding achter de klassieke boter- en roomtoon van MLF
- Partiële MLF geeft een subtielere romigheid dan volledige MLF
- Bij zuurgedreven rassen zoals Riesling wordt MLF vaak bewust geblokkeerd
',
    '### Opdracht

Proef een romige Chardonnay en let op boterige tonen.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij bij een romige witte wijn durven inschatten of dat van volledige MLF, partiële MLF of alleen sur-lie-contact komt — en welk kenmerk gebruik je daarvoor?',
    8,
    4
  ),
  (
    'rijping-witte-wijn',
    'Rijping van witte wijn',
    'Na deze les begrijp jij hoe rijping witte wijn verandert.
',
    'Niet elke witte wijn is gemaakt om jong te worden gedronken, en het onderscheid tussen rijpingsroutes bepaalt sterk wélke aroma''s een oudere fles ontwikkelt. Reductieve flesrijping — onder schroefdop of in een goed afgesloten fles zonder verdere zuurstoftoevoer — laat de wijn langzaam evolueren met minimale zuurstofblootstelling, wat primaire en subtiele tertiaire aroma''s naast elkaar kan bewaren. Oxidatieve vatrijping daarentegen, zoals bij lang op hout gelagerde Semillon of Chenin Blanc, versnelt de ontwikkeling van notige, honingachtige tonen al vóór de botteling.

Bij Riesling ontstaat met rijping een heel specifieke verbinding: TDN, die de kenmerkende petroltoon geeft die veel liefhebbers juist als kwaliteitskenmerk zien bij oudere, rijpe Riesling. Deze verbinding ontwikkelt zich sneller bij meer zonlichtblootstelling in de wijngaard en bij warmere bewaarcondities, wat verklaart waarom sommige jonge Riesling al vroeg een lichte petroltoon kan tonen.

Structureel bepaalt de zuur-suikerbalans hoeveel bewaarpotentieel een witte wijn heeft: hoge zuren dragen droge stijlen door de jaren heen, terwijl bij zoete stijlen zoals Sauternes of Tokaji de combinatie van hoge zuren én hoge restsuiker een decennialange rijping mogelijk maakt. Sluitingskeuze speelt hierin ook mee: schroefdop favoriseert een reductief, fruitgedreven rijpingsverloop, terwijl kurk door zijn beperkte zuurstofdoorlaat een trager oxidatief component toevoegt.

Je gebruikt deze kennis om bewaaradvies te onderbouwen: vraag niet alleen naar leeftijd van een fles, maar naar zuur-suikerbalans en sluiting — die twee factoren voorspellen samen veel beter of een witte wijn nog jaren verder kan ontwikkelen.


## Pro insight

Wijs een gast die twijfelt aan een petroltoon in oudere Riesling erop dat dit TDN is, een erkend kwaliteitskenmerk bij deze druif — geen wijnfout. Adviseer bij bewaaradvies nooit op leeftijd alleen: check eerst de zuur-suikerbalans en de sluiting, die twee voorspellen samen veel betrouwbaarder of een fles nog verder kan.',
    '- TDN
- reductieve flesrijping
- oxidatieve vatrijping
- sluitingskeuze
- zuur-suikerbalans
',
    'TDN-ontwikkeling in Riesling versnelt aantoonbaar door meer zonlichtblootstelling in de wijngaard — twee percelen van dezelfde producent kunnen daardoor bij gelijke leeftijd een merkbaar verschillende petrolintensiteit tonen.
',
    '- Reductieve flesrijping bewaart primaire aroma''s, oxidatieve vatrijping versnelt evolutie
- TDN geeft de kenmerkende petroltoon van rijpe Riesling
- Meer zonlichtblootstelling en warmere opslag versnellen TDN-ontwikkeling
- Zuur-suikerbalans bepaalt hoeveel bewaarpotentieel een witte wijn daadwerkelijk heeft
- Sluitingskeuze (schroefdop versus kurk) beïnvloedt het rijpingstraject mee
',
    '### Opdracht

Zoek drie witte wijnen met bewaarpotentieel.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Zou jij op basis van zuur-suikerbalans en sluiting durven inschatten of een witte wijn uit je eigen voorraad nog vijf tot tien jaar verder kan rijpen?',
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
    'Een gast die zegt dat witte wijn ''makkelijker'' te proeven is dan rode wijn, mist een cruciaal punt: er verdwijnt een hele structuuras. Zonder tannine houd je in de mond nog maar twee ankers over — zuur en alcohol — in plaats van drie, en wie dat gat niet bewust opvult met een dubbele zuurcheck, proeft wit voortaan te oppervlakkig. Het protocol blijft visueel, neus, mond, conclusie, maar het gewicht dat je aan elke stap toekent, verschuift volledig.

Visueel let je bij wit vooral op kleurintensiteit en kleurdiepte: bleekgeel-groen wijst op jeugd en een koel klimaat, dieper goud op rijpheid, houtcontact of malolactische gisting. Bij de neus ruik je bewust twee keer — eerst het stilstaande glas, dan na swirlen — omdat veel witte aroma''s (citrus, bloemen) vluchtiger en subtieler zijn dan de aroma''s die aan tannine gebonden zitten bij rode wijn.

In de mond doorloop je een vaste volgorde: eerst zuur (frisheid, speekselopwekking aan de zijkanten van de tong), dan alcohol (warmte), dan body (gewicht), en pas daarna de balans tussen die drie. Zonder tannine als vierde as wordt de balans tussen zuur, alcohol en body het enige criterium waarop een witte wijn slaagt of faalt.

Wanneer pas je dit bewust toe? Bij elke witte wijn, maar zeker als voorbereiding op de druivenherkenning in Module 4 en 5 — daar bepaalt precies deze combinatie van zuur, aroma-intensiteit en body welke druif je blind herkent.


## Pro insight

Vergeet tannine als checklist-item bij wit: vervang die stap bewust door een tweede zuurcheck aan het einde van de mondproef. Test zuur bovendien altijd bij de temperatuur waarop je serveert — te koud overdrijft de indruk, te warm verdoezelt hem, en dat vertekent elk advies dat je aan tafel geeft.',
    '- wit-proefprotocol
- zuur als structuuras
- tweefasen-ruiken
- kleurintensiteit wit
- zuur-alcohol-lichaamsverhouding
',
    'Professionele proevers testen zuur bewust bij kamertemperatuur én bij serveertemperatuur op dezelfde wijn — het verschil in waargenomen scherpte tussen die twee metingen kan aanzienlijk zijn.
',
    '- Protocol blijft visueel, neus, mond, conclusie — de nadruk verschuift
- Zuur neemt bij wit de centrale structuurrol over die tannine bij rood heeft
- Kleurintensiteit bij wit loopt van bleekgeel-groen naar diep goud
- Ruik twee keer: stil glas, dan na swirlen, om vluchtige aroma''s te vangen
- Mondproef volgt vaste volgorde: zuur, alcohol, body, dan balans
',
    '### Opdracht

Proef een witte wijn volgens deze drie stappen.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Op welk moment sla jij de tweede zuurcheck nog over — en welke verkeerde stijlinschatting levert dat je meestal op?',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij uit kleur belangrijke informatie halen.
',
    'Kleur is bij witte wijn een lineaire schaal in plaats van de rand-versus-kern-analyse die je bij rode wijn gebruikt. Er is geen paarse-naar-baksteen-overgang om te lezen; in plaats daarvan beweegt de hele kleur zich van bleekgeel-groen naar diepgoud en uiteindelijk amber. Die ene as vertelt je tegelijk iets over klimaat, druif, productie en leeftijd — en juist omdat het één as is, is de interpretatie foutgevoeliger dan bij rood.

Bleekgeel met een groenige gloed wijst meestal op een koel klimaat, een neutrale tot hoge zuurgraad en weinig of geen houtcontact — denk aan jonge Sauvignon Blanc, Albariño of ongehoute Chardonnay. Dieper goud ontstaat door een combinatie van factoren die je niet blind uit elkaar kunt trekken op kleur alleen: rijper fruit uit een warmer klimaat, houtrijping, malolactische gisting, langere lees-contact of simpelweg flesrijping.

Amber en bruinige tinten zijn het gevoeligste signaal: dat kan wijzen op bewuste oxidatieve wijnmaakstijl (bijvoorbeeld bepaalde natuurwijnen of oranje wijn met schilcontact), op langdurige positieve flesrijping bij een structuurrijke druif als Semillon of Chenin Blanc, of op een productiefout. Zonder de neus en de mond erbij te betrekken kun je die drie scenario''s niet uit elkaar houden.

Gebruik kleur dus altijd als eerste hypothese, nooit als eindoordeel: kantel het glas tegen een witte achtergrond, beoordeel de kleur zonder aan het etiket te denken, en laat de neus die hypothese bevestigen of ontkrachten.


## Pro insight

Beoordeel kleur altijd vóór je het etiket leest — noteer je hypothese over klimaat en productie eerst, en toets die pas daarna aan wat je ruikt. Bij twijfel over een amberkleurige wijn: vraag naar de druif en de bewuste stijl vóór je ''oxidatiefout'' concludeert, dat voorkomt een onterecht retour.',
    '- kleurlineariteit wit
- diepgoud
- amberrisico
- schilcontact wit
- kleurhypothese
',
    'Bij Chenin Blanc en Semillon kan een diepgouden kleur bij een fles van amper vijf jaar oud al net zo intens zijn als bij een twintig jaar oude Riesling — kleurdiepte alleen vertelt dus zelden de volledige leeftijd.
',
    '- Bij wit is kleur één lineaire as: bleekgeel-groen tot diepgoud en amber
- Bleekgeel-groen wijst op koel klimaat, hoge zuren, weinig houtcontact
- Diepgoud kan komen van rijpheid, hout, MLF, lees-contact of flesrijping
- Amber is het gevoeligste signaal: bewuste stijl, positieve rijping of fout
- Kleur is een hypothese die de neus en mond nog moeten bevestigen
',
    '### Opdracht

Vergelijk twee witte wijnen op kleur.

### Checklist

- Ik heb minstens twee concrete punten genoteerd
- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke witte wijn op jouw kaart zou jij nu opnieuw beoordelen puur op kleurdiepte, los van wat je al over de druif weet?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma''s herkennen',
    'Na deze les kun jij aroma''s indelen en herkennen.
',
    'Bij witte wijn is de primaire aromalaag breder en klimaatgevoeliger dan bij rode wijn, omdat schilcontact grotendeels ontbreekt en het fruitkarakter dus rechtstreeks uit de druif en het klimaat komt. Citrus en groen fruit (limoen, groene appel, kruisbes) wijzen op een koel klimaat; steenfruit (perzik, abrikoos) en tropisch fruit (ananas, mango) wijzen op een warmer klimaat of rijpere oogst. Florale tonen (witte bloemen, lindebloesem) zitten daar ergens tussenin en zijn vaak druifgebonden.

Secundaire aroma''s ontstaan door productiekeuzes die bij wit veel zichtbaarder zijn dan bij rood: gisting op de lies, bâtonnage en malolactische gisting geven brooddeeg, gist en boter — aroma''s die je bij rode wijn zelden zo dominant tegenkomt omdat tannine en schilextractie daar meer op de voorgrond staan.

Tertiaire aroma''s bij wit lopen sterk uiteen per druif: honing en noten bij gerijpte Chenin Blanc of Semillon, toast en vanille bij houtgelagerde Chardonnay, en het beroemde petrolaroma bij oudere Riesling — een aroma dat ontstaat door de afbraak van TDN-verbindingen en nergens anders zo herkenbaar voorkomt.

Waarom is deze indeling bij wit extra belangrijk? Omdat de balans tussen primair fruit en secundaire boter/houttonen direct de stijl bepaalt die je nodig hebt voor druivenherkenning in Module 4 en 5: veel primair fruit en weinig secundair wijst vaak op de frisse druiven, veel secundair en tertiair op de rijke druiven.


## Pro insight

Ruik bewust op de verhouding tussen fruit en boter/toast, niet alleen op losse descriptors — die verhouding alleen al scheidt de frisse van de rijke witte druiven aan tafel. Laat een gast twee glazen naast elkaar ruiken (fris versus rijk) in plaats van te proberen het verschil in woorden te vangen; dat werkt overtuigender.',
    '- klimaatgebonden fruit
- lees-contact aroma
- TDN-petrolnoot
- secundaire boteraroma
- aromaverhouding
',
    'Groene paprika-aroma in Sauvignon Blanc komt van pyrazines, dezelfde verbindingen die ook onrijpe Cabernet Sauvignon hun kenmerkende groene toon geven — één moleculefamilie, twee compleet verschillende druiven.
',
    '- Primair fruit bij wit is sterk klimaatgebonden: citrus/groen versus steenfruit/tropisch
- Secundaire aroma''s (boter, brooddeeg, gist) komen vaak van lees-contact en MLF
- Tertiaire aroma''s verschillen sterk per druif: honing, toast, of petrol
- Petrol bij oudere Riesling ontstaat door afbraak van TDN-verbindingen
- De verhouding primair versus secundair/tertiair stuurt je druivenhypothese
',
    '### Opdracht

Maak een lijst van aroma''s uit een witte wijn.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Bij welke witte wijn verwarde jij laatst een secundair aroma (bijvoorbeeld boter) met een primair kenmerk van de druif zelf?',
    8,
    3
  ),
  (
    'zuur-herkennen',
    'Zuur herkennen',
    'Na deze les kun jij zuurgehalte herkennen en beoordelen.
',
    'Zuur is bij witte wijn niet zomaar één van de structuurelementen — het is de ruggengraat waar de hele stijl omheen gebouwd wordt, omdat tannine als tegenwicht ontbreekt. Een witte wijn met te weinig zuur voelt plat en vermoeid aan, ongeacht hoeveel fruit of aroma er nog aanwezig is; een witte wijn met precies genoeg zuur blijft jaren fris.

Twee zuren domineren: wijnsteenzuur (stabiel, blijft grotendeels behouden) en appelzuur (scherper, appelachtig, wordt tijdens malolactische gisting omgezet in zachter melkzuur). Die omzetting is een bewuste stijlkeuze: veel MLF bij Chardonnay geeft een rondere, romigere zuurindruk; vrijwel geen MLF bij Sauvignon Blanc of Riesling behoudt de scherpe, precieze zuurstructuur die deze druiven kenmerkt.

Klimaat is de grootste externe factor: koele klimaten en vroege oogst behouden appelzuur, warme klimaten en late oogst laten het afbreken tijdens rijping op de wijnstok — nog vóór de wijnmaker iets beslist. Daarom is zuur zowel een druifkenmerk als een klimaatsignaal, en moet je die twee bij blind proeven altijd samen wegen.

Hoe test je dat objectief? Let op speekselopwekking aan de zijkanten van de tong en op hoelang die sensatie aanhoudt na het doorslikken. Vergelijk bij dezelfde temperatuur — te koud overdrijft de indruk van zuur, te warm verdoezelt hem.


## Pro insight

Vraag jezelf bij elke witte wijn af: is dit lage zuur door klimaat, door MLF, of door beide? Dat onderscheid voorkomt een verkeerde druivenhypothese aan tafel. Test bovendien altijd bij gelijke temperatuur wanneer je twee wijnen vergelijkt — een kouder glas wint anders oneerlijk van zuur alleen.',
    '- appelzuur-melkzuuromzetting
- wijnsteenzuur
- zuur als ruggengraat
- klimaatgebonden zuur
- MLF-stijlkeuze
',
    'Appelzuur wordt tijdens de rijping op de wijnstok afgebroken door de ademhaling van de druif zelf — een koelere nacht remt die ademhaling, wat verklaart waarom nachtelijke temperatuurdaling zoveel invloed heeft op het uiteindelijke zuurniveau.
',
    '- Zuur is bij wit de ruggengraat van de structuur, niet tannine
- Wijnsteenzuur blijft stabiel; appelzuur wordt door MLF omgezet in melkzuur
- Veel MLF geeft een rondere zuurindruk; weinig MLF behoudt scherpte
- Klimaat bepaalt hoeveel natuurlijk zuur een druif behoudt vóór de oogst
- Zuur is zowel een druif- als een klimaatsignaal, en moet je samen wegen
',
    '### Opdracht

Vergelijk een Sauvignon Blanc met een Viognier op zuurgevoel.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke witte wijn op jouw lijst zou je nu herclassificeren nadat je zuur apart van klimaat én MLF hebt beoordeeld?',
    8,
    4
  ),
  (
    'mini-toets-witte-wijn',
    'Mini-toets witte wijn',
    'Na deze les toets jij jouw kennis van module 1–3.
',
    'Een blindproef zonder vast protocol is geen proef maar een gok met een verhaal erbij — en juist bij witte wijn, waar tannine niet meehelpt je conclusie te onderbouwen, wreekt die improvisatie zich sneller dan bij rood. Deze mini-toets test niet hoeveel losse feiten je kent, maar of je vier bouwstenen — direct press, kleur, zuur en MLF — in de juiste volgorde en zonder haast kunt combineren tot een houdbare hypothese.

Direct press bepaalt het startpunt: doordat schillen vrijwel meteen worden gescheiden van het sap, mist witte wijn de tannine en kleurextractie die rode wijn definiëren, en verschuift het zwaartepunt volledig naar zuur, aroma en (eventueel) lees- of houtcontact. Kleur is daarna de eerste visuele hypothese: bleekgeel-groen wijst op een koel klimaat en weinig productie-invloed, dieper goud op rijpheid, MLF, houtcontact of leeftijd — een hypothese die de neus en de mond nog moeten bevestigen.

Zuur is de structurele kern: het bepaalt frisheid, bewaarpotentieel en pairingkracht, en is bij wit belangrijker dan bij enige andere structuuras omdat tannine ontbreekt. Malolactische gisting is de belangrijkste stijlkeuze die dat zuur verandert: scherp appelzuur wordt omgezet in zachter melkzuur, wat een wijn ronder en romiger maakt — een techniek die veel wordt toegepast bij Chardonnay en vrijwel nooit bij Riesling of Sauvignon Blanc.

Het blinde witte-wijnprotocol brengt dit samen in vaste volgorde: kleur (intensiteit, diepte), aroma (primair versus secundair/tertiair, klimaatsignaal), structuur (zuur, alcohol, body, balans), en pas daarna een stijlhypothese — koel en strak, of warm en rond. Documenteer die hypothese vóór de onthulling: dat is de enige manier om objectief te toetsen of je protocol standhoudt zonder etiket.


## Pro insight

Documenteer bij elke blinde witte wijn eerst je stijlhypothese — koel/strak of warm/rond — vóór je nadenkt over een specifieke druif. Die discipline is precies wat je team onderscheidt in een verkoopcontext waar gasten op je oordeel vertrouwen, en voorkomt dat je te snel naar een merknaam raadt.',
    '- direct press
- malolactische stijlschakelaar
- zuur als ruggengraat wit
- blind wit-protocol
- stijlhypothese wit
',
    'Een hypothese vóór de onthulling opschrijven werkt aantoonbaar beter dan achteraf redeneren, omdat je brein anders onbewust de uitkomst gaat ''verklaren'' in plaats van toetsen — vooraf schrijven dwingt een eerlijke, falsifieerbare conclusie af.
',
    '- Direct press is het productiestartpunt: geen tannine, wel zuur en aroma centraal
- Kleur is de eerste hypothese: bleekgeel-groen versus dieper goud of amber
- Zuur is de structurele ruggengraat, belangrijker dan bij elke andere as
- MLF zet scherp appelzuur om in zacht melkzuur en verandert de stijl fundamenteel
- Het blinde protocol volgt vaste volgorde: kleur, aroma, structuur, stijlhypothese
',
    '### Opdracht

Proef één witte wijn volledig blind (laat het etiket door iemand anders verbergen). Doorloop het volledige protocol zonder te gokken op een merknaam: beschrijf eerst kleur en intensiteit, dan aroma (primair versus secundair/tertiair), dan structuur (zuur, alcohol, body, balans), en formuleer pas daarna een stijlhypothese — koel/strak of warm/rond — inclusief een vermoeden over wel of geen malolactische gisting. Onthul de wijn pas na het opschrijven van je hypothese.

### Checklist

- Ik heb kleur en intensiteit beschreven vóór ik aan de druif dacht
- Ik heb primaire en secundaire/tertiaire aroma''s apart benoemd
- Ik heb zuur, alcohol en body apart beoordeeld
- Ik heb een vermoeden over malolactische gisting genoteerd
- Ik heb mijn stijlhypothese opgeschreven vóór de onthulling
- Ik heb achteraf mijn grootste denkfout in één zin vastgelegd


### Reflectievraag

Welke van de vier elementen — direct press, kleur, zuur of MLF — vergeet jij het vaakst mee te wegen vóór je een conclusie trekt over een witte wijn?',
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
    'Sauvignon Blanc is de meest ondubbelzinnige aromatische druif binnen de frisse witte categorie, en daardoor een uitstekend startpunt voor blindproefherkenning. Klimaat stuurt de stijl sterker dan bij bijna elke andere druif: in een koel klimaat (Loire, Marlborough) domineren gras, kruisbes, limoen en soms een groene-paprikatoon door pyrazines; in een warmer klimaat (delen van Zuid-Afrika, Chili) verschuift het spectrum naar rijper citrus, passievrucht en minder uitgesproken groene tonen.

De stijlbandbreedte loopt dus van strak-groen en mineraal tot ronder en tropisch, met Marlborough vaak als het meest expressieve, aromatisch intense uiterste. Blindproefmarkers zijn daardoor betrouwbaar: hoog zuur, middelhoog alcohol, een aromatische intensiteit die je al ruikt vóór je swirlt, en een kenmerkende kruidig-groene ondertoon die zelden ontbreekt, zelfs in rijpere stijlen.

Het grootste verwarringsgevaar is Verdejo: beide druiven geven citrus, kruidigheid en hoog zuur, en in een blinde line-up worden ze regelmatig omgewisseld. Het onderscheid zit in de intensiteit en het type kruidigheid — Sauvignon Blanc is scherper groen en explicieter aromatisch, Verdejo is subtieler met een kenmerkende lichte bitterheid en amandeltoon in de afdronk die Sauvignon Blanc mist.

Serveer Sauvignon Blanc koel (6–9 °C) in een smaller glas om de precisie te behouden; een te breed glas of te warme temperatuur laat de scherpe groene tonen omslaan naar vermoeid en vlak.


## Food pairing

### Beste pairing

Sauvignon Blanc bij een kruidige groene salade met geitenkaas en verse kruiden.

### Waarom dit werkt

De kruidig-groene aromatiek van de wijn spiegelt de kruiden in het gerecht, terwijl het hoge zuur de romigheid van de geitenkaas in balans houdt.

### Vermijd

Sauvignon Blanc bij romige, boterrijke gerechten met weinig kruiden — de scherpe groene tonen botsen dan met de romigheid in plaats van die te ondersteunen.

## Pro insight

Bij twijfel tussen Sauvignon Blanc en Verdejo: zoek naar een lichte amandelbitterheid in de afdronk. Vind je die, dan proef je vrijwel zeker Verdejo. Serveer Sauvignon Blanc koel (6–9 °C) in een smaller glas — een te breed glas of te warme temperatuur laat de scherpe groene tonen omslaan naar vermoeid en vlak, en dat is precies het moment waarop een gast de wijn ten onrechte afwijst.',
    '- Sauvignon Blanc
- pyrazinegroen
- Marlborough-stijl
- SB-Verdejo-verwarring
- kruidig-groene ondertoon
',
    'Marlborough Sauvignon Blanc dankt zijn explosieve aromatiek deels aan de extreem hoge zonlichtintensiteit gecombineerd met koele nachten — een combinatie die nergens anders ter wereld exact zo voorkomt.
',
    '- Klimaat stuurt Sauvignon Blanc sterk: koel geeft groen en kruidig, warm geeft rijper citrus
- Marlborough staat bekend om het meest expressieve, aromatisch intense uiterste
- Blindproefmarkers: hoog zuur, aromatische intensiteit al vóór het swirlen, kruidig-groene ondertoon
- Grootste verwarringsgevaar is Verdejo door vergelijkbare citrus- en kruidigheid
- Verdejo heeft een lichte bitterheid en amandeltoon die Sauvignon Blanc mist
',
    '### Opdracht

Proef een Loire Sauvignon en een Nieuw-Zeelandse Sauvignon naast elkaar.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij een blinde Sauvignon Blanc en Verdejo naast elkaar nu correct kunnen scheiden — en op welk kenmerk zou je die beslissing baseren?',
    8,
    1
  ),
  (
    'riesling',
    'Riesling',
    'Na deze les herken jij Riesling op zuur, mineraliteit en aromatische opbouw.
',
    'Riesling is de meest pure terroir-druif binnen de frisse witte categorie: de druif zelf is aromatisch neutraler dan Sauvignon Blanc, waardoor klimaat, bodem en rijpheidsgraad des te directer doorklinken in het glas. Dat maakt Riesling tegelijk lastiger én lonender om blind te herkennen.

Klimaat bepaalt de stijlbandbreedte extreem breed: in een koel klimaat (Mosel) geeft Riesling knisperend limoen, groene appel en een sprankelende, soms bijna scherpe zuurgraad, vaak met restzoet om die scherpte te temperen; in een warmer klimaat (Clare Valley, Alsace) verschuift het spectrum naar steenfruit en een vollere, drogere stijl. Riesling kent bovendien het breedste zoetheidsspectrum van alle grote witte druiven, van bot droog tot edelzoet.

Blindproefmarkers zijn: extreem hoog en precies zuur, limoen en witte bloemen als primair fruit, en bij oudere flessen het onmiskenbare petrolaroma door afbraak van TDN-verbindingen. Het grootste verwarringsgevaar is Grüner Veltliner: beide druiven combineren hoog zuur met citrus en mineraliteit, maar Grüner voegt een herkenbare witte-pepertoon toe die Riesling mist, terwijl Riesling een striktere, puurdere zuurlijn heeft zonder die kruidige rand.

Serveer Riesling koel (6–9 °C) in een middelgroot glas dat zowel precisie als aromatische ontwikkeling toelaat; oudere, complexere Riesling profiteert van een iets breder glas om de tertiaire laag te openen.


## Food pairing

### Beste pairing

Droge tot off-dry Riesling bij pittige Aziatische gerechten met gember en citrusgras.

### Waarom dit werkt

Hoog zuur en een vleugje restzoet temperen scherpte, terwijl de precieze citrusaroma''s aansluiten bij de frisheid van het gerecht.

### Vermijd

Bot droge, extreem hoogzure Riesling bij zeer romige, boterrijke gerechten — de scherpe zuurlijn botst dan met de romigheid in plaats van die te doorbreken.

## Pro insight

Bij twijfel tussen Riesling en Grüner Veltliner: zoek naar een pepertoon. Vind je die, dan proef je Grüner; blijft de zuurlijn puur zonder kruidige rand, dan is het Riesling. Serveer Riesling koel (6–9 °C) in een middelgroot glas, en geef oudere, complexere flessen bewust iets meer glasruimte om de tertiaire laag te openen.',
    '- Riesling
- petrolrijping
- zoetheidsspectrum
- Riesling-Grüner-verwarring
- terroir-transparantie
',
    'Riesling kent van alle grote witte druiven het breedste officiële zoetheidsspectrum — van Kabinett tot Trockenbeerenauslese — vastgelegd in het Duitse Prädikatsysteem op basis van suikergehalte bij de oogst.
',
    '- Riesling is aromatisch neutraler dan Sauvignon Blanc en laat terroir sterker doorklinken
- Klimaat bepaalt een extreem brede stijlbandbreedte, van knisperend droog tot edelzoet
- Blindproefmarkers: extreem precies zuur, limoen, witte bloemen, en petrol bij rijping
- Grootste verwarringsgevaar is Grüner Veltliner door vergelijkbaar hoog zuur en citrus
- Grüner heeft een witte-pepertoon die Riesling mist; Riesling is puurder in de zuurlijn
',
    '### Opdracht

Proef een jonge en oudere Riesling.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welke Riesling-stijl (droog, off-dry of zoet) herken jij nog het minst betrouwbaar blind, en waarom denk je dat dat is?',
    8,
    2
  ),
  (
    'albarino',
    'Albariño',
    'Na deze les herken jij Albariño op frisheid, ziltigheid en citrus.
',
    'Albariño is de meest zilte druif binnen de frisse witte categorie, met een stijl die vrijwel volledig wordt gevormd door zijn Atlantische ligging in Rías Baixas. Klimaat is hier de dominante factor: de koele, vochtige, winderige kustomstandigheden geven consequent hoog zuur, matige alcohol en een directe, ziltige mineraliteit die zelden ontbreekt.

De stijlbandbreedte is smaller dan bij Sauvignon Blanc of Riesling: Albariño blijft vrijwel altijd fris, droog en kustgedreven, met citrus, perzik en witte bloemen als primair fruit. Sommige producenten experimenteren met lees-contact voor meer textuur, maar de kern — ziltigheid en frisheid — verandert daardoor zelden fundamenteel.

Blindproefmarkers zijn: een directe ziltige of maritieme toon naast citrus en perzik, een relatief compacte, precieze structuur, en een afdronk die vaak net iets korter is dan bij Riesling maar even fris. Het verwarringsgevaar ligt vooral bij Verdejo: beide zijn Spaanse, frisse, kruidige witten met matige body, maar Verdejo heeft een duidelijkere kruiden- en amandelbitterheid, terwijl Albariño explicieter zilt en maritiem overkomt.

Serveer Albariño goed gekoeld (6–9 °C) in een smal glas dat de frisheid en ziltigheid focust; het is een van de weinige witte wijnen waarbij een iets lagere temperatuur dan gebruikelijk de stijl juist versterkt in plaats van verzwakt.


## Food pairing

### Beste pairing

Albariño bij verse oesters of andere rauwe schaal- en schelpdieren.

### Waarom dit werkt

De ziltige mineraliteit van de wijn spiegelt de zilte smaak van het schaaldier, terwijl het hoge zuur de romige textuur van de oester reinigt.

### Vermijd

Albariño bij zwaar gekruide of romige vleesgerechten — de subtiele ziltigheid en compacte structuur verdwijnen dan volledig tegen de intensiteit van het gerecht.

## Pro insight

Proef bewust op ziltigheid vóór je aan fruit denkt: die maritieme toon is bij Albariño vaak het eerste en meest betrouwbare signaal. Serveer goed gekoeld (6–9 °C) in een smal glas — Albariño is een van de weinige witte wijnen waarbij een iets lagere temperatuur dan gebruikelijk de stijl juist versterkt, wat perfect aansluit bij een oester- of schaaldierenkaart.',
    '- Albariño
- Rías Baixas
- ziltige mineraliteit
- Albariño-Verdejo-verwarring
- Atlantische stijl
',
    'Rías Baixas ligt zo dicht bij de Atlantische Oceaan dat sommige wijngaarden zicht hebben op zee — de constante wind en luchtvochtigheid daar temperen de rijping en behouden het hoge zuurniveau dat Albariño kenmerkt.
',
    '- Albariño''s stijl wordt sterk gevormd door de koele, Atlantische ligging van Rías Baixas
- De stijlbandbreedte is smal: bijna altijd fris, droog en kustgedreven
- Blindproefmarkers: ziltige/maritieme toon, citrus, perzik, compacte precieze structuur
- Verwarringsgevaar met Verdejo: beide Spaans en fris, maar Verdejo is kruidiger en bitterder
- Albariño is explicieter zilt en maritiem dan Verdejo
',
    '### Opdracht

Proef Albariño met oesters of schaaldieren.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Bij welk schaaldier- of visgerecht op jouw kaart zou Albariño de huidige wijnkeuze overtreffen?',
    8,
    3
  ),
  (
    'gruner-veltliner',
    'Grüner Veltliner',
    'Na deze les herken jij Grüner Veltliner op frisheid en kruidigheid.
',
    'Grüner Veltliner is Oostenrijks belangrijkste witte druif en de tegenhanger van Riesling binnen de frisse categorie: beide combineren hoog zuur met precisie, maar Grüner voegt een unieke kruidige signatuur toe die de druif direct herkenbaar maakt. Klimaat in de Wachau, Kamptal en Kremstal — met grote temperatuurverschillen tussen dag en nacht langs de Donau — behoudt de natuurlijke zuren terwijl het fruit toch voldoende rijpt.

De stijlbandbreedte loopt van lichte, directe ''Steinfeder''-achtige stijlen tot geconcentreerde, bijna Bourgondische ''Smaragd''-stijlen met meer body en soms lichte houtinvloed. Ondanks die bandbreedte blijft de herkenbare witte-pepertoon vrijwel altijd aanwezig, ongeacht het concentratieniveau.

Blindproefmarkers zijn: groene appel en limoen als primair fruit, een onmiskenbare witte-pepertoon, hoog zuur, en vaak een lichte, weldadige body die net iets voller aanvoelt dan bij Riesling. Het grootste verwarringsgevaar is precies Riesling: beide zijn hoogzuur en mineraal, maar Grüner heeft die pepertoon die Riesling mist, terwijl Riesling een striktere, puurdere zuurlijn behoudt en vaker florale in plaats van kruidige tonen laat zien.

Serveer Grüner Veltliner koel (7–10 °C) in een middelgroot glas; de lichtere Steinfeder-stijlen verdienen een iets kleiner glas, de geconcentreerde Smaragd-stijlen profiteren van meer ruimte om de kruidigheid te ontwikkelen.


## Food pairing

### Beste pairing

Grüner Veltliner bij gegrilde asperges met een lichte botersaus.

### Waarom dit werkt

De kruidige pepertoon en het hoge zuur werken van nature samen met het bittere, groene karakter van asperges, een combinatie waar de meeste witte wijnen juist op stuklopen.

### Vermijd

Grüner Veltliner bij zoet gekruide of sterk specerijrijke gerechten — de subtiele pepertoon van de wijn verdwijnt dan tegen dominantere kruiden in het gerecht.

## Pro insight

Bij twijfel tussen Grüner Veltliner en Riesling: zoek actief naar witte peper in de afdronk. Vind je die niet, ga dan uit van Riesling. Kies het glas op stijl: een kleiner glas voor lichte Steinfeder-stijlen, meer ruimte voor geconcentreerde Smaragd-stijlen om de kruidigheid te laten ontwikkelen — en durf Grüner voor te stellen bij asperges, een gerecht waar de meeste andere witte wijnen op stuklopen.',
    '- Grüner Veltliner
- witte-pepertoon
- Wachau-Steinfeder-Smaragd
- Riesling-Grüner-verwarring
- Donau-temperatuurverschil
',
    'De pepertoon in Grüner Veltliner wordt toegeschreven aan rotundon, dezelfde aromaverbinding die ook de kenmerkende peperigheid van koelklimaat-Syrah/Shiraz verklaart.
',
    '- Grüner Veltliner combineert hoog zuur met een unieke witte-pepertoon
- Grote dag-nachttemperatuurverschillen langs de Donau behouden zuur bij volledige rijping
- Stijlbandbreedte loopt van lichte Steinfeder- tot geconcentreerde Smaragd-stijlen
- Blindproefmarkers: groene appel, limoen, witte peper, hoog zuur, lichte volheid
- Grootste verwarringsgevaar is Riesling; de pepertoon is het onderscheidende signaal
',
    '### Opdracht

Proef Grüner met gegrilde groenten.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welke gerechten op jouw kaart zou je nu heroverwegen met Grüner Veltliner in plaats van de gebruikelijke witte huiswijn?',
    8,
    4
  ),
  (
    'verdejo',
    'Verdejo',
    'Na deze les herken jij Verdejo op aroma, bittertje en stijl.
',
    'Verdejo is dé witte specialiteit van Rueda en het duidelijkste voorbeeld binnen deze module van hoe twee druiven met vergelijkbare basiskenmerken toch een eigen identiteit behouden. Klimaat in Rueda — hoog gelegen, continentaal, met grote temperatuurverschillen — geeft de druif zijn kenmerkende combinatie van frisheid en structuur, ondanks de relatief warme Spaanse zomers.

De stijlbandbreedte is compact: Verdejo wordt bijna altijd jong en droog gevinifieerd, met citrus, venkel, groene kruiden en amandel als primair fruit, en een herkenbare lichte bitterheid in de afdronk. Historisch werd de druif ook oxidatief gemaakt, vergelijkbaar met Sherry-stijlen, maar de moderne, frisse stijl domineert nu vrijwel volledig.

Blindproefmarkers zijn: citrus en venkel naast een amandelachtige, licht bittere afdronk, matig tot hoog zuur, en een compacte, geen overdreven aromatische intensiteit die Verdejo onderscheidt van explicietere druiven. Het grootste verwarringsgevaar is Sauvignon Blanc: beide geven citrus, kruidigheid en hoog zuur, maar Sauvignon Blanc is scherper groen en aromatisch explicieter, terwijl Verdejo subtieler is met die kenmerkende amandelbitterheid. Een secundair verwarringsgevaar is Albariño, dat qua herkomst dichtbij ligt maar explicieter zilt en maritiem is dan de meer kruidig-bittere Verdejo.

Serveer Verdejo koel (7–9 °C) in een smaller glas dat de frisheid focust; de lichte bitterheid in de afdronk komt het best tot zijn recht bij een iets hogere temperatuur dan de meest extreem frisse druiven.


## Food pairing

### Beste pairing

Verdejo bij gegrilde witvis met kruiden en amandelen, of bij een tapasplank met olijven.

### Waarom dit werkt

De amandelachtige bitterheid en kruidigheid van de wijn spiegelen de smaken op het bord, terwijl het zuur de vetheid van olijfolie en gegrilde vis in balans houdt.

### Vermijd

Verdejo bij zeer zoete of zeer romige desserts — de lichte bitterheid in de afdronk botst dan onaangenaam met de zoetheid.

## Pro insight

Bij twijfel tussen Verdejo en Sauvignon Blanc: zoek naar amandelbitterheid in de afdronk in plaats van naar de intensiteit van het aroma. Serveer Verdejo iets minder extreem koel (7–9 °C) dan de meest expressieve frisse druiven — die lichte bitterheid komt het best tot zijn recht bij een fractie hogere temperatuur, iets wat de meeste kaarten over het hoofd zien.',
    '- Verdejo
- Rueda-klimaat
- amandelbitterheid
- SB-Verdejo-verwarring
- compacte stijlbandbreedte
',
    'Verdejo werd tot in de twintigste eeuw vaak bewust oxidatief gemaakt, in een stijl die dicht bij Sherry lag — pas de introductie van temperatuurgecontroleerde RVS-gisting maakte de frisse, moderne Verdejo die nu domineert mogelijk.
',
    '- Verdejo combineert frisheid en structuur door het continentale klimaat van Rueda
- De stijlbandbreedte is compact: bijna altijd jong, droog en fris gevinifieerd
- Blindproefmarkers: citrus, venkel, amandelachtige lichte bitterheid, matig-hoog zuur
- Grootste verwarringsgevaar is Sauvignon Blanc, dat scherper groen en explicieter is
- Secundair verwarringsgevaar is Albariño, dat explicieter zilt en maritiem overkomt
',
    '### Opdracht

Vergelijk Verdejo met Sauvignon Blanc.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij Verdejo, Sauvignon Blanc en Albariño nu blind uit elkaar kunnen houden — en welk kenmerk zou voor jou doorslaggevend zijn per druif?',
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
    'Chardonnay is de meest veelzijdige witte druif ter wereld, precies omdat de druif zelf relatief neutraal is en daardoor sterker reageert op klimaat en wijnmaakkeuzes dan bijna elke andere witte druif. Die eigenschap maakt Chardonnay tegelijk het makkelijkst herkenbare en het lastigst te generaliseren druivenras binnen deze module.

Klimaat bepaalt een enorme stijlbandbreedte: in een koel klimaat (Chablis, delen van Bourgogne) blijft Chardonnay strak, citrusachtig en mineraal, vaak met weinig tot geen houtinvloed; in een warm klimaat (Californië, Australië, Chili) verschuift het fruit naar tropisch en rijp, gecombineerd met zachtere zuren en meer body. Wijnmaakkeuzes — houtrijping, bâtonnage en vooral malolactische gisting — voegen daar een derde, onafhankelijke laag aan toe: boter, vanille, toast en romigheid.

Blindproefmarkers zijn daardoor tweeledig: eerst identificeer je het klimaatsignaal (citrus/mineraal versus tropisch/rijp), dan pas het productiesignaal (RVS/strak versus hout/MLF/romig). Het grootste verwarringsgevaar is een ongehoute, koel-klimaat Chardonnay tegenover Chenin Blanc: beide geven appel en een neutrale tot matige aromatiek, maar Chenin behoudt bijna altijd een hogere, striktere zuurlijn en vaker een honingachtige ondertoon, terwijl Chardonnay ronder aanvoelt zodra er enige lees-contact of MLF bij komt kijken.

Serveer strakke, ongehoute Chardonnay koel (7–9 °C) in een smaller glas; houtgelagerde, romige stijlen verdienen een breder glas en een iets hogere temperatuur (10–13 °C) om de complexiteit te openen.


## Food pairing

### Beste pairing

Houtgelagerde, romige Chardonnay bij rijke kreeft of gegrild gevogelte in botersaus.

### Waarom dit werkt

De boterige, romige textuur van de wijn spiegelt de rijkdom van de botersaus, terwijl voldoende zuur het gerecht toch fris houdt.

### Vermijd

Dezelfde romige, houtgelagerde Chardonnay bij een lichte, rauwe visbereiding — de wijn overweldigt dan volledig de subtiliteit van het gerecht.

## Pro insight

Beoordeel elke Chardonnay in twee losse stappen — eerst klimaat (fruitrichting), dan productie (hout, bâtonnage, MLF) — en benoem dat expliciet aan een gast. Zo verkoop je ''een koele, ongehoute Chardonnay'' in plaats van het vage ''droog wit'', en voorkom je dat je de druif met een stijl verwart.',
    '- Chardonnay-kameleon
- klimaatlaag versus productielaag
- malolactische romigheid
- Chardonnay-Chenin-verwarring
- Chablis-strakheid
',
    'Chablis ligt dichter bij Champagne dan bij de rest van Bourgogne, en de beroemde Kimmeridgian-kalksteenbodem bevat fossiele oesterschelpen van meer dan 150 miljoen jaar oud — vandaar de populaire (maar omstreden) link tussen Chablis en ''oesterschelp-mineraliteit''.
',
    '- Chardonnay is neutraal van karakter en reageert sterk op klimaat en wijnmaken
- Klimaat bepaalt fruitrichting: citrus/mineraal (koel) versus tropisch/rijp (warm)
- Houtrijping, bâtonnage en MLF voegen een onafhankelijke productielaag toe
- Blindproefmarkers vereisen twee stappen: eerst klimaat, dan productiestijl
- Grootste verwarringsgevaar is ongehoute Chardonnay tegenover Chenin Blanc
',
    '### Opdracht

Proef een Chablis en een houtgelagerde Meursault naast elkaar.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke Chardonnay op jouw kaart zou je nu anders classificeren nadat je klimaatlaag en productielaag apart hebt beoordeeld?',
    8,
    1
  ),
  (
    'chenin-blanc',
    'Chenin Blanc',
    'Na deze les herken jij Chenin Blanc op veelzijdigheid en zuurstructuur.
',
    'Chenin Blanc is een van de meest onderschatte witte druiven, juist omdat de stijlbandbreedte zo extreem breed is dat één simpele typering onmogelijk is: van bloedstrak droog tot edelzoet, en van stil tot mousserend. Klimaat en regio sturen die bandbreedte sterk: de Loire (Vouvray, Savennières) geeft precisie, hoge zuren en een minerale, soms wasachtige textuur; Zuid-Afrika geeft vaak een rondere, fruitigere en toegankelijkere stijl.

Wat Chenin Blanc onderscheidt van bijna elke andere rijke witte druif is de combinatie van body met uitzonderlijk hoog zuur — een combinatie die zelden zo expliciet samen voorkomt. Die hoge zuurgraad geeft Chenin Blanc bovendien een indrukwekkend bewaarpotentieel, vergelijkbaar met Riesling maar met een geheel andere aromatische signatuur: appel, peer, honing en een kenmerkende wolachtige (lanoline) textuur.

Blindproefmarkers zijn: hoog zuur gecombineerd met meer body dan de frisse druiven uit Module 4, appel- en peertonen, en bij oudere flessen honing en een subtiele wasachtigheid. Het grootste verwarringsgevaar is Chardonnay: beide kunnen rijk, complex en houtgelagerd zijn, maar Chenin Blanc behoudt vrijwel altijd een striktere, hogere zuurlijn die Chardonnay — vooral na volledige MLF — mist, en toont vaker een honingachtige in plaats van boterige ondertoon.

Serveer droge Chenin Blanc koel tot matig gekoeld (8–11 °C) in een middelgroot glas; edelzoete stijlen verdienen een kleiner glas en een iets lagere temperatuur om de balans tussen zoet en zuur te accentueren.


## Food pairing

### Beste pairing

Droge Chenin Blanc bij lichte gevogelte- of varkensgerechten met een romige, licht zoete saus.

### Waarom dit werkt

De combinatie van hoog zuur en body matcht zowel de romigheid van de saus als de lichte zoetheid, zonder dat een van beide de wijn overschaduwt.

### Vermijd

Edelzoete Chenin Blanc bij hartige, zoutige gerechten zonder tegenwicht van zoet of vet — de zoetheid van de wijn werkt dan storend in plaats van aanvullend.

## Pro insight

Test bij twijfel tussen Chenin Blanc en Chardonnay altijd eerst de zuurlijn los van het fruit: blijft die scherp ondanks body en mogelijk hout, dan is het vrijwel zeker Chenin. Gebruik die volgorde ook in verkoop — ''hoog zuur mét body'' is een uniek verkoopargument dat weinig andere druiven kunnen claimen.',
    '- Chenin Blanc
- zuur-en-body-combinatie
- lanoline-textuur
- Chardonnay-Chenin-verwarring
- Vouvray-precisie
',
    'Vouvray kan in dezelfde oogst zowel bloedstrak droog als edelzoet worden gemaakt, afhankelijk van hoeveel botrytis de wijnmaker per perceel toelaat — één druif, één jaar, twee compleet verschillende wijnen.
',
    '- Chenin Blanc heeft de breedste stijlbandbreedte: van bloedstrak droog tot edelzoet
- De Loire geeft precisie en mineraliteit; Zuid-Afrika geeft ronder en fruitiger
- Unieke combinatie van hoog zuur mét body onderscheidt Chenin van andere rijke druiven
- Blindproefmarkers: appel, peer, hoog zuur, en honing/wasachtigheid bij rijping
- Grootste verwarringsgevaar is Chardonnay; Chenin behoudt een striktere zuurlijn
',
    '### Opdracht

Vergelijk een droge Vouvray met een zoete Chenin.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke stijl van Chenin Blanc (droog, rond of edelzoet) zou jij nu het eerst aan een gast voorstellen om de veelzijdigheid van de druif te laten zien?',
    8,
    2
  ),
  (
    'viognier',
    'Viognier',
    'Na deze les herken jij Viognier op aromatische rijkdom en body.
',
    'Viognier is de meest overtuigend aromatische druif binnen de rijke witte categorie, en tegelijk de druif waarbij textuur zwaarder weegt dan zuur. Klimaat speelt een cruciale, bijna paradoxale rol: Viognier heeft warmte nodig om zijn volle aromatische potentieel te bereiken, maar te veel warmte laat het toch al lage zuur volledig wegvallen, waardoor de wijn plat en log wordt in plaats van rijk en parfumerig.

De stijlbandbreedte is relatief smal vergeleken met Chenin Blanc: Viognier blijft vrijwel altijd vol, aromatisch en zacht, met abrikoos, perzik, bloemen en specerijen als primair fruit. Condrieu, de belangrijkste regio, laat zien hoe geconcentreerd en parfumerig deze druif kan worden wanneer klimaat en wijnmaken precies kloppen.

Blindproefmarkers zijn: een onmiskenbaar florale, abrikooservaring die je al ruikt vóór je swirlt, een volle body, en relatief lage tot middelhoge zuren die de textuur meer laten opvallen dan de spanning. Het grootste verwarringsgevaar is Marsanne en Roussanne: alle drie zijn volle, laagzure, Rhône-gebonden druiven met stone fruit en bloemen, maar Viognier is explicieter parfumerig en abrikoosachtig, terwijl Marsanne meer body en minder aroma geeft en Roussanne juist meer finesse en een subtielere kruidigheid toevoegt.

Serveer Viognier matig gekoeld (10–12 °C) in een breder glas dat de aromatische ontwikkeling ruimte geeft; te koud onderdrukt precies het aromatische karakter waar deze druif om bekendstaat.


## Food pairing

### Beste pairing

Viognier bij mild gekruide gerechten met abrikoos, gember of kerrie, zoals kip in een lichte kerriesaus.

### Waarom dit werkt

De florale, abrikoosachtige aromatiek van de wijn sluit direct aan bij de kruiden in het gerecht, terwijl de volle body de romigheid van de saus draagt.

### Vermijd

Viognier bij zeer zure of scherp gekruide gerechten — het lage zuur van de wijn kan dan niet tegen de scherpte op en de wijn voelt plat aan.

## Pro insight

Verkoop Viognier nooit als ''een andere Chardonnay'' — positioneer het expliciet op florale abrikoosintensiteit en textuur, met een lager zuurprofiel als bewuste stijlkeuze in plaats van tekortkoming. Serveer nooit te koud: dat onderdrukt precies het aroma waar de gast voor betaalt.',
    '- Viognier
- florale abrikoosaroma
- Condrieu
- Rhône-verwarringsdrie
- textuur boven zuur
',
    'Condrieu was in de jaren zeventig bijna uitgestorven: minder dan 20 hectare wijngaard restte er, tot een handvol producenten de druif redde — vandaag is Viognier wereldwijd aangeplant, van Californië tot Australië.
',
    '- Viognier heeft warmte nodig voor aroma, maar te veel warmte laat het zuur wegvallen
- De stijlbandbreedte is smal: vrijwel altijd vol, aromatisch en zacht
- Condrieu toont de meest geconcentreerde, parfumerige uitvoering van de druif
- Blindproefmarkers: florale abrikoosaroma, volle body, relatief laag tot middelhoog zuur
- Grootste verwarringsgevaar is Marsanne/Roussanne door vergelijkbare volheid en laag zuur
',
    '### Opdracht

Proef Viognier blind naast Chardonnay.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij welk gerecht op jouw kaart zou Viognier een verrassender maar toch logische keuze zijn dan de gebruikelijke Chardonnay?',
    8,
    3
  ),
  (
    'semillon',
    'Semillon',
    'Na deze les herken jij Semillon op textuur en rijpingspotentieel.
',
    'Semillon is een druif met subtiele kracht: jong relatief neutraal en wasachtig, maar met een uitzonderlijk vermogen om met flesrijping honing, toast en noten te ontwikkelen. Klimaat en regio bepalen sterk welke kant Semillon op gaat: in Hunter Valley (Australië) geeft een koel-klimaat, laag-alcohol stijl een van de meest opmerkelijke rijpingscurves in de witte wijnwereld — jong bijna karakterloos, na tien jaar diep complex met toast en honing zonder ooit hout te hebben gezien.

In Bordeaux wordt Semillon vaak geblend met Sauvignon Blanc, waarbij Semillon de body en de rijpingscapaciteit levert en Sauvignon Blanc de aromatische frisheid. Bij botrytis-aantasting (edelrot) wordt Semillon bovendien de ruggengraat van Sauternes, waar geconcentreerde suikers en hoog zuur samen een evenwichtig edelzoete stijl vormen.

Blindproefmarkers zijn: jong een wasachtige, citroenachtige, relatief stille aromatiek met gematigd zuur; ouder een geleidelijke verschuiving naar honing, toast en noten die niet van hout komt maar puur van flesrijping. Het verwarringsgevaar ligt vooral bij jonge, ongehoute Chardonnay of bij oudere Chenin Blanc: alle drie kunnen wasachtig-honingachtig aanvoelen, maar Semillon mist de scherpe zuurlijn van Chenin en de boterigheid die Chardonnay vaak via MLF krijgt.

Serveer droge Semillon matig gekoeld (9–12 °C) in een middelgroot glas; edelzoete Sauternes-stijlen serveer je kouder (8–10 °C) in een klein glas om de balans tussen zoet en zuur te accentueren.


## Food pairing

### Beste pairing

Edelzoete Semillon (Sauternes-stijl) bij foie gras of een blauwschimmelkaas met honing.

### Waarom dit werkt

De geconcentreerde zoetheid en het hoge zuur van de wijn vormen tegenwicht voor de romige, zoute intensiteit van het gerecht, zonder dat een van beide overheerst.

### Vermijd

Jonge, droge Semillon bij zeer sterk gekruide gerechten — de subtiele, wasachtige stijl van de druif verdwijnt volledig tegen dominante kruiden.

## Pro insight

Leer je team jonge Semillon niet af te schrijven als karakterloos: leg uit dat de stille aromatiek een teken is van rijpingscapaciteit, niet van kwaliteitsgebrek. Eén referentiefles van tien jaar oud overtuigt collega''s sneller dan enige theorie.',
    '- Semillon
- Hunter Valley-rijpingscurve
- Bordeaux-blend
- botrytis-Sauternes
- wasachtige textuur
',
    'Een goede Hunter Valley Semillon wordt vaak al geoogst bij amper 10-11% potentieel alcohol — extreem vroeg voor witte wijn — juist om die kenmerkende, decennialange rijpingscurve mogelijk te maken.
',
    '- Semillon is jong subtiel en wasachtig, maar ontwikkelt met flesrijping honing en toast
- In Hunter Valley toont Semillon een opmerkelijke rijpingscurve zonder hout
- In Bordeaux wordt Semillon vaak geblend met Sauvignon Blanc voor body en frisheid samen
- Botrytis maakt Semillon de ruggengraat van edelzoete Sauternes
- Verwarringsgevaar met jonge Chardonnay of oudere Chenin Blanc door wasachtige honingtonen
',
    '### Opdracht

Zoek een Bordeaux Blanc blend met Semillon.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Heb jij weleens een jonge Semillon te snel afgeschreven als karakterloos — en zou je die nu anders beoordelen?',
    8,
    4
  ),
  (
    'marsanne-roussanne',
    'Marsanne & Roussanne',
    'Na deze les begrijp jij hoe Marsanne en Roussanne samenwerken.
',
    'Marsanne en Roussanne zijn de twee Rhône-druiven die zelden apart worden gedronken en daardoor het duidelijkste voorbeeld vormen van complementaire blending binnen witte wijn. Klimaat in Hermitage en Saint-Joseph — warm, met voldoende diurnale afkoeling — geeft beide druiven de rijpheid die ze nodig hebben zonder hun zuur volledig te verliezen.

Marsanne levert body, textuur en een brede, soms amandelachtige rijkdom, maar mist op zichzelf vaak aromatische intensiteit en veroudert snel als hij alleen wordt gebotteld. Roussanne levert daarentegen aroma, elegantie en een net iets hogere zuurgraad, met kenmerken van perzik, kruiden en honing, maar heeft minder body dan Marsanne. Samen vormen ze een wijn die noch te log (zoals Marsanne alleen) noch te ijl (zoals Roussanne alleen) wordt.

Blindproefmarkers zijn: volle body, matig tot laag zuur, stone fruit en amandel- of honingtonen, en een textuur die dichter bij Viognier ligt dan bij de frisse Module 4-druiven. Het grootste verwarringsgevaar is precies Viognier: alle drie zijn volle, laagzure Rhône-druiven, maar Viognier is explicieter florale-abrikoosachtig, terwijl Marsanne/Roussanne-blends meer body en een subtielere, minder parfumerige aromatiek tonen.

Serveer deze blends matig gekoeld (10–13 °C) in een breder glas dat de complexe, vaak wat gesloten aromatiek de ruimte geeft zich te ontwikkelen; witte Hermitage profiteert bovendien van enkele jaren flesrijping vóór het optimale drinkmoment.


## Food pairing

### Beste pairing

Marsanne-Roussanne blend bij romige schaaldierengerechten of gegratineerde vis met kruidenkorst.

### Waarom dit werkt

De volle body en subtiele kruidigheid van de blend matchen de romigheid van het gerecht, terwijl voldoende zuur de wijn toch fris genoeg houdt om niet te log te worden.

### Vermijd

Deze blend bij een lichte, rauwe visbereiding — de volle body en lage zuurgraad overweldigen de subtiliteit van het gerecht volledig.

## Pro insight

Adviseer een gast Marsanne en Roussanne altijd als koppel, nooit los — leg uit dat de een body levert en de ander aroma, en dat de blend daarom beter werkt dan beide druiven apart. Bij twijfel met Viognier: is de florale abrikoosintensiteit minder uitgesproken en voelt de wijn voller dan parfumerig, dan zit je goed met de Rhône-blend.',
    '- Marsanne-Roussanne-complementariteit
- Hermitage
- amandel-honingprofiel
- Rhône-verwarringsdrie
- volle laagzure textuur
',
    'Witte Hermitage kan tientallen jaren rijpen en wordt door sommige kenners hoger aangeslagen dan zijn rode tegenhanger uit dezelfde heuvel — een zeldzaamheid in de wijnwereld, waar wit doorgaans korter leeft dan rood.
',
    '- Marsanne en Roussanne worden zelden apart gebotteld en vullen elkaar functioneel aan
- Marsanne geeft body en rijkdom maar mist aroma en veroudert snel alleen
- Roussanne geeft aroma, elegantie en hoger zuur maar minder body
- Blindproefmarkers: volle body, laag zuur, stone fruit, amandel- of honingtonen
- Grootste verwarringsgevaar is Viognier, dat explicieter florale-abrikoosachtig is
',
    '### Opdracht

Vergelijk Rhône-white blends met Chardonnay.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij welke gelegenheid op jouw kaart zou een Marsanne-Roussanne-blend een interessant alternatief zijn voor de gebruikelijke volle Chardonnay?',
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
    'Gewürztraminer dankt zijn extreme aromatische intensiteit aan een uitzonderlijk hoge concentratie terpenen — linalool, geraniol en citronellol — een concentratie die tot de hoogste van alle klassieke druivenrassen behoort. Dat verklaart waarom lychee, rozen en gember zich al vóór elke houtlagering of extra maceratie manifesteren: het zit al in de druif zelf. Genetisch is Gewürztraminer een roze schilmutatie van Traminer (Savagnin Rose), en die pigmentatie correleert opvallend vaak met hogere terpeenrijkdom — eenzelfde patroon zien we terug bij Muscat en Torrontés.

Lage zuurgraad, hoog extract en een vaak herkenbare lichte fenolische bitterheid — een subtiele grip in de afdronk, ontstaan tijdens de persing door beperkt schilcontact — vormen samen de kenmerkende ''olieachtige'' textuur. Die fenolische component vraagt vakmanschap: te veel bitterheid is een veelvoorkomende fout, terwijl de Alsace Grand Cru-terroirs (Kaefferkopf, Hengst) laten zien hoe precisie in de wijngaard en kelder tot een verfijnde balans leidt.

Vendange Tardive en Sélection de Grains Nobles tonen de affiniteit van Gewürztraminer met botrytis en late oogst: de dikke schil en lage zuurbuffering laten hogere suikerniveaus toe zonder dat de wijn plakkerig wordt. Dat contrasteert met de droge Alsace-stijl, de halfdroge Duitse Pfalz-interpretatie en de strakkere, preciezere Alto Adige-uitvoering in de koelere Zuid-Tiroolse bergdalen.

Het klassieke verwarringsrisico is Muscat: beide zijn intens floraal en druivig van aard. Het verschil zit vooral in textuur, niet in aroma alleen — Gewürztraminer is breder en olieachtiger met een specerij-gember-rozensignatuur, terwijl Muscat lichter en ''sappiger'' aanvoelt. Bij blind proeven lost textuur die verwarring vaak sneller op dan aroma alleen.


## Food pairing

### Beste pairing

Gewürztraminer bij Munsterkaas of een matig pittige Thaise curry.

### Waarom dit werkt

Lage zuren en aromatische zoetheid temperen chilihitte en de zoute, sterke korstkaas zonder te botsen.

### Vermijd

Zeer zure of citrusrijke gerechten — de lage zuurgraad van de wijn geeft dan een vlakke, ongebalanceerde combinatie.

## Pro insight

Proef elke nieuwe Gewürztraminer eerst blind op fenolische grip vóór je hem aanbeveelt: te veel bitterheid in de afdronk is de meest voorkomende kwaliteitsfout en overstemt de finesse die je wilt verkopen. Gebruik textuur, niet aroma, als eerste onderscheid met Muscat.',
    '- terpenen
- fenolische bitterheid
- Vendange Tardive
- roze schilmutatie
- Alsace Grand Cru
',
    'De naam Traminer verwijst naar het dorp Tramin in Zuid-Tirol, waar de oorspronkelijke, niet-geroze variant vandaan zou komen — Gewürztraminer is dus letterlijk ''de kruidige Tramin-druif''.
',
    '- Extreem hoge terpeenconcentratie (linalool, geraniol) verklaart de intense aromatiek
- Roze schilmutatie van Traminer — pigmentatie correleert met terpeenrijkdom
- Lichte fenolische bitterheid geeft de kenmerkende olieachtige textuur
- Vendange Tardive en SGN tonen affiniteit met botrytis en late oogst
- Onderscheid van Muscat zit vooral in textuur (olieachtig versus sappig-fris)
',
    '### Opdracht

Proef Gewürztraminer blind en noteer drie opvallende aroma''s.

### Checklist

- Ik heb minstens drie concrete punten genoteerd
- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie
- Ik schreef mijn observaties gestructureerd op


### Reflectievraag

Welk signaal — textuur of aroma — zou jij als eerste gebruiken om Gewürztraminer van Muscat te onderscheiden in een blindproef, en waarom is dat signaal betrouwbaarder?',
    8,
    1
  ),
  (
    'muscat',
    'Muscat',
    'Na deze les herken jij Muscat op druivigheid en florale expressie.
',
    'Muscat is geen enkele druif maar een familie van verwante, genetisch onderscheiden rassen. Muscat Blanc à Petits Grains is de fijnste en meest florale variant, gebruikt in Moscato d''Asti en Alsace Muscat. Muscat of Alexandria is grover en dominant in zoete en versterkte stijlen zoals Moscatel de Setúbal. Muscat Ottonel is lichter en beter geschikt voor koelere klimaten zoals Alsace en Oostenrijk. Alle drie delen dezelfde kern-terpenen (linalool, geraniol), maar in andere concentratie en onderlinge verhouding — vandaar de stijlverschillen binnen één familienaam. Bijzonder: Muscat is de enige grote druivenfamilie waarvan de wijn daadwerkelijk naar verse druiven ruikt; de meeste andere ''druivige'' associaties bij wijn ontstaan door gistingsesters, niet door de druif zelf.

Die veelzijdigheid ontstaat doordat terpeenvorming vroeg in de rijping plaatsvindt en los staat van suiker- of zuurniveau bij oogst. Dat maakt bloedserieuze droge stijlen (Alsace) mogelijk naast de lichte, laagalcoholische frizzante Moscato d''Asti (fermentatie vroeg gestopt, CO₂ behouden), volledig mousserende Asti Spumante, en versterkte dessertstijlen zoals Rutherglen Liqueur Muscat uit Australië — een breder stijlbereik dan bijna elke andere druif.

Het verwarringsrisico met Gewürztraminer wordt hier structureel opgelost: Muscat toont een frissere, ''sappigere'' druivigheid met relatief hogere zuurretentie bij vergelijkbare rijpheid, terwijl Gewürztraminer breder en olieachtiger aanvoelt.

Rutherglen classificeert zijn versterkte Muscats via een uniek kwaliteitssysteem (Rutherglen, Classic, Grand en Rare) gebaseerd op fractionele blending over meerdere decennia — conceptueel verwant aan het solera-systeem van sherry, maar toegepast op een aromatische in plaats van oxidatief-neutrale druif.


## Food pairing

### Beste pairing

Moscato d''Asti bij een lichte perzik- of abrikozentaart.

### Waarom dit werkt

De lage alcohol en zachte mousse van Moscato spiegelen het fruit zonder de wijn te overweldigen.

### Vermijd

Zwaar gekruide of zeer zure gerechten — die overstemmen de subtiele florale precisie van deze stijl volledig.

## Pro insight

Vraag bij Muscat altijd eerst naar de gewenste stijl vóór je een fles aanbeveelt — droog, licht frizzante of zwaar versterkt liggen verder uiteen dan bij vrijwel elke andere druif. Leg de familiestructuur (Blanc à Petits Grains, Alexandria, Ottonel) uit als verkoopargument, niet als verwarrende technische voetnoot.',
    '- Muscat Blanc à Petits Grains
- Muscat of Alexandria
- Moscato d''Asti
- Rutherglen-classificatie
- terpeenfamilie
',
    'Rutherglen Liqueur Muscat wordt geclassificeerd via fractionele blending over meerdere decennia, conceptueel vergelijkbaar met het solera-systeem van sherry — sommige ''Rare''-bottelingen bevatten wijn die honderd jaar oud is.
',
    '- Muscat is een familie: Blanc à Petits Grains (fijnst), of Alexandria (zoet/versterkt), Ottonel (koel klimaat)
- Enige druivenfamilie waarvan de wijn daadwerkelijk naar verse druiven ruikt
- Terpeenvorming staat los van suiker/zuur — vandaar het brede stijlbereik (droog tot versterkt)
- Onderscheid met Gewürztraminer: Muscat is frisser en sappiger, minder olieachtig
- Rutherglen classificeert versterkte Muscat via fractionele blending, vergelijkbaar met solera
',
    '### Opdracht

Vergelijk Muscat met Gewürztraminer.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij welke Muscat-stijl (droog, frizzante of versterkt) zou jij een gast het snelst verrassen die alleen ''zoete Muscat'' kent — en met welk argument overtuig je die gast?',
    8,
    2
  ),
  (
    'torrontes',
    'Torrontés',
    'Na deze les herken jij Torrontés op geurintensiteit en frisheid.
',
    'Torrontés Riojano — de fijnste en meest verspreide variant — is een natuurlijke kruising tussen Muscat of Alexandria en de roze Criolla Chica. Die afkomst verklaart de sterk Muscat-achtige neus (geërfde terpenen), terwijl de smaak juist minder fenolische bitterheid en olieachtigheid toont dan zowel Gewürztraminer als Muscat. Dat verklaart het beroemde fenomeen dat ''de geur rijker is dan de smaak'': orthonasale waarneming (rechtstreeks ruiken uit het glas) registreert de terpenen veel intenser dan de retronasale waarneming (proeven en doorslikken) doet.

De hoogteligging van Salta en Cafayate — sommige percelen tot ruim 3000 meter, zoals Bodega Colomé''s Altura Máxima — zorgt voor een groot diurnaal verschil dat zuren behoudt ondanks de intense zoninstraling. Diezelfde UV-stress stimuleert als afweermechanisme van de plant extra terpeen- en fenolsynthese — één en dezelfde omgevingsfactor verklaart dus zowel de aromatische intensiteit als de frisse structuur.

Specialistisch onderscheid: niet elke ''Torrontés'' op het etiket is gelijkwaardig. Torrontés Sanjuanino en Torrontés Mendocino zijn verwante maar minder fijne rassen; Riojano geldt als de kwaliteitsreferentie.

Blind kan Torrontés verward worden met Muscat of Viognier door de florale intensiteit. De hoogte-gedreven zuurbehoud is het onderscheidende kenmerk: bij vergelijkbare florale intensiteit behoudt Torrontés meer zuur dan een warmeklimaat-Muscat.


## Food pairing

### Beste pairing

Torrontés bij ceviche of empanadas met limoen en koriander.

### Waarom dit werkt

De florale intensiteit en frisse zuren spiegelen citrus en kruiden zonder de delicate vis te overweldigen.

### Vermijd

Romige, zware sauzen — die maskeren precies de florale precisie die Torrontés uniek maakt.

## Pro insight

Framen ''geur rijker dan smaak'' als orthonasaal-retronasaal effect in plaats van tekortkoming voorkomt teleurstelling bij een gast die veel had verwacht. Wijs bewust op de extreme wijngaardhoogte van Salta als het verhaal achter de frisse structuur ondanks intense zon.',
    '- Torrontés Riojano
- Criolla Chica
- orthonasaal versus retronasaal
- Cafayate
- diurnaal verschil
',
    'Bodega Colomé''s wijngaard Altura Máxima in Salta ligt op ruim 3111 meter hoogte — daarmee een van de hoogste commerciële wijngaarden ter wereld, waar de lucht al merkbaar ijler is dan op zeeniveau.
',
    '- Torrontés Riojano is een natuurlijke kruising van Muscat of Alexandria en Criolla Chica
- ''Geur rijker dan smaak'' verklaard door orthonasale versus retronasale waarneming
- Extreme hoogte (tot 3000+ meter) behoudt zuur via een groot diurnaal verschil
- UV-stress stimuleert zowel terpeen- als fenolsynthese
- Riojano is de kwaliteitsreferentie; Sanjuanino en Mendocino zijn minder fijn
',
    '### Opdracht

Proef Torrontés blind naast Muscat.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke andere aromatische druif uit deze module zou jij naast Torrontés zetten om het verschil tussen orthonasale en retronasale intensiteit expliciet te demonstreren?',
    8,
    3
  ),
  (
    'pinot-gris',
    'Pinot Gris',
    'Na deze les herken jij Pinot Gris op textuur, stijl en aromatische balans.
',
    'Pinot Gris is een kleurmutatie van Pinot Noir (grijsroze schil, ''gris'' betekent grijs) en genetisch exact dezelfde druif als Pinot Grigio — geen twee rassen, maar één druif met twee stijltradities. Specialistisch belangrijk: de druif zelf is slechts matig terpenerijk, aanzienlijk minder dan Gewürztraminer, Muscat of Torrontés. Veel van het waargenomen karakter in rijkere uitvoeringen komt daarom van schilcontact-fenolen en textuur, niet van echte primaire terpeenaromatiek — een cruciaal onderscheid binnen een module die draait om aromatische druiven.

Het stijlspectrum wordt bepaald door wijnmaakkeuzes, niet door genetica. Italiaanse Pinot Grigio (Veneto, Alto Adige, Friuli) wordt doorgaans direct en met minimaal schilcontact geperst: bleek, neutraal, fris, geschikt voor grootschalige productie. Alsace Pinot Gris ondergaat langere schilmaceratie en soms vat- of gistlagering: dieper van kleur, honingachtig van gewicht, met rook- en specerijtonen, en regelmatig een lichte restzoetheid.

De ramato-stijl in Friuli — Pinot Grigio met verlengd schilcontact, waardoor een koperroze kleur ontstaat — is een specialistische niche die een historische Friulaanse traditie nieuw leven inblaast en op het snijvlak van ''wit'' en ''oranje wijn'' balanceert.

Blindherkenning steunt daardoor minder op één signatuuraroma en meer op structurele ''tussenpositie'': neutrale aromatiek gecombineerd met subtiele fenolische grip en medium body die tussen fris en rijk in zit, is zelf al diagnostisch voor deze druif.


## Food pairing

### Beste pairing

Alsace Pinot Gris bij gebraden gevogelte met champignons, of Pinot Grigio bij een lichte visceviche.

### Waarom dit werkt

De rijkere Alsace-stijl draagt umami en textuur; de lichte Italiaanse stijl laat delicate vis ongestoord.

### Vermijd

Zware, sterk gekruide gerechten bij de lichte Italiaanse stijl — die overweldigen de subtiele neutraliteit volledig.

## Pro insight

Leg altijd eerst uit dat Pinot Grigio en Pinot Gris dezelfde druif zijn vóór je het stijlverschil bespreekt — dat voorkomt verwarring en toont meteen vakkennis. Gebruik de ramato-stijl als curiositeit om gevorderde gasten te verrassen richting oranje wijn.',
    '- kleurmutatie
- schilcontact
- ramato-stijl
- Alto Adige
- structurele tussenpositie
',
    'De ramato-stijl (Pinot Grigio met verlengd schilcontact) was ooit de dominante manier om deze druif in Friuli te maken, tot RVS-technologie in de twintigste eeuw de lichte, bleke stijl tot standaard maakte — de koperroze traditie is dus een heropleving, geen innovatie.
',
    '- Pinot Gris en Pinot Grigio zijn genetisch dezelfde druif, twee stijltradities
- De druif zelf is slechts matig terpenerijk — karakter komt vaak van schilcontact
- Italië: direct geperst, licht en neutraal; Alsace: schilmaceratie, rijker en kruidiger
- Ramato-stijl (Friuli) gebruikt verlengd schilcontact voor een koperroze kleur
- Blindherkenning steunt op structurele tussenpositie, niet op één signatuuraroma
',
    '### Opdracht

Vergelijk Pinot Grigio met Pinot Gris.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij een gast die alleen lichte Pinot Grigio kent, durven verrassen met een rijke Alsace Pinot Gris — en welke ene zin zou je gebruiken om die stijlsprong uit te leggen?',
    8,
    4
  ),
  (
    'vermentino',
    'Vermentino',
    'Na deze les herken jij Vermentino op mediterrane frisheid en kruidigheid.
',
    'Vermentino is een schoolvoorbeeld van ampelografische synonymie: dezelfde druif heet Vermentino op Sardinië, in Ligurië en Toscane, Rolle in de Provence en Languedoc, Pigato aan de Ligurische Riviera di Ponente (al bestaat discussie over subtiele klonale verschillen) en Favorita in Piemonte — DNA-onderzoek bevestigt de laatste als identiek. Eén druif met meerdere regionale identiteiten is een bredere les in wijnetikettering die verder reikt dan Vermentino alleen.

De kenmerkende licht bittere amandeltoon in de afdronk komt van specifieke fenolische verbindingen die behouden blijven bij het doorgaans minimale schilcontact. Gecombineerd met een gematigd tot hoog zuurgehalte en een ziltige, texturele finish — vaak (ten onrechte) ''mineraliteit'' genoemd, dezelfde voorzichtigheid als bij de terroir-analyse van andere druiven: het is een sensorische associatie, geen directe mineraaloverdracht, al kan kustnabijheid via zeewind meetbare sporen natriumchloride bijdragen, in tegenstelling tot ''mineraliteit'' bij inland percelen.

Vermentino di Gallura DOCG op Sardinië — Italië''s enige DOCG voor een witte wijn op het eiland — toont hoe granietbodem intensiteit en spanning geeft, terwijl mildere Toscaanse Vermentino (bijvoorbeeld in Bolgheir-blends) een zachtere, ronde interpretatie oplevert van dezelfde druif.

Structureel overbrugt Vermentino de categorieën ''fris'' en ''aromatisch'': florale en citruslift zonder werkelijk hoge terpeenconcentratie, wat het een bruikbaar ijkpunt maakt bij blindkalibratie tussen neutrale en echt aromatische druiven.


## Food pairing

### Beste pairing

Vermentino bij gegrilde vis met pesto genovese of gefrituurde inktvis.

### Waarom dit werkt

De ziltige, licht bittere structuur spiegelt de mediterrane kruiden en snijdt door het vet van de frituur.

### Vermijd

Romige, zwaar boterrijke sauzen — die verdrukken de lichte, ziltige precisie van deze stijl.

## Pro insight

Noem bewust de regionale synoniemen (Rolle, Favorita, Pigato) wanneer een gast een fles niet herkent als ''dezelfde druif'' — dat bouwt direct vertrouwen op als kenner. Wees voorzichtig met het woord ''mineraliteit'': benoem het liever als ziltige textuur uit kustnabijheid.',
    '- Rolle-synoniem
- Favorita
- bittere amandelfinish
- Vermentino di Gallura
- ziltige textuur
',
    'Vermentino di Gallura is niet alleen Sardinië''s enige DOCG, maar ook nog altijd de enige DOCG voor witte wijn op het hele eiland — een unieke positie binnen de Italiaanse classificatiepiramide.
',
    '- Vermentino, Rolle, Pigato en Favorita zijn (grotendeels) dezelfde druif onder regionale namen
- De bittere amandelfinish komt van fenolen die behouden blijven bij minimaal schilcontact
- Ziltigheid is een sensorische associatie, geen bewezen directe mineraaloverdracht
- Vermentino di Gallura DOCG is Sardinië''s (en Italië''s) enige witte DOCG
- Overbrugt ''fris'' en ''aromatisch'' — florale lift zonder hoge terpeenconcentratie
',
    '### Opdracht

Proef Vermentino met gegrilde vis.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Bij welke fles op jouw kaart zou je een gast bewust attenderen op een regionaal synoniem (Rolle, Favorita, Pigato) — en waarom versterkt dat het vertrouwen in je advies?',
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
    'Serveertemperatuur is een bewegend doel dat rechtstreeks samenhangt met de vluchtigheid van aromatische verbindingen. Terpenen en esters met een laag kookpunt verdampen al bij 8–10 °C, wat verklaart waarom aromatische witte wijnen (Gewürztraminer, Muscat, Riesling) niet veel warmer geserveerd hoeven te worden dan neutrale, frisse stijlen ondanks hun hogere body — te koud serveren onder circa 7 °C onderdrukt actief de verdamping van precies die terpenen die de aromatische module definieert.

Vatgegiste of op gist gelagerde wijnen met malolactische gisting (houtgelagerde Chardonnay, sommige Pinot Gris) steunen op textuur — romigheid uit mannoproteïnen en gistcontact — die temperatuurgevoelig is: onder circa 10 °C wordt die romigheid vlak of muf. Dat is het mechanisme achter het bewust warmer serveren van top-Bourgogne (12–14 °C): geen indulgentie, maar chemie — viscositeitsperceptie en de lagere vluchtigheid van zwaardere verbindingen zoals diacetyl vragen net iets meer warmte om zich te openen.

Praktisch protocol: schenk circa 1–2 °C onder de uiteindelijke doeltemperatuur, want een glas warmt in een verwarmde ruimte vanzelf op. Een ijsemmer met 50% water en 50% ijs koelt sneller en gelijkmatiger dan een koelkast alleen.

Specialistisch aandachtspunt: overmatig koelen kan lichte oxidatie of hitteschade in mindere kwaliteitswijnen maskeren — herken wanneer ''te koud serveren'' een bewuste verkooptruc is in plaats van een oprechte stijlkeuze.


## Food pairing

### Beste pairing

Dezelfde houtgelagerde Chardonnay geserveerd op 8 °C en op 13 °C naast een romige kreeftenbisque.

### Waarom dit werkt

Bij 13 °C ontvouwt de lees-textuur zich en spiegelt de romigheid van de bisque; bij 8 °C blijft de wijn vlak.

### Vermijd

Een zeer aromatische Gewürztraminer op 14 °C bij hetzelfde gerecht — te warm serveren maakt de wijn log en benadrukt alcohol.

## Pro insight

Wantrouw een wijn die opvallend ijskoud wordt geserveerd zonder duidelijke stijlreden — dat kan lichte gebreken verdoezelen in plaats van aroma sturen. Hang een stijl-temperatuurkaart achter de bar zodat elke medewerker dezelfde referentie gebruikt.',
    '- aromavolatiliteit
- lees-textuur
- temperatuurdrift
- koelprotocol
- foutmaskering
',
    'Een glas wijn kan in een warme eetzaal binnen tien tot vijftien minuten twee tot drie graden opwarmen — genoeg om een strak geserveerde Sauvignon Blanc merkbaar rijker te laten aanvoelen tegen het einde van het glas.
',
    '- Te koud onderdrukt de verdamping van terpenen — juist bij aromatische witte wijn een risico
- Gist- en houtgelagerde textuur (romigheid) is temperatuurgevoelig — vandaar warmer serveren
- Schenk altijd iets onder de doeltemperatuur; het glas warmt vanzelf op
- Ijsemmer met 50/50 water-ijs koelt sneller en gelijkmatiger dan een koelkast
- Overmatig koelen kan lichte oxidatie of hitteschade maskeren — wees daar alert op
',
    '### Opdracht

Meet de temperatuur van drie witte wijnen voor het serveren.

### Checklist

- Ik heb minstens drie concrete punten genoteerd
- Ik koppelde mijn keuze aan servicecontext (glas en temperatuur)


### Reflectievraag

Welke fles op jouw kaart serveer je vermoedelijk te koud uit gewoonte — en welk aromasignaal zou je na correctie moeten proeven dat je nu mist?',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij hoe glaswerk invloed heeft op witte wijn.
',
    'Glasvorm stuurt direct hoeveel aromatische verbindingen zich concentreren vóór ze de neus bereiken. Smalle, getailleerde tulpglazen voor aromatische witte wijn (Riesling, Gewürztraminer) bundelen de al overvloedige terpenen richting de neus en beperken tegelijk de ethanolwaarneming, zodat delicate florale tonen domineren boven alcoholwarmte. Bredere kelken voor houtgelagerde, gistgelagerde Chardonnay geven de textuurgedreven, minder vluchtige complexiteit ruimte om zich te ontplooien, zonder de zwaardere aroma''s voortijdig te concentreren tot iets overweldigends.

Het neutrale ISO-tasting-glas blijft de internationale standaard voor blind proeven en examens — bewust zonder stijlinterpretatie, zodat elke wijn onder identieke condities wordt beoordeeld.

Randdikte beïnvloedt de eerste indruk: een dunne, scherp geslepen rand laat wijn de mond bereiken vóór de lip het glas voelt. Glashygiëne is minstens zo belangrijk als vorm — detergent-residu dempt juist de delicate topnoten waarop aromatische witte wijnen bijna volledig steunen voor hun aantrekkingskracht.

Praktisch standaardiseren veel sommeliers aromatische witte wijn in één glasvorm en rijkere, houtgelagerde stijlen in een andere — een subtiel maar herkenbaar servicesignaal dat gasten leert welk soort wijn ze mogen verwachten nog vóór ze proeven.


## Food pairing

### Beste pairing

Gewürztraminer in een smal, getailleerd glas bij een lichte Aziatische salade met gember.

### Waarom dit werkt

Het smalle glas bundelt de florale terpenen precies richting de neus, in balans met de kruidige salade.

### Vermijd

Datzelfde glas voor een houtgelagerde Chardonnay — de brede, textuurgedreven complexiteit krijgt dan te weinig ruimte.

## Pro insight

Schenk interne proeverijen altijd in een neutraal ISO- of wittewijnglas en bewaar varietal-specifiek glaswerk voor gastpresentatie — zo vergelijk je zuiver én verkoop je toch het juiste glas aan tafel. Controleer glashygiëne structureel: detergent-residu is een onderschatte oorzaak van ''vlakke'' aromatische witte wijn.',
    '- tulpvorm
- randdikte
- ISO-glas
- glashygiëne
- aromaconcentratie
',
    'Het ISO-tasting-glas werd in de jaren zeventig ontwikkeld door de International Organization for Standardization specifiek om wijnbeoordeling wereldwijd vergelijkbaar te maken — het wordt nog altijd gebruikt bij officiële wijnexamens en -competities.
',
    '- Smal glas concentreert terpenen en beperkt alcoholwaarneming bij aromatische wijn
- Breed glas geeft textuurgedreven, houtgelagerde witte wijn ruimte om te ontplooien
- ISO-tasting-glas is de neutrale standaard voor blind proeven en examens
- Randdikte beïnvloedt hoe wijn de mond eerst bereikt
- Detergent-residu dempt topnoten — kritiek bij aroma-gedreven aromatische witte wijn
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik heb minstens twee concrete punten genoteerd


### Reflectievraag

Welk glas in jouw zaak doet een witte wijnstijl structureel tekort — en wat is de service- of verkoopimpact daarvan op die fles?',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren van witte wijn',
    'Na deze les weet jij wanneer witte wijn decanteren zinvol is.
',
    'Decanteren van witte wijn draait meestal om een ander mechanisme dan bij rood: reductie. Reductief gemaakte wijn — minimale zuurstofblootstelling, inert gas, schroefdop — behoudt frisheid maar kan vluchtige zwavelverbindingen (H₂S, lichte mercaptanen) vasthouden die ruiken naar lucifer, rubber of gekookte kool. Die tonen verdwijnen doorgaans binnen enkele minuten zwenken of beluchten — in tegenstelling tot een echt gebrek, dat niet vervliegt.

Wijnen die écht profiteren van decanteren: oude Riesling (integreert petroltonen), rijke witte Bourgogne (opent reductief gistkarakter), Chenin Blanc (integreert hoge zuren met textuur) en witte Rhône-blends op basis van Marsanne en Roussanne (textuur ontvouwt zich met lucht).

Fragiele, oud gerijpte witte wijn kan sneller ''instorten'' dan rode wijn van vergelijkbare leeftijd: minder fenolische buffering (minder tannine) betekent minder bescherming tegen oxidatie. Oude Riesling kan binnen twintig tot dertig minuten blootstelling al verse fruitlift verliezen.

''Splash-decanteren'' — krachtig overschenken in een brede karaf, of stevig zwenken in het glas zelf — is de snelle techniek om reductie direct te laten verdampen zonder langdurige blootstelling, terwijl langzaam, zorgvuldig decanteren bedoeld is voor structurele ontwikkeling van complexe, gerijpte stijlen.


## Food pairing

### Beste pairing

Een net geopende, licht reductieve Chablis, kort gezwenkt, bij verse oesters.

### Waarom dit werkt

Het kort openbreken van reductie laat de mineraal-citrusprecisie van Chablis samenwerken met de ziltige oester.

### Vermijd

Een zeer oude, fragiele Riesling lang van tevoren decanteren — het frisse fruit kan binnen minuten wegvallen.

## Pro insight

Ruik een net geopende, sterk reductieve fles altijd eerst na een korte, krachtige zwenkbeweging vóór je hem afschrijft als gebrekkig — dat onderscheid tussen een echte fout en tijdelijke reductie zit in die ene beweging. Reserveer langzaam decanteren voor structurele ontwikkeling, niet voor elke fles die ''even moet luchten''.',
    '- reductie
- vluchtige zwavelverbindingen
- splash-decanteren
- petrolontwikkeling
- fenolische buffering
',
    'Sommige topwijnmakers in de witte Bourgogne decanteren hun eigen wijn standaard vóór verkoopproeverijen — niet omdat de wijn een gebrek heeft, maar om reductief gistkarakter bewust te openen voor een eerlijker eerste indruk.
',
    '- Bij witte wijn draait decanteren vaak om reductie, niet om sedimentscheiding
- Vluchtige zwavelverbindingen (H₂S, mercaptanen) verdampen bij beluchting, een gebrek niet
- Oude Riesling, rijke witte Bourgogne en Chenin Blanc profiteren het meest
- Witte wijn heeft minder fenolische buffering — fragiele flessen storten sneller in
- Splash-decanteren voor snelle reductie; langzaam decanteren voor structurele ontwikkeling
',
    '### Opdracht

Open een rijke witte wijn en proef direct en na 30 minuten.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Bij welke fles in jouw assortiment zou jij kiezen voor snel splash-decanteren in plaats van langzaam decanteren — en welk signaal (reductiegeur versus leeftijd) bepaalt die keuze?',
    8,
    3
  ),
  (
    'bewaren-en-rijping',
    'Bewaren & rijping',
    'Na deze les begrijp jij hoe witte wijn correct wordt bewaard en hoe rijping werkt.
',
    'Het bewaarpotentieel van witte wijn wordt bepaald door structurele buffers tegen oxidatie: natuurlijk hoog zuur (Riesling, Chenin Blanc), fenolische buffering uit schilcontact of hout (witte Rhône, oranje-wijntechnieken), en restsuiker of botrytisconcentratie (Sauternes, Trockenbeerenauslese). Elk van die factoren werkt via een ander mechanisme dan bij rode wijn, waar tannine-antocyaan-polymerisatie het rijpingspad domineert.

Tertiaire ontwikkeling bij witte wijn ontstaat via langzame, gecontroleerde oxidatieve en Maillard-achtige reacties: honing, noten, gedroogd fruit, en bij Riesling specifiek petrol (TDN, gevormd uit afbraak van carotenoïden, versterkt door UV en hitte tijdens de rijping in de wijngaard en pas jaren later tot expressie komend in de fles) — een wezenlijk andere biochemische route dan tanninepolymerisatie bij rode wijn.

Sluiting bepaalt mede het rijpingspad: kurk laat een minimale, langzame zuurstofinstroom toe die klassieke oxidatieve ontwikkeling ondersteunt; schroefdop creëert een meer reductieve omgeving die soms een langere ''openingstijd'' vraagt en een ander — soms controversieel — reductiegedreven karakter kan ontwikkelen.

De universele kelderprincipes blijven gelden: 12–14 °C stabiel, donker, trillingsvrij, en een bewuste segmentatie van voorraad naar drinkvenster, zodat je niet per ongeluk een bewaarwijn te vroeg opent of een frisse stijl te lang laat liggen.


## Food pairing

### Beste pairing

Een goed bewaarde, tien jaar oude Riesling met petroltonen bij gerookte paling.

### Waarom dit werkt

De oxidatieve honing- en petrolontwikkeling spiegelt de rokerige, vette intensiteit van de paling.

### Vermijd

Een wijn die warm of met trilling is opgeslagen — vroegtijdige, oncontroleerde oxidatie ondermijnt precies die complexiteit.

## Pro insight

Leg een schroefdopfles nooit automatisch naast de kurkversie van dezelfde wijn in het ''nu drinken''-vak — de reductieve ontwikkeling onder schroefdop kan een andere openingstijd vragen. Segmenteer je voorraad expliciet naar drinkvenster zodat bewaarwijn niet per ongeluk te vroeg wordt geopend.',
    '- zuurbuffering
- TDN-vorming
- kurk versus schroefdop
- oxidatieve rijping
- botrytisconcentratie
',
    'Een goed bewaarde Riesling uit een topjaar kan dertig tot veertig jaar meegaan — langer dan de meeste rode wijnen uit hetzelfde prijssegment, puur dankzij de natuurlijke zuurbuffer van de druif.
',
    '- Zuur, fenolische buffering en restsuiker zijn de drie structurele bewaarfactoren bij wit
- Tertiaire ontwikkeling verloopt via oxidatieve en Maillard-achtige reacties, niet via tannine
- TDN (petroltoon bij Riesling) ontstaat uit carotenoïdafbraak, versterkt door UV en hitte
- Kurk geeft een oxidatief rijpingspad; schroefdop een meer reductief pad
- Stabiele 12–14 °C, duisternis en segmentatie naar drinkvenster blijven universeel
',
    '### Opdracht

Controleer jouw wijnopslag thuis.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welke fles in jouw kelder zit waarschijnlijk in het verkeerde segment — drink nu of lang bewaren — en welke conditie (temperatuur, licht, sluiting) zou je het eerst corrigeren?',
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
    'Het mechanisme achter ''geen rode wijn bij vis'' is chemisch concreet: ijzer uit vis kan reageren met tannine, wat een metaalachtige bijsmaak oplevert, versterkt doordat tannine de perceptie van trimethylamine — de stof achter een ''visachtige'' bijsmaak — verscherpt. Witte wijn mist tannine bijna volledig en vermijdt dat effect structureel, wat de klassieke regel verklaart zonder toevlucht te nemen tot traditie alleen.

De saus stuurt de pairing vaak sterker dan de vissoort zelf. Boter- en roomsauzen (beurre blanc) vragen een licht houtgelagerde, malolactische Chardonnay — de boterachtige diacetyltoon in de wijn resoneert met de saus. Citrus- en kruidenbereidingen vragen juist hoge, onversneden zuren (Sancerre, Albariño) om de frisheid te spiegelen. Rauwe bereidingen (oesters, ceviche) vragen ziltige, hoogzure, minimaal geïntervenieerde wijn — dezelfde ''zuur snijdt door delicatesse en zilt'' logica.

Aziatische en pittige gerechten introduceren een extra mechanisme: bij sushi en sojagedreven umami-gerechten werkt een subtiel halfdroge of laagfenolische witte wijn (Riesling Kabinett, Chenin) om het zout van soja te balanceren zonder bitter te worden. Bij chilirijke gerechten temperen aromatische, licht zoete witte wijnen (Gewürztraminer, Riesling) de brandende pijnperceptie van capsaïcine, omdat suiker en vet dezelfde receptoren dempen die door hitte worden geactiveerd.

Vetgehalte van de vis zelf blijft een structurele as: magere witvis vraagt een lichte, frisse wijn; vette vis (zalm, makreel) kan meer body en zelfs licht houtcontact aan.


## Food pairing

### Beste pairing

Sushi en sashimi bij een halfdroge Riesling Kabinett.

### Waarom dit werkt

Subtiele restzoetheid balanceert het zout van soja en tempert eventuele wasabi-scherpte zonder bitter te worden.

### Vermijd

Een strak droge, hoogzure Sauvignon Blanc bij dezelfde sushi — te veel zuur zonder zoetheidsbuffer laat de sojasmaak hard aanvoelen.

## Pro insight

Vraag bij twijfel altijd eerst naar de saus en het kruidenprofiel vóór je naar de vissoort vraagt — die twee sturen het pairingadvies in de praktijk vaker dan het hoofdingrediënt. Leg het ijzer-tannine-effect in één zin uit aan gasten die vragen waarom ''geen rode wijn bij vis'' geldt.',
    '- ijzer-tannine-effect
- sausgedreven pairing
- capsaïcine-balans
- vetgehalte vis
- zuur-zout-snede
',
    'Het ijzer-tannine-effect is zo meetbaar dat het herhaaldelijk in gecontroleerde smaaktesten is aangetoond: proefpersonen proefden een sterkere metaalachtige bijsmaak zodra tannine en ijzerrijke vis samen werden geproefd, vergeleken met beide apart.
',
    '- Het ijzer-tannine-effect verklaart chemisch waarom witte wijn beter werkt bij vis
- Saus bepaalt vaak sterker dan de vissoort: boter vraagt gehout wit, citrus vraagt onversneden zuur
- Bij Aziatische umami-gerechten balanceert subtiele restzoetheid het zout van soja
- Aromatische, licht zoete witte wijn tempert capsaïcine-hitte bij pittige gerechten
- Vetgehalte van de vis zelf blijft een structurele as: mager = licht, vet = meer body
',
    '### Opdracht

Combineer drie visgerechten met drie witte wijnen.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Bij welk visgerecht op je menu bepaalt de saus — niet de vissoort — jouw uiteindelijke wijnadvies, en waarom?',
    8,
    1
  ),
  (
    'witte-wijn-kaas',
    'Witte wijn & kaas',
    'Na deze les begrijp jij waarom witte wijn vaak beter werkt met kaas dan rood.
',
    'Bij witte wijn en kaas is zuur-vet-snede het dominante mechanisme — anders dan bij rood, waar vet-tannine-binding de sleutel is. Omdat witte wijn nauwelijks tannine bevat, werkt de logica hier vrijwel uitsluitend via zuur dat door vet en romigheid snijdt en het gehemelte verfrist. Dat verklaart waarom veel sommeliers bij kaas vaker wit dan rood adviseren, tegen de populaire aanname ''rode wijn hoort bij kaas'' in.

Categoriegewijs werken: verse geitenkaas vraagt hoogzure Sauvignon Blanc — de klassieke Loire-koppeling met Sancerre en Crottin de Chavignol werkt via zuurmatch in plaats van contrast. Zachte, gerijpte korstkazen (Brie, Camembert) werken vaak beter met licht houtgelagerde Chardonnay, waarbij romigheid in kaas en wijn elkaar versterken. Harde, gerijpte kaas (Comté, oude Gouda) combineert sterk met textuurrijke, oxidatieve Chenin Blanc: umami- en kristaltonen spiegelen notige complexiteit. Blauwe kaas vraagt zoete Riesling of botrytisrijke witte wijn — suiker balanceert zout, vaak succesvoller dan de klassieke Port-pairing bij mildere blauwschimmelstijlen.

De logica is uit te breiden naar vegetarische gerechten in het algemeen: romige gerechten zoals paddenstoelenrisotto of kaasgebaseerde pasta volgen dezelfde zuur-snijdt-door-vet-logica, een bruikbaar, overdraagbaar principe buiten kaas alleen.

Bouw een kaasplank op als een oplopende reeks: begin met de frisste, meest zure witte wijn bij de lichtste kaas en werk toe naar de rondste of zoetste stijl bij de krachtigste kaas — dezelfde logica als een dessertwijnflight.


## Food pairing

### Beste pairing

Verse geitenkaas bij een Sancerre (Sauvignon Blanc).

### Waarom dit werkt

De hoge zuurgraad van beide matcht in intensiteit in plaats van te contrasteren — een zuivere, verfrissende combinatie.

### Vermijd

Een zwaar houtgelagerde, romige Chardonnay bij dezelfde verse geitenkaas — de romigheid overstemt de frisse precisie van de kaas.

## Pro insight

Bouw een kaasplank-wijnkaart op van fris-zuur naar zoet-rond, ongeacht kleur — dat dekt vrijwel elke kaas die je serveert en overtuigt kenners sneller dan een land-van-herkomst-benadering. Durf wit te adviseren bij kaas tegen de populaire ''rood hoort bij kaas''-aanname in, met zuur-vet-snede als argument.',
    '- zuur-vet-snede
- chèvre-Sancerre-match
- botrytis-blauwschimmelbalans
- acid-match versus contrast
- vegetarische transfer
',
    'Uit Franse consumentenonderzoeken blijkt herhaaldelijk dat witte wijn bij een brede kaasplank vaker als ''beter passend'' wordt beoordeeld dan rode wijn — tegen de wijdverspreide aanname in dat kaas en rode wijn een vanzelfsprekend koppel vormen.
',
    '- Zuur-vet-snede is het dominante mechanisme bij wit en kaas — vet-tannine-binding geldt hier niet
- Verse geitenkaas + Sauvignon Blanc werkt via zuurmatch, niet via contrast
- Harde, gerijpte kaas matcht sterk met textuurrijke, oxidatieve Chenin Blanc of Chardonnay
- Blauwe kaas + zoete Riesling balanceert zout via suiker, vaak beter dan rode Port-pairing
- Dezelfde zuur-vet-logica is overdraagbaar naar romige vegetarische gerechten
',
    '### Opdracht

Maak thuis een kleine kaasplank met drie witte wijnen.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Bij welke kaas op jouw plank zou jij een gast bewust naar wit in plaats van rood sturen — en welk mechanisme (zuur, vet, zout) gebruik je om dat advies te onderbouwen?',
    8,
    2
  ),
  (
    'witte-wijn-gevogelte',
    'Witte wijn & gevogelte',
    'Na deze les kun jij witte wijn combineren met gevogelte.
',
    'Gevogelte is qua eiwit zelf grotendeels neutraal en laag in intramusculair vet vergeleken met rood vlees — daardoor stuurt het eigen vlees zelden de wijnkeuze; vrijwel altijd bepalen saus, bereidingswijze en kruiding de match, sterker dan bij rood vlees waar het eigen vet en bindweefsel wél meetellen.

Lichte bereiding (gepocheerde of gegrilde kipfilet) geeft een mager, laagvet gerecht dat vraagt om de eigen zuurstructuur van de wijn voor lift: crisp, licht aromatische witte wijn past hier het best. Rijke bereiding (roomsaus, boter, gebraden kip met jus) vraagt een wijn met vergelijkbare romigheid en textuur — vandaar houtgelagerde of op gist gelagerde witte wijn. Aziatisch of pittig bereide kip (citroengras, gember, chili) roept exact hetzelfde mechanisme op als bij vis: aromatische, licht zoete witte wijn tempert capsaïcine-hitte via suiker en aroma, een principe dat overdraagbaar is tussen eiwitcategorieën.

Diezelfde sausgedreven logica geldt voor vegetarische alternatieven: een romige paddenstoelenrisotto volgt hetzelfde pad als romige kip, en een pittig gegrild groentespies met chiliglaze volgt hetzelfde pad als pittig bereide kip — het is de sausstructuur, niet het eiwit, die de wijnlogica bepaalt.

Krokante huid voegt een extra textuur- en Maillard-dimensie toe: geroosterde, krokante kippenhuid brengt een lichte toastnoot en vetlaag in, wat zelfs een verder lichte bereiding dichter bij een licht houtgelagerde wijn kan brengen dan de saus alleen zou suggereren.


## Food pairing

### Beste pairing

Geroosterde kip met romige champignonsaus bij een licht houtgelagerde Chardonnay.

### Waarom dit werkt

De romigheid van de saus en de gistgedreven textuur van de wijn versterken elkaar zonder te botsen.

### Vermijd

Een strak droge, neutrale Muscadet bij hetzelfde romige gerecht — de wijn voelt dun en verliest tegen de saus.

## Pro insight

Vraag bij gevogeltepairing altijd eerst naar de saus en bereidingswijze vóór je ''kip'' als uitgangspunt neemt — dat voorkomt een generiek advies dat de helft van de keren mis is. Vergeet de krokante huid niet: die Maillard-textuur kan een lichte bereiding dichter bij een gehoute wijn brengen dan de saus alleen zou suggereren.',
    '- sausgedreven pairing
- eiwit-neutraliteit
- Maillard-textuur
- capsaïcine-transfer
- vegetarische analogie
',
    'Kip absorbeert kruiden en sauzen zo neutraal dat sommelierscholen het gerecht soms bewust gebruiken als ''blanco canvas'' om cursisten te trainen in sausgedreven in plaats van eiwitgedreven pairingdenken.
',
    '- Gevogelte is eiwit-neutraal — saus en bereiding bepalen de wijnkeuze vaker dan het vlees
- Licht bereid vraagt wijnzuur voor lift; rijk bereid vraagt vergelijkbare romigheid
- Aziatisch/pittig bereide kip volgt hetzelfde capsaïcine-mechanisme als bij vis
- Dezelfde sausgedreven logica is overdraagbaar naar vegetarische alternatieven
- Krokante, geroosterde huid voegt een Maillard-textuur toe die de wijnkeuze kan verschuiven
',
    '### Opdracht

Bedenk drie wijncombinaties bij kip.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Bij welk gevogeltegerecht op je kaart bepaalt de bereidingswijze — niet het vleestype — jouw uiteindelijke wijnadvies, en waarom?',
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
    'Weinig blindkoppels worden zo vaak verward als Sauvignon Blanc en Riesling, precies omdat beide een vergelijkbare bleke, citroen-groene kleur tonen — visueel dus welbewust weinig onderscheidend. Het onderscheid ontstaat pas in een vaste analyseketen: neus (Sauvignon Blanc toont methoxypyrazines — vooral IBMP — verantwoordelijk voor groene paprika, gras en kruisbes; Riesling toont monoterpenen voor florale, limoenachtige aromatiek en, bij oudere flessen, TDN voor de kenmerkende petroltoon, ontstaan uit carotenoïdafbraak tijdens rijping onder UV en hitte en pas jaren later tot expressie komend) en mond (beide hoogzuur, maar Sauvignon Blanc toont vaak een pittiger, kruidiger intensiteit terwijl Riesling strakker, puurder en mineraler overkomt).

Een specialistische nuance: ''Sauvignon Blanc'' heeft zelf twee chemisch verschillende aromatische drijfveren. Koele Loire-stijlen (Sancerre) worden gedreven door methoxypyrazines (groen, kruidig); warme Nieuwe Wereld-stijlen (Marlborough) worden juist gedreven door vluchtige thiolen (3MH, 4MMP) — een andere stofklasse die passievrucht en de kenmerkende ''kattenpis''-noot geeft. Dat verklaart waarom twee Sauvignon Blancs onderling soms verder uiteen liggen dan een Sauvignon Blanc en een jonge Riesling.

Het klassieke verwarringsrisico werkt in twee richtingen: jonge, koele Riesling kan op Loire Sauvignon lijken door vergelijkbare citrus-groentonen; omgekeerd kan warme Marlborough Sauvignon Blanc door zijn tropische thiolprofiel juist verder van Riesling af staan dan verwacht.

De gouden regel blijft: structuur eerst, label laatst. Fenolische grip in de afdronk (vaker aanwezig bij Sauvignon Blanc, zelden bij Riesling) is vaak het laatste, beslissende signaal wanneer aroma alleen niet overtuigt.


## Food pairing

### Beste pairing

Loire Sauvignon Blanc bij verse geitenkaas, of droge Riesling bij een lichte Aziatische salade.

### Waarom dit werkt

Beide combinaties gebruiken de hoge, precieze zuurgraad van de druif als brug naar respectievelijk zuivelfrisheid en kruidigheid.

### Vermijd

Een zoete, botrytisrijke stijl van beide druiven bij een hartig hoofdgerecht — de restzoetheid botst dan met de zoutigheid.

## Pro insight

Leg na elke blindronde je topfout vast in één zin (''te snel naar druif, te weinig naar fenolische grip'') — dat versnelt leren meer dan tien perfecte proeven zonder reflectie. Onthoud dat ''Sauvignon Blanc'' zelf twee chemisch verschillende drijfveren heeft (methoxypyrazines versus thiolen), dus vergelijk nooit blind zonder de stijlherkomst te benoemen.',
    '- methoxypyrazines
- vluchtige thiolen
- TDN-petroltoon
- regionale stijlverwarring
- structuur-eerst-principe
',
    'De ''kattenpis''-geur die sommige Marlborough Sauvignon Blancs kenmerkt, komt van dezelfde vluchtige thiolen die ook in bepaalde tropische vruchten voorkomen — een stofklasse die pas sinds de jaren negentig goed chemisch is begrepen.
',
    '- Sauvignon Blanc: methoxypyrazines (groen, paprika, kruisbes) of thiolen (tropisch, in warm klimaat)
- Riesling: monoterpenen (floraal, limoen) en TDN (petrol) bij oudere flessen
- ''Sauvignon Blanc'' zelf heeft twee chemisch verschillende aromatische drijfveren
- Klassieke verwarring: koele Riesling versus Loire Sauvignon door vergelijkbare groentonen
- Structuur eerst, label laatst — fenolische grip is vaak het beslissende signaal
',
    '### Opdracht

Proef beide blind naast elkaar.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij je laatste blindproef: welke stap in de keten (visueel, neus of mond) sloeg je onbewust over vóór je naar een conclusie sprong?',
    10,
    1
  ),
  (
    'chardonnay-vs-chenin-blind',
    'Chardonnay vs Chenin Blanc blind',
    'Na deze les kun jij Chardonnay en Chenin Blanc blind onderscheiden.
',
    'Chardonnay is op druifniveau aromatisch vrij neutraal; het karakter dat de meeste mensen als ''Chardonnay'' herkennen — boter, vanille, toast, ronde textuur — ontstaat overwegend door wijnmaakkeuzes: houtlagering en malolactische gisting (die diacetyl produceert, de stof achter de boterachtige toon) en gistcontact via bâtonnage voor romige textuur. ''Chardonnaysmaak'' is dus grotendeels een winemaking-signatuur, geen pure varietale eigenschap.

Chenin Blanc daarentegen behoudt van nature hoge zuren, zelfs bij volledige rijpheid — een structurele, druifgedreven eigenschap, geen wijnmaakkeuze. Die eigenschap verklaart waarom Chenin functioneert over een ongeëvenaard stijlbereik: kurkdroog, halfzoet, volledig zoet en botrytisrijk (Vouvray, Quarts de Chaume) én mousserend (Crémant de Loire) — met behoud van diezelfde zuurruggengraat als sleutel, ongeacht stijl.

Verwarringsrisico: houtgelagerde Zuid-Afrikaanse Chenin kan vanille- en toasttonen krijgen die de winemaking-signatuur van Chardonnay imiteren, terwijl ongehoute, oude Chablis het neutrale appel-citrusbasisprofiel van de druif zonder boter toont. Dat betekent dat winemaking-signalen alleen kunnen misleiden — specialisten wegen daarom altijd de zuurstructuur zwaarder dan aroma alleen, omdat Chenin''s natuurlijke zuurretentie zich technisch niet laat nabootsen.

Sleutelvolgorde bij blindproeven: proef eerst de zuurstructuur, interpreteer pas daarna de winemaking-signalen (hout, boter, room) — niet andersom.


## Food pairing

### Beste pairing

Houtgelagerde Chardonnay bij kreeft met botersaus, of droge Chenin Blanc bij een quiche met geitenkaas.

### Waarom dit werkt

Chardonnay''s romige textuur spiegelt de botersaus; Chenin''s zuurruggengraat snijdt door de romige quiche-vulling.

### Vermijd

Een zoete, botrytisrijke Chenin bij een hartig hoofdgerecht — de restzoetheid botst dan met zoute smaken.

## Pro insight

Bij blindproef twijfel: vertrouw eerst op de zuurstructuur, niet op boter- of houttonen — die kunnen bij beide druiven aanwezig zijn door winemaking-keuzes. Gebruik een houtgelagerde Zuid-Afrikaanse Chenin bewust als lastig trainingsvoorbeeld voor je team, juist omdat die de Chardonnay-signatuur het dichtst benadert.',
    '- diacetyl
- malolactische signatuur
- natuurlijke zuurretentie
- stijlbereik Chenin
- winemaking- versus varietaal-signaal
',
    'Sommige Zuid-Afrikaanse wijnmakers gebruiken bewust oud, neutraal hout bij Chenin Blanc om precies de textuur van Chardonnay te benaderen zonder de herkenbare vanilletonen van nieuw hout toe te voegen — een technische imitatie die blindproevers bewust op het verkeerde been zet.
',
    '- ''Chardonnaysmaak'' (boter, vanille, toast) is grotendeels een winemaking-signatuur
- Chenin Blanc behoudt van nature hoge zuren, ongeacht rijpheid of stijl
- Chenin''s stijlbereik (droog tot botrytisrijk tot mousserend) is ongeëvenaard
- Houtgelagerde Chenin kan Chardonnay imiteren — winemaking-signalen kunnen misleiden
- Proef zuurstructuur eerst, interpreteer winemaking-signalen (hout, boter) pas daarna
',
    '### Opdracht

Proef beide blind naast elkaar.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Wat vond jij moeilijker: winemaking-signalen negeren of zuurstructuur isoleren — en welk glas zou je nogmaals willen proeven om zeker te worden?',
    10,
    2
  ),
  (
    'white-final-exam',
    'Theorie- en praktijkexamen',
    'Na deze les toon jij aan dat je de White Wine Track beheerst op Master-niveau.
',
    'Dit is het moment waarop veertig lessen samenkomen tot één beslissing: kun jij, onder tijdsdruk en zonder etiket, een witte wijn plaatsen én je advies verdedigen? Dit Master-examen integreert de volledige White Wine Track — fundament, productie, proeftechniek, frisse en rijke druivenrassen, aromatische druiven, service, pairing en blindanalyse. Het productieproces — direct press versus schilcontact, keuze voor wel of geen malolactische gisting — legt de basis voor drie druivenfamilies die elk een ander mechanisme centraal stellen: frisse druiven (Sauvignon Blanc, Albariño, Grüner Veltliner, Verdejo) drijven op primair fruit en hoge zuren; rijke druiven (Chardonnay, Viognier, Marsanne, Roussanne, Semillon) drijven grotendeels op winemaking-textuur; aromatische druiven (Gewürztraminer, Muscat, Torrontés, Pinot Gris, Vermentino) drijven op terpeenchemie en regionale synonymie.

Service bouwt daarop voort: temperatuur stuurt zowel aromavolatiliteit als lees-textuurperceptie, glasvorm richt terpenen naar de neus of geeft textuur ruimte, decanteren lost bij witte wijn vaker reductie op dan sedimentscheiding, en bewaren verloopt via zuur- en fenolbuffering in plaats van tanninepolymerisatie. Pairing bouwt op onderliggende mechanismen — het ijzer-tannine-effect verklaart waarom wit beter werkt bij vis, zuur-vet-snede verklaart het succes bij kaas, en sausgedreven logica verklaart pairing bij gevogelte en de overdraagbaarheid naar Aziatische en vegetarische gerechten.

Blindanalyse integreert dat allemaal in één systematische keten: visueel, neus (primair, secundair, tertiair — met specifieke chemische markers als methoxypyrazines, thiolen, TDN en diacetyl als objectief bewijs in plaats van gokwerk), mond, en pas dan een onderbouwde hypothese. Sauvignon Blanc versus Riesling en Chardonnay versus Chenin Blanc tonen beide dat structuur — fenolische grip, zuurretentie — betrouwbaarder is dan aroma alleen.

Succesvolle examenkandidaten vermijden drie terugkerende fouten: te snel naar een druifconclusie springen vóór de structuuranalyse compleet is, verkeerde temperatuur- of glasaannames bij servicevragen, en pairingadvies dat traditie citeert zonder het onderliggende mechanisme te benoemen. Dit examen beloont expliciete argumentatie boven geraden antwoorden, op elk van de drie examenonderdelen.


## Food pairing

### Beste pairing

Examenonderdeel pairing: kies per gerecht een witte wijnstijl op basis van zuur, vet, capsaïcine en sausstructuur.

### Waarom dit werkt

Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.

### Vermijd

Eén wijnstijl voor alle examengerechten zonder onderbouwing per mechanisme.

## Pro insight

Lees examenvragen als servicecases: wat zou je schenken vrijdagavond om 20:00 bij deze gast en dit gerecht — en waarom precies dat mechanisme, niet die traditie? Documenteer na het examen je zwakste onderdeel in één zin; dat wordt meteen je persoonlijke trainingsplan voor de volgende track.',
    '- examenintegratie
- systematische deductie
- servicebewustzijn
- pairingmechanismen
- certificering
',
    'De term ''Master Foundation'' in deze certificering wijst bewust op een fundament, niet op een eindpunt — professionele wijnexamens zoals WSET en Court of Master Sommeliers bouwen decennia aan kennis juist voort op dezelfde structuur-eerst-methodiek die je in dit examen hebt toegepast.
',
    '- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)
- Productie en druivenfamilies (fris, rijk, aromatisch) vormen het fundament van elke analyse
- Service en pairing bouwen op mechanismen (temperatuur, zuur-vet-snede, ijzer-tannine-effect)
- Blindanalyse vraagt structuur eerst — chemische markers boven gokwerk
- Veelvoorkomende fouten: haast, verkeerde temperatuuraannames, traditie zonder mechanisme
',
    '### Examenonderdeel 1 — Theorie (20 vragen)

Beantwoord de volledige meerkeuzequiz van twintig vragen zonder hulpmiddelen. Minimaal 70% (14 van de 20) is vereist om te slagen.

### Examenonderdeel 2 — Blindproeven (2 glazen)

Analyseer twee witte wijnen — bij voorkeur één frisse en één aromatische stijl — volgens het vaste protocol:

- kleur en intensiteit
- geur (primair, secundair, tertiair)
- zuur, body en lengte
- vermoedelijk druivenras, met minstens drie argumenten
- serviceadvies (temperatuur, glas, decanteren)

### Examenonderdeel 3 — Pairing (3 gerechten)

Koppel een onderbouwde witte wijnstijl aan elk van de volgende gerechten:

1. Oesters met citroen
2. Romige kip in botersaus
3. Pittig Aziatisch gerecht met chili en gember

Motiveer elke keuze via het onderliggende mechanisme (zuur, vet, capsaïcine, sausstructuur) — niet via traditie alleen.

### Beoordeling

- 18–20 goed + correcte blindanalyse = Master Distinction
- 15–17 goed = Master Pass
- 12–14 goed = Conditional Pass — herhaal de zwakste module
- Minder dan 12 goed = Retry

Bij slagen ontvang je de certificering **Way of Tasting Academy — White Wine Certified (Master Foundation)**.

### Checklist

- Ik heb alle drie examenonderdelen volledig afgerond
- Ik documenteerde mijn blindhypotheses vóór de onthulling
- Ik motiveerde elk pairing via zuur, vet of capsaïcine
- Ik noteerde mijn score en zwakste onderdeel
- Ik kan mijn keuzes mondeling verdedigen


### Reflectievraag

Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste schakel, en welke ene wekelijkse routine zou dat het snelst verbeteren?',
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
  ('productie-white-wine', 'direct-press', 2, 'Wat blijft beter behouden?', '["Tannine", "Aroma''s", "Bitterheid", "Alcohol"]', 1, 'Correct: Aroma''s'),
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
  ('proeven-white-wine', 'hoe-proef-je-witte-wijn', 3, 'Wat zoek je bij ruiken?', '["Structuur", "Aroma''s", "Tannine", "Koolzuur"]', 1, 'Correct: Aroma''s'),
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
  ('proeven-white-wine', 'aromas-herkennen', 5, 'Je ruikt een oudere witte wijn met een duidelijke petrolgeur naast citrus. Welke druif en welk aromatype past hier het beste bij?', '["Jonge Sauvignon Blanc, primair aroma", "Gerijpte Riesling, tertiair aroma", "Houtgelagerde Chardonnay, secundair aroma", "Jonge Verdejo, primair aroma"]', 1, 'Correct: Gerijpte Riesling, tertiair aroma'),
  ('proeven-white-wine', 'zuur-herkennen', 1, 'Wat geeft zuur?', '["Frisheid", "Bitter", "Zoet", "Tannine"]', 0, 'Correct: Frisheid'),
  ('proeven-white-wine', 'zuur-herkennen', 2, 'Hoe herken je zuur?', '["Speekselvorming", "Warmte", "Bitterheid", "Zout"]', 0, 'Correct: Speekselvorming'),
  ('proeven-white-wine', 'zuur-herkennen', 3, 'Welke druif heeft vaak hoge zuren?', '["Riesling", "Viognier", "Marsanne", "Semillon"]', 0, 'Correct: Riesling'),
  ('proeven-white-wine', 'zuur-herkennen', 4, 'Waarom helpt zuur bij rijping?', '["Stabiliteit", "Meer kleur", "Minder aroma", "Meer alcohol"]', 0, 'Correct: Stabiliteit'),
  ('proeven-white-wine', 'zuur-herkennen', 5, 'Een witte wijn heeft een opvallend ronde, zachte zuurindruk zonder scherpe randjes, terwijl het label een koel klimaat vermeldt. Wat is de meest logische verklaring?', '["Extreem lage rendementen", "Volledige malolactische gisting", "Vroege oogst", "Langdurige koude gisting"]', 1, 'Correct: Volledige malolactische gisting'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 1, 'Een witte wijn wordt direct na de oogst geperst, waarbij het sap vrijwel meteen van de schillen wordt gescheiden. Welk structuurelement wordt hierdoor het minst beïnvloed door de druif zelf?', '["Zuur", "Tannine", "Aroma", "Alcohol"]', 1, 'Correct: Tannine'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 2, 'Je proeft een bleekgele wijn met een lichte groene gloed, hoog zuur en weinig geur van boter of toast. Welke hypothese past het beste?', '["Warm klimaat, veel houtcontact, uitgebreide MLF", "Koel klimaat, weinig productie-invloed, primair fruit dominant", "Warm klimaat, geen MLF, oxidatieve stijl", "Koel klimaat, volledige MLF, houtrijping"]', 1, 'Correct: Koel klimaat, weinig productie-invloed, primair fruit dominant'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 3, 'Je ruikt brooddeeg, boter en een lichte vanilletoon naast rijp appelfruit. Welke twee lagen proef je hier samen?', '["Primair en tertiair", "Primair en secundair", "Secundair en tertiair", "Alleen tertiair"]', 1, 'Correct: Primair en secundair'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 4, 'Een wijnmaker past volledige malolactische gisting toe op een Chardonnay. Wat is het meest directe effect op de zuurstructuur?', '["Wijnsteenzuur verdwijnt volledig", "Appelzuur wordt omgezet in zachter melkzuur", "Het totale zuurgehalte stijgt sterk", "Alle zuren verdampen tijdens gisting"]', 1, 'Correct: Appelzuur wordt omgezet in zachter melkzuur'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 5, 'Je proeft een oudere witte wijn met een duidelijke petrolgeur naast limoen. In welke laag hoort deze petrolgeur, en welke druif past hier het meest voor de hand liggend bij?', '["Primair aroma, Sauvignon Blanc", "Tertiair aroma, Riesling", "Secundair aroma, Chardonnay", "Primair aroma, Verdejo"]', 1, 'Correct: Tertiair aroma, Riesling'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 6, 'Wat is de juiste volgorde van het blinde witte-wijnprotocol?', '["Aroma, kleur, structuur, hypothese", "Structuur, aroma, kleur, hypothese", "Kleur, aroma, structuur, hypothese", "Hypothese, kleur, aroma, structuur"]', 2, 'Correct: Kleur, aroma, structuur, hypothese'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 7, 'Hoe herken je zuur het meest objectief in de mond?', '["Warmte achterin de keel", "Speekselopwekking aan de zijkanten van de tong", "Droogte op het tandvlees", "Een zoete nasmaak"]', 1, 'Correct: Speekselopwekking aan de zijkanten van de tong'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 8, 'Twee wijnen van dezelfde druif verschillen sterk in zuurniveau: de ene komt uit een koel klimaat, de andere uit een warm klimaat met late oogst. Wat verklaar je hier als eerste?', '["Verschil in glaswerk", "Verschil in klimaat en oogstmoment", "Verschil in flesvorm", "Verschil in kurktype"]', 1, 'Correct: Verschil in klimaat en oogstmoment'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 9, 'Een wijn ruikt overwegend naar boter en toast, met weinig direct herkenbaar fruit. Wat is de meest waarschijnlijke verklaring, los van de druif zelf?', '["Zeer koude fermentatie zonder lees-contact", "Uitgebreid lees-contact en/of houtrijping", "Extreem hoog zuurniveau", "Volledige afwezigheid van gisting"]', 1, 'Correct: Uitgebreid lees-contact en/of houtrijping'),
  ('proeven-white-wine', 'mini-toets-witte-wijn', 10, 'Blind: bleekgeel met groene rand, intense citrus- en kruidenaroma, hoog zuur, licht van lichaam, geen boter of toast. Welke combinatie van hypotheses past het beste?', '["Warm klimaat, uitgebreide MLF, lange houtlagering", "Koel klimaat, geen MLF, geen houtcontact", "Warm klimaat, geen MLF, korte flesrijping", "Koel klimaat, volledige MLF, lange houtlagering"]', 1, 'Correct: Koel klimaat, geen MLF, geen houtcontact'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 1, 'Typisch aroma?', '["Vanille", "Gras", "Karamel", "Noten"]', 1, 'Correct: Gras'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 2, 'Zuurgehalte?', '["Laag", "Hoog", "Middel", "Geen"]', 1, 'Correct: Hoog'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 3, 'Bekende regio?', '["Rioja", "Marlborough", "Porto", "Douro"]', 1, 'Correct: Marlborough'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 4, 'Warme klimaatzone geeft vaak:', '["Meer tropisch fruit", "Minder fruit", "Meer tannine", "Minder zuur"]', 0, 'Correct: Meer tropisch fruit'),
  ('frisse-druiven-white-wine', 'sauvignon-blanc', 5, 'Sauvignon Blanc is vaak:', '["Gastronomisch sterk", "Alleen dessert", "Altijd houtgelagerd", "Zoet"]', 0, 'Correct: Gastronomisch sterk'),
  ('frisse-druiven-white-wine', 'riesling', 1, 'Welke eigenschap hoort typisch bij Riesling?', '["Hoge zuren", "Hoge tannines", "Lage aroma''s", "Hoog bitter"]', 0, 'Correct: Hoge zuren'),
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
  ('frisse-druiven-white-wine', 'gruner-veltliner', 5, 'Een witte wijn combineert hoog zuur, groene appel en een duidelijke pepertoon in de afdronk. Welke druif past het beste, en waarop baseer je dat?', '["Riesling, vanwege de hoge zuurgraad", "Grüner Veltliner, vanwege de pepertoon", "Sauvignon Blanc, vanwege de groene appel", "Albariño, vanwege de ziltigheid"]', 1, 'Correct: Grüner Veltliner, vanwege de pepertoon'),
  ('frisse-druiven-white-wine', 'verdejo', 1, 'Waar komt Verdejo vooral vandaan?', '["Rueda", "Rioja", "Douro", "Loire"]', 0, 'Correct: Rueda'),
  ('frisse-druiven-white-wine', 'verdejo', 2, 'Typisch aroma?', '["Venkel", "Boter", "Petrol", "Karamel"]', 0, 'Correct: Venkel'),
  ('frisse-druiven-white-wine', 'verdejo', 3, 'Typisch mondgevoel?', '["Licht bitter", "Zoet", "Zwaar tanninerijk", "Mousserend"]', 0, 'Correct: Licht bitter'),
  ('frisse-druiven-white-wine', 'verdejo', 4, 'Verdejo wordt vaak:', '["Jong gedronken", "20 jaar gerijpt", "Versterkt", "Oxidatief bewaard"]', 0, 'Correct: Jong gedronken'),
  ('frisse-druiven-white-wine', 'verdejo', 5, 'Je proeft een droge witte wijn met citrus, venkel en een lichte amandelbitterheid in de afdronk, minder aromatisch explosief dan een klassieke Marlborough-stijl. Welke druif ligt het meest voor de hand?', '["Sauvignon Blanc", "Verdejo", "Riesling", "Grüner Veltliner"]', 1, 'Correct: Verdejo'),
  ('rijke-druiven-white-wine', 'chardonnay', 1, 'Welke druif is het meest veelzijdig?', '["Chardonnay", "Riesling", "Verdejo", "Muscat"]', 0, 'Correct: Chardonnay'),
  ('rijke-druiven-white-wine', 'chardonnay', 2, 'Wat geeft MLF vaak?', '["Boter", "Petrol", "Zout", "Tannine"]', 0, 'Correct: Boter'),
  ('rijke-druiven-white-wine', 'chardonnay', 3, 'Welke regio is beroemd?', '["Bourgogne", "Douro", "Porto", "Mosel"]', 0, 'Correct: Bourgogne'),
  ('rijke-druiven-white-wine', 'chardonnay', 4, 'Chablis is:', '["Chardonnay", "Riesling", "Chenin", "Viognier"]', 0, 'Correct: Chardonnay'),
  ('rijke-druiven-white-wine', 'chardonnay', 5, 'Warm klimaat geeft vaker:', '["Tropisch fruit", "Meer zuur", "Minder body", "Minder aroma"]', 0, 'Correct: Tropisch fruit'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 1, 'Welke eigenschap hoort sterk bij Chenin Blanc?', '["Hoge zuren", "Hoge tannines", "Lage aroma''s", "Geen bewaarpotentieel"]', 0, 'Correct: Hoge zuren'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 2, 'Welke regio is beroemd voor Chenin Blanc?', '["Vouvray", "Rioja", "Mosel", "Porto"]', 0, 'Correct: Vouvray'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 3, 'Welke stijl kan Chenin zijn?', '["Alleen droog", "Alleen zoet", "Veel stijlen", "Alleen mousserend"]', 2, 'Correct: Veel stijlen'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 4, 'Welke aroma''s komen vaak voor?', '["Honing en appel", "Gras en paprika", "Vanille en chocolade", "Koffie en leer"]', 0, 'Correct: Honing en appel'),
  ('rijke-druiven-white-wine', 'chenin-blanc', 5, 'Waarom rijpt Chenin goed?', '["Hoge zuren", "Lage zuren", "Veel tannines", "Lage alcohol"]', 0, 'Correct: Hoge zuren'),
  ('rijke-druiven-white-wine', 'viognier', 1, 'Welke aroma''s zijn typisch voor Viognier?', '["Abrikoos en bloemen", "Gras en limoen", "Petrol en appel", "Chocolade en koffie"]', 0, 'Correct: Abrikoos en bloemen'),
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
  ('rijke-druiven-white-wine', 'marsanne-roussanne', 5, 'Een witte wijn heeft volle body, laag zuur, stone fruit en amandeltonen, maar mist de uitgesproken florale abrikooservaring die je bij een andere Rhône-druif zou verwachten. Welke druif(en) past/passen het beste?', '["Viognier", "Marsanne en/of Roussanne", "Chenin Blanc", "Riesling"]', 1, 'Correct: Marsanne en/of Roussanne'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 1, 'Typisch aroma?', '["Lychee", "Petrol", "Gras", "Boter"]', 0, 'Correct: Lychee'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 2, 'Zuurgehalte?', '["Hoog", "Middel", "Laag", "Geen"]', 2, 'Correct: Laag'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 3, 'Belangrijke regio?', '["Alsace", "Douro", "Porto", "Rioja"]', 0, 'Correct: Alsace'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 4, 'Gewürz betekent:', '["Zoet", "Kruidig", "Hout", "Rijk"]', 1, 'Correct: Kruidig'),
  ('aromatische-druiven-white-wine', 'gewurztraminer', 5, 'Wat verklaart de extreme aromatische intensiteit van Gewürztraminer het beste?', '["Een zeer hoge concentratie terpenen zoals linalool en geraniol", "Lange malolactische gisting", "Uitgebreide houtlagering", "Een zeer hoog alcoholpercentage"]', 0, 'Correct: Een zeer hoge concentratie terpenen zoals linalool en geraniol'),
  ('aromatische-druiven-white-wine', 'muscat', 1, 'Wat maakt Muscat uniek?', '["Het ruikt vaak letterlijk naar druiven", "Het heeft veel tannines", "Het is altijd droog", "Het is altijd houtgelagerd"]', 0, 'Correct: Het ruikt vaak letterlijk naar druiven'),
  ('aromatische-druiven-white-wine', 'muscat', 2, 'Welke stijl kan Muscat zijn?', '["Alleen droog", "Alleen zoet", "Veel stijlen", "Alleen mousserend"]', 2, 'Correct: Veel stijlen'),
  ('aromatische-druiven-white-wine', 'muscat', 3, 'Welke wijn is een bekende Muscat?', '["Moscato d''Asti", "Chablis", "Tawny Port", "Sancerre"]', 0, 'Correct: Moscato d''Asti'),
  ('aromatische-druiven-white-wine', 'muscat', 4, 'Welke aroma''s zijn typisch?', '["Sinaasappelbloesem en perzik", "Gras en kruisbes", "Vanille en boter", "Chocolade en koffie"]', 0, 'Correct: Sinaasappelbloesem en perzik'),
  ('aromatische-druiven-white-wine', 'muscat', 5, 'Welke Muscat-variant wordt vooral gebruikt in zoete en versterkte stijlen?', '["Muscat Blanc à Petits Grains", "Muscat of Alexandria", "Muscat Ottonel", "Muscat Canelli"]', 1, 'Correct: Muscat of Alexandria'),
  ('aromatische-druiven-white-wine', 'torrontes', 1, 'Waar komt Torrontés vooral vandaan?', '["Argentinië", "Frankrijk", "Portugal", "Duitsland"]', 0, 'Correct: Argentinië'),
  ('aromatische-druiven-white-wine', 'torrontes', 2, 'Welke regio is beroemd?', '["Salta", "Rioja", "Douro", "Mosel"]', 0, 'Correct: Salta'),
  ('aromatische-druiven-white-wine', 'torrontes', 3, 'Wat is typisch voor Torrontés?', '["Geur rijker dan smaak", "Meer tannine dan aroma", "Altijd houtgelagerd", "Altijd zoet"]', 0, 'Correct: Geur rijker dan smaak'),
  ('aromatische-druiven-white-wine', 'torrontes', 4, 'Welke aroma''s zijn vaak aanwezig?', '["Bloemen en citrus", "Boter en toast", "Koffie en cacao", "Leer en tabak"]', 0, 'Correct: Bloemen en citrus'),
  ('aromatische-druiven-white-wine', 'torrontes', 5, 'Waarom is de geur van Torrontés vaak intenser dan de smaak?', '["Orthonasale waarneming registreert terpenen sterker dan retronasale waarneming", "Door fortificatie tijdens productie", "Door langdurige houtlagering", "Door een zeer lage serveertemperatuur"]', 0, 'Correct: Orthonasale waarneming registreert terpenen sterker dan retronasale waarneming'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 1, 'Zijn Pinot Gris en Pinot Grigio dezelfde druif?', '["Ja", "Nee", "Alleen deels", "Alleen in Italië"]', 0, 'Correct: Ja'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 2, 'Waar is Pinot Gris vaak rijker?', '["Alsace", "Veneto", "Rueda", "Mosel"]', 0, 'Correct: Alsace'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 3, 'Typisch aroma?', '["Peer", "Gras", "Petrol", "Karamel"]', 0, 'Correct: Peer'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 4, 'Italiaanse stijl is vaak:', '["Lichter", "Zwaarder", "Zoeter", "Versterkt"]', 0, 'Correct: Lichter'),
  ('aromatische-druiven-white-wine', 'pinot-gris', 5, 'Waar komt het rijkere karakter van Alsace Pinot Gris vooral vandaan?', '["Langere schilmaceratie en gist- of vatlagering", "Een hogere terpeenconcentratie dan Gewürztraminer", "Uitsluitend hoge suikerrijping", "Fortificatie tijdens de gisting"]', 0, 'Correct: Langere schilmaceratie en gist- of vatlagering'),
  ('aromatische-druiven-white-wine', 'vermentino', 1, 'Waar komt Vermentino veel voor?', '["Sardinië", "Mosel", "Douro", "Rioja"]', 0, 'Correct: Sardinië'),
  ('aromatische-druiven-white-wine', 'vermentino', 2, 'Typisch aroma?', '["Citrus", "Boter", "Petrol", "Chocolade"]', 0, 'Correct: Citrus'),
  ('aromatische-druiven-white-wine', 'vermentino', 3, 'Vermentino is vaak:', '["Zilt", "Zoet", "Tanninerijk", "Versterkt"]', 0, 'Correct: Zilt'),
  ('aromatische-druiven-white-wine', 'vermentino', 4, 'Hoe heet Vermentino in Zuid-Frankrijk?', '["Rolle", "Verdejo", "Glera", "Arinto"]', 0, 'Correct: Rolle'),
  ('aromatische-druiven-white-wine', 'vermentino', 5, 'Welke Piemontese naam is DNA-bevestigd identiek aan Vermentino?', '["Favorita", "Arneis", "Cortese", "Erbaluce"]', 0, 'Correct: Favorita'),
  ('service-white-wine', 'serveertemperatuur', 1, 'Te koud betekent vaak:', '["Meer aroma", "Minder aroma", "Meer body", "Meer alcohol"]', 1, 'Correct: Minder aroma'),
  ('service-white-wine', 'serveertemperatuur', 2, 'Sauvignon Blanc serveer je meestal:', '["6–9 °C", "14–16 °C", "18 °C", "22 °C"]', 0, 'Correct: 6–9 °C'),
  ('service-white-wine', 'serveertemperatuur', 3, 'Houtgelagerde Chardonnay?', '["5 °C", "7 °C", "10–13 °C", "20 °C"]', 2, 'Correct: 10–13 °C'),
  ('service-white-wine', 'serveertemperatuur', 4, 'Te warm geeft vaak:', '["Meer frisheid", "Meer alcoholgevoel", "Minder geur", "Minder smaak"]', 1, 'Correct: Meer alcoholgevoel'),
  ('service-white-wine', 'serveertemperatuur', 5, 'Waarom wordt top-Bourgogne soms bewust warmer geserveerd dan de standaardrichtlijn?', '["Omdat lees- en houttextuur temperatuurgevoelig is en meer warmte nodig heeft om zich te openen", "Omdat warmere wijn goedkoper oogt", "Omdat het zuur daardoor verdwijnt", "Omdat het verplicht is bij elk keurmerk"]', 0, 'Correct: Omdat lees- en houttextuur temperatuurgevoelig is en meer warmte nodig heeft om zich te openen'),
  ('service-white-wine', 'glaswerk', 1, 'Wat beïnvloedt glaswerk sterk?', '["Alleen kleur", "Aroma''s", "Alleen alcohol", "Alleen prijs"]', 1, 'Correct: Aroma''s'),
  ('service-white-wine', 'glaswerk', 2, 'Een smaller glas helpt vaak bij:', '["Meer zuurstof", "Meer frisheid behouden", "Meer warmte", "Minder aroma"]', 1, 'Correct: Meer frisheid behouden'),
  ('service-white-wine', 'glaswerk', 3, 'Een breder glas helpt vaak bij:', '["Complexe aroma''s openen", "Minder geur", "Minder body", "Minder zuur"]', 0, 'Correct: Complexe aroma''s openen'),
  ('service-white-wine', 'glaswerk', 4, 'Welke wijn krijgt vaak een breder glas?', '["Chardonnay", "Sauvignon Blanc", "Albariño", "Verdejo"]', 0, 'Correct: Chardonnay'),
  ('service-white-wine', 'glaswerk', 5, 'Waarom dempt detergent-residu vooral aromatische witte wijnen zoals Gewürztraminer sterk?', '["Omdat hun aantrekkingskracht bijna volledig op delicate topnoten steunt", "Omdat het de kleur van de wijn verandert", "Omdat het de temperatuur verlaagt", "Omdat het alleen mousserende wijn beïnvloedt"]', 0, 'Correct: Omdat hun aantrekkingskracht bijna volledig op delicate topnoten steunt'),
  ('service-white-wine', 'decanteren', 1, 'Is decanteren alleen voor rode wijn?', '["Ja", "Nee", "Alleen oude wijn", "Alleen jonge wijn"]', 1, 'Correct: Nee'),
  ('service-white-wine', 'decanteren', 2, 'Waarom decanteer je witte wijn soms?', '["Meer kleur", "Om reductie te openen", "Minder zuur", "Meer suiker"]', 1, 'Correct: Om reductie te openen'),
  ('service-white-wine', 'decanteren', 3, 'Welke wijn profiteert vaak?', '["Oude Riesling", "Jonge Verdejo", "Jonge Pinot Grigio", "Moscato"]', 0, 'Correct: Oude Riesling'),
  ('service-white-wine', 'decanteren', 4, 'Wat doet zuurstof?', '["Opent aroma''s", "Verlaagt alcohol", "Verhoogt suiker", "Verhoogt tannine"]', 0, 'Correct: Opent aroma''s'),
  ('service-white-wine', 'decanteren', 5, 'Waarom verdwijnt reductiegeur meestal snel na kort zwenken, in tegenstelling tot een echt wijngebrek?', '["Omdat vluchtige zwavelverbindingen verdampen bij contact met lucht", "Omdat zwenken de temperatuur verlaagt", "Omdat zwenken het alcoholpercentage verandert", "Omdat een echt gebrek altijd binnen een minuut verdwijnt"]', 0, 'Correct: Omdat vluchtige zwavelverbindingen verdampen bij contact met lucht'),
  ('service-white-wine', 'bewaren-en-rijping', 1, 'Wat helpt rijping?', '["Zuur", "Lage alcohol", "Lage kleur", "Bitterheid"]', 0, 'Correct: Zuur'),
  ('service-white-wine', 'bewaren-en-rijping', 2, 'Ideale temperatuur?', '["25 °C", "18 °C", "10–14 °C", "2 °C"]', 2, 'Correct: 10–14 °C'),
  ('service-white-wine', 'bewaren-en-rijping', 3, 'Wat is slecht?', '["Donker", "Trillingsvrij", "Zonlicht", "Constante temperatuur"]', 2, 'Correct: Zonlicht'),
  ('service-white-wine', 'bewaren-en-rijping', 4, 'Welke druif rijpt goed?', '["Riesling", "Airén", "Trebbiano", "Pinot Grigio"]', 0, 'Correct: Riesling'),
  ('service-white-wine', 'bewaren-en-rijping', 5, 'Wat verklaart de petroltoon (TDN) in oude Riesling het beste?', '["Afbraak van carotenoïden, versterkt door UV en hitte tijdens de rijping", "Contact met een schroefdop tijdens opslag", "Malolactische gisting", "Een te hoge serveertemperatuur"]', 0, 'Correct: Afbraak van carotenoïden, versterkt door UV en hitte tijdens de rijping'),
  ('pairing-white-wine', 'witte-wijn-vis', 1, 'Waarom werkt witte wijn goed?', '["Hoge tannine", "Hoge zuren", "Hoge bitterheid", "Hoge suiker"]', 1, 'Correct: Hoge zuren'),
  ('pairing-white-wine', 'witte-wijn-vis', 2, 'Wat past bij zalm?', '["Riesling", "Chardonnay", "Muscat", "Port"]', 1, 'Correct: Chardonnay'),
  ('pairing-white-wine', 'witte-wijn-vis', 3, 'Wat past bij oesters?', '["Albariño", "Viognier", "Semillon", "Marsanne"]', 0, 'Correct: Albariño'),
  ('pairing-white-wine', 'witte-wijn-vis', 4, 'Wat is belangrijk?', '["Intensiteit matchen", "Alcohol verhogen", "Meer bitter", "Minder aroma"]', 0, 'Correct: Intensiteit matchen'),
  ('pairing-white-wine', 'witte-wijn-vis', 5, 'Waarom temperen aromatische, licht zoete witte wijnen de scherpte van pittige gerechten?', '["Suiker en vet dempen dezelfde receptoren die door capsaïcine worden geactiveerd", "Omdat chili geen effect heeft op witte wijn", "Omdat alcohol de scherpte volledig neutraliseert", "Omdat lage zuren altijd scherpte verminderen"]', 0, 'Correct: Suiker en vet dempen dezelfde receptoren die door capsaïcine worden geactiveerd'),
  ('pairing-white-wine', 'witte-wijn-kaas', 1, 'Waarom werkt witte wijn vaak goed met kaas?', '["Door hoge tannines", "Door zuren", "Door bitterheid", "Door koolzuur"]', 1, 'Correct: Door zuren'),
  ('pairing-white-wine', 'witte-wijn-kaas', 2, 'Wat doen zuren bij vet?', '["Verzwaren", "Snijden erdoorheen", "Maken zoeter", "Verlagen aroma"]', 1, 'Correct: Snijden erdoorheen'),
  ('pairing-white-wine', 'witte-wijn-kaas', 3, 'Welke wijn past goed bij geitenkaas?', '["Sauvignon Blanc", "Viognier", "Port", "Syrah"]', 0, 'Correct: Sauvignon Blanc'),
  ('pairing-white-wine', 'witte-wijn-kaas', 4, 'Welke combinatie is logisch?', '["Brie + Chardonnay", "Brie + Riesling droog", "Brie + Port", "Brie + Tawny"]', 0, 'Correct: Brie + Chardonnay'),
  ('pairing-white-wine', 'witte-wijn-kaas', 5, 'Waarom werkt zuur-vet-snede sterker dan vet-tannine-binding bij witte wijn en kaas?', '["Omdat witte wijn nauwelijks tannine bevat", "Omdat witte wijn altijd zoeter is dan rode wijn", "Omdat kaas geen vet bevat", "Omdat tannine het zout in kaas verhoogt"]', 0, 'Correct: Omdat witte wijn nauwelijks tannine bevat'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 1, 'Wat bepaalt vaak de pairing?', '["Bord", "Saus", "Glas", "Temperatuur"]', 1, 'Correct: Saus'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 2, 'Lichte kip past goed bij:', '["Sauvignon Blanc", "Port", "Tawny", "Madeira"]', 0, 'Correct: Sauvignon Blanc'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 3, 'Romige kip past goed bij:', '["Chardonnay", "Muscat", "Torrontés", "Riesling droog"]', 0, 'Correct: Chardonnay'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 4, 'Wat is belangrijk?', '["Structuur matchen", "Alleen alcohol", "Alleen suiker", "Alleen kleur"]', 0, 'Correct: Structuur matchen'),
  ('pairing-white-wine', 'witte-wijn-gevogelte', 5, 'Waarom bepaalt de saus bij gevogelte vaak sterker de wijnkeuze dan bij rood vlees?', '["Omdat gevogelte-eiwit zelf grotendeels neutraal en laag in intramusculair vet is", "Omdat gevogelte altijd gefrituurd wordt", "Omdat rood vlees geen saus verdraagt", "Omdat gevogelte nooit gekruid wordt"]', 0, 'Correct: Omdat gevogelte-eiwit zelf grotendeels neutraal en laag in intramusculair vet is'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 1, 'Welke druif geeft vaak kruisbes?', '["Riesling", "Sauvignon Blanc", "Chardonnay", "Chenin"]', 1, 'Correct: Sauvignon Blanc'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 2, 'Welke druif geeft vaak petrol?', '["Sauvignon", "Riesling", "Verdejo", "Albariño"]', 1, 'Correct: Riesling'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 3, 'Welke is vaak groener?', '["Sauvignon Blanc", "Riesling", "Viognier", "Muscat"]', 0, 'Correct: Sauvignon Blanc'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 4, 'Welke is vaak mineraler?', '["Riesling", "Sauvignon", "Muscat", "Viognier"]', 0, 'Correct: Riesling'),
  ('examen-white-wine', 'sauvignon-vs-riesling-blind', 5, 'Welke heeft vaker paprika?', '["Sauvignon Blanc", "Riesling", "Chenin", "Semillon"]', 0, 'Correct: Sauvignon Blanc'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 1, 'Welke druif heeft vaker boter?', '["Chardonnay", "Chenin Blanc", "Riesling", "Vermentino"]', 0, 'Correct: Chardonnay'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 2, 'Welke heeft vaker hoge zuren?', '["Chenin Blanc", "Chardonnay", "Viognier", "Semillon"]', 0, 'Correct: Chenin Blanc'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 3, 'Welke voelt vaak ronder?', '["Chardonnay", "Chenin", "Riesling", "Muscat"]', 0, 'Correct: Chardonnay'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 4, 'Welke heeft vaker honing?', '["Chenin Blanc", "Chardonnay", "Sauvignon", "Albariño"]', 0, 'Correct: Chenin Blanc'),
  ('examen-white-wine', 'chardonnay-vs-chenin-blind', 5, 'Wat is vaak het sleutelverschil?', '["Zuurstructuur", "Alcohol", "Kleur", "Flesgewicht"]', 0, 'Correct: Zuurstructuur'),
  ('examen-white-wine', 'white-final-exam', 1, 'Wat is het belangrijkste doel van direct press bij witte wijnproductie?', '["Kleur extraheren uit de schil", "Schilcontact en tannine-extractie vermijden", "Het suikergehalte verhogen", "Het zuurgehalte verlagen"]', 1, 'Correct: Schilcontact en tannine-extractie vermijden'),
  ('examen-white-wine', 'white-final-exam', 2, 'Wat gebeurt er tijdens malolactische gisting?', '["Appelzuur wordt omgezet in melkzuur", "Suiker wordt omgezet in alcohol", "Tannine wordt afgebroken", "Kleurstoffen worden geëxtraheerd"]', 0, 'Correct: Appelzuur wordt omgezet in melkzuur'),
  ('examen-white-wine', 'white-final-exam', 3, 'Welk aroma is typisch voor Sauvignon Blanc uit de koele Loire?', '["Kruisbes en gras", "Boter en vanille", "Honing en noten", "Rozen en lychee"]', 0, 'Correct: Kruisbes en gras'),
  ('examen-white-wine', 'white-final-exam', 4, 'Welke druif staat bekend om een kenmerkende, peperachtige toon?', '["Grüner Veltliner", "Chardonnay", "Viognier", "Muscat"]', 0, 'Correct: Grüner Veltliner'),
  ('examen-white-wine', 'white-final-exam', 5, 'Met welke regio wordt Albariño het sterkst geassocieerd?', '["Rías Baixas", "Mosel", "Loire", "Salta"]', 0, 'Correct: Rías Baixas'),
  ('examen-white-wine', 'white-final-exam', 6, 'Wat veroorzaakt de boterachtige toon in veel Chardonnay?', '["Diacetyl, gevormd tijdens malolactische gisting", "Terpenen uit de schil", "Tannine-extractie", "Een hoog suikergehalte"]', 0, 'Correct: Diacetyl, gevormd tijdens malolactische gisting'),
  ('examen-white-wine', 'white-final-exam', 7, 'Welke druif is bekend om intense abrikoos- en viooltjesaroma''s?', '["Viognier", "Sauvignon Blanc", "Riesling", "Vermentino"]', 0, 'Correct: Viognier'),
  ('examen-white-wine', 'white-final-exam', 8, 'Wat is typisch voor houtgelagerde witte Rhône-blends (Marsanne/Roussanne)?', '["Zeer hoge tannine", "Textuur en relatief lage aromatische intensiteit", "Extreem hoge zuren", "Een mousserend karakter"]', 1, 'Correct: Textuur en relatief lage aromatische intensiteit'),
  ('examen-white-wine', 'white-final-exam', 9, 'Welke stofklasse is grotendeels verantwoordelijk voor de intense aromatiek van Gewürztraminer?', '["Terpenen zoals linalool en geraniol", "Tannines", "Diacetyl uit malolactische gisting", "Ethanol"]', 0, 'Correct: Terpenen zoals linalool en geraniol'),
  ('examen-white-wine', 'white-final-exam', 10, 'Waarom ruikt Muscat letterlijk naar druiven?', '["Het is de enige grote druivenfamilie waarvan de wijn echt naar verse druiven ruikt", "Door lange houtlagering", "Door een hoog tanninegehalte", "Door een zeer lage zuurgraad"]', 0, 'Correct: Het is de enige grote druivenfamilie waarvan de wijn echt naar verse druiven ruikt'),
  ('examen-white-wine', 'white-final-exam', 11, 'Waarom is de neus van Torrontés vaak intenser dan de smaak?', '["Orthonasale waarneming registreert terpenen sterker dan retronasale waarneming", "Door fortificatie tijdens productie", "Door langdurige houtlagering", "Door een zeer lage serveertemperatuur"]', 0, 'Correct: Orthonasale waarneming registreert terpenen sterker dan retronasale waarneming'),
  ('examen-white-wine', 'white-final-exam', 12, 'Wat is het genetische verband tussen Pinot Gris en Pinot Grigio?', '["Twee genetisch verschillende druiven", "Dezelfde druif, twee verschillende stijltradities", "Pinot Grigio is een kruising van Pinot Gris en Chardonnay", "Pinot Gris is een klon van Sauvignon Blanc"]', 1, 'Correct: Dezelfde druif, twee verschillende stijltradities'),
  ('examen-white-wine', 'white-final-exam', 13, 'Waarom schenk je een wijn idealiter iets onder de uiteindelijke doeltemperatuur?', '["Omdat het glas tijdens service vanzelf opwarmt", "Omdat dat het zuur verhoogt", "Omdat dat het alcoholpercentage verlaagt", "Omdat dat verplicht is bij elk wijnkeurmerk"]', 0, 'Correct: Omdat het glas tijdens service vanzelf opwarmt'),
  ('examen-white-wine', 'white-final-exam', 14, 'Welk glastype is de internationale standaard voor blind proeven?', '["Het neutrale ISO-tasting-glas", "Het Bordeaux-glas", "De coupe", "Het sherryglas"]', 0, 'Correct: Het neutrale ISO-tasting-glas'),
  ('examen-white-wine', 'white-final-exam', 15, 'Waarom decanteer je sommige witte wijnen?', '["Om vluchtige zwavelverbindingen (reductie) te laten verdampen", "Om extra kleur toe te voegen", "Om het suikergehalte te verlagen", "Om tannine te verhogen"]', 0, 'Correct: Om vluchtige zwavelverbindingen (reductie) te laten verdampen'),
  ('examen-white-wine', 'white-final-exam', 16, 'Welke factoren bepalen vooral het bewaarpotentieel van witte wijn?', '["De vorm van de fles", "Zuur, fenolische structuur en concentratie", "De kleur van het etiket", "De geur van de kurk"]', 1, 'Correct: Zuur, fenolische structuur en concentratie'),
  ('examen-white-wine', 'white-final-exam', 17, 'Waarom botst rode wijn vaak met vis?', '["Door het ijzer-tannine-effect", "Door een te hoog suikergehalte", "Door een te laag alcoholpercentage", "Door te veel koolzuur"]', 0, 'Correct: Door het ijzer-tannine-effect'),
  ('examen-white-wine', 'white-final-exam', 18, 'Wat is het dominante mechanisme bij witte wijn en kaas?', '["Vet-tannine-binding", "Zuur-vet-snede", "Alcohol-zout-binding", "Suiker-bitter-contrast"]', 1, 'Correct: Zuur-vet-snede'),
  ('examen-white-wine', 'white-final-exam', 19, 'Wat bepaalt bij gevogelte vaak sterker de wijnkeuze dan het vlees zelf?', '["De saus of bereidingswijze", "De kleur van het bord", "Het gebruikte glas", "De temperatuur van de keuken"]', 0, 'Correct: De saus of bereidingswijze'),
  ('examen-white-wine', 'white-final-exam', 20, 'Wat is het belangrijkste onderscheid tussen Chardonnay en Chenin Blanc in een blindproef?', '["Chenin behoudt van nature hoge zuren, ongeacht winemaking-keuzes", "Chardonnay is altijd zoeter dan Chenin", "Chenin heeft altijd meer tannine dan Chardonnay", "Chardonnay heeft altijd meer kleur dan Chenin"]', 0, 'Correct: Chenin behoudt van nature hoge zuren, ongeacht winemaking-keuzes')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
