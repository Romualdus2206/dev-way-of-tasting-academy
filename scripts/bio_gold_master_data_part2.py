"""Bio Track V2 — Gold Master data (lessons 24-45)."""
from __future__ import annotations


def _dm(beste: str, waarom: str, wachten: str) -> str:
    return (
        f"### Beste moment\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Wanneer wachten slimmer is\n\n{wachten}"
    )


LEERDOELEN_P2: dict[int, str] = {
    24: "Na deze les kun je mousserende stijlen per dagtype adviseren op energie, context en gewenst tempo.",
    25: "Na deze les kun je Port per dagtype positioneren zonder terug te vallen op alleen zoetheid of leeftijd.",
    26: "Na deze les kun je bier inzetten per dagtype op basis van structuur, koolzuur en aromatische impact.",
    27: "Na deze les kun je 0.0-bier professioneel adviseren als volwaardige keuze per moment en gerecht.",
    28: "Na deze les kun je cocktails per dagtype kalibreren op intensiteit, balans en functioneel drinktempo.",
    29: "Na deze les kun je barrel-aged dranken per dagtype inzetten met controle op concentratie en vermoeidheid.",
    30: "Na deze les kun je alcoholvrije opties strategisch bouwen voor premium beleving zonder kwaliteitsverlies.",
    31: "Na deze les kun je de juiste fles kiezen op dagtype, context en ontwikkelpotentieel.",
    32: "Na deze les kun je openen en wachten plannen met focus op zuurstof, temperatuur en servicevenster.",
    33: "Na deze les kun je drinkvensters bepalen met scenario-denken in plaats van absolute regels.",
    34: "Na deze les kun je een topflessen-voorraad opbouwen met rotatie, liquiditeit en piekmomenten.",
    35: "Na deze les kun je reserves beheren met discipline in allocatie, vervanging en risicospreiding.",
    36: "Na deze les kun je vertical tastings ontwerpen die evolutie zichtbaar maken zonder interpretatiebias.",
    37: "Na deze les kun je blindproef-timing sturen zodat concentratie, ritme en betrouwbaarheid hoog blijven.",
    38: "Na deze les kun je grote flessen functioneel inzetten voor rijping, service en groepsdynamiek.",
    39: "Na deze les kun je pairing per dagtype ontwerpen met prioriteit voor energiecurve en context.",
    40: "Na deze les kun je een eigen beslissysteem bouwen dat reproduceerbaar werkt in echte service.",
    41: "Na deze les kun je een perfect drinkmoment ontwerpen met integratie van product, persoon en situatie.",
    42: "Na deze les kun je timing versus kwaliteit afwegen en onderbouwen in concrete keuzes.",
    43: "Na deze les kun je voorkeurspatronen analyseren en vertalen naar betere adviezen en voorraadkeuzes.",
    44: "Na deze les kun je in een open examen alle biodynamische competenties integraal toepassen en verdedigen.",
    45: "Na deze les toon je meesterschap door consistente topkeuzes te maken in complexe, veranderlijke contexten.",
}


