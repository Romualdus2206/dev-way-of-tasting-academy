"""Beer Gold Master final data - part 2 (lessons 21-40)."""

from __future__ import annotations

TERMINOLOGY_LOCK: list[str] = [
    "troebelheid",
    "attenuatie",
    "koolzuur",
    "mondgevoel",
    "afdronk",
    "gistprofiel",
    "hopbitterheid",
    "roostermout",
    "umami",
    "serveertemperatuur",
]

THEORY_PREMIUM_21_40: dict[int, str] = {
    21: (
        "Dubbel is een klassieke Belgische abdijstijl waarin moutdiepte centraal staat. "
        "Het profiel draait om karamel, donker gedroogd fruit en een ronde, warme textuur die "
        "vol aanvoelt zonder plakkerig te worden.\n\n"
        "Historisch is Dubbel verbonden met abdijbrouwerijen die balans zochten tussen kracht, "
        "drinkbaarheid en complexiteit. De kunst zit in gecontroleerde vergisting: genoeg "
        "restzoetheid voor body, maar voldoende vergistingsgraad om de afdronk levend te houden.\n\n"
        "Professioneel proef je Dubbel dus niet alleen op kleur, maar op structuur: hoe moutzoetheid, "
        "koolzuur en milde bitterheid elkaar in evenwicht houden. Dat maakt de stijl gastronomisch breed "
        "inzetbaar, vooral bij gerechten met umami, vet en gekaramelliseerde smaken."
    ),
    22: (
        "Tripel is een Belgisch sterk blond bier dat paradoxaal werkt: hoog alcoholgehalte, maar een relatief "
        "droge en elegante afdronk. Juist die spanning maakt Tripel technisch en gastronomisch interessant.\n\n"
        "De stijl bouwt op hoge attenuatie, een expressief gistprofiel en een zorgvuldig bitter kader. "
        "Daardoor behoudt het bier spanning in het glas, in plaats van log of zoet te worden. "
        "Alcohol geeft volume, terwijl droogheid de doordrinkbaarheid bewaakt.\n\n"
        "In professionele service behandel je Tripel als een krachtig maar verfijnd bier. "
        "Je schenkt met aandacht voor aroma-opbouw en tempo, omdat de combinatie van alcoholwarmte, "
        "kruidige esters en droge finish snel de totale beleving bepaalt."
    ),
    23: (
        "Quadrupel is een intens, donker en gelaagd bier waarin concentratie van mout, alcohol en oxidatieve "
        "rijpingstonen vaak samenkomen. De stijl vraagt rust, aandacht en een kleiner serveervolume.\n\n"
        "In de kern draait Quadrupel om diepte: tonen van vijg, rozijn, toffee en soms lichte oxidatieve nuances "
        "zoals gedroogd fruit of notigheid. Bitterheid staat op de achtergrond en ondersteunt vooral de balans "
        "van zoetheid en warmte.\n\n"
        "Voor sommeliers is Quadrupel een digestiefstijl met culinaire potentie, vooral bij kaas en desserts. "
        "De professionele toets is hier beheersing: niet zoeken naar brute kracht, maar naar de mate waarin "
        "alcohol, restzoet en aromatische complexiteit in harmonie blijven."
    ),
    24: (
        "Saison is historisch een boerenbier uit Wallonie, bedoeld als verfrissend en doordrinkbaar tafelbier "
        "voor seizoensarbeid. De moderne stijl behoudt die identiteit via droogheid, levendig koolzuur en kruidige spanning.\n\n"
        "Wat Saison onderscheidt is de combinatie van hoge vergistingsgraad en uitgesproken gistkarakter. "
        "Peperige fenolen, subtiele esters en een slanke body geven een strak maar aromatisch profiel dat "
        "zeer geschikt is voor gastronomie.\n\n"
        "Professioneel beoordeel je Saison op precisie: de stijl mag expressief zijn, maar nooit rommelig. "
        "Wanneer koolzuur, bitterheid en droge afdronk exact op elkaar aansluiten, ontstaat een bier dat "
        "vet, zout en kruid in gerechten uitzonderlijk goed balanceert."
    ),
    25: (
        "Abdijbier en Trappist worden vaak als synoniemen gebruikt, maar technisch en juridisch zijn het "
        "verschillende categorieen. Trappist verwijst naar gecontroleerde herkomst en productievoorwaarden, "
        "niet naar een specifiek smaakprofiel.\n\n"
        "Het Authentic Trappist Product-keurmerk vraagt dat brouwen onder toezicht van een trappistenabdij gebeurt "
        "en dat opbrengsten de kloostergemeenschap en goede doelen ondersteunen. Abdijbier kan stilistisch vergelijkbaar zijn, "
        "maar mist die institutionele certificering.\n\n"
        "In gastcommunicatie is dit onderscheid commercieel relevant: je verkoopt transparantie en context. "
        "Een professional positioneert Trappist niet als 'beter', maar als anders gedekt in oorsprong, governance en verhaal."
    ),
    26: (
        "IPA is geevolueerd van historisch exportbier naar een brede familie waarin hoparoma en hopbitterheid "
        "de centrale bouwstenen vormen. Moderne interpretaties leggen soms meer nadruk op aroma dan op harde bitterheid.\n\n"
        "De stijl draait technisch om hopkeuze, timing en oxidatiecontrole. Koude en late hopgiften sturen citrus, dennen, "
        "tropisch fruit of hars, terwijl moutbasis en vergistingsgraad bepalen hoe bitterheid wordt ervaren.\n\n"
        "Professioneel is IPA een stijl waarin versheid cruciaal is. Goede service betekent dat je batchleeftijd, "
        "aroma-intensiteit en bitterheidsprofiel actief meeweegt in advies en pairing."
    ),
    27: (
        "NEIPA, of New England IPA, verschuift het IPA-paradigma van harde bitterheid naar sappige aromatische intensiteit "
        "en een zachter mondgevoel. Troebelheid is hier functioneel, geen visueel defect.\n\n"
        "De stijl gebruikt vaak hoge dry-hopdoseringen, chloride-gedreven waterprofielen en eiwitrijke granen "
        "om een rond, vol en 'juicy' profiel te bouwen. Bitterheid blijft aanwezig, maar is meestal korter en zachter.\n\n"
        "Voor professionals is NEIPA vooral een stijl van timing en conditie. De kwaliteitspiek ligt vroeg; oxidatie "
        "kan snel kleur en aroma veranderen. Correct voorraadbeheer is daarom even belangrijk als correcte schenktechniek."
    ),
    28: (
        "Porter is een klassieke Engelse donkere stijl waarin roostermout, cacao en zachte karameltonen "
        "samenvallen tot een gebalanceerd geheel. In moderne context varieert Porter van droog en slank tot rijk en romig.\n\n"
        "Historisch ontstond Porter als stedelijk werkbier met duidelijke moutsignatuur. In vergelijking met veel stouts "
        "is roast vaak minder agressief, waardoor chocolade- en broodkorsttonen beter uitwaaieren.\n\n"
        "Professioneel biedt Porter veel culinaire flexibiliteit. Het bier kan zowel hartige roostergerechten als cacao-desserts "
        "dragen, zolang de intensiteit van gerecht en roastniveau op elkaar zijn afgestemd."
    ),
    29: (
        "Stout is een donkere bierfamilie met nadruk op geroosterde expressie: koffie, cacao, soms drop of asachtige tonen, "
        "afhankelijk van recept en moutkeuze. De stijl omvat droge, zoete, oatmeal en imperial varianten.\n\n"
        "Waar Porter vaak ronder begint, zet Stout doorgaans steviger in op roaststructuur. De waargenomen bitterheid komt "
        "niet alleen uit hop, maar ook uit geroosterde granen. Daardoor voelt de bitterlijn anders aan dan bij IPA.\n\n"
        "In professionele blindproeverij is dit onderscheid essentieel: hopbitterheid stijgt vooral in de midden- tot "
        "achtertonen, terwijl roastbitterheid eerder droog en korrelig opbouwt. Dat sensorische verschil voorkomt veel misclassificaties."
    ),
    30: (
        "Barleywine benadert bier vanuit wijnlogica: hoge beginstamwort, stevige alcohol en potentieel voor rijping. "
        "De stijl kan Engels-georienteerd (moutdominant) of Amerikaans-georienteerd (meer hopgedreven) zijn.\n\n"
        "Typisch zijn tonen van toffee, gedroogd fruit, noten en warme alcohol, met een mondgevoel dat breed en langzaam ontwikkelt. "
        "Door tijd kan het profiel extra diepte krijgen, mits oxidatie beheerst verloopt.\n\n"
        "Professioneel schenk je Barleywine in kleine porties en op een iets hogere temperatuur dan standaard tapbier. "
        "Dat geeft ruimte aan aroma en textuur, en positioneert het bier correct als contemplatief eindglas."
    ),
    31: (
        "Serveertemperatuur is een primaire kwaliteitshefboom in bierservice. Te koud dempt aroma en maakt bitterheid hoekiger; "
        "te warm vergroot zoetheid en alcoholindruk tot onevenwicht.\n\n"
        "Elke stijl heeft een functioneel temperatuurbereik waarin koolzuur, volatiliteit en mondgevoel optimaal samenwerken. "
        "Lichte lagers vragen koeler om frisheid en crispheid te behouden, terwijl complexere ales warmer kunnen om aromatische diepte te tonen.\n\n"
        "Professioneel werken met temperatuur betekent dus sturen, niet gokken. Je gebruikt stijlkennis, glaskeuze en servicesnelheid "
        "als een geheel systeem om in elk glas de bedoelde balans te leveren."
    ),
    32: (
        "Glaswerk is een technisch instrument dat aroma-opbouw, schuimstabiliteit en mondperceptie actief beinvloedt. "
        "De vorm van kelk, opening en steel verandert hoe bier op neus en tong wordt ervaren.\n\n"
        "Een smalle opening concentreert vluchtige aromaten; een bredere opening geeft snellere expressie. "
        "Hoog glas ondersteunt koolzuurlift en schuimkraag bij tarwebieren, terwijl tulpvormen complexere neuslagen "
        "bij IPA, Tripel en Stout zichtbaar maken.\n\n"
        "In professionele service kies je glas niet op esthetiek, maar op functionele match met stijl en context. "
        "Dat maakt het verschil tussen correct schenken en echt presenteren."
    ),
    33: (
        "Schenktechniek bepaalt direct de kwaliteit van het moment waarop bier wordt ervaren. Hoek, hoogte en tempo van schenken "
        "sturen schuimvorming, koolzuurretentie en aroma-release.\n\n"
        "Een gecontroleerde tweefasen-schenking geeft eerst rust in de vloeistof en bouwt daarna een stabiele schuimkraag op. "
        "Zo bescherm je oxidatiegevoelige aromaten en voorkom je zowel overschuim als vlakke presentatie.\n\n"
        "Professioneel is techniek ook economisch: consistent schenken beperkt verspilling en houdt service reproduceerbaar. "
        "Voor de gast vertaalt dat zich in een glas dat tegelijk visueel correct en sensorisch volledig is."
    ),
    34: (
        "Bewaren en rijpen zijn geen synoniemen voor elk bier. Sommige stijlen profiteren van tijd, andere verliezen vooral "
        "hun kernkwaliteit door oxidatie, lichtschade of aromaverlies.\n\n"
        "Hopgedreven bieren zoals IPA en NEIPA tonen hun beste profiel jong, terwijl sterke moutgedreven stijlen zoals "
        "Quadrupel en Barleywine gecontroleerd kunnen evolueren. Temperatuurstabiliteit, donkerte en rechtop opslag "
        "blijven de basisvoorwaarden.\n\n"
        "Professioneel voorraadbeheer betekent dat je stijltype koppelt aan rotatiesnelheid en serveermoment. "
        "Rijping is pas waardevol wanneer ze doelgericht gebeurt en je sensorisch kunt onderbouwen wat er gewonnen is."
    ),
    35: (
        "Bier en kaas vormen een van de meest betrouwbare gastronomische combinaties omdat bier meerdere tegenkrachten "
        "tegelijk biedt: koolzuur tegen vet, bitterheid tegen zout en moutzoetheid tegen scherpe rijpingsranden.\n\n"
        "De kernregel is intensiteitsmatching: jonge, frisse kazen vragen lichtere bieren, terwijl gerijpte of blauwe kazen "
        "om meer alcohol, body en aromatische diepte vragen. Structuur is belangrijker dan kleur.\n\n"
        "Professioneel pair je kaas daarom niet op merknaam maar op matrix: zout, vet, umami en textuur. "
        "Dat maakt bierpairing met kaas vaak preciezer stuurbaar dan klassieke wijnpairing."
    ),
    36: (
        "Bier en vlees pairing draait om de interactie tussen eiwit, vet, Maillard-tonen en sausstructuur. "
        "Bier biedt met koolzuur en bitterheid actieve reiniging waar wijn dat minder direct doet.\n\n"
        "Hopprofielen kunnen gekruid of vet vlees liften, terwijl roostermout gegrilde en gekaramelliseerde tonen spiegelt. "
        "Moutzoetheid kan pittigheid afronden, maar moet voldoende bitter tegengewicht houden om niet log te worden.\n\n"
        "Professioneel start je bij de saus, niet bij het stuk vlees alleen. De saus bepaalt vaak de dominante smaakas, "
        "en dus of je richting IPA, Dubbel, Porter of Stout moet bewegen."
    ),
    37: (
        "Bier en dessert vraagt strak zoetheidsmanagement. Wanneer het bier zoeter is dan het dessert, kan de combinatie vlak worden; "
        "wanneer het bier te bitter en te dun is, wordt het dessert hard en metalig.\n\n"
        "Roostermout werkt sterk bij cacao en koffiecomponenten, terwijl moutzoetheid en alcohol body geven bij romige texturen. "
        "Fruitzuren in desserts vragen juist lichtere, frissere bierstijlen met voldoende lift.\n\n"
        "Professioneel kies je bewust tussen spiegeling en contrast. De beste pairing is niet per se de meest intense, "
        "maar degene die de textuur en smaaklengte van beide componenten verlengt."
    ),
    38: (
        "Blind onderscheid tussen Lager en Ale vraagt discipline in observatievolgorde. Je kijkt eerst naar aromatische expressie, "
        "daarna naar gistkarakter, koolzuurindruk en afdronkstructuur.\n\n"
        "Lager toont vaak een schoner profiel met strakkere bitterlijn, terwijl Ale doorgaans meer esters en een rondere "
        "fermentatiehandtekening laat zien. Uitzonderingen bestaan, dus je werkt met waarschijnlijkheden, niet met slogans.\n\n"
        "Professioneel blindproeven betekent dat je hypothesen stap voor stap uitsluit. Het doel is niet snel raden, "
        "maar reproduceerbaar redeneren op basis van sensorische data."
    ),
    39: (
        "Blind IPA versus Stout onderscheiden lijkt eenvoudig op kleur, maar betrouwbare identificatie vraagt focus op bitterheidstype, "
        "aromaprofiel en mondstructuur. Visuele cues kunnen misleidend zijn door moderne interpretaties.\n\n"
        "IPA geeft vooral hopgedreven aromaten en een bitterlijn die vaak citrus, hars of tropisch fruit begeleidt. "
        "Stout bouwt bitterheid vanuit roast op en laat koffie, cacao en soms asachtige droogte domineren.\n\n"
        "Professioneel hanteer je een vaste beslisvolgorde: neus, eerste slok, middenpalet, afdronk. "
        "Zo maak je onderscheid op mechanisme in plaats van op vooroordeel."
    ),
    40: (
        "Het examen is de integratietoets van Beer Academy: theorie, stijlkunde, service, pairing en blindanalyse komen samen "
        "in een enkele professionele prestatie. Je bewijst niet alleen kennis, maar ook toepasbaarheid.\n\n"
        "Beoordeling draait om consistentie: kun je stijlkenmerken correct benoemen, keuzes onderbouwen en sensorische observaties "
        "vertalen naar praktische service- en pairingadviezen. Het is een toets van oordeel, niet alleen geheugen.\n\n"
        "Professioneel is dit eindpunt tegelijk een startpunt. De waarde van het certificaat ligt in de kwaliteit van je vervolgpraktijk: "
        "blijven trainen, kalibreren en verfijnen op de vloer en aan tafel."
    ),
}

