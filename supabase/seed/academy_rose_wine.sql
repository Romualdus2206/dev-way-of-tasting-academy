-- Rosé Wine track seed (na 20260625140000_academy_v1_tracks.sql)
-- 1 track · 9 modules · 43 lessons · quizvragen per les

delete from academy.tracks where slug = 'rose-wine';

insert into academy.tracks (slug, title, description, sort_order, published_at)
values (
  'rose-wine',
  'Rosé',
  'Leer rosé van Fundament tot Master: productie, proeven, stijlen, druiven, service, pairing en examen.',
  8,
  now()
);

with t as (select id from academy.tracks where slug = 'rose-wine')
insert into academy.modules (track_id, level, slug, title, sort_order)
select t.id, v.level, v.slug, v.title, v.sort_order
from t
cross join (values
  ('explorer', 'intro-rose-wine', 'Fundament', 1),
  ('explorer', 'productie-rose-wine', 'Productie', 2),
  ('explorer', 'proeven-rose-wine', 'Proeven', 3),
  ('specialist', 'klassieke-stijlen-rose-wine', 'Klassieke stijlen', 4),
  ('specialist', 'druivenrassen-rose-wine', 'Druivenrassen', 5),
  ('specialist', 'stijl-gastronomie-rose-wine', 'Stijl & Gastronomie', 6),
  ('master', 'service-rose-wine', 'Service', 7),
  ('master', 'pairing-rose-wine', 'Pairing & Gastronomie', 8),
  ('master', 'examen-rose-wine', 'Blindproeven & Examen', 9)
) as v(level, slug, title, sort_order);

-- intro-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'intro-rose-wine'
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
    'wat-is-rose',
    'Wat is rosé?',
    'Na deze les kun jij uitleggen wat rosé is, hoe rosé zich onderscheidt van witte en rode wijn en waarom rosé een eigen wijncategorie is.
',
    'Rosé is geen tussenvorm die toevallig ontstaat wanneer rode wijn ''niet af is'' of witte wijn ''een kleurtje meekrijgt'' — het is, op Champagne na waar assemblage van rode en witte wijn wél is toegestaan, een categorie die vrijwel overal wettelijk wordt gemaakt door één bewuste beslissing: hoelang en hoe intensief sap van blauwe druiven in contact staat met de schil, ergens tussen de nul-contactfilosofie van wit en de wekenlange maceratie van rood in. Die positionering tussen twee uitersten maakt rosé niet tot een compromis, maar tot een derde, zelfstandige as met eigen wetmatigheden.

Het DNA van serieuze rosé bestaat uit een cluster van factoren die je stuk voor stuk moet leren herkennen: extractieprecisie — het vermogen om binnen een venster van minuten tot enkele uren exact het beoogde kleur- en aromaprofiel te raken, in plaats van weken de tijd te hebben zoals bij rood; kleur als eerste stijlindicator, niet als kwaliteitsmaat; textuur als onderschatte factor, want het verschil tussen een dunne, wateraflatende rosé en een rosé met werkelijke mondvulling zit zelden in het kleurniveau maar in extractiekeuzes en gistbegeleiding; aromatische finesse, de smalle balans tussen zuiver primair fruit en te groene, onrijpe tonen; en temperatuurgevoeligheid, waarbij het aromatische profiel van rosé sneller instort of juist opengaat bij de verkeerde temperatuur dan bij de meeste rode of volle witte wijn.

Waar rood vaak vertrekt vanuit een open, evoluerend extractietraject — proeven, bijsturen, soms verlengen — vertrekt serieuze roséproductie vanuit een vooraf vastgelegd doelprofiel: de producent bepaalt vaak al vóór de oogst welke kleurdiepte, welk aromaprofiel en welke structuur het eindresultaat moet hebben, en de gehele vinificatie wordt daarnaar teruggerekend. Dat maakt roséproductie in veel opzichten precisiewerk met een kleinere foutmarge dan rode wijn, waar een paar uur extra maceratie zelden het eindresultaat drastisch verandert.

Je gebruikt dit onderscheid elke keer wanneer je een onbekende rosé beoordeelt: vraag niet ''is dit een lichte rode wijn of een getinte witte wijn'', maar ''welk doelprofiel heeft de producent hier precies geraakt, en hoe precies is dat gedaan''. Een bleke rosé is daarbij niet automatisch beter gemaakt dan een dieper gekleurde — kleurdiepte is een stijlkeuze, geen kwaliteitshiërarchie, en wie dat verwart mist het hele punt van deze categorie.


## Pro insight

Wanneer een gast zegt ''rosé is toch gewoon lichte rode wijn'', corrigeer dat vriendelijk maar inhoudelijk: leg uit dat de producent vooraf een specifiek doelprofiel bepaalt en daar met precisiewerk naartoe vinifieert — dat verandert meteen hoe serieus die gast naar het glas in zijn hand kijkt.',
    '- extractieprecisie
- kleur-als-stijlindicator
- structuurhiërarchie
- temperatuurgevoeligheid
- categorie-autonomie
',
    'Rosé behoort tot de oudste wijnstijlen ter wereld. Veel vroege rode wijnen waren eigenlijk licht van kleur.
',
    '- Rosé ontstaat door een bewuste keuze in contactduur tussen sap en schil, tussen de uitersten van wit en rood in
- Het DNA van rosé bestaat uit extractieprecisie, kleur als stijlindicator, textuur, aromatische finesse en temperatuurgevoeligheid
- Serieuze roséproductie vertrekt vanuit een vooraf vastgelegd doelprofiel, niet vanuit open, evoluerende extractie zoals bij rood
- Kleurdiepte is een stijlkeuze, geen kwaliteitsmaat — een bleke rosé is niet per definitie beter gemaakt
- Rosé beoordeel je op precisie ten opzichte van een doelprofiel, niet als afgeleide van rood of wit
',
    '### Opdracht

Zoek drie flessen rosé en vergelijk hun kleur.

### Checklist

- Ik heb drie rosés bekeken
- Ik heb kleurverschillen gezien
- Ik heb het alcoholpercentage bekeken
- Ik heb het land van herkomst bekeken


### Reflectievraag

