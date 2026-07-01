"""White Wine Track V2 — FINAL ELITE LOCKED polish data (lessen 1–20).

Bron voor context: `content/pipeline/WHITE_PIPELINE_CONTENT.md`.
Identiteit: zuur als ruggengraat, aromatische precisie, textuur, reductie/oxidatie,
MLF, sur lie, mineraliteit, temperatuur, finesse — géén Wine Foundation-rehash.
"""

from __future__ import annotations

THEORY_LEAD_OVERRIDES: dict[int, str] = {
    11: (
        "Een gast die zegt dat witte wijn 'makkelijker' te proeven is dan rode wijn, "
        "mist een cruciaal punt: er verdwijnt een hele structuuras. Zonder tannine "
        "houd je in de mond nog maar twee ankers over — zuur en alcohol — in plaats "
        "van drie, en wie dat gat niet bewust opvult met een dubbele zuurcheck, "
        "proeft wit voortaan te oppervlakkig. Het protocol blijft visueel, neus, "
        "mond, conclusie, maar het gewicht dat je aan elke stap toekent, verschuift "
        "volledig."
    ),
    15: (
        "Een blindproef zonder vast protocol is geen proef maar een gok met een "
        "verhaal erbij — en juist bij witte wijn, waar tannine niet meehelpt je "
        "conclusie te onderbouwen, wreekt die improvisatie zich sneller dan bij "
        "rood. Deze mini-toets test niet hoeveel losse feiten je kent, maar of je "
        "vier bouwstenen — direct press, kleur, zuur en MLF — in de juiste volgorde "
        "en zonder haast kunt combineren tot een houdbare hypothese."
    ),
}

