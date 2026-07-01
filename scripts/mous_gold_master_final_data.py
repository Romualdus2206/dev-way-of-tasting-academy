"""MOUS Track V2 — Gold Master FINAL micro-polish data."""

from __future__ import annotations

TYPO_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bfoodpairing\b", "food pairing"),
    (r"✅[ \t]+", "✅"),
    (r"(\d)°C", r"\1 °C"),
    (r" {2,}", " "),
    (r"\.{2,}", "."),
    (r" +([,.;:!?])", r"\1"),
    (r"\n{3,}", "\n\n"),
    (r"\bzgn\.\b", "zogenaamd"),
    (r"\bevt\.\b", "eventueel"),
    (r"\bm\.b\.t\.\b", "met betrekking tot"),
]

KERNBEGRIP_FIXES: dict[int, list[str]] = {
    1: ["mousse", "CO₂", "druk", "tweede gisting", "methode-hypothese"],
    3: ["zuur", "mousse", "textuur", "frisheid", "moussepersistentie"],
    4: ["Champagne", "tweede gisting", "drukbeheersing", "prestigepositionering", "methode-evolutie"],
    11: ["mousse", "retronasale waarneming", "moussepersistentie", "dosagebalans", "mondgevoelstructuur"],
    12: ["mousse", "perlage", "wandlijn-analyse", "persistentie", "mondgevoel"],
    15: ["blindproeven", "mousse", "methode-hypothese", "aromaherkenning", "structuuranalyse"],
    17: ["Chardonnay", "Pinot Noir", "Meunier", "blendarchitectuur", "assemblagelogica"],
    23: ["Crémant", "Frankrijk", "traditionele methode", "appellatiediversiteit", "prijspositionering"],
    27: ["Extra Brut", "dosagebalans", "restsuiker", "zuur", "finesse"],
    28: ["Brut", "dosagebalans", "marktstandaard", "aperitief", "inzetbreedte"],
    31: ["serveervenster", "frisheid", "aromaopening", "koolzuurspanning", "schenkprotocol"],
    33: ["ontkurkingstechniek", "kurk", "druk", "schenkveiligheid", "moussebehoud"],
    34: ["bewaren", "rijping", "drinkvenster", "keldercondities", "complexiteit"],
    37: ["maaltijdwijn", "drukcurve", "stijlkeuze", "intensiteitsopbouw", "serveerritme"],
    38: ["blind", "Champagne", "Cava", "mousse-integratievergelijking", "blindproefprotocol"],
    24: ["Franciacorta", "Satèn-stijl", "lagere druk", "autolyse-integratie", "flesrijping"],
    40: ["examenprotocol", "blindproeven", "servicecasusanalyse", "gastronomische casuïstiek", "examenstrategie"],
}