THEORY_OVERRIDES_P2: dict[int, str] = {
    24: (
        "Mousserend per dagtype vraagt doorgaans om meer nuance dan alleen stijlnaam of prijsniveau. "
        "In de ochtend en vroege middag werkt vaak een slanker profiel met hogere frisheid, terwijl "
        "de avond vaker ruimte geeft aan meer diepte, autolyse en textuur.\n\n"
        "Toch is dat geen harde wet. Klimaat, eettempo, gezelschap en de mentale energie van de gast "
        "kunnen de optimale keuze verschuiven. Een energieke lunch met zilt eten kan bijvoorbeeld "
        "meer spanning verdragen dan een rustige avonddrink zonder food.\n\n"
        "Professioneel gezien helpt het om dagtypes te zien als dynamische kaders. Je vertrekt vanuit "
        "verwachte behoefte, test met gerichte vragen en schaalt dan op of af. Zo blijft mousserend "
        "functioneel, niet dogmatisch."
    ),
    25: (
        "Port per dagtype werkt meestal beter wanneer je eerst het moment definieert en pas daarna "
        "de categorie kiest. Overdag is er vaker behoefte aan frisheid en lagere zwaarte, terwijl "
        "laat op de avond meer concentratie en warmte geaccepteerd worden.\n\n"
        "Die observatie is nuttig, maar niet absoluut. Een informele zomerdag kan juist baat hebben "
        "bij White Port met tonic, terwijl een herfstlunch met kaas verrassend goed kan werken met "
        "een jonge LBV in kleine schenking.\n\n"
        "Voor professionals ligt de kern in dosering en framing. Door portie, temperatuur en context "
        "actief te sturen, maak je Port breder inzetbaar door de hele dag heen zonder het product te forceren."
    ),
    26: (
        "Bier per dagtype vraagt om calibratie van koolzuur, bitterheid en body. In actieve dagfases "
        "werken vaak strakkere, frissere stijlen; in tragere avondfases kunnen rijkere moutprofielen "
        "of complexere gistkarakters beter landen.\n\n"
        "Tegelijk blijft individuele tolerantie bepalend. Sommige gasten ervaren hopbitterheid vroeg op de dag "
        "als verfrissend, anderen als vermoeiend. De keuze wordt daarom sterker wanneer je ook kijkt naar "
        "voedsel, hydratatie en verwacht drinktempo.\n\n"
        "Een professionele aanpak gebruikt bier als ritmeregelaar. Je kiest niet alleen op smaak, maar op "
        "hoe een stijl de rest van het dagverloop ondersteunt. Dat verhoogt tevredenheid en voorkomt overbelasting."
    ),
    27: (
        "0.0-bier is in moderne service geen noodoptie meer, maar een volwaardige categorie met eigen "
        "stijlverschillen. Per dagtype kan het zelfs strategisch sterker zijn dan alcoholisch bier, vooral "
        "wanneer focus, mobiliteit of langere sociale duur een rol spelen.\n\n"
        "De kwaliteit varieert wel per producent en stijl. Sommige 0.0-profielen missen middenpalet of "
        "afdronkspanning, terwijl andere bijna volledig stijltypisch blijven. Blind vergelijken helpt om "
        "echte kwaliteit te scheiden van marketingclaims.\n\n"
        "Professionals positioneren 0.0 daarom positief en inhoudelijk. Niet als beperking, maar als keuze "
        "die prestatie, comfort en smaak kan combineren. Dat vergroot vertrouwen en verbreedt omzetkansen."
    ),
    28: (
        "Cocktails per dagtype vragen om sturing van alcoholvolume, zoet-zuurbalans en aromatische druk. "
        "Overdag functioneren vaak lichtere highballs of spritz-achtige structuren, terwijl de avond ruimte "
        "biedt aan meer concentratie en complexere bitters.\n\n"
        "Ook hier gelden geen absolute schema's. Weer, muziek, groepsgrootte en serviceflow kunnen de "
        "optimale cocktailkeuze sterk verschuiven. Een lage-abv keuze kan in een late setting functioneler "
        "zijn dan een klassieke spirit-forward bereiding.\n\n"
        "De professionele meerwaarde zit in tempo-management. Je ontwerpt niet alleen een lekker glas, "
        "maar een duurzaam drinkverloop. Zo blijft de gastervaring hoog van eerste tot laatste ronde."
    ),
    29: (
        "Barrel-aged dranken geven vaak hoge aromatische dichtheid door houtinvloed, oxidatieve nuances "
        "en soms verhoogde alcoholperceptie. Daardoor passen ze meestal beter in rustiger dagfases waarin "
        "de aandacht hoger en het tempo lager ligt.\n\n"
        "Dat betekent niet dat barrel-aged nooit vroeg kan. In kleine proefvolumes of in educatieve context "
        "kan een vroeg moment juist didactisch waardevol zijn. De sleutel is dan strakkere portiecontrole "
        "en heldere begeleiding.\n\n"
        "Voor professionals draait deze categorie om energiebudget. Je bewaakt vermoeidheid, smaakverzadiging "
        "en timing. Zo blijft complexiteit een voordeel in plaats van een belasting."
    ),
    30: (
        "Alcoholvrij positioneren vraagt meer dan het schrappen van alcohol. De uitdaging ligt in behoud van "
        "textuur, lengte en gastronomische bruikbaarheid, zodat de ervaring premium blijft op elk dagtype.\n\n"
        "Niet elke alcoholvrije stijl presteert gelijk in elke context. Sommige opties werken beter als aperitief, "
        "andere juist bij food of in lange sessies. Praktijkdata uit service is daarom waardevoller dan theorie alleen.\n\n"
        "Professioneel bouw je een alcoholvrije lijn met duidelijke rollen: fris, gastronomisch, contemplatief. "
        "Die segmentatie voorkomt dat alcoholvrij als uniforme categorie wordt gezien en verhoogt keuzezekerheid."
    ),
    31: (
        "De juiste fles kiezen is een combinatie van productkennis en situatieduiding. Dagtype, groepsgrootte, "
        "budget en beoogde sfeer bepalen samen welke fles functioneel en emotioneel klopt.\n\n"
        "Er is zelden een universeel beste keuze. Een topfles kan op het verkeerde moment onderpresteren, "
        "terwijl een bescheidener wijn in de juiste context sterk kan overkomen. Timing en framing zijn daarom "
        "onderdeel van de kwaliteit, niet alleen de vloeistof zelf.\n\n"
        "Voor professionals is fleskeuze besliskunde. Je werkt met scenario's, niet met lijstjes. Dat maakt "
        "keuzes reproduceerbaar en verdedigbaar, ook onder tijdsdruk."
    ),
    32: (
        "Openen en wachten gaat over gecontroleerde zuurstofinteractie, niet over een vaste minutenregel. "
        "Sommige flessen openen snel, andere hebben baat bij geleidelijke beluchting voordat ze hun volledige "
        "structuur tonen.\n\n"
        "De variatie komt door leeftijd, sluiting, stijl en bewaarcondities. Daarom werkt een observatiegedreven "
        "aanpak meestal beter dan een standaardprotocol. Je beoordeelt neus, spanning en textuur in tijdslijnen.\n\n"
        "Professioneel wordt wachten een service-instrument. Je communiceert waarom je wacht, test tussendoor "
        "en past bij. Zo ontstaat precisie zonder ritualisme."
    ),
    33: (
        "Drinkvensters zijn kanszones, geen exacte data. Een venster beschrijft wanneer een fles waarschijnlijk "
        "de beste balans tussen fruit, structuur en complexiteit laat zien, maar individuele flessen kunnen afwijken.\n\n"
        "Afwijkingen ontstaan door opslag, kurkvariatie en flesformaat. Daarom is vensterdenken sterker dan "
        "puntvoorspellingen. Je plant breed genoeg voor onzekerheid en verfijnt op basis van proefsignalen.\n\n"
        "Voor professionals is dit vooral risicobeheer. Goede vensterinschatting verhoogt trefzekerheid in service "
        "en verlaagt teleurstelling bij premiummomenten."
    ),
    34: (
        "Topflessen-voorraad vraagt balans tussen ambitie en liquiditeit. Wie alleen op prestige koopt, bouwt "
        "snel een kelder met lage rotatie; wie alleen op snelheid koopt, mist piekmomenten met hoge beleving.\n\n"
        "De optimale mix verschilt per concept. Een restaurant met veel arrangementen vraagt andere verhoudingen "
        "dan een private cellar met lange horizon. Data over verbruik en seizoenspatronen is hier cruciaal.\n\n"
        "Professioneel voorraadbeheer behandelt topflessen als strategische assets. Je plant instroom, uitstroom "
        "en vervanging op voorhand. Dat maakt kwaliteit schaalbaar en financieel gezond."
    ),
    35: (
        "Reserves zijn functioneel wanneer ze een duidelijke rol hebben: continuity, opportuniteit of prestige. "
        "Zonder rol worden reserves vaak emotionele aankopen die kapitaal blokkeren.\n\n"
        "Een robuuste reserve-aanpak combineert spreiding over regio, stijl en rijpingsfase. Dat vermindert "
        "de impact van marktschommelingen en onverwachte vraagpieken. Reservebeleid is dus ook risicopolitiek.\n\n"
        "Professioneel werken met reserves betekent periodiek herijken. Je toetst of de reserve nog past bij "
        "je actuele doelgroep en service-intentie. Zo blijft de kelder levend in plaats van statisch."
    ),
    36: (
        "Vertical tasting maakt tijd zichtbaar door meerdere jaargangen van dezelfde producent of cuvee naast "
        "elkaar te zetten. Het doel is doorgaans niet rangschikken, maar begrijpen hoe stijl en klimaat evolueren.\n\n"
        "Interpretatie blijft gevoelig voor volgorde-effecten en verwachting. Daarom helpt een strak protocol met "
        "blokken, pauzes en neutrale notatie. Zo verklein je bias en verhoog je vergelijkbaarheid.\n\n"
        "Professioneel is vertical tasting een intelligentie-instrument. De inzichten voeden aankoop, drinkvensters "
        "en gastadvies. Daarmee levert het direct operationele waarde op."
    ),
    37: (
        "Blindproeven onder tijdsdruk vraagt ritmebeheersing. Te snel leidt vaak tot gokgedrag, te traag tot "
        "sensorische vermoeidheid. De beste timing zit meestal in vaste, korte observatiecycli.\n\n"
        "Timing verschilt per context. In training kun je langer analyseren; in service moet je sneller convergeren "
        "naar bruikbare waarschijnlijkheden. Een adaptief schema presteert meestal beter dan een rigide timer.\n\n"
        "Professioneel blindproeven is dus besluitvorming onder onzekerheid. Je bewaakt tempo, bewaart methodiek "
        "en communiceert betrouwbaarheidsniveau expliciet."
    ),
    38: (
        "Grote flessen veranderen rijpingsdynamiek door een andere verhouding tussen zuurstof en volume. Daardoor "
        "ontwikkelen aroma's vaak langzamer en kunnen texturen langer fris blijven, afhankelijk van stijl en opslag.\n\n"
        "Toch is groot niet automatisch beter. Servicecomplexiteit, koelcapaciteit en restvolume na openen kunnen "
        "de praktische waarde verminderen. Context bepaalt of magnum-logica echt voordeel geeft.\n\n"
        "Professioneel gebruik van grote formaten combineert kelderstrategie met operationele planning. Je kiest "
        "ze wanneer ritueel, kwaliteit en logistiek tegelijk kloppen."
    ),
    39: (
        "Pairing per dagtype koppelt productkeuze aan energiecurve van de gast. In vroege fasen werkt vaak meer "
        "frisheid en spanning; later kan meer diepte en lengte zinvol zijn, mits het gerecht dat ondersteunt.\n\n"
        "Dit blijft een probabilistisch model. Individuele voorkeur, culturele context en menustructuur kunnen "
        "de curve verschuiven. Daarom blijft doorvragen belangrijker dan blind volgen van schema's.\n\n"
        "Professioneel gezien is dagtype-pairing een ontwerpdiscipline. Je bouwt een traject dat de gast activeert "
        "in plaats van vermoeit. Dat verhoogt totale menu-ervaring."
    ),
    40: (
        "Een eigen systeem is nuttig wanneer het keuzes versnelt zonder nuance te verliezen. Het systeem vertaalt "
        "complexe variabelen naar een hanteerbare beslisvolgorde die je consequent kunt toepassen.\n\n"
        "Het risico is oververeenvoudiging. Een systeem dat geen uitzonderingen toelaat, presteert slecht in de echte "
        "wereld. Daarom bouw je feedbacklussen in waarmee je aannames periodiek test en bijstelt.\n\n"
        "Professioneel gezien is een goed systeem zowel strikt als flexibel. Strikt in volgorde, flexibel in uitkomst. "
        "Dat maakt kwaliteit reproduceerbaar en toch menselijk."
    ),
    41: (
        "Het perfecte drinkmoment ontstaat meestal uit alignment tussen drank, persoon en situatie. Kwaliteit van het "
        "product blijft belangrijk, maar timing, sfeer en verwachting bepalen vaak de uiteindelijke impact.\n\n"
        "Omdat context fluctueert, is perfectie zelden absoluut. Wat op papier optimaal lijkt, kan in praktijk minder "
        "werken door tempo, stemming of groepsdynamiek. Daarom is realtime bijsturen essentieel.\n\n"
        "Professioneel ontwerp je geen statisch perfect moment, maar een robuust moment met aanpasbare parameters. "
        "Dat vergroot de kans op een topbeleving in verschillende omstandigheden."
    ),
    42: (
        "Timing versus kwaliteit is geen binaire keuze maar een afwegingsmatrix. Soms levert wachten merkbare "
        "kwaliteitswinst op, soms vernietigt wachten juist het momentum van de tafel.\n\n"
        "De optimale beslissing hangt af van doel van het moment. Bij educatieve of premium setting kan extra tijd "
        "gerechtvaardigd zijn; bij snelle servicecontext weegt flow vaak zwaarder. Beide uitkomsten kunnen professioneel zijn.\n\n"
        "Professioneel handelen betekent expliciet kiezen en die keuze kunnen uitleggen. Je maakt de trade-off zichtbaar "
        "voor team en gast, zodat kwaliteit en timing niet als concurrenten maar als ontwerpkeuzes worden gezien."
    ),
    43: (
        "Voorkeurspatronen ontstaan uit herhaalde interacties tussen smaak, context en emotie. Wie patronen ziet, "
        "kan voorspellen welke keuzes kansrijk zijn zonder in stereotypering te vervallen.\n\n"
        "Patronen zijn echter tijdelijk en contextgevoelig. Een gast met vaste voorkeur kan in een andere setting "
        "plots ander gedrag tonen. Daarom moet patroonanalyse altijd gecombineerd worden met actuele observatie.\n\n"
        "Professioneel gebruik je patronen als startpunt, niet als eindbesluit. Zo combineer je data-intelligentie "
        "met menselijke aandacht, wat advieskwaliteit structureel verhoogt."
    ),
    44: (
        "Het open examen toetst integratievermogen: theorie, service, timing, voorraadlogica en sensorische analyse "
        "komen samen in onvoorspelbare scenario's. De nadruk ligt meestal op redenering, niet op reproduceren van losse feiten.\n\n"
        "Omdat casussen open zijn, bestaat er vaak meer dan een verdedigbare route. Kandidaten scoren doorgaans hoger "
        "wanneer zij aannames expliciteren, alternatieven benoemen en consequent onderbouwen waarom een keuze past.\n\n"
        "Professioneel gezien simuleert het examen de werkelijkheid. Succes betekent dat je ook onder onzekerheid "
        "stabiel beslist en transparant communiceert over je afwegingen."
    ),
    45: (
        "Meesterschap in de biodynamische track betekent consistente kwaliteit over tijd, niet incidentele perfectie. "
        "De kern is dat je in wisselende contexten betrouwbaar kunt kiezen, bijsturen en evalueren.\n\n"
        "Dit niveau vraagt doorgaans metacognitie: je observeert niet alleen product en gast, maar ook je eigen "
        "beslispatronen en bias. Daardoor verbetert je systeem terwijl je werkt.\n\n"
        "Professioneel meesterschap is dus een praktijk van permanente kalibratie. Je combineert inhoud, timing en "
        "menselijke sensitiviteit tot een stijl die tegelijk scherp en adaptief blijft."
    ),
}


