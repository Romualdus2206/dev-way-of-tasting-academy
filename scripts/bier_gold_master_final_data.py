from __future__ import annotations

TERMINOLOGY_LOCK: list[tuple[str, str]] = [
    (r"(^|[.!?]\s+)ondergisting\b", r"\1Ondergisting"),
    (r"(^|[.!?]\s+)bovengisting\b", r"\1Bovengisting"),
    (r"\bte koud\s*=\s*", "te koud: "),
    (r"\bte warm\s*=\s*", "te warm: "),
]

THEORY_PREMIUM: dict[int, str] = {
    1: """Bier is geen enkelvoudig product maar een gefermenteerd matrixsysteem waarin water, alcohol, opgeloste koolhydraten, hopbestanddelen, gistmetabolieten en koolzuur samen de proefervaring vormen. Daardoor beoordeel je bier niet op een los aroma, maar op de balans tussen geurintensiteit, bitterheid, zoetheid, zuurgraad en textuur.

Voor professionele proevers is bierdefinitie functioneel: je wilt kunnen onderscheiden wat grondstofgedreven is en wat procesgedreven. Mout levert vergistbare suikers en body (structuurgewicht), hop structureert bitterheid (hopimpact), gist maakt alcohol en aroma, en lagering stabiliseert het product zodat rijping als effect leesbaar wordt in glas en neus.

In servicecontext betekent dit dat je elk bier tegelijk technisch en gastgericht benadert. Blind geproefd zoek je eerst stijlmarkers en attenuatie-indruk, aan tafel vertaal je dat naar begrijpelijke taal zonder precisie te verliezen, zodat advies niet alleen correct is maar ook verkoopbaar en herhaalbaar.""",
    2: """De vier basisingrediënten — water, mout, hop en gist — vormen een gekoppeld systeem waarin elke keuze direct doorwerkt in smaak en mondgevoel. Water vormt het grootste deel van bier, maar bepaalt veel meer dan volume alleen: mineraalstructuur, mondgevoel en zelfs historische stijlontwikkeling in regio's als Pilsen of Burton-on-Trent.

Mout levert vergistbare suikers en bepaalt body (structuurgewicht) en roast; hop structureert bitterheid (hopimpact) en aroma; gist zet suikers om in alcohol, esters en fenolen. Technisch is receptuur verhouding en timing — dezelfde hopgift gedraagt zich anders bij hogere beginstamwort, terwijl giststam en temperatuur attenuatie en aromatische expressie sturen.

Voor blindproeven en service lees je daarom interacties: lage body met hoge bitterheid wijst op hop-vergistingsbalans; volle body met milde bitterheid op moutopbouw. Dat causale lezen maakt advies scherper dan stijlnaam alleen.""",
    3: """Alcoholische gisting is de metabole omzetting waarbij gist vergistbare suikers omzet naar ethanol, koolzuur en warmte, met talrijke nevenproducten die geur en smaak dragen. Dat proces is geen zwart-wit aan/uit-moment maar een dynamische fase waarin temperatuur, gistvitaliteit en zuurstofbeheer de uitkomst direct sturen.

Attenuatie is hier de sleutelvariabele: ze bepaalt hoeveel restsuiker overblijft en dus hoe droog of rond het bier aanvoelt. Hogere attenuatie kan een bier strakker en slanker maken, terwijl lagere attenuatie zoetindruk en body ondersteunt. Daardoor verandert niet alleen smaakbalans maar ook hoe bitterheid wordt waargenomen.

In praktijk en blindproef-logica kijk je daarom naar vergistingssporen: droge finale met schone afdronk kan op hoge attenuatie wijzen, terwijl warme esters en restzoet vaak op een ander gistgedrag duiden. Wie gisting begrijpt, kan fouten in service sneller herkennen, bijvoorbeeld een bier dat te warm geserveerd wordt en daardoor alcoholscherpte overdrijft.""",
    4: """Het onderscheid tussen Ondergisting en Bovengisting is fundamenteel omdat het tegelijk proces, aromaprofiel en servicelogica bepaalt. Ondergisting werkt typisch koeler en levert vaak een schoner profiel waarin mout, hopbitterheid en koolzuurstructuur duidelijk leesbaar zijn; Bovengisting opereert warmer en toont sneller esters en complexere fermentatielagen.

Dit verschil is geen waardeoordeel maar een interpretatiekader voor balans. Bij Ondergisting valt elke afwijking in bitterheidsopbouw of zwaveltoon sneller op, terwijl bij Bovengisting de uitdaging ligt in het onderscheiden van gewenste fruitigheid versus onevenwichtige fermentatie-uitdrukking. Temperatuurimpact is daarom stijlafhankelijk en nooit generiek.

Voor service betekent dit dat je glaswerk en schenkmoment aanpast aan aromadoel. Te koud serveren kan Bovengisting aromatisch afknijpen; te warm serveren kan Ondergisting onnodig hard maken in bitterheid. Professioneel advies koppelt dus vergistingstype direct aan serveertemperatuur en proefvolgorde.""",
    5: """Biercategorieen zijn analytische hulpmiddelen om verwachting, techniek en communicatie te structureren, niet om creativiteit op slot te zetten. Een categorie vat doorgaans vergistingstype, alcoholbereik, bitterheidsniveau, kleur, aroma-intensiteit en mondgevoel samen zodat proevers dezelfde referentietaal gebruiken.

Op seniorniveau lees je categorieen als probabiliteit, niet als absolute grens. Een bier kan binnen een stijl vallen en toch afwijken door hopkeuze, waterprofiel of lagering. Daarom combineer je categoriekennis met zintuiglijk bewijs: wat staat op etiket is hypothese, wat in glas zit is data.

In verkooplogica helpt categoriebeheer om gastverwachting te sturen zonder te simplificeren. Je vertaalt technische assen - droog versus rond, bitter versus zacht, esterrijk versus clean - naar keuzevragen die leiden tot hogere tevredenheid en minder retour door mismatch.""",
    6: """Mouten vormen het structurele hart van bier omdat ze vergistbare suikers, kleurstoffen, stikstofverbindingen en smaakprecursoren aanleveren. Basismouten leveren vooral enzymkracht en extract, terwijl speciale mouten body, karameltonen of roast toevoegen en daarmee de finale balans diepgaand wijzigen.

De moutstort bepaalt niet alleen kleur maar ook fermentatiegedrag en mondgevoel. Meer kristalmout verhoogt doorgaans restzoetindruk en viscositeit, terwijl hoge roast-fractie bitterheidsperceptie kan aanscherpen zonder extra hop. Daardoor kan dezelfde IBU analytisch gelijk zijn maar sensorisch heel anders landen.

Voor blindproeven is moutanalyse essentieel: broodkorst, biscuit, karamel of cacao-aroma zijn vaak sleutelmarkers voor stijlbepaling. In pairing en service vertaal je dat naar textuurtaal: body (structuurgewicht) en roast-intensiteit sturen welke gerechten het bier kan dragen.""",
    7: """Maischen is de enzymatische fase waarin zetmeel uit mout wordt omgezet in vergistbare en onvergistbare suikers, gestuurd door temperatuur, tijd en pH. Het proces bepaalt in hoge mate de vergistbaarheid van het wort en vormt daarmee de basis voor attenuatie en restzoet.

Een lager temperatuurvenster bevordert doorgaans beta-amylase-activiteit en levert meer vergistbare suikers, wat een drogere finale mogelijk maakt. Hogere rusten ondersteunen alfa-amylase en dextrinevorming, waardoor body toeneemt. Het is dus een precisie-instrument voor mondgevoel, niet alleen een voorbereidende stap.

In proefsituaties kun je maisschema-effecten vaak indirect herkennen via textuur en uitvergistingsgraad. Servicefouten ontstaan wanneer deze techniek genegeerd wordt: een bier met hoge dextrinefractie te koud schenken drukt aroma en maakt het log, terwijl een droger bier warm juist te scherp kan uitkomen.""",
    8: """Hop levert bitterheid, aroma en stabiliserende polyfenolstructuren, maar de sensorische uitkomst hangt af van timing en matrix. Vroege giften bouwen vooral bitterheid op, late giften en dryhop versterken vluchtige aromacomponenten. Dezelfde hopsoort kan dus uiteenlopende resultaten geven.

Bitterheid is meer dan IBU: perceptie wordt mede bepaald door restzoet, koolzuurdruk, alcohol en waterprofiel. Een bier met hoge attenuatie kan dezelfde analytische bitterheid harder tonen dan een zoeter bier, omdat minder restsuiker de hopimpact minder afdempt. Daarom proef je bitterheid altijd relationeel.

In blindproef-logica zoek je naar bitterheidskwaliteit: kort en schoon, lang en harsig, of scherp en ruw. Voor service en verkoop helpt dat onderscheid direct bij foodpairing en gastadvies, omdat niet elke bittere indruk hetzelfde gerecht vraagt.""",
    9: """Gist is de primaire aromamotor van bier: naast alcohol en koolzuur produceert gist esters, hogere alcoholen, zwavelverbindingen en andere metabolieten die stijlidentiteit bepalen. Keuze van stam, pitch-rate en vergistingsregime bepaalt of fruitigheid, kruidigheid of neutraliteit dominant wordt.

Fermentatiebeheer vereist controle op zuurstof en temperatuur om gewenste expressie te maximaliseren en off-flavors te beperken. Te weinig vitale gist of stress tijdens vergisting kan ongewenste tonen geven die in blindproef ten onrechte als stijlkenmerk worden gelezen. Professionele beoordeling vraagt daarom proceskennis naast neuservaring.

Temperatuurimpact in service is hier groot: esters openen bij oplopende temperatuur sneller dan hoparoma in sommige stijlen, waardoor het profiel verschuift in glas. Correct serveren betekent dus kiezen voor een venster waarin gistaroma leesbaar is zonder balansverlies in alcohol of bitterheid.""",
    10: """Lagering is het proces van gecontroleerde rust na hoofdvergisting, bedoeld om bier te stabiliseren, smaken te harmoniseren en ongewenste nevenproducten af te bouwen. Rijping is het effect dat daaruit volgt: een integraler smaakbeeld, helderder structuur en vaak een rustiger aromatische presentatie.

In technische zin beinvloedt lagering helderheid, koolzuurintegratie en smaakafronding, maar de optimale duur is stijlafhankelijk. Te korte lagering laat ruwe randen staan; te lange opslag onder onjuiste condities kan frisheid reduceren. Daarom is tijd alleen geen kwaliteitsgarantie.

Voor blindproeven lees je rijping als samenhang: hoe coherent sluiten bitterheid, moutzoet en koolzuur op elkaar aan. In servicecontext helpt dit om voorraadrotatie en serveermoment te bepalen, zodat de gast bier krijgt in zijn sensorisch sterkste fase.""",
    11: """Professioneel bier proeven begint met een vaste volgorde: visueel, olfactief, gustatief en retronasaal, gevolgd door structurele synthese. Je beoordeelt niet enkel intensiteit maar ook kwaliteit, volgorde van indrukken en persistentie in de afdronk.

Mondgevoel is daarin een volwaardige as naast aroma en smaak. Koolzuurprikkel, viscositeit, alcoholwarmte en samentrekkende bitterheid vormen samen het tactiele profiel dat vaak de stijlherkenning versnelt. Daarom noteer je zowel wat je proeft als hoe het zich fysiek gedraagt op de tong.

Blindproef-logica vraagt dat je hypothesen stap voor stap aanscherpt: eerst vergistingstype, dan mout-hop-as, daarna mogelijke stijl. Zo voorkom je dat etiketkennis of voorkeur je oordeel kleurt en kun je serviceadvies op reproduceerbare observatie baseren.""",
    12: """Schuim is een kwaliteitsindicator omdat het informatie geeft over eiwitstructuur, koolzuurbeheer, glasreinheid en serveertechniek. Standtijd, belstructuur en aanhechting aan het glas vertellen of het bier fysisch stabiel is en correct behandeld werd.

Technisch ontstaat schuimstabiliteit uit interacties tussen moutproteinen, iso-alfazuren en koolzuurontsnapping. Vetresidu in glas of verkeerd spoelmiddel kan deze balans direct breken, waardoor schijnbaar goed bier sensorisch zwakker overkomt. Schuim lezen is dus ook service-audit.

In gastpsychologie werkt schuim als eerste kwaliteitssignaal: een verzorgd kraagje verhoogt verwachtingswaarde nog voor de eerste slok. Professionele service gebruikt dit bewust, maar zonder cosmetische overdrijving die drinkbaarheid of temperatuurcontrole schaadt.""",
    13: """Aromaherkenning in bier vraagt een getraind vocabulaire dat bronnen koppelt aan proces: mout (brood, karamel, roast), hop (citrus, kruid, hars), gist (esters, fenolen) en rijpingseffecten. Zonder bronkoppeling blijft beschrijven vaag en diagnostisch zwak.

Methodisch werk je van breed naar specifiek: eerst categorie (fruitig, kruidig, geroosterd), dan intensiteit, daarna kwaliteit en plausibiliteit binnen stijl. Deze hiërarchie voorkomt dat een opvallende noot het totaalbeeld domineert en maakt vergelijkende proeverijen consistenter.

Voor service en pairing is aroma geen doel op zichzelf maar routekaart voor verwachting. Wie esters en fenolen correct duidt, kan beter voorspellen welke gerechten resoneren en welke botsen, nog voordat de gast de eerste combinatie proeft.""",
    14: """Structuur en Mondgevoel beschrijven de fysieke architectuur van bier: van aanzet tot midpalate en finale, inclusief koolzuurtextuur, viscositeit, alcoholwarmte en samentrekking door bitterheid of roast. Dit bepaalt vaak sterker dan aroma of een bier als elegant of zwaar wordt ervaren.

Body (structuurgewicht) ontstaat uit een combinatie van restextract, glycerol, alcohol en koolzuurdruk. Hoge attenuatie kan body verlagen en drinkbaarheid verhogen, terwijl dextrinerijk wort volume geeft maar ook sneller vermoeit als bitterheid of zuur onvoldoende tegenspel biedt.

In professionele service vertaal je structuur direct naar glaswerk en temperatuur. Een smal glas kan koolzuur scherp laten pieken, een wijder glas kan textuur ronder tonen. Door dit bewust te kiezen vermijd je servicefouten waarbij het bier stijlvreemd overkomt.""",
    15: """Een mini-toets op seniorniveau meet geen feitjes maar besliskwaliteit: kun je waarneming vertalen naar oorzaak, en oorzaak naar advies. De kern is causale redenering over ingredient, proces en service in plaats van losse definities.

Goede toetsvragen dwingen tot prioriteren: welke observatie is diagnostisch het sterkst, welke afwijking is echt stijlbreuk, welke serveeractie corrigeert het meeste met minste risico. Dat maakt evaluatie direct relevant voor vloerwerk en blindproef-prestaties.

Wie deze denkwijze beheerst, werkt consistenter in teamcontext. Je feedback aan collega's wordt specifieker, discussies over smaak worden minder subjectief, en verkoopadviezen sluiten beter aan op wat technisch in het glas gebeurt.""",
    16: """Pilsner is een klassieke Ondergisting-stijl waarin helderheid, hoge doordrinkbaarheid en strakke bitterheidslijn centraal staan. Juist door die schijnbare eenvoud vallen kleine fouten in vergisting, lagering of zuurstofbeheer onmiddellijk op.

De stijl vraagt balans tussen moutfrisheid en hopbitterheid zonder plakkerig restzoet. Attenuatie ligt vaak relatief hoog, waardoor de finale droog kan ogen en bitterheid exact gedoseerd moet zijn. Te veel hophardheid of te weinig body maakt het bier hoekig.

Service draait om precisie: temperatuurimpact is groot, want te koud dempt aroma en maakt de slok dun, te warm vergroot bitterheidsdruk en alcoholindruk. Correct glaswerk en vers getapte presentatie bepalen of de stijl zijn finesse toont.""",
    17: """Blond positioneert zich vaak tussen frisheid en aromatische toegankelijkheid, meestal met Bovengisting als drager van subtiele esters. De stijl is daardoor commercieel sterk, maar technisch kwetsbaar voor onevenwicht tussen fruitigheid, zoetindruk en alcohol.

Een geslaagde blond heeft voldoende attenuatie om levendig te blijven, terwijl body nog net genoeg structuur geeft voor gastronomische inzet. Hopbitterheid ondersteunt de finale maar mag het gistprofiel niet overstemmen. De kunst zit in evenwicht, niet in intensiteit.

In verkooplogica is blond een brugstijl: je kunt gasten van pils of van zwaardere abdijbieren laten convergeren naar een middenprofiel. Dat werkt alleen wanneer je expliciet vraagt naar gewenst mondgevoel en zoetbeleving in plaats van enkel naar alcoholpercentage.""",
    18: """Weizen is een tarwegedreven Bovengisting-stijl waarbij gistaroma en eiwitstructuur een herkenbaar sensorisch profiel vormen. Banaanachtige esters en kruidnagelachtige fenolen ontstaan uit giststam en vergistingsregime, terwijl tarwe bijdraagt aan romig mondgevoel en schuimpersistentie.

De balans is delicaat: te veel esters maakt het bier snoeperig, te dominante fenolen maken het hoekig. Koolzuur speelt een structurele rol door frisheid en lift, maar kan bij onjuiste service ook prikkelend en chaotisch worden.

Glaswerk is hier functioneel, niet decoratief. Een hoog weizenglas ondersteunt schuimopbouw en aromasturing, maar alleen bij gecontroleerd inschenken. Servicefouten ontstaan vaak door te snelle schenking waardoor gistdepot en koolzuur onbedoeld de balans verstoren.""",
    19: """Witbier combineert tarwe, kruiden en gistkarakter in een licht troebel, fris en vaak laag-bitter profiel. De stijl leunt op aromatische verfijning: citrusachtige esters, zachte fenolen en subtiele kruidtonen moeten geïntegreerd blijven.

Omdat bitterheid relatief mild is, dragen zuurindruk en koolzuur sterk bij aan frisheidservaring. Een te hoge serveertemperatuur kan kruidigheid log maken en de slok zwaarder laten lijken dan bedoeld; te koud serveer je het bier aromatisch doof.

Pairing-technisch is witbier waardevol bij gerechten waar aciditeit en kruidcomplexiteit gewenst zijn zonder zware body. Voor service betekent dit dat je helder communiceert over stijlverwachting, zodat gasten het niet beoordelen met pils-criteria.""",
    20: """Bockbier bouwt zijn identiteit op moutdiepte, karameltonen, soms roast-accenten en een voller bodyprofiel. De stijl vraagt gecontroleerde zoet-bitterbalans: voldoende restextract voor warmte en lengte, maar met genoeg bitterheid om plakkerigheid te voorkomen.

Lagering en rijping zijn hier extra belangrijk omdat zwaardere worten meer tijd vragen om alcohol, moutzoet en koolzuur te integreren. Onvoldoende rust levert vaak een losse, alcoholgedreven indruk; goede rijping geeft juist gelaagdheid en ronding.

In service is temperatuurimpact kritisch: te warm versterkt alcoholwarmte en suikerdruk, te koud maskeert complexiteit en maakt het bier monolithisch. Correct geschonken kan bock zowel digestief als foodpairing-anker functioneren.""",
    21: """Smaakafwijkingen analyseren begint met onderscheid tussen grondstoffout, procesfout en servicefout. Een professionele beoordeling benoemt eerst de waarneming, daarna de waarschijnlijkste oorzaak, en pas dan de ernst voor drinkbaarheid.

Veel fouten zijn contextgevoelig: lichte oxidatieve tonen kunnen in sommige zware stijlen minder storend lijken, terwijl dezelfde toon in frisse stijlen direct diskwalificeert. Daarom koppel je detectie altijd aan stijlverwachting en versheidsdoel.

In operationele teams versnelt deze aanpak correctie. Je voorkomt eindeloze discussie over terminologie door te werken met een vaste foutboom van symptoom naar oorzaak en actie.""",
    22: """Oxidatie in bier is een keten van chemische reacties die aroma, kleur en frisheid verschuift tijdens opslag en handling. Ze manifesteert zich vaak als afname van hoplevendigheid en opkomst van papier- of honingachtige tonen.

De snelheid van oxidatie wordt gestuurd door zuurstofinname, temperatuur en tijd. Hoger alcohol en donkerdere moutmaskers kunnen oxidatie tijdelijk verbergen, maar niet stoppen. Kwaliteitsbeheer draait daarom om preventie en rotatie, niet om later corrigeren.

In service betekent dit: koude keten bewaken, open verpakkingen snel inzetten en tapsystemen zuurstofarm bedienen. Een goed oxidatieprotocol beschermt zowel sensorische kwaliteit als merkconsistentie.""",
    23: """Microbiologische infecties in bier ontstaan wanneer wilde gisten of bacterien de productieketen binnendringen en metabolieten vormen buiten het beoogde profiel. Sensorisch uit zich dat vaak in onbedoelde zuurheid, fenolische scherpte of overmatige koolzuurvorming.

Niet elke afwijking is direct zichtbaar in jong bier; sommige infecties groeien pas uit tijdens distributie. Daarom zijn hygiëne, gesloten transfers en stabiele koude opslag even belangrijk als eindcontrole op botteldag.

Voor professionals is snelle bronlokalisatie essentieel: onderscheid maken tussen brouwerijfout en taplijncontaminatie voorkomt verkeerde conclusies en onnodige afkeuring van correct geproduceerd bier.""",
    24: """Tapinstallatiebeheer bepaalt in hoge mate hoe bier aan tafel arriveert, ongeacht brouwhuiskwaliteit. Drukinstelling, leidinglengte, temperatuur en reinigingsfrequentie vormen samen een hydraulisch-sensorisch systeem.

Een fout in een van deze variabelen vertaalt zich direct naar schuimgedrag, koolzuurbeleving en aroma-intensiteit. Te hoge druk geeft agressieve carbonatie, te lage druk resulteert in vlakke service en versneld aromaverlies.

Senior service omvat daarom preventief onderhoud, meetregistratie en glasdiscipline. Alleen dan blijft de stijlidentiteit intact tussen fust en gast.""",
    25: """Flesservice vraagt andere controlepunten dan tapservice: opslagpositie, lichtblootstelling, openingstechniek en schenksnelheid bepalen de uiteindelijke kwaliteit. Vooral bij gist op fles is depotmanagement cruciaal voor helderheid en mondgevoel.

Lichtschade en temperatuurwisselingen kunnen binnen dagen het aromaprofiel aantasten. Professionele teams hanteren daarom strikte FIFO-rotatie en vermijden warmteschommelingen in servicekoelingen.

In tafelservice maakt ritme het verschil: rustig uitschenken, etiket zichtbaar houden en de laatste fractie gecontroleerd behandelen verhoogt zowel sensorische kwaliteit als gastvertrouwen.""",
    26: """Bier en kaas combineren werkt wanneer zout, vet en eiwitstructuur van kaas in balans worden gebracht met koolzuur, bitterheid en aromaprofilering van bier. Een goede match voorkomt dat vetfilm smaakafgifte blokkeert.

Bieren met voldoende koolzuur en gematigde bitterheid snijden door romigheid, terwijl esters en moutzoet bruggen slaan naar rijpingsaroma van de kaas. Overmatige hophardheid kan echter melkvet bitter laten terugkomen.

Professioneel pairen betekent daarom textuur eerst, aroma daarna. Je kiest op structuurgewicht en zoutdruk voordat je op stijlnaam selecteert.""",
    27: """Bij vleespairing draait de kern om Maillard-intensiteit, vetgehalte en bereidingsmethode. Bier moet tegelijk reinigen, ondersteunen en contrasteren zonder dat bitterheid of roast de eiwitsmaak overschreeuwt.

Donkerder moutprofielen kunnen geroosterde korsttonen spiegelen, terwijl koolzuur vet snijdt en een volgende hap reset. Te zoet bier bij mager vlees maakt het geheel log, terwijl te droog bier bij vet vlees dun kan lijken.

Op sommelierniveau kies je daarom op snijpunt van mondgevoel en umami-respons. Het beste bier is niet het zwaarste, maar het bier dat het kauwritme ondersteunt.""",
    28: """Dessertpairing met bier vraagt precisie omdat zoetheid snel uit balans loopt. Regelmatig moet het bier minstens evenveel zoetindruk of aromadiepte hebben als het dessert om bitterheid niet scherp te laten uitkomen.

Roast, karamel en esters kunnen uitstekende bruggen bouwen naar chocolade, noten of fruitcomponenten. Tegelijk voorkomt koolzuur dat de combinatie plakkerig wordt, mits carbonatie niet zo hoog is dat textuur fragmenteert.

Succesvolle combinaties sturen op lengte: hoe ontwikkelt de finale zich na slikken. Een goede match laat zowel dessert als bier langer en helderder doorwerken.""",
    29: """Een verticale proeverij toont hoe hetzelfde bier over verschillende jaargangen of bewaarmomenten evolueert. Daardoor kun je rijpingseffecten objectiever beoordelen dan in een losse flesproef.

Belangrijk is strakke proefopzet: identiek glaswerk, consistente temperatuur en duidelijke volgorde van jong naar oud. Alleen dan kun je veranderingen in oxidatie, koolzuurintegratie en moutontwikkeling betrouwbaar toeschrijven.

Voor teams en gasten is verticaal proeven educatief sterk omdat het tijd als ingrediënt zichtbaar maakt. Het scherpt tegelijk voorraadbeleid en releasebeslissingen aan.""",
    30: """Leeftijdspotentieel van bier hangt af van alcoholniveau, hopprofiel, microbiologische stabiliteit, zuurstofbeheer en verpakkingsconditie. Niet elk bier wint aan tijd; veel stijlen zijn gebouwd op primaire frisheid.

Bieren met hogere extractdichtheid en robuuste structuur kunnen rijpen richting integratie, maar verliezen vaak hophelderheid. Daarom moet bewaardoel expliciet zijn: zoek je complexiteit of behoud van jeugdig karakter.

Professioneel advies vermeldt altijd een drinkvenster in plaats van een vage bewaarbeloft. Dat maakt verwachting concreet en voorkomt teleurstelling bij de gast.""",
    31: """Belgische regionale stijlen tonen hoe gistcultuur, lokale traditie en serveercontext samen een herkenbare sensorische signatuur bouwen. Veel stijlen combineren esters, fenolen en restzoet in een hogere aromatische bandbreedte dan internationale lagerstijlen.

De variatie vraagt discipline in classificatie: je beoordeelt eerst vergistingsexpressie en mondgevoel, daarna pas merkgebonden narratief. Zo voorkom je dat reputatie de proefanalyse stuurt.

In service helpt kennis van Belgische traditie om glaswerk, temperatuur en schenktechniek correct te kiezen. Dat is geen folklore maar functionele kwaliteitscontrole.""",
    32: """Duitse regionale stijlen leggen vaak nadruk op technische zuiverheid, grondstofprecisie en helder profiel, met duidelijke rol voor Ondergisting en tarwestijlen. Sensorisch herken je vaak strakke bitterheidslijnen en gecontroleerde fermentatie-uitdrukking.

Het interessante is de variatie binnen dat kader: waterprofiel, moutselectie en lokale gistpraktijken leveren subtiele maar betekenisvolle verschillen. Professionele proevers waarderen juist deze nuances.

Voor horeca vertaalt dit zich naar gerichte menukaartlogica. Door regio en stijl als twee assen te presenteren maak je keuze eenvoudiger zonder kwaliteitsinformatie te verliezen.""",
    33: """De IPA-familie draait om hopexpressie maar omvat meerdere structuren: droog en bitter, aromatisch en sappig, of hybridere vormen met variabele body. Daardoor is IPA geen enkel profiel maar een spectrum.

Attenuatie en waterchemie sturen hoe hop overkomt: hoge sulfaatdruk kan bitterheid aanscherpen, meer chloride kan mondgevoel afronden. Dezelfde hopgift kan daardoor compleet anders landen.

In service vermijd je oxidatie en warmte boven alles, omdat hoparoma fragiel is. Snelle rotatie en correcte temperatuur zijn hier essentieel om stijlintegriteit te behouden.""",
    34: """Stout en porter delen een donker moutfundament maar verschillen vaak in roast-intensiteit, bodyopbouw en zoet-bitterverhouding. Het onderscheid is minder juridisch dan sensorisch: je leest de stijl via textuur en afdronk.

Roast kan koffie-, cacao- of asachtige tonen geven en tegelijk bitterheidsperceptie verhogen zonder extra hop. Daarom moet je analytisch scheiden wat van hop komt en wat van geroosterde mout.

In pairing en service zijn temperatuur en glaskeuze doorslaggevend. Te koud maskeert complexiteit, te warm kan roast hard maken en alcohol accentueren.""",
    35: """Saison en farmhouse-stijlen tonen een drogere, vaak kruidige vergistingshandtekening met nadruk op doordrinkbaarheid en aromatische spanning. Fenolen en esters werken hier als structuurcomponenten, niet enkel als geuraccent.

Hoge attenuatie geeft een slanke basis waarin bitterheid en zuurindruk anders worden ervaren dan in rondere stijlen. Daardoor kan een ogenschijnlijk licht bier toch zeer gastronomisch zijn.

Voor service is temperatuurimpact groot: een te koud glas sluit complexiteit af, een te warm glas kan kruidigheid onrustig maken. Het juiste venster houdt het bier levendig en precies.""",
    36: """Zure bierstijlen vereisen nauwkeurige interpretatie omdat zuur niet automatisch kwaliteit betekent. Je beoordeelt type zuurheid, integratie met restzoet en relatie tot fruit-, hout- of gistcomponenten.

Technisch kunnen melkzuur, azijnzuur en gemengde fermentatie verschillende sensorische handtekeningen geven. De kunst is onderscheid maken tussen gewenste spanning en vluchtige scherpte die de balans breekt.

In pairing werken zure bieren vaak als snijpunt voor vet en zout, maar overmatige zuurdruk kan gerechten doen instorten. Professionele inzet vraagt daarom kleine proefstappen en gecontroleerde opbouw.""",
    37: """Barrel aging voegt zuurstofmicrodosis, houtextractie en soms spiritresidu toe, waardoor bier extra lagen krijgt in aroma en structuur. Het proces kan complexiteit verhogen, maar ook balans verstoren als basisbier onvoldoende draagkracht heeft.

Houtinvloed manifesteert zich via tannine, vanilletonen, oxidatieve rijping en textuurverandering. De sleutelvraag is steeds: ondersteunt het vat het bier, of domineert het vat het bier.

In service behandel je barrel-aged bieren als precisieproducten: rustige schenking, correct glas en temperatuurcontrole. Zo blijft de integratie tussen basisbier en hout leesbaar.""",
    38: """Alcoholvrij bier vraagt herdefinitie van balans omdat ethanol als drager van body en aroma grotendeels ontbreekt. Brouwers compenseren dit via moutopbouw, koolzuurregie en aromatechniek.

Sensorisch let je op dunheid, wortigheid en zoetrest, omdat die sneller zichtbaar worden zonder alcoholmatrix. Goede alcoholvrije bieren tonen juist strakke bitterheid en voldoende mondvulling zonder plakkerigheid.

In verkoop en service is framing cruciaal: positioneer alcoholvrij op smaakprofiel, niet als compromis. Dat verhoogt acceptatie en maakt upsell naar foodpairing realistischer.""",
    39: """Menubouw met bier start vanuit culinaire assen: vet, zout, zuur, umami, hitte en zoetheid. Bierkeuze volgt dan uit structuur, bitterheid, koolzuur en aromatische bruggen in plaats van losse stijlvoorkeur.

Een sterk menu denkt in progressie: van frisse, lichtere profielen naar complexere, zwaardere bieren zonder paletvermoeidheid. Daarbij bewaak je ook serveertemperatuur en glaswissel als onderdeel van het ritme.

Commercieel werkt dit beter dan ad-hoc pairing omdat gasten een duidelijke route ervaren. Het verhoogt zowel beleving als omzet per couvert.""",
    40: """Examenstrategie op sommelierniveau combineert theoriebeheersing met beslissnelheid onder tijdsdruk. Je traint niet alleen kennis, maar vooral het omzetten van observatie naar verdedigbare conclusie.

Een robuuste aanpak gebruikt vaste volgorde: visueel, aroma, smaak, mondgevoel, hypothese, verificatie. Die structuur reduceert ruis en voorkomt dat een enkel opvallend kenmerk je richting bepaalt.

In mondelinge of servicegerichte toetsen scoort heldere causaliteit het hoogst. Wie kort en precies uitlegt waarom een keuze klopt, toont professionele rijpheid boven encyclopedische opsomming.""",
}

