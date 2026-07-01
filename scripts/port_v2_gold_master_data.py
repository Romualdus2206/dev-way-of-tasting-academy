"""Port Track V2 — Gold Master QA data (reflectie, kernbegrippen, pairing, pro insight)."""

from __future__ import annotations

REFLECTIEVRAGEN: dict[int, str] = {
    1: (
        "Welk element — restsuiker, alcohol of herkomst — zou jij als eerste benoemen "
        "om een tafelwijn-drinker te laten begrijpen waarom Port anders proeft?"
    ),
    2: (
        "Stel: de most zit op 8° alcohol en gisting gaat door. Wat verandert er in het glas "
        "als je nog één dag wacht met fortificatie — en waarom is die timing niet uitstelbaar?"
    ),
    3: (
        "Welke Douro-factor — terrassen, schist of lage opbrengst — proef je het eerst terug "
        "in een jonge Ruby, en hoe zou je dat aan een gast verklaren?"
    ),
    4: (
        "Waarom exporteerden Britse handelshuizen vanuit Gaia in plaats van direct uit "
        "de Douro-wijngaarden — en wat zegt dat nog over Port-identiteit vandaag?"
    ),
    5: (
        "Een gast wil één Port voor kaas én pure chocolade: welke categorie kies jij, "
        "welk compromis accepteer je en wat leg je uit over structuur versus leeftijd?"
    ),
    6: (
        "Je proeft kracht maar weinig finesse in een blend: welk ras zou jij verhogen "
        "of verlagen — Touriga Nacional, Tinta Roriz of Tinto Cão — en waarom?"
    ),
    7: (
        "Als je alleen het etiket ziet 'Douro Superior', welke productieverwachting "
        "zet je — opbrengst, concentratie of drinkrijpheid — en hoe onderbouw je dat?"
    ),
    8: (
        "Waar zie jij terroir het duidelijkst: in de opbrengst per hectare, in de minerale "
        "spanning of in de structuur van de wijn — en welk voorbeeld gebruik je?"
    ),
    9: (
        "Wanneer zou jij bewust kiezen voor korte houtlagering boven lange oxidatieve "
        "houtlagering — en welke stijl verliest daarbij het meest?"
    ),
    10: (
        "Je proeft noten maar ook fris fruit: wijst dat op Ruby, Tawny of een hybride "
        "rijpingsroute — en welke observatie beslist voor jou?"
    ),
    11: (
        "Welke stap in je proefnotitie geeft jou nu de minste zekerheid — kleur, neus, "
        "structuur of conclusie — en wat oefen je daar concreet op?"
    ),
    12: (
        "Bij twee Ports met gelijke zoetheid proef jij één als zwaarder: welke "
        "structuurcomponent — alcohol, tannine of body — verklaart dat verschil?"
    ),
    13: (
        "Je ruikt karamel maar geen fruit: is dat oxidatie, houtlagering of leeftijd — "
        "en welke stijl zou jij daarop wedden vóór de eerste slok?"
    ),
    14: (
        "Bij twijfel tussen Ruby en Tawny: vertrouw jij eerst op kleur, oxidatie op de neus "
        "of mondgevoel — en welke cue heeft je het vaakst in de war gebracht?"
    ),
    15: (
        "Waar ging je te snel naar conclusie in je mini-toets — en welke observatie "
        "had je eerder moeten vastleggen om objectiever te zijn?"
    ),
    16: (
        "Waarom mag champagne uit geen enkele andere regio komen, en welke parallel "
        "trek jij naar Port — los van marketing, puur op productie en herkomst?"
    ),
    17: (
        "Kun jij op smaak herkennen of een Port meer quinta-identiteit of meer "
        "Port house-blend uitstraalt — en welke signalen gebruik je?"
    ),
    18: (
        "Wat maakt UNESCO-landschapstatus voor de Douro meer dan een toeristisch label "
        "voor de wijn in je glas?"
    ),
    19: (
        "Wanneer adviseer jij een Single Quinta boven een huisblend — en wanneer "
        "juist een Port house-stijl boven terroir-expressie?"
    ),
    20: (
        "Welke producent herken jij blind het snelst aan stijl — en welk aroma of "
        "structuurmerkteken is daarbij doorslaggevend?"
    ),
    21: (
        "Waar positioneer jij Ruby Reserve in je assortiment: als instap, als standaard "
        "of als alternatief voor LBV — en welke gastvraag triggert die keuze?"
    ),
    22: (
        "Een gast wil een oogstjaar-Port zonder Vintage-prijs: wanneer is LBV de "
        "juiste tussenstap — en wanneer mis je toch flespotentieel?"
    ),
    23: (
        "Je opent een Crusted zonder decanteeradvies op het etiket: welke signalen "
        "aan kleur of depot zeggen dat je alsnog moet decanteren?"
    ),
    24: (
        "Wat weegt zwaarder bij Vintage-advies: het declaratiejaar, de producent "
        "of het bewaarpotentieel — en hoe leg je dat aan een verzamelaar uit?"
    ),
    25: (
        "Voor een diner over tien jaar: kies jij Vintage of ongefilterde LBV — "
        "en welk rijpingsargument is doorslaggevend?"
    ),
    26: (
        "Zou jij White Port puur of als tonic inzetten op een warme avond — "
        "en welke gastvraag bepaalt die keuze?"
    ),
    27: (
        "Is Rosé Port voor jou een serieuze stijl of een instap — en verandert "
        "tonic met ijs je antwoord bij een jonge doelgroep?"
    ),
    28: (
        "Voor welk gastmoment kies jij bewust 10 Years Tawny — en wanneer "
        "investeer je in 30 of 40 Years in plaats van Vintage?"
    ),
    29: (
        "Colheita of 20 Years Tawny bij dezelfde prijs: kies jij consistentie "
        "of jaargangskarakter — en hoe verkoop je dat verschil?"
    ),
    30: (
        "Welk element van Garrafeira verwacht je het eerst te proeven — glasrijping, "
        "houtlagering of fleskarakter — en waarom?"
    ),
    31: (
        "Een Tawny smaakt log en plakkerig aan tafel: is de fles te warm, te oud "
        "of verkeerd gekozen — en welke temperatuurcorrigeer je als eerste?"
    ),
    32: (
        "Waarom schenk je Port in een kleiner glas dan Bordeaux — en wanneer "
        "zou je toch bewust iets meer volume geven aan Vintage?"
    ),
    33: (
        "Je twijfelt of decanteren nodig is: welke drie signalen aan fles, leeftijd "
        "of stijl beslissen voor jou — zonder het etiket te raadplegen?"
    ),
    34: (
        "Hoe lang laat jij een geopende Vintage staan versus een Tawny — "
        "en welke oxidatieve logica leg je daaraan ten grondslag?"
    ),
    35: (
        "Een gast bestelt koffie en wil 'iets zoets': welke Port stel jij voor "
        "vóór digestief — en welke vraag stel je om niet automatisch Tawny te pushen?"
    ),
    36: (
        "Bij blauwe kaas: kies jij LBV of Vintage — en welk argument over zout, "
        "zoet en tannine gebruik je om de gast te overtuigen?"
    ),
    37: (
        "Pure chocolade 85%: waarom is Ruby/LBV hier sterker dan oude Tawny — "
        "en hoe leg je bitterheid en structuur uit zonder over zoetheid te praten?"
    ),
    38: (
        "Waarom werkt aroma-spiegeling bij notendesserts beter dan contrast — "
        "en wanneer zou jij toch bewust Ruby inzetten?"
    ),
    39: (
        "Waarom is Port geen vervanger van droge rode wijn bij biefstuk — "
        "en bij welk gerecht zou jij wél Vintage naast het bord zetten?"
    ),
    40: (
        "Waar zie jij de grootste kans voor Port buiten het dessert: aperitief, "
        "reductie of kaas — en welke stijl zet je daar het eerst op de kaart?"
    ),
    41: (
        "Je hebt tien seconden om een gast door de Portkaart te leiden: welke "
        "drie categorieën noem je eerst — en waarom die volgorde?"
    ),
    42: (
        "Welke cue gaf je de meeste zekerheid bij blindproeven — en welke "
        "observatie leidde bijna tot een verkeerde stijlconclusie?"
    ),
    43: (
        "Een gast zegt 'ik hou niet van zoet': welke vraag stel jij vóór je "
        "überhaupt een stijl noemt — en welke Port ondermijn je die angst?"
    ),
    44: (
        "Je koopt één fles om twintig jaar te bewaren en één om morgen te drinken: "
        "welke stijlen kies je — en welke bewaarfout wil je absoluut vermijden?"
    ),
    45: (
        "Welke Portstijl kies jij voor jouw perfecte avond — en welke drie factoren "
        "(stijl, structuur, context) bepalen die keuze in die volgorde?"
    ),
}

