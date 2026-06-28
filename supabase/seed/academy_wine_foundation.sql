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
    'Na deze les kun jij uitleggen wat wijn is, hoe wijn wordt gemaakt en waarom wijn wereldwijd zo’n belangrijke drank is.
',
    'Wijn is een alcoholische drank die ontstaat door het vergisten van druivensap.

Tijdens dit proces zetten gisten natuurlijke druivensuikers om in alcohol.

Wijn is uniek omdat het volledig afhankelijk is van natuur, klimaat, druivensoort en menselijke keuzes.

Dat maakt wijn één van de meest complexe dranken ter wereld.

Wijn wordt al duizenden jaren gemaakt en gedronken.

Tegenwoordig is wijn een belangrijk onderdeel van gastronomie, cultuur en sociale momenten.
',
    '- wijn
- fermentatie
- druiven
- alcohol
- gastronomie
',
    'Wijn is de oudste gecultiveerde alcoholische drank ter wereld.
',
    '- Wijn ontstaat uit druiven
- Gist zet suiker om in alcohol
- Wijn bestaat al duizenden jaren
- Wijn is sterk verbonden met cultuur en eten
- Wijn is wereldwijd populair
',
    '### Opdracht

Bekijk thuis of online drie verschillende wijnetiketten.

### Checklist

- Ik heb drie etiketten bekeken
- Ik heb het alcoholpercentage gevonden
- Ik heb het land van herkomst gevonden
- Ik heb de druivensoort gevonden

### Reflectievraag

