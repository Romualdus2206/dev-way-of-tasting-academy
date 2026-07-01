-- BIO track: kernbegrippen NL — termen uit theorie voor contextuele vet-intro in app.
-- Geen aparte Kernbegrippen-sectie meer in de UI.

update academy.lessons l
set key_concepts_markdown = v.key_concepts
from (
  values
  ('wat-is-biodynamisch-proeven', '- biodynamisch proeven
- observatie
- ritmes
- timing
- patroonherkenning'),
  ('maria-thun-oorsprong', '- Maria Thun
- biodynamische kalender
- kosmische ritmes
- observaties
- drinkmomenten'),
  ('vier-dagtypen', '- Worteldagen
- Bladdagen
- Bloemdagen
- Vruchtdagen
- dagtypen'),
  ('elementen-biodynamiek', '- aarde
- water
- lucht
- vuur
- elementen'),
  ('waarom-gebruiken-professionals-dit', '- Sommeliers
- Wijnmakers
- timing
- balans
- precisie'),
  ('worteldagen-uitgelegd', '- Worteldagen
- structuur
- mineraliteit
- spanning
- aarde'),
  ('bladdagen-uitgelegd', '- Bladdagen
- vegetale
- frisheid
- water
- precisie'),
  ('bloemdagen-uitgelegd', '- Bloemdagen
- aroma
- finesse
- elegantie
- lucht'),
  ('vruchtdagen-uitgelegd', '- Vruchtdagen
- vuur
- fruitexpressie
- balans
- harmonie'),
  ('hoe-lees-je-de-kalender', '- biodynamische kalender
- maanknopen
- perigee
- apogee
- timing'),
  ('wijn-op-worteldag', '- Worteldagen
- structuur
- tannines
- mineraliteit
- bewaarpotentieel'),
  ('wijn-op-bladdag', '- Bladdagen
- vegetale
- frisse
- groenheid
- gebalanceerd'),
  ('wijn-op-bloemdag', '- Bloemdagen
- aromatische
- elegantie
- finesse
- mousse'),
  ('wijn-op-vruchtdag', '- Vruchtdagen
- openheid
- harmonie
- fruitexpressie
- tannines'),
  ('eerste-proefexperiment', '- vergelijking
- dagtypes
- patronen
- observeren
- timing'),
  ('temperatuur-en-smaak', '- temperatuur
- waarneming
- balans
- structuur
- timing'),
  ('luchtdruk-en-expressie', '- Luchtdruk
- focus
- openheid
- precisie
- helderheid'),
  ('luchtvochtigheid-en-perceptie', '- Luchtvochtigheid
- aroma
- mondgevoel
- spanning
- waargenomen'),
  ('weersomslag-en-proeven', '- Weersomslagen
- instabiliteit
- expressie
- proefmomenten
- focus'),
  ('dynamic-vs-strategic-advice', '- Dynamic Advice
- Strategic Advice
- dagtype
- drinkvensters
- vooruitblik'),
  ('rode-wijn-per-dagtype', '- tannine
- structuur
- Vruchtdagen
- Worteldagen
- harmonie'),
  ('witte-wijn-per-dagtype', '- finesse
- mineraliteit
- Bloemdagen
- Vruchtdagen
- precisie'),
  ('rose-per-dagtype', '- frisheid
- fruitexpressie
- Vruchtdagen
- Bloemdagen
- timing'),
  ('mousserend-per-dagtype', '- mousse
- finesse
- Bloemdagen
- Vruchtdagen
- mineraliteit'),
  ('port-per-dagtype', '- Port
- Vintage Port
- alcohol
- Vruchtdagen
- harmonie'),
  ('bier-en-biodynamische-dagen', '- Bier
- hop
- bitterheid
- mout
- timing'),
  ('bier-0-0-en-timing', '- Alcoholvrije bieren
- bitterheid
- balans
- alcohol
- timing'),
  ('cocktails-en-dagtypes', '- Cocktails
- bitters
- citrus
- finesse
- dagtype'),
  ('barrel-aged-dranken', '- vatgerijpte dranken
- hout
- oxidatie
- complexiteit
- timing'),
  ('alcoholvrij-en-proefmomenten', '- Alcoholvrije dranken
- Vruchtdagen
- Bloemdagen
- structuur
- timing'),
  ('juiste-fles-juiste-moment', '- timing
- dagtype
- rijpingsfase
- strategie
- context'),
  ('openen-of-wachten', '- wachten
- dagtype
- luchtdruk
- openheid
- Geduld'),
  ('drinkvensters-en-dagtypes', '- drinkvenster
- Vruchtdag
- balans
- dagtypes
- timing'),
  ('voorraadstrategie-topflessen', '- Topflessen
- dagtype
- timing
- pairing
- strategie'),
  ('reserves-lange-termijn', '- reserve
- timing
- rijping
- dagtype
- wijnplanning'),
  ('vertical-tasting-biodynamiek', '- vertical tasting
- rijping
- Vruchtdag
- Worteldag
- timing'),
  ('blindproeven-timing', '- Blindproeven
- timing
- Vruchtdag
- Worteldag
- interpretatie'),
  ('grote-flessen-biodynamiek', '- Magnums
- ontwikkeling
- Vruchtdag
- Worteldag
- timing'),
  ('pairing-dagtypes', '- Food pairing
- Vruchtdag
- Worteldag
- structuur
- timing'),
  ('eigen-biodynamisch-systeem', '- observatiesysteem
- dagtypes
- patronen
- data
- weersomstandigheden'),
  ('perfect-drinkmoment-herkennen', '- drinkvenster
- dagtype
- luchtdruk
- pairing
- context'),
  ('timing-versus-kwaliteit', '- timing
- kwaliteit
- Vruchtdag
- top-Barolo
- ervaring'),
  ('persoonlijke-voorkeurspatronen', '- timing
- Worteldagen
- Vruchtdagen
- voorkeuren
- stijl'),
  ('open-examen-biodynamisch', '- dagtype
- drinkvenster
- pairing
- context
- evaluatie'),
  ('biodynamisch-meesterschap', '- meesterschap
- patronen
- timing
- context
- strateeg')
) as v(lesson_slug, key_concepts),
academy.modules m
join academy.tracks t on t.id = m.track_id
where l.module_id = m.id
  and l.slug = v.lesson_slug
  and t.slug = 'biodynamic';