WIST_JE_DAT_OVERRIDES: dict[int, str] = {
    1: (
        "De druk in een fles mousserende wijn ligt doorgaans rond 5 à 6 bar — ongeveer "
        "drie keer de bandenspanning van een personenauto — waardoor service en glaswerk "
        "nooit een esthetische keuze zijn, maar altijd ook een veiligheidskwestie."
    ),
    2: (
        "Autolyse-integratie verloopt niet lineair: de eerste twaalf maanden op gist "
        "leveren doorgaans de grootste smaakwinst, daarna vertraagt de complexiteitsopbouw "
        "merkbaar — een nuttig argument om jonge non-vintage niet zomaar als onvolwassen af te schrijven."
    ),
    3: (
        "Koolzuur werkt als actieve reiniger op het palet: het is de enige smaakdrager in "
        "wijn die fysiek vet en residu van de tong spoelt, wat verklaart waarom mousserend "
        "zo breed inzetbaar is bij vette of zoute gerechten."
    ),
    4: (
        "De vroege angst voor ongecontroleerde tweede gisting in zwakke flessen verdween "
        "pas toen glasproductie en drukbeheersing verbeterden — daarna werd bubbels een "
        "bewust verkoopargument in plaats van een productierisico."
    ),
    5: (
        "Elke mousserende categorie communiceert impliciet een prijsverwachting: zodra een "
        "gast 'Cava' of 'Crémant' hoort, ligt het prijsanker al lager dan bij 'Champagne' — "
        "ook als de kwaliteit in het glas vergelijkbaar is."
    ),
    6: (
        "De wettelijke minimumrijping van 15 maanden is een ondergrens, geen kwaliteitsdoel: "
        "de meeste premium huizen rijpen drie tot vijf keer langer, omdat autolyse-integratie "
        "pas na maanden echt versnelt."
    ),
    7: (
        "Charmat is geen 'snelle' methode omdat ze slechter is, maar omdat de tankdruk "
        "gelijkmatiger en groter is dan in een fles — daardoor blijft het primaire fruit van "
        "Glera bewaard in plaats van overschaduwd door autolyse."
    ),
    8: (
        "Transfermethode bestaat vooral om grote of onregelmatige flesformaten te kunnen "
        "degorgeren zonder elke fles individueel op het riddlingrek te zetten — een "
        "logistieke oplossing, geen smaakkeuze."
    ),
    9: (
        "Omdat Pet-Nat zonder dosage en vaak zonder filtering wordt gebotteld, varieert elke "
        "partij merkbaar in troebelheid en koolzuurniveau — wat het tot de minst "
        "voorspelbare maar meest authentieke mousserende stijl maakt."
    ),
    10: (
        "Dosagebalans werkt niet lineair met perceptie: een paar gram restsuiker extra kan "
        "een wijn van streng naar rond kantelen, terwijl het analytische verschil in het lab "
        "nauwelijks meetbaar is."
    ),
    11: (
        "Koolzuur versnelt de afgifte van vluchtige aromastoffen aan het glasoppervlak — "
        "daarom ruik je net geschonken mousserende wijn intenser dan vijf minuten later, "
        "wanneer de mousse al gedeeltelijk is uitgewerkt."
    ),
    12: (
        "Fijne, langzame perlage ontstaat niet toevallig: ze wijst op lange gistcontacttijd "
        "en een schoon glas, terwijl grove, snelle bubbels vaker duiden op jonge tankwijn of "
        "vetresidu op het glas."
    ),
    13: (
        "Brioche- en gistnoten in Champagne zijn geen extra smaakje maar het directe gevolg "
        "van autolyse-integratie — hoe langer het gistcontact, hoe dominanter die laag wordt "
        "over het primaire fruit."
    ),
    14: (
        "Structuur weegt zwaarder dan zoetheid in de perceptie van kwaliteit: een droge wijn "
        "met fijne mousse en lang zuur voelt vaak rijker aan dan een zoetere wijn met grove "
        "bubbels."
    ),
    15: (
        "Een mini-toets test niet je geheugen van losse feiten, maar of je een waarneming "
        "— mousse, zuur, aroma — kunt koppelen aan de juiste productiemethode; precies die "
        "vertaalslag maak je aan tafel ook."
    ),
    16: (
        "Krijtbodem in de Champagne werkt als natuurlijke waterbuffer: hij houdt vocht vast "
        "in droge periodes en draineert overtollig water snel, wat de wijnstok onder "
        "constante, milde stress houdt — een sleutelfactor voor de signatuurzuurgraad."
    ),
    17: (
        "Chardonnay, Pinot Noir en Meunier spelen elk een andere structurele rol in de "
        "blend: Chardonnay levert finesse en bewaarpotentieel, Pinot Noir lichaam en kracht, "
        "Meunier vroege toegankelijkheid — blendarchitectuur is een bewuste rolverdeling, "
        "geen willekeurige mix."
    ),
    18: (
        "Blanc de Blancs heeft doorgaans een langer bewaarpotentieel dan Blanc de Noirs "
        "omdat Chardonnay van nature meer zuur en minder kleurstof bevat, wat de wijn langer "
        "reductief en strak houdt op fles."
    ),
    19: (
        "Een gedeclareerd topjaar betekent dat het huis zijn beste basiswijn reserveert voor "
        "een eenmalige blend uit één oogst — daardoor proef je in Vintage een ander, smaller "
        "productieverhaal dan in de jaarlijks herhaalbare non-vintage stijl."
    ),
    20: (
        "Prestigepositionering wordt niet alleen bepaald door rijpingsduur, maar door de "
        "keuze om de beste percelen en oogstjaren exclusief te reserveren — dat "
        "schaarste-principe rechtvaardigt de prijs net zo veel als de smaak."
    ),
    21: (
        "Xarel-lo levert van nature hoge zuurgraad en structuur, wat verklaart waarom veel "
        "kwaliteits-Cava ook zonder lange gistrijping al stevig en gastronomisch aanvoelt."
    ),
    22: (
        "Het commerciële succes van Prosecco komt direct uit de Charmatmethode: tankgisting "
        "is sneller en schaalbaarder dan flesgisting, waardoor volume kan groeien zonder dat "
        "elke fles individueel moet rijpen of degorgeren."
    ),
    23: (
        "Crémant gebruikt wettelijk dezelfde traditionele methode als Champagne, maar "
        "toegestane druivenrassen en regio's verschillen per appellatie — daardoor proef je "
        "per Crémantregio een eigen druivensignatuur in plaats van één uniforme stijl."
    ),
    24: (
        "Satèn heeft wettelijk een lagere flesdruk dan standaard Franciacorta, wat de "
        "mousse zachter en de textuur ronder maakt — een bewuste stijlkeuze, geen mindere "
        "kwaliteit."
    ),
    25: (
        "Engelse mousserende wijn deelt klimaat en kalkbodem met de Champagne, wat verklaart "
        "waarom internationale Champagnehuizen er zelf wijngaarden hebben aangekocht in "
        "plaats van het als concurrent af te schrijven."
    ),
    26: (
        "Zonder dosage is er geen suiker om productiefouten of scherp zuur te maskeren — "
        "Brut Nature vraagt daarom een perfecte basiswijn, wat verklaart waarom niet elk "
        "huis deze stijl voert."
    ),
    27: (
        "Extra Brut wordt vaak gekozen door huizen die hun basiswijn sterk genoeg vinden om "
        "met minimale dosage te presenteren — in de praktijk een impliciet kwaliteitsstatement "
        "van de producent."
    ),
    28: (
        "Brut werd de marktstandaard omdat de dosagebalans breed genoeg is om zowel als "
        "aperitief als bij een hoofdgerecht te functioneren — een compromis tussen droogte "
        "en toegankelijkheid, niet een toevallige norm."
    ),
    29: (
        "De naam Extra Dry is een historisch overblijfsel uit een tijd dat alle mousserende "
        "wijn zoeter was; vergeleken met die oude standaard was het destijds extra droog, "
        "terwijl het volgens de huidige dosageschaal juist zoeter is dan Brut."
    ),
    30: (
        "Demi-Sec was lang de dominante stijl omdat vroege dosagetechniek minder precies "
        "was — pas met betere controle over restsuiker kon de markt overstappen naar de "
        "drogere, gastronomischer geachte Brut-stijl."
    ),
    31: (
        "Te koud schenken onderdrukt niet alleen aroma maar ook de waargenomen zuurgraad — "
        "een wijn die bij 4 °C agressief zuur lijkt, kan bij 8-10 °C plots in balans ogen "
        "zonder dat er iets aan de wijn zelf is veranderd."
    ),
    32: (
        "Een breder wijnglas in plaats van een flute laat meer oppervlak voor "
        "aromaverdamping toe, wat secundaire brioche- en gistnoten beter laat openen — bij "
        "eenvoudige tankwijn werkt dat averechts omdat er simpelweg minder complexiteit is "
        "om te tonen."
    ),
    33: (
        "Een mousserende kurk verliest zijn schroefdraadvorm zodra hij de fles verlaat, wat "
        "onvoorspelbare baanafwijking geeft — daarom is de hand op de kurk tijdens het hele "
        "ontkurkingsproces een veiligheidsregel, geen service-detail."
    ),
    34: (
        "Niet elke mousserende wijn deelt hetzelfde drinkvenster: Prestige Cuvées kunnen "
        "decennia rijpen, terwijl jonge tankwijnen zoals basis-Prosecco binnen één à twee "
        "jaar hun primaire fruit en frisheid verliezen."
    ),
    35: (
        "Zout in oesters dempt de waargenomen zuurgraad van mousserende wijn — daardoor is "
        "precies een strakke, dosagearme stijl als Brut Nature de beste partner, en geen "
        "zoetere fles."
    ),
    36: (
        "Vet in kaas wordt fysiek doorgesneden door koolzuur en alcohol, terwijl zuur in "
        "mousserende wijn de romigheid balanceert — daarom werkt deze combinatie structureel "
        "beter dan kaas met stille witte wijn, die geen koolzuur heeft om te reinigen."
    ),
    37: (
        "Een mousserend menu werkt als één doorlopende drukcurve: mousse en zuurgraad bouwen "
        "op naar het hoofdgerecht en weer af richting dessert — wie dat ritme bewust plant, "
        "voorkomt paletvermoeidheid."
    ),
    38: (
        "Blind proeven elimineert vooroordeel over land van herkomst: een goed gerijpte "
        "traditionele Cava scoort vaak hoger op mousse-integratie dan een jonge "
        "non-vintage Champagne, simpelweg omdat gistcontacttijd zwaarder weegt dan reputatie."
    ),
    39: (
        "Lengte van de afdronk is vaak de snelste blindindicator voor methode: traditionele "
        "flesgisting met autolyse-integratie geeft doorgaans een afdronk van meer dan vijf "
        "seconden, terwijl tankwijn sneller wegvalt."
    ),
    40: (
        "Een examenvraag test zelden losse kennis, maar vraagt om drie stappen tegelijk: "
        "waarneming benoemen, methode of stijl herleiden, en daaruit een serviceadvies "
        "formuleren — wie die volgorde traint, scoort hoger dan wie alleen feiten stampt."
    ),
}