GOLD_KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["versterkte wijn", "Douro", "restsuiker", "fortificatie", "stijlkeuze"],
    2: ["fortificatie", "aguardente", "restsuiker", "timing", "gisting"],
    3: ["terroir", "terrassen", "schist", "traditie", "concentratie"],
    4: ["handel", "lodge", "Gaia", "Britten", "geschiedenis"],
    5: ["Ruby", "Tawny", "Vintage", "White Port", "portcategorieën"],
    6: ["blend", "Touriga Nacional", "Touriga Franca", "Tinta Roriz", "Tinto Cão"],
    7: ["Baixo Corgo", "Cima Corgo", "Douro Superior", "terrassen", "opbrengst"],
    8: ["terroir", "schist", "klimaat", "stress", "concentratie"],
    9: ["houtlagering", "pipa", "oxidatie", "vatgrootte", "stijlarchitectuur"],
    10: ["oxidatieve rijping", "Ruby", "Tawny", "reductie", "zuurstof"],
    11: ["proefnotitie", "kleur", "neus", "mondgevoel", "conclusie"],
    12: ["zoetheid", "alcohol", "tannine", "body", "balans"],
    13: ["fruitaroma", "kruiden", "noten", "oxidatieve tonen", "neus"],
    14: ["blindproeven", "Ruby", "Tawny", "kleur", "oxidatie"],
    15: ["integratie", "systematiek", "analyse", "stijlherkenning", "objectiviteit"],
    16: ["herkomst", "Douro", "Porto", "lodge", "beschermde oorsprong"],
    17: ["regionaliteit", "quinta", "druivenras", "terroiridentiteit", "traditie"],
    18: ["landschap", "UNESCO", "terrassen", "erfgoed", "quinta"],
    19: ["quinta", "Port house", "blend", "Single Quinta", "stijl"],
    20: ["producent", "huisstijl", "herkenning", "blendfilosofie", "signatuur"],
    21: ["Ruby Reserve", "selectie", "fruit", "structuur", "positionering"],
    22: ["LBV", "oogstjaar", "houtlagering", "toegankelijkheid", "Vintage"],
    23: ["Crusted", "depot", "decanteren", "ongefilterd", "blend"],
    24: ["Vintage", "declaratie", "IVDP", "flesrijping", "tannine"],
    25: ["Vintage", "LBV", "rijpingstraject", "toegankelijkheid", "keuze"],
    26: ["White Port", "aperitief", "witte druiven", "tonic", "frisheid"],
    27: ["Rosé Port", "schilcontact", "aperitief", "fruit", "modern"],
    28: ["Tawny", "oxidatieve rijping", "leeftijdslabel", "noten", "gemiddelde leeftijd"],
    29: ["Colheita", "single harvest", "houtlagering", "oogstjaar", "botteljaar"],
    30: ["Garrafeira", "glasrijping", "demijohn", "zeldzaamheid", "complexiteit"],
    31: ["serveertemperatuur", "Ruby", "Tawny", "Vintage", "service"],
    32: ["glaswerk", "tulpvorm", "aroma", "alcohol", "concentratie"],
    33: ["decanteren", "depot", "Vintage", "lucht", "textuur"],
    34: ["houdbaarheid", "oxidatie", "opening", "koel bewaren", "stijl"],
    35: ["moment", "aperitief", "digestief", "stijlkeuze", "advies"],
    36: ["kaas", "zout", "zoetheid", "vet", "intensiteitsmatch"],
    37: ["chocolade", "bitter", "structuur", "Ruby", "intensiteit"],
    38: ["noten", "Tawny", "oxidatie", "aroma-spiegeling", "textuur"],
    39: ["wild", "reductie", "tannine", "Vintage", "umami"],
    40: ["gastronomie", "reductie", "smaakversterker", "Ruby", "Tawny"],
    41: ["portkaart", "stijl", "inzetbaarheid", "service", "navigatie"],
    42: ["blindproeven", "eliminatie", "structuur", "logica", "analyse"],
    43: ["advies", "gastcontext", "moment", "behoefte", "verkoop"],
    44: ["kelder", "flesrijping", "Vintage", "bewaren", "potentieel"],
    45: ["integratie", "stijl", "structuur", "context", "professionaliteit"],
}

