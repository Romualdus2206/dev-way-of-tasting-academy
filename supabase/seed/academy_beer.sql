-- Bier track seed V2 (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 40 lessons · quizvragen per les
-- Bron: content/BIER_FINAL_CONTENT.md

delete from academy.tracks where slug = 'beer';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'beer',
  'Bier',
  'Leer bier van Fundament tot Master: productie, proeven, stijlen, service, pairing en examen.',
  3,
  now()
);

with t as (select id from academy.tracks where slug = 'beer')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-beer', 'Fundament', 1),
  ('explorer', 'productie-beer', 'Productie', 2),
  ('explorer', 'proeven-beer', 'Proeven', 3),
  ('specialist', 'klassieke-stijlen-beer', 'Klassieke stijlen', 4),
  ('specialist', 'belgische-stijlen-beer', 'Belgische stijlen', 5),
  ('specialist', 'moderne-stijlen-beer', 'Moderne stijlen', 6),
  ('master', 'service-beer', 'Service', 7),
  ('master', 'pairing-beer', 'Pairing & Gastronomie', 8),
  ('master', 'examen-beer', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'intro-beer'
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
    'wat-is-bier',
    'Wat is bier?',
    'Na deze les kun je uitleggen wat bier is, welke vier ingrediënten de basis vormen en waarom gisting het karakter van elke stijl bepaalt.
',
    'Bier is geen enkelvoudig product maar een gefermenteerd matrixsysteem waarin water, alcohol, opgeloste koolhydraten, hopbestanddelen, gistmetabolieten en koolzuur samen de proefervaring vormen. Daardoor beoordeel je bier niet op een los aroma, maar op de balans tussen geurintensiteit, bitterheid, zoetheid, zuurgraad en textuur.

Voor professionele proevers is bierdefinitie functioneel: je wilt kunnen onderscheiden wat grondstofgedreven is en wat procesgedreven. Mout levert vergistbare suikers en body (structuurgewicht), hop structureert bitterheid (hopimpact), gist maakt alcohol en aroma, en lagering stabiliseert het product zodat rijping als effect leesbaar wordt in glas en neus.

In servicecontext betekent dit dat je elk bier tegelijk technisch en gastgericht benadert. Blind geproefd zoek je eerst stijlmarkers en attenuatie-indruk, aan tafel vertaal je dat naar begrijpelijke taal zonder precisie te verliezen, zodat advies niet alleen correct is maar ook verkoopbaar en herhaalbaar.


## Food pairing

### Beste pairing

Gezouten pretzels, milde Goudse kaas en mosselen.

### Waarom dit werkt

Koolzuur lift vet van het palet, bitterheid snijdt door umami, en lichte zoetheid voorkomt dat de combinatie te hard eindigt.

### Vermijd

Zoete desserts of agressief zure sauzen bij een neutraal instapbier.

## Pro insight

Gasten die bier ''te bitter'' vinden, kennen vaak alleen massamarkt-lager. Vraag naar moment en gerecht vóór je stijl noemt — moutzoetheid en koolzuur openen verkoop zonder push.',
    '- fermentatie
- balans
- koolzuur
- mondgevoel
- afdronk
',
    'De oudste sporen van bierproductie zijn meer dan 7000 jaar oud.
',
    '- Bier is een gefermenteerd matrixsysteem van water, mout, hop en gist
- Gisting bepaalt alcohol, koolzuur en aroma
- Kleine procesverschillen produceren duizenden stijlen
- Proeven begint bij balans, niet bij etiket
',
    '### Opdracht

Pak een bierfles of blik en bekijk het etiket.

### Checklist

- Ik heb het alcoholpercentage gevonden
- Ik heb de bierstijl gevonden
- Ik heb de ingrediënten bekeken


### Reflectievraag

Je moet een gast snel adviseren: kies je eerst voor uitleg over stijl of voor een vraag naar gewenst mondgevoel, en waarom levert die keuze een betrouwbaarder resultaat op?',
    8,
    1
  ),
  (
    'vier-basisingredienten',
    'De vier basisingrediënten',
    'Na deze les kun je elk basisingrediënt koppelen aan zijn rol in smaak, structuur en productie — en dat in één heldere uitleg geven.
',
    'De vier basisingrediënten — water, mout, hop en gist — vormen een gekoppeld systeem waarin elke keuze direct doorwerkt in smaak en mondgevoel. Water vormt het grootste deel van bier, maar bepaalt veel meer dan volume alleen: mineraalstructuur, mondgevoel en zelfs historische stijlontwikkeling in regio''s als Pilsen of Burton-on-Trent.

Mout levert vergistbare suikers en bepaalt body (structuurgewicht) en roast; hop structureert bitterheid (hopimpact) en aroma; gist zet suikers om in alcohol, esters en fenolen. Technisch is receptuur verhouding en timing — dezelfde hopgift gedraagt zich anders bij hogere beginstamwort, terwijl giststam en temperatuur attenuatie en aromatische expressie sturen.

Voor blindproeven en service lees je daarom interacties: lage body met hoge bitterheid wijst op hop-vergistingsbalans; volle body met milde bitterheid op moutopbouw. Dat causale lezen maakt advies scherper dan stijlnaam alleen.


## Food pairing

### Beste pairing

Vers brood met boter, jonge kaas en lichte vis.

### Waarom dit werkt

Zoetheid uit mout vangt zout op, bitterheid structureert vet, en koolzuur houdt de slok schoon tussen happen.

### Vermijd

Zware BBQ-sauzen die een specifiek hopprofiel vereisen.

## Pro insight

Verkoop geen merk maar uitkomst: koppel elk ingrediënt aan een herkenbare smaakverwachting (frisheid, body, bitterheid). Dat verlaagt retour door verkeerde verwachting.',
    '- waterchemie
- moutstort
- hopgift
- giststam
- extract
',
    'De waterkwaliteit bepaalt historisch vaak welke bierstijl in een regio ontstond.
',
    '- Water bepaalt mineraalstructuur en mondgevoel
- Mout levert suikers, kleur en roast
- Hop structureert bitterheid en aroma
- Gist maakt alcohol en esters — interactie is doorslaggevend
',
    '### Opdracht

Bekijk drie verschillende bieretiketten.

### Checklist

- Ik heb ingrediënten vergeleken
- Ik heb verschillen gezien
- Ik herken de basiscomponenten


### Reflectievraag

Als twee bieren dezelfde IBU hebben maar anders smaken, welke twee basisingrediënten onderzoek je eerst en welke causale hypothese toets je daarna?',
    8,
    2
  ),
  (
    'alcoholische-gisting',
    'Alcoholische gisting uitgelegd',
    'Na deze les kun je uitleggen hoe alcoholische gisting werkt en welke factoren alcoholgehalte, koolzuur en smaakprofiel sturen.
',
    'Alcoholische gisting is de metabole omzetting waarbij gist vergistbare suikers omzet naar ethanol, koolzuur en warmte, met talrijke nevenproducten die geur en smaak dragen. Dat proces is geen zwart-wit aan/uit-moment maar een dynamische fase waarin temperatuur, gistvitaliteit en zuurstofbeheer de uitkomst direct sturen.

Attenuatie is hier de sleutelvariabele: ze bepaalt hoeveel restsuiker overblijft en dus hoe droog of rond het bier aanvoelt. Hogere attenuatie kan een bier strakker en slanker maken, terwijl lagere attenuatie zoetindruk en body ondersteunt. Daardoor verandert niet alleen smaakbalans maar ook hoe bitterheid wordt waargenomen.

In praktijk en blindproef-logica kijk je daarom naar vergistingssporen: droge finale met schone afdronk kan op hoge attenuatie wijzen, terwijl warme esters en restzoet vaak op een ander gistgedrag duiden. Wie gisting begrijpt, kan fouten in service sneller herkennen, bijvoorbeeld een bier dat te warm geserveerd wordt en daardoor alcoholscherpte overdrijft.


## Food pairing

### Beste pairing

Pizza margherita, pasta met tomatensaus en gegrilde groenten.

### Waarom dit werkt

Bij hogere attenuatie en droogte werkt koolzuur als reiniger, terwijl umami in het gerecht door beperkte zoetheid scherper leesbaar blijft.

### Vermijd

Delicate sashimi zonder zout of structuurcontrast.

## Pro insight

Servicefout: vergistingsaroma te koud serveren maskeert gistsignatuur en doet het product generiek lijken — temperatuur is hier kwaliteitsbewijs, geen detail.',
    '- attenuatie
- ethanol
- koolzuurproductie
- vergistingswarmte
- restsuiker
',
    'Veel fruitige aroma’s in bier komen direct uit de gist.
',
    '- Gisting zet suikers om in alcohol en CO₂
- Attenuatie stuurt droogheid en body
- Temperatuur beïnvloedt gistexpressie direct
- Servicefouten maskeeren vaak vergistingskarakter
',
    '### Opdracht

Vergelijk twee bieren en let op fruitigheid.

### Checklist

- Ik heb aroma’s vergeleken
- Ik heb fruitigheid herkend
- Ik heb verschillen benoemd


### Reflectievraag

Je proeft onverwachte zoetrest in een ogenschijnlijk droog bier: kies je als primaire verklaring voor lagere attenuatie of voor serveertemperatuur, en welke observatie beslist?',
    8,
    3
  ),
  (
    'ondergisting-vs-bovengisting',
    'Ondergisting vs bovengisting',
    'Na deze les kun je ondergisting en bovengisting onderscheiden op temperatuur, giststam en typisch smaakprofiel.
',
    'Het onderscheid tussen ondergisting en bovengisting is fundamenteel omdat het tegelijk proces, aromaprofiel en servicelogica bepaalt. Ondergisting werkt typisch koeler en levert vaak een schoner profiel waarin mout, hopbitterheid en koolzuurstructuur duidelijk leesbaar zijn; bovengisting opereert warmer en toont sneller esters en complexere fermentatielagen.

Dit verschil is geen waardeoordeel maar een interpretatiekader voor balans. Bij ondergisting valt elke afwijking in bitterheidsopbouw of zwaveltoon sneller op, terwijl bij bovengisting de uitdaging ligt in het onderscheiden van gewenste fruitigheid versus onevenwichtige fermentatie-uitdrukking. Temperatuurimpact is daarom stijlafhankelijk en nooit generiek.

Voor service betekent dit dat je glaswerk en schenkmoment aanpast aan aromadoel. Te koud serveren kan bovengisting aromatisch afknijpen; te warm serveren kan ondergisting onnodig hard maken in bitterheid. Professioneel advies koppelt dus vergistingstype direct aan serveertemperatuur en proefvolgorde.


## Food pairing

### Beste pairing

Duitse worst, kipsaté en lichte salade met vinaigrette.

### Waarom dit werkt

ondergisting ondersteunt zout en vet met strakke bitterheid, bovengisting kan via esters en fenolen aromatische bruggen leggen.

### Vermijd

Zware stoof zonder roast-contrast bij een te lichte ale.

## Pro insight

Ondergisting en bovengisting vragen verschillende serveervensters; één koude standaard maakt je kaart sensorisch vlak en ondermijnt blindproef-training.',
    '- ondergisting
- bovengisting
- temperatuurregime
- esterprofiel
- zuiverheid
',
    'Meer dan 80% van al het bier wereldwijd is ondergistend.
',
    '- ondergisting: koel, strak, schoon profiel
- bovengisting: warmer, esterrijker, expressiever
- Temperatuur en glaswerk zijn stijlafhankelijk
- Blindproeven start bij vergistingstype, niet kleur
',
    '### Opdracht

Vergelijk een pils met een blond bier.

### Checklist

- Ik heb geur vergeleken
- Ik heb smaak vergeleken
- Ik herken verschillen


### Reflectievraag

In een blindproef twijfel je tussen ondergisting en bovengisting: welke ene indicator krijgt prioriteit, en welk risico accepteer je met die keuze?',
    8,
    4
  ),
  (
    'biercategorieen',
    'Belangrijkste biercategorieën',
    'Na deze les kun je de belangrijkste biercategorieën herkennen en koppelen aan smaak, productie en serveermoment.
',
    'Biercategorieën zijn analytische hulpmiddelen om verwachting, techniek en communicatie te structureren, niet om creativiteit op slot te zetten. Een categorie vat doorgaans vergistingstype, alcoholbereik, bitterheidsniveau, kleur, aroma-intensiteit en mondgevoel samen zodat proevers dezelfde referentietaal gebruiken.

Op seniorniveau lees je categorieën als probabiliteit, niet als absolute grens. Een bier kan binnen een stijl vallen en toch afwijken door hopkeuze, waterprofiel of lagering. Daarom combineer je categoriekennis met zintuiglijk bewijs: wat staat op etiket is hypothese, wat in glas zit is data.

In verkooplogica helpt categoriebeheer om gastverwachting te sturen zonder te simplificeren. Je vertaalt technische assen - droog versus rond, bitter versus zacht, esterrijk versus clean - naar keuzevragen die leiden tot hogere tevredenheid en minder retour door mismatch.


## Food pairing

### Beste pairing

Pils met bitterballen, Weizen met Weißwurst, Stout met chocoladetaart.

### Waarom dit werkt

Een categorie met hogere bitterheid dempt vet, terwijl een categorie met meer zoetheid en esters beter omgaat met mild zuur.

### Vermijd

Eén categorie forceren op alle gerechten.

## Pro insight

Classificeer blind eerst op structuur en vergistingskarakter, pas daarna op stijlnaam — dat beperkt etiketvooringenomenheid en verhoogt nauwkeurigheid.',
    '- stijldefinitie
- classificatie
- verwachtingsmanagement
- typiciteit
- variatie
',
    'IPA is wereldwijd één van de snelst groeiende biercategorieën.
',
    '- Categorieën structureren verwachting en communicatie
- Lager, ale, tarwe, donker en IPA als ankerpunten
- Etiket is hypothese; glas is data
- Verkoop werkt op structuur-assen, niet op merk alleen
',
    '### Opdracht

Maak een lijst van vijf bieren die je kent.

### Checklist

- Ik heb vijf bieren genoteerd
- Ik heb stijlen bepaald
- Ik heb categorieën gekoppeld


### Reflectievraag

Een gast vraagt om ''iets toegankelijks'': kies je een categorie op alcoholniveau of op bitterheids- en body-as, en waarom is dat commercieel sterker?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'productie-beer'
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
    'mouten-uitgelegd',
    'Mouten uitgelegd',
    'Na deze les kun je uitleggen wat mouten doet met graan en hoe moutkleur en moutprofiel het bier bepalen.
',
    'Mouten vormen het structurele hart van bier omdat ze vergistbare suikers, kleurstoffen, stikstofverbindingen en smaakprecursoren aanleveren. Basismouten leveren vooral enzymkracht en extract, terwijl speciale mouten body, karameltonen of roast toevoegen en daarmee de finale balans diepgaand wijzigen.

De moutstort bepaalt niet alleen kleur maar ook fermentatiegedrag en mondgevoel. Meer kristalmout verhoogt doorgaans restzoetindruk en viscositeit, terwijl hoge roast-fractie bitterheidsperceptie kan aanscherpen zonder extra hop. Daardoor kan dezelfde IBU analytisch gelijk zijn maar sensorisch heel anders landen.

Voor blindproeven is moutanalyse essentieel: broodkorst, biscuit, karamel of cacao-aroma zijn vaak sleutelmarkers voor stijlbepaling. In pairing en service vertaal je dat naar textuurtaal: body (structuurgewicht) en roast-intensiteit sturen welke gerechten het bier kan dragen.


## Food pairing

### Beste pairing

Geroosterde kip, notenbrood en oude kaas.

### Waarom dit werkt

Roast en zoetheid spiegelen karamellisatie, bitterheid voorkomt plakkerigheid, en umami uit geroosterde tonen verdiept de match.

### Vermijd

Te lichte salades zonder vet of umami.

## Pro insight

Pairing start bij moutintensiteit en roast, niet bij kleur; hopniveau is pas de tweede beslisstap bij geroosterde gerechten.',
    '- enzymkracht
- kleurvorming
- karamelisatie
- roast
- dextrine
',
    'Bijna alle bierkleur komt uit mout.
',
    '- Mout bepaalt kleur, zoetheid en fermentatiegedrag
- Kristalmout verhoogt body; roast verhoogt bitterheidsperceptie
- Blind: brood-, karamel- en cacao-tonen wijzen op moutstort
- Pairing volgt roast-intensiteit en structuurgewicht
',
    '### Opdracht

Bekijk drie verschillende bieren en vergelijk kleur.

### Checklist

- Ik heb lichte bieren bekeken
- Ik heb donkere bieren bekeken
- Ik heb kleurverschillen herkend


### Reflectievraag

Je detecteert roast en karamel in hetzelfde bier: koppel je het eerst aan moutstort of aan lageringseffect, en welke sensorische data moet je dan hebben?',
    8,
    1
  ),
  (
    'maischen',
    'Maischen',
    'Na deze les kun je het maischproces beschrijven en uitleggen hoe suikers vrijkomen voor de gisting.
',
    'Maischen is de enzymatische fase waarin zetmeel uit mout wordt omgezet in vergistbare en onvergistbare suikers, gestuurd door temperatuur, tijd en pH. Het proces bepaalt in hoge mate de vergistbaarheid van het wort en vormt daarmee de basis voor attenuatie en restzoet.

Een lager temperatuurvenster bevordert doorgaans beta-amylase-activiteit en levert meer vergistbare suikers, wat een drogere finale mogelijk maakt. Hogere rusten ondersteunen alfa-amylase en dextrinevorming, waardoor body toeneemt. Het is dus een precisie-instrument voor mondgevoel, niet alleen een voorbereidende stap.

In proefsituaties kun je maisschema-effecten vaak indirect herkennen via textuur en uitvergistingsgraad. Servicefouten ontstaan wanneer deze techniek genegeerd wordt: een bier met hoge dextrinefractie te koud schenken drukt aroma en maakt het log, terwijl een droger bier warm juist te scherp kan uitkomen.


## Food pairing

### Beste pairing

Stoofvlees, aardappelpuree en paddenstoelentoast.

### Waarom dit werkt

Meer body vraagt vaak om vet en zout als tegengewicht, terwijl koolzuur en bitterheid de textuur in balans houden.

### Vermijd

Rauwe citrusgerechten die alleen zuur zoeken.

## Pro insight

Een bier met hoge dextrinefractie in een te smal, ijskoud glas wordt plomp en verliest textuur — glaswerk en temperatuur zijn hier één beslissing.',
    '- maisschema
- beta-amylase
- alfa-amylase
- vergistbaarheid
- pH
',
    'Kleine temperatuurverschillen kunnen grote smaakverschillen veroorzaken.
',
    '- Maischen bepaalt vergistbaarheid en attenuatie
- Beta-amylase: meer vergistbare suikers, drogere finale
- Alfa-amylase: meer dextrinen, voller mondgevoel
- Maischschema lees je terug in textuur en afdronk
',
    '### Opdracht

Zoek op hoe een brouwerij maischt.

### Checklist

- Ik heb het proces bekeken
- Ik begrijp de rol van temperatuur
- Ik weet wat wort is


### Reflectievraag

Bij twee identieke recepten met ander maisschema: welke uitkomst verwacht je op body (structuurgewicht), en hoe vertaal je dat naar serveertemperatuur?',
    8,
    2
  ),
  (
    'hop-en-bitterheid',
    'Hop en bitterheid',
    'Na deze les kun je hop koppelen aan bitterheid, aroma en balans — en IBU in context plaatsen.
',
    'Hop levert bitterheid, aroma en stabiliserende polyfenolstructuren, maar de sensorische uitkomst hangt af van timing en matrix. Vroege giften bouwen vooral bitterheid op, late giften en dryhop versterken vluchtige aromacomponenten. Dezelfde hopsoort kan dus uiteenlopende resultaten geven.

Bitterheid is meer dan IBU: perceptie wordt mede bepaald door restzoet, koolzuurdruk, alcohol en waterprofiel. Een bier met hoge attenuatie kan dezelfde analytische bitterheid harder tonen dan een zoeter bier, omdat minder restsuiker de hopimpact minder afdempt. Daarom proef je bitterheid altijd relationeel.

In blindproef-logica zoek je naar bitterheidskwaliteit: kort en schoon, lang en harsig, of scherp en ruw. Voor service en verkoop helpt dat onderscheid direct bij foodpairing en gastadvies, omdat niet elke bittere indruk hetzelfde gerecht vraagt.


## Food pairing

### Beste pairing

IPA bij spicy taco''s, Pils bij fish and chips, Blond bij kip met kruiden.

### Waarom dit werkt

Hopgedreven bitterheid snijdt vet, koolzuur reset het palet, en esters kunnen kruidige of citrusachtige componenten verbinden.

### Vermijd

Subtiele witvis zonder zout of vet.

## Pro insight

Leg het verschil uit tussen analytische IBU en ervaren bitterheid; gasten vertrouwen advies sneller wanneer je perceptie relationeel uitlegt.',
    '- bitterheid
- iso-alfazuren
- hopimpact
- dryhop
- perceptie
',
    'IPA’s bevatten vaak veel meer hop dan pils.
',
    '- Hop levert bitterheid, aroma en stabiliteit
- IBU meet analytisch; perceptie is relationeel
- Dryhop versterkt aroma zonder IBU-lineair te stijgen
- Bitterheid proef je altijd in context van moutzoetheid
',
    '### Opdracht

Vergelijk een pils met een IPA.

### Checklist

- Ik heb bitterheid vergeleken
- Ik heb aroma vergeleken
- Ik herken hopinvloed


### Reflectievraag

Een bier toont harde bitterheid met beperkte aromahop: kies je waterprofiel of attenuatie als eerste oorzaak, en welke proefnoot moet je zien om gelijk te krijgen?',
    8,
    3
  ),
  (
    'gist-en-aroma',
    'Gist en aromaontwikkeling',
    'Na deze les kun je uitleggen hoe gist smaak en aroma vormt en waarom giststam en temperatuur doorslaggevend zijn.
',
    'Gist is de primaire aromamotor van bier: naast alcohol en koolzuur produceert gist esters, hogere alcoholen, zwavelverbindingen en andere metabolieten die stijlidentiteit bepalen. Keuze van stam, pitch-rate en vergistingsregime bepaalt of fruitigheid, kruidigheid of neutraliteit dominant wordt.

Fermentatiebeheer vereist controle op zuurstof en temperatuur om gewenste expressie te maximaliseren en off-flavors te beperken. Te weinig vitale gist of stress tijdens vergisting kan ongewenste tonen geven die in blindproef ten onrechte als stijlkenmerk worden gelezen. Professionele beoordeling vraagt daarom proceskennis naast neuservaring.

Temperatuurimpact in service is hier groot: esters openen bij oplopende temperatuur sneller dan hoparoma in sommige stijlen, waardoor het profiel verschuift in glas. Correct serveren betekent dus kiezen voor een venster waarin gistaroma leesbaar is zonder balansverlies in alcohol of bitterheid.


## Food pairing

### Beste pairing

Weizen met Hefezopf, Saison met geitenkaas, Dubbel met stoof.

### Waarom dit werkt

Esters sluiten aan op fruitige sauzen, fenolen kunnen specerijen oppakken, en koolzuur voorkomt aromatische oververzadiging.

### Vermijd

Gerechten waar gistfouten dominant worden (te zoet dessert).

## Pro insight

Esterrijke bieren vragen iets warmer service dan hopgedreven stijlen; anders wint koolzuurprikkel en verdwijnt gistkarakter.',
    '- esters
- fenolen
- pitch-rate
- gistvitaliteit
- fermentatieprofiel
',
    'Bananenaroma in Weizen komt vooral van gist.
',
    '- Gist is de primaire aromamotor
- Esters en fenolen zijn stijlmarkers
- Pitch-rate en temperatuur sturen expressie
- Te koud serveren dempt gistkarakter onnodig
',
    '### Opdracht

Proef een Weizen en een Pils.

### Checklist

- Ik heb fruitigheid herkend
- Ik heb verschillen benoemd
- Ik herken gistinvloed


### Reflectievraag

Je ruikt fruitigheid in een blond: label je dit direct als esters of check je eerst hoparoma, en welke fout maak je als je te vroeg concludeert?',
    8,
    4
  ),
  (
    'lagering-en-rijping',
    'Lagering & rijping',
    'Na deze les kun je uitleggen waarom lagering en rijping smaak stabiliseren en wanneer dat cruciaal is voor kwaliteit.
',
    'Lagering is het proces van gecontroleerde rust na hoofdvergisting, bedoeld om bier te stabiliseren, smaken te harmoniseren en ongewenste nevenproducten af te bouwen. Rijping is het effect dat daaruit volgt: een integraler smaakbeeld, helderder structuur en vaak een rustiger aromatische presentatie.

In technische zin beïnvloedt lagering helderheid, koolzuurintegratie en smaakafronding, maar de optimale duur is stijlafhankelijk. Te korte lagering laat ruwe randen staan; te lange opslag onder onjuiste condities kan frisheid reduceren. Daarom is tijd alleen geen kwaliteitsgarantie.

Voor blindproeven lees je rijping als samenhang: hoe coherent sluiten bitterheid, moutzoet en koolzuur op elkaar aan. In servicecontext helpt dit om voorraadrotatie en serveermoment te bepalen, zodat de gast bier krijgt in zijn sensorisch sterkste fase.


## Food pairing

### Beste pairing

Gerijpte cheddar, braadkip en notentaart.

### Waarom dit werkt

Rijping maakt roast en zoetheid ronder, terwijl koolzuur en bitterheid zorgen dat vetrijke gerechten niet zwaar blijven hangen.

### Vermijd

Zeer delicate gerechten die jeugdig, knisperend bier vereisen.

## Pro insight

Bij oudere flessen eerst integratie en oxidatieve richting beoordelen — lagering is proces, rijping is het effect dat je in glas leest.',
    '- lagering
- rijping
- stabilisatie
- integratie
- helderheid
',
    'Het woord “lager” komt van het Duitse “lagern” — bewaren.
',
    '- Lagering stabiliseert; rijping integreert smaken
- Tijd alleen is geen kwaliteitsgarantie
- Frisheid versus complexiteit vraagt bewuste keuze
- Voorraadrotatie is onderdeel van vakmanschap
',
    '### Opdracht

Zoek een bier op dat gerijpt is.

### Checklist

- Ik heb de rijpingstijd gevonden
- Ik heb de stijl bekeken
- Ik begrijp waarom het gerijpt werd


### Reflectievraag

Twee flessen van hetzelfde bier verschillen in rondheid: kies je lageringsduur of oxidatie als hoofdverklaring, en welke aanwijzing maakt je keuze hard?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'proeven-beer'
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
    'hoe-proef-je-bier',
    'Hoe proef je bier?',
    'Na deze les kun je een gestructureerde bierproef uitvoeren en objectief notities maken van uiterlijk tot afdronk.
',
    'Professioneel bier proeven begint met een vaste volgorde: visueel, olfactief, gustatief en retronasaal, gevolgd door structurele synthese. Je beoordeelt niet enkel intensiteit maar ook kwaliteit, volgorde van indrukken en persistentie in de afdronk.

Mondgevoel is daarin een volwaardige as naast aroma en smaak. Koolzuurprikkel, viscositeit, alcoholwarmte en samentrekkende bitterheid vormen samen het tactiele profiel dat vaak de stijlherkenning versnelt. Daarom noteer je zowel wat je proeft als hoe het zich fysiek gedraagt op de tong.

Blindproef-logica vraagt dat je hypothesen stap voor stap aanscherpt: eerst vergistingstype, dan mout-hop-as, daarna mogelijke stijl. Zo voorkom je dat etiketkennis of voorkeur je oordeel kleurt en kun je serviceadvies op reproduceerbare observatie baseren.


## Food pairing

### Beste pairing

Het bier dat je proeft, met een neutraal crackersbord.

### Waarom dit werkt

Neutraal zout activeert het palet zonder dominante smaken; koolzuur en lichte bitterheid houden observatie schoon zodat mondgevoel en afdronk objectief leesbaar blijven.

### Vermijd

Sterk gekruide snacks tijdens een structuurproef.

## Pro insight

Train personeel om vóór conclusie drie observaties te noteren; dat verlaagt retour door verkeerd advies en verhoogt blindproef-nauwkeurigheid in service.',
    '- proefvolgorde
- retronasaal
- mondgevoel
- structuuranalyse
- hypothesevorming
',
    'Veel smaakbeleving begint al vóór de eerste slok.
',
    '- Proefvolgorde: uiterlijk → neus → mond → afdronk
- mondgevoel is een volwaardige analyse-as
- Hypotheses vóór conclusies — altijd
- Blindproeven draait om reproduceerbare observatie
',
    '### Opdracht

Pak een bier en proef het volgens de vier stappen.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb geëvalueerd


### Reflectievraag

Onder tijdsdruk in blindproef: begin je met aromadetail of met structuurdiagnose, en welke volgorde minimaliseert misclassificatie?',
    8,
    1
  ),
  (
    'schuim-analyseren',
    'Schuim analyseren',
    'Na deze les kun je schuim analyseren op stabiliteit, textuur en kwaliteit als signaal van brouwtechniek.
',
    'Schuim is een kwaliteitsindicator omdat het informatie geeft over eiwitstructuur, koolzuurbeheer, glasreinheid en serveertechniek. Standtijd, belstructuur en aanhechting aan het glas vertellen of het bier fysisch stabiel is en correct behandeld werd.

Technisch ontstaat schuimstabiliteit uit interacties tussen moutproteinen, iso-alfazuren en koolzuurontsnapping. Vetresidu in glas of verkeerd spoelmiddel kan deze balans direct breken, waardoor schijnbaar goed bier sensorisch zwakker overkomt. Schuim lezen is dus ook service-audit.

In gastpsychologie werkt schuim als eerste kwaliteitssignaal: een verzorgd kraagje verhoogt verwachtingswaarde nog voor de eerste slok. Professionele service gebruikt dit bewust, maar zonder cosmetische overdrijving die drinkbaarheid of temperatuurcontrole schaadt.


## Food pairing

### Beste pairing

Frituur, lichte bitterballen en zoute noten.

### Waarom dit werkt

Stabiel schuim helpt aromadragers van esters en fenolen, terwijl koolzuur en bitterheid vetbalans ondersteunen.

### Vermijd

Roomachtige sauzen die schuim direct laten inzakken.

## Pro insight

Gecontroleerd inschenken met stabiel schuimkraagje verhoogt kwaliteitsverwachting vóór de eerste slok — gastpsychologie in pure vorm.',
    '- schuimstabiliteit
- eiwitmatrix
- koolzuurdruk
- glasreinheid
- retentie
',
    'Vet in een glas kan schuim direct afbreken.
',
    '- Schuim signaleert eiwit, koolzuur en glashygiëne
- Instortend schuim wijst vaak op service, niet op bier
- Schuimkraag beschermt aroma en carbonatie
- Eerste visuele cue beïnvloedt gastverwachting
',
    '### Opdracht

Schenk twee verschillende bieren.

### Checklist

- Ik heb schuimhoogte vergeleken
- Ik heb stabiliteit bekeken
- Ik heb structuur beoordeeld


### Reflectievraag

Schuim valt snel weg bij correcte carbonatie: geef je glasreinheid of receptuur prioriteit, en welke directe test voer je eerst uit?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma’s herkennen',
    'Na deze les kun je bieraroma''s herkennen in families (mout, hop, gist, esters) en benoemen zonder te gissen.
',
    'Aromaherkenning in bier vraagt een getraind vocabulaire dat bronnen koppelt aan proces: mout (brood, karamel, roast), hop (citrus, kruid, hars), gist (esters, fenolen) en rijpingseffecten. Zonder bronkoppeling blijft beschrijven vaag en diagnostisch zwak.

Methodisch werk je van breed naar specifiek: eerst categorie (fruitig, kruidig, geroosterd), dan intensiteit, daarna kwaliteit en plausibiliteit binnen stijl. Deze hiërarchie voorkomt dat een opvallende noot het totaalbeeld domineert en maakt vergelijkende proeverijen consistenter.

Voor service en pairing is aroma geen doel op zichzelf maar routekaart voor verwachting. Wie esters en fenolen correct duidt, kan beter voorspellen welke gerechten resoneren en welke botsen, nog voordat de gast de eerste combinatie proeft.


## Food pairing

### Beste pairing

Gerecht dat past bij het aroma-profiel van je proefbier.

### Waarom dit werkt

Aromatisch pairt werkt wanneer esters of fenolen bruggen bouwen en bitterheid plus zout voor structureel tegengewicht zorgen.

### Vermijd

Parfum of rokerige gerechten die neusproef verstoren.

## Pro insight

Noem per aroma een bronhypothese (mout, hop, gist, rijping); zonder bron blijft beschrijving diagnostisch zwak.',
    '- aromawiel
- bronherkenning
- intensiteit
- typiciteit
- aromapersistentie
',
    'Je neus kan duizenden geurstoffen onderscheiden.
',
    '- Aroma''s lees je in families: mout, hop, gist, rijping
- Breed → specifiek → kwaliteit → plausibiliteit
- Bronhypothese maakt beschrijving diagnostisch
- Pairing volgt aroma-families, niet merkassociatie
',
    '### Opdracht

Ruik aan drie verschillende bierstijlen.

### Checklist

- Ik heb moutaroma’s gezocht
- Ik heb hoparoma’s gezocht
- Ik heb gistaroma’s gezocht


### Reflectievraag

Je detecteert kruidigheid en citrus: kies je fenolen of esters als primaire drager, en welke tweede observatie is doorslaggevend?',
    8,
    3
  ),
  (
    'structuur-en-mondgevoel',
    'Structuur en mondgevoel',
    'Na deze les kun je structuur en mondgevoel beoordelen op body, koolzuur, bitterheid en balans.
',
    'Structuur en mondgevoel beschrijven de fysieke architectuur van bier: van aanzet tot midpalate en finale, inclusief koolzuurtextuur, viscositeit, alcoholwarmte en samentrekking door bitterheid of roast. Dit bepaalt vaak sterker dan aroma of een bier als elegant of zwaar wordt ervaren.

Body (structuurgewicht) ontstaat uit een combinatie van restextract, glycerol, alcohol en koolzuurdruk. Hoge attenuatie kan body verlagen en drinkbaarheid verhogen, terwijl dextrinerijk wort volume geeft maar ook sneller vermoeit als bitterheid of zuur onvoldoende tegenspel biedt.

In professionele service vertaal je structuur direct naar glaswerk en temperatuur. Een smal glas kan koolzuur scherp laten pieken, een wijder glas kan textuur ronder tonen. Door dit bewust te kiezen vermijd je servicefouten waarbij het bier stijlvreemd overkomt.


## Food pairing

### Beste pairing

Ribeye, romige pasta en gekarameliseerde ui.

### Waarom dit werkt

Vol mondgevoel vraagt zuur of bitterheid als snijpunt, terwijl koolzuur en zout de slok dynamisch houden.

### Vermijd

Te lichte gerechten bij een zwaar, zoet bier.

## Pro insight

Ronde kelk voor textuurfocus, slank glas voor frisheid — stem af op body (structuurgewicht), niet op esthetiek.',
    '- body
- viscositeit
- carbonatie
- alcoholwarmte
- textuur
',
    'Body wordt vaak beïnvloed door maischschema en restsuiker.
',
    '- Structuur = body, koolzuur, alcoholwarmte, bitterheid
- Body en alcohol zijn los van elkaar te beoordelen
- Textuur bepaalt elegantie versus zwaarte
- Glas en temperatuur sturen tactiele perceptie
',
    '### Opdracht

Vergelijk een pils met een stout.

### Checklist

- Ik heb body vergeleken
- Ik heb koolzuur vergeleken
- Ik heb warmte beoordeeld


### Reflectievraag

Een bier lijkt vol maar eindigt droog: beoordeel je dit als hoge body met hoge attenuatie of als temperatuurillusie, en hoe bewijs je het?',
    8,
    4
  ),
  (
    'mini-toets-bier',
    'Mini-toets bier',
    'Na deze les toets je geïntegreerde kennis uit fundament, productie en proeven en herken je waar je nog scherpte nodig hebt.
',
    'Een mini-toets op seniorniveau meet geen feitjes maar besliskwaliteit: kun je waarneming vertalen naar oorzaak, en oorzaak naar advies. De kern is causale redenering over ingrediënt, proces en service in plaats van losse definities.

Goede toetsvragen dwingen tot prioriteren: welke observatie is diagnostisch het sterkst, welke afwijking is echt stijlbreuk, welke serveeractie corrigeert het meeste met minste risico. Dat maakt evaluatie direct relevant voor vloerwerk en blindproef-prestaties.

Wie deze denkwijze beheerst, werkt consistenter in teamcontext. Je feedback aan collega''s wordt specifieker, discussies over smaak worden minder subjectief, en verkoopadviezen sluiten beter aan op wat technisch in het glas gebeurt.


## Food pairing

### Beste pairing

Drie gangen: salade, stoof, kaas — elk met passend bier.

### Waarom dit werkt

Integratiepairing test koolzuur tegen vet, zoetheid tegen zout en bitterheid tegen umami over meerdere gangen — dezelfde assen als in je mini-toetsbeslissingen.

### Vermijd

Alleen dessertbier door het hele menu.

## Pro insight

Noteer per mini-toets één zwakke schakel per medewerker; dat wordt je teamtrainingsplan en voorkomt generiek ''bieradvies'' aan tafel.',
    '- beslislogica
- causaliteit
- foutdetectie
- kalibratie
- feedback
',
    '',
    '- Integratie van fundament, productie en proeven
- Besliskwaliteit zwaarder dan feitjeskennis
- Zwakke schakel = trainingsplan voor Specialist
- Causale redenering is het examenproduct
',
    '### Opdracht

Proef één bier volledig en schrijf een korte analyse.

### Checklist

- Uiterlijk beschreven
- Aroma benoemd
- mondgevoel benoemd
- Balans beoordeeld


### Reflectievraag

In een mini-toets moet je een serviceadvies kiezen: ga je voor veilig generiek of voor stijlspecifiek temperatuuradvies, en waarom is een van beide professioneel superieur?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klassieke-stijlen-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'klassieke-stijlen-beer'
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
    'pilsner',
    'Pilsner',
    'Na deze les kun je Pilsner herkennen en uitleggen waarom deze stijl technisch veeleisend is ondanks zijn eenvoudige imago.
',
    'Pilsner is een klassieke ondergisting-stijl waarin helderheid, hoge doordrinkbaarheid en strakke bitterheidslijn centraal staan. Juist door die schijnbare eenvoud vallen kleine fouten in vergisting, lagering of zuurstofbeheer onmiddellijk op.

De stijl vraagt balans tussen moutfrisheid en hopbitterheid zonder plakkerig restzoet. Attenuatie ligt vaak relatief hoog, waardoor de finale droog kan ogen en bitterheid exact gedoseerd moet zijn. Te veel hophardheid of te weinig body maakt het bier hoekig.

Service draait om precisie: temperatuurimpact is groot, want te koud dempt aroma en maakt de slok dun, te warm vergroot bitterheidsdruk en alcoholindruk. Correct glaswerk en vers getapte presentatie bepalen of de stijl zijn finesse toont.


## Food pairing

### Beste pairing

Haring, bitterballen en lichte geitenkaas.

### Waarom dit werkt

Pilsner combineert sterk met vet en zout omdat koolzuur reinigt en strakke bitterheid de afdronk droog trekt.

### Vermijd

Blauwschimmelkaas of chocolade — te weinig body en mout.

## Pro insight

Pils te lang in warme tapleiding geeft harde bitterheid en vlakke neus — servicefout die zelfs perfect gebrouwen bier onherstelbaar maakt.',
    '- Pilsner
- ondergisting
- attenuatie
- hopbitterheid
- doordrinkbaarheid
',
    'Vrijwel alle moderne lagers zijn afgeleid van Pilsner.
',
    '- Pilsner: ondergistend, strak, hoge doordrinkbaarheid
- Fouten vallen direct op — technisch veeleisend
- Frisheid en droge afdronk zijn stijlkenmerken
- Service op temperatuur en glas is cruciaal
',
    '### Opdracht

Proef twee verschillende pilseners.

### Checklist

- Ik heb bitterheid vergeleken
- Ik heb frisheid beoordeeld
- Ik heb afdronk vergeleken


### Reflectievraag

Pilsner komt hoekig over aan tafel: corrigeer je eerst temperatuur of glaswerk, en welke uitkomst verwacht je van die eerste interventie?',
    8,
    1
  ),
  (
    'blond',
    'Blond',
    'Na deze les kun je Blond herkennen op gistprofiel, moutzoetheid en typische Belgische balans.
',
    'Blond positioneert zich vaak tussen frisheid en aromatische toegankelijkheid, meestal met bovengisting als drager van subtiele esters. De stijl is daardoor commercieel sterk, maar technisch kwetsbaar voor onevenwicht tussen fruitigheid, zoetindruk en alcohol.

Een geslaagde blond heeft voldoende attenuatie om levendig te blijven, terwijl body nog net genoeg structuur geeft voor gastronomische inzet. Hopbitterheid ondersteunt de finale maar mag het gistprofiel niet overstemmen. De kunst zit in evenwicht, niet in intensiteit.

In verkooplogica is blond een brugstijl: je kunt gasten van pils of van zwaardere abdijbieren laten convergeren naar een middenprofiel. Dat werkt alleen wanneer je expliciet vraagt naar gewenst mondgevoel en zoetbeleving in plaats van enkel naar alcoholpercentage.


## Food pairing

### Beste pairing

Kip met kruidenboter, mosselen en jonge Gouda.

### Waarom dit werkt

Blond werkt door esters met kruidigheid te verbinden, terwijl matige bitterheid en zachte zoetheid zout in balans houden.

### Vermijd

Zware chocolade of espresso-dessert.

## Pro insight

Bij blond werkt ''meer fruitigheid of meer frisheid?'' beter dan alcoholpercentage — gasten kiezen op beleving, niet op cijfers.',
    '- Blond
- bovengisting
- esters
- balans
- drinkvenster
',
    'Veel Blond bieren lijken licht, maar kunnen behoorlijk krachtig zijn.
',
    '- Blond: toegankelijk maar gistgedreven
- Esters en milde moutzoetheid domineren
- Balans tussen fruitigheid en droogheid
- Brugstijl tussen pils en abdijbier
',
    '### Opdracht

Vergelijk een Blond met een Pils.

### Checklist

- Fruitigheid vergeleken
- Body vergeleken
- Alcoholgevoel beoordeeld


### Reflectievraag

Bij blond met zoete aanzet en korte finale: adviseer je foodpairing op vet of op zout als eerste anker, en wat is je technische argument?',
    8,
    2
  ),
  (
    'weizen',
    'Weizen',
    'Na deze les kun je Weizen herkennen op gistkarakter, banaan/kruidnagel-esters en troebele presentatie.
',
    'Weizen is een tarwegedreven bovengisting-stijl waarbij gistaroma en eiwitstructuur een herkenbaar sensorisch profiel vormen. Banaanachtige esters en kruidnagelachtige fenolen ontstaan uit giststam en vergistingsregime, terwijl tarwe bijdraagt aan romig mondgevoel en schuimpersistentie.

De balans is delicaat: te veel esters maakt het bier snoeperig, te dominante fenolen maken het hoekig. Koolzuur speelt een structurele rol door frisheid en lift, maar kan bij onjuiste service ook prikkelend en chaotisch worden.

Glaswerk is hier functioneel, niet decoratief. Een hoog weizenglas ondersteunt schuimopbouw en aromasturing, maar alleen bij gecontroleerd inschenken. Servicefouten ontstaan vaak door te snelle schenking waardoor gistdepot en koolzuur onbedoeld de balans verstoren.


## Food pairing

### Beste pairing

Weißwurst, pretzel en lichte apfelstrudel.

### Waarom dit werkt

Weizen past bij vettere gerechten omdat koolzuur snijdt en esters plus fenolen een aromatische brug vormen.

### Vermijd

Zeer hoppige of roasty gerechten.

## Pro insight

Weizen in pintglas verliest schuimopbouw en esterexpressie; hoog glas is functioneel voor deze stijl, niet decoratief.',
    '- Weizen
- tarwemout
- fenolen
- esters
- schuimretentie
',
    'Volgens Duitse wet moet Weizen minimaal 50% tarwe bevatten.
',
    '- Weizen: tarwe, esters, fenolen, troebele presentatie
- Banaan/kruidnagel zijn gistmarkers, geen toevoeging
- Hoog glas ondersteunt schuim en aroma
- Schenktechniek bepaalt depot en balans
',
    '### Opdracht

Proef een Weizen.

### Checklist

- Banaan herkend
- Kruidnagel herkend
- Koolzuur beoordeeld


### Reflectievraag

In weizenproef is banaantoon dominant: kies je lagere serveertemperatuur of ander glaswerk als eerste correctie, en waarom precies die volgorde?',
    8,
    3
  ),
  (
    'witbier',
    'Witbier',
    'Na deze les kun je Witbier herkennen op tarwe, koriander en fris, licht zurend profiel.
',
    'Witbier combineert tarwe, kruiden en gistkarakter in een licht troebel, fris en vaak laag-bitter profiel. De stijl leunt op aromatische verfijning: citrusachtige esters, zachte fenolen en subtiele kruidtonen moeten geïntegreerd blijven.

Omdat bitterheid relatief mild is, dragen zuurindruk en koolzuur sterk bij aan frisheidservaring. Een te hoge serveertemperatuur kan kruidigheid log maken en de slok zwaarder laten lijken dan bedoeld; te koud serveer je het bier aromatisch doof.

Pairing-technisch is witbier waardevol bij gerechten waar aciditeit en kruidcomplexiteit gewenst zijn zonder zware body. Voor service betekent dit dat je helder communiceert over stijlverwachting, zodat gasten het niet beoordelen met pils-criteria.


## Food pairing

### Beste pairing

Geitenkaas, salade met citrus en lichte vis.

### Waarom dit werkt

Witbier ondersteunt frisse gerechten via zuur en koolzuur, terwijl esters en fenolen kruiden en citrus optillen.

### Vermijd

Zware stoof of agressieve BBQ.

## Pro insight

Witbier als aromatische brug bij kruidige gerechten — maar alleen als temperatuur citrus en fenolen niet dichtzet.',
    '- Witbier
- kruiding
- esters
- fenolen
- frisheid
',
    'Pierre Celis bracht witbier opnieuw tot leven in de 20e eeuw.
',
    '- Witbier: tarwe, koriander, fris en licht bitter
- Citrus en kruid vragen juiste serveertemperatuur
- Niet beoordelen met pils-criteria
- Seizoensbier met gastronomische breedte
',
    '### Opdracht

Proef een Witbier.

### Checklist

- Citrus herkend
- Kruidigheid herkend
- Frisheid beoordeeld


### Reflectievraag

Witbier wordt als ''vlak'' ervaren: verhoog je temperatuur of wissel je naar smaller glas, en welke verandering moet direct merkbaar zijn?',
    8,
    4
  ),
  (
    'bockbier',
    'Bockbier',
    'Na deze les kun je Bockbier herkennen op moutzoetheid, alcohol en seizoenslogica.
',
    'Bockbier bouwt zijn identiteit op moutdiepte, karameltonen, soms roast-accenten en een voller bodyprofiel. De stijl vraagt gecontroleerde zoet-bitterbalans: voldoende restextract voor warmte en lengte, maar met genoeg bitterheid om plakkerigheid te voorkomen.

Lagering en rijping zijn hier extra belangrijk omdat zwaardere worten meer tijd vragen om alcohol, moutzoet en koolzuur te integreren. Onvoldoende rust levert vaak een losse, alcoholgedreven indruk; goede rijping geeft juist gelaagdheid en ronding.

In service is temperatuurimpact kritisch: te warm versterkt alcoholwarmte en suikerdruk, te koud maskeert complexiteit en maakt het bier monolithisch. Correct geschonken kan bock zowel digestief als foodpairing-anker functioneren.


## Food pairing

### Beste pairing

Ham, oude kaas en peperkoek.

### Waarom dit werkt

Bockbier matcht stoof of geroosterd voedsel via zoetheid en roast, met bitterheid als rem op vet en umami.

### Vermijd

Lichte zomersalade als hoofdgerecht.

## Pro insight

Bock net onder keldertemperatuur serveren; te warm tilt alcohol en moutzoetheid disproportioneel op en breekt pairingbalans.',
    '- Bockbier
- moutdiepte
- roast
- restextract
- rijping
',
    'De oorsprong van Bock ligt in Einbeck (Nedersaksen).
',
    '- Bock: moutdiepte, karamel, seizoenslogica
- Lagering integreert alcohol en moutzoetheid
- Te warm = alcohol domineert; te koud = vlak
- Digestief en pairing-anker in winterkeuken
',
    '### Opdracht

Proef een Bockbier.

### Checklist

- Moutigheid herkend
- Zoetheid beoordeeld
- Body beoordeeld


### Reflectievraag

Bockbier lijkt log in pairing: verlaag je serveertemperatuur of kies je zouter gerecht, en welke keuze levert de grootste balanswinst?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- belgische-stijlen-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'belgische-stijlen-beer'
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
    'dubbel',
    'Dubbel',
    'Na deze les kun je Dubbel herkennen op donkere mout, karamel en abdijtraditie.
',
    'Dubbel is een klassieke Belgische abdijstijl waarin moutdiepte centraal staat. Het profiel draait om karamel, donker gedroogd fruit en een ronde, warme textuur die vol aanvoelt zonder plakkerig te worden.

Historisch is Dubbel verbonden met abdijbrouwerijen die balans zochten tussen kracht, drinkbaarheid en complexiteit. De kunst zit in gecontroleerde vergisting: genoeg restzoetheid voor body, maar voldoende vergistingsgraad om de afdronk levend te houden.

Professioneel proef je Dubbel dus niet alleen op kleur, maar op structuur: hoe moutzoetheid, koolzuur en milde bitterheid elkaar in evenwicht houden. Dat maakt de stijl gastronomisch breed inzetbaar, vooral bij gerechten met umami, vet en gekaramelliseerde smaken.


## Food pairing

### Beste pairing

Stoofvlees, abdijkaas en bruine boterkoek.

### Waarom dit werkt

Dubbel combineert sterk met stoof en abdijkaas omdat moutzoetheid zout en umami afrondt, terwijl koolzuur vet lichter maakt en milde bitterheid het geheel droog houdt.

### Vermijd

Te delicate witvis zonder saus.

## Pro insight

Verkoop Dubbel op structuur, niet op kleur: leg uit hoe karamelmout en koolzuur samen vetrijke gerechten dragen zonder zwaar te vallen.',
    '- dubbel
- karamelmout
- donker fruit
- abdijstijl
- balans
',
    'De abdij van Westmalle speelde een grote rol in de ontwikkeling van Dubbel.
',
    '- Dubbel: karamelmout, donker fruit, abdijtraditie
- Moutdiepte zonder plakkerige zoetheid
- Koolzuur en milde bitterheid dragen structuur
- Gastronomisch bij umami en gekaramelliseerde smaken
',
    '### Opdracht

Proef een Dubbel.

### Checklist

- Ik herken karamel
- Ik herken gedroogd fruit
- Ik beoordeel de balans


### Reflectievraag

Welke sensorische cue geeft jou in Dubbel de meeste zekerheid: donker fruit, karamelmout, koolzuurstructuur of afdronk - en waarom juist die?',
    8,
    1
  ),
  (
    'tripel',
    'Tripel',
    'Na deze les kun je Tripel herkennen op hoge attenuatie, kruidige gist en droge afdronk.
',
    'Tripel is een Belgisch sterk blond bier dat paradoxaal werkt: hoog alcoholgehalte, maar een relatief droge en elegante afdronk. Juist die spanning maakt Tripel technisch en gastronomisch interessant.

De stijl bouwt op hoge attenuatie, een expressief gistprofiel en een zorgvuldig bitter kader. Daardoor behoudt het bier spanning in het glas, in plaats van log of zoet te worden. Alcohol geeft volume, terwijl droogheid de doordrinkbaarheid bewaakt.

In professionele service behandel je Tripel als een krachtig maar verfijnd bier. Je schenkt met aandacht voor aroma-opbouw en tempo, omdat de combinatie van alcoholwarmte, kruidige esters en droge finish snel de totale beleving bepaalt.


## Food pairing

### Beste pairing

Gevogelte met kruiden, oude kaas en asperges met hollandaise.

### Waarom dit werkt

Tripel werkt bij romige sauzen en gevogelte doordat hoge attenuatie en droge afdronk vet neutraliseren; kruidige esters geven aromabrug zonder extra zoetheid.

### Vermijd

Zoet fruitdessert zonder contrast.

## Pro insight

Bij Tripel waarschuw je vriendelijk op drinktempo; de droge afdronk maskeert alcohol en verhoogt het risico dat gasten de kracht onderschatten.',
    '- tripel
- attenuatie
- gistprofiel
- droge afdronk
- alcoholwarmte
',
    'De abdij van Westmalle wordt gezien als de bakermat van de moderne Tripel.
',
    '- Tripel: hoog alcohol, droge afdronk, kruidige esters
- Hoge attenuatie houdt spanning in het glas
- Droogheid maskeert alcohol — serveer met tempo-advies
- Krachtig maar verfijnd digestief en pairingbier
',
    '### Opdracht

Proef een Tripel.

### Checklist

- Fruitigheid herkend
- Alcoholwarmte beoordeeld
- Droogheid geanalyseerd


### Reflectievraag

Wanneer je Tripel als ''te zwaar'' ervaart, ligt dat dan aan alcoholwarmte, glaskeuze, serveertemperatuur of restzoetheid volgens jouw proefdata?',
    8,
    2
  ),
  (
    'quadrupel',
    'Quadrupel',
    'Na deze les kun je Quadrupel herkennen op intensiteit, diepte en rijpe mouttonen.
',
    'Quadrupel is een intens, donker en gelaagd bier waarin concentratie van mout, alcohol en oxidatieve rijpingstonen vaak samenkomen. De stijl vraagt rust, aandacht en een kleiner serveervolume.

In de kern draait Quadrupel om diepte: tonen van vijg, rozijn, toffee en soms lichte oxidatieve nuances zoals gedroogd fruit of notigheid. Bitterheid staat op de achtergrond en ondersteunt vooral de balans van zoetheid en warmte.

Voor sommeliers is Quadrupel een digestiefstijl met culinaire potentie, vooral bij kaas en desserts. De professionele toets is hier beheersing: niet zoeken naar brute kracht, maar naar de mate waarin alcohol, restzoet en aromatische complexiteit in harmonie blijven.


## Food pairing

### Beste pairing

Wild, blauwschimmelkaas en chocoladefondant.

### Waarom dit werkt

Quadrupel past bij wild en blauwschimmel omdat alcoholwarmte en restzoetheid de intensiteit dragen, terwijl subtiele bitterheid voorkomt dat suikers plakkerig worden.

### Vermijd

Lichte salade of crudo.

## Pro insight

Schenk Quadrupel in kleiner glas en met expliciete context als digestief; dat verhoogt beleving en verlaagt retour door ''te zwaar'' verwachtingen.',
    '- quadrupel
- restzoetheid
- oxidatieve rijping
- digestief
- intensiteit
',
    'Brouwerij De Koningshoeven (La Trappe) gebruikte als eerste officieel de naam Quadrupel.
',
    '- Quadrupel: intens, donker, rijp fruit en toffee
- Klein glas, rustig tempo, digestief positionering
- Oxidatieve rijping kan diepte toevoegen
- Pairing bij kaas, wild en chocolade
',
    '### Opdracht

Proef een Quadrupel.

### Checklist

- Zoetheid beoordeeld
- Alcoholwarmte herkend
- Body beoordeeld


### Reflectievraag

Hoe onderscheid jij blind Quadrupel van Barleywine als beide vergelijkbare alcohol hebben, en welke observatie is dan doorslaggevend?',
    8,
    3
  ),
  (
    'saison',
    'Saison',
    'Na deze les kun je Saison herkennen op droogheid, kruidigheid en boerse oorsprong.
',
    'Saison is historisch een boerenbier uit Wallonie, bedoeld als verfrissend en doordrinkbaar tafelbier voor seizoensarbeid. De moderne stijl behoudt die identiteit via droogheid, levendig koolzuur en kruidige spanning.

Wat Saison onderscheidt is de combinatie van hoge vergistingsgraad en uitgesproken gistkarakter. Peperige fenolen, subtiele esters en een slanke body geven een strak maar aromatisch profiel dat zeer geschikt is voor gastronomie.

Professioneel beoordeel je Saison op precisie: de stijl mag expressief zijn, maar nooit rommelig. Wanneer koolzuur, bitterheid en droge afdronk exact op elkaar aansluiten, ontstaat een bier dat vet, zout en kruid in gerechten uitzonderlijk goed balanceert.


## Food pairing

### Beste pairing

Geitenkaas, kruidige worst en gegrilde groenten.

### Waarom dit werkt

Saison pairt met geitenkaas en kruidige gerechten via hoog koolzuur, peperige fenolen en droge finish; dit snijdt door vet en houdt kruidigheid scherp.

### Vermijd

Zoete toetjes zonder bitter- of zuurcontrast.

## Pro insight

Saison is een servicewapen bij kruidige keuken: benoem droogheid en gistpeper als argument waarom het bier vet opruimt zonder zoet te plakken.',
    '- saison
- fenolen
- droogheid
- koolzuur
- boerenbier
',
    'Saison was historisch vaak laag in alcohol, maar moderne versies zijn vaak sterker.
',
    '- Saison: droog, kruidig, hoge attenuatie
- Boerenbier met gastronomische precisie
- Fenolen en koolzuur snijden vet
- Temperatuur bepaalt kruidexpressie
',
    '### Opdracht

Proef een Saison.

### Checklist

- Droogheid beoordeeld
- Kruidigheid herkend
- Koolzuur geanalyseerd


### Reflectievraag

Welke fout zie je vaker bij Saison-service: te koud schenken of onderschatte koolzuurdruk, en wat doet dat met je stijlconclusie?',
    8,
    4
  ),
  (
    'abdijbier-vs-trappist',
    'Abdijbier vs Trappist',
    'Na deze les kun je Trappist en abdijbier onderscheiden op certificering, productie en positionering.
',
    'Abdijbier en Trappist worden vaak als synoniemen gebruikt, maar technisch en juridisch zijn het verschillende categorieën. Trappist verwijst naar gecontroleerde herkomst en productievoorwaarden, niet naar een specifiek smaakprofiel.

Het Authentic Trappist Product-keurmerk vraagt dat brouwen onder toezicht van een trappistenabdij gebeurt en dat opbrengsten de kloostergemeenschap en goede doelen ondersteunen. Abdijbier kan stilistisch vergelijkbaar zijn, maar mist die institutionele certificering.

In gastcommunicatie is dit onderscheid commercieel relevant: je verkoopt transparantie en context. Een professional positioneert Trappist niet als ''beter'', maar als anders gedekt in oorsprong, governance en verhaal.


## Food pairing

### Beste pairing

Abdijkaas, notenbrood en stoof.

### Waarom dit werkt

Bij abdij- en trappiststijlen is pairing technisch gebaseerd op zout-vet-umami-balans: koolzuur reinigt, esters bouwen brug met rijpingstonen en bitterheid tempert zoutpiek.

### Vermijd

Pils bij alles — mist structuur voor zware gerechten.

## Pro insight

Gebruik Trappist vs abdijbier als storytelling met feiten: certificering, toezicht en bestemming van opbrengst versterken vertrouwen en upsell.',
    '- trappist
- abdijbier
- certificering
- authenticiteit
- herkomstcontrole
',
    'De officiële organisatie heet de International Trappist Association (ITA).
',
    '- Trappist = certificering; abdijbier = stijlfamilie
- ITA-regels borgen herkomst en governance
- Verkoop op transparantie, niet op mythe
- Authenticiteit is commercieel onderscheidend
',
    '### Opdracht

Zoek twee bieren op: één Trappist en één Abdijbier.

### Checklist

- Herkomst gevonden
- Brouwerij onderzocht
- Verschillen begrepen


### Reflectievraag

Welke vraag stel je aan een etiket om Trappist en abdijbier betrouwbaar te scheiden zonder op marketingtaal te vertrouwen?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- moderne-stijlen-beer (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'moderne-stijlen-beer'
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
    'ipa',
    'IPA',
    'Na deze les kun je IPA herkennen op hopbitterheid, aroma-intensiteit en moderne evolutie.
',
    'IPA is geëvolveerd van historisch exportbier naar een brede familie waarin hoparoma en hopbitterheid de centrale bouwstenen vormen. Moderne interpretaties leggen soms meer nadruk op aroma dan op harde bitterheid.

De stijl draait technisch om hopkeuze, timing en oxidatiecontrole. Koude en late hopgiften sturen citrus, dennen, tropisch fruit of hars, terwijl moutbasis en vergistingsgraad bepalen hoe bitterheid wordt ervaren.

Professioneel is IPA een stijl waarin versheid cruciaal is. Goede service betekent dat je batchleeftijd, aroma-intensiteit en bitterheidsprofiel actief meeweegt in advies en pairing.


## Food pairing

### Beste pairing

Spicy burger, curry en gegrilde chorizo.

### Waarom dit werkt

IPA ondersteunt pittig en vet eten doordat hopbitterheid en koolzuur capsaicine structureren; citrusachtige hopesters verfrissen rijke sauzen.

### Vermijd

Subtiele witvis of crème-desserts.

## Pro insight

Vraag bij IPA altijd naar aromavoorkeur (citrus, hars, tropisch) in plaats van alleen bitterheid; zo stuur je sneller naar een passende keuze.',
    '- ipa
- hopbitterheid
- hoparoma
- versheid
- dry-hopping
',
    'IPA was de motor achter de wereldwijde craft beer revolutie.
',
    '- IPA: hopbitterheid en aroma als kern
- Versheid en oxidatiecontrole zijn cruciaal
- Substyllen: bitter, juicy, hazy
- Pairing bij vet, spice en gegrild vlees
',
    '### Opdracht

Proef een IPA.

### Checklist

- Bitterheid beoordeeld
- Aroma geanalyseerd
- Afdronk beoordeeld


### Reflectievraag

Bij IPA met veel aroma maar lage bitterheid: noem je dit stijltypisch modern of afwijkend, en op basis van welke technische argumenten?',
    8,
    1
  ),
  (
    'neipa',
    'NEIPA',
    'Na deze les kun je NEIPA herkennen op troebelheid, juicy hoparoma en zachte bitterheid.
',
    'NEIPA, of New England IPA, verschuift het IPA-paradigma van harde bitterheid naar sappige aromatische intensiteit en een zachter mondgevoel. Troebelheid is hier functioneel, geen visueel defect.

De stijl gebruikt vaak hoge dry-hopdoseringen, chloride-gedreven waterprofielen en eiwitrijke granen om een rond, vol en ''juicy'' profiel te bouwen. Bitterheid blijft aanwezig, maar is meestal korter en zachter.

Voor professionals is NEIPA vooral een stijl van timing en conditie. De kwaliteitspiek ligt vroeg; oxidatie kan snel kleur en aroma veranderen. Correct voorraadbeheer is daarom even belangrijk als correcte schenktechniek.


## Food pairing

### Beste pairing

Fried chicken, poke bowl en softe geitenkaas.

### Waarom dit werkt

NEIPA werkt bij fried chicken en umami bowls omdat zachte bitterheid niet botst met kruid, terwijl troebel mondgevoel en lage scherpte vet afgerond laten proeven.

### Vermijd

Zware roast-gerechten die bitter-chocolade vragen.

## Pro insight

Houd NEIPA vers op de kaart en roteer actief; transparantie over batchversheid voorkomt teleurstelling en positioneert je als vakinhoudelijk sterk.',
    '- neipa
- troebelheid
- juicy profiel
- chloridebalans
- oxidatiegevoeligheid
',
    'Troebelheid is hier juist gewenst.
',
    '- NEIPA: troebel, juicy, zachte bitterheid
- Houdbaarheidsvenster is kort — roteer voorraad
- Chloride en dryhop bouwen mondgevoel
- Oxidatie verschuift aroma snel
',
    '### Opdracht

Vergelijk een IPA met een NEIPA.

### Checklist

- Troebelheid vergeleken
- Bitterheid vergeleken
- Fruitigheid vergeleken


### Reflectievraag

Hoe beoordeel je of een NEIPA nog op piek is: welke combinatie van kleur, aromaverlies en mondgevoel gebruik je als beslisregel?',
    8,
    2
  ),
  (
    'porter',
    'Porter',
    'Na deze les kun je Porter herkennen op geroosterde mout, chocolade en historische context.
',
    'Porter is een klassieke Engelse donkere stijl waarin roostermout, cacao en zachte karameltonen samenvallen tot een gebalanceerd geheel. In moderne context varieert Porter van droog en slank tot rijk en romig.

Historisch ontstond Porter als stedelijk werkbier met duidelijke moutsignatuur. In vergelijking met veel stouts is roast vaak minder agressief, waardoor chocolade- en broodkorsttonen beter uitwaaieren.

Professioneel biedt Porter veel culinaire flexibiliteit. Het bier kan zowel hartige roostergerechten als cacao-desserts dragen, zolang de intensiteit van gerecht en roastniveau op elkaar zijn afgestemd.


## Food pairing

### Beste pairing

Biefstuk, braad en brownies.

### Waarom dit werkt

Porter sluit aan op geroosterd vlees en cacao door roostermout en milde zoetheid; koolzuur snijdt door vet en roast versterkt Maillard-smaken.

### Vermijd

Lichte citrusdesserts.

## Pro insight

Porter werkt uitstekend als brugstijl voor wijndrinkers: chocolade en roast bieden herkenning, terwijl koolzuur het palet schoner houdt.',
    '- porter
- roostermout
- cacaotonen
- maillard
- moutbalans
',
    'Stout is oorspronkelijk een sterkere variant van Porter.
',
    '- Porter: roast, cacao, moutbalans
- Minder agressief dan veel stouts
- Gastronomisch bij gegrild en stoof
- Roast-niveau bepaalt pairing
',
    '### Opdracht

Proef een Porter.

### Checklist

- Roast beoordeeld
- Body beoordeeld
- Chocoladetonen herkend


### Reflectievraag

Wanneer kies je in pairing bewust Porter boven Stout, en welke rol spelen roastintensiteit en zoetheidsbalans in die keuze?',
    8,
    3
  ),
  (
    'stout',
    'Stout',
    'Na deze les kun je Stout herkennen op roast, body en het verschil met Porter.
',
    'Stout is een donkere bierfamilie met nadruk op geroosterde expressie: koffie, cacao, soms drop of asachtige tonen, afhankelijk van recept en moutkeuze. De stijl omvat droge, zoete, oatmeal en imperial varianten.

Waar Porter vaak ronder begint, zet Stout doorgaans steviger in op roaststructuur. De waargenomen bitterheid komt niet alleen uit hop, maar ook uit geroosterde granen. Daardoor voelt de bitterlijn anders aan dan bij IPA.

In professionele blindproeverij is dit onderscheid essentieel: hopbitterheid stijgt vooral in de midden- tot achtertonen, terwijl roastbitterheid eerder droog en korrelig opbouwt. Dat sensorische verschil voorkomt veel misclassificaties.


## Food pairing

### Beste pairing

Oesters, Irish stew en chocoladetaart.

### Waarom dit werkt

Stout combineert met oesters, stoof en chocolade omdat roastbitterheid umami verdiept, terwijl romiger body en gecontroleerde zoetheid textuurverbinding geven.

### Vermijd

Te lichte salade als hoofdmaaltijd.

## Pro insight

Train teamleden op roastniveaus zodat niet elke donkere bierorder automatisch Guinness wordt; precisie in stijladvies verhoogt geloofwaardigheid.',
    '- stout
- roastbitterheid
- koffietonen
- body
- stijlvariant
',
    'Guinness is wereldwijd het bekendste stoutmerk.
',
    '- Stout: roastbitterheid, koffie, cacao
- Onderscheid hopbitter versus roastbitter
- Varianten van droog tot imperial
- Temperatuur en glas bepalen expressie
',
    '### Opdracht

Proef een Stout.

### Checklist

- Roast beoordeeld
- Bitterheid beoordeeld
- Body beoordeeld


### Reflectievraag

Welke proefstap helpt jou het meest om roastbitterheid van hopbitterheid te scheiden in Stout-achtige bieren?',
    8,
    4
  ),
  (
    'barleywine',
    'Barleywine',
    'Na deze les kun je Barleywine herkennen op alcohol, moutzoetheid en rijpingspotentieel.
',
    'Barleywine benadert bier vanuit wijnlogica: hoge beginstamwort, stevige alcohol en potentieel voor rijping. De stijl kan Engels-georiënteerd (moutdominant) of Amerikaans-georiënteerd (meer hopgedreven) zijn.

Typisch zijn tonen van toffee, gedroogd fruit, noten en warme alcohol, met een mondgevoel dat breed en langzaam ontwikkelt. Door tijd kan het profiel extra diepte krijgen, mits oxidatie beheerst verloopt.

Professioneel schenk je Barleywine in kleine porties en op een iets hogere temperatuur dan standaard tapbier. Dat geeft ruimte aan aroma en textuur, en positioneert het bier correct als contemplatief eindglas.


## Food pairing

### Beste pairing

Blauwschimmelkaas, sticky toffee pudding en notentaart.

### Waarom dit werkt

Barleywine past bij blauwe kaas en karamel-desserts door hoge alcohol, concentratie en oxidatieve diepte; zoetheid vangt zout op en bitterheid houdt de finish strak.

### Vermijd

Frisse sorbet zonder structuur.

## Pro insight

Positioneer Barleywine als ''bier met wijnritme'': klein schenken, rustiger tempo, en expliciet adviseren bij kaas of dessert in plaats van als dorstbier.',
    '- barleywine
- hoge beginstamwort
- rijpingspotentieel
- alcoholstructuur
- moutdiepte
',
    'Veel Barleywines verbeteren sterk door flesrijping.
',
    '- Barleywine: wijnlogica in bier
- Rijping kan complexiteit toevoegen
- Klein schenken, hogere temperatuur
- Digestief en dessertpairing
',
    '### Opdracht

Zoek een Barleywine op en analyseer het alcoholpercentage.

### Checklist

- Alcohol bekeken
- Smaakprofiel gelezen
- Rijpingsadvies gelezen


### Reflectievraag

Welke drie signalen bepalen volgens jou of een Barleywine nu schenken beter is dan verder laten rijpen?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-beer (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'service-beer'
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
    'Na deze les kun je serveertemperatuur koppelen aan stijl, aroma en mondgevoel.
',
    'Serveertemperatuur is een primaire kwaliteitshefboom in bierservice. Te koud dempt aroma en maakt bitterheid hoekiger; te warm vergroot zoetheid en alcoholindruk tot onevenwicht.

Elke stijl heeft een functioneel temperatuurbereik waarin koolzuur, volatiliteit en mondgevoel optimaal samenwerken. Lichte lagers vragen koeler om frisheid en crispheid te behouden, terwijl complexere ales warmer kunnen om aromatische diepte te tonen.

Professioneel werken met temperatuur betekent dus sturen, niet gokken. Je gebruikt stijlkennis, glaskeuze en servicesnelheid als een geheel systeem om in elk glas de bedoelde balans te leveren.


## Food pairing

### Beste pairing

Het bier dat je serveert, op de juiste temperatuur.

### Waarom dit werkt

Juiste temperatuur laat esters en koolzuur werken: te koud dempt aroma en verhardt bitterheid; te warm vergroot zoetheid en alcohol — pairing begint bij serveerconditie.

### Vermijd

Eén temperatuur voor alle stijlen.

## Pro insight

Hang een stijl-temperatuurkaart achter de bar; discussies dalen, upsell naar speciaalbier stijgt omdat smaak consistent leesbaar wordt.',
    '- serveertemperatuur
- aroma-volatiliteit
- koolzuurretentie
- smaakbalans
- stijlrange
',
    'Veel speciaalbier wordt te koud geserveerd.
',
    '- Serveertemperatuur stuurt aroma en balans
- Te koud dempt; te warm verstoort
- Complexere stijlen vragen warmer venster
- Temperatuurkaart = professionele standaard
',
    '### Opdracht

Meet de temperatuur van een bier vóór het drinken.

### Checklist

- Temperatuur gemeten
- Stijl bepaald
- Vergeleken met advies


### Reflectievraag

Bij een klacht ''te koud'': hoe herkalibreer jij snel temperatuur zonder stijlkarakter of schuimkwaliteit te verliezen?',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les kun je glaswerk kiezen op basis van stijl, schuim en aroma-ontwikkeling.
',
    'Glaswerk is een technisch instrument dat aroma-opbouw, schuimstabiliteit en mondperceptie actief beïnvloedt. De vorm van kelk, opening en steel verandert hoe bier op neus en tong wordt ervaren.

Een smalle opening concentreert vluchtige aromaten; een bredere opening geeft snellere expressie. Hoog glas ondersteunt koolzuurlift en schuimkraag bij tarwebieren, terwijl tulpvormen complexere neuslagen bij IPA, Tripel en Stout zichtbaar maken.

In professionele service kies je glas niet op esthetiek, maar op functionele match met stijl en context. Dat maakt het verschil tussen correct schenken en echt presenteren.


## Food pairing

### Beste pairing

Stijl-passend gerecht in het juiste glas.

### Waarom dit werkt

Glasvorm concentreert of opent aroma: smalle opening voor esters, brede kelk voor textuur — zelfde bier, ander glas, andere pairingconclusie.

### Vermijd

Pils in wijnglas — verliest koolzuur en schuim.

## Pro insight

Glaswerk is omzetgevoelig: juiste glaskeuze verhoogt aromabeleving en rechtvaardigt premium-prijs zonder extra productkosten.',
    '- glaswerk
- aromaconcentratie
- schuimstabiliteit
- mondperceptie
- presentatietechniek
',
    'Veel brouwerijen ontwikkelen hun eigen glasvormen.
',
    '- Glaswerk stuurt aroma, schuim en perceptie
- Kelkvorm kiest je bewust per stijl
- Functioneel, niet decoratief
- Verkeerd glas = verkeerde stijlconclusie
',
    '### Opdracht

Drink hetzelfde bier uit twee verschillende glazen.

### Checklist

- Geur vergeleken
- Schuim vergeleken
- mondgevoel vergeleken


### Reflectievraag

Wanneer wijk jij bewust af van het klassieke glasadvies, en welk effect verwacht je dan op aroma, schuim en gastbeleving?',
    8,
    2
  ),
  (
    'schenktechniek',
    'Schenktechniek',
    'Na deze les kun je correct schenken voor optimaal schuim, koolzuur en presentatie.
',
    'Schenktechniek bepaalt direct de kwaliteit van het moment waarop bier wordt ervaren. Hoek, hoogte en tempo van schenken sturen schuimvorming, koolzuurretentie en aroma-release.

Een gecontroleerde tweefasen-schenking geeft eerst rust in de vloeistof en bouwt daarna een stabiele schuimkraag op. Zo bescherm je oxidatiegevoelige aromaten en voorkom je zowel overschuim als vlakke presentatie.

Professioneel is techniek ook economisch: consistent schenken beperkt verspilling en houdt service reproduceerbaar. Voor de gast vertaalt dat zich in een glas dat tegelijk visueel correct en sensorisch volledig is.


## Food pairing

### Beste pairing

Tapbier met perfecte kroes bij frituur of borrel.

### Waarom dit werkt

Stabiel schuim en intacte koolzuur reinigen vet en resetten zoutperceptie; oxidatie door slecht schenken verstoort hop- en moutbruggen in pairing.

### Vermijd

Bier lang laten staan voor schenken.

## Pro insight

Consistente schenktraining verbetert marge direct; minder overschuim betekent minder verlies en tegelijk een professionelere gastervaring.',
    '- schenktechniek
- tweefasen-schenking
- schuimkraag
- oxidatiebeperking
- koolzuurbehoud
',
    'Sommige brouwerijen trainen personeel specifiek op hun eigen schenktechniek.
',
    '- Schenktechniek bepaalt schuim, CO₂ en presentatie
- Tweefasen-schenking beschermt aroma
- Consistentie verlaagt verspilling
- Eerste indruk is servicekwaliteit
',
    '### Opdracht

Schenk één bier zorgvuldig uit.

### Checklist

- Glas schoon
- Juiste hoek gebruikt
- Schuim gecontroleerd


### Reflectievraag

Welke schenkfout kost in jouw service de meeste kwaliteit: te agressieve straal, verkeerd glashoek of te late schuimopbouw?',
    8,
    3
  ),
  (
    'bewaren-en-rijping',
    'Bewaren & rijping',
    'Na deze les kun je bier bewaren en rijpen op temperatuur, licht en stijllogica.
',
    'Bewaren en rijpen zijn geen synoniemen voor elk bier. Sommige stijlen profiteren van tijd, andere verliezen vooral hun kernkwaliteit door oxidatie, lichtschade of aromaverlies.

Hopgedreven bieren zoals IPA en NEIPA tonen hun beste profiel jong, terwijl sterke moutgedreven stijlen zoals Quadrupel en Barleywine gecontroleerd kunnen evolueren. Temperatuurstabiliteit, donkerte en rechtop opslag blijven de basisvoorwaarden.

Professioneel voorraadbeheer betekent dat je stijltype koppelt aan rotatiesnelheid en serveermoment. Rijping is pas waardevol wanneer ze doelgericht gebeurt en je sensorisch kunt onderbouwen wat er gewonnen is.


## Food pairing

### Beste pairing

Gerijpt bier met oude kaas of stoof (indien stijl past).

### Waarom dit werkt

Bewaarde bieren tonen meer geïntegreerde zoetheid en roast; pairing verschuift van frisse zout-vet-snede naar umami en rijpe textuur — rotatie bepaalt het moment.

### Vermijd

NEIPA of hoppig IPA lang bewaren en bij lichte salade serveren.

## Pro insight

Communiceer eerlijk dat niet elk bier beter wordt met tijd; juist dat onderscheid tussen bewaren en snel drinken maakt je advies betrouwbaar.',
    '- bewaarcondities
- rijping
- lichtschade
- rotatiebeheer
- houdbaarheid
',
    'Oude Barleywines kunnen sherryachtige tonen ontwikkelen.
',
    '- Niet elk bier wint aan tijd
- Hopbier drink je jong; sterke ales kunnen rijpen
- Licht, temperatuur en rechtop opslaan
- Drinkvenster communiceren, niet beloven
',
    '### Opdracht

Bekijk drie bieren in je voorraad.

### Checklist

- Ik heb stijlen bepaald
- Ik heb rijpingspotentieel beoordeeld
- Ik heb opslagcondities bekeken


### Reflectievraag

Hoe bepaal je praktisch welke bieren in jouw voorraad rotatie nodig hebben en welke gecontroleerde rijping verdienen?',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-beer (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'pairing-beer'
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
    'bier-en-kaas',
    'Bier & kaas',
    'Na deze les kun je bier en kaas paireren op intensiteit, vet, zout en koolzuur.
',
    'Bier en kaas vormen een van de meest betrouwbare gastronomische combinaties omdat bier meerdere tegenkrachten tegelijk biedt: koolzuur tegen vet, bitterheid tegen zout en moutzoetheid tegen scherpe rijpingsranden.

De kernregel is intensiteitsmatching: jonge, frisse kazen vragen lichtere bieren, terwijl gerijpte of blauwe kazen om meer alcohol, body en aromatische diepte vragen. Structuur is belangrijker dan kleur.

Professioneel pair je kaas daarom niet op merknaam maar op matrix: zout, vet, umami en textuur. Dat maakt bierpairing met kaas vaak preciezer stuurbaar dan klassieke wijnpairing.


## Food pairing

### Beste pairing

Tripel met oude Gouda, Dubbel met blauwschimmel, Weizen met geitenkaas.

### Waarom dit werkt

Bier en kaas werkt technisch via koolzuur tegen vet, bitterheid tegen zout en moutzoetheid tegen pikante rijpingsrand; umami wordt zo dieper maar niet log.

### Vermijd

Pils bij blauwschimmel; Quadrupel bij jonge mozzarella.

## Pro insight

Bij kaasplanken verkoop je bierpairing met het argument ''koolzuur snijdt vet''; dat is voor gasten direct voelbaar en makkelijker te begrijpen dan theorie.',
    '- bier-kaaspairing
- vetreiniging
- zoutbalans
- umami
- intensiteitsmatching
',
    'Bier pairt vaak makkelijker met kaas dan wijn door het koolzuur.
',
    '- Kaas: koolzuur tegen vet, bitterheid tegen zout
- Intensiteit matching is kernregel
- Structuur vóór stijlnaam
- Bier vaak preciezer dan wijn bij kaas
',
    '### Opdracht

Maak thuis één bier-kaas pairing.

### Checklist

- Intensiteit vergeleken
- Vetgehalte beoordeeld
- Balans getest


### Reflectievraag

Bij blauwe kaas: kies je eerder Dubbel, Tripel of Quadrupel, en hoe onderbouw je dat met zout-vet-umami in plaats van smaakvoorkeur?',
    8,
    1
  ),
  (
    'bier-en-vlees',
    'Bier & vlees',
    'Na deze les kun je bier en vlees paireren op eiwit, vet, roodheid en sausstructuur.
',
    'Bier en vlees pairing draait om de interactie tussen eiwit, vet, Maillard-tonen en sausstructuur. Bier biedt met koolzuur en bitterheid actieve reiniging waar wijn dat minder direct doet.

Hopprofielen kunnen gekruid of vet vlees liften, terwijl roostermout gegrilde en gekaramelliseerde tonen spiegelt. Moutzoetheid kan pittigheid afronden, maar moet voldoende bitter tegengewicht houden om niet log te worden.

Professioneel start je bij de saus, niet bij het stuk vlees alleen. De saus bepaalt vaak de dominante smaakas, en dus of je richting IPA, Dubbel, Porter of Stout moet bewegen.


## Food pairing

### Beste pairing

IPA met burger, Porter met lam, Dubbel met stoof.

### Waarom dit werkt

Bier en vlees vraagt matching op vet, umami en roostering: hopbitterheid snijdt vet, roostermout spiegelt grilltonen en koolzuur verfrist na elke hap.

### Vermijd

Zware Quadrupel bij lichte kipfilet zonder saus.

## Pro insight

Begin vleespairing altijd bij saus en bereiding, niet bij diersoort; die aanpak voorkomt mismatch en maakt je aanbeveling concreet.',
    '- bier-vleespairing
- eiwitinteractie
- roostering
- sausdominantie
- vetbalans
',
    'Stout en barbecue zijn wereldwijd een bekende pairing.
',
    '- Vlees: saus bepaalt vaak de pairing
- Roast spiegelt Maillard; koolzuur snijdt vet
- Hop of mout volgt bereiding en vetgehalte
- Eiwit, vet en umami als beslisassen
',
    '### Opdracht

Bedenk drie bier-vlees combinaties.

### Checklist

- Vleestype gekozen
- Bier gekozen
- Match verklaard


### Reflectievraag

Wat is bij vleespairing jouw eerste beslispunt: bereiding, vetgehalte of saus, en waarom geeft dat de beste voorspelkracht?',
    8,
    2
  ),
  (
    'bier-en-desserts',
    'Bier & desserts',
    'Na deze les kun je bier en dessert paireren op zoetheid, bitterheid en textuur.
',
    'Bier en dessert vraagt strak zoetheidsmanagement. Wanneer het bier zoeter is dan het dessert, kan de combinatie vlak worden; wanneer het bier te bitter en te dun is, wordt het dessert hard en metalig.

Roostermout werkt sterk bij cacao en koffiecomponenten, terwijl moutzoetheid en alcohol body geven bij romige texturen. Fruitzuren in desserts vragen juist lichtere, frissere bierstijlen met voldoende lift.

Professioneel kies je bewust tussen spiegeling en contrast. De beste pairing is niet per se de meest intense, maar degene die de textuur en smaaklengte van beide componenten verlengt.


## Food pairing

### Beste pairing

Stout met chocoladetaart, Quadrupel met brownie, Blond met crème brûlée.

### Waarom dit werkt

Bij desserts balanceer je zoetheid en bitterheid: roast in Stout vangt cacao, terwijl esters en alcohol in zwaardere ales romigheid dragen zonder suikerverzadiging.

### Vermijd

Zoet dessert + zoet fruitbier zonder zuurcontrast.

## Pro insight

Dessertadvies start met relatieve zoetheid: kies bier dat het dessert ondersteunt of contrasteert, maar nooit volledig overstemt.',
    '- bier-dessertpairing
- zoetheidsmanagement
- contrast
- spiegeling
- textuurmatch
',
    'Imperial Stout wordt vaak gezien als één van de beste dessertbieren.
',
    '- Dessert: zoetheidsmanagement is alles
- Contrast of spiegeling bewust kiezen
- Roast bij cacao; frisheid bij fruit
- Finale-lengte bepaalt pairingkwaliteit
',
    '### Opdracht

Kies een dessert en zoek een bier erbij.

### Checklist

- Zoetheid beoordeeld
- Intensiteit beoordeeld
- Structuur vergeleken


### Reflectievraag

Wanneer kies jij bij dessert voor contrast en wanneer voor spiegeling, en welke fout probeer je daarmee expliciet te voorkomen?',
    8,
    3
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-beer (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'beer' and m.slug = 'examen-beer'
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
    'lager-vs-ale-blind',
    'Lager vs Ale blind',
    'Na deze les kun je blind Lager en Ale onderscheiden op aroma, gist en mondgevoel.
',
    'Blind onderscheid tussen Lager en Ale vraagt discipline in observatievolgorde. Je kijkt eerst naar aromatische expressie, daarna naar gistkarakter, koolzuurindruk en afdronkstructuur.

Lager toont vaak een schoner profiel met strakkere bitterlijn, terwijl Ale doorgaans meer esters en een rondere fermentatiehandtekening laat zien. Uitzonderingen bestaan, dus je werkt met waarschijnlijkheden, niet met slogans.

Professioneel blindproeven betekent dat je hypothesen stap voor stap uitsluit. Het doel is niet snel raden, maar reproduceerbaar redeneren op basis van sensorische data.


## Food pairing

### Beste pairing

Blind: kies pairing na stijlconclusie.

### Waarom dit werkt

Blind Lager vs Ale pairing wordt betrouwbaarder als je eerst gistkarakter en afdronk vastlegt; schone profielen werken vaak beter met zout/vet, esterrijke met kruid/zuur.

### Vermijd

Pairing kiezen vóór je stijl vastlegt.

## Pro insight

In blindtraining geldt: eerst neusdata noteren, dan pas stijl roepen; die volgorde verhoogt nauwkeurigheid en verlaagt gokgedrag in teamsessies.',
    '- blindproeven
- lager
- ale
- esters
- afdronkanalyse
',
    'Veel beginners herkennen Ale sneller door de fruitigheid.
',
    '- Lager vs ale: esters, koolzuur, afdronk
- Kleur misleidt — structuur beslist
- Hypothesen stap voor stap uitsluiten
- Blind = reproduceerbaar redeneren
',
    '### Opdracht

Proef blind één Lager en één Ale.

### Checklist

- Ik heb geur geanalyseerd
- Ik heb body beoordeeld
- Ik heb gistkarakter gezocht


### Reflectievraag

Welke volgorde van observaties gebruik je blind om Lager vs Ale te bepalen, en waar maak je statistisch de meeste misclassificaties?',
    10,
    1
  ),
  (
    'ipa-vs-stout-blind',
    'IPA vs Stout blind',
    'Na deze les kun je blind IPA en Stout onderscheiden op hop, roast en structuur.
',
    'Blind IPA versus Stout onderscheiden lijkt eenvoudig op kleur, maar betrouwbare identificatie vraagt focus op bitterheidstype, aromaprofiel en mondstructuur. Visuele cues kunnen misleidend zijn door moderne interpretaties.

IPA geeft vooral hopgedreven aromaten en een bitterlijn die vaak citrus, hars of tropisch fruit begeleidt. Stout bouwt bitterheid vanuit roast op en laat koffie, cacao en soms asachtige droogte domineren.

Professioneel hanteer je een vaste beslisvolgorde: neus, eerste slok, middenpalet, afdronk. Zo maak je onderscheid op mechanisme in plaats van op vooroordeel.


## Food pairing

### Beste pairing

Blind: roast-gerecht bij donker, hop bij licht gekruid vlees.

### Waarom dit werkt

Blind IPA vs Stout onderscheid je in pairing op bitterbron: hopbitter volgt spice en zuuraccenten, roastbitter ondersteunt cacao, braad en umami-rijke componenten.

### Vermijd

Alleen kleur als pairingcriterium.

## Pro insight

Leer personeel het verschil tussen hopbitter en roastbitter benoemen; dat ene onderscheid lost de meeste IPA/Stout-blindfouten op.',
    '- ipa-vs-stout
- hopbitterheid
- roastbitterheid
- aromaprofilering
- sensorische beslisboom
',
    'Veel ervaren proevers herkennen Stout sneller door roast.
',
    '- IPA vs stout: hopbitter versus roastbitter
- Neus → eerste slok → afdronk als volgorde
- Visuele cues zijn onbetrouwbaar
- Mechanisme-onderzoek voorkomt misclassificatie
',
    '### Opdracht

Proef blind één IPA en één Stout.

### Checklist

- Aroma geanalyseerd
- Bitterheid geanalyseerd
- Body beoordeeld


### Reflectievraag

Welke eigenschap na de eerste slok laat jou het snelst kiezen tussen IPA en Stout, los van kleur of verwachting?',
    10,
    2
  ),
  (
    'theorie-praktijk-examen',
    'Theorie- en praktijkexamen',
    'Na deze les toon je aan dat je Beer Academy beheerst: theorie, proeven, service, pairing en blindanalyse.
',
    'Het examen is de integratietoets van Beer Academy: theorie, stijlkunde, service, pairing en blindanalyse komen samen in een enkele professionele prestatie. Je bewijst niet alleen kennis, maar ook toepasbaarheid.

Beoordeling draait om consistentie: kun je stijlkenmerken correct benoemen, keuzes onderbouwen en sensorische observaties vertalen naar praktische service- en pairingadviezen. Het is een toets van oordeel, niet alleen geheugen.

Professioneel is dit eindpunt tegelijk een startpunt. De waarde van het certificaat ligt in de kwaliteit van je vervolgpraktijk: blijven trainen, kalibreren en verfijnen op de vloer en aan tafel.


## Examenonderdelen

### Deel 1 — Theorie

20 vragen over:

- ingrediënten
- productie
- stijlen
- service
- pairing

---

### Deel 2 — Praktijk

Analyseer blind twee bieren:

Checklist:

- stijl inschatten
- alcoholniveau inschatten
- body beschrijven
- aroma’s benoemen
- pairingadvies geven

---

### Deel 3 — Pairing

Maak drie pairings:

- kaas
- vlees
- dessert

Leg per pairing uit waarom.

## Food pairing

### Beste pairing

Drie gangen examenmenu: kaas, vlees, dessert met passend bier.

### Waarom dit werkt

In het examen toon je waarom elke pairing werkt via meetbare assen: koolzuur, bitterheid, zoetheid, roast, esters, umami, vet, zout en zuur in onderlinge balans.

### Vermijd

Eén bier voor alle drie examenpairings.

## Pro insight

Plan na certificering één maandelijkse kalibratieproef; vakmanschap veroudert zonder herhaling — examen is startpunt, geen eindpunt.',
    '- examenintegratie
- stijlkunde
- service
- pairing
- professionele kalibratie
',
    '',
    '- Volledige integratie: theorie, proeven, service, pairing
- Oordeel zwaarder dan geheugen
- Certificering is startpunt, geen eindpunt
- Gerichte retraining na zwakke competentie
',
    '### Opdracht

Voer het volledige praktijkexamen uit.

### Checklist

- Twee bieren blind geanalyseerd
- Drie pairings gemaakt
- Theorie afgerond


### Reflectievraag

Welk examenonderdeel vraagt voor jou de hoogste transfer van kennis naar praktijk, en hoe ga je dat na certificering gericht trainen?',
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
  where t.slug = 'beer'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-beer', 'wat-is-bier', 1, 'Een gast vraagt wat bier fundamenteel anders maakt dan wijn. Wat is je kernantwoord?', '["Bier gebruikt druiven", "Bier wordt gebrouwen uit graan met hop en gist", "Bier is altijd koolzuurhoudend", "Bier bevat geen alcohol"]', 1, 'Correct: Bier wordt gebrouwen uit graan met hop en gist'),
  ('intro-beer', 'wat-is-bier', 2, 'Wat maakt alcohol in bier?', '["Water", "Hop", "Gist", "Glas"]', 2, 'Correct: Gist'),
  ('intro-beer', 'wat-is-bier', 3, 'Wat ontstaat ook tijdens vergisting?', '["Zuurstof", "CO₂", "Zout", "Stikstof"]', 1, 'Correct: CO₂'),
  ('intro-beer', 'wat-is-bier', 4, 'Bier is:', '["Een versterkte drank", "Een gefermenteerde drank", "Een gedistilleerde drank", "Een mousserende wijn"]', 1, 'Correct: Een gefermenteerde drank'),
  ('intro-beer', 'wat-is-bier', 5, 'Bier bestaat al:', '["100 jaar", "500 jaar", "Duizenden jaren", "50 jaar"]', 2, 'Correct: Duizenden jaren'),
  ('intro-beer', 'vier-basisingredienten', 1, 'Wat vormt het grootste deel van bier?', '["Mout", "Water", "Hop", "Gist"]', 1, 'Correct: Water'),
  ('intro-beer', 'vier-basisingredienten', 2, 'Wat levert de suikers?', '["Hop", "Gist", "Mout", "Water"]', 2, 'Correct: Mout'),
  ('intro-beer', 'vier-basisingredienten', 3, 'Wat zorgt voor bitterheid?', '["Mout", "Hop", "Water", "Gist"]', 1, 'Correct: Hop'),
  ('intro-beer', 'vier-basisingredienten', 4, 'Wat zet suiker om in alcohol?', '["Hop", "Gist", "Mout", "Water"]', 1, 'Correct: Gist'),
  ('intro-beer', 'vier-basisingredienten', 5, 'Welke factor beïnvloedt aroma sterk?', '["Gist", "Glas", "Etiket", "Licht"]', 0, 'Correct: Gist'),
  ('intro-beer', 'alcoholische-gisting', 1, 'Wat doet gist?', '["Verbrandt alcohol", "Eet suiker", "Koelt bier", "Filtert bier"]', 1, 'Correct: Eet suiker'),
  ('intro-beer', 'alcoholische-gisting', 2, 'Wat ontstaat?', '["Alcohol en CO₂", "Alleen water", "Alleen zuurstof", "Alleen suiker"]', 0, 'Correct: Alcohol en CO₂'),
  ('intro-beer', 'alcoholische-gisting', 3, 'Temperatuur beïnvloedt:', '["Etiket", "Aroma", "Glas", "Fles"]', 1, 'Correct: Aroma'),
  ('intro-beer', 'alcoholische-gisting', 4, 'Waar vindt gisting plaats?', '["Glas", "Tank", "Vat", "Flesdop"]', 1, 'Correct: Tank'),
  ('intro-beer', 'alcoholische-gisting', 5, 'Fruitige tonen komen vaak van:', '["Water", "Gist", "Hop", "Glas"]', 1, 'Correct: Gist'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 1, 'Pils is meestal:', '["Bovengistend", "Ondergistend", "Mousserend", "Versterkt"]', 1, 'Correct: Ondergistend'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 2, 'bovengisting gebeurt:', '["Kouder", "Warmer", "Zonder gist", "Zonder alcohol"]', 1, 'Correct: Warmer'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 3, 'Je proeft sterke banaan en kruidnagel zonder donkere mout. Welke gisting past het best?', '["Ondergisting bij 8°C", "Bovengisting met Weizen-gist", "Spontane gisting", "Mixed fermentation zonder esters"]', 1, 'Correct: Bovengisting met Weizen-gist'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 4, 'Welke stijl is klassiek ondergistend?', '["Pils", "Tripel", "Saison", "Weizen"]', 0, 'Correct: Pils'),
  ('intro-beer', 'ondergisting-vs-bovengisting', 5, 'Welke stijl is vaak complexer?', '["Bovengisting", "Ondergisting", "Water", "Mout"]', 0, 'Correct: Bovengisting'),
  ('intro-beer', 'biercategorieen', 1, 'Welke categorie is vaak strak en fris?', '["Lager", "Stout", "Porter", "Barleywine"]', 0, 'Correct: Lager'),
  ('intro-beer', 'biercategorieen', 2, 'Welke categorie is hopgedreven?', '["IPA", "Stout", "Wheat", "Bock"]', 0, 'Correct: IPA'),
  ('intro-beer', 'biercategorieen', 3, 'Welke categorie is vaak zacht?', '["Wheat", "IPA", "Porter", "Stout"]', 0, 'Correct: Wheat'),
  ('intro-beer', 'biercategorieen', 4, 'Welke categorie is geroosterd?', '["Dark beer", "Lager", "Ale", "Wheat"]', 0, 'Correct: Dark beer'),
  ('intro-beer', 'biercategorieen', 5, 'Welke categorie is vaak fruitig?', '["Ale", "Lager", "Pils", "Water"]', 0, 'Correct: Ale'),
  ('productie-beer', 'mouten-uitgelegd', 1, 'Waar wordt mout meestal van gemaakt?', '["Druiven", "Gerst", "Appels", "Haver"]', 1, 'Correct: Gerst'),
  ('productie-beer', 'mouten-uitgelegd', 2, 'Wat levert mout?', '["Suikers", "Zuurstof", "Koolzuur", "Alcohol"]', 0, 'Correct: Suikers'),
  ('productie-beer', 'mouten-uitgelegd', 3, 'Wat bepaalt mout sterk?', '["Kleur", "Glas", "Etiket", "Schuim"]', 0, 'Correct: Kleur'),
  ('productie-beer', 'mouten-uitgelegd', 4, 'Donkere mout geeft vaak:', '["Citrus", "Chocolade", "Zout", "Gras"]', 1, 'Correct: Chocolade'),
  ('productie-beer', 'mouten-uitgelegd', 5, 'Mout is de basis van:', '["Alcohol", "Fles", "Schuim", "Kurk"]', 0, 'Correct: Alcohol'),
  ('productie-beer', 'maischen', 1, 'Wat ontstaat na het maischen?', '["Wort", "Bier", "Alcohol", "Hop"]', 0, 'Correct: Wort'),
  ('productie-beer', 'maischen', 2, 'Wat wordt omgezet?', '["Zetmeel", "Alcohol", "Water", "CO₂"]', 0, 'Correct: Zetmeel'),
  ('productie-beer', 'maischen', 3, 'Wat bepaalt het proces sterk?', '["Temperatuur", "Glas", "Schuim", "Fles"]', 0, 'Correct: Temperatuur'),
  ('productie-beer', 'maischen', 4, 'Lagere temperatuur geeft vaak:', '["Droger bier", "Zoeter bier", "Donker bier", "Bitter bier"]', 0, 'Correct: Droger bier'),
  ('productie-beer', 'maischen', 5, 'Maischen gebeurt vóór:', '["Gisting", "Bottelen", "Drinken", "Serveren"]', 0, 'Correct: Gisting'),
  ('productie-beer', 'hop-en-bitterheid', 1, 'Wat geeft hop?', '["Bitterheid", "Alcohol", "Schuim", "Water"]', 0, 'Correct: Bitterheid'),
  ('productie-beer', 'hop-en-bitterheid', 2, 'Twee bieren hebben IBU 40. Eén proef je veel bitterder. Wat verklaart dat het vaakst?', '["Hoger alcohol", "Minder moutzoetheid", "Meer koolzuur", "Donkerdere kleur"]', 1, 'Correct: Minder moutzoetheid'),
  ('productie-beer', 'hop-en-bitterheid', 3, 'Late hopgiften geven vooral:', '["Aroma", "Alcohol", "Water", "Zuur"]', 0, 'Correct: Aroma'),
  ('productie-beer', 'hop-en-bitterheid', 4, 'IPA is vaak:', '["Hoprijk", "Zoet", "Zuur", "Plat"]', 0, 'Correct: Hoprijk'),
  ('productie-beer', 'hop-en-bitterheid', 5, 'Hop balanceert:', '["Zoetheid", "Alcohol", "Water", "Schuim"]', 0, 'Correct: Zoetheid'),
  ('productie-beer', 'gist-en-aroma', 1, 'Wat maakt gist naast alcohol?', '["Aroma", "Glas", "Schuim", "Water"]', 0, 'Correct: Aroma'),
  ('productie-beer', 'gist-en-aroma', 2, 'Esters zijn:', '["Fruitig", "Bitter", "Zout", "Plat"]', 0, 'Correct: Fruitig'),
  ('productie-beer', 'gist-en-aroma', 3, 'Fenolen zijn vaak:', '["Kruidig", "Zoet", "Zuur", "Droog"]', 0, 'Correct: Kruidig'),
  ('productie-beer', 'gist-en-aroma', 4, 'Weizen staat bekend om:', '["Banaan", "Chocolade", "Koffie", "Citrus"]', 0, 'Correct: Banaan'),
  ('productie-beer', 'gist-en-aroma', 5, 'Gist beïnvloedt:', '["Stijl", "Glas", "Etiket", "Fles"]', 0, 'Correct: Stijl'),
  ('productie-beer', 'lagering-en-rijping', 1, 'Wanneer gebeurt lagering?', '["Voor maischen", "Na gisting", "Voor hop", "Voor mout"]', 1, 'Correct: Na gisting'),
  ('productie-beer', 'lagering-en-rijping', 2, 'Wat gebeurt tijdens lagering?', '["Stabilisatie", "Distillatie", "Fortificatie", "Pasteurisatie"]', 0, 'Correct: Stabilisatie'),
  ('productie-beer', 'lagering-en-rijping', 3, 'Wat wordt vaak zachter?', '["Smaak", "Glas", "Schuim", "Fles"]', 0, 'Correct: Smaak'),
  ('productie-beer', 'lagering-en-rijping', 4, 'Lagering kan duren:', '["Minuten", "Weken of maanden", "Seconden", "Jaren altijd"]', 1, 'Correct: Weken of maanden'),
  ('productie-beer', 'lagering-en-rijping', 5, 'Wat betekent “lagern”?', '["Bewaren", "Schenken", "Filteren", "Koken"]', 0, 'Correct: Bewaren'),
  ('proeven-beer', 'hoe-proef-je-bier', 1, 'Wat is de eerste stap?', '["Proeven", "Ruiken", "Kijken", "Evalueren"]', 2, 'Correct: Kijken'),
  ('proeven-beer', 'hoe-proef-je-bier', 2, 'Waar let je visueel op?', '["Kleur", "Geluid", "Gewicht", "Flesvorm"]', 0, 'Correct: Kleur'),
  ('proeven-beer', 'hoe-proef-je-bier', 3, 'Wat vertelt veel over kwaliteit?', '["Afdronk", "Dop", "Glas", "Temperatuur"]', 0, 'Correct: Afdronk'),
  ('proeven-beer', 'hoe-proef-je-bier', 4, 'Waarom systematisch proeven?', '["Meer structuur", "Sneller drinken", "Minder smaak", "Minder schuim"]', 0, 'Correct: Meer structuur'),
  ('proeven-beer', 'hoe-proef-je-bier', 5, 'Wat komt vóór proeven?', '["Ruiken", "Schenken", "Serveren", "Bewaren"]', 0, 'Correct: Ruiken'),
  ('proeven-beer', 'schuim-analyseren', 1, 'Waarom is schuim belangrijk?', '["Beschermt aroma", "Maakt bier warmer", "Verhoogt alcohol", "Verlaagt bitterheid"]', 0, 'Correct: Beschermt aroma'),
  ('proeven-beer', 'schuim-analyseren', 2, 'Wat beïnvloedt schuim negatief?', '["Vet", "Water", "Licht", "Tijd"]', 0, 'Correct: Vet'),
  ('proeven-beer', 'schuim-analyseren', 3, 'Wat zegt romig schuim vaak?', '["Kwaliteit", "Oud bier", "Slechte gisting", "Lage alcohol"]', 0, 'Correct: Kwaliteit'),
  ('proeven-beer', 'schuim-analyseren', 4, 'Waar let je op?', '["Stabiliteit", "Dop", "Etiket", "Prijs"]', 0, 'Correct: Stabiliteit'),
  ('proeven-beer', 'schuim-analyseren', 5, 'Schuim beïnvloedt:', '["Aroma", "Alcohol", "Kleur", "Mout"]', 0, 'Correct: Aroma'),
  ('proeven-beer', 'aromas-herkennen', 1, 'Welke aroma hoort bij hop?', '["Citrus", "Chocolade", "Karamel", "Koffie"]', 0, 'Correct: Citrus'),
  ('proeven-beer', 'aromas-herkennen', 2, 'Welke aroma hoort bij mout?', '["Brood", "Gras", "Peper", "Citroen"]', 0, 'Correct: Brood'),
  ('proeven-beer', 'aromas-herkennen', 3, 'Banaan komt vaak van:', '["Gist", "Water", "Glas", "Schuim"]', 0, 'Correct: Gist'),
  ('proeven-beer', 'aromas-herkennen', 4, 'Hop geeft vaak:', '["Bloemen", "Melk", "Honing", "Zout"]', 0, 'Correct: Bloemen'),
  ('proeven-beer', 'aromas-herkennen', 5, 'Aromaherkenning ontwikkel je door:', '["Oefening", "Kijken", "Schudden", "Koelen"]', 0, 'Correct: Oefening'),
  ('proeven-beer', 'structuur-en-mondgevoel', 1, 'Wat is mondgevoel?', '["Fysieke sensatie", "Alleen geur", "Alleen kleur", "Alleen schuim"]', 0, 'Correct: Fysieke sensatie'),
  ('proeven-beer', 'structuur-en-mondgevoel', 2, 'Wat voelt vaak voller?', '["Stout", "Pils", "Lager", "Witbier"]', 0, 'Correct: Stout'),
  ('proeven-beer', 'structuur-en-mondgevoel', 3, 'Blind proef je hoog alcohol maar licht mondgevoel. Welke stijl past het best?', '["Barleywine", "Tripel", "Imperial Stout", "Bock"]', 1, 'Correct: Tripel'),
  ('proeven-beer', 'structuur-en-mondgevoel', 4, 'Wat geeft warmte?', '["Alcohol", "Water", "Hop", "Gist"]', 0, 'Correct: Alcohol'),
  ('proeven-beer', 'structuur-en-mondgevoel', 5, 'Body wordt mede beïnvloed door:', '["Restsuiker", "Glas", "Dop", "Etiket"]', 0, 'Correct: Restsuiker'),
  ('proeven-beer', 'mini-toets-bier', 1, 'Wat zijn de vier basisingrediënten?', '["Water, mout, hop, gist", "Druiven, suiker, water, gist", "Hop, fruit, gist, water", "Water, alcohol, mout, hop"]', 0, 'Correct: Water, mout, hop, gist'),
  ('proeven-beer', 'mini-toets-bier', 2, 'Wat meet IBU?', '["Bitterheid", "Alcohol", "Schuim", "Kleur"]', 0, 'Correct: Bitterheid'),
  ('proeven-beer', 'mini-toets-bier', 3, 'Wat analyseer je als eerste?', '["Kleur", "Smaak", "Afdronk", "Temperatuur"]', 0, 'Correct: Kleur'),
  ('proeven-beer', 'mini-toets-bier', 4, 'Welke stijl is vaak ondergistend?', '["Pils", "Tripel", "Saison", "Weizen"]', 0, 'Correct: Pils'),
  ('proeven-beer', 'mini-toets-bier', 5, 'Welke factor beïnvloedt mondgevoel?', '["Body", "Etiket", "Glasdikte", "Prijs"]', 0, 'Correct: Body'),
  ('klassieke-stijlen-beer', 'pilsner', 1, 'Waar ontstond Pilsner?', '["België", "Duitsland", "Tsjechië", "Nederland"]', 2, 'Correct: Tsjechië'),
  ('klassieke-stijlen-beer', 'pilsner', 2, 'Pils is:', '["Bovengistend", "Ondergistend", "Versterkt", "Zuur"]', 1, 'Correct: Ondergistend'),
  ('klassieke-stijlen-beer', 'pilsner', 3, 'Pils is meestal:', '["Donker", "Licht goudgeel", "Rood", "Bruin"]', 1, 'Correct: Licht goudgeel'),
  ('klassieke-stijlen-beer', 'pilsner', 4, 'Pils heeft vaak:', '["Droge afdronk", "Zoete afdronk", "Zoute afdronk", "Geen afdronk"]', 0, 'Correct: Droge afdronk'),
  ('klassieke-stijlen-beer', 'pilsner', 5, 'Pils is technisch:', '["Eenvoudig", "Moeilijk", "Onmogelijk", "Simpel"]', 1, 'Correct: Moeilijk'),
  ('klassieke-stijlen-beer', 'blond', 1, 'Blond is meestal:', '["Bovengistend", "Ondergistend", "Versterkt", "Zuur"]', 0, 'Correct: Bovengistend'),
  ('klassieke-stijlen-beer', 'blond', 2, 'Blond heeft vaak:', '["Fruitigheid", "Zout", "Rook", "As"]', 0, 'Correct: Fruitigheid'),
  ('klassieke-stijlen-beer', 'blond', 3, 'Alcohol ligt vaak:', '["2–3%", "6–8%", "10–12%", "15%"]', 1, 'Correct: 6–8%'),
  ('klassieke-stijlen-beer', 'blond', 4, 'Blond is vaak:', '["Complexer dan pils", "Simpeler dan pils", "Donkerder dan stout", "Zoeter dan Port"]', 0, 'Correct: Complexer dan pils'),
  ('klassieke-stijlen-beer', 'blond', 5, 'Blond komt sterk voor in:', '["België", "Spanje", "Portugal", "Italië"]', 0, 'Correct: België'),
  ('klassieke-stijlen-beer', 'weizen', 1, 'Weizen bevat veel:', '["Tarwe", "Rijst", "Druiven", "Mais"]', 0, 'Correct: Tarwe'),
  ('klassieke-stijlen-beer', 'weizen', 2, 'Typisch aroma:', '["Banaan", "Koffie", "Rook", "As"]', 0, 'Correct: Banaan'),
  ('klassieke-stijlen-beer', 'weizen', 3, 'Weizen is vaak:', '["Troebel", "Helder", "Zwart", "Rood"]', 0, 'Correct: Troebel'),
  ('klassieke-stijlen-beer', 'weizen', 4, 'Kruidnagel komt van:', '["Gist", "Hop", "Water", "Glas"]', 0, 'Correct: Gist'),
  ('klassieke-stijlen-beer', 'weizen', 5, 'Weizen voelt vaak:', '["Levendig", "Plat", "Stil", "Hard"]', 0, 'Correct: Levendig'),
  ('klassieke-stijlen-beer', 'witbier', 1, 'Witbier komt uit:', '["België", "Duitsland", "Portugal", "Spanje"]', 0, 'Correct: België'),
  ('klassieke-stijlen-beer', 'witbier', 2, 'Typisch ingrediënt:', '["Sinaasappelschil", "Koffie", "Vanille", "Chocolade"]', 0, 'Correct: Sinaasappelschil'),
  ('klassieke-stijlen-beer', 'witbier', 3, 'Bitterheid is vaak:', '["Laag", "Hoog", "Extreem", "Niet aanwezig"]', 0, 'Correct: Laag'),
  ('klassieke-stijlen-beer', 'witbier', 4, 'Witbier is vaak:', '["Fris", "Zwaar", "Donker", "Rokerig"]', 0, 'Correct: Fris'),
  ('klassieke-stijlen-beer', 'witbier', 5, 'Typisch kruid:', '["Koriander", "Kaneel", "Tijm", "Rozemarijn"]', 0, 'Correct: Koriander'),
  ('klassieke-stijlen-beer', 'bockbier', 1, 'Bock draait vooral om:', '["Hop", "Mout", "Gist", "Water"]', 1, 'Correct: Mout'),
  ('klassieke-stijlen-beer', 'bockbier', 2, 'Bock is vaak:', '["Seizoensgebonden", "Zomerbier", "Licht bier", "Zuur bier"]', 0, 'Correct: Seizoensgebonden'),
  ('klassieke-stijlen-beer', 'bockbier', 3, 'Typische smaak:', '["Karamel", "Citrus", "Gras", "Azijn"]', 0, 'Correct: Karamel'),
  ('klassieke-stijlen-beer', 'bockbier', 4, 'Bock heeft vaak:', '["Meer alcohol dan pils", "Minder alcohol dan pils", "Geen alcohol", "Zelfde als wijn"]', 0, 'Correct: Meer alcohol dan pils'),
  ('klassieke-stijlen-beer', 'bockbier', 5, 'Bock komt oorspronkelijk uit:', '["Duitsland", "België", "Nederland", "Frankrijk"]', 0, 'Correct: Duitsland'),
  ('belgische-stijlen-beer', 'dubbel', 1, 'Dubbel is meestal:', '["Licht", "Donker", "Troebel wit", "Zuur"]', 1, 'Correct: Donker'),
  ('belgische-stijlen-beer', 'dubbel', 2, 'Typische aroma:', '["Rozijnen", "Citrus", "Gras", "Rook"]', 0, 'Correct: Rozijnen'),
  ('belgische-stijlen-beer', 'dubbel', 3, 'Alcohol is vaak:', '["6–8%", "2–3%", "10–12%", "15%"]', 0, 'Correct: 6–8%'),
  ('belgische-stijlen-beer', 'dubbel', 4, 'Dubbel draait om:', '["Mout en gist", "Alleen hop", "Alleen water", "Alleen koolzuur"]', 0, 'Correct: Mout en gist'),
  ('belgische-stijlen-beer', 'dubbel', 5, 'Dubbel is meestal:', '["Belgisch", "Duits", "Portugees", "Engels"]', 0, 'Correct: Belgisch'),
  ('belgische-stijlen-beer', 'tripel', 1, 'Tripel is vaak:', '["Donker", "Goudkleurig", "Zwart", "Rood"]', 1, 'Correct: Goudkleurig'),
  ('belgische-stijlen-beer', 'tripel', 2, 'Tripel heeft meestal:', '["Hoge alcohol", "Lage alcohol", "Geen alcohol", "Versterkte alcohol"]', 0, 'Correct: Hoge alcohol'),
  ('belgische-stijlen-beer', 'tripel', 3, 'Afdronk is vaak:', '["Droog", "Zoet", "Zout", "Zuur"]', 0, 'Correct: Droog'),
  ('belgische-stijlen-beer', 'tripel', 4, 'Typisch aroma:', '["Peer", "Koffie", "Rook", "As"]', 0, 'Correct: Peer'),
  ('belgische-stijlen-beer', 'tripel', 5, 'Tripel is:', '["Complex", "Simpel", "Licht", "Plat"]', 0, 'Correct: Complex'),
  ('belgische-stijlen-beer', 'quadrupel', 1, 'Quadrupel heeft vaak:', '["2–3%", "9–12%", "5–6%", "14–16%"]', 1, 'Correct: 9–12%'),
  ('belgische-stijlen-beer', 'quadrupel', 2, 'Quadrupel is meestal:', '["Licht", "Donker", "Troebel wit", "Rosé"]', 1, 'Correct: Donker'),
  ('belgische-stijlen-beer', 'quadrupel', 3, 'Typisch aroma:', '["Gedroogd fruit", "Citrus", "Gras", "Zout"]', 0, 'Correct: Gedroogd fruit'),
  ('belgische-stijlen-beer', 'quadrupel', 4, 'Quadrupel heeft vaak:', '["Rijpingspotentieel", "Geen bewaarpotentieel", "Alleen koude opslag", "Geen ontwikkeling"]', 0, 'Correct: Rijpingspotentieel'),
  ('belgische-stijlen-beer', 'quadrupel', 5, 'Quadrupel is:', '["Intens", "Simpel", "Licht", "Fris"]', 0, 'Correct: Intens'),
  ('belgische-stijlen-beer', 'saison', 1, 'Saison komt uit:', '["België", "Duitsland", "Engeland", "Spanje"]', 0, 'Correct: België'),
  ('belgische-stijlen-beer', 'saison', 2, 'Saison is vaak:', '["Droog", "Zoet", "Rijk zoet", "Zwaar moutig"]', 0, 'Correct: Droog'),
  ('belgische-stijlen-beer', 'saison', 3, 'Typische aroma:', '["Peper", "Chocolade", "Koffie", "Rook"]', 0, 'Correct: Peper'),
  ('belgische-stijlen-beer', 'saison', 4, 'Saison heeft vaak:', '["Hoog koolzuur", "Geen koolzuur", "Lage zuren", "Lage complexiteit"]', 0, 'Correct: Hoog koolzuur'),
  ('belgische-stijlen-beer', 'saison', 5, 'Saison is vaak:', '["Gastronomisch sterk", "Moeilijk te pairt", "Alleen dessertbier", "Alleen zomerbier"]', 0, 'Correct: Gastronomisch sterk'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 1, 'Trappist moet gebrouwen worden:', '["In abdij", "In fabriek", "In stad", "In kelder"]', 0, 'Correct: In abdij'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 2, 'Wie houdt toezicht?', '["Monniken", "Handelaren", "Sommeliers", "Exporteurs"]', 0, 'Correct: Monniken'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 3, 'Abdijbier is vaak:', '["Commercieel gebrouwen", "Altijd monastiek", "Altijd klein", "Altijd biologisch"]', 0, 'Correct: Commercieel gebrouwen'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 4, 'Welke organisatie bewaakt Trappist?', '["International Trappist Association", "Beer Alliance", "Belgian Brewers", "Monastic Guild"]', 0, 'Correct: International Trappist Association'),
  ('belgische-stijlen-beer', 'abdijbier-vs-trappist', 5, 'Is elk Abdijbier Trappist?', '["Ja", "Nee", "Soms altijd", "Alleen in België"]', 1, 'Correct: Nee'),
  ('moderne-stijlen-beer', 'ipa', 1, 'Waar staat IPA voor?', '["India Pale Ale", "International Pale Ale", "Imperial Pale Ale", "Indian Porter Ale"]', 0, 'Correct: India Pale Ale'),
  ('moderne-stijlen-beer', 'ipa', 2, 'IPA draait vooral om:', '["Hop", "Mout", "Water", "Gist"]', 0, 'Correct: Hop'),
  ('moderne-stijlen-beer', 'ipa', 3, 'Typisch aroma:', '["Citrus", "Karamel", "Chocolade", "Koffie"]', 0, 'Correct: Citrus'),
  ('moderne-stijlen-beer', 'ipa', 4, 'IPA is vaak:', '["Bitter", "Zoet", "Zuur", "Plat"]', 0, 'Correct: Bitter'),
  ('moderne-stijlen-beer', 'ipa', 5, 'IPA hoort sterk bij:', '["Craft beer", "Wijn", "Distillaten", "Cider"]', 0, 'Correct: Craft beer'),
  ('moderne-stijlen-beer', 'neipa', 1, 'NEIPA komt uit:', '["België", "New England", "Duitsland", "Engeland"]', 1, 'Correct: New England'),
  ('moderne-stijlen-beer', 'neipa', 2, 'NEIPA is vaak:', '["Troebel", "Helder", "Donker", "Rood"]', 0, 'Correct: Troebel'),
  ('moderne-stijlen-beer', 'neipa', 3, 'NEIPA is meestal:', '["Zachter bitter", "Bitterder", "Zuurder", "Zoeter dan stout"]', 0, 'Correct: Zachter bitter'),
  ('moderne-stijlen-beer', 'neipa', 4, 'Typisch aroma:', '["Mango", "Koffie", "Toast", "Noten"]', 0, 'Correct: Mango'),
  ('moderne-stijlen-beer', 'neipa', 5, 'mondgevoel is vaak:', '["Vol en zacht", "Licht en strak", "Plat", "Hard"]', 0, 'Correct: Vol en zacht'),
  ('moderne-stijlen-beer', 'porter', 1, 'Porter komt uit:', '["Londen", "Dublin", "Brussel", "München"]', 0, 'Correct: Londen'),
  ('moderne-stijlen-beer', 'porter', 2, 'Porter is:', '["Donker", "Licht", "Wit", "Rosé"]', 0, 'Correct: Donker'),
  ('moderne-stijlen-beer', 'porter', 3, 'Typisch aroma:', '["Chocolade", "Citrus", "Gras", "Zout"]', 0, 'Correct: Chocolade'),
  ('moderne-stijlen-beer', 'porter', 4, 'Porter is vaak:', '["Zachter dan stout", "Bitterder dan IPA", "Lichter dan pils", "Zoeter dan tripel"]', 0, 'Correct: Zachter dan stout'),
  ('moderne-stijlen-beer', 'porter', 5, 'Porter ontstond in:', '["18e eeuw", "12e eeuw", "20e eeuw", "21e eeuw"]', 0, 'Correct: 18e eeuw'),
  ('moderne-stijlen-beer', 'stout', 1, 'Typische smaak:', '["Koffie", "Citrus", "Mango", "Gras"]', 0, 'Correct: Koffie'),
  ('moderne-stijlen-beer', 'stout', 2, 'Stout is vaak:', '["Intens", "Licht", "Troebel wit", "Fris"]', 0, 'Correct: Intens'),
  ('moderne-stijlen-beer', 'stout', 3, 'Bekend stoutmerk:', '["Guinness", "Heineken", "Corona", "Duvel"]', 0, 'Correct: Guinness'),
  ('moderne-stijlen-beer', 'stout', 4, 'Stout heeft vaak:', '["Meer body dan Porter", "Minder body dan Pils", "Geen body", "Minder smaak"]', 0, 'Correct: Meer body dan Porter'),
  ('moderne-stijlen-beer', 'stout', 5, 'Stout is vaak:', '["Gastronomisch sterk", "Alleen zomerbier", "Alleen aperitief", "Alleen licht"]', 0, 'Correct: Gastronomisch sterk'),
  ('moderne-stijlen-beer', 'barleywine', 1, 'Barleywine is:', '["Wijn", "Bier", "Cider", "Port"]', 1, 'Correct: Bier'),
  ('moderne-stijlen-beer', 'barleywine', 2, 'Alcohol is vaak:', '["2–4%", "9–14%", "5–6%", "15–18%"]', 1, 'Correct: 9–14%'),
  ('moderne-stijlen-beer', 'barleywine', 3, 'Typisch aroma:', '["Toffee", "Citrus", "Gras", "Zout"]', 0, 'Correct: Toffee'),
  ('moderne-stijlen-beer', 'barleywine', 4, 'Barleywine heeft vaak:', '["Rijpingspotentieel", "Geen rijping", "Alleen koude opslag", "Geen ontwikkeling"]', 0, 'Correct: Rijpingspotentieel'),
  ('moderne-stijlen-beer', 'barleywine', 5, 'Drinktempo is vaak:', '["Langzaam", "Snel", "Shot", "IJskoud"]', 0, 'Correct: Langzaam'),
  ('service-beer', 'serveertemperatuur', 1, 'Te koud bier:', '["Versterkt aroma", "Onderdrukt aroma", "Verhoogt zoetheid", "Maakt bitterheid sterker"]', 1, 'Correct: Onderdrukt aroma'),
  ('service-beer', 'serveertemperatuur', 2, 'Pils drink je vaak op:', '["4–6°C", "10–12°C", "14–16°C", "18°C"]', 0, 'Correct: 4–6°C'),
  ('service-beer', 'serveertemperatuur', 3, 'Stout wordt vaak:', '["Warmer geserveerd", "IJskoud geserveerd", "Bevroren", "Altijd op kamertemperatuur"]', 0, 'Correct: Warmer geserveerd'),
  ('service-beer', 'serveertemperatuur', 4, 'Complex bier vraagt vaak:', '["Hogere temperatuur", "Lagere temperatuur", "Geen temperatuur", "IJs"]', 0, 'Correct: Hogere temperatuur'),
  ('service-beer', 'serveertemperatuur', 5, 'Service begint bij:', '["Temperatuur", "Etiket", "Prijs", "Fleskleur"]', 0, 'Correct: Temperatuur'),
  ('service-beer', 'glaswerk', 1, 'Wat beïnvloedt glas sterk?', '["Aroma", "Alcoholpercentage", "Ingrediënten", "Gisting"]', 0, 'Correct: Aroma'),
  ('service-beer', 'glaswerk', 2, 'Weizen wordt vaak geschonken in:', '["Hoog glas", "Tumbler", "Flute", "Klein glas"]', 0, 'Correct: Hoog glas'),
  ('service-beer', 'glaswerk', 3, 'Tripel past vaak in:', '["Kelk", "Shotglas", "Martini", "Flute"]', 0, 'Correct: Kelk'),
  ('service-beer', 'glaswerk', 4, 'Glas beïnvloedt:', '["Schuim", "Alcohol", "Mout", "Gist"]', 0, 'Correct: Schuim'),
  ('service-beer', 'glaswerk', 5, 'Veel brouwers:', '["Ontwerpen eigen glaswerk", "Gebruiken alleen flessen", "Gebruiken wijnflessen", "Gebruiken plastic"]', 0, 'Correct: Ontwerpen eigen glaswerk'),
  ('service-beer', 'schenktechniek', 1, 'Starthoek is vaak:', '["45°", "90°", "10°", "0°"]', 0, 'Correct: 45°'),
  ('service-beer', 'schenktechniek', 2, 'Te hard schenken geeft:', '["Te veel schuim", "Minder aroma", "Minder alcohol", "Minder bitterheid"]', 0, 'Correct: Te veel schuim'),
  ('service-beer', 'schenktechniek', 3, 'Wat moet altijd schoon zijn?', '["Glas", "Flesdop", "Tafel", "Etiket"]', 0, 'Correct: Glas'),
  ('service-beer', 'schenktechniek', 4, 'Weizen gist:', '["Wordt vaak mee geschonken", "Wordt weggegooid", "Wordt gefilterd", "Is verboden"]', 0, 'Correct: Wordt vaak mee geschonken'),
  ('service-beer', 'schenktechniek', 5, 'Schenken beïnvloedt:', '["Aroma en schuim", "Alcoholpercentage", "Ingrediënten", "Leeftijd"]', 0, 'Correct: Aroma en schuim'),
  ('service-beer', 'bewaren-en-rijping', 1, 'IPA drink je meestal:', '["Jong", "Oud", "Na 10 jaar", "Alleen warm"]', 0, 'Correct: Jong'),
  ('service-beer', 'bewaren-en-rijping', 2, 'Welke stijl kan goed rijpen?', '["Barleywine", "Pils", "Witbier", "Lager"]', 0, 'Correct: Barleywine'),
  ('service-beer', 'bewaren-en-rijping', 3, 'Hoe bewaar je bier?', '["Donker en koel", "Warm en licht", "Buiten", "In zonlicht"]', 0, 'Correct: Donker en koel'),
  ('service-beer', 'bewaren-en-rijping', 4, 'Oxidatie kan:', '["Smaken veranderen", "Alcohol verwijderen", "Schuim verhogen", "Gist stoppen"]', 0, 'Correct: Smaken veranderen'),
  ('service-beer', 'bewaren-en-rijping', 5, 'Bier bewaar je vaak:', '["Rechtop", "Liggend", "Ondersteboven", "Open"]', 0, 'Correct: Rechtop'),
  ('pairing-beer', 'bier-en-kaas', 1, 'Wat helpt vet doorbreken?', '["Koolzuur", "Alcohol", "Schuim", "Glas"]', 0, 'Correct: Koolzuur'),
  ('pairing-beer', 'bier-en-kaas', 2, 'Een gast bestelt blauwschimmelkaas. Welke pairing adviseer je het meest?', '["Pils", "Dubbel of Quadrupel", "Licht witbier zonder body", "NEIPA met weinig bitterheid"]', 1, 'Correct: Dubbel of Quadrupel'),
  ('pairing-beer', 'bier-en-kaas', 3, 'Kaas bevat vaak veel:', '["Vet en zout", "Bitterheid", "Koolzuur", "Alcohol"]', 0, 'Correct: Vet en zout'),
  ('pairing-beer', 'bier-en-kaas', 4, 'Bij pairing moet je letten op:', '["Intensiteit", "Kleur", "Etiket", "Prijs"]', 0, 'Correct: Intensiteit'),
  ('pairing-beer', 'bier-en-kaas', 5, 'Bier pairt vaak goed door:', '["Koolzuur", "Suiker", "Kurk", "Houtlagering"]', 0, 'Correct: Koolzuur'),
  ('pairing-beer', 'bier-en-vlees', 1, 'Wat past goed bij barbecue?', '["Stout", "Witbier", "Pils", "Sour"]', 0, 'Correct: Stout'),
  ('pairing-beer', 'bier-en-vlees', 2, 'IPA werkt goed met:', '["Grill", "Yoghurt", "Room", "Fruit"]', 0, 'Correct: Grill'),
  ('pairing-beer', 'bier-en-vlees', 3, 'Licht vlees vraagt vaak:', '["Lichter bier", "Quadrupel", "Barleywine", "Imperial stout"]', 0, 'Correct: Lichter bier'),
  ('pairing-beer', 'bier-en-vlees', 4, 'Roast werkt met:', '["Geroosterde smaken", "Zure smaken", "Zoete fruitigheid", "Citrus"]', 0, 'Correct: Geroosterde smaken'),
  ('pairing-beer', 'bier-en-vlees', 5, 'Mout werkt goed met:', '["Karamellisatie", "Zuur", "Zout", "Bitterheid"]', 0, 'Correct: Karamellisatie'),
  ('pairing-beer', 'bier-en-desserts', 1, 'Wat past klassiek bij chocolade?', '["Stout", "Pils", "Saison", "Lager"]', 0, 'Correct: Stout'),
  ('pairing-beer', 'bier-en-desserts', 2, 'Welke stijl werkt goed met karamel?', '["Barleywine", "Witbier", "Pils", "Sour"]', 0, 'Correct: Barleywine'),
  ('pairing-beer', 'bier-en-desserts', 3, 'Belangrijkste regel?', '["Bier even intens als dessert", "Bier altijd lichter", "Bier altijd bitter", "Bier altijd koud"]', 0, 'Correct: Bier even intens als dessert'),
  ('pairing-beer', 'bier-en-desserts', 4, 'Roast versterkt:', '["Chocolade", "Citrus", "Zuur", "Zout"]', 0, 'Correct: Chocolade'),
  ('pairing-beer', 'bier-en-desserts', 5, 'Quadrupel werkt vaak met:', '["Sticky toffee pudding", "Sorbet", "Salade", "Sushi"]', 0, 'Correct: Sticky toffee pudding'),
  ('examen-beer', 'lager-vs-ale-blind', 1, 'Blind: frisse afdronk, weinig esters, strak koolzuur. Wat wed je?', '["Belgische Tripel", "Pils of Lager", "Weizen", "Barleywine"]', 1, 'Correct: Pils of Lager'),
  ('examen-beer', 'lager-vs-ale-blind', 2, 'Welke stijl is fruitiger?', '["Ale", "Lager", "Pils", "Bock"]', 0, 'Correct: Ale'),
  ('examen-beer', 'lager-vs-ale-blind', 3, 'Wat helpt bij blindproeven?', '["Gistkarakter", "Etiket", "Fleskleur", "Prijs"]', 0, 'Correct: Gistkarakter'),
  ('examen-beer', 'lager-vs-ale-blind', 4, 'Lager is meestal:', '["Neutraler", "Zwaarder", "Zoeter", "Donkerder"]', 0, 'Correct: Neutraler'),
  ('examen-beer', 'lager-vs-ale-blind', 5, 'Ale is vaak:', '["Complexer", "Simpeler", "Kouder", "Helderder"]', 0, 'Correct: Complexer'),
  ('examen-beer', 'ipa-vs-stout-blind', 1, 'Blind: donkere kleur, koffie en roast, weinig hoparoma. Wat wed je?', '["IPA", "NEIPA", "Stout of Porter", "Pils"]', 2, 'Correct: Stout of Porter'),
  ('examen-beer', 'ipa-vs-stout-blind', 2, 'Welke stijl geeft koffie?', '["Stout", "IPA", "Weizen", "Saison"]', 0, 'Correct: Stout'),
  ('examen-beer', 'ipa-vs-stout-blind', 3, 'Welke stijl heeft vaak roast?', '["Stout", "IPA", "Witbier", "Blond"]', 0, 'Correct: Stout'),
  ('examen-beer', 'ipa-vs-stout-blind', 4, 'Welke stijl is vaak fruitiger?', '["IPA", "Stout", "Porter", "Bock"]', 0, 'Correct: IPA'),
  ('examen-beer', 'ipa-vs-stout-blind', 5, 'Wat helpt het meest?', '["Geur en body", "Etiket", "Temperatuur", "Flesvorm"]', 0, 'Correct: Geur en body'),
  ('examen-beer', 'theorie-praktijk-examen', 1, 'Welke gistingsvorm hoort bij Pils?', '["Bovengisting", "Ondergisting", "Spontaan", "Gemengd"]', 1, 'Correct: Ondergisting'),
  ('examen-beer', 'theorie-praktijk-examen', 2, 'Welke stijl is klassiek Belgisch?', '["Tripel", "Porter", "Lager", "Pils"]', 0, 'Correct: Tripel'),
  ('examen-beer', 'theorie-praktijk-examen', 3, 'Wat past klassiek bij chocolade?', '["Stout", "Pils", "Saison", "Witbier"]', 0, 'Correct: Stout'),
  ('examen-beer', 'theorie-praktijk-examen', 4, 'Welke stijl is troebel en juicy?', '["NEIPA", "Porter", "Bock", "Lager"]', 0, 'Correct: NEIPA'),
  ('examen-beer', 'theorie-praktijk-examen', 5, 'Wat beïnvloedt aroma sterk?', '["Temperatuur", "Etiket", "Flesvorm", "Dop"]', 0, 'Correct: Temperatuur')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
