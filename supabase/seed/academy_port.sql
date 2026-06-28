-- Port track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les

delete from academy.tracks where slug = 'port';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'port',
  'Port',
  'Leer Port van Fundament tot Master: productie, proeven, regio''s, stijlen, service en examen.',
  1,
  now()
);

with t as (select id from academy.tracks where slug = 'port')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-port', 'Fundament', 1),
  ('explorer', 'productie-port', 'Productie', 2),
  ('explorer', 'proeven-port', 'Proeven', 3),
  ('explorer', 'oorsprong-port', 'Regio''s van Port', 4),
  ('explorer', 'portstijlen', 'Portstijlen', 5),
  ('specialist', 'portstijlen-verdiept', 'Portstijlen verdiept', 6),
  ('specialist', 'port-premium', 'Colheita & Garrafeira', 7),
  ('master', 'praktijk-port', 'Service, Pairing & Praktijk', 8),
  ('master', 'examen-port', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-port (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'intro-port'
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
    'wat-is-port',
    'Wat is Port?',
    'Na deze les kun jij uitleggen wat Port is, waar het vandaan komt en waarom het anders is dan gewone wijn.
',
    'Port is een versterkte wijn uit Portugal, afkomstig uit de Douro-vallei in het noorden van het land.

Wat Port bijzonder maakt, is dat tijdens de gisting alcohol wordt toegevoegd. Daardoor stopt de gisting vroegtijdig en blijven natuurlijke suikers behouden.

Dit zorgt voor:

- meer alcohol
- meer zoetheid
- meer concentratie

Port bevat meestal tussen de 19% en 22% alcohol.

Je kunt Port drinken als aperitief, bij kaas, desserts of als afsluiting van een diner.

Port is dus veel veelzijdiger dan veel mensen denken.
',
    '- Port
- Douro
- versterkte wijn
- alcohol
- zoetheid
',
    'De Douro is één van de oudste officieel beschermde wijngebieden ter wereld.
',
    '- Port komt uit Portugal
- Port is een versterkte wijn
- Port bevat meer alcohol
- Port is vaak zoeter
- Port kent meerdere stijlen
',
    '### Opdracht

Zoek een fles Port of bekijk online een etiket.

### Checklist

- Ik heb een fles Port bekeken
- Ik heb het alcoholpercentage gevonden
- Ik heb de herkomst gevonden
- Ik heb de stijl gevonden

### Reflectievraag

Welke stijl heb je gevonden?
',
    8,
    1
  ),
  (
    'fortificatie',
    'Fortificatie',
    'Na deze les kun jij uitleggen wat fortificatie is en waarom dit essentieel is voor Port.
',
    'Fortificatie betekent dat er alcohol wordt toegevoegd tijdens de gisting.

Normaal zetten gisten suiker om in alcohol.

Bij Port stopt de wijnmaker dit proces bewust eerder.

Daardoor:

- blijft restsuiker behouden
- stijgt het alcoholpercentage
- ontstaat de typische Portstijl

Hoe eerder fortificatie plaatsvindt, hoe zoeter de uiteindelijke Port.
',
    '- fortificatie
- aguardente
- gisting
- restsuiker
- alcohol
',
    'De gebruikte alcohol heet aguardente vínica.
',
    '- Fortificatie stopt de gisting
- Suikers blijven behouden
- Alcohol stijgt
- Port krijgt zijn unieke stijl
',
    '### Opdracht

Vergelijk een gewone rode wijn met Port.

### Checklist

- Ik heb het alcoholpercentage vergeleken
- Ik heb de zoetheid vergeleken
- Ik heb het mondgevoel vergeleken

### Reflectievraag

Wat viel jou het meeste op?
',
    8,
    2
  ),
  (
    'waarom-is-port-uniek',
    'Waarom is Port uniek?',
    'Na deze les kun jij uitleggen waarom Port uniek is.
',
    'Port is uniek door fortificatie, beschermde herkomst en veelzijdigheid.

Port komt altijd uit de Douro-regio.

Daarnaast heeft Port veel verschillende stijlen en kan sommige Port tientallen jaren rijpen.

Port combineert ook uitstekend met eten zoals kaas, chocolade en desserts.

Dat maakt Port veel breder inzetbaar dan veel mensen denken.
',
    '- uniek
- Vintage
- rijping
- herkomst
- veelzijdigheid
',
    'Vintage Port wordt alleen gemaakt in topjaren.
',
    '- Port is uniek door fortificatie
- Port heeft beschermde herkomst
- Port kent veel stijlen
- Port heeft bewaarpotentieel
',
    '### Opdracht

Bedenk drie momenten waarop jij Port zou serveren.

### Checklist

- Ik heb drie situaties bedacht
- Ik heb over de stijl nagedacht
- Ik heb een logische keuze gemaakt

### Reflectievraag

Bij welk moment zou jij Port het liefst drinken?
',
    8,
    3
  ),
  (
    'geschiedenis-van-port',
    'Geschiedenis van Port',
    'Na deze les begrijp jij hoe Port is ontstaan.
',
    'Port ontstond in de 17e eeuw.

Engelse handelaren zochten toen alternatieven voor Franse wijn.

Portugal werd daardoor belangrijk.

Tijdens transport bleek dat alcohol toevoegen de wijn beter houdbaar maakte.

Later werd dit het vaste productieproces.

In 1756 werd de Douro officieel beschermd.

Veel bekende Port-huizen dragen nog steeds Engelse namen.
',
    '- geschiedenis
- Engeland
- Douro
- handel
- bescherming
',
    'Taylor’s en Graham’s zijn bekende Engelse Port-huizen.
',
    '- Port ontstond in de 17e eeuw
- Engeland speelde een grote rol
- Alcohol hielp bij transport
- Douro werd beschermd
',
    '### Opdracht

Zoek drie bekende Portproducenten.

### Checklist

- Ik heb drie producenten gevonden
- Ik heb hun oorsprong bekeken
- Ik herken minstens één naam

### Reflectievraag

Welke producent kende jij al?
',
    8,
    4
  ),
  (
    'portcategorieen',
    'Portcategorieën uitgelegd',
    'Na deze les herken jij de belangrijkste Portcategorieën.
',
    'Port bestaat uit meerdere stijlen.

Ruby is jong en fruitig.

Tawny rijpt langer op hout en krijgt notige smaken.

White Port wordt gemaakt van witte druiven.

Vintage Port is de meest prestigieuze stijl.

Deze stijlen vormen de basis voor alles wat je later gaat leren.
',
    '- Ruby
- Tawny
- White
- Vintage
- stijl

# PORT_MODULE_02.md

# Way of Tasting Academy',
    'Vintage Port rijpt vaak nog jarenlang verder op fles.
',
    '- Ruby is fruitig
- Tawny is oxidatief
- White is van witte druiven
- Vintage is prestigieus
',
    '### Opdracht

Schrijf bij elke Portstijl één smaakkenmerk.

### Checklist

- Ik heb Ruby beschreven
- Ik heb Tawny beschreven
- Ik heb White beschreven
- Ik heb Vintage beschreven

### Reflectievraag

Welke stijl spreekt jou het meeste aan?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-port (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'productie-port'
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
    'druiven-van-port',
    'Druiven van Port',
    'Na deze les herken jij de belangrijkste druivenrassen voor Port.
',
    'Port wordt bijna altijd gemaakt van meerdere druivenrassen.

Dat noemen we een blend.

De belangrijkste druiven zijn:

- Touriga Nacional
- Touriga Franca
- Tinta Roriz
- Tinta Barroca
- Tinto Cão

Elke druif heeft zijn eigen rol.

Touriga Nacional geeft kracht, structuur en aroma.

Touriga Franca zorgt vaak voor elegantie.

Tinta Roriz geeft kleur en body.

Door druiven te combineren ontstaat balans.

Dat is essentieel voor Port.
',
    '- blend
- Touriga Nacional
- Touriga Franca
- Tinta Roriz
- balans
',
    'In de Douro staan meer dan 80 toegestane druivenrassen.
',
    '- Port is meestal een blend
- Touriga Nacional is de belangrijkste druif
- Elke druif heeft zijn eigen functie
- Blenden zorgt voor balans
',
    '### Opdracht

Zoek op welke druiven in jouw Portfles zitten.

### Checklist

- Ik heb een etiket bekeken
- Ik heb minstens één druif gevonden
- Ik heb de naam genoteerd

### Reflectievraag

Welke druif kwam jij tegen?
',
    8,
    1
  ),
  (
    'douro-vallei',
    'De Douro-vallei',
    'Na deze les begrijp jij waarom de Douro zo belangrijk is voor Port.
',
    'De Douro-vallei ligt in Noord-Portugal.

Het is het enige gebied waar echte Port gemaakt mag worden.

De regio heeft steile hellingen, arme bodems en extreme omstandigheden.

Dit zorgt voor lage opbrengsten maar hoge concentratie.

De Douro is verdeeld in drie zones:

- Baixo Corgo
- Cima Corgo
- Douro Superior

Cima Corgo is het belangrijkste gebied voor top-Port.
',
    '- Douro
- Cima Corgo
- terroir
- terrassen
- concentratie
',
    'Veel wijngaarden in de Douro zijn op terrassen aangelegd.
',
    '- Port komt altijd uit Douro
- Douro heeft extreme omstandigheden
- Lage opbrengst geeft concentratie
- Cima Corgo is topgebied
',
    '### Opdracht

Zoek de drie Douro-zones op.

### Checklist

- Ik heb alle drie gevonden
- Ik heb hun namen genoteerd
- Ik weet welke zone topkwaliteit geeft

### Reflectievraag

Welke zone lijkt jou het meest interessant?
',
    8,
    2
  ),
  (
    'klimaat-en-terroir',
    'Klimaat en terroir',
    'Na deze les begrijp jij hoe klimaat en terroir Port beïnvloeden.
',
    'De Douro heeft hete zomers en koude winters.

Dat zorgt voor veel stress op de druiven.

De bodems bestaan vooral uit leisteen.

Leisteen houdt warmte vast en laat wortels diep groeien.

Hierdoor krijgen druiven:

- concentratie
- structuur
- kracht

Dit noemen we terroir.

Terroir bepaalt een groot deel van de stijl van Port.
',
    '- terroir
- leisteen
- klimaat
- concentratie
- stress
',
    'Leisteen kan wortels meters diep laten groeien.
',
    '- Douro is heet en droog
- Leisteen is belangrijk
- Terroir beïnvloedt smaak
- Stress geeft concentratie
',
    '### Opdracht

Zoek op wat leisteen is.

### Checklist

- Ik heb opgezocht wat leisteen is
- Ik begrijp waarom het belangrijk is
- Ik kan het uitleggen

### Reflectievraag

Waarom denk jij dat leisteen zo belangrijk is?
',
    8,
    3
  ),
  (
    'houtlagering',
    'Houtlagering',
    'Na deze les begrijp jij wat houtlagering doet.
',
    'Veel Port rijpt op houten vaten.

Tijdens deze rijping komt zuurstof langzaam in contact met de wijn.

Dat zorgt voor:

- zachtere tannines
- meer complexiteit
- notige aroma’s

Hoe langer de rijping, hoe groter het effect.

Tawny Port is het bekendste voorbeeld.

Ruby rijpt meestal korter en behoudt meer fruit.
',
    '- houtlagering
- tannine
- zuurstof
- complexiteit
- rijping
',
    'Grote en kleine vaten geven verschillende rijping.
',
    '- Houtlagering verandert Port
- Zuurstof speelt een rol
- Tawny rijpt langer
- Ruby blijft fruitiger
',
    '### Opdracht

Vergelijk Ruby en Tawny beschrijvingen.

### Checklist

- Ik heb beide stijlen bekeken
- Ik heb verschillen genoteerd
- Ik begrijp het effect van hout

### Reflectievraag

Welke stijl lijkt jou interessanter?
',
    8,
    4
  ),
  (
    'oxidatie-uitgelegd',
    'Oxidatie uitgelegd',
    'Na deze les begrijp jij wat oxidatie betekent in Port.
',
    'Oxidatie betekent contact met zuurstof.

Bij sommige Portstijlen is dit gewenst.

Door oxidatie verandert:

- kleur
- geur
- smaak

De wijn wordt vaak lichter van kleur en krijgt tonen van noten, karamel en gedroogd fruit.

Tawny is het beste voorbeeld van oxidatieve rijping.

Ruby rijpt juist meer reductief.

Oxidatie is dus geen fout, maar een stijlkeuze.
',
    '- oxidatie
- zuurstof
- Tawny
- aroma
- rijping

# PORT_MODULE_03.md

# Way of Tasting Academy',
    'Oxidatie speelt een grote rol in oudere Tawny Ports.
',
    '- Oxidatie is contact met zuurstof
- Het verandert kleur en smaak
- Tawny is oxidatief
- Ruby minder
',
    '### Opdracht

Vergelijk een jonge Ruby en een oudere Tawny.

### Checklist

- Ik heb beide stijlen bekeken
- Ik heb kleurverschillen gezien
- Ik heb smaakverschillen genoteerd

### Reflectievraag

Welke verschillen vielen jou het meest op?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-port (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'proeven-port'
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
    'proefnotitie-port',
    'Proefnotitie Port',
    'Na deze les kun jij een eenvoudige proefnotitie van Port maken en systematisch analyseren wat je ziet, ruikt en proeft.
',
    'Een proefnotitie is de basis van professioneel proeven.

Door een wijn of Port op een vaste manier te analyseren, train je jouw smaakgeheugen en leer je stijlen sneller herkennen.

Bij Port werken we altijd in vier vaste stappen:

### 1. Kijken

Je begint altijd met kijken.

Let op:

- kleur
- helderheid
- viscositeit

Kleur vertelt veel.

Ruby Port is meestal diep robijnrood.

Tawny Port is lichter en meer amberkleurig.

White Port varieert van bleekgeel tot goudkleurig.

Viscositeit, de “tranen” in het glas, geeft vaak een indicatie van suiker en alcohol.

Bij Port zie je vaak dikkere tranen dan bij gewone wijn.

---

### 2. Ruiken

Ruiken vertelt vaak meer dan proeven.

Zoek naar aroma’s.

Bij jonge Ruby Port vind je vaak:

- kersen
- bramen
- pruimen

Bij Tawny vind je vaker:

- walnoten
- karamel
- vijgen
- gedroogd fruit

White Port laat vaak aroma’s zien zoals:

- citrus
- honing
- amandel

Probeer meerdere keren te ruiken.

Aroma’s veranderen vaak in het glas.

---

### 3. Proeven

In de mond analyseer je structuur.

Let op:

- zoetheid
- zuur
- alcohol
- tannines
- body

Port is bijna altijd zoet.

Maar kwaliteit zit in balans.

Goede Port heeft genoeg frisheid om de zoetheid in evenwicht te houden.

Alcohol moet voelbaar zijn, maar niet branderig.

---

### 4. Conclusie

Nu combineer je alles.

Vraag jezelf:

- Is deze Port jong of oud?
- Fruitig of oxidatief?
- Licht of krachtig?
- Welke stijl is dit?

Dat is de basis van blindproeven.

Hoe vaker je dit doet, hoe sneller je patronen herkent.
',
    '- proefnotitie
- aroma
- viscositeit
- structuur
- balans
',
    'Professionele sommeliers gebruiken vaak exact dezelfde proefstructuur voor Port, wijn, Madeira en Sherry.
',
    '- Proeven gebeurt altijd in vaste stappen
- Kijken geeft eerste informatie
- Ruiken onthult stijl en rijping
- Structuur bepaalt kwaliteit
- Conclusie verbindt alles samen
',
    '### Opdracht

Neem een glas Port en maak jouw eerste volledige proefnotitie.

Gebruik de vier stappen:

- kijken
- ruiken
- proeven
- concluderen

### Checklist

- Ik heb de kleur beoordeeld
- Ik heb minimaal drie aroma’s benoemd
- Ik heb de structuur geanalyseerd
- Ik heb de stijl geprobeerd te bepalen

### Reflectievraag

Wat vond jij het moeilijkst: kleur herkennen, aroma’s benoemen of structuur analyseren?
',
    8,
    1
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij de structuur van Port analyseren en de belangrijkste bouwstenen herkennen.
',
    'Structuur is het skelet van Port.

Waar aroma’s vertellen wat je ruikt, vertelt structuur hoe de wijn aanvoelt.

Bij Port kijken we naar vijf bouwstenen:

- zoetheid
- zuur
- alcohol
- tannines
- body

Samen bepalen deze de kwaliteit.

---

### Zoetheid

Port bevat altijd restsuiker.

Dat komt door fortificatie.

Zoetheid geeft:

- volume
- rondheid
- zachtheid

Maar teveel zoetheid zonder frisheid maakt Port zwaar.

---

### Zuur

Zuur is cruciaal.

Zuur zorgt voor:

- spanning
- frisheid
- lengte

Bij grote Ports voorkomt zuur dat de wijn log wordt.

Zelfs oude Tawny heeft vaak verrassend veel frisheid.

---

### Alcohol

Port bevat meestal tussen de 19% en 22%.

Alcohol geeft:

- warmte
- kracht
- lengte

Goede Port heeft geïntegreerde alcohol.

Slechte integratie voelt branderig.

---

### Tannines

Tannines geven grip.

Je voelt ze vooral op je tandvlees.

Ruby en Vintage hebben vaak meer tannines.

Tawny heeft meestal zachtere tannines door rijping.

---

### Body

Body is het gewicht van de wijn in je mond.

Niet te verwarren met alcohol.

Body kan zijn:

- licht
- medium
- vol

Port is meestal medium+ tot vol.

---

### Balans

Balans is de sleutel.

Een grote Port voelt compleet.

Geen enkel onderdeel overheerst.

Zoetheid, zuur, alcohol en body werken samen.

Dat bepaalt kwaliteit.
',
    '- structuur
- zoetheid
- zuur
- alcohol
- tannine
',
    'Veel beginners denken dat zoetheid de belangrijkste factor is, terwijl zuur vaak de echte kwaliteitsdrager is.
',
    '- Structuur is het skelet van Port
- Vijf bouwstenen bepalen stijl
- Balans bepaalt kwaliteit
- Body is niet hetzelfde als alcohol
- Zuur is essentieel voor frisheid
',
    '### Opdracht

Proef twee verschillende Ports en analyseer de structuur.

Beantwoord:

- Welke is zoeter?
- Welke heeft meer zuur?
- Welke heeft meer body?
- Welke voelt meer in balans?

### Checklist

- Ik heb zoetheid beoordeeld
- Ik heb zuur beoordeeld
- Ik heb alcohol beoordeeld
- Ik heb body beoordeeld
- Ik heb balans vergeleken

### Reflectievraag

Welke structuurcomponent viel jou het meeste op?
',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les kun jij de belangrijkste aroma’s in Port herkennen en beter plaatsen binnen verschillende Portstijlen.
',
    'Aroma’s zijn de geurcomponenten van Port.

Ze geven veel informatie over:

- druivenras
- rijping
- leeftijd
- stijl

Goed ruiken is één van de krachtigste tools van een sommelier.

Bij Port verdelen we aroma’s vaak in drie categorieën:

---

### Primaire aroma’s

Deze komen direct van de druif.

Voorbeelden:

- kers
- braam
- pruim
- blauwe bes
- framboos

Deze aroma’s vind je vooral in jonge Ports zoals Ruby.

Hoe jonger de Port, hoe duidelijker deze fruitaroma’s vaak zijn.

---

### Secundaire aroma’s

Deze ontstaan tijdens de productie.

Voorbeelden:

- gist
- kruiden
- cacao
- specerijen

Deze aroma’s zijn subtieler.

Ze worden gevormd tijdens fermentatie en vinificatie.

---

### Tertiaire aroma’s

Deze ontstaan door rijping.

Voorbeelden:

- walnoot
- karamel
- toffee
- vijg
- koffie
- gedroogd fruit

Deze vind je vooral in oudere Tawny’s.

Hoe langer de rijping, hoe complexer deze aroma’s vaak worden.

---

### Aroma’s per stijl

Ruby Port:

- rood fruit
- zwart fruit
- chocolade

Tawny Port:

- noten
- karamel
- gedroogde vijgen

White Port:

- citrus
- honing
- amandel

Vintage Port:

- donker fruit
- kruiden
- krachtige concentratie

Door deze patronen te herkennen kun je stijlen sneller blind herkennen.
',
    '- aroma
- primair
- secundair
- tertiair
- blindproeven
',
    'Je neus kan duizenden verschillende aroma’s onderscheiden, veel meer dan je tong smaken kan herkennen.
',
    '- Aroma’s vertellen veel over stijl
- Primaire aroma’s komen van de druif
- Secundaire aroma’s ontstaan tijdens productie
- Tertiaire aroma’s ontstaan door rijping
- Aroma-training versnelt blindproeven
',
    '### Opdracht

Ruik aan één Port en noteer minimaal vijf aroma’s.

Verdeel ze in:

- fruit
- kruiden
- rijping

### Checklist

- Ik heb minimaal vijf aroma’s gevonden
- Ik heb fruitaroma’s benoemd
- Ik heb rijpingsaroma’s benoemd
- Ik heb de stijl proberen te koppelen

### Reflectievraag

Welke aroma’s herken jij het snelst?
',
    8,
    3
  ),
  (
    'ruby-vs-tawny-blind',
    'Ruby vs Tawny blind herkennen',
    'Na deze les kun jij Ruby en Tawny Port blind van elkaar onderscheiden op basis van kleur, geur, smaak en structuur.
',
    'Blindproeven is één van de krachtigste manieren om echt te leren proeven.

Zonder etiket ben je volledig afhankelijk van je zintuigen.

Bij Port is Ruby versus Tawny één van de belangrijkste eerste onderscheidingen.

Deze twee stijlen verschillen fundamenteel.

Niet alleen in leeftijd, maar vooral in rijpingsstijl.

---

### Kleur herkennen

Kleur is vaak de eerste aanwijzing.

Ruby Port:

- diep rood
- robijn
- paarsachtige rand

Tawny Port:

- amber
- oranjebruin
- lichtere kern

Door oxidatie verliest Tawny kleur.

Ruby behoudt juist kleur door beperkte zuurstof.

---

### Geur herkennen

Ruby ruikt meestal:

- vers fruit
- kersen
- braam
- pruim

Tawny ruikt vaker:

- walnoten
- karamel
- vijgen
- toffee
- gedroogd fruit

Hier zit vaak het grootste verschil.

Fruit versus oxidatie.

---

### Structuur herkennen

Ruby:

- krachtiger
- meer fruitgedreven
- steviger tannines

Tawny:

- zachter
- ronder
- geïntegreerder

Tawny voelt vaak rustiger en meer ontwikkeld.

Ruby voelt energieker en directer.

---

### Afdronk herkennen

Ruby:

- korter
- fruitiger

Tawny:

- langer
- complexer
- notiger

De afdronk is vaak de bevestiging van je conclusie.

---

### Blind analyseren

Vraag jezelf:

- Welke kleur zie ik?
- Is het fruit of oxidatie?
- Hoe voelt de structuur?
- Hoe lang blijft de smaak hangen?

Zo bouw je zekerheid op.
',
    '- blindproeven
- Ruby
- Tawny
- oxidatie
- afdronk
',
    'Bij veel sommelierexamens is Ruby vs Tawny één van de eerste blindproefvragen.
',
    '- Ruby en Tawny verschillen fundamenteel
- Kleur is eerste aanwijzing
- Fruit wijst vaak op Ruby
- Noten wijzen vaak op Tawny
- Blindproeven versnelt herkenning
',
    '### Opdracht

Vergelijk blind twee verschillende Ports.

Gebruik:

- kleur
- geur
- structuur
- afdronk

Probeer de stijl te benoemen.

### Checklist

- Ik heb de kleur vergeleken
- Ik heb aroma’s vergeleken
- Ik heb structuur geanalyseerd
- Ik heb de stijl benoemd

### Reflectievraag

Wat gaf jou de doorslag: kleur, geur of structuur?
',
    8,
    4
  ),
  (
    'mini-toets-port-proeven',
    'Mini-toets Port Proeven',
    'Na deze les kun jij jouw kennis uit Module 3 toepassen en testen op proeftechniek, structuur, aroma’s en stijlherkenning.
',
    'In deze les komt alles samen.

Je hebt geleerd:

- hoe je Port systematisch proeft
- hoe structuur werkt
- hoe aroma’s ontstaan
- hoe je Ruby en Tawny blind kunt onderscheiden

Nu is het tijd om alles te combineren.

Dit is geen nieuwe theorie.

Dit is een praktische toets.

De kracht van proeven zit in herhaling.

Hoe vaker je proeft, hoe sneller je patronen herkent.

Professionals vertrouwen niet op geluk.

Ze vertrouwen op structuur.

Bij deze mini-toets gebruik je alles wat je geleerd hebt:

### Stap 1 — Kijk

Analyseer:

- kleur
- intensiteit
- viscositeit

---

### Stap 2 — Ruik

Zoek:

- fruit
- kruiden
- oxidatie
- rijping

---

### Stap 3 — Proef

Analyseer:

- zoetheid
- zuur
- alcohol
- tannines
- body

---

### Stap 4 — Concludeer

Vraag jezelf:

- Welke stijl is dit?
- Jong of oud?
- Ruby of Tawny?
- Waarom?

Dat is de kern van professioneel proeven.
',
    '- proefnotitie
- blindproeven
- structuur
- aroma
- analyse

# PORT_016.md',
    'Veel sommeliers bewaren hun proefnotities jarenlang om hun ontwikkeling terug te zien.
',
    '- Theorie en praktijk komen samen
- Structuur geeft houvast
- Herhaling versnelt leren
- Objectiviteit groeit door notities
- Blindproeven bouwt expertise
',
    '### Opdracht

Maak een volledige proefnotitie van één Port.

Gebruik:

- kijken
- ruiken
- proeven
- concluderen

Bepaal:

- stijl
- leeftijdsindruk
- belangrijkste aroma’s
- structuur

### Checklist

- Ik heb de kleur geanalyseerd
- Ik heb minimaal vijf aroma’s benoemd
- Ik heb structuur beoordeeld
- Ik heb een stijl gekozen
- Ik heb mijn conclusie onderbouwd

### Reflectievraag

Welke onderdelen van proeven gaan al goed en waar wil jij nog verder in groeien?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- oorsprong-port (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'oorsprong-port'
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
    'waar-komt-port-vandaan',
    'Waar komt Port vandaan?',
    'Na deze les kun jij uitleggen waar Port vandaan komt, waarom alleen Port uit die regio officieel Port mag heten en waarom die herkomst zo belangrijk is.
',
    'Port komt uit Portugal.

Meer specifiek uit de Douro-vallei, in het noorden van Portugal.

Port is geen algemene wijnstijl.

Port is een beschermde herkomst.

Dat betekent dat alleen versterkte wijn uit de Douro officieel Port genoemd mag worden.

Net zoals Champagne alleen uit Champagne mag komen.

De Douro heeft unieke omstandigheden:

- extreme hitte
- steile hellingen
- arme leisteenbodems
- lage opbrengsten

Dit zorgt voor krachtige druiven met veel concentratie.

Historisch werd Port via Porto vervoerd.

Daar komt de naam Port vandaan.

In 1756 werd de Douro officieel afgebakend.

Dat maakte het één van de eerste gereguleerde wijnregio’s ter wereld.
',
    '- Douro
- Porto
- herkomst
- bescherming
- authenticiteit

# PORT_017.md',
    'De originele stenen grensmarkeringen van de Douro uit 1756 bestaan op sommige plekken nog steeds.
',
    '- Port komt uitsluitend uit Portugal
- De regio heet Douro
- Porto gaf de wijn zijn naam
- De Douro werd beschermd in 1756
- Herkomst bepaalt identiteit
',
    '### Opdracht

Zoek de Douro-regio en Porto op op een kaart.

Bekijk:

- de afstand tussen Douro en Porto
- de rivier
- de ligging in Portugal

### Checklist

- Ik heb Douro gevonden
- Ik heb Porto gevonden
- Ik begrijp de relatie tussen beide
- Ik weet waarom Port zo heet

### Reflectievraag

Waarom denk jij dat herkomst bij wijn en Port zo belangrijk is?
',
    8,
    1
  ),
  (
    'druiven-van-port',
    'Druiven van Port',
    'Na deze les kun jij de belangrijkste druivenrassen van Port benoemen en uitleggen welke rol zij spelen in smaak, structuur en kwaliteit.
',
    'Port wordt bijna altijd gemaakt als blend.

Dat betekent dat meerdere druivenrassen worden gecombineerd.

Waarom?

Omdat elke druif iets anders toevoegt.

Sommige geven:

- kracht
- kleur
- fruit
- zuur
- elegantie

Samen zorgen ze voor balans.

In de Douro zijn meer dan 80 druivenrassen toegestaan.

Maar een klein aantal is echt belangrijk.

### Touriga Nacional

Dit is de belangrijkste druif van Port.

Geeft:

- diepe kleur
- stevige tannines
- intense aroma’s
- structuur

Vaak de ruggengraat van Vintage Port.

### Touriga Franca

Geeft:

- elegantie
- finesse
- rood fruit
- zachtere structuur

Helpt kracht in balans te brengen.

### Tinta Roriz

Internationaal bekend als Tempranillo.

Geeft:

- body
- kruidigheid
- structuur

### Tinta Barroca

Geeft:

- rijp fruit
- zachtheid
- alcoholrijkdom

### Tinto Cão

Geeft:

- zuur
- frisheid
- levensduur

Belangrijk voor rijping.

### Waarom blenden?

Blenden geeft controle.

De wijnmaker kan:

- kracht verhogen
- frisheid toevoegen
- fruit versterken
- balans verbeteren

Dat maakt Port complexer.
',
    '- Touriga Nacional
- Touriga Franca
- Tinta Roriz
- Tinta Barroca
- Tinto Cão

# PORT_018.md',
    'Sommige top-Vintage Ports bevatten meer dan 20 verschillende druivenrassen.
',
    '- Port is bijna altijd een blend
- Touriga Nacional is de belangrijkste druif
- Elke druif heeft een functie
- Blenden verhoogt kwaliteit
- Complexiteit komt uit combinatie
',
    '### Opdracht

Pak een fles Port en bekijk het etiket.

Zoek op:

- welke druiven zijn gebruikt
- welke druif staat als eerste
- welke stijl Port het is

### Checklist

- Ik heb druiven gevonden
- Ik herken minimaal drie namen
- Ik begrijp waarom het een blend is
- Ik heb de stijl genoteerd

### Reflectievraag

Welke druif lijkt jou het meest belangrijk en waarom?
',
    8,
    2
  ),
  (
    'douro-vallei',
    'De Douro-vallei',
    'Na deze les kun jij de Douro-vallei beschrijven, de drie subregio’s benoemen en uitleggen waarom dit gebied zo belangrijk is voor Port.
',
    'De Douro-vallei is het hart van Port.

Hier groeien de druiven.

Zonder Douro bestaat Port niet.

De regio ligt in Noord-Portugal en volgt de rivier de Douro.

Het landschap bestaat uit:

- steile hellingen
- terrassen
- rotsachtige bodems
- diepe valleien

Dit maakt wijnbouw zwaar maar uniek.

De Douro heeft een extreem klimaat:

- hete zomers
- koude winters
- lage neerslag

Dat zorgt voor kleine druiven met veel concentratie.

---

### De drie subregio’s

#### 1. Baixo Corgo

Kenmerken:

- koeler
- meer regen
- lichtere Ports

---

#### 2. Cima Corgo

Het centrum van topkwaliteit.

Kenmerken:

- warmer
- droger
- geconcentreerder

Veel top-Quintas liggen hier.

---

#### 3. Douro Superior

De meest extreme zone.

Kenmerken:

- heet
- droog
- ruig

Veel moderne wijngaarden.

---

### Terrassen

Terrassen helpen:

- erosie te beperken
- water vast te houden
- wijnbouw mogelijk te maken
',
    '- Douro
- Baixo Corgo
- Cima Corgo
- Douro Superior
- terrassen

# PORT_019.md',
    'De Douro-vallei staat op de UNESCO Werelderfgoedlijst.
',
    '- De Douro is het hart van Port
- Er zijn drie subregio’s
- Cima Corgo is het topgebied
- Terrassen zijn essentieel
',
    '### Opdracht

Zoek de drie Douro-zones op op een kaart.

### Checklist

- Ik ken de drie zones
- Ik weet welke zone topkwaliteit levert
- Ik begrijp de verschillen

### Reflectievraag

Welke subregio lijkt jou het meest geschikt voor topkwaliteit?
',
    8,
    3
  ),
  (
    'klimaat-en-terroir',
    'Klimaat en terroir',
    'Na deze les kun jij uitleggen hoe klimaat, bodem en ligging de stijl en kwaliteit van Port beïnvloeden.
',
    'Port is sterk verbonden met terroir.

Terroir betekent de combinatie van:

- klimaat
- bodem
- hoogte
- ligging
- menselijke invloed

Samen bepalen deze factoren hoe de wijn smaakt.

De Douro heeft een continentaal klimaat:

- hete zomers
- koude winters
- weinig regen

In de zomer kan het boven de 40 graden worden.

Dat zorgt voor:

- snelle rijping
- hoge suikeropbouw
- dikke schillen
- krachtige aroma’s

Warme dagen zorgen voor rijping.

Koele nachten helpen om zuur te behouden.

Dit noemen we het diurnale temperatuurverschil.

---

### Leisteen

De belangrijkste bodemsoort in de Douro is leisteen.

Leisteen:

- houdt warmte vast
- laat water diep wegzakken
- dwingt wortels diep te groeien

Soms groeien wortels meer dan 10 meter diep.

Dit zorgt voor concentratie.

---

### Hoogte

Hoger gelegen wijngaarden zijn vaak:

- koeler
- frisser
- langzamer rijpend

Lagere wijngaarden zijn vaak:

- warmer
- rijper
- krachtiger

Ook zonligging speelt mee.
',
    '- terroir
- klimaat
- leisteen
- diurnaal verschil
- concentratie

# PORT_020.md',
    'Veel Douro-wijngaarden hebben zo weinig water dat de druiven letterlijk moeten vechten om te overleven.
',
    '- Terroir bepaalt stijl
- Douro is heet en droog
- Leisteen is cruciaal
- Hoogte beïnvloedt frisheid
- Temperatuurverschillen helpen balans bewaren
',
    '### Opdracht

Zoek op wat leisteen is en waarom dit belangrijk is in wijnbouw.

### Checklist

- Ik weet wat leisteen is
- Ik begrijp waarom wortels diep groeien
- Ik begrijp waarom hitte belangrijk is
- Ik zie de link met Portkwaliteit

### Reflectievraag

Wat denk jij: is klimaat of bodem belangrijker voor Port?
',
    8,
    4
  ),
  (
    'classificatie-douro',
    'Classificatie van de Douro',
    'Na deze les kun jij uitleggen hoe de Douro-wijngaarden worden geclassificeerd en waarom dit belangrijk is voor de kwaliteit van Port.
',
    'Niet elke wijngaard in de Douro is hetzelfde.

Sommige leveren druiven van uitzonderlijke kwaliteit.
Andere zijn eenvoudiger.

Om dit verschil te bepalen gebruikt de Douro een officieel classificatiesysteem.

Dit systeem loopt van:

**A t/m F**

Waarbij:

- A = hoogste kwaliteit
- F = laagste kwaliteit

De classificatie kijkt naar:

- hoogte
- ligging
- zonblootstelling
- hellingsgraad
- bodemtype
- leeftijd van de wijnstokken
- opbrengst per hectare

Hoe beter deze factoren zijn, hoe hoger de score.

### Waarom is A belangrijk?

A-geclassificeerde wijngaarden hebben vaak:

- de beste ligging
- optimale zon
- lage opbrengsten
- oude wijnstokken
- diepe wortels

Dit levert:

- meer concentratie
- meer complexiteit
- betere rijping

Veel top-Port komt van A- en B-wijngaarden.

### Lage opbrengsten

Minder druiven per stok betekent:

- meer energie per druif
- intensere smaken
- diepere kleur
- betere structuur

Dat is cruciaal voor Port.

### Quintas

Een Quinta is een wijndomein.

Voorbeelden:

- Quinta do Noval
- Quinta de Vargellas
- Quinta da Roêda

Deze namen kom je vaak tegen op topflessen.
',
    '- classificatie
- A-F
- Quinta
- opbrengst
- wijngaardkwaliteit

# PORT_021.md',
    'Sommige A-geclassificeerde Douro-wijngaarden zijn meer dan 100 jaar oud.
',
    '- Douro gebruikt A-F classificatie
- A is topkwaliteit
- Lage opbrengsten verhogen kwaliteit
- Quintas zijn belangrijke domeinen
- Grote Port begint in de wijngaard
',
    '### Opdracht

Zoek één beroemde Quinta op en ontdek:

- waar deze ligt
- welke stijl Port ze maken
- waarom deze Quinta bekend is

### Checklist

- Ik weet wat een Quinta is
- Ik begrijp A-F classificatie
- Ik ken minstens één beroemde Quinta

### Reflectievraag

Denk jij dat oude wijnstokken altijd betere Port maken?
',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- portstijlen (6 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'portstijlen'
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
    'ruby-port',
    'Ruby Port',
    'Na deze les kun jij uitleggen wat Ruby Port is, hoe deze stijl wordt gemaakt en hoe je Ruby Port herkent.
',
    'Ruby Port is de meest jonge en fruitgedreven stijl van Port.

De naam komt van de diepe robijnrode kleur.

Ruby Port rijpt relatief kort:

meestal 2 tot 3 jaar.

De rijping gebeurt in grote houten vaten of roestvrijstaal.

Waarom grote vaten?

Omdat er minder zuurstofcontact is.

Dat betekent:

- minder oxidatie
- meer fruitbehoud
- diepere kleur

Ruby draait om primaire aroma’s.

Typische aroma’s:

- kers
- braam
- pruim
- chocolade

Ruby Port is vaak:

- krachtig
- fruitig
- direct
- toegankelijk

Het is vaak de instapstijl voor nieuwe Portdrinkers.

---

### Hoe serveer je Ruby?

Serveertemperatuur:

14–16°C

Ruby past goed bij:

- pure chocolade
- blauwe kaas
- rood fruit desserts

Na opening blijft Ruby meestal 3–4 weken goed.
',
    '- Ruby
- fruit
- primaire aroma’s
- jonge Port
- korte rijping

# PORT_022.md',
    'Ruby Port is wereldwijd de meest verkochte Portstijl.
',
    '- Ruby is jong en fruitig
- Korte rijping behoudt fruit
- Weinig oxidatie
- Diepe robijnrode kleur
- Toegankelijke stijl
',
    '### Opdracht

Proef een Ruby Port en noteer:

- kleur
- fruitaroma’s
- structuur
- afdronk

### Checklist

- Ik heb de kleur beoordeeld
- Ik heb fruit herkend
- Ik heb de stijl benoemd

### Reflectievraag

Waarom denk je dat Ruby vaak de eerste Port is die mensen drinken?
',
    8,
    1
  ),
  (
    'tawny-port',
    'Tawny Port',
    'Na deze les kun jij uitleggen wat Tawny Port is, hoe deze stijl rijpt en hoe je Tawny herkent.
',
    'Tawny Port is een stijl die langer rijpt op hout.

Door deze langere houtrijping krijgt Tawny:

- meer zuurstofcontact
- lichtere kleur
- zachtere structuur
- meer tertiaire aroma’s

In tegenstelling tot Ruby draait Tawny minder om vers fruit.

Tawny draait om ontwikkeling.

Typische aroma’s:

- walnoten
- karamel
- toffee
- vijgen
- gedroogd fruit

De kleur verandert door oxidatie:

van robijnrood naar amber of oranjebruin.

Hoe ouder de Tawny, hoe complexer de aroma’s vaak worden.

---

### Rijping

Tawny rijpt meestal in kleinere houten vaten.

Dat zorgt voor meer contact met zuurstof.

Meer oxidatie betekent:

- minder fruit
- meer noten
- meer complexiteit

Tawny kan non-age zijn, maar ook met leeftijdsaanduiding:

- 10 years
- 20 years
- 30 years
- 40 years

Dit zijn gemiddelde stijlen, geen exacte leeftijden.

---

### Service

Serveertemperatuur:

12–14°C

Tawny past goed bij:

- notendesserts
- caramel desserts
- harde kazen

Na opening blijft Tawny vaak langer goed dan Ruby.

Meestal 4–8 weken.
',
    '- Tawny
- oxidatie
- houtrijping
- tertiaire aroma’s
- leeftijdsaanduiding

# PORT_023.md',
    'Oude Tawny Port wordt vaak gekoeld gedronken om de frisheid extra te benadrukken.
',
    '- Tawny rijpt langer op hout
- Meer oxidatie dan Ruby
- Zachtere structuur
- Meer notige aroma’s
- Oudere Tawny = meer complexiteit
',
    '### Opdracht

Vergelijk een Ruby en Tawny Port naast elkaar.

Analyseer:

- kleur
- geur
- smaak
- structuur

### Checklist

- Ik heb de kleur vergeleken
- Ik heb fruit vs noten herkend
- Ik heb structuur vergeleken

### Reflectievraag

Wat viel jou het meeste op in het verschil tussen Ruby en Tawny?
',
    8,
    2
  ),
  (
    'late-bottled-vintage',
    'Late Bottled Vintage (LBV)',
    'Na deze les kun jij uitleggen wat Late Bottled Vintage Port is, hoe deze stijl wordt gemaakt en waarin LBV verschilt van Vintage Port.
',
    'Late Bottled Vintage, afgekort **LBV**, is een Portstijl gemaakt uit één oogstjaar.

Dat lijkt op Vintage Port.

Maar er is een belangrijk verschil.

LBV rijpt langer op vat.

Meestal:

**4 tot 6 jaar**

Daardoor is LBV vaak toegankelijker wanneer hij op de markt komt.

Vintage Port rijpt korter op vat en langer op fles.

LBV combineert:

- concentratie
- rijp fruit
- structuur
- toegankelijkheid

Veel mensen zien LBV als de brug tussen Ruby en Vintage.

---

### Wat proef je in LBV?

Typische aroma’s:

- zwarte kersen
- pruimen
- cacao
- kruiden
- donkere chocolade

Structuur:

- stevig
- fruitig
- krachtig
- vaak zachter dan Vintage

LBV behoudt veel fruit omdat de oxidatie beperkt blijft.

---

### Gefilterd of ongefilterd

Er zijn twee stijlen:

**Gefilterd**

- direct drinkbaar
- geen depot
- makkelijker in gebruik

**Ongefilterd**

- complexer
- kan verder rijpen
- vaak decanteren nodig

Dat is een belangrijk verschil.

---

### Food pairing

LBV past goed bij:

- blauwe kaas
- chocolade desserts
- notentaart
- harde kazen

Serveertemperatuur:

14–16°C

Na opening:

1–3 weken, afhankelijk van stijl.
',
    '- LBV
- single vintage
- filtering
- ongefilterd
- toegankelijkheid

# PORT_024.md',
    'LBV werd populair als alternatief voor Vintage Port omdat het betaalbaarder en sneller drinkbaar is.
',
    '- LBV komt uit één oogstjaar
- Rijpt 4–6 jaar op vat
- Toegankelijker dan Vintage
- Gefilterd of ongefilterd mogelijk
- Brug tussen Ruby en Vintage
',
    '### Opdracht

Bekijk een LBV-fles en zoek:

- oogstjaar
- botteljaar
- gefilterd of ongefilterd

### Checklist

- Ik heb het oogstjaar gevonden
- Ik begrijp het verschil met Vintage
- Ik weet of hij gefilterd is

### Reflectievraag

Zou jij kiezen voor LBV of Vintage? Waarom?
',
    8,
    3
  ),
  (
    'white-port',
    'White Port',
    'Na deze les kun jij uitleggen wat White Port is, hoe deze stijl wordt gemaakt en waarin White Port verschilt van Ruby en Tawny.
',
    'White Port is een minder bekende maar zeer belangrijke Portstijl.

In tegenstelling tot Ruby en Tawny wordt White Port gemaakt van witte druiven.

Belangrijke druiven zijn:

- Malvasia Fina
- Gouveio
- Viosinho
- Rabigato
- Codega

White Port kan variëren van:

- droog
- halfdroog
- zoet

Dat maakt White Port veelzijdig.

De rijping gebeurt vaak op hout.

Soms kort, soms langer.

Dat beïnvloedt stijl en kleur.

---

### Hoe smaakt White Port?

Typische aroma’s:

- citrus
- honing
- amandel
- gedroogd fruit
- sinaasappelschil

White Port heeft vaak:

- frisse zuren
- lichtere body
- elegante structuur

Jonge White Port is frisser.

Oudere White Port krijgt meer notige tonen.

---

### White Port & Tonic

Een moderne klassieker:

White Port + tonic.

Vaak geserveerd met:

- ijs
- citroen
- munt

Dit heeft White Port populairder gemaakt.

Vooral als aperitief.

---

### Service

Droge White Port:

8–10°C

Zoetere White Port:

10–12°C

Food pairing:

- olijven
- amandelen
- zoute snacks
- lichte desserts
',
    '- White Port
- witte druiven
- aperitief
- tonic
- frisheid

# PORT_025.md',
    'White Port wordt in Portugal al veel langer als aperitief gedronken dan buiten Portugal.
',
    '- White Port wordt gemaakt van witte druiven
- Kan droog tot zoet zijn
- Frisser en lichter dan Ruby/Tawny
- Zeer geschikt als aperitief
- White Port & Tonic is populair
',
    '### Opdracht

Proef een White Port.

Analyseer:

- zoetheid
- zuur
- aroma’s
- stijl

### Checklist

- Ik heb de druivenstijl begrepen
- Ik heb het smaakprofiel geanalyseerd
- Ik heb de zoetheid ingeschat

### Reflectievraag

Zou jij White Port eerder als aperitief of dessertwijn inzetten?
',
    8,
    4
  ),
  (
    'rose-port',
    'Rosé Port',
    'Na deze les kun jij uitleggen wat Rosé Port is, hoe deze stijl wordt gemaakt en waarin Rosé Port verschilt van andere Portstijlen.
',
    'Rosé Port is een relatief moderne stijl binnen Port.

Deze stijl werd ontwikkeld om Port toegankelijker te maken voor een jonger publiek.

Rosé Port wordt gemaakt van blauwe druiven, net als Ruby en Tawny.

Het grote verschil zit in de schilweking.

Bij Rosé Port is het contact tussen sap en schillen veel korter.

Dat zorgt voor:

- lichtere kleur
- minder tannines
- frissere stijl
- zachtere structuur

De kleur varieert van lichtroze tot zalmroze.

---

### Smaakprofiel

Rosé Port is vaak:

- fruitig
- fris
- lichtzoet
- speels

Typische aroma’s:

- aardbei
- framboos
- rode bes
- kersen
- bloemen

Rosé Port heeft minder complexiteit dan Tawny of Vintage.

Maar juist daardoor is hij toegankelijk.

---

### Gebruik

Rosé Port wordt vaak gebruikt:

- als aperitief
- in cocktails
- met ijs
- met tonic

Het is een moderne, casual stijl.

Niet traditioneel, maar commercieel belangrijk.

---

### Service

Serveertemperatuur:

8–10°C

Food pairing:

- zomerse desserts
- rood fruit
- lichte kazen
- tapas

Na opening blijft Rosé meestal 2–4 weken goed.
',
    '- Rosé Port
- schilcontact
- fruitigheid
- aperitief
- cocktails

# PORT_026.md',
    'Rosé Port bestaat officieel pas sinds 2008 als erkende commerciële stijl.
',
    '- Rosé Port is modern
- Kort schilcontact geeft lichte kleur
- Fruitig en fris
- Minder tannines
- Populair als aperitief en cocktailbasis
',
    '### Opdracht

Vergelijk een Rosé Port met Ruby Port.

Analyseer:

- kleur
- fruitintensiteit
- body
- frisheid

### Checklist

- Ik heb het kleurverschil gezien
- Ik heb het smaakverschil geproefd
- Ik begrijp de stijlverschillen

### Reflectievraag

Zie jij Rosé Port als serieuze Portstijl of meer als moderne instapstijl?
',
    8,
    5
  ),
  (
    'crusted-port',
    'Crusted Port',
    'Na deze les kun jij uitleggen wat Crusted Port is, hoe deze stijl wordt gemaakt en waarin Crusted Port verschilt van Vintage en LBV.
',
    'Crusted Port is een bijzondere Portstijl.

Het is een blend van meerdere oogstjaren.

Dat maakt het anders dan Vintage of LBV.

Toch lijkt de stijl er vaak sterk op.

Waarom?

Omdat Crusted Port ongefilterd wordt gebotteld.

Daardoor ontstaat depot in de fles.

Dit depot noemen we de “crust”.

Daar komt de naam vandaan.

---

### Hoe wordt Crusted gemaakt?

Crusted Port rijpt eerst enkele jaren op vat.

Daarna wordt hij ongefilterd gebotteld.

Vervolgens rijpt hij verder op fles.

Dat zorgt voor:

- meer complexiteit
- meer structuur
- meer flesontwikkeling

Crusted combineert vaak:

- fruitkracht
- kruidigheid
- rijpingscomplexiteit

---

### Verschil met Vintage

Vintage Port:

- één oogstjaar
- topkwaliteit
- lange flesrijping

Crusted Port:

- blend van meerdere jaren
- vaak betaalbaarder
- vergelijkbare stijl

Veel liefhebbers zien Crusted als “Vintage-light”.

---

### Service

Crusted Port moet meestal worden gedecanteerd.

Door het depot.

Serveertemperatuur:

14–16°C

Food pairing:

- blauwe kaas
- wild
- pure chocolade
',
    '- Crusted
- depot
- ongefilterd
- decanteren
- flesrijping

# PORT_027.md',
    'Crusted Port is één van de minst bekende maar meest geliefde stijlen onder traditionele Portliefhebbers.
',
    '- Crusted is ongefilterd
- Blend van meerdere jaren
- Ontwikkelt depot
- Lijkt op Vintage
- Moet vaak gedecanteerd worden
',
    '### Opdracht

Zoek een Crusted Port op en vergelijk het etiket met een Vintage Port.

### Checklist

- Ik begrijp het verschil met Vintage
- Ik weet waarom er depot ontstaat
- Ik weet waarom decanteren nodig is

### Reflectievraag

Zou jij Crusted eerder kiezen dan LBV? Waarom?
',
    8,
    6
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- portstijlen-verdiept (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'portstijlen-verdiept'
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
    'vintage-port-deel-1',
    'Vintage Port Deel 1: Wat is Vintage Port?',
    'Na deze les kun jij uitleggen wat Vintage Port is, waarom deze stijl als de hoogste categorie binnen Port wordt gezien en hoe Vintage Port wordt geproduceerd.
',
    'Vintage Port wordt vaak gezien als de koning van Port.

Waarom?

Omdat het de meest prestigieuze en vaak meest complexe stijl is.

Vintage Port wordt gemaakt uit:

**één uitzonderlijk oogstjaar**

Niet elk jaar wordt Vintage gedeclareerd.

Alleen de beste jaren.

Dat maakt Vintage zeldzaam.

---

### Wat betekent "gedeclareerd"?

Een Port house beslist zelf of een oogstjaar goed genoeg is.

Als dat zo is, wordt het jaar officieel gedeclareerd.

Dat betekent:

- topkwaliteit druiven
- perfecte balans
- groot rijpingspotentieel

Niet elk jaar haalt dat niveau.

Soms zitten er meerdere jaren tussen.

---

### Korte houtrijping

Vintage Port rijpt meestal slechts:

**2 jaar op vat**

Daarna gaat hij op fles.

Waarom zo kort?

Om zoveel mogelijk:

- fruit
- kracht
- tannines
- concentratie

te behouden.

De echte rijping gebeurt op fles.

Dat is uniek.

---

### Smaakprofiel

Jonge Vintage Port is vaak:

- intens
- krachtig
- diep fruitig
- tanninerijk

Typische aroma’s:

- zwarte kersen
- braam
- pruim
- viooltjes
- cacao

Met leeftijd ontwikkelen zich:

- leer
- tabak
- specerijen
- gedroogd fruit
',
    '- Vintage
- declaratie
- single vintage
- flesrijping
- topjaar

# PORT_028.md',
    'Veel Vintage Ports kunnen 30 tot 50 jaar rijpen.

Sommige zelfs langer.
',
    '- Vintage = hoogste Portcategorie
- Slechts één oogstjaar
- Alleen in topjaren
- Korte vatrijping
- Lange flesrijping
',
    '### Opdracht

Zoek drie Vintage Ports op van verschillende huizen.

Bekijk:

- welk jaar
- of het gedeclareerd is
- prijsverschillen

### Checklist

- Ik begrijp declaratie
- Ik begrijp korte vatrijping
- Ik begrijp flesrijping

### Reflectievraag

Waarom denk jij dat Vintage Port als topcategorie wordt gezien?
',
    8,
    1
  ),
  (
    'vintage-port-deel-2',
    'Vintage Port Deel 2: Rijping & Potentieel',
    'Na deze les kun jij uitleggen hoe Vintage Port rijpt, waarom decanteren vaak nodig is en waarom deze stijl zo’n enorm bewaarpotentieel heeft.
',
    'Vintage Port is gebouwd voor lange rijping.

Waar veel Port relatief snel drinkbaar is, ontwikkelt Vintage zich langzaam.

De meeste rijping gebeurt op fles.

Dat maakt Vintage uniek.

Tijdens flesrijping verandert de wijn:

- fruit wordt complexer
- tannines worden zachter
- aroma’s verdiepen
- structuur integreert

Dat proces kan tientallen jaren duren.

---

### Depot

Omdat Vintage Port ongefilterd wordt gebotteld, ontstaat er depot.

Depot bestaat uit:

- kleurstoffen
- tannines
- vaste bestanddelen

Dat is normaal.

Sterker nog:

veel depot betekent vaak veel concentratie.

Maar het betekent ook:

**decanteren is meestal nodig.**

---

### Rijpingsfases

Jonge Vintage (0–10 jaar):

- veel fruit
- krachtig
- tanninerijk

Middelbare Vintage (10–25 jaar):

- meer balans
- meer complexiteit
- zachtere structuur

Oude Vintage (25+ jaar):

- tertiaire aroma’s
- enorme complexiteit
- zijdezachte textuur

Elke fase heeft zijn charme.

---

### Waarom bewaren?

Vintage Port kan enorm in waarde stijgen.

Waarom?

Omdat:

- productie beperkt is
- topjaren schaars zijn
- rijping kwaliteit verhoogt

Top Vintage is daardoor vaak verzamelobject.

---

### Service

Altijd voorzichtig openen.

Vaak decanteren.

Serveertemperatuur:

16–18°C

Food pairing:

- Stilton
- pure chocolade
- noten
- sigaar (klassiek)
',
    '- flesrijping
- depot
- decanteren
- bewaarpotentieel
- tertiaire aroma’s

# PORT_029.md',
    'Sommige Vintage Ports uit de 19e eeuw zijn nog steeds drinkbaar.
',
    '- Vintage rijpt op fles
- Depot is normaal
- Decanteren is vaak nodig
- Kan tientallen jaren rijpen
- Waarde stijgt vaak met leeftijd
',
    '### Opdracht

Zoek drie Vintage Ports op van verschillende leeftijden.

Vergelijk:

- prijs
- leeftijd
- drinkadvies

### Checklist

- Ik begrijp depot
- Ik begrijp rijpingsfases
- Ik begrijp waarom decanteren nodig is

### Reflectievraag

Zou jij een Vintage jong drinken of oud bewaren?
',
    8,
    2
  ),
  (
    'single-quinta-vintage-port',
    'Single Quinta Vintage Port',
    'Na deze les kun jij uitleggen wat Single Quinta Vintage Port is, hoe deze stijl verschilt van klassieke Vintage Port en waarom de Quinta zo belangrijk is.
',
    'Single Quinta Vintage Port is een Vintage Port uit:

- één oogstjaar
- één Quinta (wijndomein)

Dat maakt deze stijl uniek.

Bij klassieke Vintage Port kunnen druiven uit meerdere Quintas komen.

Bij Single Quinta komt alles van één domein.

Dat geeft een duidelijker terroir-profiel.

---

### Wanneer wordt Single Quinta gemaakt?

Vaak in jaren die goed zijn, maar niet sterk genoeg voor volledige Vintage-declaratie.

Een huis kan dan:

- geen algemene Vintage declareren
- wel een Single Quinta bottelen

Dit gebeurt regelmatig.

Daardoor zijn Single Quinta’s vaak toegankelijker én betaalbaarder.

---

### Wat proef je?

Single Quinta heeft vaak:

- veel fruit
- structuur
- concentratie
- terroirexpressie

Omdat alles van één plek komt, proef je vaak meer identiteit.

Dat maakt deze stijl interessant voor gevorderde proevers.

---

### Bekende voorbeelden

- Quinta do Noval Nacional
- Quinta de Vargellas
- Quinta da Roêda

Deze namen zijn beroemd in de Portwereld.

De naam van de Quinta op het etiket is belangrijk.

---

### Rijping & service

Net als Vintage:

- korte vatrijping
- lange flesrijping
- vaak depot
- vaak decanteren

Serveertemperatuur:

16–18°C
',
    '- Single Quinta
- terroir
- Vintage
- domein
- flesrijping

# PORT_030.md',
    'Veel Single Quinta Ports worden later beter gewaardeerd dan sommige algemene Vintage Ports.
',
    '- Eén oogstjaar
- Eén Quinta
- Meer terroir-expressie
- Vaak betaalbaarder dan Vintage
- Zeer interessant voor kenners
',
    '### Opdracht

Zoek drie Single Quinta Vintage Ports op.

Vergelijk:

- Quinta
- prijs
- jaargang

### Checklist

- Ik begrijp het verschil met Vintage
- Ik begrijp de rol van de Quinta
- Ik herken een Single Quinta etiket

### Reflectievraag

Denk jij dat één domein meer karakter geeft dan meerdere domeinen samen?
',
    8,
    3
  ),
  (
    'tawny-met-leeftijd',
    'Tawny Port met Leeftijdsaanduiding',
    'Na deze les kun jij uitleggen wat Tawny Port met leeftijdsaanduiding is, hoe deze stijl wordt opgebouwd en wat 10, 20, 30 en 40 years betekenen.
',
    'Tawny Port met leeftijdsaanduiding is een premium categorie binnen Tawny.

Op het etiket zie je vaak:

- 10 Years
- 20 Years
- 30 Years
- 40 Years

Belangrijk:

dit is niet de exacte leeftijd.

Het is de gemiddelde stijl en rijpingsindruk.

Dat betekent:

een 20 Years Tawny kan wijn bevatten van meerdere leeftijden.

De blender zoekt een consistent profiel.

---

### Hoe rijpt Aged Tawny?

Deze Ports rijpen langdurig op kleine houten vaten.

Dat zorgt voor veel oxidatie.

Meer oxidatie betekent:

- lichtere kleur
- zachtere structuur
- meer notige aroma’s
- grotere complexiteit

Hoe ouder de Tawny:

hoe meer tertiaire ontwikkeling.

---

### Smaakprofielen per leeftijd

**10 Years**

- nog relatief fruitig
- noten
- karamel

**20 Years**

- complexer
- meer balans
- gedroogd fruit

**30 Years**

- diep oxidatief
- noten
- koffie
- kruiden

**40 Years**

- zeer geconcentreerd
- extreem complex
- verfijnd
- lang

---

### Service

Serveertemperatuur:

12–14°C

Food pairing:

- notentaart
- crème brûlée
- harde kazen
- caramel desserts

Na opening blijft Aged Tawny vaak maanden goed.
',
    '- Aged Tawny
- leeftijdsaanduiding
- oxidatie
- houtrijping
- complexiteit

# PORT_031.md',
    'Een goede 40 Years Tawny kan soms complexer smaken dan veel Vintage Ports.
',
    '- Leeftijd = stijl, niet exacte leeftijd
- Langdurige houtrijping
- Veel oxidatie
- Meer complexiteit met leeftijd
- Premium Tawny categorie
',
    '### Opdracht

Vergelijk een 10 Years en 20 Years Tawny.

Analyseer:

- kleur
- aroma
- structuur
- lengte

### Checklist

- Ik begrijp leeftijdsaanduiding
- Ik begrijp oxidatie
- Ik herken stijlverschillen

### Reflectievraag

Welke leeftijd spreekt jou het meest aan en waarom?
',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- port-premium (2 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'port-premium'
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
    'colheita-port',
    'Colheita Port',
    'Na deze les kun jij uitleggen wat Colheita Port is, hoe deze stijl verschilt van Vintage en Tawny, en waarom Colheita zo uniek is.
',
    'Colheita betekent letterlijk:

**oogst**

Colheita Port is een Tawny Port uit:

**één enkel oogstjaar**

Dat maakt Colheita bijzonder.

Bij gewone Tawny zijn meerdere oogstjaren gemengd.

Bij Colheita komt alles uit één jaar.

Dat combineert:

- jaargang-identiteit
- oxidatieve rijping
- terroirexpressie

---

### Rijping

Colheita moet minimaal:

**7 jaar op vat rijpen**

Maar vaak is dat veel langer.

Soms:

20, 30 of zelfs 50 jaar.

De wijn blijft op hout.

Dat geeft:

- oxidatie
- notige tonen
- zachtheid
- complexiteit

---

### Verschil met Vintage

Vintage:

- één jaar
- korte vatrijping
- lange flesrijping

Colheita:

- één jaar
- lange vatrijping
- vaak sneller drinkbaar

Dat maakt Colheita toegankelijker.

Maar vaak net zo complex.

---

### Smaakprofiel

Typische aroma’s:

- walnoten
- karamel
- sinaasappelschil
- vijgen
- koffie
- specerijen

Oudere Colheita’s kunnen extreem verfijnd zijn.

---

### Service

Serveertemperatuur:

12–14°C

Meestal niet decanteren nodig.

Na opening vaak lang houdbaar.
',
    '- Colheita
- single harvest
- vatrijping
- oxidatie
- botteljaar

# PORT_032.md',
    'Sommige Colheita’s worden pas na tientallen jaren gebotteld en dragen zowel oogstjaar als botteljaar op het etiket.
',
    '- Colheita = Tawny uit één jaar
- Minimaal 7 jaar vatrijping
- Vaak veel langer
- Complex en oxidatief
- Geen blend van jaren
',
    '### Opdracht

Zoek een Colheita op en noteer:

- oogstjaar
- botteljaar
- aantal jaren vatrijping

### Checklist

- Ik begrijp het verschil met Tawny
- Ik begrijp het verschil met Vintage
- Ik herken een Colheita etiket

### Reflectievraag

Wat spreekt jou meer aan: Vintage of Colheita?
',
    8,
    1
  ),
  (
    'garrafeira-port',
    'Garrafeira Port',
    'Na deze les kun jij uitleggen wat Garrafeira Port is, waarom deze stijl extreem zeldzaam is en hoe de rijping verschilt van andere Portcategorieën.
',
    'Garrafeira is één van de zeldzaamste Portstijlen ter wereld.

Het is een unieke combinatie van:

- lange vatrijping
- extra flesrijping

Maar niet op de normale manier.

Garrafeira begint meestal als:

**Ruby-stijl Port uit één oogstjaar**

Daarna rijpt de wijn eerst jaren op hout.

Vaak 3 tot 6 jaar.

Tot zover lijkt het op Vintage.

Maar daarna gebeurt iets bijzonders.

---

### Glazen demijohns

Na houtrijping gaat Garrafeira in grote glazen flessen:

**demijohns**

Dat is uniek.

Hier rijpt de wijn soms tientallen jaren verder.

Deze combinatie van hout + glas geeft een heel eigen ontwikkeling.

Niet volledig oxidatief.

Niet volledig reductief.

Een soort tussenwereld.

---

### Waarom is dit bijzonder?

De stijl ontwikkelt:

- enorme complexiteit
- zachtheid
- diepte
- finesse

Typische aroma’s:

- gedroogde sinaasappel
- noten
- koffie
- specerijen
- oude kruiden
- karamel

Vaak met enorme lengte.

---

### Producenten

Historisch vooral bekend door:

**Niepoort**

Zij hebben Garrafeira wereldberoemd gemaakt.

Het is een nichecategorie.

Veel wijnliefhebbers hebben het nooit geproefd.

---

### Service

Serveertemperatuur:

14–16°C

Soms licht decanteren.

Food pairing:

- oude kazen
- noten
- pure chocolade
- sigaren
',
    '- Garrafeira
- demijohn
- glasrijping
- Niepoort
- zeldzaamheid

# PORT_033.md',
    'Sommige Garrafeira Ports rijpen meer dan 40 jaar in glas voordat ze worden gebotteld.
',
    '- Zeer zeldzame stijl
- Eén oogstjaar
- Eerst hout, daarna glas
- Zeer complex
- Vooral beroemd door Niepoort
',
    '### Opdracht

Zoek een Garrafeira Port op en vergelijk deze met Vintage en Colheita.

### Checklist

- Ik begrijp het glasrijpingsproces
- Ik begrijp het verschil met Vintage
- Ik begrijp het verschil met Colheita

### Reflectievraag

Waarom denk jij dat glas zo’n andere rijping geeft dan hout of fles?
',
    8,
    2
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- praktijk-port (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'praktijk-port'
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
    'port-serveren',
    'Port Serveren: Temperatuur, Glaswerk & Bewaren',
    'Na deze les kun jij:

- de juiste serveertemperatuur kiezen per Portstijl
- het juiste glaswerk selecteren
- uitleggen wanneer decanteren nodig is
- correct adviseren over bewaartermijnen na openen
- fouten in Portservice herkennen en voorkomen
',
    'Goede Port serveren is een vak.

Veel mensen denken:

“Port is Port.”

Maar dat klopt niet.

Net zoals bij wijn bepaalt service een groot deel van de ervaring.

Dezelfde Port kan totaal anders smaken wanneer:

- hij te warm is
- hij te koud is
- verkeerd glas wordt gebruikt
- hij te lang open staat
- hij niet wordt gedecanteerd

Service is dus geen detail.

Service is onderdeel van kwaliteit.
',
    '- serveertemperatuur
- glaswerk
- decanteren
- bewaartermijn
- oxidatie
- servicekwaliteit

# PORT_034.md',
    'Veel toprestaurants serveren 20 Years Tawny bewust rond 11–12°C om extra spanning en precisie te creëren.
',
    '- Temperatuur is stijl-afhankelijk
- Glaswerk beïnvloedt alcoholbeleving
- Vintage moet vaak gedecanteerd worden
- Tawny en Colheita blijven langer houdbaar
- Service maakt groot kwaliteitsverschil
',
    '### Opdracht

Maak thuis een serviceplan voor 4 Portstijlen:

- White
- Ruby
- Tawny
- Vintage

Noteer:

- temperatuur
- glas
- decanteren ja/nee
- bewaartermijn

---

### Checklist

- Ik ken alle serveertemperaturen
- Ik weet welke stijlen decanteren vereisen
- Ik begrijp bewaartermijnen
- Ik herken servicefouten

---

### Reflectievraag

Welke servicefout zie jij het vaakst in restaurants of thuis?
',
    12,
    1
  ),
  (
    'port-en-kaas',
    'Port & Kaas',
    'Na deze les kun jij:

- uitleggen waarom Port en kaas zo goed samengaan
- de juiste Portstijl koppelen aan verschillende kaassoorten
- balans herkennen tussen zout, vet, zoet en structuur
- klassieke en moderne Port-kaas pairings adviseren
',
    'Port en kaas zijn één van de meest klassieke combinaties in de wijnwereld.

Waarom?

Omdat Port veel eigenschappen heeft die goed aansluiten op kaas:

- zoetheid
- alcohol
- concentratie
- zuur
- textuur

Kaas heeft vaak:

- zout
- vet
- umami
- romigheid

Deze elementen kunnen elkaar versterken.

Maar alleen als de pairing klopt.
',
    '- pairing
- zout
- vet
- Stilton
- Gouda
- intensiteit

# PORT_035.md',
    'De Britse traditie van Stilton en Vintage Port bestaat al meer dan 200 jaar.
',
    '- Port en kaas zijn klassiek
- Zout en zoet werken sterk samen
- Intensiteit moet kloppen
- Vintage + Stilton is de klassieker
- Tawny en oude kazen zijn vaak briljant
',
    '### Opdracht

Maak thuis een mini pairing-flight:

- White Port + Manchego
- Ruby + blauwe kaas
- Tawny + oude Gouda

Noteer:

- balans
- contrast
- favoriet

---

### Checklist

- Ik begrijp zout + zoet
- Ik herken intensiteitsbalans
- Ik heb minimaal 2 pairings getest

---

### Reflectievraag

Welke kaas verraste jou het meest met Port?
',
    12,
    2
  ),
  (
    'port-en-desserts',
    'Port & Desserts',
    'Na deze les kun jij:

- Port combineren met desserts op hoog niveau
- het juiste type Port koppelen aan verschillende dessertstijlen
- balans herkennen tussen zoetheid, zuur, bitterheid en textuur
- klassieke fouten in dessertpairing voorkomen
',
    'Port en desserts lijken vanzelfsprekend.

Zoet bij zoet.

Maar zo simpel is het niet.

Bij dessertpairing geldt een belangrijke regel:

**De wijn moet minstens even zoet zijn als het dessert.**

Waarom?

Als het dessert zoeter is dan de Port:

- lijkt de Port zuur
- verliest hij fruit
- voelt alcohol harder aan

Port werkt goed door:

- restsuiker
- alcohol
- concentratie
- aromatische intensiteit

Maar de juiste stijl is cruciaal.
',
    '- dessertpairing
- zoetheidsbalans
- flavor bridging
- intensiteit
- chocolade
- karamel

# PORT_036.md',
    'Veel topchefs bouwen desserts rondom Tawny Port in plaats van andersom.
',
    '- Wijn moet even zoet of zoeter zijn
- Match intensiteit
- Gebruik smaakspiegeling
- Ruby en chocolade zijn klassiek
- Tawny werkt briljant met karamel en noten
',
    '### Opdracht

Maak thuis 3 pairings:

- Ruby + chocolade
- Tawny + caramel dessert
- White + citroendessert

Beoordeel:

- balans
- intensiteit
- contrast
- favoriet

---

### Checklist

- Ik ken de zoetheidsregel
- Ik begrijp flavor bridging
- Ik heb meerdere pairings getest

---

### Reflectievraag

Welke dessertstijl lijkt jou het lastigst om goed te pairen met Port?
',
    12,
    3
  ),
  (
    'port-in-gastronomie',
    'Port in Gastronomie',
    'Na deze les kun jij:

- Port strategisch inzetten in de gastronomie
- begrijpen wanneer Port als pairing werkt en wanneer als ingrediënt
- Port gebruiken in sauzen, reducties en desserts
- adviseren welke Portstijl past bij verschillende gerechten
',
    'Port is niet alleen een drank.

In gastronomie is Port een instrument.

Toprestaurants gebruiken Port op drie manieren:

1. **Als pairing**
2. **Als ingrediënt**
3. **Als smaakversterker**

Port is krachtig.

Door zijn:

- suiker
- alcohol
- concentratie
- zuur
- aromatische diepte

kan het veel meer dan gewone wijn.
',
    '- gastronomie
- reductie
- pairing
- saus
- smaakversterking
- menu-opbouw

# PORT_037.md',
    'Portreductie is één van de meest gebruikte luxe sauzen in klassieke Franse keuken.
',
    '- Port is breder inzetbaar dan dessertwijn
- Kan pairing én ingrediënt zijn
- Ruby en LBV zijn sterk in sauzen
- Tawny blinkt uit in desserts
- White Port is sterker in lichte keuken
',
    '### Opdracht

Ontwerp een 4-gangen menu met Port:

- aperitief
- gerecht
- kaas
- dessert

Kies bij elke gang een stijl en motiveer.

---

### Checklist

- Ik begrijp Port als pairing
- Ik begrijp Port als ingrediënt
- Ik kan stijlen koppelen aan gerechten

---

### Reflectievraag

Waar zie jij de grootste kans voor Port buiten dessert?
',
    12,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-port (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'examen-port'
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
    'blindproeven-ruby-vs-tawny',
    'Blindproeven: Ruby vs Tawny',
    'Na deze les kun jij:

- blind het verschil herkennen tussen Ruby en Tawny Port
- kleur, aroma en structuur analyseren zonder etiket
- primaire en oxidatieve kenmerken onderscheiden
- systematisch blindproeven toepassen
',
    'Blindproeven is de ultieme test.

Niet weten wat in het glas zit.

Alleen vertrouwen op:

- kijken
- ruiken
- proeven
- analyseren

Bij Port is Ruby vs Tawny de belangrijkste eerste blindtest.

Waarom?

Omdat ze fundamenteel anders rijpen.
',
    '- blindproeven
- Ruby
- Tawny
- oxidatie
- primaire aroma’s
- tertiaire aroma’s

# PORT_038.md',
    'Veel beginners herkennen Tawny sneller dan Ruby omdat oxidatieve aroma’s uitgesprokener zijn.
',
    '- Ruby = fruit + diepe kleur
- Tawny = oxidatie + noten
- Kleur is eerste sleutel
- Aroma bevestigt
- Structuur helpt beslissen
',
    '### Opdracht

Blind proef 2 glazen:

- 1 Ruby
- 1 Tawny

Maak volledige analyse.

---

### Checklist

- Ik analyseerde kleur
- Ik benoemde aroma’s
- Ik gaf conclusie met motivatie

---

### Reflectievraag

Wat vond jij moeilijker: kleur of geur interpreteren?
',
    15,
    1
  ),
  (
    'blindproeven-vintage-vs-lbv',
    'Blindproeven: Vintage vs LBV',
    'Na deze les kun jij:

- blind het verschil herkennen tussen Vintage Port en LBV
- analyseren op structuur, concentratie en complexiteit
- filtering en flesrijping meenemen in je beoordeling
- verklaren waarom deze stijlen vaak dicht bij elkaar liggen
',
    'Vintage en LBV zijn de lastigste blindvergelijking binnen Port.

Waarom?

Omdat beide stijlen:

- donker zijn
- krachtig zijn
- fruitgedreven zijn
- vaak uit één oogstjaar komen

Maar er zijn fundamentele verschillen.
',
    '- blindproeven
- Vintage
- LBV
- spanning
- tannine
- bewaarpotentieel

# PORT_039.md',
    'Veel proevers verwarren jonge Vintage met ongefilterde LBV bij eerste analyse.
',
    '- Beide zijn krachtig
- Vintage heeft meer spanning
- LBV is toegankelijker
- Structuur is vaak de sleutel
- Tannines geven veel informatie
',
    '### Opdracht

Blind proef:

- 1 Vintage
- 1 LBV

Analyseer:

- kleur
- geur
- structuur
- tannine
- conclusie

---

### Checklist

- Ik beoordeelde structuur
- Ik beoordeelde tannine
- Ik gaf onderbouwde conclusie

---

### Reflectievraag

Wat vond je moeilijker: intensiteit of rijpingsniveau herkennen?
',
    15,
    2
  ),
  (
    'praktijkexamen-port',
    'Praktijkexamen Port',
    'Na deze les kun jij:

- een volledige Portproeverij zelfstandig uitvoeren
- stijlen herkennen zonder hulp
- service en pairing correct onderbouwen
- je theoretische kennis toepassen in praktijk
',
    'Dit is je eerste volledige praktijkexamen.

Geen nieuwe theorie.

Vanaf hier draait alles om integratie.

Je combineert:

- stijlherkenning
- servicekennis
- pairingkennis
- blindproefvaardigheid
- analyse

Dit is exact hoe echte sommeliers leren.

Niet door losse feiten.

Maar door toepassing.
',
    '- praktijkexamen
- analyse
- blindproeven
- service
- pairing
- integratie

# PORT_040.md',
    'Veel WSET- en sommelierexamens gebruiken exact deze systematiek.
',
    '- Theorie wordt praktijk
- Volledige analyse is verplicht
- Stijl + service + pairing = totaalbeeld
- Onderbouwing is essentieel
',
    '### Officieel examen

Voer dit examen volledig uit.

Schrijf per glas je volledige analyse.

---

### Checklist

- Ik analyseerde visueel
- Ik analyseerde geur
- Ik analyseerde smaak
- Ik bepaalde stijl
- Ik gaf serviceadvies
- Ik gaf pairingadvies

---

### Reflectievraag

Waar zat jouw grootste onzekerheid tijdens dit praktijkexamen?
',
    20,
    3
  ),
  (
    'theorie-examen-port',
    'Theorie-examen Port Academy',
    'Na dit examen kun jij aantonen dat je de volledige Port Track theoretisch beheerst:
oorsprong, productie, stijlen, druiven, service, pairing en blindproeven.
',
    '',
    '- examen
- certificering
- theorie
- integratie
- blindproeven',
    '',
    '',
    'Beantwoord de volgende open examenvragen:

1. Leg het volledige productieproces van Port uit.
2. Beschrijf het verschil tussen Ruby en Tawny rijping.
3. Welke rol speelt fortificatie in smaakontwikkeling?
4. Welke Portstijl combineer je met blauwschimmelkaas en waarom?
5. Hoe herken je Vintage Port blind?
',
    25,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- Quizvragen
with l as (
  select l.id, m.slug as module_slug, l.slug as lesson_slug
  from academy.lessons l
  join academy.modules m on m.id = l.module_id
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-port', 'wat-is-port', 1, 'Waar komt Port vandaan?', '["Spanje", "Portugal", "Italië", "Frankrijk"]', 1, 'Correct: Portugal'),
  ('intro-port', 'wat-is-port', 2, 'Wat voor wijn is Port?', '["Versterkte wijn", "Mousserende wijn", "Rosé", "Likeur"]', 0, 'Correct: Versterkte wijn'),
  ('intro-port', 'wat-is-port', 3, 'Wat gebeurt er tijdens het maken van Port?', '["Fortificatie", "Distillatie", "Pasteurisatie", "Koeling"]', 0, 'Correct: Fortificatie'),
  ('intro-port', 'wat-is-port', 4, 'Hoeveel alcohol bevat Port meestal?', '["10–12%", "13–15%", "19–22%", "30–35%"]', 2, 'Correct: 19–22%'),
  ('intro-port', 'wat-is-port', 5, 'Port is vaak:', '["Zoet", "Bitter", "Zout", "Droog"]', 0, 'Correct: Zoet'),
  ('intro-port', 'fortificatie', 1, 'Wat is fortificatie?', '["Alcohol toevoegen", "Koelen", "Filteren", "Rijpen"]', 0, 'Correct: Alcohol toevoegen'),
  ('intro-port', 'fortificatie', 2, 'Wat stopt door fortificatie?', '["Gisting", "Oxidatie", "Filtering", "Houtrijping"]', 0, 'Correct: Gisting'),
  ('intro-port', 'fortificatie', 3, 'Waarom blijft suiker behouden?', '["Gisting stopt vroeg", "Suiker wordt toegevoegd", "Wijn rijpt langer", "Druiven drogen"]', 0, 'Correct: Gisting stopt vroeg'),
  ('intro-port', 'fortificatie', 4, 'Welke alcohol wordt gebruikt?', '["Aguardente", "Whisky", "Cognac", "Rum"]', 0, 'Correct: Aguardente'),
  ('intro-port', 'fortificatie', 5, 'Fortificatie zorgt voor:', '["Meer zoetheid", "Minder alcohol", "Minder smaak", "Minder kleur"]', 0, 'Correct: Meer zoetheid'),
  ('intro-port', 'waarom-is-port-uniek', 1, 'Wat maakt Port uniek?', '["Fortificatie", "Koeling", "Koolzuur", "Distillatie"]', 0, 'Correct: Fortificatie'),
  ('intro-port', 'waarom-is-port-uniek', 2, 'Port komt altijd uit:', '["Douro", "Rioja", "Bordeaux", "Toscane"]', 0, 'Correct: Douro'),
  ('intro-port', 'waarom-is-port-uniek', 3, 'Vintage Port wordt gemaakt:', '["Alleen in topjaren", "Elk jaar", "Alleen wit", "Alleen oud"]', 0, 'Correct: Alleen in topjaren'),
  ('intro-port', 'waarom-is-port-uniek', 4, 'Port combineert goed met:', '["Kaas", "Water", "Bier", "Sushi"]', 0, 'Correct: Kaas'),
  ('intro-port', 'waarom-is-port-uniek', 5, 'Port kan vaak:', '["Lang rijpen", "Niet rijpen", "Alleen jong", "Niet ouderen"]', 0, 'Correct: Lang rijpen'),
  ('intro-port', 'geschiedenis-van-port', 1, 'In welke eeuw ontstond Port?', '["15e", "16e", "17e", "18e"]', 2, 'Correct: 17e'),
  ('intro-port', 'geschiedenis-van-port', 2, 'Wie speelde een grote rol?', '["Engelsen", "Duitsers", "Amerikanen", "Italianen"]', 0, 'Correct: Engelsen'),
  ('intro-port', 'geschiedenis-van-port', 3, 'Waarom werd alcohol toegevoegd?', '["Houdbaarheid", "Meer kleur", "Minder zuur", "Meer suiker"]', 0, 'Correct: Houdbaarheid'),
  ('intro-port', 'geschiedenis-van-port', 4, 'Wanneer werd de Douro beschermd?', '["1700", "1756", "1800", "1850"]', 1, 'Correct: 1756'),
  ('intro-port', 'geschiedenis-van-port', 5, 'Waarom Engelse namen?', '["Handelaren", "Klimaat", "Wetgeving", "Productie"]', 0, 'Correct: Handelaren'),
  ('intro-port', 'portcategorieen', 1, 'Welke stijl is jong en fruitig?', '["Ruby", "Tawny", "White", "Vintage"]', 0, 'Correct: Ruby'),
  ('intro-port', 'portcategorieen', 2, 'Welke stijl rijpt oxidatief?', '["Ruby", "Tawny", "White", "Vintage"]', 1, 'Correct: Tawny'),
  ('intro-port', 'portcategorieen', 3, 'White Port wordt gemaakt van:', '["Witte druiven", "Rode druiven", "Gedroogde druiven", "Gemengde druiven"]', 0, 'Correct: Witte druiven'),
  ('intro-port', 'portcategorieen', 4, 'Welke stijl heeft meestal de hoogste status?', '["Vintage", "Ruby", "White", "Tawny"]', 0, 'Correct: Vintage'),
  ('intro-port', 'portcategorieen', 5, 'Welke stijl heeft vaak notige tonen?', '["Tawny", "Ruby", "White", "Rosé"]', 0, 'Correct: Tawny'),
  ('productie-port', 'druiven-van-port', 1, 'Waaruit bestaat Port meestal?', '["Eén druif", "Een blend", "Alleen witte druiven", "Alleen oude druiven"]', 1, 'Correct: Een blend'),
  ('productie-port', 'druiven-van-port', 2, 'Welke druif is het belangrijkst?', '["Merlot", "Touriga Nacional", "Syrah", "Cabernet"]', 1, 'Correct: Touriga Nacional'),
  ('productie-port', 'druiven-van-port', 3, 'Wat geeft Touriga Nacional?', '["Zuur", "Structuur", "Minder kleur", "Minder aroma"]', 1, 'Correct: Structuur'),
  ('productie-port', 'druiven-van-port', 4, 'Waarom blenden?', '["Voor balans", "Voor minder smaak", "Voor minder kleur", "Voor minder alcohol"]', 0, 'Correct: Voor balans'),
  ('productie-port', 'druiven-van-port', 5, 'Hoeveel druiven zijn toegestaan?', '["10", "20", "Meer dan 80", "200"]', 2, 'Correct: Meer dan 80'),
  ('productie-port', 'douro-vallei', 1, 'Waar ligt de Douro?', '["Spanje", "Frankrijk", "Portugal", "Italië"]', 2, 'Correct: Portugal'),
  ('productie-port', 'douro-vallei', 2, 'Hoeveel zones heeft de Douro?', '["2", "3", "4", "5"]', 1, 'Correct: 3'),
  ('productie-port', 'douro-vallei', 3, 'Welke zone is topgebied?', '["Baixo Corgo", "Cima Corgo", "Douro Superior", "Porto"]', 1, 'Correct: Cima Corgo'),
  ('productie-port', 'douro-vallei', 4, 'Wat zorgt voor concentratie?', '["Hoge opbrengst", "Lage opbrengst", "Veel regen", "Koeling"]', 1, 'Correct: Lage opbrengst'),
  ('productie-port', 'douro-vallei', 5, 'Hoe liggen veel wijngaarden?', '["Vlak", "Ondergronds", "Terrassen", "Kas"]', 2, 'Correct: Terrassen'),
  ('productie-port', 'klimaat-en-terroir', 1, 'Hoe zijn de zomers?', '["Koud", "Nat", "Heet", "Mild"]', 2, 'Correct: Heet'),
  ('productie-port', 'klimaat-en-terroir', 2, 'Welke bodem is belangrijk?', '["Kalk", "Leisteen", "Klei", "Zand"]', 1, 'Correct: Leisteen'),
  ('productie-port', 'klimaat-en-terroir', 3, 'Wat doet leisteen?', '["Koelt af", "Houdt warmte vast", "Houdt water vast", "Verwijdert zuur"]', 1, 'Correct: Houdt warmte vast'),
  ('productie-port', 'klimaat-en-terroir', 4, 'Wat is terroir?', '["Alleen klimaat", "Combinatie van omgeving", "Alleen bodem", "Alleen druif"]', 1, 'Correct: Combinatie van omgeving'),
  ('productie-port', 'klimaat-en-terroir', 5, 'Stress zorgt voor:', '["Minder smaak", "Meer concentratie", "Minder kleur", "Minder alcohol"]', 1, 'Correct: Meer concentratie'),
  ('productie-port', 'houtlagering', 1, 'Wat doet houtlagering?', '["Meer zuur", "Meer complexiteit", "Minder smaak", "Minder alcohol"]', 1, 'Correct: Meer complexiteit'),
  ('productie-port', 'houtlagering', 2, 'Welke stijl rijpt langer?', '["Ruby", "Tawny", "White", "Rosé"]', 1, 'Correct: Tawny'),
  ('productie-port', 'houtlagering', 3, 'Wat gebeurt met tannines?', '["Harder", "Zachter", "Bitterder", "Sterker"]', 1, 'Correct: Zachter'),
  ('productie-port', 'houtlagering', 4, 'Wat ontstaat vaak?', '["Notige aroma’s", "Koolzuur", "Minder kleur", "Minder geur"]', 0, 'Correct: Notige aroma’s'),
  ('productie-port', 'houtlagering', 5, 'Ruby blijft vaak:', '["Ouder", "Fruitiger", "Notiger", "Droger"]', 1, 'Correct: Fruitiger'),
  ('productie-port', 'oxidatie-uitgelegd', 1, 'Wat is oxidatie?', '["Koeling", "Contact met zuurstof", "Distillatie", "Filteren"]', 1, 'Correct: Contact met zuurstof'),
  ('productie-port', 'oxidatie-uitgelegd', 2, 'Wat verandert?', '["Alleen alcohol", "Alleen kleur", "Kleur en smaak", "Alleen suiker"]', 2, 'Correct: Kleur en smaak'),
  ('productie-port', 'oxidatie-uitgelegd', 3, 'Welke stijl is oxidatief?', '["Ruby", "Tawny", "White", "Rosé"]', 1, 'Correct: Tawny'),
  ('productie-port', 'oxidatie-uitgelegd', 4, 'Welke aroma’s ontstaan vaak?', '["Citrus", "Noten", "Gras", "Bloemen"]', 1, 'Correct: Noten'),
  ('productie-port', 'oxidatie-uitgelegd', 5, 'Is oxidatie altijd fout?', '["Ja", "Nee", "Alleen bij Ruby", "Alleen bij White"]', 1, 'Correct: Nee'),
  ('proeven-port', 'proefnotitie-port', 1, 'Wat is de eerste stap bij professioneel proeven?', '["Ruiken", "Proeven", "Kijken", "Concluderen"]', 2, 'Correct: Kijken'),
  ('proeven-port', 'proefnotitie-port', 2, 'Wat kan viscositeit vaak aangeven?', '["Leeftijd", "Alcohol en suiker", "Herkomst", "Druivenras"]', 1, 'Correct: Alcohol en suiker'),
  ('proeven-port', 'proefnotitie-port', 3, 'Welke aroma’s passen het best bij Tawny Port?', '["Kers en braam", "Citrus en appel", "Walnoot en karamel", "Gras en limoen"]', 2, 'Correct: Walnoot en karamel'),
  ('proeven-port', 'proefnotitie-port', 4, 'Welke structuurcomponent geeft frisheid?', '["Zoetheid", "Alcohol", "Zuur", "Body"]', 2, 'Correct: Zuur'),
  ('proeven-port', 'proefnotitie-port', 5, 'Waarom maak je proefnotities?', '["Om sneller te drinken", "Om smaken beter te onthouden", "Om wijn warmer te maken", "Om alcohol te meten"]', 1, 'Correct: Om smaken beter te onthouden'),
  ('proeven-port', 'structuur-herkennen', 1, 'Wat is het skelet van Port?', '["Aroma", "Structuur", "Kleur", "Leeftijd"]', 1, 'Correct: Structuur'),
  ('proeven-port', 'structuur-herkennen', 2, 'Wat zorgt vooral voor frisheid?', '["Zoetheid", "Alcohol", "Zuur", "Body"]', 2, 'Correct: Zuur'),
  ('proeven-port', 'structuur-herkennen', 3, 'Waar voel je tannines vaak?', '["Tong", "Lippen", "Tandvlees", "Neus"]', 2, 'Correct: Tandvlees'),
  ('proeven-port', 'structuur-herkennen', 4, 'Wat is body?', '["Alcoholpercentage", "Gewicht in de mond", "Zoetheid", "Kleur"]', 1, 'Correct: Gewicht in de mond'),
  ('proeven-port', 'structuur-herkennen', 5, 'Wat bepaalt uiteindelijk kwaliteit?', '["Leeftijd", "Alcohol", "Balans", "Druif"]', 2, 'Correct: Balans'),
  ('proeven-port', 'aromas-herkennen', 1, 'Welke aroma’s komen direct van de druif?', '["Secundair", "Tertiair", "Primair", "Oxidatief"]', 2, 'Correct: Primair'),
  ('proeven-port', 'aromas-herkennen', 2, 'Welke stijl heeft meestal de meeste fruitaroma’s?', '["Tawny", "Ruby", "White", "Colheita"]', 1, 'Correct: Ruby'),
  ('proeven-port', 'aromas-herkennen', 3, 'Welke aroma’s passen bij Tawny?', '["Braam en kers", "Walnoot en karamel", "Citrus en limoen", "Appel en peer"]', 1, 'Correct: Walnoot en karamel'),
  ('proeven-port', 'aromas-herkennen', 4, 'Wat zijn tertiaire aroma’s?', '["Aroma’s uit rijping", "Aroma’s uit druiven", "Aroma’s uit alcohol", "Aroma’s uit temperatuur"]', 0, 'Correct: Aroma’s uit rijping'),
  ('proeven-port', 'aromas-herkennen', 5, 'Waarom is aroma-training belangrijk?', '["Voor meer alcohol", "Voor betere blindherkenning", "Voor lagere suiker", "Voor langere rijping"]', 1, 'Correct: Voor betere blindherkenning'),
  ('proeven-port', 'ruby-vs-tawny-blind', 1, 'Welke kleur past meestal bij Ruby?', '["Amber", "Diep rood", "Goud", "Oranje"]', 1, 'Correct: Diep rood'),
  ('proeven-port', 'ruby-vs-tawny-blind', 2, 'Welke aroma’s passen vaak bij Tawny?', '["Kers en braam", "Walnoot en karamel", "Citrus en appel", "Bloemen en gras"]', 1, 'Correct: Walnoot en karamel'),
  ('proeven-port', 'ruby-vs-tawny-blind', 3, 'Welke stijl heeft meestal stevigere tannines?', '["Tawny", "Ruby", "White", "Colheita"]', 1, 'Correct: Ruby'),
  ('proeven-port', 'ruby-vs-tawny-blind', 4, 'Welke stijl is meer oxidatief?', '["Ruby", "Tawny", "White", "Rosé"]', 1, 'Correct: Tawny'),
  ('proeven-port', 'ruby-vs-tawny-blind', 5, 'Waarom is blindproeven belangrijk?', '["Voor sneller drinken", "Voor objectieve herkenning", "Voor meer alcohol", "Voor goedkopere wijn"]', 1, 'Correct: Voor objectieve herkenning'),
  ('proeven-port', 'mini-toets-port-proeven', 1, 'Wat is de eerste stap bij proeven?', '["Ruiken", "Proeven", "Kijken", "Schrijven"]', 2, 'Correct: Kijken'),
  ('proeven-port', 'mini-toets-port-proeven', 2, 'Welke structuurcomponent zorgt voor frisheid?', '["Zoetheid", "Alcohol", "Zuur", "Body"]', 2, 'Correct: Zuur'),
  ('proeven-port', 'mini-toets-port-proeven', 3, 'Welke aroma’s wijzen meestal op Tawny?', '["Kers en braam", "Walnoot en karamel", "Citrus en appel", "Framboos en aardbei"]', 1, 'Correct: Walnoot en karamel'),
  ('proeven-port', 'mini-toets-port-proeven', 4, 'Welke stijl is meestal fruitiger?', '["Tawny", "Ruby", "White", "Colheita"]', 1, 'Correct: Ruby'),
  ('proeven-port', 'mini-toets-port-proeven', 5, 'Waarom is proeftraining belangrijk?', '["Om sneller te drinken", "Om patronen sneller te herkennen", "Om alcohol te verlagen", "Om wijn te bewaren"]', 1, 'Correct: Om patronen sneller te herkennen'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 1, 'Uit welk land komt Port?', '["Spanje", "Italië", "Portugal", "Frankrijk"]', 2, 'Correct: Portugal'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 2, 'Uit welke regio komt Port?', '["Rioja", "Douro", "Bordeaux", "Alentejo"]', 1, 'Correct: Douro'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 3, 'Waarom heet Port “Port”?', '["Door de druif", "Door de havenstad Porto", "Door de kleur", "Door de stijl"]', 1, 'Correct: Door de havenstad Porto'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 4, 'In welk jaar werd de Douro officieel beschermd?', '["1756", "1820", "1900", "1955"]', 0, 'Correct: 1756'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 5, 'Waarom is herkomst belangrijk?', '["Alleen voor de prijs", "Voor stijl en authenticiteit", "Alleen voor export", "Alleen voor belasting"]', 1, 'Correct: Voor stijl en authenticiteit'),
  ('oorsprong-port', 'druiven-van-port', 1, 'Wat is de belangrijkste druif van Port?', '["Merlot", "Touriga Nacional", "Cabernet Sauvignon", "Pinot Noir"]', 1, 'Correct: Touriga Nacional'),
  ('oorsprong-port', 'druiven-van-port', 2, 'Wat geeft Touriga Franca vooral?', '["Elegantie", "Meer alcohol", "Minder kleur", "Minder zuur"]', 0, 'Correct: Elegantie'),
  ('oorsprong-port', 'druiven-van-port', 3, 'Welke druif is internationaal bekend als Tempranillo?', '["Tinto Cão", "Tinta Roriz", "Touriga Franca", "Tinta Barroca"]', 1, 'Correct: Tinta Roriz'),
  ('oorsprong-port', 'druiven-van-port', 4, 'Waarom blenden wijnmakers?', '["Om minder smaak te krijgen", "Om meer balans te creëren", "Om minder alcohol te maken", "Om goedkoper te werken"]', 1, 'Correct: Om meer balans te creëren'),
  ('oorsprong-port', 'druiven-van-port', 5, 'Welke druif helpt vaak met frisheid en levensduur?', '["Tinto Cão", "Merlot", "Syrah", "Chardonnay"]', 0, 'Correct: Tinto Cão'),
  ('oorsprong-port', 'douro-vallei', 1, 'Hoeveel subregio’s heeft de Douro?', '["Twee", "Drie", "Vier", "Vijf"]', 1, 'Correct: Drie'),
  ('oorsprong-port', 'douro-vallei', 2, 'Welke regio staat bekend om topkwaliteit?', '["Baixo Corgo", "Cima Corgo", "Douro Superior", "Porto"]', 1, 'Correct: Cima Corgo'),
  ('oorsprong-port', 'douro-vallei', 3, 'Welke regio is meestal koeler en natter?', '["Douro Superior", "Baixo Corgo", "Cima Corgo", "Porto"]', 1, 'Correct: Baixo Corgo'),
  ('oorsprong-port', 'douro-vallei', 4, 'Waarom worden terrassen gebruikt?', '["Voor meer alcohol", "Voor erosiebeheersing en betere wijnbouw", "Voor sneller oogsten", "Voor meer regen"]', 1, 'Correct: Voor erosiebeheersing en betere wijnbouw'),
  ('oorsprong-port', 'douro-vallei', 5, 'Waarom is de Douro UNESCO-erfgoed?', '["Door de rivier", "Door de stad Porto", "Door het unieke wijnlandschap", "Door de druiven"]', 2, 'Correct: Door het unieke wijnlandschap'),
  ('oorsprong-port', 'klimaat-en-terroir', 1, 'Wat betekent terroir?', '["Alleen bodem", "Alleen klimaat", "Combinatie van natuurlijke factoren", "Alleen druiven"]', 2, 'Correct: Combinatie van natuurlijke factoren'),
  ('oorsprong-port', 'klimaat-en-terroir', 2, 'Hoe is het klimaat in de Douro meestal?', '["Koud en nat", "Warm en droog", "Mild en vochtig", "Tropisch"]', 1, 'Correct: Warm en droog'),
  ('oorsprong-port', 'klimaat-en-terroir', 3, 'Wat is de belangrijkste bodemsoort in de Douro?', '["Kalk", "Klei", "Leisteen", "Zand"]', 2, 'Correct: Leisteen'),
  ('oorsprong-port', 'klimaat-en-terroir', 4, 'Waarom is leisteen belangrijk?', '["Het koelt af", "Het houdt warmte vast", "Het maakt wijn zoeter", "Het verlaagt alcohol"]', 1, 'Correct: Het houdt warmte vast'),
  ('oorsprong-port', 'klimaat-en-terroir', 5, 'Wat helpt om zuur te behouden?', '["Warme nachten", "Koele nachten", "Meer regen", "Meer alcohol"]', 1, 'Correct: Koele nachten'),
  ('oorsprong-port', 'classificatie-douro', 1, 'Welke classificatie gebruikt de Douro?', '["1–10", "A–F", "I–V", "Gold–Silver"]', 1, 'Correct: A–F'),
  ('oorsprong-port', 'classificatie-douro', 2, 'Wat is de hoogste classificatie?', '["B", "C", "A", "F"]', 2, 'Correct: A'),
  ('oorsprong-port', 'classificatie-douro', 3, 'Wat verhoogt vaak kwaliteit?', '["Hoge opbrengsten", "Lage opbrengsten", "Meer regen", "Meer alcohol"]', 1, 'Correct: Lage opbrengsten'),
  ('oorsprong-port', 'classificatie-douro', 4, 'Wat is een Quinta?', '["Een druif", "Een wijndomein", "Een vat", "Een gistsoort"]', 1, 'Correct: Een wijndomein'),
  ('oorsprong-port', 'classificatie-douro', 5, 'Waarom is classificatie belangrijk?', '["Alleen voor export", "Voor kwaliteit en waarde", "Alleen voor belasting", "Alleen voor opslag"]', 1, 'Correct: Voor kwaliteit en waarde'),
  ('portstijlen', 'ruby-port', 1, 'Waarom heet Ruby Port Ruby?', '["Door de fles", "Door de kleur", "Door de druif", "Door de regio"]', 1, 'Correct: Door de kleur'),
  ('portstijlen', 'ruby-port', 2, 'Hoe lang rijpt Ruby meestal?', '["2–3 jaar", "10 jaar", "20 jaar", "30 jaar"]', 0, 'Correct: 2–3 jaar'),
  ('portstijlen', 'ruby-port', 3, 'Waarom grote vaten?', '["Meer oxidatie", "Minder oxidatie", "Meer alcohol", "Meer suiker"]', 1, 'Correct: Minder oxidatie'),
  ('portstijlen', 'ruby-port', 4, 'Welke aroma’s passen bij Ruby?', '["Noten en karamel", "Kers en braam", "Citrus en appel", "Honing en amandel"]', 1, 'Correct: Kers en braam'),
  ('portstijlen', 'ruby-port', 5, 'Wat past goed bij Ruby?', '["Oesters", "Chocolade", "Sushi", "Salade"]', 1, 'Correct: Chocolade'),
  ('portstijlen', 'tawny-port', 1, 'Waar rijpt Tawny meestal?', '["Fles", "Klein houten vat", "Beton", "RVS"]', 1, 'Correct: Klein houten vat'),
  ('portstijlen', 'tawny-port', 2, 'Wat veroorzaakt de lichtere kleur?', '["Meer suiker", "Oxidatie", "Minder alcohol", "Minder druiven"]', 1, 'Correct: Oxidatie'),
  ('portstijlen', 'tawny-port', 3, 'Welke aroma’s passen bij Tawny?', '["Kers en braam", "Walnoten en karamel", "Citrus en appel", "Framboos en aardbei"]', 1, 'Correct: Walnoten en karamel'),
  ('portstijlen', 'tawny-port', 4, 'Wat betekent 20 years op Tawny?', '["Exact 20 jaar oud", "Gemiddelde stijl/leeftijd", "Alleen oogstjaar", "Botteldatum"]', 1, 'Correct: Gemiddelde stijl/leeftijd'),
  ('portstijlen', 'tawny-port', 5, 'Hoe lang blijft Tawny vaak goed na opening?', '["2 dagen", "1 week", "4–8 weken", "6 maanden"]', 2, 'Correct: 4–8 weken'),
  ('portstijlen', 'late-bottled-vintage', 1, 'Waaruit wordt LBV gemaakt?', '["Meerdere jaren", "Eén oogstjaar", "Alleen witte druiven", "Alleen Tawny"]', 1, 'Correct: Eén oogstjaar'),
  ('portstijlen', 'late-bottled-vintage', 2, 'Hoe lang rijpt LBV meestal op vat?', '["1–2 jaar", "2–3 jaar", "4–6 jaar", "10 jaar"]', 2, 'Correct: 4–6 jaar'),
  ('portstijlen', 'late-bottled-vintage', 3, 'Wat is vaak het voordeel van gefilterde LBV?', '["Meer depot", "Direct drinkbaar", "Meer zuur", "Meer oxidatie"]', 1, 'Correct: Direct drinkbaar'),
  ('portstijlen', 'late-bottled-vintage', 4, 'Wat is vaak het voordeel van ongefilterde LBV?', '["Minder complex", "Meer complexiteit", "Kortere houdbaarheid", "Minder fruit"]', 1, 'Correct: Meer complexiteit'),
  ('portstijlen', 'late-bottled-vintage', 5, 'Waarin lijkt LBV het meest op?', '["White Port", "Vintage Port", "Rosé Port", "Tawny 40 years"]', 1, 'Correct: Vintage Port'),
  ('portstijlen', 'white-port', 1, 'Waarvan wordt White Port gemaakt?', '["Rode druiven", "Witte druiven", "Rosé druiven", "Blend van rood en wit"]', 1, 'Correct: Witte druiven'),
  ('portstijlen', 'white-port', 2, 'Welke stijl kan White Port zijn?', '["Alleen zoet", "Alleen droog", "Droog tot zoet", "Alleen oxidatief"]', 2, 'Correct: Droog tot zoet'),
  ('portstijlen', 'white-port', 3, 'Welke aroma’s passen vaak bij White Port?', '["Kers en braam", "Citrus en amandel", "Walnoot en karamel", "Koffie en cacao"]', 1, 'Correct: Citrus en amandel'),
  ('portstijlen', 'white-port', 4, 'Wat is een populaire serveerstijl?', '["White Port & Cola", "White Port & Tonic", "White Port & Bier", "White Port & Soda"]', 1, 'Correct: White Port & Tonic'),
  ('portstijlen', 'white-port', 5, 'Wanneer wordt White Port vaak gedronken?', '["Als aperitief", "Alleen na diner", "Alleen bij kaas", "Alleen bij dessert"]', 0, 'Correct: Als aperitief'),
  ('portstijlen', 'rose-port', 1, 'Waarvan wordt Rosé Port gemaakt?', '["Witte druiven", "Blauwe druiven", "Alleen blend van wit en rood", "Alleen Tawny"]', 1, 'Correct: Blauwe druiven'),
  ('portstijlen', 'rose-port', 2, 'Waarom is Rosé lichter van kleur?', '["Meer alcohol", "Minder schilcontact", "Meer suiker", "Meer zuur"]', 1, 'Correct: Minder schilcontact'),
  ('portstijlen', 'rose-port', 3, 'Welke aroma’s passen vaak bij Rosé Port?', '["Walnoten en karamel", "Aardbei en framboos", "Vijgen en toffee", "Koffie en cacao"]', 1, 'Correct: Aardbei en framboos'),
  ('portstijlen', 'rose-port', 4, 'Waar wordt Rosé Port vaak voor gebruikt?', '["Alleen dessert", "Cocktails", "Alleen rijping", "Alleen blindproeven"]', 1, 'Correct: Cocktails'),
  ('portstijlen', 'rose-port', 5, 'Sinds wanneer is Rosé Port commercieel erkend?', '["1756", "1900", "2008", "2020"]', 2, 'Correct: 2008'),
  ('portstijlen', 'crusted-port', 1, 'Waaruit bestaat Crusted Port?', '["Eén oogstjaar", "Meerdere oogstjaren", "Alleen witte druiven", "Alleen Tawny"]', 1, 'Correct: Meerdere oogstjaren'),
  ('portstijlen', 'crusted-port', 2, 'Waarom heet het Crusted?', '["Door de kleur", "Door het depot in de fles", "Door de flesvorm", "Door de druif"]', 1, 'Correct: Door het depot in de fles'),
  ('portstijlen', 'crusted-port', 3, 'Moet Crusted meestal worden gedecanteerd?', '["Nee", "Ja", "Alleen gekoeld", "Alleen oud"]', 1, 'Correct: Ja'),
  ('portstijlen', 'crusted-port', 4, 'Waarin lijkt Crusted het meest op?', '["White Port", "Vintage Port", "Rosé Port", "Tawny"]', 1, 'Correct: Vintage Port'),
  ('portstijlen', 'crusted-port', 5, 'Waarom is Crusted populair?', '["Goedkoper en complex", "Minder alcohol", "Geen depot", "Meer suiker"]', 0, 'Correct: Goedkoper en complex'),
  ('portstijlen-verdiept', 'vintage-port-deel-1', 1, 'Waaruit wordt Vintage Port gemaakt?', '["Meerdere jaren", "Eén oogstjaar", "Alleen witte druiven", "Alleen Tawny"]', 1, 'Correct: Eén oogstjaar'),
  ('portstijlen-verdiept', 'vintage-port-deel-1', 2, 'Wordt elk jaar Vintage gedeclareerd?', '["Ja", "Nee", "Alleen door één huis", "Alleen in Portugal"]', 1, 'Correct: Nee'),
  ('portstijlen-verdiept', 'vintage-port-deel-1', 3, 'Hoe lang rijpt Vintage meestal op vat?', '["2 jaar", "10 jaar", "20 jaar", "30 jaar"]', 0, 'Correct: 2 jaar'),
  ('portstijlen-verdiept', 'vintage-port-deel-1', 4, 'Waar rijpt Vintage vooral verder?', '["Vat", "Tank", "Fles", "Beton"]', 2, 'Correct: Fles'),
  ('portstijlen-verdiept', 'vintage-port-deel-1', 5, 'Waarom is Vintage zo bijzonder?', '["Altijd goedkoop", "Alleen witte druiven", "Alleen topjaren", "Geen alcohol"]', 2, 'Correct: Alleen topjaren'),
  ('portstijlen-verdiept', 'vintage-port-deel-2', 1, 'Waar rijpt Vintage vooral?', '["Tank", "Vat", "Fles", "Beton"]', 2, 'Correct: Fles'),
  ('portstijlen-verdiept', 'vintage-port-deel-2', 2, 'Waarom ontstaat depot?', '["Door filtering", "Door ongefilterde botteling", "Door suiker", "Door koeling"]', 1, 'Correct: Door ongefilterde botteling'),
  ('portstijlen-verdiept', 'vintage-port-deel-2', 3, 'Wat gebeurt er met tannines bij rijping?', '["Ze worden harder", "Ze verdwijnen direct", "Ze verzachten", "Ze worden zoeter"]', 2, 'Correct: Ze verzachten'),
  ('portstijlen-verdiept', 'vintage-port-deel-2', 4, 'Waarom stijgt Vintage vaak in waarde?', '["Meer alcohol", "Minder kleur", "Schaarste en rijping", "Lagere belasting"]', 2, 'Correct: Schaarste en rijping'),
  ('portstijlen-verdiept', 'vintage-port-deel-2', 5, 'Wat is vaak nodig voor service?', '["Koelen", "Decanteren", "Schudden", "Verdunnen"]', 1, 'Correct: Decanteren'),
  ('portstijlen-verdiept', 'single-quinta-vintage-port', 1, 'Waaruit bestaat Single Quinta Vintage?', '["Eén jaar, één Quinta", "Meerdere jaren", "Alleen Tawny", "Alleen White"]', 0, 'Correct: Eén jaar, één Quinta'),
  ('portstijlen-verdiept', 'single-quinta-vintage-port', 2, 'Wat is een Quinta?', '["Druif", "Wijndomein", "Vat", "Gist"]', 1, 'Correct: Wijndomein'),
  ('portstijlen-verdiept', 'single-quinta-vintage-port', 3, 'Waarom wordt Single Quinta vaak gemaakt?', '["In zwakke jaren", "In goede maar niet gedeclareerde jaren", "Alleen in topjaren", "Alleen in oude jaren"]', 1, 'Correct: In goede maar niet gedeclareerde jaren'),
  ('portstijlen-verdiept', 'single-quinta-vintage-port', 4, 'Wat is vaak het voordeel?', '["Meer terroir-expressie", "Minder smaak", "Minder structuur", "Minder alcohol"]', 0, 'Correct: Meer terroir-expressie'),
  ('portstijlen-verdiept', 'single-quinta-vintage-port', 5, 'Moet Single Quinta vaak worden gedecanteerd?', '["Nee", "Ja", "Alleen gekoeld", "Alleen jong"]', 1, 'Correct: Ja'),
  ('portstijlen-verdiept', 'tawny-met-leeftijd', 1, 'Wat betekent 20 Years op Tawny?', '["Exact 20 jaar oud", "Gemiddelde stijl/leeftijd", "Oogstjaar", "Botteldatum"]', 1, 'Correct: Gemiddelde stijl/leeftijd'),
  ('portstijlen-verdiept', 'tawny-met-leeftijd', 2, 'Waar rijpt Aged Tawny?', '["Fles", "Klein houten vat", "Tank", "Beton"]', 1, 'Correct: Klein houten vat'),
  ('portstijlen-verdiept', 'tawny-met-leeftijd', 3, 'Wat gebeurt er bij meer oxidatie?', '["Donkerder kleur", "Lichtere kleur", "Meer zuur", "Minder smaak"]', 1, 'Correct: Lichtere kleur'),
  ('portstijlen-verdiept', 'tawny-met-leeftijd', 4, 'Welke leeftijd is meestal complexer?', '["10 Years", "20 Years", "30 Years", "40 Years"]', 3, 'Correct: 40 Years'),
  ('portstijlen-verdiept', 'tawny-met-leeftijd', 5, 'Hoe lang blijft Aged Tawny vaak goed na opening?', '["2 dagen", "1 week", "Maanden", "1 dag"]', 2, 'Correct: Maanden'),
  ('port-premium', 'colheita-port', 1, 'Wat betekent Colheita?', '["Blend", "Oogst", "Vat", "Fles"]', 1, 'Correct: Oogst'),
  ('port-premium', 'colheita-port', 2, 'Waaruit bestaat Colheita?', '["Meerdere jaren", "Eén jaar", "Alleen witte druiven", "Alleen Ruby"]', 1, 'Correct: Eén jaar'),
  ('port-premium', 'colheita-port', 3, 'Hoe lang moet Colheita minimaal rijpen?', '["2 jaar", "5 jaar", "7 jaar", "10 jaar"]', 2, 'Correct: 7 jaar'),
  ('port-premium', 'colheita-port', 4, 'Waar rijpt Colheita vooral?', '["Fles", "Vat", "Tank", "Beton"]', 1, 'Correct: Vat'),
  ('port-premium', 'colheita-port', 5, 'Wat zie je vaak op het etiket?', '["Alleen botteljaar", "Oogstjaar en botteljaar", "Alleen alcoholpercentage", "Geen jaartal"]', 1, 'Correct: Oogstjaar en botteljaar'),
  ('port-premium', 'garrafeira-port', 1, 'Wat maakt Garrafeira uniek?', '["Alleen witte druiven", "Rijping op glas", "Alleen jonge stijl", "Geen rijping"]', 1, 'Correct: Rijping op glas'),
  ('port-premium', 'garrafeira-port', 2, 'Waar begint Garrafeira meestal mee?', '["Tawny", "Ruby-stijl uit één jaar", "White Port", "Rosé Port"]', 1, 'Correct: Ruby-stijl uit één jaar'),
  ('port-premium', 'garrafeira-port', 3, 'Wat zijn demijohns?', '["Kleine houten vaten", "Grote glazen flessen", "Tanks", "Kurken"]', 1, 'Correct: Grote glazen flessen'),
  ('port-premium', 'garrafeira-port', 4, 'Welke producent is beroemd om Garrafeira?', '["Graham’s", "Taylor’s", "Niepoort", "Fonseca"]', 2, 'Correct: Niepoort'),
  ('port-premium', 'garrafeira-port', 5, 'Waarom is Garrafeira zeldzaam?', '["Simpele productie", "Lange unieke rijping", "Lage alcohol", "Alleen witte druiven"]', 1, 'Correct: Lange unieke rijping'),
  ('praktijk-port', 'port-serveren', 1, 'Welke stijl serveer je meestal het warmst?', '["White", "Tawny", "Vintage", "Rosé"]', 2, 'Correct: Vintage'),
  ('praktijk-port', 'port-serveren', 2, 'Welke stijl blijft meestal het kortst goed na openen?', '["Vintage", "Tawny", "Colheita", "White"]', 0, 'Correct: Vintage'),
  ('praktijk-port', 'port-serveren', 3, 'Waarom gebruik je kleiner glas?', '["Minder wijn", "Minder alcoholimpact en meer focus", "Goedkoper", "Meer kleur"]', 1, 'Correct: Minder alcoholimpact en meer focus'),
  ('praktijk-port', 'port-serveren', 4, 'Welke stijl hoeft meestal NIET gedecanteerd te worden?', '["Vintage", "Crusted", "Tawny", "Ongefilterde LBV"]', 2, 'Correct: Tawny'),
  ('praktijk-port', 'port-serveren', 5, 'Waarom serveer je Tawny koeler dan Vintage?', '["Minder alcohol", "Meer oxidatie vraagt frisheid", "Meer suiker", "Minder kleur"]', 1, 'Correct: Meer oxidatie vraagt frisheid'),
  ('praktijk-port', 'port-en-kaas', 1, 'Welke pairing is de klassieker?', '["Rosé + Brie", "Vintage + Stilton", "White + Cheddar", "Ruby + Mozzarella"]', 1, 'Correct: Vintage + Stilton'),
  ('praktijk-port', 'port-en-kaas', 2, 'Waarom werkt zout goed met Port?', '["Minder smaak", "Versterkt zoetheid", "Verlaagt alcohol", "Minder vet"]', 1, 'Correct: Versterkt zoetheid'),
  ('praktijk-port', 'port-en-kaas', 3, 'Wat past vaak goed bij Aged Tawny?', '["Jonge geitenkaas", "Oude Gouda", "Mozzarella", "Feta"]', 1, 'Correct: Oude Gouda'),
  ('praktijk-port', 'port-en-kaas', 4, 'Waarom moet kaas op kamertemperatuur?', '["Mooier bord", "Meer aroma en textuur", "Minder zout", "Minder vet"]', 1, 'Correct: Meer aroma en textuur'),
  ('praktijk-port', 'port-en-kaas', 5, 'Welke stijl is vaak toegankelijk bij blauwe kaas?', '["White", "LBV", "Rosé", "Colheita"]', 1, 'Correct: LBV'),
  ('praktijk-port', 'port-en-desserts', 1, 'Wat is de gouden regel bij dessertpairing?', '["Dessert zoeter dan wijn", "Wijn even zoet of zoeter dan dessert", "Minder alcohol", "Meer zuur"]', 1, 'Correct: Wijn even zoet of zoeter dan dessert'),
  ('praktijk-port', 'port-en-desserts', 2, 'Wat past klassiek bij Ruby?', '["Citroentaart", "Pure chocolade", "Appeltaart", "Sorbet"]', 1, 'Correct: Pure chocolade'),
  ('praktijk-port', 'port-en-desserts', 3, 'Wat past vaak goed bij Tawny?', '["Karamel desserts", "Mint", "Sorbet", "Yoghurt"]', 0, 'Correct: Karamel desserts'),
  ('praktijk-port', 'port-en-desserts', 4, 'Welke stijl past vaak goed bij citroen?', '["White Port", "Vintage", "Crusted", "Colheita"]', 0, 'Correct: White Port'),
  ('praktijk-port', 'port-en-desserts', 5, 'Waarom zijn mintdesserts lastig?', '["Te zout", "Verstoren balans", "Te vet", "Te warm"]', 1, 'Correct: Verstoren balans'),
  ('praktijk-port', 'port-in-gastronomie', 1, 'Welke stijl is vaak ideaal voor aperitief?', '["Vintage", "White Port", "Crusted", "Garrafeira"]', 1, 'Correct: White Port'),
  ('praktijk-port', 'port-in-gastronomie', 2, 'Welke stijl wordt vaak gebruikt voor reducties?', '["Ruby / LBV", "White", "Vintage", "Rosé"]', 0, 'Correct: Ruby / LBV'),
  ('praktijk-port', 'port-in-gastronomie', 3, 'Welke stijl werkt sterk in karameldesserts?', '["Tawny", "Rosé", "White", "Ruby"]', 0, 'Correct: Tawny'),
  ('praktijk-port', 'port-in-gastronomie', 4, 'Waarom is Vintage zelden kook-Port?', '["Te weinig smaak", "Te kostbaar en te complex", "Te licht", "Te zuur"]', 1, 'Correct: Te kostbaar en te complex'),
  ('praktijk-port', 'port-in-gastronomie', 5, 'Waar blinkt Port traditioneel het meest in uit?', '["Ontbijt", "Kaasgang", "Soep", "Salades"]', 1, 'Correct: Kaasgang'),
  ('examen-port', 'blindproeven-ruby-vs-tawny', 1, 'Welke kleur hoort vaker bij Ruby?', '["Amber", "Robijnrood", "Oranje", "Geel"]', 1, 'Correct: Robijnrood'),
  ('examen-port', 'blindproeven-ruby-vs-tawny', 2, 'Welke aroma’s passen bij Tawny?', '["Kers en braam", "Walnoot en karamel", "Citrus en appel", "Framboos"]', 1, 'Correct: Walnoot en karamel'),
  ('examen-port', 'blindproeven-ruby-vs-tawny', 3, 'Welke stijl is oxidatiever?', '["Ruby", "Tawny", "Rosé", "White"]', 1, 'Correct: Tawny'),
  ('examen-port', 'blindproeven-ruby-vs-tawny', 4, 'Waar kijk je eerst naar?', '["Smaak", "Kleur", "Alcohol", "Etiket"]', 1, 'Correct: Kleur'),
  ('examen-port', 'blindproeven-ruby-vs-tawny', 5, 'Wat is vaak krachtiger?', '["Tawny", "Ruby", "White", "Colheita"]', 1, 'Correct: Ruby'),
  ('examen-port', 'blindproeven-vintage-vs-lbv', 1, 'Welke stijl rijpt langer op vat?', '["Vintage", "LBV", "Crusted", "Ruby"]', 1, 'Correct: LBV'),
  ('examen-port', 'blindproeven-vintage-vs-lbv', 2, 'Welke stijl heeft meestal meer tannines?', '["Tawny", "Vintage", "White", "Rosé"]', 1, 'Correct: Vintage'),
  ('examen-port', 'blindproeven-vintage-vs-lbv', 3, 'Welke stijl is vaak direct toegankelijker?', '["Vintage", "LBV", "Single Quinta", "Crusted"]', 1, 'Correct: LBV'),
  ('examen-port', 'blindproeven-vintage-vs-lbv', 4, 'Wat is vaak de sleutel in blindproeven?', '["Alcohol", "Structuur en spanning", "Zoetheid", "Kleur alleen"]', 1, 'Correct: Structuur en spanning'),
  ('examen-port', 'blindproeven-vintage-vs-lbv', 5, 'Welke stijl heeft vaak meer bewaarpotentieel?', '["LBV", "Vintage", "White", "Rosé"]', 1, 'Correct: Vintage'),
  ('examen-port', 'praktijkexamen-port', 1, 'Wat beoordeel je als eerste?', '["Smaak", "Geur", "Kleur", "Alcohol"]', 2, 'Correct: Kleur'),
  ('examen-port', 'praktijkexamen-port', 2, 'Wat hoort NIET bij de analyse?', '["Pairing", "Glaswerk", "Flesprijs", "Structuur"]', 2, 'Correct: Flesprijs'),
  ('examen-port', 'praktijkexamen-port', 3, 'Waarom is onderbouwing belangrijk?', '["Voor lengte", "Voor logica en vakkennis", "Alleen voor punten", "Voor snelheid"]', 1, 'Correct: Voor logica en vakkennis'),
  ('examen-port', 'praktijkexamen-port', 4, 'Welke stijl past vaak bij Stilton?', '["White", "Vintage", "Rosé", "Ruby"]', 1, 'Correct: Vintage'),
  ('examen-port', 'praktijkexamen-port', 5, 'Wat is het doel van dit examen?', '["Alleen theorie", "Integratie van alles", "Alleen proeven", "Alleen service"]', 1, 'Correct: Integratie van alles')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