PRO_INSIGHTS: dict[int, str] = {
    1: (
        "Gasten die Port 'te zoet' vinden, hebben vaak alleen basis-Ruby geproefd. "
        "Herinterpreteer: vraag naar moment en gerecht vóór je stijl noemt — White Port "
        "of oudere Tawny opent vaak de deur naar verkoop."
    ),
    2: (
        "Fortificatie is geen detail op het etiket maar het smaakcontract van Port. "
        "Leg in één zin uit dat timing suiker én alcohol vastlegt — dat voorkomt discussies "
        "over 'natuurlijke' zoetheid achteraf."
    ),
    3: (
        "Uniek in Port is de combinatie terroir + methode + geschiedenis — bijna niet "
        "kopieerbaar. Vraag bij elk advies: welke van die drie proef je terug in het glas?"
    ),
    4: (
        "Geschiedenis verklaart waarom Port wereldwijd heet naar Porto, terwijl de druiven "
        "honderd kilometer oostwaarts groeien. Dat onderscheid gebruik je om herkomst "
        "serieus te nemen in service en verkoop."
    ),
    5: (
        "Beginners kiezen Port op leeftijd; professionals op moment. Vraag niet 'wat is "
        "de oudste?' maar 'wat past nu?' — dat voorkomt mispairings en dode voorraad."
    ),
    6: (
        "Vraag niet 'welke druif proef ik?' maar 'welke rol speelt deze druif?' — "
        "blenddenken is hoe sommeliers Port analyseren en blind elimineren."
    ),
    7: (
        "Subzone op het etiket of in het verhaal van de producent voorspelt vaak "
        "concentratie en stijl. Vraag altijd: waar binnen de Douro komt deze Port vandaan?"
    ),
    8: (
        "Hitte en schist zijn geen achtergronddecoratie — ze verklaren waarom Port "
        "structuur en concentratie kan dragen die tafelwijn zelden heeft."
    ),
    9: (
        "Oude Tawny hoeft zelden gedecanteerd; Vintage bijna altijd. Dat onderscheid "
        "voorkomt de meest voorkomende servicefout bij Port."
    ),
    10: (
        "Oxidatie is bij Port vaak stijl, geen fout. Leer gasten dat Ruby en Tawny "
        "bewuste zuurstofkeuzes zijn — dat maakt blindproeven en advies logischer."
    ),
    11: (
        "Een proefnotitie zonder structuur is marketing. Train op kleur → neus → "
        "mondgevoel → conclusie tot het automatisch gaat — ook onder tijdsdruk."
    ),
    12: (
        "Vraag bij elke slok: wat blijft hangen — zoetheid, alcohol of tannine? "
        "Dat vertelt waar de wijn op gebouwd is en voorkomt stijlverwarring."
    ),
    13: (
        "Train op aroma-families (fruit, kruiden, noten, oxidatie), niet op losse woorden. "
        "Herhaling bouwt de neusbibliotheek die blindproeven versnelt."
    ),
    14: (
        "Bij twijfel: oxidatie beslist, niet zoetheid alleen. Beide stijlen zijn zoet — "
        "wie op suiker gokt, verliest blindproeven structureel."
    ),
    15: (
        "Objectiviteit wint van snelheid. Noteer eerst wat je ziet en proeft; stijl "
        "is conclusie, niet vertrekpunt — dat is het verschil tussen proeven en gokken."
    ),
    16: (
        "Vraag altijd: waar komt deze Port exact vandaan? Locatie vertelt vaak meer "
        "dan het label — essentieel bij verkoop van premium en Single Quinta."
    ),
    17: (
        "Regionaliteit lees je in consistentie per quinta en raskeuze op hellingen — "
        "niet in één druif op het etiket."
    ),
    18: (
        "UNESCO-status ondersteunt prijs en verhaal, maar proef het terug via terrassen "
        "en arbeidsintensiteit — anders blijft het folklore."
    ),
    19: (
        "Quinta versus Port house is geen hiërarchie maar keuze: terroir-expressie "
        "tegen huisstijl. Match dat aan wat de gast zoekt: verhaal of consistentie."
    ),
    20: (
        "Grote Port houses hebben herkenbare signatuur — leer twee producenten echt "
        "goed in plaats van twintig oppervlakkig. Dat verkoopt beter dan jaartallen."
    ),
    21: (
        "Ruby Reserve is je brug naar premium: positioneer hem tussen instap-Ruby en "
        "LBV — ideaal voor gasten die fruit willen zonder Vintage-budget."
    ),
    22: (
        "LBV is het antwoord op 'oogstjaar zonder Vintage-prijs'. Benadruk langere "
        "houtlagering en directe drinkrijpheid — maar wees eerlijk over flespotentieel."
    ),
    23: (
        "Crusted zonder decanteren is een servicefout wachten om te gebeuren. Check "
        "depot vóór schenken en communiceer dat proactief aan de gast."
    ),
    24: (
        "Vintage verkopen is bewaaradvies verkopen. Vraag altijd: drinken of bewaren? "
        "Dat bepaalt service, glas en pairing — en voorkomt teleurstelling."
    ),
    25: (
        "Vintage versus LBV is geen kwaliteitsrangorde maar rijpingsfilosofie. "
        "Verticale spanning tegen horizontale toegankelijkheid — gebruik die taal in advies."
    ),
    26: (
        "White Port op tonic is uw instap voor niet-Port-drinkers: lage drempel, "
        "hoge conversie naar serieuze stijlen later op de avond."
    ),
    27: (
        "Behandel Rosé niet als 'minder Port' maar als moment-specifieke stijl — "
        "aperitief en jonge doelgroep, niet als digestief-vervanger."
    ),
    28: (
        "Leeftijdslabel op Tawny is gemiddelde leeftijd, geen exacte jaargang. "
        "Leg dat uit vóór de prijs — anders ontstaat verwachtingsfout bij proef."
    ),
    29: (
        "Colheita is vaak de meest onderschatte premiumcategorie: oxidatieve diepte "
        "met oogstverhaal. Ideaal voor gasten die Tawny kennen maar meer persoonlijkheid willen."
    ),
    30: (
        "Garrafeira is zeldzaamheid en verhaal — niet voor elk menu. Reserveer voor "
        "gasten die oxidatie én finesse begrijpen; anders wint 30 Years Tawny."
    ),
    31: (
        "Koel Tawny één graad extra in warme zaal: de fles warmt aan tafel op "
        "naar precies serveerpunt — standaard sommelier-truc."
    ),
    32: (
        "Klein glas temt alcohol bij 20% abv. Te groot glas maakt Port branderig — "
        "gasten associëren dat ten onrechte met kwaliteit."
    ),
    33: (
        "Decanteer niet uit traditie maar uit depot en textuur. Tawny en Colheita "
        "zijn al oxidatief stabiel — onnodig decanteren verliest aromatische finesse."
    ),
    34: (
        "Geopende Vintage niet weken laten staan; Tawny wel. Communiceer dat bij "
        "verkoop van dure flessen — voorkomt klachten en voedt herhaalaankoop."
    ),
    35: (
        "Moment bepaalt stijl, niet favoriet of voorraad. Eén gerichte vraag over "
        "aperitief, kaas of digestief bespaart tien minuten uitleg."
    ),
    36: (
        "Kaas eerst proeven, dan Port — niet omgekeerd. Die volgorde maakt zout-zoet "
        "balans zichtbaar en versterkt upsell naar tweede glas."
    ),
    37: (
        "Donkerder chocolade vraagt meer structuur, niet meer zoetheid. Bij twijfel "
        "wint Ruby Reserve boven oude Tawny bij pure cacao — voorkomt bitter-op-bitter."
    ),
    38: (
        "Tawny bij noten is de veiligste dessertpairing in hospitality: oxidatieve "
        "spiegeling, weinig risico — ideaal als standaard dessertaanbeveling."
    ),
    39: (
        "Port bij vlees is niche: verkoop het als reductie of wildpairing, niet "
        "als tafelwijn naast biefstuk — restsuiker verstoort dan de balans."
    ),
    40: (
        "Houd kook-Port apart van drinkvoorraad. Eén fles Ruby/LBV voor de keuken "
        "voorkomt dat je per ongeluk Vintage in de pan gooit."
    ),
    41: (
        "Sterke sommeliers kennen niet elke fles maar wel elke categorie-inzet. "
        "Groepeer de kaart op moment, niet op prijs — dat versnelt verkoop."
    ),
    42: (
        "Elimineer systematisch: kleur → oxidatie → structuur. Gokken op één cue "
        "is hoe beginners Ruby en oude Tawny verwarren."
    ),
    43: (
        "Eén open vraag over moment en ervaring levert betere match dan drie minuten "
        "monoloog over jaargangen — en verhoogt gemiddelde bonwaarde."
    ),
    44: (
        "Kelder zonder geduld koop Ruby; kelder met visie koop Vintage. Wees eerlijk "
        "over welke gast welke categorie is — dat bouwt vertrouwen."
    ),
    45: (
        "Port mastery is integratie: stijl, structuur en context in één beslissing. "
        "Als je die drie kunt benoemen bij elke glaskeuze, ben je examenklaar."
    ),
}