PRO_INSIGHTS_21_40: dict[int, str] = {
    21: "Verkoop Dubbel op structuur, niet op kleur: leg uit hoe karamelmout en koolzuur samen vetrijke gerechten dragen zonder zwaar te vallen.",
    22: "Bij Tripel waarschuw je vriendelijk op drinktempo; de droge afdronk maskeert alcohol en verhoogt het risico dat gasten de kracht onderschatten.",
    23: "Schenk Quadrupel in kleiner glas en met expliciete context als digestief; dat verhoogt beleving en verlaagt retour door 'te zwaar' verwachtingen.",
    24: "Saison is een servicewapen bij kruidige keuken: benoem droogheid en gistpeper als argument waarom het bier vet opruimt zonder zoet te plakken.",
    25: "Gebruik Trappist vs abdijbier als storytelling met feiten: certificering, toezicht en bestemming van opbrengst versterken vertrouwen en upsell.",
    26: "Vraag bij IPA altijd naar aromavoorkeur (citrus, hars, tropisch) in plaats van alleen bitterheid; zo stuur je sneller naar een passende keuze.",
    27: "Houd NEIPA vers op de kaart en roteer actief; transparantie over batchversheid voorkomt teleurstelling en positioneert je als vakinhoudelijk sterk.",
    28: "Porter werkt uitstekend als brugstijl voor wijndrinkers: chocolade en roast bieden herkenning, terwijl koolzuur het palet schoner houdt.",
    29: "Train teamleden op roastniveaus zodat niet elke donkere bierorder automatisch Guinness wordt; precisie in stijladvies verhoogt geloofwaardigheid.",
    30: "Positioneer Barleywine als 'bier met wijnritme': klein schenken, rustiger tempo, en expliciet adviseren bij kaas of dessert in plaats van als dorstbier.",
    31: "Een zichtbare temperatuurkaart achter de bar verlaagt discussies en fouten; servicekwaliteit wordt meetbaar wanneer iedereen op dezelfde ranges werkt.",
    32: "Glaswerk is omzetgevoelig: juiste glaskeuze verhoogt aromabeleving en rechtvaardigt premium-prijs zonder extra productkosten.",
    33: "Consistente schenktraining verbetert marge direct; minder overschuim betekent minder verlies en tegelijk een professionelere gastervaring.",
    34: "Communiceer eerlijk dat niet elk bier beter wordt met tijd; juist dat onderscheid tussen bewaren en snel drinken maakt je advies betrouwbaar.",
    35: "Bij kaasplanken verkoop je bierpairing met het argument 'koolzuur snijdt vet'; dat is voor gasten direct voelbaar en makkelijker te begrijpen dan theorie.",
    36: "Begin vleespairing altijd bij saus en bereiding, niet bij diersoort; die aanpak voorkomt mismatch en maakt je aanbeveling concreet.",
    37: "Dessertadvies start met relatieve zoetheid: kies bier dat het dessert ondersteunt of contrasteert, maar nooit volledig overstemt.",
    38: "In blindtraining geldt: eerst neusdata noteren, dan pas stijl roepen; die volgorde verhoogt nauwkeurigheid en verlaagt gokgedrag in teamsessies.",
    39: "Leer personeel het verschil tussen hopbitter en roastbitter benoemen; dat ene onderscheid lost de meeste IPA/Stout-blindfouten op.",
    40: "Na examenresultaten plan je gerichte retraining per zwakke competentie; continue kalibratie is waardevoller dan eenmalig certificeren.",
}

