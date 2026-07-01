-- Port track seed V2 (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 45 lessons · quizvragen per les
-- Bron: content/PORT_FINAL_CONTENT.md

delete from academy.tracks where slug = 'port';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'port',
  'Port',
  'Leer Port van Fundament tot Master: productie, proeven, stijlen, service, pairing en integratie.',
  1,
  now()
);

with t as (select id from academy.tracks where slug = 'port')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-port', 'Fundament', 1),
  ('explorer', 'productie-port', 'Productie & Terroir', 2),
  ('explorer', 'proeven-port', 'Proeven & Analyse', 3),
  ('specialist', 'oorsprong-port', 'Oorsprong & Identiteit', 4),
  ('specialist', 'portstijlen', 'Specialist Styles I', 5),
  ('specialist', 'portstijlen-verdiept', 'Specialist Styles II', 6),
  ('master', 'service-port', 'Service & Bewaren', 7),
  ('master', 'pairing-port', 'Food Pairing & Gastronomie', 8),
  ('master', 'examen-port', 'Integratie & Mastery', 9)
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
    'Na deze les kun jij uitleggen wat Port is, waarom fortificatie het karakter bepaalt en hoe je Port onderscheidt van gewone tafelwijn.
',
    'Port is een versterkte wijn uit het noordoosten van Portugal, geboren in de steile wijngaarden van de Douro-vallei. Waar een gewone wijn zijn alcohol uitsluitend uit gisting haalt, krijgt Port tijdens of direct na de fermentatie een scheut neutrale drankalcohol — en daardoor een vast karakter: rijk, zoet en warm.

Die versterking is geen truc om wijn sterker te maken, maar een productiemethode met diepe wortels. De druiven worden geplet en gegist tot ongeveer halverwege; dan stopt de gisting doelbewust. Wat overblijft is natuurlijke restsuiker, geconcentreerd fruit en een alcoholgehalte dat meestal tussen de negentien en tweeëntwintig procent ligt.

Het resultaat is geen dessertwijn op toeval, maar een bewuste stijl. Ruby Port blinkt uit in fris rood fruit; Tawny ontwikkelt noten en karamel door langere houtcontact; Vintage Port is de koning van rijpingspotentieel. Witte en rosé-varianten tonen dat Port meer is dan één smaakbeeld.

Wie Port leert lezen, begint bij herkomst en methode. De Douro levert de druiven, de quinta de expertise, Vila Nova de Gaia de rijpingstraditie.


## Food pairing

### Beste pairing

Blauwschimmelkaas, pure chocolade en chocoladefondant.

### Waarom dit werkt

Zoetheid en concentratie vangen zout in blauwschimmelkaas en bitter in pure chocolade; alcohol snijdt door vet zodat fruit en caramel niet plakkerig worden.

### Vermijd

Citrusdesserts of zure gerechten.

## Pro insight

Gasten die Port ''te zoet'' vinden, hebben vaak alleen basis-Ruby geproefd. Herinterpreteer: vraag naar moment en gerecht vóór je stijl noemt — White Port of oudere Tawny opent vaak de deur naar verkoop.',
    '- versterkte wijn
- Douro
- restsuiker
- fortificatie
- stijlkeuze
',
    'De Douro is sinds 1756 een van ''s werelds eerste officieel afgebakende wijngebieden — decennia vóór Bordeaux zijn classificatiesystemen bestonden.
',
    '- Port is een versterkte wijn uit de Portugese Douro-vallei
- Gisting stopt vroegtijdig, waardoor zoetheid en alcohol hoog blijven
- Stijlen variëren van frisse Ruby tot rijpe Tawny en krachtige Vintage
- Herkomst en productiemethode bepalen smaak meer dan het etiket alleen
',
    '### Opdracht

Voeg een Port toe in je Way of Tasting-app en registreer:

- stijl
- aankoopprijs
- bewaarpotentieel
- ideaal drinkmoment
- food pairing
- proefnotitie


### Reflectievraag