DRINKMOMENT_P2: dict[int, str] = {
    24: _dm(
        "Brunch, middagterras en vroege aperitiefmomenten met behoefte aan lift.",
        "Mousserend kan energie verhogen zonder zwaarte, mits stijl en dosage kloppen.",
        "Start slank en fris; schaal pas op naar rijpere stijlen als tempo en tafel dat vragen.",
    ),
    25: _dm(
        "Late lunch met kaas, pre-dinner op het terras of digestief na rustig diner.",
        "Port is breed inzetbaar wanneer portie, temperatuur en stijl op moment zijn afgestemd.",
        "Gebruik kleinere schenking en benoem functie: aperitief, food-bridge of digestief.",
    ),
    26: _dm(
        "Actieve middag met food-sharing of avond met comfortgerechten.",
        "Bier stuurt ritme via koolzuur, bitterheid en body en kan zeer precies pairen.",
        "Kies op structuur eerst, dan op stijlnaam; bewaak drinktempo bij hoppige of zware opties.",
    ),
    27: _dm(
        "Werkdaglunch, sportieve avond of lange social waarin helderheid gewenst blijft.",
        "0.0 kan smaak en functionaliteit combineren zonder cognitieve of logistieke frictie.",
        "Presenteer 0.0 als premium keuze met stijlargument, niet als compromis.",
    ),
    28: _dm(
        "Aperitiefstart, feestelijke piek of late digestieve fase.",
        "Cocktails kunnen per dagtype exact op tempo en energie worden gekalibreerd.",
        "Werk met ABV-ladder: licht starten, midden consolideren, zwaar alleen waar passend.",
    ),
    29: _dm(
        "Rustige avond, educatieve tasting of afsluitend contemplatief moment.",
        "Barrel-aged vraagt aandacht en laag tempo om diepte te laten renderen.",
        "Schenk klein, geef context en plan waterpauzes om smaakverzadiging te voorkomen.",
    ),
    30: _dm(
        "Zakelijke lunch, lange rij-avond of mixed-group events met uiteenlopende grenzen.",
        "Alcoholvrij houdt inclusie en kwaliteit hoog in settings met functionele eisen.",
        "Bouw een kaart met verschillende alcoholvrije profielen: fris, gastronomisch en complex.",
    ),
    31: _dm(
        "Momenten met keuzevrijheid uit meerdere topflessen en duidelijk doel.",
        "Fleskeuze bepaalt niet alleen smaak, maar ook verwachting en serviceflow.",
        "Beslis via matrix: dagtype, gezelschap, budget, bewaardoel en food-context.",
    ),
    32: _dm(
        "Premiumservice waarbij de fles mogelijk gesloten of hoekig start.",
        "Openen en wachten kan textuur en aromatische gelaagdheid zichtbaar maken.",
        "Test in intervallen van enkele minuten en communiceer actief wat je waarneemt.",
    ),
    33: _dm(
        "Kelderplanning, aankoopbeslissingen en speciale service-events.",
        "Drinkvensters verkleinen risico op openen buiten piekprestatie.",
        "Werk met vensterzones en herijk na elke proefdata van vergelijkbare flessen.",
    ),
    34: _dm(
        "Voorraadopbouw voor seizoenspieken, events en high-end menu's.",
        "Topflessen vragen planning zodat prestige en cashflow tegelijk gezond blijven.",
        "Verdeel voorraad over snel, midden en lang ritme en monitor rotatie maandelijks.",
    ),
    35: _dm(
        "Strategische keldermomenten met focus op continuiteit en onzekerheidsbuffer.",
        "Reserves beschermen servicekwaliteit bij markt- of leveringsschokken.",
        "Definieer reservecategorieen en stel per categorie heldere releasevoorwaarden vast.",
    ),
    36: _dm(
        "Educatieve avonden, teamtrainingen of collector-sessies.",
        "Vertical tasting maakt jaargangsevolutie en huisstijl zichtbaar.",
        "Gebruik vaste proefvolgorde, neutrale notatie en korte rustblokken tussen flights.",
    ),
    37: _dm(
        "Blindtraining, examenvoorbereiding en high-pressure servicebeslissingen.",
        "Juiste timing verhoogt betrouwbaarheid en verlaagt gokgedrag.",
        "Werk in microcycli: kijken, ruiken, proeven, besluiten; houd elke stap tijdgebonden.",
    ),
    38: _dm(
        "Groepsdiners, jubilea en keldermomenten met langere consumptieduur.",
        "Grote flessen kunnen ontwikkeling vertragen en beleving vergroten.",
        "Plan koeling, schenklogistiek en restvolume vooraf; kies formaat op functie.",
    ),
    39: _dm(
        "Meergangenmenu's die over dagdelen of lange avonden lopen.",
        "Dagtype-pairing bewaakt energie zodat het menu opbouwt zonder te vermoeien.",
        "Start met frisse spanning, bouw middencomplexiteit en eindig met gecontroleerde diepte.",
    ),
    40: _dm(
        "Operationele settings waar snelle maar betrouwbare keuzes nodig zijn.",
        "Een eigen systeem maakt beslissingen consistent tussen teamleden en shifts.",
        "Gebruik vaste volgorde van vragen, maar laat ruimte voor contextafwijking.",
    ),
    41: _dm(
        "Belangrijke tafelmomenten: vieringen, signing dinner of intieme afsluiting.",
        "Perfectie ontstaat wanneer timing, persoon en product samen resoneren.",
        "Check stemming, energie en verwachting kort voor serveren en pas laatste details aan.",
    ),
    42: _dm(
        "Servicemomenten met spanning tussen wachten en direct serveren.",
        "Soms wint kwaliteit door tijd, soms wint beleving door momentum.",
        "Beslis expliciet welke waarde prioriteit krijgt en leg die keuze kort uit aan tafel.",
    ),
    43: _dm(
        "Terugkerende gasten, clubevents en langdurige adviesrelaties.",
        "Patroonkennis verhoogt relevantie en versnelt goede keuzes.",
        "Combineer historische voorkeuren met een actuele checkvraag per service.",
    ),
    44: _dm(
        "Open examen met integratiecasussen en variabele randvoorwaarden.",
        "Succes vraagt compositie van kennis, timing en argumentatie onder onzekerheid.",
        "Werk met transparante redenering: aannames, keuze, alternatief, risico, evaluatie.",
    ),
    45: _dm(
        "Capstone-momenten waarin je volledige trackidentiteit zichtbaar wordt.",
        "Meesterschap toont zich in herhaalbare topbeslissingen bij veranderlijke context.",
        "Evalueer na elk hoogmoment wat werkte, waarom, en hoe je systeem nog scherper kan.",
    ),
}