FOOD_PAIRING_WAAROM_21_40: dict[int, str] = {
    21: "Dubbel combineert sterk met stoof en abdijkaas omdat moutzoetheid zout en umami afrondt, terwijl koolzuur vet lichter maakt en milde bitterheid het geheel droog houdt.",
    22: "Tripel werkt bij romige sauzen en gevogelte doordat hoge attenuatie en droge afdronk vet neutraliseren; kruidige esters geven aromabrug zonder extra zoetheid.",
    23: "Quadrupel past bij wild en blauwschimmel omdat alcoholwarmte en restzoetheid de intensiteit dragen, terwijl subtiele bitterheid voorkomt dat suikers plakkerig worden.",
    24: "Saison pairt met geitenkaas en kruidige gerechten via hoog koolzuur, peperige fenolen en droge finish; dit snijdt door vet en houdt kruidigheid scherp.",
    25: "Bij abdij- en trappiststijlen is pairing technisch gebaseerd op zout-vet-umami-balans: koolzuur reinigt, esters bouwen brug met rijpingstonen en bitterheid tempert zoutpiek.",
    26: "IPA ondersteunt pittig en vet eten doordat hopbitterheid en koolzuur capsaicine structureren; citrusachtige hopesters verfrissen rijke sauzen.",
    27: "NEIPA werkt bij fried chicken en umami bowls omdat zachte bitterheid niet botst met kruid, terwijl troebel mondgevoel en lage scherpte vet afgerond laten proeven.",
    28: "Porter sluit aan op geroosterd vlees en cacao door roostermout en milde zoetheid; koolzuur snijdt door vet en roast versterkt Maillard-smaken.",
    29: "Stout combineert met oesters, stoof en chocolade omdat roastbitterheid umami verdiept, terwijl romiger body en gecontroleerde zoetheid textuurverbinding geven.",
    30: "Barleywine past bij blauwe kaas en karamel-desserts door hoge alcohol, concentratie en oxidatieve diepte; zoetheid vangt zout op en bitterheid houdt de finish strak.",
    31: "Juiste serveertemperatuur bepaalt pairing-impact: te koud onderdrukt esters en maakt bitterheid hard, te warm vergroot zoetheid en verstoort balans met vet of zuur.",
    32: "Glasvorm stuurt aroma-afgifte en schuimstabiliteit, waardoor dezelfde pairing anders werkt: betere neusconcentratie verhoogt waarneming van esters, roast en hop.",
    33: "Correct schenken bewaart koolzuur en bouwt stabiel schuim, essentieel om vetrijke gerechten te liften en oxidatieve tonen die pairing verstoren te vermijden.",
    34: "Bij bewaren en rijping verschuift pairinglogica: vers hopbier verliest fruitige esters, terwijl gerijpte sterke ales meer oxidatieve notigheid krijgen voor kaas en desserts.",
    35: "Bier en kaas werkt technisch via koolzuur tegen vet, bitterheid tegen zout en moutzoetheid tegen pikante rijpingsrand; umami wordt zo dieper maar niet log.",
    36: "Bier en vlees vraagt matching op vet, umami en roostering: hopbitterheid snijdt vet, roostermout spiegelt grilltonen en koolzuur verfrist na elke hap.",
    37: "Bij desserts balanceer je zoetheid en bitterheid: roast in Stout vangt cacao, terwijl esters en alcohol in zwaardere ales romigheid dragen zonder suikerverzadiging.",
    38: "Blind Lager vs Ale pairing wordt betrouwbaarder als je eerst gistkarakter en afdronk vastlegt; schone profielen werken vaak beter met zout/vet, esterrijke met kruid/zuur.",
    39: "Blind IPA vs Stout onderscheid je in pairing op bitterbron: hopbitter volgt spice en zuuraccenten, roastbitter ondersteunt cacao, braad en umami-rijke componenten.",
    40: "In het examen toon je waarom elke pairing werkt via meetbare assen: koolzuur, bitterheid, zoetheid, roast, esters, umami, vet, zout en zuur in onderlinge balans.",
}