PRO_INSIGHT_OVERRIDES: dict[int, str] = {
    1: (
        "Een gast die zegt dat witte wijn 'geen pit' heeft omdat er geen tannine "
        "in zit, mist het punt: leg uit dat structuur bij wit via zuur en extract "
        "loopt, niet via grip op het tandvlees. Serveer ter demonstratie een "
        "blanc de noirs-stijl naast een klassieke witte wijn — die vergelijking "
        "laat sneller zien dat kleur en structuur twee losse variabelen zijn dan "
        "welke uitleg ook."
    ),
    2: (
        "Herken je romigheid en een licht broodachtige toon in een RVS-witte "
        "wijn, wijs dat dan toe aan sur-lie-contact vóórdat je 'hout' noemt — dat "
        "voorkomt dat je een gast een duurdere, houtgerijpte stijl aanpraat "
        "terwijl de gevraagde textuur al zonder vat te vinden is. Vraag bij "
        "twijfel altijd door naar wat de gast precies bedoelt met 'romig': "
        "textuur of aroma."
    ),
    3: (
        "Verkoop witte wijn bij vette of romige gerechten op basis van "
        "zuurspanning, niet met de vuistregel 'wit bij vis' — die regel dekt de "
        "gastronomische breedte van wit niet en laat kansen liggen bij saus- of "
        "vleesgerechten. Vraag een gast die twijfelt tussen wit en rood bij een "
        "romig gerecht simpelweg: 'wil je dat de wijn het gerecht doorsnijdt of "
        "begeleidt?'"
    ),
    4: (
        "Wanneer een gast 'traditionele witte wijn' vraagt, vraag dan door: "
        "bedoelt hij een oude regio zoals Chablis, of een oxidatieve, oranje "
        "stijl die dichter bij de werkelijk antieke techniek ligt? Die twee "
        "liggen verder uit elkaar dan het woord 'traditioneel' doet vermoeden, "
        "en het verkeerde glas op tafel zetten kost je meteen geloofwaardigheid."
    ),
    5: (
        "Wil je een gast snel richting een categorie sturen zonder jargon: "
        "vraag naar bloemig versus citrus/kruidig in plaats van naar 'fris of "
        "rijk' — dat onderscheid wijst direct naar terpeen- versus "
        "thiolgedreven druiven en dus naar de juiste fles op de kaart."
    ),
    6: (
        "Bij een prijsverschil tussen twee vergelijkbare witte wijnen van "
        "dezelfde producent kun je vaak wijzen naar persfractie: een cuvée op "
        "basis van vrijloopsap rechtvaardigt een hogere prijs door minder "
        "fenolen en meer verfijning, niet door marketing alleen. Proef dat "
        "verschil zelf blind vóór je het aan een gast uitlegt."
    ),
    7: (
        "Ruikt een gast bij het inschenken een vluchtige, zwavelachtige geur "
        "die na even zwenken verdwijnt, leg dan uit dat dit reductie is uit een "
        "koude, precieze gisting — geen kurkfout. Test dat zelf eerst met een "
        "korte swirl vóór je de fles terugstuurt naar de kelder; onterecht een "
        "technisch prima fles afkeuren kost meer dan het beluchten."
    ),
    8: (
        "Verwar bij gasten 'zacht en rond' niet automatisch met 'houtgerijpt' "
        "— vraag door of ze vanille of toast proeven vóór je hout aanwijst. "
        "Laat twijfelaars een foudre- of betonei-wijn naast een barrique-wijn "
        "proeven: dat onderscheid tussen structuur en houtsmaak overtuigt "
        "sneller dan elke uitleg."
    ),
    9: (
        "Als een gast 'geen boterige Chardonnay' wil, vraag dan niet alleen "
        "naar de druif maar specifiek naar het MLF-beleid — een RVS-Chardonnay "
        "zonder MLF kan verrassend strak zijn, terwijl een houtgerijpte met "
        "volledige MLF juist de stijl is die de gast wil mijden. Dat ene woord "
        "bespaart je een retourfles."
    ),
    10: (
        "Wijs een gast die twijfelt aan een petroltoon in oudere Riesling erop "
        "dat dit TDN is, een erkend kwaliteitskenmerk bij deze druif — geen "
        "wijnfout. Adviseer bij bewaaradvies nooit op leeftijd alleen: check "
        "eerst de zuur-suikerbalans en de sluiting, die twee voorspellen samen "
        "veel betrouwbaarder of een fles nog verder kan."
    ),
    11: (
        "Vergeet tannine als checklist-item bij wit: vervang die stap bewust "
        "door een tweede zuurcheck aan het einde van de mondproef. Test zuur "
        "bovendien altijd bij de temperatuur waarop je serveert — te koud "
        "overdrijft de indruk, te warm verdoezelt hem, en dat vertekent elk "
        "advies dat je aan tafel geeft."
    ),
    12: (
        "Beoordeel kleur altijd vóór je het etiket leest — noteer je hypothese "
        "over klimaat en productie eerst, en toets die pas daarna aan wat je "
        "ruikt. Bij twijfel over een amberkleurige wijn: vraag naar de druif en "
        "de bewuste stijl vóór je 'oxidatiefout' concludeert, dat voorkomt een "
        "onterecht retour."
    ),
    13: (
        "Ruik bewust op de verhouding tussen fruit en boter/toast, niet alleen "
        "op losse descriptors — die verhouding alleen al scheidt de frisse van "
        "de rijke witte druiven aan tafel. Laat een gast twee glazen naast "
        "elkaar ruiken (fris versus rijk) in plaats van te proberen het "
        "verschil in woorden te vangen; dat werkt overtuigender."
    ),
    14: (
        "Vraag jezelf bij elke witte wijn af: is dit lage zuur door klimaat, "
        "door MLF, of door beide? Dat onderscheid voorkomt een verkeerde "
        "druivenhypothese aan tafel. Test bovendien altijd bij gelijke "
        "temperatuur wanneer je twee wijnen vergelijkt — een kouder glas wint "
        "anders oneerlijk van zuur alleen."
    ),
    15: (
        "Documenteer bij elke blinde witte wijn eerst je stijlhypothese — "
        "koel/strak of warm/rond — vóór je nadenkt over een specifieke druif. "
        "Die discipline is precies wat je team onderscheidt in een "
        "verkoopcontext waar gasten op je oordeel vertrouwen, en voorkomt dat "
        "je te snel naar een merknaam raadt."
    ),
    16: (
        "Bij twijfel tussen Sauvignon Blanc en Verdejo: zoek naar een lichte "
        "amandelbitterheid in de afdronk. Vind je die, dan proef je vrijwel "
        "zeker Verdejo. Serveer Sauvignon Blanc koel (6–9°C) in een smaller "
        "glas — een te breed glas of te warme temperatuur laat de scherpe "
        "groene tonen omslaan naar vermoeid en vlak, en dat is precies het "
        "moment waarop een gast de wijn ten onrechte afwijst."
    ),
    17: (
        "Bij twijfel tussen Riesling en Grüner Veltliner: zoek naar een "
        "pepertoon. Vind je die, dan proef je Grüner; blijft de zuurlijn puur "
        "zonder kruidige rand, dan is het Riesling. Serveer Riesling koel "
        "(6–9°C) in een middelgroot glas, en geef oudere, complexere flessen "
        "bewust iets meer glasruimte om de tertiaire laag te openen."
    ),
    18: (
        "Proef bewust op ziltigheid vóór je aan fruit denkt: die maritieme "
        "toon is bij Albariño vaak het eerste en meest betrouwbare signaal. "
        "Serveer goed gekoeld (6–9°C) in een smal glas — Albariño is een van "
        "de weinige witte wijnen waarbij een iets lagere temperatuur dan "
        "gebruikelijk de stijl juist versterkt, wat perfect aansluit bij een "
        "oester- of schaaldierenkaart."
    ),
    19: (
        "Bij twijfel tussen Grüner Veltliner en Riesling: zoek actief naar "
        "witte peper in de afdronk. Vind je die niet, ga dan uit van Riesling. "
        "Kies het glas op stijl: een kleiner glas voor lichte Steinfeder-"
        "stijlen, meer ruimte voor geconcentreerde Smaragd-stijlen om de "
        "kruidigheid te laten ontwikkelen — en durf Grüner voor te stellen bij "
        "asperges, een gerecht waar de meeste andere witte wijnen op stuklopen."
    ),
    20: (
        "Bij twijfel tussen Verdejo en Sauvignon Blanc: zoek naar "
        "amandelbitterheid in de afdronk in plaats van naar de intensiteit van "
        "het aroma. Serveer Verdejo iets minder extreem koel (7–9°C) dan de "
        "meest expressieve frisse druiven — die lichte bitterheid komt het "
        "best tot zijn recht bij een fractie hogere temperatuur, iets wat de "
        "meeste kaarten over het hoofd zien."
    ),
}