PRO_INSIGHTS_P2: dict[int, str] = {
    24: "Bij mousserend per dagtype verkoop je geen etiket maar energiemanagement: leg uit waarom een slanke stijl overdag vaak beter presteert dan een rijke prestigecuvee.",
    25: "Port wordt commercieel sterker wanneer je het moment benoemt voor je categorie noemt; daarmee verschuif je gesprek van zoetheid naar functie.",
    26: "Bieradvies per dagtype werkt het best met structuurtaal (koolzuur, body, bitterlijn) in plaats van stijljargon; dat verlaagt keuzeangst direct.",
    27: "0.0 verkoopt premium zodra je dezelfde professionele vocabulaire gebruikt als bij alcoholische opties; framing bepaalt perceptie.",
    28: "Cocktailkwaliteit is niet alleen receptnauwkeurigheid maar ritmeregie: de beste bars sturen ABV over de avond, niet alleen per glas.",
    29: "Barrel-aged inzetten zonder portiebeleid leidt snel tot palate fatigue; kleine schenking verhoogt waardering en verlengt servicekwaliteit.",
    30: "Een sterke alcoholvrije kaart verlaagt uitval in lange avonden en verhoogt gemiddeld bestedingsvertrouwen in gemengde groepen.",
    31: "De juiste fles kiezen begint met risico-inschatting: mismatch op context schaadt meer dan een lagere prestigegraad.",
    32: "Openen-wachten wordt professioneel wanneer je tastmomenten in tijd plant en communiceert; anders lijkt het op theater zonder resultaat.",
    33: "Drinkvensters zijn een waarschijnlijkheidsmodel; topteams actualiseren dat model met eigen proefdata in plaats van alleen externe scores te volgen.",
    34: "Topvoorraad zonder rotatie is prestige op papier maar verlies in praktijk; KPI's op uitstroom horen bij kelderdiscipline.",
    35: "Reserves beschermen servicecontinuiteit alleen als releasecriteria vooraf vastliggen; ad-hoc vrijgeven maakt reservebeleid betekenisloos.",
    36: "Vertical tastings leveren pas intelligence wanneer notities direct worden vertaald naar aankoop- en servicebeslissingen.",
    37: "Blindproef-timing moet getraind worden als vaardigheid; wie alleen smaak traint maar geen ritme, blijft onstabiel presteren onder druk.",
    38: "Grote flessen vragen logistieke voorbereiding; zonder koeling en serviceplan verlies je het kwaliteitsvoordeel dat ze potentieel bieden.",
    39: "Pairing per dagtype verhoogt gastcomfort merkbaar: energiecurve sturen is vaak belangrijker dan een spectaculaire losse match.",
    40: "Een eigen systeem moet auditbaar zijn: als teamleden niet kunnen uitleggen waarom ze kozen, werkt het systeem nog niet.",
    41: "Perfect drinkmoment ontstaat zelden toevallig; topservice bouwt het via microchecks op stemming, tempo en tafelcontext.",
    42: "Timing versus kwaliteit is een leiderschapskeuze: benoem de trade-off hardop in het team zodat iedereen hetzelfde servicebesluit draagt.",
    43: "Voorkeurspatronen zijn commercieel goud wanneer je ze dynamisch gebruikt; statische profielen leiden juist tot voorspelbare missers.",
    44: "In open examens scoort heldere redenering vaak hoger dan het ene 'juiste' antwoord; beoordelaars zoeken professioneel denken onder onzekerheid.",
    45: "Meesterschap herken je aan consistente besluitkwaliteit over maanden, niet aan incidentele topavonden; stuur op procesdiscipline.",
}


