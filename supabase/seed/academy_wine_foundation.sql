-- Wine Foundation track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'wine-foundation';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'wine-foundation',
  'Wine Foundation',
  'Leer wijn van Fundament tot Master: productie, proeven, structuur, druiven, terroir, service en examen.',
  5,
  now()
);

with t as (select id from academy.tracks where slug = 'wine-foundation')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-wine', 'Fundament', 1),
  ('explorer', 'productie-wine', 'Productie', 2),
  ('explorer', 'proeven-wine', 'Proeven', 3),
  ('specialist', 'structuur-wine', 'Structuur', 4),
  ('specialist', 'druivenrassen-wine', 'Druivenrassen', 5),
  ('specialist', 'klimaat-terroir-wine', 'Klimaat & Terroir', 6),
  ('master', 'service-wine', 'Service', 7),
  ('master', 'pairing-wine', 'Pairing & Gastronomie', 8),
  ('master', 'examen-wine', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'intro-wine'
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
    'wat-is-wijn',
    'Wat is wijn?',
    'Na deze les kun jij uitleggen wat wijn is, hoe wijn wordt gemaakt en waarom wijn wereldwijd zo''n belangrijke drank is.
',
    'Een gast die wijn ''ingewikkeld'' noemt, heeft meestal nooit gehoord wat er werkelijk gebeurt in het glas: gist zet druivensuikers om in alcohol en koolzuur, en dat ene biologische proces — fermentatie — is de hele basis. Wie die kern niet scherp heeft, verwart later elke categorie, productiemethode en kwaliteitsniveau door elkaar.

Het mechanisme zelf vraagt geen kunstgreep: een gistcultuur — van nature aanwezig op de druif of bewust toegevoegd in de kelder — eet de druivensuikers op en laat alcohol en koolzuur achter. Niets wordt kunstmatig samengesteld om die alcohol te creëren; ze zit al potentieel besloten in de druif zodra suikerniveau en gistactiviteit samenkomen. Dat maakt wijn in de kern een agrarisch product met een biologische omzetting, geen industrieel recept.

Hoe je dat gebruikt: bij elk etiket of elke wijnkaart kun je nu de vraag stellen welke keuzes die fermentatie hebben gestuurd — welke druif, welk klimaat, welke gistkeuze, welke stop- of doorzettingsbeslissing. Dat verandert je blik van ''vind ik dit lekker of niet'' naar ''ik herken een productieketen van beslissingen die tot dit glas hebben geleid''. Die keten begint in de wijngaard en eindigt pas bij het etiket in je hand.

Je gebruikt deze definitie elke keer dat je moet uitleggen waarom wijn complex aanvoelt ondanks de simpele basisformule suiker-naar-alcohol: complexiteit zit in de duizenden kleine beslissingen rond dat ene proces, niet in het proces zelf. Zodra je dat onderscheid scherp hebt, wordt elke volgende les in deze track een uitbreiding van diezelfde productieketen.


## Pro insight

Gasten die wijn ''ingewikkeld'' vinden, denken vaak dat er een verborgen recept achter zit — een klassieke verwachtingsmanagement-fout is dan een lijst druivenrassen opnoemen in plaats van het ene proces te benoemen. Leg uit dat de basis fermentatie is en dat complexiteit uit keuzes ontstaat, niet uit chemie; dat verlaagt drempelangst sneller dan jargon.',
    '- fermentatie
- druivensuikers
- gistcultuur
- agrarisch product
- productieketen
',
    'Gist leeft van nature op druivenschillen — daarom kon fermentatie duizenden jaren geleden spontaan ontstaan, zonder dat iemand wist wat gist was; dat verklaart waarom wijn eerder ontdekt dan uitgevonden is.
',
    '- Wijn ontstaat door fermentatie: gist zet druivensuikers om in alcohol en koolzuur
- Niets wordt kunstmatig toegevoegd om alcohol te creëren — het is een biologisch proces
- Wijn is in de kern een agrarisch product, geen industrieel recept
- Complexiteit ontstaat uit de keuzes rond dat ene proces, niet uit het proces zelf
- Elk etiket vertelt een stukje van de productieketen die tot het glas leidde
',
    '### Opdracht

Bekijk thuis of online drie verschillende wijnetiketten.

### Checklist

- Ik heb drie etiketten bekeken
- Ik heb het alcoholpercentage gevonden
- Ik heb het land van herkomst gevonden
- Ik heb de druivensoort gevonden


### Reflectievraag

Een gast vraagt of wijn ''kunstmatig'' wordt aangemaakt — met welke twee zinnen leg jij fermentatie uit als natuurlijk proces zonder technisch te worden?',
    8,
    1
  ),
  (
    'hoe-ontstaat-wijn',
    'Hoe ontstaat wijn?',
    'Na deze les begrijp je de basisstappen van wijnproductie.
',
    'Vraag een sommelier waarom twee flessen van dezelfde druif compleet anders smaken, en het antwoord zit zelden in het etiket — het zit in de keten oogst, persing, fermentatieproces en rijpingskeuze die aan de botteling voorafging. Wie die volgorde niet kent, kan geen enkele wijnstijl verklaren, alleen beschrijven.

Het proces loopt in een vaste keten: oogst, persing, fermentatieproces, rijpingskeuze en bottelen. Oogsttiming bepaalt hoeveel suiker en zuur de druif heeft op het moment dat hij wordt geplukt; persing bepaalt hoeveel sap — de most — uit de druif vrijkomt en hoeveel contact dat sap met schillen krijgt.

Hoe je dat gebruikt: proef je een wijn die fris en direct aanvoelt, dan vermoed je een vroege oogsttiming en een kort, gecontroleerd fermentatieproces; proef je rijkdom en structuur, dan vermoed je een latere oogst en een bewustere rijpingskeuze na de gisting.

Je valt op deze keten terug zodra je een onbekende wijn moet plaatsen zonder volledige productie-informatie: de basisvolgorde — oogst, persing, most, fermentatieproces, rijpingskeuze — vertelt je waar in het proces de stijl waarschijnlijk is bepaald.


## Pro insight

Wanneer een gast vraagt waarom twee wijnen van dezelfde druif zo verschillend smaken, is de veelgemaakte fout om alleen naar de druif te wijzen. Verwijs naar de keten — oogsttiming en rijpingskeuze verklaren vaak meer dan het etiket laat zien, en dat verhaal werkt ook in verkoopcontext om een duurdere fles te rechtvaardigen.',
    '- oogsttiming
- persing
- most
- fermentatieproces
- rijpingskeuze
',
    'Oogsttiming verschuift jaarlijks met enkele weken door weersomstandigheden, wat verklaart waarom ''oogstjaar'' op een etiket meer zegt over het seizoen dan over een vast kwaliteitsniveau.
',
    '- Wijn ontstaat via een vaste keten: oogst, persing, fermentatieproces, rijpingskeuze, bottelen
- Oogsttiming bepaalt suiker- en zuurniveau van de druif
- Persing levert de most op, met meer of minder schilcontact
- Elke stap in de keten is een bewust beslissingsmoment, geen automatisme
- De basisvolgorde helpt je een onbekende wijn te plaatsen zonder volledige productie-info
',
    '### Opdracht

Zet de stappen van wijn maken in de juiste volgorde.

### Checklist

- Ik ken de volgorde
- Ik begrijp het verschil tussen oogst en fermentatie
- Ik begrijp waarom rijping belangrijk is


### Reflectievraag

Welke stap in de productieketen — oogst, persing, fermentatieproces of rijpingskeuze — zou jij als eerste vraag stellen aan een producent om snel een wijnstijl te voorspellen?',
    8,
    2
  ),
  (
    'wijnstijlen-basis',
    'Stille wijn vs mousserend vs versterkt',
    'Na deze les herken jij de drie belangrijkste wijncategorieën.
',
    'Een gast die zegt ''ik hou niet van wijn'' heeft vaak precies één van de drie hoofdfamilies geproefd, en generaliseert die ervaring naar alles met een kurk. Stille, mousserende en versterkte wijn ontstaan uit fundamenteel verschillende ingrepen op fermentatie en alcohol — en zonder dat onderscheid scherp te hebben, mis je het kader waarin elke volgende subtrack pas zinvol wordt.

Stille wijn ondergaat één fermentatie zonder verdere ingreep op koolzuur of alcohol. Mousserende wijn krijgt een tweede gisting of toevoeging die koolzuur vastlegt in de fles of tank. Versterkte wijn krijgt extra alcohol toegevoegd, vaak om de gisting te onderbreken en restsuiker te bewaren.

Hoe je dat herkent op etiket of in het glas: bubbels wijzen op die tweede gisting; een hoger alcoholpercentage — vaak rond achttien tot twintig procent — gecombineerd met merkbare restsuiker wijst op versterkte wijn; de afwezigheid van beide wijst op stille wijn, wereldwijd de meest voorkomende categorie.

Deze driedeling is een startpunt, geen eindpunt: zodra je een van deze categorieën wilt verdiepen — de methode achter de bubbels of de fortificatielogica van versterkte wijn — schakel je over naar de bijbehorende subtrack, waar productie in volle diepte wordt behandeld.


## Pro insight

Een gast die zegt ''ik hou niet van wijn'' heeft vaak maar één van de drie hoofdcategorieën geproefd. Vraag door op stille, mousserende of versterkte wijn vóór je een fles aanraadt — dat is verwachtingsmanagement in de kern en voorkomt dat je dezelfde afwijzing herhaalt.',
    '- stille wijn
- tweede gisting
- koolzuur
- versterkte wijn
- restsuiker
',
    'De drie hoofdfamilies zijn wettelijk strikter gedefinieerd dan smaak alleen: zodra koolzuur of toegevoegde alcohol een vastgelegde drempel overschrijdt, verandert de wettelijke categorie, ook als de smaak nauwelijks verschilt.
',
    '- Stille wijn: één fermentatie, geen extra ingreep op koolzuur of alcohol
- Mousserend: tweede gisting legt koolzuur vast
- Versterkt: extra toegevoegde alcohol, vaak met behoud van restsuiker
- Etiket en glas geven snel hints: bubbels, alcoholpercentage, zoetheid
- Verdieping van elke categorie volgt in de aparte subtracks binnen Way of Tasting
',
    '### Opdracht

Zoek per categorie één voorbeeld.

### Checklist

- Ik vond een stille wijn
- Ik vond een mousserende wijn
- Ik vond een versterkte wijn


### Reflectievraag

Welke van de drie hoofdcategorieën heb jij zelf het minst geproefd, en welke fles zou je deze week kiezen om dat gat te dichten?',
    8,
    3
  ),
  (
    'geschiedenis-van-wijn',
    'Geschiedenis van wijn',
    'Na deze les begrijp jij hoe wijn zich historisch ontwikkelde.
',
    'Noem een gast ''oude wijngaarden'' en je verkoopt marketing; leg uit waarom Romeinse wijnbouw en kloostertraditie de wetgeving van vandaag nog vormgeven, en je verkoopt kennis. Wijngeschiedenis is geen trivia voor bij de koffie — het is de verklaring achter elke klassieke regio, elke classificatie en elke ''traditie'' die je nu nog op een etiket leest.

De oudste sporen van wijnbouw komen uit Georgië, waar kleivaten — qvevri — al duizenden jaren worden gebruikt om druivensap te laten vergisten en rijpen. Vanuit het Middellandse Zeegebied verspreidden de Grieken wijncultuur via handel en kolonisatie; de Romeinse wijnbouw professionaliseerde aanplant en infrastructuur door bijna heel Europa.

In de middeleeuwen bewaarde de kloostertraditie wijnkennis toen veel andere structuren wegvielen: monniken legden wijngaarden aan, documenteerden methodes en bouwden de kennisbasis die latere generaties overnamen.

Je gebruikt deze geschiedenis als contextlaag bij elk gesprek over ''traditie'': zodra je een wijnregio in Frankrijk, Italië, Spanje of Portugal ziet, weet je dat de wortels vaak teruggaan op Romeinse wijnbouw en kloostertraditie — dat verklaart waarom precies deze landen de klassieke wetgeving en classificatiesystemen hebben opgebouwd.


## Pro insight

Verkoop ''oude wijngaarden'' nooit als marketingtaal maar als historisch feit: leg uit dat Romeinse wijnbouw en kloostertraditie de basis legden voor wetgeving die vandaag nog regio''s beschermt. Die framing werkt psychologisch sterker dan een prijsargument — een klassiek upsellmoment zonder dat het als verkooppraatje aanvoelt.',
    '- Georgië
- qvevri
- Romeinse wijnbouw
- kloostertraditie
- wijngeschiedenis
',
    'Veel klassieke appellatiewetgeving van vandaag is direct te herleiden tot grenzen die kloosters al in de middeleeuwen rond hun beste percelen trokken — regelgeving volgde de wijngaard, niet omgekeerd.
',
    '- De oudste sporen van wijnbouw komen uit Georgië, met kleivaten (qvevri)
- Grieken verspreidden wijncultuur via handel en kolonisatie
- Romeinse wijnbouw professionaliseerde aanplant en infrastructuur in Europa
- Kloostertraditie bewaarde wijnkennis tijdens de middeleeuwen
- Klassieke wijnlanden bouwen vandaag nog voort op die historische lijn
',
    '### Opdracht

Zoek op welk land jij als eerste met wijn associeert.

### Checklist

- Ik heb een land gekozen
- Ik weet waarom
- Ik heb de wijntraditie onderzocht


### Reflectievraag

Welk land associeer jij zelf als eerste met wijn, en hoeveel van die associatie komt daadwerkelijk uit Romeinse wijnbouw of kloostertraditie?',
    8,
    4
  ),
  (
    'belangrijkste-wijncategorieen',
    'Belangrijkste wijncategorieën',
    'Na deze les herken jij de belangrijkste wijncategorieën.
',
    'Voordat een gast over druif of regio nadenkt, kiest hij eigenlijk al een categorie — wit, rood, rosé, mousserend, versterkt of zoet — en die eerste keuze stuurt serveertemperatuur, glas en verwachting harder dan welk druivenras dan ook. Wie categorie als sluitstuk behandelt in plaats van als eerste filter, verliest tijd aan een gesprek dat in drie seconden had kunnen landen.

Witte wijn ontstaat doorgaans zonder lang schilcontact en is daardoor meestal frisser en lichter van kleur. Rode wijn vergist juist mét de schillen mee, waardoor kleurstoffen en tannine tijdens de gisting worden geëxtraheerd. Rosé krijgt kort schilcontact of een lichte, vroege pers — rosévinificatie zit smaaktechnisch tussen wit en rood in.

Mousserend voegt koolzuur toe via een tweede proces; versterkt krijgt extra alcohol; zoete wijn behoudt bewust restsuiker via late oogst, edelrot of een onderbroken gisting. Elke keuze is een bewuste stijlbeslissing, geen toeval.

Bij een onbekende fles kijk je eerst naar kleur en etiket, dan naar stijlaanduidingen zoals droog of zoet, mousserend of stil, om de wijncategorie te bepalen vóór je verder denkt over druif of regio — categorie is je eerste filter, niet je laatste, en bepaalt direct serveertemperatuur en glaskeuze.


## Pro insight

Bouw een wijnkaart eerst op categorie, dan op druif of regio — in verkoopcontext kiezen gasten sneller wanneer ze eerst stijl herkennen in plaats van een lijst druivenrassen te moeten doorworstelen. Dat voorkomt ook de veelgemaakte fout dat een gast Cava afschrijft als ''goedkoop alternatief'' in plaats van een eigen stijlkeuze.',
    '- schilcontact
- tannine
- rosévinificatie
- restsuiker
- wijncategorie
',
    'Een wijn kan tegelijk meerdere categorieën combineren — zoals zoete mousserende wijn — wat verklaart waarom ''categorie'' altijd een combinatie van assen is, niet één simpel label.
',
    '- Wit: doorgaans weinig schilcontact, fris en licht
- Rood: schilcontact tijdens gisting geeft kleur en tannine
- Rosé: kort schilcontact, smaak tussen wit en rood
- Mousserend en versterkt zijn methode-gedreven categorieën, zoete wijn is een bewuste restsuikerkeuze
- Wijncategorie is je eerste filter bij elk advies, vóór druif of regio
',
    '### Opdracht

Maak jouw persoonlijke top 3 wijncategorieën.

### Checklist

- Ik koos drie stijlen
- Ik weet waarom
- Ik kan ze uitleggen


### Reflectievraag

Welke van de zes categorieën schenk jij zelf het minst, en wat zou je moeten proeven om daar zelfverzekerder over te kunnen adviseren?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'productie-wine'
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
    'van-druif-naar-wijn',
    'Van druif naar wijn',
    'Na deze les begrijp jij het volledige basisproces van wijn maken.
',
    'Vraagt een gast waarom rode wijn ''zwaarder'' aanvoelt dan witte wijn van precies dezelfde druif, dan ligt het antwoord nooit in het druivenras alleen — het ligt in het moment waarop schilcontact stopt of net begint. Die productiestap, niet de druif, is waar kleur en tannine ontstaan.

Na de oogst volgen selectie en ontsteling: de stelen worden verwijderd om bittere, groene tonen te vermijden. Daarna komt persing, waarbij sap vrijkomt. Bij witte wijn wordt dat sap meestal snel van de schillen gescheiden zodat kleur en tannine beperkt blijven.

Bij rode wijn vergist het sap juist mee met de schillen: schilcontact tijdens de gisting zorgt voor extractie van kleurstoffen en tannine. Dat verklaart meteen waarom rode wijn vrijwel altijd meer kleur en grip heeft dan witte wijn, los van het druivenras.

Je valt op deze productiestappen terug zodra een gast vraagt waarom rode wijn anders is dan witte: het antwoord zit niet alleen in de druif, maar vooral in het moment waarop schilcontact stopt of net begint.


## Pro insight

Als een gast vraagt waarom rode wijn ''zwaarder'' aanvoelt dan wit van dezelfde druif, wijs dan naar schilcontact en extractie, niet naar de druif alleen. Dat antwoord klopt vaker, klinkt overtuigender, en is precies het soort gastpsychologie-detail dat vertrouwen in je advies opbouwt.',
    '- ontsteling
- schilcontact
- extractie
- persing
- productiestappen
',
    'Hetzelfde druivenras kan met en zonder schilcontact worden vinifieerd, wat verklaart waarom sommige ''witte'' wijnen eigenlijk van rode druiven worden gemaakt — de schil bepaalt de kleur, niet alleen de druif.
',
    '- Na de oogst volgen selectie, ontsteling en persing
- Bij witte wijn wordt het sap snel van de schillen gescheiden
- Bij rode wijn vergist het sap mee met de schillen: extractie van kleur en tannine
- Schilcontact, niet alleen het druivenras, verklaart het verschil tussen wit en rood
- Elke productiestap is een apart beslissingsmoment voor stijl en kwaliteit
',
    '### Opdracht

Zet het wijnproces in de juiste volgorde.

### Checklist

- Ik ken alle stappen
- Ik begrijp de logica
- Ik weet waar kwaliteit ontstaat


### Reflectievraag

Bij welke productiestap — ontsteling, persing of schilcontact — zou een kleine wijziging volgens jou het grootste verschil maken in het eindresultaat?',
    8,
    1
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting',
    'Na deze les kun jij uitleggen hoe alcohol ontstaat.
',
    'Proef je restsuiker in een wijn die nergens als zoet wordt verkocht, dan is dat zelden een fout — het is het directe gevolg van een bewuste gistingsstop. Gisting is de enige stap waar alcohol daadwerkelijk ontstaat, en zonder dat mechanisme te begrijpen kun je geen stijlverschil verklaren tussen wijnen die qua druif en regio identiek zouden moeten zijn.

Gistcellen zetten suiker om in alcohol, koolzuur en warmte; die koolzuurontwikkeling is hetzelfde mechanisme dat bij mousserende wijn bewust wordt vastgehouden. Fermentatietemperatuur stuurt het resultaat sterk: koel vergisten — vaker bij witte wijn — bewaart fris fruit en aroma, warmer vergisten — vaker bij rode wijn — geeft meer extractie en structuur.

Gisting stopt op twee manieren: vanzelf, wanneer alle suiker is omgezet, of door een bewuste gistingsstop — via koeling, filtratie of, bij versterkte stijlen, door toevoeging van alcohol. Beide routes zijn legitiem; het verschil bepaalt of er restsuiker overblijft.

Je gebruikt deze kennis bij elke vraag over alcoholpercentage of zoetheid: beide zijn rechtstreeks het resultaat van hoever en hoe snel die ene gisting is doorgelopen vóór de gistingsstop intrad.


## Pro insight

Proef je restsuiker in een wijn die niet als ''zoet'' wordt verkocht, ga dan uit van een bewuste gistingsstop, geen fout. Leg dat zo aan gasten uit — het is verwachtingsmanagement die onterechte twijfel over kwaliteit voorkomt vóór die twijfel zich kan vastzetten.',
    '- gistcellen
- fermentatietemperatuur
- koolzuurontwikkeling
- gistingsstop
- restsuiker
',
    'Eenzelfde druivenpartij kan met twee verschillende giststammen totaal andere aroma''s opleveren, wat verklaart waarom ''wilde'' versus geselecteerde gisting vaak het grootste smaakverschil tussen twee wijnmakers van dezelfde druif vormt.
',
    '- Gistcellen zetten suiker om in alcohol, koolzuur en warmte
- Fermentatietemperatuur stuurt frisheid (koel) versus structuur (warm)
- Koolzuurontwikkeling tijdens gisting is dezelfde basis als bij mousserende wijn
- Gisting stopt vanzelf of via een bewuste gistingsstop
- Restsuiker is het directe gevolg van wanneer en hoe gisting wordt onderbroken
',
    '### Opdracht

Bekijk op een etiket het alcoholpercentage.

### Checklist

- Ik heb het gevonden
- Ik vergelijk twee wijnen
- Ik zie verschillen


### Reflectievraag

Stel je een gisting voor die een dag te vroeg wordt gestopt — wat verandert er volgens jou aan alcohol én restsuiker in het eindresultaat?',
    8,
    2
  ),
  (
    'houtlagering',
    'Houtlagering uitgelegd',
    'Na deze les begrijp je wat hout doet met wijn.
',
    '''Gerijpt op eik'' op een etiket wordt door veel gasten automatisch gelezen als kwaliteitskeurmerk, terwijl het in werkelijkheid alleen een stijlkeuze beschrijft die sterk afhangt van vatleeftijd. Nieuw hout en oud hout geven een radicaal ander resultaat onder exact dezelfde tekst — en wie dat verschil niet kan uitleggen, verkoopt een woord in plaats van een wijn.

Eikenhout geeft houtaroma zoals vanille, toost, rook en kruiden, afhankelijk van het vattype en de vatleeftijd: hoe vaker een vat al gebruikt is, hoe minder uitgesproken smaak het nog afgeeft. Daarnaast laat hout langzaam zuurstof door — die zuurstofdoorlaat ondersteunt tanninezachting en helpt de wijn integreren.

Nieuw hout geeft veel directe smaak; oud, al meermaals gebruikt hout geeft vooral textuur zonder dominante houtaroma. Geen van beide is per definitie beter — het is een stijlkeuze die past bij het beoogde resultaat.

Hoe je dat herkent: proef je sterke vanille en toost, dan is relatief nieuw eikenhout waarschijnlijk; proef je vooral een rondere, zachtere structuur zonder uitgesproken houtaroma, dan wijst dat op hogere vatleeftijd. Niet elke wijn heeft hout nodig — dat verdiep je verder in de productie- en stijlsubtracks.


## Pro insight

Vraag bij ''gerijpt op eik'' op het etiket altijd door naar vatleeftijd, niet alleen houtsoort. Een veelgemaakte fout is aannemen dat alle gehoute wijn dezelfde intensiteit geeft — een oud vat geeft een heel ander resultaat dan een nieuw, ook al staat er identieke tekst op het etiket.',
    '- eikenhout
- houtaroma
- tanninezachting
- zuurstofdoorlaat
- vatleeftijd
',
    'Een vat verliest na drie tot vier keer gebruik het grootste deel van zijn directe houtsmaak, wat verklaart waarom producenten oud vatpark bewust mengen met nieuw hout om controle te houden over de uiteindelijke intensiteit.
',
    '- Eikenhout geeft houtaroma zoals vanille, toost, rook en kruiden
- Zuurstofdoorlaat via hout ondersteunt tanninezachting
- Vatleeftijd bepaalt hoeveel houtaroma nog wordt afgegeven
- Nieuw hout geeft veel smaak; oud hout geeft vooral textuur
- Niet elke wijn heeft houtlagering nodig — het is een stijlkeuze
',
    '### Opdracht

Zoek een wijn met houtrijping.

### Checklist

- Ik vond een houtgerijpte wijn
- Ik las het etiket
- Ik herkende smaken


### Reflectievraag

Bij welke wijn op je lijst zou jij verwachten dat nieuw eikenhout is gebruikt, en bij welke juist ouder hout — en waarom?',
    8,
    3
  ),
  (
    'oxidatie-vs-reductie',
    'Oxidatie vs reductie',
    'Na deze les begrijp jij het verschil tussen oxidatieve en reductieve wijnmaking.
',
    'Twee jonge wijnen van hetzelfde jaar kunnen volledig anders ruiken — de ene fris en fruitig, de andere al notig en naar karamel — zonder dat een van beide bedorven is. Het verschil tussen oxidatieve en reductieve wijnmaking verklaart die kloof, en wie dat onderscheid niet kent, leest ''oud ruikend'' al snel verkeerd als ''oude wijn''.

Bij oxidatieve wijnmaking krijgt de wijn bewust zuurstofcontact, wat fruit langzaam verschuift richting notige aroma''s, karamel en rijpere, gedroogde tonen. Bij reductieve wijnmaking wordt zuurstofcontact juist zo veel mogelijk vermeden — vaak via inerte tanks of vroege botteling — om primair fruit en frisheid te bewaren.

Hoe je dat herkent: ruik je notige aroma''s, gedroogd fruit of karamel, dan wijst dat op oxidatieve invloed, vaak gecombineerd met houtlagering of langere tankrijping. Ruik je vooral fris, primair fruit en weinig rijpingstonen, dan wijst dat op een reductieve aanpak.

Je gebruikt dit onderscheid telkens wanneer je moet verklaren waarom een wijn ''ouder'' of ''notiger'' ruikt zonder dat de fles per se oud is — vaak is het een bewuste productiekeuze, geen leeftijdskenmerk.


## Pro insight

Leer gasten dat ''oud ruikend'' niet altijd ''oud'' betekent: oxidatieve wijnmaking kan al bij een jonge wijn notige tonen geven. Dat voorkomt verwarring tussen productiestijl en daadwerkelijke leeftijd, en is precies het soort verwachtingsmanagement dat een retourfles voorkomt.',
    '- oxidatieve wijnmaking
- reductieve wijnmaking
- zuurstofcontact
- notige aroma''s
- primair fruit
',
    'Reductieve fouten (zwavelig, rotte-eitonen) en bewuste reductieve stijl worden makkelijk verward, wat verklaart waarom ''geen zuurstof'' niet automatisch ''fris en schoon'' betekent zonder zorgvuldig kelderbeheer.
',
    '- Oxidatieve wijnmaking geeft bewust zuurstofcontact
- Reductieve wijnmaking vermijdt zuurstofcontact om fruit en frisheid te bewaren
- Notige aroma''s en karamel wijzen op oxidatieve invloed
- Primair fruit en frisheid wijzen op een reductieve aanpak
- Het onderscheid is een productiekeuze, geen toevalligheid of fout
',
    '### Opdracht

Vergelijk een frisse Sauvignon Blanc met een houtgerijpte Chardonnay.

### Checklist

- Ik proefde frisheid
- Ik proefde rijping
- Ik zag verschil


### Reflectievraag

Bij welke wijn die je kent, twijfel je nog of de notige tonen door oxidatieve wijnmaking komen of door pure leeftijd — en hoe zou je dat verschil checken?',
    8,
    4
  ),
  (
    'rijping-en-ontwikkeling',
    'Rijping en ontwikkeling',
    'Na deze les begrijp je hoe wijn zich ontwikkelt door tijd.
',
    'Niet elke fles wordt automatisch beter door hem te laten liggen — en een gast die daar wél op rekent, krijgt uiteindelijk een teleurstelling in plaats van een investering. Of een wijn kan rijpen, voorspel je niet aan prijs of reputatie, maar aan de structuurbalans waarmee hij begon: voldoende zuur, tannine en concentratie om verandering te kunnen dragen.

Tijdens rijping wordt primair fruit minder dominant, integreren zuren beter en verzachten tannines — die tanninezachting maakt structuur ronder. Tegelijk ontstaan nieuwe, tertiaire aroma''s zoals leer, tabak, honing of gedroogd fruit, die er bij een jonge wijn nog niet waren.

Dat proces verloopt geleidelijk en hangt af van de structuurbalans waarmee de wijn begon: voldoende zuur, tannine of concentratie is nodig om verandering te kunnen dragen zonder uit elkaar te vallen.

Hoe je dat inschat: een wijn met hoge zuur, stevige tannine of concentratie heeft meer bewaarpotentieel dan een lichte, fruitgedreven wijn die vooral gemaakt is om jong gedronken te worden. Vraag bij twijfel altijd of de structuurbalans sterk genoeg is om jaren te overbruggen, vóór je een fles wegzet.


## Pro insight

Geef nooit bewaaradvies op basis van prijs of reputatie alleen — dat is een veelgemaakte fout. Check eerst structuurbalans: zuur, tannine en concentratie voorspellen bewaarpotentieel veel beter dan het etiket, en dat advies beschermt zowel de gast als jouw geloofwaardigheid bij een volgend aankoopgesprek.',
    '- primair fruit
- tertiaire aroma''s
- tanninezachting
- bewaarpotentieel
- structuurbalans
',
    'Niet elk structuurelement rijpt in hetzelfde tempo: zuur blijft relatief stabiel, terwijl tannine sneller verandert, wat verklaart waarom een jonge wijn met hoog zuur maar zacht tannine soms sneller ''oud'' aanvoelt dan verwacht.
',
    '- Tijdens rijping wordt primair fruit minder dominant
- Tanninezachting maakt structuur ronder en geïntegreerder
- Tertiaire aroma''s zoals leer, tabak en honing ontstaan door tijd
- Structuurbalans bij aanvang bepaalt hoeveel een wijn kan rijpen
- Niet elke wijn wordt beter met leeftijd — balans is bepalend, niet tijd alleen
',
    '### Opdracht

Zoek uit welke wijn in jouw collectie bewaarpotentieel heeft.

### Checklist

- Ik koos een wijn
- Ik onderzocht de bewaartijd
- Ik begrijp waarom


### Reflectievraag

Zou jij een fles uit je eigen voorraad nog vijf jaar laten liggen? Welk structuurelement gebruik je om dat te beslissen?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'proeven-wine'
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
    'hoe-proef-je-wijn',
    'Hoe proef je wijn?',
    'Na deze les begrijp jij de vier vaste stappen van wijnproeven.
',
    'De conclusie die je het snelst trekt — meestal op aroma alleen — is in de praktijk ook de conclusie die het vaakst onderuitgaat zodra je structuur erbij betrekt. Proeven is daarom een protocol, geen gevoel: een vaste volgorde dwingt je elke laag apart te toetsen vóór je een oordeel velt.

De volgorde is altijd: visueel (helderheid, kleur, intensiteit), neus (eerste indruk, swirl, tweede indruk), mond (eerste indruk, structuur, lengte), conclusie. Elke stap levert een hypothese die de volgende stap bevestigt of weerlegt — kleur voorspelt iets over leeftijd of klimaat, de neus toetst dat, de mond toetst opnieuw.

Waarom apart proeven en niet alles tegelijk? Omdat aroma en structuur verschillende zintuigen gebruiken en elkaar maskeren als je ze niet bewust scheidt. Een krachtig aroma kan een zwakke structuur verbloemen als je niet apart op mondgevoel let, en omgekeerd.

Wanneer pas je dit protocol toe? Bij elk glas, zonder uitzondering. Niet alleen bij blindproeven of examens — juist de herhaling bij gewone glazen bouwt het proefgeheugen op waarmee je later sneller en betrouwbaarder conclusies trekt.


## Pro insight

Noteer bij elk glas drie woorden per stap — kleur, neus, mond — vóórdat je een conclusie trekt. Dat voorkomt dat smaakvoorkeur de analyse overneemt, en die discipline is exact wat je team onderscheidt in een verkoopcontext waar gasten op je oordeel vertrouwen.',
    '- proefprotocol
- visuele analyse
- aromaherkenning
- structuuranalyse
- proefconclusie
',
    'Een vaste proefvolgorde voorkomt niet alleen foute conclusies maar ook vermoeidheid: door kleur, neus en mond apart te scheiden, hoeft je brein niet drie zintuigen tegelijk te wegen, wat blindproeven over een hele sessie merkbaar nauwkeuriger houdt.
',
    '- Proeven volgt een vaste volgorde: visueel, neus, mond, conclusie
- Vaste volgorde voorkomt te snelle, onderbouwde conclusies
- Elke stap levert een hypothese die de volgende stap toetst
- Structuur proef je bewust apart van aroma, niet tegelijk
- Consistente herhaling bouwt een betrouwbaar proefgeheugen op
',
    '### Opdracht

Proef een wijn volgens de vier stappen.

### Checklist

- Ik keek bewust
- Ik rook bewust
- Ik proefde bewust
- Ik maakte een conclusie


### Reflectievraag

Welke stap sla jij nu het vaakst over — visueel, neus of structuur — en welke verkeerde conclusie levert dat al snel op?',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij kleur gebruiken als eerste analysetool.
',
    'Nog vóór je ruikt of proeft, heeft het glas je al iets verteld: kleur is de eerste diagnostische laag, niet een esthetisch detail. Intensiteit, kleurtoon en vooral de rand geven een eerste hypothese over druif, leeftijd, klimaat en wijnmaakstijl — lang voordat een etiket die hypothese bevestigt of weerspreekt.

Bij witte wijn loopt de schaal van lichtgroen-geel (jong, koel klimaat, weinig of geen houtcontact) naar goud en amber (rijper, warmer klimaat, houtlagering of oxidatieve invloed). Bij rode wijn vertelt de rand het meest: een paarse, violette rand wijst op jeugd; een baksteen- of oranjeachtige rand wijst op leeftijd of versnelde oxidatie.

Hoe lees je dat objectief? Kantel het glas tegen een witte achtergrond en kijk eerst naar de rand, niet naar het midden — daar zit het eerste leeftijdssignaal. Kleurdiepte hangt verder samen met schildikte en extractie, niet uitsluitend met de druif: een dikschillige druif geeft sneller diepe kleur dan een dunschillige, los van leeftijd.

Wanneer gebruik je dit bewust? Bij blindproeven, bij kwaliteitscontrole en bij het inschatten van leeftijd of fraude-risico. Kleur is altijd een hypothese, geen eindconclusie — de neus en de mond moeten die hypothese nog bevestigen.


## Pro insight

Kantel het glas tegen een witte achtergrond en kijk eerst naar de rand, niet het midden — daar zit de eerste leeftijdsindicatie, nog vóór je ruikt. Een veelgemaakte fout is op kleurintensiteit alleen een prijsverwachting bouwen zonder de rand te checken.',
    '- kleurintensiteit
- kleurrand
- oxidatieve rijping
- schilcontact
- leeftijdshypothese
',
    'De rand van een wijn verandert sneller dan het midden, omdat de dunne wijnlaag aan de rand meer zuurstofcontact krijgt — daarom is de rand, en niet het midden, je betrouwbaarste eerste leeftijdssignaal.
',
    '- Kleurintensiteit, kleurtoon en kleurrand geven een eerste hypothese
- Witte wijn: lichtgroen-geel wijst op jong/koel; goud-amber op rijp of oxidatief
- Rode wijn: paarse rand wijst op jeugd; baksteenrand op leeftijd
- Kleurdiepte hangt samen met schildikte en extractie, niet alleen met de druif
- Kleuranalyse is een hypothese, geen eindconclusie
',
    '### Opdracht

Vergelijk twee wijnen op kleur.

### Checklist

- Ik keek naar intensiteit
- Ik keek naar randkleur
- Ik noteerde verschillen


### Reflectievraag

Bij welke wijn verraste de kleur je het meest ten opzichte van wat je proefde — en welke hypothese paste je daarna aan?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma''s herkennen',
    'Na deze les herken jij de drie aromacategorieën.
',
    'Een proefnotitie met tien losse geurwoorden is meestal een vage proefnotitie — niet omdat de neus het mis had, maar omdat niemand de aroma''s heeft geordend naar herkomst. Primair, secundair en tertiair zijn geen academische labels maar een directe vertaalslag naar productiekeuzes: vers fruit wijst op jong en ongehout, sterke tertiaire tonen wijzen op tijd.

Hoe train je herkenning? Ruik twee keer: eerst stilstaand glas, dan na swirlen. Swirlen activeert vluchtige aromastoffen die in een stil glas verborgen blijven; het verschil tussen die twee passes is vaak precies de secundaire of tertiaire laag. Beperk je tot één descriptor per laag, maximaal drie in totaal — een overvolle proefnotitie is een vage proefnotitie.

Waarom is dit meer dan een woordenspel? Omdat de dominante aromalaag al een eerste pairingrichting geeft: vers primair fruit vraagt om frisse, lichte gerechten; secundaire en tertiaire tonen passen vaker bij romige of hartige gerechten.

Wanneer gebruik je dit bewust? Bij elke nieuwe wijn, en zeker bij het matchen van wijn aan een gerecht — de aromalaag bepaalt mee welke kant je culinair op kunt.


## Pro insight

Ruik twee keer — eerst stil, dan na swirlen — en benoem alleen wat erbij komt. Dat verschil is meestal precies de secundaire of tertiaire laag, en die precisie is sterke verkoopcontext: het geeft je meer overtuigingskracht dan een lange opsomming van vage geurwoorden.',
    '- primair aroma
- secundair aroma
- tertiair aroma
- swirlen
- aromaherkomst
',
    'Swirlen verhoogt het verdampingsoppervlak van de wijn aanzienlijk, wat verklaart waarom dezelfde wijn na swirlen vaak een extra aromalaag toont die in een stilstaand glas onopgemerkt blijft.
',
    '- Primair = druif en fruit, secundair = gisting/vinificatie, tertiair = rijping
- Swirlen activeert vluchtige aroma''s die een stil glas verbergt
- Eén descriptor per laag, maximaal drie totaal, voorkomt vage notities
- De dominante laag verklapt productiekeuzes: vers fruit versus hout of fles
- Aromalagen sturen al een eerste pairingrichting
',
    '### Opdracht

Noem drie aroma''s in een wijn.

### Checklist

- Ik benoemde fruit
- Ik benoemde productie
- Ik benoemde rijping


### Reflectievraag

Welke aromalaag herken jij het minst betrouwbaar — en welke oefening zou dat het snelst verbeteren?',
    8,
    3
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij de belangrijkste structuurelementen herkennen.
',
    'Aroma vertelt je wat een wijn ruikt; structuur vertelt je wat een wijn doet in de mond, en dat tweede is bij eenvoudige pairingbeslissingen meestal de doorslaggevende factor. Op foundation-niveau leer je vijf elementen apart voelen — zuur, tannine, alcohol, body en de balans daartussen — vóór de volle technische diepte in Module 4 volgt.

Zuur voel je als frisheid en speekselopwekking aan de zijkanten van de tong. Tannine voel je als droogte en grip op tandvlees en wangen, vooral bij rode wijn. Alcohol voel je als warmte achterin de mond en keel. Body is het gewicht of de viscositeit die de wijn in de mond geeft — licht, medium of vol. Balans is geen apart gevoel maar een conclusie: voelt geen van de andere vier elementen overheersend?

Hoe test je dat objectief? Neem een slok, houd hem even vast en doorloop de elementen in volgorde: eerst zuur (zijkanten tong), dan tannine (tandvlees/wangen), dan alcohol (warmte), dan body (totaalgewicht). Proef structuur bewust los van aroma — sluit zo nodig je ogen en focus alleen op wat je mond voelt.

Waarom is dit al op foundation-niveau nuttig? Omdat structuur, niet aroma, meestal de doorslaggevende factor is bij eenvoudige pairingbeslissingen: een gerecht met veel vet vraagt om zuur of tannine, een gerecht met weinig smaak vraagt om een lichtere body.


## Pro insight

Proef structuur apart van aroma: sluit je ogen, focus alleen op wat je mond voelt. Dat ontkoppelt twee zintuigen die je brein anders automatisch samenvoegt — een veelgemaakte fout bij beginnende proevers die aroma en mondgevoel als één indruk behandelen.',
    '- mondgevoeltest
- speekselopwekking
- tandvleesgrip
- warmtesensatie
- gewichtsperceptie
',
    'Tannine en zuur kunnen elkaars perceptie versterken in plaats van optellen: een hoog-zuur wijn voelt een gegeven hoeveelheid tannine vaak drogender aan dan dezelfde tannine in een lager-zuur wijn — structuurelementen werken nooit volledig los van elkaar.
',
    '- Structuur = zuur, tannine, alcohol, body en de balans daartussen
- Zuur voel je als frisheid en speekselopwekking
- Tannine voel je als droogte en grip, vooral bij rode wijn
- Alcohol voel je als warmte; body als gewicht in de mond
- Balans betekent dat geen element de andere overheerst
',
    '### Opdracht

Analyseer één wijn op structuur.

### Checklist

- Ik beoordeelde zuur
- Ik beoordeelde body
- Ik beoordeelde afdronk


### Reflectievraag

Welk structuurelement voel jij het lastigst om los te proeven van de andere — en waarom denk je dat dat is?',
    8,
    4
  ),
  (
    'mini-toets-wijn',
    'Mini-toets wijn',
    'Na deze les toets jij jouw kennis van module 1–3.
',
    'Losse vaardigheden bewijzen zichzelf pas op het moment dat je ze blind moet combineren — zonder etiket, zonder voorkennis, zonder vangnet. Deze mini-toets integreert kleur, aroma en structuur in één protocol, en dat is precies het moment waarop je merkt of je proefmethode standhoudt of instort.

Je toetst in vaste volgorde: visuele kleur (intensiteit, rand), aromadominantie (primair versus secundair/tertiair), structuurprofiel (zuur, tannine, alcohol, body, balans), en pas daarna een stijlhypothese — koel klimaat en fris, of warmer klimaat en vol. Documenteer die hypothese vóór de onthulling; dat dwingt objectieve calibratie in plaats van achteraf redeneren.

Hoe bereid je je voor? Vaste volgorde visueel → neus → mond → conclusie, en noteer bij je conclusie altijd één tegenargument. Fouten ontstaan meestal omdat je op aroma alleen al een conclusie trekt vóór structuur is getoetst.

Wanneer herhaal je deze integratietoets? Maandelijks, met twee willekeurige flessen uit eigen voorraad — zo bouw je een persoonlijke referentiebibliotheek op die sneller groeit dan losse lesoefeningen alleen.


## Pro insight

Leg na elke blindronde je grootste denkfout vast in één zin — bijvoorbeeld ''te snel naar fruit, te weinig naar structuur''. Dat versnelt leren meer dan tien wijnen zonder reflectie, en diezelfde discipline voorkomt later de veelgemaakte fout van te snel concluderen aan tafel.',
    '- stijlhypothese
- proefprotocol
- referentiebibliotheek
- tegenargumentcheck
- calibratiefout
',
    'Een hypothese vóór de onthulling noteren werkt beter dan achteraf redeneren, omdat je brein anders onbewust de uitkomst gaat ''verklaren'' in plaats van toetsen — vooraf schrijven dwingt eerlijke, falsifieerbare conclusies.
',
    '- Mini-toets combineert kleur, aroma en structuur in één protocol
- Hypothese vóór onthulling traint objectieve, niet-achterafse conclusies
- Fouten ontstaan meestal door te snel oordelen op aroma alleen
- Herhaling met eigen voorraad bouwt een referentiebibliotheek op
- Integratie van drie analyse-assen is de kern van deze toets
',
    '### Opdracht

Proef één wijn volledig zelfstandig.

### Checklist

- Ik keek
- Ik rook
- Ik proefde
- Ik analyseerde
- Ik concludeerde


### Reflectievraag

Welke ene observatie — kleur, aroma of structuur — had jouw conclusie het sterkst moeten sturen, en waar ging je te snel?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- structuur-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'structuur-wine'
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
    'zuur',
    'Zuur',
    'Na deze les kun jij zuur herkennen, beoordelen en begrijpen.
',
    'Een wijn met rijk fruit maar te weinig zuur valt binnen een jaar plat, hoe indrukwekkend het etiket ook klinkt. Zuur is de ruggengraat van wijn: het bepaalt frisheid, bewaarpotentieel en pairing-kracht, en zonder voldoende zuur heeft geen ander element genoeg houvast om de wijn levendig te houden.

Waarom verschilt zuur zo sterk per wijn? Klimaat is de grootste factor: koelere streken behouden meer natuurlijke zuren omdat druiven minder snel overrijpen, warmere streken verliezen zuur sneller tijdens rijping. Daarnaast speelt de druif zelf een rol — Riesling en Sauvignon Blanc houden van nature hoger zuur vast dan Viognier of Grenache.

Hoe proef je zuur objectief? Let op speekselopwekking aan de zijkanten van de tong en op hoe lang die sensatie aanhoudt. Vergelijk twee wijnen altijd bij dezelfde temperatuur — te koud overdrijft zuur, te warm verdoezelt het.

Wanneer gebruik je zuur als beslissend criterium? Bij elk gerecht met vet of zout: hoog zuur snijdt daar doorheen en houdt de mond fris. Een laagzuur wijn mist die kracht en heeft fruit of body nodig om hetzelfde gerecht te kunnen dragen.


## Food pairing

### Beste pairing

Hoogzuur wit (droge Riesling, Sauvignon Blanc) bij vette visgerechten met beurre blanc of romige saus.

### Waarom dit werkt

Zuur snijdt door het vet en houdt het gerecht licht zonder de smaak te verdoezelen; het reset de mond voor elke volgende hap.

### Vermijd

Laagzuur, volle witte wijn bij hetzelfde vette gerecht — de wijn voelt dan log en het gerecht domineert in plaats van de combinatie.

## Pro insight

Test zuur altijd bij dezelfde temperatuur als waarop je serveert — te koud overdrijft zuur, te warm verdoezelt het. Dat is een veelgemaakte fout bij interne proeverijen die een vertekend beeld geeft vóór de wijn ooit bij een gast op tafel staat.',
    '- zuurgraad
- frisheid
- bewaarpotentieel
- speekselopwekking
- zuur-vetbalans
',
    'Zuur wordt tijdens de rijping in de wijngaard afgebroken door ademhaling van de druif zelf, niet door verdunning — een koelere nacht remt die ademhaling, wat verklaart waarom diurnaal verschil zo veel invloed heeft op het uiteindelijke zuurniveau.
',
    '- Zuur is de ruggengraat: bepaalt frisheid en bewaarpotentieel
- Koel klimaat en bepaalde druiven geven van nature meer zuur
- Je proeft zuur als speekselopwekking aan de zijkanten van de tong
- Hoog zuur snijdt door vet en zout in een gerecht
- Laag zuur wijn heeft fruit of body nodig ter compensatie
',
    '### Opdracht

Proef een Sauvignon Blanc en focus alleen op zuur.

### Checklist

- Ik voelde speekselvorming
- Ik herkende frisheid
- Ik noteerde intensiteit


### Reflectievraag

Bij welk gerecht op jouw kaart zou een hoger zuurprofiel de pairing meteen verbeteren?',
    8,
    1
  ),
  (
    'tannines',
    'Tannines',
    'Na deze les kun jij tannines herkennen en beoordelen.
',
    'Een gast die tannine ''bitter'' noemt, verwart twee verschillende gevoelens — en dat onderscheid is precies waar jij als sommelier het verschil maakt. Tannine ontstaat uit fenolen in schil, pit, steel en eventueel hout, en geeft structuur, bewaarpotentieel en een groot deel van het mondgevoel, vooral bij rode wijn.

De hoeveelheid en het karakter van tannine volgen uit de druif en de productie: dikschillige druiven zoals Cabernet Sauvignon en Nebbiolo geven van nature meer tannine dan dunschillige druiven zoals Pinot Noir of Gamay. Houtlagering voegt een extra laag tannine toe, los van de druif.

Hoe proef je tannine, en hoe herken je kwaliteit? Voel je naar droogte en grip op tandvlees en wangen. Rijpe tannine voelt zacht en geïntegreerd; onrijpe of ''groene'' tannine voelt scherp en bijtend, ook al is de hoeveelheid soms vergelijkbaar.

Wanneer is tannine beslissend voor je advies? Eiwit en vet in een gerecht binden tanninemoleculen en maken de wijn zachter, terwijl het vlees of de saus zelf sappiger overkomt. Zonder dat tegenwicht domineert tannine een gerecht juist.


## Food pairing

### Beste pairing

Tanninerijke rode wijn (Cabernet Sauvignon, Nebbiolo) bij geroosterd rood vlees met natuurlijk vet.

### Waarom dit werkt

Eiwit en vet binden de tanninemoleculen, waardoor de wijn zachter aanvoelt en het vlees juist sappiger overkomt.

### Vermijd

Dezelfde tanninerijke wijn bij een licht, eiwitarm visgerecht — de tannine domineert dan zonder tegenwicht en voelt metalig.

## Pro insight

Laat een gast tannine bewust voelen door de wijn even op het tandvlees te houden vóór doorslikken — dat maakt het verschil tussen ''droog'' en ''bitter'' meteen duidelijk. Die korte gastpsychologie-truc voorkomt dat een gast een technisch correcte wijn ten onrechte afwijst.',
    '- tannine
- fenolen
- schilcontact
- rijpe tannine
- eiwit-tanninebinding
',
    'Tannine polymeriseert tijdens rijping: kleine, scherpe moleculen klitten samen tot grotere, zachtere ketens, wat verklaart waarom dezelfde hoeveelheid tannine in een oudere wijn milder aanvoelt zonder dat er fysiek tannine is verdwenen.
',
    '- Tannine komt van schil, pit, steel en eventueel houtlagering
- Je voelt tannine als droogte en grip op tandvlees en wangen
- Dikschillige druiven en houtlagering geven van nature meer tannine
- Rijpe tannine voelt zacht; onrijpe tannine voelt scherp en groen
- Eiwit en vet temperen de drogende werking van tannine
',
    '### Opdracht

Proef een stevige rode wijn.

### Checklist

- Ik voelde grip
- Ik voelde uitdroging
- Ik noteerde intensiteit


### Reflectievraag

Welke tanninerijke wijn op je kaart verdient een vetter gerecht dan hij nu krijgt?',
    8,
    2
  ),
  (
    'alcohol',
    'Alcohol',
    'Na deze les kun jij alcohol in wijn herkennen en inschatten.
',
    'Een wijn die ''heet'' aanvoelt zonder een extreem percentage op het etiket, heeft zelden een alcoholprobleem — vaker een zuurprobleem. Alcohol ontstaat tijdens gisting uit suiker en voel je niet als smaak maar als warmte, en die warmte is alleen geïntegreerd wanneer er genoeg zuur is om hem te dragen.

Hoe voel je alcohol in de mond? Niet als smaak maar als warmte, vooral achterin de mond en in de keel. Alcohol draagt ook bij aan body en kan zelfs aanvoelen als zoetheid, ook in een technisch droge wijn — een veelgemaakte verwarring bij beginnende proevers.

Waarom is de balans met zuur hier cruciaal? Hoog alcohol zonder voldoende zuur voelt log of ''heet'' aan; hoog alcohol met genoeg zuur kan juist goed geïntegreerd overkomen, zoals bij volle Chardonnay uit een warmer klimaat. Alcohol op zichzelf is dus nooit het hele verhaal.

Wanneer is alcohol beslissend voor je advies? Alcohol versterkt de brandende werking van scherp gekruid eten — chili en hoog alcohol vormen een slechte combinatie. Bij stevige, hartige gerechten met veel umami werkt diezelfde warmte juist ondersteunend.


## Food pairing

### Beste pairing

Volle, hoog-alcohol witte of rode wijn bij stevige, hartige stoofschotels met umami-diepte.

### Waarom dit werkt

Alcohol en body matchen de zwaarte van het gerecht; de warmte van de wijn versterkt umami zonder dat zuur of tannine hoeven te compenseren.

### Vermijd

Hoog-alcohol wijn bij scherp gekruide, pittige gerechten — alcohol versterkt de brandende sensatie van chili in plaats van die te verzachten.

## Pro insight

Bij twijfel over het alcoholniveau: vraag of de afdronk warmte achterlaat in de keel. Dat is een betrouwbaardere test dan het percentage op het etiket, en het voorkomt de veelgemaakte fout om een ''heet'' aanvoelende wijn verkeerd te diagnosticeren als alcoholprobleem in plaats van zuurprobleem.',
    '- alcoholpercentage
- gistingsproces
- warmtesensatie
- body-bijdrage
- alcohol-pittigheid
',
    'Alcohol verlaagt de viscositeitsdrempel waarop je body waarneemt, wat verklaart waarom twee wijnen met identiek extract toch verschillend ''vol'' kunnen aanvoelen zodra het alcoholpercentage uiteenloopt.
',
    '- Alcohol ontstaat uit suikeromzetting tijdens gisting
- Klimaat en rijpheid bij de oogst bepalen het natuurlijke alcoholniveau
- Je voelt alcohol als warmte achterin de mond en keel, niet als smaak
- Hoog alcohol zonder genoeg zuur voelt log of ''heet'' aan
- Alcohol versterkt de brandende werking van pittig eten
',
    '### Opdracht

Vergelijk een wijn van 12% en 15%.

### Checklist

- Ik voelde verschil
- Ik noteerde warmte
- Ik beoordeelde balans


### Reflectievraag

Welk gerecht op je kaart zou je heroverwegen omdat de wijn ernaast te veel alcoholwarmte toevoegt?',
    8,
    3
  ),
  (
    'body',
    'Body',
    'Na deze les kun jij body herkennen en benoemen.
',
    'Body is het kenmerk waar de meeste pairingfouten ontstaan, juist omdat het los staat van aroma en zoetheid — een lichte wijn naast een zwaar gerecht verdwijnt simpelweg, hoe goed de smaken ook matchen. Body is het gewicht en de viscositeit die je in de mond voelt, opgebouwd uit alcohol, glycerol, extract en tannine samen.

Licht, medium en vol zijn relatieve categorieën, geen absolute meetwaarden. Een handige analogie: vergelijk body met melk — licht is als halfvolle melk, vol is als room. Klimaat, druif en wijnmaakkeuzes (houtlagering, lees-contact, malolactische gisting) duwen een wijn richting een van die drie.

Hoe proef je body objectief, los van smaakvoorkeur? Laat een gast twee wijnen vergelijken puur op ''mondgevoel'', zonder aroma te benoemen — body wordt dan voelbaar als een apart kenmerk, niet als onderdeel van de algemene indruk.

Wanneer is body beslissend voor je advies? Body moet matchen met het gewicht van het gerecht: een lichte wijn naast een zwaar, romig gerecht verdwijnt; een volle wijn naast een delicaat gerecht overweldigt het. Mismatch op body is een van de meest voorkomende pairingfouten.


## Food pairing

### Beste pairing

Volle, romige witte wijn (gerijpt op hout of lees) bij rijke gevogelte- of paddenstoelengerechten met boter.

### Waarom dit werkt

Gelijk gewicht houdt de balans: de textuur van de wijn matcht de textuur van het gerecht zonder dat een van beide verdwijnt.

### Vermijd

Lichte, slanke wijn bij een zwaar, romig gerecht — de wijn wordt dan onzichtbaar en voegt niets toe aan de smaakervaring.

## Pro insight

Laat een gast twee wijnen vergelijken op ''mondgevoel'' zonder aroma te benoemen — body wordt dan voelbaar los van smaakvoorkeur. Dat is een sterk upsellmoment: zodra een gast het gewichtsverschil zelf voelt, accepteert hij makkelijker een duurdere, vollere fles.',
    '- body
- viscositeit
- glycerol
- extract
- gewichtmatching
',
    'Glycerol, een bijproduct van gisting, draagt zoeter en voller aan body bij zonder dat er suiker aanwezig is — wat verklaart waarom een volledig droge wijn toch een romige indruk kan geven.
',
    '- Body is het gewicht en de viscositeit die je in de mond voelt
- Alcohol, glycerol, extract en tannine bouwen samen body op
- Licht, medium en vol zijn relatieve, geen absolute categorieën
- Vergelijk body met melk: licht als halfvol, vol als room
- Body moet matchen met het gewicht van het gerecht
',
    '### Opdracht

Vergelijk een Pinot Grigio met een Amarone.

### Checklist

- Ik voelde verschil
- Ik benoemde body
- Ik noteerde waarom


### Reflectievraag

Welke wijn op je kaart heeft een body die niet aansluit bij het gerecht waar hij nu naast staat?',
    8,
    4
  ),
  (
    'balans',
    'Balans',
    'Na deze les kun jij balans beoordelen als kwaliteitsindicator.
',
    'Een wijn kan op elk los element — zuur, tannine, alcohol, body — technisch correct scoren en toch onbalans voelen zodra je ze samen proeft. Balans is precies die synthese, en het is de zwakste schakel tussen die elementen die bepaalt waar een wijn ''breekt'', vooral zodra je er eten naast zet.

Waarom weegt balans zwaarder dan losse sterkte? Omdat een gerecht of een gast de wijn als geheel ervaart, niet als losse onderdelen. Hoog alcohol is geen probleem als het zuur het draagt; hoge tannine is geen probleem als body en fruit meegaan. Onbalans ontstaat zodra één element uit de pas loopt met de rest.

Hoe beoordeel je balans systematisch? Score elk element apart — zuur, tannine, alcohol, body — en zoek de zwakste schakel. Die schakel is waar de wijn ''breekt'', vooral zodra je eten toevoegt: een zwakte die in de wijn alleen nog meevalt, wordt scherp zichtbaar naast een complex gerecht.

Wanneer gebruik je deze analyse in de praktijk? Stel bij elke pairingvraag eerst de vraag ''wat is de zwakste schakel in deze wijn?'' vóór je het gerecht kiest. Dat voorkomt mismatches en geeft je ook een woord voor service-correctie: temperatuur, glas of een aangepast gerecht.


## Food pairing

### Beste pairing

Goed gebalanceerde wijn met evenwicht tussen zuur en alcohol bij een gerecht met zowel zout als vet, zoals gebraden kip met jus.

### Waarom dit werkt

Balans in de wijn geeft ruimte om met meerdere smaakcomponenten in het gerecht te schakelen, zonder dat één element de match overneemt.

### Vermijd

Een onbalans wijn (hoog alcohol, laag zuur) bij een complex gerecht met zowel zoet als zuur — de wijn kan dan geen van beide goed dragen.

## Pro insight

Stel bij elke pairingvraag eerst de vraag ''wat is de zwakste schakel in deze wijn?'' vóór je het gerecht kiest — dat voorkomt de meeste mismatches. Een veelgemaakte fout is een wijn op zijn sterkste element verkopen zonder de zwakste schakel te checken.',
    '- zwakste schakel
- elementscore
- breekpuntanalyse
- pairingcorrectie
- servicecorrectie
',
    'Balans is geen vast eindpunt maar verschuift met temperatuur en gerecht: een wijn die op zichzelf onbalans lijkt, kan naast het juiste gerecht plots wél in evenwicht ogen, omdat het gerecht de zwakste schakel compenseert.
',
    '- Balans betekent dat geen structuurelement de andere overheerst
- Beoordeel elk element apart en zoek de zwakste schakel
- Een wijn kan technisch correct zijn en toch onbalans voelen
- Onbalans wordt het scherpst zichtbaar zodra je eten toevoegt
- Balans is het eindoordeel ná zuur, tannine, alcohol en body apart
',
    '### Opdracht

Proef één wijn en beoordeel puur op balans.

### Checklist

- Ik analyseerde zuur
- Ik analyseerde tannine
- Ik analyseerde alcohol
- Ik beoordeelde harmonie


### Reflectievraag

Welke wijn op je kaart zou jij nu herclassificeren als ''onbalans'' nadat je elk element apart hebt gescoord?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- druivenrassen-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'druivenrassen-wine'
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
    'witte-druivenbasis',
    'Witte druivenbasis',
    'Na deze les herken jij de belangrijkste witte basisdruiven.
',
    'Vraag een beginnende proever wat Chardonnay ''smaakt'' en je krijgt een trucvraag terug, want de druif zelf is bijna neutraal — wat je proeft is vooral de wijnmaker. Witte druivenrassen zijn je eerste woordenboek voor stijl, en vier druiven — Chardonnay, Sauvignon Blanc, Riesling, Pinot Grigio — geven je op foundation-niveau al een bruikbare starthypothese.

Chardonnay is een kameleon: de druif zelf is relatief neutraal en neemt vooral de signatuur van de wijnmaker over — hout, lees-contact en malolactische gisting bepalen meer dan de druif alleen. Sauvignon Blanc is aromatisch, met een kruidig-citrus en vaak grassig karakter en van nature hoog zuur.

Riesling combineert hoog zuur met een breed zoetheidsspectrum, van bot droog tot uitgesproken zoet, en bouwt daardoor een uitzonderlijk bewaarpotentieel op. Pinot Grigio is neutraal en licht van karakter, gericht op directe, toegankelijke drinkbaarheid zonder veel complexiteit te eisen van de proever.

Waarom is dit nuttig vóór je verder gaat? Omdat druif je een starthypothese geeft, geen eindoordeel — klimaat en wijnmaken passen die hypothese later bij. Dat raamwerk komt terug in lesson 25.


## Food pairing

### Beste pairing

Sauvignon Blanc bij geitenkaas of een kruidige groene salade met vinaigrette.

### Waarom dit werkt

Hoog zuur en het kruidig-citrus aroma matchen de frisheid en lichte zuurgraad van het gerecht, zonder dat de wijn wordt overweldigd.

### Vermijd

Pinot Grigio bij hetzelfde sterk kruidige gerecht — de neutrale aromatiek en lagere zuurintensiteit verdwijnen tegen de kruiden.

## Pro insight

Onthoud per druif één woord: Chardonnay = kameleon, Sauvignon Blanc = kruidig, Riesling = zuurspectrum, Pinot Grigio = neutraal. Die compacte verkoopcontext-taal is genoeg om een kaart snel te lezen en een aarzelende gast binnen tien seconden een richting te geven.',
    '- Chardonnay
- Sauvignon Blanc
- Riesling
- Pinot Grigio
- druivenhypothese
',
    'Chardonnay-klonen verschillen onderling sterker in opbrengst en aromaprofiel dan veel andere druivenrassen, wat deels verklaart waarom ''kameleon'' niet alleen aan wijnmaken te danken is, maar ook aan de genetische variatie binnen de druif zelf.
',
    '- Chardonnay is een kameleon: stijl volgt vooral wijnmakerskeuzes
- Sauvignon Blanc is aromatisch met kruidig-citrus en grassig karakter en hoog zuur
- Riesling combineert hoog zuur met een breed zoetheidsspectrum
- Pinot Grigio is neutraal en licht, gericht op directe drinkbaarheid
- Druif geeft een starthypothese, geen eindoordeel over stijl
',
    '### Opdracht

Zoek drie flessen van deze druiven.

### Checklist

- Ik vond Chardonnay
- Ik vond Sauvignon Blanc
- Ik vond Riesling
- Ik vond Pinot Grigio


### Reflectievraag

Welke witte druif op je kaart verrast gasten het meest zodra ze de basis-stijl kennen?',
    8,
    1
  ),
  (
    'rode-druivenbasis',
    'Rode druivenbasis',
    'Na deze les herken jij de belangrijkste rode basisdruiven.
',
    'Verwar een Pinot Noir uit Bourgogne nooit met een Cabernet uit Bordeaux op basis van regio alleen — het tannine- en lichaamsniveau van de druif zelf vertelt je sneller en betrouwbaarder wat je in het glas kunt verwachten. Vier druiven vormen dat raamwerk: Cabernet Sauvignon, Merlot, Pinot Noir en Syrah/Shiraz.

Cabernet Sauvignon heeft een dikke schil, geeft van nature hoog tannine en hoog zuur, en bouwt daardoor groot bewaarpotentieel op. Merlot heeft zachter tannine en een rondere structuur, en vult daarom vaak Cabernet-blends aan om de scherpe randjes te temperen.

Pinot Noir heeft een dunne schil, is licht van lichaam met weinig tannine, en is gevoelig voor klimaat — kleine verschillen in temperatuur veranderen de stijl sterk. Syrah en Shiraz zijn dezelfde druif onder een andere naam: vol van lichaam en kruidig, met een stijl die varieert van peperig in koeler klimaat tot jamerig en rijp in warmer klimaat.

Waarom dit raamwerk eerst? Omdat tannine- en lichaamsniveau direct een pairinghypothese geven, nog vóór je weet uit welke regio de wijn komt — dat voorkomt verwarring tussen bijvoorbeeld Pinot Noir uit Bourgogne en Cabernet uit Bordeaux.


## Food pairing

### Beste pairing

Cabernet Sauvignon bij geroosterd rood vlees met korst; Pinot Noir bij eend of gevogelte met fruitige jus.

### Waarom dit werkt

Tanninerijke, volle druiven vragen om eiwit en vet om te zachten; lichtere, zuurrijke druiven passen bij fijner vlees zonder de wijn te overschaduwen.

### Vermijd

Pinot Noir bij zwaar gegrild rood vlees met korst — de wijn mist tannine en body om tegen het vet op te boksen.

## Pro insight

Leer eerst tannine- en lichaamsniveau per druif kennen vóór je regio''s erbij haalt — dat voorkomt verwarring tussen Pinot Noir uit Bourgogne en Cabernet uit Bordeaux. Die volgorde werkt ook vanuit gastpsychologie sterker: structuur communiceert sneller dan een geografische naam die de gast misschien niet kent.',
    '- Cabernet Sauvignon
- Merlot
- Pinot Noir
- Syrah/Shiraz
- tanninehypothese
',
    'Tanninekorrel — fijn of grof — wordt deels bepaald door de schildikte van de druif, niet alleen door extractietechniek, wat verklaart waarom Cabernet Sauvignon onder vergelijkbare wijnmaakkeuzes toch structureel grover aanvoelt dan Pinot Noir.
',
    '- Cabernet Sauvignon: dikke schil, hoog tannine, groot bewaarpotentieel
- Merlot: zachter tannine, ronder, vult vaak Cabernet-blends aan
- Pinot Noir: dunne schil, licht van lichaam, gevoelig voor klimaat
- Syrah/Shiraz: vol van lichaam, kruidig, varieert van peperig tot jamerig
- Tannine- en lichaamsniveau van de druif sturen de eerste pairinghypothese
',
    '### Opdracht

Vergelijk drie rode wijnen van deze druiven.

### Checklist

- Ik proefde verschil
- Ik noteerde structuur
- Ik noteerde aroma


### Reflectievraag

Welke rode druif op je kaart wordt nu verkeerd gepositioneerd ten opzichte van zijn werkelijke tannine- en lichaamsniveau?',
    8,
    2
  ),
  (
    'aromatische-druiven',
    'Aromatische druiven',
    'Na deze les begrijp jij wat aromatische druiven uniek maakt.
',
    'Ruik je aan een glas zonder te swirlen en valt de geur je al van een afstand op, dan proef je vrijwel zeker een aromatisch ras — geen toeval, maar een meetbaar verschil in geurstofgehalte. Aromatische druiven zoals Sauvignon Blanc, Riesling, Gewürztraminer en Muscat blijven daardoor intens en herkenbaar, zelfs wanneer terroir of wijnmaken minder uitgesproken is.

Sauvignon Blanc en Riesling kennen je al uit lesson 21; daar voegen Gewürztraminer en Muscat zich bij als klassieke voorbeelden. Gewürztraminer combineert lychee, rozenblaadjes en gember met relatief lage zuur, vaak met een lichte restzoet. Muscat is bloemig en uitgesproken ''druivig'', vaak ingezet voor zoete of mousserende stijlen.

Waarom is deze categorie zo nuttig? Aromatische intensiteit kan in een pairing een deel van het werk doen dat anders zoetheid of vet zou moeten doen — vooral bij kruidig of pittig eten, waar de aromatische laag de kruiden in het gerecht spiegelt.

Wanneer herken je een aromatisch ras blind het snelst? Ruik aan het glas zónder eerst te swirlen — een sterke, directe geur die je al van een afstand opvalt, wijst meteen op een aromatisch ras in plaats van een neutrale druif.


## Food pairing

### Beste pairing

Gewürztraminer met een lichte restzoet bij pittige Aziatische gerechten met gember en koriander.

### Waarom dit werkt

De aromatische intensiteit en lichte zoetheid temperen scherpte, terwijl de bloemige tonen aansluiten op de kruiden in het gerecht.

### Vermijd

Droge, hoog-zuur Sauvignon Blanc bij zeer pittig eten zonder zoetheid — zuur alleen verzacht chili-scherpte niet en kan die juist versterken.

## Pro insight

Bij twijfel over een onbekende witte wijn: ruik eerst aan het glas zonder swirlen. Sterke, directe aromatiek wijst meteen op een aromatisch ras — en dat snelle signaal is een mooi upsellmoment om een gast direct naar een passende, specerijrijke gerechtcombinatie te leiden.',
    '- aromatische intensiteit
- terpenen
- Gewürztraminer
- Muscat
- kruidenpairing
',
    'Terpenen, de geurstofklasse achter aromatische druiven, zitten al vóór de oogst in hoge concentratie in de druif zelf, wat verklaart waarom aromatische rassen ook bij een onervaren wijnmaker nog herkenbaar blijven.
',
    '- Aromatische druiven hebben van nature intense, herkenbare aroma''s
- Sauvignon Blanc, Riesling, Gewürztraminer en Muscat zijn klassieke voorbeelden
- Gewürztraminer combineert lychee en rozenaroma met relatief lage zuur
- Muscat is bloemig en druivig, vaak ingezet voor zoete of mousserende stijlen
- Aromatische intensiteit is een sterk hulpmiddel bij kruidige gerechten
',
    '### Opdracht

Ruik een Gewürztraminer of Muscat.

### Checklist

- Ik herkende bloemen
- Ik herkende fruit
- Ik noteerde intensiteit


### Reflectievraag

Welke aromatische druif zou jij toevoegen aan je kaart om pittige gerechten beter te kunnen pairen?',
    8,
    3
  ),
  (
    'neutrale-druiven',
    'Neutrale druiven',
    'Na deze les begrijp jij wat neutrale druiven zijn.
',
    'Noem een druif nooit ''saai'' voordat je begrijpt wat hij wél doet: neutrale rassen zoals ongehoute Chardonnay, Pinot Grigio en Trebbiano zijn juist de beste terroir-boodschappers omdat ze zichzelf niet op de voorgrond zetten. Zonder dominant eigen aroma laat de druif klimaat, bodem en wijnmaken veel duidelijker doorklinken.

Waarom is deze categorie waardevol, en niet ''saai''? Omdat neutrale druiven de beste terroir-boodschappers zijn — zonder dominant eigen aroma laat de druif klimaat, bodem en wijnmaken duidelijker doorklinken dan een aromatisch ras dat altijd zichzelf op de voorgrond zet.

Hoe bouw je een pairing op rond een neutrale druif? Niet via aroma-match, maar via zuur, body en mineraliteit — de structuurelementen uit Module 4 worden hier het belangrijkste gereedschap, omdat aroma simpelweg minder houvast geeft.

Wanneer zet je neutrale druiven bewust in op een kaart? Gebruik ze als ''blanco canvas'': ze passen bij meer gerechten dan aromatische rassen, juist omdat ze niet domineren en ruimte laten voor de smaak van het gerecht zelf.


## Food pairing

### Beste pairing

Ongehoute Chardonnay of Albariño bij lichte visgerechten met citroen en olijfolie.

### Waarom dit werkt

Zonder dominant aroma laat de wijn ruimte voor de smaak van het gerecht; zuur en mineraliteit dragen de match in plaats van aromaherkenning.

### Vermijd

Sterk aromatische Gewürztraminer bij dezelfde subtiele visbereiding — de aromatiek overschaduwt de fijne smaken van het gerecht.

## Pro insight

Gebruik neutrale druiven als ''blanco canvas'' op je kaart: ze passen bij meer gerechten dan aromatische rassen, juist omdat ze niet domineren. Een veelgemaakte fout is neutrale wijnen als ''saai'' wegzetten in plaats van als flexibele verkoopcontext-optie voor onzekere gasten.',
    '- neutrale druif
- terroir-boodschapper
- Chardonnay ongehout
- mineraliteit
- canvaspairing
',
    'Neutrale druiven bevatten van nature minder vrije aromatische precursors, wat verklaart waarom wijnmaakkeuzes — hout, lees-contact, gisting — bij deze rassen relatief een groter aandeel van het uiteindelijke aromaprofiel bepalen dan bij aromatische druiven.
',
    '- Neutrale druiven hebben van nature minder uitgesproken aroma
- Ongehoute Chardonnay, Pinot Grigio en Trebbiano zijn klassieke voorbeelden
- Terroir en wijnmaken spreken luider dan het druifkarakter zelf
- Neutrale druiven zijn ideale terroir-boodschappers in een glas
- Pairing bouw je hier op zuur, body en mineraliteit, niet op aroma-match
',
    '### Opdracht

Vergelijk twee Chardonnays uit verschillende landen.

### Checklist

- Ik proefde verschil
- Ik zag terroirinvloed
- Ik noteerde stijl


### Reflectievraag

Welke neutrale witte wijn op je kaart gebruik je nog te weinig als flexibele pairingoptie?',
    8,
    4
  ),
  (
    'hoe-druiven-stijl-bepalen',
    'Hoe druiven stijl bepalen',
    'Na deze les begrijp jij hoe druiven de stijl van wijn fundamenteel bepalen.
',
    '''Ik proef Chardonnay'' zegt op zichzelf nog niets over stijl, en wie dat wel denkt, mist twee van de drie lagen die een wijn vormen. Stijl is altijd druif plus klimaat plus wijnmaken — dezelfde druif kan van slank en mineraal naar tropisch en boterig bewegen, puur door waar hij groeide en hoe hij werd vinifieerd.

Klimaat is de tweede laag: een koel klimaat behoudt meer zuur en geeft slankere, citrusachtige stijlen; een warm klimaat geeft rijper fruit en minder zuur, met een voller resultaat. Dezelfde Chardonnay kan zo van slank en mineraal naar tropisch en boterig bewegen, puur door waar de druiven groeiden.

Wijnmaken is de derde laag: houtlagering, lees-contact, schilcontact en fermentatietemperatuur voegen een signatuur toe die los staat van druif en klimaat. Een ongehoute en een gehoute versie van dezelfde druif uit dezelfde wijngaard kunnen volledig anders proeven.

Waarom stop je hier op foundation-niveau? Omdat de volledige diepte per druif en regio bij de specialistische wit- en rodewijntracks hoort. Hier leer je het raamwerk: bij een onbekende wijn doorloop je in volgorde druif, klimaat, wijnmaken — dat geeft een snelle, betrouwbare stijlhypothese vóór je verder de diepte in gaat.


## Food pairing

### Beste pairing

Gebruik het drielagenraamwerk om bij een onbekende wijn eerst druif, dan klimaat, dan wijnmaken te bepalen vóór je een gerecht kiest — bijvoorbeeld een warm-klimaat Chardonnay met houtlagering bij rijke kreeft in botersaus.

### Waarom dit werkt

Door de drie lagen apart te lezen, kies je een gerecht dat past bij de werkelijke body en zuurbalans van de wijn, niet bij een aanname op basis van de druifnaam alleen.

### Vermijd

Een gerecht kiezen puur op de naam van de druif, bijvoorbeeld ''Chardonnay is altijd boters'', zonder klimaat of wijnmaken te checken — dat leidt tot mismatches tussen een slanke en een volle stijl.

## Pro insight

Train jezelf om bij elke nieuwe wijn deze volgorde te doorlopen: druif, klimaat, wijnmaken. Na honderd wijnen wordt dat een automatisme dat blind proeven versnelt en je tegelijk beschermt tegen de veelgemaakte fout om op druifnaam alleen een stijl te voorspellen.',
    '- druif-klimaat-wijnmaken
- stijlhypothese
- koel versus warm klimaat
- wijnmaaksignatuur
- stijlraamwerk
',
    'Dezelfde druif, geplant op twee plekken met honderd kilometer afstand, kan een verschil in natuurlijk alcoholpotentieel van twee volle procentpunten opleveren puur door klimaat — wijnmaken kan dat verschil bijsturen, maar niet volledig wegpoetsen.
',
    '- Stijl = druif + klimaat + wijnmaken, niet druif alleen
- Dezelfde druif kan totaal anders smaken in koel versus warm klimaat
- Wijnmaakkeuzes (hout, gist, schilcontact) voegen een derde laag toe
- Drie vragen op volgorde geven een snelle stijlhypothese
- Dit raamwerk is de basis; diepgang per druif volgt in de specialistentracks
',
    '### Opdracht

Kies drie favoriete druiven en beschrijf hun stijl.

### Checklist

- Ik koos drie druiven
- Ik noteerde structuur
- Ik noteerde aroma


### Reflectievraag

Bij welke wijn op je kaart zou het drielagenraamwerk — druif, klimaat, wijnmaken — je advies aan gasten het meest verbeteren?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klimaat-terroir-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'klimaat-terroir-wine'
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
    'koel-klimaat',
    'Koel klimaat',
    'Na deze les begrijp jij hoe koel klimaat wijn beïnvloedt.
',
    '''Het is er fris'' is geen klimaatanalyse maar een gevoel — koel klimaat is een meetbaar effect van temperatuur op de fysiologie van de druif, met directe gevolgen voor zuurgraad en rijping. Een groot diurnaal verschil tussen warme dagen en koude nachten remt de afbraak van appelzuur, wat hogere totale zuurgraad geeft, zelfs bij volledige suikerrijping.

Specialistisch gezien loopt de fenolische rijping (tannine, kleurstoffen, aromatische precursors) in koele gebieden vaak achter op de suikerrijping. Te vroeg oogsten om zuur te behouden kan onrijpe, groene tannine of pyrazinetonen (groene paprika) opleveren — een klassieke valkuil in marginale koele gebieden.

Referentiegebieden: Mosel (leisteen, Riesling), Chablis (Kimmeridgien kalksteen), Champagne, Sancerre, Central Otago en Tasmanië. De Huglin-index (een verfijning van graaddagen) wordt door specialisten gebruikt om gebieden objectief te classificeren in plaats van te vertrouwen op reputatie alleen.

Onderscheid ''koel klimaat'' (structureel kenmerk van een regio) van een ''koel jaargang'' (een atypisch jaar in een normaal warmer gebied) — die twee worden in de praktijk vaak verward, met verkeerde verwachtingen als gevolg.


## Food pairing

### Beste pairing

Chablis 1er Cru bij oesters en schaaldieren met citroen.

### Waarom dit werkt

Hoge zuren en mineraliteit spiegelen de jodiumtonen en snijden door de natuurlijke zoutigheid.

### Vermijd

Rijk gegrild rood vlees — de wijn mist body en alcohol om dat gewicht te dragen.

## Pro insight

Vraagt een gast om ''iets fris'' zonder regio te noemen? Vraag door naar het gewenste zuurniveau in plaats van een hele regiolijst op te noemen — dat is verwachtingsmanagement die sneller filtert en voorkomt dat een technisch koel-klimaat-fles toch te scherp aanvoelt voor die gast.',
    '- diurnaal temperatuurverschil
- malaatbehoud
- Huglin-index
- fenolische rijping
- aromatische precursors
',
    'De Huglin-index telt niet alleen temperatuur maar ook daglengte mee, wat verklaart waarom twee regio''s met dezelfde gemiddelde temperatuur toch een ander klimaatprofiel voor druivenrijping kunnen hebben.
',
    '- Groot diurnaal verschil remt zuurafbraak: meer appelzuur behouden
- Fenolische rijping loopt vaak achter op suikerrijping — risico op groene tannine
- Huglin-index classificeert klimaat objectief, los van regio-reputatie
- Referentiegebieden: Mosel, Chablis, Champagne, Sancerre, Central Otago
- Onderscheid koel klimaat (structureel) van koele jaargang (incidenteel)
',
    '### Opdracht

Vergelijk een Chablis met een warmere Chardonnay.

### Checklist

- Ik proefde meer zuur
- Ik proefde meer spanning
- Ik noteerde verschil


### Reflectievraag

Welke twee koel-klimaatregio''s zou jij naast elkaar zetten om het effect van bodem (bijvoorbeeld kalk versus leisteen) op smaak te isoleren — terwijl het klimaat zelf vergelijkbaar blijft?',
    8,
    1
  ),
  (
    'gematigd-klimaat',
    'Gematigd klimaat',
    'Na deze les begrijp jij wat gematigd klimaat doet.
',
    'In een gematigd klimaat is de foutmarge kleiner dan in elk extreem klimaat: één koelere jaargang kipt al snel richting groen en scherp, één warmere richting jammy en log. Dat is precies waarom jaargangvariatie in gebieden als Bordeaux, Bourgogne, Rioja en Piemonte vaak prominenter is dan het verschil tussen twee gematigde regio''s onderling.

Bordeaux toont dit door zijn maritieme moderatie (Atlantische Oceaan en de Gironde temperen extremen), Bourgogne door zijn continentale karakter met reëel vorstrisico en een nauw oogstvenster, Rioja door de combinatie van Atlantisch, mediterraan en continentaal subklimaat binnen één DOCa, en Piemonte door de mist (nebbia) die de rijping van Nebbiolo vertraagt en verfijnt.

Specialistisch inzicht: in gematigde gebieden doet het klimaat slechts ''het halve werk''. Expositie, hellingsgraad en oogstmoment — menselijke beslissingen — bepalen vaak méér over het eindresultaat dan in extreme klimaten, waar het klimaat zelf al een dominante stempel drukt.


## Food pairing

### Beste pairing

Bourgogne rouge (Pinot Noir) bij eend met bospaddenstoelen.

### Waarom dit werkt

Evenwichtig zuur en fijne tannine dragen umami zonder de subtiele balans te overstemmen.

### Vermijd

Zeer specerijrijke gerechten — die overschaduwen precies de finesse die gematigd klimaat mogelijk maakt.

## Pro insight

Bij twijfel over een jaargang in een gematigd gebied: vraag eerst naar het oogstmoment, niet naar de regio. Het verschil tussen een vroege en een late oogst in hetzelfde dorp is vaak groter dan het verschil tussen twee gematigde regio''s — een nuttig feit in elke verkoopcontext bij prijsverschillen tussen jaargangen.',
    '- rijpingsvenster
- jaargangvariatie
- mesoklimaat
- Atlantische invloed
- oogstmoment
',
    'In gematigde klimaten verklaart het verschil tussen een vroege en een late oogst in hetzelfde dorp vaak een groter smaakverschil dan het verschil tussen twee hele regio''s — jaargang weegt hier zwaarder dan plek.
',
    '- Gematigd klimaat = balansvenster met smalle foutmarge tussen groen en overrijp
- Jaargangvariatie is hier vaak groter dan tussen twee gematigde regio''s onderling
- Bordeaux, Bourgogne, Rioja en Piemonte tonen elk een ander subklimaat-mechanisme
- Expositie en oogstmoment bepalen relatief meer dan het klimaat alleen
- Winkler-regio II–III is de technische classificatie achter ''gematigd''
',
    '### Opdracht

Zoek drie beroemde gematigde wijnregio''s.

### Checklist

- Ik vond drie regio''s
- Ik noteerde klimaat
- Ik noteerde druiven


### Reflectievraag

Welke jaargangfactor — vroege vorst, regen tijdens de oogst of een hittegolf — zou jij het eerst navragen bij een fles uit een gematigd gebied, vóór je iets over stijl aanneemt?',
    8,
    2
  ),
  (
    'warm-klimaat',
    'Warm klimaat',
    'Na deze les begrijp jij hoe warm klimaat wijn verandert.
',
    'In warm klimaat loopt suikeraccumulatie sneller dan fenolische rijping kan bijhouden, en dat creëert een kloof waar elke producent een antwoord op moet vinden — anders eindig je met een wijn die fenolisch rijp is, maar met een alcoholpercentage dat ver boven 14,5% uitkomt. Nachtoogst, bladwerk en koelere mesoklimaten zijn de bewuste correcties op dat risico.

Producenten in warme gebieden sturen actief bij: nachtoogst om hitte-stress en suikerpieken te vermijden, bladwerk voor schaduw op de trossen, of het zoeken naar koelere mesoklimaten binnen een warm gebied — hoogteligging in Mendoza, kustmist in delen van Napa, of de hitte-bufferende werking van licorella-leisteen in Priorat die overdag opwarmt en ''s nachts langzaam afgeeft.

Sensorisch resultaat: vol, rijp zwart fruit, jam- en specerijtonen, zachtere zuren en vaak een houtregime dat structuur moet toevoegen omdat tannine van de druif zelf minder scherp aanvoelt. Referentiegebieden: Barossa (oude, laagopbrengende Shiraz-stokken), Napa Valley, Priorat.


## Food pairing

### Beste pairing

Barossa Shiraz bij geroosterd lamsvlees met rozemarijn.

### Waarom dit werkt

Rijk fruit en zachte tannine matchen de intensiteit en het vet van het vlees.

### Vermijd

Lichte visgerechten — alcohol en body verpletteren de delicate textuur volledig.

## Pro insight

Een warme-klimaat-wijn met laag alcohol (onder 13%) is vaak interessanter dan het etiket suggereert: dat wijst meestal op vroege oogst, hoogteligging of bewuste stijlkeuze. Vraag daar gericht naar bij inkoop — het voorkomt de veelgemaakte fout om laag alcohol automatisch als ''minder serieus'' te classificeren.',
    '- graaddagen
- suiker-fenolen-kloof
- nachtoogst
- hoogteligging
- potentieel alcohol
',
    'Hoogteligging kan in warme streken hetzelfde effect hebben als een koeler klimaat: elke honderd meter hoogte daalt de gemiddelde temperatuur merkbaar, wat verklaart waarom sommige ''warme-land''-wijnen toch verrassend fris uitvallen.
',
    '- Suikeraccumulatie loopt in warm klimaat sneller dan fenolische rijping
- Risico: hoog alcohol bij volledige fenolische rijpheid
- Nachtoogst, bladwerk en koelere mesoklimaten corrigeren de balans
- Sensorisch: vol, rijp fruit, jam- en specerijtonen, zachtere zuren
- Referentiegebieden: Barossa, Napa Valley, Priorat
',
    '### Opdracht

Vergelijk een warme Shiraz met een koelere Syrah.

### Checklist

- Ik voelde body
- Ik voelde alcohol
- Ik noteerde verschil


### Reflectievraag

Bij welke warme-klimaatwijn op jouw kaart vermoed je dat de producent bewust vroeg heeft geoogst — en welk signaal in het glas (alcohol, zuur, fruitrijpheid) zou dat bevestigen?',
    8,
    3
  ),
  (
    'bodemtypes',
    'Bodemtypes',
    'Na deze les herken jij de belangrijkste bodeminvloeden.
',
    'Zeg nooit tegen een gast ''je proeft de leisteen'' — wetenschappelijk is directe mineraaloverdracht van gesteente naar wijn niet aangetoond. Wat bodem wél doet, is drainage, warmtehuishouding en mineraalbeschikbaarheid sturen, en die drie mechanismen verklaren het verschil tussen kalk, klei, zand en leisteen veel overtuigender dan het woord ''mineraliteit'' alleen.

Kalksteen (Chablis, Champagne) drainen goed en geven matige waterstress — vaak gekoppeld aan spanning en finesse. Klei (Pomerol) houdt water vast, geeft de wijnstok meer beschikbaarheid en levert vaak body en kracht. Zand (Châteauneuf-du-Pape''s zandige percelen, Colares) drainen snel en geven door warmte-isolatie vaak zachte, aromatische wijnen. Leisteen (Mosel, Douro, Priorat) slaat overdag warmte op en geeft die ''s nachts langzaam af, wat de rijping verlengt en concentratie ondersteunt. Grind/rolkeien (galets roulés) reflecteren en bufferen warmte extra sterk.

Geen enkele bodem is intrinsiek ''beter'' — de kwaliteit ontstaat uit de match tussen bodemtype, klimaat en druivenras. Dezelfde leisteen die Riesling in de Mosel scherpte geeft, geeft Touriga Nacional in de Douro juist concentratie door extra hitte.


## Food pairing

### Beste pairing

Pomerol (klei, Merlot-dominant) bij gebraiseerd rundvlees.

### Waarom dit werkt

Kleibodems geven body en zachte tannine die de rijke jus van het gerecht spiegelen.

### Vermijd

Rauwe schaaldieren — de volle structuur verdrukt de delicate zilte smaak.

## Pro insight

Vermijd op de kaart de claim ''je proeft de bodem'' — leg liever uit wat bodem doet: drainage, warmte, waterstress. Dat is technisch correcter en is goed verwachtingsmanagement, want het overtuigt zowel de kenner als de gast die voor het eerst over terroir hoort.',
    '- drainage
- warmtereflectie
- mineraliteitsperceptie
- wortelstress
- gesteentetype
',
    'Wat proevers ''mineraliteit'' noemen, blijkt in onderzoek vaker samen te hangen met reductieve aromacomponenten en hoog zuur dan met daadwerkelijke mineralen uit de bodem — de associatie is sensorisch, niet chemisch direct.
',
    '- Bodem stuurt drainage, warmtehuishouding en mineraalbeschikbaarheid — niet ''smaak via mineralen''
- Kalk → drainage en spanning; klei → waterbehoud en body; zand → warmte-isolatie en zachtheid
- Leisteen slaat warmte op en geeft die vertraagd af — verlengt rijping
- ''Mineraliteit'' is sensorisch, geen directe mineraaloverdracht
- Kwaliteit ontstaat uit de match tussen bodem, klimaat én druif
',
    '### Opdracht

Zoek van één favoriete wijn de bodemsoort.

### Checklist

- Ik vond de bodem
- Ik koppelde dit aan smaak
- Ik begreep de link


### Reflectievraag

Waarom zou je voorzichtig moeten zijn met de uitspraak ''ik proef de leisteen'' — en welke twee mechanismen (warmte, drainage) leg jij liever uit aan een gast in plaats daarvan?',
    8,
    4
  ),
  (
    'terroir-uitgelegd',
    'Terroir uitgelegd',
    'Na deze les begrijp jij het complete concept terroir.
',
    'Twee aangrenzende percelen van dezelfde producent, met dezelfde druif en dezelfde wijnmaaktechniek, kunnen structureel verschillende wijnen opleveren — en dát verschil, niet de regio op het etiket, is waar gespecialiseerde terroir-analyse begint. Terroir is de synthese van klimaat, bodem, topografie en de menselijke factor, nooit één van die elementen alleen.

Specialistisch is het cruciaal om macroklimaat (de regio) te onderscheiden van mesoklimaat (het perceel) en microklimaat (de individuele wijnstok of rij). Twee percelen op honderd meter afstand kunnen door expositie en hellingshoek een volledig ander rijpingsprofiel hebben — exact de logica achter het Bourgondische climats-systeem, waarbij aangrenzende stukken grond officieel verschillende kwaliteitsniveaus krijgen.

Terroir verklaart dus niet alleen waarom Pinot Noir uit Bourgogne anders smaakt dan Pinot Noir uit Oregon, maar ook waarom twee naburige percelen van dezelfde producent, met dezelfde druif en dezelfde wijnmaaktechniek, structureel verschillende wijnen opleveren. Dat laatste — niet de regio, maar het specifieke perceel — is waar gespecialiseerde terroir-analyse begint.


## Food pairing

### Beste pairing

Eenzelfde druif van twee aangrenzende percelen naast elkaar bij een neutraal gerecht zoals gepocheerde kip.

### Waarom dit werkt

Een neutraal gerecht laat het terroirverschil onvervormd naar voren komen.

### Vermijd

Een sterk gekruid gerecht tijdens een terroir-vergelijking — dat maskeert precies het verschil dat je wilt proeven.

## Pro insight

Verkoop terroir niet als ''magie van de plek'' maar als optelsom van meetbare factoren — expositie, hellingsgraad, bodemtype. Dat verhaal werkt in elke verkoopcontext beter dan vage romantiek, omdat het de prijs rechtvaardigt met logica in plaats van met sfeer alleen.',
    '- mesoklimaat
- expositie
- perceelselectie
- menselijke factor
- climats-systeem
',
    'Het Bourgondische climats-systeem kent aan percelen op slechts enkele tientallen meters van elkaar officieel verschillende kwaliteitsniveaus toe — een institutionele erkenning dat terroir tot op perceelniveau, niet alleen regio, verschil maakt.
',
    '- Terroir = klimaat + bodem + topografie + menselijke factor, in synthese
- Macro-, meso- en microklimaat zijn drie verschillende schaalniveaus
- Het Bourgondische climats-systeem toont perceelverschil binnen één dorp
- INAO-filosofie (respecteren) versus Nieuwe Wereld-filosofie (selecteren) — zelfde factoren
- Specialistische analyse kijkt naar het perceel, niet alleen de regio
',
    '### Opdracht

Vergelijk twee dezelfde druiven uit verschillende landen.

### Checklist

- Ik proefde verschil
- Ik koppelde dit aan terroir
- Ik noteerde conclusies


### Reflectievraag

Welk schaalniveau — macro-, meso- of microklimaat — gebruik jij het minst bewust in je eigen proefnotities, en welke vraag zou je daar voortaan bij moeten stellen?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-wine (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'service-wine'
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
    'Na deze les kun jij de juiste serveertemperatuur per wijnstijl bepalen.
',
    'Eén graad verschil in de kelder verklaart een groot deel van de ''te zuur'' of ''te alcoholisch''-klachten aan tafel, en toch behandelen de meeste zaken serveertemperatuur als een vast getal in plaats van een bewegend doel. Een glas warmt in een verwarmde ruimte ongeveer 1–2 °C per tien minuten op — schenk daarom altijd net iets ónder de uiteindelijke doeltemperatuur.

Snelste koelmethode: een ijsemmer met 50% water en 50% ijs koelt een fles in circa 10–15 minuten effectiever dan een koelkast, omdat het volledige contactoppervlak wordt benut. Verfijnde banden voor professionele service: mousserend 6–8 °C, fris/aromatisch wit 8–10 °C, vol gehout wit 10–12 °C, licht rood (Pinot Noir, Beaujolais) 13–15 °C, vol rood 16–18 °C, en versterkte wijn stijlafhankelijk — White Port en jonge stijlen gekoeld op 8–10 °C, oude Tawny op 12–14 °C.

Een veelgemaakte fout: ''kamertemperatuur'' voor rode wijn stamt uit een tijd zonder centrale verwarming (16–17 °C), niet uit moderne verwarmde ruimtes (21–23 °C). Te warm geserveerde rode wijn proeft vlak en benadrukt alcohol; te koud geserveerd wit sluit aroma volledig af.


## Food pairing

### Beste pairing

Zelfde Chardonnay geserveerd op 8 °C en op 14 °C naast een romige scampi-pasta.

### Waarom dit werkt

De temperatuurproef toont direct hoe boter en zuur anders balanceren bij het gerecht.

### Vermijd

Een ijskoude volle rode wijn bij dit gerecht — tannine en fruit sluiten zich volledig af.

## Pro insight

Zet een thermometer in de kelder, niet alleen in de marketing. Eén graad verschil verklaart een groot deel van de ''te zuur'' of ''te alcoholisch''-klachten aan tafel — een veelgemaakte fout is de oorzaak bij de wijn zoeken terwijl de fout in de serveertemperatuur zit.',
    '- temperatuurdrift
- koelprotocol
- serveerband
- decanteerkoeling
- alcoholperceptie
',
    'Een glas warmt in een verwarmde ruimte sneller op dan de meeste mensen denken — ongeveer 1 tot 2 °C per tien minuten — wat verklaart waarom een perfect geschonken wijn binnen een half uur al buiten zijn ideale venster kan vallen.
',
    '- Schenk altijd iets onder doeltemperatuur — een glas warmt vanzelf op tijdens service
- Ijsemmer met 50/50 water-ijs koelt sneller en gelijkmatiger dan een koelkast
- Verfijnde banden per stijl, ook binnen versterkte wijn (jong gekoeld, oud minder koud)
- ''Kamertemperatuur'' is historisch 16–17 °C — niet de moderne verwarmde 21–23 °C
- Te warm = vlak en alcoholisch; te koud = aroma''s volledig gesloten
',
    '### Opdracht

Meet thuis de temperatuur van een wijn voor het openen.

### Checklist

- Ik mat de temperatuur
- Ik vergeleek met richtlijn
- Ik corrigeerde indien nodig


### Reflectievraag

Welke fles op jouw kaart serveer je waarschijnlijk te warm of te koud — en welk aromasignaal zou je na correctie moeten proeven dat je nu mist?',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij hoe glasvorm de wijn beïnvloedt.
',
    'Glasvorm is geen esthetiek voor op de tafelfoto maar aromatechniek: kelkbreedte en de versmalling naar de rand bepalen hoeveel geurstoffen zich boven de wijn concentreren vóór ze de neus bereiken. Een verkeerd glas kan een verzorgde wijn structureel ondermaats laten overkomen, zonder dat er iets mis is met de fles zelf.

Varietal-specifieke glazen bestaan met reden: het Bordeaux-glas (hoog, brede kelk) geeft tanninerijke wijnen ruimte; het Bourgogne-glas (breder, lagere kelk) concentreert subtiele aromatiek van delicate rode en witte wijnen; het smallere, getailleerde glas voor aromatische witte wijn (Riesling, Gewürztraminer) richt florale en fruittonen direct naar de neus; het neutrale ISO-tasting-glas is de internationale standaard voor blind proeven en wedstrijden — bewust zonder stijlinterpretatie.

Glashygiëne is minstens zo belangrijk als vorm: detergent-residu doodt mousse in mousserende wijn en dempt aroma in stille wijn. Poets met een pluisvrije doek, stapel glazen niet op elkaar (geurabsorptie) en bewaar ze niet in een kast die naar karton of schoonmaakmiddel ruikt.


## Food pairing

### Beste pairing

Bourgogne Pinot Noir in een Bourgogne-kelk bij eendenborst met kersensaus.

### Waarom dit werkt

De brede kelk concentreert de subtiele rode-vruchtenaroma''s vlak boven het glas.

### Vermijd

Een smal sherryglas voor dezelfde wijn — dat comprimeert de aromatische laag te veel en verstikt de finesse.

## Pro insight

Schenk interne proeverijen altijd in een neutraal ISO- of witwijnglas; bewaar het varietal-specifieke glaswerk voor gastpresentatie. Zo vergelijk je wijnen zuiver én verkoop je toch het juiste glas aan tafel — een kleine gastpsychologie-investering die de beleving meteen verhoogt.',
    '- kelkvorm
- randdikte
- ISO-glas
- glashygiëne
- aromaconcentratie
',
    'Detergent-residu in een glas is vaak onzichtbaar voor het oog maar verstoort wel de oppervlaktespanning waarop koolzuurbubbels zich vormen, wat verklaart waarom een op het oog schoon glas mousserende wijn toch plat kan laten lijken.
',
    '- Kelkbreedte en taper bepalen aromaconcentratie vóór de neus
- Randdikte beïnvloedt hoe wijn de tong bereikt en de eerste indruk
- Bordeaux-, Bourgogne- en aromatisch-wit-glas zijn elk functioneel ontworpen
- ISO-tasting-glas is de neutrale standaard voor blind proeven
- Detergent-residu en geurabsorptie zijn de meest onderschatte servicefouten
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik rook verschil
- Ik proefde verschil
- Ik noteerde verschil


### Reflectievraag

Welk glas in jouw zaak doet een wijnstijl structureel tekort — en wat is de service- of verkoopimpact daarvan op die fles?',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren',
    'Na deze les weet jij wanneer en waarom je wijn decanteert.
',
    'Decanteren heeft twee technisch verschillende doelen die je niet mag verwarren — en de meeste service-fouten ontstaan precies op dat punt. Beluchten versnelt esterificatie en zachte oxidatie bij jonge, tanninerijke wijn; sedimentscheiding bij oude wijn vraagt een trage, vloeiende beweging over een lichtbron, gestopt zodra het depot de hals bereikt.

Bij zeer oude, fragiele wijn met veel depot maar weinig fruitreserve is dubbel decanteren de professionele techniek: eerst overschenken in de karaf om het sediment te scheiden, daarna teruggieten in de gespoelde originele fles — zo blijft luchtcontact minimaal terwijl het depot volledig weg is.

Niet elke wijn profiteert: een zeer oude, delicate wijn kan binnen minuten ''instorten'' (fruit verdwijnt, structuur valt uit elkaar) als hij te lang van tevoren wordt gedecanteerd. Decanteer die wijnen pas vlak vóór het schenken, of helemaal niet, en observeer de ontwikkeling in het glas zelf.


## Food pairing

### Beste pairing

Een jonge Barolo, twee uur voor het hoofdgerecht gedecanteerd, bij ossobuco.

### Waarom dit werkt

Lucht verzacht de strakke tannine van Nebbiolo terwijl het gerecht tijd krijgt om te garen.

### Vermijd

Een zeer oude, fragiele Bourgogne lang van tevoren decanteren — het fruit kan binnen minuten wegvallen.

## Pro insight

Laat nieuwe staff eerst oefenen met een lege fles en een kaars onder de hals — die spiermemorie voorkomt dat kostbaar depot in het glas van de gast terechtkomt onder tijdsdruk. Dat is zowel een kwaliteitskwestie als verwachtingsmanagement: een troebel glas ondermijnt het vertrouwen in een dure fles direct.',
    '- beluchting
- sedimentscheiding
- dubbel decanteren
- lichtbrontechniek
- instortrisico
',
    'Een zeer oude, fragiele wijn kan binnen enkele minuten na decanteren ''instorten'' — fruit verdwijnt en structuur valt uit elkaar — wat verklaart waarom oude flessen soms beter pas vlak vóór het schenken worden geopend dan ruim van tevoren.
',
    '- Beluchten (jonge tanninerijke wijn) en sedimentscheiding (oude wijn) zijn verschillende doelen
- Sedimentscheiding: langzaam, vloeiend, over een lichtbron, stoppen bij de hals
- Dubbel decanteren combineert sedimentscheiding met minimaal luchtcontact
- Zeer oude, fragiele wijn kan instorten bij te vroeg decanteren
- Timing is een bewuste keuze per wijnstijl en leeftijd, geen vaste regel
',
    '### Opdracht

Open een jonge rode wijn en proef direct en na 30 minuten.

### Checklist

- Ik proefde direct
- Ik proefde later
- Ik noteerde verschil


### Reflectievraag

Bij welke fles in jouw assortiment zou jij kiezen voor dubbel decanteren in plaats van gewoon decanteren — en welk signaal (leeftijd, depot, fragiliteit) bepaalt die keuze?',
    8,
    3
  ),
  (
    'bewaren-kelderen',
    'Bewaren & kelderen',
    'Na deze les begrijp jij hoe wijn correct wordt opgeslagen.
',
    'Een fles die warm, in het licht of met trilling wordt opgeslagen, verliest waarde sneller dan elke prijsdaling op de kaart — en dat is meestal een logistieke fout, geen kwaliteitsprobleem van de wijn zelf. Professionele kelderopslag vraagt vier stabiele condities tegelijk: temperatuur, luchtvochtigheid, duisternis en minimale trilling.

Liggende opslag houdt de kurk vochtig vanaf de binnenzijde, wat indroging en zuurstofinfiltratie voorkomt. Flessen met schroefdop rijpen via een ander, meer reductief pad dan kurk — geen verkeerde keuze, maar wel een andere ontwikkelingscurve die je inkoop- en bewaaradvies moet meewegen. Magnums rijpen trager dan standaardflessen door een lagere zuurstof-tot-wijn-ratio — relevant bij investeringsaankopen.

Professioneel kelderbeheer segmenteert voorraad bewust in ''drink nu'', ''2–5 jaar'' en ''bewaar lang'' — zonder die scheiding open je per ongeluk je beste fles op het verkeerde moment, of laat je een fles veel langer liggen dan zijn optimale venster toelaat.


## Food pairing

### Beste pairing

Een goed bewaarde, tien jaar oude Bourgogne bij een truffelrisotto.

### Waarom dit werkt

Trage, stabiele rijping ontwikkelt ondergrondse en umami-tonen die de truffel spiegelen.

### Vermijd

Een wijn die warm of met trilling is opgeslagen — vroegtijdige oxidatie ondermijnt precies de complexiteit die je verwacht.

## Pro insight

Label je voorraad fysiek met ''drink nu / 2–5 jaar / bewaar'' — zonder die scheiding open je per ongeluk je beste investering veel te vroeg. Dat is een veelgemaakte fout in kelderbeheer die je met een simpel etiket volledig voorkomt, en het beschermt direct je marge.',
    '- kelderklimaat
- luchtvochtigheid
- liggende opslag
- drink-nu-of-bewaar
- ullage
',
    'Een magnumfles rijpt trager dan een standaardfles van exact dezelfde wijn, puur door een lagere zuurstof-tot-wijn-ratio — wat verklaart waarom verzamelaars bij investeringsaankopen vaak bewust voor grotere flesformaten kiezen.
',
    '- Stabiele 12–14 °C en 70–75% luchtvochtigheid zijn belangrijker dan extreem koel
- UV-licht en trilling beschadigen wijn structureel tijdens lange opslag
- Liggend bewaren houdt de kurk vochtig en voorkomt zuurstofinfiltratie
- Schroefdop en magnum volgen elk een eigen, voorspelbare rijpingscurve
- Segmenteer voorraad in drink-nu / 2–5 jaar / lang bewaren
',
    '### Opdracht

Controleer jouw wijnopslag.

### Checklist

- Ik keek naar temperatuur
- Ik keek naar licht
- Ik keek naar positie
- Ik keek naar stabiliteit


### Reflectievraag

Welke fles in jouw kelder zit waarschijnlijk in het verkeerde segment — drink nu, middellang of lang bewaren — en welke conditie (temperatuur, licht, trilling) zou je het eerst corrigeren?',
    10,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'pairing-wine'
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
    'wijn-en-kaas',
    'Wijn & kaas',
    'Na deze les begrijp jij hoe wijn en kaas elkaar beïnvloeden.
',
    '''Rode wijn bij kaas'' is sensorisch vaker een mythe dan een regel: tannine en het vet of eiwit van veel kazen botsen vaker dan ze harmoniëren. Professionele kaaspairing werkt daarom per categorie — vers, zacht, gewassen korst, hard, blauw — niet per kleur wijn.

Verse, jonge kaas (chèvre, mozzarella) vraagt hoge zuren — een Sancerre of andere Sauvignon Blanc snijdt door de frisse zuurgraad van de kaas zelf. Zachte schimmelkaas (Brie, Camembert) werkt vaak beter met mousserend of lichte Chardonnay dan met rood: de ammoniaktonen van een rijpe korst kunnen tegen tannine bitter aanvoelen. Gewassen korst (Époisses, Munster) vraagt aromatische of halfdroge witte wijn — de intensiteit van de kaas overschreeuwt een delicate droge wijn volledig. Harde, gerijpte kaas (Comté, Parmigiano, oude Gouda) combineert sterk met gerijpte witte wijn of medium rode wijn: de umami- en kristaltonen spiegelen oxidatieve of notige stijlen. Blauwe kaas (Roquefort, Stilton) vraagt zoete versterkte wijn (Sauternes, Port) — suiker balanceert het zout en temt de bitterheid van het schimmel.

Het mechanisme erachter: vet omhult tannine en verlaagt waargenomen astringentie; zout onderdrukt bitterheid en versterkt fruitperceptie; zuur snijdt door romigheid. Bouw pairing op die drie principes, niet op land-van-herkomst-associaties.


## Food pairing

### Beste pairing

Comté 24 maanden bij een gerijpte witte Bourgogne (Chardonnay).

### Waarom dit werkt

Oxidatieve en notige tonen in beide spiegelen elkaar; zuur in de wijn balanceert de zoutige kristallen.

### Vermijd

Een fris, jong Sauvignon Blanc bij dezelfde Comté — de wijn voelt dun en verliest tegen de umami-intensiteit.

## Pro insight

Bouw een kaasplank-wijnkaart op intensiteit en categorie, niet op land — één rij van fris-zuur naar zoet-versterkt dekt vrijwel elke kaas die je serveert. Dat is sterke verkoopcontext: de gast ziet zelf waar hij in de rij zit en durft makkelijker een extra glas te bestellen.',
    '- vet-tannine-binding
- zoet-zout-balans
- kaascategorie
- umami
- zuurcontrast
',
    'Vet in kaas omhult tannine fysiek en verlaagt de waargenomen astringentie, wat verklaart waarom dezelfde tanninerijke rode wijn bij een vette, harde kaas wél werkt en bij een magere, jonge kaas juist hard en bitter aanvoelt.
',
    '- Pair per kaascategorie (vers, zacht, gewassen korst, hard, blauw) — niet per wijnkleur
- Vet omhult tannine; zout onderdrukt bitterheid; zuur snijdt door romigheid
- Blauwe kaas vraagt zoete versterkte wijn om zout en bitterheid te balanceren
- Harde, gerijpte kaas matcht goed met oxidatieve of notige witte wijn
- ''Rode wijn bij kaas'' is vaker mythe dan regel
',
    '### Opdracht

Maak thuis een mini kaasplank met twee wijnen.

### Checklist

- Ik combineerde zacht en hard
- Ik testte contrast
- Ik testte harmonie


### Reflectievraag

Bij welke kaas op jouw plank zou jij een gast bewust van rode wijn afhouden — en welk mechanisme (vet, zout, bitterheid) gebruik je om dat advies te onderbouwen?',
    8,
    1
  ),
  (
    'wijn-en-vis',
    'Wijn & vis',
    'Na deze les begrijp jij hoe wijn werkt met visgerechten.
',
    '''Geen rode wijn bij vis'' is geen willekeurige regel maar het gevolg van een concreet mechanisme: bepaalde verbindingen in vette vis reageren met ijzer en tannine en geven een metalen nasmaak. Begrijp je dat mechanisme, dan begrijp je ook waarom de uitzonderingen — zoals tanninearme Pinot Noir bij zalm — wél werken.

Saus bepaalt vaak sterker dan de vis zelf: boter- en roomsauzen (beurre blanc, velouté) vragen een licht gehouten Chardonnay — boter in het gerecht en vanille/room in de wijn versterken elkaar. Citrus- en kruidenbereidingen vragen juist hoge, onversneden zuren (Sancerre, Albariño) om de frisheid te spiegelen. Umami-rijke, sojagedreven gerechten (sushi, miso) vragen subtiele restzoetheid of lage tannine om het zout van soja te balanceren zonder de wijn bitter te laten lijken.

Structuurregel: lichte witvis vraagt lichte, frisse wijn; vette vis (zalm, makreel) kan meer body en zelfs licht houtcontact aan; schaaldieren vragen vrijwel altijd hoge zuren en mineraliteit boven body.


## Food pairing

### Beste pairing

Gegrilde zalm met beurre blanc bij een licht gehoute Chardonnay.

### Waarom dit werkt

Boter in de saus en vanille/room in de wijn versterken elkaar zonder te botsen met de visvet.

### Vermijd

Een tanninerijke rode Bordeaux — het ijzer-tannine-effect met vette vis geeft een metalen bijsmaak.

## Pro insight

Vraag bij twijfel altijd naar de saus vóór je naar de vissoort vraagt — de saus stuurt het pairingadvies in de praktijk vaker dan het hoofdingrediënt. Een veelgemaakte fout is alleen op ''vis'' reageren met een standaard witte wijn zonder de saus te checken.',
    '- ijzer-tannine-effect
- sausgedreven pairing
- vetgehalte vis
- zuur-vet-snede
- umami-zoet-balans
',
    'Het ijzer-tannine-effect dat een metalen nasmaak geeft bij rode wijn en vette vis, is een meetbare chemische reactie, geen vage afkeer — wat verklaart waarom de regel ''geen rood bij vis'' standhoudt, behalve bij tanninearme uitzonderingen zoals Pinot Noir.
',
    '- Het ijzer-tannine-effect verklaart waarom vette vis met tannine een metalen nasmaak geeft
- Uitzonderingen (Pinot Noir bij zalm) werken door vetgehalte-body-match, niet toeval
- Saus bepaalt vaak sterker dan de vis zelf: boter vraagt gehout wit, citrus vraagt onversneden zuur
- Sojagedreven umami vraagt subtiele restzoetheid of lage tannine
- Lichte vis = lichte wijn; vette vis kan meer body en houtcontact aan
',
    '### Opdracht

Combineer zalm met twee verschillende witte wijnen.

### Checklist

- Ik proefde verschil
- Ik analyseerde vet
- Ik analyseerde zuur


### Reflectievraag

Bij welk visgerecht op je menu zou een lichte rode wijn toch kunnen werken — en welk vetgehalte- of saussignaal maakt die uitzondering verdedigbaar?',
    8,
    2
  ),
  (
    'wijn-en-vlees',
    'Wijn & vlees',
    'Na deze les kun jij wijn succesvol combineren met vlees.
',
    'Dat ''vlees tannine verzacht'' is geen vage culinaire wijsheid maar eiwitbinding: speekseleiwitten worden normaal door tannine aangevallen, en eiwit en vet uit vlees bieden een alternatieve bindingsplek. Vetgehalte en bereidingswijze bepalen samen hoeveel tannine of zuur een gerecht nodig heeft om fris te blijven.

Vetgehalte bepaalt hoeveel tannine of zuur een gerecht nodig heeft om fris te blijven: een vette ribeye vraagt stevige tannine of hoog zuur om het vet te doorbreken; een magere kalfsfilet heeft die kracht niet nodig en wordt juist overweldigd door een zwaar getannineerde wijn. Bereidingswijze verschuift het profiel verder: grillen en roosteren voegen rooktonen toe die resoneren met gehoute, structuurrijke wijn; stoven en braiseren concentreren umami en vragen een rijpere, zachtere wijn met minder agressieve tannine. Wild — met zijn ferreuze, aardse karakter — matcht specifiek met wijnen die zelf aardse, dierlijke complexiteit tonen, zoals gerijpte Pinot Noir of Syrah.

Saus en garnituur blijven het laatste correctiemiddel: een pepersaus verschuift de match richting specerijrijke wijn, een zoetzure jus vraagt juist meer fruit en minder strakke tannine om niet hard te proeven.


## Food pairing

### Beste pairing

Geroosterde ribeye (hoog vetgehalte) bij een jonge Cabernet Sauvignon met stevige tannine.

### Waarom dit werkt

Vet en eiwit binden de tannine, waardoor de wijn zachter aanvoelt en het vlees fris blijft door het zuur.

### Vermijd

Een delicate, lichte Pinot Noir bij hetzelfde stuk vlees — de wijn wordt volledig overschaduwd door het vet.

## Pro insight

Vraag bij vleespairing altijd naar de bereidingswijze vóór je het vleestype noemt — gegrild versus gestoofd verandert het advies vaak sterker dan rund versus lam. Die vraagvolgorde is goed verwachtingsmanagement en voorkomt dat je een tanninerijke wijn naast een zachte stoofschotel zet.',
    '- eiwit-tannine-binding
- marmering
- bereidingswijze
- wildkarakter
- structuurmatch
',
    'Tannine ''verbruikt'' zich eerst aan speekseleiwitten vóór het de eiwitten en vetten in vlees bindt, wat verklaart waarom een eerste slok wijn vóór de hap vlees vaak droger aanvoelt dan een slok ná de hap.
',
    '- Eiwit en vet bieden alternatieve bindingsplekken voor tannine — vandaar de zachtere perceptie
- Vetgehalte bepaalt hoeveel tannine of zuur een gerecht nodig heeft
- Grillen/roosteren matcht met gehoute wijn; stoven/braiseren vraagt rijpere, zachtere wijn
- Wild matcht met aardse, dierlijke complexiteit zoals gerijpte Pinot Noir of Syrah
- Saus is het laatste correctiemiddel: specerij of zoetzuur verschuift de wijnkeuze
',
    '### Opdracht

Combineer rood vlees met twee rode wijnen.

### Checklist

- Ik testte structuur
- Ik testte tannines
- Ik noteerde verschil


### Reflectievraag

Bij welk vleesgerecht op je kaart bepaalt de bereidingswijze — niet het vleestype — jouw uiteindelijke wijnadvies, en waarom?',
    10,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'wine-foundation' and m.slug = 'examen-wine'
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
    'blindproeven-wit',
    'Blindproeven wit',
    'Na deze les kun jij een witte wijn blind analyseren.
',
    'Wie bij een onbekende witte wijn te snel naar een druif of regio springt, raadt vaker fout dan wie eerst de volledige structuurketen doorloopt. Systematisch blindproeven volgt een vaste volgorde — visueel, neus, mond — en pas daarna formuleer je een hypothese met expliciete redenering, niet andersom.

Klassieke verwarringsparen trainen specialistisch onderscheid: ongehoute Chardonnay versus Chablis (beide appel/citrus, maar Chablis toont meer strakke mineraliteit en hogere zuren door het koelere klimaat en de Kimmeridgien-bodem); Riesling versus Albariño (beide hoog zuur, maar Riesling toont vaker bloemig/petrol-potentieel, Albariño meer zilte, kustgebonden tonen); gerijpte witte Bourgogne versus witte Rioja (beide oxidatief geneigd door houtcontact, maar de zuurstructuur en het type hout verschillen herkenbaar).

De gouden regel: structuur eerst, label laatst. Wie te snel naar een druif of regio springt vóór de structuuranalyse compleet is, raadt vaker fout dan wie de volledige keten doorloopt.


## Food pairing

### Beste pairing

Blindproef-context: geen pairing — focus op systematische deductie.

### Waarom dit werkt

Voedsel zou de zuiverheid van het analyseproces vervuilen.

### Vermijd

Elke vorm van food tijdens de blindronde zelf.

## Pro insight

Leg na elke blindronde je topfout vast in één zin (''te snel naar druif, te weinig naar zuurstructuur''). Dat versnelt leren meer dan tien perfecte proeven zonder reflectie, en dezelfde discipline beschermt je later tegen de veelgemaakte fout van te snel concluderen aan een gasttafel.',
    '- systematische deductie
- primair-secundair-tertiair
- structuur-eerst-principe
- variëteitsverwarring
- kwaliteitsconclusie
',
    'Chablis en ongehoute Chardonnay delen bijna dezelfde aromafamilie, maar de Kimmeridgien-bodem en het koelere klimaat van Chablis geven structureel hogere zuren — wat verklaart waarom blind onderscheid maken via structuur betrouwbaarder is dan via aroma alleen.
',
    '- Vaste analyseketen: visueel → neus (primair/secundair/tertiair) → mond → hypothese
- Zuur wijst op klimaat, body/alcohol op rijpheid, lengte op kwaliteit
- Klassieke verwarringsparen: Chardonnay/Chablis, Riesling/Albariño, Bourgogne/Rioja wit
- Structuur eerst, label laatst — vroegtijdig raden verlaagt nauwkeurigheid
- Een hypothese moet expliciet beargumenteerd worden, niet geraden
',
    '### Opdracht

Blindproef één witte wijn.

### Checklist

- Ik keek
- Ik rook
- Ik proefde
- Ik bouwde een hypothese


### Reflectievraag

Bij je laatste blindproef: welke stap in de keten (visueel, neus of mond) sloeg je onbewust over vóór je naar een conclusie sprong?',
    10,
    1
  ),
  (
    'blindproeven-rood',
    'Blindproeven rood',
    'Na deze les kun jij rode wijn blind analyseren.
',
    'Bij rode wijn leidt structuur sneller naar een correcte hypothese dan aroma alleen, en wie dat omdraait, verwart al snel leeftijd met stijl. Tanninekwaliteit — fijnkorrelig en zijdezacht versus grof en drogend — wijst vaak sterker op druif en herkomst dan kleur of geur ooit kunnen.

Het klassieke verwarringspaar Pinot Noir versus Nebbiolo illustreert dit goed: beide zijn licht van kleur met hoge zuren, maar Nebbiolo toont aanzienlijk hogere, grovere tannine en kenmerkende teer- en rozentonen — een onderscheid dat je via structuur sneller maakt dan via kleur alleen. Cabernet Sauvignon versus Syrah is een ander klassiek paar: beide vol van body, maar Cabernet toont meer cassis, ceder en strakke tannine, Syrah meer peper, gerookt vlees en violet.

Een derde valkuil is leeftijd verwarren met stijl: tertiaire ontwikkeling (leder, tabak, gedroogd fruit) kan zowel op een oude wijn als op een bewust oxidatieve winemaking-stijl wijzen — vraag jezelf altijd af of het kleurintensiteit én tanninegrip bevestigen vóór je ''oud'' concludeert.


## Food pairing

### Beste pairing

Blindproef-context: geen pairing — focus op structuuranalyse.

### Waarom dit werkt

Zuiver proeven zonder voedselinvloed is hier het doel.

### Vermijd

Elke vorm van food tijdens deze blindronde.

## Pro insight

Bij twijfel tussen twee verwante druiven: vertrouw eerst op tanninekorrel — fijn versus grof — en pas daarna op aroma. Structuur bedriegt minder snel dan een vluchtige geurindruk, en die volgorde is precies wat een geloofwaardig advies in een verkoopcontext onderscheidt van gokken.',
    '- tanninekwaliteit
- kleurdiepte
- alcoholperceptie
- houtintegratie
- variant-hypothese
',
    'Nebbiolo en Pinot Noir zijn beide licht van kleur en hoog in zuur, maar Nebbiolo''s tanninegehalte ligt vaak twee tot drie keer hoger — wat verklaart waarom kleur alleen bij dit verwarringspaar volledig misleidt.
',
    '- Tanninekwaliteit (fijn versus grof) wijst vaak sterker op druif dan kleur alleen
- Alcoholperceptie wijst op klimaat/rijpheid; houtintegratie op winemaking-keuzes
- Pinot Noir versus Nebbiolo: beide licht en zuurrijk, maar tannine en aromatiek verschillen sterk
- Cabernet Sauvignon versus Syrah: cassis/ceder versus peper/gerookt vlees
- Verwar tertiaire ontwikkeling niet automatisch met hoge leeftijd
',
    '### Opdracht

Blindproef één rode wijn.

### Checklist

- Ik beoordeelde kleur
- Ik beoordeelde tannine
- Ik beoordeelde body
- Ik maakte een conclusie


### Reflectievraag

Welk structuurelement — tanninekorrel, kleurdiepte of alcoholwarmte — gaf bij jouw laatste rode blindproef de doorslag, en had je dat vóóraf verwacht?',
    10,
    2
  ),
  (
    'wijn-eindexamen',
    'Theorie- en praktijkexamen',
    'Na deze les integreer jij alle kennis van de volledige Wine Foundation Track.
',
    'Een examenvraag is in essentie altijd een servicevraag in vermomming: wat zou je vrijdagavond om 20:00 uur schenken bij deze gast en dit gerecht, en waarom precies dat mechanisme? Dit Master-examen integreert de volledige Wine Foundation Track — fundament, productie, proeftechniek, structuur, druivenrassen, klimaat & terroir, service, pairing en blindanalyse — in drie onderdelen die elk een andere vaardigheid toetsen.

Succesvolle aanpak vraagt een vast proefprotocol (visueel → neus → mond → structuur → conclusie), expliciete hypotheses met argumentatie in plaats van geraden antwoorden, servicebewustzijn (temperatuur- en glaskeuzes die je in module 7 leerde) en pairingredenering vanuit mechanismen — zuur, tannine, vet, zout, suiker — in plaats van het opnoemen van bekende combinaties uit het geheugen.

Fouten clusteren rond drie patronen: haast (te snel naar een druifconclusie springen vóór de structuuranalyse compleet is), verkeerde temperatuur- of glasaannames bij service-vragen, en pairingadvies dat traditie citeert (''dat hoort zo'') zonder het onderliggende mechanisme te benoemen. Bereid je voor met twee blinde sets per week en minstens één schriftelijke pairing-case — dat dekt het grootste deel van het examenpatroon.


## Food pairing

### Beste pairing

Examenonderdeel pairing: kies per gerecht een stijl op basis van zuur, tannine, vet, zout en intensiteit.

### Waarom dit werkt

Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.

### Vermijd

Eén wijnstijl voor alle examen-gerechten zonder onderbouwing per mechanisme.

## Pro insight

Lees examenvragen als servicecases: wat zou je vrijdagavond om 20:00 uur schenken bij deze gast en dit gerecht, en waarom precies dat mechanisme? Diezelfde denkstap is wat een gast aan tafel van je verwacht, en wie dat onder examendruk kan, kan het zeker tijdens een drukke service — de ultieme test van verwachtingsmanagement onder druk.',
    '- examenprotocol
- advieslogica
- mechanismeredenering
- servicecasus
- foutpatroonanalyse
',
    'Examenfouten clusteren zelden rond losse feitjes, maar rond haast: te snel naar een druifconclusie springen vóór de structuuranalyse compleet is — wat verklaart waarom een vast protocol onder tijdsdruk meer scoort dan brede kennis alleen.
',
    '- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)
- Vast protocol en expliciete hypotheses verslaan geraden antwoorden
- Servicebewustzijn (temperatuur, glas) en pairingmechanismen tellen net zo zwaar als kennis
- Veelvoorkomende fouten: haast, verkeerde temperatuuraannames, traditie zonder mechanisme
- Twee blinde sets per week plus één schriftelijke pairing-case dekt het examenpatroon
',
    '### Opdracht

Voer een volledige blindproef uit op:

- 1 witte wijn
- 1 rode wijn

Maak per wijn:

- kleuranalyse
- aroma-analyse
- structuur-analyse
- druifhypothese
- klimaatinschatting
- kwaliteitsinschatting

### Checklist

- Ik volgde de volledige methode
- Ik gebruikte deductie
- Ik trok conclusies
- Ik motiveerde mijn keuze


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
  where t.slug = 'wine-foundation'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-wine', 'wat-is-wijn', 1, 'Waarvan wordt wijn gemaakt?', '["Granen", "Druiven", "Appels", "Honing"]', 1, 'Correct: Druiven'),
  ('intro-wine', 'wat-is-wijn', 2, 'Wat gebeurt er tijdens fermentatie?', '["Alcohol ontstaat", "Water verdampt", "Zuurstof verdwijnt", "Kleur ontstaat"]', 0, 'Correct: Alcohol ontstaat'),
  ('intro-wine', 'wat-is-wijn', 3, 'Wijn is:', '["Gedistilleerd", "Vergist", "Gecarboniseerd", "Gekookt"]', 1, 'Correct: Vergist'),
  ('intro-wine', 'wat-is-wijn', 4, 'Een gast beweert dat wijn ''modern bedacht'' is en pas een paar honderd jaar bestaat. Wat is het beste weerwoord?', '["Wijn bestaat hooguit duizend jaar en is dus relatief modern", "Wijncultuur gaat meer dan zesduizend jaar terug, tot ver vóór geschreven geschiedenis", "Wijn bestaat pas sinds de uitvinding van de glazen fles", "Wijn is pas ontstaan na de Romeinse tijd"]', 1, 'Correct: Wijncultuur gaat meer dan zesduizend jaar terug, tot ver vóór geschreven geschiedenis'),
  ('intro-wine', 'wat-is-wijn', 5, 'Wijn is sterk verbonden met:', '["Sport", "Gastronomie", "Technologie", "Muziek"]', 1, 'Correct: Gastronomie'),
  ('intro-wine', 'hoe-ontstaat-wijn', 1, 'Wat komt eerst?', '["Gisting", "Oogst", "Rijping", "Bottelen"]', 1, 'Correct: Oogst'),
  ('intro-wine', 'hoe-ontstaat-wijn', 2, 'Wat doet gist?', '["Verhoogt zuur", "Maakt alcohol", "Verwijdert kleur", "Koelt wijn"]', 1, 'Correct: Maakt alcohol'),
  ('intro-wine', 'hoe-ontstaat-wijn', 3, 'Na fermentatie volgt vaak:', '["Rijping", "Distillatie", "Carbonisatie", "Droging"]', 0, 'Correct: Rijping'),
  ('intro-wine', 'hoe-ontstaat-wijn', 4, 'Een gast wil weten waarom ''oogstjaar'' zoveel invloed heeft op de uiteindelijke wijn. Wat is het beste antwoord?', '["Oogsttiming bepaalt suiker- en zuurniveau van de druif vóór elke volgende stap", "Het jaar bepaalt alleen het etiket, niet de smaak", "Oogstjaar verandert enkel de flesvorm", "Oogsttiming heeft geen invloed zolang er maar wordt geperst"]', 0, 'Correct: Oogsttiming bepaalt suiker- en zuurniveau van de druif vóór elke volgende stap'),
  ('intro-wine', 'hoe-ontstaat-wijn', 5, 'Wat beïnvloedt stijl sterk?', '["Productiekeuzes", "Glas", "Etiket", "Flesvorm"]', 0, 'Correct: Productiekeuzes'),
  ('intro-wine', 'wijnstijlen-basis', 1, 'Welke wijn heeft bubbels?', '["Stille wijn", "Mousserend", "Versterkt", "Rosé"]', 1, 'Correct: Mousserend'),
  ('intro-wine', 'wijnstijlen-basis', 2, 'Welke krijgt extra alcohol?', '["Stille wijn", "Versterkt", "Mousserend", "Zoete wijn"]', 1, 'Correct: Versterkt'),
  ('intro-wine', 'wijnstijlen-basis', 3, 'Port is:', '["Mousserend", "Versterkt", "Stille wijn", "Rosé"]', 1, 'Correct: Versterkt'),
  ('intro-wine', 'wijnstijlen-basis', 4, 'Champagne is:', '["Stille wijn", "Mousserend", "Versterkt", "Dessertwijn"]', 1, 'Correct: Mousserend'),
  ('intro-wine', 'wijnstijlen-basis', 5, 'Een gast aan de bar wil ''iets zonder bubbels, maar wel met wat extra pit''. Welke categorie stel jij voor?', '["Mousserende wijn", "Stille of versterkte wijn, afhankelijk van hoeveel 'pit' gewenst is", "Altijd Champagne", "Een wijn zonder alcohol"]', 1, 'Correct: Stille of versterkte wijn, afhankelijk van hoeveel ''pit'' gewenst is'),
  ('intro-wine', 'geschiedenis-van-wijn', 1, 'Waar begon wijn?', '["Frankrijk", "Italië", "Georgië", "Spanje"]', 2, 'Correct: Georgië'),
  ('intro-wine', 'geschiedenis-van-wijn', 2, 'Wie verspreidden wijn sterk?', '["Grieken", "Duitsers", "Nederlanders", "Belgen"]', 0, 'Correct: Grieken'),
  ('intro-wine', 'geschiedenis-van-wijn', 3, 'Wie professionaliseerden wijnbouw?', '["Romeinen", "Vikingen", "Engelsen", "Amerikanen"]', 0, 'Correct: Romeinen'),
  ('intro-wine', 'geschiedenis-van-wijn', 4, 'Wie bewaakten kennis in de middeleeuwen?', '["Kloosters", "Koningen", "Handelaren", "Soldaten"]', 0, 'Correct: Kloosters'),
  ('intro-wine', 'geschiedenis-van-wijn', 5, 'Een gast zegt dat wijn ''gewoon landbouw'' is zonder culturele waarde. Wat is het sterkste weerwoord?', '["Wijn is uitsluitend landbouw, cultuur speelt geen rol", "Wijngeschiedenis toont dat landbouw en cultuur al duizenden jaren samen optrekken, van Georgië tot de kloostertraditie", "Wijn is pas cultuur geworden na de twintigste eeuw", "Cultuur en landbouw hebben nooit iets met elkaar te maken gehad"]', 1, 'Correct: Wijngeschiedenis toont dat landbouw en cultuur al duizenden jaren samen optrekken, van Georgië tot de kloostertraditie'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 1, 'Welke wijn bevat tannines?', '["Wit", "Rood", "Mousserend", "Zoet"]', 1, 'Correct: Rood'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 2, 'Welke bevat bubbels?', '["Rosé", "Mousserend", "Rood", "Versterkt"]', 1, 'Correct: Mousserend'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 3, 'Welke heeft extra alcohol?', '["Zoet", "Versterkt", "Rosé", "Wit"]', 1, 'Correct: Versterkt'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 4, 'Rosé wordt meestal gemaakt van:', '["Witte druiven", "Blauwe druiven", "Gedroogde druiven", "Gemengde druiven"]', 1, 'Correct: Blauwe druiven'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 5, 'Een gast wil een lichte wijn als aperitief, zonder veel tannine of alcohol. Welke categorie ligt het meest voor de hand?', '["Versterkte wijn", "Witte wijn", "Tawny-stijl wijn", "Zware rode wijn met lange houtlagering"]', 1, 'Correct: Witte wijn'),
  ('productie-wine', 'van-druif-naar-wijn', 1, 'Wat gebeurt direct na de oogst?', '["Bottelen", "Persen", "Rijpen", "Verkopen"]', 1, 'Correct: Persen'),
  ('productie-wine', 'van-druif-naar-wijn', 2, 'Twee wijnen van dezelfde druif: één wit, één rood. Beide zijn geperst. Wat verklaart het grootste smaakverschil hierna?', '["Het soort fles waarin ze worden gebotteld", "Of het sap wel of niet met de schillen blijft vergisten", "De kleur van het etiket", "De hoeveelheid water die wordt toegevoegd"]', 1, 'Correct: Of het sap wel of niet met de schillen blijft vergisten'),
  ('productie-wine', 'van-druif-naar-wijn', 3, 'Wat maakt alcohol?', '["Hout", "Gist", "Glas", "Kurk"]', 1, 'Correct: Gist'),
  ('productie-wine', 'van-druif-naar-wijn', 4, 'Wat komt na fermentatie?', '["Rijping", "Oogst", "Persing", "Filtratie"]', 0, 'Correct: Rijping'),
  ('productie-wine', 'van-druif-naar-wijn', 5, 'Wat bepaalt kwaliteit sterk?', '["Productiekeuzes", "Etiket", "Fleskleur", "Gewicht"]', 0, 'Correct: Productiekeuzes'),
  ('productie-wine', 'alcoholische-gisting', 1, 'Wat zet gist om?', '["Zuur", "Suiker", "Hout", "Water"]', 1, 'Correct: Suiker'),
  ('productie-wine', 'alcoholische-gisting', 2, 'Wat ontstaat niet?', '["Alcohol", "CO2", "Warmte", "Tannine"]', 3, 'Correct: Tannine'),
  ('productie-wine', 'alcoholische-gisting', 3, 'Koele gisting geeft vaak:', '["Meer frisheid", "Meer tannine", "Meer kleur", "Minder aroma"]', 0, 'Correct: Meer frisheid'),
  ('productie-wine', 'alcoholische-gisting', 4, 'Warme gisting geeft vaak:', '["Meer structuur", "Minder alcohol", "Minder body", "Minder geur"]', 0, 'Correct: Meer structuur'),
  ('productie-wine', 'alcoholische-gisting', 5, 'Een gast proeft duidelijke restsuiker in een wijn die als ''droog'' op de kaart staat. Wat is de meest waarschijnlijke verklaring?', '["De fles is bedorven", "De gistingsstop kwam eerder dan verwacht, vóór alle suiker was omgezet", "Er is achteraf suiker toegevoegd", "De druif bevatte van nature geen suiker"]', 1, 'Correct: De gistingsstop kwam eerder dan verwacht, vóór alle suiker was omgezet'),
  ('productie-wine', 'houtlagering', 1, 'Welk hout wordt vaak gebruikt?', '["Eik", "Dennen", "Beuk", "Bamboe"]', 0, 'Correct: Eik'),
  ('productie-wine', 'houtlagering', 2, 'Welke smaak komt vaak van hout?', '["Vanille", "Citroen", "Banaan", "Gras"]', 0, 'Correct: Vanille'),
  ('productie-wine', 'houtlagering', 3, 'Nieuw hout geeft:', '["Minder smaak", "Meer smaak", "Geen smaak", "Minder zuur"]', 1, 'Correct: Meer smaak'),
  ('productie-wine', 'houtlagering', 4, 'Een gast proeft twee houtgerijpte wijnen: de ene heeft sterke vanille en toost, de andere vooral een zachte, ronde structuur zonder uitgesproken houtsmaak. Wat is de meest logische verklaring?', '["Beide zijn gerijpt in exact hetzelfde vat", "Het verschil in vatleeftijd: relatief nieuw hout versus al vaker gebruikt hout", "Eén wijn heeft helemaal geen houtcontact gehad", "Het verschil komt alleen door de druif, niet door het hout"]', 1, 'Correct: Het verschil in vatleeftijd: relatief nieuw hout versus al vaker gebruikt hout'),
  ('productie-wine', 'houtlagering', 5, 'Elke wijn gebruikt hout:', '["Ja", "Nee", "Alleen premium wijnen", "Alleen rode wijnen"]', 1, 'Correct: Nee'),
  ('productie-wine', 'oxidatie-vs-reductie', 1, 'Oxidatie betekent:', '["Minder zuurstof", "Meer zuurstof", "Meer suiker", "Minder alcohol"]', 1, 'Correct: Meer zuurstof'),
  ('productie-wine', 'oxidatie-vs-reductie', 2, 'Reductie bewaart:', '["Fruit", "Hout", "Bitterheid", "Zoetheid"]', 0, 'Correct: Fruit'),
  ('productie-wine', 'oxidatie-vs-reductie', 3, 'Je ruikt aan twee jonge wijnen van hetzelfde jaar: de ene ruikt fris en fruitig, de andere al naar noten en karamel. Wat is de meest logische verklaring?', '["De notige wijn is per ongeluk bedorven", "De notige wijn kreeg bewust meer zuurstofcontact tijdens de wijnmaking", "Beide wijnen zijn identiek geproduceerd", "Fris ruiken betekent altijd een hogere kwaliteit"]', 1, 'Correct: De notige wijn kreeg bewust meer zuurstofcontact tijdens de wijnmaking'),
  ('productie-wine', 'oxidatie-vs-reductie', 4, 'Welke stijl is frisser?', '["Reductief", "Oxidatief", "Houtgerijpt", "Botrytized"]', 0, 'Correct: Reductief'),
  ('productie-wine', 'oxidatie-vs-reductie', 5, 'Beide methodes zijn:', '["Fouten", "Bewuste keuzes", "Alleen oxidatie is bewust", "Altijd ongewenst in de kelder"]', 1, 'Correct: Bewuste keuzes'),
  ('productie-wine', 'rijping-en-ontwikkeling', 1, 'Wat gebeurt met tannines?', '["Zachter", "Harder", "Bitterder", "Zouter"]', 0, 'Correct: Zachter'),
  ('productie-wine', 'rijping-en-ontwikkeling', 2, 'Wat gebeurt met fruit?', '["Verdwijnt volledig", "Wordt complexer", "Wordt zuurder", "Wordt bitter"]', 1, 'Correct: Wordt complexer'),
  ('productie-wine', 'rijping-en-ontwikkeling', 3, 'Welke aroma kan ontstaan?', '["Tabak", "Mintgum", "Cola", "Appelsap"]', 0, 'Correct: Tabak'),
  ('productie-wine', 'rijping-en-ontwikkeling', 4, 'Een gast vraagt of een lichte, fruitgedreven wijn met laag zuur tien jaar kan worden bewaard. Wat is het beste advies?', '["Ja, alle wijn wordt automatisch beter met leeftijd", "Waarschijnlijk niet — onvoldoende structuurbalans om de verandering te dragen", "Alleen als de fles duur was", "Alleen als het een witte wijn is"]', 1, 'Correct: Waarschijnlijk niet — onvoldoende structuurbalans om de verandering te dragen'),
  ('productie-wine', 'rijping-en-ontwikkeling', 5, 'Wat bepaalt bewaarpotentieel?', '["Balans", "Kleur", "Etiket", "Gewicht"]', 0, 'Correct: Balans'),
  ('proeven-wine', 'hoe-proef-je-wijn', 1, 'Wat is de eerste stap?', '["Ruiken", "Kijken", "Proeven", "Schrijven"]', 1, 'Correct: Kijken'),
  ('proeven-wine', 'hoe-proef-je-wijn', 2, 'Wat komt na ruiken?', '["Kijken", "Proeven", "Concluderen", "Bottelen"]', 1, 'Correct: Proeven'),
  ('proeven-wine', 'hoe-proef-je-wijn', 3, 'Wat analyseer je eerst?', '["Kleur", "Alcohol", "Prijs", "Leeftijd"]', 0, 'Correct: Kleur'),
  ('proeven-wine', 'hoe-proef-je-wijn', 4, 'Waarom proef je gestructureerd?', '["Om beter te analyseren", "Om sneller te drinken", "Om wijn warmer te maken", "Om etiketten te lezen"]', 0, 'Correct: Om beter te analyseren'),
  ('proeven-wine', 'hoe-proef-je-wijn', 5, 'Wat is de laatste stap?', '["Ruiken", "Concluderen", "Kijken", "Walsen"]', 1, 'Correct: Concluderen'),
  ('proeven-wine', 'kleur-analyseren', 1, 'Wat zegt kleur vaak?', '["Leeftijd", "Prijs", "Producent", "Flesgrootte"]', 0, 'Correct: Leeftijd'),
  ('proeven-wine', 'kleur-analyseren', 2, 'Oudere witte wijn wordt vaak:', '["Groener", "Goudkleuriger", "Paarser", "Blauwer"]', 1, 'Correct: Goudkleuriger'),
  ('proeven-wine', 'kleur-analyseren', 3, 'Jonge rode wijn is vaak:', '["Bruin", "Paarsrood", "Oranje", "Goud"]', 1, 'Correct: Paarsrood'),
  ('proeven-wine', 'kleur-analyseren', 4, 'Welke druif is vaak lichter?', '["Cabernet", "Pinot Noir", "Syrah", "Malbec"]', 1, 'Correct: Pinot Noir'),
  ('proeven-wine', 'kleur-analyseren', 5, 'Kleur is:', '["Onbelangrijk", "Eerste analysepunt", "Alleen relevant bij rode wijn", "Identiek aan body"]', 1, 'Correct: Eerste analysepunt'),
  ('proeven-wine', 'aromas-herkennen', 1, 'Fruit is meestal:', '["Primair", "Secundair", "Tertiair", "Oxidatief"]', 0, 'Correct: Primair'),
  ('proeven-wine', 'aromas-herkennen', 2, 'Boter is vaak:', '["Primair", "Secundair", "Tertiair", "Primair fruit"]', 1, 'Correct: Secundair'),
  ('proeven-wine', 'aromas-herkennen', 3, 'Leer is vaak:', '["Primair", "Secundair", "Tertiair", "Secundair hout"]', 2, 'Correct: Tertiair'),
  ('proeven-wine', 'aromas-herkennen', 4, 'Vanille komt meestal van:', '["Druif", "Hout", "Glas", "Fles"]', 1, 'Correct: Hout'),
  ('proeven-wine', 'aromas-herkennen', 5, 'Je ruikt brooddeeg en gistige tonen naast vers citrusfruit. Welke twee aromalagen proef je hier samen?', '["Primair en tertiair", "Primair en secundair", "Secundair en tertiair", "Alleen tertiair"]', 1, 'Correct: Primair en secundair'),
  ('proeven-wine', 'structuur-herkennen', 1, 'Wat geeft frisheid?', '["Alcohol", "Zuur", "Tannine", "Body"]', 1, 'Correct: Zuur'),
  ('proeven-wine', 'structuur-herkennen', 2, 'Wat geeft grip?', '["Tannine", "Zuur", "Fruit", "Hout"]', 0, 'Correct: Tannine'),
  ('proeven-wine', 'structuur-herkennen', 3, 'Wat geeft warmte?', '["Alcohol", "Zuur", "Body", "Suiker"]', 0, 'Correct: Alcohol'),
  ('proeven-wine', 'structuur-herkennen', 4, 'Wat is gewicht?', '["Body", "Zuur", "Tannine", "Kleur"]', 0, 'Correct: Body'),
  ('proeven-wine', 'structuur-herkennen', 5, 'Je proeft een wijn die droogte op je tandvlees geeft, weinig merkbare zoetheid en duidelijke warmte achterin de keel. Welke twee structuurelementen proef je hier het sterkst?', '["Zuur en zoet", "Tannine en alcohol", "Body en zoet", "Zuur en tannine"]', 1, 'Correct: Tannine en alcohol'),
  ('proeven-wine', 'mini-toets-wijn', 1, 'Wat is de eerste stap bij wijnproeven?', '["Ruiken", "Kijken", "Proeven", "Schenken"]', 1, 'Correct: Kijken'),
  ('proeven-wine', 'mini-toets-wijn', 2, 'Wat geeft kleur vaak aan?', '["Leeftijd", "Alcoholpercentage", "Flesvorm", "Prijs"]', 0, 'Correct: Leeftijd'),
  ('proeven-wine', 'mini-toets-wijn', 3, 'Primair aroma komt van:', '["Druif", "Hout", "Rijping", "Glas"]', 0, 'Correct: Druif'),
  ('proeven-wine', 'mini-toets-wijn', 4, 'Wat geeft frisheid?', '["Zuur", "Alcohol", "Tannine", "Body"]', 0, 'Correct: Zuur'),
  ('proeven-wine', 'mini-toets-wijn', 5, 'Blind: lichtgele kleur met groene rand, intens citrus- en kruidaroma, hoog zuur, licht van lichaam. Welke combinatie van hypotheses past het beste?', '["Warm klimaat, neutrale druif, lange houtlagering", "Koel klimaat, aromatische druif, geen houtlagering", "Warm klimaat, aromatische druif, lange flesrijping", "Koel klimaat, neutrale druif, lange houtlagering"]', 1, 'Correct: Koel klimaat, aromatische druif, geen houtlagering'),
  ('proeven-wine', 'mini-toets-wijn', 6, 'Wat geeft warmte?', '["Alcohol", "Zuur", "Body", "Suiker"]', 0, 'Correct: Alcohol'),
  ('proeven-wine', 'mini-toets-wijn', 7, 'Wat betekent body?', '["Gewicht in de mond", "Geur", "Kleur", "Leeftijd"]', 0, 'Correct: Gewicht in de mond'),
  ('proeven-wine', 'mini-toets-wijn', 8, 'Wat is tertiair aroma?', '["Rijpingsaroma", "Druifaroma", "Productiearoma", "Koolzuur"]', 0, 'Correct: Rijpingsaroma'),
  ('proeven-wine', 'mini-toets-wijn', 9, 'Wat is de laatste stap bij proeven?', '["Concluderen", "Kijken", "Ruiken", "Walsen"]', 0, 'Correct: Concluderen'),
  ('proeven-wine', 'mini-toets-wijn', 10, 'Wat is essentieel bij blindproeven?', '["Structuur", "Etiket", "Producent", "Prijs"]', 0, 'Correct: Structuur'),
  ('structuur-wine', 'zuur', 1, 'Wat geeft zuur?', '["Zoetheid", "Frisheid", "Bitterheid", "Warmte"]', 1, 'Correct: Frisheid'),
  ('structuur-wine', 'zuur', 2, 'Waar proef je zuur vaak?', '["Tongranden", "Gehemelte", "Lippen", "Keel"]', 0, 'Correct: Tongranden'),
  ('structuur-wine', 'zuur', 3, 'Koel klimaat geeft vaak:', '["Lager zuur", "Hoger zuur", "Meer tannine", "Minder body"]', 1, 'Correct: Hoger zuur'),
  ('structuur-wine', 'zuur', 4, 'Zuur helpt bij:', '["Bewaren", "Verdunnen", "Koelen", "Filteren"]', 0, 'Correct: Bewaren'),
  ('structuur-wine', 'zuur', 5, 'Veel speeksel betekent vaak:', '["Hoog zuur", "Hoog alcohol", "Hoog suiker", "Hoog tannine"]', 0, 'Correct: Hoog zuur'),
  ('structuur-wine', 'tannines', 1, 'Waar komen tannines vandaan?', '["Schillen", "Water", "Suiker", "Glas"]', 0, 'Correct: Schillen'),
  ('structuur-wine', 'tannines', 2, 'Wat geven tannines?', '["Grip", "Zoet", "Fris", "Zuur"]', 0, 'Correct: Grip'),
  ('structuur-wine', 'tannines', 3, 'Waar voel je tannine?', '["Tandvlees", "Ogen", "Lippen", "Keel"]', 0, 'Correct: Tandvlees'),
  ('structuur-wine', 'tannines', 4, 'Welke druif heeft vaak veel tannine?', '["Pinot Noir", "Cabernet Sauvignon", "Riesling", "Muscat"]', 1, 'Correct: Cabernet Sauvignon'),
  ('structuur-wine', 'tannines', 5, 'Tannines helpen bij:', '["Rijping", "Koeling", "Carbonisatie", "Filteren"]', 0, 'Correct: Rijping'),
  ('structuur-wine', 'alcohol', 1, 'Wat geeft alcohol?', '["Warmte", "Zuur", "Tannine", "Bitter"]', 0, 'Correct: Warmte'),
  ('structuur-wine', 'alcohol', 2, 'Meer suiker geeft vaak:', '["Meer alcohol", "Minder alcohol", "Minder zuur", "Minder body"]', 0, 'Correct: Meer alcohol'),
  ('structuur-wine', 'alcohol', 3, 'Warm klimaat geeft vaak:', '["Meer alcohol", "Minder alcohol", "Meer zuur", "Minder rijpheid"]', 0, 'Correct: Meer alcohol'),
  ('structuur-wine', 'alcohol', 4, 'Waar voel je alcohol vaak?', '["Keel", "Oren", "Tanden", "Ogen"]', 0, 'Correct: Keel'),
  ('structuur-wine', 'alcohol', 5, 'Een gast klaagt dat een wijn ''heet'' aanvoelt, zonder dat het etiket een extreem hoog percentage toont. Wat is de meest logische verklaring?', '["Te veel tannine", "Te weinig zuur om de alcohol te balanceren", "Te veel restsuiker", "Te koude serveertemperatuur"]', 1, 'Correct: Te weinig zuur om de alcohol te balanceren'),
  ('structuur-wine', 'body', 1, 'Body is:', '["Gewicht in mond", "Kleur", "Geur", "Fles"]', 0, 'Correct: Gewicht in mond'),
  ('structuur-wine', 'body', 2, 'Wat geeft vaak meer body?', '["Alcohol", "Water", "Zuur", "Glas"]', 0, 'Correct: Alcohol'),
  ('structuur-wine', 'body', 3, 'Wat is light-bodied?', '["Waterachtig", "Zwaar", "Tanninerijk", "Zoet"]', 0, 'Correct: Waterachtig'),
  ('structuur-wine', 'body', 4, 'Body helpt bij:', '["Blindproeven", "Koelen", "Schenken", "Rijping"]', 0, 'Correct: Blindproeven'),
  ('structuur-wine', 'body', 5, 'Amarone is vaak:', '["Full-bodied", "Light-bodied", "Altijd mousserend", "Altijd zonder alcohol"]', 0, 'Correct: Full-bodied'),
  ('structuur-wine', 'balans', 1, 'Balans betekent:', '["Harmonie", "Zuur", "Zoet", "Bitter"]', 0, 'Correct: Harmonie'),
  ('structuur-wine', 'balans', 2, 'Wat bepaalt kwaliteit sterk?', '["Balans", "Fleskleur", "Etiket", "Leeftijd"]', 0, 'Correct: Balans'),
  ('structuur-wine', 'balans', 3, 'Wat mag niet domineren?', '["Eén element", "Fruit", "Zuur", "Body"]', 0, 'Correct: Eén element'),
  ('structuur-wine', 'balans', 4, 'Balans helpt bij:', '["Bewaarpotentieel", "Koelen", "Kurken", "Filteren"]', 0, 'Correct: Bewaarpotentieel'),
  ('structuur-wine', 'balans', 5, 'Een wijn scoort hoog op alcohol en body, maar laag op zuur. Welke aanpassing in de bediening corrigeert de onbalans het beste?', '["Serveer warmer om het aroma te benadrukken", "Combineer met een gerecht met voldoende vet en zout om de balans te ondersteunen", "Voeg ijsblokjes toe aan het glas", "Schenk een groter glasvolume"]', 1, 'Correct: Combineer met een gerecht met voldoende vet en zout om de balans te ondersteunen'),
  ('druivenrassen-wine', 'witte-druivenbasis', 1, 'Welke druif is vaak neutraal?', '["Chardonnay", "Muscat", "Gewürztraminer", "Viognier"]', 0, 'Correct: Chardonnay'),
  ('druivenrassen-wine', 'witte-druivenbasis', 2, 'Welke is vaak grassig?', '["Sauvignon Blanc", "Merlot", "Pinot Noir", "Syrah"]', 0, 'Correct: Sauvignon Blanc'),
  ('druivenrassen-wine', 'witte-druivenbasis', 3, 'Welke heeft vaak hoge zuren?', '["Riesling", "Chardonnay", "Merlot", "Grenache"]', 0, 'Correct: Riesling'),
  ('druivenrassen-wine', 'witte-druivenbasis', 4, 'Welke groeit wereldwijd?', '["Chardonnay", "Nebbiolo", "Sangiovese", "Touriga Nacional"]', 0, 'Correct: Chardonnay'),
  ('druivenrassen-wine', 'witte-druivenbasis', 5, 'Welke is het meest aromatisch?', '["Sauvignon Blanc", "Chardonnay", "Pinot Grigio", "Airén"]', 0, 'Correct: Sauvignon Blanc'),
  ('druivenrassen-wine', 'rode-druivenbasis', 1, 'Welke heeft vaak de meeste tannine?', '["Cabernet Sauvignon", "Merlot", "Pinot Noir", "Gamay"]', 0, 'Correct: Cabernet Sauvignon'),
  ('druivenrassen-wine', 'rode-druivenbasis', 2, 'Welke is vaak zachter?', '["Merlot", "Cabernet", "Nebbiolo", "Syrah"]', 0, 'Correct: Merlot'),
  ('druivenrassen-wine', 'rode-druivenbasis', 3, 'Welke is het lichtst?', '["Pinot Noir", "Cabernet", "Malbec", "Tannat"]', 0, 'Correct: Pinot Noir'),
  ('druivenrassen-wine', 'rode-druivenbasis', 4, 'Bordeaux combineert vaak:', '["Cabernet en Merlot", "Riesling en Chardonnay", "Pinot en Syrah", "Grenache en Muscat"]', 0, 'Correct: Cabernet en Merlot'),
  ('druivenrassen-wine', 'rode-druivenbasis', 5, 'Welke geeft finesse?', '["Pinot Noir", "Merlot", "Cabernet", "Malbec"]', 0, 'Correct: Pinot Noir'),
  ('druivenrassen-wine', 'aromatische-druiven', 1, 'Welke is aromatisch?', '["Muscat", "Chardonnay", "Merlot", "Cabernet"]', 0, 'Correct: Muscat'),
  ('druivenrassen-wine', 'aromatische-druiven', 2, 'Gewürztraminer ruikt vaak naar:', '["Lychee", "Leer", "Tabak", "Aarde"]', 0, 'Correct: Lychee'),
  ('druivenrassen-wine', 'aromatische-druiven', 3, 'Aromatische druiven zijn vaak:', '["Direct herkenbaar", "Neutraal", "Stil", "Zwaar"]', 0, 'Correct: Direct herkenbaar'),
  ('druivenrassen-wine', 'aromatische-druiven', 4, 'Viognier is vaak:', '["Bloemig", "Tanninerijk", "Zout", "Hard"]', 0, 'Correct: Bloemig'),
  ('druivenrassen-wine', 'aromatische-druiven', 5, 'Muscat is:', '["Zeer oud", "Nieuw", "Zeldzaam", "Kunstmatig"]', 0, 'Correct: Zeer oud'),
  ('druivenrassen-wine', 'neutrale-druiven', 1, 'Welke druif is vaak neutraal?', '["Chardonnay", "Muscat", "Gewürztraminer", "Torrontés"]', 0, 'Correct: Chardonnay'),
  ('druivenrassen-wine', 'neutrale-druiven', 2, 'Bij neutrale druiven speelt wat grotere rol?', '["Terroir", "Glas", "Fles", "Etiket"]', 0, 'Correct: Terroir'),
  ('druivenrassen-wine', 'neutrale-druiven', 3, 'Welke wordt kameleon genoemd?', '["Chardonnay", "Merlot", "Riesling", "Pinot Noir"]', 0, 'Correct: Chardonnay'),
  ('druivenrassen-wine', 'neutrale-druiven', 4, 'Pinot Grigio is vaak:', '["Neutraler", "Zeer aromatisch", "Zoet", "Mousserend"]', 0, 'Correct: Neutraler'),
  ('druivenrassen-wine', 'neutrale-druiven', 5, 'Neutrale druiven tonen vaak:', '["Productie-invloed", "Minder verschil", "Geen terroir", "Geen stijl"]', 0, 'Correct: Productie-invloed'),
  ('druivenrassen-wine', 'hoe-druiven-stijl-bepalen', 1, 'Wat bepaalt druif niet?', '["Structuur", "Aroma", "Kleur", "Glasvorm"]', 3, 'Correct: Glasvorm'),
  ('druivenrassen-wine', 'hoe-druiven-stijl-bepalen', 2, 'Cabernet heeft vaak:', '["Meer tannine", "Minder structuur", "Minder kleur", "Minder alcohol"]', 0, 'Correct: Meer tannine'),
  ('druivenrassen-wine', 'hoe-druiven-stijl-bepalen', 3, 'Riesling heeft vaak:', '["Hoge zuren", "Hoge tannines", "Lage zuren", "Geen aroma"]', 0, 'Correct: Hoge zuren'),
  ('druivenrassen-wine', 'hoe-druiven-stijl-bepalen', 4, 'Druifherkenning helpt bij:', '["Blindproeven", "Koelen", "Schenken", "Bewaren"]', 0, 'Correct: Blindproeven'),
  ('druivenrassen-wine', 'hoe-druiven-stijl-bepalen', 5, 'Twee wijnen van dezelfde druif smaken volledig anders: de ene slank en citrusachtig, de andere vol en tropisch met boter. Wat verklaar je als eerste?', '["Verschil in flesvorm", "Verschil in klimaat en/of wijnmaakkeuzes", "Verschil in druivenras", "Verschil in glaswerk"]', 1, 'Correct: Verschil in klimaat en/of wijnmaakkeuzes'),
  ('klimaat-terroir-wine', 'koel-klimaat', 1, 'Koel klimaat geeft vaak:', '["Meer zuur", "Minder zuur", "Meer alcohol", "Meer tannine"]', 0, 'Correct: Meer zuur'),
  ('klimaat-terroir-wine', 'koel-klimaat', 2, 'Wat rijpt trager?', '["Druiven", "Glas", "Kurk", "Fles"]', 0, 'Correct: Druiven'),
  ('klimaat-terroir-wine', 'koel-klimaat', 3, 'Welke regio is koel?', '["Mosel", "Barossa", "Priorat", "Napa"]', 0, 'Correct: Mosel'),
  ('klimaat-terroir-wine', 'koel-klimaat', 4, 'Welke aroma''s passen?', '["Citrus", "Jam", "Chocolade", "Vijgen"]', 0, 'Correct: Citrus'),
  ('klimaat-terroir-wine', 'koel-klimaat', 5, 'Wat is het grootste risico bij onvolledige fenolische rijping in een koel klimaat?', '["Groene, kruidige tannine en pyrazinetonen", "Te hoog alcoholpercentage", "Te weinig zuur", "Te veel restsuiker"]', 0, 'Correct: Groene, kruidige tannine en pyrazinetonen'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 1, 'Gematigd klimaat geeft vaak:', '["Balans", "Extreem zuur", "Extreem alcohol", "Geen rijping"]', 0, 'Correct: Balans'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 2, 'Welke regio is gematigd?', '["Bordeaux", "Mosel", "Mendoza", "Barossa"]', 0, 'Correct: Bordeaux'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 3, 'Wat blijft behouden?', '["Zuur", "Geen structuur", "Geen fruit", "Geen alcohol"]', 0, 'Correct: Zuur'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 4, 'Wat ontstaat goed?', '["Rijpheid", "Oxidatie", "Carbonisatie", "Fortificatie"]', 0, 'Correct: Rijpheid'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 5, 'Waarom is jaargangvariatie in gematigde klimaten vaak prominenter dan in extreme klimaten?', '["Omdat de foutmarge tussen onderrijp en overrijp er kleiner is", "Omdat er nooit zon is", "Omdat er geen druivenrassen geschikt zijn", "Omdat er nooit regen valt"]', 0, 'Correct: Omdat de foutmarge tussen onderrijp en overrijp er kleiner is'),
  ('klimaat-terroir-wine', 'warm-klimaat', 1, 'Warm klimaat geeft vaak:', '["Meer alcohol", "Minder alcohol", "Meer zuur", "Minder body"]', 0, 'Correct: Meer alcohol'),
  ('klimaat-terroir-wine', 'warm-klimaat', 2, 'Wat stijgt?', '["Suiker", "Zuur", "Water", "Kleur"]', 0, 'Correct: Suiker'),
  ('klimaat-terroir-wine', 'warm-klimaat', 3, 'Wat daalt?', '["Zuur", "Alcohol", "Body", "Fruit"]', 0, 'Correct: Zuur'),
  ('klimaat-terroir-wine', 'warm-klimaat', 4, 'Welke regio is warm?', '["Barossa", "Mosel", "Chablis", "Champagne"]', 0, 'Correct: Barossa'),
  ('klimaat-terroir-wine', 'warm-klimaat', 5, 'Welke ingreep gebruiken producenten in warm klimaat het vaakst om de suiker-fenolen-kloof te beperken?', '["Nachtoogst en bladwerk voor schaduw", "Extra bewatering vlak voor de oogst", "Vroeg snoeien zonder schaduw", "Volledig kunstlicht in de wijngaard"]', 0, 'Correct: Nachtoogst en bladwerk voor schaduw'),
  ('klimaat-terroir-wine', 'bodemtypes', 1, 'Welke bodem geeft vaak finesse?', '["Kalk", "Klei", "Zand", "Graniet"]', 0, 'Correct: Kalk'),
  ('klimaat-terroir-wine', 'bodemtypes', 2, 'Welke geeft body?', '["Klei", "Kalk", "Zand", "Schalie"]', 0, 'Correct: Klei'),
  ('klimaat-terroir-wine', 'bodemtypes', 3, 'Welke geeft zachtheid?', '["Zand", "Kalk", "Leisteen", "Basalt"]', 0, 'Correct: Zand'),
  ('klimaat-terroir-wine', 'bodemtypes', 4, 'Leisteen geeft vaak:', '["Concentratie", "Minder smaak", "Minder structuur", "Minder zuur"]', 0, 'Correct: Concentratie'),
  ('klimaat-terroir-wine', 'bodemtypes', 5, 'Bodem werkt samen met:', '["Klimaat", "Glas", "Kurk", "Fles"]', 0, 'Correct: Klimaat'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 1, 'Terroir bestaat uit:', '["Alleen bodem", "Alleen klimaat", "Meerdere factoren", "Alleen druif"]', 2, 'Correct: Meerdere factoren'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 2, 'Wat bepaalt terroir sterk?', '["Ligging", "Etiket", "Glas", "Kurk"]', 0, 'Correct: Ligging'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 3, 'Waarom smaakt dezelfde druif anders?', '["Terroir", "Fleskleur", "Leeftijd", "Glasvorm"]', 0, 'Correct: Terroir'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 4, 'Wat is terroir vaak?', '["Identiteit", "Marketing", "Flesdesign", "Prijs"]', 0, 'Correct: Identiteit'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 5, 'Wat verklaart een smaakverschil tussen twee naburige percelen met dezelfde druif en wijnmaaktechniek?', '["Verschil in expositie, helling of mesoklimaat", "Een ander etiketontwerp", "Een andere flesvorm", "Toeval zonder verklaring"]', 0, 'Correct: Verschil in expositie, helling of mesoklimaat'),
  ('service-wine', 'serveertemperatuur', 1, 'Te koud betekent vaak:', '["Meer aroma", "Minder aroma", "Meer alcohol", "Meer body"]', 1, 'Correct: Minder aroma'),
  ('service-wine', 'serveertemperatuur', 2, 'Vol rood serveer je rond:', '["6–8 °C", "10–12 °C", "16–18 °C", "22–24 °C"]', 2, 'Correct: 16–18 °C'),
  ('service-wine', 'serveertemperatuur', 3, 'Fris wit serveer je rond:', '["8–10 °C", "16–18 °C", "20 °C", "5 °C"]', 0, 'Correct: 8–10 °C'),
  ('service-wine', 'serveertemperatuur', 4, 'Te warm vergroot:', '["Alcoholgevoel", "Zuur", "Tannine", "Suiker"]', 0, 'Correct: Alcoholgevoel'),
  ('service-wine', 'serveertemperatuur', 5, 'Waarom schenk je een wijn idealiter iets onder de uiteindelijke doeltemperatuur?', '["Omdat het glas tijdens service vanzelf opwarmt", "Omdat dat de alcohol verlaagt", "Omdat dat het zuur verhoogt", "Omdat dat verplicht is bij elk wijnkeurmerk"]', 0, 'Correct: Omdat het glas tijdens service vanzelf opwarmt'),
  ('service-wine', 'glaswerk', 1, 'Wat beïnvloedt glas sterk?', '["Geur", "Alcoholpercentage", "Leeftijd", "Kleur"]', 0, 'Correct: Geur'),
  ('service-wine', 'glaswerk', 2, 'Grote glazen geven vaak:', '["Meer zuurstof", "Minder geur", "Minder body", "Minder kleur"]', 0, 'Correct: Meer zuurstof'),
  ('service-wine', 'glaswerk', 3, 'Smalle glazen geven vaak:', '["Meer focus", "Minder aroma", "Meer alcohol", "Minder structuur"]', 0, 'Correct: Meer focus'),
  ('service-wine', 'glaswerk', 4, 'Waarom doodt detergent-residu de mousse van mousserende wijn?', '["Het verstoort het oppervlaktespanning-effect waarop bubbels zich vormen", "Het verlaagt de temperatuur van het glas", "Het verandert de kleur van de wijn", "Het heeft geen effect op mousse"]', 0, 'Correct: Het verstoort het oppervlaktespanning-effect waarop bubbels zich vormen'),
  ('service-wine', 'glaswerk', 5, 'Welk glas is de internationale standaard voor blind proeven en wedstrijden?', '["Het neutrale ISO-tasting-glas", "Het Bordeaux-glas", "De coupe", "Het sherryglas"]', 0, 'Correct: Het neutrale ISO-tasting-glas'),
  ('service-wine', 'decanteren', 1, 'Doel van decanteren?', '["Koelen", "Zuurstof geven", "Zoeter maken", "Filteren"]', 1, 'Correct: Zuurstof geven'),
  ('service-wine', 'decanteren', 2, 'Oude wijn decanteer je vaak voor:', '["Sediment", "Meer kleur", "Meer suiker", "Meer zuur"]', 0, 'Correct: Sediment'),
  ('service-wine', 'decanteren', 3, 'Jonge wijn profiteert vaak van:', '["Lucht", "Koeling", "Schudden", "Filtratie"]', 0, 'Correct: Lucht'),
  ('service-wine', 'decanteren', 4, 'Te veel zuurstof kan:', '["Schaden", "Helpen", "Koelen", "Zoeten"]', 0, 'Correct: Schaden'),
  ('service-wine', 'decanteren', 5, 'Waarom decanteer je een zeer oude, fragiele wijn het beste vlak vóór het serveren?', '["Om te voorkomen dat fruit en structuur te snel 'instorten'", "Om de wijn kouder te maken", "Om meer sediment te creëren", "Om het alcoholpercentage te verlagen"]', 0, 'Correct: Om te voorkomen dat fruit en structuur te snel ''instorten'''),
  ('service-wine', 'bewaren-kelderen', 1, 'Ideale opslagtemperatuur?', '["5 °C", "12 °C", "20 °C", "25 °C"]', 1, 'Correct: 12 °C'),
  ('service-wine', 'bewaren-kelderen', 2, 'Wat is schadelijk?', '["Licht", "Donker", "Stilte", "Vocht"]', 0, 'Correct: Licht'),
  ('service-wine', 'bewaren-kelderen', 3, 'Waarom liggend bewaren?', '["Kurk vochtig houden", "Meer aroma", "Meer kleur", "Meer alcohol"]', 0, 'Correct: Kurk vochtig houden'),
  ('service-wine', 'bewaren-kelderen', 4, 'Warmte doet wat?', '["Versnelt veroudering", "Vertraagt veroudering", "Verbetert altijd kwaliteit", "Niets"]', 0, 'Correct: Versnelt veroudering'),
  ('service-wine', 'bewaren-kelderen', 5, 'Waarom rijpt een magnumfles doorgaans trager dan een standaardfles van dezelfde wijn?', '["Door een lagere zuurstof-tot-wijn-ratio", "Door een dikkere kurk", "Door een ander druivenras", "Door een hogere opslagtemperatuur"]', 0, 'Correct: Door een lagere zuurstof-tot-wijn-ratio'),
  ('pairing-wine', 'wijn-en-kaas', 1, 'Wat verzacht tannine?', '["Zout", "Suiker", "Zuur", "Bitter"]', 0, 'Correct: Zout'),
  ('pairing-wine', 'wijn-en-kaas', 2, 'Blauwe kaas werkt vaak goed met:', '["Zoete wijn", "Droge rosé", "Bier", "Water"]', 0, 'Correct: Zoete wijn'),
  ('pairing-wine', 'wijn-en-kaas', 3, 'Vet maakt wijn vaak:', '["Zachter", "Harder", "Bitterder", "Zuurder"]', 0, 'Correct: Zachter'),
  ('pairing-wine', 'wijn-en-kaas', 4, 'Stilton combineert klassiek met:', '["Port", "Champagne", "Sauvignon Blanc", "Prosecco"]', 0, 'Correct: Port'),
  ('pairing-wine', 'wijn-en-kaas', 5, 'Belangrijkste principe?', '["Balans", "Prijs", "Leeftijd", "Etiket"]', 0, 'Correct: Balans'),
  ('pairing-wine', 'wijn-en-vis', 1, 'Vis vraagt vaak:', '["Hoge tannines", "Frisheid", "Bitterheid", "Warmte"]', 1, 'Correct: Frisheid'),
  ('pairing-wine', 'wijn-en-vis', 2, 'Wat snijdt door vet?', '["Zuur", "Suiker", "Alcohol", "Tannine"]', 0, 'Correct: Zuur'),
  ('pairing-wine', 'wijn-en-vis', 3, 'Wat bepaalt pairing sterk?', '["Saus", "Bordkleur", "Glas", "Temperatuur"]', 0, 'Correct: Saus'),
  ('pairing-wine', 'wijn-en-vis', 4, 'Zalm kan meer:', '["Body aan", "Minder zuur aan", "Minder smaak aan", "Geen wijn aan"]', 0, 'Correct: Body aan'),
  ('pairing-wine', 'wijn-en-vis', 5, 'Waarom kan tanninearme Pinot Noir bij zalm wél werken, ondanks de ''geen rood bij vis''-regel?', '["Omdat het vetgehalte van zalm qua body aansluit zonder het ijzer-tannine-effect te triggeren", "Omdat de regel nooit klopt", "Omdat Pinot Noir geen tannine bevat", "Omdat zalm geen vet bevat"]', 0, 'Correct: Omdat het vetgehalte van zalm qua body aansluit zonder het ijzer-tannine-effect te triggeren'),
  ('pairing-wine', 'wijn-en-vlees', 1, 'Wat verzacht tannine?', '["Eiwit", "Suiker", "Zuur", "Water"]', 0, 'Correct: Eiwit'),
  ('pairing-wine', 'wijn-en-vlees', 2, 'Rood vlees vraagt vaak:', '["Structuur", "Minder smaak", "Minder wijn", "Minder zuur"]', 0, 'Correct: Structuur'),
  ('pairing-wine', 'wijn-en-vlees', 3, 'Steak combineert klassiek met:', '["Cabernet Sauvignon", "Riesling", "Prosecco", "Moscato"]', 0, 'Correct: Cabernet Sauvignon'),
  ('pairing-wine', 'wijn-en-vlees', 4, 'Wat blijft belangrijk?', '["Saus", "Bord", "Licht", "Muziek"]', 0, 'Correct: Saus'),
  ('pairing-wine', 'wijn-en-vlees', 5, 'Waarom vragen stoofgerechten doorgaans om een rijpere, zachtere wijn dan gegrild vlees?', '["Omdat stoven umami concentreert en agressieve tannine dan minder goed past", "Omdat stoofvlees geen eiwit bevat", "Omdat stoven het vetgehalte verlaagt tot nul", "Omdat gegrild vlees altijd magerder is"]', 0, 'Correct: Omdat stoven umami concentreert en agressieve tannine dan minder goed past'),
  ('examen-wine', 'blindproeven-wit', 1, 'Blindproeven betekent:', '["Zonder licht", "Zonder etiket", "Zonder glas", "Zonder geur"]', 1, 'Correct: Zonder etiket'),
  ('examen-wine', 'blindproeven-wit', 2, 'Wat analyseer je eerst?', '["Kleur", "Alcohol", "Herkomst", "Producent"]', 0, 'Correct: Kleur'),
  ('examen-wine', 'blindproeven-wit', 3, 'Wat is vaak cruciaal bij wit?', '["Zuur", "Tannine", "Hout", "Zoet"]', 0, 'Correct: Zuur'),
  ('examen-wine', 'blindproeven-wit', 4, 'Deductie betekent:', '["Redeneren vanuit observaties", "Gokken", "Kopiëren", "Serveren"]', 0, 'Correct: Redeneren vanuit observaties'),
  ('examen-wine', 'blindproeven-wit', 5, 'Citrus + hoog zuur kan wijzen op:', '["Riesling", "Merlot", "Syrah", "Malbec"]', 0, 'Correct: Riesling'),
  ('examen-wine', 'blindproeven-rood', 1, 'Wat is vaak belangrijk bij rood?', '["Tannine", "Koolzuur", "Zoet", "Water"]', 0, 'Correct: Tannine'),
  ('examen-wine', 'blindproeven-rood', 2, 'Pinot Noir heeft vaak:', '["Lage tannine", "Hoge tannine", "Hoge zoetheid", "Geen zuur"]', 0, 'Correct: Lage tannine'),
  ('examen-wine', 'blindproeven-rood', 3, 'Cabernet heeft vaak:', '["Hoge tannine", "Lage kleur", "Lage alcohol", "Geen body"]', 0, 'Correct: Hoge tannine'),
  ('examen-wine', 'blindproeven-rood', 4, 'Structuur helpt:', '["Herkennen", "Koelen", "Serveren", "Bewaren"]', 0, 'Correct: Herkennen'),
  ('examen-wine', 'blindproeven-rood', 5, 'Lichte kleur kan wijzen op:', '["Pinot Noir", "Syrah", "Malbec", "Tannat"]', 0, 'Correct: Pinot Noir'),
  ('examen-wine', 'wijn-eindexamen', 1, 'Waaruit wordt wijn gemaakt?', '["Druiven", "Granen", "Appels", "Honing"]', 0, 'Correct: Druiven'),
  ('examen-wine', 'wijn-eindexamen', 2, 'Wat maakt alcohol tijdens fermentatie?', '["Gist", "Hout", "Glas", "Kurk"]', 0, 'Correct: Gist'),
  ('examen-wine', 'wijn-eindexamen', 3, 'Welke wijn bevat bubbels?', '["Mousserend", "Stil", "Versterkt", "Zoet"]', 0, 'Correct: Mousserend'),
  ('examen-wine', 'wijn-eindexamen', 4, 'Wat geeft frisheid in wijn?', '["Zuur", "Alcohol", "Tannine", "Body"]', 0, 'Correct: Zuur'),
  ('examen-wine', 'wijn-eindexamen', 5, 'Wat geeft grip?', '["Tannine", "Suiker", "Zuur", "Fruit"]', 0, 'Correct: Tannine'),
  ('examen-wine', 'wijn-eindexamen', 6, 'Welke druif is vaak neutraal?', '["Chardonnay", "Muscat", "Gewürztraminer", "Viognier"]', 0, 'Correct: Chardonnay'),
  ('examen-wine', 'wijn-eindexamen', 7, 'Welke druif heeft vaak hoge tannine?', '["Cabernet Sauvignon", "Pinot Noir", "Gamay", "Merlot"]', 0, 'Correct: Cabernet Sauvignon'),
  ('examen-wine', 'wijn-eindexamen', 8, 'Koel klimaat geeft vaak:', '["Hoger zuur", "Meer alcohol", "Meer body", "Minder frisheid"]', 0, 'Correct: Hoger zuur'),
  ('examen-wine', 'wijn-eindexamen', 9, 'Wat is terroir?', '["Alleen bodem", "Alleen klimaat", "Combinatie van factoren", "Alleen druif"]', 2, 'Correct: Combinatie van factoren'),
  ('examen-wine', 'wijn-eindexamen', 10, 'Wat beïnvloedt glaswerk sterk?', '["Aromaontwikkeling", "Alcoholpercentage", "Leeftijd", "Prijs"]', 0, 'Correct: Aromaontwikkeling'),
  ('examen-wine', 'wijn-eindexamen', 11, 'Waarom decanteer je wijn?', '["Zuurstof en sediment", "Koelen", "Zoeter maken", "Filteren"]', 0, 'Correct: Zuurstof en sediment'),
  ('examen-wine', 'wijn-eindexamen', 12, 'Ideale bewaartemperatuur?', '["12 °C", "25 °C", "18 °C", "5 °C"]', 0, 'Correct: 12 °C'),
  ('examen-wine', 'wijn-eindexamen', 13, 'Wat verzacht tannine bij vlees?', '["Eiwit", "Suiker", "Zuur", "Water"]', 0, 'Correct: Eiwit'),
  ('examen-wine', 'wijn-eindexamen', 14, 'Welke pairing is klassiek?', '["Stilton & Port", "Sushi & Port", "Cola & Riesling", "Bier & Chardonnay"]', 0, 'Correct: Stilton & Port'),
  ('examen-wine', 'wijn-eindexamen', 15, 'Wat betekent deductie?', '["Redeneren vanuit observatie", "Gokken", "Schenken", "Bewaren"]', 0, 'Correct: Redeneren vanuit observatie'),
  ('examen-wine', 'wijn-eindexamen', 16, 'Wat analyseer je als eerste?', '["Kleur", "Body", "Alcohol", "Afdronk"]', 0, 'Correct: Kleur'),
  ('examen-wine', 'wijn-eindexamen', 17, 'Wat geeft warmte?', '["Alcohol", "Zuur", "Tannine", "Body"]', 0, 'Correct: Alcohol'),
  ('examen-wine', 'wijn-eindexamen', 18, 'Wat doet rijping vaak?', '["Meer complexiteit", "Minder geur", "Minder kleur", "Minder alcohol"]', 0, 'Correct: Meer complexiteit'),
  ('examen-wine', 'wijn-eindexamen', 19, 'Wat bepaalt kwaliteit sterk?', '["Balans", "Prijs", "Leeftijd", "Etiket"]', 0, 'Correct: Balans'),
  ('examen-wine', 'wijn-eindexamen', 20, 'Wat is de kern van blindproeven?', '["Structuur + deductie", "Alleen geur", "Alleen kleur", "Alleen leeftijd"]', 0, 'Correct: Structuur + deductie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