PRO_INSIGHTS: dict[int, str] = {
    1: (
        "Gasten die bier 'te bitter' vinden, hebben vaak alleen massamarkt-lager geproefd. "
        "Vraag naar moment en gerecht vóór je stijl noemt — moutzoetheid en koolzuur openen "
        "vaak de deur naar verkoop."
    ),
    2: (
        "Verkoop geen merk maar uitkomst: koppel elk ingrediënt aan een herkenbare smaakverwachting "
        "(frisheid, body, bitterheid). Dat verlaagt retour door verkeerde verwachting."
    ),
    3: (
        "Servicefout: vergistingsaroma te koud serveren maskeert gistsignatuur en doet het product "
        "generiek lijken — temperatuur is hier kwaliteitsbewijs, geen detail."
    ),
    4: (
        "Ondergisting en Bovengisting vragen verschillende serveervensters; één koude standaard "
        "maakt je kaart sensorisch vlak en ondermijnt blindproef-training."
    ),
    5: (
        "Classificeer blind eerst op structuur en vergistingskarakter, pas daarna op stijlnaam — "
        "dat beperkt etiketvooringenomenheid en verhoogt nauwkeurigheid."
    ),
    6: (
        "Pairing start bij moutintensiteit en roast, niet bij kleur; hopniveau is pas de tweede "
        "beslisstap bij geroosterde gerechten."
    ),
    7: (
        "Een bier met hoge dextrinefractie in een te smal, ijskoud glas wordt plomp en verliest "
        "textuur — glaswerk en temperatuur zijn hier één beslissing."
    ),
    8: (
        "Leg het verschil uit tussen analytische IBU en ervaren bitterheid; gasten vertrouwen advies "
        "sneller wanneer je perceptie relationeel uitlegt."
    ),
    9: (
        "Esterrijke bieren vragen iets warmer service dan hopgedreven stijlen; anders wint "
        "koolzuurprikkel en verdwijnt gistkarakter."
    ),
    10: (
        "Bij oudere flessen eerst integratie en oxidatieve richting beoordelen — lagering is proces, "
        "rijping is het effect dat je in glas leest."
    ),
    11: (
        "Glas op aromadoel en koolzuurgedrag kiezen; identieke inhoud in ander glas verandert "
        "je hele proefconclusie."
    ),
    12: (
        "Gecontroleerd inschenken met stabiel schuimkraagje verhoogt kwaliteitsverwachting vóór "
        "de eerste slok — gastpsychologie in pure vorm."
    ),
    13: (
        "Noem per aroma een bronhypothese (mout, hop, gist, rijping); zonder bron blijft "
        "beschrijving diagnostisch zwak."
    ),
    14: (
        "Ronde kelk voor textuurfocus, slank glas voor frisheid — stem af op body "
        "(structuurgewicht), niet op esthetiek."
    ),
    15: (
        "Gebruik mini-toetsresultaten om teamtaal te standaardiseren; consistente termen "
        "maken verkoopadvies reproduceerbaar tussen shifts."
    ),
    16: (
        "Pils te lang in warme tapleiding geeft harde bitterheid en vlakke neus — servicefout "
        "die zelfs perfect gebrouwen bier onherstelbaar maakt."
    ),
    17: (
        "Bij blond werkt 'meer fruitigheid of meer frisheid?' beter dan alcoholpercentage — "
        "gasten kiezen op beleving, niet op cijfers."
    ),
    18: (
        "Weizen in pintglas verliest schuimopbouw en esterexpressie; hoog glas is functioneel "
        "voor deze stijl, niet decoratief."
    ),
    19: (
        "Witbier als aromatische brug bij kruidige gerechten — maar alleen als temperatuur "
        "citrus en fenolen niet dichtzet."
    ),
    20: (
        "Bock net onder keldertemperatuur serveren; te warm tilt alcohol en moutzoetheid "
        "disproportioneel op en breekt pairingbalans."
    ),
}