REFLECTIEVRAGEN_P2: dict[int, str] = {
    24: "Welke drie signalen gebruik jij om te beslissen of een mousserende keuze overdag spanning geeft of juist energie wegneemt?",
    25: "Wanneer je Port overdag adviseert, welke variabele weegt voor jou het zwaarst: stijl, portie, temperatuur of context?",
    26: "Welke bierstructuurcomponent veroorzaakt in jouw ervaring de meeste mismatch per dagtype, en hoe corrigeer je die vooraf?",
    27: "Hoe toets je objectief of een 0.0-optie echt premium presteert en niet alleen marketingmatig overtuigt?",
    28: "Welke ABV-strategie past het best bij jouw servicecontext, en waar zie je momenteel de grootste timingfout?",
    29: "Op welk moment wordt barrel-aged voor jouw gasten te zwaar, en welke interventie verlaagt dat risico het meest?",
    30: "Welke alcoholvrije categorie ontbreekt nog in jouw aanbod om alle dagtypes professioneel af te dekken?",
    31: "Welke beslisfout maak jij het vaakst bij fleskeuze: te veel prestige, te veel veiligheid of te weinig contextanalyse?",
    32: "Hoe bepaal jij in realtime of extra wachten kwaliteitswinst oplevert of juist het servicemoment beschadigt?",
    33: "Welke data zou jouw drinkvenster-inschattingen aantoonbaar betrouwbaarder maken dan je huidige aanpak?",
    34: "Welke voorraadratio tussen snelle en langzame topflessen is voor jouw setting logisch, en waarom?",
    35: "Waar zit in jouw reservebeleid het grootste concentratierisico, en hoe zou je dat pragmatisch spreiden?",
    36: "Welke bias zie je het vaakst terug in jouw vertical tastings, en welke protocolstap kan die bias reduceren?",
    37: "Bij blindproeven onder tijdsdruk: welke fase kost jou disproportioneel veel tijd en wat is je correctieplan?",
    38: "Wanneer kies jij bewust tegen een groot formaat, ondanks keldervoordeel, vanwege operationele realiteit?",
    39: "Hoe ontwerp jij een pairing-opbouw die de energiecurve ondersteunt zonder midden in het menu te verzwaren?",
    40: "Welke twee regels moeten in jouw eigen systeem absoluut vastliggen om keuzeconsistentie te garanderen?",
    41: "Welke contextvariabele onderschat jij het vaakst bij het ontwerpen van een perfect drinkmoment?",
    42: "Noem een recente situatie waarin je timing boven maximale kwaliteit koos: was dat achteraf de juiste trade-off?",
    43: "Welke voorkeurspatronen bij jouw gasten zijn echt voorspellend, en welke blijken vooral ruis?",
    44: "Welke integratievaardigheid wil je in het open examen expliciet demonstreren om je professionele niveau te bewijzen?",
    45: "Welk element van jouw huidige werkwijze moet evolueren om van sterke uitvoerder naar consistent meester te gaan?",
}


SUMMARIES_P2: dict[int, list[str]] = {
    24: [
        "Dagtype stuurt keuze in stijlgewicht en dosage.",
        "Mousserend werkt als energieregisseur, niet alleen als feestwijn.",
        "Context kan klassieke tijdsregels doorbreken.",
        "Professionele keuzes blijven adaptief en onderbouwd.",
    ],
    25: [
        "Port past in meerdere dagtypes met juiste framing.",
        "Functie gaat voor categorie-denken.",
        "Portie en temperatuur bepalen inzetbaarheid sterk.",
        "Scenario-denken voorkomt stereotype Port-service.",
    ],
    26: [
        "Bier per dagtype vraagt structuurkalibratie.",
        "Koolzuur en body sturen energieniveau van de gast.",
        "Individuele tolerantie blijft bepalend.",
        "Ritmeregie maakt bieradvies professioneler.",
    ],
    27: [
        "0.0 is een volwaardige premiumcategorie.",
        "Kwaliteit verschilt zichtbaar per stijl en producent.",
        "Blind vergelijken verhoogt objectiviteit.",
        "Positieve positionering vergroot acceptatie en omzet.",
    ],
    28: [
        "Cocktails vragen dagtype-specifieke ABV-sturing.",
        "Balans en tempo zijn even belangrijk als smaak.",
        "Contextfactoren verschuiven ideale receptkeuzes.",
        "Serviceflow bepaalt totale cocktailprestatie.",
    ],
    29: [
        "Barrel-aged vraagt aandacht en lager tempo.",
        "Kleine porties beschermen focus en smaakgevoeligheid.",
        "Complexiteit is waardevol maar energetisch zwaar.",
        "Professionele inzet voorkomt palate fatigue.",
    ],
    30: [
        "Alcoholvrij vereist premium ontwerp, niet vervanging.",
        "Segmentatie per rol verhoogt bruikbaarheid.",
        "Service-data moet keuzes valideren.",
        "Inclusie en kwaliteit kunnen tegelijk groeien.",
    ],
    31: [
        "Fleskeuze is contextbesluit, geen etiketwedstrijd.",
        "Prestige zonder timing kan onderpresteren.",
        "Matrix-denken verhoogt trefzekerheid.",
        "Goede keuzes zijn reproduceerbaar en uitlegbaar.",
    ],
    32: [
        "Openen-wachten gaat over gecontroleerde zuurstof.",
        "Vaste minutenregels zijn vaak te simplistisch.",
        "Realtime observatie leidt tot betere timing.",
        "Heldere communicatie maakt wachten waardevol.",
    ],
    33: [
        "Drinkvensters zijn kanszones, geen exacte data.",
        "Flesvariatie vraagt scenario-denken.",
        "Vensterplanning verlaagt premium-risico.",
        "Eigen proefdata verscherpt voorspellingen.",
    ],
    34: [
        "Topvoorraad vraagt balans tussen prestige en rotatie.",
        "Concepttype bepaalt optimale keldermix.",
        "Seizoensdata moet aankoop sturen.",
        "Voorraad is strategisch assetbeheer.",
    ],
    35: [
        "Reserves werken alleen met duidelijke rol.",
        "Spreiding verlaagt markt- en vraagrisico.",
        "Reservebeleid vraagt periodieke herijking.",
        "Discipline voorkomt kapitaalblokkade.",
    ],
    36: [
        "Vertical tasting toont evolutie over tijd.",
        "Protocol is nodig om bias te beperken.",
        "Inzichten moeten operationeel landen.",
        "Vergelijkbaarheid is belangrijker dan snelheid.",
    ],
    37: [
        "Blindproeven is timing plus sensoriek.",
        "Te snel of te traag verlaagt betrouwbaarheid.",
        "Microcycli verbeteren beslisritme.",
        "Betrouwbaarheidsniveau hoort bij de conclusie.",
    ],
    38: [
        "Grote flessen veranderen rijpingsdynamiek.",
        "Formaatkeuze hangt af van logistieke haalbaarheid.",
        "Niet elk moment vraagt magnum.",
        "Kwaliteit en operatie moeten samen kloppen.",
    ],
    39: [
        "Pairing per dagtype volgt energiecurve.",
        "Schema's zijn richtinggevend, niet absoluut.",
        "Doorvragen blijft essentieel voor precisie.",
        "Opbouw over menu bepaalt gastcomfort.",
    ],
    40: [
        "Eigen systeem versnelt consistente keuzes.",
        "Starre systemen falen bij uitzonderingen.",
        "Feedbacklussen houden systeem relevant.",
        "Auditbaarheid verhoogt teamkwaliteit.",
    ],
    41: [
        "Perfect moment vraagt alignment van drie assen.",
        "Context kan productkwaliteit versterken of verzwakken.",
        "Realtime bijsturen verhoogt trefkans.",
        "Robuust ontwerp wint van statische perfectie.",
    ],
    42: [
        "Timing en kwaliteit vormen een trade-off.",
        "Beste keuze verschilt per service-doel.",
        "Expliciete afweging voorkomt teamruis.",
        "Professionalisme zit in onderbouwde prioriteit.",
    ],
    43: [
        "Voorkeurspatronen verbeteren voorspelkracht.",
        "Patronen blijven contextgevoelig en tijdelijk.",
        "Data moet worden getoetst aan actuele observatie.",
        "Dynamisch patroongebruik verhoogt advieskwaliteit.",
    ],
    44: [
        "Open examen test integratie onder onzekerheid.",
        "Meerdere routes kunnen valide zijn.",
        "Argumentatiekwaliteit weegt zwaar.",
        "Transparant redeneren is kernvaardigheid.",
    ],
    45: [
        "Meesterschap is consistente kwaliteit over tijd.",
        "Metacognitie versnelt professionele groei.",
        "Kalibratie blijft permanent proces.",
        "Topniveau combineert scherpte met adaptiviteit.",
    ],
}


