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
    'Na deze les kun jij uitleggen wat bier 0.0 is, wanneer het juridisch 0.0 heet en waarom de categorie in foodservice snel groeit.
',
    'Bier 0.0 is gebrouwen bier waarin alcohol bewust wordt beperkt of verwijderd, zodat mout-hop-giststructuur behouden blijft. In Nederland geldt maximaal 0,1% alcohol voor het label alcoholvrij. Andere EU-landen hanteren grenzen tussen 0,5% en 1,2%. Het label 0.0 verwijst in de praktijk naar afgerond 0,00%.

Professioneel adviseer je 0.0 wanneer gasten bierbeleving willen zonder alcohol: lunch, werk, rijden, sport of sociale context. De categorie groeit omdat assortimenten uitbreiden en kwaliteit steeds minder compromis hoeft te zijn — niet omdat 0.0 automatisch ''gezonder'' is.


## Food pairing

### Beste pairing

Gezouten pretzels, lichte borrelhapjes en milde kaas.

### Waarom dit werkt

Koolzuur lift zout; lichte bitterbalans snijdt door vet; minimale restzoetheid voorkomt dat zout het bier uitdroogt.

### Vermijd

Zoete desserts zonder zuurcomponent — instap-0.0 verliest spanning.

## Pro insight

Start alcohol-switch-gesprekken met moment, niet met percentage: ''Wilt u fris en herkenbaar bier zonder alcohol?'' Dat verlaagt stigma en opent stijlkeuze sneller dan technische uitleg.',
    '- 0.0-regelgeving
- de-alcoholisatie
- fermentatie
- alcohol-switching
- proefstructuur
',
    'Heineken 0.0 was één van de eerste alcoholvrije bieren die wereldwijd echt succesvol werd.
',
    '- In Nederland geldt maximaal 0,1% alcohol voor het label alcoholvrij; andere EU-landen hanteren grenzen tussen 0,5% en 1,2%
- Het label 0.0 verwijst in de praktijk naar afgerond 0,00%
- Het product blijft gebrouwen bier met gecontroleerde alcoholverwijdering
- Groei komt uit moment, gewoonte en professionele assortimentsuitbreiding
',
    '### Opdracht

Bekijk drie alcoholvrije bieren online of in een winkel.

### Checklist

- Ik heb drie labels bekeken
- Ik heb het alcoholpercentage gevonden
- Ik heb de bierstijl herkend


### Reflectievraag