QUIZ_FEEDBACK_OVERRIDES: dict[int, str] = {
    1: (
        "Sterk. Je begrijpt nu waarom witte wijn zijn identiteit ontleent aan "
        "schilcontact, niet aan de druif zelf.\n\n"
        "Drie leerankers:\n"
        "- schilcontact als scheidend productiemoment\n"
        "- zuurruggengraat in plaats van tannine\n"
        "- blanc de noirs als bewijs dat techniek boven druifkleur gaat\n\n"
        "In de volgende les ga je een stap dieper: hoe oogsttiming en "
        "débourbage die zuurruggengraat al vóór de gisting beschermen."
    ),
    2: (
        "Goed gedaan. Je ziet nu hoe elke stap in de keten — van oogst tot "
        "élevage — bewust fruit en zuur beschermt.\n\n"
        "Drie leerankers:\n"
        "- débourbage als klaringsstap vóór de gisting\n"
        "- sur lie voor textuur zonder houtsmaak\n"
        "- élevage-keuze als stijlbepalende schakel\n\n"
        "In les 3 zoom je uit en ontdek je waarom zuur — het resultaat van "
        "precies deze keten — witte wijn tot de meest veelzijdige categorie "
        "aan tafel maakt."
    ),
    3: (
        "Sterk. Je begrijpt nu waarom één structuurelement — zuur — het "
        "volledige witte spectrum draagbaar houdt.\n\n"
        "Drie leerankers:\n"
        "- zuurspanning als eerste beoordelingscriterium\n"
        "- terroirtransparantie door het ontbreken van tannine\n"
        "- botrytis-zoet dat dankzij hoge zuurgraad in balans blijft\n\n"
        "In les 4 leer je hoe deze zuurgedreven identiteit historisch pas "
        "recent — met de komst van temperatuurcontrole — tot volle wasdom kwam."
    ),
    4: (
        "Goed. Je kunt nu uitleggen waarom de frisse, strakke witte wijn van "
        "vandaag technisch gezien jong is, ondanks eeuwenoude wijngaarden.\n\n"
        "Drie leerankers:\n"
        "- de koelrevolutie als omslagpunt naar precisiewitwijn\n"
        "- Kimmeridgien-kalksteen als reputatiedrager van Chablis\n"
        "- het Prädikatsysteem als vroege suiker-zuurclassificatie\n\n"
        "In les 5 gebruik je die technische lens om de vijf hoofdcategorieën "
        "binnen witte wijn te herkennen."
    ),
    5: (
        "Sterk. Je herkent nu de vijf hoofdcategorieën als resultaat van "
        "meetbare keuzes, niet van smaak alleen.\n\n"
        "Drie leerankers:\n"
        "- terpenen voor de directe, bloemige aromatiek van aromatische rassen\n"
        "- thiolen voor de citrus- en kruidentonen van Sauvignon Blanc-achtige "
        "stijlen\n"
        "- edelrot en passerillage als twee losstaande routes naar zoete "
        "witte wijn\n\n"
        "Module 2 begint in les 6 bij het allereerste productiemoment: direct "
        "press, waar de basis voor elke categorie letterlijk wordt geperst."
    ),
    6: (
        "Goed. Je begrijpt nu waarom persfractie net zo bepalend is voor "
        "kwaliteit als druif of terroir.\n\n"
        "Drie leerankers:\n"
        "- vrijloopsap als meest verfijnde, minst fenolische fractie\n"
        "- inertisering ter bescherming tegen vroege oxidatie\n"
        "- fractiescheiding als kwaliteitskeuze, niet als marketingterm\n\n"
        "In les 7 volg je het sap de tank in en ontdek je hoe temperatuur "
        "tijdens de gisting dat kwetsbare aroma verder beschermt of juist "
        "verliest."
    ),
    7: (
        "Sterk. Je kunt nu reductie uit een koude gisting onderscheiden van "
        "een structurele wijnfout.\n\n"
        "Drie leerankers:\n"
        "- estervorming door lage gistingstemperatuur\n"
        "- thiolvrijzettende gisten bij aromatische rassen\n"
        "- reductierisico door onvoldoende stikstofbeheer (YAN)\n\n"
        "In les 8 verlaat de wijn de tank en kijk je naar de volgende "
        "beslissing: RVS of hout, en wat dat werkelijk met textuur doet."
    ),
    8: (
        "Goed. Je weet nu dat vatkeuze via micro-oxygenatie werkt, niet "
        "simpelweg via 'smaak toevoegen'.\n\n"
        "Drie leerankers:\n"
        "- micro-oxygenatie als mechanisme achter houtrijping\n"
        "- vatformaat (barrique versus foudre) als bepalende factor voor "
        "houtintensiteit\n"
        "- bâtonnage en betonei als textuurbron zonder houtsmaak\n\n"
        "In les 9 draait de volgende stijlkeuze niet om het vat maar om een "
        "bacterie: malolactische gisting."
    ),
    9: (
        "Sterk. Je begrijpt nu waarom MLF een bewuste stijlkeuze is en geen "
        "automatisch onderdeel van witte wijnproductie.\n\n"
        "Drie leerankers:\n"
        "- Oenococcus oeni die appelzuur omzet in melkzuur\n"
        "- diacetyl als aromadrager van de klassieke botertoon\n"
        "- partiële versus volledige MLF als doseerbare stijlkeuze\n\n"
        "In les 10 zie je hoe die zuurbeslissing samen met rijpingskeuzes "
        "bepaalt hoe een witte wijn over jaren evolueert."
    ),
    10: (
        "Goed gedaan. Je kunt nu onderbouwen welke witte wijnen daadwerkelijk "
        "baat hebben bij verder liggen.\n\n"
        "Drie leerankers:\n"
        "- TDN als verklaring voor petrol bij rijpe Riesling\n"
        "- reductieve flesrijping versus oxidatieve vatrijping\n"
        "- zuur-suikerbalans en sluiting als voorspellers van bewaarpotentieel\n\n"
        "Met dit fundament stap je in les 11 de proefzaal in: hoe je witte "
        "wijn systematisch en reproduceerbaar proeft."
    ),
    11: (
        "Sterk. Je beheerst nu het aangepaste proefprotocol waarin zuur de "
        "rol van tannine overneemt.\n\n"
        "Drie leerankers:\n"
        "- zuur als vervangende structuuras voor tannine\n"
        "- tweefasen-ruiken (stil glas, dan na swirlen)\n"
        "- vaste mondvolgorde: zuur, alcohol, body, dan balans\n\n"
        "In les 12 pas je dit protocol concreet toe op het eerste zintuig: "
        "kleur."
    ),
    12: (
        "Goed. Je gebruikt kleur nu als hypothese in plaats van als "
        "eindoordeel.\n\n"
        "Drie leerankers:\n"
        "- kleur als lineaire as (bleekgeel-groen tot amber) in plaats van "
        "rand-versus-kern\n"
        "- diepgoud als optelsom van rijpheid, hout, MLF en lees-contact\n"
        "- amber als gevoeligste signaal tussen stijl, rijping en fout\n\n"
        "In les 13 zet je die visuele hypothese om in een aromahypothese: hoe "
        "herken je primair, secundair en tertiair fruit?"
    ),
    13: (
        "Sterk. Je kunt nu aroma's indelen naar herkomst in plaats van naar "
        "losse woorden.\n\n"
        "Drie leerankers:\n"
        "- primair fruit als klimaatsignaal (citrus/groen versus "
        "steenfruit/tropisch)\n"
        "- secundaire aroma's (boter, brooddeeg, gist) uit lees-contact en MLF\n"
        "- tertiaire aroma's die per druif sterk verschillen, zoals petrol "
        "bij Riesling\n\n"
        "In les 14 volgt het laatste zintuiglijke bouwblok vóór de "
        "mini-toets: zuur zelf, in detail."
    ),
    14: (
        "Goed. Je kunt nu zuur objectief beoordelen los van klimaat- en "
        "productiesignalen door elkaar te halen.\n\n"
        "Drie leerankers:\n"
        "- wijnsteenzuur (stabiel) versus appelzuur (omzetbaar via MLF)\n"
        "- klimaat als externe factor die zuurbehoud stuurt vóór de oogst\n"
        "- speekselopwekking als objectieve zuurtest in de mond\n\n"
        "In les 15 breng je kleur, aroma en zuur samen in de eerste grote "
        "integratietoets van deze track."
    ),
    15: (
        "Uitstekend. Je hebt kleur, aroma, zuur en MLF nu succesvol in één "
        "protocol geïntegreerd.\n\n"
        "Drie leerankers:\n"
        "- direct press als productiestartpunt zonder tannine-extractie\n"
        "- zuur als structurele ruggengraat, belangrijker dan bij enige "
        "andere as\n"
        "- MLF als belangrijkste stijlschakelaar tussen strak en rond\n\n"
        "In les 16 zet je dit fundament om in druivenherkenning, te beginnen "
        "met de meest ondubbelzinnige aromatische druif: Sauvignon Blanc."
    ),
    16: (
        "Sterk. Je herkent Sauvignon Blanc nu betrouwbaar op klimaat, "
        "aroma-intensiteit en kruidig-groene ondertoon.\n\n"
        "Drie leerankers:\n"
        "- pyrazines als bron van de groene, kruidige signatuur\n"
        "- klimaat als sturende factor tussen Loire-stijl en Marlborough-stijl\n"
        "- amandelbitterheid als onderscheidend signaal tegenover Verdejo\n\n"
        "In les 17 blijf je in aromatisch terrein, maar dan bij een druif die "
        "zelf juist neutraler is: Riesling."
    ),
    17: (
        "Goed. Je begrijpt nu waarom Riesling geldt als de meest pure "
        "terroir-druif binnen de frisse categorie.\n\n"
        "Drie leerankers:\n"
        "- aromatische neutraliteit van de druif zelf, waardoor terroir "
        "sterker doorklinkt\n"
        "- het brede zoetheidsspectrum van bloedstrak droog tot edelzoet\n"
        "- TDN-petrolaroma als kwaliteitskenmerk bij rijping, geen fout\n\n"
        "In les 18 verschuif je van Centraal-Europese terroirdruif naar een "
        "Atlantische, zilte stijl: Albariño."
    ),
    18: (
        "Sterk. Je herkent Albariño nu op zijn kenmerkende Atlantische, "
        "ziltige signatuur.\n\n"
        "Drie leerankers:\n"
        "- Atlantisch klimaat als dominante stijlbepaler in Rías Baixas\n"
        "- ziltige mineraliteit als eerste, betrouwbaarste blindproefmarker\n"
        "- amandelbitterheid van Verdejo als onderscheidend contrast\n\n"
        "In les 19 verlaat je de kust en ontdek je een kruidige, continentale "
        "tegenhanger: Grüner Veltliner."
    ),
    19: (
        "Goed. Je begrijpt nu hoe Grüner Veltliner zich onderscheidt van "
        "Riesling ondanks vergelijkbaar hoog zuur.\n\n"
        "Drie leerankers:\n"
        "- witte-pepertoon als unieke, herkenbare signatuur\n"
        "- Steinfeder-tot-Smaragd als stijlbandbreedte binnen één druif\n"
        "- grote dag-nachttemperatuurverschillen langs de Donau als "
        "zuurbehoudende factor\n\n"
        "In les 20 sluit je Module 4 af met een Spaanse druif die op het "
        "eerste gezicht verrassend veel raakvlakken heeft: Verdejo."
    ),
    20: (
        "Sterk gedaan. Je sluit Module 4 af met een scherp onderscheid "
        "tussen drie vaak verwarde druiven.\n\n"
        "Drie leerankers:\n"
        "- amandelbitterheid als kenmerkend, onderscheidend signaal\n"
        "- continentaal klimaat van Rueda als bron van frisheid én structuur\n"
        "- Sauvignon Blanc en Albariño als de twee dichtstbijzijnde "
        "verwarringskandidaten\n\n"
        "In Module 5 verschuif je van frisse naar rijke witte druiven, te "
        "beginnen in les 21 met Chardonnay — de druif die MLF, hout en sur "
        "lie het meest zichtbaar samenbrengt."
    ),
}