Welk element — restsuiker, alcohol of herkomst — zou jij als eerste benoemen om een tafelwijn-drinker te laten begrijpen waarom Port anders proeft?',
    8,
    1
  ),
  (
    'fortificatie',
    'Fortificatie',
    'Na deze les kun jij uitleggen hoe fortificatie werkt, welke rol aguardente speelt en waarom timing bepalend is voor restsuiker en smaak.
',
    'Fortificatie is het hart van elke Port. Tijdens de fermentatie wordt wijnalcohol (aguardente) toegevoegd — een neutrale, hoge alcohol gedistilleerd uit druiven. Die scheut doodt de gisten en stopt de omzetting van suiker in alcohol onmiddellijk.

Wat op dat moment in de tank zit, bepaalt het eindproduct. Stop je vroeg, blijft veel restsuiker over en krijg je een zoete, fruitige basis voor Ruby of Vintage. Wacht je langer, verdwijnt meer suiker en wordt de wijn droger en structuurrijker — minder typisch voor klassieke Port, maar wel leerzaam om te begrijpen waarom timing alles is.

De aguardente zelf mag je niet proeven als ''Port''. Hij is een instrument: zonder eigen smaakdominantie, puur om de gisting te breken. De kunst van de winemaker zit in het moment van toevoegen, de temperatuur van de fermenterende most en de verhouding tussen wijn en alcohol.

Daardoor is fortificatie geen bijzaak maar de definitie van de categorie. Zonder die ingreep zou de Douro droge rode wijnen opleveren — prachtig, maar niet Port. De restsuiker die overblijft, geeft body, ronde textuur en het vermogen om decennia te rijpen zonder uit te drogen.


## Food pairing

### Beste pairing

Ruby met donkere chocolade of gedroogde vijgen.

### Waarom dit werkt

Restsuiker na fortificatie balanceert zout in oude kaas; alcohol en structuur dragen vet in notige gerechten zonder dat de wijn plat aanvoelt.

### Vermijd

Scherpe zuren.

## Pro insight

Fortificatie is geen detail op het etiket maar het smaakcontract van Port. Leg in één zin uit dat timing suiker én alcohol vastlegt — dat voorkomt discussies over ''natuurlijke'' zoetheid achteraf.',
    '- fortificatie
- aguardente
- restsuiker
- timing
- gisting
',
    'Aguardente voor Port moet minimaal 77% alcohol bevatten volgens de regels — een veel hoger percentage dan de uiteindelijke wijn, zodat een kleine hoeveelheid volstaat.
',
    '- Fortificatie = toevoegen van aguardente tijdens fermentatie
- De gisting stopt; restsuiker blijft bewust achter
- Vroege fortificatie geeft zoetere, fruitigere Port
- Timing en temperatuur zijn beslissend voor stijl en balans
- Zonder fortificatie bestaat Port als categorie niet
',
    '### Opdracht

Teken een eenvoudige tijdlijn van de Portproductie: van oogst tot fortificatie. Markeer het moment waarop aguardente wordt toegevoegd en noteer wat er met suiker en alcohol gebeurt vóór en na dat punt.

### Checklist

- Ik kan uitleggen wat aguardente doet in de tank
- Ik begrijp het verband tussen timing en restsuiker
- Ik kan beschrijven waarom vroege fortificatie zoeter Port geeft
- Ik zie fortificatie als kernstap, niet als bijdetail


### Reflectievraag

Stel: de most zit op 8° alcohol en gisting gaat door. Wat verandert er in het glas als je nog één dag wacht met fortificatie — en waarom is die timing niet uitstelbaar?',
    8,
    2
  ),
  (
    'waarom-is-port-uniek',
    'Waarom is Port uniek?',
    'Na deze les kun jij benoemen waarom Port uniek is ten opzichte van gewone wijn, en hoe terrassen en traditie het karakter van de Douro vormen.
',
    'Port is meer dan ''zoete rode wijn''. Het is het product van een landschap dat bijna niet voor wijnbouw lijkt gemaakt: steile hellingen, extreme hitte en schistose bodems waar wortels diep moeten zoeken. Geen ander versterkt wijngebied combineert zo''n terrein met zo''n strikte traditie.

Tegenover gewone wijn staat Port als bewuste onderbreking van natuur. Tafelwijn laat de gisting uitlopen; Port grijpt in. Dat verschil klinkt technisch, maar proef je direct: meer body, warmte, zoetheid en een concentratie die droge wijnen zelden evenaren — zelfs niet uit dezelfde druiven.

De terrassen — socalcos — zijn het visitekaartje van de Douro. Generaties lang bouwden boeren met hand en steen plateaus in de rots. Die terrassen beperken opbrengst, verbeteren drainage en geven elke rij zon en wind. Traditie is hier geen folklore maar productielogica: hoe je oogst, hoe je treedt en hoe je druiven transporteert bepaalt kwaliteit.

Die combinatie maakt Port uniek: een gewone wijnstijl zou hier onder hetzelfde terroir anders smaken, maar zonder fortificatie en zonder de culturele keten van quinta, lodge en rijping in Gaia zou het karakter verloren gaan. Uniek is Port omdat landschap, methode en geschiedenis onlosmakelijk verbonden zijn.


## Food pairing

### Beste pairing

Vintage Port met Stilton.

### Waarom dit werkt

Concentratie uit terroir matcht intense smaken: zout, umami en vet vragen een wijn met body en zoetheid die niet verdwijnt na één hap.

### Vermijd

Lichte visgerechten.

## Pro insight

Uniek in Port is de combinatie terroir + methode + geschiedenis — bijna niet kopieerbaar. Vraag bij elk advies: welke van die drie proef je terug in het glas?',
    '- terroir
- terrassen
- schist
- traditie
- concentratie
',
    'Sommige terrassen in de Douro zijn zo steil dat druiven nog altijd per mand naar beneden worden gedragen — machines kunnen er simpelweg niet bij.
',
    '- Port onderscheidt zich door fortificatie én door zijn herkomst
- Gewone wijn en Port uit dezelfde regio delen druiven, niet methode
- Terrassen maken extreme wijnbouw mogelijk op schist
- Traditie in oogst en transport beschermt kwaliteit
- Uniekheid = landschap + ingreep + eeuwenoude keten
',
    '### Opdracht

Zoek een foto of video van Douro-terrassen. Beschrijf in vijf zinnen hoe het landschap productie beïnvloedt — denk aan zon, helling en handarbeid.

### Checklist

- Ik kan Port vergelijken met gewone wijn op methode en smaak
- Ik begrijp waarom terrassen essentieel zijn in de Douro
- Ik kan traditie koppelen aan kwaliteit, niet alleen aan toerisme
- Ik zie het verband tussen terroir en versterkte stijl


### Reflectievraag

Welke Douro-factor — terrassen, schist of lage opbrengst — proef je het eerst terug in een jonge Ruby, en hoe zou je dat aan een gast verklaren?',
    8,
    3
  ),
  (
    'geschiedenis-van-port',
    'Geschiedenis van Port',
    'Na deze les kun jij de belangrijkste lijnen in de Portgeschiedenis schetsen: de rol van de Britten, lodges in Vila Nova de Gaia en de internationale handel.
',
    'De geschiedenis van Port is ook een handelsverhaal. In de zeventiende en achttiende eeuw zochten Britse kooplieden alternatieven voor Franse wijn, die door conflicten schaars en duur werd. Portugal — en vooral de Douro — werd hun nieuwe bron. De Britten investeerden, kochten quinta''s en bouwden een netwerk dat de categorie voor altijd kleurde.

Omdat de reis over zee lang en heet was, voegden handelaren alcohol toe om wijn houdbaar te houden. Wat als noodgreep begon, werd de standaard: fortificatie als kwaliteitsmerk. Engelse namen op flessen — Taylor''s, Graham''s, Warre''s — herinneren nog aan die periode; veel ''Port houses'' zijn Brits van oorsprong.

Vila Nova de Gaia, aan de overkant van Porto, werd het centrum van rijping en handel. Daar staan de lodges: grote pakhuizen met lage kelders waar vaten jarenlang rusten, beschermd tegen de hitte van de Douro-vallei. Druiven worden in het hete oosten geoogst; de wijn reist westwaarts om rustig te rijpen nabij de Atlantische koelte.

Handel trok regelgeving na zich aan. De demarcatie van 1756 en latere controles beschermden herkomst en reputatie. Vandaag is Port een symbool van Portugese trots met internationale wortels — zonder die Britse lodges en zeeroutes had de stijl nooit dezelfde wereldstatus bereikt.


## Food pairing

### Beste pairing

Colheita met notentaart.

### Waarom dit werkt

Historische exportparen (Stilton, noten) zijn gebouwd op zout-zoet en vet-alcohol — dezelfde structuurlogica die Britse lodges eeuwenlang toepasten.

## Pro insight

Geschiedenis verklaart waarom Port wereldwijd heet naar Porto, terwijl de druiven honderd kilometer oostwaarts groeien. Dat onderscheid gebruik je om herkomst serieus te nemen in service en verkoop.',
    '- handel
- lodge
- Gaia
- Britten
- geschiedenis
',
    'Veel beroemde Portmerken dragen nog steeds Britse familienamen, hoewel de productie volledig in Portugal plaatsvindt en onder Portugese regels valt.
',
    '- Britten zochten in Portugal wijn toen Frankrijk moeilijk bereikbaar was
- Fortificatie werd handelslogica voor houdbaarheid op zee
- Lodges in Vila Nova de Gaia werden het rijpingshart
- Handel leidde tot bescherming van herkomst en kwaliteit
- Geschiedenis verklaart Engelse namen op Portugese iconen
',
    '### Opdracht

Kies één historisch Portmerk met een Britse naam. Zoek op wanneer het werd opgericht en waar de lodges liggen. Noteer in drie zinnen het verband tussen handel en huidige reputatie.

### Checklist

- Ik kan de rol van Britse handelaren benoemen
- Ik weet waarom Vila Nova de Gaia belangrijk is
- Ik begrijp lodges als rijpingscentra, niet als wijngaarden
- Ik kan geschiedenis koppelen aan wat op het etiket staat


### Reflectievraag

Waarom exporteerden Britse handelshuizen vanuit Gaia in plaats van direct uit de Douro-wijngaarden — en wat zegt dat nog over Port-identiteit vandaag?',
    8,
    4
  ),
  (
    'portcategorieen',
    'Portcategorieën uitgelegd',
    'Na deze les kun jij de hoofdcategorieën Ruby, Tawny, White en Vintage benoemen en uitleggen wat elk type in het glas betekent.
',
    'De wereld van Portcategorieën lijkt complex, maar rust op een handvol hoofdstromen. Ruby is de jonge, fruitige gezicht van Port: korte houtlagering, dieprode kleur, bramen en kers. Hij moet levendig en direct zijn — geen geduld voor jaren in vat.

Tawny rijpt lang in hout en krijgt zijn naam van de bruine tint. Noten, karamel, gedroogd fruit en zachte zuur domineren. Een Tawny 10 of 20 Years is een blend van vaten met een gemiddelde rijpingsleeftijd, geen exacte jaargang. Hij is de meester van consistentie en oxidatieve elegantie.

White Port wordt van witte druiven gemaakt en varieert van fris-droog tot rijk-zoet. Met tonic of puur als aperitief toont hij dat Port niet alleen rood is. Vintage Port is de topcategorie: wijn van één uitzonderlijk jaar, korte houtlagering, lange flesrijping. Hij is krachtig, tanninerijk en gebouwd voor decennia in de kelder.

Wie portcategorieën leest, kijkt naar kleur, rijping en intentie. Ruby voor nu, Tawny voor zachte rijpheid, White voor verrassende frisheid, Vintage voor verzamelaars en lange diners. Het etiket vertelt welke route de wijn nam.


## Food pairing

### Beste pairing

Ruby → chocolade 
Tawny → pecannotentaart 
White → olijven 
Vintage → Stilton

### Waarom dit werkt

Ruby: fruit en tannine tegen bittere cacao; Tawny: oxidatie en karamel tegen noten; White: frisheid tegen zout; Vintage: structuur tegen krachtige kaas.

## Pro insight

Beginners kiezen Port op leeftijd; professionals op moment. Vraag niet ''wat is de oudste?'' maar ''wat past nu?'' — dat voorkomt mispairings en dode voorraad.',
    '- Ruby
- Tawny
- Vintage
- White Port
- portcategorieën

---
### Module 2 — Productie & Terroir

**Level:** Explorer
**Framework pillar:** Productie
**Module goal:** Begrijp druiven, Douro, terroir, hout en oxidatie als bouwstenen van elke Portstijl.
',
    'Een ''Tawny 20 Years'' betekent dat de blend gemiddeld twintig jaar op hout heeft gerijpt — niet dat elke druppel precies twintig jaar oud is.
',
    '- Ruby: jong, fruitig, weinig houtinvloed
- Tawny: lang op hout, noten en karamel
- White Port: witte druiven, vaak als aperitief
- Vintage: topjaar, flesrijping, groot potentieel
- Categorie bepaalt wanneer en hoe je schenkt
',
    '### Opdracht

Vergelijk online of in de winkel etiketten van één Ruby, één Tawny en — indien mogelijk — één White Port. Noteer per fles kleur, vermelde leeftijd en serveradvies.

### Checklist

- Ik kan Ruby en Tawny op rijping en smaak onderscheiden
- Ik weet wat Vintage Port inhoudelijk belooft
- Ik ken de rol van White Port als aperitief
- Ik lees portcategorieën bewust op het etiket


### Reflectievraag

Een gast wil één Port voor kaas én pure chocolade: welke categorie kies jij, welk compromis accepteer je en wat leg je uit over structuur versus leeftijd?',
    10,
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
    'Na deze les kun jij de belangrijkste Portdruiven benoemen en uitleggen hoe een blend van Touriga Nacional, Touriga Franca, Tinta Roriz en Tinto Cão de productie stuurt.
',
    'Port is zelden een monodruivenwijn. In de Douro plant men tientallen rassen door elkaar; na oogst worden ze samen vergist. Die blend is geen compromis maar productiestrategie: elk ras levert een ander element — kleur, structuur, aroma of verfijning — en de winemaker assembleert in de tank wat later Ruby, Tawny of Vintage wordt.

Touriga Nacional is de koning van concentratie. Kleine trossen, dikke schil, diep paars fruit en stevige tannines. Hij geeft Ruby zijn intensiteit en Vintage zijn rijpingsskelet. Zonder Nacional mist Port vaak pit en lengte.

Touriga Franca brengt bloemigheid en elegantie; hij rijpt betrouwbaar op warme hellingen en vult de structuur van Nacional aan zonder te overheersen. Tinta Roriz (Tempranillo) levert volume, rood fruit en een ronde mid-palate — onmisbaar in grote blends voor consistentie.

Tinto Cão is het geheime wapen voor finesse: laag opbrengst, laat rijpend, maar aromatisch complex met kruidige verfijning. In de productie bepaalt de verhouding van deze vier — op welke terrassen ze staan en hoe ze in de lagares worden geplet — het verschil tussen middelmatige bulk en een Port die decennia meegaat.


## Food pairing

### Beste pairing

LBV met pure chocolade of harde oude kaas.

### Waarom dit werkt

Blendcomplexiteit vraagt gelaagde smaken: zout, bitter en umami in kaas of chocolade geven het fruit en de structuur van de wijn iets om tegen te werken.

## Pro insight

Vraag niet ''welke druif proef ik?'' maar ''welke rol speelt deze druif?'' — blenddenken is hoe sommeliers Port analyseren en blind elimineren.',
    '- blend
- Touriga Nacional
- Touriga Franca
- Tinta Roriz
- Tinto Cão
',
    'Een enkele Douro-wijngaard kan meer dan twintig verschillende druivenrassen bevatten; de blend ontstaat al in het veld, vóór de lagares.
',
    '- Port is vrijwel altijd een blend van meerdere rassen
- Touriga Nacional levert concentratie en structuur
- Touriga Franca en Tinta Roriz vullen fruit en body aan
- Tinto Cão voegt aromatische finesse toe
- Productie begint bij raskeuze op de terrassen
',
    '### Opdracht

Zoek op het etiket of de site van een Portproducent welke druiven worden genoemd. Koppel elk ras aan een rol: structuur, fruit, finesse of volume.

### Checklist

- Ik kan vier kernrassen van Port benoemen
- Ik begrijp waarom blend productie-logica is
- Ik kan Touriga Nacional koppelen aan concentratie
- Ik zie druivenkeuze als start van de kwaliteitsketen


### Reflectievraag

Je proeft kracht maar weinig finesse in een blend: welk ras zou jij verhogen of verlagen — Touriga Nacional, Tinta Roriz of Tinto Cão — en waarom?',
    8,
    1
  ),
  (
    'douro-vallei',
    'De Douro-vallei',
    'Na deze les kun jij de subregio''s Baixo Corgo, Cima Corgo en Douro Superior benoemen en uitleggen hoe terrassen en ligging de productie beïnvloeden.
',
    'De Douro-vallei is geen uniform landschap. Van west naar oost verandert klimaat, regen en hitte — en daarmee de druiven die je oogst. Wijnwet en traditie delen het gebied in Baixo Corgo, Cima Corgo en Douro Superior; voor de producent is die indeling een routekaart voor stijl en opbrengst.

Baixo Corgo, het westelijkste deel, krijgt relatief meer neerslag en is koeler. Hier zijn opbrengsten hoger en wijnen vaak zachter en eerder drinkbaar. Productie richt zich hier vaker op volume voor basis-Ruby en blends — niet minderwaardig, maar ander profiel door meer water en minder stress.

Cima Corgo is het hart van kwaliteits-Port. Steilere terrassen, meer zon en schistere hellingen leveren geconcentreerde druiven voor Vintage en premium blends. Veel beroemde quinta''s liggen hier; de productie vraagt intensief werk per kilo druif.

Douro Superior, het oostelijkste en droogste deel, is extreem heet en arid. Lage opbrengst, dikke schillen en krachtige wijnen. Terrassen en irrigatiebeheer zijn hier overleving en kwaliteit tegelijk. Wie de Douro-vallei begrijpt, leest op de kaart al welke Port hij kan verwachten — vóór de eerste slok.


## Food pairing

### Beste pairing

Vintage Port met wild.

### Waarom dit werkt

Tannine en concentratie uit Douro Superior-fruit dragen wild en gamey eiwit; zoetheid temt geen vlees maar balanceert brasaus en vet.

## Pro insight

Subzone op het etiket of in het verhaal van de producent voorspelt vaak concentratie en stijl. Vraag altijd: waar binnen de Douro komt deze Port vandaan?',
    '- Baixo Corgo
- Cima Corgo
- Douro Superior
- terrassen
- opbrengst
',
    'Douro Superior was lang het minst beplante deel van de vallei vanwege extreme hitte en beperkte infrastructuur — modern beheer maakt het nu een bron van krachtige wijnen.
',
    '- Baixo Corgo: koeler, meer regen, hogere opbrengst
- Cima Corgo: kwaliteitshart met steile terrassen
- Douro Superior: heet, droog, geconcentreerde druiven
- Subregio bepaalt productieprofiel en blendkeuze
- Terrassen maken wijnbouw op alle drie de delen mogelijk
',
    '### Opdracht

Bekijk een kaart van de Douro-vallei en markeer Baixo Corgo, Cima Corgo en Douro Superior. Koppel per subregio één productiekenmerk (opbrengst, concentratie of arbeidsintensiteit).

### Checklist

- Ik kan drie subregio''s van de Douro-vallei benoemen
- Ik begrijp hoe ligging opbrengst beïnvloedt
- Ik zie terrassen als productie-infrastructuur
- Ik kan subregio koppelen aan Portstijl


### Reflectievraag

Als je alleen het etiket ziet ''Douro Superior'', welke productieverwachting zet je — opbrengst, concentratie of drinkrijpheid — en hoe onderbouw je dat?',
    8,
    2
  ),
  (
    'klimaat-en-terroir',
    'Klimaat en terroir',
    'Na deze les kun jij uitleggen hoe hitte, schist en lage opbrengst in de Douro het terroir vormen en de Portproductie bepalen.
',
    'Terroir in de Douro is geen abstract begrip maar dagelijkse realiteit op de terrassen. Extreme hitte in de zomer, koude nachten in hoger gelegen percelen en weinig regen dwingen de wijnstok tot spaarzaamheid. De plant levert minder trossen, maar met dikke schillen en geconcentreerd sap — precies wat fortificatie later versterkt.

Schist is de tweede pijler. De rotsachtige bodem slaat weinig water op maar warmt overdag op en geeft warmte ''s nachts terug. Wortels kruipen meters diep door kieren op zoek naar vocht. Die strijd geeft minerale spanning en structuur in de druif — onmisbaar voor Vintage en lang rijpende blends.

Lage opbrengst klinkt economisch onaantrekkelijk, maar voor Port is het een kwaliteitskeuze. Meer kilo''s per hectare verdunnen kleur en tannine; minder opbrengst betekent rijker extract per liter most. Producenten snoeien, groen oogsten en selecteren op de lagares om die concentratie te bewaren.

Klimaat en terroir werken samen: hitte rijpt suikers, schist geeft stress en mineraal, lage opbrengst houdt intensiteit in balans. Wie dat begrijpt, proeft niet alleen zoetheid maar ook de dorre kracht van een vallei die wijn maakt tegen alle odds.


## Food pairing

### Beste pairing

Vintage met oude Comté.

### Waarom dit werkt

Minerale spanning en concentratie uit stress-terroir passen bij rijpe kaas en noten: zout en vet versterken body zonder zuurconflict.

## Pro insight

Hitte en schist zijn geen achtergronddecoratie — ze verklaren waarom Port structuur en concentratie kan dragen die tafelwijn zelden heeft.',
    '- terroir
- schist
- klimaat
- stress
- concentratie
',
    'Wortels van oude Douro-stokken kunnen meer dan tien meter diep door schist reiken — diep genoeg om ook in droge zomers vocht te vinden.
',
    '- Hitte rijpt druiven snel en verhoogt suikergehalte
- Schist geeft warmte, drainage en minerale stress
- Lage opbrengst levert geconcentreerder sap voor Port
- Terroir bepaalt extract vóór fortificatie
- Productie begint bij klimaat en bodem, niet in de lodge
',
    '### Opdracht

Lees een wijnbeschrijving van een Douro-Port en onderstreep woorden die wijzen op hitte, mineraliteit of concentratie. Koppel elk woord aan terroir of productiekeuze.

### Checklist

- Ik kan hitte koppelen aan rijping en suiker
- Ik begrijp de rol van schist in de Douro
- Ik zie lage opbrengst als kwaliteitsinstrument
- Ik gebruik terroir actief bij het lezen van proefnotities


### Reflectievraag

Waar zie jij terroir het duidelijkst: in de opbrengst per hectare, in de minerale spanning of in de structuur van de wijn — en welk voorbeeld gebruik je?',
    8,
    3
  ),
  (
    'houtlagering',
    'Houtlagering',
    'Na deze les kun jij uitleggen hoe vatgrootte, oxidatie en rijpingsduur het verschil maken tussen fruitbewaring in Ruby en transformatie in Tawny.
',
    'Na fortificatie begint het tweede hoofdstuk: houtlagering. Port rust niet alleen op druiven en alcohol, maar op tijd in vat. Hout ademt, laat zuurstof langzaam binnen en geeft vanille, noten en zachtheid — maar ook verliest fruit en kleur naarmate de jaren tellen.

Grote vaten — pipas van honderden liters — geven minder houtsmaken per liter wijn en zijn ideaal voor langzame, elegante rijping. Tawny''s en oudere blends slapen hier vaak jarenlang; oxidatie is mild en geleidelijk. Kleine vaten (barriques) werken sneller: meer oppervlak per liter, meer extract, meer invloed in korte tijd. Ze worden spaarzaam gebruikt, maar kunnen structuur aanscherpen.

De keuze tussen groot en klein is een stijlbeslissing. Ruby Reserve rijpt kort op relatief neutraal hout om fruit te bewaren; Tawny 20 Years draait om consistentie in grote vaten over decennia. Vintage Port ziet slechts korte lagering in vat voordat de fles de rijping overneemt — juist om kracht en tannine te behouden.

Houtlagering is dus geen uniform proces maar een toonregelaar voor stijl. Wie begrijpt welk vat wanneer wordt ingezet, kan van kleur en aroma aflezen welke route de wijnmaker koos — en waarom Ruby fris blijft terwijl Tawny naar karamel neigt.


## Food pairing

### Beste pairing

20 Years Tawny met crème brûlée.

### Waarom dit werkt

Karamel in dessert en karamel in Tawny delen oxidatieve aroma''s; textuur in crème brûlée en mondgevoel in oude Port lopen gelijk op.

## Pro insight

Oude Tawny hoeft zelden gedecanteerd; Vintage bijna altijd. Dat onderscheid voorkomt de meest voorkomende servicefout bij Port.',
    '- houtlagering
- pipa
- oxidatie
- vatgrootte
- stijlarchitectuur
',
    'Traditionele pipas in Gaia kunnen meer dan 500 liter bevatten — hun grootte is mede de reden dat Tawny zo zacht en geleidelijk rijpt.
',
    '- Houtlagering geeft oxidatie, noten en zachtheid
- Grote vaten: langzame, milde rijping voor Tawny
- Kleine vaten: snellere houtinvloed, spaarzaam ingezet
- Tijd in vat bepaalt fruit versus karamel
- Stijl volgt uit vatkeuze en rijpingsduur
',
    '### Opdracht

Vergelijk proefnotities van een jonge Ruby en een Tawny 10 Years. Noteer drie smaakverschillen en koppel elk aan houtlagering (kort/lang, groot/klein vat).

### Checklist

- Ik kan uitleggen wat houtlagering met Port doet
- Ik ken het verschil tussen grote en kleine vaten
- Ik begrijp waarom Vintage kort op hout rijpt
- Ik lees stijl terug uit rijpingskeuzes


### Reflectievraag

Wanneer zou jij bewust kiezen voor korte houtlagering boven lange oxidatieve houtlagering — en welke stijl verliest daarbij het meest?',
    8,
    4
  ),
  (
    'oxidatie-uitgelegd',
    'Oxidatie uitgelegd',
    'Na deze les kun jij het oxidatieve verschil tussen Ruby en Tawny uitleggen en herkennen hoe zuurstof en hout het smaakprofiel sturen.
',
    'Oxidatie klinkt negatief bij tafelwijn, maar bij Port is het vaak gewenst — mits beheerst. Zuurstof reageert met aroma''s en kleurpigmenten; fruit verandert in noten, karamel en gedroogd fruit. Het verschil tussen Ruby en Tawny is grotendeels het verschil in hoeveel oxidatie de wijn meekrijgt.

Ruby wordt bewust beschermd tegen langdurige oxidatie. Korte houtcontact, grote volumes, soms roestvrij staal — alles om het bramenfruit en de paarse kleur te houden. Ruby ademt even, maar leeft in een relatief gereduceerde wereld. Daarom proef je jeugd, energie en tannine structuur.

Tawny omarmt oxidatie. Jaren in hout met gecontroleerde toegang van zuurstof verbleekt de kleur naar amber en bouwt lagen van hazelnoot, koffie en toffee. Dit is geen bederf maar stijl: de wijnmaker kiest voor tijd en transformatie. Een Tawny 20 Years is het schoolvoorbeeld van bewuste oxidatieve rijping.

Wie oxidatie begrijpt, proeft blind sneller Ruby versus Tawny. Niet alleen op kleur, maar op logica in het smaakprofiel: vers fruit versus gekookt fruit, structuur versus zachtheid. Oxidatie uitgelegd is dus de sleutel tot de twee gezichten van rode Port.


## Food pairing

### Beste pairing

30 Years Tawny met pecannotentaart.

### Waarom dit werkt

Ruby''s fruitige structuur balanceert zout; Tawny''s oxidatie spiegelt noten — de zuurstofkeuze in rijping bepaalt welke pairing logischer is.

## Pro insight

Oxidatie is bij Port vaak stijl, geen fout. Leer gasten dat Ruby en Tawny bewuste zuurstofkeuzes zijn — dat maakt blindproeven en advies logischer.',
    '- oxidatieve rijping
- Ruby
- Tawny
- reductie
- zuurstof

---
### Module 3 — Proeven & Analyse

**Level:** Explorer
**Framework pillar:** Proeven
**Module goal:** Leer Port systematisch proeven: kleur, aroma, structuur en kwaliteitsindicatoren.
',
    'Een Ruby die per ongeluk jarenlang open in vat staat, ontwikkelt Tawny-achtige noten — hetzelfde chemische proces, maar dan zonder planning.
',
    '- Oxidatie verandert fruit in noten en karamel
- Ruby: weinig oxidatie, behoud van fruit en kleur
- Tawny: langdurige oxidatieve rijping op hout
- Zuurstofbeheer is een bewuste stijlkeuze
- Blind proeven: vers versus gekookt fruit als hint
',
    '### Opdracht

Proef of vergelijk beschrijvingen van Ruby en Tawny naast elkaar. Noteer per glas drie aroma''s en label ze als ''oxidatief'' of ''reductief/fris''.

### Checklist

- Ik kan oxidatie in begrijpelijke taal uitleggen
- Ik proef het verschil tussen Ruby en Tawny
- Ik koppel noten/karamel aan oxidatieve rijping
- Ik herken fruitbehoud als Ruby-kenmerk


### Reflectievraag

Je proeft noten maar ook fris fruit: wijst dat op Ruby, Tawny of een hybride rijpingsroute — en welke observatie beslist voor jou?',
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
    'Na deze les kun jij een gestructureerde proefnotitie van Port opstellen volgens de Way-of-Tasting-methode: kleur, neus, smaak, structuur en conclusie.
',
    'Professioneel Port proeven begint niet bij de eerste slok, maar bij een vaste volgorde die je zintuigen trainen. De Way-of-Tasting-structuur — kleur, neus, smaak, structuur en conclusie — geeft houvast zodat elke proefnotitie vergelijkbaar en betrouwbaar wordt. Bij kleur let je op diepte, randtint en viscositeit: robijnrood wijst vaak op Ruby, amber op Tawny. De neus levert de eerste stijlhint: vers fruit versus noten en karamel. Bij smaak en structuur analyseer je zoetheid, zuur, alcohol, tannine en body als één geheel — niet als losse checklist. Pas in de conclusie verbind je alle waarnemingen: jong of oud, fruitig of oxidatief, welke stijl past bij dit profiel? Een goede proefnotitie is geen poëzie, maar een compact verslag dat je later kunt herlezen en vergelijken. Herhaling maakt van losse indrukken herkenbare patronen.


## Food pairing

### Beste pairing

Ruby Reserve met pure chocolade.

### Waarom dit werkt

Pairing begint bij structuuranalyse: zoetheid, tannine en alcohol bepalen of zout, vet of bitter in het gerecht gedragen wordt.

## Pro insight

Een proefnotitie zonder structuur is marketing. Train op kleur → neus → mondgevoel → conclusie tot het automatisch gaat — ook onder tijdsdruk.',
    '- proefnotitie
- kleur
- neus
- mondgevoel
- conclusie
',
    'Sommeliers bewaren proefnotities soms jarenlang — niet uit sentiment, maar omdat vergelijken over tijd laat zien hoe je neus en smaak scherper worden.
',
    '- Way-of-Tasting: kleur → neus → smaak → structuur → conclusie
- Kleur en viscositeit geven eerste stijl- en kwaliteitsaanwijzingen
- De neus onthult fruit, rijping en oxidatieve tonen vóór je proeft
- Structuur omvat zoetheid, zuur, alcohol, tannine en body tegelijk
- Conclusie koppelt waarnemingen aan stijl, leeftijd en kwaliteitsbeoordeling
',
    '### Opdracht
Proef één glas Port en schrijf een volledige proefnotitie in vijf stappen: kleur, neus, smaak, structuur en conclusie. Gebruik korte, feitelijke zinnen — geen marketingtaal.

### Checklist
- Ik heb kleur, randtint en viscositeit genoteerd
- Ik heb minimaal drie neusimpressies beschreven
- Ik heb smaak en structuur apart benoemd
- Mijn conclusie noemt stijl én onderbouwing


### Reflectievraag

Welke stap in je proefnotitie geeft jou nu de minste zekerheid — kleur, neus, structuur of conclusie — en wat oefen je daar concreet op?',
    10,
    1
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij de structuur van Port analyseren en alcohol, zoetheid, tannine en body bewust van elkaar onderscheiden.
',
    'Waar aroma''s vertellen wat je ruikt, beschrijft structuur hoe Port in de mond aanvoelt. Vier bouwstenen domineren: zoetheid, alcohol, tannine en body. Zoetheid komt van restsuiker na fortificatie — zij geeft volume en rondheid, maar zonder frisheid wordt Port log. Alcohol (meestal 19–22%) levert warmte en lengte; geïntegreerde alcohol voelt rond, branderige alcohol wijst op onevenwicht. Tannine geeft grip op het tandvlees — Ruby en Vintage tonen vaak meer tannine dan gerijpte Tawny. Body is het gewicht in de mond, los van alcoholpercentage: een Port kan krachtig aanvoelen zonder zwaar te zijn. Balans ontstaat wanneer geen enkele component overheerst. Professionals proeven structuur bewust vóór zij stijl benoemen — zoetheid alleen maakt nog geen grote Port.


## Food pairing

### Beste pairing

Vintage Port met Stilton.

### Waarom dit werkt

Structuurcomponenten voorspellen pairing: hoge tannine tegen eiwit, zoetheid tegen zout, alcohol tegen vet — dezelfde logica als bij kaas en dessert.

## Pro insight

Vraag bij elke slok: wat blijft hangen — zoetheid, alcohol of tannine? Dat vertelt waar de wijn op gebouwd is en voorkomt stijlverwarring.',
    '- zoetheid
- alcohol
- tannine
- body
- balans
',
    'Veel beginners focussen op zoetheid, terwijl zuur en tannine in top-Port vaak de echte kwaliteitsdragers zijn die de wijn levend houden.
',
    '- Structuur = mondgevoel: zoetheid, alcohol, tannine en body
- Zoetheid geeft rondheid; zuur en tannine houden Port fris en in balans
- Geïntegreerde alcohol voelt warm, niet branderig
- Body is gewicht in de mond — niet hetzelfde als alcoholpercentage
- Balans bepaalt of een Port compleet en hoogwaardig aanvoelt
',
    '### Opdracht
Proef twee Ports naast elkaar (bijvoorbeeld een jonge Ruby en een 10-year-old Tawny). Beoordeel per glas zoetheid, alcohol, tannine, body en totale balans.

### Checklist
- Ik heb zoetheid per glas gerangschikt
- Ik heb alcoholwarmte apart beoordeeld (niet verward met body)
- Ik heb tannine op tandvlees gevoeld
- Ik heb body en balans vergeleken


### Reflectievraag

Bij twee Ports met gelijke zoetheid proef jij één als zwaarder: welke structuurcomponent — alcohol, tannine of body — verklaart dat verschil?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma''s herkennen',
    'Na deze les kun jij de belangrijkste aroma''s in Port herkennen — fruit, kruiden, noten en oxidatieve tonen — en ze koppelen aan stijl en rijping.
',
    'De neus is bij Port vaak onthullender dan de mond. Vier aroma-families helpen bij ordenen: fruit, kruiden, noten en oxidatieve tonen. Fruitaroma''s — kers, braam, pruim, framboos — domineren vaak in jonge Ruby en wijzen op druif en jeugd. Kruiden en specerijen (peper, cacao, kaneel) geven diepte en komen vooral naar voren in krachtige Vintage en complexe blends. Noten — walnoot, amandel, hazelnoot — en karamelachtige tonen signaleren rijping en langere hout- of zuurstofcontact. Oxidatieve tonen zoals toffee, vijg, gedroogd fruit en koffie zijn het visitekaartje van Tawny en oude Colheita. Door bewust te scannen op fruit versus kruiden versus noten versus oxidatie bouw je een aroma-bibliotheek op die blindproeven versnelt. Ruik meerdere keren: aroma''s evolueren in het glas naarmate de Port opent.


## Food pairing

### Beste pairing

Tawny 20 Years met walnotentaart.

### Waarom dit werkt

Aroma-families wijzen naar pairing: fruit naar rood fruitdessert, oxidatie naar noten, kruiden naar gekruide kaas — neus als eerste pairingfilter.

## Pro insight

Train op aroma-families (fruit, kruiden, noten, oxidatie), niet op losse woorden. Herhaling bouwt de neusbibliotheek die blindproeven versnelt.',
    '- fruitaroma
- kruiden
- noten
- oxidatieve tonen
- neus
',
    'Je neus kan duizenden geurtonen onderscheiden — veel meer dan je tong smaakpunten heeft. Daarom trainen professionals vooral op aroma-herkenning.
',
    '- Vier aroma-families: fruit, kruiden, noten en oxidatieve tonen
- Fruit domineert vaak in jonge Ruby; oxidatie wijst op Tawny en rijping
- Kruiden geven diepte en complexiteit in krachtige stijlen
- Noten en karamel zijn typische rijpings- en houtaroma''s
- Herhaald ruiken onthult hoe aroma''s in het glas evolueren
',
    '### Opdracht
Ruik aan één Port en noteer minimaal vijf aroma''s, verdeeld over fruit, kruiden, noten en oxidatieve tonen. Probeer daarna de stijl te benoemen op basis van je neus alleen.

### Checklist
- Ik heb minimaal één fruitaroma benoemd
- Ik heb gezocht naar kruidige of specerijachtige tonen
- Ik heb noten of karamel/oxidatie herkend (of bewust afwezig genoteerd)
- Ik heb een stijlhypothese op aroma gebaseerd


### Reflectievraag

Je ruikt karamel maar geen fruit: is dat oxidatie, houtlagering of leeftijd — en welke stijl zou jij daarop wedden vóór de eerste slok?',
    8,
    3
  ),
  (
    'ruby-vs-tawny-blind',
    'Ruby vs Tawny blind herkennen',
    'Na deze les kun jij Ruby en Tawny Port blind onderscheiden op kleur, aroma, structuur en oxidatie — met onderbouwde conclusie.
',
    'Blindproeven dwingt je om op waarneming te vertrouwen, niet op het etiket. Ruby versus Tawny is de klassieke eerste splitsing in Port. Kleur is vaak de snelste cue: diep robijnrood met paarsachtige rand wijst op Ruby; amber, oranjebruin en lichtere kern op Tawny door oxidatieve rijping. Op de neus contrasteert vers fruit (kers, braam) met oxidatie (walnoot, karamel, vijg). In de mond voelt Ruby energieker, fruitgedrevener en soms tanninerijker; Tawny is ronder, zachter en geïntegreerder. De afdronk bevestigt vaak je hypothese: Ruby eindigt korter en fruitiger, Tawny langer en notiger. Blindproeven werkt als een beslisboom: kleur → fruit of oxidatie? → structuur → afdronk → conclusie. Professionals formuleren cues als ''waarom'', niet alleen ''wat'' — dat bouwt zekerheid op voor examens en proefpanels.


## Food pairing

### Beste pairing

Ruby met chocolade.

Tawny met notendessert.

### Waarom dit werkt

Ruby: primair fruit en tannine bij chocolade; Tawny: oxidatie bij noten — blind herken je de pairingroute via oxidatie, niet via zoetheid alleen.

## Pro insight

Bij twijfel: oxidatie beslist, niet zoetheid alleen. Beide stijlen zijn zoet — wie op suiker gokt, verliest blindproeven structureel.',
    '- blindproeven
- Ruby
- Tawny
- kleur
- oxidatie
',
    'Ruby versus Tawny blind is een van de meest voorkomende proefvragen bij sommelier- en wijnexamens — precies omdat de cues goed leerbaar zijn.
',
    '- Blindproeven: cues uit kleur, geur, smaak, structuur en afdronk
- Robijnrood + vers fruit → Ruby; amber + noten/karamel → Tawny
- Ruby voelt energieker; Tawny ronder en oxidatief rijper
- Afdronk bevestigt: kort/fruitig versus lang/notig
- Onderbouw je conclusie met minimaal twee onafhankelijke cues
',
    '### Opdracht
Laat iemand twee Ports (Ruby en Tawny) blind schenken. Noteer per glas kleur, geur, structuur en afdronk voordat je stijl benoemt. Vergelijk daarna met het etiket.

### Checklist
- Ik heb kleur als eerste cue genoteerd
- Ik heb fruit versus oxidatie op de neus onderscheiden
- Ik heb structuur en afdronk gebruikt ter bevestiging
- Ik heb mijn conclusie met minimaal twee cues onderbouwd


### Reflectievraag

Bij twijfel tussen Ruby en Tawny: vertrouw jij eerst op kleur, oxidatie op de neus of mondgevoel — en welke cue heeft je het vaakst in de war gebracht?',
    10,
    4
  ),
  (
    'mini-toets-port-proeven',
    'Mini-toets Port Proeven',
    'Na deze les kun jij je kennis uit module drie integreren in een zelfstandige proefopdracht en je aanpak evalueren op systematiek en stijlherkenning.
',
    'Deze mini-toets is geen feitentoets maar integratie. Je combineert kleur, aroma, structuur, stijlherkenning en conclusie in één doorlopende analyse — precies zoals professionele proevers werken.

Werk gelaagd, niet lineair: elke observatie beïnvloedt de volgende. De valkuil is te vroeg concluderen. Eerst observeren, dan interpreteren, dan pas concluderen. De vraag is niet «wat vind ik lekker?» maar «wat gebeurt hier in het glas?» — dat is de kern van Way of Tasting.


## Food pairing

### Beste pairing

Kies zelf op basis van jouw analyse.

### Waarom dit werkt

Pairing volgt uit analyse: zoetheid tegen zout, tannine tegen vet, oxidatie tegen noten — pas de stijl aan wat je in het glas observeerde, niet omgekeerd.

## Pro insight

Objectiviteit wint van snelheid. Noteer eerst wat je ziet en proeft; stijl is conclusie, niet vertrekpunt — dat is het verschil tussen proeven en gokken.',
    '- integratie
- systematiek
- analyse
- stijlherkenning
- objectiviteit

---
### Module 4 — Oorsprong & Identiteit

**Level:** Specialist
**Framework pillar:** Oorsprong & Stijl
**Module goal:** Plaats Port in historische, culturele en regionale context.
',
    'Veel sommeliers bewaren proefnotities jarenlang — teruglezen laat zien hoe patroonherkenning sneller wordt na elke module.
',
    '- Module drie komt samen: proefnotitie, structuur, aroma''s en stijlherkenning
- Werk altijd in vaste stappen: kijken → ruiken → proeven → concluderen
- Blind cues (fruit vs oxidatie) helpen Ruby/Tawny te onderscheiden
- Notities maken objectiviteit en vergelijkbaarheid mogelijk
- Herhaling en reflectie versnellen professionele groei',
    '### Opdracht — Integrale mini-toets

Proef één of twee Ports blind (of met afgedekt etiket). Werk strikt in volgorde:

1. Kleur en viscositeit
2. Neus (fruit, kruiden, oxidatie)
3. Structuur (zoetheid, alcohol, tannine, body)
4. Conclusie stijl + leeftijdsindruk

Schrijf een korte proefnotitie. Vergelijk daarna met het etiket.

### Checklist

- Ik heb kleur vóór conclusie beschreven
- Ik heb structuur apart geanalyseerd
- Ik heb Ruby/Tawny of stijl onderbouwd
- Ik heb notities bewaard voor vergelijking later


### Reflectievraag

Waar ging je te snel naar conclusie in je mini-toets — en welke observatie had je eerder moeten vastleggen om objectiever te zijn?',
    12,
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
    'Na deze les kun jij uitleggen waar Port vandaan komt, waarom alleen de Douro officieel Port mag heten en welke rol Porto, Gaia en export daarin spelen.
',
    'Port is geen stijl die overal ter wereld mag worden gemaakt — het is een beschermde herkomstwijn uit Portugal, en preciezer uit de Douro-vallei in het noorden van het land. Net als Champagne alleen uit Champagne komt, mag de naam Port uitsluitend op versterkte wijn uit deze afgebakende regio. Historisch vloeide de wijn de Douro af naar de havenstad Porto; vandaar de wereldwijde naam, niet van de druif of kleur. Aan de overkant van de Douro, in Vila Nova de Gaia, stonden en staan de beroemde lodges — grote pakhuizen waar Port rijpte en van waaruit export naar Engeland en later de hele wereld vertrok. In 1756 werd de Douro officieel afgebakend — een van ''s werelds eerste gereguleerde wijnregio''s. Herkomst is geen marketing: extreme hitte, steile leisteenhellingen en lage opbrengsten in de Douro vormen de identiteit die elders niet te kopiëren is.


## Food pairing

### Beste pairing

Ruby Reserve met Manchego.

### Waarom dit werkt

Beschermde herkomst impliceert concentratie: zout in kaas en bitter in cacao vragen de structuur die alleen Douro-Port consistent levert.

## Pro insight

Vraag altijd: waar komt deze Port exact vandaan? Locatie vertelt vaak meer dan het label — essentieel bij verkoop van premium en Single Quinta.',
    '- herkomst
- Douro
- Porto
- lodge
- beschermde oorsprong
',
    'De stenen grensmarkeringen uit de Douro-regeling van 1756 zijn op sommige plekken in het landschap nog steeds zichtbaar.
',
    '- Port komt uitsluitend uit Portugal, regio Douro
- De naam Port verwijst naar de havenstad Porto en exporttraditie
- Lodges in Vila Nova de Gaia waren het historische rijp- en exportcentrum
- Beschermde herkomst (1756) waarborgt authenticiteit
- Douro-terroir — hitte, hellingen, leisteen — maakt Port uniek
',
    '### Opdracht
Zoek op een kaart de Douro-vallei, Porto en Vila Nova de Gaia. Teken de route van wijngaard naar rivier naar haven. Noteer in twee zinnen waarom export via Porto logisch was.

### Checklist
- Ik heb Douro, Porto en Gaia op de kaart gevonden
- Ik begrijp het verschil tussen productieregio en havenstad
- Ik kan uitleggen waarom herkomst beschermd is
- Ik ken het jaartal 1756 en de betekenis ervan


### Reflectievraag

Waarom mag champagne uit geen enkele andere regio komen, en welke parallel trek jij naar Port — los van marketing, puur op productie en herkomst?',
    8,
    1
  ),
  (
    'druiven-regionaliteit',
    'Druiven van Port (Regionaliteit)',
    'Na deze les kun jij druivenrassen en quintatradities lezen als regionale identiteit — los van productiemechanica.
',
    'In module twee leerde je wélke druiven in Port voorkomen; hier draait het om regionaliteit: hoe rassen en tradities het karakter van een quinta en subzone uitdrukken. Touriga Nacional is het iconische gezicht van de Douro — niet alleen kracht en kleur, maar het ras dat top-domeinen als huisstijl omarmen. Touriga Franca en Tinta Barroca geven elegantie en zachtheid aan het regionale palet; Tinto Cão staat bekend om levendig zuur dat oude wijngaarden door decennia heen dragen. Quintatraditie betekent dat families generaties lang dezelfde percelen blenden — niet willekeurig, maar vanuit terroiridentiteit: welke rassen op welke helling, welke opbrengst per stok, welke huisstijl (krachtig Vintage-gericht of eleganter tafelport). Meer dan tachtig toegestane rassen maken de Douro tot een levend archief; de identiteit zit in welke combinaties een quinta kiest en bewaart.


## Food pairing

### Beste pairing

LBV met oude harde kaas.

### Waarom dit werkt

Zout in oude kaas versterkt zoetheid in LBV; vet wordt doorgesneden door alcohol terwijl regionale blendcomplexiteit gelaagde smaken in de kaas kan dragen.

## Pro insight

Regionaliteit lees je in consistentie per quinta en raskeuze op hellingen — niet in één druif op het etiket.',
    '- regionaliteit
- quinta
- druivenras
- terroiridentiteit
- traditie
',
    'Sommige top-Vintage Ports bevatten twintig of meer druivenrassen — quintatraditie als levend erfgoed, niet als recept uit een boek.
',
    '- Regionaliteit: druivenrassen drukken quinta- en subzone-identiteit uit
- Touriga Nacional is het iconische ras van de Douro-top
- Quintatraditie = generaties blends van dezelfde percelen en huisstijl
- Terroiridentiteit bepaalt welke rassen waar en hoe worden ingezet
- Meer dan 80 rassen maken de Douro tot een uniek druivenarchief
',
    '### Opdracht
Kies één bekende quinta (bijv. Noval, Vesuvio, Roêda). Onderzoek welke druivenrassen zij benadrukken en welke huisstijl daarmee past (krachtig, elegant, fruitig).

### Checklist
- Ik heb minimaal drie rassen van de quinta genoteerd
- Ik heb de link gelegd tussen ras en regionale identiteit
- Ik begrijp het verschil met ''alleen productiemechanica''
- Ik kan uitleggen wat quintatraditie betekent


### Reflectievraag

Kun jij op smaak herkennen of een Port meer quinta-identiteit of meer Port house-blend uitstraalt — en welke signalen gebruik je?',
    8,
    2
  ),
  (
    'douro-cultureel-landschap',
    'De Douro-vallei (Cultureel landschap)',
    'Na deze les kun jij het Douro-landschap als cultureel en oenologisch erfgoed uitleggen.
',
    'De Douro-vallei is het visitekaartje van Port — niet als fabriek, maar als landschapserfgoed. Elke subzone heeft een eigen gezicht: Baixo Corgo, Cima Corgo en Douro Superior vormen de drie hoofdzones — koeler en natter westelijk, warmer en concentrerder in het Cima Corgo-hart waar veel iconische quinta''s liggen, extreem heet en droog in het oostelijke Superior. Quinta''s zijn meer dan wijndomeinen; zij zijn ankers in het terrassenlandschap, met namen die generaties aan de hellingen binden. De met hand gebouwde terrassen, schistose wanden en de kronkelende Douro-rivier vormen een cultuurlandschap dat UNESCO Werelderfgoed erkende — niet vanwege productie alleen, maar vanwege de harmonie tussen mens, steile helling en wijnstok. Dit is oorsprongsdenken: waar je proeft, begint met waar je kijkt.


## Food pairing

### Beste pairing

Vintage Port met wildpaté.

### Waarom dit werkt

Tannine en concentratie uit Cima Corgo-fruit dragen wildpaté: umami en vet vragen structuur; zoetheid balanceert zout zonder het gerecht te overheersen.

## Pro insight

UNESCO-status ondersteunt prijs en verhaal, maar proef het terug via terrassen en arbeidsintensiteit — anders blijft het folklore.',
    '- landschap
- UNESCO
- terrassen
- erfgoed
- quinta
',
    'De Douro-vallei staat sinds 2001 op de UNESCO Werelderfgoedlijst — de terrassen zijn cultureel erfgoed, niet alleen landbouwgrond.
',
    '- Drie subzones: Baixo Corgo, Cima Corgo (hart), Douro Superior (extreem)
- Quinta''s zijn identiteitsankers in het landschap
- Terrassenlandschap maakt wijnbouw op steile hellingen mogelijk
- UNESCO-erfgoed erkent cultuur en natuur, niet alleen productie
- Oorsprong begint bij het landschap dat je ziet, niet bij de kelder
',
    '### Opdracht
Bekijk foto''s of kaarten van de drie Douro-subzones. Noteer per zone één landschapskenmerk en één bekende quinta. Leg uit waarom Cima Corgo vaak als ''hart'' wordt gezien.

### Checklist
- Ik ken de drie subzones bij naam
- Ik heb terrassen en hellingslandschap beschreven
- Ik begrijp het UNESCO-argument
- Ik onderscheid dit van productiemechanica (les 7)


### Reflectievraag

Wat maakt UNESCO-landschapstatus voor de Douro meer dan een toeristisch label voor de wijn in je glas?',
    8,
    3
  ),
  (
    'quintas-en-port-houses',
    'Quinta''s en Port Houses',
    'Na deze les kun jij het verschil tussen quinta en Port house toepassen in proef en advies.
',
    'Terroir in de Douro is geen abstract begrip maar zonekarakter in de fles. Mesoclimaat verschilt per subzone: Baixo Corgo kent koelere, vochtigere invloeden; Cima Corgo warmere dagen met drogere lucht; Douro Superior extreme hitte en schaarse regen. Diurnaal verschil — hete dagen, koele nachten — helpt zuur te behouden ondanks rijpe suikers. Leisteen (schist) is het terroir-icoon: het slaat warmte op, laat water wegzakken en dwingt wortels diep, soms tien meter of meer. Dat stresslandschap levert kleine, geconcentreerde druiven met dikke schillen — de fysieke basis van Port-identiteit. Zonekarakter betekent dat dezelfde druif anders spreekt op een noordelijke terrashelling versus een zuidgerichte leisteenwand. Oorsprong proef je als mesoclimaat plus bodem, niet als alleen een postcoderegio.


## Food pairing

### Beste pairing

Single Quinta Vintage met Stilton.

### Waarom dit werkt

Single Quinta-concentratie vraagt krachtige partners: zout in Stilton en structuur in Vintage dragen elkaar; een huisblend vraagt dezelfde intensiteitsmatch op zout en vet.

## Pro insight

Quinta versus Port house is geen hiërarchie maar keuze: terroir-expressie tegen huisstijl. Match dat aan wat de gast zoekt: verhaal of consistentie.',
    '- quinta
- Port house
- blend
- Single Quinta
- stijl
',
    'Douro-wortels kunnen door scheuren in leisteen dieper groeien dan veel andere wijnregio''s — concentratie begint onder de grond.
',
    '- Mesoclimaat verschilt per subzone: koeler westelijk, heter oostelijk
- Diurnaal verschil (warme dag, koele nacht) behoudt frisheid en zuur
- Leisteen is het terroir-icoon: warmte, drainage, diepe wortels
- Zonekarakter bepaalt hoe hetzelfde ras per helling klinkt
- Terroiridentiteit = mesoclimaat + schist, niet alleen geografie
',
    '### Opdracht
Vergelijk de mesoclimaten van Baixo Corgo, Cima Corgo en Douro Superior in een korte tabel (temperatuur, regen, zonekarakter). Leg in drie zinnen uit waarom leisteen essentiel is voor terroiridentiteit.

### Checklist
- Ik heb mesoclimaat per subzone onderscheiden
- Ik begrijp diurnaal temperatuurverschil
- Ik kan uitleggen waarom leisteen uniek is
- Ik zie het verschil met productiegerichte les 8


### Reflectievraag

Wanneer adviseer jij een Single Quinta boven een huisblend — en wanneer juist een Port house-stijl boven terroir-expressie?',
    10,
    4
  ),
  (
    'producenten-herkennen',
    'Producenten herkennen',
    'Na deze les kun jij grote Port houses herkennen aan hun stijlhandtekening.
',
    'Niet elke Douro-wijngaard levert dezelfde druivenkwaliteit. Het IVDP (Instituto dos Vinhos do Douro e do Porto) beheert een officieel classificatiesysteem van A tot F, waarbij A de hoogste wijngaardkwaliteit aanduidt en lagere letters eenvoudigere percelen. In de praktijk springen A-, B- en C-wijngaarden eruit: een A-wijngaard staat voor top-percelen met optimale ligging, zon, lage opbrengst en oude stokken; B en C voor steeds lichtere maar nog kwaliteitsgerichte sites. Factoren zijn hoogte, hellingsgraad, zonblootstelling, bodemtype, leeftijd van stokken en toegestane opbrengst per hectare. Lage opbrengst per stok betekent meer concentratie per druif — cruciaal voor grote Port. Het IVDP controleert niet alleen papieren: classificatie bepaalt welke druiven voor welke categorie Port in aanmerking komen. Kwaliteit wordt hier objectief gewogen — grote Port begint in de wijngaard, niet in de lodge.


## Food pairing

### Beste pairing

Graham’s LBV met chocoladefondant.

Taylor’s Tawny met notentaart.

### Waarom dit werkt

Fruitgedreven LBV bij chocolade: bitters en vet in fondant worden gedragen door restsuiker en tannine; Tawny van hetzelfde huis spiegelt noten via oxidatie.

## Pro insight

Grote Port houses hebben herkenbare signatuur — leer twee producenten echt goed in plaats van twintig oppervlakkig. Dat verkoopt beter dan jaartallen.',
    '- producent
- huisstijl
- herkenning
- blendfilosofie
- signatuur

---
### Module 5 — Specialist Styles I

**Level:** Specialist
**Framework pillar:** Stijl & Identiteit
**Module goal:** Herken en onderscheid de kernstijlen Ruby, Tawny, LBV en Vintage.
',
    'Sommige A-geclassificeerde wijngaarden bezitten wijnstokken van meer dan honderd jaar — lage opbrengst en diepe wortels als kwaliteitsinvestering.
',
    '- IVDP beheert Douro-classificatie van A (top) tot F
- A/B/C-wijngaarden onderscheiden top-, goede en middelhoge percelen
- Factoren: ligging, zon, helling, bodem, stokleeftijd, opbrengst
- Lage opbrengst per stok verhoogt concentratie en kwaliteit
- Classificatie koppelt wijngaard aan Port-categorie en authenticiteit
',
    '### Opdracht
Zoek op wat het IVDP doet en welke factoren een A-wijngaard onderscheiden van C. Kies één beroemde quinta en noteer waarom zij waarschijnlijk op A- of B-percelen steunt.

### Checklist
- Ik weet wat IVDP staat voor en doet
- Ik begrijp het A–F-systeem (focus A/B/C)
- Ik kan opbrengst en concentratie koppelen
- Ik ken minimaal één quinta op top-percelen


### Reflectievraag

Welke producent herken jij blind het snelst aan stijl — en welk aroma of structuurmerkteken is daarbij doorslaggevend?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- portstijlen (5 lessons)
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
    'ruby-reserve',
    'Ruby Reserve',
    'Na deze les kun jij Ruby Reserve positioneren tussen basis-Ruby en LBV/Vintage.
',
    'Ruby Port is de jongste en meest fruitig gedreven stijl binnen het Port-assortiment — de archetypische jonge Port. De naam verwijst naar de diepe robijnrode kleur die ontstaat doordat de wijn relatief kort rijpt — meestal twee tot drie jaar — in grote houten vaten of roestvrijstalen tanks. Grote vaten betekenen minder oppervlak per liter en dus minder zuurstofcontact: minder oxidatie, meer behoud van primaire aroma''s.

Waar Tawny draait om ontwikkeling en tertiaire tonen, draait Ruby om directheid. Typische aroma''s zijn kers, braam, pruim en donkere chocolade. De structuur is krachtig en toegankelijk; tannines zijn aanwezig maar zelden dominant. Ruby is daarmee de instapstijl voor wie Port voor het eerst ontdekt.

Serveer Ruby Port tussen 14 en 16°C. Na opening blijft een fles meestal drie tot vier weken goed dankzij de hogere alcohol en restsuiker. Klassieke pairings zijn pure chocolade, blauwe kaas en desserts met rood fruit — de fruitigheid van Ruby vindt hier een natuurlijke echo.


## Food pairing

### Beste pairing

Pure chocolade of chocoladetaart.

### Waarom dit werkt

Ruby Reserve-fruit en tannine dragen pure chocolade: cacao-bitterheid vraagt structuur, niet extra zoetheid; vet in de chocolade wordt doorgesneden door alcohol.

## Pro insight

Ruby Reserve is je brug naar premium: positioneer hem tussen instap-Ruby en LBV — ideaal voor gasten die fruit willen zonder Vintage-budget.',
    '- Ruby Reserve
- selectie
- fruit
- structuur
- positionering
',
    'Ruby Port is wereldwijd de bestverkochte Portstijl. Veel huizen bottelen meerdere Ruby-blends naast elkaar; Reserve of Premium op het etiket wijst vaak op langere houtlagering of selectie uit betere parcels, zonder dat de stijl Tawny wordt.
',
    '- Ruby is jong, fruitig en robijnrood door korte rijping met weinig oxidatie
- Grote vaten behouden primaire aroma''s: kers, braam, pruim, chocolade
- Toegankelijke instapstijl met krachtige maar directe structuur
- Serveer op 14–16°C; houdbaarheid na opening circa 3–4 weken
',
    '### Opdracht

Proef een Ruby Port en noteer bewust:

- kleurintensiteit en robijnrode tint
- primaire fruitaroma''s (kers, braam, pruim)
- structuur: zoetheid, zuur, tannine, alcoholwarmte
- afdronk en lengte

Vergelijk indien mogelijk met een Tawny en benoem het verschil in oxidatie en fruit.

### Checklist

- Ik heb de kleur en fruitintensiteit beoordeeld
- Ik kan uitleggen waarom Ruby in grote vaten rijpt
- Ik heb minstens één passend foodpairing benoemd


### Reflectievraag

Waar positioneer jij Ruby Reserve in je assortiment: als instap, als standaard of als alternatief voor LBV — en welke gastvraag triggert die keuze?',
    8,
    1
  ),
  (
    'late-bottled-vintage',
    'Late Bottled Vintage (LBV)',
    'Na deze les kun jij LBV uitleggen als praktische oogstjaar-Port met langere houtlagering.
',
    'Tawny Port rijpt langer op hout dan Ruby — meestal in kleinere houten vaten met meer zuurstofcontact. Die oxidatie verandert alles: de kleur verschuift van robijnrood naar amber of oranjebruin, de structuur wordt zachter en de aroma''s verschuiven van primair fruit naar tertiaire aroma''s als walnoten, karamel, toffee, vijgen en gedroogd fruit.

Tawny draait niet om vers fruit maar om ontwikkeling. Hoe langer de houtlagering, hoe complexer het profiel vaak wordt. Op het etiket kan ''Tawny'' zonder leeftijd staan, maar ook met leeftijdsaanduiding: 10, 20, 30 of 40 years. Dat zijn gemiddelde stijlen — geen exacte leeftijd van elke druppel in de fles.

Serveer Tawny tussen 12 en 14°C; oudere Tawny wordt soms licht gekoeld om frisheid te benadrukken. Na opening blijft Tawny vaak vier tot acht weken goed — langer dan Ruby dankzij de oxidatieve rijping. Pairings: notendesserts, caramel, crème brûlée en harde kazen.


## Food pairing

### Beste pairing

Chocoladefondant of harde blauwe kaas.

### Waarom dit werkt

LBV-fruit en tannine dragen pure chocolade: bitters en vet worden gevangen door restsuiker en structuur zonder oxidatie-conflict.

## Pro insight

LBV is het antwoord op ''oogstjaar zonder Vintage-prijs''. Benadruk langere houtlagering en directe drinkrijpheid — maar wees eerlijk over flespotentieel.',
    '- LBV
- oogstjaar
- houtlagering
- toegankelijkheid
- Vintage
',
    'Oude Tawny Port wordt in Portugal regelmatig iets gekoeld geserveerd. De lagere temperatuur benadrukt de frisheid en verfijning die een goede Aged Tawny na decennia houtcontact kan behouden.
',
    '- Tawny rijpt in kleinere vaten met meer oxidatie dan Ruby
- Kleur verschuift naar amber; aroma''s naar walnoot, karamel en gedroogd fruit
- Leeftijdsaanduiding (10/20/30/40) is een gemiddelde stijl, geen exacte leeftijd
- Zachtere structuur en langere houdbaarheid na opening dan Ruby
',
    '### Opdracht

Vergelijk een Ruby en een Tawny Port naast elkaar. Noteer per glas:

- kleur (robijn vs. amber)
- geur: fruit vs. noten en karamel
- smaak: structuur, zoetheid, zuur, lengte
- oxidatief karakter

### Checklist

- Ik heb het kleurverschil duidelijk gezien
- Ik herken fruit versus tertiaire aroma''s
- Ik kan uitleggen waarom Tawny langer op hout rijpt


### Reflectievraag

Een gast wil een oogstjaar-Port zonder Vintage-prijs: wanneer is LBV de juiste tussenstap — en wanneer mis je toch flespotentieel?',
    8,
    2
  ),
  (
    'crusted-port',
    'Crusted Port',
    'Na deze les kun jij Crusted Port herkennen en het decanteeradvies onderbouwen.
',
    'Late Bottled Vintage — afgekort LBV — is Port uit één oogstjaar, net als Vintage Port. Het cruciale verschil zit in de rijpingstijd op vat: LBV rijpt vier tot zes jaar op hout voordat hij wordt gebotteld, terwijl Vintage na circa twee jaar op vat de fles ingaat voor langdurige flesrijping.

Die extra houtlagering verhoogt de toegankelijkheid: LBV is direct drinkbaar zonder jarenlange celaring. Je proeft geconcentreerd fruit — zwarte kersen, pruimen, cacao, kruiden — met structuur en diepte, maar zonder de jarenlange celaring die Vintage vereist. Veel LBV wordt ongefilterd gebotteld en kan daarom depot ontwikkelen; gefilterde varianten zijn direct drinkklaar zonder decanteren.

LBV wordt vaak gezien als de brug tussen Ruby en Vintage: meer karakter dan een standaard Ruby, minder investering en geduld dan een gedeclareerde Vintage. Serveer op 14–16°C. Pairings: blauwe kaas, pure chocolade, notentaart en rijkere desserts.


## Food pairing

### Beste pairing

Stilton of oude cheddar.

### Waarom dit werkt

Crusted-structuur en fruit bij blauwschimmelkaas: zout versterkt zoetheid, tannine snijdt door romig vet — decanteren voorkomt textuurconflict in de pairing.

## Pro insight

Crusted zonder decanteren is een servicefout wachten om te gebeuren. Check depot vóór schenken en communiceer dat proactief aan de gast.',
    '- Crusted
- depot
- decanteren
- ongefilterd
- blend
',
    'Het begrip ''Late Bottled'' ontstond doordat deze wijnen historisch later werden gebotteld dan gewone Ruby — pas na extra jaren op vat. Niet elke LBV is ongefilterd; check het etiket als je wilt decanteren of direct uit de fles schenkt.
',
    '- LBV = één oogstjaar met 4–6 jaar houtlagering — langer dan Vintage op vat
- Toegankelijker en direct drinkbaarder dan Vintage Port
- Geconcentreerd fruit met structuur: de brug tussen Ruby en Vintage
- Ongefilterde LBV kan depot hebben; gefilterde variant niet
',
    '### Opdracht

Proef een LBV Port en analyseer:

- oogstjaar op het etiket
- fruitconcentratie en rijpingskarakter
- structuur: tannine, zoetheid, alcohol
- of decanteren nodig is (ongefilterd vs. gefilterd)

Vergelijk mentaal met Ruby en Vintage: waar past LBV tussenin?

### Checklist

- Ik begrijp het verschil in houtlagering tussen LBV en Vintage
- Ik kan het smaakprofiel van LBV benoemen
- Ik weet wanneer decanteren nodig is


### Reflectievraag

Je opent een Crusted zonder decanteeradvies op het etiket: welke signalen aan kleur of depot zeggen dat je alsnog moet decanteren?',
    8,
    3
  ),
  (
    'vintage-port',
    'Vintage Port',
    'Na deze les kun jij Vintage Port uitleggen: declaratie, rijping en service.
',
    'White Port is een ondergewaardeerde maar essentiële stijl binnen het Douro. Waar Ruby en Tawny van blauwe druiven komen, wordt White Port gemaakt van witte druiven — Malvasia Fina, Gouveio, Viosinho, Rabigato en Codega zijn de belangrijkste druivenrassen. Het smaakspectrum loopt van droog tot halfdroog tot zoet — een veelzijdigheid die Ruby en Tawny niet bieden.

De rijping varieert van kort op hout tot langer voor meer body en notige tonen. Jonge White Port is fris met citrus, honing, amandel en sinaasappelschil; oudere varianten ontwikkelen gedroogd fruit en zachtere textuur. De frisheid en lagere druk maken White Port ideaal als aperitief — in Portugal al decennialang populairder dan buiten het land.

De moderne klassieker is White Port & Tonic: ijs, citroen, munt en een scheut tonic transformeren de wijn tot een lichte, verfrissende serve. Droge White Port serveer je op 8–10°C, zoetere varianten op 10–12°C. Pairings: olijven, amandelen, zoute snacks en lichte desserts.


## Food pairing

### Beste pairing

Stilton, oude Comté of walnoten.

### Waarom dit werkt

Vintage-tannine en concentratie dragen Stilton: zout, romig vet en umami vragen lengte en zoetheid in balans — de klassieke zout-zoet-structuurmatch.

## Pro insight

Vintage verkopen is bewaaradvies verkopen. Vraag altijd: drinken of bewaren? Dat bepaalt service, glas en pairing — en voorkomt teleurstelling.',
    '- Vintage
- declaratie
- IVDP
- flesrijping
- tannine
',
    'White Port & Tonic is in Londen en Amsterdam uitgegroeid tot een zomerklassieker, maar in Porto en de Douro-regio wordt White Port al generaties lang puur of met tonic als aperitief gedronken — lang vóór de internationale hype.
',
    '- White Port komt van witte druiven: Malvasia Fina, Gouveio, Viosinho en meer
- Stijlen lopen van droog tot zoet — frisser en lichter dan Ruby/Tawny
- Ideaal als aperitief; White Port & Tonic is de moderne serveerklassieker
- Citrus, honing en amandel domineren het jonge profiel
',
    '### Opdracht

Proef een White Port en analyseer:

- zoetheid (droog, halfdroog of zoet)
- zuur en frisheid
- aroma''s: citrus, honing, amandel
- geschiktheid als aperitief

Maak optioneel een White Port & Tonic en noteer hoe tonic het profiel verandert.

### Checklist

- Ik begrijp dat White Port van witte druiven komt
- Ik heb zoetheid en frisheid ingeschat
- Ik kan uitleggen waarom White Port als aperitief werkt


### Reflectievraag

Wat weegt zwaarder bij Vintage-advies: het declaratiejaar, de producent of het bewaarpotentieel — en hoe leg je dat aan een verzamelaar uit?',
    10,
    4
  ),
  (
    'vintage-vs-lbv',
    'Vintage versus LBV',
    'Na deze les kun jij Vintage en LBV vergelijken op potentieel, toegankelijkheid en gastmoment.
',
    'Rosé Port is een relatief jonge, moderne en commercieel erkende stijl — officieel sinds 2008 — ontwikkeld om Port toegankelijker te maken voor een nieuw publiek. Net als Ruby wordt hij gemaakt van blauwe druiven, maar het schilcontact is veel korter: minuten in plaats van dagen. Daardoor blijft de kleur lichtroze tot zalmroze, met minder tannines en een frissere, speelsere structuur.

Het smaakprofiel is fruitig en lichtzoet: aardbei, framboos, rode bes, kers en florale tonen. Rosé Port heeft minder complexiteit dan Tawny of Vintage, maar juist die directheid maakt hem populair als aperitief, met ijs, met tonic of als basis in cocktails. Het is geen traditionele Douro-stijl, maar commercieel een belangrijke instap.

Serveer gekoeld op 8–10°C. Na opening blijft Rosé meestal twee tot vier weken goed. Pairings: zomerse desserts, rood fruit, lichte kazen en tapas. Vergelijk met Ruby om het effect van schilcontact op kleur en tannine te ervaren.


## Food pairing

### Beste pairing

LBV → chocoladefondant 
Vintage → Stilton

### Waarom dit werkt

LBV-fruit bij chocolade werkt via structuur; Vintage bij kaas via tannine en lengte — kies op rijpingsfilosofie, niet op prijs alleen.

## Pro insight

Vintage versus LBV is geen kwaliteitsrangorde maar rijpingsfilosofie. Verticale spanning tegen horizontale toegankelijkheid — gebruik die taal in advies.',
    '- Vintage
- LBV
- rijpingstraject
- toegankelijkheid
- keuze

---
### Module 6 — Specialist Styles II

**Level:** Specialist
**Framework pillar:** Stijl & Identiteit
**Module goal:** Verdiep je in White Port, Rosé Port en niche- en premiumcategorieën.
',
    'Rosé Port bestaat pas sinds 2008 als officieel erkende commerciële categorie bij de Portproducenten. De stijl werd bewust ontwikkeld om jongere drinkers en cocktailbars te bereiken — met succes in zomerse markten wereldwijd.
',
    '- Rosé Port: blauwe druiven met zeer kort schilcontact — lichtroze kleur
- Fruitig, fris en lichtzoet met minder tannines dan Ruby
- Modern en toegankelijk; ideaal als aperitief, met ijs of in cocktails
- Minder complex dan Tawny of Vintage, maar commercieel belangrijk
',
    '### Opdracht

Vergelijk een Rosé Port met een Ruby Port. Noteer:

- kleurverschil (roze vs. robijn)
- fruitintensiteit en frisheid
- body en tannine
- geschiktheid als aperitief

### Checklist

- Ik heb het effect van kort schilcontact begrepen
- Ik herken het fruitige, lichte profiel van Rosé
- Ik kan Rosé onderscheiden van Ruby en Tawny


### Reflectievraag

Voor een diner over tien jaar: kies jij Vintage of ongefilterde LBV — en welk rijpingsargument is doorslaggevend?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- portstijlen-verdiept (5 lessons)
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
    'white-port',
    'White Port',
    'Na deze les kun jij White Port herkennen, de belangrijkste witte druiven benoemen en uitleggen wanneer deze stijl als aperitief of in cocktails het beste past.
',
    'White Port is de frisse tegenpool binnen het Port-assortiment. Waar Ruby en Tawny van blauwe druiven komen, wordt White Port gemaakt van witte rassen: Malvasia Fina, Gouveio, Viosinho, Rabigato en Codega. Het spectrum loopt van droog tot zoet — een veelzijdigheid die Ruby en Tawny niet bieden.

Jonge White Port is citrus, honing en amandel; langere houtcontact geeft body en notige lagen. De lagere druk en frisheid maken White ideaal als aperitief — in Portugal al generaties vóór de internationale hype.

De moderne klassieker: White Port & Tonic met ijs, citroen en munt. Droge White op 8–10°C; zoetere varianten op 10–12°C. Het besliskader: wil de gast frisheid en lichtheid vóór het diner? Dan is White vaak de slimste eerste keuze — niet Ruby.


## Food pairing

### Beste pairing

Olijven, amandelen, zoute tapas en lichte geitenkaas.

### Waarom dit werkt

Frisse zuur en lichte zoetheid in White Port tegen zout in olijven en amandelen; lage intensiteit vraagt geen zware tannine of oxidatie.

### Vermijd

Zware chocoladedesserts of rood vlees — daar past Ruby of Tawny beter.

## Pro insight

White Port op tonic is uw instap voor niet-Port-drinkers: lage drempel, hoge conversie naar serieuze stijlen later op de avond.',
    '- White Port
- aperitief
- witte druiven
- tonic
- frisheid
',
    'White Port & Tonic werd populair in cocktailbars wereldwijd, maar in Porto en de Douro wordt White Port al decennialang puur of met tonic als aperitief gedronken.
',
    '- White Port komt van witte druiven — frisser en lichter dan Ruby/Tawny
- Stijlen lopen van droog tot zoet; citrus en amandel domineren jong
- Ideaal als aperitief; White Port & Tonic is de moderne serveerklassieker
- Serveer 8–12°C afhankelijk van zoetheid',
    '### Opdracht

Proef een White Port (puur of als tonic). Noteer zoetheid, frisheid en geschiktheid als aperitief. Voeg de fles toe in de Way of Tasting-app.

### Checklist

- Ik herken witte-druivenprofiel (citrus, honing, amandel)
- Ik kan uitleggen waarom White als aperitief werkt
- Ik heb serveertemperatuur genoteerd


### Reflectievraag

Zou jij White Port puur of als tonic inzetten op een warme avond — en welke gastvraag bepaalt die keuze?',
    8,
    1
  ),
  (
    'rose-port',
    'Rosé Port',
    'Na deze les kun jij Rosé Port herkennen, uitleggen hoe kort schilcontact de stijl vormt en inschatten wanneer deze moderne Port als aperitief of cocktailbasis past.
',
    'Rosé Port is de jongste officiële categorie (sinds 2008): blauwe druiven, maar schilcontact van minuten in plaats van dagen. De kleur is lichtroze tot zalm; tannines blijven zacht, het profiel fruitig en lichtzoet met aardbei, framboos en florale tonen.

Rosé is geen traditionele Douro-stijl, maar commercieel strategisch: toegankelijk, gekoeld, met tonic of in cocktails. Minder complex dan Tawny of Vintage — en dat is bewust. Het besliskader: gast zoekt zomer, lichtheid en direct plezier? Rosé wint van Ruby.

Serveer 8–10°C. Na opening twee tot vier weken houdbaar. Vergelijk bewust met Ruby om schilcontact te ervaren als variabele.


## Food pairing

### Beste pairing

Rood fruit, zomerse desserts, lichte kazen en tapas.

### Waarom dit werkt

Fruitige frisheid en lichte structuur in Rosé spiegelen rood fruit en zachte zuren in aperitiefhapjes zonder zoetheidsconflict met hartige tonen.

### Vermijd

Zware blauwschimmelkaas of pure bittere chocolade.

## Pro insight

Behandel Rosé niet als ''minder Port'' maar als moment-specifieke stijl — aperitief en jonge doelgroep, niet als digestief-vervanger.',
    '- Rosé Port
- schilcontact
- aperitief
- fruit
- modern
',
    'Rosé Port werd bewust ontwikkeld om jongere drinkers en cocktailbars te bereiken — met succes in zomerse markten wereldwijd.
',
    '- Rosé: kort schilcontact, lichtroze, fruitig en fris
- Officieel sinds 2008; modern en toegankelijk
- Ideaal gekoeld als aperitief of met tonic
- Minder complex dan Tawny/Vintage — dat is de functie',
    '### Opdracht

Vergelijk Rosé met Ruby. Noteer kleur, tannine, frisheid en aperitief-geschiktheid.

### Checklist

- Ik begrijp het effect van kort schilcontact
- Ik kan Rosé onderscheiden van Ruby op structuur
- Ik weet wanneer ik Rosé adviseer


### Reflectievraag

Is Rosé Port voor jou een serieuze stijl of een instap — en verandert tonic met ijs je antwoord bij een jonge doelgroep?',
    8,
    2
  ),
  (
    'tawny-port',
    'Tawny Port',
    'Na deze les kun jij Tawny Port fundamenteel uitleggen, de oxidatieve rijpingslogica toepassen en 10, 20, 30 en 40 Years onderscheiden op smaak, inzet en pairing.
',
    'Tawny is geen oude Ruby — het is een andere filosofie. Ruby bewaart fruit in reductieve omgeving; Tawny bouwt bewust op oxidatie in hout. Rood fruit wijkt voor noten, karamel, vijg en toffee. Dat is ontwerp, geen veroudering.

**Basis-Tawny** rijpt korter; fruit en lichte oxidatie blijven in balans. **10 Years** is de brug: nog fruit, al duidelijke oxidatieve lagen — vaak de meest veelzijdige aged Tawny in restaurants. **20 Years** verschuift naar complexiteit: noten, sinaasappelschil, koffie; gastronomisch sterk bij notendesserts. **30 & 40 Years** zijn finesse-categorieën: gedroogd fruit, specerijen, extreme lengte — niet voor elk moment, wel voor memorabele afsluiting.

Belangrijk: het jaartal is een **gemiddelde leeftijd** van het blend, geen exacte flesleeftijd. Serveer Tawny koeler dan Vintage (12–14°C) — finesse instort bij te veel warmte. Het besliskader: wil je oxidatieve verfijning zonder decanteren? Kies Tawny boven Vintage.


## Food pairing

### Beste pairing

10 Years: appeltaart. 20 Years: pecannotentaart of crème brûlée. 30/40 Years: pure noten of oude Comté.

### Waarom dit werkt

Oxidatieve noten in Tawny spiegelen geroosterde noten en karamel in dessert; textuur en aroma lopen parallel — flavor bridging op aroma-overlap.

### Vermijd

Zure citrusdesserts bij oude Tawny — zuur en oxidatie botsen.

## Pro insight

Leeftijdslabel op Tawny is gemiddelde leeftijd, geen exacte jaargang. Leg dat uit vóór de prijs — anders ontstaat verwachtingsfout bij proef.',
    '- Tawny
- oxidatieve rijping
- leeftijdslabel
- noten
- gemiddelde leeftijd
',
    'Een ''20 Years Tawny'' kan wijnen bevatten die ouder én jonger zijn dan twintig jaar — het getal beschrijft het gemiddelde smaakprofiel, niet één oogst.
',
    '- Tawny = oxidatieve rijping; amber, notig, geen primair fruit als Ruby
- 10 Years: brug fruit/oxidatie; 20 Years: gastronomisch premium
- 30/40 Years: finesse en lengte voor speciale momenten
- Leeftijdsaanduiding = gemiddelde blendleeftijd
- Serveer 12–14°C; pairing met noten, karamel en harde kazen',
    '### Opdracht

Proef of vergelijk twee Tawny-niveaus (bijv. 10 en 20 Years). Noteer oxidatie, zoetheid en pairing.

### Checklist

- Ik kan Tawny onderscheiden van Ruby op kleur en neus
- Ik begrijp gemiddelde leeftijd vs oogstjaar
- Ik ken serveertemperatuur en glaskeuze


### Reflectievraag

Voor welk gastmoment kies jij bewust 10 Years Tawny — en wanneer investeer je in 30 of 40 Years in plaats van Vintage?',
    12,
    3
  ),
  (
    'colheita-port',
    'Colheita',
    'Na deze les kun jij Colheita uitleggen als single-harvest Tawny, het onderscheid met leeftijds-Tawny en Vintage onderbouwen en het etiket correct lezen.
',
    'Colheita betekent letterlijk ''oogst'' — en dat woord is de sleutel tot de stijl. Colheita Port is een Tawny uit één enkel oogstjaar: geen blend van meerdere vintagejaren, maar de expressie van één seizoen dat jarenlang oxidatief op vat heeft gerijpt. Dat combineert jaargang-identiteit met de notige, zachte wereld van Tawny.

De wettelijke minimale houtlagering bedraagt zeven jaar, maar veel producenten gaan veel verder: twintig, dertig of zelfs vijftig jaar op hout is geen uitzondering. Die lange houtlagering drijft oxidatie, geeft walnoten, karamel en sinaasappelschil, en maakt de wijn ronder en complexer dan een jonge Ruby. Het botteljaar op het etiket vertelt wanneer de wijn definitief werd afgesloten; het oogstjaar vertelt welke druiven het fundament vormden.

Het contrast met Vintage is fundamenteel. Vintage rijpt kort op vat en lang in de fles — reductief, tanninerijk, met enorm bewaarpotentieel. Colheita rijpt lang op vat en is vaak direct drinkbaar na botteling: oxidatief, toegankelijk, maar niet minder verfijnd. Single harvest maakt Colheita tot de brug tussen jaargangswijn en oxidatieve rijpingswereld.

Serveer Colheita licht gekoeld (12–14°C), meestal zonder decanteren. Na opening blijft de wijn weken tot maanden stabiel dankzij de al bestaande oxidatieve rijping — een voordeel dat Ruby en Vintage niet hebben.


## Food pairing

### Beste pairing

Oude Colheita met notendessert, foie gras of harde oude kaas.

### Waarom dit werkt

Oxidatieve diepte en jaargangskarakter vragen rijke, gelaagde partners: noten, vet en zout versterken de complexiteit zonder de wijn plat te maken.

### Vermijd

Lichte citrusdesserts of te zuur fruit — die laten Colheita log en eenzijdig aanvoelen.

## Pro insight

Colheita is vaak de meest onderschatte premiumcategorie: oxidatieve diepte met oogstverhaal. Ideaal voor gasten die Tawny kennen maar meer persoonlijkheid willen.',
    '- Colheita
- single harvest
- houtlagering
- oogstjaar
- botteljaar
',
    'Sommige Colheita''s worden pas na tientallen jaren houtlagering gebotteld en dragen zowel oogstjaar als botteljaar op het etiket — een dubbele tijdsaanduiding die nergens anders in de Portwereld zo consequent wordt toegepast.
',
    '- Colheita = Tawny uit één oogstjaar (single harvest)
- Minimaal zeven jaar houtlagering; oxidatie en notige complexiteit
- Oogstjaar én botteljaar op het etiket
- Brug tussen Vintage (flesrijping) en gewone Tawny (blend)
- Licht gekoeld serveren; lang houdbaar na opening
',
    '### Opdracht

Zoek een Colheita op (wijnwinkel, kelder of online) en noteer:

- oogstjaar
- botteljaar
- vermelde houtlagering (indien aanwezig)
- producent en regio

Vergelijk het etiket met een gewone Tawny en een Vintage uit dezelfde producent of prijsklasse. Wat valt op in terminologie en verwachting?

### Checklist

- Ik begrijp het verschil met een gewone Tawny-blend
- Ik begrijp het verschil met Vintage Port
- Ik herken oogstjaar en botteljaar op een Colheita-etiket
- Ik kan uitleggen waarom Colheita oxidatief rijpt


### Reflectievraag

Colheita of 20 Years Tawny bij dezelfde prijs: kies jij consistentie of jaargangskarakter — en hoe verkoop je dat verschil?',
    8,
    4
  ),
  (
    'garrafeira-port',
    'Garrafeira',
    'Na deze les kun jij Garrafeira Port uitleggen, de combinatie van hout- en glasrijping onderscheiden van Vintage en Colheita, en inschatten wanneer deze zeldzame stijl past.
',
    'Garrafeira is een van de zeldzaamste Portstijlen. Na een eerste periode op hout (drie tot zes jaar, Ruby-achtig) volgt rijping in grote glazen demijohns — soms tientallen jaren. Het resultaat is noch volledig oxidatief (Tawny) noch volledig reductief (Vintage): gedroogde sinaasappel, noten, koffie, specerijen en indrukwekkende lengte met zachte textuur.

Niepoort maakte de stijl wereldberoemd. Productie is beperkt; veel liefhebbers proeven Garrafeira nooit. Het besliskader: gast zoekt zeldzaamheid en finesse zonder Vintage-depot? Garrafeira is het antwoord.

Serveer 14–16°C, eventueel licht gedecanteerd. Pairing: oude kaas, pure chocolade, noten.


## Food pairing

### Beste pairing

Oude Gouda, pure chocolade (70%+), gedroogde vijgen.

### Waarom dit werkt

Complexiteit en zachte oxidatie in Garrafeira vragen rijke partners: zout in oude kaas en vet in pure chocolade dragen de gelaagde mondtextuur.

### Vermijd

Lichte salades of citrus — te weinig body voor Garrafeira.

## Pro insight

Garrafeira is zeldzaamheid en verhaal — niet voor elk menu. Reserveer voor gasten die oxidatie én finesse begrijpen; anders wint 30 Years Tawny.',
    '- Garrafeira
- glasrijping
- demijohn
- zeldzaamheid
- complexiteit

---
### Module 7 — Service & Bewaren

**Level:** Master
**Framework pillar:** Service
**Module goal:** Beheers serveren, decanteren, glaskeuze en bewaarlogica van Port.
',
    'Sommige Garrafeira''s rijpen meer dan veertig jaar in glazen demijohns vóór botteling — een proces dat geen andere versterkte wijnstijl repliceert.
',
    '- Garrafeira: hout + glasrijping in demijohns
- Zeldzaam, complex, zacht — niche binnen Port
- Niepoort is de historische referentie
- Niet oxidatief als Tawny, niet fles-dominant als Vintage
- Serveer 14–16°C bij oude kaas of pure chocolade',
    '### Opdracht

Maak een vergelijkingstabel Garrafeira vs Vintage vs Colheita: hout, glas/fles, smaak, moment.

### Checklist

- Ik begrijp demijohn-glasrijping
- Ik kan Garrafeira positioneren t.o.v. Vintage en Colheita
- Ik ken een serveer- en pairingadvies


### Reflectievraag

Welk element van Garrafeira verwacht je het eerst te proeven — glasrijping, houtlagering of fleskarakter — en waarom?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-port (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'service-port'
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
    'Na deze les kun jij per stijl de juiste serveertemperatuur onderbouwen.
',
    'Temperatuur bepaalt hoe Port zich opent.

Te warm?

Dan domineert alcohol.

Te koud?

Dan sluit aroma zich af.

Dat maakt temperatuur geen detail.

Maar een stuurinstrument.

Ruby werkt vaak het best tussen 14–16°C.

Zo blijft fruit levendig en alcohol gecontroleerd.

Tawny werkt koeler:

12–14°C.

Dat houdt oxidatieve spanning fris.

Vintage vraagt meestal iets warmer:

16–18°C.

Daar heeft structuur ruimte nodig.

De belangrijke vraag:

Waarom serveer je oude Tawny koeler dan Vintage?

Omdat finesse sneller instort bij warmte dan kracht.

Dat is service-intelligentie.


## Food pairing

### Beste pairing

Tawny met notendesserts.

### Waarom dit werkt

Koel geserveerde Tawny behoudt frisheid naast zoute kaas; te warme Port maakt zoetheid plakkerig — temperatuur is onderdeel van de pairingbalans.

## Pro insight

Koel Tawny één graad extra in warme zaal: de fles warmt aan tafel op naar precies serveerpunt — standaard sommelier-truc.',
    '- serveertemperatuur
- Ruby
- Tawny
- Vintage
- service
',
    'Sommige Colheita''s worden pas na tientallen jaren houtlagering gebotteld en dragen zowel oogstjaar als botteljaar op het etiket — een dubbele tijdsaanduiding die nergens anders in de Portwereld zo consequent wordt toegepast.
',
    '- Colheita = Tawny uit één oogstjaar (single harvest)
- Minimaal zeven jaar houtlagering; oxidatie en notige complexiteit
- Oogstjaar én botteljaar op het etiket
- Brug tussen Vintage (flesrijping) en gewone Tawny (blend)
- Licht gekoeld serveren; lang houdbaar na opening',
    '### Opdracht

Zoek een Colheita op (wijnwinkel, kelder of online) en noteer:

- oogstjaar
- botteljaar
- vermelde houtlagering (indien aanwezig)
- producent en regio

Vergelijk het etiket met een gewone Tawny en een Vintage uit dezelfde producent of prijsklasse. Wat valt op in terminologie en verwachting?

### Checklist

- Ik begrijp het verschil met een gewone Tawny-blend
- Ik begrijp het verschil met Vintage Port
- Ik herken oogstjaar en botteljaar op een Colheita-etiket
- Ik kan uitleggen waarom Colheita oxidatief rijpt


### Reflectievraag

Een Tawny smaakt log en plakkerig aan tafel: is de fles te warm, te oud of verkeerd gekozen — en welke temperatuurcorrigeer je als eerste?',
    10,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les kun jij glaswerk kiezen dat aroma en alcohol in balans houdt.
',
    'Het juiste glas verandert hoe Port wordt ervaren.

Te groot?

Alcohol vervliegt te snel.

Te klein?

Aroma krijgt geen ruimte.

Port vraagt focus.

Niet volume.

Ruby en LBV werken goed in kleinere tulip-glazen.

Dat concentreert fruit.

Tawny profiteert van iets meer opening.

Dat laat oxidatieve lagen ademen.

Vintage vraagt vaak klassiek proefglasformaat:

smal genoeg voor focus, breed genoeg voor ontwikkeling.

De kernvraag:

Waarom gebruik je geen groot Bordeaux-glas?

Omdat Port intensiteit heeft.

Je hoeft niets te forceren.

Je moet sturen.


## Food pairing

### Beste pairing

LBV met blauwe kaas.

### Waarom dit werkt

Geconcentreerd aroma in een klein glas versterkt zout-zoet perceptie bij kaas zonder dat alcohol de neus overneemt — glaswerk ondersteunt structuurmatch.

## Pro insight

Klein glas temt alcohol bij 20% abv. Te groot glas maakt Port branderig — gasten associëren dat ten onrechte met kwaliteit.',
    '- glaswerk
- tulpvorm
- aroma
- alcohol
- concentratie
',
    'Sommige Garrafeira Ports rijpen meer dan veertig jaar in glazen demijohns voordat ze worden gebotteld — een productieproces dat geen enkele andere versterkte wijnstijl ter wereld repliceert.
',
    '- Garrafeira: zeldzame stijl met hout- én glasrijping
- Start als Ruby uit één jaar; daarna jaren in demijohns
- Niet volledig oxidatief, niet volledig reductief
- Niepoort is de historische referentieproducent
- Complex, zacht en elegant — bij oude kaas of pure chocolade',
    '### Opdracht

Zoek informatie over een Garrafeira Port (bij voorkeur Niepoort) en vergelijk het rijpingsproces met Vintage en Colheita. Maak een tabel met drie kolommen:

- rijping op hout (duur en doel)
- rijping op glas of fles (duur en doel)
- verwacht smaakprofiel

### Checklist

- Ik begrijp het glasrijpingsproces in demijohns
- Ik kan Garrafeira onderscheiden van Vintage en Colheita
- Ik ken de rol van Niepoort in deze stijl
- Ik weet waarom glas een ander rijpingspad geeft dan hout


### Reflectievraag

Waarom schenk je Port in een kleiner glas dan Bordeaux — en wanneer zou je toch bewust iets meer volume geven aan Vintage?',
    8,
    2
  ),
  (
    'decanteren',
    'Decanteren',
    'Na deze les kun jij bepalen wanneer decanteren nodig is en hoe je het uitvoert.
',
    'Decanteren is geen ritueel.

Het is techniek.

Bij Port heeft het twee functies:

bezinksel scheiden en zuurstof geven.

Vintage en Crusted vragen bijna altijd decanteren.

Door ongefilterde botteling vormen ze sediment.

Dat wil je niet in het glas.

Tawny meestal niet.

Daar is de wijn al ontwikkeld en helder.

Belangrijke vraag:

Waarom decanteer je Vintage wel, maar oude Tawny meestal niet?

Omdat Vintage nog opent.

Tawny is al open.

Te veel zuurstof kan oude Tawny juist breken.

Dat is een essentieel serviceverschil.


## Food pairing

### Beste pairing

Vintage met Stilton.

### Waarom dit werkt

Decanteren verwijdert depot dat bitterheid zou toevoegen naast zoute kaas; heldere structuur laat zoetheid en zout correct interacteren.

## Pro insight

Decanteer niet uit traditie maar uit depot en textuur. Tawny en Colheita zijn al oxidatief stabiel — onnodig decanteren verliest aromatische finesse.',
    '- decanteren
- depot
- Vintage
- lucht
- textuur
',
    'Veel toprestaurants serveren 20 Years Tawny bewust rond 11–12°C om extra spanning en precisie te creëren — een graden verschil dat amateur- en professionele service scheidt.
',
    '- Temperatuur per stijl: White/Rosé 8–10°C, Tawny 12–14°C, Ruby/LBV 14–16°C, Vintage 16–18°C
- Portglas: klein, tulpvorm, minder alcoholimpact
- Decanteren bij Vintage, Crusted en ongefilterde LBV; niet bij Tawny of White
- Houdbaarheid na opening: Vintage dagen, Tawny/Colheita weken tot maanden',
    '### Opdracht

Maak een serviceplan voor vier Portstijlen (White, Ruby, Tawny, Vintage). Noteer per stijl:

- serveertemperatuur
- glastype
- decanteren (ja/nee + motivatie)
- bewaartermijn na opening
- één logische food pairing

### Checklist

- Ik ken de temperatuurrange per hoofdgroep
- Ik weet welke stijlen decanteren vereisen
- Ik begrijp waarom Portglas kleiner is dan roodwijnglas
- Ik kan houdbaarheid na opening inschatten


### Reflectievraag

Je twijfelt of decanteren nodig is: welke drie signalen aan fles, leeftijd of stijl beslissen voor jou — zonder het etiket te raadplegen?',
    8,
    3
  ),
  (
    'bewaren-na-openen',
    'Bewaren na openen',
    'Na deze les kun jij houdbaarheid na opening inschatten per stijl.
',
    'Niet elke Port leeft even lang na openen.

Dat is essentieel in service.

Ruby en LBV blijven vaak enkele weken goed.

Door hun fruitgedreven profiel.

Tawny kan vaak langer open blijven.

Oxidatie is al onderdeel van de stijl.

Vintage is kwetsbaarder.

Na openen verandert hij sneller.

Vaak binnen enkele dagen tot een week optimaal.

De kernvraag:

Waarom blijft Tawny langer stabiel dan Vintage?

Omdat oxidatie daar al geïntegreerd is.

Vintage verliest juist spanning.

Dat maakt bewaarkennis praktisch waardevol.

Voor thuis én horeca.


## Food pairing

### Beste pairing

Tawny per glas bij desserts.

### Waarom dit werkt

Oxidatief stabiele Tawny blijft weken drinkbaar na opening bij kaasplank; Vintage vraagt kortere service — houdbaarheid bepaalt pairingplanning.

## Pro insight

Geopende Vintage niet weken laten staan; Tawny wel. Communiceer dat bij verkoop van dure flessen — voorkomt klachten en voedt herhaalaankoop.',
    '- houdbaarheid
- oxidatie
- opening
- koel bewaren
- stijl
',
    'De Britse traditie van Stilton met Vintage Port bestaat al meer dan tweehonderd jaar en werd populair toen Engelse handelshuizen zowel Port als blauwe kaas importeerden en aan tafel combineerden.
',
    '- Port en kaas: zout + zoet, vet + alcohol, intensiteitsmatch
- Klassieker: Vintage + Stilton; Tawny + oude Gouda
- Manchego + White Port en Brie + Rosé als moderne alternatieven
- Kaas op kamertemperatuur; Port in klein glas op juiste temperatuur',
    '### Opdracht

Maak thuis een mini pairing-flight met drie combinaties:

- White Port + Manchego
- Ruby of LBV + blauwe kaas
- Tawny (10 of 20 Years) + oude Gouda

Noteer per combinatie: balans, contrast, intensiteitsmatch en favoriet.

### Checklist

- Ik begrijp het principe zout + zoet
- Ik herken intensiteitsbalans tussen kaas en Port
- Ik heb minimaal twee pairings fysiek getest
- Ik serveerde kaas op kamertemperatuur


### Reflectievraag

Hoe lang laat jij een geopende Vintage staan versus een Tawny — en welke oxidatieve logica leg je daaraan ten grondslag?',
    8,
    4
  ),
  (
    'wanneer-welke-port',
    'Wanneer serveer je welke Port?',
    'Na deze les kun jij per moment de meest logische Portstijl adviseren.
',
    'Port is context.

Niet categorie.

White Port werkt als aperitief.

Ruby werkt bij chocolade en informele momenten.

LBV is breed inzetbaar.

Vintage is ceremonieel.

Tawny past perfect na diner of bij desserts.

Dat maakt service geen productkennis.

Maar timing.

De vraag is nooit:

Welke Port is goed?

Maar:

Welke Port past nu?

Dat is het verschil tussen schenken en adviseren.

En dat is precies waar premium service ontstaat.


## Food pairing

### Beste pairing

White → olijven 
Ruby → chocolade 
Tawny → notendessert 
Vintage → Stilton

### Waarom dit werkt

Aperitief vraagt frisheid (White/Rosé), digestief oxidatie (Tawny) en kaas structuur (Vintage/LBV) — moment bepaalt welke smaakcomponent (zuur, zoet, tannine) leidt.

## Pro insight

Moment bepaalt stijl, niet favoriet of voorraad. Eén gerichte vraag over aperitief, kaas of digestief bespaart tien minuten uitleg.',
    '- moment
- aperitief
- digestief
- stijlkeuze
- advies

---
### Module 8 — Food Pairing & Gastronomie

**Level:** Master
**Framework pillar:** Pairing
**Module goal:** Koppel Port bewust aan gerechten, momenten en gastprofielen.
',
    'Veel topchefs bouwen desserts rondom Tawny Port in plaats van andersom — de wijn wordt het startpunt van het gerecht, niet de bijzaak na de maaltijd.
',
    '- Gouden regel: wijn even zoet of zoeter dan het dessert
- Ruby + pure chocolade; Tawny + karamel/noten; White + citrus
- Flavor bridging: overlappende smaakfamilies versterken de pairing
- Vermijd mint, extreme zuur en zoet-op-zoet zonder balans',
    '### Opdracht

Maak thuis drie dessertpairings:

- Ruby + pure chocolade (min. 70% cacao)
- Tawny + karamel- of vanilledessert
- White + citroendessert of taart

Beoordeel per combinatie: zoetheidsbalans, intensiteit, contrast en favoriet.

### Checklist

- Ik ken de zoetheidsregel en heb die toegepast
- Ik begrijp flavor bridging met een concreet voorbeeld
- Ik heb minimaal twee pairings fysiek getest
- Ik kan uitleggen waarom mint lastig is


### Reflectievraag

Een gast bestelt koffie en wil ''iets zoets'': welke Port stel jij voor vóór digestief — en welke vraag stel je om niet automatisch Tawny te pushen?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-port (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'port' and m.slug = 'pairing-port'
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
    'port-en-kaas',
    'Port & Kaas',
    'Na deze les kun jij Port systematisch aan kaas koppelen per stijl.
',
    'Port en kaas vormen één van de sterkste gastronomische allianties in de wijnwereld. De combinatie werkt omdat tegengestelde elementen elkaar versterken: zout in kaas maakt zoetheid in Port aantrekkelijker, vet wordt doorgesneden door alcohol, en umami in rijpe kazen vindt een tegenhanger in de concentratie van Port.

Drie principes sturen elke succesvolle pairing. Eerst: zout plus zoet — blauwe kaas en Port zijn het schoolvoorbeeld. Tweede: vet plus alcohol — alcohol maakt de mond frisser na een romige hap. Derde: intensiteit moet kloppen — lichte kaas met zware Port of omgekeerd laat één van beide verdwijnen.

De klassieker is Stilton met Vintage Port: zout, romigheid en kracht tegen fruit, tannine en lengte. Aged Gouda met 20 Years Tawny spiegelt kristallen, zout en karamel in de kaas met noten en oxidatie in de wijn. Manchego met White Port is ondergewaardeerd: frisheid en amandel tegen zout en nootachtige vet. LBV werkt vaak beter dan Vintage bij blauwe kaas voor wie toegankelijkheid zoekt. Serveer kaas altijd op kamertemperatuur — koude kaas maakt pairing vlak.


## Food pairing

### Beste pairing

Vintage + Stilton; Tawny 20 Years + oude Gouda; White Port + Manchego.

### Waarom dit werkt

Zout versterkt zoetheidsperceptie; vet in kaas wordt doorgesneden door alcohol; tannine in Vintage/Ruby balanceert romigheid in blauwschimmel.

### Vermijd

Lichte White Port bij krachtige Roquefort, of zoete Ruby bij milde Brie — de intensiteit klopt dan niet.

## Pro insight

Kaas eerst proeven, dan Port — niet omgekeerd. Die volgorde maakt zout-zoet balans zichtbaar en versterkt upsell naar tweede glas.',
    '- kaas
- zout
- zoetheid
- vet
- intensiteitsmatch
',
    'De Britse traditie van Stilton met Vintage Port bestaat al meer dan tweehonderd jaar en werd populair toen Engelse handelshuizen zowel Port als blauwe kaas importeerden en aan tafel combineerden.
',
    '- Port en kaas: zout + zoet, vet + alcohol, intensiteitsmatch
- Klassieker: Vintage + Stilton; Tawny + oude Gouda
- Manchego + White Port en Brie + Rosé als moderne alternatieven
- Kaas op kamertemperatuur; Port in klein glas op juiste temperatuur
- Intensiteit van kaas en Port moet gelijk oplopen
',
    '### Opdracht

Maak thuis een mini pairing-flight met drie combinaties:

- White Port + Manchego
- Ruby of LBV + blauwe kaas
- Tawny (10 of 20 Years) + oude Gouda

Noteer per combinatie: balans, contrast, intensiteitsmatch en favoriet.

### Checklist

- Ik begrijp het principe zout + zoet
- Ik herken intensiteitsbalans tussen kaas en Port
- Ik heb minimaal twee pairings fysiek getest
- Ik serveerde kaas op kamertemperatuur


### Reflectievraag

Bij blauwe kaas: kies jij LBV of Vintage — en welk argument over zout, zoet en tannine gebruik je om de gast te overtuigen?',
    10,
    1
  ),
  (
    'port-en-chocolade',
    'Port & Chocolade',
    'Na deze les kun jij Port aan chocolade koppelen op structuur en intensiteit, niet alleen op zoetheid.
',
    'Port en chocolade zijn een klassieke combinatie — maar alleen wanneer je op structuur matcht, niet op zoetheid alleen. Pure chocolade (70% cacao of meer) vraagt fruit, bitters en tannine om de cacao-bitterheid te dragen; daar blinken Ruby en LBV uit met zwart fruit en lengte. Melkchocolade vraagt zachtere integratie: vet en lactose temperen bitterheid, en een Tawny met karamel en noten sluit daar eleganter op aan.

De veelgemaakte fout is te oude Tawny bij pure chocolade: dubbele oxidatie en dubbele bitterheid kunnen hard botsen in plaats van harmonieus te bouwen. Match eerst intensiteit en textuur — dan pas suiker. Een romige ganache vraagt andere Port dan een krokante tablet; flavor bridging werkt wanneer cacao-tonen in Ruby de bitterheid in pure chocolade spiegelen, of wanneer karamel in Tawny melkchocolade versterkt.

Hoe donkerder de chocolade, hoe meer structuur je nodig hebt — niet automatisch meer zoetheid. Bij een chocoladeflight: begin met melkchocolade en Ruby, eindig met pure cacao en LBV of jonge Vintage.


## Food pairing

### Beste pairing

Ruby Reserve of LBV met pure chocolade (minimaal 70% cacao).

### Waarom dit werkt

Zwart fruit en tannine in Ruby dragen cacao-bitterheid en vet in pure chocolade; structuur houdt de wijn levendig terwijl bitter en zoet in balans blijven.

### Vermijd

40 Years Tawny bij pure bittere chocolade — oxidatie en cacao-bitter kunnen elkaar versterken tot een harde, eenzijdige indruk.

## Pro insight

Donkerder chocolade vraagt meer structuur, niet meer zoetheid. Bij twijfel wint Ruby Reserve boven oude Tawny bij pure cacao — voorkomt bitter-op-bitter.',
    '- chocolade
- bitter
- structuur
- Ruby
- intensiteit
',
    'Premium-chocolatiers filteren bij Portpairings eerst op cacao-percentage — niet op suikergehalte — omdat bitterheid en vet de Portkeuze sturen.
',
    '- Pure chocolade vraagt Ruby of LBV: fruit, bitters en structuur
- Melkchocolade past vaker bij Tawny: zachtere oxidatieve integratie
- Match op intensiteit en textuur vóór zoetheid
- Te oude Tawny bij pure cacao kan hard botsen
- Donkerder chocolade = meer structuur, niet per se zoeter Port
',
    '### Opdracht

Maak thuis twee pairings en noteer je bevindingen:

- Ruby of LBV met pure chocolade (min. 70% cacao)
- Tawny 10 of 20 Years met melkchocolade of karamelpraline

Beoordeel per combinatie: zoetheidsbalans, intensiteit, textuur en favoriet.

### Checklist

- Ik heb structuur vóór zoetheid als criterium gebruikt
- Ik kan uitleggen waarom pure cacao Ruby/LBV vraagt
- Ik heb minimaal één pairing fysiek getest
- Ik kan de Tawny-fout bij pure chocolade benoemen


### Reflectievraag

Pure chocolade 85%: waarom is Ruby/LBV hier sterker dan oude Tawny — en hoe leg je bitterheid en structuur uit zonder over zoetheid te praten?',
    10,
    2
  ),
  (
    'port-en-notendesserts',
    'Port & Notendesserts',
    'Na deze les kun jij Tawny en notendesserts in balans brengen via oxidatieve spiegeling.
',
    'Notendesserts en Tawny Port spreken dezelfde oxidatieve taal: walnoot, hazelnoot, karamel en toffee zitten vaak al in de wijn vóór ze op het bord staan. Dat maakt spiegeling — flavor bridging via overlappende aroma-families — tot het sterkste principe bij deze pairing.

Ruby werkt hier meestal minder goed: primair fruit en tannine missen de notige aansluiting die geroosterde noten en boter in het dessert vragen. Een 10 of 20 Years Tawny brengt precies die gelaagdheid: oxidatie, zachtheid en karamelachtige diepte die pecantaart, hazelnootschuim of amandelkrokant versterken in plaats van overstemmen.

Textuur telt mee: krokant notenkorstje vraagt andere balans dan romige notenmousse. Serveer Tawny licht gekoeld (12–14°C) zodat zoetheid niet plakkerig wordt naast rijke desserts. De zoetheidsregel blijft gelden: de Port moet minstens even zoet aanvoelen als het dessert.


## Food pairing

### Beste pairing

20 Years Tawny met pecannotentaart of hazelnootkrokant.

### Waarom dit werkt

Geroosterde noten in dessert en oxidatieve noten in Tawny delen aroma-families; textuur in taart en mondgevoel in de wijn versterken elkaar zonder zuurconflict.

### Vermijd

Jonge Ruby bij pure notentaart — fruit en tannine domineren waar oxidatie en karamel de brug moeten slaan.

## Pro insight

Tawny bij noten is de veiligste dessertpairing in hospitality: oxidatieve spiegeling, weinig risico — ideaal als standaard dessertaanbeveling.',
    '- noten
- Tawny
- oxidatie
- aroma-spiegeling
- textuur
',
    'Veel topchefs bouwen notendesserts rondom Tawny Port in plaats van andersom — de wijn wordt het startpunt van het gerecht, niet de bijzaak na de maaltijd.
',
    '- Notendesserts vragen Tawny: oxidatieve aroma-spiegeling
- Walnoot, karamel en toffee in wijn en dessert versterken elkaar
- Ruby mist vaak de oxidatieve aansluiting bij noten
- Textuur en zoetheidsbalans bepalen de finale harmonie
- Lichte koeling houdt Tawny fris naast rijke desserts
',
    '### Opdracht

Proef Tawny 10 of 20 Years naast een notendessert (pecantaart, nougatine of hazelnootijs). Noteer:

- welke aroma''s spiegelen tussen wijn en dessert
- of de zoetheidsbalans klopt
- of textuur (krokant vs. romig) de pairing beïnvloedt

### Checklist

- Ik kan oxidatieve spiegeling uitleggen
- Ik heb Tawny gekozen boven Ruby met motivatie
- Ik heb zoetheidsbalans beoordeeld
- Ik kan een alternatief notendessert benoemen


### Reflectievraag

Waarom werkt aroma-spiegeling bij notendesserts beter dan contrast — en wanneer zou jij toch bewust Ruby inzetten?',
    8,
    3
  ),
  (
    'port-en-vlees',
    'Port & Vlees',
    'Na deze les kun jij Port in vleesgerechten positioneren op reductie en umami.
',
    'Port bij vlees is niche, maar wanneer de match klopt, is hij uitzonderlijk overtuigend. Het verschil met droge rode wijn is restsuiker: Port is niet breed inzetbaar bij elke biefstuk, maar gericht bij wild, eend en rijke sauzen waar fruit, tannine en concentratie eiwit en umami dragen.

Vintage Port past bij hert, wildzwijn en krachtige wildgerechten: stevige tannine, diepte en lengte tegen gamey tonen en vet. Ruby en LBV werken bij eend, rijke roderechten en sauzen met fruitcomponent — de zoetheid moet dan bewust gebalanceerd zijn door zout, bitter of umami in het gerecht. Tawny is zelden de eerste keuze bij vlees: te weinig grip en te veel oxidatieve finesse voor eiwitrijke hoofdgerechten.

In de keuken blinkt Port vooral als reductie: Ruby of LBV reduceert tot fruitige, krachtige saus bij wild of eend — suiker karamelliseert, alcohol verdampt, concentratie blijft. Gebruik Port bij vlees als sauscomponent of finale pairing, niet als standaard tafelwijn naast een biefstuk.


## Food pairing

### Beste pairing

Vintage Port met hert of wildzwijn; LBV-reductie bij eendenborst.

### Waarom dit werkt

Tannine en concentratie in Vintage dragen gamey eiwit; reductie met Ruby/LBV karamelliseert suiker en versterkt umami in de saus.

### Vermijd

Tawny als standaard tafelwijn bij biefstuk — te weinig structuur en te veel oxidatieve zachtheid voor neutraal rood vlees.

## Pro insight

Port bij vlees is niche: verkoop het als reductie of wildpairing, niet als tafelwijn naast biefstuk — restsuiker verstoort dan de balans.',
    '- wild
- reductie
- tannine
- Vintage
- umami
',
    'Portreductie is één van de meest gebruikte luxe sauzen in klassieke Franse keuken — een traditie die teruggaat tot de negentiende eeuw toen Britse Port in continentale keukens populair werd.
',
    '- Port bij vlees: niche, maar sterk bij wild, eend en rijke sauzen
- Vintage voor game; Ruby/LBV voor eend en fruitige sauzen
- Restsuiker beperkt brede inzet bij standaard rood vlees
- Portreductie met Ruby/LBV is de klassieke keukentoepassing
- Tawny zelden eerste keuze bij eiwitrijke hoofdgerechten
',
    '### Opdracht

Bedenk twee vleesgerechten waarbij Port logisch past:

- één als reductie (welke stijl en waarom)
- één als glas pairing (welk vlees en welke Port)

Motivere per keuze op structuur, umami en zoetheidsbalans.

### Checklist

- Ik kan uitleggen waarom Port niet breed bij rood vlees past
- Ik kies Vintage of Ruby/LBV met onderbouwing
- Ik begrijp Port als reductie-ingrediënt
- Ik kan Tawny bij vlees bewust afwijzen


### Reflectievraag

Waarom is Port geen vervanger van droge rode wijn bij biefstuk — en bij welk gerecht zou jij wél Vintage naast het bord zetten?',
    10,
    4
  ),
  (
    'port-in-gastronomie',
    'Port in gastronomie',
    'Na deze les kun jij Port als gastronomisch ingrediënt inzetten.
',
    'In professionele gastronomie is Port geen alleen digestief: het is een instrument voor pairing, reductie en smaakversterking op meerdere momenten in een menu. Door suiker, alcohol, concentratie en aromatische diepte kan Port meer dan gewone wijn — als aperitief, bij tussengerecht, in de hoofdgang, bij kaas en in desserts.

Als aperitief blinken White Port, White Port & Tonic en Rosé Port uit. Bij hoofdgerecht is Port minder gebruikelijk maar krachtig: wild met LBV, eend met Ruby, hert met Vintage — rijke eiwitten dragen de alcohol. Als ingrediënt is Port vooral waardevol in reducties: Ruby of LBV reduceert tot fruitige saus; Tawny in desserts geeft notigheid; White Port in lichte marinades is subtieler.

Veelgemaakte fouten: te zoete Port in hartige saus, Vintage koken, White bij zware pure chocolade, Tawny bij zeer zure desserts. Gebruik de stijl bewust: Ruby voor fruitcomponent, Tawny voor oxidatieve diepte, White voor aromatische lift.


## Food pairing

### Beste pairing

Portreductie met wild of eend; Tawny in karameldessert.

### Waarom dit werkt

Gereduceerde Port concentreert suiker en fruit tot sausdiepte; umami in wild wordt versterkt zonder dat restsuiker het gerecht zoet maakt.

### Vermijd

Vintage in de pan — te kostbaar en te complex voor keukengebruik.

## Pro insight

Houd kook-Port apart van drinkvoorraad. Eén fles Ruby/LBV voor de keuken voorkomt dat je per ongeluk Vintage in de pan gooit.',
    '- gastronomie
- reductie
- smaakversterker
- Ruby
- Tawny

---
### Module 9 — Integratie & Mastery

**Level:** Master
**Framework pillar:** Integratie & Mastery
**Module goal:** Integreer kennis in kaartlezen, blindproeven, advies en eindbeoordeling.
',
    'Portreductie is één van de meest gebruikte luxe sauzen in klassieke Franse keuken — een traditie die teruggaat tot de negentiende eeuw toen Britse Port in continentale keukens populair werd.
',
    '- Port als aperitief (White/Rosé), pairing (kaas, wild) én ingrediënt (reductie)
- Ruby/LBV voor hartige sauzen; Tawny voor desserts; White voor lichte keuken
- Nooit Vintage koken; wel kook-Port apart houden
- Umami-versterker in kleine dosering bij paddenstoelen en wild
- Stijlkeuze volgt functie in het gerecht, niet gewoonte
',
    '### Opdracht

Ontwerp een viergangenmenu met Port op elk moment:

- aperitief (White of Rosé)
- gerecht (Ruby/LBV — pairing of reductie)
- kaas (Vintage of Tawny)
- dessert (Tawny of Ruby)

Motivere per gang: stijl, temperatuur en pairing-principe.

### Checklist

- Ik begrijp Port als pairing én als ingrediënt
- Ik kan per stijl een gerecht koppelen
- Ik weet waarom Vintage zelden in de keuken hoort
- Ik heb minimaal één reductie of pairing bedacht met concrete stijl


### Reflectievraag

Waar zie jij de grootste kans voor Port buiten het dessert: aperitief, reductie of kaas — en welke stijl zet je daar het eerst op de kaart?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-port (5 lessons)
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
    'portkaart-lezen',
    'Portkaart lezen',
    'Na deze les kun jij een Portkaart lezen op inzetbaarheid, niet alleen prijs.
',
    'Een Portkaart lezen is meer dan labels herkennen.

Je leest structuur, stijl, leeftijd en inzetbaarheid.

Ruby, Tawny, LBV, Vintage, Colheita.

Dat zijn geen losse categorieën.

Dat zijn servicebeslissingen.

Een goede Portkaart vertelt:

wat is direct drinkbaar?

wat vraagt decanteren?

wat is gastronomisch breed?

wat is exclusief?

Professionals kijken niet eerst naar prijs.

Maar naar inzet.

De kernvraag:

Welke fles lost welk gastmoment op?

Dat is de echte functie van een Portkaart.

Niet verkoop.

Maar navigatie.


## Food pairing

### Beste pairing

Koppel per stijl:

Ruby → chocolade 
Tawny → noten 
LBV → blauwe kaas 
Vintage → Stilton 
White → aperitief

### Waarom dit werkt

Ruby bij chocolade via fruit-tannine; Tawny bij noten via oxidatie; LBV bij blauwe kaas via zout-zoet — de kaart groepeert stijlen op inzetbare structuur, niet op prijs.

## Pro insight

Sterke sommeliers kennen niet elke fles maar wel elke categorie-inzet. Groepeer de kaart op moment, niet op prijs — dat versnelt verkoop.',
    '- portkaart
- stijl
- inzetbaarheid
- service
- navigatie
',
    'Sommige grote Portproducenten groeperen hun kaart op inzetbaarheid (aperitief, digestief, decanteerbaar) in plaats van op prijs — dat versnelt servicebeslissingen aan tafel.',
    '- Een Portkaart lees je op stijl, leeftijd en inzetbaarheid, niet op prijs alleen
- Ruby, Tawny, LBV, Vintage en Colheita zijn servicebeslissingen, geen losse labels
- De kernvraag: welke fles lost welk gastmoment op?
- Groepeer per stijl om navigatie en advies te versnellen
- Sterke sommeliers kennen categorie-inzet, niet elke individuele fles',
    '### Opdracht

Pas de kennis uit «Portkaart lezen» toe op een fles uit je kelder of een kaart. Noteer je bevindingen in de Way of Tasting-app.

### Checklist

- Ik heb een Portkaart op stijlcategorieën ingedeeld
- Ik heb per stijl het juiste serveermoment benoemd
- Ik kan uitleggen wanneer decanteren nodig is



### Reflectievraag

Je hebt tien seconden om een gast door de Portkaart te leiden: welke drie categorieën noem je eerst — en waarom die volgorde?',
    10,
    1
  ),
  (
    'blindproef-examen',
    'Blindproef examen',
    'Na deze les kun jij blind systematisch elimineren in plaats van gokken.
',
    'Blindproeven is de ultieme test.

Niet omdat je alles moet weten.

Maar omdat je logisch moet denken.

Port geeft duidelijke ankers:

kleur, fruit, oxidatie, structuur, afdronk.

Maar onder druk vervallen veel proevers in gokken.

Dat is de fout.

Blindproeven is elimineren.

Niet raden.

Ruby of Tawny?

Dan leeftijd.

Dan categorie.

Dan kwaliteit.

De vraag is niet:

Wat is het?

Maar:

Wat kan het níet zijn?

Dat versnelt precisie.

Dat is professionele proeflogica.


## Food pairing

### Beste pairing

Niet relevant.

Focus volledig op analyse.

## Pro insight

Elimineer systematisch: kleur → oxidatie → structuur. Gokken op één cue is hoe beginners Ruby en oude Tawny verwarren.',
    '- blindproeven
- eliminatie
- structuur
- logica
- analyse
',
    'Professionele Port-blindpanels trainen vaak eerst op kleur en oxidatieniveau voordat ze stijl benoemen — dat vermindert vergissingen tussen Ruby en jonge Tawny.',
    '- Blindproeven start met visuele en aromatische hypothese, niet met het etiket
- Kleur en oxidatie scheiden Ruby van Tawny sneller dan fruit alleen
- Structuur en zoetheid bevestigen of verwerpen je eerste hypothese
- Noteer bewijs per stap voordat je een stijl noemt
- Integratie van Module 1–8 bepaalt de kwaliteit van je eindoordeel',
    '### Opdracht — Blindproef examen

Zet twee tot drie Ports klaar (minimaal Ruby + Tawny; voeg LBV of Vintage toe indien mogelijk). Werk met eliminatielogica:

- Wat kan het NIET zijn?
- Welke structuur past?
- Welke stijl blijft over?

Noteer elke stap. Geen etiket tot na conclusie.

### Checklist

- Ik heb kleur en oxidatie apart genoteerd
- Ik heb een onderbouwde stijlhypothese geformuleerd
- Ik heb mijn conclusie met minstens drie proefankers onderbouwd



### Reflectievraag

Welke cue gaf je de meeste zekerheid bij blindproeven — en welke observatie leidde bijna tot een verkeerde stijlconclusie?',
    15,
    2
  ),
  (
    'port-adviseren',
    'Port adviseren',
    'Na deze les kun jij Port adviseren vanuit gastcontext en behoefte.
',
    'Adviseren is de hoogste vorm van kennis.

Want nu draait het niet om jouw smaak.

Maar om die van de gast.

De fout van beginners:

adviseren vanuit voorkeur.

Professionals adviseren vanuit context.

Vraag altijd:

wat is het moment?

wat eet je erbij?

hoe ervaren ben je?

wil je fruit of complexiteit?

wil je direct drinken of bewaren?

Daarmee bouw je richting.

Niet vanuit product.

Maar vanuit behoefte.

Dat maakt advies premium.


## Food pairing

### Beste pairing

Volledig afhankelijk van gastcontext.

Dat is de les.

## Pro insight

Eén open vraag over moment en ervaring levert betere match dan drie minuten monoloog over jaargangen — en verhoogt gemiddelde bonwaarde.',
    '- advies
- gastcontext
- moment
- behoefte
- verkoop
',
    'In premium restaurants stijgt de conversie naar Port wanneer het advies start bij het gastmoment (digestief, kaas, chocolade) in plaats van bij de producentnaam.',
    '- Portadvies begint bij gastmoment en gerecht, niet bij de duurste fles
- Stijl, leeftijd en structuur bepalen of een suggestie past
- Eén onderbouwd advies per moment werkt beter dan een lange kaartmonoloog
- Temperatuur en glas zijn onderdeel van het advies, niet een voetnoot
- Vertrouwen groeit wanneer je keuzes kunt uitleggen in serveertermen',
    '### Opdracht

Pas de kennis uit «Port adviseren» toe op een fles uit je kelder of een kaart. Noteer je bevindingen in de Way of Tasting-app.

### Checklist

- Ik heb een gastprofiel en moment gekozen
- Ik heb één Portstijl met onderbouwing geadviseerd
- Ik heb temperatuur en glas meegenomen in mijn advies



### Reflectievraag

Een gast zegt ''ik hou niet van zoet'': welke vraag stel jij vóór je überhaupt een stijl noemt — en welke Port ondermijn je die angst?',
    10,
    3
  ),
  (
    'port-bewaren-kelder',
    'Port bewaren (kelderdenken)',
    'Na deze les kun jij kelder- en bewaarstrategie per stijl uitleggen.
',
    'Kelderdenken is anders dan drinken.

Niet elke Port wordt beter.

Ruby Reserve?

Meestal niet.

LBV?

Soms beperkt.

Vintage?

Ja.

Colheita?

Afhankelijk van bottelmoment.

Tawny?

Minder noodzakelijk.

Hier zit de belangrijke spanning:

Waarom bewaren als een wijn al ontwikkeld is?

Dat hoeft niet altijd.

Professionals bewaren potentie.

Niet alleen leeftijd.

Dat maakt kelderen strategisch.

Niet emotioneel.

De beste vraag is:

Wat wint deze wijn nog?

Als het antwoord “weinig” is, open hem.


## Food pairing

### Beste pairing

Vintage met oude kaas.

### Waarom dit werkt

Vintage bij Stilton na jaren flesrijping: tannine is gezacht maar structuur blijft; zout en vet vragen de concentratie die alleen lange rijping levert.

## Pro insight

Kelder zonder geduld koop Ruby; kelder met visie koop Vintage. Wees eerlijk over welke gast welke categorie is — dat bouwt vertrouwen.',
    '- kelder
- flesrijping
- Vintage
- bewaren
- potentieel
',
    'Vintage Port kan decennia rijpen in fles, maar na opening versnelt oxidatie sterk — daarom is portiegrootte en timing na decanteren cruciaal voor kwaliteitsbeleving.',
    '- Bewaren verschilt per stijl: Ruby kort, Tawny en Vintage lang in fles
- Keldercondities (koel, donker, stabiel) beschermen rijping
- Na opening is oxidatie de grootste vijand, vooral bij Vintage
- Decanteer alleen wanneer sediment of ontwikkeling dat vraagt
- Kelderlogica is onderdeel van professioneel Portadvies',
    '### Opdracht

Pas de kennis uit «Port bewaren (kelderdenken)» toe op een fles uit je kelder of een kaart. Noteer je bevindingen in de Way of Tasting-app.

### Checklist

- Ik heb bewaaradvies per stijl onderscheiden
- Ik kan uitleggen wanneer decanteren zinvol is
- Ik heb een openings- en bewaarplan voor één fles beschreven



### Reflectievraag

Je koopt één fles om twintig jaar te bewaren en één om morgen te drinken: welke stijlen kies je — en welke bewaarfout wil je absoluut vermijden?',
    10,
    4
  ),
  (
    'eindintegratie-port',
    'Eindintegratie Port',
    'Na deze les kun jij Port als geïntegreerd systeem toepassen: stijl → structuur → context → keuze.
',
    'Port begrijpen is keuzes begrijpen.

Fruit of oxidatie.

Direct drinken of bewaren.

Blend of oorsprong.

Kracht of finesse.

Door deze track heb je geleerd:

hoe Port wordt gemaakt, hoe hij proeft, hoe hij rijpt, hoe hij serveert, hoe hij paired, hoe hij adviseert.

Dat is geen losse kennis.

Dat is een systeem.

En precies dat maakt Way of Tasting anders.

Niet weten wát Port is.

Maar begrijpen hoe Port werkt.

De eindvraag is niet:

Wat is mijn favoriete Port?

Maar:

Wanneer kies ik welke Port?

Als je dat kunt beantwoorden, beheers je de basis professioneel.


## Food pairing

### Beste pairing

Volledig afhankelijk van stijl.

Dat is de eindtest.

## Pro insight

Port mastery is integratie: stijl, structuur en context in één beslissing. Als je die drie kunt benoemen bij elke glaskeuze, ben je examenklaar.',
    '- integratie
- stijl
- structuur
- context
- professionaliteit
',
    'Het Douro DOC-systeem uit 1756 is een van de oudste beschermde herkomstaanduidingen ter wereld — Port draagt daarmee een van de langste gereguleerde wijntradities.',
    '- Eindintegratie verbindt productie, stijl, service, pairing en advies
- Een sterke Portprofessional denkt in ketens: herkomst → stijl → moment → gast
- Blindproef, kaartlezen en kelderlogica zijn drie kanten van dezelfde expertise
- Consistente terminologie maakt teamadvies betrouwbaarder
- Mastery betekent onderbouwen, niet alles uit het hoofd kennen',
    '### Opdracht — Eindintegratie

Beantwoord schriftelijk vijf scenario''s (zonder hulpmiddelen):

1. Aperitief op terras — welke Port en waarom?
2. Blauwschimmelkaas — welke stijl en serveertemperatuur?
3. Gast wil ''krachtig maar nu drinkbaar'' — advies?
4. Fles Vintage 15 jaar — decanteren ja/nee en waarom?
5. Portkaart met 8 stijlen — hoe lees je inzetbaarheid?

### Checklist

- Ik heb drie kerncompetenties van de track benoemd
- Ik kan één volledig Portadvies van kaart tot glas uitwerken
- Ik heb mijn zwakste module geïdentificeerd voor herhaling



### Reflectievraag

Welke Portstijl kies jij voor jouw perfecte avond — en welke drie factoren (stijl, structuur, context) bepalen die keuze in die volgorde?',
    15,
    5
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
  ('intro-port', 'wat-is-port', 1, 'Wat maakt Port fundamenteel anders dan gewone wijn?', '["Lagere alcohol", "Fortificatie tijdens de gisting", "Geen houtlagering", "Minder suiker"]', 1, 'Correct: Fortificatie tijdens de gisting'),
  ('intro-port', 'wat-is-port', 2, 'Waar komt echte Port vandaan?', '["Bordeaux", "Douro", "Rioja", "Toscane"]', 1, 'Correct: Douro'),
  ('intro-port', 'wat-is-port', 3, 'Een gast bestelt pure chocolade en zoekt een fruitige Port.', '["White Port", "Ruby Reserve", "Dry White", "Tawny 30 Years"]', 1, 'Correct: Ruby Reserve'),
  ('intro-port', 'wat-is-port', 4, 'Waarom blijft Port vaak zoet?', '["Door suiker na botteling", "Door vroeg stoppen van gisting", "Door koude opslag", "Door houtlagering"]', 1, 'Correct: Door vroeg stoppen van gisting'),
  ('intro-port', 'wat-is-port', 5, 'Waarom kiest een producent soms voor oxidatie?', '["Om fouten te verbergen", "Om notige complexiteit te bouwen", "Om alcohol te verlagen", "Om fruit te versterken"]', 1, 'Correct: Om notige complexiteit te bouwen'),
  ('intro-port', 'fortificatie', 1, 'Wat is aguardente in de Portproductie?', '["Een zoete druivenmost", "Neutrale gedistilleerde druivenalcohol voor fortificatie", "Een type eiken vat", "Een Portstijl uit de negentiende eeuw"]', 1, 'Correct: Neutrale gedistilleerde druivenalcohol voor fortificatie'),
  ('intro-port', 'fortificatie', 2, 'Waarom blijft er restsuiker in Port achter?', '["Suiker wordt na botteling bijgevoegd", "Gisting stopt door fortificatie voordat alle suiker is omgezet", "De druiven bevatten geen suiker", "Hout absorbeert alle alcohol"]', 1, 'Correct: Gisting stopt door fortificatie voordat alle suiker is omgezet'),
  ('intro-port', 'fortificatie', 3, 'Wat gebeurt er als je later fortificeert?', '["De wijn wordt altijd zoeter", "Meer suiker is al omgezet; de wijn wordt droger", "De alcohol daalt", "De wijn wordt automatisch White Port"]', 1, 'Correct: Meer suiker is al omgezet; de wijn wordt droger'),
  ('intro-port', 'fortificatie', 4, 'Welke factor is minstens zo belangrijk als de hoeveelheid aguardente?', '["Kleur van het etiket", "Timing van de fortificatie", "Het glaswerk bij serveren", "De maand van botteling"]', 1, 'Correct: Timing van de fortificatie'),
  ('intro-port', 'fortificatie', 5, 'Je proeft een zeer zoete, explosief fruitige jonge Port. Wat is de meest logische verklaring?', '["Zeer late fortificatie", "Geen houtlagering ooit", "Vroege fortificatie met veel restsuiker", "Rijping uitsluitend in glazen dammen"]', 2, 'Correct: Vroege fortificatie met veel restsuiker'),
  ('intro-port', 'waarom-is-port-uniek', 1, 'Wat is het grootste methodische verschil tussen Port en gewone droge rode wijn?', '["Andere druivensoorten alleen", "Fortificatie die gisting stopzet", "Altijd rijping in stalen tanks", "Geen gebruik van schist"]', 1, 'Correct: Fortificatie die gisting stopzet'),
  ('intro-port', 'waarom-is-port-uniek', 2, 'Waarvoor dienen terrassen in de Douro?', '["Alleen voor toeristische routes", "Wijnbouw op steile hellingen met drainage en zon", "Om opbrengst maximaal te verhogen", "Om witte druiven te scheiden"]', 1, 'Correct: Wijnbouw op steile hellingen met drainage en zon'),
  ('intro-port', 'waarom-is-port-uniek', 3, 'Welke uitspraak over traditie in de Douro is het meest correct?', '["Traditie is vooral marketing", "Traditie beïnvloedt oogst en kwaliteit direct", "Traditie geldt alleen voor Vintage Port", "Traditie is vervangen door machines overal"]', 1, 'Correct: Traditie beïnvloedt oogst en kwaliteit direct'),
  ('intro-port', 'waarom-is-port-uniek', 4, 'Waarom is Port ''uniek'' in internationale context?', '["Het is de enige zoete drank ter wereld", "Landschap, fortificatie en rijpingstraditie vormen één geheel", "Het bevat geen druivenalcohol", "Het wordt nergens anders gekopieerd omdat het verboden is"]', 1, 'Correct: Landschap, fortificatie en rijpingstraditie vormen één geheel'),
  ('intro-port', 'waarom-is-port-uniek', 5, 'Je proeft een droge Douro-tafelwijn naast een Ruby Port van hetzelfde jaar. Wat verwacht je?', '["Identiek smaakprofiel", "Port met meer zoetheid, body en warmte", "Tafelwijn met hoger alcoholpercentage", "Ruby zonder fruit"]', 1, 'Correct: Port met meer zoetheid, body en warmte'),
  ('intro-port', 'geschiedenis-van-port', 1, 'Waarom werden Britse handelaren in de 17e–18e eeuw geïnteresseerd in Portugese wijn?', '["Portugal verbood Franse wijn", "Franse wijn was schaars door conflicten; Portugal bood alternatief", "De Douro produceerde alleen witte wijn", "Britten mochten geen wijn importeren uit Spanje"]', 1, 'Correct: Franse wijn was schaars door conflicten; Portugal bood alternatief'),
  ('intro-port', 'geschiedenis-van-port', 2, 'Waarom werden lodges vooral in Vila Nova de Gaia gebouwd?', '["Daar groeien de beste druiven", "Koelere kustnabijheid en handelslogistiek voor rijping", "Het is wettelijk verboden elders te rijpen", "Alleen daar mogen Britten wonen"]', 1, 'Correct: Koelere kustnabijheid en handelslogistiek voor rijping'),
  ('intro-port', 'geschiedenis-van-port', 3, 'Wat was een oorspronkelijke reden om alcohol toe te voegen aan wijn voor export?', '["Smaak altijd zoeter maken", "Houdbaarheid tijdens lange zeereizen", "Etiketten kleurrijker maken", "Belasting te verlagen"]', 1, 'Correct: Houdbaarheid tijdens lange zeereizen'),
  ('intro-port', 'geschiedenis-van-port', 4, 'Welke uitspraak over Britse namen op Portflessen klopt?', '["Ze komen van wijngaarden in Engeland", "Ze herinneren aan Britse investeerders en handelshuizen", "Ze betekenen dat de wijn in Londen wordt gebotteld", "Ze zijn verplicht voor Ruby Port"]', 1, 'Correct: Ze herinneren aan Britse investeerders en handelshuizen'),
  ('intro-port', 'geschiedenis-van-port', 5, 'Je bezoekt een lodge in Gaia. Wat verwacht je daar te zien?', '["Steile terrassen met druivenpluk", "Grote kelders met houten vaten voor rijping", "Alleen een winkel zonder opslag", "Uitsluitend stalen tanks in de open lucht"]', 1, 'Correct: Grote kelders met houten vaten voor rijping'),
  ('intro-port', 'portcategorieen', 1, 'Welke Portcategorie is typisch het meest fruitig en jong?', '["Tawny 30 Years", "Ruby", "Vintage na twintig jaar fles", "Colheita"]', 1, 'Correct: Ruby'),
  ('intro-port', 'portcategorieen', 2, 'Waar herken je Tawny het snelst aan?', '["Dieprode kleur en korte rijping", "Bruine tint en noten door houtlagering", "Altijd witte druiven", "Altijd één jaargang op fles"]', 1, 'Correct: Bruine tint en noten door houtlagering'),
  ('intro-port', 'portcategorieen', 3, 'White Port wordt gemaakt van:', '["Alleen Touriga Nacional", "Witte druivenrassen", "Gedistilleerde aguardente", "Gemengde jaargangen zonder druiven"]', 1, 'Correct: Witte druivenrassen'),
  ('intro-port', 'portcategorieen', 4, 'Wat maakt Vintage Port bijzonder?', '["Altijd minstens veertig jaar op hout", "Wijn van één uitmuntend jaar met flesrijping", "Geen fortificatie", "Alleen voor koken"]', 1, 'Correct: Wijn van één uitmuntend jaar met flesrijping'),
  ('intro-port', 'portcategorieen', 5, 'Een gast wil na het diner één Port voor kaas én pure chocolade. Meest logische richting?', '["White Port", "LBV of Ruby Reserve", "Tawny 40 Years", "Rosé Port"]', 1, 'Correct: LBV of Ruby Reserve'),
  ('productie-port', 'druiven-van-port', 1, 'Waarom is Port zelden van één druivenras?', '["Wetgeving verbiedt monorassen", "Blend combineert structuur, fruit en finesse in productie", "Er is maar één ras in de Douro", "Witte druiven domineren altijd"]', 1, 'Correct: Blend combineert structuur, fruit en finesse in productie'),
  ('productie-port', 'druiven-van-port', 2, 'Welk ras staat bekend om concentratie en stevige tannines?', '["Tinta Roriz", "Touriga Nacional", "Tinto Cão", "Malvasia Fina"]', 1, 'Correct: Touriga Nacional'),
  ('productie-port', 'druiven-van-port', 3, 'Welke rol heeft Tinta Roriz typisch in een Portblend?', '["Alleen kleur geven", "Volume en rood fruit in het midden", "Verdunners voor alcohol", "Geen rol in rode Port"]', 1, 'Correct: Volume en rood fruit in het midden'),
  ('productie-port', 'druiven-van-port', 4, 'Waarom wordt Tinto Cão gewaardeerd ondanks lage opbrengst?', '["Hij geeft de hoogste opbrengst per hectare", "Aromatische finesse en complexiteit", "Hij vervangt aguardente", "Alleen voor White Port"]', 1, 'Correct: Aromatische finesse en complexiteit'),
  ('productie-port', 'druiven-van-port', 5, 'Een Vintage Port mist pit en lengte. Welke blend-aanpassing is logisch?', '["Meer Touriga Nacional", "Alleen Malvasia", "Geen fortificatie", "Minder rijping in vat altijd"]', 0, 'Correct: Meer Touriga Nacional'),
  ('productie-port', 'douro-vallei', 1, 'Welk deel van de Douro-vallei staat bekend als kwaliteitshart voor premium Port?', '["Baixo Corgo", "Cima Corgo", "Vinho Verde", "Alentejo"]', 1, 'Correct: Cima Corgo'),
  ('productie-port', 'douro-vallei', 2, 'Wat kenmerkt Baixo Corgo in productietermen?', '["Droogste en heetste zone", "Relatief meer regen en hogere opbrengst", "Geen terrassen", "Alleen witte druiven"]', 1, 'Correct: Relatief meer regen en hogere opbrengst'),
  ('productie-port', 'douro-vallei', 3, 'Douro Superior staat vooral bekend om:', '["Koel zeeklimaat", "Extreme hitte en geconcentreerde druiven", "Hoogste regenval in Portugal", "Alleen bulkproductie zonder kwaliteit"]', 1, 'Correct: Extreme hitte en geconcentreerde druiven'),
  ('productie-port', 'douro-vallei', 4, 'Waarom zijn terrassen essentieel in de hele Douro-vallei?', '["Voor wandeltoerisme alleen", "Wijnbouw op steile hellingen met drainage", "Om irrigatie te vermijden", "Alleen in Baixo Corgo verplicht"]', 1, 'Correct: Wijnbouw op steile hellingen met drainage'),
  ('productie-port', 'douro-vallei', 5, 'Een producent zoekt maximale concentratie per druif voor Vintage. Logische focus?', '["Vlakke velden in Baixo Corgo", "Steile terrassen in Cima Corgo of Douro Superior", "Kustgebied nabij Porto", "Irrigatie-intensieve laagvlakten"]', 1, 'Correct: Steile terrassen in Cima Corgo of Douro Superior'),
  ('productie-port', 'klimaat-en-terroir', 1, 'Wat doet extreme hitte in de Douro met de druiven?', '["Verlaagt suikergehalte", "Versnelt rijping en verhoogt concentratie", "Maakt schil dunner zonder effect", "Voorkomt fortificatie"]', 1, 'Correct: Versnelt rijping en verhoogt concentratie'),
  ('productie-port', 'klimaat-en-terroir', 2, 'Waarom is schist belangrijk voor Portproductie?', '["Het houdt veel water vast oppervlakkig", "Warmte, drainage en diepe wortels door rots", "Het vervangt aguardente", "Het maakt wijn automatisch wit"]', 1, 'Correct: Warmte, drainage en diepe wortels door rots'),
  ('productie-port', 'klimaat-en-terroir', 3, 'Waarom kiezen kwaliteitsproducenten voor lage opbrengst?', '["Hogere opbrengst geeft altijd betere Port", "Minder kilo's per hectare betekent rijker extract", "Wet verplicht lage opbrengst voor Ruby", "Lage opbrengst voorkomt houtlagering"]', 1, 'Correct: Minder kilo''s per hectare betekent rijker extract'),
  ('productie-port', 'klimaat-en-terroir', 4, 'Welke combinatie past het best bij krachtige Vintage-productie?', '["Koel klimaat en klei", "Hitte, schist en geconcentreerde druiven", "Hoogopbrengende vlakten", "Alleen irrigatie zonder terrassen"]', 1, 'Correct: Hitte, schist en geconcentreerde druiven'),
  ('productie-port', 'klimaat-en-terroir', 5, 'Je leest ''minerale spanning'' in een Portbeschrijving. Meest waarschijnlijke bron?', '["Toegevoegde mineralen in fles", "Terroir met schist en stress in de wijngaard", "Korte flessenrijping", "White Port blend"]', 1, 'Correct: Terroir met schist en stress in de wijngaard'),
  ('productie-port', 'houtlagering', 1, 'Wat is het hoofddoel van houtlagering bij Port?', '["Alcohol verlagen", "Rijping, oxidatie en smaakontwikkeling", "Suiker verwijderen", "Kleur altijd roder maken"]', 1, 'Correct: Rijping, oxidatie en smaakontwikkeling'),
  ('productie-port', 'houtlagering', 2, 'Waarom rijpen Tawny''s vaak in grote vaten?', '["Snellere houtextractie", "Langzame, milde oxidatie over lange tijd", "Geen contact met zuurstof", "Alleen voor White Port"]', 1, 'Correct: Langzame, milde oxidatie over lange tijd'),
  ('productie-port', 'houtlagering', 3, 'Kleine vaten verschillen van grote vaten doordat:', '["Ze geen houtinvloed geven", "Meer oppervlak per liter snellere extractie geeft", "Ze alleen in de Douro staan", "Ze fortificatie vervangen"]', 1, 'Correct: Meer oppervlak per liter snellere extractie geeft'),
  ('productie-port', 'houtlagering', 4, 'Waarom rijpt Vintage Port maar kort op hout?', '["Wettelijk maximum één week", "Om fruit en tannine voor flesrijping te behouden", "Vintage mag nooit hout zien", "Alleen voor export"]', 1, 'Correct: Om fruit en tannine voor flesrijping te behouden'),
  ('productie-port', 'houtlagering', 5, 'Je proeft noten en karamel maar weinig fris fruit. Meest logische verklaring?', '["Geen houtlagering ooit", "Lange houtlagering in grote vaten", "Alleen fortificatie op dag één", "Jonge Ruby zonder rijping"]', 1, 'Correct: Lange houtlagering in grote vaten'),
  ('productie-port', 'oxidatie-uitgelegd', 1, 'Wat gebeurt er bij oxidatieve rijping van Port?', '["Fruit wordt sterker en purperder", "Fruit verandert richting noten en karamel", "Alcohol verdwijnt volledig", "Wijn wordt altijd droog zonder suiker"]', 1, 'Correct: Fruit verandert richting noten en karamel'),
  ('productie-port', 'oxidatie-uitgelegd', 2, 'Welke stijl is bewust weinig blootgesteld aan oxidatie?', '["Tawny 30 Years", "Ruby", "Colheita oud", "Tawny met leeftijd"]', 1, 'Correct: Ruby'),
  ('productie-port', 'oxidatie-uitgelegd', 3, 'Waarom heeft Tawny vaak een amberkleur?', '["Kunstmatige kleurstof", "Langdurige oxidatie en kleurverlies in hout", "Geen contact met druiven", "Korte flessenrijping alleen"]', 1, 'Correct: Langdurige oxidatie en kleurverlies in hout'),
  ('productie-port', 'oxidatie-uitgelegd', 4, 'Je proeft hazelnoot en toffee zonder fris bramenfruit. Meest waarschijnlijk?', '["Jonge Ruby", "Tawny met oxidatieve rijping", "Onfortified tafelwijn", "White Port zonder rijping"]', 1, 'Correct: Tawny met oxidatieve rijping'),
  ('productie-port', 'oxidatie-uitgelegd', 5, 'Zuurstof in de Portproductie is vooral:', '["Altijd schadelijk en te vermijden", "Een stuurinstrument voor smaakprofiel", "Alleen relevant voor witte wijn", "Vervangen door aguardente"]', 1, 'Correct: Een stuurinstrument voor smaakprofiel'),
  ('proeven-port', 'proefnotitie-port', 1, 'Wat is de eerste stap in de Way-of-Tasting-structuur voor Port?', '["Proeven", "Ruiken", "Kijken", "Concluderen"]', 2, 'Correct: Kijken'),
  ('proeven-port', 'proefnotitie-port', 2, 'Wat kan viscositeit in het glas vaak suggereren?', '["Alleen leeftijd", "Alcohol en restsuiker", "Alleen druivenras", "Schenktemperatuur"]', 1, 'Correct: Alcohol en restsuiker'),
  ('proeven-port', 'proefnotitie-port', 3, 'Waar analyseer je tannine en body het best?', '["Alleen bij kleur", "Alleen bij de neus", "Bij smaak en structuur", "Alleen in de conclusie"]', 2, 'Correct: Bij smaak en structuur'),
  ('proeven-port', 'proefnotitie-port', 4, 'Wat is het doel van de conclusie in een proefnotitie?', '["Het glas beschrijven", "Waarnemingen koppelen aan stijl en kwaliteit", "De prijs bepalen", "Het etiket samenvatten"]', 1, 'Correct: Waarnemingen koppelen aan stijl en kwaliteit'),
  ('proeven-port', 'proefnotitie-port', 5, 'Waarom schrijf je proefnotities systematisch op?', '["Om sneller te drinken", "Om patronen te herkennen en te vergelijken", "Om alcohol te meten", "Om de serveertemperatuur te verhogen"]', 1, 'Correct: Om patronen te herkennen en te vergelijken'),
  ('proeven-port', 'structuur-herkennen', 1, 'Wat beschrijft structuur bij Port het best?', '["Alleen het aroma", "Hoe de wijn in de mond aanvoelt", "Alleen de kleur", "De flesvorm"]', 1, 'Correct: Hoe de wijn in de mond aanvoelt'),
  ('proeven-port', 'structuur-herkennen', 2, 'Waar voel je tannine vooral?', '["Op de tongpunt", "Op het tandvlees", "In de neus", "In de afdronk alleen"]', 1, 'Correct: Op het tandvlees'),
  ('proeven-port', 'structuur-herkennen', 3, 'Wat is body?', '["Het alcoholpercentage", "Het gewicht en volume in de mond", "De kleurintensiteit", "De serveertemperatuur"]', 1, 'Correct: Het gewicht en volume in de mond'),
  ('proeven-port', 'structuur-herkennen', 4, 'Wat kan branderige alcohol suggereren?', '["Perfecte integratie", "Onevenwicht of te jonge indruk", "Te weinig zoetheid", "Te veel tannine"]', 1, 'Correct: Onevenwicht of te jonge indruk'),
  ('proeven-port', 'structuur-herkennen', 5, 'Wat bepaalt uiteindelijk de kwaliteitsindruk van structuur?', '["Alleen zoetheid", "Balans tussen alle componenten", "Alleen alcoholpercentage", "Alleen de afdronklengte"]', 1, 'Correct: Balans tussen alle componenten'),
  ('proeven-port', 'aromas-herkennen', 1, 'Welke aroma''s passen het best bij een jonge Ruby Port?', '["Walnoot en toffee", "Kers, braam en pruim", "Alleen citrus en appel", "Rook en leer"]', 1, 'Correct: Kers, braam en pruim'),
  ('proeven-port', 'aromas-herkennen', 2, 'Wat wijzen noten en karamel meestal op?', '["Zeer jonge vinificatie", "Rijping en langere ontwikkeling", "Te lage alcohol", "Alleen white Port"]', 1, 'Correct: Rijping en langere ontwikkeling'),
  ('proeven-port', 'aromas-herkennen', 3, 'Welke tonen zijn typisch oxidatief?', '["Vers gras en limoen", "Toffee, vijg en gedroogd fruit", "Alleen pure framboos", "Brooddeeg en gist"]', 1, 'Correct: Toffee, vijg en gedroogd fruit'),
  ('proeven-port', 'aromas-herkennen', 4, 'Waarom is kruidigheid relevant bij Port?', '["Het verlaagt altijd de alcohol", "Het voegt diepte en complexiteit toe", "Het betekent altijd een fout", "Het komt alleen van houten vaten"]', 1, 'Correct: Het voegt diepte en complexiteit toe'),
  ('proeven-port', 'aromas-herkennen', 5, 'Waarom ruik je Port meerdere keren in het glas?', '["Om de alcohol te verdampen", "Omdat aroma's evolueren naarmate de wijn opent", "Om de kleur te bevestigen", "Om de temperatuur te meten"]', 1, 'Correct: Omdat aroma''s evolueren naarmate de wijn opent'),
  ('proeven-port', 'ruby-vs-tawny-blind', 1, 'Welke kleur wijst het sterkst op Tawny Port?', '["Diep paarsrobijn", "Amber en oranjebruin", "Bleek strogeel", "Helder grasgroen"]', 1, 'Correct: Amber en oranjebruin'),
  ('proeven-port', 'ruby-vs-tawny-blind', 2, 'Welke neus past het best bij Ruby?', '["Walnoot en toffee", "Vers kers- en braamfruit", "Alleen gedroogde vijg", "Rook en tabak"]', 1, 'Correct: Vers kers- en braamfruit'),
  ('proeven-port', 'ruby-vs-tawny-blind', 3, 'Blind: diep robijn, braam op de neus, stevige tannine. Meest waarschijnlijk?', '["Tawny 20 Years", "Ruby of jonge Ruby-stijl", "White Port", "Colheita 1970"]', 1, 'Correct: Ruby of jonge Ruby-stijl'),
  ('proeven-port', 'ruby-vs-tawny-blind', 4, 'Waarom is de afdronk nuttig bij blindproeven?', '["Hij verandert de kleur", "Hij bevestigt vaak je eerdere hypothese", "Hij meet het alcoholpercentage", "Hij vervangt de neus"]', 1, 'Correct: Hij bevestigt vaak je eerdere hypothese'),
  ('proeven-port', 'ruby-vs-tawny-blind', 5, 'Wat is de kern van blindproeven?', '["Het etiket raden", "Objectief waarnemen zonder voorafkennis", "Alleen op prijs letten", "De oudste fles kiezen"]', 1, 'Correct: Objectief waarnemen zonder voorafkennis'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 1, 'Uit welk land komt echte Port?', '["Spanje", "Frankrijk", "Portugal", "Italië"]', 2, 'Correct: Portugal'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 2, 'Waarom heet de wijn ''Port''?', '["Naar de druif Porta", "Naar de havenstad Porto", "Naar de kleur porto-rood", "Naar het woord 'portie'"]', 1, 'Correct: Naar de havenstad Porto'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 3, 'Waar lagen historisch de beroemde Port-lodges?', '["In Lissabon", "In Vila Nova de Gaia", "In Madrid", "In Bordeaux"]', 1, 'Correct: In Vila Nova de Gaia'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 4, 'In welk jaar werd de Douro officieel afgebakend?', '["1756", "1820", "1900", "2000"]', 0, 'Correct: 1756'),
  ('oorsprong-port', 'waar-komt-port-vandaan', 5, 'Waarom is herkomstbescherming belangrijk?', '["Alleen voor hogere prijzen", "Voor authenticiteit en uniek terroir", "Alleen voor exportbelasting", "Alleen voor etiketdesign"]', 1, 'Correct: Voor authenticiteit en uniek terroir'),
  ('oorsprong-port', 'druiven-regionaliteit', 1, 'Wat is het focusverschil met les 6 over druiven?', '["Alleen alcoholpercentage", "Regionaliteit en quintatraditie, niet productiemechanica", "Alleen export", "Alleen glaswerk"]', 1, 'Correct: Regionaliteit en quintatraditie, niet productiemechanica'),
  ('oorsprong-port', 'druiven-regionaliteit', 2, 'Welk ras is het meest iconisch voor Douro-identiteit?', '["Merlot", "Touriga Nacional", "Chardonnay", "Pinot Noir"]', 1, 'Correct: Touriga Nacional'),
  ('oorsprong-port', 'druiven-regionaliteit', 3, 'Wat betekent quintatraditie?', '["Eén druif per fles", "Generaties blends en perceelkennis binnen een domein", "Alleen machine-oogst", "Import uit Spanje"]', 1, 'Correct: Generaties blends en perceelkennis binnen een domein'),
  ('oorsprong-port', 'druiven-regionaliteit', 4, 'Wat is terroiridentiteit in deze context?', '["Alleen het etiket", "Welke rassen en stijlen een plek uniek maken", "Alleen de fleskleur", "De serveertemperatuur"]', 1, 'Correct: Welke rassen en stijlen een plek uniek maken'),
  ('oorsprong-port', 'druiven-regionaliteit', 5, 'Waarom zijn meer dan 80 rassen toegestaan?', '["Voor willekeur", "Als levend archief voor regionale expressie", "Om alcohol te verlagen", "Om export te vermijden"]', 1, 'Correct: Als levend archief voor regionale expressie'),
  ('oorsprong-port', 'douro-cultureel-landschap', 1, 'Hoeveel subzones heeft de Douro-vallei?', '["Twee", "Drie", "Vijf", "Zeven"]', 1, 'Correct: Drie'),
  ('oorsprong-port', 'douro-cultureel-landschap', 2, 'Welke subzone wordt vaak het ''hart'' van top-Port genoemd?', '["Baixo Corgo", "Cima Corgo", "Douro Superior", "Alentejo"]', 1, 'Correct: Cima Corgo'),
  ('oorsprong-port', 'douro-cultureel-landschap', 3, 'Wat is een quinta in deze context?', '["Een glastype", "Een wijndomein en identiteitsanker in het landschap", "Een exporthaven", "Een druivenras"]', 1, 'Correct: Een wijndomein en identiteitsanker in het landschap'),
  ('oorsprong-port', 'douro-cultureel-landschap', 4, 'Waarom staan terrassen centraal in het Douro-landschap?', '["Voor decoratie", "Ze maken wijnbouw op steile hellingen mogelijk", "Ze verlagen alcohol", "Ze vervangen rijping"]', 1, 'Correct: Ze maken wijnbouw op steile hellingen mogelijk'),
  ('oorsprong-port', 'douro-cultureel-landschap', 5, 'Waarom is de Douro UNESCO Werelderfgoed?', '["Alleen vanwege de rivier", "Vanwege het unieke cultuur- en wijnlandschap", "Vanwege de stad Porto alleen", "Vanwege exportcijfers"]', 1, 'Correct: Vanwege het unieke cultuur- en wijnlandschap'),
  ('oorsprong-port', 'quintas-en-port-houses', 1, 'Wat is mesoclimaat?', '["Alleen wereldwijd klimaat", "Lokaal klimaat op helling of in een subzone", "Alleen kelder temperatuur", "Alleen exportklimaat"]', 1, 'Correct: Lokaal klimaat op helling of in een subzone'),
  ('oorsprong-port', 'quintas-en-port-houses', 2, 'Welke bodem is het terroir-icoon van de Douro?', '["Kalksteen", "Leisteen (schist)", "Puin", "Veen"]', 1, 'Correct: Leisteen (schist)'),
  ('oorsprong-port', 'quintas-en-port-houses', 3, 'Wat doet diurnaal temperatuurverschil?', '["Verlaagt altijd alcohol", "Helpt zuur te behouden ondanks warme dagen", "Maakt wijn altijd zoeter", "Voorkomt rijping"]', 1, 'Correct: Helpt zuur te behouden ondanks warme dagen'),
  ('oorsprong-port', 'quintas-en-port-houses', 4, 'Waarom dwingt leisteen wortels diep?', '["Door veel oppervlaktewater", "Door scheuren, drainage en warmteopslag", "Door zandige toplaag", "Door kunstmatige irrigatie alleen"]', 1, 'Correct: Door scheuren, drainage en warmteopslag'),
  ('oorsprong-port', 'quintas-en-port-houses', 5, 'Wat is zonekarakter?', '["Alleen het IVDP-logo", "Hoe mesoclimaat en bodem per subzone smaak kleuren", "Alleen de flesvorm", "Alleen het alcoholpercentage"]', 1, 'Correct: Hoe mesoclimaat en bodem per subzone smaak kleuren'),
  ('oorsprong-port', 'producenten-herkennen', 1, 'Wie beheert de officiële Douro-classificatie?', '["Europese Unie alleen", "IVDP", "UNESCO", "Individuele exporteurs"]', 1, 'Correct: IVDP'),
  ('oorsprong-port', 'producenten-herkennen', 2, 'Welke letter is de hoogste wijngaardclassificatie?', '["C", "F", "A", "E"]', 2, 'Correct: A'),
  ('oorsprong-port', 'producenten-herkennen', 3, 'Wat verhoogt meestal concentratie per druif?', '["Hoge opbrengst per stok", "Lage opbrengst per stok", "Meer regen", "Jongere stokken alleen"]', 1, 'Correct: Lage opbrengst per stok'),
  ('oorsprong-port', 'producenten-herkennen', 4, 'Welke factoren tellen mee in classificatie?', '["Alleen flesvorm", "Ligging, zon, helling, bodem, opbrengst", "Alleen exportmarkt", "Alleen alcoholpercentage"]', 1, 'Correct: Ligging, zon, helling, bodem, opbrengst'),
  ('oorsprong-port', 'producenten-herkennen', 5, 'Waar begint volgens dit systeem grote Port?', '["In de haven", "In de geclassificeerde wijngaard", "Alleen in het glas", "Bij het etiket"]', 1, 'Correct: In de geclassificeerde wijngaard'),
  ('portstijlen', 'ruby-reserve', 1, 'Waarom heet Ruby Port Ruby?', '["Door de druivensoort", "Door de robijnrode kleur", "Door de regio", "Door de bottelvorm"]', 1, 'Correct: Door de robijnrode kleur'),
  ('portstijlen', 'ruby-reserve', 2, 'Hoe lang rijpt Ruby Port meestal?', '["2–3 jaar", "10 jaar", "20 jaar", "30 jaar"]', 0, 'Correct: 2–3 jaar'),
  ('portstijlen', 'ruby-reserve', 3, 'Waarom rijpt Ruby in grote vaten?', '["Voor meer oxidatie", "Voor minder oxidatie en meer fruitbehoud", "Voor hogere alcohol", "Voor meer suiker"]', 1, 'Correct: Voor minder oxidatie en meer fruitbehoud'),
  ('portstijlen', 'ruby-reserve', 4, 'Welke aroma''s passen typisch bij Ruby?', '["Walnoten en karamel", "Kers, braam en pruim", "Citrus en appel", "Honing en amandel"]', 1, 'Correct: Kers, braam en pruim'),
  ('portstijlen', 'ruby-reserve', 5, 'Wat past klassiek bij Ruby Port?', '["Oesters", "Pure chocolade", "Sushi", "Groene salade"]', 1, 'Correct: Pure chocolade'),
  ('portstijlen', 'late-bottled-vintage', 1, 'Waar rijpt Tawny Port meestal?', '["Op fles", "In kleinere houten vaten", "In betonnen tanks", "Alleen in RVS"]', 1, 'Correct: In kleinere houten vaten'),
  ('portstijlen', 'late-bottled-vintage', 2, 'Wat veroorzaakt de lichtere amberkleur van Tawny?', '["Meer suiker", "Oxidatie tijdens houtlagering", "Minder alcohol", "Witte druiven"]', 1, 'Correct: Oxidatie tijdens houtlagering'),
  ('portstijlen', 'late-bottled-vintage', 3, 'Welke aroma''s passen typisch bij Tawny?', '["Kers en braam", "Walnoten en karamel", "Citrus en appel", "Framboos en aardbei"]', 1, 'Correct: Walnoten en karamel'),
  ('portstijlen', 'late-bottled-vintage', 4, 'Gast wil oogstjaar-Port voor binnen vijf jaar drinken, geen decanteren. Beste advies?', '["Vintage 2011", "LBV gefilterd", "Garrafeira", "Crusted zonder depot"]', 1, 'Correct: LBV gefilterd'),
  ('portstijlen', 'late-bottled-vintage', 5, 'Hoe lang blijft Tawny vaak goed na opening?', '["2 dagen", "1 week", "4–8 weken", "6 maanden zonder kwaliteitsverlies"]', 2, 'Correct: 4–8 weken'),
  ('portstijlen', 'crusted-port', 1, 'Waaruit wordt LBV gemaakt?', '["Meerdere oogstjaren", "Één oogstjaar", "Alleen witte druiven", "Alleen Tawny-blends"]', 1, 'Correct: Één oogstjaar'),
  ('portstijlen', 'crusted-port', 2, 'Hoe lang rijpt LBV meestal op vat?', '["2 jaar", "4–6 jaar", "20 jaar", "30 jaar"]', 1, 'Correct: 4–6 jaar'),
  ('portstijlen', 'crusted-port', 3, 'Waarin verschilt LBV van Vintage Port?', '["LBV rijpt langer op vat en is directer drinkbaar", "LBV heeft geen oogstjaar", "Vintage rijpt alleen op vat", "LBV is altijd wit"]', 0, 'Correct: LBV rijpt langer op vat en is directer drinkbaar'),
  ('portstijlen', 'crusted-port', 4, 'Welke aroma''s passen typisch bij LBV?', '["Citrus en appel", "Zwarte kersen, pruimen en cacao", "Walnoten en toffee", "Framboos en munt"]', 1, 'Correct: Zwarte kersen, pruimen en cacao'),
  ('portstijlen', 'crusted-port', 5, 'Waarom zien sommigen LBV als brugstijl?', '["Minder alcohol dan Ruby", "Meer karakter dan Ruby, minder geduld dan Vintage", "Geen fruit", "Alleen voor cocktails"]', 1, 'Correct: Meer karakter dan Ruby, minder geduld dan Vintage'),
  ('portstijlen', 'vintage-port', 1, 'Waarvan wordt White Port gemaakt?', '["Rode druiven", "Witte druiven", "Rosé-druiven", "Een blend van rood en wit"]', 1, 'Correct: Witte druiven'),
  ('portstijlen', 'vintage-port', 2, 'Welke stijlen kan White Port hebben?', '["Alleen zoet", "Alleen droog", "Droog tot zoet", "Alleen oxidatief"]', 2, 'Correct: Droog tot zoet'),
  ('portstijlen', 'vintage-port', 3, 'Welke aroma''s passen vaak bij White Port?', '["Kers en braam", "Citrus en amandel", "Walnoot en karamel", "Koffie en cacao"]', 1, 'Correct: Citrus en amandel'),
  ('portstijlen', 'vintage-port', 4, 'Wat is een populaire moderne serveerwijze?', '["White Port & Cola", "White Port & Tonic", "White Port & Bier", "White Port warm"]', 1, 'Correct: White Port & Tonic'),
  ('portstijlen', 'vintage-port', 5, 'Wanneer wordt White Port vaak gedronken?', '["Als aperitief", "Alleen na het diner", "Alleen bij kaas", "Alleen bij dessert"]', 0, 'Correct: Als aperitief'),
  ('portstijlen', 'vintage-vs-lbv', 1, 'Waarvan wordt Rosé Port gemaakt?', '["Witte druiven", "Blauwe druiven met kort schilcontact", "Alleen Tawny-blends", "Alleen rosé-druiven"]', 1, 'Correct: Blauwe druiven met kort schilcontact'),
  ('portstijlen', 'vintage-vs-lbv', 2, 'Waarom is Rosé Port lichter van kleur dan Ruby?', '["Meer alcohol", "Minder schilcontact", "Meer suiker", "Langere houtlagering"]', 1, 'Correct: Minder schilcontact'),
  ('portstijlen', 'vintage-vs-lbv', 3, 'Welke aroma''s passen vaak bij Rosé Port?', '["Walnoten en karamel", "Aardbei en framboos", "Vijgen en toffee", "Koffie en cacao"]', 1, 'Correct: Aardbei en framboos'),
  ('portstijlen', 'vintage-vs-lbv', 4, 'Waar wordt Rosé Port vaak voor gebruikt?', '["Alleen bij dessert", "Als aperitief en in cocktails", "Alleen voor langdurige rijping", "Alleen blindproeven"]', 1, 'Correct: Als aperitief en in cocktails'),
  ('portstijlen', 'vintage-vs-lbv', 5, 'Sinds wanneer is Rosé Port commercieel erkend?', '["1756", "1900", "2008", "2020"]', 2, 'Correct: 2008'),
  ('portstijlen-verdiept', 'white-port', 1, 'Waarvan wordt White Port gemaakt?', '["Rode druiven", "Witte druiven", "Rosé-druiven", "Gedistilleerde druiven"]', 1, 'Correct: Witte druiven'),
  ('portstijlen-verdiept', 'white-port', 2, 'Welke serveerwijze is modern populair?', '["White Port & Cola", "White Port & Tonic", "White Port warm", "White Port met ijs alleen"]', 1, 'Correct: White Port & Tonic'),
  ('portstijlen-verdiept', 'white-port', 3, 'Wanneer past White Port het best?', '["Als aperitief", "Alleen bij blauwe kaas", "Alleen na Vintage", "Alleen bij vlees"]', 0, 'Correct: Als aperitief'),
  ('portstijlen-verdiept', 'white-port', 4, 'Welke temperatuur is ideaal voor droge White?', '["16–18°C", "8–10°C", "Kamertemperatuur", "4°C"]', 1, 'Correct: 8–10°C'),
  ('portstijlen-verdiept', 'white-port', 5, 'Een gast wil iets fris vóór het diner. Eerste advies?', '["Vintage Port", "20 Years Tawny", "White Port", "Crusted Port"]', 2, 'Correct: White Port'),
  ('portstijlen-verdiept', 'rose-port', 1, 'Wat maakt Rosé Port licht van kleur?', '["Witte druiven", "Kort schilcontact", "Geen fortificatie", "Lange houtlagering"]', 1, 'Correct: Kort schilcontact'),
  ('portstijlen-verdiept', 'rose-port', 2, 'Sinds wanneer is Rosé officieel erkend?', '["1756", "1980", "2008", "2020"]', 2, 'Correct: 2008'),
  ('portstijlen-verdiept', 'rose-port', 3, 'Ideale serveertemperatuur?', '["16–18°C", "8–10°C", "20°C", "4°C"]', 1, 'Correct: 8–10°C'),
  ('portstijlen-verdiept', 'rose-port', 4, 'Rosé vs Ruby: wat verwacht je meer?', '["Tannine en diepte", "Frisheid en licht fruit", "Noten en karamel", "Depot"]', 1, 'Correct: Frisheid en licht fruit'),
  ('portstijlen-verdiept', 'rose-port', 5, 'Welk moment past het best?', '["Zware digestief na vlees", "Aperitief of zomerse avond", "Alleen bij Stilton", "Celaring 30 jaar"]', 1, 'Correct: Aperitief of zomerse avond'),
  ('portstijlen-verdiept', 'tawny-port', 1, 'Wat onderscheidt Tawny fundamenteel van Ruby?', '["Minder alcohol", "oxidatieve rijping in hout", "Witte druiven", "Geen fortificatie"]', 1, 'Correct: oxidatieve rijping in hout'),
  ('portstijlen-verdiept', 'tawny-port', 2, 'Wat betekent ''20 Years'' op het etiket?', '["Exact 20 jaar oude fles", "Gemiddelde leeftijd van het blend", "20 jaar op fles", "20% alcohol"]', 1, 'Correct: Gemiddelde leeftijd van het blend'),
  ('portstijlen-verdiept', 'tawny-port', 3, 'Waarom serveer je Tawny koeler dan Vintage?', '["Minder suiker", "Finesse blijft beter behouden", "Meer tannine", "Depot"]', 1, 'Correct: Finesse blijft beter behouden'),
  ('portstijlen-verdiept', 'tawny-port', 4, 'Welke Tawny is vaak de gastronomische brug?', '["Basic Ruby-style", "10 Years", "20 Years", "White Port"]', 2, 'Correct: 20 Years'),
  ('portstijlen-verdiept', 'tawny-port', 5, 'Gast wil notendessert. Eerste richting?', '["Jonge Ruby", "20 Years Tawny", "Vintage 2 jaar", "White Dry"]', 1, 'Correct: 20 Years Tawny'),
  ('portstijlen-verdiept', 'colheita-port', 1, 'Wat betekent Colheita?', '["Blend", "Oogst", "Vat", "Fles"]', 1, 'Correct: Oogst'),
  ('portstijlen-verdiept', 'colheita-port', 2, 'Waaruit bestaat Colheita?', '["Meerdere oogstjaren", "Eén oogstjaar", "Alleen witte druiven", "Alleen Ruby"]', 1, 'Correct: Eén oogstjaar'),
  ('portstijlen-verdiept', 'colheita-port', 3, 'Hoe lang moet Colheita minimaal op vat rijpen?', '["2 jaar", "5 jaar", "7 jaar", "10 jaar"]', 2, 'Correct: 7 jaar'),
  ('portstijlen-verdiept', 'colheita-port', 4, 'Waar rijpt Colheita vooral?', '["Fles", "Vat", "Tank", "Beton"]', 1, 'Correct: Vat'),
  ('portstijlen-verdiept', 'colheita-port', 5, 'Wat zie je vaak op het etiket?', '["Alleen botteljaar", "Oogstjaar en botteljaar", "Alleen alcoholpercentage", "Geen jaartal"]', 1, 'Correct: Oogstjaar en botteljaar'),
  ('portstijlen-verdiept', 'garrafeira-port', 1, 'Wat is uniek aan Garrafeira-rijping?', '["Alleen staaltank", "glasrijping in demijohns", "Geen fortificatie", "Alleen rosé"]', 1, 'Correct: glasrijping in demijohns'),
  ('portstijlen-verdiept', 'garrafeira-port', 2, 'Welke producent is iconisch voor Garrafeira?', '["Sandeman", "Niepoort", "Cockburn", "Fonseca"]', 1, 'Correct: Niepoort'),
  ('portstijlen-verdiept', 'garrafeira-port', 3, 'Garrafeira vs Vintage: wat klopt?', '["Beide alleen flesrijping", "Garrafeira gebruikt glas na hout", "Vintage is altijd zoeter", "Geen verschil"]', 1, 'Correct: Garrafeira gebruikt glas na hout'),
  ('portstijlen-verdiept', 'garrafeira-port', 4, 'Ideale serveertemperatuur?', '["8°C", "14–16°C", "22°C", "4°C"]', 1, 'Correct: 14–16°C'),
  ('portstijlen-verdiept', 'garrafeira-port', 5, 'Beste pairing?', '["Olijven", "Oude kaas en pure chocolade", "Sushi", "Spritz"]', 1, 'Correct: Oude kaas en pure chocolade'),
  ('service-port', 'serveertemperatuur', 1, 'Wat betekent Colheita?', '["Blend", "Oogst", "Vat", "Fles"]', 1, 'Correct: Oogst'),
  ('service-port', 'serveertemperatuur', 2, 'Waaruit bestaat Colheita?', '["Meerdere oogstjaren", "Eén oogstjaar", "Alleen witte druiven", "Alleen Ruby"]', 1, 'Correct: Eén oogstjaar'),
  ('service-port', 'serveertemperatuur', 3, 'Hoe lang moet Colheita minimaal op vat rijpen?', '["2 jaar", "5 jaar", "7 jaar", "10 jaar"]', 2, 'Correct: 7 jaar'),
  ('service-port', 'serveertemperatuur', 4, 'Waar rijpt Colheita vooral?', '["Fles", "Vat", "Tank", "Beton"]', 1, 'Correct: Vat'),
  ('service-port', 'serveertemperatuur', 5, 'Wat zie je vaak op het etiket?', '["Alleen botteljaar", "Oogstjaar en botteljaar", "Alleen alcoholpercentage", "Geen jaartal"]', 1, 'Correct: Oogstjaar en botteljaar'),
  ('service-port', 'glaswerk', 1, 'Wat maakt Garrafeira uniek?', '["Alleen witte druiven", "Rijping op glas", "Alleen jonge stijl", "Geen rijping"]', 1, 'Correct: Rijping op glas'),
  ('service-port', 'glaswerk', 2, 'Waar begint Garrafeira meestal mee?', '["Tawny", "Ruby-stijl uit één jaar", "White Port", "Rosé Port"]', 1, 'Correct: Ruby-stijl uit één jaar'),
  ('service-port', 'glaswerk', 3, 'Wat zijn demijohns?', '["Kleine houten vaten", "Grote glazen flessen", "Tanks", "Kurken"]', 1, 'Correct: Grote glazen flessen'),
  ('service-port', 'glaswerk', 4, 'Welke producent is beroemd om Garrafeira?', '["Graham's", "Taylor's", "Niepoort", "Fonseca"]', 2, 'Correct: Niepoort'),
  ('service-port', 'glaswerk', 5, 'Waarom is Garrafeira zeldzaam?', '["Simpele productie", "Lange unieke rijping", "Lage alcohol", "Alleen witte druiven"]', 1, 'Correct: Lange unieke rijping'),
  ('service-port', 'decanteren', 1, 'Welke stijl serveer je meestal het warmst?', '["White", "Tawny", "Vintage", "Rosé"]', 2, 'Correct: Vintage'),
  ('service-port', 'decanteren', 2, 'Welke stijl blijft meestal het kortst goed na openen?', '["Vintage", "Tawny", "Colheita", "White"]', 0, 'Correct: Vintage'),
  ('service-port', 'decanteren', 3, 'Waarom gebruik je een kleiner Portglas?', '["Minder wijn per glas", "Minder alcoholimpact en meer aroma-focus", "Goedkoper glaswerk", "Meer kleur zichtbaar"]', 1, 'Correct: Minder alcoholimpact en meer aroma-focus'),
  ('service-port', 'decanteren', 4, 'Welke stijl hoeft meestal NIET gedecanteerd te worden?', '["Vintage", "Crusted", "Tawny", "Ongefilterde LBV"]', 2, 'Correct: Tawny'),
  ('service-port', 'decanteren', 5, 'Waarom serveer je Tawny koeler dan Vintage?', '["Minder alcohol", "Oxidatieve stijl vraagt frisheid voor balans", "Meer suiker", "Minder kleur"]', 1, 'Correct: Oxidatieve stijl vraagt frisheid voor balans'),
  ('service-port', 'bewaren-na-openen', 1, 'Welke pairing is de klassieker?', '["Rosé + Brie", "Vintage + Stilton", "White + Cheddar", "Ruby + Mozzarella"]', 1, 'Correct: Vintage + Stilton'),
  ('service-port', 'bewaren-na-openen', 2, 'Waarom werkt zout goed met Port?', '["Minder smaak", "Versterkt zoetheidsperceptie", "Verlaagt alcohol", "Minder vet"]', 1, 'Correct: Versterkt zoetheidsperceptie'),
  ('service-port', 'bewaren-na-openen', 3, 'Wat past vaak goed bij Aged Tawny?', '["Jonge geitenkaas", "Oude Gouda", "Mozzarella", "Feta"]', 1, 'Correct: Oude Gouda'),
  ('service-port', 'bewaren-na-openen', 4, 'Waarom moet kaas op kamertemperatuur?', '["Mooier op het bord", "Meer aroma en textuur", "Minder zout", "Minder vet"]', 1, 'Correct: Meer aroma en textuur'),
  ('service-port', 'bewaren-na-openen', 5, 'Welke stijl is vaak toegankelijk bij blauwe kaas?', '["White", "LBV", "Rosé", "Colheita"]', 1, 'Correct: LBV'),
  ('service-port', 'wanneer-welke-port', 1, 'Wat is de gouden regel bij dessertpairing?', '["Dessert zoeter dan wijn", "Wijn even zoet of zoeter dan dessert", "Minder alcohol", "Meer zuur"]', 1, 'Correct: Wijn even zoet of zoeter dan dessert'),
  ('service-port', 'wanneer-welke-port', 2, 'Wat past klassiek bij Ruby?', '["Citroentaart", "Pure chocolade", "Appeltaart", "Sorbet"]', 1, 'Correct: Pure chocolade'),
  ('service-port', 'wanneer-welke-port', 3, 'Warme zomeravond, gast wil iets lichts vóór het eten. Meest logische Port?', '["Vintage", "White Port of Rosé", "Tawny 30 Years", "LBV ongefilterd"]', 1, 'Correct: White Port of Rosé'),
  ('service-port', 'wanneer-welke-port', 4, 'Welke stijl past vaak goed bij citroen?', '["White Port", "Vintage", "Crusted", "Colheita"]', 0, 'Correct: White Port'),
  ('service-port', 'wanneer-welke-port', 5, 'Waarom zijn mintdesserts lastig?', '["Te zout", "Verstoren zoetheidsbalans", "Te vet", "Te warm"]', 1, 'Correct: Verstoren zoetheidsbalans'),
  ('pairing-port', 'port-en-kaas', 1, 'Welke pairing is de klassieker?', '["Rosé + Brie", "Vintage + Stilton", "White + Cheddar", "Ruby + Mozzarella"]', 1, 'Correct: Vintage + Stilton'),
  ('pairing-port', 'port-en-kaas', 2, 'Waarom werkt zout goed met Port?', '["Minder smaak", "Versterkt zoetheidsperceptie", "Verlaagt alcohol", "Minder vet"]', 1, 'Correct: Versterkt zoetheidsperceptie'),
  ('pairing-port', 'port-en-kaas', 3, 'Wat past vaak goed bij Aged Tawny?', '["Jonge geitenkaas", "Oude Gouda", "Mozzarella", "Feta"]', 1, 'Correct: Oude Gouda'),
  ('pairing-port', 'port-en-kaas', 4, 'Waarom moet kaas op kamertemperatuur?', '["Mooier op het bord", "Meer aroma en textuur", "Minder zout", "Minder vet"]', 1, 'Correct: Meer aroma en textuur'),
  ('pairing-port', 'port-en-kaas', 5, 'Welke stijl is vaak toegankelijk bij blauwe kaas?', '["White", "LBV", "Rosé", "Colheita"]', 1, 'Correct: LBV'),
  ('pairing-port', 'port-en-chocolade', 1, 'Welke kleur hoort vaker bij Ruby?', '["Amber", "Robijnrood", "Oranje", "Geel"]', 1, 'Correct: Robijnrood'),
  ('pairing-port', 'port-en-chocolade', 2, 'Welke aroma''s passen bij Tawny?', '["Kers en braam", "Walnoot en karamel", "Citrus en appel", "Framboos"]', 1, 'Correct: Walnoot en karamel'),
  ('pairing-port', 'port-en-chocolade', 3, 'Welke stijl is oxidatiever?', '["Ruby", "Tawny", "Rosé", "White"]', 1, 'Correct: Tawny'),
  ('pairing-port', 'port-en-chocolade', 4, 'Waar begin je bij blindproeven?', '["Smaak", "Kleur", "Alcohol", "Etiket"]', 1, 'Correct: Kleur'),
  ('pairing-port', 'port-en-chocolade', 5, 'Wat is vaak krachtiger in structuur?', '["Tawny", "Ruby", "White", "Colheita"]', 1, 'Correct: Ruby'),
  ('pairing-port', 'port-en-notendesserts', 1, 'Welke Portstijl past het best bij notendesserts?', '["White Port", "Tawny", "Rosé Port", "Jonge Ruby"]', 1, 'Correct: Tawny'),
  ('pairing-port', 'port-en-notendesserts', 2, 'Waarom past Tawny sterk bij notendesserts?', '["Hoge tannine", "Oxidatieve aroma-spiegeling", "Lage alcohol", "Geen restsuiker"]', 1, 'Correct: Oxidatieve aroma-spiegeling'),
  ('pairing-port', 'port-en-notendesserts', 3, 'Waarom werkt Ruby hier minder goed?', '["Te weinig alcohol", "Te veel primair fruit, te weinig oxidatieve aansluiting", "Te veel zuur", "Te weinig zoetheid"]', 1, 'Correct: Te veel primair fruit, te weinig oxidatieve aansluiting'),
  ('pairing-port', 'port-en-notendesserts', 4, 'Welke pairing is een klassieker?', '["Ruby + citroentaart", "20 Years Tawny + pecantaart", "White + chocolade", "Vintage + sorbet"]', 1, 'Correct: 20 Years Tawny + pecantaart'),
  ('pairing-port', 'port-en-notendesserts', 5, 'Wat is het kernprincipe bij notendesserts?', '["Altijd de zoetste Port kiezen", "Spiegeling van aroma-families en textuur", "Altijd decanteren", "Zo hoog mogelijke serveertemperatuur"]', 1, 'Correct: Spiegeling van aroma-families en textuur'),
  ('pairing-port', 'port-en-vlees', 1, 'Welke Port past vaak bij wild?', '["White Port", "Vintage", "Rosé Port", "Tawny 40 Years"]', 1, 'Correct: Vintage'),
  ('pairing-port', 'port-en-vlees', 2, 'Waarom is Port minder breed inzetbaar bij rood vlees?', '["Minder kleur", "Restsuiker kan balans verstoren", "Minder alcohol", "Geen tannine"]', 1, 'Correct: Restsuiker kan balans verstoren'),
  ('pairing-port', 'port-en-vlees', 3, 'Welke stijl wordt vaak gebruikt in reducties?', '["Ruby of LBV", "White Port", "Garrafeira", "Tawny 40 Years"]', 0, 'Correct: Ruby of LBV'),
  ('pairing-port', 'port-en-vlees', 4, 'Waarom past Tawny zelden bij vlees?', '["Te veel tannine", "Te weinig grip voor eiwitrijke gerechten", "Te veel fruit", "Te hoge zuur"]', 1, 'Correct: Te weinig grip voor eiwitrijke gerechten'),
  ('pairing-port', 'port-en-vlees', 5, 'Wat is de beste professionele inzet van Port bij vlees?', '["Altijd als tafelwijn", "Sauscomponent of gerichte finale pairing", "Alleen bij vis", "Nooit in de keuken"]', 1, 'Correct: Sauscomponent of gerichte finale pairing'),
  ('pairing-port', 'port-in-gastronomie', 1, 'Welke stijl past het best bij een notige sausreductie?', '["Ruby", "Tawny", "White", "Rosé"]', 1, 'Correct: Tawny'),
  ('pairing-port', 'port-in-gastronomie', 2, 'Waarom werkt Port in de keuken?', '["Door hoge zuur", "Als smaakversterker en reductiebasis", "Alleen als dessert", "Geen alcohol"]', 1, 'Correct: Als smaakversterker en reductiebasis'),
  ('pairing-port', 'port-in-gastronomie', 3, 'White Port in sabayon geeft vooral:', '["Bitterheid", "Frisse aromatische lift", "Tannine", "Depot"]', 1, 'Correct: Frisse aromatische lift'),
  ('pairing-port', 'port-in-gastronomie', 4, 'Gastronomische Port vraagt eerst:', '["Prijs", "Functie in het gerecht", "Etiketkleur", "Jaartal"]', 1, 'Correct: Functie in het gerecht'),
  ('pairing-port', 'port-in-gastronomie', 5, 'Beste moment voor culinaire Port?', '["Alleen digestief", "Wanneer structuur het gerecht ondersteunt", "Alleen bij vis", "Nooit in keuken"]', 1, 'Correct: Wanneer structuur het gerecht ondersteunt'),
  ('examen-port', 'portkaart-lezen', 1, 'Wat lees je eerst op een Portkaart?', '["Prijs", "Stijlcategorie", "Flesgewicht", "Alcohol"]', 1, 'Correct: Stijlcategorie'),
  ('examen-port', 'portkaart-lezen', 2, 'Waarom groepeer je per stijl?', '["Voor marketing", "Voor inzetbaarheid en servicebeslissing", "Alfabetisch", "Op jaartal alleen"]', 1, 'Correct: Voor inzetbaarheid en servicebeslissing'),
  ('examen-port', 'portkaart-lezen', 3, 'Vintage op de kaart vraagt vooral:', '["Ijsbucket", "Decanteeradvies", "Tonic", "Lange koeling"]', 1, 'Correct: Decanteeradvies'),
  ('examen-port', 'portkaart-lezen', 4, 'Tawny op de kaart positioneer je vaak bij:', '["Aperitief", "Dessert en noten", "Salade", "Sushi"]', 1, 'Correct: Dessert en noten'),
  ('examen-port', 'portkaart-lezen', 5, 'Goede kaartnavigatie volgt:', '["prijs → stijl", "stijl → leeftijd → service → pairing", "alleen producent", "willekeur"]', 1, 'Correct: stijl → leeftijd → service → pairing'),
  ('examen-port', 'port-adviseren', 1, 'Eerste stap bij advies?', '["Duurste fles", "Moment en context van de gast", "Eigen favoriet", "Voorraad opruimen"]', 1, 'Correct: Moment en context van de gast'),
  ('examen-port', 'port-adviseren', 2, 'Gast wil rijk, zacht, niet te zwaar. Richting?', '["Jonge Vintage", "Tawny 20 Years", "White Dry", "Basic Ruby"]', 1, 'Correct: Tawny 20 Years'),
  ('examen-port', 'port-adviseren', 3, 'Goede vragen leiden tot:', '["Langere monologen", "Betere stijlmatch", "Minder verkoop", "Alleen prijsdiscussie"]', 1, 'Correct: Betere stijlmatch'),
  ('examen-port', 'port-adviseren', 4, 'Adviesvolgorde Way of Tasting:', '["stijl → prijs", "moment → gerecht → ervaring → stijl", "producent → jaartal", "random"]', 1, 'Correct: moment → gerecht → ervaring → stijl'),
  ('examen-port', 'port-adviseren', 5, 'Professioneel advies is:', '["Voorkeur pushen", "Context-gedreven", "Altijd Vintage", "Altijd goedkoopste optie"]', 1, 'Correct: Context-gedreven'),
  ('examen-port', 'port-bewaren-kelder', 1, 'Welke Port wordt vaak beter op fles?', '["Basic Ruby", "Vintage", "White aperitief", "Rosé"]', 1, 'Correct: Vintage'),
  ('examen-port', 'port-bewaren-kelder', 2, 'Kelderdenken vraagt vooral:', '["Alleen kleur", "Rijpingstraject en geduld", "Direct drinken", "Warm bewaren"]', 1, 'Correct: Rijpingstraject en geduld'),
  ('examen-port', 'port-bewaren-kelder', 3, 'Ongeopende Vintage bewaar je idealiter:', '["Staand warm", "Liggend, koel en donker", "In de keuken", "Open in koelkast"]', 1, 'Correct: Liggend, koel en donker'),
  ('examen-port', 'port-bewaren-kelder', 4, 'LBV vs Vintage bewaren:', '["Identiek", "Vintage heeft meer flespotentieel", "LBV altijd langer", "Geen verschil"]', 1, 'Correct: Vintage heeft meer flespotentieel'),
  ('examen-port', 'port-bewaren-kelder', 5, 'Kelder zonder geduld past bij:', '["Alleen Vintage kopen", "Stijlen kiezen die bij je horizon passen", "Alles direct openen", "Geen Port kopen"]', 1, 'Correct: Stijlen kiezen die bij je horizon passen')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
