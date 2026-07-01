"""Rosé Wine Track V2 Gold Master — lessons 1-10 (Modules 1-2: Fundament & Productie).

Specialistische verdieping voor rosé. Herhaalt niet het algemene wijnfundament
(wat is gisting, wat is schilcontact in basistermen, wat zuur doet, wat proeven
inhoudt — dat zit al in de Wine Foundation Track) maar focust telkens op de
rosé-identiteit: rosé als volwaardige, autonome categorie met een eigen DNA —
extractieprecisie, kleur als eerste stijlindicator, textuur als
onderschatte factor, aromatische finesse, temperatuurgevoeligheid en
gastronomische breedte — nooit als 'lichte rode wijn' of 'witte wijn met een
kleurtje'.
"""

from __future__ import annotations


REPAIRS: dict[int, dict] = {
    1: {
        "theorie": (
            "Rosé is geen tussenvorm die toevallig ontstaat wanneer rode wijn 'niet af is' of "
            "witte wijn 'een kleurtje meekrijgt' — het is, op Champagne na waar assemblage van "
            "rode en witte wijn wél is toegestaan, een categorie die vrijwel overal wettelijk "
            "wordt gemaakt door één bewuste beslissing: hoelang en hoe intensief sap van blauwe "
            "druiven in contact staat met de schil, ergens tussen de nul-contactfilosofie van wit "
            "en de wekenlange maceratie van rood in. Die positionering tussen twee uitersten "
            "maakt rosé niet tot een compromis, maar tot een derde, zelfstandige as met eigen "
            "wetmatigheden.\n\n"
            "Het DNA van serieuze rosé bestaat uit een cluster van factoren die je stuk voor stuk "
            "moet leren herkennen: extractieprecisie — het vermogen om binnen een venster van "
            "minuten tot enkele uren exact het beoogde kleur- en aromaprofiel te raken, in plaats "
            "van weken de tijd te hebben zoals bij rood; kleur als eerste stijlindicator, niet als "
            "kwaliteitsmaat; textuur als onderschatte factor, want het verschil tussen een dunne, "
            "wateraflatende rosé en een rosé met werkelijke mondvulling zit zelden in het "
            "kleurniveau maar in extractiekeuzes en gistbegeleiding; aromatische finesse, de "
            "smalle balans tussen zuiver primair fruit en te groene, onrijpe tonen; en "
            "temperatuurgevoeligheid, waarbij het aromatische profiel van rosé sneller instort of "
            "juist opengaat bij de verkeerde temperatuur dan bij de meeste rode of volle witte "
            "wijn.\n\n"
            "Waar rood vaak vertrekt vanuit een open, evoluerend extractietraject — proeven, "
            "bijsturen, soms verlengen — vertrekt serieuze roséproductie vanuit een vooraf "
            "vastgelegd doelprofiel: de producent bepaalt vaak al vóór de oogst welke kleurdiepte, "
            "welk aromaprofiel en welke structuur het eindresultaat moet hebben, en de gehele "
            "vinificatie wordt daarnaar teruggerekend. Dat maakt roséproductie in veel opzichten "
            "precisiewerk met een kleinere foutmarge dan rode wijn, waar een paar uur extra "
            "maceratie zelden het eindresultaat drastisch verandert.\n\n"
            "Je gebruikt dit onderscheid elke keer wanneer je een onbekende rosé beoordeelt: "
            "vraag niet 'is dit een lichte rode wijn of een getinte witte wijn', maar 'welk "
            "doelprofiel heeft de producent hier precies geraakt, en hoe precies is dat gedaan'. "
            "Een bleke rosé is daarbij niet automatisch beter gemaakt dan een dieper gekleurde — "
            "kleurdiepte is een stijlkeuze, geen kwaliteitshiërarchie, en wie dat verwart mist het "
            "hele punt van deze categorie."
        ),
        "samenvatting": (
            "- Rosé ontstaat door een bewuste keuze in contactduur tussen sap en schil, tussen "
            "de uitersten van wit en rood in\n"
            "- Het DNA van rosé bestaat uit extractieprecisie, kleur als stijlindicator, textuur, "
            "aromatische finesse en temperatuurgevoeligheid\n"
            "- Serieuze roséproductie vertrekt vanuit een vooraf vastgelegd doelprofiel, niet "
            "vanuit open, evoluerende extractie zoals bij rood\n"
            "- Kleurdiepte is een stijlkeuze, geen kwaliteitsmaat — een bleke rosé is niet per "
            "definitie beter gemaakt\n"
            "- Rosé beoordeel je op precisie ten opzichte van een doelprofiel, niet als afgeleide "
            "van rood of wit"
        ),
        "pro_insight": (
            "Wanneer een gast zegt 'rosé is toch gewoon lichte rode wijn', corrigeer dat vriendelijk "
            "maar inhoudelijk: leg uit dat de producent vooraf een specifiek doelprofiel bepaalt en "
            "daar met precisiewerk naartoe vinifieert — dat verandert meteen hoe serieus die gast "
            "naar het glas in zijn hand kijkt."
        ),
        "reflectievraag": (
            "Zou jij bij een onbekende rosé kunnen benoemen welk doelprofiel de producent "
            "waarschijnlijk voor ogen had, in plaats van de wijn simpelweg te vergelijken met een "
            "lichte rode of getinte witte wijn?"
        ),
        "kernbegrippen": [
            "extractieprecisie",
            "kleur-als-stijlindicator",
            "structuurhiërarchie",
            "temperatuurgevoeligheid",
            "categorie-autonomie",
        ],
    },
    2: {
        "theorie": (
            "Rosé ontstaat in de praktijk via een beperkt aantal productiepaden, en het "
            "onderscheid tussen die paden is precies waarom twee rosés met vergelijkbare kleur "
            "structureel volledig kunnen verschillen. Directe pers laat de schil vrijwel geen tijd "
            "— druiven worden gekneusd en direct geperst, waarbij alleen het kortstondige contact "
            "tijdens het kneuzen en persen zelf kleur en aroma aflevert. Saignée laat sap juist "
            "wél een gecontroleerde periode, doorgaans enkele uren, op de schil van een rode-wijn-"
            "aanzet staan vóór het wordt afgetapt. Beide paden bestaan náást elkaar, met een eigen "
            "extractielogica en een eigen stijlsignatuur.\n\n"
            "Cruciaal is dat de gekozen schilcontactduur geen toevalligheid is maar een bewuste "
            "intentie die de rest van de vinificatie stuurt: hoe korter en preciezer het contact, "
            "hoe meer de producent stuurt richting een bleke, aromatisch zuivere stijl; hoe langer "
            "en intensiever het contact, hoe meer richting een dieper gekleurde, structuurrijkere "
            "stijl met meer tanninegewicht. Die intentionaliteit — wat wil ik bereiken, en welke "
            "contactduur past daarbij — is het eerste beslissingspunt van elke rosé, nog vóór er "
            "over gisttemperatuur of vatgebruik wordt nagedacht.\n\n"
            "Een derde, wettelijk veel beperktere route is assemblage: het mengen van afzonderlijk "
            "gevinifieerde rode en witte wijn. Binnen de Europese Unie is dit voor stille wijn "
            "vrijwel overal verboden — met Champagne als bekende uitzondering, waar assemblage "
            "juist een geaccepteerde, gecontroleerde techniek is voor mousserende rosé. Dat "
            "verschil in regelgeving is geen curiositeit maar een aanwijzing dat directe pers en "
            "saignée bij stille rosé als de enige legitieme, precisiegedreven wegen worden "
            "beschouwd, terwijl assemblage als een aparte, apart gereguleerde categorie geldt.\n\n"
            "Je gebruikt dit als eerste diagnosevraag bij elke nieuwe rosé: welk kleuropbouw-"
            "mechanisme ligt hieraan ten grondslag — kort en precies, of langer en intensiever — "
            "en past de kleur die je in het glas ziet bij die vermoedelijke aanpak? Wijkt de "
            "structuur af van wat de kleur suggereert, dan is dat een signaal om dieper naar de "
            "productiemethode te vragen in plaats van op kleur alleen te varen."
        ),
        "samenvatting": (
            "- Directe pers en saignée zijn de twee dominante productiepaden voor stille rosé, "
            "elk met een eigen extractielogica\n"
            "- De gekozen schilcontactduur is een bewuste intentie die de rest van de "
            "vinificatie stuurt\n"
            "- Kortere, precieze contactduur stuurt richting bleker en aromatisch zuiverder; "
            "langere richting dieper en structuurrijker\n"
            "- Assemblage van rode en witte wijn is voor stille wijn binnen de EU vrijwel overal "
            "verboden, behalve voor Champagne\n"
            "- Kleuropbouwmechanisme is de eerste diagnosevraag bij het beoordelen van een "
            "onbekende rosé"
        ),
        "pro_insight": (
            "Leg aan gasten die verrast zijn dat 'rode en witte wijn mengen' bij stille rosé niet "
            "mag uit dat dit net het bewijs is dat serieuze rosé via precieze schilcontactkeuzes "
            "wordt gemaakt, niet via een simpele kleurtruc — dat verhaal verhoogt meteen de "
            "perceptie van vakmanschap."
        ),
        "reflectievraag": (
            "Zou jij bij een onbekende rosé, alleen op basis van kleur en structuur in het glas, "
            "durven inschatten of directe pers of saignée aan de basis lag?"
        ),
        "kernbegrippen": [
            "schilcontactduur",
            "extractie-intentionaliteit",
            "kleuropbouwmechanisme",
            "assemblageverbod",
            "productiemethodiek",
        ],
    },
    3: {
        "theorie": (
            "Rosé is uniek omdat het, in tegenstelling tot wat de naam en de vaak lage prijsklasse "
            "doen vermoeden, op geen enkele as simpelweg 'minder' is dan rood of wit — het is een "
            "categorie met een eigen specialisatie die geen van beide andere categorieën evenaart. "
            "Waar rood zijn identiteit ontleent aan tannine als structuuras en wit aan zuur als "
            "ruggengraat, ontleent rosé de zijne aan een combinatie die nergens anders zo "
            "geconcentreerd voorkomt: aromatische finesse gecombineerd met een textuur die, mits "
            "goed gemaakt, spanning geeft zonder de gewichtigheid van rood.\n\n"
            "Die aromatische finesse is een smal pad: te weinig extractie geeft een leeg, "
            "eendimensionaal profiel; te veel of te grof extraheren duwt de wijn richting groene, "
            "vegetale of juist te tanninerijke tonen die de aromatische zuiverheid breken. Rosé "
            "opereert daarmee voortdurend op de rand tussen te weinig en te veel, een precisie-eis "
            "die rood — met zijn veel bredere extractievenster van dagen tot weken — zelden op "
            "dezelfde schaal kent.\n\n"
            "Diezelfde precisie maakt rosé buitengewoon gevoelig voor temperatuur: serveer je hem "
            "te koud, dan sluit het aromaprofiel volledig af en proef je enkel zuur en alcohol; "
            "serveer je hem te warm, dan valt de textuurspanning weg en oogt de wijn plots log en "
            "ongestructureerd. Die smalle temperatuurband is scherper dan bij de meeste rode wijn "
            "en vergelijkbaar kritisch als bij de meest verfijnde witte stijlen — een kenmerk dat "
            "rosé's eigen categorie-identiteit onderstreept in plaats van hem dichter bij één van "
            "de twee andere categorieën te plaatsen.\n\n"
            "Tot slot is rosé's gastronomische breedte ongeëvenaard: dezelfde fles kan, mits juist "
            "gekozen qua structuur en intensiteit, naast een lichte vissalade én naast een stevig "
            "gekruid gerecht functioneren — een flexibiliteit die noch een tanninerijke rode wijn "
            "noch een zeer scherp-zure witte wijn in dezelfde mate biedt. Je gebruikt dit inzicht "
            "wanneer je een gast overtuigt van rosé bij een menu met wisselende gangen: niet als "
            "compromis tussen rood en wit, maar als een categorie die op eigen kracht een breder "
            "gastronomisch bereik dekt."
        ),
        "samenvatting": (
            "- Rosé's identiteit combineert aromatische finesse met textuurspanning, een "
            "combinatie die geen andere categorie op dezelfde schaal biedt\n"
            "- Aromatische finesse balanceert op een smal pad tussen te weinig en te veel "
            "extractie\n"
            "- Rosé is extreem temperatuurgevoelig: te koud sluit het aroma af, te warm laat de "
            "textuurspanning wegvallen\n"
            "- Die smalle temperatuurband is scherper dan bij rood en vergelijkbaar kritisch als "
            "bij verfijnde witte stijlen\n"
            "- Rosé's gastronomische flexibiliteit overtreft die van tanninerijke rode en "
            "scherp-zure witte wijn"
        ),
        "pro_insight": (
            "Presenteer rosé bij een wisselend menu nooit als 'veilige middenweg' maar als "
            "bewuste keuze voor gastronomische flexibiliteit — die framing verhoogt de "
            "gepercipieerde waarde en voorkomt dat gasten rosé als compromis in plaats van "
            "specialisatie zien."
        ),
        "reflectievraag": (
            "Kun jij een gerecht bedenken waarbij jij normaal automatisch naar rood of wit grijpt, "
            "maar waarbij de gastronomische breedte van rosé eigenlijk een betere match zou "
            "opleveren?"
        ),
        "kernbegrippen": [
            "aromatische finesse",
            "texturele onderscheiding",
            "gastronomische flexibiliteit",
            "temperatuurkritiekpunt",
            "structuurbescheidenheid",
        ],
    },
    4: {
        "theorie": (
            "De geschiedenis van rosé wordt vaak verkeerd verteld als een eenentwintigste-eeuwse "
            "marketinguitvinding, terwijl kort schilcontact juist tot de oudste vormen van "
            "wijnbereiding behoort. Voordat gecontroleerde, langdurige maceratietechnieken voor "
            "rode wijn zich ontwikkelden, leverden veel antieke persmethoden — waarbij sap en "
            "schil elkaar noodgedwongen slechts kort raakten — van nature een bleke tot medium "
            "gekleurde wijn op. In die zin is rosé niet de jongste categorie van de drie, maar "
            "eerder een directe erfgenaam van vroege, minimaal-gecontroleerde wijnbereiding.\n\n"
            "De Provence bouwde vanaf de twintigste eeuw de reputatie op die vandaag met rosé "
            "wordt geassocieerd: een bleke, droge, aromatisch zuivere stijl die zich via strenge "
            "productieprotocollen — vroege oogst, korte en precieze schilcontactvensters, "
            "reductieve vinificatie ter bescherming van de aromatiek — onderscheidde van de "
            "zoetere, minder precieze rosé die elders lange tijd de norm was. Die "
            "provençaalse stijlcodering werd zo dominant dat 'rosé' voor veel consumenten "
            "wereldwijd feitelijk 'Provence-stijl' betekent, ook al bestaan er evenveel andere, "
            "even legitieme stijltradities.\n\n"
            "Vanaf de jaren 2000 en versneld na de opkomst van commercieel succesvolle Provence-"
            "cuvées veranderde het imago van rosé fundamenteel: van een goedkope, weinig serieuze "
            "'poolside wine' naar een categorie waarin ook terroir-gedreven, bewaarbare en "
            "prijzig gepositioneerde flessen hun plaats opeisten. Die imago-evolutie liep parallel "
            "aan een technische evolutie — striktere temperatuurcontrole, betere perstechniek, "
            "meer aandacht voor lees-contact — die de kwaliteitsbovenkant van de categorie "
            "structureel optilde.\n\n"
            "Je gebruikt deze geschiedenis om het vooroordeel 'rosé is geen serieuze wijn' direct "
            "te ontkrachten: leg uit dat kort schilcontact tot de oudste wijnbereidingstechnieken "
            "behoort, dat de provençaalse stijlcodering een bewust opgebouwde precisiestandaard "
            "is, en dat het huidige imago van premium rosé het resultaat is van decennia "
            "technische verfijning — niet van een marketingtruc zonder inhoud."
        ),
        "samenvatting": (
            "- Kort schilcontact behoort tot de oudste vormen van wijnbereiding, niet tot een "
            "recente uitvinding\n"
            "- De Provence bouwde vanaf de twintigste eeuw een bleke, droge, precisiegedreven "
            "stijlcodering op\n"
            "- Die provençaalse stijlcodering werd zo dominant dat ze wereldwijd als synoniem "
            "voor 'rosé' geldt\n"
            "- Sinds de jaren 2000 verschoof het imago van goedkope 'poolside wine' naar "
            "terroir-gedreven, bewaarbare rosé\n"
            "- De kwaliteitsevolutie liep parallel aan technische vooruitgang in "
            "temperatuurcontrole en perstechniek"
        ),
        "pro_insight": (
            "Ontkracht het vooroordeel 'rosé is geen serieuze wijn' met de geschiedenis zelf: "
            "leg uit dat kort schilcontact ouder is dan langdurige rode-wijnmaceratie — dat "
            "argument landt vaak beter dan een verwijzing naar prijs of imago alleen."
        ),
        "reflectievraag": (
            "Zou jij een gast die rosé afdoet als 'goedkope zomerwijn' kunnen overtuigen met de "
            "historische en technische ontwikkeling van de categorie, zonder terug te vallen op "
            "prijs als argument?"
        ),
        "kernbegrippen": [
            "imago-evolutie",
            "provençaalse stijlcodering",
            "terroirexpressie",
            "bewaarpotentieel",
            "historische extractietraditie",
        ],
    },
    5: {
        "theorie": (
            "Het stijlspectrum van rosé is breder dan bij vrijwel elke andere wijncategorie, en "
            "die breedte volgt direct uit de vrijheidsgraad die extractieprecisie toelaat: elke "
            "kleurdiepte tussen bijna-wit en bijna-rood is technisch haalbaar, en producenten over "
            "de hele wereld hebben binnen dat spectrum eigen regionale ankerpunten gevestigd. De "
            "provençaalse stijl bezet het bleke, aromatisch zuivere uiteinde, met nadruk op "
            "frisheid als ruggengraat en een minimale, bijna onzichtbare structuur.\n\n"
            "Aan de andere kant van het spectrum staan tanninedragende stijlen zoals Tavel in de "
            "Rhône en Bandol in de Provence zelf, waar langere schilcontacttijd en het gebruik van "
            "structuurrijke rassen zoals Mourvèdre resulteren in rosé met merkbare tannine, meer "
            "kleurdiepte en aanzienlijk bewaarpotentieel — stijlen die qua mondgevoel dichter bij "
            "een lichte rode wijn liggen zonder daarmee hun rosé-identiteit te verliezen. Italiaanse "
            "Cerasuolo d'Abruzzo en Spaanse rosados nemen vaak een middenpositie in, met meer "
            "kleurdiepte en fruitgewicht dan Provence maar minder tanninegewicht dan Tavel of "
            "Bandol.\n\n"
            "Naast stille rosé bestaat een volledig eigen tak binnen mousserende wijn: rosé "
            "Champagne en andere mousserende roséstijlen, waar kleur ontstaat via ofwel korte "
            "maceratie ofwel — uniek voor deze categorie — assemblage van rode en witte "
            "basiswijnen. Deze mousserende roséproductie voegt een derde structuurlaag toe (koolzuur "
            "en de bijbehorende druk- en textuursensatie) die bij stille rosé volledig ontbreekt, "
            "en daarmee een eigen beoordelingskader vereist.\n\n"
            "Je gebruikt dit spectrum als kader om kleurdiepte, structuur en herkomst samen te "
            "lezen in plaats van los van elkaar: zie je een dieper gekleurde, tannine-voelbare "
            "rosé, dan is Tavel, Bandol of een vergelijkbare stijl waarschijnlijker dan Provence; "
            "die combinatie van signalen werkt als betrouwbare blindproefmarker, veel sterker dan "
            "kleur alleen."
        ),
        "samenvatting": (
            "- Het stijlspectrum van rosé loopt van bijna-wit tot bijna-rood, breder dan bij de "
            "meeste andere categorieën\n"
            "- Provence bezet het bleke, aromatisch zuivere uiteinde met minimale structuur\n"
            "- Tavel en Bandol vertegenwoordigen tanninedragende stijlen met meer kleurdiepte en "
            "bewaarpotentieel\n"
            "- Cerasuolo d'Abruzzo en Spaanse rosados nemen vaak een middenpositie in binnen dat "
            "spectrum\n"
            "- Mousserende roséproductie voegt via koolzuur een eigen structuurlaag toe die bij "
            "stille rosé ontbreekt"
        ),
        "pro_insight": (
            "Gebruik het stijlspectrum actief in je advies: vraagt een gast om 'iets anders dan "
            "Provence', stuur dan gericht richting Tavel of Bandol in plaats van simpelweg een "
            "andere bleke rosé aan te bieden — dat toont dat je het spectrum begrijpt in plaats "
            "van alleen het etiket 'rosé' te kennen."
        ),
        "reflectievraag": (
            "Zou jij bij een blind geproefde, dieper gekleurde en merkbaar tannine-voelbare rosé "
            "durven inschatten dat dit eerder een Tavel of Bandol is dan een Provence-stijl, en "
            "welk kenmerk gebruik je daarvoor als eerste?"
        ),
        "kernbegrippen": [
            "kleurspectrum",
            "tanninedragende stijlen",
            "stijlspreiding",
            "mousserende roséproductie",
            "blindproefmarker",
        ],
    },
    6: {
        "theorie": (
            "Directe pers is de meest precisiegedreven productiemethode binnen rosé, precies "
            "omdat er geen aparte weekfase bestaat om fouten te corrigeren: de druiven worden "
            "gekneusd en vrijwel onmiddellijk geperst, waardoor kleur en aroma uitsluitend "
            "ontstaan tijdens het kortstondige contact dat het kneuzen en persen zelf oplevert. "
            "Elke beslissing — perssnelheid, persdruk, temperatuur van de druiven bij aankomst — "
            "telt hier zwaarder door dan bij enige andere roséproductiemethode.\n\n"
            "Perscyclusprecisie is daarbij de kern van het vak: een pneumatische pers die te snel "
            "of te hard perst, extraheert meer kleur en tannine dan bedoeld en duwt de stijl "
            "ongewild richting een dieper, minder verfijnd profiel; een te zachte, te trage cyclus "
            "levert juist onvoldoende kleur en textuur op. Producenten die op het bleke, "
            "aromatisch zuivere uiteinde van het spectrum mikken, werken daarom vaak met lage "
            "persdruk, korte cycli en een strikt temperatuurvenster net boven het vriespunt van "
            "het sap, om zowel oxidatie als ongewenste extra extractie te voorkomen.\n\n"
            "Net als bij witte wijn ontstaan bij het persen meerdere fracties, en de "
            "drupvrijloopfractie — het sap dat vrijloopt vóór er daadwerkelijk druk wordt "
            "toegepast — geldt bij directe-persrosé als de meest gewilde: het is het bleekste, "
            "aromatisch zuiverste deel, met het minste tannine en de fijnste textuur. Latere, "
            "onder hogere druk geperste fracties krijgen meer kleur en structuur mee maar ook meer "
            "risico op grovere tannine en bittere randjes, wat verklaart waarom veel topcuvées "
            "vrijwel uitsluitend uit de vrijloopfractie worden samengesteld.\n\n"
            "Je gebruikt deze kennis om de precisie achter een bleke, directe-persrosé te "
            "herkennen: proef je een wijn met opvallend zuivere, ongebroken aromatiek en een "
            "gladde, spanningsrijke textuur zonder enige tanninehardheid, dan wijst dat op een "
            "strak beheerste perscyclus met een hoog aandeel vrijloopsap — precisiewerk dat je "
            "makkelijk over het hoofd ziet als je alleen naar de lichte kleur kijkt."
        ),
        "samenvatting": (
            "- Directe pers kent geen aparte weekfase; kleur en aroma ontstaan uitsluitend "
            "tijdens het kneuzen en persen zelf\n"
            "- Perscyclusprecisie (druk, snelheid, temperatuur) bepaalt sterker dan bij elke "
            "andere methode het eindresultaat\n"
            "- Een strikt temperatuurvenster net boven het vriespunt voorkomt oxidatie en "
            "ongewenste extra extractie\n"
            "- De drupvrijloopfractie levert het bleekste, aromatisch zuiverste sap met het "
            "minste tannine\n"
            "- Topcuvées worden vaak vrijwel uitsluitend uit de vrijloopfractie samengesteld"
        ),
        "pro_insight": (
            "Leg aan gasten die vragen waarom een bleke rosé duurder kan zijn dan een dieper "
            "gekleurde uit dat dit vaak samenhangt met een strikt beheerste perscyclus en een "
            "hoog aandeel dure vrijloopfractie, niet met minder werk aan de wijn."
        ),
        "reflectievraag": (
            "Zou jij bij een bleke, aromatisch zuivere directe-persrosé kunnen benoemen welke "
            "perskeuzes waarschijnlijk zijn gemaakt om die zuiverheid te bereiken?"
        ),
        "kernbegrippen": [
            "direct-press-precisie",
            "perscyclusprecisie",
            "drupvrijloopfractie",
            "temperatuurvenster",
            "oxidatiepreventie",
        ],
    },
    7: {
        "theorie": (
            "Saignée-extractie werkt volgens een andere logica dan directe pers: hier krijgt sap "
            "wél een gecontroleerde periode — doorgaans enkele uren tot een korte nacht — contact "
            "met de schil van een most die eigenlijk bedoeld is voor rode wijn, vóórdat een deel "
            "ervan wordt afgetapt. Dat aftappen dient historisch een dubbel doel: het concentreert "
            "de achterblijvende rode most, doordat een groter aandeel schil overblijft ten "
            "opzichte van het resterende volume sap, en levert tegelijk een apart product op — de "
            "afgetapte rosé.\n\n"
            "Dat dubbeldoelvinificatie-uitgangspunt verklaart waarom saignée bij sommige critici "
            "een minder gunstig imago heeft: wanneer de rosé louter een bijproduct is van de "
            "wens om de rode wijn te concentreren, krijgt de rosé zelf weinig gerichte aandacht en "
            "kan het resultaat onevenwichtig of te grof geëxtraheerd uitpakken. Bij intentionele "
            "saignée ligt dat compleet anders: de producent plant vooraf een specifiek volume voor "
            "roséproductie in, bepaalt bewust het gewenste extractiemoment en behandelt de "
            "afgetapte most vervolgens met dezelfde precisie als een directe-persrosé.\n\n"
            "De extractie-intensiteit bij saignée ligt door het langere schilcontact doorgaans "
            "hoger dan bij directe pers, wat resulteert in meer kleurdiepteopbouw, meer "
            "tanninegewicht en vaak een rijker, meer body-gedreven fruitprofiel. Dat maakt saignée "
            "bij uitstek geschikt voor de structuurrijkere stijlen binnen het roséspectrum — "
            "denk aan sommige Tavel- en Amerikaanse rosé-stijlen — terwijl het minder past bij het "
            "bleke, aromatisch zuivere Provence-uiteinde.\n\n"
            "Je gebruikt dit onderscheid om verantwoord door te vragen bij een saignée-rosé: is "
            "dit een bewust ingepland, intentioneel volume, of een bijproduct van "
            "roodwijnconcentratie? Proef je een saignée-rosé met opvallend veel kleurdiepte en "
            "tanninegewicht maar weinig aromatische finesse, dan wijst dat eerder op het "
            "bijproductmodel; proef je een evenwichtig, doelbewust profiel, dan is intentionele "
            "saignée waarschijnlijker."
        ),
        "samenvatting": (
            "- Saignée laat sap enkele uren op de schil van een rode-wijn-aanzet staan vóór het "
            "wordt afgetapt\n"
            "- Het aftappen dient een dubbel doel: concentratie van de achterblijvende rode most "
            "en productie van rosé\n"
            "- Bijproduct-saignée krijgt weinig gerichte aandacht, intentionele saignée wordt "
            "even precies behandeld als directe pers\n"
            "- Saignée geeft door het langere schilcontact meer kleurdiepte en tanninegewicht "
            "dan directe pers\n"
            "- Extractie-intensiteit en aandacht voor het proces onderscheiden bijproduct- van "
            "intentionele saignée"
        ),
        "pro_insight": (
            "Vraag bij een saignée-rosé altijd door of het een intentioneel geproduceerd volume "
            "betreft of een bijproduct van roodwijnconcentratie — dat verhaal helpt je uitleggen "
            "waarom twee saignée-rosés in kwaliteit sterk uiteen kunnen lopen."
        ),
        "reflectievraag": (
            "Zou jij bij een saignée-rosé, op basis van kleurdiepte, tanninegewicht en "
            "aromatische finesse, durven inschatten of het om een intentioneel of een "
            "bijproductvolume gaat?"
        ),
        "kernbegrippen": [
            "saignée-extractie",
            "bijproduct-versus-intentioneel",
            "extractie-intensiteit",
            "dubbeldoelvinificatie",
            "kleurdiepteopbouw",
        ],
    },
    8: {
        "theorie": (
            "Kleurcontrole is bij rosé geen esthetische bijzaak maar een technisch vak op zich, "
            "omdat de markt kleur historisch heeft leren lezen als kwaliteitssignaal terwijl die "
            "koppeling technisch onjuist is. Kleurintensiteit wordt in de praktijk gemeten via "
            "instrumenten die de optische dichtheid van het sap of de wijn vastleggen, waarmee "
            "producenten objectief kunnen sturen naar een specifiek doelprofiel in plaats van op "
            "het oog te werken — essentieel wanneer je jaar na jaar dezelfde stijl wilt "
            "reproduceren.\n\n"
            "De afgelopen decennia ontstond wat je marketinggedreven paleur kunt noemen: de "
            "aanname, vooral gevoed door het commerciële succes van zeer bleke Provence-stijlen, "
            "dat blekere rosé automatisch beter of verfijnder is. Die aanname klopt technisch "
            "niet — kleurdiepte zegt op zichzelf niets over extractieprecisie, aromatische "
            "zuiverheid of textuurkwaliteit. Een matig gemaakte, te bleek getrokken rosé kan "
            "evenveel technische gebreken vertonen als een matig gemaakte, dieper gekleurde "
            "rosé; de kleur verhult het probleem simpelweg beter voor het blote oog.\n\n"
            "Beschermende vinificatie speelt een aparte, wel degelijk kwaliteitsrelevante rol: "
            "inert gas gebruiken tijdens persen en transport, lage temperaturen aanhouden en "
            "zuurstofcontact minimaliseren voorkomt voortijdige bruinverkleuring en behoudt de "
            "beoogde kleurtint langer stabiel. Dat is een kwaliteitsfactor, maar een andere dan "
            "kleurdiepte zelf — het gaat om kleurstabiliteit en -zuiverheid, niet om hoe bleek of "
            "diep de kleur is.\n\n"
            "Je gebruikt deze kleur-kwaliteitloskoppeling actief in je advies: leer gasten dat "
            "kleurdiepte een stijlsignaal is, geen kwaliteitsmeter, en dat de werkelijke "
            "kwaliteitsindicatoren — aromatische zuiverheid, textuurspanning, afdronklengte — "
            "onafhankelijk van kleurdiepte beoordeeld moeten worden. Dat voorkomt dat een gast een "
            "technisch uitstekende, iets dieper gekleurde rosé afwijst puur op basis van tint."
        ),
        "samenvatting": (
            "- Kleurintensiteit wordt objectief gemeten en gestuurd om een reproduceerbaar "
            "doelprofiel te bereiken\n"
            "- Marketinggedreven paleur creëerde de onterechte aanname dat blekere rosé "
            "automatisch beter is\n"
            "- Kleurdiepte zegt op zichzelf niets over extractieprecisie, aromatische zuiverheid "
            "of textuurkwaliteit\n"
            "- Beschermende vinificatie behoudt kleurstabiliteit en -zuiverheid, wat losstaat van "
            "kleurdiepte zelf\n"
            "- Echte kwaliteitsindicatoren zijn aromatische zuiverheid, textuurspanning en "
            "afdronklengte, niet kleurtint"
        ),
        "pro_insight": (
            "Corrigeer gasten die een rosé afwijzen 'omdat hij te donker is' met de "
            "kleur-kwaliteitloskoppeling: leg uit dat kleurdiepte een stijlkeuze is en stuur hun "
            "aandacht naar aromatische zuiverheid en textuur als de echte kwaliteitsmaatstaven."
        ),
        "reflectievraag": (
            "Zou jij bij een gast die uitsluitend op kleur selecteert, kunnen uitleggen welke drie "
            "kenmerken eigenlijk bepalender zijn voor kwaliteit dan kleurdiepte?"
        ),
        "kernbegrippen": [
            "kleurintensiteit",
            "kleurmeting",
            "marketinggedreven paleur",
            "beschermende vinificatie",
            "kleur-kwaliteitloskoppeling",
        ],
    },
    9: {
        "theorie": (
            "Fermentatie van rosé volgt een logica die dichter bij witte wijn ligt dan bij rood, "
            "maar met een eigen precisie-eis die uit de fragiliteit van het aromaprofiel "
            "voortkomt. Reductieve vinificatie — gisten met zo min mogelijk zuurstofcontact, vaak "
            "in inox onder inert gas — is bij het merendeel van de moderne, aromatisch gedreven "
            "roséstijlen de standaard, precies omdat rosé's aromatische finesse sneller aangetast "
            "raakt door oxidatie dan het robuustere aromaprofiel van veel rode wijn.\n\n"
            "Temperatuurgestuurde gisting is daarbij onmisbaar: lage gisttemperaturen, vaak tussen "
            "veertien en achttien graden, vertragen het gistproces bewust om vluchtige, primaire "
            "aromastoffen te behouden die bij hogere temperatuur zouden verdampen of zich zouden "
            "omzetten in minder gewenste verbindingen. Die temperatuurcontrole vraagt om "
            "gekoelde tanks en nauwkeurige monitoring, een investering die direct samenhangt met "
            "de aromatische precisie die de stijl vereist.\n\n"
            "Gistkeuze-aromabehoud speelt een tweede, vaak onderschatte rol: bepaalde "
            "gistrassen zijn geselecteerd om specifieke aromaprecursoren — voorlopers van "
            "aromastoffen die pas tijdens de gisting hun uiteindelijke vorm krijgen — efficiënter "
            "vrij te maken, wat een directer, zuiverder fruitprofiel oplevert dan een neutrale of "
            "verkeerd gekozen giststam. Producenten die op aromatische precisie mikken, testen "
            "vaak meerdere giststammen per partij vóór ze een keuze definitief maken.\n\n"
            "Aan het andere uiterste van de stijlas kiezen sommige producenten, vooral bij de "
            "meer gastronomisch georiënteerde rosés, voor textuurontwikkeling-via-lees: langere "
            "lees-contact en soms bâtonnage-bij-rosé (het periodiek opwerven van de gistresten) "
            "voegen mondvulling en een zachtere textuur toe, ten koste van een deel van de "
            "primaire fruitscherpte. Je gebruikt dit onderscheid om een rosé te plaatsen: een "
            "strak, reductief gevinifieerde stijl met veel primair fruit wijst op de aromatisch "
            "gedreven aanpak; een rondere, meer gestructureerde textuur met minder uitgesproken "
            "primair fruit wijst eerder op bewuste lees-gestuurde textuurontwikkeling."
        ),
        "samenvatting": (
            "- Reductieve vinificatie met minimaal zuurstofcontact is standaard bij moderne, "
            "aromatisch gedreven roséstijlen\n"
            "- Temperatuurgestuurde gisting bij lage temperaturen behoudt vluchtige, primaire "
            "aromastoffen\n"
            "- Gistkeuze-aromabehoud bepaalt hoe efficiënt aromaprecursoren worden omgezet in "
            "primair fruit\n"
            "- Textuurontwikkeling-via-lees en bâtonnage-bij-rosé voegen mondvulling toe ten "
            "koste van fruitscherpte\n"
            "- Het onderscheid tussen strak-reductief en lees-gestuurd verklaart grote "
            "stijlverschillen binnen rosé"
        ),
        "pro_insight": (
            "Leg aan een gast die een 'rondere' rosé zoekt uit dat dit vaak wijst op bewuste "
            "lees-gestuurde textuurontwikkeling in plaats van simpelweg een andere druif, en stuur "
            "je aanbeveling daarop bij."
        ),
        "reflectievraag": (
            "Zou jij bij een rosé met opvallend veel mondvulling en een zachtere textuur durven "
            "inschatten of dat van lees-contact komt, en welk ander kenmerk zou je daarvoor "
            "checken?"
        ),
        "kernbegrippen": [
            "reductieve vinificatie",
            "temperatuurgestuurde gisting",
            "gistkeuze-aromabehoud",
            "textuurontwikkeling-via-lees",
            "bâtonnage-bij-rosé",
        ],
    },
    10: {
        "theorie": (
            "De frisse stijl en de gastronomische stijl vertegenwoordigen binnen rosé twee "
            "uiteinden van eenzelfde spectrum, en het verwarren van die twee is een van de meest "
            "voorkomende fouten in advisering. De frisse stijl — het bleke, direct-perse, "
            "reductief gevinifieerde profiel — is ontworpen voor onmiddellijke consumptie: "
            "aperitief, terras, licht zomers eten, waarbij textuurspanning en aromatische "
            "zuiverheid de hoofdrol spelen en bewaarpotentieel welbewust beperkt blijft.\n\n"
            "De gastronomische stijl daarentegen — vaak afkomstig uit Tavel, Bandol of "
            "vergelijkbare structuurrijke tradities, soms met lees-contact of zelfs beperkt "
            "vatgebruik — bouwt bewust meer body, tanninegewicht en concentratie op, wat de "
            "gastronomische inzetbaarheid vergroot: deze stijlen kunnen naast stevigere gerechten, "
            "gekruide keukens of zelfs sommige lichte vleesgerechten functioneren zonder "
            "overweldigd te raken, iets waartoe de frisse stijl zelden in staat is.\n\n"
            "Die twee stijlen vragen bovendien om een andere servicetemperatuurdifferentiatie: de "
            "frisse stijl presteert het best rond acht tot tien graden, waar textuurspanning en "
            "zuiverheid maximaal tot hun recht komen, terwijl de gastronomische stijl vaak beter "
            "functioneert rond tien tot dertien graden — te koud geserveerd verdwijnt juist de "
            "structuur en complexiteit die deze stijl onderscheidt van de frisse variant. Ook het "
            "bewaarpotentieelverschil is aanzienlijk: waar de frisse stijl doorgaans binnen een "
            "tot twee jaar op zijn best is, kan de gastronomische stijl, afhankelijk van "
            "structuur en herkomst, meerdere jaren positief evolueren.\n\n"
            "Je gebruikt dit onderscheid actief in stijlverwachtingsmanagement: leg een gast die "
            "gewend is aan de frisse stijl vooraf uit dat een gastronomische rosé structuurrijker, "
            "minder uitgesproken fris en soms zelfs licht tanninehoudend aanvoelt — zonder die "
            "context loopt de gast het risico de gastronomische stijl als 'minder rosé' te "
            "ervaren, terwijl het juist een bewuste, andere specialisatie binnen dezelfde "
            "categorie betreft."
        ),
        "samenvatting": (
            "- De frisse stijl is ontworpen voor onmiddellijke consumptie met nadruk op "
            "textuurspanning en aromatische zuiverheid\n"
            "- De gastronomische stijl bouwt bewust meer body en concentratie op voor bredere "
            "gastronomische inzetbaarheid\n"
            "- Beide stijlen vragen om een andere servicetemperatuur: acht tot tien graden versus "
            "tien tot dertien graden\n"
            "- Het bewaarpotentieelverschil is groot: één à twee jaar voor de frisse stijl, "
            "meerdere jaren voor de gastronomische stijl\n"
            "- Stijlverwachtingsmanagement voorkomt dat gasten de gastronomische stijl ten "
            "onrechte als 'minder rosé' ervaren"
        ),
        "pro_insight": (
            "Beheer verwachtingen expliciet wanneer je een gastronomische rosé serveert aan een "
            "gast die de frisse stijl gewend is: kondig vooraf aan dat deze stijl structuurrijker "
            "en minder uitgesproken fris aanvoelt, zodat dat niet als teleurstelling maar als "
            "bewuste ontdekking landt."
        ),
        "reflectievraag": (
            "Zou jij bij het serveren van een gastronomische rosé aan een gast die enkel de "
            "frisse stijl kent, vooraf de juiste verwachtingen weten te scheppen zonder de wijn "
            "te moeten verdedigen?"
        ),
        "kernbegrippen": [
            "textuurspanning",
            "gastronomische inzetbaarheid",
            "servicetemperatuurdifferentiatie",
            "bewaarpotentieelverschil",
            "stijlverwachtingsmanagement",
        ],
    },
}
