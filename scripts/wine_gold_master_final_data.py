"""Wine Track V2 — Gold Master FINAL premium polish data."""

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
    (r"’", "'"),
]

THEORY_LEAD_OVERRIDES: dict[int, str] = {
    1: (
        "Een gast die wijn 'ingewikkeld' noemt, heeft meestal nooit gehoord wat er "
        "werkelijk gebeurt in het glas: gist zet druivensuikers om in alcohol en "
        "koolzuur, en dat ene biologische proces — fermentatie — is de hele basis. "
        "Wie die kern niet scherp heeft, verwart later elke categorie, "
        "productiemethode en kwaliteitsniveau door elkaar."
    ),
    2: (
        "Vraag een sommelier waarom twee flessen van dezelfde druif compleet anders "
        "smaken, en het antwoord zit zelden in het etiket — het zit in de keten "
        "oogst, persing, fermentatieproces en rijpingskeuze die aan de botteling "
        "voorafging. Wie die volgorde niet kent, kan geen enkele wijnstijl "
        "verklaren, alleen beschrijven."
    ),
    3: (
        "Een gast die zegt 'ik hou niet van wijn' heeft vaak precies één van de "
        "drie hoofdfamilies geproefd, en generaliseert die ervaring naar alles met "
        "een kurk. Stille, mousserende en versterkte wijn ontstaan uit fundamenteel "
        "verschillende ingrepen op fermentatie en alcohol — en zonder dat "
        "onderscheid scherp te hebben, mis je het kader waarin elke volgende "
        "subtrack pas zinvol wordt."
    ),
    4: (
        "Noem een gast 'oude wijngaarden' en je verkoopt marketing; leg uit waarom "
        "Romeinse wijnbouw en kloostertraditie de wetgeving van vandaag nog "
        "vormgeven, en je verkoopt kennis. Wijngeschiedenis is geen trivia voor bij "
        "de koffie — het is de verklaring achter elke klassieke regio, elke "
        "classificatie en elke 'traditie' die je nu nog op een etiket leest."
    ),
    5: (
        "Voordat een gast over druif of regio nadenkt, kiest hij eigenlijk al een "
        "categorie — wit, rood, rosé, mousserend, versterkt of zoet — en die eerste "
        "keuze stuurt serveertemperatuur, glas en verwachting harder dan welk "
        "druivenras dan ook. Wie categorie als sluitstuk behandelt in plaats van "
        "als eerste filter, verliest tijd aan een gesprek dat in drie seconden had "
        "kunnen landen."
    ),
    6: (
        "Vraagt een gast waarom rode wijn 'zwaarder' aanvoelt dan witte wijn van "
        "precies dezelfde druif, dan ligt het antwoord nooit in het druivenras "
        "alleen — het ligt in het moment waarop schilcontact stopt of net begint. "
        "Die productiestap, niet de druif, is waar kleur en tannine ontstaan."
    ),
    7: (
        "Proef je restsuiker in een wijn die nergens als zoet wordt verkocht, dan "
        "is dat zelden een fout — het is het directe gevolg van een bewuste "
        "gistingsstop. Gisting is de enige stap waar alcohol daadwerkelijk "
        "ontstaat, en zonder dat mechanisme te begrijpen kun je geen stijlverschil "
        "verklaren tussen wijnen die qua druif en regio identiek zouden moeten "
        "zijn."
    ),
    8: (
        "'Gerijpt op eik' op een etiket wordt door veel gasten automatisch gelezen "
        "als kwaliteitskeurmerk, terwijl het in werkelijkheid alleen een stijlkeuze "
        "beschrijft die sterk afhangt van vatleeftijd. Nieuw hout en oud hout geven "
        "een radicaal ander resultaat onder exact dezelfde tekst — en wie dat "
        "verschil niet kan uitleggen, verkoopt een woord in plaats van een wijn."
    ),
    9: (
        "Twee jonge wijnen van hetzelfde jaar kunnen volledig anders ruiken — de "
        "ene fris en fruitig, de andere al notig en naar karamel — zonder dat een "
        "van beide bedorven is. Het verschil tussen oxidatieve en reductieve "
        "wijnmaking verklaart die kloof, en wie dat onderscheid niet kent, leest "
        "'oud ruikend' al snel verkeerd als 'oude wijn'."
    ),
    10: (
        "Niet elke fles wordt automatisch beter door hem te laten liggen — en een "
        "gast die daar wél op rekent, krijgt uiteindelijk een teleurstelling in "
        "plaats van een investering. Of een wijn kan rijpen, voorspel je niet aan "
        "prijs of reputatie, maar aan de structuurbalans waarmee hij begon: "
        "voldoende zuur, tannine en concentratie om verandering te kunnen dragen."
    ),
    11: (
        "De conclusie die je het snelst trekt — meestal op aroma alleen — is in de "
        "praktijk ook de conclusie die het vaakst onderuitgaat zodra je structuur "
        "erbij betrekt. Proeven is daarom een protocol, geen gevoel: een vaste "
        "volgorde dwingt je elke laag apart te toetsen vóór je een oordeel velt."
    ),
    12: (
        "Nog vóór je ruikt of proeft, heeft het glas je al iets verteld: kleur is "
        "de eerste diagnostische laag, niet een esthetisch detail. Intensiteit, "
        "kleurtoon en vooral de rand geven een eerste hypothese over druif, "
        "leeftijd, klimaat en wijnmaakstijl — lang voordat een etiket die "
        "hypothese bevestigt of weerspreekt."
    ),
    13: (
        "Een proefnotitie met tien losse geurwoorden is meestal een vage "
        "proefnotitie — niet omdat de neus het mis had, maar omdat niemand de "
        "aroma's heeft geordend naar herkomst. Primair, secundair en tertiair zijn "
        "geen academische labels maar een directe vertaalslag naar "
        "productiekeuzes: vers fruit wijst op jong en ongehout, sterke tertiaire "
        "tonen wijzen op tijd."
    ),
    14: (
        "Aroma vertelt je wat een wijn ruikt; structuur vertelt je wat een wijn "
        "doet in de mond, en dat tweede is bij eenvoudige pairingbeslissingen "
        "meestal de doorslaggevende factor. Op foundation-niveau leer je vijf "
        "elementen apart voelen — zuur, tannine, alcohol, body en de balans "
        "daartussen — vóór de volle technische diepte in Module 4 volgt."
    ),
    15: (
        "Losse vaardigheden bewijzen zichzelf pas op het moment dat je ze blind "
        "moet combineren — zonder etiket, zonder voorkennis, zonder vangnet. Deze "
        "mini-toets integreert kleur, aroma en structuur in één protocol, en dat "
        "is precies het moment waarop je merkt of je proefmethode standhoudt of "
        "instort."
    ),
    16: (
        "Een wijn met rijk fruit maar te weinig zuur valt binnen een jaar plat, "
        "hoe indrukwekkend het etiket ook klinkt. Zuur is de ruggengraat van wijn: "
        "het bepaalt frisheid, bewaarpotentieel en pairing-kracht, en zonder "
        "voldoende zuur heeft geen ander element genoeg houvast om de wijn "
        "levendig te houden."
    ),
    17: (
        "Een gast die tannine 'bitter' noemt, verwart twee verschillende "
        "gevoelens — en dat onderscheid is precies waar jij als sommelier het "
        "verschil maakt. Tannine ontstaat uit fenolen in schil, pit, steel en "
        "eventueel hout, en geeft structuur, bewaarpotentieel en een groot deel "
        "van het mondgevoel, vooral bij rode wijn."
    ),
    18: (
        "Een wijn die 'heet' aanvoelt zonder een extreem percentage op het "
        "etiket, heeft zelden een alcoholprobleem — vaker een zuurprobleem. "
        "Alcohol ontstaat tijdens gisting uit suiker en voel je niet als smaak "
        "maar als warmte, en die warmte is alleen geïntegreerd wanneer er genoeg "
        "zuur is om hem te dragen."
    ),
    19: (
        "Body is het kenmerk waar de meeste pairingfouten ontstaan, juist omdat "
        "het los staat van aroma en zoetheid — een lichte wijn naast een zwaar "
        "gerecht verdwijnt simpelweg, hoe goed de smaken ook matchen. Body is het "
        "gewicht en de viscositeit die je in de mond voelt, opgebouwd uit alcohol, "
        "glycerol, extract en tannine samen."
    ),
    20: (
        "Een wijn kan op elk los element — zuur, tannine, alcohol, body — "
        "technisch correct scoren en toch onbalans voelen zodra je ze samen "
        "proeft. Balans is precies die synthese, en het is de zwakste schakel "
        "tussen die elementen die bepaalt waar een wijn 'breekt', vooral zodra je "
        "er eten naast zet."
    ),
    21: (
        "Vraag een beginnende proever wat Chardonnay 'smaakt' en je krijgt een "
        "trucvraag terug, want de druif zelf is bijna neutraal — wat je proeft is "
        "vooral de wijnmaker. Witte druivenrassen zijn je eerste woordenboek voor "
        "stijl, en vier druiven — Chardonnay, Sauvignon Blanc, Riesling, Pinot "
        "Grigio — geven je op foundation-niveau al een bruikbare starthypothese."
    ),
    22: (
        "Verwar een Pinot Noir uit Bourgogne nooit met een Cabernet uit Bordeaux "
        "op basis van regio alleen — het tannine- en lichaamsniveau van de druif "
        "zelf vertelt je sneller en betrouwbaarder wat je in het glas kunt "
        "verwachten. Vier druiven vormen dat raamwerk: Cabernet Sauvignon, "
        "Merlot, Pinot Noir en Syrah/Shiraz."
    ),
    23: (
        "Ruik je aan een glas zonder te swirlen en valt de geur je al van een "
        "afstand op, dan proef je vrijwel zeker een aromatisch ras — geen toeval, "
        "maar een meetbaar verschil in geurstofgehalte. Aromatische druiven zoals "
        "Sauvignon Blanc, Riesling, Gewürztraminer en Muscat blijven daardoor "
        "intens en herkenbaar, zelfs wanneer terroir of wijnmaken minder "
        "uitgesproken is."
    ),
    24: (
        "Noem een druif nooit 'saai' voordat je begrijpt wat hij wél doet: "
        "neutrale rassen zoals ongehoute Chardonnay, Pinot Grigio en Trebbiano "
        "zijn juist de beste terroir-boodschappers omdat ze zichzelf niet op de "
        "voorgrond zetten. Zonder dominant eigen aroma laat de druif klimaat, "
        "bodem en wijnmaken veel duidelijker doorklinken."
    ),
    25: (
        "'Ik proef Chardonnay' zegt op zichzelf nog niets over stijl, en wie dat "
        "wel denkt, mist twee van de drie lagen die een wijn vormen. Stijl is "
        "altijd druif plus klimaat plus wijnmaken — dezelfde druif kan van slank "
        "en mineraal naar tropisch en boterig bewegen, puur door waar hij groeide "
        "en hoe hij werd vinifieerd."
    ),
    26: (
        "'Het is er fris' is geen klimaatanalyse maar een gevoel — koel klimaat "
        "is een meetbaar effect van temperatuur op de fysiologie van de druif, "
        "met directe gevolgen voor zuurgraad en rijping. Een groot diurnaal "
        "verschil tussen warme dagen en koude nachten remt de afbraak van "
        "appelzuur, wat hogere totale zuurgraad geeft, zelfs bij volledige "
        "suikerrijping."
    ),
    27: (
        "In een gematigd klimaat is de foutmarge kleiner dan in elk extreem "
        "klimaat: één koelere jaargang kipt al snel richting groen en scherp, één "
        "warmere richting jammy en log. Dat is precies waarom jaargangvariatie in "
        "gebieden als Bordeaux, Bourgogne, Rioja en Piemonte vaak prominenter is "
        "dan het verschil tussen twee gematigde regio's onderling."
    ),
    28: (
        "In warm klimaat loopt suikeraccumulatie sneller dan fenolische rijping "
        "kan bijhouden, en dat creëert een kloof waar elke producent een antwoord "
        "op moet vinden — anders eindig je met een wijn die fenolisch rijp is, "
        "maar met een alcoholpercentage dat ver boven 14,5% uitkomt. Nachtoogst, "
        "bladwerk en koelere mesoklimaten zijn de bewuste correcties op dat "
        "risico."
    ),
    29: (
        "Zeg nooit tegen een gast 'je proeft de leisteen' — wetenschappelijk is "
        "directe mineraaloverdracht van gesteente naar wijn niet aangetoond. Wat "
        "bodem wél doet, is drainage, warmtehuishouding en mineraalbeschikbaarheid "
        "sturen, en die drie mechanismen verklaren het verschil tussen kalk, klei, "
        "zand en leisteen veel overtuigender dan het woord 'mineraliteit' alleen."
    ),
    30: (
        "Twee aangrenzende percelen van dezelfde producent, met dezelfde druif en "
        "dezelfde wijnmaaktechniek, kunnen structureel verschillende wijnen "
        "opleveren — en dát verschil, niet de regio op het etiket, is waar "
        "gespecialiseerde terroir-analyse begint. Terroir is de synthese van "
        "klimaat, bodem, topografie en de menselijke factor, nooit één van die "
        "elementen alleen."
    ),
    31: (
        "Eén graad verschil in de kelder verklaart een groot deel van de 'te "
        "zuur' of 'te alcoholisch'-klachten aan tafel, en toch behandelen de "
        "meeste zaken serveertemperatuur als een vast getal in plaats van een "
        "bewegend doel. Een glas warmt in een verwarmde ruimte ongeveer 1–2°C per "
        "tien minuten op — schenk daarom altijd net iets ónder de uiteindelijke "
        "doeltemperatuur."
    ),
    32: (
        "Glasvorm is geen esthetiek voor op de tafelfoto maar aromatechniek: "
        "kelkbreedte en de versmalling naar de rand bepalen hoeveel geurstoffen "
        "zich boven de wijn concentreren vóór ze de neus bereiken. Een verkeerd "
        "glas kan een verzorgde wijn structureel ondermaats laten overkomen, "
        "zonder dat er iets mis is met de fles zelf."
    ),
    33: (
        "Decanteren heeft twee technisch verschillende doelen die je niet mag "
        "verwarren — en de meeste service-fouten ontstaan precies op dat punt. "
        "Beluchten versnelt esterificatie en zachte oxidatie bij jonge, "
        "tanninerijke wijn; sedimentscheiding bij oude wijn vraagt een trage, "
        "vloeiende beweging over een lichtbron, gestopt zodra het depot de hals "
        "bereikt."
    ),
    34: (
        "Een fles die warm, in het licht of met trilling wordt opgeslagen, "
        "verliest waarde sneller dan elke prijsdaling op de kaart — en dat is "
        "meestal een logistieke fout, geen kwaliteitsprobleem van de wijn zelf. "
        "Professionele kelderopslag vraagt vier stabiele condities tegelijk: "
        "temperatuur, luchtvochtigheid, duisternis en minimale trilling."
    ),
    35: (
        "'Rode wijn bij kaas' is sensorisch vaker een mythe dan een regel: "
        "tannine en het vet of eiwit van veel kazen botsen vaker dan ze "
        "harmoniëren. Professionele kaaspairing werkt daarom per categorie — "
        "vers, zacht, gewassen korst, hard, blauw — niet per kleur wijn."
    ),
    36: (
        "'Geen rode wijn bij vis' is geen willekeurige regel maar het gevolg van "
        "een concreet mechanisme: bepaalde verbindingen in vette vis reageren met "
        "ijzer en tannine en geven een metalen nasmaak. Begrijp je dat mechanisme, "
        "dan begrijp je ook waarom de uitzonderingen — zoals tanninearme Pinot "
        "Noir bij zalm — wél werken."
    ),
    37: (
        "Dat 'vlees tannine verzacht' is geen vage culinaire wijsheid maar "
        "eiwitbinding: speekseleiwitten worden normaal door tannine aangevallen, "
        "en eiwit en vet uit vlees bieden een alternatieve bindingsplek. "
        "Vetgehalte en bereidingswijze bepalen samen hoeveel tannine of zuur een "
        "gerecht nodig heeft om fris te blijven."
    ),
    38: (
        "Wie bij een onbekende witte wijn te snel naar een druif of regio "
        "springt, raadt vaker fout dan wie eerst de volledige structuurketen "
        "doorloopt. Systematisch blindproeven volgt een vaste volgorde — "
        "visueel, neus, mond — en pas daarna formuleer je een hypothese met "
        "expliciete redenering, niet andersom."
    ),
    39: (
        "Bij rode wijn leidt structuur sneller naar een correcte hypothese dan "
        "aroma alleen, en wie dat omdraait, verwart al snel leeftijd met stijl. "
        "Tanninekwaliteit — fijnkorrelig en zijdezacht versus grof en drogend — "
        "wijst vaak sterker op druif en herkomst dan kleur of geur ooit kunnen."
    ),
    40: (
        "Een examenvraag is in essentie altijd een servicevraag in vermomming: "
        "wat zou je vrijdagavond om 20:00 uur schenken bij deze gast en dit "
        "gerecht, en waarom precies dat mechanisme? Dit Master-examen integreert "
        "de volledige Wine Foundation Track — fundament, productie, "
        "proeftechniek, structuur, druivenrassen, klimaat & terroir, service, "
        "pairing en blindanalyse — in drie onderdelen die elk een andere "
        "vaardigheid toetsen."
    ),
}