FOOD_PAIRING_WAAROM: dict[int, str] = {
    1: "Koolzuur lift vet van het palet, bitterheid snijdt door umami, en lichte zoetheid voorkomt dat de combinatie te hard eindigt.",
    2: "Zoetheid uit mout vangt zout op, bitterheid structureert vet, en koolzuur houdt de slok schoon tussen happen.",
    3: "Bij hogere attenuatie en droogte werkt koolzuur als reiniger, terwijl umami in het gerecht door beperkte zoetheid scherper leesbaar blijft.",
    4: "Ondergisting ondersteunt zout en vet met strakke bitterheid, Bovengisting kan via esters en fenolen aromatische bruggen leggen.",
    5: "Een categorie met hogere bitterheid dempt vet, terwijl een categorie met meer zoetheid en esters beter omgaat met mild zuur.",
    6: "Roast en zoetheid spiegelen karamellisatie, bitterheid voorkomt plakkerigheid, en umami uit geroosterde tonen verdiept de match.",
    7: "Meer body vraagt vaak om vet en zout als tegengewicht, terwijl koolzuur en bitterheid de textuur in balans houden.",
    8: "Hopgedreven bitterheid snijdt vet, koolzuur reset het palet, en esters kunnen kruidige of citrusachtige componenten verbinden.",
    9: "Esters sluiten aan op fruitige sauzen, fenolen kunnen specerijen oppakken, en koolzuur voorkomt aromatische oververzadiging.",
    10: "Rijping maakt roast en zoetheid ronder, terwijl koolzuur en bitterheid zorgen dat vetrijke gerechten niet zwaar blijven hangen.",
    11: "Bij proeffocus kies je combinaties waarin koolzuur en zuur het palet openen en zoetheid bitterheid controleert.",
    12: "Stabiel schuim helpt aromadragers van esters en fenolen, terwijl koolzuur en bitterheid vetbalans ondersteunen.",
    13: "Aromatisch pairen werkt wanneer esters of fenolen bruggen bouwen en bitterheid plus zout voor structureel tegengewicht zorgen.",
    14: "Vol Mondgevoel vraagt zuur of bitterheid als snijpunt, terwijl koolzuur en zout de slok dynamisch houden.",
    15: "In toetscombinaties let je op koolzuur tegen vet, zoetheid tegen zout, en bitterheid tegen umami voor reproduceerbare keuzes.",
    16: "Pilsner combineert sterk met vet en zout omdat koolzuur reinigt en strakke bitterheid de afdronk droog trekt.",
    17: "Blond werkt door esters met kruidigheid te verbinden, terwijl matige bitterheid en zachte zoetheid zout in balans houden.",
    18: "Weizen past bij vettere gerechten omdat koolzuur snijdt en esters plus fenolen een aromatische brug vormen.",
    19: "Witbier ondersteunt frisse gerechten via zuur en koolzuur, terwijl esters en fenolen kruiden en citrus optillen.",
    20: "Bockbier matcht stoof of geroosterd voedsel via zoetheid en roast, met bitterheid als rem op vet en umami.",
    21: "Bij twijfelcombinaties gebruik je koolzuur en bitterheid als correctie op vet, terwijl zout helpt om kleine afwijkingen te maskeren.",
    22: "Lichte oxidatieve tonen botsen minder met umami en roast dan met zuurgedreven gerechten; zoetheid kan de overgang verzachten.",
    23: "Onbedoelde zuurheid versterkt zuur en zout in het gerecht, maar kan met vet en zoetheid deels worden opgevangen.",
    24: "Correcte tapdruk bewaart koolzuur, waardoor bitterheid en vetbalans voorspelbaar blijven aan tafel.",
    25: "Bij flesbier met depot werkt pairing beter als koolzuur intact blijft en esters niet door temperatuurstress vervluchtigen.",
    26: "Kaas vraagt koolzuur tegen vet, bitterheid tegen zout, en esters voor aromatische aansluiting zonder overschreeuwen.",
    27: "Vleespairing werkt wanneer bitterheid en koolzuur vet snijden en umami wordt ondersteund door roast of zoetheid.",
    28: "Dessertcombi's slagen als zoetheid minstens gelijkwaardig is, roast kan diepte geven, en koolzuur voorkomt plakkerige finale.",
    29: "In verticale pairing zie je hoe afnemend koolzuur en toenemende zoetheid de relatie met vet en zout verschuiven.",
    30: "Oudere bieren tonen vaak meer zoetheid en roast, waardoor ze beter werken met umami en minder met zuurgedreven gerechten.",
    31: "Belgische stijlen koppelen esters en fenolen aan kruidige keuken, terwijl koolzuur en bitterheid vet structureren.",
    32: "Duitse schone profielen laten bitterheid en koolzuur domineren, wat sterk werkt bij zout en vet zonder aromatische ruis.",
    33: "IPA-pairing steunt op bitterheid tegen vet, koolzuur voor reiniging, en esters als brug bij kruidige componenten.",
    34: "Stout/porter combineren via roast en umami, terwijl zoetheid en bitterheid samen vet en zout in evenwicht brengen.",
    35: "Saison werkt door hoge attenuatie en koolzuur tegen vet, plus fenolen of esters die kruiden in het gerecht spiegelen.",
    36: "Zure bieren snijden vet en zout effectief, maar vragen gecontroleerde zoetheid om te voorkomen dat zuur domineert.",
    37: "Barrel-aged bier koppelt roast en umami sterk, terwijl zoetheid alcoholranden verzacht en bitterheid vet afremt.",
    38: "Alcoholvrij pairt goed met zout en vet wanneer koolzuur hoog genoeg is en zoetheid niet te dominant wordt.",
    39: "Menu-opbouw werkt technisch wanneer je koolzuur en bitterheid gradueel verhoogt en zoetheid plus umami gecontroleerd opbouwt.",
    40: "In examencases kies je combinaties op meetbare assen: koolzuur versus vet, bitterheid versus zout, en zoetheid versus zuur.",
}