PRO_INSIGHT_OVERRIDES: dict[int, str] = {
    1: (
        "Lees het etiket in drie seconden — herkomst, methode en dosage — vóórdat je een "
        "aanbeveling doet; die volgorde voorkomt dat je een gast per ongeluk een tankwijn "
        "als 'Champagne-light' verkoopt en achteraf een prijsklacht krijgt. "
        "Verwachtingsmanagement begint hier: noem het woord 'mousserend' eerst, de regio "
        "pas daarna, zodat de gast op smaak kiest in plaats van op naam."
    ),
    2: (
        "Schenk één glas rustig en observeer 30 seconden de wand: een fijne, gelijkmatige "
        "perlage is een gratis kwaliteitsargument dat je zonder woorden kunt tonen aan een "
        "twijfelende gast. Gebruik dat moment bewust vóór je over prijs praat — wie eerst "
        "ziet dat een wijn werkt, accepteert de prijs daarna makkelijker."
    ),
    3: (
        "Vraag niet 'wilt u Champagne erbij', maar 'zoekt u iets dat de hele maaltijd "
        "meegaat of net het begin opent' — die vraag stuurt dosage, methode en prijsklasse "
        "zonder de gast in een regio te duwen. Mousserend is het enige wijntype dat je zo "
        "breed kunt positioneren; gebruik dat actief om couverts te verhogen in plaats van "
        "het tot aperitief te beperken."
    ),
    4: (
        "Gebruik geschiedenis nooit als opsomming van jaartallen, maar als één herkadering: "
        "'dit was ooit een productiefout, nu is het premium textuur.' Die framing werkt "
        "psychologisch sterker dan een prijsargument, omdat de gast het gevoel krijgt iets "
        "te begrijpen dat de meeste mensen niet weten — en dat rechtvaardigt vanzelf een "
        "hogere prijsacceptatie."
    ),
    5: (
        "Bouw je kaart in drie functionele slots — aperitief/feest, waarde+finesse, "
        "gastronomisch+rijp — in plaats van een landenlijst. Dat voorkomt dat een gast Cava "
        "afschrijft als goedkoop alternatief: je verkoopt een moment en een stijl, niet een "
        "nationaliteit, en dat verhoogt de gemiddelde besteding per fles."
    ),
    6: (
        "Vergelijk in interne training twee flessen op prijs in plaats van op land: een "
        "rijpe Cava traditionnelle wint blind regelmatig van een jonge non-vintage Champagne "
        "op mousse-integratie. Gebruik die ervaring om je team prijspsychologisch te "
        "wapenen, zodat ze met overtuiging verkopen in plaats van met excuses wanneer een "
        "gast naar iets goedkoper dan Champagne vraagt."
    ),
    7: (
        "Schenk Prosecco en andere tankwijnen iets koeler dan flesgegiste Champagne om "
        "grovere mousse te maskeren en het primaire fruit scherp te houden. Leg dat verschil "
        "uit aan de gast als bewuste stijlkeuze, niet als minderwaardigheid — dat voorkomt "
        "dat tankwijn wordt weggezet als goedkope bubbels en behoudt de marge op je huiswijn."
    ),
    8: (
        "Vraag bij 'traditioneel geproduceerd' op een etiket altijd door: op fles "
        "gedegorgeerd, of via transfer naar tank verplaatst? Dat ene detail bepaalt of de "
        "gast echte flesrijpingswaarde krijgt of vooral een marketingterm betaalt — als "
        "sommelier bescherm je zo zowel de gast als je eigen geloofwaardigheid bij een "
        "volgend advies."
    ),
    9: (
        "Draai de fles rustig en laat hem 30 seconden staan vóór schenken, zodat "
        "troebelheid niet onnodig in het glas terechtkomt en de gast schrikt van wat normaal "
        "is voor de stijl. Positioneer Pet-Nat vooraf als rauw en authentiek in plaats van "
        "als risico — die verwachtingsmanagement-zin voorkomt negatieve eerste indrukken en "
        "maakt de stijl makkelijker te verkopen aan een nieuwsgierige gast."
    ),
    10: (
        "Eén zin volstaat om de meest gemaakte verkoopfout te voorkomen: 'Extra Dry is "
        "zoeter dan Brut.' Gebruik dat moment meteen om door te vragen naar gewenste "
        "zoetheid in plaats van alleen het label te benoemen — zo voorkom je een retourfles "
        "én open je de deur naar een duurdere, beter passende aanbeveling."
    ),
    16: (
        "Verkoop Champagne niet als 'regio met 34.000 hectare' maar als 'koude-klimaat "
        "zuurmachine die nergens anders zo precies repliceerbaar is.' Die ene zin verbindt "
        "terroir direct aan smaak en geeft de gast een concreet argument om de hogere prijs "
        "te accepteren, in plaats van een geografisch feitje te onthouden."
    ),
    17: (
        "Vraag een producent niet 'welke druiven gebruikt u', maar 'wie bepaalt vandaag de "
        "blendarchitectuur voor uw gastronomische cuvée'. Dat geeft je bruikbare "
        "verkooptaal aan tafel: je kunt uitleggen waarom een fles meer body of meer finesse "
        "heeft, en dat verschil rechtvaardigt prijsverschillen tussen huizen beter dan een "
        "druivenlijstje."
    ),
    18: (
        "Zet Blanc de Blancs en Blanc de Noirs naast elkaar op de kaart met telkens één "
        "concrete gerechtsuggestie. Zo verkoop je een stijlkeuze in plaats van alleen het "
        "merk Champagne, en geef je de gast een laagdrempelige reden om de duurdere optie te "
        "proberen omdat het past bij het gerecht in plaats van omdat het duurder is."
    ),
    19: (
        "Leg in je voorraadbeheer vooraf vast welke non-vintage voor volume dient en welke "
        "vintage voor topmomenten gereserveerd blijft. Zonder die scheiding open je per "
        "ongeluk een schaarse fles op een gewone donderdagavond — een "
        "verwachtingsmanagement-fout die je marge en je verhaal richting belangrijke gasten "
        "ondermijnt."
    ),
    20: (
        "Verkoop een Prestige Cuvée nooit op naam alleen, maar op moment: 'deze fles is "
        "gemaakt voor één topgang, welke wordt dat bij u vanavond?' Die vraag verschuift het "
        "gesprek van prijsrechtvaardiging naar ervaringsplanning, wat de psychologische "
        "drempel voor een hoge besteding aanzienlijk verlaagt."
    ),
    24: (
        "Noem Satèn expliciet en met naam op de kaart in plaats van het te verstoppen onder "
        "'Italiaanse mousserend'. Frame het als 'de Italiaanse stijl die nooit bijt' — die "
        "ene zin opent een upsell naar gasten die Champagne als te streng ervaren, zonder "
        "dat je kwaliteit hoeft te bewijzen met jaartallen of methodedetails."
    ),
    25: (
        "Voeg één English Sparkling of Duitse Sekt b.A. toe aan een blindproeverij als "
        "bewuste verrassing — het doorbreekt Champagne-arrogantie in één ronde en maakt "
        "gasten ontvankelijker voor je volgende, minder voor de hand liggende aanbeveling. "
        "Gebruik dat psychologische momentum direct om een tweede, net zo onverwachte fles "
        "te verkopen."
    ),
    26: (
        "Zet Brut Nature nooit op de kaart zonder serveertip: iets minder ijskoud dan "
        "standaard, anders lijkt elke fles te zuur en verlies je de gast voordat de wijn een "
        "kans krijgt. Beheer die verwachting actief vooraf — 'dit is puur, niet streng' — in "
        "plaats van achteraf te moeten verdedigen waarom een gast het te scherp vond."
    ),
    27: (
        "Bij twijfel tussen Brut en Extra Brut op de kaart: noteer welke fles je koppelt aan "
        "je vis-hoofdgang. Dat voorkomt willekeurige upsell-gokjes en geeft je team een "
        "concreet, herhaalbaar verkoopargument in plaats van een vage 'dit is ook "
        "lekker'-aanbeveling."
    ),
    28: (
        "Train je team op één zin: 'Brut is niet zoet.' Die ene correctie in "
        "verwachtingsmanagement bespaart de meeste retourflessen op mousserend en voorkomt "
        "dat een onzekere gast standaard naar het goedkoopste glas wijst uit angst voor een "
        "te zoete verrassing."
    ),
    29: (
        "Schrijf letterlijk op je kaart: 'Extra Dry = zoeter dan Brut.' Die ene regel "
        "voorkomt het grootste deel van de dosage-verwarring aan tafel en geeft je de ruimte "
        "om door te vragen naar wat de gast echt zoekt, in plaats van een misverstand te "
        "moeten herstellen na de eerste slok."
    ),
    30: (
        "Eén Demi-Sec op de kaart voor bij kaas of dessert verhoogt de gemiddelde besteding "
        "vaak meer dan drie extra Brut-opties — gasten die toch al voor een dessertwijn "
        "zouden kiezen, blijven nu binnen je mousserend-segment. Positioneer hem expliciet "
        "als dessertfles, niet als alternatief voor Brut, anders concurreert hij met je "
        "eigen aanbod."
    ),
    31: (
        "Zet een thermometer in de kelder, niet in de marketing: één graad verschil "
        "verklaart een groot deel van de te-zuur-klachten aan tafel. Wanneer je dat "
        "structureel bewaakt, voorkom je dat een technisch correcte wijn onterecht als "
        "slecht wordt beoordeeld — en dat beschermt zowel de gasttevredenheid als je "
        "inkoopkeuzes."
    ),
    32: (
        "Schenk interne proeverijen altijd in een witwijnglas en bewaar de flute voor "
        "gastpresentatie als bewust beleid. Zo trainen je medewerkers hun neus op het echte "
        "aromaprofiel, terwijl de gast bij het schenken nog het feestelijke, verwachte beeld "
        "krijgt — twee doelen, twee glazen, geen compromis op smaak of beleving."
    ),
    33: (
        "Laat nieuwe medewerkers eerst op een lege fles oefenen met de muselet voordat ze "
        "ooit een gast bedienen. Spiermemorie voorkomt knallen onder druk tijdens een "
        "drukke service, en dat is zowel een veiligheidskwestie als een "
        "verwachtingsmanagement-kwestie — een gast die schrikt van een knal, onthoudt dat "
        "langer dan de smaak van de wijn."
    ),
    34: (
        "Label je voorraad zichtbaar met 'drink nu / 2-5 jaar / bewaar' in plaats van te "
        "vertrouwen op geheugen. Zonder dat systeem open je per ongeluk je beste investering "
        "te vroeg, en dat is een kostbare fout die je met een simpel etiket volledig kunt "
        "voorkomen."
    ),
    35: (
        "Serveer de oesters altijd vóór je de prijs van de Champagne noemt — smaak verkoopt "
        "overtuigender dan een argument. Wanneer de combinatie eerst in de mond bewijst hoe "
        "goed ze samenwerkt, daalt de prijsweerstand vanzelf en wordt de volgende fles "
        "makkelijker te adviseren."
    ),
    36: (
        "Bouw je kaaspairing op naar intensiteit, niet naar land van herkomst — één rij van "
        "droog naar zoet volstaat en is voor de gast direct te begrijpen. Die eenvoud "
        "verlaagt de keuzedrempel en leidt vaker tot een extra glas erbij, omdat de gast "
        "zelf kan zien waar hij in de rij zit."
    ),
    37: (
        "Pitch een volledig mousserend menu als 'één drukcurve door de avond' — dat klinkt "
        "technisch en premium, en rechtvaardigt meteen een hogere prijs per gang dan losse "
        "glazen wijn. Gebruik die framing actief bij gasten die twijfelen tussen een "
        "wijnarrangement en losse glazen: het verhaal verkoopt het concept, niet alleen de "
        "flessen."
    ),
    38: (
        "Noteer na elke blindronde altijd je 'bijna-raak'-fout in één zin, zoals 'te veel op "
        "land vertrouwd, te weinig op mousse-integratie geproefd'. Diezelfde discipline kun "
        "je aan tafel gebruiken: wanneer een gast twijfelt tussen prijsklassen, leid het "
        "gesprek naar smaakbewijs in plaats van reputatie, en verkoop zo met meer "
        "overtuiging dan met merknaam."
    ),
    39: (
        "Twijfel je blind tussen tankmethode en traditionele methode, kies dan traditioneel "
        "bij een afdronk langer dan vijf seconden — die vuistregel klopt vaker dan niet. "
        "Gebruik dezelfde logica aan tafel: leg een gast uit dat lengte in de afdronk een "
        "eerlijker kwaliteitssignaal is dan de naam op het etiket, en je advies wordt meteen "
        "geloofwaardiger."
    ),
    40: (
        "Lees examenvragen als servicecases: wat zou je vrijdagavond om 20:00 uur schenken "
        "bij deze gast en dit gerecht? Diezelfde denkstap — waarneming, methode, advies — is "
        "precies wat een gast aan tafel van je verwacht, en wie dat onder examendruk kan, "
        "kan het zeker tijdens een drukke service."
    ),
}