WIST_JE_DAT_OVERRIDES: dict[int, str] = {
    1: (
        "Gist leeft van nature op druivenschillen — daarom kon fermentatie "
        "duizenden jaren geleden spontaan ontstaan, zonder dat iemand wist wat "
        "gist was; dat verklaart waarom wijn eerder ontdekt dan uitgevonden is."
    ),
    2: (
        "Oogsttiming verschuift jaarlijks met enkele weken door "
        "weersomstandigheden, wat verklaart waarom 'oogstjaar' op een etiket meer "
        "zegt over het seizoen dan over een vast kwaliteitsniveau."
    ),
    3: (
        "De drie hoofdfamilies zijn wettelijk strikter gedefinieerd dan smaak "
        "alleen: zodra koolzuur of toegevoegde alcohol een vastgelegde drempel "
        "overschrijdt, verandert de wettelijke categorie, ook als de smaak "
        "nauwelijks verschilt."
    ),
    4: (
        "Veel klassieke appellatiewetgeving van vandaag is direct te herleiden "
        "tot grenzen die kloosters al in de middeleeuwen rond hun beste percelen "
        "trokken — regelgeving volgde de wijngaard, niet omgekeerd."
    ),
    5: (
        "Een wijn kan tegelijk meerdere categorieën combineren — zoals zoete "
        "mousserende wijn — wat verklaart waarom 'categorie' altijd een "
        "combinatie van assen is, niet één simpel label."
    ),
    6: (
        "Hetzelfde druivenras kan met en zonder schilcontact worden vinifieerd, "
        "wat verklaart waarom sommige 'witte' wijnen eigenlijk van rode druiven "
        "worden gemaakt — de schil bepaalt de kleur, niet alleen de druif."
    ),
    7: (
        "Eenzelfde druivenpartij kan met twee verschillende giststammen totaal "
        "andere aroma's opleveren, wat verklaart waarom 'wilde' versus "
        "geselecteerde gisting vaak het grootste smaakverschil tussen twee "
        "wijnmakers van dezelfde druif vormt."
    ),
    8: (
        "Een vat verliest na drie tot vier keer gebruik het grootste deel van "
        "zijn directe houtsmaak, wat verklaart waarom producenten oud vatpark "
        "bewust mengen met nieuw hout om controle te houden over de "
        "uiteindelijke intensiteit."
    ),
    9: (
        "Reductieve fouten (zwavelig, rotte-eitonen) en bewuste reductieve stijl "
        "worden makkelijk verward, wat verklaart waarom 'geen zuurstof' niet "
        "automatisch 'fris en schoon' betekent zonder zorgvuldig kelderbeheer."
    ),
    10: (
        "Niet elk structuurelement rijpt in hetzelfde tempo: zuur blijft "
        "relatief stabiel, terwijl tannine sneller verandert, wat verklaart "
        "waarom een jonge wijn met hoog zuur maar zacht tannine soms sneller "
        "'oud' aanvoelt dan verwacht."
    ),
    11: (
        "Een vaste proefvolgorde voorkomt niet alleen foute conclusies maar ook "
        "vermoeidheid: door kleur, neus en mond apart te scheiden, hoeft je "
        "brein niet drie zintuigen tegelijk te wegen, wat blindproeven over een "
        "hele sessie merkbaar nauwkeuriger houdt."
    ),
    12: (
        "De rand van een wijn verandert sneller dan het midden, omdat de dunne "
        "wijnlaag aan de rand meer zuurstofcontact krijgt — daarom is de rand, "
        "en niet het midden, je betrouwbaarste eerste leeftijdssignaal."
    ),
    13: (
        "Swirlen verhoogt het verdampingsoppervlak van de wijn aanzienlijk, wat "
        "verklaart waarom dezelfde wijn na swirlen vaak een extra aromalaag "
        "toont die in een stilstaand glas onopgemerkt blijft."
    ),
    14: (
        "Tannine en zuur kunnen elkaars perceptie versterken in plaats van "
        "optellen: een hoog-zuur wijn voelt een gegeven hoeveelheid tannine "
        "vaak drogender aan dan dezelfde tannine in een lager-zuur wijn — "
        "structuurelementen werken nooit volledig los van elkaar."
    ),
    15: (
        "Een hypothese vóór de onthulling noteren werkt beter dan achteraf "
        "redeneren, omdat je brein anders onbewust de uitkomst gaat 'verklaren' "
        "in plaats van toetsen — vooraf schrijven dwingt eerlijke, "
        "falsifieerbare conclusies."
    ),
    16: (
        "Zuur wordt tijdens de rijping in de wijngaard afgebroken door "
        "ademhaling van de druif zelf, niet door verdunning — een koelere nacht "
        "remt die ademhaling, wat verklaart waarom diurnaal verschil zo veel "
        "invloed heeft op het uiteindelijke zuurniveau."
    ),
    17: (
        "Tannine polymeriseert tijdens rijping: kleine, scherpe moleculen "
        "klitten samen tot grotere, zachtere ketens, wat verklaart waarom "
        "dezelfde hoeveelheid tannine in een oudere wijn milder aanvoelt zonder "
        "dat er fysiek tannine is verdwenen."
    ),
    18: (
        "Alcohol verlaagt de viscositeitsdrempel waarop je body waarneemt, wat "
        "verklaart waarom twee wijnen met identiek extract toch verschillend "
        "'vol' kunnen aanvoelen zodra het alcoholpercentage uiteenloopt."
    ),
    19: (
        "Glycerol, een bijproduct van gisting, draagt zoeter en voller aan body "
        "bij zonder dat er suiker aanwezig is — wat verklaart waarom een "
        "volledig droge wijn toch een romige indruk kan geven."
    ),
    20: (
        "Balans is geen vast eindpunt maar verschuift met temperatuur en "
        "gerecht: een wijn die op zichzelf onbalans lijkt, kan naast het juiste "
        "gerecht plots wél in evenwicht ogen, omdat het gerecht de zwakste "
        "schakel compenseert."
    ),
    21: (
        "Chardonnay-klonen verschillen onderling sterker in opbrengst en "
        "aromaprofiel dan veel andere druivenrassen, wat deels verklaart waarom "
        "'kameleon' niet alleen aan wijnmaken te danken is, maar ook aan de "
        "genetische variatie binnen de druif zelf."
    ),
    22: (
        "Tanninekorrel — fijn of grof — wordt deels bepaald door de schildikte "
        "van de druif, niet alleen door extractietechniek, wat verklaart waarom "
        "Cabernet Sauvignon onder vergelijkbare wijnmaakkeuzes toch structureel "
        "grover aanvoelt dan Pinot Noir."
    ),
    23: (
        "Terpenen, de geurstofklasse achter aromatische druiven, zitten al vóór "
        "de oogst in hoge concentratie in de druif zelf, wat verklaart waarom "
        "aromatische rassen ook bij een onervaren wijnmaker nog herkenbaar "
        "blijven."
    ),
    24: (
        "Neutrale druiven bevatten van nature minder vrije aromatische "
        "precursors, wat verklaart waarom wijnmaakkeuzes — hout, lees-contact, "
        "gisting — bij deze rassen relatief een groter aandeel van het "
        "uiteindelijke aromaprofiel bepalen dan bij aromatische druiven."
    ),
    25: (
        "Dezelfde druif, geplant op twee plekken met honderd kilometer afstand, "
        "kan een verschil in natuurlijk alcoholpotentieel van twee volle "
        "procentpunten opleveren puur door klimaat — wijnmaken kan dat verschil "
        "bijsturen, maar niet volledig wegpoetsen."
    ),
    26: (
        "De Huglin-index telt niet alleen temperatuur maar ook daglengte mee, "
        "wat verklaart waarom twee regio's met dezelfde gemiddelde temperatuur "
        "toch een ander klimaatprofiel voor druivenrijping kunnen hebben."
    ),
    27: (
        "In gematigde klimaten verklaart het verschil tussen een vroege en een "
        "late oogst in hetzelfde dorp vaak een groter smaakverschil dan het "
        "verschil tussen twee hele regio's — jaargang weegt hier zwaarder dan "
        "plek."
    ),
    28: (
        "Hoogteligging kan in warme streken hetzelfde effect hebben als een "
        "koeler klimaat: elke honderd meter hoogte daalt de gemiddelde "
        "temperatuur merkbaar, wat verklaart waarom sommige 'warme-land'-wijnen "
        "toch verrassend fris uitvallen."
    ),
    29: (
        "Wat proevers 'mineraliteit' noemen, blijkt in onderzoek vaker samen te "
        "hangen met reductieve aromacomponenten en hoog zuur dan met "
        "daadwerkelijke mineralen uit de bodem — de associatie is sensorisch, "
        "niet chemisch direct."
    ),
    30: (
        "Het Bourgondische climats-systeem kent aan percelen op slechts enkele "
        "tientallen meters van elkaar officieel verschillende kwaliteitsniveaus "
        "toe — een institutionele erkenning dat terroir tot op perceelniveau, "
        "niet alleen regio, verschil maakt."
    ),
    31: (
        "Een glas warmt in een verwarmde ruimte sneller op dan de meeste mensen "
        "denken — ongeveer 1 tot 2°C per tien minuten — wat verklaart waarom een "
        "perfect geschonken wijn binnen een half uur al buiten zijn ideale "
        "venster kan vallen."
    ),
    32: (
        "Detergent-residu in een glas is vaak onzichtbaar voor het oog maar "
        "verstoort wel de oppervlaktespanning waarop koolzuurbubbels zich "
        "vormen, wat verklaart waarom een op het oog schoon glas mousserende "
        "wijn toch plat kan laten lijken."
    ),
    33: (
        "Een zeer oude, fragiele wijn kan binnen enkele minuten na decanteren "
        "'instorten' — fruit verdwijnt en structuur valt uit elkaar — wat "
        "verklaart waarom oude flessen soms beter pas vlak vóór het schenken "
        "worden geopend dan ruim van tevoren."
    ),
    34: (
        "Een magnumfles rijpt trager dan een standaardfles van exact dezelfde "
        "wijn, puur door een lagere zuurstof-tot-wijn-ratio — wat verklaart "
        "waarom verzamelaars bij investeringsaankopen vaak bewust voor grotere "
        "flesformaten kiezen."
    ),
    35: (
        "Vet in kaas omhult tannine fysiek en verlaagt de waargenomen "
        "astringentie, wat verklaart waarom dezelfde tanninerijke rode wijn bij "
        "een vette, harde kaas wél werkt en bij een magere, jonge kaas juist "
        "hard en bitter aanvoelt."
    ),
    36: (
        "Het ijzer-tannine-effect dat een metalen nasmaak geeft bij rode wijn "
        "en vette vis, is een meetbare chemische reactie, geen vage afkeer — wat "
        "verklaart waarom de regel 'geen rood bij vis' standhoudt, behalve bij "
        "tanninearme uitzonderingen zoals Pinot Noir."
    ),
    37: (
        "Tannine 'verbruikt' zich eerst aan speekseleiwitten vóór het de "
        "eiwitten en vetten in vlees bindt, wat verklaart waarom een eerste slok "
        "wijn vóór de hap vlees vaak droger aanvoelt dan een slok ná de hap."
    ),
    38: (
        "Chablis en ongehoute Chardonnay delen bijna dezelfde aromafamilie, "
        "maar de Kimmeridgien-bodem en het koelere klimaat van Chablis geven "
        "structureel hogere zuren — wat verklaart waarom blind onderscheid "
        "maken via structuur betrouwbaarder is dan via aroma alleen."
    ),
    39: (
        "Nebbiolo en Pinot Noir zijn beide licht van kleur en hoog in zuur, "
        "maar Nebbiolo's tanninegehalte ligt vaak twee tot drie keer hoger — wat "
        "verklaart waarom kleur alleen bij dit verwarringspaar volledig "
        "misleidt."
    ),
    40: (
        "Examenfouten clusteren zelden rond losse feitjes, maar rond haast: te "
        "snel naar een druifconclusie springen vóór de structuuranalyse compleet "
        "is — wat verklaart waarom een vast protocol onder tijdsdruk meer scoort "
        "dan brede kennis alleen."
    ),
}