WIST_JE_DAT_OVERRIDES: dict[int, str] = {
    1: (
        "Bij Champagne mag zelfs 100% Pinot Noir of Meunier — twee blauwe "
        "druiven — tot volledig kleurloze blanc de noirs worden verwerkt, "
        "mits het sap binnen enkele uren van de schillen wordt gescheiden."
    ),
    2: (
        "Débourbage duurt bij de meeste producenten niet langer dan 24 uur — "
        "te lang wachten laat het most zelf beginnen met ongewenste, wilde "
        "gisting nog vóór de geselecteerde gist is toegevoegd."
    ),
    3: (
        "Sauternes en andere botrytis-zoete wijnen bevatten vaak een hogere "
        "absolute zuurgraad dan menig droge, frisse witte wijn — die zuur is "
        "precies wat voorkomt dat de wijn plakkerig aanvoelt."
    ),
    4: (
        "Vóór de jaren zeventig hadden veel wijnmakers geen koeling in de "
        "kelder; een hittegolf tijdens de oogst kon een hele jaargang witte "
        "wijn onbedoeld oxidatief en zwaar maken, zonder dat iemand dat als "
        "bewuste stijlkeuze had gepland."
    ),
    5: (
        "Muscat is een van de weinige druiven waarbij de wijn bijna exact "
        "ruikt zoals de druif zelf aan de wijnstok ruikt — bij de meeste "
        "andere rassen ontstaat het aroma pas grotendeels tijdens gisting en "
        "rijping."
    ),
    6: (
        "Sommige topcuvées gebruiken uitsluitend het eerste tiental "
        "procenten vrijloopsap en verkopen de rest van de persing als tweede "
        "of derde wijnlijn — dezelfde druiven, uit dezelfde pers, maar met "
        "een compleet ander kwaliteitsprofiel."
    ),
    7: (
        "Een vastzittende gisting kan soms weken na het schijnbare einde van "
        "de fermentatie alsnog hervatten zodra de temperatuur licht stijgt — "
        "wijnmakers houden dat risico daarom nauwlettend in de gaten tot de "
        "fles daadwerkelijk gebotteld is."
    ),
    8: (
        "Een drie- tot vier keer gebruikte barrique geeft nog maar een "
        "fractie van de houtsmaak van een nieuw vat af — veel kelders "
        "combineren daarom bewust oud en nieuw hout om de intensiteit te "
        "doseren in plaats van simpelweg 'op hout' te labelen."
    ),
    9: (
        "Sommige producenten laten slechts 20 tot 30% van een partij MLF "
        "ondergaan en blenden dat terug met niet-MLF-wijn — een "
        "precisietechniek om net genoeg rondheid te geven zonder de "
        "boterigheid te laten domineren."
    ),
    10: (
        "TDN-ontwikkeling in Riesling versnelt aantoonbaar door meer "
        "zonlichtblootstelling in de wijngaard — twee percelen van dezelfde "
        "producent kunnen daardoor bij gelijke leeftijd een merkbaar "
        "verschillende petrolintensiteit tonen."
    ),
    11: (
        "Professionele proevers testen zuur bewust bij kamertemperatuur én "
        "bij serveertemperatuur op dezelfde wijn — het verschil in "
        "waargenomen scherpte tussen die twee metingen kan aanzienlijk zijn."
    ),
    12: (
        "Bij Chenin Blanc en Semillon kan een diepgouden kleur bij een fles "
        "van amper vijf jaar oud al net zo intens zijn als bij een twintig "
        "jaar oude Riesling — kleurdiepte alleen vertelt dus zelden de "
        "volledige leeftijd."
    ),
    13: (
        "Groene paprika-aroma in Sauvignon Blanc komt van pyrazines, "
        "dezelfde verbindingen die ook onrijpe Cabernet Sauvignon hun "
        "kenmerkende groene toon geven — één moleculefamilie, twee compleet "
        "verschillende druiven."
    ),
    14: (
        "Appelzuur wordt tijdens de rijping op de wijnstok afgebroken door "
        "de ademhaling van de druif zelf — een koelere nacht remt die "
        "ademhaling, wat verklaart waarom nachtelijke temperatuurdaling "
        "zoveel invloed heeft op het uiteindelijke zuurniveau."
    ),
    15: (
        "Een hypothese vóór de onthulling opschrijven werkt aantoonbaar "
        "beter dan achteraf redeneren, omdat je brein anders onbewust de "
        "uitkomst gaat 'verklaren' in plaats van toetsen — vooraf schrijven "
        "dwingt een eerlijke, falsifieerbare conclusie af."
    ),
    16: (
        "Marlborough Sauvignon Blanc dankt zijn explosieve aromatiek deels "
        "aan de extreem hoge zonlichtintensiteit gecombineerd met koele "
        "nachten — een combinatie die nergens anders ter wereld exact zo "
        "voorkomt."
    ),
    17: (
        "Riesling kent van alle grote witte druiven het breedste officiële "
        "zoetheidsspectrum — van Kabinett tot Trockenbeerenauslese — "
        "vastgelegd in het Duitse Prädikatsysteem op basis van suikergehalte "
        "bij de oogst."
    ),
    18: (
        "Rías Baixas ligt zo dicht bij de Atlantische Oceaan dat sommige "
        "wijngaarden zicht hebben op zee — de constante wind en "
        "luchtvochtigheid daar temperen de rijping en behouden het hoge "
        "zuurniveau dat Albariño kenmerkt."
    ),
    19: (
        "De pepertoon in Grüner Veltliner wordt toegeschreven aan rotundon, "
        "dezelfde aromaverbinding die ook de kenmerkende peperigheid van "
        "koelklimaat-Syrah/Shiraz verklaart."
    ),
    20: (
        "Verdejo werd tot in de twintigste eeuw vaak bewust oxidatief "
        "gemaakt, in een stijl die dicht bij Sherry lag — pas de introductie "
        "van temperatuurgecontroleerde RVS-gisting maakte de frisse, moderne "
        "Verdejo die nu domineert mogelijk."
    ),
}

# Lessen 16–20 hebben in de Gold Master al de volledige Beste pairing / Waarom
# dit werkt / Vermijd-structuur met specifieke, onderbouwde combinaties
# (Sauvignon Blanc + geitenkaassalade, Riesling + Aziatisch, Albariño + oesters,
# Grüner + asperges, Verdejo + amandel/tapas). Die vijf zijn al elite-niveau —
# geen overrides nodig.
FOOD_PAIRING_OVERRIDES: dict[int, str] = {}