REFLECTIEVRAGEN_21_40: dict[int, str] = {
    21: "Welke sensorische cue geeft jou in Dubbel de meeste zekerheid: donker fruit, karamelmout, koolzuurstructuur of afdronk - en waarom juist die?",
    22: "Wanneer je Tripel als 'te zwaar' ervaart, ligt dat dan aan alcoholwarmte, glaskeuze, serveertemperatuur of restzoetheid volgens jouw proefdata?",
    23: "Hoe onderscheid jij blind Quadrupel van Barleywine als beide vergelijkbare alcohol hebben, en welke observatie is dan doorslaggevend?",
    24: "Welke fout zie je vaker bij Saison-service: te koud schenken of onderschatte koolzuurdruk, en wat doet dat met je stijlconclusie?",
    25: "Welke vraag stel je aan een etiket om Trappist en abdijbier betrouwbaar te scheiden zonder op marketingtaal te vertrouwen?",
    26: "Bij IPA met veel aroma maar lage bitterheid: noem je dit stijltypisch modern of afwijkend, en op basis van welke technische argumenten?",
    27: "Hoe beoordeel je of een NEIPA nog op piek is: welke combinatie van kleur, aromaverlies en mondgevoel gebruik je als beslisregel?",
    28: "Wanneer kies je in pairing bewust Porter boven Stout, en welke rol spelen roastintensiteit en zoetheidsbalans in die keuze?",
    29: "Welke proefstap helpt jou het meest om roastbitterheid van hopbitterheid te scheiden in Stout-achtige bieren?",
    30: "Welke drie signalen bepalen volgens jou of een Barleywine nu schenken beter is dan verder laten rijpen?",
    31: "Bij een klacht 'te koud': hoe herkalibreer jij snel temperatuur zonder stijlkarakter of schuimkwaliteit te verliezen?",
    32: "Wanneer wijk jij bewust af van het klassieke glasadvies, en welk effect verwacht je dan op aroma, schuim en gastbeleving?",
    33: "Welke schenkfout kost in jouw service de meeste kwaliteit: te agressieve straal, verkeerd glashoek of te late schuimopbouw?",
    34: "Hoe bepaal je praktisch welke bieren in jouw voorraad rotatie nodig hebben en welke gecontroleerde rijping verdienen?",
    35: "Bij blauwe kaas: kies je eerder Dubbel, Tripel of Quadrupel, en hoe onderbouw je dat met zout-vet-umami in plaats van smaakvoorkeur?",
    36: "Wat is bij vleespairing jouw eerste beslispunt: bereiding, vetgehalte of saus, en waarom geeft dat de beste voorspelkracht?",
    37: "Wanneer kies jij bij dessert voor contrast en wanneer voor spiegeling, en welke fout probeer je daarmee expliciet te voorkomen?",
    38: "Welke volgorde van observaties gebruik je blind om Lager vs Ale te bepalen, en waar maak je statistisch de meeste misclassificaties?",
    39: "Welke eigenschap na de eerste slok laat jou het snelst kiezen tussen IPA en Stout, los van kleur of verwachting?",
    40: "Welk examenonderdeel vraagt voor jou de hoogste transfer van kennis naar praktijk, en hoe ga je dat na certificering gericht trainen?",
}