Een gast vraagt of 0.0 ''echt bier'' is. Welke twee zinnen gebruik je om vertrouwen te geven zonder te technisch te worden?',
    8,
    1
  ),
  (
    'hoe-wordt-alcohol-verwijderd',
    'Hoe wordt alcohol verwijderd?',
    'Na deze les kun jij de drie kernmethoden voor de-alcoholisatie benoemen en per methode één smaakgevolg formuleren.
',
    'De-alcoholisatie bepaalt direct restsuiker, mondgevoel en aromatische intensiteit. Drie routes domineren:

- gestopte fermentatie: minder alcohol door vroeg stoppen, vaak meer restsuiker
- vacuümdestillatie: alcohol verdampt onder verlaagde druk; aroma is kwetsbaar
- reverse osmosis: filtratie scheidt alcohol; recombinatie bepaalt de finale balans

In advies vertaal je methode naar proefsignaal: zoete instap wijst vaker op vroege stop, vlak aroma op warmte- of bewaarfout, frisse structuur op gecontroleerde filtratie.


## Food pairing

### Beste pairing

Technische proef met neutrale crackers en zeezout.

### Waarom dit werkt

Zout kalibreert bitterheid en restsuiker tussen samples; neutrale textuur toont productiemethode zonder gerechtmaskering.

### Vermijd

Proeven alleen op etiket zonder pairingcontext — bias vervuilt methode-inschatting.

## Pro insight

Bij zoete 0.0 op de kaart: noem productielogica in één zin (''rond door vroege fermentatiestop''). Gasten kopen transparantie sneller dan ''speciaal recept'' zonder proefanker.',
    '- gestopte fermentatie
- vacuümdestillatie
- reverse osmosis
- aroma-retentie
- restsuiker
',
    'Vacuümdestillatie wordt vaak gebruikt voor premium 0.0-bieren.
',
    '- Gestopte fermentatie, vacuümdestillatie en reverse osmosis zijn de kernroutes
- Elke route heeft andere gevolgen voor restsuiker, aroma en mondgevoel
- Productiekeuze bepaalt of een 0.0 premium of compromis aanvoelt
',
    '### Opdracht

Zoek uit welke methode jouw favoriete 0.0-bier gebruikt.

### Checklist

- Ik heb een merk gekozen
- Ik heb de methode opgezocht
- Ik begrijp het proces


### Reflectievraag

Je proeft twee 0.0-bieren met verschillende zoetheid. Welke productiemethode vermoed je eerst en waarom?',
    8,
    2
  ),
  (
    'waarom-is-bier-0-0-uniek',
    'Waarom is bier 0.0 uniek?',
    'Na deze les kun jij uitleggen waarom bier 0.0 smaaktechnisch dichter bij bier staat dan bij frisdrank of water.
',
    'Bier 0.0 onderscheidt zich doordat het bierlogica behoudt — bitterbalans, koolzuur, mout en hop — zonder alcoholwarmte als structuurdrager. Daardoor past het beter bij food pairing en momentkeuze dan frisdrank of water.

Functionele momenten zijn divers: sport en lunch vragen frisheid en drinkbaarheid; werk en rijcontext vragen discrete presentatie; sociale settings vragen herkenbare stijl zonder stigma. Het proefrisico zit in bodyverlies: zonder alcohol moet mondgevoel en lengte uit mout, restsuiker en koolzuur komen.


## Food pairing

### Beste pairing

Lunchsalade met licht vinaigrette en gegrilde kip.

### Waarom dit werkt

Frisheid en bitterbalans snijden door vet; koolzuur reset zout; alcohol-switching blijft gastronomisch logisch.

### Vermijd

Zware stoof zonder umami-brug — lichte 0.0 verliest structuur.

## Pro insight

Sport- en lunchmoment: positioneer 0.0 als sociaal en functioneel, niet als hersteldrank. Koppel frisheid aan gerecht of terras — dat voelt premium en vermijdt claimtaal.',
    '- smaakstructuur
- mondgevoel
- bitterbalans
- functioneel moment
- drinkbaarheid
',
    'Veel topsporters drinken alcoholvrij bier als herstelmoment.
',
    '- Bier 0.0 behoudt mout-hop-giststructuur beter dan simulatiefris
- Body en bitterbalans zijn de grootste kwaliteitsindicatoren
- De categorie vraagt om proefdiscipline, niet om etiketvergelijking
',
    '### Opdracht

Bedenk drie momenten waarop jij bier 0.0 zou drinken.

### Checklist

- Ik heb drie momenten bedacht
- Ik heb uitgelegd waarom
- Ik heb een stijl gekozen


### Reflectievraag

Waarom is body bij 0.0 een betere kwaliteitsindicator dan alleen frisheid of koolzuur?',
    8,
    3
  ),
  (
    'geschiedenis-van-alcoholvrij-bier',
    'Geschiedenis van alcoholvrij bier',
    'Na deze les kun jij de belangrijkste mijlpalen in alcoholvrij bier plaatsen en vertalen naar hedendaagse gastverwachting.
',
    'Alcoholvrij bier is geen nieuw fenomeen, maar technologische evolutie maakte smaakbehoud schaalbaar. Waar vroeg 0.0 vooral compromis was, verwachten gasten nu premiumpositionering en stijlherkenning.

Voor foodservice betekent dat: 0.0 hoort in het assortiment als volwaardige categorie met pils, IPA en donker — niet als enkelvoudige ''alcoholvrije optie''. Marktsegmentatie volgt moment: instap, craft, premium en functioneel.


## Food pairing

### Beste pairing

Ambachtelijk brood, oude kaas licht en gezouten boter.

### Waarom dit werkt

Geroosterde tonen echoën mout; vet vraagt bitter-koolzuurspanning; umami vraagt body of hopstructuur.

### Vermijd

Ultra-lichte salade zonder zout — pairing levert weinig proefinformatie.

## Pro insight

Plaats 0.0 zichtbaar naast pils en IPA, niet onderaan. Marktsegmentatie op de kaart traint team en gast in stijl denken vóór merk denken.',
    '- technologische evolutie
- gastverwachting
- marktsegmentatie
- premiumpositionering
- kwaliteitsnorm
',
    'Nederland behoort tot de grootste alcoholvrije biermarkten van Europa.
',
    '- Alcoholvrij bier is geen trend van gisteren maar een hernieuwde categorie
- Technologische vooruitgang maakte smaakbehoud houdbaar
- Gasten verwachten nu kwaliteit, niet alleen afwezigheid van alcohol
',
    '### Opdracht

Zoek drie bekende 0.0-merken.

### Checklist

- Ik heb drie merken gevonden
- Ik herken het type bier
- Ik ken het land van herkomst


### Reflectievraag

Welke historische ontwikkeling verklaart dat gasten nu wél premium 0.0 verwachten?',
    8,
    4
  ),
  (
    'belangrijkste-categorieen',
    'Belangrijkste categorieën',
    'Na deze les kun jij de vijf hoofdcategorieën binnen bier 0.0 herkennen en koppelen aan serveermoment.
',
    'Het 0.0-spectrum wordt gelezen via vijf ankerstijlen:

- pils: dorstlessend, subtiele bitterbalans, kwaliteitstest
- IPA: hopgedreven, compenseert bodyverlies
- witbier: kruidig-koolzuur, lunch en terras
- blond: brug tussen licht en rond
- donker: moutdiepte, umami en kouder weer

Adviseren start bij moment en gerecht, niet bij ''alcoholvrij'' als label. Stijlkeuze voorkomt generiek advies en opent upsell naar premium 0.0.


## Food pairing

### Beste pairing

Vijf mini-hapjes per stijl: pils met zout, wit met kruidig, IPA met pittig.

### Waarom dit werkt

Elke stijl test andere parameter: bitter-vet, kruid-koolzuur, hop-spice; stijlkeuze wordt adviseerbaar per moment.

### Vermijd

Eén generiek 0.0 bij alle hapjes — geen stijlcalibratie.

## Pro insight

Vraag bij twijfel: ''Licht en dorstlessend, of voller en gastronomisch?'' Die vraag verdeelt pils/wit versus blond/donker zonder vijftien merken te tonen.',
    '- stijlspectrum
- momentkeuze
- pils
- IPA
- stijladvies
',
    'IPA is momenteel de snelst groeiende 0.0-categorie.
',
    '- Pils, IPA, witbier, blond en donker vormen het stijlspectrum
- Elke stijl heeft eigen pairing- en servicevenster
- Categoriekennis voorkomt generiek ''alcoholvrij'' advies
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

Je moet snel een stijl kiezen voor een lichte lunch. Welke categorie kies je en op welke smaakparameter baseer je dat?',
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
    'Na deze les kun jij gestopte fermentatie uitleggen en het smaakprofiel koppelen aan restsuiker en mondgevoel.
',
    'Gestopte fermentatie beperkt alcohol door het gistingsproces vroegtijdig te stoppen, waardoor restsuiker hoger blijft en mondgevoel ronder kan aanvoelen. Dat is productie-efficiënt, maar vraagt bitterbalans om zoetheid drinkbaar te houden.

Herken je in proef opvallende zoetheid met lichte body, dan is deze route een logische hypothese. Adviseer instapgasten bewust: fris en toegankelijk, maar controleer of bitterheid de afdronk droog genoeg houdt.


## Food pairing

### Beste pairing

Jonge Goudse kaas en lichte appelstroop.

### Waarom dit werkt

restsuiker harmoniseert met milde zoetheid; koolzuur snijdt door vet; bitterbalans houdt het geheel drinkbaar.

### Vermijd

Zoet dessert bij opvallend zoete 0.0 — dubbele zoetheid zonder spanning.

## Pro insight

Instap-0.0 verkoopt op vertrouwen: serveer koud, schoon glas, korte uitleg over frisheid. Eerste slok bepaalt herbestelling meer dan merknaam.',
    '- gestopte fermentatie
- restsuiker
- mondgevoel
- zoetheidsprofiel
- instapsegment
',
    'Veel goedkope 0.0-bieren gebruiken deze techniek.
',
    '- Vroeg stoppen van fermentatie beperkt alcohol maar verhoogt restsuiker
- Zoetheid en mondgevoel zijn hier het snelste proefsignaal
- Methode past vaak bij lichtere, instapgerichte 0.0
',
    '### Opdracht

Vergelijk twee 0.0-bieren op zoetheid.

### Checklist

- Ik heb twee bieren gekozen
- Ik heb zoetheid geproefd
- Ik heb verschil genoteerd


### Reflectievraag

Je proeft een 0.0 met opvallende zoetheid en lichte body. Past gestopte fermentatie bij dit profiel — en hoe onderbouw je dat?',
    8,
    1
  ),
  (
    'vacuümdestillatie',
    'Vacuümdestillatie',
    'Na deze les kun jij vacuümdestillatie beschrijven en benoemen welk aroma-risico je proeft controleert.
',
    'Vacuümdestillatie verwijdert alcohol bij lagere temperatuur dan klassieke destillatie, maar hop- en esteraroma''s blijven kwetsbaar. Kwaliteit zit in aroma-retentie na de stap — niet alleen in het eindalcoholpercentage.

Bij aankoop en service: proef op aromatische intensiteit na opening. Vlakheid wijst vaker op proces- of bewaarfout dan op ''slechte stijl''. Premium 0.0 op deze route rechtvaardigt zich door hopprofiel dat intact blijft.


## Food pairing

### Beste pairing

Gegrilde groente en lichte hummus.

### Waarom dit werkt

aromatische intensiteit uit hop/mout ondersteunt gegrilde tonen; zuur in gerecht lift bieraroma; vet vraagt bittere afdronk.

### Vermijd

Vlak 0.0 bij umami-gerecht — aroma-retentieprobleem wordt zichtbaar.

## Pro insight

Vermijd ''alle 0.0 smaakt hetzelfde'' — gebruik aroma als differentiator. Eén zin over hop of mout opent upsell naar premium filtratie-route.',
    '- vacuümdestillatie
- aroma-retentie
- hopkwetsbaarheid
- temperatuurcontrole
- kwaliteitscontrole
',
    'Alcohol kookt sneller dan water.
',
    '- Alcohol verdampt onder verlaagde druk en temperatuur
- Hop- en esteraroma''s zijn kwetsbaar voor warmte-effecten
- Kwaliteit zit in hoeveel aroma na de stap behouden blijft
',
    '### Opdracht

Zoek drie premium 0.0-bieren op.

### Checklist

- Ik heb drie merken gevonden
- Ik heb productiemethode gezocht
- Ik heb verschillen genoteerd


### Reflectievraag

Welk aroma-element verlies je het eerst bij onzorgvuldige destillatie, en hoe merk je dat in service?',
    8,
    2
  ),
  (
    'reverse-osmosis',
    'Reverse osmosis',
    'Na deze les kun jij reverse osmosis positioneren als filtratieroute met specifieke balansgevolgen.
',
    'Reverse osmosis scheidt alcohol via filtratie voordat smaakcomponenten opnieuw worden samengevoegd. Daardoor kan het profiel frisser en aromatischer uitvallen dan bij gestopte fermentatie, mits recombinatie zorgvuldig gebeurt.

Adviseer deze route wanneer gasten voller aroma willen zonder zware zoetheid. Het proefsignaal is schone frisheid met gecontroleerde restsuiker — niet waterige dunheid.


## Food pairing

### Beste pairing

Ceviche en citrusmarinade.

### Waarom dit werkt

Frisse structuur echoët zuur in gerecht; koolzuur versterkt citrus; lichte restsuiker rondt zout af.

### Vermijd

Zware roomsaus zonder zuur — filtratie-frisheid botst.

## Pro insight

Craft-bewuste gasten: pitch filtratie-route als aromatische keuze. Koppel aan licht gerecht met zuur — dat voelt bewust en niet defensief alcoholvrij.',
    '- reverse osmosis
- filtratie
- recombinatie
- frisheidsprofiel
- aromatische intensiteit
',
    'Deze techniek wordt ook gebruikt in waterzuivering.
',
    '- Filtratie scheidt alcohol voordat smaak opnieuw samengevoegd wordt
- Controle over recombinatie bepaalt body en frisheid
- Technisch zwaarder maar potentieel aromatischer
',
    '### Opdracht

Zoek uit welk groot merk deze techniek gebruikt.

### Checklist

- Ik heb een merk gevonden
- Ik heb de techniek begrepen
- Ik kan het uitleggen


### Reflectievraag

Wanneer kies je reverse osmosis als verklaring voor een frisser, aromatischer profiel boven gestopte fermentatie?',
    8,
    3
  ),
  (
    'aroma-retentie',
    'Aroma-retentie',
    'Na deze les kun jij aroma-retentie beoordelen en benoemen welke productiestap het meest kritisch is.
',
    'Bij 0.0 is aromatische intensiteit vaak het eerste kwaliteitsverlies: alcohol droeg mede tot geurimpressie bij. Productie, licht, warmte en taprotatie versterken of vernietigen aroma na de-alcoholisatie.

In service controleer je versheid en temperatuur vóór je stijl uitlegt. Een vlak bier met intacte bitterbalans wijst op aroma-retentieprobleem, niet op ''te weinig hop'' alleen.


## Food pairing

### Beste pairing

Vers gesneden kruidenboter op brood.

### Waarom dit werkt

aromatische intensiteit in bier moet boteraroma dragen; zout activeert geur; mondgevoel toont bewaarkwaliteit.

### Vermijd

Lang openstaand 0.0 — oxidatie vernietigt pairingbrug.

## Pro insight

Taprotatie en lichtbescherming zijn upsell-beschermers: vlak 0.0 doodt premiumprijs sneller dan slechte reclame.',
    '- aroma-retentie
- esters
- hoparoma
- bewaring
- aromatische intensiteit
',
    'Veel consumenten herkennen aroma-verlies sneller dan smaakverlies.
',
    '- Aroma is bij 0.0 het eerste wat gasten missen bij kwaliteitsverlies
- Productie, bewaring en service versterken of vernietigen aroma
- Proef op intensiteit, niet alleen op herkenbare hop
',
    '### Opdracht

Ruik twee 0.0-bieren blind.

### Checklist

- Ik heb blind geroken
- Ik heb intensiteit vergeleken
- Ik heb verschil benoemd


### Reflectievraag

Beschrijf één product dat aroma sterk behoudt en één dat vlak ruikt: welke productiestap verschilt waarschijnlijk?',
    8,
    4
  ),
  (
    'balans-zonder-alcohol',
    'Balans zonder alcohol',
    'Na deze les kun jij balans zonder alcohol analyseren via zoetheid, bitterheid, koolzuur en lengte.
',
    'Zonder alcoholwarmte moet bitterbalans uit hop, mout en koolzuur komen; restsuiker mag rondheid geven maar niet plakkerig worden. Lengte en drinkbaarheid bepalen of een tweede glas logisch is.

Professioneel stuur je op drie assen: zoetheid versus bitterheid, mondgevoel versus frisheid, en afdronk versus uitputting. Dat is de productielogica die elke latere stijlmodule ondersteunt.


## Food pairing

### Beste pairing

Pittige noedels en zoetzure glazuur licht.

### Waarom dit werkt

Restzoetheid vangt spice; bitterbalans voorkomt plakkerigheid; koolzuur lift vet uit noedels.

### Vermijd

Ultra-droge pils bij zeer zoet gerecht — bitterheid zonder compensatie.

## Pro insight

Bij klacht ''te zoet'' of ''te waterig'': corrigeer op bitterbalans en mondgevoel, niet op merkwissel zonder proef.',
    '- bitterbalans
- restsuiker
- koolzuur
- lengte
- drinkbaarheid
',
    'Body is vaak het eerste wat ervaren proevers missen.
',
    '- Zonder alcohol moet balans uit mout, hop, koolzuur en textuur komen
- Te zoet of te dun eindigt sneller bij 0.0
- Lengte en bittere afdronk compenseren bodyverlies
',
    '### Opdracht

Proef een gewone pils en een 0.0 pils naast elkaar.

### Checklist

- Ik heb beide geproefd
- Ik heb body vergeleken
- Ik heb lengte vergeleken


### Reflectievraag

Welke parameter corrigeer je als eerste wanneer een 0.0 zoet maar waterig aanvoelt?',
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
    'Na deze les kun jij bier 0.0 systematisch proeven met een vaste volgorde van visueel, aroma en smaak.
',
    'Proef bier 0.0 in vaste volgorde: visueel (kleur, helderheid, schuim), aroma (mout, hop, fruit, kruiden), smaak (mondgevoel, restsuiker, bitterbalans, lengte). Bij 0.0 weegt mondgevoel zwaarder omdat alcoholwarmte ontbreekt.

Objectieve proefstructuur voorkomt merkbias en maakt alcohol-switching adviseerbaar: je beschrijft wat het glas doet, niet wat het etiket belooft.


## Food pairing

### Beste pairing

Blindproef met gezouten cracker.

### Waarom dit werkt

Zout kalibreert bitter en zoet tussen samples; neutrale textuur isoleert proefstructuur.

### Vermijd

Proeven met zichtbaar etiket — objectiviteit faalt.

## Pro insight

Train team op vaste proefvolgorde in shifts van twee minuten. Snelle structuur maakt alcohol-switching consistent tussen bediening en bar.',
    '- proefstructuur
- visuele analyse
- aroma-analyse
- mondgevoel
- objectiviteit
',
    'Veel professionele proevers herkennen 0.0 direct aan het mondgevoel.
',
    '- Visueel → aroma → smaak in vaste volgorde
- Body en balans zijn prioriteit bij 0.0
- Objectieve structuur verslaat merkvooroordeel
',
    '### Opdracht

Proef een alcoholvrij bier met deze structuur.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb body beoordeeld


### Reflectievraag

Welke observatie doe je ná de eerste slok die je niet uit het etiket haalt?',
    8,
    1
  ),
  (
    'body-analyseren',
    'body analyseren',
    'Na deze les kun jij body in 0.0 beoordelen via gewicht, textuur en restsuiker-zoetheid.
',
    'Body is gewicht en textuur op het palet — niet alcoholwarmte. Bij 0.0 wordt body opgebouwd via restsuiker, eiwitten, koolzuur en moutextract. Dun mondgevoel is het meest voorkomende kwaliteitsdefect.

In advies koppel je body aan moment: dorstlessend vraagt frisheid met voldoende structuur; gastronomisch vragen volmondigheid zonder zoete vermoeidheid.


## Food pairing

### Beste pairing

Romige soep en lichte stoof.

### Waarom dit werkt

Vol mondgevoel in bier balanceert textuur in gerecht; bitterbalans snijdt door vet; lengte houdt pairing drinkbaar.

### Vermijd

Waterig 0.0 bij romig gerecht — bodydefect wordt direct zichtbaar.

## Pro insight

Body is je eerste upsell-argument: ''Wilt u iets voller op het palet?'' werkt beter dan ''duurder merk'' zonder proef.',
    '- body
- textuur
- restsuiker
- eiwitten
- gewichtspalet
',
    'Body bepaalt vaak hoe “echt” bier aanvoelt.
',
    '- Body is gewicht en textuur, niet alcoholwarmte
- Restsuiker en eiwitten dragen body op
- Dunne body is het meest voorkomende 0.0-defect
',
    '### Opdracht

Vergelijk body van twee verschillende 0.0-bieren.

### Checklist

- Ik heb twee stijlen gekozen
- Ik heb body vergeleken
- Ik heb verschil benoemd


### Reflectievraag

Beschrijf het verschil tussen ''licht'' en ''dun'' in één professionele zin.',
    8,
    2
  ),
  (
    'zoetheid-herkennen',
    'Zoetheid herkennen',
    'Na deze les kun jij restsuiker en zoetheid herkennen zonder ze te verwarren met bitterheid of koolzuur.
',
    'Restsuiker bepaalt zoetheidsperceptie; koolzuur kan die tijdelijk maskeren. Noteer altijd of zoetheid rond, plakkerig of droog eindigt — dat onderscheidt productiemethode van serveerfout.

Voor pairing: restzoetheid vangt spice en umami; te veel vermoeit zonder alcoholbuffer. Adviseer drogere stijlen bij caloriebewuste gasten, niet generiek ''minder suiker'' zonder proef.


## Food pairing

### Beste pairing

Fruitige salade met honing-dressing licht.

### Waarom dit werkt

restsuiker mag harmonie geven maar moet door bitterbalans gedragen worden; zuur in fruit balanceert zoetheid.

### Vermijd

Zoet bier bij zoet dressing zonder bittere afdronk.

## Pro insight

Leg restsuiker uit als pairingparameter, niet als schuldgevoel. Professionele taal voorkomt defensieve reacties bij caloriebewuste gasten.',
    '- restsuiker
- zoetheidsperceptie
- koolzuurmaskering
- bitterbalans
- pairinglogica
',
    'Veel beginners verwarren body met zoetheid.
',
    '- Zoetheid komt uit restsuiker, niet uit marketing
- Koolzuur maskeert zoetheid tijdelijk
- Balans met bitterheid bepaalt drinkbaarheid
',
    '### Opdracht

Proef twee 0.0-bieren en beoordeel zoetheid.

### Checklist

- Ik heb geproefd
- Ik heb zoetheid herkend
- Ik heb balans beoordeeld


### Reflectievraag

Hoe herken je zoetheid als koolzuur het palet tijdelijk opscherpt?',
    8,
    3
  ),
  (
    'bitterheid-en-balans',
    'Bitterheid en balans',
    'Na deze les kun jij bitterbalans en lengte analyseren als compensatie voor afwezige alcoholwarmte.
',
    'Bitterbalans compenseert bodyverlies en houdt 0.0 drinkbaar. Hopbitterheid moet scherp maar niet uitdrogend zijn; lengte bepaalt of de afdronk uitnodigt tot een volgende slok.

Bij twijfel tussen twee 0.0''en: vergelijk bittere afdronk na tien seconden. Dat is het signaal dat gasten het meest bewust waarnemen in foodservice.


## Food pairing

### Beste pairing

IPA-achtige hopbitter bij spicy wings.

### Waarom dit werkt

Bitterheid temt capsaïcine; koolzuur reset vet; aromatische intensiteit verlengt afdronk.

### Vermijd

Te zoet 0.0 bij spice — geen bittere spanning.

## Pro insight

Bitterklachten bij 0.0: check temperatuur en stijl vóór je suiker adviseert. Te koud maskeert; verkeerde stijl maskeert geen productiefout.',
    '- bitterbalans
- hopbitterheid
- lengte
- afdronk
- drinkbaarheid
',
    'IPA 0.0 wordt vaak gebruikt om balans te testen.
',
    '- Bitterheid moet scherp maar niet uitdrogend zijn
- Lengte compenseert bodyverlies
- Afdronk bepaalt of een tweede slok logisch voelt
',
    '### Opdracht

Vergelijk een 0.0 pils en 0.0 IPA.

### Checklist

- Ik heb bitterheid beoordeeld
- Ik heb balans vergeleken
- Ik heb verschil benoemd


### Reflectievraag

Wanneer is bitterheid een kwaliteitsplus en wanneer een productiefout bij 0.0?',
    8,
    4
  ),
  (
    'mini-toets-0-0',
    'Mini-toets 0.0',
    'Na deze les kun jij de Explorer-basis integreren in een korte blindproef met onderbouwde stijlkeuze.
',
    'Deze mini-toets integreert productie, proefstructuur en bitterbalans. Blind proeven dwingt objectieve parameters en sluit de Explorer-fase af: je leest 0.0 als smaaksysteem, niet als afwezigheid van alcohol.

Vanaf module 4 vertaal je deze parameters naar stijl, pairing en premiumpositionering.


## Food pairing

### Beste pairing

Twee blind geproefde stijlen bij neutrale cracker.

### Waarom dit werkt

Integratie van productie- en proefparameters: mondgevoel, restsuiker, bitterbalans bepalen stijlhypothese.

### Vermijd

Blind zonder notatiestructuur — conclusies blijven willekeurig.

## Pro insight

Gebruik mini-toetsresultaten in teamoverleg: één gedeelde parameter (bijv. mondgevoel) per week verhoogt assortimentsdiscipline sneller dan losse proeverijen.',
    '- blindproeven
- stijlhypothese
- integratie
- mondgevoel
- bitterbalans
',
    '',
    '- Explorer combineert productie, proef en balans
- Blindproeven dwingt objectieve parameters
- Je bent klaar voor stijlspecialisatie
',
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

Welke parameter hielp je het snelst bij je laatste blindproef — en waarom?',
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
    'Na deze les kun jij alcoholvrije pils technisch beoordelen en adviseren op frisheid, bitterheid en drinkbaarheid.
',
    'Pils 0.0 is de puurste kwaliteitstest in de categorie: weinig moutmaskering, subtiele hop, hoge drinkbaarheid. Fouten in extract, bitterheid of koolzuur zijn direct zichtbaar.

Proef op lichte kleur, schone bittere afdronk, frisheid en mondgevoel zonder plakkerige restzoetheid. Een sterke 0.0-pils eindigt droog genoeg om door te drinken, maar niet zo uitgedroogd dat body verdwijnt.


## Food pairing

### Beste pairing

Gezouten pretzels, mosselen en jonge Goudse kaas.

### Waarom dit werkt

Koolzuur lift zout op het palet; lichte hopbitterheid snijdt door umami van schelpdieren; minimale restzoetheid voorkomt dat zout het bier uitdroogt.

### Vermijd

Zoete barbecuesaus of gefrituurde snacks met agressieve umami-glaze — die overheersen de subtiele pilsstructuur.

## Pro insight

Gasten die ''gewoon iets fris'' willen zonder discussie over alcohol: start met 0.0-pils op temperatuur en glas, niet met het sterkste IPA in het assortiment. Pils verkoopt vertrouwen; upsell volgt na de eerste positieve slok.',
    '- 0.0-pils
- frisheid
- bitterbalans
- drinkbaarheid
- kwaliteitsdiagnose
',
    'De meeste consumenten starten met alcoholvrij pils.
',
    '- Pils 0.0 is kwaliteitskritisch en weinig vergevingsgezind
- Frisheid en droge bittere afdronk zijn kern
- Servicefouten vallen hier het snelst op
',
    '### Opdracht

Proef twee verschillende 0.0 pilseners.

### Checklist

- Ik heb kleur bekeken
- Ik heb body beoordeeld
- Ik heb bitterheid beoordeeld


### Reflectievraag

Je serveert twee 0.0-pils: één waterig, één droog-bitter. Welke stuur je naar een gast die dorst wil lessen na sport?',
    8,
    1
  ),
  (
    'alcoholvrije-ipa',
    'Alcoholvrije IPA',
    'Na deze les kun jij alcoholvrije IPA herkennen op hopintensiteit, bitterbalans en aromatische compensatie van bodyverlies.
',
    'IPA 0.0 gebruikt hop om bodyverlies te compenseren: tropisch fruit, citrus, hars en bitterheid geven smaakgewicht. Het risico is een uit de hand lopende bitter-as zonder alcoholwarmte als buffer.

Beoordeel aromatische intensiteit, bittere lengte en of zoetheid de hop schraagt. Goede 0.0-IPA voelt completer dan pils, maar blijft drinkbaar in het tweede glas.


## Food pairing

### Beste pairing

Pittige kip, sharp cheddar en citrusmarinade.

### Waarom dit werkt

Hopbitterheid temt capsaïcine; aromatische citrusbrug harmoniseert met marinade; koolzuur reset vet en zout tussen happen.

### Vermijd

Zachte roomsaus zonder zuur of zout — IPA-bitter wordt dan scherp en eenzijdig.

## Pro insight

IPA 0.0 is je upsell voor hopbewuste gasten en alcohol-switchers die gewend zijn aan craft. Vraag naar pittig eten of eerdere IPA-voorkeur vóór je een pils aanbeveelt.',
    '- 0.0-IPA
- hopintensiteit
- bodycompensatie
- bitterrisico
- aromatische intensiteit
',
    'IPA is één van de snelst groeiende alcoholvrije stijlen.
',
    '- Hop compenseert bodyverlies
- Bitterbalans is het risico
- Aromatische intensiteit bepaalt premiumgevoel
',
    '### Opdracht

Vergelijk een 0.0 IPA met een 0.0 pils.

### Checklist

- Ik heb aroma vergeleken
- Ik heb bitterheid vergeleken
- Ik heb body vergeleken


### Reflectievraag

Wanneer adviseer je IPA 0.0 boven pils 0.0 bij hetzelfde gerecht — en welke pairingparameter maakt dat?',
    8,
    2
  ),
  (
    'alcoholvrije-witbieren',
    'Alcoholvrije witbieren',
    'Na deze les kun jij alcoholvrij witbier analyseren op kruidigheid, koolzuur en fris-zachte textuur.
',
    'Witbier 0.0 combineert lichte moutzoetheid met koriander, citruszeste en vaak hogere koolzuurspanning. Textuur is zachter; frisheid komt uit koolzuur én specerijen.

Let op of kruidigheid bot wordt na de-alcoholisatie en of body niet in waterigheid eindigt. Witbier 0.0 werkt gastronomisch bij lichte vetten en zilte componenten.


## Food pairing

### Beste pairing

Geitenkaas salade, lichte ceviche en witvis met kruidenboter.

### Waarom dit werkt

Koriander en citrus in het bier echoën het gerecht; koolzuur snijdt door vet van boter; lichte zoetheid harmoniseert met milde zuren.

### Vermijd

Zware stoof met donkere jus — witbier verliest frisheid en kruidig lift.

## Pro insight

Witbier 0.0 past bij lunch en terras: licht vet, zout en kruidig eten maken de stijl logisch. Positioneer het als gastronomische keuze, niet als ''kindvriendelijk bier''.',
    '- 0.0-witbier
- kruidigheid
- koolzuur
- textuur
- lunchpairing
',
    'Witbier is vaak één van de makkelijkst drinkbare 0.0-stijlen.
',
    '- Kruidigheid en koolzuur dragen frisheid
- Zachte textuur vraagt om lichte pairings
- Vet en zout maken de stijl logisch
',
    '### Opdracht

Proef een 0.0 witbier.

### Checklist

- Ik heb kruidigheid herkend
- Ik heb body beoordeeld
- Ik heb frisheid beoordeeld


### Reflectievraag

Welk witbier-defect herken je het eerst na de-alcoholisatie: vlakke kruiden of dunne body?',
    8,
    3
  ),
  (
    'alcoholvrije-blond',
    'Alcoholvrije blond',
    'Na deze les kun jij alcoholvrije blond positioneren op ronde moutzoetheid en toegankelijke bitterheid.
',
    'Blond 0.0 balanceert toegankelijke moutzoetheid met milde hopbitterheid en ronde textuur. Het is vaak de brug tussen pils en donkerder stijlen.

Proef op restsuiker versus drinkbaarheid: te zoet wordt snel vermoeiend zonder alcohol. Goede blond 0.0 heeft lengte en een schone, niet-plakkerige afdronk.


## Food pairing

### Beste pairing

Kip met kruiden, quiche en milde pasta met room.

### Waarom dit werkt

Ronde moutzoetheid harmoniseert met ei en room; milde bitterheid houdt het geheel drinkbaar; body vangt lichte vetten zonder zwaarte.

### Vermijd

Ultra-hoppy gerechten of agressief zure tomatasaus — blond 0.0 wordt dan te zacht.

## Pro insight

Blond 0.0 is de veilige middenweg in gemengde gezelschappen: herkenbaar zoet-rond zonder zware bitter. Ideaal wanneer gasten twijfelen tussen pils en donker.',
    '- 0.0-blond
- moutzoetheid
- brugstijl
- lengte
- toegankelijkheid
',
    'Veel Belgische brouwers kiezen blond als eerste premium 0.0-stijl.
',
    '- Ronde moutzoetheid met milde hop
- Brug tussen licht en donker
- Drinkbaarheid boven zoetheid
',
    '### Opdracht

Vergelijk een blond 0.0 met pils 0.0.

### Checklist

- Ik heb body vergeleken
- Ik heb zoetheid vergeleken
- Ik heb balans beoordeeld


### Reflectievraag

Een gast vindt pils te bitter maar donker te zwaar. Welke blond 0.0-parameter pitch je?',
    8,
    4
  ),
  (
    'alcoholvrije-donker',
    'Alcoholvrije donker',
    'Na deze les kun jij alcoholvrije donkere stijlen beoordelen op geroosterde mout, body en afdronk.
',
    'Donker 0.0 bouwt op geroosterde en karamelmout voor body, kleur en Maillard-achtige tonen. Hier kan bodyverlies deels worden opgevangen door moutstructuur.

Beoordeel bitterzoete balans, afdronk en of geroosterde tonen niet verbrand overkomen na de-alcoholisatie. Serveer iets warmer dan pils om aroma te openen.


## Food pairing

### Beste pairing

Stoofvlees licht, bruin brood, oude kaas en bitterballen.

### Waarom dit werkt

Geroosterde mout ondersteunt Maillard-tonen; restzoetheid vangt umami en zout; bittere afdronk balanceert vet van gefrituurd.

### Vermijd

Frisse citrusdesserts — donkere moutbotheid botst met zuur en maakt het bier zoet en zwaar.

## Pro insight

Donker 0.0 verkoopt beter bij kouder weer en herfstmenu''s. Koppel geroosterde mout aan stoof of kaas — dat voelt premium en rechtvaardigt hogere prijspunt dan instap-pils.',
    '- 0.0-donker
- geroosterde mout
- Maillard-brug
- mondgevoel
- umami
',
    'Donkere 0.0-bieren worden steeds populairder in food pairing.
',
    '- Geroosterde mout geeft body en diepte
- Warmer serveren opent aroma
- Umami en vet zijn natuurlijke partners
',
    '### Opdracht

Proef een donker 0.0-bier.

### Checklist

- Ik heb geroosterde tonen herkend
- Ik heb body beoordeeld
- Ik heb zoetheid beoordeeld


### Reflectievraag

Hoe verdedig je iets warmere serveertemperatuur voor donker 0.0 zonder dat het vlak wordt?',
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
    'Na deze les kun jij massamarkt 0.0 positioneren in assortiment en gastverwachting zonder kwaliteitsstigma.
',
    'Massamarkt 0.0 domineert volume door herkenbaarheid, distributie en consistentie. De professionele lezing: niet automatisch inferieur, wel vaak geoptimaliseerd op brede acceptatie en lage foutmarge in smaak.

Gebruik merkvertrouwen voor instap en alcohol-switch, maar proef blind voordat je premium claimt. Consistentie is hier het product — variatie is craft-territorium.


## Food pairing

### Beste pairing

Bitterballen, burger licht gezouten en borrelhapjes met mosterd.

### Waarom dit werkt

Massamarkt-0.0 met stabiele bitterbalans snijdt door vet van borrelhapjes; koolzuur lift zout; herkenbare smaak verlaagt drempel voor alcohol-switching zonder premiumclaim.
### Vermijd

Gerechten die premium umami en lange rijping vragen — dan ondersteunt instap-0.0 te weinig body.

## Pro insight

Zet massamarkt 0.0 op de kaart als betrouwbare instap naast frisdrank, niet verstopt achterin. Zichtbaarheid verhoogt alcohol-switch zonder dat je premium craft hoeft te pushen.',
    '- massamarkt
- consistentie
- instapsegment
- alcohol-switching
- assortimentslogica
',
    'Heineken 0.0 wordt in meer dan 100 landen verkocht.
',
    '- Volume en consistentie zijn het product
- Merk verlaagt drempel voor switchers
- Blind proeven blijft nodig
',
    '### Opdracht

Zoek vijf grote alcoholvrije merken.

### Checklist

- Ik heb vijf merken gevonden
- Ik ken het moederbedrijf
- Ik herken hun positionering


### Reflectievraag

Hoe positioneer je een bekend massamerk zonder dat gasten denken dat 0.0 per definitie ''goedkoop smaakt''?',
    8,
    1
  ),
  (
    'craft-0-0',
    'Craft 0.0',
    'Na deze les kun jij craft 0.0 beoordelen op innovatie, smaakambitie en prijs-kwaliteit in foodservice.
',
    'Craft 0.0 experimenteert met hopdosering, moutkeuze en de-alcoholisatieroutes voor smaakidentiteit. Hogere prijs is gerechtvaardigd wanneer aromatische intensiteit, body en afdronk premium aanvoelen.

In foodservice werkt craft 0.0 als signature en upsell, niet als standaard tap voor elk moment. Koppel het aan een verhaal en een gerecht, niet alleen aan ''lokaal''.


## Food pairing

### Beste pairing

Gegrilde groente, spicy tuna tartare en aged cheddar.

### Waarom dit werkt

Craft IPA- of blond 0.0 met hop- of moutdiepte harmoniseert met gegrilde tonen; bitterheid balanceert vet; aromatische lift ondersteunt complexe toppings.

### Vermijd

Neutrale witvis zonder zout of zuur — craft-bitter domineert zonder gastronomische brug.

## Pro insight

Craft 0.0 verkoopt wanneer je het koppelt aan één signature gerecht of chef''s choice. Prijs uitleg via proefparameter — hopintensiteit, body — niet via ''kleine batch'' alleen.',
    '- craft 0.0
- hopdosering
- premiumpositionering
- signatureplaatsing
- innovatie
',
    'Veel craft 0.0-bieren winnen inmiddels internationale prijzen.
',
    '- Innovatie zit in hop, mout en proces
- Premium vraagt gastronomische brug
- Signature placement werkt beter dan volume
',
    '### Opdracht

Zoek drie craft alcoholvrije bieren.

### Checklist

- Ik heb drie gevonden
- Ik heb stijl bekeken
- Ik heb innovatie herkend


### Reflectievraag

Wanneer rechtvaardigt craft 0.0 een hogere kaartprijs dan massamarkt op hetzelfde moment?',
    8,
    2
  ),
  (
    'isotone-positionering',
    'Isotone positionering',
    'Na deze les kun jij isotone positionering uitleggen en correct inzetten zonder medische claims.
',
    'Isotone 0.0 positioneert zich rond sport en hydratatie met toegevoegde mineralen. Professioneel advies: bier 0.0 kan in bepaalde contexten functioneel interessanter aanvoelen dan regulier bier door lagere alcoholbelasting en herkenbare sportassociatie — zonder dat het een medische hersteldrank wordt.


## Food pairing

### Beste pairing

Lichte post-workout maaltijd: kip, rijst en groene salade met licht zout.

### Waarom dit werkt

Isotone 0.0 met mineralen kan in sommige contexten functioneel interessanter aanvoelen dan regulier bier door lagere alcoholbelasting en bekende sportassociatie; zout in het gerecht harmoniseert met lichte bitterheid. Geen medische herstelclaim — context bepaalt geschiktheid.

### Vermijd

Zware vetrijke burger direct na inspanning — dan wint water of een neutrale maaltijd boven positionering.

## Pro insight

Isotone 0.0 verkoopt alleen in duidelijke sport- of wellnesscontext met eerlijke verwachting. Leg uit wat het wél en niet doet; verwijs bij twijfel naar water.',
    '- isotone positionering
- claimdiscipline
- sportcontext
- verwachtingsmanagement
- nuance
',
    'Sommige marathonlopers drinken bewust alcoholvrij bier na de finish.
',
    '- Isotoon is niche en claimgevoelig
- Context en verwachting sturen advies
- Geen medische garanties
',
    '### Opdracht

Vergelijk een sportdrank en een 0.0-bier op voedingswaarde.

### Checklist

- Ik heb suiker bekeken
- Ik heb koolhydraten bekeken
- Ik heb mineralen bekeken


### Reflectievraag

Een gast vraagt of isotone 0.0 ''goed is na het sporten''. Hoe antwoord je professioneel zonder claim?',
    8,
    3
  ),
  (
    'functionele-bieren',
    'Functionele bieren',
    'Na deze les kun jij functionele 0.0-bieren beoordelen op claim versus smaakprofiel en serveermoment.
',
    'Functionele 0.0 voegt ingrediënten of narratieven toe: vitaminen, planten, eiwit of wellness-hoek. Beoordeel altijd eerst smaakprofiel en serveermoment; claims zijn secundair en vragen transparantie naar gast.


## Food pairing

### Beste pairing

Brunch met eieren, avocado en citrussalade.

### Waarom dit werkt

Functionele toevoegingen moeten smaak niet domineren; frisheid en lichte bitterheid ondersteunen vet van avocado; citrus brugt met hop of specerijen in het bier.

### Vermijd

Gerechten met extreme umami zonder zout of zuur — functionele claims redden geen vlakke pairing.

## Pro insight

Functionele 0.0 hoort op de kaart met smaakbeschrijving vóór claim. Gasten kopen eerst herkenbare stijl, daarna pas ''extra''.',
    '- functioneel bier
- ingrediëntclaim
- smaakprofiel
- functioneel moment
- transparantie
',
    'Sommige alcoholvrije bieren worden verkocht als recovery drink.
',
    '- Functioneel = extra ingrediënt of positionering
- Smaak en moment blijven leidend
- Claims vragen nuance
',
    '### Opdracht

Zoek twee functionele alcoholvrije bieren.

### Checklist

- Ik heb ingrediënten bekeken
- Ik heb claims gelezen
- Ik begrijp de functie


### Reflectievraag

Welke functionele claim zou je nooit op de kaart zetten zonder smaakonderbouwing?',
    8,
    4
  ),
  (
    'premium-alcoholvrij',
    'Premium alcoholvrij',
    'Na deze les kun jij premium alcoholvrij adviseren op basis van proefkwaliteit, presentatie en gasttype.
',
    'Premium alcoholvrij combineert proefkwaliteit, design, beperkte distributie en vaak zwaardere de-alcoholisatieroutes. Advies in foodservice: koppel aan gastronomisch moment en glaspresentatie — prijs volgt beleving, niet alleen merk.


## Food pairing

### Beste pairing

Oester, carpaccio en truffelrisotto licht.

### Waarom dit werkt

Premium 0.0 met diepere mout of gecontroleerde hopintensiteit draagt umami en zout; correct glas en temperatuur versterken gastronomische geloofwaardigheid die de prijs rechtvaardigt.
### Vermijd

Budget snackmix zonder structuur — premium prijs vraagt gastronomische context.

## Pro insight

Premium upsell: bied één flagship 0.0 per stijl, niet tien middelmatige. Proefnotitie op de kaart verhoogt conversie meer dan ''alcoholvrij'' alleen.',
    '- premiumpositionering
- proefkwaliteit
- presentatie
- upsell
- gastsegment
',
    'Sommige alcoholvrije craft IPA’s zijn duurder dan reguliere IPA’s.
',
    '- Premium = proefkwaliteit plus presentatie
- Gasttype bepaalt upsell
- Prijs volgt beleving
',
    '### Opdracht

Vergelijk een goedkoop en premium 0.0-bier.

### Checklist

- Ik heb prijs vergeleken
- Ik heb smaak vergeleken
- Ik heb branding bekeken


### Reflectievraag

Beschrijf één situatie waarin premium 0.0 de moeite waard is en één waarin instap-pils slimmer is.',
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
    'Na deze les kun jij sportcontext en herstelmomenten bespreken met nuance over hydratatie en verwachting.
',
    'Sport en herstel zijn gevoelige adviesmomenten. Bier 0.0 kan in sociale sportcontext aantrekkelijk zijn wanneer gasten gewoonte en gezelligheid willen zonder alcohol. Hydratatie en herstel blijven primair gebied van water en voeding — geen marketingclaims.


## Food pairing

### Beste pairing

Post-training wrap met kip, sla en yoghurt-dressing.

### Waarom dit werkt

Bier 0.0 kan in sociale sportcontext functioneel interessanter zijn dan regulier bier wanneer gasten bewust alcohol willen mijden; lichte bitterheid en koolzuur resetten vet en zout zonder dehydraterende alcohol.

### Vermijd

Positioneren als vervangende sportdrank met herstelbelofte — dat overschrijdt professionele nuance.

## Pro insight

Na sport: positioneer 0.0 als sociaal en verfrissend alternatief, niet als herstelproduct. Dat beschermt vertrouwen en past bij RULE 4-nuance.',
    '- sportcontext
- herstelmoment
- alcohol-switching
- verwachtingsmanagement
- hydratielogica
',
    'In Duitsland is alcoholvrij bier al jarenlang onderdeel van sportcultuur.
',
    '- Sportmoment vraagt om verwachtingsmanagement
- 0.0 kan sociaal functioneel zijn zonder herstelclaim
- Hydratatie blijft primair water
',
    '### Opdracht

Bekijk de voedingswaarden van jouw favoriete 0.0-bier.

### Checklist

- Ik heb koolhydraten bekeken
- Ik heb calorieën bekeken
- Ik heb mineralen bekeken


### Reflectievraag

Hoe adviseer je een gast die 0.0 wil als hersteldrank na training?',
    8,
    1
  ),
  (
    'calorieen-vergelijken',
    'Calorieën vergelijken',
    'Na deze les kun jij calorieën van 0.0 vergelijken met regulier bier zonder simplistische ''gezond''-taal.
',
    'Calorieën in 0.0 variëren door restsuiker, extract en eventuele toevoegingen. Vergelijk binnen stijl en product, niet met simplistische ''altijd minder'' taal. Droge pils 0.0 versus zoete blond 0.0 zijn verschillende gesprekken.


## Food pairing

### Beste pairing

Gegrilde groente, lichte salade en magere proteïne.

### Waarom dit werkt

Lager-calorische 0.0 met droge afdronk harmoniseert met lichte gerechten; bitterheid en koolzuur geven smaakdimensie zonder zware restsuiker.

### Vermijd

Caloriebewustheid als enige argument zonder smaakprofiel — dat ondermijnt gastvertrouwen.

## Pro insight

Calorieëngesprek: vergelijk stijl met stijl. Pils 0.0 versus zoet blond 0.0 is eerlijker dan ''bier 0.0 is altijd light''.',
    '- calorievergelijking
- extract
- restsuiker
- segmentvergelijking
- nuance
',
    'Alcohol levert bijna net zoveel calorieën als vet.
',
    '- Calorieën verschillen door restsuiker en extract
- Vergelijk per stijl, niet generiek
- Geen automatische ''light''-conclusie
',
    '### Opdracht

Vergelijk drie 0.0-bieren op calorieën.

### Checklist

- Ik heb calorieën bekeken
- Ik heb suiker bekeken
- Ik heb verschillen genoteerd


### Reflectievraag

Twee 0.0-bieren met verschillende calorieën: welke leg je uit aan een caloriebewuste gast en waarom?',
    8,
    2
  ),
  (
    'suiker-en-restsuiker',
    'Suiker en restsuiker',
    'Na deze les kun jij restsuiker en suiker op label lezen en vertalen naar smaak en pairing.
',
    'Suiker op het label en zoetheid in het glas lopen uiteen door bitterheid, koolzuur en temperatuur. Restsuiker bepaalt pairing: meer restzoetheid vangt spice en umami; te veel vermoeit zonder alcoholbuffer.


## Food pairing

### Beste pairing

Pittige Aziatische noedels en zoetzure glazuur licht.

### Waarom dit werkt

Restzoetheid in 0.0 vangt spice en zuur op; bitterheid voorkomt dat zoetheid plakkerig wordt; koolzuur lift vet uit noedels.

### Vermijd

Ultra-droge pils bij zeer zoet gerecht — dan botst bitterheid zonder compenserende restzoetheid.

## Pro insight

Restsuiker uitleg aan gast: koppel zoetheid aan productiemethode en pairing, niet aan schuldgevoel. Professioneel taalgebruik voorkomt defensieve reacties.',
    '- suikerlabel
- restsuiker
- zoetheidsperceptie
- pairinglogica
- bittermaskering
',
    'Sommige 0.0 IPA’s bevatten minder suiker dan alcoholvrije pils.
',
    '- Label suiker ≠ altijd zoetheid in mond
- Restsuiker beïnvloedt pairing
- Bitterheid maskeert zoetheid
',
    '### Opdracht

Lees van twee 0.0-bieren de suikerwaarde.

### Checklist

- Ik heb suiker per 100 ml bekeken
- Ik heb het vergeleken
- Ik heb mijn voorkeur gekozen


### Reflectievraag

Hoe leg je uit dat een bier met suiker op het label niet altijd zoet proeft?',
    8,
    3
  ),
  (
    'hydratatie',
    'Hydratatie',
    'Na deze les kun jij hydratatie en 0.0 bespreken als contextkeuze, niet als vervangende sportdrank.
',
    'Hydratatie via bier 0.0 is beperkt door alcoholvrijheid maar niet equivalent aan water of isotone sportdrank. Professioneel: leg context uit — sociale verfrissing kan, medische hydratatieclaim kan niet.


## Food pairing

### Beste pairing

Lichte soep, brood en gezouten croutons.

### Waarom dit werkt

Hydratatie via water blijft primair; 0.0 met matige koolzuur kan in sociale pauze functioneel interessanter aanvoelen dan regulier bier door lagere alcoholbelasting, mits gast verwachting correct is.

### Vermijd

Adviseren als dorstlesser tijdens intensieve dehydratatie — professioneel onjuist.

## Pro insight

Bij dorst na inspanning: water eerst, 0.0 optioneel daarna in sociale setting. Dat is horeca-advies dat gasten terugbrengt.',
    '- hydratielogica
- koolzuur
- functioneel moment
- contextadvies
- verwachtingsmanagement
',
    'Veel wielerevenementen sponsoren tegenwoordig alcoholvrije bieren.
',
    '- 0.0 hydrateert via water, niet via marketing
- Koolzuur en alcoholvrijheid zijn geen sportformule
- Context bepaalt geschiktheid
',
    '### Opdracht

Bekijk wanneer jij bier 0.0 drinkt in relatie tot hydratatie.

### Checklist

- Ik heb mijn momenten bekeken
- Ik heb watergebruik vergeleken
- Ik heb mijn routine geëvalueerd


### Reflectievraag

Wanneer is water beter advies dan 0.0 in een sportcontext?',
    8,
    4
  ),
  (
    'alcoholvrij-in-sociale-context',
    'Alcoholvrij in sociale context',
    'Na deze les kun jij alcoholvrij in sociale context adviseren op gasttype, moment en stijlkeuze.
',
    'Sociale context vraagt om herkenbare stijl, gelijkwaardige presentatie en geen defensieve toon. Alcohol-switchers willen meedoen in ritme van de tafel; glas, tempo en stijlkeuze bepalen of 0.0 geaccepteerd wordt.


## Food pairing

### Beste pairing

Borrelplank met charcuterie licht, olijven en noten.

### Waarom dit werkt

Alcohol-switch in sociale context werkt wanneer stijl herkenbaar blijft: pils of blond voor brede groep; bitterheid snijdt door vet van charcuterie; zout lift aromatiek.

### Vermijd

Zwaarste IPA pushen in gemengd gezelschap zonder foodmatch — verhoogt drempel voor switchers.

## Pro insight

Alcohol-switch in groep: serveer 0.0 in hetzelfde glastype als regulier bier waar mogelijk. Visuele gelijkheid verlaagt stigma en verhoogt herhaalbestelling.',
    '- sociale context
- stigmavermindering
- stijlkeuze
- presentatie
- alcohol-switching
',
    'In veel restaurants is alcoholvrij bier nu standaard op de kaart.
',
    '- Sociale switch vraagt om herkenbare stijl
- Glas en presentatie verlagen stigma
- Moment stuurt pils versus IPA
',
    '### Opdracht

Observeer een sociale setting waar bier 0.0 aanwezig is.

### Checklist

- Ik heb keuzegedrag bekeken
- Ik heb redenen herkend
- Ik heb trends gezien


### Reflectievraag

Welke stijl en presentatie verlagen sociale drempel voor alcohol-switch in een gemengd gezelschap?',
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
    'Na deze les kun jij serveertemperatuur per 0.0-stijl bepalen en fouten die aroma maskeren vermijden.
',
    'Serveertemperatuur bepaalt aromatische intensiteit, frisheid en bitterperceptie. Pils 0.0: 3–5°C voor dorstlessend profiel; IPA en blond: 6–8°C voor hop/mout-opening; donker: 8–10°C. Te koud maskeert defecten; te warm maakt 0.0 snel vlak door ontbrekende alcoholstructuur.


## Food pairing

### Beste pairing

Gegrilde vis met citroen en kappertjes.

### Waarom dit werkt

Correcte serveertemperatuur opent citrus en hop zonder maskering; frisheid snijdt door vet van vis; zout van kappertjes lift koolzuur.

### Vermijd

Te koud serveren bij delicaat gerecht — aroma blijft dicht en pairing voelt vlak.

## Pro insight

Te koud serveren is een verkooptruc voor middelmatige 0.0 — professionele service kalibreert temperatuur per stijl en laat gast proeven bij twijfel.',
    '- serveertemperatuur
- frisheid
- aroma-opening
- maskeringsrisico
- stijlcalibratie
',
    'Te koud serveren maskeert fouten.
',
    '- Te koud maskeert defecten
- Stijl bepaalt temperatuurvenster
- 0.0 profiteert van gecontroleerde frisheid
',
    '### Opdracht

Proef hetzelfde bier op twee temperaturen.

### Checklist

- Ik heb koud geproefd
- Ik heb warmer geproefd
- Ik heb verschil genoteerd


### Reflectievraag

Je proeft hetzelfde 0.0 op 3°C en 7°C. Welke temperatuur verkoop je aan een kritische gast en waarom?',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les kun jij glaswerk kiezen dat aroma, schuim en temperatuur voor 0.0 optimaliseert.
',
    'Glaswerk stuurt aroma-concentratie, schuimstabiliteit en temperatuurbehoud. Pils: slank en hoog; IPA: breed voor hop; witbier: volumineus voor kruidigheid; donker: compact aromatisch. Vet residu op glas vernietigt schuim — bij 0.0 direct zichtbaar kwaliteitsverlies.


## Food pairing

### Beste pairing

IPA 0.0 met spicy taco en verse koriander.

### Waarom dit werkt

Breed IPA-glas concentreert hoparoma; bitterheid temt spice; koolzuur reset vet tussen bites.

### Vermijd

IPA in smal pils-glas — aroma verliest lift en pairing verliest technische brug.

## Pro insight

Vet glas is onacceptabel bij 0.0: schuim valt direct in en gasten associëren dat met gebrek aan kwaliteit. Glascheck vóór schenk is verplichte routine.',
    '- glasselectie
- aroma-concentratie
- schuimstabiliteit
- temperatuurbehoud
- hygiëne
',
    'Een vet glas vernietigt schuim.
',
    '- Glas beïnvloedt aroma en schuim
- Vet glas is directe kwaliteitsfout
- Stijl bepaalt vorm
',
    '### Opdracht

Drink hetzelfde bier uit twee verschillende glazen.

### Checklist

- Ik heb aroma vergeleken
- Ik heb schuim vergeleken
- Ik heb mondgevoel vergeleken


### Reflectievraag

Welk glas kies je voor witbier 0.0 versus IPA 0.0 — en welke parameter win je?',
    8,
    2
  ),
  (
    'presentatie',
    'Presentatie',
    'Na deze les kun jij presentatie en inschenktechniek inzetten om premium 0.0 waardevol te laten aanvoelen.
',
    'Presentatie omvat schone glazen, gecontroleerd schuim, juiste vulgraad en geen beslagen rand door vuile was. Inschenk aan glaswand, niet in schuim; twee vingers schuim als richtlijn. Premium 0.0 verliest waarde bij haastige schenk zonder oogcontact met product.


## Food pairing

### Beste pairing

Premium bittergarnituur en ambachtelijk brood.

### Waarom dit werkt

Perfect schuim en schone inschenk signaleren kwaliteit; bitter van bier en hap echoën; presentatie rechtvaardigt premium 0.0 naast wijn.

### Vermijd

Slordige rand, vet glas of plat schuim — gasten koppelen dat aan ''goedkoop alcoholvrij''.

## Pro insight

Premium 0.0 vraagt om zichtbare zorg bij inschenk: twee-finger schuim, schone rand, geen overmatige condens. Gasten betalen voor beleving, niet alleen voor afwezigheid van alcohol.',
    '- presentatie
- inschenktechniek
- schuimkwaliteit
- premiumpositionering
- beleving
',
    'Mensen beoordelen smaak deels op basis van visuele verwachting.
',
    '- Inschenken bepaalt schuimkwaliteit
- Presentatie rechtvaardigt premium
- Rand en condens zijn signaal
',
    '### Opdracht

Serveer een 0.0-bier alsof je in horeca werkt.

### Checklist

- Ik heb correct glas gekozen
- Ik heb goed ingeschonken
- Ik heb schuim gecontroleerd


### Reflectievraag

Welke inschenkfout maakt premium 0.0 direct goedkoop aanvoelen?',
    8,
    3
  ),
  (
    'bewaren',
    'Bewaren',
    'Na deze les kun jij bewaring en lichtinvloed beheren zodat 0.0 aroma en koolzuur behouden.
',
    'Bewaring: koel, donker, rechtop; 0.0 is gevoeliger voor licht en warmte door kleinere smaakbuffer. Na opening daalt koolzuur en aromatische lift sneller — plan taprotatie en voorraad daarop.


## Food pairing

### Beste pairing

Kaasplateau na bewaringstest — jonge versus oude kaas.

### Waarom dit werkt

Vers 0.0 met intact aroma balanceert vet van kaas; koolzuur spoelt palate; bewaarfouten tonen zich direct in vlakke pairing met zoute kaas.

### Vermijd

Lang openstaand 0.0 bij umami-rijke kaas — oxidatie en CO₂-verlies vernietigen de brug.

## Pro insight

0.0 verliest aroma sneller na opening — train bar op kleinere batches en koele donkere opslag. Liever minder taplijnen met vers product dan breed assortiment met vlakke glazen.',
    '- bewaring
- lichtinvloed
- aroma-behoud
- koolzuurbehoud
- taprotatie
',
    'Hop-aroma verliest sneller intensiteit bij warmte.
',
    '- Licht en warmte vlakken aroma sneller
- 0.0 is kwetsbaarder na opening
- Koel en donker bewaren
',
    '### Opdracht

Controleer jouw voorraad bier 0.0.

### Checklist

- Ik heb houdbaarheid bekeken
- Ik heb opslag bekeken
- Ik heb verbeterpunten gevonden


### Reflectievraag

Hoe bewaar je open 0.0 in de koelkast zonder aroma te verliezen?',
    8,
    4
  ),
  (
    'service-in-de-praktijk',
    'Service in de praktijk',
    'Na deze les kun jij service in de praktijk uitvoeren met foutpreventie op schuim, temperatuur en glas.
',
    'Service in de praktijk combineert temperatuurcheck, glasselectie, schone inschenk en één zin gastadvies. Foutpreventie: geen warm glas, geen vet rand, geen plat 0.0 uit lang open tap. 0.0 bestraft slordigheid sneller omdat gasten vergelijken met frisdrank én bier.


## Food pairing

### Beste pairing

Drie-gangen lunch in de zaal: voorgerecht, hoofd, dessert licht.

### Waarom dit werkt

Service op temperatuur en glas per gang verhoogt pairing succes; stijlwissel pils naar blond volgt gerechtgewicht; foutpreventie op schuim houdt beleving premium.

### Vermijd

Eén glas type voor alle gangen zonder herinschenk — temperatuur en aroma lijden.

## Pro insight

Servicefout bij 0.0 kost herbestelling: combineer temperatuurcheck, glasselectie en één zin pairingadvies bij uitserveren — dat is Master-niveau differentiatie.',
    '- serviceflow
- foutpreventie
- temperatuurcontrole
- horeca-advies
- integratie
',
    '',
    '- Service is proefbare kwaliteit
- Fouten vallen bij 0.0 sneller op
- Flow en glashygiëne zijn basis
',
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

Noem drie servicefouten die bij 0.0 sneller opvallen dan bij regulier bier.',
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
    'Na deze les kun jij lunchpairing met 0.0 opbouwen via frisheid, vet en lichte bitterheid.
',
    'Lunchpairing vraagt frisheid, lichte bitterheid en verteerbare structuur. Vet uit sandwich of dressing vraagt koolzuur-lift; zout vraagt bittere snede; umami licht vraagt droge afdronk of gecontroleerde restzoetheid — niet generiek ''pizza past goed''.

Geroosterde mout in donker 0.0 ondersteunt Maillard-tonen in gegrild brood of lichte stoof.


## Food pairing

### Beste pairing

Club sandwich, Caesar licht en quiche.

### Waarom dit werkt

Pils 0.0: koolzuur lift zout en ei; bitterheid snijdt door vet van dressing; frisheid houdt lunch drinkbaar zonder zwaarte op het palet.
### Vermijd

Donker 0.0 bij delicate salade — moutzoetheid domineert en lunch voelt zwaar.

## Pro insight

Lunchkaart: zet 0.0 bij gerecht, niet onderaan ''dranken''. Food-first placement verhoogt pairingverkoop en positioneert categorie gastronomisch.',
    '- lunchpairing
- frisheid
- vet-bitter
- koolzuur-zout
- drinkbaarheid
',
    'Steeds meer lunchrestaurants bieden alcoholvrije pairings aan.
',
    '- Lunch = licht vet en frisheid
- Pils en witbier domineren
- Verteerbaarheid boven intensiteit
',
    '### Opdracht

Combineer een lunchgerecht met een bier 0.0.

### Checklist

- Ik koos gerecht
- Ik koos bierstijl
- Ik noteerde waarom


### Reflectievraag

Kies lunchgerecht en stijl: welke technische parameter maakt de pairing logisch?',
    8,
    1
  ),
  (
    '0-0-en-kaas',
    '0.0 & kaas',
    'Na deze les kun jij kaaspairing met 0.0 technisch onderbouwen via vet, zout en bitter-koolzuurspanning.
',
    'Kaaspairing: vet vraagt bitterheid en koolzuur; zout lift aromatiek; umami in oude kaas vraagt hop of moutdiepte. Jonge kaas met pils 0.0; oude kaas met IPA 0.0; blauw met donker of bitter blond — altijd technisch onderbouwd.

Koolzuur spoelt vet van kaas weg; zonder voldoende bitterheid blijft het palet vet en vlak.


## Food pairing

### Beste pairing

Comté, blauwschimmel licht en gezouten cracker.

### Waarom dit werkt

Oude kaas: IPA 0.0 bitterheid tegen vet; jonge kaas: pils koolzuur en zachte bitter; zout op cracker lift aromatiek; umami vraagt body of hopstructuur.

### Vermijd

Zachte triple-achtige kaas met agressieve IPA zonder zoetheidscompensatie — bitter wordt scherp en droog.

## Pro insight

Kaasboard: verkoop per kaastype een stijl — gasten kopen sneller een flight dan één generiek advies.',
    '- kaaspairing
- vet-bitter
- zout-lift
- umami
- mondgevoelcontrast
',
    'Koolzuur helpt vet van kaas weg te spoelen.
',
    '- Vet vraagt bitter en koolzuur
- Kaas toont bodyverschil
- Zout lift aromatiek
',
    '### Opdracht

Proef twee kazen met één bier 0.0.

### Checklist

- Ik proefde los
- Ik proefde samen
- Ik noteerde verschil


### Reflectievraag

Oude kaas met pils 0.0 of IPA 0.0 — onderbouw met vet en bitterheid.',
    8,
    2
  ),
  (
    '0-0-en-lichte-gerechten',
    '0.0 & lichte gerechten',
    'Na deze les kun jij lichte gerechten koppelen aan stijlkeuze op restzoetheid en aromatische lift.
',
    'Lichte gerechten: harmonie via restzoetheid en milde bitterheid; contrast via droge pils en citruszuur in gerecht. Delicate vis overschaduwd door te hoppy IPA — witbier of blond 0.0 houden textuur in balans.

Aromatische intensiteit in het gerecht bepaalt of je harmonie (zacht) of contrast (droog-bitter) kiest.


## Food pairing

### Beste pairing

Gegrilde witvis, risotto licht en groene asperge.

### Waarom dit werkt

Witbier of blond 0.0: restzoetheid harmoniseert met asperge; koolzuur snijdt door boter in risotto; lichte bitterheid houdt vis fris.

### Vermijd

Zware donkere 0.0 bij delicate vis — geroosterde mout overschaduwt subtiele protein.

## Pro insight

Lichte gerechten vragen harmonie; pitch witbier of blond vóór IPA tenzij gerecht expliciet pittig of vet is.',
    '- licht gerecht
- harmonie
- restzoetheid
- delicaatheid
- stijlcalibratie
',
    'Witbier is vaak één van de meest veelzijdige food pairing-stijlen.
',
    '- Lichte gerechten vragen harmonie
- Restzoetheid vangt delicate smaken
- Te hoppy overschaduwt
',
    '### Opdracht

Maak een pairing met een licht gerecht.

### Checklist

- Ik koos gerecht
- Ik koos bier
- Ik beoordeelde balans


### Reflectievraag

Wanneer kies je harmonie en wanneer contrast bij een licht visgerecht?',
    8,
    3
  ),
  (
    'contrast-en-harmonie',
    'Contrast & harmonie',
    'Na deze les kun jij contrast- en harmoniepairing bewust inzetten bij 0.0.
',
    'Contrast verhoogt spanning: droge bitterheid tegen vet en spice. Harmonie verzacht: moutzoetheid met ronde gerechten. Beide zijn valide; keuze hangt af van menu-intentie en gastprofiel.


## Food pairing

### Beste pairing

Contrast: spicy wings met droge pils 0.0. Harmonie: kip met citroen en witbier 0.0.

### Waarom dit werkt

Contrast: bitterheid en koolzuur temmen capsaïcine. Harmonie: citrus en koriander echoën gerecht. Beide zijn bewuste technische keuzes, geen smaakvoorkeur alleen.

### Vermijd

Willekeurige stijl zonder te weten of je contrast of harmonie zoekt — pairing wordt gokwerk.

## Pro insight

Leer personeel één contrast- en één harmonievoorbeeld uit het hoofd. Dat maakt pairinggesprekken kort en overtuigend in drukke service.',
    '- contrastpairing
- harmoniepairing
- bitter-vet
- zoet-zuur
- spanning
',
    'Veel top-pairings werken juist op contrast.
',
    '- Contrast scherpt aan
- Harmonie verzacht
- Beide zijn bewuste keuzes
',
    '### Opdracht

Maak één harmonie-pairing en één contrast-pairing.

### Checklist

- Ik heb beide gemaakt
- Ik heb verschil geproefd
- Ik heb voorkeur bepaald


### Reflectievraag

Geef één contrast- en één harmoniepairing met dezelfde 0.0-stijl.',
    8,
    4
  ),
  (
    'bier-0-0-in-gastronomie',
    'Bier 0.0 in gastronomie',
    'Na deze les kun jij bier 0.0 in gastronomische menu''s positioneren als volwaardige drankbegeleider.
',
    'Gastronomische positie: 0.0 als volwaardige drankbegeleider met stijlwissel per gang. Menu-engineering koppelt bitter-vet-zout-koolzuur per gerecht; sommelier-logica geldt evenzeer voor bier 0.0.


## Food pairing

### Beste pairing

Vijf-gangen chef''s menu met variërend vet, zout en umami.

### Waarom dit werkt

Menu-engineering: pils voor amuse, witbier bij vis, blond bij gevogelte, donker bij kaas — elke gang gebruikt bitter-vet-zout-koolzuur logica; 0.0 als volwaardige dranklijn naast wijn.

### Vermijd

Eén generiek 0.0 voor heel menu — gastronomische geloofwaardigheid zakt weg.

## Pro insight

Chef-gesprek: bied 0.0-pairing aan als ''structuur'' — bitter, koolzuur, restzoetheid — niet als trend. Academy-taal opent deuren die consumentenjargon sluit.',
    '- menu-engineering
- gastronomie
- drankbegeleiding
- stijlwissel
- technische pairing
',
    '',
    '- 0.0 hoort in wine-pairinglogica
- Menu-engineering verhoogt waarde
- Techniek boven trend
',
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

Hoe pitch je een 0.0-pairing aan een chef die alleen wijn in het menu wil?',
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
    'Na deze les kun jij blind pils 0.0 versus regulier pils vergelijken op body, lengte en restzoetheid.
',
    'Blind pils-vergelijking: regulier pils heeft meer body, warmere structuur en langere afdronk door alcohol. 0.0 pils is vaak lichter, soms iets zoeter en korter — mondgevoel is het snelste signaal.


## Food pairing

### Beste pairing

Zoute friet en mosterd-mayonaise.

### Waarom dit werkt

Blind vergelijken leert dat pils 0.0 vaak korter en zoeter eindigt; koolzuur en bitterheid blijven pairingmotor met vet; bodyverschil wordt zichtbaar bij zout.

### Vermijd

Alleen op etiket vergelijken — bias verhindert objectieve bodycalibratie.

## Pro insight

Blind pils-training: gebruik body en lengte als eerste filter, niet zoetheid alleen. Dat kalibreert hele team voor gastadvies tussen 0.0 en regulier.',
    '- blindvergelijking
- pilscontrast
- mondgevoel
- lengte
- restzoetheid
',
    'Veel beginners herkennen het verschil vooral via mondgevoel.
',
    '- Body en lengte zijn hoofdsignalen
- 0.0 is vaak zoeter en korter
- Blind trainen objectiviteit
',
    '### Opdracht

Proef blind één gewone pils en één 0.0 pils.

### Checklist

- Ik heb body vergeleken
- Ik heb zoetheid vergeleken
- Ik heb lengte vergeleken


### Reflectievraag

Welk blind signaal verraadt 0.0-pils het snelst bij jou?',
    8,
    1
  ),
  (
    '0-0-ipa-vs-gewone-ipa',
    '0.0 IPA vs gewone IPA',
    'Na deze les kun jij blind IPA 0.0 versus regulier IPA vergelijken op hopintegratie en bittere afdronk.
',
    'Blind IPA-vergelijking: hop maskeert deels; let op bitterintegratie na 10 seconden en op restzoetheid die 0.0 ronder kan maken. Regulier IPA voelt vaak warmer en langer bitter.


## Food pairing

### Beste pairing

Sharp cheddar burger en pickled onion.

### Waarom dit werkt

Blind: reguliere IPA heeft vaak warmere bitterintegratie; 0.0 IPA kan frisser en korter zijn; vet van kaas toont welke bitterlijn beter spanning houdt.

### Vermijd

Blind proeven zonder notatie van lengte en zoetheid — hop maskeert conclusies.

## Pro insight

IPA blind: noteer bittere afdronk na 10 seconden — verschil 0.0 versus regulier wordt daar zichtbaar wanneer hoparoma afneemt.',
    '- blindvergelijking
- hopintegratie
- bitterafdronk
- IPA-contrast
- calibratie
',
    'Ervaren proevers maken hier vaker fouten dan bij pils.
',
    '- Hop maskeert deels
- Bitterintegratie verschilt
- Mondgevoel blijft kritisch
',
    '### Opdracht

Vergelijk blind twee IPA’s.

### Checklist

- Ik heb aroma vergeleken
- Ik heb body beoordeeld
- Ik heb alcohol ingeschat


### Reflectievraag

Waarom maakt IPA blindproeven moeilijker dan pils?',
    8,
    2
  ),
  (
    'stijlherkenning-blind',
    'Stijlherkenning blind',
    'Na deze les kun jij stijlen blind herkennen via mondgevoel, bitterbalans en aromatische signatuur.
',
    'Stijlherkenning blind: cluster parameters per stijl — pils droog-fris-kort; wit kruidig-koolzuur-zacht; IPA hop-bitter-aromatisch; blond rond-mild; donker mout-umami-lang. Objectiviteit verslaat etiketbias.


## Food pairing

### Beste pairing

Drie blind geproefde stijlen bij neutrale crackers en zeezout.

### Waarom dit werkt

Stijlherkenning via parameterclusters: pils droog-fris, wit kruidig-koolzuur, donker mout-umami; zout op cracker kalibreert bitter en zoetheid tussen samples.

### Vermijd

Proeven met etiket zichtbaar — training faalt en examenobjectiviteit lijdt.

## Pro insight

Stijlherkenning blind: train op drie parameterclusters per stijl; snelheid komt van discipline, niet van geluk.',
    '- stijlherkenning
- parameterclusters
- blindobjectiviteit
- mondgevoel
- signatuur
',
    'Professionele sommeliers trainen vaak blind.
',
    '- Stijl via parameterclusters
- Blind vermindert etiketbias
- Integratie van hele track
',
    '### Opdracht

Proef drie bier 0.0 blind.

### Checklist

- Ik heb stijl benoemd
- Ik heb body beoordeeld
- Ik heb aroma genoteerd


### Reflectievraag

Welke parametercluster gebruik jij als eerste bij stijlherkenning blind?',
    8,
    3
  ),
  (
    'theorie-examen',
    'Theorie-examen',
    'Na deze les kun jij je volledige theoretische Bier 0.0-kennis integreren voor certificering.
',
    'Dit examen behandelt fundament, productie, proeven, stijlen, markt, gezondheid, service en pairing. Je toont aan dat je theorie beheerst op academy-niveau: technisch, adviserend en zonder consumentenjargon. Bij voldoende score rond je de theoretische certificering af.


## Examenonderdelen

- Open vragen en praktijkcases over productie en proef
- Stijlvragen met technische onderbouwing
- Gezondheid en lifestyle met nuance (geen claims)
- Service- en pairingcases op bitter-vet-zout-koolzuur logica
- Blindproef-scenario''s en gastadvies per moment',
    '- theorie-integratie
- examen
- certificering
- kennistoetsing
- module-overzicht
',
    '',
    '- Volledige theorie-integratie
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

Welk module-onderdeel voelt voor jou nog het zwakst vóór het examen?',
    15,
    4
  ),
  (
    'praktijk-examen',
    'Praktijkexamen',
    'Na deze les kun jij praktijk, service en pairing samenbrengen op Master-niveau.
',
    'Praktijkexamen integreert blindproeven, stijlherkenning, service en pairing. Je laat zien dat bier 0.0 professioneel beheerst wordt als smaakproduct met horeca-discipline — niet als compromisdrank.
',
    '- praktijkintegratie
- service
- pairing
- mastercompetentie
- blindproef
',
    '',
    '- Praktijk plus service plus pairing
- Master-competentie
- Finale track-afronding
',
    '### Opdracht

Voer jouw volledige praktijkproef uit:

1. Blindproef drie bier 0.0-stijlen
2. Benoem stijl en argumentatie
3. Serveer één bier professioneel
4. Maak één food pairing
5. Onderbouw jouw keuzes

### Checklist

- Ik heb blind geanalyseerd
- Ik heb stijlen benoemd
- Ik heb service correct uitgevoerd
- Ik heb pairing logisch opgebouwd


### Reflectievraag

Welke groei in service of pairing merk je het meest sinds module 1?',
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
  ('intro-beer-zero', 'wat-is-bier-0-0', 1, 'Een gast ziet 0,5% op een label en vraagt of dat ''echt 0.0'' is. Wat antwoord je professioneel?', '["Ja, dat is hetzelfde", "Nee, in Nederland is alcoholvrij maximaal 0,1%; 0.0 verwijst naar afgerond 0,00%", "Alles onder 1% telt als 0.0", "Alleen thuisbier mag 0.0 heten"]', 1, 'Correct: Nee, in Nederland is alcoholvrij maximaal 0,1%; 0.0 verwijst naar afgerond 0,00%'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 2, 'Waarom brouwt de industrie 0.0 meestal als volledig bier en verwijdert daarna alcohol?', '["Om hop te vermijden", "Om mout-hop-giststructuur maximaal te behouden", "Om suiker wettelijk te verhogen", "Om geen koolzuur te gebruiken"]', 1, 'Correct: Om mout-hop-giststructuur maximaal te behouden'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 3, 'Een horecakaart wil alcoholvrij uitbreiden zonder frisdrankgevoel. Wat is je kernargument voor bier 0.0?', '["Het is altijd gezonder", "Het behoudt bierstructuur en pairinglogica", "Het is altijd goedkoper", "Het heeft geen bitterheid"]', 1, 'Correct: Het behoudt bierstructuur en pairinglogica'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 4, 'Welke situatie verklaart de snelle categoriegroei het best?', '["Hogere alcoholpercentages", "Meer momenten waarop gasten bewust alcohol willen mijden", "Minder interesse in smaak", "Verplichte wetgeving in alle landen"]', 1, 'Correct: Meer momenten waarop gasten bewust alcohol willen mijden'),
  ('intro-beer-zero', 'wat-is-bier-0-0', 5, 'Wat is het grootste proefrisico bij instap in bier 0.0?', '["Te veel schuim", "Alleen naar merk kijken in plaats van body en balans", "Te warm serveren", "Te veel glaswerkkeuze"]', 1, 'Correct: Alleen naar merk kijken in plaats van body en balans'),
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
  ('intro-beer-zero', 'geschiedenis-van-alcoholvrij-bier', 4, 'Waarom groeit premium 0.0 sneller dan tien jaar geleden?', '["Gasten accepteren smaakverlies", "Techniek en verwachting zijn beide verbeterd", "Alcohol is verboden", "Pils bestaat niet meer"]', 1, 'Correct: Techniek en verwachting zijn beide verbeterd'),
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
  ('proeven-beer-zero', 'mini-toets-0-0', 1, 'Je start een professionele 0.0-proef. Wat doe je als eerste?', '["Bitterheid scoren", "Kleur en helderheid beoordelen", "Serveertemperatuur meten", "Food pairing kiezen"]', 1, 'Correct: Kleur en helderheid beoordelen'),
  ('proeven-beer-zero', 'mini-toets-0-0', 2, 'Twee blind geproefde 0.0-bieren: één voelt rond, één waterig. Welke parameter is het meest doorslaggevend?', '["Body en mondgevoel", "Flesvorm", "Merknaam", "Barcode"]', 0, 'Correct: Body en mondgevoel'),
  ('proeven-beer-zero', 'mini-toets-0-0', 3, 'Een 0.0 smaakt zoet maar niet klonterig-zacht. Wat check je eerst?', '["Restsuiker versus koolzuurmaskering", "Glasgewicht", "Etiketkleur", "Schuimhoogte"]', 0, 'Correct: Restsuiker versus koolzuurmaskering'),
  ('proeven-beer-zero', 'mini-toets-0-0', 4, 'Bitterheid voelt scherp en uitdrogend. Wat is de meest waarschijnlijke conclusie?', '["Hopbalans of extract is niet gecompenseerd", "Het bier is te koud", "Het glas is te groot", "Het is per definitie craft"]', 0, 'Correct: Hopbalans of extract is niet gecompenseerd'),
  ('proeven-beer-zero', 'mini-toets-0-0', 5, 'Waarom blindproeven vóór module 4?', '["Om marketing te vermijden en parameters te trainen", "Om sneller te schenken", "Om minder glaswerk te gebruiken", "Om suiker te verhogen"]', 0, 'Correct: Om marketing te vermijden en parameters te trainen'),
  ('proeven-beer-zero', 'mini-toets-0-0', 6, 'Welke productiemethode past het meest bij opvallende zoetheid en lichte body?', '["Gestopte fermentatie", "Barrel aging", "Droge hopping zonder bier", "Pasteurisatie als hoofdmethode"]', 0, 'Correct: Gestopte fermentatie'),
  ('proeven-beer-zero', 'mini-toets-0-0', 7, 'Wat balanceert restzoetheid in een goed gebouwd 0.0?', '["Bitterheid en frisheid via koolzuur", "Meer suiker", "Warm serveren", "Groter glas"]', 0, 'Correct: Bitterheid en frisheid via koolzuur'),
  ('proeven-beer-zero', 'mini-toets-0-0', 8, 'Aroma lijkt vlak maar bitterheid is intact. Waar zoek je eerst?', '["Aroma-retentie in productie of bewaring", "Alleen naar alcoholsporen", "Alleen naar glasrand", "Alleen naar prijs"]', 0, 'Correct: Aroma-retentie in productie of bewaring'),
  ('proeven-beer-zero', 'mini-toets-0-0', 9, 'Een gast wil ''iets fris zonder frisdrankgevoel''. Welke proefparameter stuur je op?', '["Frisheid met body en bittere afdronk", "Maximale zoetheid", "Minimale koolzuur", "Hoogste temperatuur"]', 0, 'Correct: Frisheid met body en bittere afdronk'),
  ('proeven-beer-zero', 'mini-toets-0-0', 10, 'Wat bewijs je met deze mini-toets?', '["Explorer-proefdiscipline voor stijlmodules", "Master-examen readiness", "Alleen theoriekennis merken", "Alleen servicekennis"]', 0, 'Correct: Explorer-proefdiscipline voor stijlmodules'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 1, 'Een 0.0-pils smaakt zoet en waterig in rush-hour service. Wat is de meest waarschijnlijke productieoorzaak?', '["Te veel barrel aging", "Onvoldoende extract/bittercompensatie na de-alcoholisatie", "Te veel koffie", "Verkeerde glasvorm alleen"]', 1, 'Correct: Onvoldoende extract/bittercompensatie na de-alcoholisatie'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 2, 'Wat valt bij pils sneller op?', '["Fouten in balans", "Glaswerk", "Etiket", "Flesvorm"]', 0, 'Correct: Fouten in balans'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 3, 'Wat is cruciaal in pils?', '["Frisheid", "Zoetheid", "Zuur", "Hout"]', 0, 'Correct: Frisheid'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 4, 'Welke eigenschap hoort het meest bij pils?', '["Licht en droog", "Zwaar en zoet", "Rijk en oxidatief", "Vol en warm"]', 0, 'Correct: Licht en droog'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-pils', 5, 'Een gast wil dorstlessend zonder frisdrank. Welke stijl en parameter pitch je?', '["Donker 0.0 op zoetheid", "Pils 0.0 op frisheid en droge afdronk", "IPA 0.0 op maximale bitter", "Witbier warm"]', 1, 'Correct: Pils 0.0 op frisheid en droge afdronk'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 1, 'Wat domineert IPA?', '["Hop", "Mout", "Suiker", "Gist"]', 0, 'Correct: Hop'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 2, 'Waarom werkt IPA goed als 0.0?', '["Hop maskeert bodyverlies", "Minder schuim", "Meer suiker", "Minder koolzuur"]', 0, 'Correct: Hop maskeert bodyverlies'),
  ('klassieke-stijlen-beer-zero', 'alcoholvrije-ipa', 3, 'Hopbitter voelt scherp zonder ronding. Wat ontbreekt waarschijnlijk?', '["Alcoholwarmte als buffer — compensatie via mout/restsuiker of aromatische integratie", "Meer koolzuur alleen", "Groter glas", "Koudere fles"]', 0, 'Correct: Alcoholwarmte als buffer — compensatie via mout/restsuiker of aromatische integratie'),
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
  ('gezondheid-beer-zero', 'sport-en-herstel', 4, 'Een gast vraagt of 0.0 ''goed is voor herstel na sport''. Beste antwoord?', '["Ja, vervangt sportdrank volledig", "Het kan in sociale context interessant zijn zonder herstelclaim; water blijft primair", "Nee, 0.0 is altijd ongezond", "Alleen isotone frisdrank telt"]', 1, 'Correct: Het kan in sociale context interessant zijn zonder herstelclaim; water blijft primair'),
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
  ('service-beer-zero', 'serveertemperatuur', 1, 'Een 0.0 smaakt vlak in de zaal maar fris in de koelcel. Meest waarschijnlijke oorzaak?', '["Te warm geserveerd waardoor frisheid en aroma dalen", "Te veel alcohol", "Verkeerde hopsoort op het etiket", "Te veel schuim"]', 0, 'Correct: Te warm geserveerd waardoor frisheid en aroma dalen'),
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
  ('service-beer-zero', 'service-in-de-praktijk', 1, 'Je opent een drukke lunchservice met 0.0-pils. Wat check je als eerste?', '["Vet glas en serveertemperatuur vóór inschenk", "Alleen etiketkleur", "Taplawaai", "Barbecuepairing"]', 0, 'Correct: Vet glas en serveertemperatuur vóór inschenk'),
  ('service-beer-zero', 'service-in-de-praktijk', 2, 'Witbier 0.0 wordt te vlak ervaren. Meest waarschijnlijke servicefout?', '["Te koud geserveerd in verkeerd glas waardoor kruidigheid dicht blijft", "Te veel alcohol", "Verkeerde hopsoort in recept", "Te veel suiker in gerecht"]', 0, 'Correct: Te koud geserveerd in verkeerd glas waardoor kruidigheid dicht blijft'),
  ('service-beer-zero', 'service-in-de-praktijk', 3, 'IPA 0.0 met plat schuim en snel verdwijnend aroma. Oorzaak?', '["Vet glas of slordige inschenk zonder schuimcontrole", "Te veel geroosterde mout", "Te warm bier alleen door recept", "Verkeerde kaaskeuze"]', 0, 'Correct: Vet glas of slordige inschenk zonder schuimcontrole'),
  ('service-beer-zero', 'service-in-de-praktijk', 4, 'Een gast bestelt premium donker 0.0. Juiste servicevolgorde?', '["Glas check → 8–10°C → inschenk aan wand → korte pairingzin", "Warm glas → maximaal koud → snel volschenken", "Wijnkelk → ijsblokjes → snel roeren", "Shotglas → dubbel schuim → geen uitleg"]', 0, 'Correct: Glas check → 8–10°C → inschenk aan wand → korte pairingzin'),
  ('service-beer-zero', 'service-in-de-praktijk', 5, 'Waarom is service bij 0.0 extra kritisch?', '["Gasten vergelijken direct met frisdrank én bier; fouten vallen sneller op", "Meer alcohol vereist precisie", "Minder aroma mogelijk", "Alleen prijs telt"]', 0, 'Correct: Gasten vergelijken direct met frisdrank én bier; fouten vallen sneller op'),
  ('service-beer-zero', 'service-in-de-praktijk', 6, 'Twee identieke 0.0, verschillende glazen. Wat verandert het meest?', '["Aroma-concentratie en schuimstabiliteit", "Alcoholpercentage", "Restsuiker in fles", "Etiketwaarde"]', 0, 'Correct: Aroma-concentratie en schuimstabiliteit'),
  ('service-beer-zero', 'service-in-de-praktijk', 7, 'Tap 0.0 smaakt oxidatief na weekend. Beste operationele actie?', '["Rotatie verscherpen en bewaring/licht controleren", "Warmer serveren om te maskeren", "Meer suiker toevoegen", "Glas niet spoelen"]', 0, 'Correct: Rotatie verscherpen en bewaring/licht controleren'),
  ('service-beer-zero', 'service-in-de-praktijk', 8, 'Gast vraagt waarom je 6°C adviseert voor blond 0.0. Beste antwoord?', '["Opent mout en hop zonder frisheid te verliezen", "Verbergt alle defecten permanent", "Is wettelijk verplicht", "Maakt bier zoeter"]', 0, 'Correct: Opent mout en hop zonder frisheid te verliezen'),
  ('service-beer-zero', 'service-in-de-praktijk', 9, 'Welke fout ondermijnt premium positionering het directst?', '["Beslagen vuile rand en haastige schenk zonder oogcontact", "Te veel pairinguitleg", "Te klein glas voor pils", "Te koud water naast"]', 0, 'Correct: Beslagen vuile rand en haastige schenk zonder oogcontact'),
  ('service-beer-zero', 'service-in-de-praktijk', 10, 'Wat bewijs je met deze service-module?', '["Master-serviceintegratie: temperatuur, glas, inschenk en gastbeleving", "Alleen theoriekennis productie", "Alleen blindproeven", "Alleen calorieadvies"]', 0, 'Correct: Master-serviceintegratie: temperatuur, glas, inschenk en gastbeleving'),
  ('pairing-beer-zero', '0-0-en-lunch', 1, 'Waarom werkt pils 0.0 technisch bij club sandwich?', '["Koolzuur lift zout en bitterheid snijdt door vet van ei en vlees", "Zoetheid domineert umami", "Geen koolzuur nodig", "Donkere mout is verplicht"]', 0, 'Correct: Koolzuur lift zout en bitterheid snijdt door vet van ei en vlees'),
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
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 1, 'Chef wil alleen wijn in pairingmenu. Sterkste academy-argument voor 0.0?', '["Bitter-vet-zout-koolzuur structuur per gang net als wijn", "0.0 is altijd goedkoper", "0.0 heeft geen smaak", "Alleen trend"]', 0, 'Correct: Bitter-vet-zout-koolzuur structuur per gang net als wijn'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 2, 'Amuse met oester en zoute cracker. Logische 0.0-keuze?', '["Pils of witbier met koolzuur-lift en lichte bitterheid", "Zoete blond met dessertprofiel", "Donker met zware mout alleen", "Warm flat bier"]', 0, 'Correct: Pils of witbier met koolzuur-lift en lichte bitterheid'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 3, 'Hoofdgerecht met truffel en umami. Technische pairinglijn?', '["Blond of donker 0.0 met moutdiepte en gecontroleerde bitterheid", "Instap pils zonder body", "Maximaal koud witbier", "Geen drank"]', 0, 'Correct: Blond of donker 0.0 met moutdiepte en gecontroleerde bitterheid'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 4, 'Kaasgang met blauwschimmel. Beste logica?', '["Donker of bitter blond: restzoetheid vangt umami, bitter snijdt vet", "Zoete frisdrank", "Water alleen", "Pils zonder koolzuur"]', 0, 'Correct: Donker of bitter blond: restzoetheid vangt umami, bitter snijdt vet'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 5, 'Waarom menu-engineering met 0.0?', '["Stijlwissel volgt gerechtgewicht en houdt pairing geloofwaardig", "Eén glas voor alles is efficiënter", "Minder werk voor bediening", "Geen uitleg nodig"]', 0, 'Correct: Stijlwissel volgt gerechtgewicht en houdt pairing geloofwaardig'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 6, 'Lunchrestaurant wil alcoholvrije pairing. Eerste stap?', '["Gerechtstructuur analyseren op vet, zout en umami per gang", "Alleen goedkoopste 0.0 bestellen", "Alleen wijn behouden", "Geen kaartwijziging"]', 0, 'Correct: Gerechtstructuur analyseren op vet, zout en umami per gang'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 7, 'Gast wil ''geen wijn, wel beleving''. Positionering?', '["0.0 als volwaardige drankbegeleider met technische uitleg", "Frisdrank als enige optie", "Water zonder context", "Alleen digestief"]', 0, 'Correct: 0.0 als volwaardige drankbegeleider met technische uitleg'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 8, 'Contrast pairing voor spicy kip in menu?', '["Droge pils 0.0: bitter en koolzuur temmen capsaïcine", "Zoete blond zonder bitter", "Donker met zware mout", "Warm flat ale"]', 0, 'Correct: Droge pils 0.0: bitter en koolzuur temmen capsaïcine'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 9, 'Harmonie pairing voor lichte vis met boter?', '["Witbier of blond 0.0: restzoetheid en kruidigheid echoën gerecht", "Agressieve IPA", "Donker stoofprofiel", "Geen koolzuur"]', 0, 'Correct: Witbier of blond 0.0: restzoetheid en kruidigheid echoën gerecht'),
  ('pairing-beer-zero', 'bier-0-0-in-gastronomie', 10, 'Wat bewijs je met gastronomie-module?', '["0.0 op sommelier-niveau in menu''s en pairingcases", "Alleen marketinggroei", "Alleen sportpositionering", "Alleen merkkennis"]', 0, 'Correct: 0.0 op sommelier-niveau in menu''s en pairingcases'),
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