REFLECTIEVRAGEN: dict[int, str] = {
    1: "Je moet een gast snel adviseren: kies je eerst voor uitleg over stijl of voor een vraag naar gewenst Mondgevoel, en waarom levert die keuze een betrouwbaarder resultaat op?",
    2: "Als twee bieren dezelfde IBU hebben maar anders smaken, welke twee basisingrediënten onderzoek je eerst en welke causale hypothese toets je daarna?",
    3: "Je proeft onverwachte zoetrest in een ogenschijnlijk droog bier: kies je als primaire verklaring voor lagere attenuatie of voor serveertemperatuur, en welke observatie beslist?",
    4: "In een blindproef twijfel je tussen Ondergisting en Bovengisting: welke ene indicator krijgt prioriteit, en welk risico accepteer je met die keuze?",
    5: "Een gast vraagt om 'iets toegankelijks': kies je een categorie op alcoholniveau of op bitterheids- en body-as, en waarom is dat commercieel sterker?",
    6: "Je detecteert roast en karamel in hetzelfde bier: koppel je het eerst aan moutstort of aan lageringseffect, en welke sensorische data moet je dan hebben?",
    7: "Bij twee identieke recepten met ander maisschema: welke uitkomst verwacht je op body (structuurgewicht), en hoe vertaal je dat naar serveertemperatuur?",
    8: "Een bier toont harde bitterheid met beperkte aromahop: kies je waterprofiel of attenuatie als eerste oorzaak, en welke proefnoot moet je zien om gelijk te krijgen?",
    9: "Je ruikt fruitigheid in een blond: label je dit direct als esters of check je eerst hoparoma, en welke fout maak je als je te vroeg concludeert?",
    10: "Twee flessen van hetzelfde bier verschillen in rondheid: kies je lageringsduur of oxidatie als hoofdverklaring, en welke aanwijzing maakt je keuze hard?",
    11: "Onder tijdsdruk in blindproef: begin je met aromadetail of met structuurdiagnose, en welke volgorde minimaliseert misclassificatie?",
    12: "Schuim valt snel weg bij correcte carbonatie: geef je glasreinheid of receptuur prioriteit, en welke directe test voer je eerst uit?",
    13: "Je detecteert kruidigheid en citrus: kies je fenolen of esters als primaire drager, en welke tweede observatie is doorslaggevend?",
    14: "Een bier lijkt vol maar eindigt droog: beoordeel je dit als hoge body met hoge attenuatie of als temperatuurillusie, en hoe bewijs je het?",
    15: "In een mini-toets moet je een serviceadvies kiezen: ga je voor veilig generiek of voor stijlspecifiek temperatuuradvies, en waarom is een van beide professioneel superieur?",
    16: "Pilsner komt hoekig over aan tafel: corrigeer je eerst temperatuur of glaswerk, en welke uitkomst verwacht je van die eerste interventie?",
    17: "Bij blond met zoete aanzet en korte finale: adviseer je foodpairing op vet of op zout als eerste anker, en wat is je technische argument?",
    18: "In weizenproef is banaantoon dominant: kies je lagere serveertemperatuur of ander glaswerk als eerste correctie, en waarom precies die volgorde?",
    19: "Witbier wordt als 'vlak' ervaren: verhoog je temperatuur of wissel je naar smaller glas, en welke verandering moet direct merkbaar zijn?",
    20: "Bockbier lijkt log in pairing: verlaag je serveertemperatuur of kies je zouter gerecht, en welke keuze levert de grootste balanswinst?",
    21: "Bij een vermoedelijke afwijking: kies je directe vervanging van het bier of eerst oorzaakvalidatie, en welk operationeel risico weegt zwaarder?",
    22: "Je ruikt kartonachtige tonen in een donkere stijl: classificeer je dit als acceptabele rijping of als oxidatiefout, en welke extra toets beslist?",
    23: "Onverwachte zuurheid in tapbier: verdenk je eerst product of leiding, en welke ene meting maakt je besluit verdedigbaar?",
    24: "Schuimproblemen treden alleen in piekuren op: pas je druk of temperatuur als eerste aan, en waarom juist die variabele?",
    25: "Bij fles met depot: kies je volledig uitschenken of depot achterlaten, en hoe verandert dat je servicekwaliteit aantoonbaar?",
    26: "Kaasplateau met hoog zoutgehalte: kies je bier met meer koolzuur of meer zoetheid, en welke keuze geeft stabielere balans?",
    27: "Vet vlees met rookaroma: prioriteer je bitterheid of roast in het bier, en welke fout ontstaat bij de omgekeerde keuze?",
    28: "Dessert met chocolade en zuur fruit: match je op roast of op zoetheid, en welk criterium bepaalt de winnaar?",
    29: "In verticale tasting wijkt jaargang 2 onverwacht af: noem je dit productiefout of opslageffect, en welke bewijsvolgorde volg je?",
    30: "Gast vraagt om bewaarpotentieel: geef je een breed advies of exact drinkvenster, en waarom is een van beide professioneler?",
    31: "Belgische stijl met hoge esterdruk: corrigeer je perceptie via temperatuur of via foodpairing, en welke keuze is meest controleerbaar?",
    32: "Duitse lager toont ruwere bitterheid dan verwacht: verdenk je waterprofiel of serveertemperatuur eerst, en welke observatie beslist?",
    33: "IPA mist aroma maar houdt bitterheid: classificeer je dit als oxidatie of als receptuurbalans, en welke data heb je nodig voor zekerheid?",
    34: "Stout in pairing wordt als te hard ervaren: verlaag je roastimpact via gerechtkeuze of via serveertemperatuur, en welke interventie is directer?",
    35: "Saison lijkt kruidig maar dun: compenseer je met glaswerk of met pairing op vet, en waarom levert jouw keuze snellere kwaliteitswinst?",
    36: "Zuur bier bij vettig gerecht domineert volledig: kies je bierwissel of receptaanpassing, en welke keuze is service-economisch slimmer?",
    37: "Barrel-aged bier toont veel hout maar weinig basisbier: beoordeel je dit als stijl of als onbalans, en welke proefstap legitimeert je oordeel?",
    38: "Alcoholvrij bier wordt 'waterig' genoemd: verhoog je temperatuur of kies je gerecht met meer zout/vet, en welke route is sensorisch sterker?",
    39: "Bij menubouw botsen gang 3 en 4 in bitterheid: schuif je volgorde of vervang je een bier, en waarom is jouw keuze consistenter?",
    40: "In examenblindproef twijfel je tussen twee stijlen: kies je snelle commitment of expliciete onzekerheidsanalyse, en welke strategie scoort doorgaans hoger?",
}