Zou jij bij een onbekende rosé kunnen benoemen welk doelprofiel de producent waarschijnlijk voor ogen had, in plaats van de wijn simpelweg te vergelijken met een lichte rode of getinte witte wijn?',
    8,
    1
  ),
  (
    'hoe-ontstaat-rose',
    'Hoe ontstaat rosé?',
    'Na deze les kun jij uitleggen hoe rosé geproduceerd wordt.
',
    'Rosé ontstaat in de praktijk via een beperkt aantal productiepaden, en het onderscheid tussen die paden is precies waarom twee rosés met vergelijkbare kleur structureel volledig kunnen verschillen. Directe pers laat de schil vrijwel geen tijd — druiven worden gekneusd en direct geperst, waarbij alleen het kortstondige contact tijdens het kneuzen en persen zelf kleur en aroma aflevert. Saignée laat sap juist wél een gecontroleerde periode, doorgaans enkele uren, op de schil van een rode-wijn-aanzet staan vóór het wordt afgetapt. Beide paden bestaan náást elkaar, met een eigen extractielogica en een eigen stijlsignatuur.

Cruciaal is dat de gekozen schilcontactduur geen toevalligheid is maar een bewuste intentie die de rest van de vinificatie stuurt: hoe korter en preciezer het contact, hoe meer de producent stuurt richting een bleke, aromatisch zuivere stijl; hoe langer en intensiever het contact, hoe meer richting een dieper gekleurde, structuurrijkere stijl met meer tanninegewicht. Die intentionaliteit — wat wil ik bereiken, en welke contactduur past daarbij — is het eerste beslissingspunt van elke rosé, nog vóór er over gisttemperatuur of vatgebruik wordt nagedacht.

Een derde, wettelijk veel beperktere route is assemblage: het mengen van afzonderlijk gevinifieerde rode en witte wijn. Binnen de Europese Unie is dit voor stille wijn vrijwel overal verboden — met Champagne als bekende uitzondering, waar assemblage juist een geaccepteerde, gecontroleerde techniek is voor mousserende rosé. Dat verschil in regelgeving is geen curiositeit maar een aanwijzing dat directe pers en saignée bij stille rosé als de enige legitieme, precisiegedreven wegen worden beschouwd, terwijl assemblage als een aparte, apart gereguleerde categorie geldt.

Je gebruikt dit als eerste diagnosevraag bij elke nieuwe rosé: welk kleuropbouw-mechanisme ligt hieraan ten grondslag — kort en precies, of langer en intensiever — en past de kleur die je in het glas ziet bij die vermoedelijke aanpak? Wijkt de structuur af van wat de kleur suggereert, dan is dat een signaal om dieper naar de productiemethode te vragen in plaats van op kleur alleen te varen.


## Pro insight

Leg aan gasten die verrast zijn dat ''rode en witte wijn mengen'' bij stille rosé niet mag uit dat dit net het bewijs is dat serieuze rosé via precieze schilcontactkeuzes wordt gemaakt, niet via een simpele kleurtruc — dat verhaal verhoogt meteen de perceptie van vakmanschap.',
    '- schilcontactduur
- extractie-intentionaliteit
- kleuropbouwmechanisme
- assemblageverbod
- productiemethodiek
',
    'Soms is slechts 2 uur schilcontact al genoeg voor kleur.
',
    '- Directe pers en saignée zijn de twee dominante productiepaden voor stille rosé, elk met een eigen extractielogica
- De gekozen schilcontactduur is een bewuste intentie die de rest van de vinificatie stuurt
- Kortere, precieze contactduur stuurt richting bleker en aromatisch zuiverder; langere richting dieper en structuurrijker
- Assemblage van rode en witte wijn is voor stille wijn binnen de EU vrijwel overal verboden, behalve voor Champagne
- Kleuropbouwmechanisme is de eerste diagnosevraag bij het beoordelen van een onbekende rosé
',
    '### Opdracht

Bekijk online drie roséwijnen en noteer hun kleurintensiteit.

### Checklist

- Ik heb drie kleuren genoteerd
- Ik heb verschillen gezien
- Ik heb over extractie nagedacht


### Reflectievraag

Zou jij bij een onbekende rosé, alleen op basis van kleur en structuur in het glas, durven inschatten of directe pers of saignée aan de basis lag?',
    8,
    2
  ),
  (
    'waarom-is-rose-uniek',
    'Waarom is rosé uniek?',
    'Na deze les kun jij uitleggen waarom rosé een unieke wijncategorie is.
',
    'Rosé is uniek omdat het, in tegenstelling tot wat de naam en de vaak lage prijsklasse doen vermoeden, op geen enkele as simpelweg ''minder'' is dan rood of wit — het is een categorie met een eigen specialisatie die geen van beide andere categorieën evenaart. Waar rood zijn identiteit ontleent aan tannine als structuuras en wit aan zuur als ruggengraat, ontleent rosé de zijne aan een combinatie die nergens anders zo geconcentreerd voorkomt: aromatische finesse gecombineerd met een textuur die, mits goed gemaakt, spanning geeft zonder de gewichtigheid van rood.

Die aromatische finesse is een smal pad: te weinig extractie geeft een leeg, eendimensionaal profiel; te veel of te grof extraheren duwt de wijn richting groene, vegetale of juist te tanninerijke tonen die de aromatische zuiverheid breken. Rosé opereert daarmee voortdurend op de rand tussen te weinig en te veel, een precisie-eis die rood — met zijn veel bredere extractievenster van dagen tot weken — zelden op dezelfde schaal kent.

Diezelfde precisie maakt rosé buitengewoon gevoelig voor temperatuur: serveer je hem te koud, dan sluit het aromaprofiel volledig af en proef je enkel zuur en alcohol; serveer je hem te warm, dan valt de textuurspanning weg en oogt de wijn plots log en ongestructureerd. Die smalle temperatuurband is scherper dan bij de meeste rode wijn en vergelijkbaar kritisch als bij de meest verfijnde witte stijlen — een kenmerk dat rosé''s eigen categorie-identiteit onderstreept in plaats van hem dichter bij één van de twee andere categorieën te plaatsen.

Tot slot is rosé''s gastronomische breedte ongeëvenaard: dezelfde fles kan, mits juist gekozen qua structuur en intensiteit, naast een lichte vissalade én naast een stevig gekruid gerecht functioneren — een flexibiliteit die noch een tanninerijke rode wijn noch een zeer scherp-zure witte wijn in dezelfde mate biedt. Je gebruikt dit inzicht wanneer je een gast overtuigt van rosé bij een menu met wisselende gangen: niet als compromis tussen rood en wit, maar als een categorie die op eigen kracht een breder gastronomisch bereik dekt.


## Pro insight

Presenteer rosé bij een wisselend menu nooit als ''veilige middenweg'' maar als bewuste keuze voor gastronomische flexibiliteit — die framing verhoogt de gepercipieerde waarde en voorkomt dat gasten rosé als compromis in plaats van specialisatie zien.',
    '- aromatische finesse
- texturele onderscheiding
- gastronomische flexibiliteit
- temperatuurkritiekpunt
- structuurbescheidenheid
',
    'Tavel uit Zuid-Frankrijk wordt vaak beschouwd als één van de meest serieuze roséstijlen.
',
    '- Rosé''s identiteit combineert aromatische finesse met textuurspanning, een combinatie die geen andere categorie op dezelfde schaal biedt
- Aromatische aromatische finesse balanceert op een smal pad tussen te weinig en te veel extractie
- Rosé is extreem temperatuurgevoelig: te koud sluit het aroma af, te warm laat de textuurspanning wegvallen
- Die smalle temperatuurband is scherper dan bij rood en vergelijkbaar kritisch als bij verfijnde witte stijlen
- Rosé''s gastronomische flexibiliteit overtreft die van tanninerijke rode en scherp-zure witte wijn
',
    '### Opdracht

Bedenk drie gerechten waar rosé goed bij zou passen.

### Checklist

- Ik heb drie gerechten bedacht
- Ik heb de stijl gekoppeld
- Ik heb over zuurspanning nagedacht


### Reflectievraag

Kun jij een gerecht bedenken waarbij jij normaal automatisch naar rood of wit grijpt, maar waarbij de gastronomische breedte van rosé eigenlijk een betere match zou opleveren?',
    8,
    3
  ),
  (
    'geschiedenis-van-rose',
    'Geschiedenis van rosé',
    'Na deze les begrijp jij de historische ontwikkeling van rosé.
',
    'De geschiedenis van rosé wordt vaak verkeerd verteld als een eenentwintigste-eeuwse marketinguitvinding, terwijl kort schilcontact juist tot de oudste vormen van wijnbereiding behoort. Voordat gecontroleerde, langdurige maceratietechnieken voor rode wijn zich ontwikkelden, leverden veel antieke persmethoden — waarbij sap en schil elkaar noodgedwongen slechts kort raakten — van nature een bleke tot medium gekleurde wijn op. In die zin is rosé niet de jongste categorie van de drie, maar eerder een directe erfgenaam van vroege, minimaal-gecontroleerde wijnbereiding.

De Provence bouwde vanaf de twintigste eeuw de reputatie op die vandaag met rosé wordt geassocieerd: een bleke, droge, aromatisch zuivere stijl die zich via strenge productieprotocollen — vroege oogst, korte en precieze schilcontactvensters, reductieve vinificatie ter bescherming van de aromatiek — onderscheidde van de zoetere, minder precieze rosé die elders lange tijd de norm was. Die provençaalse stijlcodering werd zo dominant dat ''rosé'' voor veel consumenten wereldwijd feitelijk ''Provence-stijl'' betekent, ook al bestaan er evenveel andere, even legitieme stijltradities.

Vanaf de jaren 2000 en versneld na de opkomst van commercieel succesvolle Provence-cuvées veranderde het imago van rosé fundamenteel: van een goedkope, weinig serieuze ''poolside wine'' naar een categorie waarin ook terroir-gedreven, bewaarbare en prijzig gepositioneerde flessen hun plaats opeisten. Die imago-evolutie liep parallel aan een technische evolutie — striktere temperatuurcontrole, betere perstechniek, meer aandacht voor lees-contact — die de kwaliteitsbovenkant van de categorie structureel optilde.

Je gebruikt deze geschiedenis om het vooroordeel ''rosé is geen serieuze wijn'' direct te ontkrachten: leg uit dat kort schilcontact tot de oudste wijnbereidingstechnieken behoort, dat de provençaalse stijlcodering een bewust opgebouwde precisiestandaard is, en dat het huidige imago van premium rosé het resultaat is van decennia technische verfijning — niet van een marketingtruc zonder inhoud.


## Pro insight

Ontkracht het vooroordeel ''rosé is geen serieuze wijn'' met de geschiedenis zelf: leg uit dat kort schilcontact ouder is dan langdurige rode-wijnmaceratie — dat argument landt vaak beter dan een verwijzing naar prijs of imago alleen.',
    '- imago-evolutie
- provençaalse stijlcodering
- terroirexpressie
- bewaarpotentieel
- historische extractietraditie
',
    'Provence is verantwoordelijk voor een groot deel van de wereldwijde premium roséproductie.
',
    '- Kort schilcontact behoort tot de oudste vormen van wijnbereiding, niet tot een recente uitvinding
- De Provence bouwde vanaf de twintigste eeuw een bleke, droge, precisiegedreven stijlcodering op
- Die provençaalse stijlcodering werd zo dominant dat ze wereldwijd als synoniem voor ''rosé'' geldt
- Sinds de jaren 2000 verschoof het imago van goedkope ''poolside wine'' naar terroir-gedreven, bewaarbare rosé
- De kwaliteitsevolutie liep parallel aan technische vooruitgang in temperatuurcontrole en perstechniek
',
    '### Opdracht

Zoek drie roségebieden op.

### Checklist

- Ik heb drie gebieden gevonden
- Ik heb hun klimaat bekeken
- Ik heb hun stijl bekeken


### Reflectievraag

Zou jij een gast die rosé afdoet als ''goedkope zomerwijn'' kunnen overtuigen met de historische en technische ontwikkeling van de categorie, zonder terug te vallen op prijs als argument?',
    8,
    4
  ),
  (
    'belangrijkste-rosestijlen',
    'Belangrijkste roséstijlen',
    'Na deze les herken jij de belangrijkste stijlen van rosé.
',
    'Het stijlspectrum van rosé is breder dan bij vrijwel elke andere wijncategorie, en die breedte volgt direct uit de vrijheidsgraad die extractieprecisie toelaat: elke kleurdiepte tussen bijna-wit en bijna-rood is technisch haalbaar, en producenten over de hele wereld hebben binnen dat spectrum eigen regionale ankerpunten gevestigd. De provençaalse stijl bezet het bleke, aromatisch zuivere uiteinde, met nadruk op zuurspanning als ruggengraat en een minimale, bijna onzichtbare structuur.

Aan de andere kant van het spectrum staan tanninedragende stijlen zoals Tavel in de Rhône en Bandol in de Provence zelf, waar langere schilcontacttijd en het gebruik van structuurrijke rassen zoals Mourvèdre resulteren in rosé met merkbare tannine, meer kleurdiepte en aanzienlijk bewaarpotentieel — stijlen die qua mondgevoel dichter bij een lichte rode wijn liggen zonder daarmee hun rosé-identiteit te verliezen. Italiaanse Cerasuolo d''Abruzzo en Spaanse rosados nemen vaak een middenpositie in, met meer kleurdiepte en fruitgewicht dan Provence maar minder tanninegewicht dan Tavel of Bandol.

Naast stille rosé bestaat een volledig eigen tak binnen mousserende wijn: rosé Champagne en andere mousserende roséstijlen, waar kleur ontstaat via ofwel korte maceratie ofwel — uniek voor deze categorie — assemblage van rode en witte basiswijnen. Deze mousserende roséproductie voegt een derde structuurlaag toe (koolzuur en de bijbehorende druk- en textuursensatie) die bij stille rosé volledig ontbreekt, en daarmee een eigen beoordelingskader vereist.

Je gebruikt dit spectrum als kader om kleurdiepte, structuur en herkomst samen te lezen in plaats van los van elkaar: zie je een dieper gekleurde, tannine-voelbare rosé, dan is Tavel, Bandol of een vergelijkbare stijl waarschijnlijker dan Provence; die combinatie van signalen werkt als betrouwbare blindproefmarker, veel sterker dan kleur alleen.


## Pro insight

Gebruik het stijlspectrum actief in je advies: vraagt een gast om ''iets anders dan Provence'', stuur dan gericht richting Tavel of Bandol in plaats van simpelweg een andere bleke rosé aan te bieden — dat toont dat je het spectrum begrijpt in plaats van alleen het etiket ''rosé'' te kennen.',
    '- kleurspectrum
- tanninedragende stijlen
- stijlspreiding
- mousserende roséproductie
- blindproefmarker
',
    'Niet alle rosé is bedoeld om ijskoud te drinken.
',
    '- Het stijlspectrum van rosé loopt van bijna-wit tot bijna-rood, breder dan bij de meeste andere categorieën
- Provence bezet het bleke, aromatisch zuivere uiteinde met minimale structuur
- Tavel en Bandol vertegenwoordigen tanninedragende stijlen met meer kleurdiepte en bewaarpotentieel
- Cerasuolo d''Abruzzo en Spaanse rosados nemen vaak een middenpositie in binnen dat spectrum
- Mousserende roséproductie voegt via koolzuur een eigen structuurlaag toe die bij stille rosé ontbreekt
',
    '### Opdracht

Kies welke roséstijl jij het liefst zou drinken.

### Checklist

- Ik heb de stijlen bekeken
- Ik heb mijn voorkeur gekozen
- Ik kan uitleggen waarom


### Reflectievraag

Zou jij bij een blind geproefde, dieper gekleurde en merkbaar tannine-voelbare rosé durven inschatten dat dit eerder een Tavel of Bandol is dan een Provence-stijl, en welk kenmerk gebruik je daarvoor als eerste?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- productie-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'productie-rose-wine'
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
    'direct-press-methode',
    'Direct press methode',
    'Na deze les kun jij uitleggen hoe de direct press methode werkt en welke stijl rosé dit meestal oplevert.
',
    'Directe pers is de meest precisiegedreven productiemethode binnen rosé, precies omdat er geen aparte weekfase bestaat om fouten te corrigeren: de druiven worden gekneusd en vrijwel onmiddellijk geperst, waardoor kleur en aroma uitsluitend ontstaan tijdens het kortstondige contact dat het kneuzen en persen zelf oplevert. Elke beslissing — perssnelheid, persdruk, temperatuur van de druiven bij aankomst — telt hier zwaarder door dan bij enige andere roséproductiemethode.

Perscyclusprecisie is daarbij de kern van het vak: een pneumatische pers die te snel of te hard perst, extraheert meer kleur en tannine dan bedoeld en duwt de stijl ongewild richting een dieper, minder verfijnd profiel; een te zachte, te trage cyclus levert juist onvoldoende kleur en textuur op. Producenten die op het bleke, aromatisch zuivere uiteinde van het spectrum mikken, werken daarom vaak met lage persdruk, korte cycli en een strikt temperatuurvenster net boven het vriespunt van het sap, om zowel oxidatie als ongewenste extra extractie te voorkomen.

Net als bij witte wijn ontstaan bij het persen meerdere fracties, en de drupvrijloopfractie — het sap dat vrijloopt vóór er daadwerkelijk druk wordt toegepast — geldt bij directe-persrosé als de meest gewilde: het is het bleekste, aromatisch zuiverste deel, met het minste tannine en de fijnste textuur. Latere, onder hogere druk geperste fracties krijgen meer kleur en structuur mee maar ook meer risico op grovere tannine en bittere randjes, wat verklaart waarom veel topcuvées vrijwel uitsluitend uit de vrijloopfractie worden samengesteld.

Je gebruikt deze kennis om de precisie achter een bleke, directe-persrosé te herkennen: proef je een wijn met opvallend zuivere, ongebroken aromatiek en een gladde, spanningsrijke textuur zonder enige tanninehardheid, dan wijst dat op een strak beheerste perscyclus met een hoog aandeel vrijloopsap — precisiewerk dat je makkelijk over het hoofd ziet als je alleen naar de lichte kleur kijkt.


## Pro insight

Leg aan gasten die vragen waarom een bleke rosé duurder kan zijn dan een dieper gekleurde uit dat dit vaak samenhangt met een strikt beheerste perscyclus en een hoog aandeel dure vrijloopfractie, niet met minder werk aan de wijn.',
    '- direct-press-precisie
- perscyclusprecisie
- drupvrijloopfractie
- temperatuurvenster
- oxidatiepreventie
',
    'Veel Provence-rosés hebben minder dan twee uur schilcontact.
',
    '- Directe pers kent geen aparte weekfase; kleur en aroma ontstaan uitsluitend tijdens het kneuzen en persen zelf
- Perscyclusprecisie (druk, snelheid, temperatuur) bepaalt sterker dan bij elke andere methode het eindresultaat
- Een strikt temperatuurvenster net boven het vriespunt voorkomt oxidatie en ongewenste extra extractie
- De drupvrijloopfractie levert het bleekste, aromatisch zuiverste sap met het minste tannine
- Topcuvées worden vaak vrijwel uitsluitend uit de vrijloopfractie samengesteld
',
    '### Opdracht

Bekijk drie Provence rosés en vergelijk de kleur.

### Checklist

- Ik heb drie kleuren bekeken
- Ik heb de lichtste gekozen
- Ik herken de stijl


### Reflectievraag

Zou jij bij een bleke, aromatisch zuivere directe-persrosé kunnen benoemen welke perskeuzes waarschijnlijk zijn gemaakt om die zuiverheid te bereiken?',
    8,
    1
  ),
  (
    'saignee-methode',
    'Saignée methode',
    'Na deze les begrijp jij hoe de saignée methode werkt.
',
    'Saignée-extractie werkt volgens een andere logica dan directe pers: hier krijgt sap wél een gecontroleerde periode — doorgaans enkele uren tot een korte nacht — contact met de schil van een most die eigenlijk bedoeld is voor rode wijn, vóórdat een deel ervan wordt afgetapt. Dat aftappen dient historisch een dubbel doel: het concentreert de achterblijvende rode most, doordat een groter aandeel schil overblijft ten opzichte van het resterende volume sap, en levert tegelijk een apart product op — de afgetapte rosé.

Dat dubbeldoelvinificatie-uitgangspunt verklaart waarom saignée bij sommige critici een minder gunstig imago heeft: wanneer de rosé louter een bijproduct is van de wens om de rode wijn te concentreren, krijgt de rosé zelf weinig gerichte aandacht en kan het resultaat onevenwichtig of te grof geëxtraheerd uitpakken. Bij intentionele saignée ligt dat compleet anders: de producent plant vooraf een specifiek volume voor roséproductie in, bepaalt bewust het gewenste extractiemoment en behandelt de afgetapte most vervolgens met dezelfde precisie als een directe-persrosé.

De extractie-intensiteit bij saignée ligt door het langere schilcontact doorgaans hoger dan bij directe pers, wat resulteert in meer kleurdiepteopbouw, meer tanninegewicht en vaak een rijker, meer body-gedreven fruitprofiel. Dat maakt saignée bij uitstek geschikt voor de structuurrijkere stijlen binnen het roséspectrum — denk aan sommige Tavel- en Amerikaanse rosé-stijlen — terwijl het minder past bij het bleke, aromatisch zuivere Provence-uiteinde.

Je gebruikt dit onderscheid om verantwoord door te vragen bij een saignée-rosé: is dit een bewust ingepland, intentioneel volume, of een bijproduct van roodwijnconcentratie? Proef je een saignée-rosé met opvallend veel kleurdiepte en tanninegewicht maar weinig aromatische finesse, dan wijst dat eerder op het bijproductmodel; proef je een evenwichtig, doelbewust profiel, dan is intentionele saignée waarschijnlijker.


## Pro insight

Vraag bij een saignée-rosé altijd door of het een intentioneel geproduceerd volume betreft of een bijproduct van roodwijnconcentratie — dat verhaal helpt je uitleggen waarom twee saignée-rosés in kwaliteit sterk uiteen kunnen lopen.',
    '- saignée-extractie
- bijproduct-versus-intentioneel
- extractie-intensiteit
- dubbeldoelvinificatie
- kleurdiepteopbouw
',
    'Saignée verhoogt tegelijk ook de concentratie van de rode wijn die achterblijft.
',
    '- Saignée laat sap enkele uren op de schil van een rode-wijn-aanzet staan vóór het wordt afgetapt
- Het aftappen dient een dubbel doel: concentratie van de achterblijvende rode most en productie van rosé
- Bijproduct-saignée krijgt weinig gerichte aandacht, intentionele saignée wordt even precies behandeld als directe pers
- Saignée geeft door het langere schilcontact meer kleurdiepte en tanninegewicht dan directe pers
- Extractie-intensiteit en aandacht voor het proces onderscheiden bijproduct- van intentionele saignée
',
    '### Opdracht

Vergelijk online een Provence rosé met een saignée rosé.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij bij een saignée-rosé, op basis van kleurdiepte, tanninegewicht en aromatische finesse, durven inschatten of het om een intentioneel of een bijproductvolume gaat?',
    8,
    2
  ),
  (
    'kleurcontrole',
    'Kleurcontrole',
    'Na deze les begrijp jij hoe wijnmakers kleur sturen.
',
    'Kleurcontrole is bij rosé geen esthetische bijzaak maar een technisch vak op zich, omdat de markt kleur historisch heeft leren lezen als kwaliteitssignaal terwijl die koppeling technisch onjuist is. Kleurintensiteit wordt in de praktijk gemeten via instrumenten die de optische dichtheid van het sap of de wijn vastleggen, waarmee producenten objectief kunnen sturen naar een specifiek doelprofiel in plaats van op het oog te werken — essentieel wanneer je jaar na jaar dezelfde stijl wilt reproduceren.

De afgelopen decennia ontstond wat je marketinggedreven paleur kunt noemen: de aanname, vooral gevoed door het commerciële succes van zeer bleke Provence-stijlen, dat blekere rosé automatisch beter of verfijnder is. Die aanname klopt technisch niet — kleurdiepte zegt op zichzelf niets over extractieprecisie, aromatische zuiverheid of textuurkwaliteit. Een matig gemaakte, te bleek getrokken rosé kan evenveel technische gebreken vertonen als een matig gemaakte, dieper gekleurde rosé; de kleur verhult het probleem simpelweg beter voor het blote oog.

Beschermende vinificatie speelt een aparte, wel degelijk kwaliteitsrelevante rol: inert gas gebruiken tijdens persen en transport, lage temperaturen aanhouden en zuurstofcontact minimaliseren voorkomt voortijdige bruinverkleuring en behoudt de beoogde kleurtint langer stabiel. Dat is een kwaliteitsfactor, maar een andere dan kleurdiepte zelf — het gaat om kleurstabiliteit en -zuiverheid, niet om hoe bleek of diep de kleur is.

Je gebruikt deze kleur-kwaliteitloskoppeling actief in je advies: leer gasten dat kleurdiepte een stijlsignaal is, geen kwaliteitsmeter, en dat de werkelijke kwaliteitsindicatoren — aromatische zuiverheid, textuurspanning, afdronklengte — onafhankelijk van kleurdiepte beoordeeld moeten worden. Dat voorkomt dat een gast een technisch uitstekende, iets dieper gekleurde rosé afwijst puur op basis van tint.


## Pro insight

Corrigeer gasten die een rosé afwijzen ''omdat hij te donker is'' met de kleur-kwaliteitloskoppeling: leg uit dat kleurdiepte een stijlkeuze is en stuur hun aandacht naar aromatische zuiverheid en textuur als de echte kwaliteitsmaatstaven.',
    '- kleurintensiteit
- kleurmeting
- marketinggedreven paleur
- beschermende vinificatie
- kleur-kwaliteitloskoppeling
',
    'Grenache geeft vaak lichtere rosé dan Syrah.
',
    '- Kleurintensiteit wordt objectief gemeten en gestuurd om een reproduceerbaar doelprofiel te bereiken
- Marketinggedreven paleur creëerde de onterechte aanname dat blekere rosé automatisch beter is
- Kleurdiepte zegt op zichzelf niets over extractieprecisie, aromatische zuiverheid of textuurkwaliteit
- Beschermende vinificatie behoudt kleurstabiliteit en -zuiverheid, wat losstaat van kleurdiepte zelf
- Echte kwaliteitsindicatoren zijn aromatische zuiverheid, textuurspanning en afdronklengte, niet kleurtint
',
    '### Opdracht

Zoek vijf rosés en zet ze op volgorde van licht naar donker.

### Checklist

- Ik heb minstens vijf concrete punten genoteerd


### Reflectievraag

Zou jij bij een gast die uitsluitend op kleur selecteert, kunnen uitleggen welke drie kenmerken eigenlijk bepalender zijn voor kwaliteit dan kleurdiepte?',
    8,
    3
  ),
  (
    'fermentatie-van-rose',
    'Fermentatie van rosé',
    'Na deze les begrijp jij hoe vergisting roséstijl beïnvloedt.
',
    'Fermentatie van rosé volgt een logica die dichter bij witte wijn ligt dan bij rood, maar met een eigen precisie-eis die uit de fragiliteit van het aromaprofiel voortkomt. Reductieve vinificatie — gisten met zo min mogelijk zuurstofcontact, vaak in inox onder inert gas — is bij het merendeel van de moderne, aromatisch gedreven roséstijlen de standaard, precies omdat rosé''s aromatische finesse sneller aangetast raakt door oxidatie dan het robuustere aromaprofiel van veel rode wijn.

Temperatuurgestuurde gisting is daarbij onmisbaar: lage gisttemperaturen, vaak tussen veertien en achttien graden, vertragen het gistproces bewust om vluchtige, primaire aromastoffen te behouden die bij hogere temperatuur zouden verdampen of zich zouden omzetten in minder gewenste verbindingen. Die temperatuurcontrole vraagt om gekoelde tanks en nauwkeurige monitoring, een investering die direct samenhangt met de aromatische precisie die de stijl vereist.

Gistkeuze-aromabehoud speelt een tweede, vaak onderschatte rol: bepaalde gistrassen zijn geselecteerd om specifieke aromaprecursoren — voorlopers van aromastoffen die pas tijdens de gisting hun uiteindelijke vorm krijgen — efficiënter vrij te maken, wat een directer, zuiverder fruitprofiel oplevert dan een neutrale of verkeerd gekozen giststam. Producenten die op aromatische precisie mikken, testen vaak meerdere giststammen per partij vóór ze een keuze definitief maken.

Aan het andere uiterste van de stijlas kiezen sommige producenten, vooral bij de meer gastronomisch georiënteerde rosés, voor textuurontwikkeling-via-lees: langere lees-contact en soms bâtonnage-bij-rosé (het periodiek opwerven van de gistresten) voegen mondvulling en een zachtere textuur toe, ten koste van een deel van de primaire fruitscherpte. Je gebruikt dit onderscheid om een rosé te plaatsen: een strak, reductief gevinifieerde stijl met veel primair fruit wijst op de aromatisch gedreven aanpak; een rondere, meer gestructureerde textuur met minder uitgesproken primair fruit wijst eerder op bewuste lees-gestuurde textuurontwikkeling.


## Pro insight

Leg aan een gast die een ''rondere'' rosé zoekt uit dat dit vaak wijst op bewuste lees-gestuurde textuurontwikkeling in plaats van simpelweg een andere druif, en stuur je aanbeveling daarop bij.',
    '- reductieve vinificatie
- temperatuurgestuurde gisting
- gistkeuze-aromabehoud
- textuurontwikkeling-via-lees
- bâtonnage-bij-rosé
',
    'Koel vergisten is één van de belangrijkste technieken voor moderne frisse rosé.
',
    '- Reductieve vinificatie met minimaal zuurstofcontact is standaard bij moderne, aromatisch gedreven roséstijlen
- Temperatuurgestuurde gisting bij lage temperaturen behoudt vluchtige, primaire aromastoffen
- Gistkeuze-aromabehoud bepaalt hoe efficiënt aromaprecursoren worden omgezet in primair fruit
- Textuurontwikkeling-via-lees en bâtonnage-bij-rosé voegen mondvulling toe ten koste van fruitscherpte
- Het onderscheid tussen strak-reductief en lees-gestuurd verklaart grote stijlverschillen binnen rosé
',
    '### Opdracht

Vergelijk aroma''s van een jonge rosé en een rijpere rosé.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij bij een rosé met opvallend veel mondvulling en een zachtere textuur durven inschatten of dat van lees-contact komt, en welk ander kenmerk zou je daarvoor checken?',
    8,
    4
  ),
  (
    'frisse-vs-gastronomische-rose',
    'Frisse stijl vs gastronomische stijl',
    'Na deze les kun jij het verschil uitleggen tussen lichte en gastronomische rosé.
',
    'De frisse stijl en de gastronomische stijl vertegenwoordigen binnen rosé twee uiteinden van eenzelfde spectrum, en het verwarren van die twee is een van de meest voorkomende fouten in advisering. De frisse stijl — het bleke, direct-perse, reductief gevinifieerde profiel — is ontworpen voor onmiddellijke consumptie: aperitief, terras, licht zomers eten, waarbij textuurspanning en aromatische zuiverheid de hoofdrol spelen en bewaarpotentieel welbewust beperkt blijft.

De gastronomische stijl daarentegen — vaak afkomstig uit Tavel, Bandol of vergelijkbare structuurrijke tradities, soms met lees-contact of zelfs beperkt vatgebruik — bouwt bewust meer body, tanninegewicht en concentratie op, wat de gastronomische inzetbaarheid vergroot: deze stijlen kunnen naast stevigere gerechten, gekruide keukens of zelfs sommige lichte vleesgerechten functioneren zonder overweldigd te raken, iets waartoe de frisse stijl zelden in staat is.

Die twee stijlen vragen bovendien om een andere servicetemperatuurdifferentiatie: de frisse stijl presteert het best rond acht tot tien graden, waar textuurspanning en zuiverheid maximaal tot hun recht komen, terwijl de gastronomische stijl vaak beter functioneert rond tien tot dertien graden — te koud geserveerd verdwijnt juist de structuur en complexiteit die deze stijl onderscheidt van de frisse variant. Ook het bewaarpotentieelverschil is aanzienlijk: waar de frisse stijl doorgaans binnen een tot twee jaar op zijn best is, kan de gastronomische stijl, afhankelijk van structuur en herkomst, meerdere jaren positief evolueren.

Je gebruikt dit onderscheid actief in stijlverwachtingsmanagement: leg een gast die gewend is aan de frisse stijl vooraf uit dat een gastronomische rosé structuurrijker, minder uitgesproken fris en soms zelfs licht tanninehoudend aanvoelt — zonder die context loopt de gast het risico de gastronomische stijl als ''minder rosé'' te ervaren, terwijl het juist een bewuste, andere specialisatie binnen dezelfde categorie betreft.


## Pro insight

Beheer verwachtingen expliciet wanneer je een gastronomische rosé serveert aan een gast die de frisse stijl gewend is: kondig vooraf aan dat deze stijl structuurrijker en minder uitgesproken fris aanvoelt, zodat dat niet als teleurstelling maar als bewuste ontdekking landt.',
    '- textuurspanning
- gastronomische inzetbaarheid
- servicetemperatuurdifferentiatie
- bewaarpotentieelverschil
- stijlverwachtingsmanagement
',
    'Sommige top Bandol rosés kunnen jaren rijpen.
',
    '- De frisse stijl is ontworpen voor onmiddellijke consumptie met nadruk op textuurspanning en aromatische zuiverheid
- De gastronomische stijl bouwt bewust meer body en concentratie op voor bredere gastronomische inzetbaarheid
- Beide stijlen vragen om een andere servicetemperatuur: acht tot tien graden versus tien tot dertien graden
- Het bewaarpotentieelverschil is groot: één à twee jaar voor de frisse stijl, meerdere jaren voor de gastronomische stijl
- Stijlverwachtingsmanagement voorkomt dat gasten de gastronomische stijl ten onrechte als ''minder rosé'' ervaren
',
    '### Opdracht

Kies één gerecht en bepaal of frisse of gastronomische rosé beter past.

### Checklist

- Ik heb het gerecht gekozen
- Ik heb de stijl bepaald
- Ik kan mijn keuze uitleggen


### Reflectievraag

Zou jij bij het serveren van een gastronomische rosé aan een gast die enkel de frisse stijl kent, vooraf de juiste verwachtingen weten te scheppen zonder de wijn te moeten verdedigen?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- proeven-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'proeven-rose-wine'
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
    'hoe-proef-je-rose',
    'Hoe proef je rosé?',
    'Na deze les kun jij rosé systematisch proeven volgens een vaste structuur.
',
    'Het proefprotocol voor rosé volgt dezelfde basisvolgorde als bij elke wijn — visueel, neus, mond, conclusie — maar rosé vraagt een eigen leesstrategie omdat de categorie tussen wit en rood in staat zonder de vaste ankers van beide: er is meestal geen dominante tannine-as zoals bij rood en geen dominante schaal van citrus-tot-tropisch zoals bij wit. Wie het protocol klakkeloos overneemt van rood of wit, mist precies de signalen die rosé specifiek maken.

Visueel is bij rosé het meest informatiedichte moment van de hele proef: de tint (bleek zalm tot cerise tot lichte ui-schil-oranje) en de intensiteit verraden direct de productiemethode — korte huidcontacttijd bij directe pers versus langere maceratie of saignée — nog vóór je iets geroken hebt. Werk daarom altijd tegen een witte achtergrond met consistent licht, en beschrijf tint en intensiteit als twee aparte variabelen in plaats van één vage kleurindruk.

Bij de neus ruik je bij voorkeur direct na het inschenken, zonder lang te wachten: de meeste rosé is jong, ongehout en primair fruitgedreven, waardoor de meest bepalende aroma''s vluchtig zijn en snel verdampen. Swirlen blijft nuttig om esters te openen, maar het tweefasen-ruiken dat bij rood essentieel is (om tanninegebonden aroma''s los te maken) is bij rosé minder kritiek omdat er simpelweg minder gebonden aromastof aanwezig is.

In de mond verschuift de volgorde ten opzichte van rood: eerst zuur (de dominante structuuras bij vrijwel elke rosé), dan een lichte fenolische grip als die aanwezig is (afkomstig van langere schilcontacttijd, nooit vanzelfsprekend zoals bij rood), dan alcohol, dan body, en pas daarna lengte en conclusie. Behandel die fenolische grip nadrukkelijk als optioneel signaal, niet als vaste as — anders ga je onterecht op zoek naar tannine die er simpelweg niet is.


## Pro insight

Noteer tint en intensiteit als twee losse observaties vóórdat je aan de neus begint — die twee variabelen alleen al geven je een eerste, onderbouwde hypothese over de productiemethode.',
    '- roséproefprotocol
- tint-intensiteit-scheiding
- primair-aromavolatiliteit
- optionele-fenolische-fenolische grip
- productiehypothese-vooraf
',
    'Veel beginners onderschatten rosé omdat de aroma''s vaak fijner en subtieler zijn.
',
    '- Protocol blijft visueel, neus, mond, conclusie — rosé heeft geen vaste tannine- of intensiteitsas zoals rood of wit
- Tint en intensiteit zijn twee aparte variabelen die samen de productiemethode verraden
- Ruik direct na inschenken: primaire aroma''s bij jonge, ongehoute rosé zijn vluchtig
- Mondvolgorde: eerst zuur, dan optionele fenolische grip, dan alcohol, dan body
- Behandel fenolische grip als uitzondering, niet als vaste structuuras zoals tannine bij rood
',
    '### Opdracht

Open een rosé en proef hem in vier stappen.

### Checklist

- Ik heb gekeken
- Ik heb geroken
- Ik heb geproefd
- Ik heb een conclusie gemaakt


### Reflectievraag

Betrap jij jezelf er weleens op dat je bij rosé automatisch naar tannine zoekt zoals bij rood, of naar een fruitschaal zoals bij wit — in plaats van de categorie op haar eigen merites te proeven?',
    8,
    1
  ),
  (
    'kleur-analyseren',
    'Kleur analyseren',
    'Na deze les kun jij kleur gebruiken om stijl en extractie te herkennen.
',
    'Kleur is bij rosé het meest diagnostische signaal van het hele glas, maar ook het signaal dat het makkelijkst wordt gemanipuleerd — en dat onderscheid moet je als specialist scherp maken. Lees kleur daarom altijd als twee aparte variabelen: tint (de kleurtoon zelf, van bleek zalm via framboos naar cerise en zelfs licht ui-schil-oranje) en intensiteit (hoe diep of licht die tint is), in plaats van als één vage indruk.

Tint en intensiteit correleren sterk met productiemethode: directe pers met minimale huidcontacttijd geeft vrijwel altijd de bleekste, meest zalmkleurige resultaten, terwijl saignée (afgetapt sap van een rode-wijnvergisting) doorgaans een dieper, roder resultaat oplevert omdat het sap al langer met de schillen in contact is geweest vóór aftapping. Blending van witte en rode wijn — buiten Champagne wettelijk verboden voor stille rosé in de EU, maar elders wél toegestaan — kan een vergelijkbaar dieper resultaat geven zonder de bijbehorende schilcontact-aromatiek.

Belangrijk: extreme bleekheid is tegenwoordig vaak een bewuste marketingkeuze — vooral in commerciële Provence-stijl rosé — en geen garantie voor kwaliteit of concentratie. Sommige producenten passen actieve ontkleuring toe (koolstoffiltratie, bentonietbehandeling) om een nog bleker resultaat te bereiken dan de natuurlijke extractie zou opleveren. Vertrouw kleur dus als eerste hypothese over productiemethode en stijl, nooit als eindoordeel over kwaliteit.

Beoordeel de rand van het glas apart van de kern, net als bij rood en wit: bij jonge rosé is er nauwelijks verschil tussen rand en kern, maar een merkbare verkleuring richting oranje aan de rand kan wijzen op beginnende oxidatie — een signaal dat bij rosé, door de beperkte hoeveelheid beschermende antocyanen, sneller optreedt dan bij rood.


## Pro insight

Vraag jezelf bij een extreem bleke rosé altijd af of dat natuurlijke extractie is of bewuste ontkleuring — proef de intensiteit van het fruit in de mond om dat verschil te toetsen, want ontkleurde rosé toont vaak minder fruitconcentratie dan de kleur doet vermoeden.',
    '- tint-intensiteitmodel
- saignée-versus-directe-pers
- bewuste-ontkleuring
- commerciële-bleekheidstrend
- vroege-oxidatiesignalen
',
    'Provence is meestal zeer bleek; Tavel vaak duidelijk donkerder.
',
    '- Kleur bij rosé bestaat uit twee aparte variabelen: tint en intensiteit
- Bleke, zalmkleurige rosé wijst meestal op directe pers; dieper roze op saignée of langere maceratie
- Extreme bleekheid is vaak een bewuste marketingkeuze, geen garantie voor kwaliteit
- Actieve ontkleuring (filtratie, bentoniet) kan de natuurlijke extractie overstemmen
- Een oranje verkleuring aan de rand wijst bij rosé sneller op oxidatie dan bij rood
',
    '### Opdracht

Vergelijk drie rosés op kleur.

### Checklist

- Ik heb minstens drie concrete punten genoteerd
- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Welke rosé op jouw kaart zou je nu opnieuw beoordelen door je af te vragen of de bleekheid natuurlijk is, of het resultaat van een bewuste stijlkeuze?',
    8,
    2
  ),
  (
    'aromas-herkennen',
    'Aroma''s herkennen',
    'Na deze les kun jij typische roséaroma''s herkennen.
',
    'Bij rosé is de aromalaag bijna uitsluitend primair: doordat de meeste rosé binnen het jaar na de oogst wordt gebotteld en verkocht, zonder houtrijping en meestal zonder malolactische gisting, ontbreken de secundaire en tertiaire lagen die bij rood en gerijpt wit zo bepalend zijn. Wie bij rosé naar leer, boter of honing zoekt, proeft de verkeerde categorie — het ontbreken van die lagen is zelf al een diagnostisch signaal.

Primaire aroma''s vallen grofweg in vier families: rood fruit (aardbei, framboos, rode bes, kers) dat wijst op rijp, zongerijpt schilcontact; citrus (grapefruit, citroen, sinaasappelzest) dat wijst op een koeler klimaat of kortere schilcontacttijd; bloemen (roos, viooltjes) die vaak samen met rood fruit optreden bij Grenache-gedomineerde blends; en kruidigheid (witte peper, Provençaalse garrigue-kruiden) die wijst op de aanwezigheid van Syrah of Mourvèdre in de blend.

De verhouding tussen deze vier families is het belangrijkste diagnostische signaal, niet de aanwezigheid van één losse descriptor: een rosé die overwegend citrus en bloemen toont zonder veel kruidigheid wijst eerder op een Cinsault- of Provence-georiënteerde stijl, terwijl een rosé met nadrukkelijke rood fruit én kruidigheid wijst op een Grenache-Syrah- of Tavel-achtige, meer body-rijke stijl.

Let ook op de afwezigheid van secundaire/tertiaire signalen als kwaliteitscheck: een lichte vanilletoon kan wijzen op kort houtcontact (soms bewust toegepast bij premium Rioja rosado of sommige Provence-cuvées), maar een uitgesproken boter- of gistige toon bij een jonge, goedkope rosé wijst eerder op een productiefout dan op stijl.


## Pro insight

Beoordeel bewust de verhouding tussen de vier aromafamilies in plaats van losse descriptors op te sommen — die verhouding alleen al brengt je dichter bij de druivensamenstelling dan een lijst met geïsoleerde geuren.',
    '- primaire-aromadominantie-rose
- vier-aromafamilies
- citrus-bloemen-signatuur
- kruidigheid-als-syrah-signaal
- afwezigheid-als-diagnostiek
',
    'Grenache geeft vaak aardbei; Syrah eerder kruidigheid.
',
    '- Rosé-aroma is bijna uitsluitend primair; secundaire en tertiaire lagen ontbreken doorgaans
- Vier hoofdfamilies: rood fruit, citrus, bloemen, kruidigheid
- De verhouding tussen deze families stuurt je druiven- en stijlhypothese
- Citrus en bloemen wijzen eerder op Cinsault/Provence, rood fruit met kruiden op Grenache-Syrah/Tavel
- Een onverwachte secundaire toon (boter, gist) bij jonge rosé wijst eerder op een fout dan op stijl
',
    '### Opdracht

Maak een geurlijst van jouw rosé.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Welke rosé zou jij nu opnieuw beoordelen door te letten op de verhouding tussen rood fruit, citrus, bloemen en kruidigheid, in plaats van op losse geuren?',
    8,
    3
  ),
  (
    'structuur-herkennen',
    'Structuur herkennen',
    'Na deze les kun jij structuur in rosé analyseren.
',
    'Structuur bij rosé draait primair om zuur, met een sterk variabele, optionele fenolische textuur als tweede as — een fundamenteel ander uitgangspunt dan bij rood, waar tannine de vaste centrale as is. Zuur bepaalt bij vrijwel elke rosé de zuurspanning en de lengte van de afdronk, en het niveau ervan hangt sterk af van klimaat: koelere gebieden (noordelijke Rhône-invloeden, sommige hooggelegen Provence-percelen) geven hogere zuren dan warme, vlakke terroirs.

Fenolische textuur — een lichte, tastbare fenolische grip op tandvlees en tong — ontstaat alleen bij langere schilcontacttijd of extractie, zoals bij Tavel of sommige Bandol-achtige, Mourvèdre-gedomineerde stijlen. Bij kortstondige directe pers, zoals de meeste Provence-rosé, is deze textuur vrijwel afwezig en blijft de mond zuiver zuurgedreven. Verwar deze textuur nooit met tannine in de red-wijnzin: de intensiteit en de rol in de balans zijn wezenlijk kleiner en dienen als aanvullend signaal, niet als hoofdas.

Alcohol en body volgen uit rijpheid en klimaat: warme-klimaat-rosé (Zuid-Frankrijk in warme jaargangen, Nieuwe Wereld) toont vaak hoger alcohol en meer body dan rosé uit koelere, hooggelegen percelen. Sommige stijlen, vooral buiten Europa, bevatten ook meetbare restsuiker, wat de indruk van body en zoetheid samen verandert — een vierde variabele die je apart moet benoemen naast zuur, textuur en alcohol.

Beoordeel lengte als laatste stap: een korte afdronk wijst vaak op een eenvoudige, vroeg-drinkbare rosé, terwijl een lange, zuurgedreven afdronk met een subtiele fenolische nasleep wijst op een gastronomisch geambieerde stijl zoals Tavel of premium Bandol-rosé.


## Pro insight

Vraag jezelf bij elke rosé af of de textuur die je proeft echt fenolische grip is, of gewoon viscositeit door alcohol en (rest)suiker — die drie worden vaak verward maar hebben elk een andere oorzaak.',
    '- zuur-als-hoofdas-rose
- optionele-fenolische-textuur
- klimaatgedreven-alcoholopbouw
- restsuiker-als-vierde-variabele
- afdronklengte-als-stijlsignaal
',
    'Veel gastronomische rosé heeft verrassend veel structuur.
',
    '- Zuur is de dominante structuuras bij rosé; fenolische textuur is optioneel en variabel
- Fenolische fenolische grip ontstaat alleen bij langere schilcontacttijd, zoals bij Tavel of Mourvèdre-stijlen
- Verwar fenolische textuur nooit met tannine in de rode-wijnzin — de rol is wezenlijk kleiner
- Alcohol en body hangen sterk samen met klimaat; restsuiker is een vierde, aparte variabele
- Lengte van de afdronk onderscheidt eenvoudige van gastronomisch geambieerde stijlen
',
    '### Opdracht

Proef twee rosés en vergelijk body.

### Checklist

- Ik heb minstens twee concrete punten genoteerd
- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij nu het verschil kunnen uitleggen tussen fenolische grip, viscositeit door alcohol, en een indruk van zoetheid door restsuiker, als iemand je dat aan tafel vraagt?',
    8,
    4
  ),
  (
    'mini-toets-rose',
    'Mini-toets rosé',
    'Na deze les toets jij je kennis van de eerste drie modules.
',
    'Deze mini-toets bundelt alles wat rosé proeftechnisch uniek maakt: kleur als productie-hypothese, de vier primaire aromafamilies, en zuur als hoofdas met een optionele fenolische textuur als tweede laag. Elk van deze elementen vertelt een ander deel van hetzelfde verhaal, en pas samen leveren ze een betrouwbare stijlhypothese op — vóór je aan een specifieke regio of druif denkt.

Kleur lees je als twee aparte variabelen: tint (bleek zalm tot cerise tot lichte oranje) en intensiteit, die samen een eerste hypothese geven over productiemethode (directe pers versus saignée of langere maceratie) en over eventuele bewuste ontkleuring. Onthoud dat extreme bleekheid tegenwoordig vaak een marketingkeuze is en geen garantie voor concentratie of kwaliteit.

Aroma is bij rosé bijna uitsluitend primair: rood fruit, citrus, bloemen en kruidigheid, waarbij de onderlinge verhouding — niet losse descriptors — je dichter bij de druivensamenstelling brengt. Het ontbreken van secundaire of tertiaire lagen is zelf een diagnostisch signaal, geen tekortkoming.

Structuur draait om zuur als hoofdas, met fenolische textuur, alcohol, body en eventuele restsuiker als aanvullende, apart te beoordelen variabelen. Het blinde protocol brengt dit samen in vaste volgorde: kleur (tint, intensiteit), aroma (primaire families en hun onderlinge verhouding), structuur (zuur, textuur, alcohol, body, restsuiker, lengte), en pas daarna een stijlhypothese. Documenteer die hypothese vóór de onthulling — dat is de enige manier om objectief te toetsen of je protocol standhoudt zonder etiket, en het fundament waarop Module 4 en 5 straks voortbouwen.


## Pro insight

Documenteer bij elke blinde rosé eerst je stijlhypothese — mediterraan en zuurgedreven, of structuurrijker en body-rijk — vóór je nadenkt over een specifieke regio of druif. Dat voorkomt dat je te snel naar een naam raadt zonder de onderliggende opbouw te checken.',
    '- kleur-als-productiehypothese
- vier-aromafamilies-verhouding
- zuur-textuur-alcohol-body-model
- blind-roséprotocol
- stijlhypothese-vóór-onthulling
',
    '',
    '- Kleur (tint, intensiteit) geeft de eerste hypothese over productiemethode, geen kwaliteitsoordeel
- Aroma is bijna uitsluitend primair: rood fruit, citrus, bloemen, kruidigheid, en hun onderlinge verhouding
- Zuur is de hoofdas van de structuur; fenolische textuur, alcohol, body en restsuiker zijn aanvullend
- Het blinde protocol volgt vaste volgorde: kleur, aroma, structuur, stijlhypothese
- Documenteer je hypothese altijd vóór de onthulling van het etiket
',
    '### Opdracht

Proef één rosé volledig blind (laat het etiket door iemand anders verbergen). Doorloop het volledige protocol zonder te gokken op een merknaam: beschrijf eerst tint en intensiteit apart, dan de aroma''s volgens de vier families (rood fruit, citrus, bloemen, kruidigheid) en hun onderlinge verhouding, dan structuur (zuur, eventuele fenolische textuur, alcohol, body, eventuele restsuiker, lengte), en formuleer pas daarna een stijlhypothese — mediterraan en zuurgedreven of structuurrijker en body-rijk — inclusief een vermoeden over de productiemethode. Onthul de wijn pas na het opschrijven van je hypothese.

### Checklist

- Ik heb tint en intensiteit apart beschreven vóór ik aan de productiemethode dacht
- Ik heb de vier aromafamilies apart benoemd en hun onderlinge verhouding vastgesteld
- Ik heb zuur en eventuele fenolische textuur apart beoordeeld, niet als één geheel
- Ik heb expliciet gecheckt op restsuiker als aparte variabele naast alcohol en body
- Ik heb mijn stijlhypothese opgeschreven vóór de onthulling
- Ik heb achteraf mijn grootste denkfout in één zin vastgelegd


### Reflectievraag

Welk van de drie elementen — kleur, aroma of structuur — vergeet jij het vaakst mee te wegen vóór je een conclusie trekt over een rosé?',
    10,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- klassieke-stijlen-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'klassieke-stijlen-rose-wine'
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
    'provence-rose',
    'Provence rosé',
    'Na deze les kun jij de stijl van Provence rosé herkennen en uitleggen.
',
    'Provence is het referentiepunt van moderne, mediterrane rosé: de hete, droge zomers rond de Côtes de Provence worden getemperd door de mistral, de koude noordenwind die ''s nachts voor afkoeling zorgt en zo de zuurgraad in de druiven behoudt ondanks de hitte overdag. Kalksteen- en schisterbodems, samen met percelen op hoogte, versterken dat frisse profiel verder.

Extractie is bij klassieke Provence-rosé minimaal: druiven worden snel en zacht geperst (directe pers), vaak bij lage temperatuur, met slechts enkele uren huidcontact of soms zelfs vrijwel geen bewuste maceratie. Die korte extractietijd is de directe verklaring voor de extreem bleke, zalmkleurige tot bijna ui-schil-achtige kleur waar de regio wereldwijd om bekendstaat — een kleur die inmiddels ook een commerciële norm is geworden waar producenten bewust naar streven.

Blindproefmarkers zijn: een zeer bleke kleur, citrus (grapefruit, citroenzest), witte perzik, en de kenmerkende Provençaalse garrigue-kruidigheid (tijm, laurier) op de achtergrond, gecombineerd met een zoute, minerale afdronk. Textuurmatig is Provence-rosé vrijwel zuiver zuurgedreven: fenolische grip is nagenoeg afwezig en het lichaam blijft bewust laag, wat de wijn direct herkenbaar maakt tegenover structuurrijkere stijlen.

Het grootste verwarringsgevaar ligt bij Tavel: beide zijn Franse rosé met Grenache als basis, maar Provence blijft aanzienlijk bleker, lichter van lichaam en zuiverder zuurgedreven, terwijl Tavel dieper van kleur is en een merkbare fenolische textuur toont. Verwar Provence ook niet met Bandol, de meer body-rijke, Mourvèdre-gedomineerde sub-appellatie binnen Provence zelf: Bandol-rosé is dieper van kleur, structuurrijker en heeft doorgaans meer bewaarpotentieel dan de doorsnee Côtes de Provence-stijl, ook al vallen beide onder de bredere Provence-noemer.

Serveer Provence-rosé zeer koel (8–10 °C) in een smal, hooggebouwd glas dat de subtiele citrus- en kruidentonen concentreert zonder het alcohol te benadrukken — bij een hogere temperatuur verdwijnt de precisie snel.


## Food pairing

### Beste pairing

Provence-rosé bij een bouillabaisse, gegrilde loup de mer, of een salade niçoise met ansjovis en olijven.

### Waarom dit werkt

De hoge zuur en de zoute, minerale afdronk van Provence-rosé sluiten direct aan bij de zilte, mediterrane zoutbalans van deze gerechten, terwijl de citrustonen de visgerechten opfrissen zonder te domineren.

### Vermijd

Provence-rosé bij zware, romige of sterk gekruide gerechten — de lichte body en subtiele aromatiek verdwijnen volledig tegen die intensiteit.

## Pro insight

Bij twijfel tussen Provence en Tavel: kijk eerst naar de kleurdiepte en proef dan direct op fenolische textuur. Blijft de mond zuiver zuurgedreven zonder enige fenolische grip, dan is het Provence; voel je een lichte, tastbare structuur, dan is het waarschijnlijk Tavel.',
    '- Provence
- mistral-koeling
- commerciële-bleekheidsnorm
- garrigue-kruidigheid
- Provence-Tavel-verwarring
',
    'Meer dan de helft van alle wijnproductie in Provence is rosé.
',
    '- Mistral en kalksteen-/schisterbodems geven Provence hitte overdag én zuurbehoud ''s nachts
- Minimale extractie via directe pers verklaart de extreem bleke, zalmkleurige kleur
- Blindproefmarkers: zeer bleke kleur, citrus, witte perzik, garrigue-kruidigheid, zoute afdronk
- Textuur is vrijwel zuiver zuurgedreven; fenolische grip is nagenoeg afwezig
- Grootste verwarringsgevaar is Tavel; Bandol is de dieper gekleurde, structuurrijkere Provence-sub-appellatie
',
    '### Opdracht

Proef een Provence rosé.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij Bandol-rosé nu anders classificeren dan een gemiddelde Côtes de Provence, ondanks dat beide onder dezelfde brede regio vallen?',
    8,
    1
  ),
  (
    'tavel',
    'Tavel',
    'Na deze les herken jij Tavel als unieke krachtige roséstijl.
',
    'Tavel is de enige Franse AOC die uitsluitend rosé produceert — er bestaat geen witte of rode Tavel — en die exclusiviteit weerspiegelt de ambitie van de appellatie om rosé als een volwaardige, structuurrijke categorie te positioneren in plaats van een licht bijproduct. De ronde rivierkeien (galets roulés), bekend van het naburige Châteauneuf-du-Pape, slaan overdag warmte op en geven die ''s nachts af, wat de druiven in dit warme zuidelijke Rhône-klimaat tot volledige fenolische rijpheid brengt.

Extractie is bij Tavel traditioneel aanzienlijk intensiever dan bij Provence: producenten gebruiken vaak langere schilcontacttijd, soms in combinatie met saignée, en de blend — overwegend Grenache aangevuld met Cinsault, Clairette, Syrah en Mourvèdre — wordt bewust dichter bij de wijnmaakfilosofie van een lichte rode wijn gebracht dan bij een klassieke, kort geperste rosé. Dat verklaart waarom Tavel weleens ''de rosé die zich gedraagt als een rode wijn'' wordt genoemd.

Blindproefmarkers zijn: een merkbaar diepere, koraal- tot lichtrode kleur, rijper rood fruit met kruidige, soms peperige tonen, een voller lichaam, hoger alcohol, en — het belangrijkste onderscheid — een tastbare fenolische textuur die je bij Provence nauwelijks tegenkomt. Die textuur is subtieler dan tannine bij rode wijn, maar wel degelijk aanwezig en herkenbaar als lichte fenolische grip op tandvlees en wangen.

Het grootste verwarringsgevaar is Provence: beide zijn Franse, Grenache-gedomineerde rosé, maar Tavel is aanzienlijk dieper van kleur, voller van lichaam en toont die kenmerkende fenolische grip, terwijl Provence bleker, lichter en zuiver zuurgedreven blijft. Test daarom nooit op kleur alleen: proef de textuur apart — Provence blijft glad, Tavel toont fenolische grip.

Serveer Tavel iets minder koud dan Provence (10–12 °C) in een breder glas dat het vollere lichaam en de kruidige tonen ruimte geeft; bij aanhoudende Provence-temperatuur (8 °C) blijft de structuur van Tavel onderbelicht.


## Food pairing

### Beste pairing

Tavel bij gegrilde lamskoteletten, een stevige ratatouille met geroosterd vlees, of gevogelte met een kruidige jus.

### Waarom dit werkt

De fenolische textuur en het volle lichaam van Tavel matchen textuurlijk met het vet en de eiwitten van geroosterd vlees, terwijl de kruidige, peperige tonen de mediterrane kruidenmix in het gerecht spiegelen.

### Vermijd

Tavel bij delicate, rauwe visgerechten — de textuur en het body-gewicht overweldigen de subtiliteit van rauwe vis volledig.

## Pro insight

Proef bij een onbekende, dieper gekleurde rosé altijd expliciet op fenolische grip vóór je aan Tavel denkt — zonder die tastbare textuur is de kans groter dat je met een geblende, kunstmatig verdiepte rosé te maken hebt in plaats van een authentieke Tavel.',
    '- Tavel
- galets-roulés-warmteopslag
- saignée-georiënteerde-extractie
- tastbare-fenolische-fenolische grip
- Tavel-Provence-textuurtest
',
    'Tavel wordt soms de “koning van rosé” genoemd.
',
    '- Tavel is de enige Franse AOC die uitsluitend rosé produceert
- Galets roulés slaan warmte op en brengen de druiven tot volledige fenolische rijpheid
- Langere schilcontacttijd/saignée geeft een dieper, structuurrijker resultaat dan Provence
- Blindproefmarkers: koraal-/lichtrode kleur, kruidig rood fruit, tastbare fenolische grip
- Grootste verwarringsgevaar is Provence; test op textuur, niet op kleur alleen
',
    '### Opdracht

Vergelijk Tavel met Provence.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij Tavel nu serveren als een lichte rode wijn qua temperatuur en glaskeuze, in plaats van als een klassieke, koud geserveerde rosé?',
    8,
    2
  ),
  (
    'rosado-spanje',
    'Rosado uit Spanje',
    'Na deze les begrijp jij de stijl van Spaanse rosado.
',
    'Rosado uit Spanje wordt van oudsher gedomineerd door Garnacha (de Spaanse naam voor Grenache), vooral in Navarra en delen van Rioja, waar een continentaal klimaat met hete dagen en koude nachten rijp fruit combineert met behoud van voldoende zuurgraad. Historisch produceerde de regio aanzienlijk dieper gekleurde rosado dan de moderne, internationaal geïnspireerde stijl — een stijlverschil dat nog steeds zichtbaar is tussen traditionele en eigentijdse producenten.

Extractie was traditioneel langer dan bij Provence, wat de klassieke, dieper roze tot licht oranje kleur verklaart die je nog steeds bij oudere-stijl Navarra-rosado aantreft. De laatste decennia is een duidelijke verschuiving zichtbaar richting kortere, koelere directe pers naar internationale, blekere stijl — deels als reactie op de commerciële dominantie van de Provence-stijl wereldwijd. Daarnaast experimenteert een groeiend aantal Rioja-producenten met vatgefermenteerde of kort op hout gerijpte rosado (rosado fermentado en barrica), wat een subtiele vanille- en roostertoon toevoegt die je bij Provence of Tavel vrijwel nooit tegenkomt.

Blindproefmarkers zijn: rijp rood fruit (aardbei, rode bes), een ronder mondgevoel dan Franse rosé, gematigd tot hoog alcohol, en bij vatgerijpte versies een lichte vanille- of roostertoon. De kleur varieert sterk van bleek (moderne stijl) tot duidelijk dieper roze-oranje (traditionele stijl), wat kleur bij Spaanse rosado tot een minder betrouwbare stijlindicator maakt dan bij Provence of Tavel.

Het grootste verwarringsgevaar is Italiaanse rosato: beide landen kennen een enorme interne stijlvariatie, maar Spaanse rosado neigt naar een ronder, rijper fruitprofiel met soms een houttoon, terwijl Italiaanse rosato vaker een directere, minerale zuurlijn toont zonder houtinvloed. Vertrouw bij twijfel niet op kleur — die overlapt sterk tussen beide landen — maar op de aanwezigheid van ronde, rijpe zoetheid en eventuele houttonen als signaal voor Spanje.

Serveer moderne, bleke rosado zoals Provence (8–10 °C); serveer vatgerijpte of traditionele, dieper gekleurde rosado iets warmer (11–13 °C) in een breder glas dat de extra structuur en houttonen ruimte geeft.


## Food pairing

### Beste pairing

Rosado bij jamón ibérico, gegrilde chorizo, of een paella met zeevruchten en chorizo.

### Waarom dit werkt

Het rijpe fruit en de ronde structuur van rosado matchen de vetbalans van cured vlees en zeevruchten, terwijl het zuur van de wijn tegen dat vet in werkt en de rijkdom van de paella-bouillon in evenwicht houdt.

### Vermijd

Rosado bij zeer delicate, rauwe schaaldieren — het rondere, rijpere fruitprofiel overweldigt de subtiliteit van rauwe zeevruchten.

## Pro insight

Bij twijfel tussen Spaanse rosado en Italiaanse rosato: negeer de kleur en zoek naar ronde, rijpe zoetheid of een lichte houttoon. Vind je die, dan proef je waarschijnlijk rosado; blijft de zuurlijn direct en mineraal zonder houtinvloed, dan is het eerder rosato.',
    '- rosado
- Navarra-Garnacha
- traditionele-versus-moderne-kleurstijl
- vatgefermenteerde-rosado-crianza
- rosado-rosato-verwarring
',
    'Navarra was jarenlang hét rosado-gebied van Spanje.
',
    '- Navarra en Rioja combineren een continentaal klimaat met van oudsher Garnacha-gedomineerde rosado
- Traditionele stijl is dieper gekleurd; moderne stijl schuift op naar bleker, internationaler
- Vatgefermenteerde rosado (fermentado en barrica) voegt vanille- en roostertonen toe
- Blindproefmarkers: rijp rood fruit, ronder mondgevoel, variabele kleurdiepte
- Grootste verwarringsgevaar is Italiaanse rosato; ronde zoetheid en houttonen wijzen op Spanje
',
    '### Opdracht

Zoek een Navarra rosado.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij een vatgerijpte Rioja-rosado nu anders serveren dan een moderne, bleke rosado uit dezelfde regio?',
    8,
    3
  ),
  (
    'rosato-italie',
    'Italiaanse rosato',
    'Na deze les kun jij Italiaanse rosato plaatsen.
',
    'Italiaanse rosato kent geen uniforme stijl — in tegenstelling tot de vrij consistente bleekheid van Provence toont Italië een extreme interne bandbreedte, van de bleke, delicate Chiaretto van het Gardameer tot de opvallend diep kersrode Cerasuolo d''Abruzzo. Wie ''Italiaanse rosato'' als één categorie behandelt, mist precies de regionale signalen die deze categorie specialistisch maken.

Bardolino Chiaretto, gemaakt van Corvina en Rondinella rond het Gardameer, wordt tegenwoordig overwegend via korte, directe pers geproduceerd en toont een bleke, delicate kleur vergelijkbaar met moderne Provence-stijl, met rood fruit en citrustonen en een hoge zuurgraad dankzij het gematigde meerklimaat. Cerasuolo d''Abruzzo daarentegen, gemaakt van Montepulciano, wordt traditioneel met langere schilcontacttijd geproduceerd en resulteert in een opvallend diepe, bijna kersrode kleur — zo diep dat de wijn soms voor een lichte rode wijn wordt aangezien bij oppervlakkige beoordeling.

Blindproefmarkers verschillen dus sterk per stijl: Chiaretto toont rood fruit, citrus en bloemen met een lichte, zuivere structuur; Cerasuolo toont sappige, licht wrange zure kers, kruidigheid en een merkbare fenolische textuur die de diepe kleur ondersteunt. Negroamaro-rosato uit Salento (Puglia) voegt daar nog een derde profiel aan toe: donkerder fruit, een koperachtige kleurtoon en een licht rustieke, aardse structuur.

Het verwarringsgevaar met Spaanse rosado is reëel bij de diepere Italiaanse stijlen: zowel Cerasuolo als sommige traditionele Spaanse rosado tonen aanzienlijke kleurdiepte, maar Cerasuolo behoudt een scherpere, kersachtige zuurlijn die dichter bij Sangiovese-achtige zuurstructuren ligt, terwijl Spaanse rosado ronder en minder scherp zuurgedreven blijft. Verwar Cerasuolo bovendien nooit met een lichte rode wijn puur op kleurdiepte: proef altijd het zuur en de textuur samen om de categorie te bevestigen.

Serveer Chiaretto koel (8–10 °C) in een smal glas; serveer Cerasuolo iets warmer (11–13 °C) in een breder glas dat de extra structuur en de kruidigheid ruimte geeft.


## Food pairing

### Beste pairing

Cerasuolo d''Abruzzo bij arrosticini (geroosterde lamsspiesjes) of andere geroosterde Abruzzese vleesgerechten; Chiaretto bij gegrilde meervis uit het Gardameer.

### Waarom dit werkt

De sappige kersachtige zuurlijn en fenolische textuur van Cerasuolo geven voldoende tegenwicht aan de grilltonen van geroosterd lamsvlees, terwijl de lichtere, frissere Chiaretto de delicate zoetwatervis niet overweldigt.

### Vermijd

Cerasuolo bij zeer delicate, rauwe gerechten — de kleurdiepte en textuur zijn daarvoor te uitgesproken; Chiaretto bij zwaar gekruide, vette gerechten — de lichte structuur verdwijnt volledig.

## Pro insight

Behandel ''Italiaanse rosato'' nooit als één stijl: vraag jezelf bij elk glas eerst af of je met een Chiaretto-achtige, bleke stijl te maken hebt of met een Cerasuolo-achtige, dieper gekleurde stijl — de verwachtingen voor zuur, textuur en food-pairing verschillen wezenlijk.',
    '- rosato
- Chiaretto-Gardameer
- Cerasuolo-d''Abruzzo
- interne-stijldiversiteit-Italië
- kersachtige-zuurlijn
',
    'Cerasuolo betekent letterlijk “kersenkleur”.
',
    '- Italiaanse rosato is geen uniforme stijl: interne bandbreedte van bleke Chiaretto tot diepe Cerasuolo
- Chiaretto (Corvina/Rondinella, Gardameer) is bleek en zuiver; Cerasuolo (Montepulciano) is diep en structuurrijker
- Negroamaro-rosato uit Puglia voegt een derde, donkerder en aardser profiel toe
- Verwarringsgevaar met Spaanse rosado bij diepere stijlen; Cerasuolo behoudt een scherpere, kersachtige zuurlijn
- Cerasuolo nooit puur op kleurdiepte als lichte rode wijn beoordelen
',
    '### Opdracht

Vergelijk twee Italiaanse rosati.

### Checklist

- Ik heb minstens twee concrete punten genoteerd
- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij Cerasuolo d''Abruzzo nu op tafel presenteren als rosé, of zou je overwegen hem eerst als ''bijna-rode-wijn'' te introduceren aan een gast?',
    8,
    4
  ),
  (
    'nieuwe-wereld-rose',
    'Nieuwe Wereld rosé',
    'Na deze les begrijp jij hoe Nieuwe Wereld rosé verschilt van klassieke Europese stijlen.
',
    'Nieuwe-Wereld-rosé — uit Californië (Central Coast, Sonoma), Australië, Zuid-Afrika en Chili — ontstaat in aanmerkelijk warmere klimaten dan de klassieke Franse referenties, met meer zonuren en hogere gemiddelde temperaturen die de druiven tot rijpere suikerniveaus en dus vaak hoger alcohol brengen. Die warmte-opbouw is de belangrijkste verklarende factor achter het bredere, rijpere fruitspectrum dat deze stijl kenmerkt.

De categorie kent twee duidelijk gescheiden ontwikkelingslijnen: een historische, off-dry lijn die teruggaat op de Amerikaanse White Zinfandel-stijl, waarbij de gisting bewust vroegtijdig wordt gestopt om meetbare restsuiker te behouden naast een relatief laag alcohol; en een moderne, drogere lijn die bewust de bleke, zuurgedreven Provence-stijl imiteert om aan te sluiten bij de internationale marktvraag naar ''droge, mediterrane'' rosé.

Blindproefmarkers verschillen daardoor sterk per lijn: de off-dry stijl toont expliciete zoetheid, rijp rood fruit (aardbeienjam) en een rondere, soms iets stroperige textuur door de combinatie van restsuiker en alcohol; de moderne, droge imitatiestijl toont een bleke kleur vergelijkbaar met Provence, maar verraadt zich vaak door een rijper, explicieter fruitprofiel (meloen, tropische ondertonen) dat de subtielere citrus- en kruidentonen van authentieke Provence mist.

Het belangrijkste verwarringsgevaar is dus niet regionaal maar structureel: een bleke Nieuwe-Wereld-rosé kan visueel bijna niet van Provence te onderscheiden zijn, terwijl de onderliggende rijpheid, het alcoholniveau en de afwezigheid van garrigue-kruidigheid wél degelijk verschillen. Proef daarom altijd door de kleur heen: rijpheid van het fruit en de aanwezigheid (of afwezigheid) van kruidige, mediterrane ondertonen zijn betrouwbaardere signalen dan tint alleen.

Serveer droge Nieuwe-Wereld-rosé zoals Provence (8–10 °C); serveer off-dry stijlen iets kouder (6–8 °C) om de zoetheid te temperen, in een neutraal, medium glas dat geen van beide stijlen overdreven concentreert.


## Food pairing

### Beste pairing

Droge Nieuwe-Wereld-rosé bij een zomerse BBQ met gegrilde kip of garnalen; off-dry stijlen bij pittige Aziatische of Mexicaanse gerechten.

### Waarom dit werkt

De rijpe fruitzoetheid van deze stijlen matcht de gekarameliseerde grilltonen; bij off-dry stijlen verzacht de zoetheid, gecombineerd met een net iets koudere serveertemperatuur, de kruidigheid van pittige gerechten effectief, terwijl een te warme temperatuur die zoetheid juist opdringerig zou maken.

### Vermijd

Off-dry Nieuwe-Wereld-rosé bij zoute, zuurgedreven mediterrane gerechten — de zoetheid conflicteert dan met de zoutbalans in plaats van die te ondersteunen.

## Pro insight

Proef bij een bleke, Provence-achtige rosé altijd door de kleur heen: zoek naar rijpheid van het fruit en de aan- of afwezigheid van garrigue-kruidigheid. Een bleke kleur met expliciet rijp, tropisch fruit en zonder kruidigheid wijst eerder op een Nieuwe-Wereld-imitatie dan op authentieke Provence.',
    '- Nieuwe-Wereld-rosé
- White-Zinfandel-erfenis
- droge-versus-off-dry-lijn
- Provence-stijlimitatie
- rijpheid-als-onderscheidend-signaal
',
    'Californië speelde een grote rol in de wereldwijde popularisering van rosé.
',
    '- Warmere klimaten (Californië, Australië, Zuid-Afrika, Chili) geven rijper fruit en vaak hoger alcohol
- Twee lijnen: historische off-dry (White Zinfandel-erfenis) en moderne, droge Provence-imitatie
- Blindproefmarkers verschillen sterk per lijn: expliciete zoetheid versus rijper fruit zonder kruidigheid
- Het verwarringsgevaar is structureel, niet regionaal: kleur kan bijna identiek zijn aan Provence
- Proef door de kleur heen op fruitrijpheid en garrigue-kruidigheid om de stijl te bevestigen
',
    '### Opdracht

Vergelijk een Europese rosé met een Nieuwe Wereld rosé.

### Checklist

- Ik heb kleur vergeleken
- Ik heb aroma''s vergeleken
- Ik heb structuur vergeleken
- Ik heb body vergeleken


### Reflectievraag

Zou jij een bleke, Provence-achtige rosé nu blind kunnen onderscheiden van een Nieuwe-Wereld-imitatie, puur op basis van fruitrijpheid en kruidigheid?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- druivenrassen-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'druivenrassen-rose-wine'
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
    'grenache',
    'Grenache',
    'Na deze les begrijp jij waarom Grenache de belangrijkste rosédruif ter wereld is.
',
    'Grenache is de ruggengraat van vrijwel elke klassieke Europese rosé — van Provence tot Tavel tot Spaanse rosado — en die dominantie komt niet toevallig: de druif heeft van nature een relatief lage antocyaanconcentratie in de schil, wat betekent dat zelfs bij substantieel schilcontact de kleur mild en beheersbaar blijft in plaats van meteen diep en donker te worden, zoals bij dikschillige druiven het geval zou zijn.

Grenache accumuleert bovendien snel suiker tijdens de rijping, wat resulteert in relatief hoog alcohol, terwijl het natuurlijke zuurniveau laag blijft — dezelfde eigenschap die de druif bij rode wijn tot een blendpartner maakt (in de GSM-blend) is bij rosé de reden waarom oogsttiming extreem precies moet zijn: te laat geoogst wordt de rosé plat en alcoholrijk, te vroeg geoogst mist het de karakteristieke rijpe rood-fruittoon.

Blindproefmarkers zijn: rood fruit (aardbei, rode bes, framboos), een rijp, rond mondgevoel, relatief hoog alcohol voor de categorie, en een bloemige ondertoon (rozenblad) die vaak samen met het fruit optreedt. De kleur varieert van medium zalm tot dieper roze, afhankelijk van schilcontacttijd, maar blijft door de lage antocyaanconcentratie zelden extreem donker.

Het grootste verwarringsgevaar is Cinsault, waarmee Grenache in vrijwel elke klassieke Provence- of Tavel-blend wordt gecombineerd: Grenache levert het rijpere fruit en het hogere alcohol, terwijl Cinsault een lichtere, bloemiger, minder geconcentreerde laag toevoegt. In een blend proef je Grenache als de rijpere, warmere onderlaag die het fruit draagt, terwijl Cinsault de opfrissende bovenlaag vormt.

Serveer Grenache-gedomineerde rosé bij 9–11 °C — iets minder koud dan een zuiver Cinsault-gedreven stijl, omdat te lage temperaturen het rijpe fruit en de bloemige ondertoon onderdrukken.


## Food pairing

### Beste pairing

Grenache-gedomineerde rosé bij een lamstajine met gedroogd fruit, of gegrilde lamskoteletten met rozemarijn.

### Waarom dit werkt

Het rijpe rood fruit en het hogere alcohol van Grenache matchen de vetrijkdom van lamsvlees, terwijl de bloemige rozentoon de kruidig-zoete elementen van een tajine spiegelt.

### Vermijd

Grenache-gedomineerde rosé bij zeer lichte, rauwe visgerechten — het rijpere fruit en alcohol overweldigen de subtiliteit volledig.

## Pro insight

Bij twijfel tussen Grenache en Cinsault in een blend: zoek naar de rijpere, warmere fruitonderlaag. Is die duidelijk aanwezig naast een lichtere, bloemige bovenlaag, dan proef je de klassieke Grenache-Cinsault-verhouding van Provence en Tavel.',
    '- Grenache
- lage-antocyaanconcentratie
- precieze-oogsttiming
- Grenache-Cinsault-verhouding
- rijpe-fruitonderlaag
',
    'Grenache oxideert relatief snel en vraagt zorgvuldige vinificatie.
',
    '- Grenache heeft van nature een lage antocyaanconcentratie, wat de kleur mild en beheersbaar houdt
- Snelle suikeraccumulatie en laag zuur vragen om extreem precieze oogsttiming
- Blindproefmarkers: rood fruit, rijp mondgevoel, relatief hoog alcohol, bloemige ondertoon
- Grootste verwarringsgevaar is Cinsault; Grenache levert de rijpere, warmere fruitonderlaag
- Serveer iets minder koud dan Cinsault-gedreven stijlen om het fruit tot zijn recht te laten komen
',
    '### Opdracht

Zoek drie rosés met Grenache.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Zou jij nu in een Provence-blend actief kunnen proeven welk deel van het fruitprofiel van Grenache komt en welk deel van Cinsault?',
    8,
    1
  ),
  (
    'cinsault',
    'Cinsault',
    'Na deze les begrijp jij de rol van Cinsault in rosé.
',
    'Cinsault is historisch een van de belangrijkste roosédruiven van Zuid-Frankrijk, en die rol is geen toeval: de druif is van nature dunschillig en laag in tannine, zelfs in de warme klimaten van de Languedoc en zuidelijke Rhône waar hij van oorsprong vandaan komt. Die combinatie van warmte-tolerantie en dunne schil levert een paradoxaal licht, bloemig resultaat op ondanks de hitte waarin de druif meestal groeit.

Cinsault heeft van nature een hoge opbrengst, wat historisch de reden was dat de druif veel werd aangeplant voor bulkproductie, maar diezelfde eigenschappen — lage tannine, gematigd zuur, een uitgesproken bloemige aromatiek (viooltjes, rozenblad) — maken hem bij bewust laag opbrengstbeheer juist zeer geschikt voor kwaliteitsrosé. Buiten Frankrijk krijgt oude-stok Cinsault (Swartland, Zuid-Afrika) en Cinsault uit de Bekaa-vallei (Libanon) inmiddels aandacht als op zichzelf staande, hoogwaardige roosédruif.

Blindproefmarkers zijn: een lichte kleur, lage tannine, uitgesproken bloemigheid, rood fruit dat subtieler is dan bij Grenache, en een soepel, direct mondgevoel zonder de hogere alcoholopbouw die Grenache kenmerkt. In blends fungeert Cinsault typisch als de opfrissende, minder geconcentreerde laag die het rijpere Grenache-fruit in balans houdt.

Het verwarringsgevaar met Grenache speelt zich vooral af binnen blends: waar Grenache het rijpe fruit en het alcohol levert, blijft Cinsault de lichtere, bloemiger onderlaag — een onderscheid dat je het best test door te letten op de intensiteit van de bloemige noot en het alcoholgevoel: hoe uitgesprokener de bloemigheid en hoe lichter het alcohol aanvoelt, hoe groter het aandeel Cinsault waarschijnlijk is.

Serveer varietale Cinsault-rosé goed gekoeld (8–10 °C) in een smal glas dat de bloemige lichtheid concentreert zonder het beperkte alcohol te benadrukken.


## Food pairing

### Beste pairing

Cinsault-gedomineerde rosé bij oesters, gegrilde garnalen, of een mezeplank met olijven en tapenade.

### Waarom dit werkt

De lage tannine en de bloemige lichtheid laten Cinsault ongewoon goed samengaan met schaal- en schelpdieren zoals oesters en garnalen, zonder de subtiele zilte smaak te overweldigen.

### Vermijd

Cinsault-gedomineerde rosé bij rijke, romige of sterk gekruide gerechten — de lichte, bloemige structuur verdwijnt volledig tegen die intensiteit.

## Pro insight

Proef in elke Grenache-Cinsault-blend actief op de intensiteit van de bloemige noot: hoe sterker die aanwezig is naast een lichter alcoholgevoel, hoe groter het aandeel Cinsault in de blend.',
    '- Cinsault
- dunschillige-warmteparadox
- oude-stok-Cinsault-Zuid-Afrika
- bloemige-onderlaag
- Grenache-Cinsault-blendtest
',
    'Cinsault wordt vaak gezien als de aromatische finesse-druif van rosé.
',
    '- Cinsault is warmteminnend maar van nature dunschillig, met een paradoxaal licht resultaat
- Hoge opbrengst maakt de druif geschikt voor bulk, maar bij lage opbrengst juist voor kwaliteitsrosé
- Oude-stok Cinsault uit Zuid-Afrika en de Bekaa-vallei krijgt aandacht als zelfstandige druif
- Blindproefmarkers: lichte kleur, lage tannine, uitgesproken bloemigheid, subtiel rood fruit
- Verwarringsgevaar met Grenache in blends; test op de intensiteit van de bloemige noot
',
    '### Opdracht

Vergelijk Grenache en Cinsault in rosé.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij oude-stok Cinsault uit Zuid-Afrika nu als een serieuze, op zichzelf staande roosédruif behandelen, in plaats van als een blendpartner voor Grenache?',
    8,
    2
  ),
  (
    'syrah',
    'Syrah',
    'Na deze les kun jij de bijdrage van Syrah herkennen.
',
    'Syrah speelt in roséblends een andere rol dan in rode wijn: waar de druif bij rood vaak de hoofdrol vertolkt, fungeert Syrah in Provence- en Rhône-rosé meestal als een kleine, gerichte toevoeging (doorgaans niet meer dan tien tot twintig procent van de blend) die kleurdiepte en kruidigheid toevoegt zonder de lichtvoetigheid van Grenache en Cinsault te overschaduwen.

De dikkere schil van Syrah levert, zelfs in kleine percentages, merkbaar meer kleurdiepte dan Grenache of Cinsault alleen zouden geven, en de karakteristieke zwarte-peperspecerij van de druif — afkomstig van het aromacomponent rotundone — blijft ook bij kortstondig schilcontact goed herkenbaar. Sommige producenten, vooral in Nieuwe-Wereld-gebieden met een koeler klimaat (bepaalde delen van Australië, Chili), bottelen ook varietale Syrah-rosé, wat de druif meer op zichzelf laat proeven dan de klassieke Franse blendrol toelaat.

Blindproefmarkers zijn: een merkbaar diepere kleur dan een pure Grenache-Cinsault-rosé, een expliciete zwarte-peper- of kruidnagelspecerij, viooltjesbloemigheid, en een iets stevigere structuur dan de rest van de blend. In een blind glas verraadt Syrah zich meestal het eerst via de neus, niet via de kleur: de peperspecerij is herkenbaarder dan de kleurbijdrage.

Het grootste verwarringsgevaar is Mourvèdre, de andere structuurdruif in klassieke Provence- en Tavel-blends: Syrah geeft een frissere, meer bloemige zwarte-peperspecerij, terwijl Mourvèdre een zwaardere, aardse, bijna wild-hartige garrigue-toon toevoegt met meer tastbare fenolische grip. Proef daarom het verschil tussen ''peperig-bloemig'' (Syrah) en ''aards-wild'' (Mourvèdre) om de twee uit elkaar te houden in een GSM-achtige roséblend.

Serveer Syrah-geaccentueerde rosé bij 10–12 °C in een middelgroot glas dat zowel de kruidige top als de iets stevigere structuur ruimte geeft.


## Food pairing

### Beste pairing

Syrah-geaccentueerde rosé bij gegrilde worst met zwarte peper, of een pepersteak van varkenshaas.

### Waarom dit werkt

De zwarte-peperspecerij van Syrah in de rosé spiegelt direct de kruidigheid van de peperkorrel in het gerecht, een klassieke aroma-op-aroma-match die bij lichtere Grenache-Cinsault-rosé zou ontbreken.

### Vermijd

Syrah-geaccentueerde rosé bij zeer delicate, ongekruide visgerechten — de kruidigheid overweldigt de subtiliteit.

## Pro insight

Ruik bewust op zwarte peper vóórdat je de kleur van een rosé beoordeelt — die specerij verraadt de aanwezigheid van Syrah in een blend vaak eerder en betrouwbaarder dan de kleurdiepte zelf.',
    '- Syrah
- rotundone-peperspecerij
- kleine-blendpercentages
- Syrah-Mourvèdre-verwarring
- peperig-versus-aards-onderscheid
',
    'Syrah geeft vaak meer kleur dan Grenache.
',
    '- Syrah is in roséblends een kleine, gerichte toevoeging voor kleurdiepte en kruidigheid
- De dikkere schil geeft merkbaar meer kleur; rotundone geeft de karakteristieke zwarte-peperspecerij
- Sommige Nieuwe-Wereld-producenten bottelen varietale Syrah-rosé
- Blindproefmarkers: diepere kleur, zwarte peper/kruidnagel, viooltjesbloemigheid, steviger structuur
- Grootste verwarringsgevaar is Mourvèdre; test op peperig-bloemig versus aards-wild
',
    '### Opdracht

Zoek een Syrah-dominante rosé.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Zou jij nu in een GSM-geïnspireerde roséblend actief op zoek gaan naar de zwarte-peperspecerij van Syrah, los van de kleurdiepte van de wijn?',
    8,
    3
  ),
  (
    'mourvedre',
    'Mourvèdre',
    'Na deze les begrijp jij waarom Mourvèdre rosé gastronomisch sterker maakt.
',
    'Mourvèdre is de structuurdruif bij uitstek binnen roséblends, en nergens is die rol wettelijk zo vastgelegd als in Bandol: de appellatie eist een minimumaandeel Mourvèdre van doorgaans rond de vijftig procent in de rosé, precies omdat de druif de body en het bewaarpotentieel levert die de lichtere Provence-stijl elders in de regio mist.

Mourvèdre is een laatrijpende, warmteminnende druif met een relatief dikke schil, wat zelfs bij de kortere schilcontacttijd van rosévinificatie meetbaar meer kleurdiepte en fenolische structuur oplevert dan Grenache of Cinsault. De druif heeft bovendien een uitgesproken aardse, wild-hartige aromatiek — vaak omschreven als garrigue, leer of zelfs een lichte wildtoon — die in rode wijn nog explicieter is maar ook in rosé duidelijk herkenbaar blijft.

Blindproefmarkers zijn: een diepere kleur dan een gemiddelde Provence-rosé, een merkbare fenolische grip, aardse en kruidige (garrigue) tonen, en een voller, structuurrijker mondgevoel met doorgaans hoger bewaarpotentieel dan de meeste andere roséstijlen. Bandol-rosé kan, in tegenstelling tot de meeste rosé die binnen het jaar wordt gedronken, enkele jaren positief evolueren dankzij deze Mourvèdre-structuur.

Het verwarringsgevaar met Syrah is het spiegelbeeld van wat je bij Syrah leerde: Mourvèdre geeft een zwaardere, aardse, bijna wild-hartige garrigue-toon met meer tastbare fenolische grip, terwijl Syrah frisser, bloemiger en explicieter zwarte-peperig blijft. Proef bij twijfel altijd de textuur samen met de aromatiek: Mourvèdre voelt structuurrijker en aardser aan, Syrah lichter en kruidiger.

Serveer Mourvèdre-gedomineerde rosé (zoals Bandol) bij 12–14 °C — merkbaar warmer dan een klassieke Provence-rosé — in een breder glas dat de extra structuur en de aardse diepgang ruimte geeft.


## Food pairing

### Beste pairing

Mourvèdre-gedomineerde rosé (Bandol) bij gegrilde inktvis met chorizo, geroosterd konijn, of een stevige Provençaalse groentetajine.

### Waarom dit werkt

De fenolische grip en aardse garrigue-toon van Mourvèdre geven voldoende tegenwicht aan de umami en de rokerige intensiteit van gegrild eiwit, iets waar een lichte Provence-rosé tekortschiet.

### Vermijd

Mourvèdre-gedomineerde rosé bij lichte, frisse zomersalades zonder eiwit — de structuur en diepgang zijn daarvoor te uitgesproken.

## Pro insight

Bij twijfel tussen Syrah- en Mourvèdre-invloed in een blend: proef eerst de textuur. Voel je duidelijke fenolische grip naast aardse, wild-hartige tonen, dan overheerst Mourvèdre; blijft de structuur lichter met een frissere, peperige top, dan overheerst Syrah.',
    '- Mourvèdre
- Bandol-minimumaandeel
- aardse-garrigue-diepgang
- Mourvèdre-Syrah-textuurtest
- bewaarpotentieel-via-Mourvèdre
',
    'Bandol rosé kan vaak meerdere jaren rijpen door Mourvèdre.
',
    '- Bandol eist wettelijk een Mourvèdre-minimumaandeel van rond de vijftig procent in de rosé
- Late rijping en dikkere schil geven meer kleurdiepte en fenolische structuur
- Blindproefmarkers: diepere kleur, fenolische grip, aardse garrigue-tonen, voller mondgevoel
- Bandol-rosé kan, anders dan de meeste rosé, enkele jaren positief evolueren
- Grootste verwarringsgevaar is Syrah; test op structuurrijk-aards versus licht-kruidig
',
    '### Opdracht

Vergelijk Bandol met Provence.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Zou jij een Bandol-rosé nu bewust een of twee jaar laten liggen, wetend dat de Mourvèdre-structuur daar positief op kan reageren?',
    8,
    4
  ),
  (
    'tempranillo-rosado',
    'Tempranillo rosado',
    'Na deze les herken jij Tempranillo in Spaanse rosado.
',
    'Tempranillo is naast Garnacha de tweede pijler van Spaanse rosado, en de druif brengt een wezenlijk ander profiel mee: waar Garnacha (Grenache) van nature laag zuur en hoog alcohol geeft, behoudt Tempranillo een steviger zuurniveau en een directere, rood-fruitige structuur, wat rosado op basis van deze druif doorgaans gestructureerder en gastronomischer maakt dan een pure Garnacha-rosado.

De druif is bovendien de enige van de twee met een sterke, historisch verankerde affiniteit met houtrijping: in Rioja en Ribera del Duero wordt een deel van de Tempranillo-rosado bewust kort op hout gerijpt of zelfs vergist (rosado fermentado en barrica), wat een subtiele vanille- of roostertoon toevoegt die je bij Garnacha-gedomineerde rosado zelden aantreft. Deze stijl positioneert Tempranillo-rosado nadrukkelijk als een gastronomisch, structuurrijker alternatief binnen het Spaanse rosado-aanbod.

Blindproefmarkers zijn: rood fruit (rode bes, kers) met een directere, minder rijpe zoetheid dan Garnacha, een steviger zuurniveau, medium lichaam, en bij vatgerijpte versies een lichte vanille- of roostertoon. De kleur is doorgaans medium-diep roze, minder extreem bleek dan moderne Provence-imitaties maar ook minder donker dan traditionele Navarra-stijl.

Het onderscheid met Garnacha-gedomineerde Spaanse rosado zit vooral in de zuur-fruitbalans: Tempranillo blijft directer en zuurgedrevener, terwijl Garnacha ronder en rijper aanvoelt met meer alcoholgevoel. In blends van beide druiven — veel voorkomend in Rioja en Navarra — proef je Tempranillo als de scherpere, structurerende laag onder het rondere Garnacha-fruit.

Serveer Tempranillo-rosado bij 10–12 °C; vatgerijpte versies profiteren van een iets hogere temperatuur (12–14 °C) in een breder glas dat de houttonen en de extra structuur laat ontplooien.


## Food pairing

### Beste pairing

Tempranillo-rosado bij gegrilde chorizo, patatas bravas, of een lichte lamsstoofpot.

### Waarom dit werkt

Het stevigere zuur en de directere roodfruitstructuur van Tempranillo-rosado matchen de kruidige, licht vette intensiteit van chorizo en gegrilde tapas, terwijl vatgerijpte versies extra weerklank vinden in geroosterde, houtskoolgegrilde gerechten.

### Vermijd

Tempranillo-rosado bij zeer lichte, delicate visgerechten — de stevigere structuur en eventuele houttoon overweldigen de subtiliteit.

## Pro insight

Proef in een Spaanse Tempranillo-Garnacha-rosadoblend eerst het zuur apart van het fruit: een scherpere, directere zuurlijn wijst op een groter aandeel Tempranillo, terwijl een rondere, alcoholrijkere indruk wijst op een groter aandeel Garnacha.',
    '- Tempranillo-rosado
- vatgerijpte-rosado-fermentado-en-barrica
- zuur-fruitbalans-Tempranillo-Garnacha
- gastronomische-structuurpositionering
- medium-diepe-kleurband
',
    'Tempranillo rosado is populair in Rioja en Navarra.
',
    '- Tempranillo is naast Garnacha de tweede pijler van Spaanse rosado, met een steviger zuurniveau
- Sterke affiniteit met houtrijping levert vatgerijpte rosado (fermentado en barrica) op
- Blindproefmarkers: directer rood fruit, steviger zuur, medium lichaam, eventuele vanille/roostertoon
- Onderscheid met Garnacha zit in de zuur-fruitbalans: directer versus ronder en rijper
- In blends proef je Tempranillo als de structurerende laag onder het Garnacha-fruit
',
    '### Opdracht

Vergelijk Tempranillo rosado met Grenache rosé.

### Checklist

- Ik heb kleur vergeleken
- Ik heb fruit vergeleken
- Ik heb body vergeleken
- Ik heb zuren vergeleken


### Reflectievraag

Zou jij een vatgerijpte Tempranillo-rosado nu voorstellen als serieus gastronomisch alternatief voor een lichte rode wijn bij tafel?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- stijl-gastronomie-rose-wine (5 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'stijl-gastronomie-rose-wine'
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
    'licht-en-fris',
    'Licht en fris',
    'Na deze les begrijp jij hoe lichte rosé gastronomisch werkt.
',
    'Bleke, geprotegeerde rosé — de Provence-stijl, Chiaretto, lichte Navarra rosado — is geen toevallig bijproduct van rode wijnvinificatie maar het resultaat van een bewuste, wit-wijn-achtige procesketen die toegepast wordt op blauwe druiven. Het schilcontact duurt hier meestal slechts twee tot zes uur, vaak via direct press waarbij de druiven nauwelijks tijd krijgen om kleurstof af te geven vóór het sap van de schillen wordt gescheiden. Omdat tannine vrijwel uitsluitend uit schil en pit komt, en niet uit de druivensoort zelf, betekent minimaal schilcontact automatisch minimale tanninextractie — kleurdiepte en tanninegehalte worden dus in dezelfde handeling tegelijk laag gehouden, niet apart gestuurd.

Het Centre de Recherche et d''Expérimentation sur le Vin Rosé in Vidauban — wereldwijd het enige onderzoeksinstituut dat zich uitsluitend op rosé richt — bestudeert precies deze extractiecurve: hoe elke bijkomende contactminuut de kleur- en fenolconcentratie verschuift. Die data onderbouwt de moderne Provençaalse voorkeur voor een extreem bleke, ''oeil de perdrix''-achtige tint, een esthetische keuze die de afgelopen twintig jaar de internationale referentiestandaard voor lichte rosé is geworden.

Zuurbehoud is hier primair een wijngaardbeslissing, geen kelderbeslissing: vroege oogst, een koeler mesoklimaat en voldoende dag-nachtverschil houden het appelzuur hoog vóórdat de druif ook maar in de pers komt. In de kelder wordt de appelzuur-melkzuurgisting daarna vrijwel altijd geblokkeerd — via koude, SO₂ en filtratie — om die strakke, rechte zuurstructuur te bewaren in plaats van haar te laten afronden.

Protectieve, reductieve vinificatie maakt het plaatje compleet: een inert-gasdeken tijdens persen en overhevelen voorkomt vroege oxidatieve bruinkleuring van de kleine antocyaanpool, en gisting op 13–16 °C met specifiek geselecteerde gisten behoudt de vluchtige esters (isoamylacetaat, 2-fenylethanol) die het subtiele citrus-en-mineraal-register geven in plaats van uitbundig fruit.

Dit is precies waarom lichte rosé geen ''verdunde rode wijn'' is: het is een witwijn-vinificatietechniek toegepast op een blauwe druif, met een eigen extractielogica, eigen zuurstrategie en eigen esterprofiel — een structureel andere categorie dan zowel rood als wit.


## Food pairing

### Beste pairing

Oesters, tonijn tartaar of een salade met citrusdressing en verse kruiden.

### Waarom dit werkt

De hoge, strakke zuurgraad en het vrijwel afwezige tanninegehalte laten de subtiele esters ondersteunen zonder de fijne textuur van rauwe vis of rauwkost te verpletteren.

### Vermijd

Zware, romige sauzen of gestoofde gerechten — de lage extractie en subtiele aromatiek van deze stijl vallen daar volledig tegen weg.

## Pro insight

Leg een gast uit dat de bleekheid van een Provence-stijl geen kwaliteitscompromis is maar een precieze extractiekeuze — dat verandert het gesprek van ''is dit wel genoeg wijn'' naar ''dit is precies zo gemaakt''.',
    '- vin-gris-persmoment
- geblokkeerde appelzuur-melkzuurgisting
- CREVR-onderzoekscurve Vidauban
- protectieve inertgastechniek
- onafhankelijke kleur-tannine-as
',
    'Hoe hoger de zuren, hoe beter rosé vaak werkt met frisse gerechten.
',
    '- Twee tot zes uur schilcontact bepaalt tegelijk lage kleurdiepte én lage tanninextractie
- CREVR in Vidauban is het enige onderzoeksinstituut ter wereld specifiek gericht op rosé
- Zuurbehoud is een wijngaardkeuze (vroege oogst, koel mesoklimaat), geblokkeerde appelzuur-melkzuurgisting bewaart die scherpte
- Protectieve, reductieve vinificatie (inert gas, koele gisting) behoudt subtiele esters in plaats van uitbundig fruit
- Lichte rosé is een witwijn-vinificatietechniek op blauwe druiven, geen verdunde rode wijn
',
    '### Opdracht

Bedenk drie gerechten voor een Provence rosé.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Bij welke fles lichte rosé op jouw kaart zou jij het schilcontact van twee tot zes uur expliciet benoemen aan een gast — en verandert dat hun verwachting van de wijn?',
    8,
    1
  ),
  (
    'fruitig-en-sappig',
    'Fruitig en sappig',
    'Na deze les kun jij fruitige rosé herkennen en inzetten.
',
    'Fruitige, sappige rosé — de wereldwijd grootste commerciële categorie — ontstaat door een net iets andere set keuzes dan de bleke Provence-stijl, niet door toeval. Grenache-gedreven wijnen uit Spanje, Californië en Australië krijgen doorgaans iets meer schilcontact (zes tot twaalf uur) in een warmer klimaat, wat rijper fruit en een hogere concentratie aan fruitgedreven esters oplevert — met name ethylhexanoaat en ethylbutyraat, verantwoordelijk voor de herkenbare aardbei- en roodfruittoon. Fermentatie op 14–16 °C, iets warmer dan bij de bleke stijl, behoudt precies dit esterprofiel in plaats van het meer terughoudende citrusregister.

De geschiedenis van deze categorie is direct te herleiden tot één specifiek ongeluk. In 1972 gebruikte winemaker Bob Trinchero bij Sutter Home de saignée-methode om zijn rode Zinfandel te concentreren: hij liet sap af van de schillen om een krachtiger rode wijn te maken, en fermenteerde dat afgetapte sap apart tot een droge, lichtgekleurde wijn die hij ''White Zinfandel'' noemde. In 1975 bleef die gisting per ongeluk steken bij circa 2% restsuiker — een technisch mankement, geen ontwerpkeuze — en het resultaat werd zo''n commercieel succes dat het de eerste wijn werd die Sutter Home elk jaar uitverkocht. Die gelukte fout redde bovendien de oude Zinfandel-wijngaarden van Californië, die destijds massaal gerooid werden ten gunste van Chardonnay en Cabernet Sauvignon.

Dat ongeluk verklaart een blijvende technische tweedeling binnen ''fruitige rosé'' vandaag: veel Nieuwe Wereld blush-stijlen dragen bewust een kleine hoeveelheid restsuiker (vijf tot dertig gram per liter) om die directe sappigheid te versterken, terwijl de meeste Spaanse en Australische Grenache-rosado''s volledig droog zijn en hun fruitindruk puur uit rijpheid en esters halen, niet uit suiker. Beide bereiken eenzelfde sensorische indruk via een fundamenteel ander mechanisme.

Deze stijl is daarom nooit bedoeld als gastronomisch precisie-instrument zoals de bleke of kruidige stijlen, maar als toegankelijk, breed inzetbaar aperitief- en casual-diningsegment — en juist dat maakt haar wereldwijd verreweg de best verkopende rosécategorie.


## Food pairing

### Beste pairing

Tapas, gegrilde groenten of een lichte pizza margherita.

### Waarom dit werkt

De rijpe roodfruittonen en de soepele, toegankelijke structuur spiegelen de directe, informele smaken van casual gerechten zonder een precisiematch te vereisen.

### Vermijd

Verfijnde, delicate gerechten met subtiele aromatiek — de uitgesproken fruitconcentratie overstemt die nuance snel.

## Pro insight

Vertel het verhaal van de per ongeluk stokende gisting van Sutter Home aan een gast die ''fruitige rosé'' als oppervlakkig afdoet — het herframet de categorie meteen als een concreet stuk wijngeschiedenis in plaats van een commerciële bijzaak.',
    '- saignée-concentratie-effect
- ethylhexanoaat-roodfruitester
- Sutter Home-gistingsongeluk 1975
- restsuiker-versus-rijpheidsfruit
- casual-diningsegment
',
    'Fruitige rosé is wereldwijd de grootste commerciële stijl.
',
    '- Iets langer schilcontact (zes tot twaalf uur) in een warmer klimaat geeft rijper fruit en meer ester
- Ethylhexanoaat en ethylbutyraat verklaren de herkenbare aardbei- en roodfruittoon
- White Zinfandel ontstond in 1975 uit een technisch mankement (stokende gisting bij Sutter Home), niet uit ontwerp
- Sommige Nieuwe Wereld blush-stijlen dragen bewust restsuiker; Spaanse/Australische Grenache-rosado blijft vaak volledig droog
- Beide routes bereiken dezelfde sappige indruk via een ander mechanisme (restsuiker versus rijpheid en esters)
',
    '### Opdracht

Zoek een fruitige rosé en beschrijf drie fruitaroma''s.

### Checklist

- Ik heb minstens drie concrete punten genoteerd
- Ik schreef mijn observaties gestructureerd op


### Reflectievraag

Zou jij een gast die alleen zoete blush-stijlen kent, durven overtuigen met een volledig droge Grenache-rosado — en welk verschil (restsuiker versus rijpheid) gebruik je om dat uit te leggen?',
    8,
    2
  ),
  (
    'kruidig-en-droog',
    'Kruidig en droog',
    'Na deze les begrijp jij de rol van kruidigheid in rosé.
',
    'Kruidige, drogere rosé — het register van Bandol, Tavel en delen van Zuid-Italië — ontstaat via een net iets ander verhaal dan puur extractieduur: het draait om druivenkeuze én omgeving. Syrah draagt hier rotundone bij, hetzelfde sesquiterpeen dat in rode Syrah zwarte peper veroorzaakt en dat toeneemt naarmate de druiventros minder directe zoninstraling krijgt — koelere percelen en bewust bladwerk geven dus meer kruidigheid, ongeacht het schilcontact. Mourvèdre voegt daarnaast een savoury, kruidig-aardse laag toe die niet primair uit rotundone komt maar uit een bredere fenolische opbouw die samenhangt met iets langer schilcontact dan bij de fruitige of bleke stijl.

Een specifiek omgevingsmechanisme versterkt dit in de Provençaalse en Bandolese wijngaarden: de garrigue, de wilde mediterrane begroeiing van tijm, rozemarijn en lavendel die vaak direct tegen de wijngaarden aan groeit, geeft vluchtige aromatische verbindingen af die zich aan de druivenschil kunnen hechten — hetzelfde principe waarmee eucalyptusbomen naast Coonawarra-wijngaarden een meetbare munttoon in Cabernet Sauvignon afgeven. Kruidigheid in rosé is dus deels druifchemie (rotundone) en deels een aantoonbaar omgevingseffect, geen vaag stijlkenmerk.

De Bandol AOC formaliseert dit bovendien wettelijk: de rosé-appellatie eist sinds 2014 minimaal 20% Mourvèdre in de aanplant (voorheen 10%), met een maximum van 95% — een aanzienlijk lagere ondergrens dan de 50% die voor Bandol rode wijn geldt, maar nog altijd genoeg om de rosé een herkenbaar steviger, kruidiger karakter te geven dan de meeste andere Provençaalse rosé''s.

Deze combinatie van rotundone, garrigue-adsorptie en een hoger Mourvèdre-aandeel resulteert in meer fenolische substantie dan bij de bleke of fruitige stijl — niet genoeg om als tanninerijk te gelden, maar wel genoeg om de wijn langer op tafel te laten functioneren en gastronomisch zwaardere gerechten te kunnen dragen.

Dat extra fenolische fundament is ook precies waarom deze stijl, in tegenstelling tot de bleke of fruitige categorie, een reëel — zij het bescheiden — bewaarpotentieel heeft, een lijn die in les 33 en 34 verder wordt uitgewerkt.


## Food pairing

### Beste pairing

Gegrilde vis met mediterrane kruiden, of kip met tijm en rozemarijn.

### Waarom dit werkt

De rotundone- en garriguetonen in de wijn resoneren direct met de kruiden op het gerecht — een aroma-op-aroma-brug in plaats van alleen een structuurmatch.

### Vermijd

Zeer delicate, ongekruide gerechten — de extra kruidige complexiteit overstemt die subtiliteit al snel.

## Pro insight

Noem bij een Bandol rosé expliciet het wettelijke Mourvèdre-minimum van 20% — dat concrete cijfer geeft een gast direct een reden waarom deze rosé steviger aanvoelt dan een gemiddelde Provence.',
    '- garrigue-VOC-adsorptie
- Bandol-Mourvèdre-minimum 2014
- rotundone-koelklimaatsignaal
- verlengd-schilcontact-kruidigheid
- fenolisch-fundament-bewaarpotentieel
',
    'Kruidigheid komt vaak van Syrah en Mourvèdre.
',
    '- Rotundone (Syrah) neemt toe bij minder zoninstraling — kruidigheid is deels een teeltkeuze
- Garrigue-kruiden (tijm, rozemarijn, lavendel) geven vluchtige aromatische verbindingen af aan de druivenschil, net als eucalyptus bij Coonawarra
- Bandol AOC eist sinds 2014 wettelijk minimaal 20% Mourvèdre voor rosé (voorheen 10%)
- Meer fenolische substantie dan bleke of fruitige rosé, zonder als tanninerijk te gelden
- Dat fenolische fundament verklaart het bescheiden bewaarpotentieel van deze stijl
',
    '### Opdracht

Proef een kruidige rosé en noteer kruiden.

### Checklist

- Ik schreef mijn observaties gestructureerd op


### Reflectievraag

Bij welke fles Bandol of Tavel op jouw kaart zou jij het wettelijke Mourvèdre-percentage gebruiken als verkoopargument in plaats van alleen de regio te noemen?',
    8,
    3
  ),
  (
    'structuur-en-body',
    'Structuur en body',
    'Na deze les kun jij body en textuur inzetten bij pairing.
',
    'Body bij rosé is geen vast druifkenmerk maar het resultaat van drie onafhankelijk stuurbare factoren: moutgewicht (en dus alcohol), de duur en aard van fenolische extractie, en — bij premium cuvées — bewuste lees-batonnage voor extra textuur. Dat rosé''s structureel zo uiteenlopen, van de waterige lichtheid van basic Pinot Grigio-achtige stijlen tot de bijna roodwijnachtige densiteit van Bandol, is precies waarom body als aparte as naast kleur en aromatiek moet worden beoordeeld.

Tavel AOC in de zuidelijke Rhône illustreert dit mechanisme het duidelijkst van alle Franse appellaties: het is de enige AOC in Frankrijk die uitsluitend rosé mag produceren — geen witte of rode wijn is toegestaan onder de naam Tavel. Om die rosé voldoende body en bewaarpotentieel te geven, past Tavel een technische ingreep toe die bij de meeste andere rosé ongebruikelijk is: perswijn (het sap dat na het eerste, zachte persen vrijkomt, rijker aan fenolen dan het vrijloopsap) wordt vóór de gisting bewust bijgemengd met het vrijloopsap, in combinatie met een langere maceratieduur dan bij Provence gebruikelijk is. Het resultaat is een rosé met aantoonbaar meer lichaam en een lichte tastbare fenolische grip — een structuurniveau dat je normaal alleen bij lichte rode wijn verwacht.

Grenache, de verplichte hoofddruif van Tavel (samen met Grenache Blanc en Grenache Gris altijd tussen de 30% en 60% van de aanplant), draagt daarnaast van nature een hoger suikergehalte bij rijpheid, wat automatisch meer alcohol en dus meer ervaren gewicht oplevert dan de doorgaans vroeger geoogste, koelere Provence-druiven.

Praktisch schaalt de inzetbaarheid van rosé exact met deze bodyas: lichte body (Provence, Chiaretto) past bij aperitieven, salades en schaal-en-schelpdieren; medium body (de meeste Rosado''s, Cinsault-gedreven stijlen) past bij vis, kip en pasta; volle body (Tavel, Bandol) kan barbecue, kalfsvlees en kruidige gerechten dragen zonder te verdwijnen.

Body is daarmee het meest praktische, direct bruikbare instrument bij roséservice: het bepaalt sneller dan kleur of aromatiek of een gerecht de wijn zal overheersen of andersom.


## Food pairing

### Beste pairing

Een volle Tavel bij lamskotelet, of lichte Provence bij oesters — afhankelijk van bodyniveau.

### Waarom dit werkt

Het lichaam van de wijn bepaalt of ze het gewicht van het gerecht kan dragen: vol lichaam matcht vol gerecht, licht lichaam matcht subtiliteit.

### Vermijd

Een lichte Provence bij een zwaar gekruid stoofgerecht — het gerecht overweldigt de wijn volledig ondanks een op zich passend aromaprofiel.

## Pro insight

Leg bij een Tavel expliciet uit dat de extra body geen toeval is maar een bewuste blend van perswijn en vrijloopsap — dat verklaart in één zin waarom deze rosé zwaarder aanvoelt dan een gast van rosé zou verwachten.',
    '- perswijn-vrijloopsapmenging Tavel
- Tavel-exclusiviteit uitsluitend rosé
- lees-batonnage-textuur
- moutgewicht-en-extractie-as
- bodygebonden-inzetbaarheidsschaal
',
    'Bandol rosé heeft vaak bijna rode-wijn-achtige structuur.
',
    '- Body wordt bepaald door moutgewicht, fenolische extractie en eventuele lees-batonnage
- Tavel is de enige Franse AOC die uitsluitend rosé produceert
- Tavel mengt bewust perswijn bij het vrijloopsap en macereert langer voor extra lichaam en een lichte fenolische grip
- Grenache (verplicht 30–60% van de aanplant in Tavel) draagt van nature meer suiker en dus meer gewicht bij
- Lichte, medium en volle body koppelen direct aan aperitief-, vis-kip- en barbecuegerechten
',
    '### Opdracht

Maak een lijst van drie rosés op body.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Welke drie rosé''s op jouw kaart zou jij puur op body rangschikken — en verandert die volgorde jouw huidige pairingadvies?',
    8,
    4
  ),
  (
    'rose-als-maaltijdwijn',
    'Rosé als maaltijdwijn',
    'Na deze les begrijp jij waarom rosé een serieuze gastronomische wijn is.
',
    'Rosé wordt aan tafel structureel onderschat, en dat is precies waarom deze les de vorige vier samenbrengt tot één centrale, gastronomische stelling: rosé is geen verdunde rode wijn en geen gezoete witte wijn, maar een eigen categorie met een eigen productielogica — en die logica maakt haar juist extreem geschikt als maaltijdwijn.

De kern van dat argument is de onafhankelijke kleur-tannine-as die in les 26 werd geïntroduceerd. Bij rode wijn zijn kleurdiepte en tanninegehalte gekoppeld: beide stijgen met dezelfde maceratieduur op de schillen. Bij rosé zijn ze ontkoppeld — het persmoment bepaalt de kleur, terwijl de fermentatieduur op de schillen per definitie vrijwel nul is, ongeacht hoe diep de kleur is. Een rosé kan dus relatief donker zijn (Tavel) zonder ook maar in de buurt te komen van de tanninestructuur van zelfs de lichtste rode wijn. Die ontkoppeling is precies wat rosé flexibiliteit geeft die geen enkele andere categorie evenaart.

Diezelfde ontkoppeling verklaart waarom rosé tegelijk fris genoeg is voor lichte gerechten (dankzij de vroege oogst en geblokkeerde appelzuur-melkzuurgisting uit les 26) én lichaam genoeg heeft voor complexere gerechten (dankzij de body-opbouw uit les 29) zonder dat het één het andere in de weg zit — een wijnstijl kan zuur én body tegelijk hoog houden op een manier die bij rode wijn zelden voorkomt, omdat rode wijn zijn structuur nu eenmaal via tannine opbouwt.

Praktisch verklaart dit waarom rosé zo breed werkt: Mediterrane keuken (kruidigheid uit les 28 matcht met garrigue-gerechten), Aziatische keuken (fruit en zuurspanning bufferen specerij), barbecue (zuur snijdt vet) en charcuterie (zuurspanning weerstaat zout) delen geen enkel gemeenschappelijk kenmerk behalve dat ze allemaal profiteren van een wijn die tegelijk zuur, fruit én enig lichaam kan combineren zonder dat tannine een van die assen beperkt.

Dat maakt rosé, mits de juiste stijl bewust gekozen wordt op basis van structuur in plaats van op kleur of imago, een van de meest veelzijdige maaltijdwijnen die een sommelier ter beschikking heeft — serieuzer dan het imago van ''zomerwijn'' doet vermoeden.


## Food pairing

### Beste pairing

Een driegangenmenu waarbij elke gang een andere roséstijl krijgt: licht bij het voorgerecht, kruidig bij het hoofdgerecht, vol bij de kaas.

### Waarom dit werkt

Elke gang gebruikt een andere combinatie van zuur, fruit en lichaam uit hetzelfde rosé-spectrum, wat de brede inzetbaarheid van de categorie in één menu bewijst.

### Vermijd

Eén enkele lichte rosé door het hele menu heen serveren — dat negeert precies de structuurvariatie die rosé zo veelzijdig maakt.

## Pro insight

Gebruik de ontkoppelde kleur-tannine-as als kernargument wanneer een gast rosé afdoet als ''geen serieuze keuze'' — het verplaatst het gesprek van imago naar aantoonbare productielogica.',
    '- ontkoppelde kleur-tannine-as
- fermentatieduur-op-schillen-nul
- eigen-categorie-identiteit
- gecombineerde zuur-en-lichaamscapaciteit
- gastronomische onderschatting
',
    'Toprestaurants werken steeds vaker met rosépairings.
',
    '- Rosé is geen verdunde rode wijn: kleur en tannine zijn ontkoppelde, onafhankelijk stuurbare variabelen
- Fermentatieduur op de schillen is bij rosé per definitie vrijwel nul, ongeacht hoe diep de kleur is
- Die ontkoppeling laat rosé tegelijk hoog zuur én voldoende lichaam combineren, iets rode wijn zelden doet
- Mediterrane, Aziatische, barbecue- en charcuteriepairing delen geen kenmerk behalve profijt van die combinatie
- Rosé is een eigen categorie met een eigen productielogica, geen tussenvorm van wit en rood
',
    '### Opdracht

Maak een 3-gangenmenu met rosépairing.

### Checklist

- Ik heb voorgerecht gekozen
- Ik heb hoofdgerecht gekozen
- Ik heb roséstijl gekoppeld
- Ik kan mijn keuzes uitleggen


### Reflectievraag

Bij welk gerecht op jouw kaart zou jij een gast nu bewust naar rosé sturen in plaats van naar het automatische witte of rode alternatief — en met welk mechanisme onderbouw je dat?',
    8,
    5
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- service-rose-wine (4 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'service-rose-wine'
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
    'Na deze les weet jij welke temperatuur ideaal is voor verschillende roséstijlen.
',
    'Serveertemperatuur bij rosé stuurt, net als bij witte en rode wijn, een vluchtigheids- en tastmechanisme tegelijk — maar de precieze balans verschilt per stijl, omdat het fenolisch fundament van rosé structureel varieert (les 26–29). Te koud onderdrukt de vluchtigheid van esters en aromatische verbindingen zo sterk dat de wijn ''gesloten'' oogt, terwijl koude tegelijk de zoetheidsperceptie van de tong onderdrukt zonder de zuurperceptie evenredig te dempen — het netto-effect is een wijn die kouder plots scherper en minder aromatisch overkomt. Te warm versnelt de verdamping van ethanol, wat de alcohol prominenter maakt en de zuurspanning laat wegzakken.

Omdat de bleke, protectief gevinifieerde stijl (les 26) nauwelijks fenolische substantie heeft om tegen te beschermen, kan en moet die stijl het koudst geserveerd worden: 8–10 °C. Fruitige, sappige stijlen (les 27) zitten net iets hoger, 9–11 °C, omdat hun rijpere esterprofiel iets meer ruimte nodig heeft om zich te openen zonder de zuurspanning te verliezen. Gastronomische, structuurrijkere stijlen zoals Tavel en Bandol (les 28–29) vragen 11–13 °C: hun hogere fenolconcentratie — deels uit perswijnmenging, deels uit langer schilcontact — heeft dezelfde eiwitbindingskinetiek nodig die ook bij rode wijn tannine ronder maakt bij een net iets hogere temperatuur. Te koud geserveerd voelt zo''n rosé daardoor onnodig hard en onvolledig aan.

Deze structuurafhankelijke temperatuurcurve is dus geen esthetische voorkeur maar een direct gevolg van hetzelfde fenolische fundament dat in de vorige lessen werd opgebouwd: hoe meer fenolische substantie een rosé draagt, hoe meer ze baat heeft bij een fractie extra warmte om die substantie soepel te laten integreren.

Praktisch protocol: schenk 1 °C onder de uiteindelijke doeltemperatuur, want het glas en de ruimte warmen de wijn vanzelf op tijdens het drinken — identiek aan het principe bij witte en rode wijn, maar met een smallere marge omdat rosé''s fenolische buffer kleiner is en dus sneller uit balans raakt bij een verkeerde temperatuur.

Een structureel probleem in de praktijk is dat rosé bijna overal standaard ijskoud wordt geserveerd, ongeacht stijl — waardoor juist de meest gastronomisch interessante, structuurrijke rosé''s stelselmatig te koud en dus onder hun niveau worden geschonken.


## Food pairing

### Beste pairing

Dezelfde Bandol rosé geserveerd op 8 °C en op 12 °C naast lamskotelet.

### Waarom dit werkt

Bij 12 °C integreert de fenolische substantie soepel met het vlees; bij 8 °C voelt de wijn onnodig hard en onderontwikkeld aan naast hetzelfde gerecht.

### Vermijd

Een lichte Provence op 14 °C bij een lichte salade — te warm serveren laat de alcohol domineren over de subtiele, bedoeld koele esters.

## Pro insight

Vraag jezelf bij elke rosé eerst af welk fenolisch fundament ze draagt (les 26–29) vóór je de ijsemmer pakt — een Tavel of Bandol verdient een paar graden meer dan een basic Provence.',
    '- structuurafhankelijke temperatuurcurve
- zoetheidsonderdrukking bij koude
- eiwitbindingskinetiek-rosé
- kleinere fenolische temperatuurmarge
- structurele overkoeling-in-de-praktijk
',
    'Veel rosé wordt structureel te koud geserveerd.
',
    '- Koude onderdrukt zoetheidsperceptie zonder de zuurperceptie evenredig te dempen — te koud maakt een rosé scherper en gesloten
- Bleke stijl: 8–10 °C; fruitige stijl: 9–11 °C; gastronomische, fenolrijkere stijl (Tavel, Bandol): 11–13 °C
- Structuurrijkere rosé profiteert van dezelfde eiwitbindingskinetiek die tannine bij rode wijn ronder maakt
- Schenk 1 °C onder de doeltemperatuur — de marge is kleiner dan bij rood door de kleinere fenolische buffer
- Rosé wordt in de praktijk bijna altijd standaard te koud geserveerd, ongeacht stijl
',
    '### Opdracht

Serveer dezelfde rosé op 8 °C en op 12 °C.

### Checklist

- Ik koppelde mijn keuze aan servicecontext (glas en temperatuur)


### Reflectievraag

Welke rosé op jouw kaart serveer je vermoedelijk stelselmatig te koud voor haar structuurniveau — en wat zou je proeven na correctie dat je nu mist?',
    8,
    1
  ),
  (
    'glaswerk',
    'Glaswerk',
    'Na deze les begrijp jij welk glas het beste werkt voor rosé.
',
    'Glasgeometrie stuurt bij rosé exact hetzelfde tweeledige mechanisme als bij wit en rood: het verdampingsoppervlak dat bepaalt hoeveel aroma vrijkomt vóór het glas de neus bereikt, en de plek op de tong waar de wijn eerst landt. Bij rosé is de doorslaggevende as echter niet tannine (rood) of puur aromatische intensiteit (wit), maar het fenolische structuurniveau dat in lessen 26–29 werd opgebouwd.

Voor de bleke, protectief gevinifieerde stijl volstaat een kleiner witwijnglas: het beperkte oppervlak concentreert de toch al subtiele esters en citrus-mineraaltonen in plaats van ze te verdunnen in te veel lucht, en stuurt de wijn naar het puntje van de tong waar de strakke zuurgraad het eerst wordt opgemerkt. Voor volle, structuurrijke rosé — Tavel, Bandol, premium Rosado — werkt een groter witwijnglas beter: het grotere oppervlak geeft de extra fenolische substantie ruimte om zich te openen, en sommeliers gebruiken hiervoor steeds vaker bewust een Bourgondië-witwijnglas in plaats van het standaard, kleinere rosé-glas dat de meeste horecazaken automatisch serveren.

Vermijd expliciet drie situaties: te kleine glazen die volle rosé''s verstikken, dikke, generieke horecaglazen die de eerste tastindruk vertragen doordat de rand niet scherp genoeg geslepen is, en klassieke rodewijnglazen bij lichte rosé — dat laatste geeft veel te veel beluchting aan een wijn die juist precisie en concentratie nodig heeft.

De categorie krijgt bovendien serieuze technische aandacht: enkele grote roséhuizen hebben, samen met glasfabrikanten, gewerkt aan een specifiek ''verre à rosé''-ontwerp, precies omdat standaard witwijnglazen niet altijd optimaal zijn voor het brede spectrum aan rosé-structuurniveaus — een teken dat de categorie inmiddels serieus genoeg wordt genomen om eigen glasontwikkeling te rechtvaardigen.

Net als bij temperatuur geldt: glaskeuze zou bij rosé gestuurd moeten worden door structuurniveau, niet door de kleur van het etiket of de gewoonte om ''gewoon het rosé-glas'' te pakken ongeacht welke stijl erin geschonken wordt.


## Food pairing

### Beste pairing

Een volle Tavel in een groot Bourgondië-witwijnglas bij gegrilde lamskotelet.

### Waarom dit werkt

Het grote glasoppervlak opent de fenolische substantie van de Tavel precies genoeg om het gewicht van het lamsvlees te matchen.

### Vermijd

Diezelfde Tavel in een klein, standaard rosé-glas — de beperkte beluchting laat de structuur ingesloten en onderontwikkeld aanvoelen.

## Pro insight

Schenk een structuurrijke Tavel of Bandol bewust in een groter witwijnglas in plaats van het standaard rosé-glas — het directe verschil in aromatische opening overtuigt een gast sneller dan enige uitleg.',
    '- structuurgeleide glaskeuze
- witwijnglas-versus-Bourgondiëglas
- randgeslepenheid-tastindruk
- verre-à-rosé-ontwikkeling
- verkeerd-glas-verstikkingsrisico
',
    'Veel top-sommeliers gebruiken Bourgogne-witwijnglazen voor serieuze rosé.
',
    '- Glasoppervlak bepaalt beluchting én de plek op de tong waar rosé het eerst landt
- Bleke rosé: kleiner witwijnglas concentreert subtiele esters en stuurt naar het tongpuntje
- Volle, structuurrijke rosé (Tavel, Bandol): groter witwijnglas of Bourgondië-glas geeft de fenolen ruimte
- Vermijd te kleine glazen, dikke horeca-glazen en rodewijnglazen bij lichte rosé
- Sommige roséhuizen ontwikkelden samen met glasfabrikanten een specifiek ''verre à rosé''-ontwerp
',
    '### Opdracht

Proef rosé uit twee verschillende glazen.

### Checklist

- Ik heb minstens twee concrete punten genoteerd


### Reflectievraag

Welke rosé op jouw kaart wordt structureel in het verkeerde glas geschonken — en wat is de impact daarvan op hoe een gast de wijn beoordeelt?',
    8,
    2
  ),
  (
    'bewaren',
    'Bewaren',
    'Na deze les weet jij hoe rosé correct wordt opgeslagen.
',
    'Rosé is qua opslag structureel de kwetsbaarste van de drie wijnkleuren, om een reden die verder gaat dan ''de meeste rosé is jong bedoeld om te drinken''. Het fenolische fundament van rosé — vooral bij de bleke, protectief gevinifieerde stijl uit les 26 — is aanzienlijk kleiner dan bij rode wijn en vaak ook kleiner dan bij stevigere witte wijn, wat betekent dat de natuurlijke antioxidantbuffer die polyfenolen bieden er simpelweg beperkter is. Warmte, zuurstof en temperatuurschommelingen tasten die kleine buffer sneller aan dan bij rode wijn, met een merkbare oxidatieve kleurverschuiving (van roze naar zalm en uiteindelijk richting koper) en verlies van precies de esters die in les 26–29 zo zorgvuldig werden opgebouwd.

Een tweede, specifiek en vaak onderschat risico is lichtschade: rosé wordt commercieel vaak in helder glas gebotteld om de kleur zichtbaar te maken als verkoopargument, wat de wijn structureel kwetsbaarder maakt voor ''goût de lumière'' dan wijn in getint glas. Riboflavine in de wijn absorbeert UV- en zichtbaar licht, komt in een aangeslagen toestand terecht en reageert vervolgens met methionine tot vluchtige zwavelverbindingen (onder meer dimethyldisulfide) die een herkenbare, onaangename gekookte-koolgeur veroorzaken. Omdat rosé disproportioneel vaak in helder glas verkocht wordt, is dit voor deze categorie een reëel, meetbaar kwaliteitsrisico — geen theoretische bijzaak.

Ideale opslag blijft daarom onverkort: donker, koel, stabiele temperatuur en liggend bij een kurksluiting om de kurk vochtig te houden. Bij rosé is het vermijden van licht — zowel zonlicht als fel winkelverlichting — relatief belangrijker dan bij rode wijn, precies vanwege die combinatie van helder glas en beperkte fenolische bescherming.

Structuurrijkere stijlen (Bandol, Tavel) hebben, dankzij hun grotere fenolische fundament uit langer schilcontact en perswijnmenging (les 28–29), een reëel grotere antioxidantbuffer en verliezen hun kwaliteit merkbaar langzamer dan de bleke of fruitige stijl — de basis voor het bewaarpotentieel dat in les 34 wordt uitgewerkt.

Voor de meeste rosé geldt onverkort: binnen één tot drie jaar drinken is geen compromis maar precies het venster waarin het fenolische en aromatische fundament optimaal intact is.


## Food pairing

### Beste pairing

Een jonge, goed opgeslagen rosé binnen zijn optimale venster van één tot drie jaar bij verse schaaldieren.

### Waarom dit werkt

De intacte esters en zuurspanning van een correct bewaarde jonge rosé matchen precies de subtiliteit van vers schaal- en schelpdier.

### Vermijd

Een rosé die lang in helder glas onder fel licht heeft gestaan bij hetzelfde gerecht — een beginnende gekookte-koolgeur ondermijnt de subtiliteit direct.

## Pro insight

Controleer expliciet of jouw rosé-voorraad in helder glas onder felle winkel- of keukenverlichting staat — dat ene detail veroorzaakt meer kwaliteitsverlies bij rosé dan bij vrijwel elke andere wijnstijl.',
    '- lichtschade-riboflavinereactie
- helder-flesglas-kwetsbaarheid
- kleinere fenolische antioxidantbuffer
- oxidatieve kleurverschuiving roze-naar-koper
- structuurafhankelijk bewaartempo
',
    'Lichte Provence rosé verliest vaak sneller zijn optimale zuurspanning dan krachtigere rosés.
',
    '- Rosé heeft een kleinere fenolische antioxidantbuffer dan rode wijn, waardoor oxidatie sneller optreedt
- Kleurverschuiving van roze naar zalm en koper signaleert die oxidatieve aftakeling
- Helder flesglas — vaak gekozen om de kleur te tonen — maakt rosé extra gevoelig voor lichtschade (goût de lumière)
- Riboflavine reageert onder licht met methionine tot zwavelverbindingen die een gekookte-koolgeur geven
- Structuurrijkere stijlen (Bandol, Tavel) hebben een grotere fenolische buffer en verouderen langzamer
',
    '### Opdracht

Controleer jouw wijnopslag.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Waar in jouw zaak staat rosé mogelijk te lang blootgesteld aan licht — en welke concrete aanpassing zou dat risico het snelst verminderen?',
    8,
    3
  ),
  (
    'jong-drinken-vs-rijping',
    'Jong drinken vs rijping',
    'Na deze les kun jij bepalen welke rosés rijpingspotentieel hebben.
',
    'De meeste rosé is terecht bedoeld om jong gedronken te worden — maar ''meeste'' is geen ''alle'', en het onderscheid volgt direct uit het fenolische fundament dat in de vorige lessen is opgebouwd. Rosé''s met reëel bewaarpotentieel (Bandol, Tavel, enkele premium Rosado''s) delen precies de kenmerken die in les 28–29 en 33 al naar voren kwamen: meer structuur uit een hoger Mourvèdre- of Grenache-aandeel, meer fenolische extractie door langer schilcontact of bewuste perswijnmenging, en dus een grotere natuurlijke antioxidantbuffer.

Wat er tijdens rijping ontwikkelt, verschilt van zowel rode als witte wijn door de beperkte antocyaanpool waarmee rosé start. Bij rode wijn binden vrije antocyanen geleidelijk aan tannine tot stabielere pigmentpolymeren, een langzaam proces dat decennia kan duren. Bij rosé is die antocyaanpool zo veel kleiner dat de visuele overgang van roze naar zalm en uiteindelijk koper zich veel sneller voltrekt — vaak binnen enkele jaren in plaats van decennia — en het aromatische eindpunt is ook anders: minder de leer-en-tabak-tonen van oude rode wijn, meer gedroogd fruit, kruiden en aardse, savoury tonen die voortbouwen op de kruidigheid uit les 28.

Bandol rosé is de duidelijkste uitzondering op de vroegdrink-regel: dankzij het wettelijke Mourvèdre-minimum en de bijbehorende fenolische substantie kan een goede Bandol rosé vijf tot tien jaar ontwikkelen, een venster dat voor de meeste andere rosé volledig ontbreekt.

Belangrijk is dat structuur niet automatisch garandeert dat een rosé beter wordt met tijd — sommige structuurrijke stijlen zijn bewust zo gemaakt dat ze hun beste venster juist binnen twee tot drie jaar bereiken. Rijpings-potentieel moet daarom per fles worden ingeschat op basis van het onderliggende fenolische fundament, niet aangenomen op basis van regio of prijs alleen.

Praktisch betekent dit een bewuste segmentatie: vroegdrinkstijlen (Provence, Chiaretto, de meeste Rosado) binnen één tot drie jaar consumeren, en structuurrijke uitzonderingen (Bandol, Tavel, geselecteerde premium cuvées) bewust apart houden voor een langer venster — zodat geen enkele fles per ongeluk te vroeg of te laat wordt geopend.


## Food pairing

### Beste pairing

Een vijf jaar oude Bandol rosé met kruidige, gedroogd-fruittonen bij gestoofde kip met olijven.

### Waarom dit werkt

De ontwikkelde kruiden- en gedroogd-fruittonen van de gerijpte rosé spiegelen de langzaam gegaarde, savoury smaken van het stoofgerecht.

### Vermijd

Een jonge, bleke Provence lang laten liggen in de hoop op ontwikkeling — het beperkte fenolische fundament stort dan eerder in dan dat het complexiteit opbouwt.

## Pro insight

Vraag bij elke structuurrijke rosé expliciet naar het Mourvèdre- of Grenache-aandeel en het schilcontact vóór je bewaaradvies geeft — regio of prijs alleen zijn onvoldoende bewijs voor rijpingspotentieel.',
    '- beperkte antocyaanpool-rosé
- kleurtransitie roze-naar-koper versnelde tijdlijn
- Bandol-bewaarcapaciteit vijf-tot-tien-jaar
- fenolisch-fundament-als-rijpingsbewijs
- vroegdrink-versus-uitzonderingssegmentatie
',
    'Bandol rosé kan soms 5–10 jaar rijpen.
',
    '- Rijpingspotentieel volgt direct uit hetzelfde fenolische fundament als structuur en bewaring (les 28–29, 33)
- De kleine antocyaanpool van rosé laat de kleur veel sneller verschuiven dan bij rode wijn (jaren in plaats van decennia)
- Rijpe rosé ontwikkelt gedroogd fruit, kruiden en aardse tonen — een ander eindpunt dan oude rode wijn
- Bandol rosé kan dankzij het Mourvèdre-minimum vijf tot tien jaar ontwikkelen
- Structuur garandeert geen rijpingspotentieel automatisch — beoordeel per fles op fenolisch fundament
',
    '### Opdracht

Zoek drie rosés en schat hun bewaarpotentieel.

### Checklist

- Ik heb de stijl bekeken
- Ik heb body beoordeeld
- Ik heb extractie ingeschat
- Ik heb bewaarpotentieel bepaald


### Reflectievraag

Welke fles rosé in jouw assortiment zou jij, op basis van haar fenolisch fundament, bewust apart leggen voor een langer bewaarvenster — en welke zou je juist versneld willen verkopen vóórdat ze haar venster mist?',
    8,
    4
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- pairing-rose-wine (6 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'pairing-rose-wine'
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
    'rose-en-salades',
    'Rosé & salades',
    'Na deze les begrijp jij waarom rosé uitstekend werkt met salades.
',
    'Salades lijken op het eerste gezicht het makkelijkste pairingterrein, maar zijn technisch een van de lastigste categorieën — en rosé wint dit terrein via een specifiek zuurmatchingmechanisme dat de meeste andere wijnstijlen missen. Vinaigrettedressing bevat overwegend azijnzuur, een aanzienlijk scherper en vluchtiger zuur dan het wijnzuur en appelzuur dat in wijn domineert. Als de wijn zelf onvoldoende zuurgraad heeft, ontstaat een asymmetrisch contrast: de dressing ''wint'' het zuurgesprek, en de wijn proeft daardoor plat en substantieloos, ongeacht hoe goed diezelfde wijn zonder dressing zou proeven.

Rosé''s geblokkeerde appelzuur-melkzuurgisting (les 26) houdt precies die hoge, rechte zuurgraad in stand die nodig is om tegen azijnzuur op te wegen — een eigenschap die de meeste rode wijnen missen, omdat rode wijn vrijwel altijd wél volledige appelzuur-melkzuurgisting ondergaat en dus structureel ronder, minder scherp zuur heeft.

Bladgroenten voegen een tweede mechanisme toe: bittere groenten zoals rucola en radicchio bevatten chlorofyl en andere bittere verbindingen die in combinatie met tannine de bitterheidsperceptie versterken — een bekende valkuil bij lichte rode wijn bij salades. Omdat de bleke en fruitige roséstijlen (les 26–27) vrijwel geen tannine bevatten dankzij hun korte schilcontact, ontwijkt rosé deze bitterheidsval structureel, terwijl zelfs de lichtste rode wijn er gevoelig voor blijft.

Vet uit kaas of noten in een salade vraagt bovendien enig lichaam om niet weggedrukt te worden — precies waar de bodyas uit les 29 relevant wordt: een salade met geitenkaas of walnoten kan een net iets vollere rosé (medium body) beter dragen dan de allerlichtste stijl.

Rosé werkt bij salades dus niet ''omdat het toevallig licht en fris is'', maar omdat haar specifieke combinatie van hoge, ongeronde zuurgraad en vrijwel afwezig tannine precies de twee grootste pairingvallen van salades — zuurasymmetrie en tannine-chlorofylbitterheid — tegelijk vermijdt.


## Food pairing

### Beste pairing

Een geitenkaassalade met walnoten en een citrusvinaigrette bij een medium body Provence of Navarra rosado.

### Waarom dit werkt

De hoge zuurgraad van de rosé matcht de dressing zonder plat te worden, terwijl het iets vollere lichaam het vet van kaas en noten opvangt.

### Vermijd

Een zeer bittere rucolasalade bij een tanninerijke rode wijn — chlorofyl en tannine versterken elkaars bitterheid tot een onaangename combinatie.

## Pro insight

Vraag bij een salade eerst naar het type dressing (azijn- versus citruszuur) vóór je een rosé kiest — dat bepaalt direct hoeveel zuurgraad de wijn nodig heeft om niet plat te proeven.',
    '- azijnzuur-versus-wijnzuur-asymmetrie
- chlorofyl-tanninebitterheid-valkuil
- geblokkeerde-gisting-als-pairingtroef
- vetgehalte-lichaamsmatch-salade
- dubbele-pairingvalvermijding
',
    'Zure vinaigrettes maken veel rode wijn hard, maar rosé blijft vaak in balans.
',
    '- Vinaigrette bevat azijnzuur, scherper dan het wijnzuur/appelzuur in wijn — onvoldoende zuur in de wijn geeft een plat resultaat
- Geblokkeerde appelzuur-melkzuurgisting houdt rosé''s zuurgraad hoog genoeg om tegen azijnzuur op te wegen
- Chlorofyl in bittere bladgroenten versterkt bitterheid in combinatie met tannine — een valkuil die tanninearme rosé vermijdt
- Vet uit kaas of noten in een salade vraagt om iets meer lichaam (medium body) dan de allerlichtste rosé
- Rosé vermijdt bij salades tegelijk zuurasymmetrie én tannine-chlorofylbitterheid — twee aparte pairingvallen
',
    '### Opdracht

Kies drie salades en bepaal passende roséstijl.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Welke salade op jouw kaart lijkt lastig te pairen — en welk mechanisme (zuurasymmetrie of chlorofylbitterheid) verklaart waarom rosé daar beter werkt dan het automatische witte of rode alternatief?',
    8,
    1
  ),
  (
    'rose-en-vis',
    'Rosé & vis',
    'Na deze les kun jij rosé koppelen aan visgerechten.
',
    'Dat rosé opmerkelijk goed werkt bij vis, is geen toevalstreffer maar het resultaat van een specifiek chemisch mechanisme dat rode wijn structureel mist en witte wijn slechts gedeeltelijk biedt. Rode wijn en vis vormen vaak een beruchte mismatch: het ijzer in visvet en de trimethylamine-verbindingen die vis hun kenmerkende geur geven, reageren met tannine en polyfenolen tot een onaangename metaalachtige, versterkt visserige bijsmaak — een reactie die food-science-onderzoek naar wijn-visparingen herhaaldelijk heeft bevestigd.

Rosé''s fenolische fundament is, dankzij het korte tot gematigde schilcontact uit les 26–28, precies laag genoeg om die ijzer-tannine-reactie te vermijden — vergelijkbaar met witte wijn op dat punt — maar hoog genoeg om, in tegenstelling tot de meeste zuiver aromatische witte wijn, een lichte tastbare textuur te bieden die vettere vissoorten nodig hebben om niet flets te proeven naast de wijn.

Die textuurbehoefte schaalt direct met het vetgehalte van de vis: lichte, magere vis en rauwe bereidingen (gegrilde dorade, ceviche, tonijntartaar) werken het best met de bleke, hoogzure stijl uit les 26, waar precisie en zuurspanning vooropstaan. Vettere vis (zalm, tonijnsteak, mediterrane visgerechten met olijfolie) vraagt de iets vollere, medium body stijl uit les 29, waar het extra lichaam het extra visvet in balans houdt zonder de wijn te laten verdwijnen.

Tonijn is hierbij de meest geciteerde topcombinatie, en niet zonder reden: het is vet genoeg om lichaam te vragen, maar de vleesachtige, bijna steakachtige textuur van tonijn tolereert bovendien de lichte fenolische grip van een structuurrijkere rosé beter dan delicatere vissoorten dat zouden doen — een combinatie waarin rosé letterlijk de brug vormt tussen de zuurspanning die vis normaal vraagt en het lichaam dat vlees normaal vraagt.

Dat dubbele voordeel — geen ijzer-tannine-risico, wél voldoende textuur voor vettere vis — verklaart waarom rosé bij visgerechten vaak overtuigender presteert dan zowel een zuiver aromatische witte wijn als een lichte rode wijn.


## Food pairing

### Beste pairing

Tonijnsteak of gegrilde zalm bij een medium body rosé zoals een Cinsault-gedreven Rosado.

### Waarom dit werkt

Het extra lichaam van de rosé matcht het visvet, terwijl de afwezigheid van zware tannine de klassieke ijzer-tannine-mismatch met vis volledig vermijdt.

### Vermijd

Diezelfde vettere vis bij een tanninerijke rode wijn — de combinatie van visvet en tannine riskeert een metaalachtige, onaangename bijsmaak.

## Pro insight

Vraag bij visgerechten eerst naar het vetgehalte van de vis vóór je tussen een bleke of vollere rosé kiest — dat ene detail voorkomt zowel een te magere als een te logge match.',
    '- ijzer-tannine-visreactie
- trimethylamine-visgeur
- fenolische textuurgrip-vis
- vetgehalte-visschaal
- tonijn-brugcategorie
',
    'Rosé is één van de beste wijnen bij tonijn.
',
    '- IJzer en trimethylamine in visvet reageren met tannine tot een metaalachtige, versterkt visserige bijsmaak — een bekend risico bij rode wijn
- Rosé''s lage fenolgehalte vermijdt die ijzer-tannine-reactie net als witte wijn
- Rosé biedt tegelijk net genoeg textuur voor vettere vis, iets wat zuiver aromatische witte wijn vaak mist
- Magere, rauwe vis vraagt de bleke, hoogzure stijl; vettere vis vraagt de vollere, medium body stijl
- Tonijn combineert vetgehalte met een vleesachtige textuur die de lichte fenolische grip van structuurrijkere rosé goed verdraagt
',
    '### Opdracht

Bedenk drie visgerechten en kies stijl.

### Checklist

- Ik heb minstens drie concrete punten genoteerd


### Reflectievraag

Bij welk visgerecht op je kaart adviseer je nu automatisch witte wijn — en zou een rosé met net iets meer lichaam daar een betere textuurmatch bieden?',
    8,
    2
  ),
  (
    'rose-en-barbecue',
    'Rosé & barbecue',
    'Na deze les begrijp jij waarom rosé perfect werkt bij barbecue.
',
    'Barbecue is een van de meest veeleisende pairingcategorieën omdat ze vier mechanismen tegelijk activeert — rook, vet, kruiden en Maillard-geroosterde korstvorming — en rosé blijkt, meer dan rode wijn, in staat om alle vier tegelijk te bedienen zonder dat er één domineert.

De Maillard-reactie op het geschroeide oppervlak van gegrild vlees vormt onder meer guaiacol en verwante fenolische rookverbindingen. Kruidige rosé (les 28), met haar rotundone- en garrigue-gedreven aromatiek, vangt die rooktonen aromatisch op via dezelfde fenolische familie — een directe aroma-op-aroma-brug, vergelijkbaar met het mechanisme waarmee houtgelagerde rode wijn resoneert met geroosterd vlees, maar dan zonder de zware tanninelast die rode wijn daarbij meebrengt.

Dat ontbreken van zware tannine is cruciaal bij zoete barbecuesauzen en glazuren: suiker versterkt de perceptie van bitterheid en astringentie van tannine, wat een klassieke mismatch veroorzaakt tussen tanninerijke rode wijn en zoete glazuren. Rosé''s beperkte tanninegehalte omzeilt dat risico structureel, terwijl haar eigen, van nature aanwezige rijpheid (les 27) de zoetheid van een glazuur juist kan spiegelen in plaats van ertegen te botsen.

Vet in gegrild vlees en groenten wordt, net als bij andere pairings in deze module, door zuur gesneden — en rosé''s zuurgraad blijft ook bij warmere barbecuegerechten hoger dan die van de meeste rode wijn, dankzij dezelfde vroege oogst en geblokkeerde appelzuur-melkzuurgisting die in les 26 en 35 al naar voren kwamen.

Het resultaat is een categorie waarin rosé — mits met voldoende body gekozen (Tavel, Bandol, Syrah-gedreven rosé) — vaak veelzijdiger werkt dan rode wijn: ze bedient rook via aroma, vet via zuur, en zoete glazuren via afwezigheid van tannine, drie afzonderlijke mechanismen die bij rode wijn elkaar regelmatig in de weg zitten.


## Food pairing

### Beste pairing

Gegrilde kip met een zoet-kruidig glazuur bij een kruidige Bandol of Syrah-gedreven rosé.

### Waarom dit werkt

De rook- en kruidentonen resoneren met de rotundone in de wijn, terwijl het lage tanninegehalte de klassieke suiker-tanninebitterheid bij het glazuur vermijdt.

### Vermijd

Datzelfde glazuur bij een stevig gehoute, tanninerijke rode wijn — de combinatie van suiker en tannine riskeert een bittere, onaangename nasmaak.

## Pro insight

Kies bij een zoet glazuur op gegrild vlees bewust een fruitige of kruidige rosé in plaats van een tanninerijke rode wijn — dat vermijdt de bekende suiker-tanninebitterheidsval volledig.',
    '- guaiacol-rooktoonresonantie
- suiker-tanninebitterheidsrisico
- zuurgedreven vetdoorsnijding
- viervoudig-barbecuemechanisme
- tanninevrije-glazuurveiligheid
',
    'Kruidige rosé kan rooktonen beter integreren dan veel lichte rode wijnen.
',
    '- Barbecue activeert rook, vet, kruiden en Maillard-korstvorming tegelijk — vier aparte pairingmechanismen
- Guaiacol en fenolische rookverbindingen resoneren met de rotundone- en garriguetonen van kruidige rosé
- Suiker versterkt tanninebitterheid — rosé''s lage tanninegehalte omzeilt de klassieke mismatch met zoete glazuren
- Rosé''s hogere zuurgraad snijdt vet effectiever dan de gemiddelde rode wijn bij dezelfde temperatuur
- Rosé bedient rook, vet en zoete glazuren via drie aparte mechanismen die elkaar bij rode wijn vaker in de weg zitten
',
    '### Opdracht

Maak een barbecue-menu met rosépairing.

### Checklist

- Ik motiveerde de pairing via zuur-vet, zoutbalans of textuurmatching


### Reflectievraag

Bij welk barbecuegerecht op je kaart met een zoet glazuur adviseer je nu automatisch rode wijn — en zou rosé daar de suiker-tanninebitterheidsval vermijden?',
    8,
    3
  ),
  (
    'rose-en-aziatisch',
    'Rosé & Aziatische keuken',
    'Na deze les kun jij rosé koppelen aan Aziatische gerechten.
',
    'Aziatische keuken combineert spice, umami, zoet-zout en zuur vaak tegelijk, en juist die combinatie maakt rosé fysiologisch en chemisch veiliger dan zowel rode wijn als hoogalcoholische dranken. Capsaïcine, de stof achter chilihitte, activeert de TRPV1-receptor — dezelfde receptor die ook reageert op fysieke hitte. Alcohol versterkt dat TRPV1-signaal aantoonbaar: hoe hoger het alcoholpercentage en hoe warmer de drank geserveerd wordt, hoe intenser de brandende sensatie van chili aanvoelt. Een goed gekoelde, relatief laag-alcoholische rosé (8–11 °C, les 31) is daardoor fysiologisch milder bij pittige gerechten dan een warmer geserveerde, alcoholrijkere rode wijn.

De fruitige, sappige stijl (les 27) voegt een tweede, perceptueel mechanisme toe: een subtiele, van nature aanwezige rijpheid of een lichte restsuiker helpt de scherpte van capsaïcine te dempen, een effect dat in sensorisch onderzoek naar zoetheid-en-pikantheid herhaaldelijk is aangetoond en dat verklaart waarom veel Aziatische keukens zelf al zoet-zuur-zout combineren om pikantheid te temperen.

Umami — geconcentreerd in vissaus, sojasaus en miso — versterkt, net als bij vlees en kaas, de perceptie van bitterheid en een licht metaalachtige bijsmaak wanneer die umami samen met een tanninerijke wijn geproefd wordt. Omdat rosé structureel weinig tot geen tannine draagt, ontwijkt ze dit risico volledig, terwijl rode wijn hier stelselmatig in de problemen komt.

Praktisch resulteert dit in een duidelijke voorkeursvolgorde: sushi en poke bowls werken uitstekend met de bleke, hoogzure stijl (zuurspanning matcht rauwe vis en rijstazijn), terwijl Thaise curry''s en pittige Vietnamese gerechten meer baat hebben bij de fruitige stijl, waar de subtiele zoetheid en het lagere tanninerisico samen de meeste bescherming bieden tegen chili en umami tegelijk.

Vermijd expliciet zwaar gehoute, structuurrijke rosé bij zeer delicate Aziatische gerechten: dezelfde fenolische substantie die bij barbecue of kaas een voordeel is, kan bij subtiele, evenwichtige Aziatische bereidingen juist te dominant overkomen.


## Food pairing

### Beste pairing

Thaise rode curry of Vietnamese pittige gerechten bij een fruitige, licht rijpe rosé.

### Waarom dit werkt

De subtiele zoetheid en lage tanninebasis dempen zowel de capsaïcinescherpte als het umami-tannine-risico tegelijk.

### Vermijd

Een zwaar gehoute, structuurrijke rosé bij delicate sushi — de fenolische substantie overstemt de subtiele rauwe vis en rijstazijn.

## Pro insight

Leg een gast die twijfelt tussen rood en rosé bij een pittig gerecht het TRPV1-mechanisme uit: lager alcohol en een koelere temperatuur maken de chilihitte letterlijk fysiologisch minder intens.',
    '- TRPV1-capsaïcinereceptor
- alcohol-hitteversterking
- umami-tanninerisico vermeden
- esterzoetheid-tegen-pikantheid
- structuurrijke-rosé-oversturingsrisico
',
    'Rosé is vaak veiliger dan rood bij pittige gerechten.
',
    '- Capsaïcine activeert de TRPV1-receptor, en alcohol versterkt dat signaal — laag-alcoholische, gekoelde rosé is milder bij chili
- Rijpheid en lichte restsuiker in fruitige rosé dempen perceptueel de scherpte van capsaïcine
- Umami versterkt bitterheid en metaalachtigheid bij tannine — rosé''s lage tanninegehalte ontwijkt dat risico volledig
- Sushi en poke werken goed met de bleke, hoogzure stijl; pittige curry''s werken beter met de fruitige stijl
- Zwaar gehoute, structuurrijke rosé kan bij delicate Aziatische gerechten juist te dominant overkomen
',
    '### Opdracht

Kies een sushi-menu en selecteer rosé.

### Checklist

- Ik motiveerde de pairing via zuur-vet, zoutbalans of textuurmatching


### Reflectievraag

Bij welk pittig gerecht op je kaart adviseer je nu automatisch rode wijn — en zou een koelere, laag-alcoholische rosé de chilihitte fysiologisch milder maken?',
    8,
    4
  ),
  (
    'rose-en-charcuterie',
    'Rosé & charcuterie',
    'Na deze les begrijp jij waarom rosé goed werkt met charcuterie.
',
    'Charcuterie combineert zout, vet, kruiden en umami in een concentratie die de meeste wijnstijlen op minstens één punt laat struikelen — en rosé''s specifieke combinatie van eigenschappen pakt precies de twee grootste risico''s tegelijk aan.

Het eerste risico is puur chemisch: natriumchloride (zout) interageert met de trigeminale waarneming van tannine en kan de perceptie van astringentie versterken, waardoor stevig tanninerijke rode wijn naast zeer zoute charcuterie ruwer en harder kan aanvoelen dan diezelfde wijn zonder eten. Rosé''s structureel lage tot matige tanninegehalte (les 26–29) omzeilt dit risico grotendeels, terwijl geconcentreerd gezouten producten zoals prosciutto of salami bij een tanninerijke rode wijn dit effect juist uitvergroten.

Het tweede risico is textuurmatch: het curingproces van charcuterie concentreert zowel zout als vet, en die combinatie vraagt een wijn met voldoende zuurgraad om het palet te verfrissen tussen happen door — hetzelfde principe waarom mousserende wijn en Champagne klassiek bij charcuterie werken. Rosé''s hoge, geblokkeerde zuurgraad (les 26, 35) vervult die rol, terwijl een zuiver hoogzure witte wijn vaak te weinig lichaam heeft om het gewicht van vet en zout volledig te dragen — het fenolische fundament van rosé (les 29) geeft precies de extra textuur die daarvoor nodig is.

Umami, sterk aanwezig in gerijpte hammen en terrines, versterkt — net als bij vlees, kaas en Aziatische gerechten — de perceptie van bitterheid bij tannine. Ook hier geldt: hoe minder tannine, hoe kleiner het risico, wat rosé structureel in het voordeel plaatst ten opzichte van zwaardere rode wijn.

Het resultaat is een categorie waarin rosé, ondanks haar reputatie als lichte zomerwijn, technisch beter is toegerust dan veel zwaardere rode wijn — een van de meest onderschatte pairingcombinaties in de hele gastronomie.


## Food pairing

### Beste pairing

Prosciutto, salami en jamón op een charcuterieplank bij een medium body, kruidige rosé.

### Waarom dit werkt

De hoge zuurgraad verfrist het palet tussen happen door, terwijl het lage tanninegehalte de zout-tannine-verharding vermijdt die zwaardere rode wijn hier zou veroorzaken.

### Vermijd

Een stevig tanninerijke, jonge rode wijn bij zeer zoute, gerijpte ham — zout en umami versterken samen de tanninebitterheid tot een ruwe, onaangename combinatie.

## Pro insight

Wijs een gast die automatisch rode wijn bij een charcuterieplank kiest op het zout-tannine-mechanisme — dat is een concreet, uitlegbaar argument om in plaats daarvan rosé te adviseren.',
    '- zout-tannine-trigeminale-interactie
- curingconcentratie vet-en-zout
- fenolische-textuur-versus-hoogzure-witte-wijn
- umami-tanninerisico-charcuterie
- onderschatte-charcuteriecategorie
',
    'Rosé is één van de meest onderschatte charcuterie-wijnen.
',
    '- Zout interageert met de trigeminale waarneming van tannine en kan astringentie versterken — rosé''s lage tannine omzeilt dit
- Curing concentreert zout en vet, wat om voldoende zuurgraad vraagt om het palet te verfrissen
- Rosé''s fenolische fundament geeft net genoeg textuur om het gewicht van vet en zout te dragen, iets zuivere hoogzure witte wijn soms mist
- Umami in gerijpte charcuterie versterkt bitterheid bij tannine — een risico dat rosé grotendeels vermijdt
- Rosé is technisch beter toegerust voor charcuterie dan veel zwaardere rode wijn, ondanks haar lichte imago
',
    '### Opdracht

Maak een charcuterie-plank en kies rosé.

### Checklist

- Ik voerde de opdracht volledig uit
- Ik koppelde mijn bevindingen aan het leerdoel van deze les
- Ik kan mijn keuze mondeling verdedigen


### Reflectievraag

Bij welke charcuterieplank op je kaart adviseer je nu standaard rode wijn — en zou het zout-tannine-mechanisme een overstap naar rosé rechtvaardigen?',
    8,
    5
  ),
  (
    'rose-en-fine-dining',
    'Rosé & fine dining',
    'Na deze les begrijp jij hoe rosé op hoog gastronomisch niveau wordt ingezet.
',
    'Dat toprestaurants rosé steeds vaker serieus inzetten, is het directe gevolg van specifieke technische ingrepen die de meeste basic rosé niet krijgt: verlengd lees-contact met batonnage (les 29) voor extra textuur, en bij een klein aantal prestigecuvées zelfs gedeeltelijke vatgisting — een techniek die tot voor kort vrijwel uitsluitend aan witte en rode wijn werd voorbehouden.

Château d''Esclans'' ''Garrus'', gemaakt van oude Grenache- en Rolle-wijnstokken en vergist en gerijpt op eikenhouten vaten met regelmatige lees-roering, geldt als het duidelijkste precedent: een rosé die qua textuur, concentratie en prijssegment rechtstreeks concurreert met serieuze witte en rode Grand Cru-stijlen, en die bewees dat rosé op het hoogste gastronomische niveau kan meespelen zonder haar herkenbare zuurspanning en roze kleur te verliezen.

Die techniek maakt rosé geschikt voor een dubbelregister dat maar weinig andere wijnstijlen bedienen: de delicate zoetheid en zuurspanning van schaaldieren zoals langoustine en kreeft vragen precisie en zuurgraad — precies wat het onderliggende fundament uit les 26 en 35 biedt — terwijl rijkere, umami-gedreven gerechten zoals truffel of kalfsvlees juist textuur en fenolische substantie vragen — precies wat de vatgisting en batonnage-techniek uit deze les toevoegen. Eén en dezelfde fles kan daardoor, mits met precisie gekozen, beide registers bedienen op een manier waarop een puur licht witte wijn (te weinig textuur voor truffel) of een puur krachtige rode wijn (te veel tannine voor langoustine) allebei zouden struikelen.

Dat vraagt wel precisie: niet elke prestige-rosé is voor elk gerecht geschikt, en de keuze moet expliciet teruggrijpen op de structuur- en fenolanalyse uit lessen 26–29 in plaats van te vertrouwen op prijs of reputatie van het huis alleen.

Deze techniek en dit precedent samen tonen aan dat ''rosé in fine dining'' geen marketingclaim is maar een aantoonbare, herhaalbare productielogica — het sluitstuk van de identiteitsredenering die deze hele module heeft opgebouwd.


## Food pairing

### Beste pairing

Langoustine als voorgerecht en kalfsvlees met truffel als hoofdgerecht, beide met dezelfde vatgegiste, lees-geroerde prestige-rosé.

### Waarom dit werkt

De precisie en zuurgraad van de rosé dragen de delicate langoustine, terwijl haar textuur uit vatgisting en batonnage het umami-gewicht van truffel en kalf opvangt.

### Vermijd

Een basic, bleke rosé zonder lees-contact bij hetzelfde truffelgerecht — het ontbrekende fenolische fundament laat de wijn volledig wegvallen naast die intensiteit.

## Pro insight

Noem Garrus of een vergelijkbare vatgegiste, lees-geroerde rosé expliciet als referentie wanneer een gast twijfelt of rosé wel ''serieus genoeg'' is voor een fine-diningmenu.',
    '- Garrus-prestigeprecedent
- vatgisting-en-batonnage-rosé
- dubbelregister schaaldier-en-wildgerecht
- textuur-op-maat-techniek
- precisiekeuze-boven-reputatie
',
    'Steeds meer Michelin-restaurants bouwen rosé in pairing-menu''s.
',
    '- Verlengd lees-contact met batonnage en, bij enkele prestigecuvées, gedeeltelijke vatgisting geven premium rosé extra textuur
- Château d''Esclans'' Garrus is het duidelijkste precedent dat rosé op Grand Cru-niveau kan meespelen
- Premium rosé bedient een dubbelregister: precisie voor delicate schaaldieren én textuur voor rijke, umami-gedreven gerechten
- Eén fles kan beide registers bedienen waar puur wit of puur rood vaak op één van de twee struikelt
- Fine-dining-keuzes moeten teruggrijpen op de structuur- en fenolanalyse uit lessen 26–29, niet op prijs of reputatie alleen
',
    '### Opdracht

Maak een 5-gangen rosépairingmenu.

### Checklist

- Ik heb vijf gerechten gekozen
- Ik heb stijlen gekoppeld
- Ik heb body afgestemd
- Ik heb zuren afgestemd


### Reflectievraag

Bij welk fine-dininggerecht op je kaart zou jij nu een premium, vatgegiste rosé durven voorstellen in plaats van het automatische witte of rode alternatief?',
    8,
    6
  )
) as v(slug, title, objective, theory, key_concepts, did_you_know, summary, practice, duration, sort_order);

-- examen-rose-wine (3 lessons)
with m as (
  select m.id from academy.modules m
  join academy.tracks t on t.id = m.track_id
  where t.slug = 'rose-wine' and m.slug = 'examen-rose-wine'
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
    'provence-vs-tavel-blind',
    'Provence vs Tavel blind',
    'Na deze les kun jij Provence en Tavel blind onderscheiden.
',
    'Provence versus Tavel blind vormt de fundamentele roséverglijking, precies omdat de twee stijlen tegenovergestelde eindpunten zijn van dezelfde productie-as die in module 6 is opgebouwd — schilcontactduur, perswijnmenging en druivensamenstelling. De vaste deductieketen kleur-aroma-zuur-lichaam-textuur legt dat verschil systematisch bloot.

Kleur is de eerste, meest zichtbare aanwijzing: Provence toont een extreem bleke, ''oeil de perdrix''-achtige tint (les 26, kort schilcontact, direct press), terwijl Tavel een merkbaar dieper, zalm-tot-oranjeroze kleur vertoont — het directe gevolg van de langere maceratie en de bewuste menging van perswijn met vrijloopsap die uniek is voor de Tavel-appellatie (les 29).

Op de neus bevestigt zich dat verschil: Provence toont citrus, rode bes en een mineraal register; Tavel toont rijper steenfruit, gedroogde kruiden en specerij — een aromatisch profiel dat dichter bij de kruidige stijl uit les 28 ligt dan bij de bleke stijl. Zuurgraad blijft bij beide hoog, maar voelt bij Provence strakker en rechter aan (geblokkeerde appelzuur-melkzuurgisting, vroege oogst), terwijl Tavel''s zuur ronder en rijper overkomt door de hogere Grenache-concentratie en iets latere oogst.

Het beslissende tastsignaal is echter lichaam en textuur, niet kleur: Tavel toont, dankzij de perswijnmenging, een lichte maar duidelijk waarneembare fenolische grip op de afdronk — een structuurniveau dat je bij Provence vrijwel nooit tegenkomt. Die fenolische grip is de meest betrouwbare, minst dubbelzinnige aanwijzing in deze vergelijking, precies zoals tanninegrip in het rode-wijn-blindproeven de doorslag gaf tussen Pinot Noir en Nebbiolo ondanks vergelijkbare kleur.

Train daarom ook hier het hypothese-vóór-onthullingsprotocol: benoem eerst kleurintensiteit, dan aromaregister, dan zuurkarakter, dan lichaam, en pas als laatste de tastbare fenolische grip op de afdronk — vóórdat het etiket onthuld wordt.


## Food pairing

### Beste pairing

Provence bij oesters of een lichte salade, Tavel bij lamskotelet of gekruide kip — afhankelijk van de uitkomst van de blindproef.

### Waarom dit werkt

Beide combinaties gebruiken exact de structuur die de blindproef blootlegt: precisie en zuur bij Provence, lichaam en kruidigheid bij Tavel.

### Vermijd

Een zware, kruidige hoofdgerecht bij Provence serveren — het lichte lichaam en de afwezige fenolische grip verpletteren dan niet het gerecht, maar worden er zelf door verpletterd.

## Pro insight

Leg bij elke blindronde je conclusie eerst vast op basis van de fenolische grip op de afdronk vóórdat je naar kleur alleen kijkt — kleur is bij Provence versus Tavel een sterke aanwijzing, maar de fenolische grip is het sluitende bewijs.',
    '- perswijngrip-als-tastsignaal
- oeil-de-perdrix-kleurreferentie
- kleur-aroma-zuur-lichaam-textuurketen
- Tavel-afdronkgrip
- hypothese-vóór-onthullingsprotocol
',
    'Tavel wordt vaak warmer geserveerd dan Provence.
',
    '- Kleur, aroma, zuur, lichaam en textuur vormen de vaste deductieketen voor deze vergelijking
- Provence: extreem bleek, citrus-mineraal, strak zuur, licht lichaam, geen fenolische grip
- Tavel: dieper zalmroze, rijper steenfruit en kruiden, ronder zuur, voller lichaam
- De lichte maar waarneembare fenolische grip op de afdronk van Tavel — uit de perswijnmenging — is het beslissende tastsignaal
- Train het hypothese-vóór-onthullingsprotocol: kleur, aroma, zuur, lichaam, dan pas textuur, vóór het etiket
',
    '### Opdracht

Proef twee rosés blind en bepaal welke Provence of Tavel is.

### Checklist

- Ik heb minstens twee concrete punten genoteerd
- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij je laatste blindronde Provence versus Tavel: vertrouwde je eerst op kleur of op de fenolische grip op de afdronk — en welke volgorde gaf je de meest betrouwbare conclusie?',
    10,
    1
  ),
  (
    'rose-vs-lichte-rode-wijn-blind',
    'Rosé vs lichte rode wijn blind',
    'Na deze les kun jij rosé onderscheiden van lichte rode wijn.
',
    'Rosé versus lichte rode wijn blind is moeilijker dan de meeste proevers verwachten, precies omdat kleurintensiteit hier volledig kan overlappen: een structuurrijke, diepgekleurde Tavel kan visueel dichter bij een lichte Pinot Noir liggen dan bij een bleke Provence. Dat maakt deze vergelijking het ultieme bewijs van de these die deze hele module heeft opgebouwd: kleurdiepte en tanninegehalte zijn bij rosé structureel ontkoppelde variabelen, terwijl ze bij rode wijn juist gekoppeld zijn aan dezelfde maceratieduur.

De reden ligt in het productieproces zelf, niet in de druif. Zelfs de lichtste rode wijn (Pinot Noir, Gamay) fermenteert dagen tot weken volledig op de schillen — fermentatie-op-schillen is per definitie de kern van rode wijnproductie. Rosé daarentegen wordt van de schillen gescheiden vóór of zeer vroeg in de gisting; de fermentatieduur op de schillen is bij rosé per definitie vrijwel nul, ongeacht hoe lang het voorafgaande schilcontact (en dus de kleurextractie) heeft geduurd. Kleur ontstaat bij rosé dus in het persmoment, tannine ontstaat bij rode wijn juist tijdens de daaropvolgende fermentatie — twee wezenlijk verschillende stappen in het proces.

Dat verklaart waarom zelfs de meest geconcentreerde, diepgekleurde rosé — inclusief Tavel met haar perswijnmenging — structureel minder tannine behoudt dan zelfs de lichtste volledig op schillen gefermenteerde rode wijn. Tanninegrip en textuur blijven daarom het beslissende, ontkoppelbewijzende criterium, niet kleur: rosé voelt zijdezachter en korter aan op de afdronk, terwijl zelfs lichte rode wijn een merkbaar langere, drogere fenolische grip toont door haar volledige extractie en fermentatie op de schillen.

Overeenkomsten in rood fruit, frisse zuren en lichte lichaamsindruk maken deze vergelijking op geur en eerste indruk misleidend gelijkend — precies waarom getrainde proevers hier bewust eerst op textuur en fenolische grip focussen in plaats van op kleur, geur of lichaam alleen.

Koude, lichte rode wijn wordt in de praktijk daarom regelmatig verward met krachtige rosé, en omgekeerd — een fout die zich alleen laat corrigeren door bewust het persmoment-versus-fermentatieduur-onderscheid als primair criterium te gebruiken, niet als secundaire bevestiging.


## Food pairing

### Beste pairing

Een krachtige Tavel naast een lichte, koel geserveerde Pinot Noir bij dezelfde zalmtartaar.

### Waarom dit werkt

Beide combinaties tonen hoezelfde gerecht via een ander mechanisme werkt: de Tavel via lichaam en lichte fenolische grip, de Pinot Noir via fijne tannine en fermentatie-op-schillen-textuur.

### Vermijd

Een zeer krachtige, tanninerijke rode wijn bij dezelfde zalmtartaar — de volledige fermentatie op de schillen geeft een tanninelast die de delicate vis verpletterd.

## Pro insight

Vertrouw bij twijfel tussen rosé en lichte rode wijn nooit op kleur alleen — vraag jezelf expliciet af of de fermentatie op de schillen wel of niet heeft plaatsgevonden, en laat de tastgrip die vraag beantwoorden.',
    '- fermentatie-op-schillen-nul-bij-rosé
- ontkoppelde kleur-tanninelogica
- tastgrip-als-scheidingscriterium
- persmoment-versus-fermentatieduur
- structurele-categorieverwarring-in-de-praktijk
',
    'Koude lichte rode wijn wordt vaak verward met krachtige rosé.
',
    '- Zelfs de lichtste rode wijn fermenteert volledig op de schillen; rosé wordt er vóór of vroeg in de gisting van gescheiden
- Kleur ontstaat bij rosé in het persmoment, tannine ontstaat bij rode wijn tijdens de fermentatie — twee aparte stappen
- Zelfs geconcentreerde rosé zoals Tavel behoudt structureel minder tannine dan de lichtste volledig gefermenteerde rode wijn
- Tastgrip op de afdronk is het beslissende criterium, niet kleur, geur of lichaam
- Koude lichte rode wijn en krachtige rosé worden in de praktijk regelmatig verward zonder dit criterium
',
    '### Opdracht

Proef blind een rosé en een Pinot Noir.

### Checklist

- Ik proefde zonder etiket of met afgeschermde flessen
- Ik noteerde zuur, body en aroma vóór mijn conclusie


### Reflectievraag

Bij je laatste vergelijking tussen rosé en lichte rode wijn: welk signaal (kleur of tastgrip) gaf je de meeste zekerheid, en waarom is dat het betrouwbaarste bewijs?',
    10,
    2
  ),
  (
    'theorie-praktijkexamen',
    'Theorie- en praktijkexamen',
    'Na deze les toets jij jouw volledige rosékennis.
',
    'Dit Master-examen integreert de volledige Rosé Track: fundament, productie, proeftechniek, klassieke stijlen, druivenrassen, stijl- en gastronomiediepte, professionele service, pairingmechanismen en blindanalyse. De rode draad door alle negen modules is de identiteitsthese die in module 6 werd geformuleerd: rosé is geen verdunde rode wijn en geen gezoete witte wijn, maar een eigen categorie waarin kleur en tanninegehalte onafhankelijk stuurbare variabelen zijn — het persmoment bepaalt de kleur, terwijl de fermentatieduur op de schillen bij rosé per definitie vrijwel nul is.

Productie legt daarvoor het fundament: schilcontactduur en persmethode (direct press versus saignée) bepalen kleur en fenolisch fundament tegelijk, wat zich vertaalt naar drie herkenbare stijlfamilies — bleke, protectief gevinifieerde stijlen (Provence, Chiaretto) die op zuur en esters drijven; fruitige, sappige stijlen (Grenache-gedreven Rosado, Nieuwe Wereld) die op rijpheid en soms lichte restsuiker drijven; en kruidige, structuurrijkere stijlen (Bandol, Tavel) die op rotundone, garrigue-invloed en perswijnmenging drijven.

Service bouwt daarop voort: temperatuur en glaskeuze schalen beide met het fenolische fundament van de stijl, bewaring wordt beperkt door een kleine antocyaanpool en verhoogde lichtgevoeligheid (goût de lumière via helder flesglas), en rijpingspotentieel is uitzondering, niet regel, voorbehouden aan stijlen met een aantoonbaar groter fenolisch fundament zoals Bandol.

Pairing bouwt op onderliggende mechanismen die stelselmatig terugkomen: zuurmatching bij salades, het vermijden van de ijzer-tanninereactie bij vis, de suiker-tanninebitterheidsval bij barbecueglazuren, het TRPV1-mechanisme bij pikante Aziatische gerechten, de zout-tannine-interactie bij charcuterie, en vatgisting-en-batonnage-techniek als sleutel tot serieuze fine dining. Blindanalyse integreert dat alles: kleur, aroma, zuur, lichaam en — als beslissend criterium — tastbare fenolische grip, met persmoment-versus-fermentatieduur als het fundamentele onderscheidende principe tussen rosé en zelfs de lichtste rode wijn.

Succesvolle examenkandidaten vermijden drie terugkerende fouten: rosé behandelen als een verdunde of tussenliggende categorie in plaats van een eigen productielogica, kleur gebruiken als enige bewijs bij blindproeven in plaats van tastgrip, en pairingadvies baseren op imago (''rosé is zomerwijn'') in plaats van op het onderliggende mechanisme. Dit examen beloont expliciete argumentatie boven geraden antwoorden, op elk van de drie examenonderdelen.


## Food pairing

### Beste pairing

Examenonderdeel pairing: kies per gerecht een roséstijl op basis van zuurmatching, ijzer-tannine-vermijding, suiker-tanninerisico of umami-tannine-risico.

### Waarom dit werkt

Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.

### Vermijd

Eén roséstijl voor alle examengerechten zonder onderbouwing per mechanisme.

## Pro insight

Lees examenvragen als servicecases: welke rosé zou je zaterdagavond schenken bij dit gerecht en deze gast — en welk mechanisme, niet welk imago, onderbouwt die keuze?',
    '- examenintegratie-rosé
- persmoment-versus-fermentatielogica
- tastgrip-boven-kleurbewijs
- fenolisch-fundament-als-rode-draad
- certificering
',
    '',
    '- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)
- Productie en de drie stijlfamilien (bleek, fruitig, kruidig-structuurrijk) vormen het fundament van elke analyse
- Service en bewaring bouwen op fenolisch fundament, antocyaanpool en lichtgevoeligheid
- Pairing en blindanalyse draaien om mechanismen — tastgrip en fermentatieduur boven kleur alleen
- Veelvoorkomende fouten: rosé als tussencategorie zien, op kleur vertrouwen, imago zonder mechanisme citeren
',
    '### Examenonderdeel 1 — Theorie (20 vragen)

Beantwoord de volledige meerkeuzequiz van twintig vragen zonder hulpmiddelen. Minimaal 70% (14 van de 20) is vereist om te slagen.

### Examenonderdeel 2 — Blindproeven (2 glazen)

Analyseer twee rosé''s — bij voorkeur uit verschillende structuurcategorieën (bijvoorbeeld een bleke Provence-stijl en een structuurrijke Tavel of Bandol) volgens het vaste protocol:

- kleur en intensiteit
- geur (primair, secundair, eventueel tertiair)
- zuur, lichaam en tastbare fenolische grip op de afdronk
- vermoedelijke stijl en regio, met minstens drie argumenten
- serviceadvies (temperatuur, glas, bewaarpotentieel)

### Examenonderdeel 3 — Pairing (3 gerechten)

Koppel een onderbouwde roséstijl aan elk van de volgende gerechten:

1. Een salade met een scherpe vinaigrette
2. Gegrilde ribs met een zoet-kruidig barbecueglazuur
3. Een charcuterieplank met prosciutto en salami

Motiveer elke keuze via het onderliggende mechanisme (zuurmatching, suiker-tanninerisico, zout-tannine-interactie) — niet via traditie of imago alleen.

### Beoordeling

- 18–20 goed + correcte blindanalyse = Master Distinction
- 15–17 goed = Master Pass
- 12–14 goed = Conditional Pass — herhaal de zwakste module
- Minder dan 12 goed = Retry

Bij slagen ontvang je de certificering **Way of Tasting Academy — Rosé Certified (Master Foundation)**.

### Checklist

- Ik heb alle drie examenonderdelen volledig afgerond
- Ik documenteerde mijn blindhypotheses vóór de onthulling
- Ik motiveerde elk pairing via zuur-vet, zoutbalans of textuurmatching
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
  where t.slug = 'rose-wine'
)
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.prompt, v.options::jsonb, v.correct_index, v.explanation
from l
join (values
  ('intro-rose-wine', 'wat-is-rose', 1, 'Van welke druiven wordt rosé meestal gemaakt?', '["Witte druiven", "Blauwe druiven", "Groene druiven", "Gedroogde druiven"]', 1, 'Correct: Blauwe druiven'),
  ('intro-rose-wine', 'wat-is-rose', 2, 'Hoe ontstaat de kleur?', '["Houtrijping", "Kort schilcontact", "Suiker toevoegen", "Oxidatie"]', 1, 'Correct: Kort schilcontact'),
  ('intro-rose-wine', 'wat-is-rose', 3, 'Rosé zit qua stijl tussen:', '["Bier en wijn", "Wit en rood", "Port en sherry", "Mousserend en stil"]', 1, 'Correct: Wit en rood'),
  ('intro-rose-wine', 'wat-is-rose', 4, 'Rosé is meestal:', '["Zeer zwaar", "Fris en fruitig", "Altijd zoet", "Altijd houtgerijpt"]', 1, 'Correct: Fris en fruitig'),
  ('intro-rose-wine', 'wat-is-rose', 5, 'Rosé wordt gemaakt van:', '["Alleen Grenache", "Alleen Syrah", "Verschillende blauwe druiven", "Alleen witte druiven"]', 2, 'Correct: Verschillende blauwe druiven'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 1, 'Hoe ontstaat rosé?', '["Door lange houtrijping", "Door kort schilcontact", "Door distillatie", "Door koolzuurvorming"]', 1, 'Correct: Door kort schilcontact'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 2, 'Welke druiven worden gebruikt voor rosé?', '["Alleen witte druiven", "Alleen groene druiven", "Blauwe druiven", "Gedroogde druiven"]', 2, 'Correct: Blauwe druiven'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 3, 'Wat gebeurt na het schilcontact?', '["Schillen blijven aanwezig", "Sap wordt gescheiden van schillen", "Wijn wordt gedistilleerd", "Suiker wordt toegevoegd"]', 1, 'Correct: Sap wordt gescheiden van schillen'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 4, 'Langere extractie geeft meestal:', '["Minder kleur", "Meer kleur", "Minder smaak", "Minder alcohol"]', 1, 'Correct: Meer kleur'),
  ('intro-rose-wine', 'hoe-ontstaat-rose', 5, 'Roséproductie lijkt technisch het meest op:', '["Witte wijn", "Port", "Bier", "Sherry"]', 0, 'Correct: Witte wijn'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 1, 'Waarom is rosé uniek?', '["Omdat het versterkt is", "Omdat het wit en rood combineert", "Omdat het mousserend is", "Omdat het altijd zoet is"]', 1, 'Correct: Omdat het wit en rood combineert'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 2, 'Rosé combineert vaak:', '["Tannine en hout", "Frisheid en fruit", "Zoet en oxidatie", "Bitter en zout"]', 1, 'Correct: Frisheid en fruit'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 3, 'Rosé kan gastronomisch zijn:', '["Nee", "Ja", "Alleen bij sweet rosé", "Nooit bij fine dining"]', 1, 'Correct: Ja'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 4, 'Welke stijl staat bekend als serieuze rosé?', '["Tavel", "Cava", "Port", "Sauternes"]', 0, 'Correct: Tavel'),
  ('intro-rose-wine', 'waarom-is-rose-uniek', 5, 'Rosé wordt vaak onderschat omdat:', '["Het te oud is", "Het als simpele zomerwijn wordt gezien", "Het teveel alcohol heeft", "Het te duur is"]', 1, 'Correct: Het als simpele zomerwijn wordt gezien'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 1, 'Rosé is historisch:', '["Een moderne stijl", "Een oude wijnstijl", "Een nieuwe trend", "Een dessertwijn"]', 1, 'Correct: Een oude wijnstijl'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 2, 'Waarom waren oude rode wijnen vaak lichter?', '["Minder extractietechniek", "Meer hout", "Meer alcohol", "Minder druiven"]', 0, 'Correct: Minder extractietechniek'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 3, 'Welke regio werd de moderne benchmark?', '["Douro", "Provence", "Mosel", "Rioja"]', 1, 'Correct: Provence'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 4, 'Rosé wordt tegenwoordig:', '["Alleen in Frankrijk gemaakt", "Wereldwijd gemaakt", "Alleen in Spanje gemaakt", "Alleen in Italië gemaakt"]', 1, 'Correct: Wereldwijd gemaakt'),
  ('intro-rose-wine', 'geschiedenis-van-rose', 5, 'Rosé ontwikkelde zich uit:', '["Port", "Oude rode wijnstijlen", "Mousserende wijn", "Dessertwijn"]', 1, 'Correct: Oude rode wijnstijlen'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 1, 'Welke regio staat bekend om lichte rosé?', '["Douro", "Provence", "Mosel", "Rioja"]', 1, 'Correct: Provence'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 2, 'Welke stijl is vaak krachtiger?', '["Tavel", "Provence", "Sancerre", "Chablis"]', 0, 'Correct: Tavel'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 3, 'Rosado komt vooral uit:', '["Spanje", "Duitsland", "Oostenrijk", "Zuid-Afrika"]', 0, 'Correct: Spanje'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 4, 'Welke stijl heeft vaak meer body?', '["Tavel", "Provence", "Pinot Grigio", "Riesling"]', 0, 'Correct: Tavel'),
  ('intro-rose-wine', 'belangrijkste-rosestijlen', 5, 'Rosé kan zijn:', '["Alleen licht", "Alleen zoet", "Alleen eenvoudig", "Licht of gastronomisch"]', 3, 'Correct: Licht of gastronomisch'),
  ('productie-rose-wine', 'direct-press-methode', 1, 'Wat betekent direct press?', '["Lang schilcontact", "Direct persen", "Geen vergisting", "Houtrijping"]', 1, 'Correct: Direct persen'),
  ('productie-rose-wine', 'direct-press-methode', 2, 'Welke stijl ontstaat vaak?', '["Donker en zwaar", "Licht en fris", "Zoet", "Oxidatief"]', 1, 'Correct: Licht en fris'),
  ('productie-rose-wine', 'direct-press-methode', 3, 'Welke regio gebruikt dit veel?', '["Douro", "Provence", "Rioja", "Piemonte"]', 1, 'Correct: Provence'),
  ('productie-rose-wine', 'direct-press-methode', 4, 'Wat blijft vaak behouden?', '["Houttonen", "Frisheid", "Oxidatie", "Bitterheid"]', 1, 'Correct: Frisheid'),
  ('productie-rose-wine', 'direct-press-methode', 5, 'Kleur is meestal:', '["Diep rood", "Licht roze", "Oranje", "Bruin"]', 1, 'Correct: Licht roze'),
  ('productie-rose-wine', 'saignee-methode', 1, 'Wat betekent saignée?', '["Koelen", "Bloeden", "Rijpen", "Filteren"]', 1, 'Correct: Bloeden'),
  ('productie-rose-wine', 'saignee-methode', 2, 'Waar komt het sap vandaan?', '["Uit witte wijn", "Uit rode wijn in wording", "Uit mousserende wijn", "Uit Port"]', 1, 'Correct: Uit rode wijn in wording'),
  ('productie-rose-wine', 'saignee-methode', 3, 'Saignée geeft vaak:', '["Minder kleur", "Meer kleur", "Minder body", "Minder aroma"]', 1, 'Correct: Meer kleur'),
  ('productie-rose-wine', 'saignee-methode', 4, 'Saignée geeft vaak:', '["Meer body", "Minder body", "Minder structuur", "Minder alcohol"]', 0, 'Correct: Meer body'),
  ('productie-rose-wine', 'saignee-methode', 5, 'Saignée beïnvloedt ook:', '["Rode wijnconcentratie", "Flesgrootte", "Kurksoort", "Etiket"]', 0, 'Correct: Rode wijnconcentratie'),
  ('productie-rose-wine', 'kleurcontrole', 1, 'Wat bepaalt vooral de kleur van rosé?', '["Kurk", "Schilcontactduur", "Alcohol", "Leeftijd"]', 1, 'Correct: Schilcontactduur'),
  ('productie-rose-wine', 'kleurcontrole', 2, 'Meer schilcontact geeft:', '["Minder kleur", "Meer kleur", "Minder body", "Minder geur"]', 1, 'Correct: Meer kleur'),
  ('productie-rose-wine', 'kleurcontrole', 3, 'Welke factor speelt ook mee?', '["Druivenras", "Flesvorm", "Label", "Glas"]', 0, 'Correct: Druivenras'),
  ('productie-rose-wine', 'kleurcontrole', 4, 'Grenache geeft vaak:', '["Donkere rosé", "Lichtere rosé", "Bruine rosé", "Mousserende rosé"]', 1, 'Correct: Lichtere rosé'),
  ('productie-rose-wine', 'kleurcontrole', 5, 'Kleur is:', '["Toeval", "Bewuste keuze", "Altijd hetzelfde", "Onbelangrijk"]', 1, 'Correct: Bewuste keuze'),
  ('productie-rose-wine', 'fermentatie-van-rose', 1, 'Rosé wordt vaak vergist op:', '["Hoge temperatuur", "Lage temperatuur", "Geen temperatuur", "Kamertemperatuur"]', 1, 'Correct: Lage temperatuur'),
  ('productie-rose-wine', 'fermentatie-van-rose', 2, 'Koele fermentatie behoudt:', '["Fruitigheid", "Oxidatie", "Bitterheid", "Tannines"]', 0, 'Correct: Fruitigheid'),
  ('productie-rose-wine', 'fermentatie-van-rose', 3, 'Wat is reductief werken?', '["Veel zuurstof", "Weinig zuurstof", "Meer alcohol", "Meer suiker"]', 1, 'Correct: Weinig zuurstof'),
  ('productie-rose-wine', 'fermentatie-van-rose', 4, 'Hogere temperatuur geeft vaak:', '["Minder structuur", "Meer structuur", "Minder geur", "Minder alcohol"]', 1, 'Correct: Meer structuur'),
  ('productie-rose-wine', 'fermentatie-van-rose', 5, 'Moderne rosé draait vaak om:', '["Frisheid", "Oxidatie", "Hout", "Zoetheid"]', 0, 'Correct: Frisheid'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 1, 'Welke stijl heeft vaak meer body?', '["Frisse rosé", "Gastronomische rosé", "Mousserende rosé", "Witte wijn"]', 1, 'Correct: Gastronomische rosé'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 2, 'Welke regio staat bekend om gastronomische rosé?', '["Tavel", "Mosel", "Loire", "Bourgogne"]', 0, 'Correct: Tavel'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 3, 'Koele vergisting behoudt:', '["Bitterheid", "Fruitigheid", "Hout", "Oxidatie"]', 1, 'Correct: Fruitigheid'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 4, 'Welke methode geeft vaak meer extractie?', '["Direct press", "Saignée", "Carbonic", "Ice wine"]', 1, 'Correct: Saignée'),
  ('productie-rose-wine', 'frisse-vs-gastronomische-rose', 5, 'Frisse rosé is vaak:', '["Zwaarder", "Lichter", "Zoeter", "Ouder"]', 1, 'Correct: Lichter'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 1, 'Wat is stap 1?', '["Proeven", "Kijken", "Ruiken", "Schrijven"]', 1, 'Correct: Kijken'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 2, 'Wat analyseer je als tweede?', '["Ruiken", "Kijken", "Drinken", "Serveren"]', 0, 'Correct: Ruiken'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 3, 'Waarom is structuur belangrijk?', '["Voor kleur", "Voor stijlherkenning", "Voor alcohol", "Voor temperatuur"]', 1, 'Correct: Voor stijlherkenning'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 4, 'Wat komt als laatste?', '["Concluderen", "Kijken", "Ruiken", "Spoelen"]', 0, 'Correct: Concluderen'),
  ('proeven-rose-wine', 'hoe-proef-je-rose', 5, 'Rosé proeven vraagt:', '["Minder aandacht", "Meer aandacht voor subtiliteit", "Alleen geur", "Alleen kleur"]', 1, 'Correct: Meer aandacht voor subtiliteit'),
  ('proeven-rose-wine', 'kleur-analyseren', 1, 'Wat analyseer je als eerste?', '["Geur", "Kleur", "Alcohol", "Afdronk"]', 1, 'Correct: Kleur'),
  ('proeven-rose-wine', 'kleur-analyseren', 2, 'Bleek zalm wijst vaak op:', '["Lange extractie", "Korte extractie", "Oxidatie", "Houtlagering"]', 1, 'Correct: Korte extractie'),
  ('proeven-rose-wine', 'kleur-analyseren', 3, 'Donkere rosé wijst vaak op:', '["Minder body", "Meer extractie", "Minder fruit", "Minder structuur"]', 1, 'Correct: Meer extractie'),
  ('proeven-rose-wine', 'kleur-analyseren', 4, 'Welke stijl is meestal het lichtst?', '["Provence", "Tavel", "Bandol", "Rosado"]', 0, 'Correct: Provence'),
  ('proeven-rose-wine', 'kleur-analyseren', 5, 'Kleur geeft informatie over:', '["Extractie", "Kurk", "Leeftijd", "Prijs"]', 0, 'Correct: Extractie'),
  ('proeven-rose-wine', 'aromas-herkennen', 1, 'Welke aroma is typisch voor rosé?', '["Aardbei", "Koffie", "Tabak", "Teer"]', 0, 'Correct: Aardbei'),
  ('proeven-rose-wine', 'aromas-herkennen', 2, 'Citrusaroma''s geven vaak:', '["Frisheid", "Bitterheid", "Hout", "Oxidatie"]', 0, 'Correct: Frisheid'),
  ('proeven-rose-wine', 'aromas-herkennen', 3, 'Syrah geeft vaak:', '["Meer kruiden", "Minder geur", "Minder kleur", "Minder body"]', 0, 'Correct: Meer kruiden'),
  ('proeven-rose-wine', 'aromas-herkennen', 4, 'Grenache geeft vaak:', '["Rood fruit", "Petroleum", "Honing", "Nootmuskaat"]', 0, 'Correct: Rood fruit'),
  ('proeven-rose-wine', 'aromas-herkennen', 5, 'Roséaroma''s zijn vaak:', '["Primair fruitgedreven", "Oxidatief", "Houtgedreven", "Gerijpt"]', 0, 'Correct: Primair fruitgedreven'),
  ('proeven-rose-wine', 'structuur-herkennen', 1, 'Wat geeft zuurspanning?', '["Alcohol", "Zuren", "Hout", "Tannine"]', 1, 'Correct: Zuren'),
  ('proeven-rose-wine', 'structuur-herkennen', 2, 'Wat bepaalt gewicht?', '["Body", "Kurk", "Etiket", "Leeftijd"]', 0, 'Correct: Body'),
  ('proeven-rose-wine', 'structuur-herkennen', 3, 'Wat geeft warmte?', '["Alcohol", "Suiker", "Glas", "Kurk"]', 0, 'Correct: Alcohol'),
  ('proeven-rose-wine', 'structuur-herkennen', 4, 'Wat beschrijft mondgevoel?', '["Textuur", "Aroma", "Kleur", "Herkomst"]', 0, 'Correct: Textuur'),
  ('proeven-rose-wine', 'structuur-herkennen', 5, 'Structuur helpt bij:', '["Stijlherkenning", "Kurkkeuze", "Prijsbepaling", "Oogstjaar"]', 0, 'Correct: Stijlherkenning'),
  ('proeven-rose-wine', 'mini-toets-rose', 1, 'Waarom is het proefprotocol voor rosé niet simpelweg een kopie van het protocol voor rode wijn?', '["Omdat rosé geen zuur bevat", "Omdat tannine bij rosé geen vaste, dominante structuuras is zoals bij rood", "Omdat rosé nooit blind geproefd mag worden", "Omdat rosé altijd gehout wordt"]', 1, 'Correct: Omdat tannine bij rosé geen vaste, dominante structuuras is zoals bij rood'),
  ('proeven-rose-wine', 'mini-toets-rose', 2, 'Wat vertelt de tint en intensiteit van een rosé je het eerst?', '["Het exacte alcoholpercentage", "Een hypothese over de productiemethode", "De exacte druif", "De prijs van de fles"]', 1, 'Correct: Een hypothese over de productiemethode'),
  ('proeven-rose-wine', 'mini-toets-rose', 3, 'Bleke, zalmkleurige rosé wijst meestal op:', '["Saignée met lange schilcontacttijd", "Directe pers met korte schilcontacttijd", "Houtrijping", "Oxidatie"]', 1, 'Correct: Directe pers met korte schilcontacttijd'),
  ('proeven-rose-wine', 'mini-toets-rose', 4, 'Waarom is extreme bleekheid geen garantie voor kwaliteit?', '["Bleke rosé is altijd goedkoop", "Bleekheid kan het resultaat zijn van bewuste ontkleuring, los van concentratie", "Bleke rosé bevat altijd meer suiker", "Bleekheid duidt altijd op oxidatie"]', 1, 'Correct: Bleekheid kan het resultaat zijn van bewuste ontkleuring, los van concentratie'),
  ('proeven-rose-wine', 'mini-toets-rose', 5, 'Welke vier aromafamilies vormen de kern van primaire rosé-aromatiek?', '["Boter, honing, toast, vanille", "Rood fruit, citrus, bloemen, kruidigheid", "Leer, tabak, aarde, paddenstoel", "Tropisch fruit, steenfruit, noten, kruidnagel"]', 1, 'Correct: Rood fruit, citrus, bloemen, kruidigheid'),
  ('proeven-rose-wine', 'mini-toets-rose', 6, 'Wat zegt de afwezigheid van secundaire of tertiaire aroma''s bij een jonge rosé?', '["Dat de wijn een fout heeft", "Dat dit normaal is voor het merendeel van de categorie", "Dat de wijn te oud is", "Dat de druif onrijp was"]', 1, 'Correct: Dat dit normaal is voor het merendeel van de categorie'),
  ('proeven-rose-wine', 'mini-toets-rose', 7, 'Wat is de dominante structuuras bij vrijwel elke rosé?', '["Tannine", "Zuur", "Restsuiker", "Alcohol"]', 1, 'Correct: Zuur'),
  ('proeven-rose-wine', 'mini-toets-rose', 8, 'Wanneer ontstaat een merkbare fenolische textuur (fenolische grip) in rosé?', '["Bij elke rosé, ongeacht productie", "Alleen bij langere schilcontacttijd of extractie, zoals bij Tavel", "Alleen bij houtrijping", "Alleen bij rosé met restsuiker"]', 1, 'Correct: Alleen bij langere schilcontacttijd of extractie, zoals bij Tavel'),
  ('proeven-rose-wine', 'mini-toets-rose', 9, 'Waarom moet je restsuiker apart benoemen naast alcohol en body?', '["Omdat restsuiker de wettelijke classificatie bepaalt", "Omdat restsuiker de indruk van body en zoetheid samen kan veranderen, los van alcohol", "Omdat restsuiker altijd op het etiket staat", "Omdat restsuiker gelijk staat aan lage kwaliteit"]', 1, 'Correct: Omdat restsuiker de indruk van body en zoetheid samen kan veranderen, los van alcohol'),
  ('proeven-rose-wine', 'mini-toets-rose', 10, 'Blind: bleek zalmkleurig, citrus en bloemen dominant, hoog zuur, nauwelijks fenolische textuur, laag-medium alcohol. Welke stijlhypothese past het beste?', '["Structuurrijke, Mourvèdre-gedomineerde Tavel-achtige stijl", "Mediterrane, kortstondig geperste stijl in Provence-richting", "Zoete, Nieuwe-Wereld White Zinfandel-stijl", "Gerijpte, houtgedreven rosado"]', 1, 'Correct: Mediterrane, kortstondig geperste stijl in Provence-richting'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 1, 'Provence rosé is meestal:', '["Zoet", "Licht en droog", "Donker en zwaar", "Oxidatief"]', 1, 'Correct: Licht en droog'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 2, 'Welke druif is belangrijk?', '["Grenache", "Riesling", "Nebbiolo", "Chenin Blanc"]', 0, 'Correct: Grenache'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 3, 'Kleur is vaak:', '["Dieprood", "Bleek zalmroze", "Oranje", "Bruin"]', 1, 'Correct: Bleek zalmroze'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 4, 'Stijl draait om:', '["Zwaarte", "Elegantie", "Hout", "Restsuiker"]', 1, 'Correct: Elegantie'),
  ('klassieke-stijlen-rose-wine', 'provence-rose', 5, 'Provence ligt in:', '["Noord-Frankrijk", "Zuid-Frankrijk", "Spanje", "Italië"]', 1, 'Correct: Zuid-Frankrijk'),
  ('klassieke-stijlen-rose-wine', 'tavel', 1, 'Tavel produceert:', '["Alleen rode wijn", "Alleen rosé", "Alleen witte wijn", "Mousserende wijn"]', 1, 'Correct: Alleen rosé'),
  ('klassieke-stijlen-rose-wine', 'tavel', 2, 'Tavel is meestal:', '["Lichter dan Provence", "Krachtiger dan Provence", "Zoeter dan Provence", "Minder gastronomisch"]', 1, 'Correct: Krachtiger dan Provence'),
  ('klassieke-stijlen-rose-wine', 'tavel', 3, 'Welke eigenschap hoort bij Tavel?', '["Bleek en strak", "Donker en krachtig", "Oxidatief", "Mousserend"]', 1, 'Correct: Donker en krachtig'),
  ('klassieke-stijlen-rose-wine', 'tavel', 4, 'Tavel wordt vaak genoemd:', '["Koning van rosé", "Koning van Port", "Koning van bier", "Koning van Champagne"]', 0, 'Correct: Koning van rosé'),
  ('klassieke-stijlen-rose-wine', 'tavel', 5, 'Tavel heeft vaak:', '["Meer body", "Minder body", "Minder structuur", "Minder kleur"]', 0, 'Correct: Meer body'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 1, 'Rosado is de term voor rosé in:', '["Italië", "Spanje", "Frankrijk", "Portugal"]', 1, 'Correct: Spanje'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 2, 'Rosado is vaak:', '["Fruitiger", "Oxidatief", "Zoeter", "Mousserend"]', 0, 'Correct: Fruitiger'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 3, 'Belangrijke druif in rosado?', '["Garnacha", "Riesling", "Pinot Blanc", "Chenin Blanc"]', 0, 'Correct: Garnacha'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 4, 'Belangrijke regio?', '["Navarra", "Mosel", "Loire", "Bourgogne"]', 0, 'Correct: Navarra'),
  ('klassieke-stijlen-rose-wine', 'rosado-spanje', 5, 'Rosado heeft vaak:', '["Meer direct fruit", "Minder fruit", "Geen body", "Geen zuur"]', 0, 'Correct: Meer direct fruit'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 1, 'Rosato is afkomstig uit:', '["Spanje", "Italië", "Frankrijk", "Portugal"]', 1, 'Correct: Italië'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 2, 'Welke stijl is vaak licht?', '["Chiaretto", "Tavel", "Bandol", "Syrah"]', 0, 'Correct: Chiaretto'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 3, 'Welke stijl is donkerder?', '["Chiaretto", "Cerasuolo d''Abruzzo", "Provence", "Navarra"]', 1, 'Correct: Cerasuolo d''Abruzzo'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 4, 'Cerasuolo betekent:', '["Aardbei", "Kersenkleur", "Citrus", "Bloemig"]', 1, 'Correct: Kersenkleur'),
  ('klassieke-stijlen-rose-wine', 'rosato-italie', 5, 'Italiaanse rosato is:', '["Zeer uniform", "Zeer divers", "Altijd licht", "Altijd zwaar"]', 1, 'Correct: Zeer divers'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 1, 'Welke regio produceert alleen rosé?', '["Provence", "Tavel", "Rioja", "Toscana"]', 1, 'Correct: Tavel'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 2, 'Welke stijl is vaak het lichtst?', '["Tavel", "Provence", "Rosado", "Cerasuolo"]', 1, 'Correct: Provence'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 3, 'Rosado komt uit:', '["Italië", "Spanje", "Frankrijk", "Portugal"]', 1, 'Correct: Spanje'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 4, 'Nieuwe Wereld rosé is vaak:', '["Oxidatief", "Fruitiger", "Minder fruitig", "Minder rijp"]', 1, 'Correct: Fruitiger'),
  ('klassieke-stijlen-rose-wine', 'nieuwe-wereld-rose', 5, 'Welke stijl is vaak het krachtigst?', '["Provence", "Tavel", "Chiaretto", "Pinot Grigio"]', 1, 'Correct: Tavel'),
  ('druivenrassen-rose-wine', 'grenache', 1, 'Grenache geeft vaak:', '["Tropisch fruit", "Rood fruit", "Petroleum", "Gras"]', 1, 'Correct: Rood fruit'),
  ('druivenrassen-rose-wine', 'grenache', 2, 'Grenache is belangrijk in:', '["Provence", "Mosel", "Loire", "Elzas"]', 0, 'Correct: Provence'),
  ('druivenrassen-rose-wine', 'grenache', 3, 'Grenache geeft meestal:', '["Zware tannines", "Zachte structuur", "Hoge bitterheid", "Zeer hoge zuren"]', 1, 'Correct: Zachte structuur'),
  ('druivenrassen-rose-wine', 'grenache', 4, 'Grenache wordt vaak:', '["Solo gebruikt", "In blends gebruikt", "Gedroogd", "Versterkt"]', 1, 'Correct: In blends gebruikt'),
  ('druivenrassen-rose-wine', 'grenache', 5, 'Typisch aroma?', '["Aardbei", "Boter", "Vanille", "Koffie"]', 0, 'Correct: Aardbei'),
  ('druivenrassen-rose-wine', 'cinsault', 1, 'Cinsault staat bekend om:', '["Kracht", "Finesse", "Hoge tannines", "Veel hout"]', 1, 'Correct: Finesse'),
  ('druivenrassen-rose-wine', 'cinsault', 2, 'Welke aroma''s geeft Cinsault vaak?', '["Bloemen", "Koffie", "Tabak", "Teer"]', 0, 'Correct: Bloemen'),
  ('druivenrassen-rose-wine', 'cinsault', 3, 'Cinsault geeft vaak:', '["Lichte kleur", "Donkere kleur", "Bruine kleur", "Geen kleur"]', 0, 'Correct: Lichte kleur'),
  ('druivenrassen-rose-wine', 'cinsault', 4, 'Cinsault wordt vaak gebruikt voor:', '["Meer elegantie", "Meer tannines", "Meer alcohol", "Meer oxidatie"]', 0, 'Correct: Meer elegantie'),
  ('druivenrassen-rose-wine', 'cinsault', 5, 'Cinsault komt veel voor in:', '["Provence", "Mosel", "Douro", "Champagne"]', 0, 'Correct: Provence'),
  ('druivenrassen-rose-wine', 'syrah', 1, 'Syrah geeft vaak:', '["Meer kruiden", "Minder kleur", "Minder body", "Minder geur"]', 0, 'Correct: Meer kruiden'),
  ('druivenrassen-rose-wine', 'syrah', 2, 'Syrah geeft vaak:', '["Donkerder kleur", "Lichtere kleur", "Geen kleur", "Oranje kleur"]', 0, 'Correct: Donkerder kleur'),
  ('druivenrassen-rose-wine', 'syrah', 3, 'Typisch Syrah-aroma?', '["Peper", "Honing", "Petroleum", "Citrus"]', 0, 'Correct: Peper'),
  ('druivenrassen-rose-wine', 'syrah', 4, 'Syrah verhoogt:', '["Structuur", "Zoetheid", "Hout", "Oxidatie"]', 0, 'Correct: Structuur'),
  ('druivenrassen-rose-wine', 'syrah', 5, 'Syrah wordt vaak gebruikt in:', '["Tavel", "Mosel", "Elzas", "Chablis"]', 0, 'Correct: Tavel'),
  ('druivenrassen-rose-wine', 'mourvedre', 1, 'Mourvèdre geeft vaak:', '["Meer body", "Minder body", "Minder geur", "Minder kleur"]', 0, 'Correct: Meer body'),
  ('druivenrassen-rose-wine', 'mourvedre', 2, 'Welke stijl gebruikt veel Mourvèdre?', '["Bandol", "Mosel", "Loire", "Chablis"]', 0, 'Correct: Bandol'),
  ('druivenrassen-rose-wine', 'mourvedre', 3, 'Mourvèdre geeft vaak:', '["Meer complexiteit", "Minder structuur", "Minder rijping", "Minder alcohol"]', 0, 'Correct: Meer complexiteit'),
  ('druivenrassen-rose-wine', 'mourvedre', 4, 'Typisch Mourvèdre-karakter?', '["Aards en kruidig", "Zoet en fris", "Citrus en licht", "Tropisch"]', 0, 'Correct: Aards en kruidig'),
  ('druivenrassen-rose-wine', 'mourvedre', 5, 'Mourvèdre draagt bij aan:', '["Bewaarpotentieel", "Minder lengte", "Minder kracht", "Minder kleur"]', 0, 'Correct: Bewaarpotentieel'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 1, 'Welke druif is de belangrijkste rosédruif?', '["Riesling", "Grenache", "Chardonnay", "Merlot"]', 1, 'Correct: Grenache'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 2, 'Welke druif geeft vaak aromatische finesse?', '["Cinsault", "Syrah", "Mourvèdre", "Tempranillo"]', 0, 'Correct: Cinsault'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 3, 'Welke druif geeft peperigheid?', '["Syrah", "Grenache", "Cinsault", "Pinot Blanc"]', 0, 'Correct: Syrah'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 4, 'Welke druif geeft veel body?', '["Mourvèdre", "Cinsault", "Riesling", "Sauvignon Blanc"]', 0, 'Correct: Mourvèdre'),
  ('druivenrassen-rose-wine', 'tempranillo-rosado', 5, 'Tempranillo is vooral belangrijk in:', '["Italië", "Frankrijk", "Spanje", "Duitsland"]', 2, 'Correct: Spanje'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 1, 'Lichte rosé heeft vaak:', '["Lage zuren", "Hoge zuren", "Veel tannine", "Veel hout"]', 1, 'Correct: Hoge zuren'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 2, 'Beste pairing?', '["Steak", "Salade", "Stoofpot", "Wild"]', 1, 'Correct: Salade'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 3, 'Welke regio is klassiek?', '["Provence", "Douro", "Bordeaux", "Mosel"]', 0, 'Correct: Provence'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 4, 'Lichte rosé is vaak:', '["Zwaar", "Elegant", "Zoet", "Oxidatief"]', 1, 'Correct: Elegant'),
  ('stijl-gastronomie-rose-wine', 'licht-en-fris', 5, 'Waarom hebben lichte, bleke rosé''s zowel weinig kleur als weinig tannine?', '["Omdat kort schilcontact beide tegelijk beperkt — tannine komt immers uit dezelfde schil", "Omdat de druiven speciaal ontkleurd worden", "Omdat er altijd water wordt toegevoegd", "Omdat alleen witte druiven gebruikt worden"]', 0, 'Correct: Omdat kort schilcontact beide tegelijk beperkt — tannine komt immers uit dezelfde schil'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 1, 'Fruitige rosé draait vaak om:', '["Houtrijping", "Direct fruitplezier", "Oxidatie", "Tannines"]', 1, 'Correct: Direct fruitplezier'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 2, 'Typisch aroma?', '["Aardbei", "Tabak", "Leer", "Teer"]', 0, 'Correct: Aardbei'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 3, 'Fruitige rosé is vaak:', '["Toegankelijk", "Moeilijk", "Zeer zwaar", "Zeer oud"]', 0, 'Correct: Toegankelijk'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 4, 'Welke regio produceert vaak fruitige rosé?', '["Californië", "Douro", "Mosel", "Jura"]', 0, 'Correct: Californië'),
  ('stijl-gastronomie-rose-wine', 'fruitig-en-sappig', 5, 'Hoe ontstond de eerste populaire White Zinfandel bij Sutter Home?', '["Door een gisting die per ongeluk stokte bij ongeveer 2% restsuiker", "Door bewust suiker toe te voegen na gisting", "Door twee druivenrassen te blenden", "Door lange vatrijping in nieuw eikenhout"]', 0, 'Correct: Door een gisting die per ongeluk stokte bij ongeveer 2% restsuiker'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 1, 'Kruidige rosé bevat vaak:', '["Mediterrane kruiden", "Banaan", "Karamel", "Vanille"]', 0, 'Correct: Mediterrane kruiden'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 2, 'Welke druiven dragen hier vaak aan bij?', '["Syrah en Mourvèdre", "Riesling en Chardonnay", "Pinot Blanc en Chenin", "Sémillon en Muscat"]', 0, 'Correct: Syrah en Mourvèdre'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 3, 'Kruidige rosé is vaak:', '["Complexer", "Simpeler", "Zoeter", "Minder body"]', 0, 'Correct: Complexer'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 4, 'Welke regio is klassiek?', '["Bandol", "Mosel", "Elzas", "Chablis"]', 0, 'Correct: Bandol'),
  ('stijl-gastronomie-rose-wine', 'kruidig-en-droog', 5, 'Wat verklaart de kruidige, savoury toon van veel Bandol- en Provence-rosé het beste?', '["Rotundone uit Syrah en vluchtige garrigueverbindingen die zich aan de schil hechten", "Uitsluitend lange vatrijping in nieuw eikenhout", "Toevoeging van kruidenextract na gisting", "Een hoog restsuikergehalte"]', 0, 'Correct: Rotundone uit Syrah en vluchtige garrigueverbindingen die zich aan de schil hechten'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 1, 'Wat bepaalt het gewicht van rosé?', '["Body", "Kurk", "Etiket", "Leeftijd"]', 0, 'Correct: Body'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 2, 'Lichte body past goed bij:', '["Salades", "Wild", "Stoofpot", "Oude kaas"]', 0, 'Correct: Salades'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 3, 'Volle body past goed bij:', '["Barbecue", "Sorbet", "Oesters", "Citroen"]', 0, 'Correct: Barbecue'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 4, 'Body helpt bij:', '["Pairing", "Kurkkeuze", "Oogstjaar", "Prijs"]', 0, 'Correct: Pairing'),
  ('stijl-gastronomie-rose-wine', 'structuur-en-body', 5, 'Wat maakt Tavel structureel zwaarder dan een gemiddelde Provence rosé?', '["Bewuste menging van perswijn met vrijloopsap en een langere maceratie", "Toevoeging van suiker na gisting", "Uitsluitend gebruik van witte druiven", "Filtratie zonder gisting"]', 0, 'Correct: Bewuste menging van perswijn met vrijloopsap en een langere maceratie'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 1, 'Welke stijl heeft vaak de meeste body?', '["Provence", "Bandol", "Pinot Grigio", "Sauvignon Blanc"]', 1, 'Correct: Bandol'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 2, 'Lichte rosé werkt goed bij:', '["Salades", "Stoofpot", "Wild", "Oude kaas"]', 0, 'Correct: Salades'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 3, 'Kruidige rosé past goed bij:', '["Gegrilde kip", "Sorbet", "Oesters", "Chocolade"]', 0, 'Correct: Gegrilde kip'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 4, 'Fruitige rosé past goed bij:', '["Tapas", "Wildzwijn", "Stilton", "Truffel"]', 0, 'Correct: Tapas'),
  ('stijl-gastronomie-rose-wine', 'rose-als-maaltijdwijn', 5, 'Waarom is rosé geen ''verdunde rode wijn''?', '["Omdat kleur en tannine bij rosé ontkoppelde variabelen zijn, in tegenstelling tot bij rode wijn", "Omdat rosé altijd van witte druiven wordt gemaakt", "Omdat rosé nooit tannine bevat", "Omdat rosé altijd zoeter is dan rode wijn"]', 0, 'Correct: Omdat kleur en tannine bij rosé ontkoppelde variabelen zijn, in tegenstelling tot bij rode wijn'),
  ('service-rose-wine', 'serveertemperatuur', 1, 'Te koud serveren zorgt voor:', '["Meer aroma", "Minder aroma", "Meer body", "Meer rijping"]', 1, 'Correct: Minder aroma'),
  ('service-rose-wine', 'serveertemperatuur', 2, 'Lichte rosé serveer je meestal op:', '["8–10 °C", "14–16 °C", "18–20 °C", "5 °C"]', 0, 'Correct: 8–10 °C'),
  ('service-rose-wine', 'serveertemperatuur', 3, 'Bandol serveer je vaak op:', '["6 °C", "11–13 °C", "3 °C", "18 °C"]', 1, 'Correct: 11–13 °C'),
  ('service-rose-wine', 'serveertemperatuur', 4, 'Te warm geeft vaak:', '["Minder alcohol", "Meer zuurspanning", "Meer alcoholgevoel", "Meer zuur"]', 2, 'Correct: Meer alcoholgevoel'),
  ('service-rose-wine', 'serveertemperatuur', 5, 'Waarom vraagt een structuurrijke rosé zoals Tavel of Bandol een iets hogere serveertemperatuur dan een bleke Provence?', '["Haar hogere fenolische concentratie profiteert van dezelfde eiwitbindingskinetiek als tannine bij rode wijn", "Omdat ze meer restsuiker bevat", "Omdat ze minder alcohol bevat", "Omdat koude altijd meer aroma geeft"]', 0, 'Correct: Haar hogere fenolische concentratie profiteert van dezelfde eiwitbindingskinetiek als tannine bij rode wijn'),
  ('service-rose-wine', 'glaswerk', 1, 'Waarom is glaswerk belangrijk?', '["Voor kleur", "Voor geur en smaak", "Voor prijs", "Voor alcohol"]', 1, 'Correct: Voor geur en smaak'),
  ('service-rose-wine', 'glaswerk', 2, 'Lichte rosé drink je vaak uit:', '["Klein witwijnglas", "Groot roodwijnglas", "Champagneflûte", "Portglas"]', 0, 'Correct: Klein witwijnglas'),
  ('service-rose-wine', 'glaswerk', 3, 'Volle rosé werkt beter in:', '["Groter witwijnglas", "Klein shotglas", "Bierglas", "Portglas"]', 0, 'Correct: Groter witwijnglas'),
  ('service-rose-wine', 'glaswerk', 4, 'Wat doet een groter glas?', '["Minder aroma", "Meer aromatische opening", "Minder textuur", "Minder zuur"]', 1, 'Correct: Meer aromatische opening'),
  ('service-rose-wine', 'glaswerk', 5, 'Waarom kiezen sommeliers voor een structuurrijke Tavel of Bandol vaak een groter Bourgondië-witwijnglas?', '["Het grotere oppervlak geeft de hogere fenolische substantie ruimte om te openen", "Het verlaagt automatisch de temperatuur van de wijn", "Het is wettelijk verplicht voor Tavel", "Het verhoogt het alcoholpercentage"]', 0, 'Correct: Het grotere oppervlak geeft de hogere fenolische substantie ruimte om te openen'),
  ('service-rose-wine', 'bewaren', 1, 'Hoe drink je de meeste rosés?', '["Jong", "Na 15 jaar", "Na oxidatie", "Na houtrijping"]', 0, 'Correct: Jong'),
  ('service-rose-wine', 'bewaren', 2, 'Wat schaadt rosé het meest?', '["Licht", "Kurk", "Etiket", "Flesvorm"]', 0, 'Correct: Licht'),
  ('service-rose-wine', 'bewaren', 3, 'Waar bewaar je rosé idealiter?', '["Warm", "Donker en koel", "In zonlicht", "Naast verwarming"]', 1, 'Correct: Donker en koel'),
  ('service-rose-wine', 'bewaren', 4, 'Wat verliest rosé relatief snel?', '["Frisheid", "Alcohol", "Zuren", "Suiker"]', 0, 'Correct: Frisheid'),
  ('service-rose-wine', 'bewaren', 5, 'Waarom is rosé extra kwetsbaar voor lichtschade (goût de lumière)?', '["Ze wordt vaak in helder glas gebotteld, waardoor riboflavine makkelijker reageert met licht", "Ze bevat altijd meer suiker dan andere wijn", "Ze wordt nooit met een kurk gesloten", "Ze bevat geen riboflavine"]', 0, 'Correct: Ze wordt vaak in helder glas gebotteld, waardoor riboflavine makkelijker reageert met licht'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 1, 'Welke stijl heeft vaak rijpingspotentieel?', '["Bandol", "Provence basic", "Pinot Grigio", "Cava"]', 0, 'Correct: Bandol'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 2, 'Te koud serveren zorgt voor:', '["Meer geur", "Minder geur", "Meer rijping", "Meer body"]', 1, 'Correct: Minder geur'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 3, 'Licht beschadigt:', '["Kwaliteit", "Zuren", "Alcohol", "Tannines"]', 0, 'Correct: Kwaliteit'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 4, 'Het beste glas voor lichte rosé is vaak:', '["Klein witwijnglas", "Groot roodwijnglas", "Champagneflûte", "Portglas"]', 0, 'Correct: Klein witwijnglas'),
  ('service-rose-wine', 'jong-drinken-vs-rijping', 5, 'Waarom verschuift de kleur van rosé sneller met de tijd dan die van rode wijn?', '["Rosé start met een veel kleinere antocyaanpool, waardoor dezelfde chemische route sneller zichtbaar wordt", "Rosé bevat nooit antocyanen", "Rosé wordt altijd warmer bewaard dan rode wijn", "Rosé heeft geen kurk nodig"]', 0, 'Correct: Rosé start met een veel kleinere antocyaanpool, waardoor dezelfde chemische route sneller zichtbaar wordt'),
  ('pairing-rose-wine', 'rose-en-salades', 1, 'Wat maakt salade lastig?', '["Alcohol", "Dressingzuur", "Suiker", "Temperatuur"]', 1, 'Correct: Dressingzuur'),
  ('pairing-rose-wine', 'rose-en-salades', 2, 'Welke stijl werkt goed?', '["Provence", "Vintage Port", "Amarone", "Sherry PX"]', 0, 'Correct: Provence'),
  ('pairing-rose-wine', 'rose-en-salades', 3, 'Wat helpt pairing?', '["Frisheid", "Hout", "Tannine", "Oxidatie"]', 0, 'Correct: Frisheid'),
  ('pairing-rose-wine', 'rose-en-salades', 4, 'Rosé ondersteunt door:', '["Lage zuren", "Balans", "Bitterheid", "Tannine"]', 1, 'Correct: Balans'),
  ('pairing-rose-wine', 'rose-en-salades', 5, 'Waarom werkt rosé vaak beter dan lichte rode wijn bij een salade met rucola of radicchio?', '["Rosé bevat vrijwel geen tannine, waardoor de chlorofyl-tanninebitterheid wordt vermeden", "Rosé bevat altijd meer suiker", "Rosé heeft nooit zuur", "Rode wijn bevat geen chlorofyl"]', 0, 'Correct: Rosé bevat vrijwel geen tannine, waardoor de chlorofyl-tanninebitterheid wordt vermeden'),
  ('pairing-rose-wine', 'rose-en-vis', 1, 'Waarom werkt rosé goed met vis?', '["Veel tannine", "Frisheid + structuur", "Oxidatie", "Houtrijping"]', 1, 'Correct: Frisheid + structuur'),
  ('pairing-rose-wine', 'rose-en-vis', 2, 'Welke vis is een topcombinatie?', '["Tonijn", "Haring met room", "Gerookte paling", "Wildzwijn"]', 0, 'Correct: Tonijn'),
  ('pairing-rose-wine', 'rose-en-vis', 3, 'Vettere vis vraagt:', '["Lichtere rosé", "Vollere rosé", "Zoetere rosé", "Warmere rosé"]', 1, 'Correct: Vollere rosé'),
  ('pairing-rose-wine', 'rose-en-vis', 4, 'Lichte rosé past goed bij:', '["Ceviche", "Stoofpot", "Wild", "Truffel"]', 0, 'Correct: Ceviche'),
  ('pairing-rose-wine', 'rose-en-vis', 5, 'Waarom kan rode wijn bij vette vis een metaalachtige bijsmaak veroorzaken?', '["IJzer en trimethylamine in het visvet reageren met tannine en polyfenolen", "Vis bevat altijd suiker", "Rode wijn bevat geen zuur", "Vis bevat geen eiwit"]', 0, 'Correct: IJzer en trimethylamine in het visvet reageren met tannine en polyfenolen'),
  ('pairing-rose-wine', 'rose-en-barbecue', 1, 'Barbecue bevat vaak:', '["Alleen zuur", "Vet en rook", "Alleen zoet", "Geen kruiden"]', 1, 'Correct: Vet en rook'),
  ('pairing-rose-wine', 'rose-en-barbecue', 2, 'Waarom werkt rosé goed?', '["Door hoge tannines", "Door zuur en fruit", "Door oxidatie", "Door restsuiker"]', 1, 'Correct: Door zuur en fruit'),
  ('pairing-rose-wine', 'rose-en-barbecue', 3, 'Welke stijl past goed?', '["Bandol", "Pinot Grigio", "Riesling", "Sancerre"]', 0, 'Correct: Bandol'),
  ('pairing-rose-wine', 'rose-en-barbecue', 4, 'Welke pairing is logisch?', '["Gegrilde kip", "Citroensorbet", "Oesters", "Stilton"]', 0, 'Correct: Gegrilde kip'),
  ('pairing-rose-wine', 'rose-en-barbecue', 5, 'Waarom werkt een zoet barbecueglazuur vaak beter met rosé dan met tanninerijke rode wijn?', '["Suiker versterkt de bitterheid en astringentie van tannine, een risico dat tanninearme rosé vermijdt", "Rosé bevat altijd meer alcohol", "Rode wijn bevat geen zuur", "Suiker heeft geen effect op tanninewaarneming"]', 0, 'Correct: Suiker versterkt de bitterheid en astringentie van tannine, een risico dat tanninearme rosé vermijdt'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 1, 'Aziatische keuken bevat vaak:', '["Spice en umami", "Alleen zout", "Alleen vet", "Geen zuur"]', 0, 'Correct: Spice en umami'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 2, 'Rosé helpt door:', '["Fruit en zuurspanning", "Tannine", "Oxidatie", "Houtrijping"]', 0, 'Correct: Fruit en zuurspanning'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 3, 'Welke pairing is logisch?', '["Sushi", "Wildzwijn", "Stilton", "Port"]', 0, 'Correct: Sushi'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 4, 'Pittige gerechten vragen vaak:', '["Minder tannine", "Meer tannine", "Meer hout", "Minder fruit"]', 0, 'Correct: Minder tannine'),
  ('pairing-rose-wine', 'rose-en-aziatisch', 5, 'Waarom voelt chilihitte milder aan bij een koele, laag-alcoholische rosé dan bij een warmere, alcoholrijke rode wijn?', '["Alcohol en warmte versterken beide het TRPV1-receptorsignaal dat capsaïcine activeert", "Rosé bevat nooit capsaïcine", "Rode wijn bevat geen alcohol", "Chili heeft geen effect op wijnperceptie"]', 0, 'Correct: Alcohol en warmte versterken beide het TRPV1-receptorsignaal dat capsaïcine activeert'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 1, 'Charcuterie bevat vaak:', '["Vet en zout", "Alleen zuur", "Alleen suiker", "Geen umami"]', 0, 'Correct: Vet en zout'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 2, 'Rosé helpt door:', '["Frisheid", "Oxidatie", "Hoge tannine", "Zoetheid"]', 0, 'Correct: Frisheid'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 3, 'Welke pairing is logisch?', '["Prosciutto", "Sorbet", "Chocolade", "Espresso"]', 0, 'Correct: Prosciutto'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 4, 'Waarom werkt rosé goed?', '["Vet + zuur balans", "Meer alcohol", "Minder fruit", "Meer tannine"]', 0, 'Correct: Vet + zuur balans'),
  ('pairing-rose-wine', 'rose-en-charcuterie', 5, 'Waarom kan zoute charcuterie een tanninerijke rode wijn ruwer laten aanvoelen?', '["Zout interageert met de trigeminale waarneming van tannine en versterkt astringentie", "Zout verwijdert alle tannine uit de wijn", "Charcuterie bevat geen vet", "Rode wijn bevat geen tannine"]', 0, 'Correct: Zout interageert met de trigeminale waarneming van tannine en versterkt astringentie'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 1, 'Welke stijl werkt goed bij barbecue?', '["Bandol", "Pinot Grigio", "Riesling", "Sauternes"]', 0, 'Correct: Bandol'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 2, 'Welke pairing is klassiek?', '["Rosé + tonijn", "Rosé + blue cheese", "Rosé + PX", "Rosé + espresso"]', 0, 'Correct: Rosé + tonijn'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 3, 'Waarom werkt rosé met Aziatisch?', '["Tannine", "Fruit + zuurspanning", "Oxidatie", "Houtrijping"]', 1, 'Correct: Fruit + zuurspanning'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 4, 'Wat vraagt charcuterie?', '["Zuur en fruit", "Alleen tannine", "Zoet", "Oxidatie"]', 0, 'Correct: Zuur en fruit'),
  ('pairing-rose-wine', 'rose-en-fine-dining', 5, 'Wat maakt een prestigecuvée zoals Garrus geschikt voor fine dining?', '["Vatgisting en lees-batonnage geven extra textuur die rijkere gerechten kan dragen", "Een zeer hoog restsuikergehalte", "Volledige afwezigheid van zuur", "Uitsluitend gebruik van witte druiven"]', 0, 'Correct: Vatgisting en lees-batonnage geven extra textuur die rijkere gerechten kan dragen'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 1, 'Welke stijl is meestal bleker?', '["Tavel", "Provence", "Bandol", "Rosado"]', 1, 'Correct: Provence'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 2, 'Welke stijl heeft meer body?', '["Provence", "Tavel", "Chiaretto", "Cinsault"]', 1, 'Correct: Tavel'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 3, 'Welke stijl is kruidiger?', '["Tavel", "Provence", "Navarra", "Chiaretto"]', 0, 'Correct: Tavel'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 4, 'Wat analyseer je eerst?', '["Kleur", "Alcohol", "Leeftijd", "Kurk"]', 0, 'Correct: Kleur'),
  ('examen-rose-wine', 'provence-vs-tavel-blind', 5, 'Welke stijl is gastronomischer?', '["Provence", "Tavel", "Basic rosé", "Zoete rosé"]', 1, 'Correct: Tavel'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 1, 'Wat is vaak het grootste verschil tussen rosé en lichte rode wijn?', '["Suiker", "Tannine", "Alcohol", "Flesvorm"]', 1, 'Correct: Tannine'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 2, 'Rosé heeft meestal:', '["Meer tannine", "Minder tannine", "Meer hout", "Meer oxidatie"]', 1, 'Correct: Minder tannine'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 3, 'Lichte rode wijn heeft vaak:', '["Meer fenolische grip", "Minder extractie", "Minder kleur", "Minder structuur"]', 0, 'Correct: Meer fenolische grip'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 4, 'Wat helpt het meest bij blind herkennen?', '["Textuur", "Etiket", "Prijs", "Flesgewicht"]', 0, 'Correct: Textuur'),
  ('examen-rose-wine', 'rose-vs-lichte-rode-wijn-blind', 5, 'Koude lichte rode wijn wordt soms verward met:', '["Port", "Krachtige rosé", "Mousserend", "Dessertwijn"]', 1, 'Correct: Krachtige rosé'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 1, 'Wat bepaalt bij rosé primair de kleurdiepte?', '["De duur van het schilcontact vóór het persen", "Het alcoholpercentage", "De rijpingstijd op fles", "De hoeveelheid restsuiker"]', 0, 'Correct: De duur van het schilcontact vóór het persen'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 2, 'Waarom heeft een lichte, bleke rosé weinig tannine?', '["Kort schilcontact beperkt tegelijk kleur- én tanninextractie", "Omdat er altijd water wordt toegevoegd", "Omdat alleen witte druiven gebruikt worden", "Omdat tannine wordt gefiltreerd na gisting"]', 0, 'Correct: Kort schilcontact beperkt tegelijk kleur- én tanninextractie'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 3, 'Hoe ontstond de eerste populaire White Zinfandel?', '["Door een gisting die per ongeluk stokte bij ongeveer 2% restsuiker", "Door bewuste suikertoevoeging na gisting", "Door blending met Chardonnay", "Door lange vatrijping"]', 0, 'Correct: Door een gisting die per ongeluk stokte bij ongeveer 2% restsuiker'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 4, 'Wat verklaart de kruidige, savoury toon van veel Bandol- en Tavel-rosé?', '["Rotundone uit Syrah en vluchtige garrigueverbindingen die zich aan de schil hechten", "Uitsluitend lange vatrijping", "Toevoeging van kruidenextract", "Een hoog restsuikergehalte"]', 0, 'Correct: Rotundone uit Syrah en vluchtige garrigueverbindingen die zich aan de schil hechten'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 5, 'Wat maakt Tavel structureel zwaarder dan een gemiddelde Provence rosé?', '["Bewuste menging van perswijn met vrijloopsap en een langere maceratie", "Toevoeging van suiker na gisting", "Uitsluitend gebruik van witte druiven", "Filtratie zonder gisting"]', 0, 'Correct: Bewuste menging van perswijn met vrijloopsap en een langere maceratie'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 6, 'Waarom is rosé geen ''verdunde rode wijn''?', '["Omdat kleur en tannine bij rosé ontkoppelde variabelen zijn", "Omdat rosé altijd van witte druiven wordt gemaakt", "Omdat rosé nooit tannine bevat", "Omdat rosé altijd zoeter is"]', 0, 'Correct: Omdat kleur en tannine bij rosé ontkoppelde variabelen zijn'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 7, 'Op welke temperatuur serveer je een structuurrijke Bandol of Tavel meestal?', '["4–6 °C", "8–10 °C", "11–13 °C", "16–18 °C"]', 2, 'Correct: 11–13 °C'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 8, 'Waarom is rosé extra kwetsbaar voor lichtschade (goût de lumière)?', '["Ze wordt vaak in helder glas gebotteld, waardoor riboflavine makkelijker reageert met licht", "Ze bevat altijd meer suiker", "Ze wordt nooit met een kurk gesloten", "Ze bevat geen riboflavine"]', 0, 'Correct: Ze wordt vaak in helder glas gebotteld, waardoor riboflavine makkelijker reageert met licht'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 9, 'Waarom verschuift de kleur van rosé sneller met de tijd dan die van rode wijn?', '["Rosé start met een veel kleinere antocyaanpool", "Rosé bevat nooit antocyanen", "Rosé wordt altijd warmer bewaard", "Rosé heeft geen kurk nodig"]', 0, 'Correct: Rosé start met een veel kleinere antocyaanpool'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 10, 'Welke stijl heeft dankzij het Mourvèdre-minimum een reëel bewaarpotentieel van vijf tot tien jaar?', '["Basic Provence", "Bandol", "Pinot Grigio", "Cava"]', 1, 'Correct: Bandol'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 11, 'Waarom werkt rosé vaak beter dan lichte rode wijn bij een bittere salade?', '["Rosé bevat vrijwel geen tannine, waardoor chlorofyl-tanninebitterheid wordt vermeden", "Rosé bevat altijd meer suiker", "Rosé heeft nooit zuur", "Rode wijn bevat geen chlorofyl"]', 0, 'Correct: Rosé bevat vrijwel geen tannine, waardoor chlorofyl-tanninebitterheid wordt vermeden'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 12, 'Waarom kan rode wijn bij vette vis een metaalachtige bijsmaak veroorzaken?', '["IJzer en trimethylamine in het visvet reageren met tannine en polyfenolen", "Vis bevat altijd suiker", "Rode wijn bevat geen zuur", "Vis bevat geen eiwit"]', 0, 'Correct: IJzer en trimethylamine in het visvet reageren met tannine en polyfenolen'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 13, 'Waarom werkt een zoet barbecueglazuur vaak beter met rosé dan met tanninerijke rode wijn?', '["Suiker versterkt bitterheid en astringentie van tannine, een risico dat tanninearme rosé vermijdt", "Rosé bevat altijd meer alcohol", "Rode wijn bevat geen zuur", "Suiker heeft geen effect op tanninewaarneming"]', 0, 'Correct: Suiker versterkt bitterheid en astringentie van tannine, een risico dat tanninearme rosé vermijdt'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 14, 'Waarom voelt chilihitte milder aan bij een koele, laag-alcoholische rosé?', '["Alcohol en warmte versterken beide het TRPV1-receptorsignaal", "Rosé bevat nooit capsaïcine", "Rode wijn bevat geen alcohol", "Chili heeft geen effect op wijnperceptie"]', 0, 'Correct: Alcohol en warmte versterken beide het TRPV1-receptorsignaal'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 15, 'Waarom kan zoute charcuterie een tanninerijke rode wijn ruwer laten aanvoelen?', '["Zout interageert met de trigeminale waarneming van tannine", "Zout verwijdert alle tannine", "Charcuterie bevat geen vet", "Rode wijn bevat geen tannine"]', 0, 'Correct: Zout interageert met de trigeminale waarneming van tannine'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 16, 'Wat maakt een prestigecuvée zoals Garrus geschikt voor fine dining?', '["Vatgisting en lees-batonnage geven extra textuur die rijkere gerechten kan dragen", "Een zeer hoog restsuikergehalte", "Volledige afwezigheid van zuur", "Uitsluitend gebruik van witte druiven"]', 0, 'Correct: Vatgisting en lees-batonnage geven extra textuur die rijkere gerechten kan dragen'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 17, 'Wat is bij Provence versus Tavel het meest betrouwbare onderscheidende signaal?', '["Kleurintensiteit alleen", "Tastbare fenolische grip op de afdronk", "Het gebruikte glas", "De flesvorm"]', 1, 'Correct: Tastbare fenolische grip op de afdronk'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 18, 'Waarom behoudt zelfs een geconcentreerde, diepgekleurde rosé structureel minder tannine dan de lichtste rode wijn?', '["Rosé wordt van de schillen gescheiden vóór of zeer vroeg in de gisting, terwijl rode wijn volledig op de schillen fermenteert", "Rosé bevat nooit schillen", "Rode wijn wordt nooit geperst", "Kleur en tannine zijn bij beide identiek gekoppeld"]', 0, 'Correct: Rosé wordt van de schillen gescheiden vóór of zeer vroeg in de gisting, terwijl rode wijn volledig op de schillen fermenteert'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 19, 'Wat is het beslissende criterium om rosé van lichte rode wijn te onderscheiden?', '["Kleurintensiteit", "Tastgrip, gekoppeld aan fermentatieduur op de schillen", "Het serveerglas", "De prijs van de fles"]', 1, 'Correct: Tastgrip, gekoppeld aan fermentatieduur op de schillen'),
  ('examen-rose-wine', 'theorie-praktijkexamen', 20, 'Wat is de kern van systematisch blindproeven bij rosé?', '["Een vaste keten van kleur, aroma, zuur, lichaam en textuur, met een hypothese vóór de conclusie", "Direct naar het etiket kijken vóór het proeven", "Alleen op kleur vertrouwen", "Alleen op de regio van herkomst gokken"]', 0, 'Correct: Een vaste keten van kleur, aroma, zuur, lichaam en textuur, met een hypothese vóór de conclusie')
) as v(module_slug, lesson_slug, sort_order, prompt, options, correct_index, explanation)
  on l.module_slug = v.module_slug and l.lesson_slug = v.lesson_slug;