FOOD_PAIRING_WAAROM: dict[int, str] = {
    1: (
        "Zoetheid en concentratie vangen zout in blauwschimmelkaas en bitter in pure "
        "chocolade; alcohol snijdt door vet zodat fruit en caramel niet plakkerig worden."
    ),
    2: (
        "Restsuiker na fortificatie balanceert zout in oude kaas; alcohol en structuur "
        "dragen vet in notige gerechten zonder dat de wijn plat aanvoelt."
    ),
    3: (
        "Concentratie uit terroir matcht intense smaken: zout, umami en vet vragen "
        "een wijn met body en zoetheid die niet verdwijnt na één hap."
    ),
    4: (
        "Historische exportparen (Stilton, noten) zijn gebouwd op zout-zoet en vet-alcohol — "
        "dezelfde structuurlogica die Britse lodges eeuwenlang toepasten."
    ),
    5: (
        "Ruby: fruit en tannine tegen bittere cacao; Tawny: oxidatie en karamel tegen "
        "noten; White: frisheid tegen zout; Vintage: structuur tegen krachtige kaas."
    ),
    6: (
        "Blendcomplexiteit vraagt gelaagde smaken: zout, bitter en umami in kaas of "
        "chocolade geven het fruit en de structuur van de wijn iets om tegen te werken."
    ),
    7: (
        "Tannine en concentratie uit Douro Superior-fruit dragen wild en gamey eiwit; "
        "zoetheid temt geen vlees maar balanceert brasaus en vet."
    ),
    8: (
        "Minerale spanning en concentratie uit stress-terroir passen bij rijpe kaas "
        "en noten: zout en vet versterken body zonder zuurconflict."
    ),
    9: (
        "Karamel in dessert en karamel in Tawny delen oxidatieve aroma's; textuur "
        "in crème brûlée en mondgevoel in oude Port lopen gelijk op."
    ),
    10: (
        "Ruby's fruitige structuur balanceert zout; Tawny's oxidatie spiegelt noten — "
        "de zuurstofkeuze in rijping bepaalt welke pairing logischer is."
    ),
    11: (
        "Pairing begint bij structuuranalyse: zoetheid, tannine en alcohol bepalen "
        "of zout, vet of bitter in het gerecht gedragen wordt."
    ),
    12: (
        "Structuurcomponenten voorspellen pairing: hoge tannine tegen eiwit, zoetheid "
        "tegen zout, alcohol tegen vet — dezelfde logica als bij kaas en dessert."
    ),
    13: (
        "Aroma-families wijzen naar pairing: fruit naar rood fruitdessert, oxidatie "
        "naar noten, kruiden naar gekruide kaas — neus als eerste pairingfilter."
    ),
    14: (
        "Ruby: primair fruit en tannine bij chocolade; Tawny: oxidatie bij noten — "
        "blind herken je de pairingroute via oxidatie, niet via zoetheid alleen."
    ),
    16: (
        "Beschermde herkomst impliceert concentratie: zout in kaas en bitter in cacao "
        "vragen de structuur die alleen Douro-Port consistent levert."
    ),
    22: (
        "LBV-fruit en tannine dragen pure chocolade: bitters en vet worden gevangen "
        "door restsuiker en structuur zonder oxidatie-conflict."
    ),
    28: (
        "Oxidatieve noten in Tawny spiegelen geroosterde noten en karamel in dessert; "
        "textuur en aroma lopen parallel — flavor bridging op aroma-overlap."
    ),
    36: (
        "Zout versterkt zoetheidsperceptie; vet in kaas wordt doorgesneden door alcohol; "
        "tannine in Vintage/Ruby balanceert romigheid in blauwschimmel."
    ),
    37: (
        "Zwart fruit en tannine in Ruby dragen cacao-bitterheid en vet in pure chocolade; "
        "structuur houdt de wijn levendig terwijl bitter en zoet in balans blijven."
    ),
    38: (
        "Geroosterde noten in dessert en oxidatieve noten in Tawny delen aroma-families; "
        "textuur in taart en mondgevoel in de wijn versterken elkaar zonder zuurconflict."
    ),
    39: (
        "Tannine en concentratie in Vintage dragen gamey eiwit; reductie met Ruby/LBV "
        "karamelliseert suiker en versterkt umami in de saus."
    ),
    40: (
        "Gereduceerde Port concentreert suiker en fruit tot sausdiepte; umami in wild "
        "wordt versterkt zonder dat restsuiker het gerecht zoet maakt."
    ),
    15: (
        "Pairing volgt uit analyse: zoetheid tegen zout, tannine tegen vet, oxidatie "
        "tegen noten — pas de stijl aan wat je in het glas observeerde, niet omgekeerd."
    ),
    17: (
        "Zout in oude kaas versterkt zoetheid in LBV; vet wordt doorgesneden door alcohol "
        "terwijl regionale blendcomplexiteit gelaagde smaken in de kaas kan dragen."
    ),
    18: (
        "Tannine en concentratie uit Cima Corgo-fruit dragen wildpaté: umami en vet "
        "vragen structuur; zoetheid balanceert zout zonder het gerecht te overheersen."
    ),
    19: (
        "Single Quinta-concentratie vraagt krachtige partners: zout in Stilton en structuur "
        "in Vintage dragen elkaar; een huisblend vraagt dezelfde intensiteitsmatch op zout en vet."
    ),
    20: (
        "Fruitgedreven LBV bij chocolade: bitters en vet in fondant worden gedragen door "
        "restsuiker en tannine; Tawny van hetzelfde huis spiegelt noten via oxidatie."
    ),
    21: (
        "Ruby Reserve-fruit en tannine dragen pure chocolade: cacao-bitterheid vraagt structuur, "
        "niet extra zoetheid; vet in de chocolade wordt doorgesneden door alcohol."
    ),
    23: (
        "Crusted-structuur en fruit bij blauwschimmelkaas: zout versterkt zoetheid, "
        "tannine snijdt door romig vet — decanteren voorkomt textuurconflict in de pairing."
    ),
    24: (
        "Vintage-tannine en concentratie dragen Stilton: zout, romig vet en umami vragen "
        "lengte en zoetheid in balans — de klassieke zout-zoet-structuurmatch."
    ),
    25: (
        "LBV-fruit bij chocolade werkt via structuur; Vintage bij kaas via tannine en lengte — "
        "kies op rijpingsfilosofie, niet op prijs alleen."
    ),
    26: (
        "Frisse zuur en lichte zoetheid in White Port tegen zout in olijven en amandelen; "
        "lage intensiteit vraagt geen zware tannine of oxidatie."
    ),
    27: (
        "Fruitige frisheid en lichte structuur in Rosé spiegelen rood fruit en zachte zuren "
        "in aperitiefhapjes zonder zoetheidsconflict met hartige tonen."
    ),
    30: (
        "Complexiteit en zachte oxidatie in Garrafeira vragen rijke partners: zout in oude kaas "
        "en vet in pure chocolade dragen de gelaagde mondtextuur."
    ),
    31: (
        "Koel geserveerde Tawny behoudt frisheid naast zoute kaas; te warme Port maakt "
        "zoetheid plakkerig — temperatuur is onderdeel van de pairingbalans."
    ),
    32: (
        "Geconcentreerd aroma in een klein glas versterkt zout-zoet perceptie bij kaas "
        "zonder dat alcohol de neus overneemt — glaswerk ondersteunt structuurmatch."
    ),
    33: (
        "Decanteren verwijdert depot dat bitterheid zou toevoegen naast zoute kaas; "
        "heldere structuur laat zoetheid en zout correct interacteren."
    ),
    34: (
        "Oxidatief stabiele Tawny blijft weken drinkbaar na opening bij kaasplank; "
        "Vintage vraagt kortere service — houdbaarheid bepaalt pairingplanning."
    ),
    35: (
        "Aperitief vraagt frisheid (White/Rosé), digestief oxidatie (Tawny) en kaas "
        "structuur (Vintage/LBV) — moment bepaalt welke smaakcomponent (zuur, zoet, tannine) leidt."
    ),
    41: (
        "Ruby bij chocolade via fruit-tannine; Tawny bij noten via oxidatie; LBV bij blauwe kaas "
        "via zout-zoet — de kaart groepeert stijlen op inzetbare structuur, niet op prijs."
    ),
    42: (
        "Pairing onderbouwt blindconclusie: fruitige structuur naar chocolade, oxidatie naar "
        "noten — elke stijlkeuze moet drie proefsignalen ondersteunen."
    ),
    43: (
        "Advies start bij gastbehoefte: zoetheidsangst vraagt Tawny of White, niet Ruby; "
        "structuurvraag bij chocolade vraagt LBV — context bepaalt de pairing-as."
    ),
    44: (
        "Vintage bij Stilton na jaren flesrijping: tannine is gezacht maar structuur blijft; "
        "zout en vet vragen de concentratie die alleen lange rijping levert."
    ),
}