Welke wijn sprak je direct het meeste aan?
',
    8,
    1
  ),
  (
    'hoe-ontstaat-wijn',
    'Hoe ontstaat wijn?',
    'Na deze les begrijp je de basisstappen van wijnproductie.
',
    'Alles begint in de wijngaard.

Druiven groeien, rijpen en worden geoogst.

Na de oogst worden ze geperst.

Het sap begint vervolgens te fermenteren.

Daarna kan wijn rijpen in tanks, hout of fles.

Elke keuze beïnvloedt smaak, stijl en kwaliteit.

Wijn maken is dus een combinatie van natuur en techniek.
',
    '- oogst
- most
- fermentatie
- rijping
- wijngaard
',
    'De oogstdatum heeft enorme invloed op suiker, zuur en aroma.
',
    '- Wijn begint in de wijngaard
- Oogst is cruciaal
- Persen levert most op
- Gisting maakt alcohol
- Rijping vormt stijl
',
    '### Opdracht

Zet de stappen van wijn maken in de juiste volgorde.

### Checklist

- Ik ken de volgorde
- Ik begrijp het verschil tussen oogst en fermentatie
- Ik begrijp waarom rijping belangrijk is

### Reflectievraag

Welke stap lijkt jou het belangrijkst?
',
    8,
    2
  ),
  (
    'wijnstijlen-basis',
    'Stille wijn vs mousserend vs versterkt',
    'Na deze les herken jij de drie belangrijkste wijncategorieën.
',
    'Niet alle wijn is hetzelfde.

Stille wijn bevat geen bubbels.

Mousserende wijn bevat koolzuur.

Versterkte wijn krijgt extra alcohol toegevoegd.

Elke categorie heeft een eigen productiemethode en smaakprofiel.

Binnen Way of Tasting ga je deze categorieën later apart verdiepen.

Deze basis helpt je de verschillen direct te begrijpen.
',
    '- stille wijn
- mousserend
- versterkt
- champagne
- port
',
    'Champagne is een mousserende wijn, Port een versterkte wijn.
',
    '- Stille wijn = geen bubbels
- Mousserend = koolzuur
- Versterkt = extra alcohol
- Productiemethode bepaalt stijl
',
    '### Opdracht

Zoek per categorie één voorbeeld.

### Checklist

- Ik vond een stille wijn
- Ik vond een mousserende wijn
- Ik vond een versterkte wijn

### Reflectievraag

Welke categorie drink jij het vaakst?
',
    8,
    3
  ),
  (
    'geschiedenis-van-wijn',
    'Geschiedenis van wijn',
    'Na deze les begrijp jij hoe wijn zich historisch ontwikkelde.
',
    'Wijn werd al duizenden jaren geleden gemaakt.

De oudste sporen komen uit Georgië.

Later verspreidden de Grieken wijncultuur.

De Romeinen brachten wijnbouw door Europa.

In de middeleeuwen hielden kloosters wijnkennis in leven.

Vandaag is wijn wereldwijd een industrie én cultuurproduct.

Veel wijntradities die we nu kennen, komen uit Frankrijk, Italië, Spanje en Portugal.
',
    '- Georgië
- Romeinen
- Grieken
- kloosters
- wijncultuur
',
    'Georgië gebruikt nog steeds traditionele kleivaten: qvevri.
',
    '- Wijn begon in Georgië
- Grieken verspreidden wijn
- Romeinen professionaliseerden wijnbouw
- Europa vormde moderne wijncultuur
',
    '### Opdracht

Zoek op welk land jij als eerste met wijn associeert.

### Checklist

- Ik heb een land gekozen
- Ik weet waarom
- Ik heb de wijntraditie onderzocht

### Reflectievraag

Waarom koos je dat land?
',
    8,
    4
  ),
  (
    'belangrijkste-wijncategorieen',
    'Belangrijkste wijncategorieën',
    'Na deze les herken jij de belangrijkste wijncategorieën.
',
    'Wijn kent veel stijlen.

De belangrijkste zijn:

- witte wijn
- rode wijn
- rosé
- mousserende wijn
- versterkte wijn
- zoete wijn

Elke categorie heeft eigen druiven, technieken en serveermomenten.

Deze vormen de basis van alles wat je later gaat leren.
',
    '- wit
- rood
- rosé
- mousserend
- versterkt
- zoet',
    'Rosé wordt meestal gemaakt van blauwe druiven, niet door rood en wit te mengen.
',
    '- Wit is fris en vaak lichter
- Rood bevat tannines
- Rosé zit tussen wit en rood
- Mousserend bevat bubbels
- Versterkt heeft meer alcohol
- Zoete wijn behoudt meer suiker
',
    '### Opdracht

Maak jouw persoonlijke top 3 wijncategorieën.

### Checklist

- Ik koos drie stijlen
- Ik weet waarom
- Ik kan ze uitleggen

### Reflectievraag

Welke categorie wil je als eerste verdiepen?
',
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
    'Wijn begint altijd met druiven.

Na de oogst worden de druiven geselecteerd, ontsteeld en geperst.

Bij witte wijn worden schillen meestal snel verwijderd.

Bij rode wijn blijven schillen vaak mee vergisten.

Daarna start de alcoholische gisting.

Na fermentatie volgt rijping.

Tot slot wordt de wijn gebotteld.

Elke stap beïnvloedt stijl, aroma en kwaliteit.
',
    '- oogst
- persen
- most
- gisting
- bottelen
',
    'Bij premiumwijnen gebeurt oogsten vaak met de hand.
',
    '- Wijn begint met druiven
- Oogst bepaalt kwaliteit
- Persen maakt most
- Gisting maakt alcohol
- Rijping vormt complexiteit
',
    '### Opdracht

Zet het wijnproces in de juiste volgorde.

### Checklist

- Ik ken alle stappen
- Ik begrijp de logica
- Ik weet waar kwaliteit ontstaat

### Reflectievraag

Welke stap lijkt jou het moeilijkst?
',
    8,
    1
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting',
    'Na deze les kun jij uitleggen hoe alcohol ontstaat.
',
    'Alcoholische gisting is het hart van wijnproductie.

Gist zet suiker om in alcohol, koolzuur en warmte.

Dit proces stopt wanneer alle suiker op is of de wijnmaker ingrijpt.

Temperatuur speelt een grote rol.

Koel vergisten behoudt frisheid.

Warmer vergisten geeft vaak meer structuur.

De wijnmaker stuurt dus actief op stijl.
',
    '- gist
- suiker
- alcohol
- CO2
- temperatuur
',
    'Gist kan zowel natuurlijk als geselecteerd zijn.
',
    '- Gist maakt alcohol
- Suiker is brandstof
- CO2 ontstaat mee
- Temperatuur beïnvloedt stijl
',
    '### Opdracht

Bekijk op een etiket het alcoholpercentage.

### Checklist

- Ik heb het gevonden
- Ik vergelijk twee wijnen
- Ik zie verschillen

### Reflectievraag

Welke wijn had het hoogste alcoholpercentage?
',
    8,
    2
  ),
  (
    'houtlagering',
    'Houtlagering uitgelegd',
    'Na deze les begrijp je wat hout doet met wijn.
',
    'Veel wijnen rijpen in houten vaten.

Meestal is dat eikenhout.

Hout geeft aroma’s zoals:

- vanille
- toast
- rook
- kruiden

Daarnaast maakt hout tannines zachter.

Ook zorgt hout voor kleine hoeveelheden zuurstof.

Dat helpt bij ontwikkeling.

Niet elke wijn heeft hout nodig.
',
    '- eikenhout
- vanille
- toast
- tannine
- houtrijping
',
    'Nieuwe vaten geven meer smaak dan oude vaten.
',
    '- Hout geeft aroma
- Hout verzacht structuur
- Hout geeft zuurstof
- Niet elke wijn gebruikt hout
',
    '### Opdracht

Zoek een wijn met houtrijping.

### Checklist

- Ik vond een houtgerijpte wijn
- Ik las het etiket
- Ik herkende smaken

### Reflectievraag

Welke houttonen herken jij?
',
    8,
    3
  ),
  (
    'oxidatie-vs-reductie',
    'Oxidatie vs reductie',
    'Na deze les begrijp jij het verschil tussen oxidatieve en reductieve wijnmaking.
',
    'Zuurstof beïnvloedt wijn sterk.

Bij oxidatieve wijnmaking krijgt wijn bewust zuurstof.

Dat geeft notige, rijpere aroma’s.

Bij reductieve wijnmaking wordt zuurstof juist vermeden.

Dat bewaart frisheid en fruit.

Beide stijlen zijn bewust gekozen.

Ze bepalen sterk hoe wijn smaakt.
',
    '- oxidatie
- reductie
- zuurstof
- frisheid
- notigheid
',
    'Tawny Port is een sterk oxidatieve stijl.
',
    '- Oxidatie = meer zuurstof
- Reductie = minder zuurstof
- Oxidatie geeft notigheid
- Reductie bewaart fruit
',
    '### Opdracht

Vergelijk een frisse Sauvignon Blanc met een houtgerijpte Chardonnay.

### Checklist

- Ik proefde frisheid
- Ik proefde rijping
- Ik zag verschil

### Reflectievraag

Welke stijl vond je interessanter?
',
    8,
    4
  ),
  (
    'rijping-en-ontwikkeling',
    'Rijping en ontwikkeling',
    'Na deze les begrijp je hoe wijn zich ontwikkelt door tijd.
',
    'Wijn verandert tijdens rijping.

Fruit wordt minder primair.

Complexiteit neemt toe.

Zuren integreren beter.

Tannines worden zachter.

Nieuwe aroma’s ontstaan zoals:

- leer
- tabak
- honing
- gedroogd fruit

Niet elke wijn wordt beter met leeftijd.

Balans is bepalend.
',
    '- rijping
- ontwikkeling
- tannines
- complexiteit
- bewaarpotentieel',
    'Sommige topwijnen kunnen tientallen jaren rijpen.
',
    '- Rijping verandert wijn
- Fruit wordt complexer
- Tannines verzachten
- Niet elke wijn is bewaarwijn
- Balans bepaalt potentieel
',
    '### Opdracht

Zoek uit welke wijn in jouw collectie bewaarpotentieel heeft.

### Checklist

- Ik koos een wijn
- Ik onderzocht de bewaartijd
- Ik begrijp waarom

### Reflectievraag

Zou jij deze wijn bewaren?
',
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
    'Wijn proef je niet zomaar.

Professioneel proeven gebeurt in vier stappen:

1. Kijken  
2. Ruiken  
3. Proeven  
4. Concluderen

Eerst analyseer je de kleur.

Daarna zoek je aroma’s.

Vervolgens proef je structuur, smaak en balans.

Tot slot trek je conclusies over stijl, kwaliteit en mogelijk herkomst.

Deze methode is wereldwijd de basis.
',
    '- proeven
- kijken
- ruiken
- analyseren
- conclusie
',
    'Bij blindproeven is structuur vaak belangrijker dan smaak.
',
    '- Wijnproeven is gestructureerd
- Vier stappen vormen de basis
- Eerst kijken, dan ruiken
- Structuur is essentieel
',
    '### Opdracht

Proef een wijn volgens de vier stappen.

### Checklist

- Ik keek bewust
- Ik rook bewust
- Ik proefde bewust
- Ik maakte een conclusie

### Reflectievraag

Welke stap vond je het moeilijkst?
',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij kleur gebruiken als eerste analysetool.
',
    'Kleur vertelt veel over wijn.

Bij witte wijn kijk je naar intensiteit en tint.

Bij rode wijn kijk je naar diepte en randkleur.

Een jonge witte wijn is vaak lichter.

Een oudere witte wijn krijgt goudtinten.

Een jonge rode wijn toont vaak paars.

Een oudere rode wijn krijgt baksteen- of bruintinten.

Kleur geeft aanwijzingen over leeftijd, druif en stijl.
',
    '- kleur
- intensiteit
- randkleur
- leeftijd
- druif
',
    'Pinot Noir is vaak lichter van kleur dan Cabernet Sauvignon.
',
    '- Kleur geeft informatie
- Leeftijd beïnvloedt kleur
- Druif beïnvloedt kleur
- Stijl beïnvloedt kleur
',
    '### Opdracht

Vergelijk twee wijnen op kleur.

### Checklist

- Ik keek naar intensiteit
- Ik keek naar randkleur
- Ik noteerde verschillen

### Reflectievraag

Wat viel je op?
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les herken jij de drie aromacategorieën.
',
    'Aroma’s in wijn vallen in drie groepen:

Primair:
afkomstig van de druif.

Secundair:
ontstaan door wijnmaken.

Tertiair:
ontstaan door rijping.

Primair geeft fruit en bloemen.

Secundair geeft gist, boter of brood.

Tertiair geeft leer, honing, tabak of noten.

Door dit onderscheid kun je wijn veel beter analyseren.
',
    '- primair
- secundair
- tertiair
- fruit
- rijping
',
    'Vanille komt meestal van hout, niet van druiven.
',
    '- Primair = druif
- Secundair = productie
- Tertiair = rijping
- Aroma’s helpen herkennen
',
    '### Opdracht

Noem drie aroma’s in een wijn.

### Checklist

- Ik benoemde fruit
- Ik benoemde productie
- Ik benoemde rijping

### Reflectievraag

Welke categorie vond je het makkelijkst?
',
    8,
    3
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij de belangrijkste structuurelementen herkennen.
',
    'Structuur is de ruggengraat van wijn.

De belangrijkste onderdelen zijn:

- zuur
- tannine
- alcohol
- body
- afdronk

Zuur geeft frisheid.

Tannine geeft grip.

Alcohol geeft warmte.

Body geeft gewicht.

Afdronk geeft lengte.

Hoe beter de balans, hoe hoger vaak de kwaliteit.
',
    '- zuur
- tannine
- alcohol
- body
- afdronk
',
    'Tannines voel je vooral op je tandvlees.
',
    '- Structuur bepaalt stijl
- Zuur geeft spanning
- Tannine geeft grip
- Body geeft gewicht
- Afdronk geeft kwaliteit
',
    '### Opdracht

Analyseer één wijn op structuur.

### Checklist

- Ik beoordeelde zuur
- Ik beoordeelde body
- Ik beoordeelde afdronk

### Reflectievraag

Welke factor sprong eruit?
',
    8,
    4
  ),
  (
    'mini-toets-wijn',
    'Mini-toets wijn',
    'Na deze les toets jij jouw kennis van module 1–3.
',
    'Deze toets combineert:

- fundament
- productie
- proeven

Je past kennis toe zoals in echte wijneducatie.

Dit is jouw eerste integratiemoment.
',
    '- integratie
- analyse
- structuur
- aroma
- conclusie',
    '',
    '',
    '### Opdracht

Proef één wijn volledig zelfstandig.

### Checklist

- Ik keek
- Ik rook
- Ik proefde
- Ik analyseerde
- Ik concludeerde

### Reflectievraag

Waar voel jij nog onzekerheid?
',
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
    'Zuur is één van de belangrijkste elementen in wijn.

Het geeft spanning, frisheid en energie.

Zonder zuur smaakt wijn vlak.

Koele klimaten geven vaak hogere zuren.

Belangrijke zuren in wijn zijn:

- wijnsteenzuur
- appelzuur
- melkzuur

Zuur speelt een grote rol in bewaarpotentieel en foodpairing.

Hoe hoger het zuur, hoe frisser wijn vaak smaakt.
',
    '- zuur
- frisheid
- spanning
- rijping
- speekselvorming
',
    'Speekselvorming is een goede indicator van hoge zuren.
',
    '- Zuur geeft frisheid
- Zuur geeft spanning
- Klimaat beïnvloedt zuur
- Zuur helpt bij rijping
',
    '### Opdracht

Proef een Sauvignon Blanc en focus alleen op zuur.

### Checklist

- Ik voelde speekselvorming
- Ik herkende frisheid
- Ik noteerde intensiteit

### Reflectievraag

Hoe sterk was het zuur?
',
    8,
    1
  ),
  (
    'tannines',
    'Tannines',
    'Na deze les kun jij tannines herkennen en beoordelen.
',
    'Tannines zijn natuurlijke stoffen uit druivenschillen, pitten en hout.

Ze geven structuur en grip.

Je voelt tannines als uitdrogend effect op je tandvlees.

Rode wijn bevat meestal veel meer tannine dan witte wijn.

Tannines helpen wijn rijpen.

Belangrijke druiven met veel tannine:

- Cabernet Sauvignon
- Nebbiolo
- Syrah

Pinot Noir bevat meestal minder.
',
    '- tannine
- grip
- uitdroging
- schillen
- rijping
',
    'Tannine bindt zich aan eiwitten, daarom werkt rood vlees zo goed.
',
    '- Tannines geven grip
- Tannines drogen uit
- Rood heeft meer tannines
- Tannines helpen rijping
',
    '### Opdracht

Proef een stevige rode wijn.

### Checklist

- Ik voelde grip
- Ik voelde uitdroging
- Ik noteerde intensiteit

### Reflectievraag

Was de tannine zacht of hard?
',
    8,
    2
  ),
  (
    'alcohol',
    'Alcohol',
    'Na deze les kun jij alcohol in wijn herkennen en inschatten.
',
    'Alcohol geeft warmte, body en kracht.

Meer rijpe druiven bevatten meer suiker.

Meer suiker betekent vaak meer alcohol.

Warm klimaat geeft daardoor vaak hogere alcohol.

Alcohol beïnvloedt balans sterk.

Te veel alcohol kan wijn log maken.

Goed geïntegreerde alcohol voelt soepel.
',
    '- alcohol
- warmte
- rijpheid
- suiker
- balans
',
    'Alcohol is vaak voelbaar achter in de mond en keel.
',
    '- Alcohol geeft warmte
- Klimaat beïnvloedt alcohol
- Rijpheid beïnvloedt alcohol
- Balans is cruciaal
',
    '### Opdracht

Vergelijk een wijn van 12% en 15%.

### Checklist

- Ik voelde verschil
- Ik noteerde warmte
- Ik beoordeelde balans

### Reflectievraag

Welke voelde beter geïntegreerd?
',
    8,
    3
  ),
  (
    'body',
    'Body',
    'Na deze les kun jij body herkennen en benoemen.
',
    'Body is het gewicht van wijn in je mond.

Vergelijk het met melk:

- water = light-bodied
- halfvolle melk = medium-bodied
- volle melk = full-bodied

Body wordt beïnvloed door:

- alcohol
- extract
- suiker
- glycerol

Body helpt enorm bij blindproeven.

Het zegt veel over klimaat, druif en stijl.
',
    '- body
- gewicht
- extract
- glycerol
- mondgevoel
',
    'Veel alcohol geeft vaak meer body.
',
    '- Body is mondgewicht
- Body varieert van light tot full
- Alcohol beïnvloedt body
- Body helpt blindproeven
',
    '### Opdracht

Vergelijk een Pinot Grigio met een Amarone.

### Checklist

- Ik voelde verschil
- Ik benoemde body
- Ik noteerde waarom

### Reflectievraag

Welke wijn voelde zwaarder?
',
    8,
    4
  ),
  (
    'balans',
    'Balans',
    'Na deze les kun jij balans beoordelen als kwaliteitsindicator.
',
    'Balans is misschien wel de belangrijkste kwaliteitsfactor.

Balans betekent dat alle elementen samenwerken:

- zuur
- tannine
- alcohol
- fruit
- body
- afdronk

Geen enkel onderdeel mag domineren.

Een grote wijn voelt harmonieus.

Balans bepaalt drinkbaarheid, complexiteit en bewaarpotentieel.

Dit is de kern van professioneel proeven.
',
    '- balans
- harmonie
- kwaliteit
- structuur
- complexiteit',
    'Veel dure wijnen onderscheiden zich vooral door perfecte balans.
',
    '- Balans = harmonie
- Balans bepaalt kwaliteit
- Balans verhoogt complexiteit
- Balans bepaalt bewaarpotentieel
',
    '### Opdracht

Proef één wijn en beoordeel puur op balans.

### Checklist

- Ik analyseerde zuur
- Ik analyseerde tannine
- Ik analyseerde alcohol
- Ik beoordeelde harmonie

### Reflectievraag

Was de wijn in balans?
',
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
    'Witte wijn begint bij witte druiven.

De drie belangrijkste basisdruiven zijn:

- Chardonnay
- Sauvignon Blanc
- Riesling

Chardonnay is veelzijdig en vaak neutraal.

Sauvignon Blanc is fris en aromatisch.

Riesling combineert hoge zuren met precisie.

Deze drie vormen de basis van veel wijneducatie.
',
    '- Chardonnay
- Sauvignon Blanc
- Riesling
- wit
- zuur
',
    'Chardonnay groeit bijna overal ter wereld.
',
    '- Chardonnay is veelzijdig
- Sauvignon Blanc is expressief
- Riesling is zuurgedreven
- Dit zijn fundamentele druiven
',
    '### Opdracht

Zoek drie flessen van deze druiven.

### Checklist

- Ik vond Chardonnay
- Ik vond Sauvignon Blanc
- Ik vond Riesling

### Reflectievraag

Welke spreekt jou het meeste aan?
',
    8,
    1
  ),
  (
    'rode-druivenbasis',
    'Rode druivenbasis',
    'Na deze les herken jij de belangrijkste rode basisdruiven.
',
    'Rode wijn draait vaak om drie grote druiven:

- Cabernet Sauvignon
- Merlot
- Pinot Noir

Cabernet geeft kracht en tannine.

Merlot geeft rondheid en zachtheid.

Pinot Noir geeft elegantie en finesse.

Deze drie vormen de basis van veel klassieke blends en stijlen.
',
    '- Cabernet Sauvignon
- Merlot
- Pinot Noir
- tannine
- finesse
',
    'Bordeaux combineert vaak Cabernet en Merlot.
',
    '- Cabernet = kracht
- Merlot = zachtheid
- Pinot Noir = finesse
- Basis van veel grote wijnen
',
    '### Opdracht

Vergelijk drie rode wijnen van deze druiven.

### Checklist

- Ik proefde verschil
- Ik noteerde structuur
- Ik noteerde aroma

### Reflectievraag

Welke stijl vond je het mooist?
',
    8,
    2
  ),
  (
    'aromatische-druiven',
    'Aromatische druiven',
    'Na deze les begrijp jij wat aromatische druiven uniek maakt.
',
    'Aromatische druiven zijn direct herkenbaar.

Ze geven intense geurprofielen.

Belangrijke voorbeelden:

- Muscat
- Gewürztraminer
- Viognier
- Torrontés

Typische aroma’s:

- bloemen
- lychee
- druiven
- exotisch fruit
- kruiden

Deze druiven zijn vaak makkelijker te herkennen.
',
    '- Muscat
- Gewürztraminer
- Viognier
- bloemen
- lychee
',
    'Muscat is één van de oudste druivenrassen ter wereld.
',
    '- Aromatische druiven zijn expressief
- Geur is direct herkenbaar
- Vaak bloemig en exotisch
',
    '### Opdracht

Ruik een Gewürztraminer of Muscat.

### Checklist

- Ik herkende bloemen
- Ik herkende fruit
- Ik noteerde intensiteit

### Reflectievraag

Welke geur viel op?
',
    8,
    3
  ),
  (
    'neutrale-druiven',
    'Neutrale druiven',
    'Na deze les begrijp jij wat neutrale druiven zijn.
',
    'Neutrale druiven geven minder uitgesproken aroma’s.

Daardoor speelt terroir vaak een grotere rol.

Voorbeelden:

- Chardonnay
- Pinot Grigio
- Trebbiano

Deze druiven zijn sterk beïnvloedbaar door klimaat en wijnmaker.

Daardoor kunnen ze zeer verschillend smaken.
',
    '- neutraal
- Chardonnay
- terroir
- subtiel
- kameleon
',
    'Chardonnay wordt vaak de ‘kameleon van wijn’ genoemd.
',
    '- Neutrale druiven zijn subtieler
- Terroir speelt grotere rol
- Productie beïnvloedt stijl sterk
',
    '### Opdracht

Vergelijk twee Chardonnays uit verschillende landen.

### Checklist

- Ik proefde verschil
- Ik zag terroirinvloed
- Ik noteerde stijl

### Reflectievraag

Welke was complexer?
',
    8,
    4
  ),
  (
    'hoe-druiven-stijl-bepalen',
    'Hoe druiven stijl bepalen',
    'Na deze les begrijp jij hoe druiven de stijl van wijn fundamenteel bepalen.
',
    'Elke druif heeft een eigen genetisch profiel.

Dat bepaalt:

- zuur
- tannine
- suikerpotentieel
- aroma
- kleur
- body

Cabernet is anders dan Pinot Noir.

Riesling is anders dan Chardonnay.

Druiven vormen de basis van herkenning.

Bij blindproeven is dit essentieel.

Wie druiven begrijpt, begrijpt wijn.
',
    '- druif
- stijl
- structuur
- aroma
- blindproeven',
    'Veel topproevers starten hun analyse altijd bij de druif.
',
    '- Druiven bepalen structuur
- Druiven bepalen aroma
- Druiven bepalen stijl
- Druifherkenning is essentieel
',
    '### Opdracht

Kies drie favoriete druiven en beschrijf hun stijl.

### Checklist

- Ik koos drie druiven
- Ik noteerde structuur
- Ik noteerde aroma

### Reflectievraag

Welke druif past het beste bij jouw smaak?
',
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
    'Koele wijngebieden zorgen voor langzamere rijping.

Daardoor behouden druiven meer zuur.

Wijnen uit koele klimaten zijn vaak:

- frisser
- strakker
- lichter
- preciezer

Typische aroma’s zijn citrus, groene appel en mineraliteit.

Voorbeelden van koele gebieden:

- Mosel
- Chablis
- Champagne

Koel klimaat helpt vaak bij elegantie.
',
    '- koel
- zuur
- elegantie
- citrus
- frisheid
',
    'Champagne is zo geschikt voor mousserende wijn door zijn hoge natuurlijke zuren.
',
    '- Koel klimaat geeft hogere zuren
- Koel klimaat geeft frisheid
- Rijping verloopt trager
- Wijnen zijn vaak eleganter
',
    '### Opdracht

Vergelijk een Chablis met een warmere Chardonnay.

### Checklist

- Ik proefde meer zuur
- Ik proefde meer spanning
- Ik noteerde verschil

### Reflectievraag

Welke vond je frisser?
',
    8,
    1
  ),
  (
    'gematigd-klimaat',
    'Gematigd klimaat',
    'Na deze les begrijp jij wat gematigd klimaat doet.
',
    'Gematigd klimaat zit tussen koel en warm in.

Hier ontstaat vaak de meeste balans.

Druiven rijpen goed, maar behouden genoeg zuur.

Wijnen zijn vaak:

- evenwichtig
- toegankelijk
- complex

Veel klassieke regio’s liggen in gematigde zones.

Voorbeelden:

- Bordeaux
- Bourgogne
- Rioja

Dit klimaat levert vaak de meest complete wijnen.
',
    '- balans
- gematigd
- Bordeaux
- Bourgogne
- Rioja
',
    'Veel van de beroemdste wijnregio’s ter wereld zijn gematigd.
',
    '- Gematigd geeft balans
- Goede rijping
- Goede zuren
- Vaak klassieke stijl
',
    '### Opdracht

Zoek drie beroemde gematigde wijnregio’s.

### Checklist

- Ik vond drie regio’s
- Ik noteerde klimaat
- Ik noteerde druiven

### Reflectievraag

Welke regio spreekt je aan?
',
    8,
    2
  ),
  (
    'warm-klimaat',
    'Warm klimaat',
    'Na deze les begrijp jij hoe warm klimaat wijn verandert.
',
    'Warm klimaat versnelt rijping.

Druiven ontwikkelen meer suiker.

Daardoor stijgt alcohol.

Zuren dalen sneller.

Wijnen zijn vaak:

- voller
- rijper
- krachtiger

Typische aroma’s:

- rijp zwart fruit
- jam
- specerijen

Voorbeelden:

- Barossa
- Napa Valley
- Priorat
',
    '- warm
- alcohol
- rijpheid
- body
- suiker
',
    'Warm klimaat geeft vaak hogere body.
',
    '- Warm klimaat geeft rijpheid
- Meer alcohol
- Minder zuur
- Meer body
',
    '### Opdracht

Vergelijk een warme Shiraz met een koelere Syrah.

### Checklist

- Ik voelde body
- Ik voelde alcohol
- Ik noteerde verschil

### Reflectievraag

Welke was krachtiger?
',
    8,
    3
  ),
  (
    'bodemtypes',
    'Bodemtypes',
    'Na deze les herken jij de belangrijkste bodeminvloeden.
',
    'Bodem beïnvloedt drainage, warmte en wortelgroei.

Belangrijke bodems:

- kalk → spanning, finesse
- klei → kracht, body
- zand → elegantie, zachtheid
- leisteen → mineraliteit, concentratie

Bodem werkt altijd samen met klimaat.

Geen bodem is “beter”.

Het gaat om de juiste match.
',
    '- kalk
- klei
- zand
- leisteen
- drainage
',
    'Leisteen is cruciaal in de Douro voor Port.
',
    '- Kalk geeft finesse
- Klei geeft kracht
- Zand geeft elegantie
- Leisteen geeft concentratie
',
    '### Opdracht

Zoek van één favoriete wijn de bodemsoort.

### Checklist

- Ik vond de bodem
- Ik koppelde dit aan smaak
- Ik begreep de link

### Reflectievraag

Zie je de invloed terug?
',
    8,
    4
  ),
  (
    'terroir-uitgelegd',
    'Terroir uitgelegd',
    'Na deze les begrijp jij het complete concept terroir.
',
    'Terroir is de combinatie van:

- klimaat
- bodem
- ligging
- hoogte
- menselijk handelen

Terroir verklaart waarom dezelfde druif anders smaakt op andere plekken.

Pinot Noir uit Bourgogne is anders dan Pinot Noir uit Oregon.

Niet alleen de druif telt.

Terroir bepaalt identiteit.

Dit is één van de diepste concepten in wijn.
',
    '- terroir
- klimaat
- bodem
- ligging
- identiteit',
    'Veel topwijnmakers zien terroir als de ziel van wijn.
',
    '- Terroir is totaalcontext
- Druif alleen is niet genoeg
- Locatie bepaalt stijl
- Terroir maakt wijn uniek
',
    '### Opdracht

Vergelijk twee dezelfde druiven uit verschillende landen.

### Checklist

- Ik proefde verschil
- Ik koppelde dit aan terroir
- Ik noteerde conclusies

### Reflectievraag

Wat was het grootste verschil?
',
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
    'Temperatuur beïnvloedt smaak enorm.

Te koud:

- minder aroma
- strakkere structuur
- minder expressie

Te warm:

- meer alcoholgevoel
- minder frisheid
- minder precisie

Algemene richtlijnen:

- Mousserend: 6–8°C
- Fris wit: 8–10°C
- Vol wit: 10–12°C
- Licht rood: 14–16°C
- Vol rood: 16–18°C
- Versterkt: stijlafhankelijk

Correcte temperatuur verhoogt kwaliteit direct.
',
    '- temperatuur
- frisheid
- alcohol
- service
- balans
',
    'Veel rode wijn wordt thuis te warm geserveerd.
',
    '- Temperatuur verandert smaak
- Te koud sluit wijn af
- Te warm vergroot alcohol
- Correct serveren verhoogt kwaliteit
',
    '### Opdracht

Meet thuis de temperatuur van een wijn voor het openen.

### Checklist

- Ik mat de temperatuur
- Ik vergeleek met richtlijn
- Ik corrigeerde indien nodig

### Reflectievraag

Was jouw wijn te warm of te koud?
',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij hoe glasvorm de wijn beïnvloedt.
',
    'Het juiste glas maakt veel verschil.

Een goed glas helpt bij:

- aromaontwikkeling
- zuurstofcontact
- focus van geur
- mondgevoel

Belangrijke elementen:

- kelkbreedte
- opening
- inhoud

Grote rode wijnen profiteren van grote glazen.

Frisse witte wijnen werken vaak beter in smallere glazen.

Glas is een actief onderdeel van service.
',
    '- glas
- kelk
- aroma
- zuurstof
- focus
',
    'Professionele proevers kiezen soms eerst het glas, dan de wijn.
',
    '- Glas beïnvloedt geur
- Glas beïnvloedt mondgevoel
- Grote kelk = meer zuurstof
- Smalle opening = meer focus
',
    '### Opdracht

Proef dezelfde wijn uit twee verschillende glazen.

### Checklist

- Ik rook verschil
- Ik proefde verschil
- Ik noteerde verschil

### Reflectievraag

Wat veranderde het meest?
',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren',
    'Na deze les weet jij wanneer en waarom je wijn decanteert.
',
    'Decanteren heeft twee doelen:

1. Zuurstof geven  
2. Sediment scheiden

Jonge, krachtige wijnen profiteren vaak van lucht.

Oude wijnen worden vaak voorzichtig gedecanteerd voor sediment.

Niet elke wijn hoeft gedecanteerd te worden.

Te veel zuurstof kan delicate wijn beschadigen.

Decanteren is dus timing.
',
    '- decanteren
- zuurstof
- sediment
- timing
- ontwikkeling
',
    'Vintage Port wordt bijna altijd gedecanteerd.
',
    '- Decanteren geeft zuurstof
- Decanteren verwijdert sediment
- Jong en oud vragen andere aanpak
- Niet elke wijn profiteert
',
    '### Opdracht

Open een jonge rode wijn en proef direct en na 30 minuten.

### Checklist

- Ik proefde direct
- Ik proefde later
- Ik noteerde verschil

### Reflectievraag

Wat veranderde?
',
    8,
    3
  ),
  (
    'bewaren-kelderen',
    'Bewaren & kelderen',
    'Na deze les begrijp jij hoe wijn correct wordt opgeslagen.
',
    'Niet elke wijn is bedoeld om te bewaren.

Bewaren vraagt stabiliteit:

- temperatuur rond 12°C
- weinig licht
- weinig trillingen
- juiste luchtvochtigheid

Liggende opslag houdt de kurk vochtig.

Warmte versnelt veroudering.

Licht beschadigt wijn.

Goede opslag beschermt investering en kwaliteit.
',
    '- opslag
- kelderen
- temperatuur
- licht
- kurk',
    'De meeste supermarktwijnen zijn bedoeld voor snelle consumptie.
',
    '- Niet alle wijn is bewaarwijn
- Koele stabiele opslag is cruciaal
- Licht en warmte schaden wijn
- Liggend bewaren beschermt kurk
',
    '### Opdracht

Controleer jouw wijnopslag.

### Checklist

- Ik keek naar temperatuur
- Ik keek naar licht
- Ik keek naar positie
- Ik keek naar stabiliteit

### Reflectievraag

Wat kun je verbeteren?
',
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
    'Kaas en wijn zijn klassieke partners.

Maar niet elke combinatie werkt.

Belangrijke factoren:

- vet
- zout
- romigheid
- intensiteit

Zout verzacht tannine.

Vet maakt wijn zachter.

Blauwe kaas werkt vaak fantastisch met zoete wijn.

Harde kazen combineren vaak goed met stevige rode wijn.

Balans blijft altijd het uitgangspunt.
',
    '- kaas
- zout
- vet
- Port
- balans
',
    'Stilton en Port is één van de beroemdste pairings ter wereld.
',
    '- Vet verzacht wijn
- Zout verzacht tannine
- Blauwe kaas vraagt vaak zoet
- Intensiteit moet kloppen
',
    '### Opdracht

Maak thuis een mini kaasplank met twee wijnen.

### Checklist

- Ik combineerde zacht en hard
- Ik testte contrast
- Ik testte harmonie

### Reflectievraag

Welke combinatie werkte het beste?
',
    8,
    1
  ),
  (
    'wijn-en-vis',
    'Wijn & vis',
    'Na deze les begrijp jij hoe wijn werkt met visgerechten.
',
    'Vis vraagt meestal om frisheid.

Daarom werken witte wijnen vaak goed.

Belangrijke factoren:

- vetgehalte
- bereidingswijze
- saus
- textuur

Lichte vis vraagt lichte wijn.

Vette vis zoals zalm kan meer body aan.

Zuren snijden door vet.

Saus bepaalt vaak meer dan de vis zelf.
',
    '- vis
- zuur
- vet
- saus
- body
',
    'Boter in saus kan Chardonnay beter laten werken dan Sauvignon Blanc.
',
    '- Vis vraagt vaak frisheid
- Vet vraagt structuur
- Saus bepaalt pairing sterk
- Intensiteit moet matchen
',
    '### Opdracht

Combineer zalm met twee verschillende witte wijnen.

### Checklist

- Ik proefde verschil
- Ik analyseerde vet
- Ik analyseerde zuur

### Reflectievraag

Welke wijn werkte beter?
',
    8,
    2
  ),
  (
    'wijn-en-vlees',
    'Wijn & vlees',
    'Na deze les kun jij wijn succesvol combineren met vlees.
',
    'Vlees draait om eiwit, vet en intensiteit.

Tannines en eiwitten werken sterk samen.

Daardoor worden rode wijnen zachter.

Belangrijke regels:

- licht vlees = lichtere wijn
- rood vlees = meer structuur
- vet vlees = meer zuur of tannine

Bereiding is cruciaal:

Gegrild vlees vraagt vaak rokerige of krachtige wijn.

Stoofgerechten vragen zachtere, rijpere wijnen.

Sauzen blijven belangrijk.
',
    '- vlees
- eiwit
- tannine
- structuur
- pairing',
    'Cabernet Sauvignon en steak is één van de bekendste pairings.
',
    '- Eiwit verzacht tannine
- Vet vraagt structuur
- Bereiding bepaalt veel
- Intensiteit moet matchen
',
    '### Opdracht

Combineer rood vlees met twee rode wijnen.

### Checklist

- Ik testte structuur
- Ik testte tannines
- Ik noteerde verschil

### Reflectievraag

Welke wijn werd zachter door het vlees?
',
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
    'Blindproeven betekent proeven zonder etiket.

Je analyseert op:

- kleur
- intensiteit
- aroma
- zuur
- alcohol
- body
- afdronk

Bij wit let je extra op:

- frisheid
- citrus
- bloemen
- mineraliteit
- rijpheid

Daaruit bouw je hypotheses.

Bijvoorbeeld:

hoog zuur + citrus + licht body = mogelijk Riesling of Sauvignon Blanc.

Blindproeven is deductie.
',
    '- blind
- wit
- zuur
- deductie
- hypothese
',
    'Veel sommeliers beginnen blind altijd met klimaatinschatting.
',
    '- Blind = zonder etiket
- Structuur is essentieel
- Wit draait vaak om zuur
- Deductie is de kern
',
    '### Opdracht

Blindproef één witte wijn.

### Checklist

- Ik keek
- Ik rook
- Ik proefde
- Ik bouwde een hypothese

### Reflectievraag

Welke druif denk je dat het was?
',
    10,
    1
  ),
  (
    'blindproeven-rood',
    'Blindproeven rood',
    'Na deze les kun jij rode wijn blind analyseren.
',
    'Bij rode wijn let je extra op:

- kleurintensiteit
- tannine
- alcohol
- body
- fruitprofiel
- hout
- rijping

Belangrijke deducties:

Licht kleur + hoge zuren + lage tannine = Pinot Noir.

Donkere kleur + hoge tannine + hoog alcohol = Cabernet Sauvignon of Syrah.

Structuur helpt sneller dan aroma.

Dat is waarom professionals hierop bouwen.
',
    '- rood
- tannine
- kleur
- body
- deductie
',
    'Veel beginners vertrouwen te veel op geur en te weinig op structuur.
',
    '- Rood draait sterk om tannine
- Structuur helpt identificeren
- Kleur geeft leeftijd en stijl
- Deductie versnelt herkenning
',
    '### Opdracht

Blindproef één rode wijn.

### Checklist

- Ik beoordeelde kleur
- Ik beoordeelde tannine
- Ik beoordeelde body
- Ik maakte een conclusie

### Reflectievraag

Welke druif vermoed je?
',
    10,
    2
  ),
  (
    'wijn-eindexamen',
    'Theorie- en praktijkexamen',
    'Na deze les integreer jij alle kennis van de volledige Wine Foundation Track.
',
    'Dit examen combineert:

### Fundament
- Wat is wijn?
- Categorieën
- Geschiedenis

### Productie
- Fermentatie
- Houtlagering
- Oxidatie
- Rijping

### Structuur
- Zuur
- Tannine
- Alcohol
- Body
- Balans

### Druivenrassen
- Witte basisdruiven
- Rode basisdruiven
- Aromatisch vs neutraal

### Klimaat & Terroir
- Koel
- Gematigd
- Warm
- Bodemtypes
- Terroir

### Service
- Temperatuur
- Glaswerk
- Decanteren
- Opslag

### Pairing
- Kaas
- Vis
- Vlees

### Blindproeven
- Wit
- Rood
- Deductie

Dit is jouw eerste volledige sommelier-integratiemoment.
',
    '- integratie
- examen
- blindproeven
- kwaliteit
- deductie',
    '',
    '',
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

Waar ben jij het sterkst in geworden?
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
  where t.slug = 'wine-foundation'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-wine', 'wat-is-wijn', 1, 'Waarvan wordt wijn gemaakt?', '["Granen", "Druiven", "Appels", "Honing"]', 1, 'Correct: Druiven'),
  ('intro-wine', 'wat-is-wijn', 2, 'Wat gebeurt er tijdens fermentatie?', '["Alcohol ontstaat", "Water verdampt", "Zuurstof verdwijnt", "Kleur ontstaat"]', 0, 'Correct: Alcohol ontstaat'),
  ('intro-wine', 'wat-is-wijn', 3, 'Wijn is:', '["Gedistilleerd", "Vergist", "Gecarboniseerd", "Gekookt"]', 1, 'Correct: Vergist'),
  ('intro-wine', 'wat-is-wijn', 4, 'Hoe oud is wijncultuur ongeveer?', '["500 jaar", "1000 jaar", "3000 jaar", "Meer dan 6000 jaar"]', 3, 'Correct: Meer dan 6000 jaar'),
  ('intro-wine', 'wat-is-wijn', 5, 'Wijn is sterk verbonden met:', '["Sport", "Gastronomie", "Technologie", "Muziek"]', 1, 'Correct: Gastronomie'),
  ('intro-wine', 'hoe-ontstaat-wijn', 1, 'Wat komt eerst?', '["Gisting", "Oogst", "Rijping", "Bottelen"]', 1, 'Correct: Oogst'),
  ('intro-wine', 'hoe-ontstaat-wijn', 2, 'Wat doet gist?', '["Verhoogt zuur", "Maakt alcohol", "Verwijdert kleur", "Koelt wijn"]', 1, 'Correct: Maakt alcohol'),
  ('intro-wine', 'hoe-ontstaat-wijn', 3, 'Na fermentatie volgt vaak:', '["Rijping", "Distillatie", "Carbonisatie", "Droging"]', 0, 'Correct: Rijping'),
  ('intro-wine', 'hoe-ontstaat-wijn', 4, 'Waar groeit wijn?', '["Wijngaard", "Kelder", "Tank", "Vat"]', 0, 'Correct: Wijngaard'),
  ('intro-wine', 'hoe-ontstaat-wijn', 5, 'Wat beïnvloedt stijl sterk?', '["Productiekeuzes", "Glas", "Etiket", "Flesvorm"]', 0, 'Correct: Productiekeuzes'),
  ('intro-wine', 'wijnstijlen-basis', 1, 'Welke wijn heeft bubbels?', '["Stille wijn", "Mousserend", "Versterkt", "Rosé"]', 1, 'Correct: Mousserend'),
  ('intro-wine', 'wijnstijlen-basis', 2, 'Welke krijgt extra alcohol?', '["Stille wijn", "Versterkt", "Mousserend", "Zoete wijn"]', 1, 'Correct: Versterkt'),
  ('intro-wine', 'wijnstijlen-basis', 3, 'Port is:', '["Mousserend", "Versterkt", "Stille wijn", "Rosé"]', 1, 'Correct: Versterkt'),
  ('intro-wine', 'wijnstijlen-basis', 4, 'Champagne is:', '["Stille wijn", "Mousserend", "Versterkt", "Dessertwijn"]', 1, 'Correct: Mousserend'),
  ('intro-wine', 'wijnstijlen-basis', 5, 'Welke bevat géén bubbels?', '["Stille wijn", "Champagne", "Cava", "Prosecco"]', 0, 'Correct: Stille wijn'),
  ('intro-wine', 'geschiedenis-van-wijn', 1, 'Waar begon wijn?', '["Frankrijk", "Italië", "Georgië", "Spanje"]', 2, 'Correct: Georgië'),
  ('intro-wine', 'geschiedenis-van-wijn', 2, 'Wie verspreidden wijn sterk?', '["Grieken", "Duitsers", "Nederlanders", "Belgen"]', 0, 'Correct: Grieken'),
  ('intro-wine', 'geschiedenis-van-wijn', 3, 'Wie professionaliseerden wijnbouw?', '["Romeinen", "Vikingen", "Engelsen", "Amerikanen"]', 0, 'Correct: Romeinen'),
  ('intro-wine', 'geschiedenis-van-wijn', 4, 'Wie bewaakten kennis in de middeleeuwen?', '["Kloosters", "Koningen", "Handelaren", "Soldaten"]', 0, 'Correct: Kloosters'),
  ('intro-wine', 'geschiedenis-van-wijn', 5, 'Wijn is vandaag:', '["Alleen landbouw", "Alleen cultuur", "Beide", "Geen van beide"]', 2, 'Correct: Beide'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 1, 'Welke wijn bevat tannines?', '["Wit", "Rood", "Mousserend", "Zoet"]', 1, 'Correct: Rood'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 2, 'Welke bevat bubbels?', '["Rosé", "Mousserend", "Rood", "Versterkt"]', 1, 'Correct: Mousserend'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 3, 'Welke heeft extra alcohol?', '["Zoet", "Versterkt", "Rosé", "Wit"]', 1, 'Correct: Versterkt'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 4, 'Rosé wordt meestal gemaakt van:', '["Witte druiven", "Blauwe druiven", "Gedroogde druiven", "Gemengde druiven"]', 1, 'Correct: Blauwe druiven'),
  ('intro-wine', 'belangrijkste-wijncategorieen', 5, 'Welke categorie is vaak het lichtst?', '["Witte wijn", "Vintage Port", "Tawny", "Madeira"]', 0, 'Correct: Witte wijn'),
  ('productie-wine', 'van-druif-naar-wijn', 1, 'Wat gebeurt direct na de oogst?', '["Bottelen", "Persen", "Rijpen", "Verkopen"]', 1, 'Correct: Persen'),
  ('productie-wine', 'van-druif-naar-wijn', 2, 'Wat ontstaat na persen?', '["Most", "Alcohol", "Schuim", "Tannine"]', 0, 'Correct: Most'),
  ('productie-wine', 'van-druif-naar-wijn', 3, 'Wat maakt alcohol?', '["Hout", "Gist", "Glas", "Kurk"]', 1, 'Correct: Gist'),
  ('productie-wine', 'van-druif-naar-wijn', 4, 'Wat komt na fermentatie?', '["Rijping", "Oogst", "Persing", "Filtratie"]', 0, 'Correct: Rijping'),
  ('productie-wine', 'van-druif-naar-wijn', 5, 'Wat bepaalt kwaliteit sterk?', '["Productiekeuzes", "Etiket", "Fleskleur", "Gewicht"]', 0, 'Correct: Productiekeuzes'),
  ('productie-wine', 'alcoholische-gisting', 1, 'Wat zet gist om?', '["Zuur", "Suiker", "Hout", "Water"]', 1, 'Correct: Suiker'),
  ('productie-wine', 'alcoholische-gisting', 2, 'Wat ontstaat niet?', '["Alcohol", "CO2", "Warmte", "Tannine"]', 3, 'Correct: Tannine'),
  ('productie-wine', 'alcoholische-gisting', 3, 'Koele gisting geeft vaak:', '["Meer frisheid", "Meer tannine", "Meer kleur", "Minder aroma"]', 0, 'Correct: Meer frisheid'),
  ('productie-wine', 'alcoholische-gisting', 4, 'Warme gisting geeft vaak:', '["Meer structuur", "Minder alcohol", "Minder body", "Minder geur"]', 0, 'Correct: Meer structuur'),
  ('productie-wine', 'alcoholische-gisting', 5, 'Gisting stopt wanneer:', '["Suiker op is", "Glas leeg is", "Fles dicht is", "Kurk breekt"]', 0, 'Correct: Suiker op is'),
  ('productie-wine', 'houtlagering', 1, 'Welk hout wordt vaak gebruikt?', '["Eik", "Dennen", "Beuk", "Bamboe"]', 0, 'Correct: Eik'),
  ('productie-wine', 'houtlagering', 2, 'Welke smaak komt vaak van hout?', '["Vanille", "Citroen", "Banaan", "Gras"]', 0, 'Correct: Vanille'),
  ('productie-wine', 'houtlagering', 3, 'Nieuw hout geeft:', '["Minder smaak", "Meer smaak", "Geen smaak", "Minder zuur"]', 1, 'Correct: Meer smaak'),
  ('productie-wine', 'houtlagering', 4, 'Hout maakt tannines vaak:', '["Zachter", "Harder", "Bitterder", "Dunner"]', 0, 'Correct: Zachter'),
  ('productie-wine', 'oxidatie-vs-reductie', 1, 'Oxidatie betekent:', '["Minder zuurstof", "Meer zuurstof", "Meer suiker", "Minder alcohol"]', 1, 'Correct: Meer zuurstof'),
  ('productie-wine', 'oxidatie-vs-reductie', 2, 'Reductie bewaart:', '["Fruit", "Hout", "Bitterheid", "Zoetheid"]', 0, 'Correct: Fruit'),
  ('productie-wine', 'oxidatie-vs-reductie', 3, 'Oxidatie geeft vaak:', '["Notigheid", "Fris gras", "Citrus", "Mineraal"]', 0, 'Correct: Notigheid'),
  ('productie-wine', 'rijping-en-ontwikkeling', 1, 'Wat gebeurt met tannines?', '["Zachter", "Harder", "Bitterder", "Zouter"]', 0, 'Correct: Zachter'),
  ('productie-wine', 'rijping-en-ontwikkeling', 2, 'Wat gebeurt met fruit?', '["Verdwijnt volledig", "Wordt complexer", "Wordt zuurder", "Wordt bitter"]', 1, 'Correct: Wordt complexer'),
  ('productie-wine', 'rijping-en-ontwikkeling', 3, 'Welke aroma kan ontstaan?', '["Tabak", "Mintgum", "Cola", "Appelsap"]', 0, 'Correct: Tabak'),
  ('productie-wine', 'rijping-en-ontwikkeling', 4, 'Wat bepaalt bewaarpotentieel?', '["Balans", "Kleur", "Etiket", "Gewicht"]', 0, 'Correct: Balans'),
  ('proeven-wine', 'hoe-proef-je-wijn', 1, 'Wat is de eerste stap?', '["Ruiken", "Kijken", "Proeven", "Schrijven"]', 1, 'Correct: Kijken'),
  ('proeven-wine', 'hoe-proef-je-wijn', 2, 'Wat komt na ruiken?', '["Kijken", "Proeven", "Concluderen", "Bottelen"]', 1, 'Correct: Proeven'),
  ('proeven-wine', 'hoe-proef-je-wijn', 3, 'Wat analyseer je eerst?', '["Kleur", "Alcohol", "Prijs", "Leeftijd"]', 0, 'Correct: Kleur'),
  ('proeven-wine', 'hoe-proef-je-wijn', 4, 'Waarom proef je gestructureerd?', '["Om beter te analyseren", "Om sneller te drinken", "Om wijn warmer te maken", "Om etiketten te lezen"]', 0, 'Correct: Om beter te analyseren'),
  ('proeven-wine', 'hoe-proef-je-wijn', 5, 'Wat is de laatste stap?', '["Ruiken", "Concluderen", "Kijken", "Walsen"]', 1, 'Correct: Concluderen'),
  ('proeven-wine', 'kleur-analyseren', 1, 'Wat zegt kleur vaak?', '["Leeftijd", "Prijs", "Producent", "Flesgrootte"]', 0, 'Correct: Leeftijd'),
  ('proeven-wine', 'kleur-analyseren', 2, 'Oudere witte wijn wordt vaak:', '["Groener", "Goudkleuriger", "Paarser", "Blauwer"]', 1, 'Correct: Goudkleuriger'),
  ('proeven-wine', 'kleur-analyseren', 3, 'Jonge rode wijn is vaak:', '["Bruin", "Paarsrood", "Oranje", "Goud"]', 1, 'Correct: Paarsrood'),
  ('proeven-wine', 'kleur-analyseren', 4, 'Welke druif is vaak lichter?', '["Cabernet", "Pinot Noir", "Syrah", "Malbec"]', 1, 'Correct: Pinot Noir'),
  ('proeven-wine', 'aromas-herkennen', 1, 'Vanille komt meestal van:', '["Druif", "Hout", "Glas", "Fles"]', 1, 'Correct: Hout'),
  ('proeven-wine', 'aromas-herkennen', 2, 'Aroma-analyse helpt bij:', '["Herkennen", "Koelen", "Bewaren", "Schenken"]', 0, 'Correct: Herkennen'),
  ('proeven-wine', 'structuur-herkennen', 1, 'Wat geeft frisheid?', '["Alcohol", "Zuur", "Tannine", "Body"]', 1, 'Correct: Zuur'),
  ('proeven-wine', 'structuur-herkennen', 2, 'Wat geeft grip?', '["Tannine", "Zuur", "Fruit", "Hout"]', 0, 'Correct: Tannine'),
  ('proeven-wine', 'structuur-herkennen', 3, 'Wat geeft warmte?', '["Alcohol", "Zuur", "Body", "Suiker"]', 0, 'Correct: Alcohol'),
  ('proeven-wine', 'structuur-herkennen', 4, 'Wat is gewicht?', '["Body", "Zuur", "Tannine", "Kleur"]', 0, 'Correct: Body'),
  ('proeven-wine', 'structuur-herkennen', 5, 'Wat zegt lengte?', '["Afdronk", "Kurk", "Fles", "Etiket"]', 0, 'Correct: Afdronk'),
  ('proeven-wine', 'mini-toets-wijn', 1, 'Wat is de eerste stap bij wijnproeven?', '["Ruiken", "Kijken", "Proeven", "Schenken"]', 1, 'Correct: Kijken'),
  ('proeven-wine', 'mini-toets-wijn', 2, 'Wat geeft kleur vaak aan?', '["Leeftijd", "Alcoholpercentage", "Flesvorm", "Prijs"]', 0, 'Correct: Leeftijd'),
  ('proeven-wine', 'mini-toets-wijn', 3, 'Primair aroma komt van:', '["Druif", "Hout", "Rijping", "Glas"]', 0, 'Correct: Druif'),
  ('proeven-wine', 'mini-toets-wijn', 4, 'Wat geeft frisheid?', '["Zuur", "Alcohol", "Tannine", "Body"]', 0, 'Correct: Zuur'),
  ('proeven-wine', 'mini-toets-wijn', 5, 'Wat geeft grip?', '["Tannine", "Zuur", "Fruit", "Hout"]', 0, 'Correct: Tannine'),
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
  ('structuur-wine', 'body', 1, 'Body is:', '["Gewicht in mond", "Kleur", "Geur", "Fles"]', 0, 'Correct: Gewicht in mond'),
  ('structuur-wine', 'body', 2, 'Wat geeft vaak meer body?', '["Alcohol", "Water", "Zuur", "Glas"]', 0, 'Correct: Alcohol'),
  ('structuur-wine', 'body', 3, 'Wat is light-bodied?', '["Waterachtig", "Zwaar", "Tanninerijk", "Zoet"]', 0, 'Correct: Waterachtig'),
  ('structuur-wine', 'body', 4, 'Body helpt bij:', '["Blindproeven", "Koelen", "Schenken", "Rijping"]', 0, 'Correct: Blindproeven'),
  ('structuur-wine', 'balans', 1, 'Balans betekent:', '["Harmonie", "Zuur", "Zoet", "Bitter"]', 0, 'Correct: Harmonie'),
  ('structuur-wine', 'balans', 2, 'Wat bepaalt kwaliteit sterk?', '["Balans", "Fleskleur", "Etiket", "Leeftijd"]', 0, 'Correct: Balans'),
  ('structuur-wine', 'balans', 3, 'Wat mag niet domineren?', '["Eén element", "Fruit", "Zuur", "Body"]', 0, 'Correct: Eén element'),
  ('structuur-wine', 'balans', 4, 'Balans helpt bij:', '["Bewaarpotentieel", "Koelen", "Kurken", "Filteren"]', 0, 'Correct: Bewaarpotentieel'),
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
  ('klimaat-terroir-wine', 'koel-klimaat', 1, 'Koel klimaat geeft vaak:', '["Meer zuur", "Minder zuur", "Meer alcohol", "Meer tannine"]', 0, 'Correct: Meer zuur'),
  ('klimaat-terroir-wine', 'koel-klimaat', 2, 'Wat rijpt trager?', '["Druiven", "Glas", "Kurk", "Fles"]', 0, 'Correct: Druiven'),
  ('klimaat-terroir-wine', 'koel-klimaat', 3, 'Welke regio is koel?', '["Mosel", "Barossa", "Priorat", "Napa"]', 0, 'Correct: Mosel'),
  ('klimaat-terroir-wine', 'koel-klimaat', 4, 'Welke aroma’s passen?', '["Citrus", "Jam", "Chocolade", "Vijgen"]', 0, 'Correct: Citrus'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 1, 'Gematigd klimaat geeft vaak:', '["Balans", "Extreem zuur", "Extreem alcohol", "Geen rijping"]', 0, 'Correct: Balans'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 2, 'Welke regio is gematigd?', '["Bordeaux", "Mosel", "Mendoza", "Barossa"]', 0, 'Correct: Bordeaux'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 3, 'Wat blijft behouden?', '["Zuur", "Geen structuur", "Geen fruit", "Geen alcohol"]', 0, 'Correct: Zuur'),
  ('klimaat-terroir-wine', 'gematigd-klimaat', 4, 'Wat ontstaat goed?', '["Rijpheid", "Oxidatie", "Carbonisatie", "Fortificatie"]', 0, 'Correct: Rijpheid'),
  ('klimaat-terroir-wine', 'warm-klimaat', 1, 'Warm klimaat geeft vaak:', '["Meer alcohol", "Minder alcohol", "Meer zuur", "Minder body"]', 0, 'Correct: Meer alcohol'),
  ('klimaat-terroir-wine', 'warm-klimaat', 2, 'Wat stijgt?', '["Suiker", "Zuur", "Water", "Kleur"]', 0, 'Correct: Suiker'),
  ('klimaat-terroir-wine', 'warm-klimaat', 3, 'Wat daalt?', '["Zuur", "Alcohol", "Body", "Fruit"]', 0, 'Correct: Zuur'),
  ('klimaat-terroir-wine', 'warm-klimaat', 4, 'Welke regio is warm?', '["Barossa", "Mosel", "Chablis", "Champagne"]', 0, 'Correct: Barossa'),
  ('klimaat-terroir-wine', 'bodemtypes', 1, 'Welke bodem geeft vaak finesse?', '["Kalk", "Klei", "Zand", "Graniet"]', 0, 'Correct: Kalk'),
  ('klimaat-terroir-wine', 'bodemtypes', 2, 'Welke geeft body?', '["Klei", "Kalk", "Zand", "Schalie"]', 0, 'Correct: Klei'),
  ('klimaat-terroir-wine', 'bodemtypes', 3, 'Welke geeft zachtheid?', '["Zand", "Kalk", "Leisteen", "Basalt"]', 0, 'Correct: Zand'),
  ('klimaat-terroir-wine', 'bodemtypes', 4, 'Leisteen geeft vaak:', '["Concentratie", "Minder smaak", "Minder structuur", "Minder zuur"]', 0, 'Correct: Concentratie'),
  ('klimaat-terroir-wine', 'bodemtypes', 5, 'Bodem werkt samen met:', '["Klimaat", "Glas", "Kurk", "Fles"]', 0, 'Correct: Klimaat'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 1, 'Terroir bestaat uit:', '["Alleen bodem", "Alleen klimaat", "Meerdere factoren", "Alleen druif"]', 2, 'Correct: Meerdere factoren'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 2, 'Wat bepaalt terroir sterk?', '["Ligging", "Etiket", "Glas", "Kurk"]', 0, 'Correct: Ligging'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 3, 'Waarom smaakt dezelfde druif anders?', '["Terroir", "Fleskleur", "Leeftijd", "Glasvorm"]', 0, 'Correct: Terroir'),
  ('klimaat-terroir-wine', 'terroir-uitgelegd', 4, 'Wat is terroir vaak?', '["Identiteit", "Marketing", "Flesdesign", "Prijs"]', 0, 'Correct: Identiteit'),
  ('service-wine', 'serveertemperatuur', 1, 'Te koud betekent vaak:', '["Meer aroma", "Minder aroma", "Meer alcohol", "Meer body"]', 1, 'Correct: Minder aroma'),
  ('service-wine', 'serveertemperatuur', 2, 'Vol rood serveer je rond:', '["6–8°C", "10–12°C", "16–18°C", "22–24°C"]', 2, 'Correct: 16–18°C'),
  ('service-wine', 'serveertemperatuur', 3, 'Fris wit serveer je rond:', '["8–10°C", "16–18°C", "20°C", "5°C"]', 0, 'Correct: 8–10°C'),
  ('service-wine', 'serveertemperatuur', 4, 'Te warm vergroot:', '["Alcoholgevoel", "Zuur", "Tannine", "Suiker"]', 0, 'Correct: Alcoholgevoel'),
  ('service-wine', 'glaswerk', 1, 'Wat beïnvloedt glas sterk?', '["Geur", "Alcoholpercentage", "Leeftijd", "Kleur"]', 0, 'Correct: Geur'),
  ('service-wine', 'glaswerk', 2, 'Grote glazen geven vaak:', '["Meer zuurstof", "Minder geur", "Minder body", "Minder kleur"]', 0, 'Correct: Meer zuurstof'),
  ('service-wine', 'glaswerk', 3, 'Smalle glazen geven vaak:', '["Meer focus", "Minder aroma", "Meer alcohol", "Minder structuur"]', 0, 'Correct: Meer focus'),
  ('service-wine', 'decanteren', 1, 'Doel van decanteren?', '["Koelen", "Zuurstof geven", "Zoeter maken", "Filteren"]', 1, 'Correct: Zuurstof geven'),
  ('service-wine', 'decanteren', 2, 'Oude wijn decanteer je vaak voor:', '["Sediment", "Meer kleur", "Meer suiker", "Meer zuur"]', 0, 'Correct: Sediment'),
  ('service-wine', 'decanteren', 3, 'Jonge wijn profiteert vaak van:', '["Lucht", "Koeling", "Schudden", "Filtratie"]', 0, 'Correct: Lucht'),
  ('service-wine', 'decanteren', 4, 'Te veel zuurstof kan:', '["Schaden", "Helpen", "Koelen", "Zoeten"]', 0, 'Correct: Schaden'),
  ('service-wine', 'bewaren-kelderen', 1, 'Ideale opslagtemperatuur?', '["5°C", "12°C", "20°C", "25°C"]', 1, 'Correct: 12°C'),
  ('service-wine', 'bewaren-kelderen', 2, 'Wat is schadelijk?', '["Licht", "Donker", "Stilte", "Vocht"]', 0, 'Correct: Licht'),
  ('service-wine', 'bewaren-kelderen', 3, 'Waarom liggend bewaren?', '["Kurk vochtig houden", "Meer aroma", "Meer kleur", "Meer alcohol"]', 0, 'Correct: Kurk vochtig houden'),
  ('service-wine', 'bewaren-kelderen', 4, 'Warmte doet wat?', '["Versnelt veroudering", "Vertraagt veroudering", "Verbetert altijd kwaliteit", "Niets"]', 0, 'Correct: Versnelt veroudering'),
  ('pairing-wine', 'wijn-en-kaas', 1, 'Wat verzacht tannine?', '["Zout", "Suiker", "Zuur", "Bitter"]', 0, 'Correct: Zout'),
  ('pairing-wine', 'wijn-en-kaas', 2, 'Blauwe kaas werkt vaak goed met:', '["Zoete wijn", "Droge rosé", "Bier", "Water"]', 0, 'Correct: Zoete wijn'),
  ('pairing-wine', 'wijn-en-kaas', 3, 'Vet maakt wijn vaak:', '["Zachter", "Harder", "Bitterder", "Zuurder"]', 0, 'Correct: Zachter'),
  ('pairing-wine', 'wijn-en-kaas', 4, 'Stilton combineert klassiek met:', '["Port", "Champagne", "Sauvignon Blanc", "Prosecco"]', 0, 'Correct: Port'),
  ('pairing-wine', 'wijn-en-kaas', 5, 'Belangrijkste principe?', '["Balans", "Prijs", "Leeftijd", "Etiket"]', 0, 'Correct: Balans'),
  ('pairing-wine', 'wijn-en-vis', 1, 'Vis vraagt vaak:', '["Hoge tannines", "Frisheid", "Bitterheid", "Warmte"]', 1, 'Correct: Frisheid'),
  ('pairing-wine', 'wijn-en-vis', 2, 'Wat snijdt door vet?', '["Zuur", "Suiker", "Alcohol", "Tannine"]', 0, 'Correct: Zuur'),
  ('pairing-wine', 'wijn-en-vis', 3, 'Wat bepaalt pairing sterk?', '["Saus", "Bordkleur", "Glas", "Temperatuur"]', 0, 'Correct: Saus'),
  ('pairing-wine', 'wijn-en-vis', 4, 'Zalm kan meer:', '["Body aan", "Minder zuur aan", "Minder smaak aan", "Geen wijn aan"]', 0, 'Correct: Body aan'),
  ('pairing-wine', 'wijn-en-vlees', 1, 'Wat verzacht tannine?', '["Eiwit", "Suiker", "Zuur", "Water"]', 0, 'Correct: Eiwit'),
  ('pairing-wine', 'wijn-en-vlees', 2, 'Rood vlees vraagt vaak:', '["Structuur", "Minder smaak", "Minder wijn", "Minder zuur"]', 0, 'Correct: Structuur'),
  ('pairing-wine', 'wijn-en-vlees', 3, 'Steak combineert klassiek met:', '["Cabernet Sauvignon", "Riesling", "Prosecco", "Moscato"]', 0, 'Correct: Cabernet Sauvignon'),
  ('pairing-wine', 'wijn-en-vlees', 4, 'Wat blijft belangrijk?', '["Saus", "Bord", "Licht", "Muziek"]', 0, 'Correct: Saus'),
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
  ('examen-wine', 'wijn-eindexamen', 12, 'Ideale bewaartemperatuur?', '["12°C", "25°C", "18°C", "5°C"]', 0, 'Correct: 12°C'),
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