GOLD_KEY_CONCEPTS_P2: dict[int, list[str]] = {
    24: ["dagtype-kalibratie", "mousserende structuur", "energiemanagement", "dosage", "contextsturing"],
    25: ["Port-positionering", "momentfunctie", "portiecontrole", "temperatuursturing", "scenario-denken"],
    26: ["bierstructuur", "koolzuurdynamiek", "bitterlijn", "bodybeheer", "ritmeregie"],
    27: ["0.0-kwaliteit", "premiumframing", "stijltypiciteit", "functioneel drinken", "inclusieve service"],
    28: ["cocktail-ABV-ladder", "balansregie", "drinktempo", "serviceflow", "dagcurve"],
    29: ["barrel-aged", "smaakverzadiging", "portiebeleid", "complexiteitsbeheer", "avondcontext"],
    30: ["alcoholvrije architectuur", "rolsegmentatie", "textuurbehoud", "smaaklengte", "keuzezekerheid"],
    31: ["flesselectie", "contextmatrix", "prestige-risico", "besliskunde", "situatieanalyse"],
    32: ["zuurstofregie", "openprotocol", "wachtstrategie", "realtime-evaluatie", "servicevenster"],
    33: ["drinkvenster", "kanszone", "flesvariatie", "risicobeheer", "vensterplanning"],
    34: ["topvoorraad", "rotatiesnelheid", "kelderliquiditeit", "seizoensplanning", "assetbeheer"],
    35: ["reservebeleid", "allocatiediscipline", "risicospreiding", "releasecriteria", "keldercontinuiteit"],
    36: ["vertical tasting", "jaargangsevolutie", "protocolproeven", "biasreductie", "proefintelligentie"],
    37: ["blindritme", "microcycli", "tijdsdrukanalyse", "besliszekerheid", "kalibratietempo"],
    38: ["groot formaat", "rijpingsdynamiek", "service-logistiek", "magnumstrategie", "groepsbeleving"],
    39: ["dagtype-pairing", "energiecurve", "menu-opbouw", "contextgevoeligheid", "gastcomfort"],
    40: ["eigen systeem", "beslisvolgorde", "feedbacklus", "auditbaarheid", "teamconsistentie"],
    41: ["perfect drinkmoment", "contextalignment", "stemmingsscan", "microbijsturing", "belevingsontwerp"],
    42: ["timing-kwaliteit", "trade-offmatrix", "serviceprioriteit", "momentumbeheer", "expliciete keuze"],
    43: ["voorkeurspatronen", "gedragsdata", "contextcorrectie", "adviespredictie", "dynamische segmentatie"],
    44: ["open examen", "integratiecasus", "argumentatielijn", "onzekerheidsbesluit", "professionele verdediging"],
    45: ["meesterschap", "consistente uitvoering", "metacognitie", "permanente kalibratie", "adaptieve excellentie"],
}