QUIZ_PATCHES: dict[int, str] = {
    1: (
        "### Vraag 3\n\n"
        "Een gast bestelt pure chocolade en zoekt een fruitige Port.\n\n"
        "Wat adviseer je?\n\n"
        "A. White Port\n"
        "B. Ruby Reserve ✅\n"
        "C. Dry White\n"
        "D. Tawny 30 Years\n\n"
    ),
    5: (
        "### Vraag 5\n\n"
        "Een gast wil na het diner één Port voor kaas én pure chocolade. Meest logische richting?\n\n"
        "A. White Port\n"
        "B. LBV of Ruby Reserve ✅\n"
        "C. Tawny 40 Years\n"
        "D. Rosé Port\n\n"
    ),
    9: (
        "### Vraag 5\n\n"
        "Je proeft noten en karamel maar weinig fris fruit. Meest logische verklaring?\n\n"
        "A. Geen houtlagering ooit\n"
        "B. Lange houtlagering in grote vaten ✅\n"
        "C. Alleen fortificatie op dag één\n"
        "D. Jonge Ruby zonder rijping\n\n"
    ),
    14: (
        "### Vraag 3\n\n"
        "Blind: diep robijn, braam op de neus, stevige tannine. Meest waarschijnlijk?\n\n"
        "A. Tawny 20 Years\n"
        "B. Ruby of jonge Ruby-stijl ✅\n"
        "C. White Port\n"
        "D. Colheita 1970\n\n"
    ),
    22: (
        "### Vraag 4\n\n"
        "Gast wil oogstjaar-Port voor binnen vijf jaar drinken, geen decanteren. Beste advies?\n\n"
        "A. Vintage 2011\n"
        "B. LBV gefilterd ✅\n"
        "C. Garrafeira\n"
        "D. Crusted zonder depot\n\n"
    ),
    35: (
        "### Vraag 3\n\n"
        "Warme zomeravond, gast wil iets lichts vóór het eten. Meest logische Port?\n\n"
        "A. Vintage\n"
        "B. White Port of Rosé ✅\n"
        "C. Tawny 30 Years\n"
        "D. LBV ongefilterd\n\n"
    ),
}

TERMINOLOGY_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bPort House\b", "Port house"),
    (r"\bPorthuis\b", "Port house"),
    (r"\bPorthuizen\b", "Port houses"),
    (r"\bport houses\b", "Port houses"),
    (r"\bhoutrijping\b", "houtlagering"),
    (r"\bvatrijping\b", "houtlagering"),
    (r"\bkorte houtrijping\b", "korte houtlagering"),
    (r"\blange houtrijping\b", "lange houtlagering"),
    (r"\bminimumvatrijping\b", "minimale houtlagering"),
]