PRO_INSIGHT_OVERRIDES: dict[int, str] = {
    1: (
        "Gasten die wijn 'ingewikkeld' vinden, denken vaak dat er een verborgen "
        "recept achter zit — een klassieke verwachtingsmanagement-fout is dan "
        "een lijst druivenrassen opnoemen in plaats van het ene proces te "
        "benoemen. Leg uit dat de basis fermentatie is en dat complexiteit uit "
        "keuzes ontstaat, niet uit chemie; dat verlaagt drempelangst sneller dan "
        "jargon."
    ),
    2: (
        "Wanneer een gast vraagt waarom twee wijnen van dezelfde druif zo "
        "verschillend smaken, is de veelgemaakte fout om alleen naar de druif te "
        "wijzen. Verwijs naar de keten — oogsttiming en rijpingskeuze verklaren "
        "vaak meer dan het etiket laat zien, en dat verhaal werkt ook in "
        "verkoopcontext om een duurdere fles te rechtvaardigen."
    ),
    3: (
        "Een gast die zegt 'ik hou niet van wijn' heeft vaak maar één van de "
        "drie hoofdcategorieën geproefd. Vraag door op stille, mousserende of "
        "versterkte wijn vóór je een fles aanraadt — dat is verwachtingsmanagement "
        "in de kern en voorkomt dat je dezelfde afwijzing herhaalt."
    ),
    4: (
        "Verkoop 'oude wijngaarden' nooit als marketingtaal maar als historisch "
        "feit: leg uit dat Romeinse wijnbouw en kloostertraditie de basis legden "
        "voor wetgeving die vandaag nog regio's beschermt. Die framing werkt "
        "psychologisch sterker dan een prijsargument — een klassiek upsellmoment "
        "zonder dat het als verkooppraatje aanvoelt."
    ),
    5: (
        "Bouw een wijnkaart eerst op categorie, dan op druif of regio — in "
        "verkoopcontext kiezen gasten sneller wanneer ze eerst stijl herkennen in "
        "plaats van een lijst druivenrassen te moeten doorworstelen. Dat "
        "voorkomt ook de veelgemaakte fout dat een gast Cava afschrijft als "
        "'goedkoop alternatief' in plaats van een eigen stijlkeuze."
    ),
    6: (
        "Als een gast vraagt waarom rode wijn 'zwaarder' aanvoelt dan wit van "
        "dezelfde druif, wijs dan naar schilcontact en extractie, niet naar de "
        "druif alleen. Dat antwoord klopt vaker, klinkt overtuigender, en is "
        "precies het soort gastpsychologie-detail dat vertrouwen in je advies "
        "opbouwt."
    ),
    7: (
        "Proef je restsuiker in een wijn die niet als 'zoet' wordt verkocht, ga "
        "dan uit van een bewuste gistingsstop, geen fout. Leg dat zo aan gasten "
        "uit — het is verwachtingsmanagement die onterechte twijfel over "
        "kwaliteit voorkomt vóór die twijfel zich kan vastzetten."
    ),
    8: (
        "Vraag bij 'gerijpt op eik' op het etiket altijd door naar vatleeftijd, "
        "niet alleen houtsoort. Een veelgemaakte fout is aannemen dat alle "
        "gehoute wijn dezelfde intensiteit geeft — een oud vat geeft een heel "
        "ander resultaat dan een nieuw, ook al staat er identieke tekst op het "
        "etiket."
    ),
    9: (
        "Leer gasten dat 'oud ruikend' niet altijd 'oud' betekent: oxidatieve "
        "wijnmaking kan al bij een jonge wijn notige tonen geven. Dat voorkomt "
        "verwarring tussen productiestijl en daadwerkelijke leeftijd, en is "
        "precies het soort verwachtingsmanagement dat een retourfles voorkomt."
    ),
    10: (
        "Geef nooit bewaaradvies op basis van prijs of reputatie alleen — dat is "
        "een veelgemaakte fout. Check eerst structuurbalans: zuur, tannine en "
        "concentratie voorspellen bewaarpotentieel veel beter dan het etiket, en "
        "dat advies beschermt zowel de gast als jouw geloofwaardigheid bij een "
        "volgend aankoopgesprek."
    ),
    11: (
        "Noteer bij elk glas drie woorden per stap — kleur, neus, mond — "
        "vóórdat je een conclusie trekt. Dat voorkomt dat smaakvoorkeur de "
        "analyse overneemt, en die discipline is exact wat je team onderscheidt "
        "in een verkoopcontext waar gasten op je oordeel vertrouwen."
    ),
    12: (
        "Kantel het glas tegen een witte achtergrond en kijk eerst naar de rand, "
        "niet het midden — daar zit de eerste leeftijdsindicatie, nog vóór je "
        "ruikt. Een veelgemaakte fout is op kleurintensiteit alleen een "
        "prijsverwachting bouwen zonder de rand te checken."
    ),
    13: (
        "Ruik twee keer — eerst stil, dan na swirlen — en benoem alleen wat "
        "erbij komt. Dat verschil is meestal precies de secundaire of tertiaire "
        "laag, en die precisie is sterke verkoopcontext: het geeft je meer "
        "overtuigingskracht dan een lange opsomming van vage geurwoorden."
    ),
    14: (
        "Proef structuur apart van aroma: sluit je ogen, focus alleen op wat je "
        "mond voelt. Dat ontkoppelt twee zintuigen die je brein anders "
        "automatisch samenvoegt — een veelgemaakte fout bij beginnende proevers "
        "die aroma en mondgevoel als één indruk behandelen."
    ),
    15: (
        "Leg na elke blindronde je grootste denkfout vast in één zin — "
        "bijvoorbeeld 'te snel naar fruit, te weinig naar structuur'. Dat "
        "versnelt leren meer dan tien wijnen zonder reflectie, en diezelfde "
        "discipline voorkomt later de veelgemaakte fout van te snel concluderen "
        "aan tafel."
    ),
    16: (
        "Test zuur altijd bij dezelfde temperatuur als waarop je serveert — te "
        "koud overdrijft zuur, te warm verdoezelt het. Dat is een veelgemaakte "
        "fout bij interne proeverijen die een vertekend beeld geeft vóór de wijn "
        "ooit bij een gast op tafel staat."
    ),
    17: (
        "Laat een gast tannine bewust voelen door de wijn even op het tandvlees "
        "te houden vóór doorslikken — dat maakt het verschil tussen 'droog' en "
        "'bitter' meteen duidelijk. Die korte gastpsychologie-truc voorkomt dat "
        "een gast een technisch correcte wijn ten onrechte afwijst."
    ),
    18: (
        "Bij twijfel over het alcoholniveau: vraag of de afdronk warmte "
        "achterlaat in de keel. Dat is een betrouwbaardere test dan het "
        "percentage op het etiket, en het voorkomt de veelgemaakte fout om een "
        "'heet' aanvoelende wijn verkeerd te diagnosticeren als alcoholprobleem "
        "in plaats van zuurprobleem."
    ),
    19: (
        "Laat een gast twee wijnen vergelijken op 'mondgevoel' zonder aroma te "
        "benoemen — body wordt dan voelbaar los van smaakvoorkeur. Dat is een "
        "sterk upsellmoment: zodra een gast het gewichtsverschil zelf voelt, "
        "accepteert hij makkelijker een duurdere, vollere fles."
    ),
    20: (
        "Stel bij elke pairingvraag eerst de vraag 'wat is de zwakste schakel in "
        "deze wijn?' vóór je het gerecht kiest — dat voorkomt de meeste "
        "mismatches. Een veelgemaakte fout is een wijn op zijn sterkste element "
        "verkopen zonder de zwakste schakel te checken."
    ),
    21: (
        "Onthoud per druif één woord: Chardonnay = kameleon, Sauvignon Blanc = "
        "kruidig, Riesling = zuurspectrum, Pinot Grigio = neutraal. Die compacte "
        "verkoopcontext-taal is genoeg om een kaart snel te lezen en een "
        "aarzelende gast binnen tien seconden een richting te geven."
    ),
    22: (
        "Leer eerst tannine- en lichaamsniveau per druif kennen vóór je regio's "
        "erbij haalt — dat voorkomt verwarring tussen Pinot Noir uit Bourgogne en "
        "Cabernet uit Bordeaux. Die volgorde werkt ook vanuit gastpsychologie "
        "sterker: structuur communiceert sneller dan een geografische naam die "
        "de gast misschien niet kent."
    ),
    23: (
        "Bij twijfel over een onbekende witte wijn: ruik eerst aan het glas "
        "zonder swirlen. Sterke, directe aromatiek wijst meteen op een "
        "aromatisch ras — en dat snelle signaal is een mooi upsellmoment om een "
        "gast direct naar een passende, specerijrijke gerechtcombinatie te "
        "leiden."
    ),
    24: (
        "Gebruik neutrale druiven als 'blanco canvas' op je kaart: ze passen bij "
        "meer gerechten dan aromatische rassen, juist omdat ze niet domineren. "
        "Een veelgemaakte fout is neutrale wijnen als 'saai' wegzetten in plaats "
        "van als flexibele verkoopcontext-optie voor onzekere gasten."
    ),
    25: (
        "Train jezelf om bij elke nieuwe wijn deze volgorde te doorlopen: druif, "
        "klimaat, wijnmaken. Na honderd wijnen wordt dat een automatisme dat "
        "blind proeven versnelt en je tegelijk beschermt tegen de veelgemaakte "
        "fout om op druifnaam alleen een stijl te voorspellen."
    ),
    26: (
        "Vraagt een gast om 'iets fris' zonder regio te noemen? Vraag door naar "
        "het gewenste zuurniveau in plaats van een hele regiolijst op te noemen "
        "— dat is verwachtingsmanagement die sneller filtert en voorkomt dat een "
        "technisch koel-klimaat-fles toch te scherp aanvoelt voor die gast."
    ),
    27: (
        "Bij twijfel over een jaargang in een gematigd gebied: vraag eerst naar "
        "het oogstmoment, niet naar de regio. Het verschil tussen een vroege en "
        "een late oogst in hetzelfde dorp is vaak groter dan het verschil "
        "tussen twee gematigde regio's — een nuttig feit in elke verkoopcontext "
        "bij prijsverschillen tussen jaargangen."
    ),
    28: (
        "Een warme-klimaat-wijn met laag alcohol (onder 13%) is vaak "
        "interessanter dan het etiket suggereert: dat wijst meestal op vroege "
        "oogst, hoogteligging of bewuste stijlkeuze. Vraag daar gericht naar bij "
        "inkoop — het voorkomt de veelgemaakte fout om laag alcohol automatisch "
        "als 'minder serieus' te classificeren."
    ),
    29: (
        "Vermijd op de kaart de claim 'je proeft de bodem' — leg liever uit wat "
        "bodem doet: drainage, warmte, waterstress. Dat is technisch correcter en "
        "is goed verwachtingsmanagement, want het overtuigt zowel de kenner als "
        "de gast die voor het eerst over terroir hoort."
    ),
    30: (
        "Verkoop terroir niet als 'magie van de plek' maar als optelsom van "
        "meetbare factoren — expositie, hellingsgraad, bodemtype. Dat verhaal "
        "werkt in elke verkoopcontext beter dan vage romantiek, omdat het de "
        "prijs rechtvaardigt met logica in plaats van met sfeer alleen."
    ),
    31: (
        "Zet een thermometer in de kelder, niet alleen in de marketing. Eén "
        "graad verschil verklaart een groot deel van de 'te zuur' of 'te "
        "alcoholisch'-klachten aan tafel — een veelgemaakte fout is de oorzaak "
        "bij de wijn zoeken terwijl de fout in de serveertemperatuur zit."
    ),
    32: (
        "Schenk interne proeverijen altijd in een neutraal ISO- of "
        "witwijnglas; bewaar het varietal-specifieke glaswerk voor "
        "gastpresentatie. Zo vergelijk je wijnen zuiver én verkoop je toch het "
        "juiste glas aan tafel — een kleine gastpsychologie-investering die de "
        "beleving meteen verhoogt."
    ),
    33: (
        "Laat nieuwe staff eerst oefenen met een lege fles en een kaars onder de "
        "hals — die spiermemorie voorkomt dat kostbaar depot in het glas van de "
        "gast terechtkomt onder tijdsdruk. Dat is zowel een kwaliteitskwestie "
        "als verwachtingsmanagement: een troebel glas ondermijnt het vertrouwen "
        "in een dure fles direct."
    ),
    34: (
        "Label je voorraad fysiek met 'drink nu / 2–5 jaar / bewaar' — zonder "
        "die scheiding open je per ongeluk je beste investering veel te vroeg. "
        "Dat is een veelgemaakte fout in kelderbeheer die je met een simpel "
        "etiket volledig voorkomt, en het beschermt direct je marge."
    ),
    35: (
        "Bouw een kaasplank-wijnkaart op intensiteit en categorie, niet op "
        "land — één rij van fris-zuur naar zoet-versterkt dekt vrijwel elke "
        "kaas die je serveert. Dat is sterke verkoopcontext: de gast ziet zelf "
        "waar hij in de rij zit en durft makkelijker een extra glas te "
        "bestellen."
    ),
    36: (
        "Vraag bij twijfel altijd naar de saus vóór je naar de vissoort vraagt — "
        "de saus stuurt het pairingadvies in de praktijk vaker dan het "
        "hoofdingrediënt. Een veelgemaakte fout is alleen op 'vis' reageren met "
        "een standaard witte wijn zonder de saus te checken."
    ),
    37: (
        "Vraag bij vleespairing altijd naar de bereidingswijze vóór je het "
        "vleestype noemt — gegrild versus gestoofd verandert het advies vaak "
        "sterker dan rund versus lam. Die vraagvolgorde is goed "
        "verwachtingsmanagement en voorkomt dat je een tanninerijke wijn naast "
        "een zachte stoofschotel zet."
    ),
    38: (
        "Leg na elke blindronde je topfout vast in één zin ('te snel naar "
        "druif, te weinig naar zuurstructuur'). Dat versnelt leren meer dan tien "
        "perfecte proeven zonder reflectie, en dezelfde discipline beschermt je "
        "later tegen de veelgemaakte fout van te snel concluderen aan een "
        "gasttafel."
    ),
    39: (
        "Bij twijfel tussen twee verwante druiven: vertrouw eerst op "
        "tanninekorrel — fijn versus grof — en pas daarna op aroma. Structuur "
        "bedriegt minder snel dan een vluchtige geurindruk, en die volgorde is "
        "precies wat een geloofwaardig advies in een verkoopcontext "
        "onderscheidt van gokken."
    ),
    40: (
        "Lees examenvragen als servicecases: wat zou je vrijdagavond om 20:00 "
        "uur schenken bij deze gast en dit gerecht, en waarom precies dat "
        "mechanisme? Diezelfde denkstap is wat een gast aan tafel van je "
        "verwacht, en wie dat onder examendruk kan, kan het zeker tijdens een "
        "drukke service — de ultieme test van verwachtingsmanagement onder druk."
    ),
}

KERNBEGRIP_FIXES: dict[int, list[str]] = {
    14: ["mondgevoeltest", "speekselopwekking", "tandvleesgrip", "warmtesensatie", "gewichtsperceptie"],
    15: ["stijlhypothese", "proefprotocol", "referentiebibliotheek", "tegenargumentcheck", "calibratiefout"],
    20: ["zwakste schakel", "elementscore", "breekpuntanalyse", "pairingcorrectie", "servicecorrectie"],
    33: ["beluchting", "sedimentscheiding", "dubbel decanteren", "lichtbrontechniek", "instortrisico"],
    40: ["examenprotocol", "advieslogica", "mechanismeredenering", "servicecasus", "foutpatroonanalyse"],
}