QUIZ_PATCHES_P2: dict[int, str] = {
    24: """### Vraag 4

Scenario: zaterdag 12:30, zonnig terras, zilt lunchgerecht, groep wil fris starten.
Welke richting is het meest logisch?

A. Zware houtgerijpte mousserende wijn op 12C
B. Slanke brut-stijl met hoge spanning op 8-9C ✅
C. Zoete stille dessertwijn
D. Rode krachtwijn op kamertemperatuur

### Vraag 5

Scenario: zelfde groep bestelt tweede ronde en eet nu rijkere gerechtjes met boter.
Wat pas je het best aan?

A. Meteen stoppen met mousserend
B. Opschalen naar iets meer textuur en rijpere autolyse ✅
C. Terug naar water zonder uitleg
D. Alles op exact dezelfde schenking houden

""",
    25: """### Vraag 4

Scenario: gast wil overdag Port maar zegt "niet te zwaar, ik moet nog door".
Wat is de beste eerste route?

A. Vintage in groot glas
B. White Port (evt. met tonic) in gecontroleerde serveermaat ✅
C. Tawny 40 Years op 18C
D. LBV in dubbele portie

### Vraag 5

Scenario: na diner vraagt dezelfde gast om meer diepte zonder plakkerigheid.
Welke keuze past het best?

A. Gerichte stap naar LBV of jonge Tawny in kleine schenking ✅
B. Zoetste optie op de kaart in groot volume
C. Alleen koffie, geen alternatief
D. Blend alles in een cocktail

""",
    26: """### Vraag 4

Scenario: lunchservice met vettige streetfood, gasten willen frisheid en tempo.
Welke bierkeuze is logisch?

A. Strak, koolzuurrijk bier met matige body ✅
B. Zware barleywine als eerste glas
C. Laag-koolzuur dessertstijl
D. Warm geserveerde quadrupel

### Vraag 5

Scenario: avondshift, zelfde tafel wil langer tafelen met comfortfood.
Wat verander je?

A. Niets, lunchprofiel altijd herhalen
B. Gecontroleerd opschalen naar meer moutdiepte en aromatische lengte ✅
C. Alleen shots serveren
D. Koolzuur volledig vermijden

""",
    27: """### Vraag 4

Scenario: zakelijke lunch, team wil scherp blijven maar wel volwaardige smaak.
Welke aanpak is professioneel?

A. Alleen water aanbieden
B. Kwalitatief 0.0-profiel met stijltoelichting ✅
C. Hoog alcoholpercentage omdat "meer smaak"
D. Random keuze zonder contextvraag

### Vraag 5

Scenario: gast twijfelt en noemt 0.0 "minderwaardig".
Wat werkt het best?

A. Verdedigend reageren
B. Koppelen aan stijlkenmerken en food-match zoals bij premium bier ✅
C. Meteen prijs verlagen
D. Thema negeren

""",
    28: """### Vraag 4

Scenario: vroege aperitief met groot gezelschap en lang event.
Welke cocktailstrategie is het best?

A. Start met zwaar spirit-forward profiel
B. Start met lagere ABV en heldere balans ✅
C. Alleen zoete cocktails serveren
D. Iedereen hetzelfde zonder vraag

### Vraag 5

Scenario: midden van de avond daalt energie, tafel wil meer diepte.
Wat is de juiste stap?

A. Gecontroleerd verhogen in complexiteit zonder tempo te verliezen ✅
B. Direct hoogste alcohol voor iedereen
C. Stoppen met service
D. Alle bitters schrappen

""",
    29: """### Vraag 4

Scenario: educatieve avond met barrel-aged flight, deelnemers raken snel vermoeid.
Wat corrigeer je eerst?

A. Portiegrootte en pauzeritme ✅
B. Alleen glaswerk wisselen
C. Muziek harder zetten
D. Extra suiker serveren

### Vraag 5

Scenario: gast wil barrel-aged om 14:00 tijdens werkdag.
Meest professionele reactie?

A. Altijd weigeren
B. Klein proefvolume met duidelijke context en verwachting ✅
C. Dubbele schenking zonder uitleg
D. Vervangen door willekeurige cocktail

""",
    30: """### Vraag 4

Scenario: mixed groep met bestuurders en niet-drinkers wil premium beleving.
Wat is de sterkste kaartopbouw?

A. Een enkele zoete alcoholvrije optie
B. Meerdere alcoholvrije profielen met verschillende functies ✅
C. Alleen frisdrank
D. Geen alcoholvrij omdat "niet nodig"

### Vraag 5

Scenario: gast vraagt alcoholvrij bij gastronomisch gerecht met hoge intensiteit.
Welke keuze is logisch?

A. Water als enige optie
B. Alcoholvrije optie met voldoende textuur en lengte ✅
C. Laagste prijsproduct ongeacht stijl
D. Serveer niets bij het gerecht

""",
    31: """### Vraag 4

Scenario: twee topflessen beschikbaar, tafel is informeel en budgetbewust.
Wat bepaalt je keuze primair?

A. Hoogste score op internet
B. Match met context, doel en gezelschap ✅
C. Oudste fles altijd eerst
D. Etiket met meeste prestige

### Vraag 5

Scenario: viering met klein gezelschap en rustig tempo.
Welke fout wil je vermijden?

A. Te dure fles kiezen
B. Fles kiezen zonder rekening met servicemoment en drinkdoel ✅
C. Vooraf koelen
D. Korte toelichting geven

""",
    32: """### Vraag 4

Scenario: premiumfles opent gesloten en hoekig.
Wat is de beste eerste actie?

A. Meteen uitschenken zonder check
B. Tijdgestuurde herproefmomenten plannen en observeren ✅
C. Fles warm zetten naast warmtebron
D. Alles overhevelen en vergeten

### Vraag 5

Scenario: tafel vraagt waarom je wacht met serveren.
Welke uitleg is professioneel?

A. "Dat doen we altijd."
B. Korte toelichting over zuurstofontwikkeling en kwaliteitswinst ✅
C. Geen uitleg nodig
D. Verwijzen naar prijskaart

""",
    33: """### Vraag 4

Scenario: je moet beslissen of een fles binnen of buiten venster valt.
Welke aanpak is het meest robuust?

A. Exacte jaardatum als absolute waarheid
B. Vensterzone combineren met opslag- en proefsignalen ✅
C. Alleen kleur beoordelen
D. Beslissen op etiketontwerp

### Vraag 5

Scenario: twee identieke flessen presteren verschillend.
Wat is de beste verklaring?

A. Drinkvensters werken nooit
B. Flesvariatie en bewaarhistorie kunnen verschillen geven ✅
C. Alleen glaswerk is oorzaak
D. Altijd serverfout

""",
    34: """### Vraag 4

Scenario: kelder vol prestigeflessen maar lage rotatie.
Wat is je eerste managementstap?

A. Nog meer prestige inkopen
B. Rotatie- en allocatieplan opstellen per segment ✅
C. Prijzen willekeurig verhogen
D. Data negeren

### Vraag 5

Scenario: je verwacht seizoenspiek over zes maanden.
Welke voorbereiding is het sterkst?

A. Last-minute beslissen
B. Instroom, uitstroom en vervanging vooraf modelleren ✅
C. Alleen op gevoel inkopen
D. Topvoorraad bevriezen

""",
    35: """### Vraag 4

Scenario: reservekelder is sterk geconcentreerd in een regio.
Wat is het grootste risico?

A. Te veel variatie
B. Concentratierisico bij markt- of vraagschokken ✅
C. Te veel liquiditeit
D. Overmatig educatief potentieel

### Vraag 5

Scenario: team wil reservefles vrijgeven bij drukke service.
Wat heb je nodig?

A. Spontane beslissing ter plekke
B. Vooraf gedefinieerde releasecriteria ✅
C. Toeval en intuïtie
D. Alleen toestemming van gasten

""",
    36: """### Vraag 4

Scenario: vertical tasting levert veel discussie maar weinig bruikbare output.
Welke correctie is het meest effectief?

A. Nog meer jaargangen toevoegen
B. Strakker protocol met neutrale notatie en vaste volgorde ✅
C. Blind vervangen door vrije impressies
D. Minder pauzes inbouwen

### Vraag 5

Scenario: na tasting wil je directe operationele waarde.
Wat doe je eerst?

A. Alleen sociale media posten
B. Inzichten vertalen naar aankoop- en servicebeslissingen ✅
C. Notities wegleggen zonder vervolg
D. Slechts een winnaar benoemen

""",
    37: """### Vraag 4

Scenario: team scoort blind lager onder tijdsdruk dan in training.
Wat ontbreekt meestal?

A. Duurdere glazen
B. Getrainde timingcycli naast sensorische kennis ✅
C. Langere muziekpauzes
D. Meer willekeurige samples

### Vraag 5

Scenario: proever blijft te lang hangen in neusanalyse.
Welke interventie past?

A. Stap overslaan
B. Tijdsgrens per fase en door naar volgende observatie ✅
C. Onbeperkte tijd toestaan
D. Meteen stijl roepen zonder proeven

""",
    38: """### Vraag 4

Scenario: je overweegt magnum voor groot diner.
Welke factor weegt naast rijping het zwaarst?

A. Alleen statuswaarde
B. Logistiek: koeling, schenksnelheid en restvolume ✅
C. Kleur van etiket
D. Hoogte van de tafel

### Vraag 5

Scenario: kleine tafel met laag verbruikstempo.
Wat is vaak verstandiger?

A. Groot formaat forceren
B. Kleiner formaat kiezen om kwaliteit na openen te borgen ✅
C. Alles vooraf openen
D. Geen temperatuurcontrole

""",
    39: """### Vraag 4

Scenario: lang menu start om 16:00 en eindigt laat.
Wat is de beste pairingopbouw?

A. Meteen zwaar beginnen
B. Frisse start, middencomplexiteit, gecontroleerde diepte op einde ✅
C. Constant zelfde intensiteit
D. Alleen zoete pairings

### Vraag 5

Scenario: gast raakt halverwege verzadigd.
Welke aanpassing is logisch?

A. Intensiteit verhogen
B. Terugschakelen naar lichtere, energieke structuur ✅
C. Pairing stopzetten zonder alternatief
D. Alleen water serveren

""",
    40: """### Vraag 4

Scenario: teamleden maken verschillende keuzes bij vergelijkbare tafels.
Wat ontbreekt?

A. Meer individuele vrijheid
B. Gemeenschappelijke beslisvolgorde met contextruimte ✅
C. Hogere prijzen
D. Langere menukaart

### Vraag 5

Scenario: je eigen systeem werkt niet bij uitzonderingen.
Wat is de beste verbetering?

A. Meer rigiditeit toevoegen
B. Feedbacklus inbouwen en regels periodiek herijken ✅
C. Systeem schrappen zonder vervanging
D. Alleen intuities volgen

""",
    41: """### Vraag 4

Scenario: topfles, maar tafel is gehaast en afgeleid.
Wat is waarschijnlijk de grootste bedreiging voor "perfect moment"?

A. Productkwaliteit
B. Context-mismatch tussen tempo en servicekeuze ✅
C. Glasinhoud
D. Menukaarttaal

### Vraag 5

Scenario: vlak voor serveren verandert stemming aan tafel.
Wat doe je?

A. Plan negeren
B. Microbijsturen op tempo, toelichting en eventueel stijlrichting ✅
C. Service uitstellen zonder uitleg
D. Alles annuleren

""",
    42: """### Vraag 4

Scenario: wijn opent nog gesloten, maar hoofdgerecht staat klaar.
Wat is professioneel?

A. Altijd wachten tot maximale expressie
B. Trade-off expliciet maken en keuze afstemmen op tafelmoment ✅
C. Alleen keuken laten beslissen
D. Fles direct vervangen zonder reden

### Vraag 5

Scenario: team discussieert over snelheid versus kwaliteit.
Wat helpt het meest?

A. Onuitgesproken laten
B. Prioriteit helder benoemen en consequent uitvoeren ✅
C. Besluit per medewerker laten wisselen
D. Alleen op senioriteit varen

""",
    43: """### Vraag 4

Scenario: terugkerende gast bestelt onverwacht buiten eerder patroon.
Hoe reageer je best?

A. Oud patroon afdwingen
B. Huidige context checken en patroon als hypothese gebruiken ✅
C. Advies volledig stoppen
D. Alleen goedkoopste optie noemen

### Vraag 5

Scenario: je wilt patroondata inzetten voor beter advies.
Wat is essentieel?

A. Data statisch opslaan zonder update
B. Patronen periodiek herijken met recente interacties ✅
C. Alleen leeftijd registreren
D. Patroon gelijkstellen aan identiteit

""",
    44: """### Vraag 4

Scenario: open examen casus geeft meerdere verdedigbare routes.
Wat verhoogt je score het meest?

A. Snelste antwoord zonder uitleg
B. Transparante redenering met aannames, keuze en alternatief ✅
C. Alleen memoriseerde theorie reproduceren
D. Casus herhalen zonder besluit

### Vraag 5

Scenario: beoordelaar bevraagt je keuze kritisch.
Wat is de beste respons?

A. Verdedigen met autoriteit
B. Onderbouwen met context, risico en evaluatieplan ✅
C. Antwoord terugtrekken zonder argument
D. Verwijzen naar persoonlijke smaak

""",
    45: """### Vraag 4

Scenario: je presteert soms briljant maar niet consequent.
Wat ontbreekt voor meesterschap?

A. Meer toeval
B. Reproduceerbaar proces met continue kalibratie ✅
C. Hogere prijskaart
D. Striktere dresscode

### Vraag 5

Scenario: complexe servicecontext verandert voortdurend.
Welke houding past bij capstone-niveau?

A. Star vasthouden aan eerste keuze
B. Scherp beslissen en adaptief bijsturen op nieuwe signalen ✅
C. Besluiten uitstellen tot perfectie
D. Alleen op eerdere successen vertrouwen

""",
}