GOLD_KEY_CONCEPTS_21_40: dict[int, list[str]] = {
    21: ["dubbel", "karamelmout", "donker fruit", "abdijstijl", "balans"],
    22: ["tripel", "attenuatie", "gistprofiel", "droge afdronk", "alcoholwarmte"],
    23: ["quadrupel", "restzoetheid", "oxidatieve rijping", "digestief", "intensiteit"],
    24: ["saison", "fenolen", "droogheid", "koolzuur", "boerenbier"],
    25: ["trappist", "abdijbier", "certificering", "authenticiteit", "herkomstcontrole"],
    26: ["ipa", "hopbitterheid", "hoparoma", "versheid", "dry-hopping"],
    27: ["neipa", "troebelheid", "juicy profiel", "chloridebalans", "oxidatiegevoeligheid"],
    28: ["porter", "roostermout", "cacaotonen", "maillard", "moutbalans"],
    29: ["stout", "roastbitterheid", "koffietonen", "body", "stijlvariant"],
    30: ["barleywine", "hoge beginstamwort", "rijpingspotentieel", "alcoholstructuur", "moutdiepte"],
    31: ["serveertemperatuur", "aroma-volatiliteit", "koolzuurretentie", "smaakbalans", "stijlrange"],
    32: ["glaswerk", "aromaconcentratie", "schuimstabiliteit", "mondperceptie", "presentatietechniek"],
    33: ["schenktechniek", "tweefasen-schenking", "schuimkraag", "oxidatiebeperking", "koolzuurbehoud"],
    34: ["bewaarcondities", "rijping", "lichtschade", "rotatiebeheer", "houdbaarheid"],
    35: ["bier-kaaspairing", "vetreiniging", "zoutbalans", "umami", "intensiteitsmatching"],
    36: ["bier-vleespairing", "eiwitinteractie", "roostering", "sausdominantie", "vetbalans"],
    37: ["bier-dessertpairing", "zoetheidsmanagement", "contrast", "spiegeling", "textuurmatch"],
    38: ["blindproeven", "lager", "ale", "esters", "afdronkanalyse"],
    39: ["ipa-vs-stout", "hopbitterheid", "roastbitterheid", "aromaprofilering", "sensorische beslisboom"],
    40: ["examenintegratie", "stijlkunde", "service", "pairing", "professionele kalibratie"],
}

__all__ = [
    "TERMINOLOGY_LOCK",
    "THEORY_PREMIUM_21_40",
    "PRO_INSIGHTS_21_40",
    "FOOD_PAIRING_WAAROM_21_40",
    "REFLECTIEVRAGEN_21_40",
    "GOLD_KEY_CONCEPTS_21_40",
]
