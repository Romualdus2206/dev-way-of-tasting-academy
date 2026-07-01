"""Premium Gold Master repair data — Rosé Track lessons 26–43 (modules 6–9, sequential index).

ROSE_MODULES.md telt 43 lessen, geen 40: Module 8 bevat zes pairinglessen die in de
bronmarkdown genummerd zijn als LES 35–40, en Module 9 hergebruikt binnen dat bestand de
nummers LES 38–40 voor blindproeven en examen. Deze module gebruikt daarom een doorlopende
build-index in plaats van de rauwe LES-nummers uit de bron:

26 licht-en-fris · 27 fruitig-en-sappig · 28 kruidig-en-droog · 29 structuur-en-body ·
30 rose-als-maaltijdwijn — Module 6: Stijl & Gastronomie (dieptelaag).
31 serveertemperatuur · 32 glaswerk · 33 bewaren · 34 jong-drinken-vs-rijping —
Module 7: Service op sommelierniveau.
35 rose-en-salades · 36 rose-en-vis · 37 rose-en-barbecue · 38 rose-en-aziatisch
(bron: M8 LES 38) · 39 rose-en-charcuterie (bron: M8 LES 39) · 40 rose-en-fine-dining
(bron: M8 LES 40) — Module 8: Pairing & Gastronomie, mechanism-driven.
41 provence-vs-tavel-blind (bron: M9 LES 38) · 42 rose-vs-lichte-rode-wijn-blind
(bron: M9 LES 39) · 43 theorie-praktijkexamen (bron: M9 LES 40, 20 quizvragen) —
Module 9: Blindproeven & Examen.

Rosé krijgt hier een eigen identiteitslogica: kleur en tanninestructuur zijn bij rosé
onafhankelijke variabelen (persmoment/schilcontact bepaalt kleur, fermentatieduur op
schillen — bij rosé per definitie vrijwel nul — bepaalt tannine), in tegenstelling tot
rode wijn waar beide sterk gekoppeld zijn aan dezelfde macteratieduur. Rosé is dus geen
verdunde rode wijn maar een eigen categorie met een eigen productielogica.
"""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    26: {
        "theorie": (
            "Bleke, geprotegeerde rosé — de Provence-stijl, Chiaretto, lichte Navarra "
            "rosado — is geen toevallig bijproduct van rode wijnvinificatie maar het "
            "resultaat van een bewuste, wit-wijn-achtige procesketen die toegepast wordt "
            "op blauwe druiven. Het schilcontact duurt hier meestal slechts twee tot zes "
            "uur, vaak via direct press waarbij de druiven nauwelijks tijd krijgen om "
            "kleurstof af te geven vóór het sap van de schillen wordt gescheiden. Omdat "
            "tannine vrijwel uitsluitend uit schil en pit komt, en niet uit de druivensoort "
            "zelf, betekent minimaal schilcontact automatisch minimale tanninextractie — "
            "kleurdiepte en tanninegehalte worden dus in dezelfde handeling tegelijk laag "
            "gehouden, niet apart gestuurd.\n\n"
            "Het Centre de Recherche et d'Expérimentation sur le Vin Rosé in Vidauban — "
            "wereldwijd het enige onderzoeksinstituut dat zich uitsluitend op rosé richt "
            "— bestudeert precies deze extractiecurve: hoe elke bijkomende contactminuut "
            "de kleur- en fenolconcentratie verschuift. Die data onderbouwt de moderne "
            "Provençaalse voorkeur voor een extreem bleke, 'oeil de perdrix'-achtige tint, "
            "een esthetische keuze die de afgelopen twintig jaar de internationale "
            "referentiestandaard voor lichte rosé is geworden.\n\n"
            "Zuurbehoud is hier primair een wijngaardbeslissing, geen kelderbeslissing: "
            "vroege oogst, een koeler mesoklimaat en voldoende dag-nachtverschil houden "
            "het appelzuur hoog vóórdat de druif ook maar in de pers komt. In de kelder "
            "wordt de appelzuur-melkzuurgisting daarna vrijwel altijd geblokkeerd — via "
            "koude, SO₂ en filtratie — om die strakke, rechte zuurstructuur te bewaren in "
            "plaats van haar te laten afronden.\n\n"
            "Protectieve, reductieve vinificatie maakt het plaatje compleet: een inert-"
            "gasdeken tijdens persen en overhevelen voorkomt vroege oxidatieve bruinkleuring "
            "van de kleine antocyaanpool, en gisting op 13–16°C met specifiek geselecteerde "
            "gisten behoudt de vluchtige esters (isoamylacetaat, 2-fenylethanol) die het "
            "subtiele citrus-en-mineraal-register geven in plaats van uitbundig fruit.\n\n"
            "Dit is precies waarom lichte rosé geen 'verdunde rode wijn' is: het is een "
            "witwijn-vinificatietechniek toegepast op een blauwe druif, met een eigen "
            "extractielogica, eigen zuurstrategie en eigen esterprofiel — een structureel "
            "andere categorie dan zowel rood als wit."
        ),
        "samenvatting": (
            "- Twee tot zes uur schilcontact bepaalt tegelijk lage kleurdiepte én lage tanninextractie\n"
            "- CREVR in Vidauban is het enige onderzoeksinstituut ter wereld specifiek gericht op rosé\n"
            "- Zuurbehoud is een wijngaardkeuze (vroege oogst, koel mesoklimaat), geblokkeerde appelzuur-melkzuurgisting bewaart die scherpte\n"
            "- Protectieve, reductieve vinificatie (inert gas, koele gisting) behoudt subtiele esters in plaats van uitbundig fruit\n"
            "- Lichte rosé is een witwijn-vinificatietechniek op blauwe druiven, geen verdunde rode wijn"
        ),
        "pro_insight": (
            "Leg een gast uit dat de bleekheid van een Provence-stijl geen kwaliteitscompromis "
            "is maar een precieze extractiekeuze — dat verandert het gesprek van 'is dit wel "
            "genoeg wijn' naar 'dit is precies zo gemaakt'."
        ),
        "kernbegrippen": [
            "vin-gris-persmoment",
            "geblokkeerde appelzuur-melkzuurgisting",
            "CREVR-onderzoekscurve Vidauban",
            "protectieve inertgastechniek",
            "onafhankelijke kleur-tannine-as",
        ],
        "food_pairing": fp(
            "Oesters, tonijn tartaar of een salade met citrusdressing en verse kruiden.",
            "De hoge, strakke zuurgraad en het vrijwel afwezige tanninegehalte laten de subtiele esters ondersteunen zonder de fijne textuur van rauwe vis of rauwkost te verpletteren.",
            "Zware, romige sauzen of gestoofde gerechten — de lage extractie en subtiele aromatiek van deze stijl vallen daar volledig tegen weg.",
        ),
        "reflectievraag": (
            "Bij welke fles lichte rosé op jouw kaart zou jij het schilcontact van twee tot "
            "zes uur expliciet benoemen aan een gast — en verandert dat hun verwachting van "
            "de wijn?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom hebben lichte, bleke rosé's zowel weinig kleur als weinig tannine?\n\n"
                "A. Omdat kort schilcontact beide tegelijk beperkt — tannine komt immers uit dezelfde schil ✅  \n"
                "B. Omdat de druiven speciaal ontkleurd worden  \n"
                "C. Omdat er altijd water wordt toegevoegd  \n"
                "D. Omdat alleen witte druiven gebruikt worden"
            ),
        },
    },
    27: {
        "theorie": (
            "Fruitige, sappige rosé — de wereldwijd grootste commerciële categorie — "
            "ontstaat door een net iets andere set keuzes dan de bleke Provence-stijl, "
            "niet door toeval. Grenache-gedreven wijnen uit Spanje, Californië en "
            "Australië krijgen doorgaans iets meer schilcontact (zes tot twaalf uur) in "
            "een warmer klimaat, wat rijper fruit en een hogere concentratie aan "
            "fruitgedreven esters oplevert — met name ethylhexanoaat en ethylbutyraat, "
            "verantwoordelijk voor de herkenbare aardbei- en roodfruittoon. Fermentatie "
            "op 14–16°C, iets warmer dan bij de bleke stijl, behoudt precies dit "
            "esterprofiel in plaats van het meer terughoudende citrusregister.\n\n"
            "De geschiedenis van deze categorie is direct te herleiden tot één specifiek "
            "ongeluk. In 1972 gebruikte winemaker Bob Trinchero bij Sutter Home de "
            "saignée-methode om zijn rode Zinfandel te concentreren: hij liet sap af van "
            "de schillen om een krachtiger rode wijn te maken, en fermenteerde dat "
            "afgetapte sap apart tot een droge, lichtgekleurde wijn die hij 'White "
            "Zinfandel' noemde. In 1975 bleef die gisting per ongeluk steken bij circa "
            "2% restsuiker — een technisch mankement, geen ontwerpkeuze — en het resultaat "
            "werd zo'n commercieel succes dat het de eerste wijn werd die Sutter Home elk "
            "jaar uitverkocht. Die gelukte fout redde bovendien de oude Zinfandel-"
            "wijngaarden van Californië, die destijds massaal gerooid werden ten gunste "
            "van Chardonnay en Cabernet Sauvignon.\n\n"
            "Dat ongeluk verklaart een blijvende technische tweedeling binnen 'fruitige "
            "rosé' vandaag: veel Nieuwe Wereld blush-stijlen dragen bewust een kleine "
            "hoeveelheid restsuiker (vijf tot dertig gram per liter) om die directe "
            "sappigheid te versterken, terwijl de meeste Spaanse en Australische "
            "Grenache-rosado's volledig droog zijn en hun fruitindruk puur uit rijpheid "
            "en esters halen, niet uit suiker. Beide bereiken eenzelfde sensorische "
            "indruk via een fundamenteel ander mechanisme.\n\n"
            "Deze stijl is daarom nooit bedoeld als gastronomisch precisie-instrument "
            "zoals de bleke of kruidige stijlen, maar als toegankelijk, breed inzetbaar "
            "aperitief- en casual-diningsegment — en juist dat maakt haar wereldwijd "
            "verreweg de best verkopende rosécategorie."
        ),
        "samenvatting": (
            "- Iets langer schilcontact (zes tot twaalf uur) in een warmer klimaat geeft rijper fruit en meer ester\n"
            "- Ethylhexanoaat en ethylbutyraat verklaren de herkenbare aardbei- en roodfruittoon\n"
            "- White Zinfandel ontstond in 1975 uit een technisch mankement (stokende gisting bij Sutter Home), niet uit ontwerp\n"
            "- Sommige Nieuwe Wereld blush-stijlen dragen bewust restsuiker; Spaanse/Australische Grenache-rosado blijft vaak volledig droog\n"
            "- Beide routes bereiken dezelfde sappige indruk via een ander mechanisme (restsuiker versus rijpheid en esters)"
        ),
        "pro_insight": (
            "Vertel het verhaal van de per ongeluk stokende gisting van Sutter Home aan een "
            "gast die 'fruitige rosé' als oppervlakkig afdoet — het herframet de categorie "
            "meteen als een concreet stuk wijngeschiedenis in plaats van een commerciële "
            "bijzaak."
        ),
        "kernbegrippen": [
            "saignée-concentratie-effect",
            "ethylhexanoaat-roodfruitester",
            "Sutter Home-gistingsongeluk 1975",
            "restsuiker-versus-rijpheidsfruit",
            "casual-diningsegment",
        ],
        "food_pairing": fp(
            "Tapas, gegrilde groenten of een lichte pizza margherita.",
            "De rijpe roodfruittonen en de soepele, toegankelijke structuur spiegelen de directe, informele smaken van casual gerechten zonder een precisiematch te vereisen.",
            "Verfijnde, delicate gerechten met subtiele aromatiek — de uitgesproken fruitconcentratie overstemt die nuance snel.",
        ),
        "reflectievraag": (
            "Zou jij een gast die alleen zoete blush-stijlen kent, durven overtuigen met een "
            "volledig droge Grenache-rosado — en welk verschil (restsuiker versus rijpheid) "
            "gebruik je om dat uit te leggen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Hoe ontstond de eerste populaire White Zinfandel bij Sutter Home?\n\n"
                "A. Door een gisting die per ongeluk stokte bij ongeveer 2% restsuiker ✅  \n"
                "B. Door bewust suiker toe te voegen na gisting  \n"
                "C. Door twee druivenrassen te blenden  \n"
                "D. Door lange vatrijping in nieuw eikenhout"
            ),
        },
    },
    28: {
        "theorie": (
            "Kruidige, drogere rosé — het register van Bandol, Tavel en delen van "
            "Zuid-Italië — ontstaat via een net iets ander verhaal dan puur "
            "extractieduur: het draait om druivenkeuze én omgeving. Syrah draagt hier "
            "rotundone bij, hetzelfde sesquiterpeen dat in rode Syrah zwarte peper "
            "veroorzaakt en dat toeneemt naarmate de druiventros minder directe "
            "zoninstraling krijgt — koelere percelen en bewust bladwerk geven dus meer "
            "kruidigheid, ongeacht het schilcontact. Mourvèdre voegt daarnaast een "
            "savoury, kruidig-aardse laag toe die niet primair uit rotundone komt maar "
            "uit een bredere fenolische opbouw die samenhangt met iets langer "
            "schilcontact dan bij de fruitige of bleke stijl.\n\n"
            "Een specifiek omgevingsmechanisme versterkt dit in de Provençaalse en "
            "Bandolese wijngaarden: de garrigue, de wilde mediterrane begroeiing van "
            "tijm, rozemarijn en lavendel die vaak direct tegen de wijngaarden aan groeit, "
            "geeft vluchtige aromatische verbindingen af die zich aan de druivenschil "
            "kunnen hechten — hetzelfde principe waarmee eucalyptusbomen naast "
            "Coonawarra-wijngaarden een meetbare munttoon in Cabernet Sauvignon afgeven. "
            "Kruidigheid in rosé is dus deels druifchemie (rotundone) en deels een "
            "aantoonbaar omgevingseffect, geen vaag stijlkenmerk.\n\n"
            "De Bandol AOC formaliseert dit bovendien wettelijk: de rosé-appellatie eist "
            "sinds 2014 minimaal 20% Mourvèdre in de aanplant (voorheen 10%), met een "
            "maximum van 95% — een aanzienlijk lagere ondergrens dan de 50% die voor "
            "Bandol rode wijn geldt, maar nog altijd genoeg om de rosé een herkenbaar "
            "steviger, kruidiger karakter te geven dan de meeste andere Provençaalse "
            "rosé's.\n\n"
            "Deze combinatie van rotundone, garrigue-adsorptie en een hoger "
            "Mourvèdre-aandeel resulteert in meer fenolische substantie dan bij de bleke "
            "of fruitige stijl — niet genoeg om als tanninerijk te gelden, maar wel "
            "genoeg om de wijn langer op tafel te laten functioneren en gastronomisch "
            "zwaardere gerechten te kunnen dragen.\n\n"
            "Dat extra fenolische fundament is ook precies waarom deze stijl, in "
            "tegenstelling tot de bleke of fruitige categorie, een reëel — zij het "
            "bescheiden — bewaarpotentieel heeft, een lijn die in les 33 en 34 verder "
            "wordt uitgewerkt."
        ),
        "samenvatting": (
            "- Rotundone (Syrah) neemt toe bij minder zoninstraling — kruidigheid is deels een teeltkeuze\n"
            "- Garrigue-kruiden (tijm, rozemarijn, lavendel) geven vluchtige aromatische verbindingen af aan de druivenschil, net als eucalyptus bij Coonawarra\n"
            "- Bandol AOC eist sinds 2014 wettelijk minimaal 20% Mourvèdre voor rosé (voorheen 10%)\n"
            "- Meer fenolische substantie dan bleke of fruitige rosé, zonder als tanninerijk te gelden\n"
            "- Dat fenolische fundament verklaart het bescheiden bewaarpotentieel van deze stijl"
        ),
        "pro_insight": (
            "Noem bij een Bandol rosé expliciet het wettelijke Mourvèdre-minimum van 20% — "
            "dat concrete cijfer geeft een gast direct een reden waarom deze rosé steviger "
            "aanvoelt dan een gemiddelde Provence."
        ),
        "kernbegrippen": [
            "garrigue-VOC-adsorptie",
            "Bandol-Mourvèdre-minimum 2014",
            "rotundone-koelklimaatsignaal",
            "verlengd-schilcontact-kruidigheid",
            "fenolisch-fundament-bewaarpotentieel",
        ],
        "food_pairing": fp(
            "Gegrilde vis met mediterrane kruiden, of kip met tijm en rozemarijn.",
            "De rotundone- en garriguetonen in de wijn resoneren direct met de kruiden op het gerecht — een aroma-op-aroma-brug in plaats van alleen een structuurmatch.",
            "Zeer delicate, ongekruide gerechten — de extra kruidige complexiteit overstemt die subtiliteit al snel.",
        ),
        "reflectievraag": (
            "Bij welke fles Bandol of Tavel op jouw kaart zou jij het wettelijke "
            "Mourvèdre-percentage gebruiken als verkoopargument in plaats van alleen de "
            "regio te noemen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat verklaart de kruidige, savoury toon van veel Bandol- en Provence-rosé het beste?\n\n"
                "A. Rotundone uit Syrah en vluchtige garrigueverbindingen die zich aan de schil hechten ✅  \n"
                "B. Uitsluitend lange vatrijping in nieuw eikenhout  \n"
                "C. Toevoeging van kruidenextract na gisting  \n"
                "D. Een hoog restsuikergehalte"
            ),
        },
    },
    29: {
        "theorie": (
            "Body bij rosé is geen vast druifkenmerk maar het resultaat van drie "
            "onafhankelijk stuurbare factoren: moutgewicht (en dus alcohol), de duur en "
            "aard van fenolische extractie, en — bij premium cuvées — bewuste "
            "lees-batonnage voor extra textuur. Dat rosé's structureel zo uiteenlopen, "
            "van de waterige lichtheid van basic Pinot Grigio-achtige stijlen tot de "
            "bijna roodwijnachtige densiteit van Bandol, is precies waarom body als "
            "aparte as naast kleur en aromatiek moet worden beoordeeld.\n\n"
            "Tavel AOC in de zuidelijke Rhône illustreert dit mechanisme het duidelijkst "
            "van alle Franse appellaties: het is de enige AOC in Frankrijk die "
            "uitsluitend rosé mag produceren — geen witte of rode wijn is toegestaan "
            "onder de naam Tavel. Om die rosé voldoende body en bewaarpotentieel te geven, "
            "past Tavel een technische ingreep toe die bij de meeste andere rosé "
            "ongebruikelijk is: perswijn (het sap dat na het eerste, zachte persen "
            "vrijkomt, rijker aan fenolen dan het vrijloopsap) wordt vóór de gisting "
            "bewust bijgemengd met het vrijloopsap, in combinatie met een langere "
            "maceratieduur dan bij Provence gebruikelijk is. Het resultaat is een rosé "
            "met aantoonbaar meer lichaam en een lichte tastbare grip — een "
            "structuurniveau dat je normaal alleen bij lichte rode wijn verwacht.\n\n"
            "Grenache, de verplichte hoofddruif van Tavel (samen met Grenache Blanc en "
            "Grenache Gris altijd tussen de 30% en 60% van de aanplant), draagt daarnaast "
            "van nature een hoger suikergehalte bij rijpheid, wat automatisch meer "
            "alcohol en dus meer ervaren gewicht oplevert dan de doorgaans vroeger "
            "geoogste, koelere Provence-druiven.\n\n"
            "Praktisch schaalt de inzetbaarheid van rosé exact met deze bodyas: lichte "
            "body (Provence, Chiaretto) past bij aperitieven, salades en "
            "schaal-en-schelpdieren; medium body (de meeste Rosado's, Cinsault-gedreven "
            "stijlen) past bij vis, kip en pasta; volle body (Tavel, Bandol) kan "
            "barbecue, kalfsvlees en kruidige gerechten dragen zonder te verdwijnen.\n\n"
            "Body is daarmee het meest praktische, direct bruikbare instrument bij "
            "roséservice: het bepaalt sneller dan kleur of aromatiek of een gerecht de "
            "wijn zal overheersen of andersom."
        ),
        "samenvatting": (
            "- Body wordt bepaald door moutgewicht, fenolische extractie en eventuele lees-batonnage\n"
            "- Tavel is de enige Franse AOC die uitsluitend rosé produceert\n"
            "- Tavel mengt bewust perswijn bij het vrijloopsap en macereert langer voor extra lichaam en een lichte grip\n"
            "- Grenache (verplicht 30–60% van de aanplant in Tavel) draagt van nature meer suiker en dus meer gewicht bij\n"
            "- Lichte, medium en volle body koppelen direct aan aperitief-, vis-kip- en barbecuegerechten"
        ),
        "pro_insight": (
            "Leg bij een Tavel expliciet uit dat de extra body geen toeval is maar een "
            "bewuste blend van perswijn en vrijloopsap — dat verklaart in één zin waarom "
            "deze rosé zwaarder aanvoelt dan een gast van rosé zou verwachten."
        ),
        "kernbegrippen": [
            "perswijn-vrijloopsapmenging Tavel",
            "Tavel-exclusiviteit uitsluitend rosé",
            "lees-batonnage-textuur",
            "moutgewicht-en-extractie-as",
            "bodygebonden-inzetbaarheidsschaal",
        ],
        "food_pairing": fp(
            "Een volle Tavel bij lamskotelet, of lichte Provence bij oesters — afhankelijk van bodyniveau.",
            "Het lichaam van de wijn bepaalt of ze het gewicht van het gerecht kan dragen: vol lichaam matcht vol gerecht, licht lichaam matcht subtiliteit.",
            "Een lichte Provence bij een zwaar gekruid stoofgerecht — het gerecht overweldigt de wijn volledig ondanks een op zich passend aromaprofiel.",
        ),
        "reflectievraag": (
            "Welke drie rosé's op jouw kaart zou jij puur op body rangschikken — en verandert "
            "die volgorde jouw huidige pairingadvies?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat maakt Tavel structureel zwaarder dan een gemiddelde Provence rosé?\n\n"
                "A. Bewuste menging van perswijn met vrijloopsap en een langere maceratie ✅  \n"
                "B. Toevoeging van suiker na gisting  \n"
                "C. Uitsluitend gebruik van witte druiven  \n"
                "D. Filtratie zonder gisting"
            ),
        },
    },
    30: {
        "theorie": (
            "Rosé wordt aan tafel structureel onderschat, en dat is precies waarom deze "
            "les de vorige vier samenbrengt tot één centrale, gastronomische stelling: "
            "rosé is geen verdunde rode wijn en geen gezoete witte wijn, maar een eigen "
            "categorie met een eigen productielogica — en die logica maakt haar juist "
            "extreem geschikt als maaltijdwijn.\n\n"
            "De kern van dat argument is de onafhankelijke kleur-tannine-as die in les "
            "26 werd geïntroduceerd. Bij rode wijn zijn kleurdiepte en tanninegehalte "
            "gekoppeld: beide stijgen met dezelfde maceratieduur op de schillen. Bij "
            "rosé zijn ze ontkoppeld — het persmoment bepaalt de kleur, terwijl de "
            "fermentatieduur op de schillen per definitie vrijwel nul is, ongeacht hoe "
            "diep de kleur is. Een rosé kan dus relatief donker zijn (Tavel) zonder ook "
            "maar in de buurt te komen van de tanninestructuur van zelfs de lichtste "
            "rode wijn. Die ontkoppeling is precies wat rosé flexibiliteit geeft die "
            "geen enkele andere categorie evenaart.\n\n"
            "Diezelfde ontkoppeling verklaart waarom rosé tegelijk fris genoeg is voor "
            "lichte gerechten (dankzij de vroege oogst en geblokkeerde appelzuur-"
            "melkzuurgisting uit les 26) én lichaam genoeg heeft voor complexere "
            "gerechten (dankzij de body-opbouw uit les 29) zonder dat het één het "
            "andere in de weg zit — een wijnstijl kan zuur én body tegelijk hoog houden "
            "op een manier die bij rode wijn zelden voorkomt, omdat rode wijn zijn "
            "structuur nu eenmaal via tannine opbouwt.\n\n"
            "Praktisch verklaart dit waarom rosé zo breed werkt: Mediterrane keuken "
            "(kruidigheid uit les 28 matcht met garrigue-gerechten), Aziatische keuken "
            "(fruit en frisheid bufferen specerij), barbecue (zuur snijdt vet) en "
            "charcuterie (frisheid weerstaat zout) delen geen enkel gemeenschappelijk "
            "kenmerk behalve dat ze allemaal profiteren van een wijn die tegelijk zuur, "
            "fruit én enig lichaam kan combineren zonder dat tannine een van die assen "
            "beperkt.\n\n"
            "Dat maakt rosé, mits de juiste stijl bewust gekozen wordt op basis van "
            "structuur in plaats van op kleur of imago, een van de meest veelzijdige "
            "maaltijdwijnen die een sommelier ter beschikking heeft — serieuzer dan het "
            "imago van 'zomerwijn' doet vermoeden."
        ),
        "samenvatting": (
            "- Rosé is geen verdunde rode wijn: kleur en tannine zijn ontkoppelde, onafhankelijk stuurbare variabelen\n"
            "- Fermentatieduur op de schillen is bij rosé per definitie vrijwel nul, ongeacht hoe diep de kleur is\n"
            "- Die ontkoppeling laat rosé tegelijk hoog zuur én voldoende lichaam combineren, iets rode wijn zelden doet\n"
            "- Mediterrane, Aziatische, barbecue- en charcuteriepairing delen geen kenmerk behalve profijt van die combinatie\n"
            "- Rosé is een eigen categorie met een eigen productielogica, geen tussenvorm van wit en rood"
        ),
        "pro_insight": (
            "Gebruik de ontkoppelde kleur-tannine-as als kernargument wanneer een gast rosé "
            "afdoet als 'geen serieuze keuze' — het verplaatst het gesprek van imago naar "
            "aantoonbare productielogica."
        ),
        "kernbegrippen": [
            "ontkoppelde kleur-tannine-as",
            "fermentatieduur-op-schillen-nul",
            "eigen-categorie-identiteit",
            "gecombineerde zuur-en-lichaamscapaciteit",
            "gastronomische onderschatting",
        ],
        "food_pairing": fp(
            "Een driegangenmenu waarbij elke gang een andere roséstijl krijgt: licht bij het voorgerecht, kruidig bij het hoofdgerecht, vol bij de kaas.",
            "Elke gang gebruikt een andere combinatie van zuur, fruit en lichaam uit hetzelfde rosé-spectrum, wat de brede inzetbaarheid van de categorie in één menu bewijst.",
            "Eén enkele lichte rosé door het hele menu heen serveren — dat negeert precies de structuurvariatie die rosé zo veelzijdig maakt.",
        ),
        "reflectievraag": (
            "Bij welk gerecht op jouw kaart zou jij een gast nu bewust naar rosé sturen in "
            "plaats van naar het automatische witte of rode alternatief — en met welk "
            "mechanisme onderbouw je dat?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom is rosé geen 'verdunde rode wijn'?\n\n"
                "A. Omdat kleur en tannine bij rosé ontkoppelde variabelen zijn, in tegenstelling tot bij rode wijn ✅  \n"
                "B. Omdat rosé altijd van witte druiven wordt gemaakt  \n"
                "C. Omdat rosé nooit tannine bevat  \n"
                "D. Omdat rosé altijd zoeter is dan rode wijn"
            ),
        },
    },
    31: {
        "theorie": (
            "Serveertemperatuur bij rosé stuurt, net als bij witte en rode wijn, een "
            "vluchtigheids- en tastmechanisme tegelijk — maar de precieze balans "
            "verschilt per stijl, omdat het fenolisch fundament van rosé structureel "
            "varieert (les 26–29). Te koud onderdrukt de vluchtigheid van esters en "
            "aromatische verbindingen zo sterk dat de wijn 'gesloten' oogt, terwijl "
            "koude tegelijk de zoetheidsperceptie van de tong onderdrukt zonder de "
            "zuurperceptie evenredig te dempen — het netto-effect is een wijn die "
            "kouder plots scherper en minder aromatisch overkomt. Te warm versnelt de "
            "verdamping van ethanol, wat de alcohol prominenter maakt en de frisheid "
            "laat wegzakken.\n\n"
            "Omdat de bleke, protectief gevinifieerde stijl (les 26) nauwelijks "
            "fenolische substantie heeft om tegen te beschermen, kan en moet die stijl "
            "het koudst geserveerd worden: 8–10°C. Fruitige, sappige stijlen (les 27) "
            "zitten net iets hoger, 9–11°C, omdat hun rijpere esterprofiel iets meer "
            "ruimte nodig heeft om zich te openen zonder de frisheid te verliezen. "
            "Gastronomische, structuurrijkere stijlen zoals Tavel en Bandol (les 28–29) "
            "vragen 11–13°C: hun hogere fenolconcentratie — deels uit perswijnmenging, "
            "deels uit langer schilcontact — heeft dezelfde eiwitbindingskinetiek nodig "
            "die ook bij rode wijn tannine ronder maakt bij een net iets hogere "
            "temperatuur. Te koud geserveerd voelt zo'n rosé daardoor onnodig hard en "
            "onvolledig aan.\n\n"
            "Deze structuurafhankelijke temperatuurcurve is dus geen esthetische "
            "voorkeur maar een direct gevolg van hetzelfde fenolische fundament dat in "
            "de vorige lessen werd opgebouwd: hoe meer fenolische substantie een rosé "
            "draagt, hoe meer ze baat heeft bij een fractie extra warmte om die "
            "substantie soepel te laten integreren.\n\n"
            "Praktisch protocol: schenk 1°C onder de uiteindelijke doeltemperatuur, "
            "want het glas en de ruimte warmen de wijn vanzelf op tijdens het drinken — "
            "identiek aan het principe bij witte en rode wijn, maar met een smallere "
            "marge omdat rosé's fenolische buffer kleiner is en dus sneller uit balans "
            "raakt bij een verkeerde temperatuur.\n\n"
            "Een structureel probleem in de praktijk is dat rosé bijna overal standaard "
            "ijskoud wordt geserveerd, ongeacht stijl — waardoor juist de meest "
            "gastronomisch interessante, structuurrijke rosé's stelselmatig te koud en "
            "dus onder hun niveau worden geschonken."
        ),
        "samenvatting": (
            "- Koude onderdrukt zoetheidsperceptie zonder de zuurperceptie evenredig te dempen — te koud maakt een rosé scherper en gesloten\n"
            "- Bleke stijl: 8–10°C; fruitige stijl: 9–11°C; gastronomische, fenolrijkere stijl (Tavel, Bandol): 11–13°C\n"
            "- Structuurrijkere rosé profiteert van dezelfde eiwitbindingskinetiek die tannine bij rode wijn ronder maakt\n"
            "- Schenk 1°C onder de doeltemperatuur — de marge is kleiner dan bij rood door de kleinere fenolische buffer\n"
            "- Rosé wordt in de praktijk bijna altijd standaard te koud geserveerd, ongeacht stijl"
        ),
        "pro_insight": (
            "Vraag jezelf bij elke rosé eerst af welk fenolisch fundament ze draagt (les "
            "26–29) vóór je de ijsemmer pakt — een Tavel of Bandol verdient een paar graden "
            "meer dan een basic Provence."
        ),
        "kernbegrippen": [
            "structuurafhankelijke temperatuurcurve",
            "zoetheidsonderdrukking bij koude",
            "eiwitbindingskinetiek-rosé",
            "kleinere fenolische temperatuurmarge",
            "structurele overkoeling-in-de-praktijk",
        ],
        "food_pairing": fp(
            "Dezelfde Bandol rosé geserveerd op 8°C en op 12°C naast lamskotelet.",
            "Bij 12°C integreert de fenolische substantie soepel met het vlees; bij 8°C voelt de wijn onnodig hard en onderontwikkeld aan naast hetzelfde gerecht.",
            "Een lichte Provence op 14°C bij een lichte salade — te warm serveren laat de alcohol domineren over de subtiele, bedoeld koele esters.",
        ),
        "reflectievraag": (
            "Welke rosé op jouw kaart serveer je vermoedelijk stelselmatig te koud voor haar "
            "structuurniveau — en wat zou je proeven na correctie dat je nu mist?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom vraagt een structuurrijke rosé zoals Tavel of Bandol een iets hogere serveertemperatuur dan een bleke Provence?\n\n"
                "A. Haar hogere fenolische concentratie profiteert van dezelfde eiwitbindingskinetiek als tannine bij rode wijn ✅  \n"
                "B. Omdat ze meer restsuiker bevat  \n"
                "C. Omdat ze minder alcohol bevat  \n"
                "D. Omdat koude altijd meer aroma geeft"
            ),
        },
    },
    32: {
        "theorie": (
            "Glasgeometrie stuurt bij rosé exact hetzelfde tweeledige mechanisme als bij "
            "wit en rood: het verdampingsoppervlak dat bepaalt hoeveel aroma vrijkomt "
            "vóór het glas de neus bereikt, en de plek op de tong waar de wijn eerst "
            "landt. Bij rosé is de doorslaggevende as echter niet tannine (rood) of "
            "puur aromatische intensiteit (wit), maar het fenolische structuurniveau "
            "dat in lessen 26–29 werd opgebouwd.\n\n"
            "Voor de bleke, protectief gevinifieerde stijl volstaat een kleiner "
            "witwijnglas: het beperkte oppervlak concentreert de toch al subtiele esters "
            "en citrus-mineraaltonen in plaats van ze te verdunnen in te veel lucht, en "
            "stuurt de wijn naar het puntje van de tong waar de strakke zuurgraad het "
            "eerst wordt opgemerkt. Voor volle, structuurrijke rosé — Tavel, Bandol, "
            "premium Rosado — werkt een groter witwijnglas beter: het grotere oppervlak "
            "geeft de extra fenolische substantie ruimte om zich te openen, en "
            "sommeliers gebruiken hiervoor steeds vaker bewust een Bourgondië-"
            "witwijnglas in plaats van het standaard, kleinere rosé-glas dat de meeste "
            "horecazaken automatisch serveren.\n\n"
            "Vermijd expliciet drie situaties: te kleine glazen die volle rosé's "
            "verstikken, dikke, generieke horecaglazen die de eerste tastindruk vertragen "
            "doordat de rand niet scherp genoeg geslepen is, en klassieke rodewijnglazen "
            "bij lichte rosé — dat laatste geeft veel te veel beluchting aan een wijn die "
            "juist precisie en concentratie nodig heeft.\n\n"
            "De categorie krijgt bovendien serieuze technische aandacht: enkele grote "
            "roséhuizen hebben, samen met glasfabrikanten, gewerkt aan een specifiek "
            "'verre à rosé'-ontwerp, precies omdat standaard witwijnglazen niet altijd "
            "optimaal zijn voor het brede spectrum aan rosé-structuurniveaus — een teken "
            "dat de categorie inmiddels serieus genoeg wordt genomen om eigen "
            "glasontwikkeling te rechtvaardigen.\n\n"
            "Net als bij temperatuur geldt: glaskeuze zou bij rosé gestuurd moeten worden "
            "door structuurniveau, niet door de kleur van het etiket of de gewoonte om "
            "'gewoon het rosé-glas' te pakken ongeacht welke stijl erin geschonken wordt."
        ),
        "samenvatting": (
            "- Glasoppervlak bepaalt beluchting én de plek op de tong waar rosé het eerst landt\n"
            "- Bleke rosé: kleiner witwijnglas concentreert subtiele esters en stuurt naar het tongpuntje\n"
            "- Volle, structuurrijke rosé (Tavel, Bandol): groter witwijnglas of Bourgondië-glas geeft de fenolen ruimte\n"
            "- Vermijd te kleine glazen, dikke horeca-glazen en rodewijnglazen bij lichte rosé\n"
            "- Sommige roséhuizen ontwikkelden samen met glasfabrikanten een specifiek 'verre à rosé'-ontwerp"
        ),
        "pro_insight": (
            "Schenk een structuurrijke Tavel of Bandol bewust in een groter witwijnglas in "
            "plaats van het standaard rosé-glas — het directe verschil in aromatische "
            "opening overtuigt een gast sneller dan enige uitleg."
        ),
        "kernbegrippen": [
            "structuurgeleide glaskeuze",
            "witwijnglas-versus-Bourgondiëglas",
            "randgeslepenheid-tastindruk",
            "verre-à-rosé-ontwikkeling",
            "verkeerd-glas-verstikkingsrisico",
        ],
        "food_pairing": fp(
            "Een volle Tavel in een groot Bourgondië-witwijnglas bij gegrilde lamskotelet.",
            "Het grote glasoppervlak opent de fenolische substantie van de Tavel precies genoeg om het gewicht van het lamsvlees te matchen.",
            "Diezelfde Tavel in een klein, standaard rosé-glas — de beperkte beluchting laat de structuur ingesloten en onderontwikkeld aanvoelen.",
        ),
        "reflectievraag": (
            "Welke rosé op jouw kaart wordt structureel in het verkeerde glas geschonken — "
            "en wat is de impact daarvan op hoe een gast de wijn beoordeelt?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom kiezen sommeliers voor een structuurrijke Tavel of Bandol vaak een groter Bourgondië-witwijnglas?\n\n"
                "A. Het grotere oppervlak geeft de hogere fenolische substantie ruimte om te openen ✅  \n"
                "B. Het verlaagt automatisch de temperatuur van de wijn  \n"
                "C. Het is wettelijk verplicht voor Tavel  \n"
                "D. Het verhoogt het alcoholpercentage"
            ),
        },
    },
    33: {
        "theorie": (
            "Rosé is qua opslag structureel de kwetsbaarste van de drie wijnkleuren, om "
            "een reden die verder gaat dan 'de meeste rosé is jong bedoeld om te "
            "drinken'. Het fenolische fundament van rosé — vooral bij de bleke, "
            "protectief gevinifieerde stijl uit les 26 — is aanzienlijk kleiner dan bij "
            "rode wijn en vaak ook kleiner dan bij stevigere witte wijn, wat betekent "
            "dat de natuurlijke antioxidantbuffer die polyfenolen bieden er simpelweg "
            "beperkter is. Warmte, zuurstof en temperatuurschommelingen tasten die "
            "kleine buffer sneller aan dan bij rode wijn, met een merkbare oxidatieve "
            "kleurverschuiving (van roze naar zalm en uiteindelijk richting koper) en "
            "verlies van precies de esters die in les 26–29 zo zorgvuldig werden "
            "opgebouwd.\n\n"
            "Een tweede, specifiek en vaak onderschat risico is lichtschade: rosé wordt "
            "commercieel vaak in helder glas gebotteld om de kleur zichtbaar te maken "
            "als verkoopargument, wat de wijn structureel kwetsbaarder maakt voor "
            "'goût de lumière' dan wijn in getint glas. Riboflavine in de wijn absorbeert "
            "UV- en zichtbaar licht, komt in een aangeslagen toestand terecht en reageert "
            "vervolgens met methionine tot vluchtige zwavelverbindingen (onder meer "
            "dimethyldisulfide) die een herkenbare, onaangename gekookte-koolgeur "
            "veroorzaken. Omdat rosé disproportioneel vaak in helder glas verkocht wordt, "
            "is dit voor deze categorie een reëel, meetbaar kwaliteitsrisico — geen "
            "theoretische bijzaak.\n\n"
            "Ideale opslag blijft daarom onverkort: donker, koel, stabiele temperatuur en "
            "liggend bij een kurksluiting om de kurk vochtig te houden. Bij rosé is het "
            "vermijden van licht — zowel zonlicht als fel winkelverlichting — relatief "
            "belangrijker dan bij rode wijn, precies vanwege die combinatie van helder "
            "glas en beperkte fenolische bescherming.\n\n"
            "Structuurrijkere stijlen (Bandol, Tavel) hebben, dankzij hun grotere "
            "fenolische fundament uit langer schilcontact en perswijnmenging (les 28–29), "
            "een reëel grotere antioxidantbuffer en verliezen hun kwaliteit merkbaar "
            "langzamer dan de bleke of fruitige stijl — de basis voor het bewaarpotentieel "
            "dat in les 34 wordt uitgewerkt.\n\n"
            "Voor de meeste rosé geldt onverkort: binnen één tot drie jaar drinken is "
            "geen compromis maar precies het venster waarin het fenolische en "
            "aromatische fundament optimaal intact is."
        ),
        "samenvatting": (
            "- Rosé heeft een kleinere fenolische antioxidantbuffer dan rode wijn, waardoor oxidatie sneller optreedt\n"
            "- Kleurverschuiving van roze naar zalm en koper signaleert die oxidatieve aftakeling\n"
            "- Helder flesglas — vaak gekozen om de kleur te tonen — maakt rosé extra gevoelig voor lichtschade (goût de lumière)\n"
            "- Riboflavine reageert onder licht met methionine tot zwavelverbindingen die een gekookte-koolgeur geven\n"
            "- Structuurrijkere stijlen (Bandol, Tavel) hebben een grotere fenolische buffer en verouderen langzamer"
        ),
        "pro_insight": (
            "Controleer expliciet of jouw rosé-voorraad in helder glas onder felle "
            "winkel- of keukenverlichting staat — dat ene detail veroorzaakt meer "
            "kwaliteitsverlies bij rosé dan bij vrijwel elke andere wijnstijl."
        ),
        "kernbegrippen": [
            "lichtschade-riboflavinereactie",
            "helder-flesglas-kwetsbaarheid",
            "kleinere fenolische antioxidantbuffer",
            "oxidatieve kleurverschuiving roze-naar-koper",
            "structuurafhankelijk bewaartempo",
        ],
        "food_pairing": fp(
            "Een jonge, goed opgeslagen rosé binnen zijn optimale venster van één tot drie jaar bij verse schaaldieren.",
            "De intacte esters en frisheid van een correct bewaarde jonge rosé matchen precies de subtiliteit van vers schaal- en schelpdier.",
            "Een rosé die lang in helder glas onder fel licht heeft gestaan bij hetzelfde gerecht — een beginnende gekookte-koolgeur ondermijnt de subtiliteit direct.",
        ),
        "reflectievraag": (
            "Waar in jouw zaak staat rosé mogelijk te lang blootgesteld aan licht — en welke "
            "concrete aanpassing zou dat risico het snelst verminderen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom is rosé extra kwetsbaar voor lichtschade (goût de lumière)?\n\n"
                "A. Ze wordt vaak in helder glas gebotteld, waardoor riboflavine makkelijker reageert met licht ✅  \n"
                "B. Ze bevat altijd meer suiker dan andere wijn  \n"
                "C. Ze wordt nooit met een kurk gesloten  \n"
                "D. Ze bevat geen riboflavine"
            ),
        },
    },
    34: {
        "theorie": (
            "De meeste rosé is terecht bedoeld om jong gedronken te worden — maar "
            "'meeste' is geen 'alle', en het onderscheid volgt direct uit het "
            "fenolische fundament dat in de vorige lessen is opgebouwd. Rosé's met "
            "reëel bewaarpotentieel (Bandol, Tavel, enkele premium Rosado's) delen "
            "precies de kenmerken die in les 28–29 en 33 al naar voren kwamen: meer "
            "structuur uit een hoger Mourvèdre- of Grenache-aandeel, meer fenolische "
            "extractie door langer schilcontact of bewuste perswijnmenging, en dus een "
            "grotere natuurlijke antioxidantbuffer.\n\n"
            "Wat er tijdens rijping ontwikkelt, verschilt van zowel rode als witte wijn "
            "door de beperkte antocyaanpool waarmee rosé start. Bij rode wijn binden "
            "vrije antocyanen geleidelijk aan tannine tot stabielere pigmentpolymeren, "
            "een langzaam proces dat decennia kan duren. Bij rosé is die antocyaanpool "
            "zo veel kleiner dat de visuele overgang van roze naar zalm en uiteindelijk "
            "koper zich veel sneller voltrekt — vaak binnen enkele jaren in plaats van "
            "decennia — en het aromatische eindpunt is ook anders: minder de "
            "leer-en-tabak-tonen van oude rode wijn, meer gedroogd fruit, kruiden en "
            "aardse, savoury tonen die voortbouwen op de kruidigheid uit les 28.\n\n"
            "Bandol rosé is de duidelijkste uitzondering op de vroegdrink-regel: dankzij "
            "het wettelijke Mourvèdre-minimum en de bijbehorende fenolische substantie "
            "kan een goede Bandol rosé vijf tot tien jaar ontwikkelen, een venster dat "
            "voor de meeste andere rosé volledig ontbreekt.\n\n"
            "Belangrijk is dat structuur niet automatisch garandeert dat een rosé beter "
            "wordt met tijd — sommige structuurrijke stijlen zijn bewust zo gemaakt dat "
            "ze hun beste venster juist binnen twee tot drie jaar bereiken. Rijpings-"
            "potentieel moet daarom per fles worden ingeschat op basis van het "
            "onderliggende fenolische fundament, niet aangenomen op basis van regio of "
            "prijs alleen.\n\n"
            "Praktisch betekent dit een bewuste segmentatie: vroegdrinkstijlen "
            "(Provence, Chiaretto, de meeste Rosado) binnen één tot drie jaar consumeren, "
            "en structuurrijke uitzonderingen (Bandol, Tavel, geselecteerde premium "
            "cuvées) bewust apart houden voor een langer venster — zodat geen enkele "
            "fles per ongeluk te vroeg of te laat wordt geopend."
        ),
        "samenvatting": (
            "- Rijpingspotentieel volgt direct uit hetzelfde fenolische fundament als structuur en bewaring (les 28–29, 33)\n"
            "- De kleine antocyaanpool van rosé laat de kleur veel sneller verschuiven dan bij rode wijn (jaren in plaats van decennia)\n"
            "- Rijpe rosé ontwikkelt gedroogd fruit, kruiden en aardse tonen — een ander eindpunt dan oude rode wijn\n"
            "- Bandol rosé kan dankzij het Mourvèdre-minimum vijf tot tien jaar ontwikkelen\n"
            "- Structuur garandeert geen rijpingspotentieel automatisch — beoordeel per fles op fenolisch fundament"
        ),
        "pro_insight": (
            "Vraag bij elke structuurrijke rosé expliciet naar het Mourvèdre- of "
            "Grenache-aandeel en het schilcontact vóór je bewaaradvies geeft — regio of "
            "prijs alleen zijn onvoldoende bewijs voor rijpingspotentieel."
        ),
        "kernbegrippen": [
            "beperkte antocyaanpool-rosé",
            "kleurtransitie roze-naar-koper versnelde tijdlijn",
            "Bandol-bewaarcapaciteit vijf-tot-tien-jaar",
            "fenolisch-fundament-als-rijpingsbewijs",
            "vroegdrink-versus-uitzonderingssegmentatie",
        ],
        "food_pairing": fp(
            "Een vijf jaar oude Bandol rosé met kruidige, gedroogd-fruittonen bij gestoofde kip met olijven.",
            "De ontwikkelde kruiden- en gedroogd-fruittonen van de gerijpte rosé spiegelen de langzaam gegaarde, savoury smaken van het stoofgerecht.",
            "Een jonge, bleke Provence lang laten liggen in de hoop op ontwikkeling — het beperkte fenolische fundament stort dan eerder in dan dat het complexiteit opbouwt.",
        ),
        "reflectievraag": (
            "Welke fles rosé in jouw assortiment zou jij, op basis van haar fenolisch "
            "fundament, bewust apart leggen voor een langer bewaarvenster — en welke zou je "
            "juist versneld willen verkopen vóórdat ze haar venster mist?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom verschuift de kleur van rosé sneller met de tijd dan die van rode wijn?\n\n"
                "A. Rosé start met een veel kleinere antocyaanpool, waardoor dezelfde chemische route sneller zichtbaar wordt ✅  \n"
                "B. Rosé bevat nooit antocyanen  \n"
                "C. Rosé wordt altijd warmer bewaard dan rode wijn  \n"
                "D. Rosé heeft geen kurk nodig"
            ),
        },
    },
    35: {
        "theorie": (
            "Salades lijken op het eerste gezicht het makkelijkste pairingterrein, maar "
            "zijn technisch een van de lastigste categorieën — en rosé wint dit terrein "
            "via een specifiek zuurmatchingmechanisme dat de meeste andere wijnstijlen "
            "missen. Vinaigrettedressing bevat overwegend azijnzuur, een aanzienlijk "
            "scherper en vluchtiger zuur dan het wijnzuur en appelzuur dat in wijn "
            "domineert. Als de wijn zelf onvoldoende zuurgraad heeft, ontstaat een "
            "asymmetrisch contrast: de dressing 'wint' het zuurgesprek, en de wijn "
            "proeft daardoor plat en substantieloos, ongeacht hoe goed diezelfde wijn "
            "zonder dressing zou proeven.\n\n"
            "Rosé's geblokkeerde appelzuur-melkzuurgisting (les 26) houdt precies die "
            "hoge, rechte zuurgraad in stand die nodig is om tegen azijnzuur op te "
            "wegen — een eigenschap die de meeste rode wijnen missen, omdat rode wijn "
            "vrijwel altijd wél volledige appelzuur-melkzuurgisting ondergaat en dus "
            "structureel ronder, minder scherp zuur heeft.\n\n"
            "Bladgroenten voegen een tweede mechanisme toe: bittere groenten zoals "
            "rucola en radicchio bevatten chlorofyl en andere bittere verbindingen die "
            "in combinatie met tannine de bitterheidsperceptie versterken — een bekende "
            "valkuil bij lichte rode wijn bij salades. Omdat de bleke en fruitige "
            "roséstijlen (les 26–27) vrijwel geen tannine bevatten dankzij hun korte "
            "schilcontact, ontwijkt rosé deze bitterheidsval structureel, terwijl zelfs "
            "de lichtste rode wijn er gevoelig voor blijft.\n\n"
            "Vet uit kaas of noten in een salade vraagt bovendien enig lichaam om niet "
            "weggedrukt te worden — precies waar de bodyas uit les 29 relevant wordt: "
            "een salade met geitenkaas of walnoten kan een net iets vollere rosé "
            "(medium body) beter dragen dan de allerlichtste stijl.\n\n"
            "Rosé werkt bij salades dus niet 'omdat het toevallig licht en fris is', "
            "maar omdat haar specifieke combinatie van hoge, ongeronde zuurgraad en "
            "vrijwel afwezig tannine precies de twee grootste pairingvallen van "
            "salades — zuurasymmetrie en tannine-chlorofylbitterheid — tegelijk "
            "vermijdt."
        ),
        "samenvatting": (
            "- Vinaigrette bevat azijnzuur, scherper dan het wijnzuur/appelzuur in wijn — onvoldoende zuur in de wijn geeft een plat resultaat\n"
            "- Geblokkeerde appelzuur-melkzuurgisting houdt rosé's zuurgraad hoog genoeg om tegen azijnzuur op te wegen\n"
            "- Chlorofyl in bittere bladgroenten versterkt bitterheid in combinatie met tannine — een valkuil die tanninearme rosé vermijdt\n"
            "- Vet uit kaas of noten in een salade vraagt om iets meer lichaam (medium body) dan de allerlichtste rosé\n"
            "- Rosé vermijdt bij salades tegelijk zuurasymmetrie én tannine-chlorofylbitterheid — twee aparte pairingvallen"
        ),
        "pro_insight": (
            "Vraag bij een salade eerst naar het type dressing (azijn- versus "
            "citruszuur) vóór je een rosé kiest — dat bepaalt direct hoeveel zuurgraad "
            "de wijn nodig heeft om niet plat te proeven."
        ),
        "kernbegrippen": [
            "azijnzuur-versus-wijnzuur-asymmetrie",
            "chlorofyl-tanninebitterheid-valkuil",
            "geblokkeerde-gisting-als-pairingtroef",
            "vetgehalte-lichaamsmatch-salade",
            "dubbele-pairingvalvermijding",
        ],
        "food_pairing": fp(
            "Een geitenkaassalade met walnoten en een citrusvinaigrette bij een medium body Provence of Navarra rosado.",
            "De hoge zuurgraad van de rosé matcht de dressing zonder plat te worden, terwijl het iets vollere lichaam het vet van kaas en noten opvangt.",
            "Een zeer bittere rucolasalade bij een tanninerijke rode wijn — chlorofyl en tannine versterken elkaars bitterheid tot een onaangename combinatie.",
        ),
        "reflectievraag": (
            "Welke salade op jouw kaart lijkt lastig te pairen — en welk mechanisme "
            "(zuurasymmetrie of chlorofylbitterheid) verklaart waarom rosé daar beter werkt "
            "dan het automatische witte of rode alternatief?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom werkt rosé vaak beter dan lichte rode wijn bij een salade met rucola of radicchio?\n\n"
                "A. Rosé bevat vrijwel geen tannine, waardoor de chlorofyl-tanninebitterheid wordt vermeden ✅  \n"
                "B. Rosé bevat altijd meer suiker  \n"
                "C. Rosé heeft nooit zuur  \n"
                "D. Rode wijn bevat geen chlorofyl"
            ),
        },
    },
    36: {
        "theorie": (
            "Dat rosé opmerkelijk goed werkt bij vis, is geen toevalstreffer maar het "
            "resultaat van een specifiek chemisch mechanisme dat rode wijn structureel "
            "mist en witte wijn slechts gedeeltelijk biedt. Rode wijn en vis vormen "
            "vaak een beruchte mismatch: het ijzer in visvet en de trimethylamine-"
            "verbindingen die vis hun kenmerkende geur geven, reageren met tannine en "
            "polyfenolen tot een onaangename metaalachtige, versterkt visserige "
            "bijsmaak — een reactie die food-science-onderzoek naar wijn-visparingen "
            "herhaaldelijk heeft bevestigd.\n\n"
            "Rosé's fenolische fundament is, dankzij het korte tot gematigde "
            "schilcontact uit les 26–28, precies laag genoeg om die ijzer-tannine-"
            "reactie te vermijden — vergelijkbaar met witte wijn op dat punt — maar "
            "hoog genoeg om, in tegenstelling tot de meeste zuiver aromatische witte "
            "wijn, een lichte tastbare textuur te bieden die vettere vissoorten nodig "
            "hebben om niet flets te proeven naast de wijn.\n\n"
            "Die textuurbehoefte schaalt direct met het vetgehalte van de vis: lichte, "
            "magere vis en rauwe bereidingen (gegrilde dorade, ceviche, tonijntartaar) "
            "werken het best met de bleke, hoogzure stijl uit les 26, waar precisie en "
            "frisheid vooropstaan. Vettere vis (zalm, tonijnsteak, mediterrane "
            "visgerechten met olijfolie) vraagt de iets vollere, medium body stijl uit "
            "les 29, waar het extra lichaam het extra visvet in balans houdt zonder de "
            "wijn te laten verdwijnen.\n\n"
            "Tonijn is hierbij de meest geciteerde topcombinatie, en niet zonder reden: "
            "het is vet genoeg om lichaam te vragen, maar de vleesachtige, bijna "
            "steakachtige textuur van tonijn tolereert bovendien de lichte fenolische "
            "grip van een structuurrijkere rosé beter dan delicatere vissoorten dat "
            "zouden doen — een combinatie waarin rosé letterlijk de brug vormt tussen "
            "de frisheid die vis normaal vraagt en het lichaam dat vlees normaal "
            "vraagt.\n\n"
            "Dat dubbele voordeel — geen ijzer-tannine-risico, wél voldoende textuur "
            "voor vettere vis — verklaart waarom rosé bij visgerechten vaak overtuigender "
            "presteert dan zowel een zuiver aromatische witte wijn als een lichte rode "
            "wijn."
        ),
        "samenvatting": (
            "- IJzer en trimethylamine in visvet reageren met tannine tot een metaalachtige, versterkt visserige bijsmaak — een bekend risico bij rode wijn\n"
            "- Rosé's lage fenolgehalte vermijdt die ijzer-tannine-reactie net als witte wijn\n"
            "- Rosé biedt tegelijk net genoeg textuur voor vettere vis, iets wat zuiver aromatische witte wijn vaak mist\n"
            "- Magere, rauwe vis vraagt de bleke, hoogzure stijl; vettere vis vraagt de vollere, medium body stijl\n"
            "- Tonijn combineert vetgehalte met een vleesachtige textuur die de lichte grip van structuurrijkere rosé goed verdraagt"
        ),
        "pro_insight": (
            "Vraag bij visgerechten eerst naar het vetgehalte van de vis vóór je tussen "
            "een bleke of vollere rosé kiest — dat ene detail voorkomt zowel een te "
            "magere als een te logge match."
        ),
        "kernbegrippen": [
            "ijzer-tannine-visreactie",
            "trimethylamine-visgeur",
            "fenolische textuurgrip-vis",
            "vetgehalte-visschaal",
            "tonijn-brugcategorie",
        ],
        "food_pairing": fp(
            "Tonijnsteak of gegrilde zalm bij een medium body rosé zoals een Cinsault-gedreven Rosado.",
            "Het extra lichaam van de rosé matcht het visvet, terwijl de afwezigheid van zware tannine de klassieke ijzer-tannine-mismatch met vis volledig vermijdt.",
            "Diezelfde vettere vis bij een tanninerijke rode wijn — de combinatie van visvet en tannine riskeert een metaalachtige, onaangename bijsmaak.",
        ),
        "reflectievraag": (
            "Bij welk visgerecht op je kaart adviseer je nu automatisch witte wijn — en zou "
            "een rosé met net iets meer lichaam daar een betere textuurmatch bieden?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom kan rode wijn bij vette vis een metaalachtige bijsmaak veroorzaken?\n\n"
                "A. IJzer en trimethylamine in het visvet reageren met tannine en polyfenolen ✅  \n"
                "B. Vis bevat altijd suiker  \n"
                "C. Rode wijn bevat geen zuur  \n"
                "D. Vis bevat geen eiwit"
            ),
        },
    },
    37: {
        "theorie": (
            "Barbecue is een van de meest veeleisende pairingcategorieën omdat ze vier "
            "mechanismen tegelijk activeert — rook, vet, kruiden en Maillard-geroosterde "
            "korstvorming — en rosé blijkt, meer dan rode wijn, in staat om alle vier "
            "tegelijk te bedienen zonder dat er één domineert.\n\n"
            "De Maillard-reactie op het geschroeide oppervlak van gegrild vlees vormt "
            "onder meer guaiacol en verwante fenolische rookverbindingen. Kruidige rosé "
            "(les 28), met haar rotundone- en garrigue-gedreven aromatiek, vangt die "
            "rooktonen aromatisch op via dezelfde fenolische familie — een directe "
            "aroma-op-aroma-brug, vergelijkbaar met het mechanisme waarmee houtgelagerde "
            "rode wijn resoneert met geroosterd vlees, maar dan zonder de zware "
            "tanninelast die rode wijn daarbij meebrengt.\n\n"
            "Dat ontbreken van zware tannine is cruciaal bij zoete barbecuesauzen en "
            "glazuren: suiker versterkt de perceptie van bitterheid en astringentie van "
            "tannine, wat een klassieke mismatch veroorzaakt tussen tanninerijke rode "
            "wijn en zoete glazuren. Rosé's beperkte tanninegehalte omzeilt dat risico "
            "structureel, terwijl haar eigen, van nature aanwezige rijpheid (les 27) de "
            "zoetheid van een glazuur juist kan spiegelen in plaats van ertegen te "
            "botsen.\n\n"
            "Vet in gegrild vlees en groenten wordt, net als bij andere pairings in deze "
            "module, door zuur gesneden — en rosé's zuurgraad blijft ook bij warmere "
            "barbecuegerechten hoger dan die van de meeste rode wijn, dankzij dezelfde "
            "vroege oogst en geblokkeerde appelzuur-melkzuurgisting die in les 26 en 35 "
            "al naar voren kwamen.\n\n"
            "Het resultaat is een categorie waarin rosé — mits met voldoende body "
            "gekozen (Tavel, Bandol, Syrah-gedreven rosé) — vaak veelzijdiger werkt dan "
            "rode wijn: ze bedient rook via aroma, vet via zuur, en zoete glazuren via "
            "afwezigheid van tannine, drie afzonderlijke mechanismen die bij rode wijn "
            "elkaar regelmatig in de weg zitten."
        ),
        "samenvatting": (
            "- Barbecue activeert rook, vet, kruiden en Maillard-korstvorming tegelijk — vier aparte pairingmechanismen\n"
            "- Guaiacol en fenolische rookverbindingen resoneren met de rotundone- en garriguetonen van kruidige rosé\n"
            "- Suiker versterkt tanninebitterheid — rosé's lage tanninegehalte omzeilt de klassieke mismatch met zoete glazuren\n"
            "- Rosé's hogere zuurgraad snijdt vet effectiever dan de gemiddelde rode wijn bij dezelfde temperatuur\n"
            "- Rosé bedient rook, vet en zoete glazuren via drie aparte mechanismen die elkaar bij rode wijn vaker in de weg zitten"
        ),
        "pro_insight": (
            "Kies bij een zoet glazuur op gegrild vlees bewust een fruitige of kruidige "
            "rosé in plaats van een tanninerijke rode wijn — dat vermijdt de bekende "
            "suiker-tanninebitterheidsval volledig."
        ),
        "kernbegrippen": [
            "guaiacol-rooktoonresonantie",
            "suiker-tanninebitterheidsrisico",
            "zuurgedreven vetdoorsnijding",
            "viervoudig-barbecuemechanisme",
            "tanninevrije-glazuurveiligheid",
        ],
        "food_pairing": fp(
            "Gegrilde kip met een zoet-kruidig glazuur bij een kruidige Bandol of Syrah-gedreven rosé.",
            "De rook- en kruidentonen resoneren met de rotundone in de wijn, terwijl het lage tanninegehalte de klassieke suiker-tanninebitterheid bij het glazuur vermijdt.",
            "Datzelfde glazuur bij een stevig gehoute, tanninerijke rode wijn — de combinatie van suiker en tannine riskeert een bittere, onaangename nasmaak.",
        ),
        "reflectievraag": (
            "Bij welk barbecuegerecht op je kaart met een zoet glazuur adviseer je nu "
            "automatisch rode wijn — en zou rosé daar de suiker-tanninebitterheidsval "
            "vermijden?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom werkt een zoet barbecueglazuur vaak beter met rosé dan met tanninerijke rode wijn?\n\n"
                "A. Suiker versterkt de bitterheid en astringentie van tannine, een risico dat tanninearme rosé vermijdt ✅  \n"
                "B. Rosé bevat altijd meer alcohol  \n"
                "C. Rode wijn bevat geen zuur  \n"
                "D. Suiker heeft geen effect op tanninewaarneming"
            ),
        },
    },
    38: {
        "theorie": (
            "Aziatische keuken combineert spice, umami, zoet-zout en zuur vaak "
            "tegelijk, en juist die combinatie maakt rosé fysiologisch en chemisch "
            "veiliger dan zowel rode wijn als hoogalcoholische dranken. Capsaïcine, de "
            "stof achter chilihitte, activeert de TRPV1-receptor — dezelfde receptor die "
            "ook reageert op fysieke hitte. Alcohol versterkt dat TRPV1-signaal "
            "aantoonbaar: hoe hoger het alcoholpercentage en hoe warmer de drank "
            "geserveerd wordt, hoe intenser de brandende sensatie van chili aanvoelt. "
            "Een goed gekoelde, relatief laag-alcoholische rosé (8–11°C, les 31) is "
            "daardoor fysiologisch milder bij pittige gerechten dan een warmer "
            "geserveerde, alcoholrijkere rode wijn.\n\n"
            "De fruitige, sappige stijl (les 27) voegt een tweede, perceptueel "
            "mechanisme toe: een subtiele, van nature aanwezige rijpheid of een lichte "
            "restsuiker helpt de scherpte van capsaïcine te dempen, een effect dat in "
            "sensorisch onderzoek naar zoetheid-en-pikantheid herhaaldelijk is "
            "aangetoond en dat verklaart waarom veel Aziatische keukens zelf al zoet-"
            "zuur-zout combineren om pikantheid te temperen.\n\n"
            "Umami — geconcentreerd in vissaus, sojasaus en miso — versterkt, net als "
            "bij vlees en kaas, de perceptie van bitterheid en een licht metaalachtige "
            "bijsmaak wanneer die umami samen met een tanninerijke wijn geproefd wordt. "
            "Omdat rosé structureel weinig tot geen tannine draagt, ontwijkt ze dit "
            "risico volledig, terwijl rode wijn hier stelselmatig in de problemen komt.\n\n"
            "Praktisch resulteert dit in een duidelijke voorkeursvolgorde: sushi en "
            "poke bowls werken uitstekend met de bleke, hoogzure stijl (frisheid "
            "matcht rauwe vis en rijstazijn), terwijl Thaise curry's en pittige "
            "Vietnamese gerechten meer baat hebben bij de fruitige stijl, waar de "
            "subtiele zoetheid en het lagere tanninerisico samen de meeste bescherming "
            "bieden tegen chili en umami tegelijk.\n\n"
            "Vermijd expliciet zwaar gehoute, structuurrijke rosé bij zeer delicate "
            "Aziatische gerechten: dezelfde fenolische substantie die bij barbecue of "
            "kaas een voordeel is, kan bij subtiele, evenwichtige Aziatische bereidingen "
            "juist te dominant overkomen."
        ),
        "samenvatting": (
            "- Capsaïcine activeert de TRPV1-receptor, en alcohol versterkt dat signaal — laag-alcoholische, gekoelde rosé is milder bij chili\n"
            "- Rijpheid en lichte restsuiker in fruitige rosé dempen perceptueel de scherpte van capsaïcine\n"
            "- Umami versterkt bitterheid en metaalachtigheid bij tannine — rosé's lage tanninegehalte ontwijkt dat risico volledig\n"
            "- Sushi en poke werken goed met de bleke, hoogzure stijl; pittige curry's werken beter met de fruitige stijl\n"
            "- Zwaar gehoute, structuurrijke rosé kan bij delicate Aziatische gerechten juist te dominant overkomen"
        ),
        "pro_insight": (
            "Leg een gast die twijfelt tussen rood en rosé bij een pittig gerecht het "
            "TRPV1-mechanisme uit: lager alcohol en een koelere temperatuur maken de "
            "chilihitte letterlijk fysiologisch minder intens."
        ),
        "kernbegrippen": [
            "TRPV1-capsaïcinereceptor",
            "alcohol-hitteversterking",
            "umami-tanninerisico vermeden",
            "esterzoetheid-tegen-pikantheid",
            "structuurrijke-rosé-oversturingsrisico",
        ],
        "food_pairing": fp(
            "Thaise rode curry of Vietnamese pittige gerechten bij een fruitige, licht rijpe rosé.",
            "De subtiele zoetheid en lage tanninebasis dempen zowel de capsaïcinescherpte als het umami-tannine-risico tegelijk.",
            "Een zwaar gehoute, structuurrijke rosé bij delicate sushi — de fenolische substantie overstemt de subtiele rauwe vis en rijstazijn.",
        ),
        "reflectievraag": (
            "Bij welk pittig gerecht op je kaart adviseer je nu automatisch rode wijn — en "
            "zou een koelere, laag-alcoholische rosé de chilihitte fysiologisch milder "
            "maken?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom voelt chilihitte milder aan bij een koele, laag-alcoholische rosé dan bij een warmere, alcoholrijke rode wijn?\n\n"
                "A. Alcohol en warmte versterken beide het TRPV1-receptorsignaal dat capsaïcine activeert ✅  \n"
                "B. Rosé bevat nooit capsaïcine  \n"
                "C. Rode wijn bevat geen alcohol  \n"
                "D. Chili heeft geen effect op wijnperceptie"
            ),
        },
    },
    39: {
        "theorie": (
            "Charcuterie combineert zout, vet, kruiden en umami in een concentratie die "
            "de meeste wijnstijlen op minstens één punt laat struikelen — en rosé's "
            "specifieke combinatie van eigenschappen pakt precies de twee grootste "
            "risico's tegelijk aan.\n\n"
            "Het eerste risico is puur chemisch: natriumchloride (zout) interageert met "
            "de trigeminale waarneming van tannine en kan de perceptie van "
            "astringentie versterken, waardoor stevig tanninerijke rode wijn naast zeer "
            "zoute charcuterie ruwer en harder kan aanvoelen dan diezelfde wijn zonder "
            "eten. Rosé's structureel lage tot matige tanninegehalte (les 26–29) omzeilt "
            "dit risico grotendeels, terwijl geconcentreerd gezouten producten zoals "
            "prosciutto of salami bij een tanninerijke rode wijn dit effect juist "
            "uitvergroten.\n\n"
            "Het tweede risico is textuurmatch: het curingproces van charcuterie "
            "concentreert zowel zout als vet, en die combinatie vraagt een wijn met "
            "voldoende zuurgraad om het palet te verfrissen tussen happen door — "
            "hetzelfde principe waarom mousserende wijn en Champagne klassiek bij "
            "charcuterie werken. Rosé's hoge, geblokkeerde zuurgraad (les 26, 35) "
            "vervult die rol, terwijl een zuiver hoogzure witte wijn vaak te weinig "
            "lichaam heeft om het gewicht van vet en zout volledig te dragen — het "
            "fenolische fundament van rosé (les 29) geeft precies de extra textuur die "
            "daarvoor nodig is.\n\n"
            "Umami, sterk aanwezig in gerijpte hammen en terrines, versterkt — net als "
            "bij vlees, kaas en Aziatische gerechten — de perceptie van bitterheid bij "
            "tannine. Ook hier geldt: hoe minder tannine, hoe kleiner het risico, wat "
            "rosé structureel in het voordeel plaatst ten opzichte van zwaardere rode "
            "wijn.\n\n"
            "Het resultaat is een categorie waarin rosé, ondanks haar reputatie als "
            "lichte zomerwijn, technisch beter is toegerust dan veel zwaardere rode "
            "wijn — een van de meest onderschatte pairingcombinaties in de hele "
            "gastronomie."
        ),
        "samenvatting": (
            "- Zout interageert met de trigeminale waarneming van tannine en kan astringentie versterken — rosé's lage tannine omzeilt dit\n"
            "- Curing concentreert zout en vet, wat om voldoende zuurgraad vraagt om het palet te verfrissen\n"
            "- Rosé's fenolische fundament geeft net genoeg textuur om het gewicht van vet en zout te dragen, iets zuivere hoogzure witte wijn soms mist\n"
            "- Umami in gerijpte charcuterie versterkt bitterheid bij tannine — een risico dat rosé grotendeels vermijdt\n"
            "- Rosé is technisch beter toegerust voor charcuterie dan veel zwaardere rode wijn, ondanks haar lichte imago"
        ),
        "pro_insight": (
            "Wijs een gast die automatisch rode wijn bij een charcuterieplank kiest op het "
            "zout-tannine-mechanisme — dat is een concreet, uitlegbaar argument om in plaats "
            "daarvan rosé te adviseren."
        ),
        "kernbegrippen": [
            "zout-tannine-trigeminale-interactie",
            "curingconcentratie vet-en-zout",
            "fenolische-textuur-versus-hoogzure-witte-wijn",
            "umami-tanninerisico-charcuterie",
            "onderschatte-charcuteriecategorie",
        ],
        "food_pairing": fp(
            "Prosciutto, salami en jamón op een charcuterieplank bij een medium body, kruidige rosé.",
            "De hoge zuurgraad verfrist het palet tussen happen door, terwijl het lage tanninegehalte de zout-tannine-verharding vermijdt die zwaardere rode wijn hier zou veroorzaken.",
            "Een stevig tanninerijke, jonge rode wijn bij zeer zoute, gerijpte ham — zout en umami versterken samen de tanninebitterheid tot een ruwe, onaangename combinatie.",
        ),
        "reflectievraag": (
            "Bij welke charcuterieplank op je kaart adviseer je nu standaard rode wijn — en "
            "zou het zout-tannine-mechanisme een overstap naar rosé rechtvaardigen?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Waarom kan zoute charcuterie een tanninerijke rode wijn ruwer laten aanvoelen?\n\n"
                "A. Zout interageert met de trigeminale waarneming van tannine en versterkt astringentie ✅  \n"
                "B. Zout verwijdert alle tannine uit de wijn  \n"
                "C. Charcuterie bevat geen vet  \n"
                "D. Rode wijn bevat geen tannine"
            ),
        },
    },
    40: {
        "theorie": (
            "Dat toprestaurants rosé steeds vaker serieus inzetten, is het directe "
            "gevolg van specifieke technische ingrepen die de meeste basic rosé niet "
            "krijgt: verlengd lees-contact met batonnage (les 29) voor extra textuur, "
            "en bij een klein aantal prestigecuvées zelfs gedeeltelijke vatgisting — een "
            "techniek die tot voor kort vrijwel uitsluitend aan witte en rode wijn werd "
            "voorbehouden.\n\n"
            "Château d'Esclans' 'Garrus', gemaakt van oude Grenache- en Rolle-wijnstokken "
            "en vergist en gerijpt op eikenhouten vaten met regelmatige lees-roering, "
            "geldt als het duidelijkste precedent: een rosé die qua textuur, "
            "concentratie en prijssegment rechtstreeks concurreert met serieuze witte "
            "en rode Grand Cru-stijlen, en die bewees dat rosé op het hoogste "
            "gastronomische niveau kan meespelen zonder haar herkenbare frisheid en "
            "roze kleur te verliezen.\n\n"
            "Die techniek maakt rosé geschikt voor een dubbelregister dat maar weinig "
            "andere wijnstijlen bedienen: de delicate zoetheid en frisheid van "
            "schaaldieren zoals langoustine en kreeft vragen precisie en zuurgraad — "
            "precies wat het onderliggende fundament uit les 26 en 35 biedt — terwijl "
            "rijkere, umami-gedreven gerechten zoals truffel of kalfsvlees juist "
            "textuur en fenolische substantie vragen — precies wat de vatgisting en "
            "batonnage-techniek uit deze les toevoegen. Eén en dezelfde fles kan "
            "daardoor, mits met precisie gekozen, beide registers bedienen op een "
            "manier waarop een puur licht witte wijn (te weinig textuur voor truffel) "
            "of een puur krachtige rode wijn (te veel tannine voor langoustine) allebei "
            "zouden struikelen.\n\n"
            "Dat vraagt wel precisie: niet elke prestige-rosé is voor elk gerecht "
            "geschikt, en de keuze moet expliciet teruggrijpen op de structuur- en "
            "fenolanalyse uit lessen 26–29 in plaats van te vertrouwen op prijs of "
            "reputatie van het huis alleen.\n\n"
            "Deze techniek en dit precedent samen tonen aan dat 'rosé in fine dining' "
            "geen marketingclaim is maar een aantoonbare, herhaalbare productielogica — "
            "het sluitstuk van de identiteitsredenering die deze hele module heeft "
            "opgebouwd."
        ),
        "samenvatting": (
            "- Verlengd lees-contact met batonnage en, bij enkele prestigecuvées, gedeeltelijke vatgisting geven premium rosé extra textuur\n"
            "- Château d'Esclans' Garrus is het duidelijkste precedent dat rosé op Grand Cru-niveau kan meespelen\n"
            "- Premium rosé bedient een dubbelregister: precisie voor delicate schaaldieren én textuur voor rijke, umami-gedreven gerechten\n"
            "- Eén fles kan beide registers bedienen waar puur wit of puur rood vaak op één van de twee struikelt\n"
            "- Fine-dining-keuzes moeten teruggrijpen op de structuur- en fenolanalyse uit lessen 26–29, niet op prijs of reputatie alleen"
        ),
        "pro_insight": (
            "Noem Garrus of een vergelijkbare vatgegiste, lees-geroerde rosé expliciet als "
            "referentie wanneer een gast twijfelt of rosé wel 'serieus genoeg' is voor een "
            "fine-diningmenu."
        ),
        "kernbegrippen": [
            "Garrus-prestigeprecedent",
            "vatgisting-en-batonnage-rosé",
            "dubbelregister schaaldier-en-wildgerecht",
            "textuur-op-maat-techniek",
            "precisiekeuze-boven-reputatie",
        ],
        "food_pairing": fp(
            "Langoustine als voorgerecht en kalfsvlees met truffel als hoofdgerecht, beide met dezelfde vatgegiste, lees-geroerde prestige-rosé.",
            "De precisie en zuurgraad van de rosé dragen de delicate langoustine, terwijl haar textuur uit vatgisting en batonnage het umami-gewicht van truffel en kalf opvangt.",
            "Een basic, bleke rosé zonder lees-contact bij hetzelfde truffelgerecht — het ontbrekende fenolische fundament laat de wijn volledig wegvallen naast die intensiteit.",
        ),
        "reflectievraag": (
            "Bij welk fine-dininggerecht op je kaart zou jij nu een premium, vatgegiste "
            "rosé durven voorstellen in plaats van het automatische witte of rode "
            "alternatief?"
        ),
        "quiz_patches": {
            5: (
                "### Vraag 5\n\n"
                "Wat maakt een prestigecuvée zoals Garrus geschikt voor fine dining?\n\n"
                "A. Vatgisting en lees-batonnage geven extra textuur die rijkere gerechten kan dragen ✅  \n"
                "B. Een zeer hoog restsuikergehalte  \n"
                "C. Volledige afwezigheid van zuur  \n"
                "D. Uitsluitend gebruik van witte druiven"
            ),
        },
    },
    41: {
        "theorie": (
            "Provence versus Tavel blind vormt de fundamentele roséverglijking, "
            "precies omdat de twee stijlen tegenovergestelde eindpunten zijn van "
            "dezelfde productie-as die in module 6 is opgebouwd — schilcontactduur, "
            "perswijnmenging en druivensamenstelling. De vaste deductieketen "
            "kleur-aroma-zuur-lichaam-textuur legt dat verschil systematisch bloot.\n\n"
            "Kleur is de eerste, meest zichtbare aanwijzing: Provence toont een extreem "
            "bleke, 'oeil de perdrix'-achtige tint (les 26, kort schilcontact, direct "
            "press), terwijl Tavel een merkbaar dieper, zalm-tot-oranjeroze kleur "
            "vertoont — het directe gevolg van de langere maceratie en de bewuste "
            "menging van perswijn met vrijloopsap die uniek is voor de Tavel-appellatie "
            "(les 29).\n\n"
            "Op de neus bevestigt zich dat verschil: Provence toont citrus, rode bes en "
            "een mineraal register; Tavel toont rijper steenfruit, gedroogde kruiden en "
            "specerij — een aromatisch profiel dat dichter bij de kruidige stijl uit "
            "les 28 ligt dan bij de bleke stijl. Zuurgraad blijft bij beide hoog, maar "
            "voelt bij Provence strakker en rechter aan (geblokkeerde appelzuur-"
            "melkzuurgisting, vroege oogst), terwijl Tavel's zuur ronder en rijper "
            "overkomt door de hogere Grenache-concentratie en iets latere oogst.\n\n"
            "Het beslissende tastsignaal is echter lichaam en textuur, niet kleur: "
            "Tavel toont, dankzij de perswijnmenging, een lichte maar duidelijk "
            "waarneembare grip op de afdronk — een structuurniveau dat je bij Provence "
            "vrijwel nooit tegenkomt. Die grip is de meest betrouwbare, minst "
            "dubbelzinnige aanwijzing in deze vergelijking, precies zoals tanninegrip "
            "in het rode-wijn-blindproeven de doorslag gaf tussen Pinot Noir en "
            "Nebbiolo ondanks vergelijkbare kleur.\n\n"
            "Train daarom ook hier het hypothese-vóór-onthullingsprotocol: benoem eerst "
            "kleurintensiteit, dan aromaregister, dan zuurkarakter, dan lichaam, en pas "
            "als laatste de tastbare grip op de afdronk — vóórdat het etiket onthuld "
            "wordt."
        ),
        "samenvatting": (
            "- Kleur, aroma, zuur, lichaam en textuur vormen de vaste deductieketen voor deze vergelijking\n"
            "- Provence: extreem bleek, citrus-mineraal, strak zuur, licht lichaam, geen grip\n"
            "- Tavel: dieper zalmroze, rijper steenfruit en kruiden, ronder zuur, voller lichaam\n"
            "- De lichte maar waarneembare grip op de afdronk van Tavel — uit de perswijnmenging — is het beslissende tastsignaal\n"
            "- Train het hypothese-vóór-onthullingsprotocol: kleur, aroma, zuur, lichaam, dan pas textuur, vóór het etiket"
        ),
        "pro_insight": (
            "Leg bij elke blindronde je conclusie eerst vast op basis van de grip op de "
            "afdronk vóórdat je naar kleur alleen kijkt — kleur is bij Provence versus "
            "Tavel een sterke aanwijzing, maar de grip is het sluitende bewijs."
        ),
        "kernbegrippen": [
            "perswijngrip-als-tastsignaal",
            "oeil-de-perdrix-kleurreferentie",
            "kleur-aroma-zuur-lichaam-textuurketen",
            "Tavel-afdronkgrip",
            "hypothese-vóór-onthullingsprotocol",
        ],
        "food_pairing": fp(
            "Provence bij oesters of een lichte salade, Tavel bij lamskotelet of gekruide kip — afhankelijk van de uitkomst van de blindproef.",
            "Beide combinaties gebruiken exact de structuur die de blindproef blootlegt: precisie en zuur bij Provence, lichaam en kruidigheid bij Tavel.",
            "Een zware, kruidige hoofdgerecht bij Provence serveren — het lichte lichaam en de afwezige grip verpletteren dan niet het gerecht, maar worden er zelf door verpletterd.",
        ),
        "reflectievraag": (
            "Bij je laatste blindronde Provence versus Tavel: vertrouwde je eerst op kleur "
            "of op de grip op de afdronk — en welke volgorde gaf je de meest betrouwbare "
            "conclusie?"
        ),
    },
    42: {
        "theorie": (
            "Rosé versus lichte rode wijn blind is moeilijker dan de meeste proevers "
            "verwachten, precies omdat kleurintensiteit hier volledig kan overlappen: "
            "een structuurrijke, diepgekleurde Tavel kan visueel dichter bij een lichte "
            "Pinot Noir liggen dan bij een bleke Provence. Dat maakt deze vergelijking "
            "het ultieme bewijs van de these die deze hele module heeft opgebouwd: "
            "kleurdiepte en tanninegehalte zijn bij rosé structureel ontkoppelde "
            "variabelen, terwijl ze bij rode wijn juist gekoppeld zijn aan dezelfde "
            "maceratieduur.\n\n"
            "De reden ligt in het productieproces zelf, niet in de druif. Zelfs de "
            "lichtste rode wijn (Pinot Noir, Gamay) fermenteert dagen tot weken volledig "
            "op de schillen — fermentatie-op-schillen is per definitie de kern van rode "
            "wijnproductie. Rosé daarentegen wordt van de schillen gescheiden vóór of "
            "zeer vroeg in de gisting; de fermentatieduur op de schillen is bij rosé per "
            "definitie vrijwel nul, ongeacht hoe lang het voorafgaande schilcontact "
            "(en dus de kleurextractie) heeft geduurd. Kleur ontstaat bij rosé dus in "
            "het persmoment, tannine ontstaat bij rode wijn juist tijdens de "
            "daaropvolgende fermentatie — twee wezenlijk verschillende stappen in het "
            "proces.\n\n"
            "Dat verklaart waarom zelfs de meest geconcentreerde, diepgekleurde rosé — "
            "inclusief Tavel met haar perswijnmenging — structureel minder tannine "
            "behoudt dan zelfs de lichtste volledig op schillen gefermenteerde rode "
            "wijn. Tanninegrip en textuur blijven daarom het beslissende, "
            "ontkoppelbewijzende criterium, niet kleur: rosé voelt zijdezachter en "
            "korter aan op de afdronk, terwijl zelfs lichte rode wijn een merkbaar "
            "langere, drogere grip toont door haar volledige extractie en fermentatie "
            "op de schillen.\n\n"
            "Overeenkomsten in rood fruit, frisse zuren en lichte lichaamsindruk maken "
            "deze vergelijking op geur en eerste indruk misleidend gelijkend — precies "
            "waarom getrainde proevers hier bewust eerst op textuur en grip focussen "
            "in plaats van op kleur, geur of lichaam alleen.\n\n"
            "Koude, lichte rode wijn wordt in de praktijk daarom regelmatig verward met "
            "krachtige rosé, en omgekeerd — een fout die zich alleen laat corrigeren "
            "door bewust het persmoment-versus-fermentatieduur-onderscheid als "
            "primair criterium te gebruiken, niet als secundaire bevestiging."
        ),
        "samenvatting": (
            "- Zelfs de lichtste rode wijn fermenteert volledig op de schillen; rosé wordt er vóór of vroeg in de gisting van gescheiden\n"
            "- Kleur ontstaat bij rosé in het persmoment, tannine ontstaat bij rode wijn tijdens de fermentatie — twee aparte stappen\n"
            "- Zelfs geconcentreerde rosé zoals Tavel behoudt structureel minder tannine dan de lichtste volledig gefermenteerde rode wijn\n"
            "- Tastgrip op de afdronk is het beslissende criterium, niet kleur, geur of lichaam\n"
            "- Koude lichte rode wijn en krachtige rosé worden in de praktijk regelmatig verward zonder dit criterium"
        ),
        "pro_insight": (
            "Vertrouw bij twijfel tussen rosé en lichte rode wijn nooit op kleur alleen — "
            "vraag jezelf expliciet af of de fermentatie op de schillen wel of niet heeft "
            "plaatsgevonden, en laat de tastgrip die vraag beantwoorden."
        ),
        "kernbegrippen": [
            "fermentatie-op-schillen-nul-bij-rosé",
            "ontkoppelde kleur-tanninelogica",
            "tastgrip-als-scheidingscriterium",
            "persmoment-versus-fermentatieduur",
            "structurele-categorieverwarring-in-de-praktijk",
        ],
        "food_pairing": fp(
            "Een krachtige Tavel naast een lichte, koel geserveerde Pinot Noir bij dezelfde zalmtartaar.",
            "Beide combinaties tonen hoezelfde gerecht via een ander mechanisme werkt: de Tavel via lichaam en lichte grip, de Pinot Noir via fijne tannine en fermentatie-op-schillen-textuur.",
            "Een zeer krachtige, tanninerijke rode wijn bij dezelfde zalmtartaar — de volledige fermentatie op de schillen geeft een tanninelast die de delicate vis verpletterd.",
        ),
        "reflectievraag": (
            "Bij je laatste vergelijking tussen rosé en lichte rode wijn: welk signaal "
            "(kleur of tastgrip) gaf je de meeste zekerheid, en waarom is dat het "
            "betrouwbaarste bewijs?"
        ),
    },
    43: {
        "theorie": (
            "Dit Master-examen integreert de volledige Rosé Track: fundament, "
            "productie, proeftechniek, klassieke stijlen, druivenrassen, stijl- en "
            "gastronomiediepte, professionele service, pairingmechanismen en "
            "blindanalyse. De rode draad door alle negen modules is de identiteitsthese "
            "die in module 6 werd geformuleerd: rosé is geen verdunde rode wijn en geen "
            "gezoete witte wijn, maar een eigen categorie waarin kleur en tanninegehalte "
            "onafhankelijk stuurbare variabelen zijn — het persmoment bepaalt de kleur, "
            "terwijl de fermentatieduur op de schillen bij rosé per definitie vrijwel "
            "nul is.\n\n"
            "Productie legt daarvoor het fundament: schilcontactduur en persmethode "
            "(direct press versus saignée) bepalen kleur en fenolisch fundament "
            "tegelijk, wat zich vertaalt naar drie herkenbare stijlfamilies — bleke, "
            "protectief gevinifieerde stijlen (Provence, Chiaretto) die op zuur en "
            "esters drijven; fruitige, sappige stijlen (Grenache-gedreven Rosado, "
            "Nieuwe Wereld) die op rijpheid en soms lichte restsuiker drijven; en "
            "kruidige, structuurrijkere stijlen (Bandol, Tavel) die op rotundone, "
            "garrigue-invloed en perswijnmenging drijven.\n\n"
            "Service bouwt daarop voort: temperatuur en glaskeuze schalen beide met het "
            "fenolische fundament van de stijl, bewaring wordt beperkt door een kleine "
            "antocyaanpool en verhoogde lichtgevoeligheid (goût de lumière via helder "
            "flesglas), en rijpingspotentieel is uitzondering, niet regel, voorbehouden "
            "aan stijlen met een aantoonbaar groter fenolisch fundament zoals Bandol.\n\n"
            "Pairing bouwt op onderliggende mechanismen die stelselmatig terugkomen: "
            "zuurmatching bij salades, het vermijden van de ijzer-tanninereactie bij "
            "vis, de suiker-tanninebitterheidsval bij barbecueglazuren, het TRPV1-"
            "mechanisme bij pikante Aziatische gerechten, de zout-tannine-interactie bij "
            "charcuterie, en vatgisting-en-batonnage-techniek als sleutel tot serieuze "
            "fine dining. Blindanalyse integreert dat alles: kleur, aroma, zuur, "
            "lichaam en — als beslissend criterium — tastbare grip, met "
            "persmoment-versus-fermentatieduur als het fundamentele onderscheidende "
            "principe tussen rosé en zelfs de lichtste rode wijn.\n\n"
            "Succesvolle examenkandidaten vermijden drie terugkerende fouten: rosé "
            "behandelen als een verdunde of tussenliggende categorie in plaats van een "
            "eigen productielogica, kleur gebruiken als enige bewijs bij blindproeven "
            "in plaats van tastgrip, en pairingadvies baseren op imago ('rosé is "
            "zomerwijn') in plaats van op het onderliggende mechanisme. Dit examen "
            "beloont expliciete argumentatie boven geraden antwoorden, op elk van de "
            "drie examenonderdelen."
        ),
        "samenvatting": (
            "- Drie examenonderdelen: theorie (kennis), blindproeven (methode), pairing (advieslogica)\n"
            "- Productie en de drie stijlfamilien (bleek, fruitig, kruidig-structuurrijk) vormen het fundament van elke analyse\n"
            "- Service en bewaring bouwen op fenolisch fundament, antocyaanpool en lichtgevoeligheid\n"
            "- Pairing en blindanalyse draaien om mechanismen — tastgrip en fermentatieduur boven kleur alleen\n"
            "- Veelvoorkomende fouten: rosé als tussencategorie zien, op kleur vertrouwen, imago zonder mechanisme citeren"
        ),
        "pro_insight": (
            "Lees examenvragen als servicecases: welke rosé zou je zaterdagavond schenken "
            "bij dit gerecht en deze gast — en welk mechanisme, niet welk imago, onderbouwt "
            "die keuze?"
        ),
        "kernbegrippen": [
            "examenintegratie-rosé",
            "persmoment-versus-fermentatielogica",
            "tastgrip-boven-kleurbewijs",
            "fenolisch-fundament-als-rode-draad",
            "certificering",
        ],
        "food_pairing": fp(
            "Examenonderdeel pairing: kies per gerecht een roséstijl op basis van zuurmatching, ijzer-tannine-vermijding, suiker-tanninerisico of umami-tannine-risico.",
            "Het pairing-examen toetst advieslogica en mechanismen, niet het memoriseren van bekende combinaties.",
            "Eén roséstijl voor alle examengerechten zonder onderbouwing per mechanisme.",
        ),
        "reflectievraag": (
            "Welk examenonderdeel — theorie, blindproeven of pairing — is jouw zwakste "
            "schakel, en welke ene wekelijkse routine zou dat het snelst verbeteren?"
        ),
        "praktijk": (
            "### Examenonderdeel 1 — Theorie (20 vragen)\n\n"
            "Beantwoord de volledige meerkeuzequiz van twintig vragen zonder hulpmiddelen. "
            "Minimaal 70% (14 van de 20) is vereist om te slagen.\n\n"
            "### Examenonderdeel 2 — Blindproeven (2 glazen)\n\n"
            "Analyseer twee rosé's — bij voorkeur uit verschillende structuurcategorieën "
            "(bijvoorbeeld een bleke Provence-stijl en een structuurrijke Tavel of Bandol) "
            "volgens het vaste protocol:\n\n"
            "- kleur en intensiteit\n"
            "- geur (primair, secundair, eventueel tertiair)\n"
            "- zuur, lichaam en tastbare grip op de afdronk\n"
            "- vermoedelijke stijl en regio, met minstens drie argumenten\n"
            "- serviceadvies (temperatuur, glas, bewaarpotentieel)\n\n"
            "### Examenonderdeel 3 — Pairing (3 gerechten)\n\n"
            "Koppel een onderbouwde roséstijl aan elk van de volgende gerechten:\n\n"
            "1. Een salade met een scherpe vinaigrette\n"
            "2. Gegrilde ribs met een zoet-kruidig barbecueglazuur\n"
            "3. Een charcuterieplank met prosciutto en salami\n\n"
            "Motiveer elke keuze via het onderliggende mechanisme (zuurmatching, "
            "suiker-tanninerisico, zout-tannine-interactie) — niet via traditie of imago "
            "alleen.\n\n"
            "### Beoordeling\n\n"
            "- 18–20 goed + correcte blindanalyse = Master Distinction\n"
            "- 15–17 goed = Master Pass\n"
            "- 12–14 goed = Conditional Pass — herhaal de zwakste module\n"
            "- Minder dan 12 goed = Retry\n\n"
            "Bij slagen ontvang je de certificering **Way of Tasting Academy — Rosé "
            "Certified (Master Foundation)**."
        ),
        "quiz_full": (
            "### Vraag 1\n\n"
            "Wat bepaalt bij rosé primair de kleurdiepte?\n\n"
            "A. De duur van het schilcontact vóór het persen ✅  \n"
            "B. Het alcoholpercentage  \n"
            "C. De rijpingstijd op fles  \n"
            "D. De hoeveelheid restsuiker\n\n"
            "### Vraag 2\n\n"
            "Waarom heeft een lichte, bleke rosé weinig tannine?\n\n"
            "A. Kort schilcontact beperkt tegelijk kleur- én tanninextractie ✅  \n"
            "B. Omdat er altijd water wordt toegevoegd  \n"
            "C. Omdat alleen witte druiven gebruikt worden  \n"
            "D. Omdat tannine wordt gefiltreerd na gisting\n\n"
            "### Vraag 3\n\n"
            "Hoe ontstond de eerste populaire White Zinfandel?\n\n"
            "A. Door een gisting die per ongeluk stokte bij ongeveer 2% restsuiker ✅  \n"
            "B. Door bewuste suikertoevoeging na gisting  \n"
            "C. Door blending met Chardonnay  \n"
            "D. Door lange vatrijping\n\n"
            "### Vraag 4\n\n"
            "Wat verklaart de kruidige, savoury toon van veel Bandol- en Tavel-rosé?\n\n"
            "A. Rotundone uit Syrah en vluchtige garrigueverbindingen die zich aan de schil hechten ✅  \n"
            "B. Uitsluitend lange vatrijping  \n"
            "C. Toevoeging van kruidenextract  \n"
            "D. Een hoog restsuikergehalte\n\n"
            "### Vraag 5\n\n"
            "Wat maakt Tavel structureel zwaarder dan een gemiddelde Provence rosé?\n\n"
            "A. Bewuste menging van perswijn met vrijloopsap en een langere maceratie ✅  \n"
            "B. Toevoeging van suiker na gisting  \n"
            "C. Uitsluitend gebruik van witte druiven  \n"
            "D. Filtratie zonder gisting\n\n"
            "### Vraag 6\n\n"
            "Waarom is rosé geen 'verdunde rode wijn'?\n\n"
            "A. Omdat kleur en tannine bij rosé ontkoppelde variabelen zijn ✅  \n"
            "B. Omdat rosé altijd van witte druiven wordt gemaakt  \n"
            "C. Omdat rosé nooit tannine bevat  \n"
            "D. Omdat rosé altijd zoeter is\n\n"
            "### Vraag 7\n\n"
            "Op welke temperatuur serveer je een structuurrijke Bandol of Tavel meestal?\n\n"
            "A. 4–6°C  \n"
            "B. 8–10°C  \n"
            "C. 11–13°C ✅  \n"
            "D. 16–18°C\n\n"
            "### Vraag 8\n\n"
            "Waarom is rosé extra kwetsbaar voor lichtschade (goût de lumière)?\n\n"
            "A. Ze wordt vaak in helder glas gebotteld, waardoor riboflavine makkelijker reageert met licht ✅  \n"
            "B. Ze bevat altijd meer suiker  \n"
            "C. Ze wordt nooit met een kurk gesloten  \n"
            "D. Ze bevat geen riboflavine\n\n"
            "### Vraag 9\n\n"
            "Waarom verschuift de kleur van rosé sneller met de tijd dan die van rode wijn?\n\n"
            "A. Rosé start met een veel kleinere antocyaanpool ✅  \n"
            "B. Rosé bevat nooit antocyanen  \n"
            "C. Rosé wordt altijd warmer bewaard  \n"
            "D. Rosé heeft geen kurk nodig\n\n"
            "### Vraag 10\n\n"
            "Welke stijl heeft dankzij het Mourvèdre-minimum een reëel bewaarpotentieel van vijf tot tien jaar?\n\n"
            "A. Basic Provence  \n"
            "B. Bandol ✅  \n"
            "C. Pinot Grigio  \n"
            "D. Cava\n\n"
            "### Vraag 11\n\n"
            "Waarom werkt rosé vaak beter dan lichte rode wijn bij een bittere salade?\n\n"
            "A. Rosé bevat vrijwel geen tannine, waardoor chlorofyl-tanninebitterheid wordt vermeden ✅  \n"
            "B. Rosé bevat altijd meer suiker  \n"
            "C. Rosé heeft nooit zuur  \n"
            "D. Rode wijn bevat geen chlorofyl\n\n"
            "### Vraag 12\n\n"
            "Waarom kan rode wijn bij vette vis een metaalachtige bijsmaak veroorzaken?\n\n"
            "A. IJzer en trimethylamine in het visvet reageren met tannine en polyfenolen ✅  \n"
            "B. Vis bevat altijd suiker  \n"
            "C. Rode wijn bevat geen zuur  \n"
            "D. Vis bevat geen eiwit\n\n"
            "### Vraag 13\n\n"
            "Waarom werkt een zoet barbecueglazuur vaak beter met rosé dan met tanninerijke rode wijn?\n\n"
            "A. Suiker versterkt bitterheid en astringentie van tannine, een risico dat tanninearme rosé vermijdt ✅  \n"
            "B. Rosé bevat altijd meer alcohol  \n"
            "C. Rode wijn bevat geen zuur  \n"
            "D. Suiker heeft geen effect op tanninewaarneming\n\n"
            "### Vraag 14\n\n"
            "Waarom voelt chilihitte milder aan bij een koele, laag-alcoholische rosé?\n\n"
            "A. Alcohol en warmte versterken beide het TRPV1-receptorsignaal ✅  \n"
            "B. Rosé bevat nooit capsaïcine  \n"
            "C. Rode wijn bevat geen alcohol  \n"
            "D. Chili heeft geen effect op wijnperceptie\n\n"
            "### Vraag 15\n\n"
            "Waarom kan zoute charcuterie een tanninerijke rode wijn ruwer laten aanvoelen?\n\n"
            "A. Zout interageert met de trigeminale waarneming van tannine ✅  \n"
            "B. Zout verwijdert alle tannine  \n"
            "C. Charcuterie bevat geen vet  \n"
            "D. Rode wijn bevat geen tannine\n\n"
            "### Vraag 16\n\n"
            "Wat maakt een prestigecuvée zoals Garrus geschikt voor fine dining?\n\n"
            "A. Vatgisting en lees-batonnage geven extra textuur die rijkere gerechten kan dragen ✅  \n"
            "B. Een zeer hoog restsuikergehalte  \n"
            "C. Volledige afwezigheid van zuur  \n"
            "D. Uitsluitend gebruik van witte druiven\n\n"
            "### Vraag 17\n\n"
            "Wat is bij Provence versus Tavel het meest betrouwbare onderscheidende signaal?\n\n"
            "A. Kleurintensiteit alleen  \n"
            "B. Tastbare grip op de afdronk ✅  \n"
            "C. Het gebruikte glas  \n"
            "D. De flesvorm\n\n"
            "### Vraag 18\n\n"
            "Waarom behoudt zelfs een geconcentreerde, diepgekleurde rosé structureel minder tannine dan de lichtste rode wijn?\n\n"
            "A. Rosé wordt van de schillen gescheiden vóór of zeer vroeg in de gisting, terwijl rode wijn volledig op de schillen fermenteert ✅  \n"
            "B. Rosé bevat nooit schillen  \n"
            "C. Rode wijn wordt nooit geperst  \n"
            "D. Kleur en tannine zijn bij beide identiek gekoppeld\n\n"
            "### Vraag 19\n\n"
            "Wat is het beslissende criterium om rosé van lichte rode wijn te onderscheiden?\n\n"
            "A. Kleurintensiteit  \n"
            "B. Tastgrip, gekoppeld aan fermentatieduur op de schillen ✅  \n"
            "C. Het serveerglas  \n"
            "D. De prijs van de fles\n\n"
            "### Vraag 20\n\n"
            "Wat is de kern van systematisch blindproeven bij rosé?\n\n"
            "A. Een vaste keten van kleur, aroma, zuur, lichaam en textuur, met een hypothese vóór de conclusie ✅  \n"
            "B. Direct naar het etiket kijken vóór het proeven  \n"
            "C. Alleen op kleur vertrouwen  \n"
            "D. Alleen op de regio van herkomst gokken"
        ),
        "quiz_feedback": (
            "Gefeliciteerd. Je beheerst nu het volledige fundament van rosé: theorie, "
            "productie, stijlkennis (bleek, fruitig en kruidig-structuurrijk), "
            "professionele service, gastronomische pairing en systematisch blindproeven.\n\n"
            "Volgende logische tracks:\n\n"
            "- Witte Wijn Track  \n"
            "- Rode Wijn Track  \n"
            "- Mousserende Wijn Track  \n"
            "- Port Track  \n"
            "- Cocktails Track"
        ),
    },
}
