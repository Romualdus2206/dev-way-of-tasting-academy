"""Cocktail Track V2 — Gold Master data part 2 (lessons 22-41)."""
from __future__ import annotations


def _fp(beste: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


LEERDOELEN_P2: dict[int, str] = {
    22: "Na deze les kun jij een Margarita consistent balanceren op zuur, zoet, zout en textuur binnen strakke service-timing.",
    23: "Na deze les kun jij een Sidecar verfijnd afstellen op citrusdruk, cognacstructuur en dry finish voor verschillende gastenprofielen.",
    24: "Na deze les kun jij een White Lady technisch zuiver opbouwen met heldere aromatische spanning en gecontroleerde body.",
    25: "Na deze les kun jij een Pisco Sour stabiel produceren met correcte schuimstructuur, zurenbalans en veilige werkwijze.",
    26: "Na deze les kun jij een Mojito strak uitvoeren met gecontroleerde extractie van munt, suikermanagement en bruisbehoud.",
    27: "Na deze les kun jij een Tom Collins bouwen met juiste verdunning, koolzuurregie en lengte die serviceproof blijft.",
    28: "Na deze les kun jij een Moscow Mule afstemmen op pittigheid, zuurfrisheid en temperatuurbehoud in drukke service.",
    29: "Na deze les kun jij een Dark 'n' Stormy onderscheiden van varianten en correct uitserveren met focus op gemberstructuur.",
    30: "Na deze les kun jij een Paloma professioneel kalibreren op zoutheid, grapefruitbitter en carbonatie voor hoge doordrinkbaarheid.",
    31: "Na deze les kun jij glaswerk kiezen op basis van aroma-uitsturing, temperatuurverlies en operationele haalbaarheid.",
    32: "Na deze les kun jij ijs strategisch inzetten op smeltcurve, verdunning en textuurbeleving per cocktailfamilie.",
    33: "Na deze les kun jij garnishes functioneel ontwerpen zodat aroma, visuele cue en werkbaarheid tegelijk kloppen.",
    34: "Na deze les kun jij serveertechniek gebruiken om beleving, snelheid en productintegriteit consequent te verhogen.",
    35: "Na deze les kun jij aperitiefcocktails positioneren op eetluststimulatie, lage verzadiging en ritmische opbouw van de service.",
    36: "Na deze les kun jij foodpairing met cocktails technisch onderbouwen via intensiteit, brugsmaken, vet-/zuurspel en nasmaakarchitectuur.",
    37: "Na deze les kun jij digestiefcocktails ontwerpen die afronden zonder te verzwaren en die passen bij tafelmoment en energieniveau.",
    38: "Na deze les kun jij een Aperol Spritz consistent bouwen met correcte bitter-zoetbalans, bubbeldruk en serveertemperatuur.",
    39: "Na deze les kun jij spirit-blind analyses uitvoeren met reproduceerbare logica en duidelijke onzekerheidscommunicatie.",
    40: "Na deze les kun jij structuur-blind beoordelen op body, zuur, zoet, bitter en alcoholwarmte met service-relevante conclusies.",
    41: "Na deze les kun jij in het examen integraal presteren door techniek, smaaklogica, servicekeuzes en argumentatie overtuigend te combineren.",
}


THEORY_OVERRIDES_P2: dict[int, str] = {
    22: (
        "De Margarita lijkt eenvoudig, maar presteert pas op topniveau wanneer je vier assen tegelijk beheerst: "
        "zuurintensiteit, suikerdemping, zoutaccent en gecontroleerde verdunning. Kleine afwijkingen in limekwaliteit "
        "of shake-duur geven direct merkbare verschuivingen in balans.\n\n"
        "Professioneel werken betekent dus kalibreren per batch en per service-moment. Je stuurt niet op vast recept "
        "alleen, maar op sensorische referentiepunten: heldere aanzet, strak middenpalet en droge, schone finale."
    ),
    23: (
        "Een Sidecar draait om spanning tussen druif en citrus. Cognac levert breedte en warmte, terwijl sinaasappellikeur "
        "de overgang naar citroen afrondt. De kunst is om de finish droog te houden zonder de drank hoekig te maken.\n\n"
        "In premium service bepaal je eerst doelprofiel en pas daarna exacte ratio. Zo voorkom je zowel plakkerigheid als "
        "onderextractie van aroma. Sidecar-kwaliteit is vooral precisie in randen."
    ),
    24: (
        "De White Lady is technisch een textuurcocktail vermomd als frisse sour. Gin-botanicals dragen het aromatisch kader, "
        "terwijl triple sec en citroen de spanning opbouwen. Te veel citrus maakt de drank vlak; te veel likeur maakt hem zwaar.\n\n"
        "Topuitvoering vereist dus nauwe controle op verdunning en temperatuur. Een koude, scherp gefilterde serve zet de "
        "botanische lift centraal en houdt de afdronk elegant."
    ),
    25: (
        "Pisco Sour vraagt dubbele discipline: sensorische balans en procesveiligheid. Het eiwit geeft structuur en romigheid, "
        "maar alleen wanneer dry shake en wet shake consequent worden uitgevoerd. Ook zuurkwaliteit en bittersdosering zijn "
        "kritisch voor definitie in de finale.\n\n"
        "Professionele standaarden vereisen vers product, heldere hygiëne en reproduceerbare timing. Zo blijft de schuimkraag "
        "stabiel en de smaak kernachtig, ook in piekservice."
    ),
    26: (
        "Mojito-fouten ontstaan meestal door overextractie van munt en onderschatting van verdunning. Muddle je te hard, dan "
        "krijg je chlorofylbitter. Muddle je te zacht, dan mis je frisse topnoten en lijkt de drank vlak.\n\n"
        "Een sterke Mojito-aanpak gebruikt gecontroleerde druk, fijn crushed ice en snelle opbouw in lagen. Daarmee blijft "
        "de drank levendig tot de laatste slok."
    ),
    27: (
        "Tom Collins is een test op highball-beheersing. De cocktail moet lang, helder en verfrissend blijven zonder dat de "
        "gin verdwijnt. Dat vraagt juiste pre-chill, correcte ijskolom en late koolzuurintegratie.\n\n"
        "Professioneel stuur je vooral op behoud van structuur na uitgifte. De gast ervaart kwaliteit niet bij de eerste slok "
        "alleen, maar over het volledige drinkvenster."
    ),
    28: (
        "Moscow Mule staat of valt met gemberarchitectuur. Te scherpe ginger beer domineert, te zachte variant verliest ruggengraat. "
        "Lime werkt als focuslens en moet dus strak gedoseerd worden.\n\n"
        "Operationeel is temperatuurbehoud doorslaggevend. Werk met diepgekoelde componenten en minimale vertraging tussen build en "
        "uitgifte om de prikkel en lengte stabiel te houden."
    ),
    29: (
        "Dark 'n' Stormy is geen generieke rum-gembermix, maar een stijl met duidelijke functionele hiërarchie: donkere rum als "
        "dragende laag, ginger beer als motor en lime als precisie-instrument. Identiteit zit in contrast, niet in zoetkracht.\n\n"
        "Voor professionele service betekent dit heldere productkeuze en doseringsdiscipline. Zo blijft het profiel spannend, "
        "schoon en herkenbaar."
    ),
    30: (
        "Een goede Paloma heeft meer nodig dan tequila en grapefruit. Je bouwt bewust spanning tussen bitter, zout, zuur en zachte "
        "zoetrest. Vooral zoutgebruik moet ondersteunend blijven, niet dominant.\n\n"
        "In servicecontext werkt Paloma uitstekend door hoge doordrinkbaarheid en aanpasbaarheid. Correcte carbonatie en koeling "
        "maken het verschil tussen een verfrissende klassieker en een fletse longdrink."
    ),
    31: (
        "Glaswerk is geen decor, maar een technisch instrument. Vorm bepaalt aromatische concentratie, randdikte beïnvloedt mondgevoel "
        "en volume stuurt smeltsnelheid en perceived strength.\n\n"
        "Professioneel kiezen betekent dus afwegen tussen smaakdoel en operationele realiteit. Het beste glas is datgene dat kwaliteit "
        "verhoogt zonder serviceflow te breken."
    ),
    32: (
        "IJs beheerst de drie kernvariabelen van een cocktail in het glas: temperatuur, verdunning en textuur. Groot, hard ijs smelt "
        "langzamer; crushed ice koelt sneller maar verdunt agressiever. Vormkeuze is daarom stijlkeuze.\n\n"
        "Topbars behandelen ijs als ingrediënt met specificaties. Consistente opslag, handling en timing zorgen dat smaakarchitectuur "
        "ook onder druk intact blijft."
    ),
    33: (
        "Garnishes moeten functie hebben: aromatische lift, visuele richting of tactiele ondersteuning. Decoratie zonder bijdrage verhoogt "
        "complexiteit in mise-en-place maar levert weinig kwaliteitswinst.\n\n"
        "Professionele garnishing koppelt daarom doel, snelheid en houdbaarheid. Je kiest minder elementen, maar met hogere impact en "
        "betere reproduceerbaarheid."
    ),
    34: (
        "Serveertechniek vertaalt barvakmanschap naar gastbeleving. Glaspositionering, uitlegtempo en handbewegingen bepalen samen hoe "
        "kwaliteit wordt waargenomen nog voor de eerste slok.\n\n"
        "In premium context is consistente techniek een kwaliteitsvermenigvuldiger: minder fouten, hogere rust op de vloer en duidelijkere "
        "vertrouwenssignalen naar de gast."
    ),
    35: (
        "Aperitiefcocktails hebben een duidelijke taak: eetlust openen, mondgevoel activeren en de tafel in ritme brengen zonder vroegtijdige "
        "verzadiging. Daarom sturen professionals op frisheid, bitterspanning en gematigd alcoholvolume.\n\n"
        "De beste aperitiefservice bouwt een zachte intensiteitscurve richting het eerste gerecht. Keuzes worden onderbouwd vanuit functie "
        "aan tafel, niet vanuit novelty of volume."
    ),
    36: (
        "Foodpairing met cocktails werkt via structuurmatching en contrastregie. Vet vraagt zuur of bitterlift, zout vraagt aromatische "
        "diepte, en umami vraagt vaak droge of kruidige brugcomponenten om overlap te voorkomen.\n\n"
        "Sterke pairingbeslissingen blijven technisch: je vergelijkt intensiteit, textuur en nasmaaklengte in beide richtingen. Zo ontstaan "
        "combinaties die gerecht en cocktail tegelijk laten groeien."
    ),
    37: (
        "Digestiefcocktails ronden een ervaring af op comfort en helderheid. Ze mogen complex zijn, maar moeten het energiepeil van de gast "
        "respecteren. Te veel suiker, bitter of alcoholwarmte maakt de finale log.\n\n"
        "In theorie kun je spirit-forward referenties zoals Boulevardier-varianten of Espresso Martini noemen om stijlgrenzen uit te leggen, "
        "maar in praktijk blijft digestiefdesign gericht op balans, verteerbaarheid en tafelcontext."
    ),
    38: (
        "Aperol Spritz lijkt eenvoudig, maar balansfouten zijn direct zichtbaar: te warm, te zoet of te plat. Correcte verhouding, koude "
        "componenten en gecontroleerde carbonatie zijn de kern.\n\n"
        "Professioneel is de Spritz een benchmark voor discipline. Een perfect glas toont dat een team basisexecutie beheerst op hoog volume."
    ),
    39: (
        "Spirit-blind gaat over hypothesevorming onder onzekerheid. Je leest eerst structuur (alcoholwarmte, body, zoetrest), daarna aroma "
        "en pas dan categorie. Deze volgorde verlaagt gokbias.\n\n"
        "Topkandidaten communiceren waarschijnlijkheid in plaats van schijnzekerheid. Dat maakt de analyse bruikbaar voor service en examen."
    ),
    40: (
        "Structuren-blind verschuift focus van merkherkenning naar bouwstenen. Je beoordeelt zuur, zoet, bitter, body en verdunning als "
        "systeem en vertaalt dat naar stijlidentiteit en serveeradvies.\n\n"
        "Professionele waarde zit in toepasbaarheid: niet alleen benoemen wat je proeft, maar ook aangeven welke baractie logisch volgt."
    ),
    41: (
        "Het examen toetst integratie, niet losse kunstjes. Kandidaten moeten laten zien dat techniek, smaaklogica, tempo en communicatie "
        "elkaar versterken in realistische servicescenario's.\n\n"
        "Hoge scores komen van transparante redenering: aannames expliciet maken, keuzes motiveren, alternatieven benoemen en rustig bijsturen "
        "op nieuwe informatie."
    ),
}


FOOD_PAIRING_P2: dict[int, str] = {
    22: _fp(
        "Ceviche, gegrilde gamba of taco met limoen en koriander.",
        "Hoge citraatdruk en zoutaccent snijden door vet en versterken maritieme zoetheid; tequila-structuur sluit aan op geroosterde tonen.",
        "Zware roomsaus of sterk zoete componenten die de droge finale blokkeren.",
    ),
    23: _fp(
        "Eendenrillettes, paté en licht gekaramelliseerde ui-elementen.",
        "Cognacdiepte draagt hartige umami, citrusscherpte reinigt vetfilm en houdt de volgende hap open.",
        "Extreem pikante gerechten; die versterken alcoholprikkel en verstoren de finesse.",
    ),
    24: _fp(
        "Oesters, geitenkaascrème, witvis met citrusboter.",
        "Botanical lift en citroenspan geven verticale frisheid; subtiele sinaasappelnuance overbrugt zuivel en zeezout.",
        "Rokerige of zeer tanninerijke gerechten die de delicate aromalijn overstemmen.",
    ),
    25: _fp(
        "Peruviaanse ceviche, tempura van groenten, milde geitenkaas.",
        "Schuimtextuur en zuurfrisheid creëren lift; bitters op de top structureren nasmaak en houden de pairing droog.",
        "Zeer zoete desserts of zware chocolade die het zuurkader uit balans trekken.",
    ),
    26: _fp(
        "Frisse salades, lichte taco's, gegrilde courgette en groene kruiden.",
        "Muntaroma en limezuur geven verkoelende topnoot; bruis en ijsverdunning verlagen vetperceptie.",
        "Krachtige umami-sauzen of overmatige knoflook die muntaroma platdrukken.",
    ),
    27: _fp(
        "Fish and chips, gefrituurde snacks, kip met citroen-kruiden.",
        "Hoge carbonatie en citrusscherpte reinigen palet; gin-botanicals verlengen kruidige tonen van het gerecht.",
        "Te zoete side-dishes waardoor de Collins dun en zuur aanvoelt.",
    ),
    28: _fp(
        "Gember-kip, Aziatische slaw, pittige dumplings met frisse dip.",
        "Gemberwarmte en citrussnede sluiten aan op kruidigheid; koude service houdt capsaicineperceptie beheerst.",
        "Zeer subtiele gerechten met lage smaakintensiteit; die raken overstemd door ginger beer.",
    ),
    29: _fp(
        "BBQ ribs, jerk chicken, gerookte aubergine met limoen.",
        "Donkere rumtones verbinden met rook en karamellisatie; gemberzuur doorbreekt vet en zoetresten.",
        "Delicate rauwe visbereidingen die te weinig tegengewicht hebben.",
    ),
    30: _fp(
        "Carnitas taco, gegrilde maïs, ceviche met grapefruitsegmenten.",
        "Grapefruitbitter en zoutaccent verhogen speekselsecretie; tequila-structuur ondersteunt geroosterde tonen zonder overbelasting.",
        "Overmatige suikercomponenten die bitterbalans vlak maken.",
    ),
    31: _fp(
        "Kies pairing na glaskeuze: coupe voor aromatische finesse, rocks voor textuur en volume.",
        "Het glas stuurt volatiliteit en slokgrootte; dit beïnvloedt hoe zuur, zoet en alcohol zich naast food gedragen.",
        "Een random glas gebruiken waardoor temperatuur en aromadichtheid onvoorspelbaar worden.",
    ),
    32: _fp(
        "Vette of gefrituurde gerechten vragen vaak groot, hard ijs in de cocktail.",
        "Langzame smelt bewaart structuur terwijl voldoende koeling vetperceptie verlaagt; zo blijft pairing stabiel in tijd.",
        "Te nat of zacht ijs dat direct oververdunt en smaakbruggen breekt.",
    ),
    33: _fp(
        "Gebruik citruszest of kruidgarnish die direct verwijst naar dominante smaak in het gerecht.",
        "Aromatische priming voor de eerste slok verhoogt coherentie tussen neus en hap, vooral bij subtiele pairings.",
        "Garnishes met sterke parfumtonen die een fout signaal geven ten opzichte van het bord.",
    ),
    34: _fp(
        "Serveer in vaste volgorde: uitleg, geurcue, eerste slok, eerste hap.",
        "Gestuurde sequencing zorgt dat gast de juiste structuurcomponenten op het juiste moment ervaart.",
        "Cocktail en gerecht tegelijk zonder context droppen; dan verlies je een deel van de pairingwaarde.",
    ),
    35: _fp(
        "Olijven, ansjovis-toast, zilt-hartige amuses met lage vetdichtheid.",
        "Aperitiefbitter activeert eetlust; frisse zuuras en lichte body bereiden mond en tempo voor op volgende gang.",
        "Te zoete of zware pre-dinner pairings die vroegtijdige verzadiging veroorzaken.",
    ),
    36: _fp(
        "Werk met technische matrix: vet + zuur, zout + bitter, umami + kruiden-droogte, zoet + specerijcontrast.",
        "Deze matrix houdt pairings reproduceerbaar en voorkomt willekeur; je ontwerpt op structuur in plaats van op stijlnaam.",
        "Pairings kiezen op populariteit alleen; dat verhoogt mismatchrisico bij complexe gerechten.",
    ),
    37: _fp(
        "Pure chocolade 70%, notentaart met lage suiker, oude harde kaas in kleine portie.",
        "Digestiefcocktails met gecontroleerde zoetheid en aromatische diepte ronden af zonder de nasmaak te verstoppen.",
        "Koffie- en suikerdominante combinaties die de finale zwaar en eendimensionaal maken.",
    ),
    38: _fp(
        "Prosciutto, zoute chips, lichte fritto misto en citrusamuses.",
        "Bitter-zoet profiel en hoge bubbelactiviteit snijden door zout en vet; lage complexiteit houdt aperitiefritme hoog.",
        "Zeer kruidige of pikante bereidingen die de bitteras uit verhouding trekken.",
    ),
    39: _fp(
        "Gebruik spirit-blind uitkomsten om pairings te herijken op basis van gemeten structuur.",
        "Objectieve detectie van body en warmte voorkomt dat je foodpairing bouwt op foutieve merkassumpties.",
        "Blindresultaten negeren wanneer ze je oorspronkelijke plan tegenspreken.",
    ),
    40: _fp(
        "Koppel structuuranalyse direct aan gerechtarchitectuur: hoge zuurstructuur bij vet, hoge bitterstructuur bij zoet-vet, hoge body bij eiwitrijke gerechten.",
        "Zo vertaal je proefdata naar concrete servicebesluiten met lagere foutmarge.",
        "Alleen aroma gebruiken als basis voor pairing zonder structurele check.",
    ),
    41: _fp(
        "In examencasus: motiveer pairingkeuze met meetbare structuurargumenten en een fallback-optie.",
        "Beoordelaars waarderen reproduceerbare redenering: primaire match, risico-inschatting en correctiemechanisme.",
        "Vage smaaktaal zonder technische koppeling aan gerecht of servicecontext.",
    ),
}


PRO_INSIGHTS_P2: dict[int, str] = {
    22: "Een premium Margarita verkoop je via controle: wie zout, zuur en verdunning actief benoemt, straalt direct autoriteit uit.",
    23: "Bij Sidecar zit het onderscheid in finishdiscipline; topservice laat de drank elegant uitdrogen zonder hard te worden.",
    24: "White Lady presteert commercieel beter wanneer je hem positioneert als botanische precision sour in plaats van een simpele klassieker.",
    25: "Pisco Sour toont vakmanschap omdat techniek zichtbaar wordt in schuimstabiliteit en textuur over tijd, niet alleen in smaak.",
    26: "Mojito-kwaliteit is in de praktijk een test op handcontrole: minder kracht, meer precisie levert meer smaak op.",
    27: "Tom Collins is je servicebenchmark: als deze op piekmomenten scherp blijft, klopt je highball-systeem.",
    28: "Moscow Mule wint aan waarde wanneer je ginger intensity als stuurknop gebruikt per gastprofiel en temperatuurcontext.",
    29: "Dark 'n' Stormy wordt premium zodra je herkomst en balans uitlegt; dan verschuift de perceptie van 'easy' naar 'doordacht'.",
    30: "Een sterke Paloma-line verhoogt doorloopsnelheid zonder kwaliteitsverlies, ideaal voor terrasmomenten met hoge druk.",
    31: "Teams met glaswerkdiscipline maken minder receptfouten omdat het juiste glas automatisch de juiste build afdwingt.",
    32: "IJsmanagement is winst op drie fronten: smaakconsistentie, kostcontrole en hogere gasttevredenheid.",
    33: "Functionele garnish-keuzes besparen prep-tijd en verhogen toch de waargenomen luxe, mits elk element een duidelijke rol heeft.",
    34: "Serveertechniek is stille omzetmotor: rust en precisie verhogen vertrouwen, waardoor gasten makkelijker premium keuzes volgen.",
    35: "Aperitiefadvies op functie in plaats van trend levert een sterkere start van de besteding en een stabielere avondcurve.",
    36: "Foodpairing wordt schaalbaar zodra je team dezelfde technische taal gebruikt voor intensiteit, brug en nasmaak.",
    37: "Bij digestieven scoort subtiliteit hoger dan spektakel; gasten onthouden hoe ze zich voelen na de laatste slok.",
    38: "Aperol Spritz op hoog niveau is procesdiscipline in vloeibare vorm: simpel recept, nul ruimte voor slordigheid.",
    39: "Spirit-blind vaardigheid versnelt servicebesluiten omdat je minder afhankelijk wordt van etiketdenken.",
    40: "Structuren-blind is de brug tussen training en vloer: je ziet sneller welke cocktail in welke context echt werkt.",
    41: "Examenmeesterschap toont zich in kalmte en redenering; overtuiging groeit wanneer je keuze én alternatief beheerst.",
}


REFLECTIEVRAGEN_P2: dict[int, str] = {
    22: "Welke variabele veroorzaakt bij jouw Margarita's de meeste spreiding, en welke meetstap maakt dat proces aantoonbaar stabieler?",
    23: "Hoe bepaal jij bij Sidecar of een drogere finish elegant is of juist te streng voor de context van de gast?",
    24: "Welke technische keuze in jouw White Lady beïnvloedt het middenpalet het sterkst, en waarom precies die keuze?",
    25: "Waar zit in jouw Pisco Sour-procedure het grootste risico op inconsistentie: eiwit, shake-ritme of bittersdosering?",
    26: "Hoe borg jij dat muntextractie in Mojito's op piekmomenten nog steeds subtiel en niet bitter blijft?",
    27: "Welk onderdeel van jouw Collins-opbouw verliest als eerste kwaliteit tijdens drukte, en hoe corrigeer je dat structureel?",
    28: "Wanneer besluit jij bij een Moscow Mule om gemberintensiteit te verlagen ondanks een gastvraag om 'meer pit'?",
    29: "Wat maakt volgens jou het verschil tussen een correcte en een echt overtuigende Dark 'n' Stormy in service?",
    30: "Welke parameter in Paloma's (zout, bitter, bruis, zuur) onderschat jij meestal, en wat is het gevolg in pairing?",
    31: "Welke glaswerkkeuze maak jij nu op gewoonte in plaats van op technisch effect, en wat zou een beter alternatief zijn?",
    32: "Hoe meet jij of je ijskeuze daadwerkelijk bijdraagt aan kwaliteit over tijd in plaats van alleen aan eerste indruk?",
    33: "Welke garnish gebruik jij vooral visueel, en hoe kun je die omvormen tot een functioneel aroma-instrument?",
    34: "Welke stap in jouw serveerroutine verhoogt aantoonbaar vertrouwen bij gasten, en welke stap veroorzaakt ruis?",
    35: "Hoe definieer jij een aperitief dat eetlust opent zonder de smaakboog van het menu te verstoren?",
    36: "Welke foodpairing-fout in jouw praktijk komt voort uit onvoldoende structuuranalyse, en hoe voorkom je die voortaan?",
    37: "Hoe bewaak jij digestiefbalans zodat de afsluiting memorabel blijft zonder suikerdominantie of vermoeidheid?",
    38: "Welke kleine processtap maakt in jouw Aperol Spritz het grootste verschil tussen 'ok' en 'strak'?",
    39: "Waar in jouw spirit-blind redenering sluipt de meeste merkbias binnen, en hoe neutraliseer je die?",
    40: "Hoe vertaal jij structuren-blind observaties naar concrete serviceacties die een team direct kan uitvoeren?",
    41: "Welke examenvaardigheid wil jij bewust demonstreren om te tonen dat je onder druk nog steeds systematisch beslist?",
}


SUMMARIES_P2: dict[int, list[str]] = {
    22: [
        "Margarita draait om zuuras, zoutaccent en gecontroleerde verdunning.",
        "Limekwaliteit en shake-duur bepalen de precisie van het resultaat.",
        "Consistentie vraagt kalibratie per service-moment.",
        "Topuitvoering is strak, droog en helder.",
    ],
    23: [
        "Sidecar balanceert cognacwarmte met citrusscherpte.",
        "Een droge finish verhoogt elegantie en doordrinkbaarheid.",
        "Ratio volgt doelprofiel, niet routine.",
        "Finesse zit in overgang tussen middenpalet en finale.",
    ],
    24: [
        "White Lady vraagt botanische helderheid met subtiele body.",
        "Verdunning en temperatuur sturen textuurkwaliteit.",
        "Citrus en likeur moeten in spanning blijven.",
        "Precisie voorkomt zowel vlakheid als zwaarte.",
    ],
    25: [
        "Pisco Sour vereist techniek, hygiëne en procescontrole.",
        "Schuimstructuur is een kwaliteitsindicator over tijd.",
        "Bitters doseren betekent focus, geen decoratie.",
        "Reproduceerbare timing maakt piekservice veilig.",
    ],
    26: [
        "Mojito staat of valt met muntextractiecontrole.",
        "Crushed ice en layering bepalen frisheidsbeleving.",
        "Overmuddling geeft bitter en ruwe textuur.",
        "Strakke uitvoering houdt de cocktail levendig.",
    ],
    27: [
        "Tom Collins test highball-discipline in praktijk.",
        "Carbonatie en verdunning moeten lang stabiel blijven.",
        "Pre-chill is cruciaal voor lengte in het glas.",
        "Kwaliteit meet je over het hele drinkvenster.",
    ],
    28: [
        "Moscow Mule vraagt beheersing van gemberintensiteit.",
        "Lime moet focussen, niet domineren.",
        "Diepgekoelde componenten beschermen structuur.",
        "Temperatuurmanagement is deel van het recept.",
    ],
    29: [
        "Dark 'n' Stormy heeft een duidelijke stijlidentiteit.",
        "Rumdiepte en gemberprikkel moeten in contrast blijven.",
        "Lime werkt als precisiehefboom in de finale.",
        "Productkeuze bepaalt geloofwaardigheid van de serve.",
    ],
    30: [
        "Paloma vraagt bitter-zout-zuurbalans met hoge frisheid.",
        "Zout ondersteunt structuur maar mag niet overheersen.",
        "Carbonatie bepaalt een groot deel van de drinkervaring.",
        "Doordrinkbaarheid is de centrale prestatiefactor.",
    ],
    31: [
        "Glaswerk stuurt aroma, mondgevoel en smelttempo.",
        "Juiste vorm verhoogt technische consistentie.",
        "Keuze moet smaakdoel en operatie verbinden.",
        "Decoratief denken leidt vaak tot kwaliteitsverlies.",
    ],
    32: [
        "IJs is een volwaardig ingrediënt met specificaties.",
        "Vorm en dichtheid bepalen smeltcurve en textuur.",
        "Consistente opslag voorkomt service-ruis.",
        "IJsdiscipline verhoogt kwaliteit en voorspelbaarheid.",
    ],
    33: [
        "Garnishes moeten functioneel bijdragen aan aroma of structuur.",
        "Minder elementen met hogere impact werkt beter.",
        "Houdbaarheid en snelheid horen bij ontwerp.",
        "Visuele luxe zonder functie is operationele ruis.",
    ],
    34: [
        "Serveertechniek beïnvloedt kwaliteit vóór de eerste slok.",
        "Sequencing van uitleg en proefmoment verhoogt beleving.",
        "Consistente handelingen verlagen foutkans in teamservice.",
        "Rustige uitvoering bouwt gastvertrouwen.",
    ],
    35: [
        "Aperitiefcocktails moeten eetlust openen, niet vullen.",
        "Frisheid, bitterspanning en matige ABV zijn leidend.",
        "Intensiteitscurve moet richting gerecht werken.",
        "Functie aan tafel gaat boven trenddenken.",
    ],
    36: [
        "Foodpairing vraagt structurele analyse in twee richtingen.",
        "Vet, zuur, zout, bitter en umami sturen de keuze.",
        "Technische matrix maakt pairings reproduceerbaar.",
        "Doel is versterking van zowel gerecht als cocktail.",
    ],
    37: [
        "Digestiefcocktails ronden af met comfort en helderheid.",
        "Balans weegt zwaarder dan pure intensiteit.",
        "Zoet- en bitterdruk moeten gecontroleerd blijven.",
        "Finale kwaliteit is voelbaar in energieniveau na service.",
    ],
    38: [
        "Aperol Spritz vraagt strakke verhouding en koude componenten.",
        "Bubbeldruk moet behouden blijven tot uitgifte.",
        "Te warm of te zoet breekt direct de stijl.",
        "Simpel recept vraagt maximale discipline.",
    ],
    39: [
        "Spirit-blind begint met structuur, niet met naam.",
        "Hypotheses zijn sterker dan snelle claims.",
        "Waarschijnlijkheid communiceren verhoogt professionaliteit.",
        "Biasreductie maakt analyses service-relevant.",
    ],
    40: [
        "Structuren-blind ontleedt een cocktail in bouwstenen.",
        "Body, zuur, zoet en bitter vormen het besliskader.",
        "Analyse moet leiden tot concrete baractie.",
        "Toepasbaarheid is belangrijker dan theoretische perfectie.",
    ],
    41: [
        "Examen toetst integratie van techniek en redenering.",
        "Transparante keuzes scoren beter dan losse feiten.",
        "Alternatieven en risico's benoemen toont niveau.",
        "Kalm bijsturen onder druk is kerncompetentie.",
    ],
}


GOLD_KEY_CONCEPTS_P2: dict[int, list[str]] = {
    22: ["zuurkalibratie", "zoutaccent", "verdunningscontrole", "shake-discipline", "droge-finale"],
    23: ["cognacstructuur", "citrusspanning", "finishbeheer", "ratio-afstelling", "sour-elegantie"],
    24: ["botanische-lift", "textuurcontrole", "temperatuurregie", "citrusprecisie", "finessebalans"],
    25: ["schuimstabiliteit", "dry-shake", "proceshygiëne", "bittersdosering", "sour-veiligheid"],
    26: ["muntextractie", "crushed-ice", "laagopbouw", "verdunningsritme", "frisheidsbehoud"],
    27: ["highball-architectuur", "carbonatiebehoud", "ijskolom", "pre-chill", "lengte-in-glas"],
    28: ["gemberintensiteit", "temperatuurdiscipline", "limefocus", "prikkelbalans", "uitgiftesnelheid"],
    29: ["stijlidentiteit", "rumdiepte", "ginger-contrast", "lime-precisie", "build-discipline"],
    30: ["grapefruitbitter", "zoutkalibratie", "bruisdruk", "doordrinkbaarheid", "paloma-structuur"],
    31: ["glasfysica", "aroma-uitsturing", "randdikte", "smeltmanagement", "operationele-fit"],
    32: ["smeltcurve", "ijsdichtheid", "temperatuuras", "textuursturing", "ice-handling"],
    33: ["functionele-garnish", "aromatische-priming", "visuele-cue", "prep-efficiency", "houdbaarheid"],
    34: ["service-sequencing", "taalregie", "handtechniek", "belevingsopbouw", "vloerconsistentie"],
    35: ["aperitief-functie", "eetluststimulatie", "lage-verzadiging", "abv-regie", "service-opbouw"],
    36: ["pairingmatrix", "intensiteitsmatch", "brugsmaken", "nasmaakarchitectuur", "structuurvergelijking"],
    37: ["digestiefbalans", "afsluitingsritme", "zoetbeheer", "alcoholwarmte", "verteerbaarheid"],
    38: ["spritz-ratio", "bitter-zoet-as", "bubbelbehoud", "koudeketen", "hoogvolume-precisie"],
    39: ["spirit-blind", "hypothesevorming", "biasreductie", "waarschijnlijkheidstaal", "analyselogica"],
    40: ["structuren-blind", "bodymapping", "zuuras", "bitterindex", "servicevertaling"],
    41: ["examensynthese", "beslisargumentatie", "risicokaders", "adaptief-bijsturen", "professionele-verdediging"],
}


QUIZ_PATCHES_P2: dict[int, str] = {
    22: """### Vraag 4

Scenario: tijdens piekservice smaakt je Margarita plots vlak en kort.
Welke correctie is het meest logisch als eerste stap?

A. Meer zout op de rand zonder proeven
B. Limezuur en verdunning opnieuw kalibreren op referentiesmaak ✅
C. Triple sec verdubbelen
D. Minder ijs gebruiken zodat de cocktail warmer blijft

### Vraag 5

Scenario: gast wil "frisser en droger" dan je huis-Margarita.
Wat is de beste aanpassing?

A. Suikercomponent licht verlagen en zuuras strak houden ✅
B. Extra siroop toevoegen
C. Geen citrus meer gebruiken
D. Alleen glas wisselen

""",
    23: """### Vraag 4

Scenario: je Sidecar eindigt plakkerig in plaats van strak.
Wat pak je eerst aan?

A. Cognac verhogen
B. Sinaasappellikeur verlagen en citrussnede herijken ✅
C. Extra suikerrand toevoegen
D. Meer ijs in het serveerglas

### Vraag 5

Scenario: gast ervaart je Sidecar als te scherp.
Welke reactie is professioneel?

A. Citroen weglaten
B. Subtiel meer ronding via likeur of rijpere cognac, zonder zoet te maken ✅
C. Dubbele portie serveren
D. Cocktail vervangen door shot

""",
    24: """### Vraag 4

Scenario: White Lady mist aromatische lift in de neus.
Waar zit waarschijnlijk de eerste winst?

A. Hogere serveertemperatuur
B. Strakkere koeling en betere verdunningscontrole ✅
C. Minder kwaliteit gin
D. Geen citrus gebruiken

### Vraag 5

Scenario: de cocktail komt vol en zwaar over.
Welke bijsturing past?

A. Meer likeur toevoegen
B. Citrus-likoorbalans herijken richting lichter middenpalet ✅
C. Langzamer serveren zonder aanpassing
D. Alleen garnish veranderen

""",
    25: """### Vraag 4

Scenario: Pisco Sour zakt snel in en verliest textuur.
Wat controleer je eerst?

A. Serveerglas kleur
B. Shake-protocol en eiwitkwaliteit ✅
C. Muziekvolume in de bar
D. Aantal bitters op het eind

### Vraag 5

Scenario: gast vraagt om "zelfde cocktail, maar iets droger".
Wat doe je?

A. Zuuras scherp houden en suikerdeel minimaal reduceren ✅
B. Alle citrus verwijderen
C. Meer siroop toevoegen
D. Cocktail zonder schuim serveren

""",
    26: """### Vraag 4

Scenario: Mojito smaakt bittergroen in de afdronk.
Wat is de meest waarschijnlijke oorzaak?

A. Te weinig soda
B. Overmatige muntextractie door te hard muddlen ✅
C. Te veel ijsblokken
D. Te koud glaswerk

### Vraag 5

Scenario: de Mojito wordt na twee minuten waterig.
Welke aanpassing helpt het meest?

A. Zachter ijs gebruiken
B. Vers, droger crushed ice en snellere uitgifte ✅
C. Extra suikersiroop
D. Geen limoen meer toevoegen

""",
    27: """### Vraag 4

Scenario: Tom Collins verliest snel bruis en spanning.
Wat corrigeer je eerst?

A. Meer suiker toevoegen
B. Carbonatie later toevoegen en componenten kouder houden ✅
C. Minder ijs gebruiken
D. Gin vervangen door wodka

### Vraag 5

Scenario: gast wil meer diepte zonder verlies van frisheid.
Welke stap past?

A. Juiste gin kiezen met meer botanische lengte, ratio gelijk houden ✅
B. Dubbele citroendosering
C. Soda volledig schrappen
D. Cocktail serveren op kamertemperatuur

""",
    28: """### Vraag 4

Scenario: Moscow Mule is te agressief pittig voor de tafel.
Wat is de beste technische oplossing?

A. Meer alcohol toevoegen
B. Ginger beer-intensiteit verlagen en zuurbalans herijken ✅
C. Limoen volledig weglaten
D. Alleen extra ijs toevoegen zonder herproef

### Vraag 5

Scenario: je Mule smaakt vlak ondanks correcte ratio.
Wat kan de hoofdreden zijn?

A. Te warme componenten bij build ✅
B. Te veel koper in de mok
C. Te weinig garnishkleur
D. Te veel uitleg aan tafel

""",
    29: """### Vraag 4

Scenario: Dark 'n' Stormy wordt door gasten ervaren als "te zoet".
Wat stuur je eerst?

A. Rum verhogen naar dubbele hoeveelheid
B. Ginger beer-profiel en limeprecisie herkalibreren ✅
C. IJs weglaten
D. Meer siroop toevoegen

### Vraag 5

Scenario: team serveert verschillende varianten onder dezelfde naam.
Wat is de professionele fix?

A. Vrij laten voor creativiteit
B. Stijlidentiteit vastleggen met vaste productspecificatie ✅
C. Alleen op drukke avonden aanpassen
D. Geen briefing geven

""",
    30: """### Vraag 4

Scenario: Paloma mist spanning en komt flets over.
Welke parameter check je als eerste?

A. Zout- en bitterbalans in relatie tot zuur ✅
B. Kleur van de garnish
C. Vorm van de barlepel
D. Grootte van de rekening

### Vraag 5

Scenario: gast wil Paloma met hogere doordrinkbaarheid.
Wat werkt het best?

A. Zoetcomponent fors verhogen
B. Strakke carbonatie en lichte zoutkalibratie behouden ✅
C. Grapefruit schrappen
D. Serveren zonder ijs

""",
    31: """### Vraag 4

Scenario: dezelfde cocktail smaakt anders bij twee stations.
Wat is een logische oorzaak?

A. Verschil in glasvorm en randdikte ✅
B. Te veel barlicht
C. Verschillende muziek
D. Ander logo op glas

### Vraag 5

Scenario: je wilt aromatische precisie verhogen bij een korte sour.
Welke glaskeuze is meestal sterker?

A. Breed longdrinkglas
B. Compact coupe-/Nick&Nora-profiel ✅
C. Pintglas
D. Plastic beker

""",
    32: """### Vraag 4

Scenario: cocktail verliest structuur te snel op warme avond.
Welke ijscorrectie past?

A. Van hard blokijs naar nat crushed ice
B. Groter, harder ijs inzetten met strakke pre-chill ✅
C. Minder ijs in het glas
D. IJs vooraf spoelen in warm water

### Vraag 5

Scenario: team gebruikt inconsistent ijs uit verschillende bins.
Wat is het grootste risico?

A. Alleen esthetische variatie
B. Onvoorspelbare verdunning en temperatuurspreiding ✅
C. Lagere fooi
D. Snellere service

""",
    33: """### Vraag 4

Scenario: garnish ziet er mooi uit maar versterkt de cocktail niet.
Wat ontbreekt?

A. Extra kleur
B. Functioneel aroma-doel gekoppeld aan recept ✅
C. Groter glas
D. Meer ijs

### Vraag 5

Scenario: prep-tijd loopt op door complexe garnishset.
Welke keuze is professioneel?

A. Nog meer decor toevoegen
B. Reduceren naar impactvolle, reproduceerbare garnish ✅
C. Garnish schrappen zonder alternatief
D. Alleen in weekend toepassen

""",
    34: """### Vraag 4

Scenario: gasten begrijpen je pairing niet ondanks goede smaken.
Waar zit waarschijnlijk de fout?

A. Te koude glazen
B. Onvoldoende serveersequencing en contextuitleg ✅
C. Te veel ijsvoorraad
D. Te weinig barlicht

### Vraag 5

Scenario: team levert technisch goede cocktails maar wisselende beleving.
Wat helpt het meest?

A. Individuele stijl zonder richtlijn
B. Gestandaardiseerde serveertechniek met duidelijke stappen ✅
C. Hogere muziek
D. Snellere rekeningpresentatie

""",
    35: """### Vraag 4

Scenario: aperitiefronde maakt gasten snel verzadigd.
Welke ontwerpfout ligt voor de hand?

A. Te lage alcohol
B. Te zware, zoete of volumineuze aperitiefkeuze ✅
C. Te veel glaswerk
D. Te korte uitleg

### Vraag 5

Scenario: je wilt aperitiefservice functioneler maken.
Wat prioriteer je?

A. Trenddrank van het moment
B. Eetluststimulatie en ritmische opbouw richting diner ✅
C. Maximale portiegrootte
D. Zoetheid als hoofdstrategie

""",
    36: """### Vraag 4

Scenario: cocktailpairing botst met vet hoofdgerecht.
Welke technische route is meestal juist?

A. Meer zoet toevoegen
B. Zuur- of bitterlift inzetten om vetfilm te snijden ✅
C. Alcohol verhogen zonder heranalyse
D. Pairing stoppen

### Vraag 5

Scenario: team discussieert over "beste pairing" zonder consistent resultaat.
Wat ontbreekt?

A. Een technische structuurmatrix voor beslissingen ✅
B. Meer Instagram-referenties
C. Groter budget
D. Langere dranknamen

""",
    37: """### Vraag 4

Scenario: digestiefcocktail voelt zwaar na een rijk menu.
Welke correctie is het meest logisch?

A. Zoet en alcoholwarmte reduceren, finale droger maken ✅
B. Meer room toevoegen
C. Dubbele portie serveren
D. Bitter volledig schrappen

### Vraag 5

Scenario: gast vraagt om "iets krachtigs" na dessert.
Wat is professioneel digestiefadvies?

A. Alleen maximale intensiteit aanbieden
B. Kracht combineren met verteerbaarheid en tafelmoment ✅
C. Willekeurig sterkste cocktail kiezen
D. Geen vragen stellen

""",
    38: """### Vraag 4

Scenario: Aperol Spritz smaakt vlak en zoet op terras.
Welke factor check je eerst?

A. Componenttemperatuur en bubbeldruk ✅
B. Grootte van het rietje
C. Kleur van de sinaasappel
D. Tempo van de playlist

### Vraag 5

Scenario: drukke service, kwaliteit van Spritz zakt.
Wat is de beste systeemoplossing?

A. Vrije ratio per bartender
B. Vaste build-volgorde en koudeketen borgen ✅
C. Minder prosecco gebruiken zonder meten
D. Spritz alleen nog op aanvraag

""",
    39: """### Vraag 4

Scenario: kandidaat noemt direct een merk bij blindproef.
Wat is het grootste risico?

A. Te veel detail
B. Merkbias vóór structuuranalyse ✅
C. Te weinig glaswerk
D. Te lage temperatuur

### Vraag 5

Scenario: je bent 70% zeker over categorie, 40% over substijl.
Hoe communiceer je dit professioneel?

A. Absoluut antwoord geven zonder nuance
B. Waarschijnlijkheid expliciet maken per niveau ✅
C. Geen conclusie delen
D. Alleen vragen terugstellen

""",
    40: """### Vraag 4

Scenario: structuren-blind toont hoge body en hoge zoetrest.
Welke pairingrichting is logisch?

A. Delicate rauwe oester
B. Rijk of hartig gerecht met voldoende tegengewicht ✅
C. Alleen bruiswater
D. Bittere salade zonder vet

### Vraag 5

Scenario: je herkent veel aroma maar mist structurele conclusie.
Wat moet eerst?

A. Nog meer aroma-woorden zoeken
B. Matrix invullen voor zuur/zoet/bitter/body/alkoholwarmte ✅
C. Merk raden
D. Garnish kiezen

""",
    41: """### Vraag 4

Scenario: in examen krijg je onverwachte gastcontext die je plan ondermijnt.
Wat is de beste reactie?

A. Plan blind uitvoeren
B. Redenering bijstellen en keuze opnieuw motiveren ✅
C. Casus afwijzen
D. Alleen op intuïtie schakelen zonder uitleg

### Vraag 5

Scenario: beoordelaar vraagt waarom je alternatief B niet koos.
Wat antwoord je op topniveau?

A. "Voelde niet goed."
B. Technische vergelijking met risico's en service-impact uitleggen ✅
C. Onderwerp veranderen
D. Verwijzen naar persoonlijke voorkeur

""",
}


QUIZ_FULL_P2: dict[int, str] = {
    41: (
        "### Vraag 1\n\n"
        "Wat onderscheidt een cocktail van een simpele mixdrank?\n\n"
        "A. Alleen het glas\n"
        "B. Bewuste balans tussen componenten ✅\n"
        "C. Hoger alcoholpercentage\n"
        "D. Meer ingrediënten\n\n"
        "### Vraag 2\n\n"
        "Welke structuur hoort bij een Daiquiri?\n\n"
        "A. Spirit-forward stirred\n"
        "B. Sour: spirit, citrus, zoet ✅\n"
        "C. Highball build\n"
        "D. Layered digestief\n\n"
        "### Vraag 3\n\n"
        "Aperitief versus digestief: wat klopt?\n\n"
        "A. Aperitief activeert; digestief sluit af ✅\n"
        "B. Beide zijn zoet en zwaar\n"
        "C. Digestief altijd zonder alcohol\n"
        "D. Aperitief alleen met eiwit\n\n"
        "### Vraag 4\n\n"
        "Scenario: examencontext verandert plots. Beste reactie?\n\n"
        "A. Plan blind uitvoeren\n"
        "B. Keuze bijstellen en onderbouwen ✅\n"
        "C. Casus weigeren\n"
        "D. Alleen intuïtie\n\n"
        "### Vraag 5\n\n"
        "Waarom is verdunning een variabele?\n\n"
        "A. Onvermijdelijk bijval\n"
        "B. Stuurt balans en textuur bewust ✅\n"
        "C. Alleen voor beginners\n"
        "D. Niet meetbaar\n\n"
        "### Vraag 6\n\n"
        "Negroni: juiste techniek?\n\n"
        "A. Shaken hard\n"
        "B. Stirred op ijs ✅\n"
        "C. Muddling\n"
        "D. Blenden\n\n"
        "### Vraag 7\n\n"
        "Welke base spirit past bij rokerige aroma's in blind?\n\n"
        "A. Vodka\n"
        "B. Mezcal of gerookte whisky ✅\n"
        "C. Gin zonder botanicals\n"
        "D. Witte rum alleen\n\n"
        "### Vraag 8\n\n"
        "Margarita: kritische balansas?\n\n"
        "A. Zout-zuur-zoet integratie ✅\n"
        "B. Alleen alcohol\n"
        "C. Alleen garnish\n"
        "D. Alleen ijsvorm\n\n"
        "### Vraag 9\n\n"
        "Highball succesfactor?\n\n"
        "A. Koolzuurbehoud en build-volgorde ✅\n"
        "B. Dubbele shake\n"
        "C. Warm serveren\n"
        "D. Geen ijs\n\n"
        "### Vraag 10\n\n"
        "Old Fashioned: typische fout?\n\n"
        "A. Oververdunning ✅\n"
        "B. Te weinig spirit\n"
        "C. Te veel citrus\n"
        "D. Te veel soda\n\n"
        "### Vraag 11\n\n"
        "Martini: droogte sturen via?\n\n"
        "A. Vermoutverhouding en roertijd ✅\n"
        "B. Extra suiker\n"
        "C. Muddling\n"
        "D. Crushed ice\n\n"
        "### Vraag 12\n\n"
        "Food pairing: Negroni bij charcuterie werkt door?\n\n"
        "A. Bitter-zoet tegen vet en zout ✅\n"
        "B. Alleen kleurcontrast\n"
        "C. Lage alcohol\n"
        "D. Geen umami\n\n"
        "### Vraag 13\n\n"
        "Whiskey Sour: eiwitfunctie?\n\n"
        "A. Textuur en schuimintegratie ✅\n"
        "B. Meer alcohol\n"
        "C. Minder zuur\n"
        "D. Koolzuur\n\n"
        "### Vraag 14\n\n"
        "Garnish citrus-express: effect?\n\n"
        "A. Aromatische lift boven glas ✅\n"
        "B. Meer zoetheid in vloeistof\n"
        "C. Lagere temperatuur\n"
        "D. Meer verdunning\n\n"
        "### Vraag 15\n\n"
        "Blind structuur: eerste stap?\n\n"
        "A. Merk raden\n"
        "B. Familie bepalen (sour/spirit-forward/highball) ✅\n"
        "C. Garnish kiezen\n"
        "D. Prijs schatten\n\n"
        "### Vraag 16\n\n"
        "Digestief profiel: wat past?\n\n"
        "A. Spirit-forward, weinig restsuiker ✅\n"
        "B. Zoete frozen cocktail\n"
        "C. Lichte spritz\n"
        "D. Alcoholvrije sour\n\n"
        "### Vraag 17\n\n"
        "Batchcocktail risico?\n\n"
        "A. Verlies van frisheid zonder tijdsvenster ✅\n"
        "B. Te weinig integratie\n"
        "C. Te veel ijs\n"
        "D. Geen garnish\n\n"
        "### Vraag 18\n\n"
        "Moscow Mule: signature element?\n\n"
        "A. Koperen munt en gemberstructuur ✅\n"
        "B. Vermout\n"
        "C. Eiwit\n"
        "D. Layering\n\n"
        "### Vraag 19\n\n"
        "Service: remakes voorkomen door?\n\n"
        "A. Vooraf voorkeur en structuur checken ✅\n"
        "B. Minder uitleg\n"
        "C. Alleen snelheid\n"
        "D. Geen proeven\n\n"
        "### Vraag 20\n\n"
        "Examenmeesterschap betekent?\n\n"
        "A. Alles uit het hoofd\n"
        "B. Integratie van techniek, smaak en argumentatie ✅\n"
        "C. Alleen creativiteit\n"
        "D. Alleen snelheid\n"
    ),
}


def apply_part2() -> None:
    from cock_gold_master_data import (
        FOOD_PAIRING,
        GOLD_KEY_CONCEPTS,
        LEERDOELEN,
        PRO_INSIGHTS,
        QUIZ_FULL,
        QUIZ_PATCHES,
        REFLECTIEVRAGEN,
        SUMMARIES,
        THEORY_OVERRIDES,
    )

    for d_src, d_dst in [
        (LEERDOELEN_P2, LEERDOELEN),
        (THEORY_OVERRIDES_P2, THEORY_OVERRIDES),
        (FOOD_PAIRING_P2, FOOD_PAIRING),
        (PRO_INSIGHTS_P2, PRO_INSIGHTS),
        (REFLECTIEVRAGEN_P2, REFLECTIEVRAGEN),
        (SUMMARIES_P2, SUMMARIES),
        (GOLD_KEY_CONCEPTS_P2, GOLD_KEY_CONCEPTS),
        (QUIZ_PATCHES_P2, QUIZ_PATCHES),
        (QUIZ_FULL_P2, QUIZ_FULL),
    ]:
        d_dst.update(d_src)