PRAKTIJK_P2: dict[int, str] = {
    31: (
        "Bouw een fleskeuze-matrix voor drie scenario's (zakelijke lunch, private dinner, collector night). "
        "Leg per scenario je primaire en secundaire keuze vast met argumenten op context, budget en drinkdoel."
    ),
    32: (
        "Voer een openen-wachten protocol uit met twee flessen van verschillende stijl. "
        "Noteer observaties op 0, 10 en 20 minuten en formuleer een servicebesluit per meetpunt."
    ),
    33: (
        "Maak voor tien flessen een drinkvenster-kaart met drie zones: nu, binnenkort, later. "
        "Koppel elke inschatting aan minimaal twee concrete signalen of databronnen."
    ),
    34: (
        "Ontwerp een topvoorraad-plan voor zes maanden met segmenten snel, midden en lang ritme. "
        "Benoem per segment gewenste rotatiesnelheid en trigger voor herbevoorrading."
    ),
    35: (
        "Evalueer je reservekelder op spreiding en concentratierisico. "
        "Stel een reservebeleid op met releasecriteria, vervangregels en kwartaalreview."
    ),
    36: (
        "Ontwerp en leid een mini-vertical met minimaal drie jaargangen. "
        "Gebruik een vast protocol en sluit af met drie operationele conclusies voor aankoop of service."
    ),
    40: (
        "Bouw je eigen beslissysteem in maximaal zeven stappen, van contextcheck tot eindadvies. "
        "Test het systeem op vijf uiteenlopende cases en noteer waar het moet worden bijgesteld."
    ),
    44: (
        "Werk een open examen-casus uit met volledige redenering: aannames, opties, keuze, risico en evaluatie. "
        "Laat je uitwerking peer-reviewen en verwerk minimaal twee kritische verbeterpunten."
    ),
    45: (
        "### Opdracht\n\n"
        "Maak je **Personal Biodynamic Drinking Manifest** met minimaal tien observaties, vijf conclusies "
        "en drie concrete openingsstrategieën. Koppel elk punt aan een voorbeeld uit je voorraad of service.\n\n"
        "### Checklist\n\n"
        "- [ ] Ik noteerde favoriete dagtypes en gevoelige stijlen\n"
        "- [ ] Ik beschreef ideale weersomstandigheden per scenario\n"
        "- [ ] Ik formuleerde drie openingsstrategieën met risico-inschatting\n"
        "- [ ] Ik definieerde hoe ik mijn systeem de komende 90 dagen kalibreer"
    ),
}


QUIZ_FULL_P2: dict[int, str] = {
    45: """### Vraag 1

Wat definieert biodynamisch meesterschap het best?

A. Altijd hetzelfde dagtype volgen
B. Consistente besluitkwaliteit onder veranderende context ✅
C. Alleen dure flessen openen
D. Volledig intuïtief werken zonder notities

### Vraag 2

Welke gewoonte ondersteunt permanente kalibratie?

A. Eenmalig systeem ontwerpen en nooit wijzigen
B. Periodieke review van beslissingen met meetbare indicatoren ✅
C. Alleen blindproeven op feestdagen
D. Voorraad nooit roteren

### Vraag 3

Wat hoort in een capstone-manifest?

A. Alleen favoriete wijnen
B. Observaties, conclusies en concrete openingsstrategieën ✅
C. Lijst met prijzen
D. Alleen app-screenshots

### Vraag 4

Scenario: je presteert soms briljant maar niet consequent.
Wat ontbreekt voor meesterschap?

A. Meer toeval
B. Reproduceerbaar proces met continue kalibratie ✅
C. Hogere prijskaart
D. Striktere dresscode

### Vraag 5

Scenario: complexe servicecontext verandert voortdurend.
Welke houding past bij capstone-niveau?

A. Star vasthouden aan eerste keuze
B. Scherp beslissen en adaptief bijsturen op nieuwe signalen ✅
C. Besluiten uitstellen tot perfectie
D. Alleen op eerdere successen vertrouwen
""",
}

QUIZ_COUNT_OVERRIDES_P2: dict[int, int] = {45: 5}

QUIZ_FEEDBACK_P2: dict[int, str] = {
    42: (
        "Sterk. Je ziet nu dat kwaliteit en timing elkaar ontsluiten — potentieel zonder moment blijft onzichtbaar."
    ),
    43: (
        "Goed. Je leert voorkeurspatronen lezen als data, niet als persoonlijke waarheid — dat maakt advies scherper."
    ),
    44: (
        "Uitstekend. Je integreert dagtype, weer en voorraad tot één onderbouwde beslissing — examenniveau."
    ),
    45: (
        "Meesterschap bewezen. Je kiest consistent op basis van observatie, context en professionele discipline."
    ),
}


def apply_part2() -> None:
    from bio_gold_master_data import (
        LEERDOELEN,
        THEORY_OVERRIDES,
        DRINKMOMENT,
        PRO_INSIGHTS,
        REFLECTIEVRAGEN,
        SUMMARIES,
        GOLD_KEY_CONCEPTS,
        QUIZ_PATCHES,
        PRAKTIJK,
        QUIZ_FEEDBACK,
        QUIZ_FULL,
        QUIZ_COUNT_OVERRIDES,
    )

    for d_src, d_dst in [
        (LEERDOELEN_P2, LEERDOELEN),
        (THEORY_OVERRIDES_P2, THEORY_OVERRIDES),
        (DRINKMOMENT_P2, DRINKMOMENT),
        (PRO_INSIGHTS_P2, PRO_INSIGHTS),
        (REFLECTIEVRAGEN_P2, REFLECTIEVRAGEN),
        (SUMMARIES_P2, SUMMARIES),
        (GOLD_KEY_CONCEPTS_P2, GOLD_KEY_CONCEPTS),
        (QUIZ_PATCHES_P2, QUIZ_PATCHES),
        (PRAKTIJK_P2, PRAKTIJK),
        (QUIZ_FEEDBACK_P2, QUIZ_FEEDBACK),
        (QUIZ_FULL_P2, QUIZ_FULL),
        (QUIZ_COUNT_OVERRIDES_P2, QUIZ_COUNT_OVERRIDES),
    ]:
        d_dst.update(d_src)