GOLD_KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["fermentatie", "balans", "koolzuur", "Mondgevoel", "afdronk"],
    2: ["waterchemie", "moutstort", "hopgift", "giststam", "extract"],
    3: ["attenuatie", "ethanol", "koolzuurproductie", "vergistingswarmte", "restsuiker"],
    4: ["Ondergisting", "Bovengisting", "temperatuurregime", "esterprofiel", "zuiverheid"],
    5: ["stijldefinitie", "classificatie", "verwachtingsmanagement", "typiciteit", "variatie"],
    6: ["enzymkracht", "kleurvorming", "karamelisatie", "roast", "dextrine"],
    7: ["maisschema", "beta-amylase", "alfa-amylase", "vergistbaarheid", "pH"],
    8: ["bitterheid", "iso-alfazuren", "hopimpact", "dryhop", "perceptie"],
    9: ["esters", "fenolen", "pitch-rate", "gistvitaliteit", "fermentatieprofiel"],
    10: ["lagering", "rijping", "stabilisatie", "integratie", "helderheid"],
    11: ["proefvolgorde", "retronasaal", "Mondgevoel", "structuuranalyse", "hypothesevorming"],
    12: ["schuimstabiliteit", "eiwitmatrix", "koolzuurdruk", "glasreinheid", "retentie"],
    13: ["aromawiel", "bronherkenning", "intensiteit", "typiciteit", "aromapersistentie"],
    14: ["body", "viscositeit", "carbonatie", "alcoholwarmte", "textuur"],
    15: ["beslislogica", "causaliteit", "foutdetectie", "kalibratie", "feedback"],
    16: ["Pilsner", "Ondergisting", "attenuatie", "hopbitterheid", "doordrinkbaarheid"],
    17: ["Blond", "Bovengisting", "esters", "balans", "drinkvenster"],
    18: ["Weizen", "tarwemout", "fenolen", "esters", "schuimretentie"],
    19: ["Witbier", "kruiding", "esters", "fenolen", "frisheid"],
    20: ["Bockbier", "moutdiepte", "roast", "restextract", "rijping"],
    21: ["smaakafwijking", "oorzaakanalyse", "validatie", "correctie", "protocol"],
    22: ["oxidatie", "zuurstofinname", "versheidsverlies", "opslagtemperatuur", "rotatie"],
    23: ["contaminatie", "wilde gist", "bacteriebelasting", "hygiëne", "stabiliteit"],
    24: ["tapdruk", "leidingweerstand", "temperatuurbeheer", "schuimvorming", "reinigingscyclus"],
    25: ["flesconditionering", "depotbeheer", "lichtschade", "openingsprotocol", "uitschenktechniek"],
    26: ["kaasrijping", "zoutdruk", "vetmatrix", "koolzuurreiniging", "aromabrug"],
    27: ["Maillardreactie", "umami", "vetbelasting", "smaakspiegeling", "textuurreset"],
    28: ["dessertzoetheid", "roast", "koolzuurbalans", "aromadiepte", "finalelengte"],
    29: ["jaargang", "evolutie", "vergelijkingsprotocol", "oxidatietrend", "sensorische drift"],
    30: ["bewaarpotentieel", "drinkvenster", "stabiliteit", "extractdichtheid", "rijpingsdoel"],
    31: ["regionale stijl", "gistcultuur", "serveertraditie", "glasprotocol", "stijltypiciteit"],
    32: ["reinheid", "waterprofiel", "bitterheidslijn", "vergistingscontrole", "stijlnuance"],
    33: ["IPA", "hoparoma", "sulfaatratio", "attenuatie", "oxidatiegevoeligheid"],
    34: ["stout", "porter", "roast", "moutbitterheid", "afdronkstructuur"],
    35: ["saison", "farmhouse", "fenolen", "attenuatie", "kruidexpressie"],
    36: ["zuurprofiel", "melkzuur", "azijnzuur", "integratie", "balans"],
    37: ["barrel aging", "micro-oxidatie", "houtextractie", "tannine", "integriteit"],
    38: ["alcoholvrij", "bodycompensatie", "wortigheid", "carbonatie", "smaakpositie"],
    39: ["menusequencing", "intensiteitsopbouw", "paletvermoeidheid", "serveerritme", "combinatielogica"],
    40: ["examenschema", "tijddruk", "hypothesetoets", "argumentatie", "besliskader"],
}

# lessons 21-40 appended
