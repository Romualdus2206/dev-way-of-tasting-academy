"""Port Track V2 — final polish: leerdoelen en sectie-patches voor PERFECT-pass."""

from __future__ import annotations

PERFECT_LEERDOELEN: dict[int, str] = {
    1: (
        "Na deze les kun jij uitleggen wat Port is, waarom fortificatie het karakter bepaalt "
        "en hoe je Port onderscheidt van gewone tafelwijn."
    ),
    2: (
        "Na deze les kun jij uitleggen hoe fortificatie werkt, welke rol aguardente speelt "
        "en waarom timing bepalend is voor restsuiker en smaak."
    ),
    3: (
        "Na deze les kun jij benoemen waarom Port uniek is ten opzichte van gewone wijn, "
        "en hoe terrassen en traditie het karakter van de Douro vormen."
    ),
    4: (
        "Na deze les kun jij de belangrijkste lijnen in de Portgeschiedenis schetsen: "
        "de rol van de Britten, lodges in Vila Nova de Gaia en de internationale handel."
    ),
    5: (
        "Na deze les kun jij de hoofdcategorieën Ruby, Tawny, White en Vintage benoemen "
        "en uitleggen wat elk type in het glas betekent."
    ),
    6: (
        "Na deze les kun jij de belangrijkste Portdruiven benoemen en uitleggen hoe een blend "
        "van Touriga Nacional, Touriga Franca, Tinta Roriz en Tinto Cão de productie stuurt."
    ),
    7: (
        "Na deze les kun jij de subregio's Baixo Corgo, Cima Corgo en Douro Superior benoemen "
        "en uitleggen hoe terrassen en ligging de productie beïnvloeden."
    ),
    8: (
        "Na deze les kun jij uitleggen hoe hitte, schist en lage opbrengst in de Douro "
        "het terroir vormen en de Portproductie bepalen."
    ),
    9: (
        "Na deze les kun jij uitleggen hoe vatgrootte, oxidatie en rijpingsduur het verschil "
        "maken tussen fruitbewaring in Ruby en transformatie in Tawny."
    ),
    10: (
        "Na deze les kun jij het oxidatieve verschil tussen Ruby en Tawny uitleggen "
        "en herkennen hoe zuurstof en hout het smaakprofiel sturen."
    ),
    11: (
        "Na deze les kun jij een gestructureerde proefnotitie van Port opstellen volgens "
        "de Way-of-Tasting-methode: kleur, neus, smaak, structuur en conclusie."
    ),
    12: (
        "Na deze les kun jij de structuur van Port analyseren en alcohol, zoetheid, "
        "tannine en body bewust van elkaar onderscheiden."
    ),
    13: (
        "Na deze les kun jij de belangrijkste aroma's in Port herkennen — fruit, kruiden, "
        "noten en oxidatieve tonen — en ze koppelen aan stijl en rijping."
    ),
    14: (
        "Na deze les kun jij Ruby en Tawny Port blind onderscheiden op kleur, aroma, "
        "structuur en oxidatie — met onderbouwde conclusie."
    ),
    15: (
        "Na deze les kun jij je kennis uit module drie integreren in een zelfstandige "
        "proefopdracht en je aanpak evalueren op systematiek en stijlherkenning."
    ),
    16: (
        "Na deze les kun jij uitleggen waar Port vandaan komt, waarom alleen de Douro "
        "officieel Port mag heten en welke rol Porto, Gaia en export daarin spelen."
    ),
    17: (
        "Na deze les kun jij druivenrassen en quintatradities lezen als regionale identiteit "
        "— los van productiemechanica."
    ),
    18: (
        "Na deze les kun jij het Douro-landschap als cultureel en oenologisch erfgoed uitleggen."
    ),
    19: (
        "Na deze les kun jij het verschil tussen quinta en Port House toepassen in proef en advies."
    ),
    20: (
        "Na deze les kun jij grote Porthuizen herkennen aan hun stijlhandtekening."
    ),
    21: (
        "Na deze les kun jij Ruby Reserve positioneren tussen basis-Ruby en LBV/Vintage."
    ),
    22: (
        "Na deze les kun jij LBV uitleggen als praktische oogstjaar-Port met langere vatrijping."
    ),
    23: (
        "Na deze les kun jij Crusted Port herkennen en het decanteeradvies onderbouwen."
    ),
    24: (
        "Na deze les kun jij Vintage Port uitleggen: declaratie, rijping en service."
    ),
    25: (
        "Na deze les kun jij Vintage en LBV vergelijken op potentieel, toegankelijkheid en gastmoment."
    ),
    26: (
        "Na deze les kun jij White Port herkennen, de belangrijkste witte druiven benoemen "
        "en uitleggen wanneer deze stijl als aperitief of in cocktails het beste past."
    ),
    27: (
        "Na deze les kun jij Rosé Port herkennen, uitleggen hoe kort schilcontact de stijl vormt "
        "en inschatten wanneer deze moderne Port als aperitief of cocktailbasis past."
    ),
    28: (
        "Na deze les kun jij Tawny Port fundamenteel uitleggen, de oxidatieve rijpingslogica "
        "toepassen en 10, 20, 30 en 40 Years onderscheiden op smaak, inzet en pairing."
    ),
    29: (
        "Na deze les kun jij Colheita uitleggen als single-harvest Tawny, het onderscheid "
        "met leeftijds-Tawny en Vintage onderbouwen en het etiket correct lezen."
    ),
    30: (
        "Na deze les kun jij Garrafeira Port uitleggen, de combinatie van hout- en glasrijping "
        "onderscheiden van Vintage en Colheita, en inschatten wanneer deze zeldzame stijl past."
    ),
    31: (
        "Na deze les kun jij per stijl de juiste serveertemperatuur onderbouwen."
    ),
    32: (
        "Na deze les kun jij glaswerk kiezen dat aroma en alcohol in balans houdt."
    ),
    33: (
        "Na deze les kun jij bepalen wanneer decanteren nodig is en hoe je het uitvoert."
    ),
    34: (
        "Na deze les kun jij houdbaarheid na opening inschatten per stijl."
    ),
    35: (
        "Na deze les kun jij per moment de meest logische Portstijl adviseren."
    ),
    36: (
        "Na deze les kun jij Port systematisch aan kaas koppelen per stijl."
    ),
    37: (
        "Na deze les kun jij Port aan chocolade koppelen op structuur en intensiteit, "
        "niet alleen op zoetheid."
    ),
    38: (
        "Na deze les kun jij Tawny en notendesserts in balans brengen via oxidatieve spiegeling."
    ),
    39: (
        "Na deze les kun jij Port in vleesgerechten positioneren op reductie en umami."
    ),
    40: (
        "Na deze les kun jij Port als gastronomisch ingrediënt inzetten."
    ),
    41: (
        "Na deze les kun jij een Portkaart lezen op inzetbaarheid, niet alleen prijs."
    ),
    42: (
        "Na deze les kun jij blind systematisch elimineren in plaats van gokken."
    ),
    43: (
        "Na deze les kun jij Port adviseren vanuit gastcontext en behoefte."
    ),
    44: (
        "Na deze les kun jij kelder- en bewaarstrategie per stijl uitleggen."
    ),
    45: (
        "Na deze les kun jij Port als geïntegreerd systeem toepassen: "
        "stijl → structuur → context → keuze."
    ),
}

# Lessen waar repair-theorie (matching nummer) de ADD-choppy referentiemodel vervangt.
REPAIR_THEORY_LESSONS: frozenset[int] = frozenset(
    list(range(1, 15)) + list(range(16, 26))
)

# Volledige sectie-herstel (corrupte canon).
LESSON_PATCHES: dict[int, dict[str, str]] = {
    29: {
        "Leerdoel": PERFECT_LEERDOELEN[29],
        "Theorie": (
            "Colheita betekent letterlijk 'oogst' — en dat woord is de sleutel tot de stijl. "
            "Colheita Port is een Tawny uit één enkel oogstjaar: geen blend van meerdere "
            "vintagejaren, maar de expressie van één seizoen dat jarenlang oxidatief op vat "
            "heeft gerijpt. Dat combineert jaargang-identiteit met de notige, zachte wereld "
            "van Tawny.\n\n"
            "De wettelijke minimumvatrijping bedraagt zeven jaar, maar veel producenten gaan "
            "veel verder: twintig, dertig of zelfs vijftig jaar op hout is geen uitzondering. "
            "Die lange vatrijping drijft oxidatie, geeft walnoten, karamel en sinaasappelschil, "
            "en maakt de wijn ronder en complexer dan een jonge Ruby. Het botteljaar op het "
            "etiket vertelt wanneer de wijn definitief werd afgesloten; het oogstjaar vertelt "
            "welke druiven het fundament vormden.\n\n"
            "Het contrast met Vintage is fundamenteel. Vintage rijpt kort op vat en lang in "
            "de fles — reductief, tanninerijk, met enorm bewaarpotentieel. Colheita rijpt lang "
            "op vat en is vaak direct drinkbaar na botteling: oxidatief, toegankelijk, maar "
            "niet minder verfijnd. Single harvest maakt Colheita tot de brug tussen "
            "jaargangswijn en oxidatieve rijpingswereld.\n\n"
            "Serveer Colheita licht gekoeld (12–14°C), meestal zonder decanteren. Na opening "
            "blijft de wijn weken tot maanden stabiel dankzij de al bestaande oxidatieve "
            "rijping — een voordeel dat Ruby en Vintage niet hebben."
        ),
        "Wist-je-dat": (
            "Sommige Colheita's worden pas na tientallen jaren vatrijping gebotteld en dragen "
            "zowel oogstjaar als botteljaar op het etiket — een dubbele tijdsaanduiding die "
            "nergens anders in de Portwereld zo consequent wordt toegepast."
        ),
        "Samenvatting": (
            "- Colheita = Tawny uit één oogstjaar (single harvest)\n"
            "- Minimaal zeven jaar vatrijping; oxidatie en notige complexiteit\n"
            "- Oogstjaar én botteljaar op het etiket\n"
            "- Brug tussen Vintage (flesrijping) en gewone Tawny (blend)\n"
            "- Licht gekoeld serveren; lang houdbaar na opening"
        ),
        "Food pairing": (
            "### Beste pairing\n\n"
            "Oude Colheita met notendessert, foie gras of harde oude kaas.\n\n"
            "### Waarom dit werkt\n\n"
            "Oxidatieve diepte en jaargangskarakter vragen rijke, gelaagde partners: "
            "noten, vet en zout versterken de complexiteit zonder de wijn plat te maken.\n\n"
            "### Vermijd\n\n"
            "Lichte citrusdesserts of te zuur fruit — die laten Colheita log en eenzijdig aanvoelen."
        ),
        "Pro insight": (
            "Colheita is vaak de meest onderschatte premiumcategorie: diepe oxidatieve lagen "
            "met een concreet oogstverhaal. Adviseer hem aan gasten die Tawny kennen maar "
            "meer persoonlijkheid zoeken dan een leeftijdsblend."
        ),
        "Praktijkopdracht": (
            "### Opdracht\n\n"
            "Zoek een Colheita op (wijnwinkel, kelder of online) en noteer:\n\n"
            "- oogstjaar\n"
            "- botteljaar\n"
            "- vermelde vatrijping (indien aanwezig)\n"
            "- producent en regio\n\n"
            "Vergelijk het etiket met een gewone Tawny en een Vintage uit dezelfde producent "
            "of prijsklasse. Wat valt op in terminologie en verwachting?\n\n"
            "### Checklist\n\n"
            "- [ ] Ik begrijp het verschil met een gewone Tawny-blend\n"
            "- [ ] Ik begrijp het verschil met Vintage Port\n"
            "- [ ] Ik herken oogstjaar en botteljaar op een Colheita-etiket\n"
            "- [ ] Ik kan uitleggen waarom Colheita oxidatief rijpt"
        ),
        "Quiz": (
            "### Vraag 1\n\n"
            "Wat betekent Colheita?\n\n"
            "A. Blend\n"
            "B. Oogst ✅\n"
            "C. Vat\n"
            "D. Fles\n\n"
            "### Vraag 2\n\n"
            "Waaruit bestaat Colheita?\n\n"
            "A. Meerdere oogstjaren\n"
            "B. Eén oogstjaar ✅\n"
            "C. Alleen witte druiven\n"
            "D. Alleen Ruby\n\n"
            "### Vraag 3\n\n"
            "Hoe lang moet Colheita minimaal op vat rijpen?\n\n"
            "A. 2 jaar\n"
            "B. 5 jaar\n"
            "C. 7 jaar ✅\n"
            "D. 10 jaar\n\n"
            "### Vraag 4\n\n"
            "Waar rijpt Colheita vooral?\n\n"
            "A. Fles\n"
            "B. Vat ✅\n"
            "C. Tank\n"
            "D. Beton\n\n"
            "### Vraag 5\n\n"
            "Wat zie je vaak op het etiket?\n\n"
            "A. Alleen botteljaar\n"
            "B. Oogstjaar en botteljaar ✅\n"
            "C. Alleen alcoholpercentage\n"
            "D. Geen jaartal"
        ),
        "Quiz-feedback": (
            "Goed gedaan. Je begrijpt nu waarom Colheita een unieke brug vormt tussen "
            "oxidatieve Tawny-rijping en jaargang-identiteit — en waarom producenten die "
            "stijl met trots apart positioneren."
        ),
    },
    36: {
        "Leerdoel": PERFECT_LEERDOELEN[36],
        "Theorie": (
            "Port en kaas vormen één van de sterkste gastronomische allianties in de wijnwereld. "
            "De combinatie werkt omdat tegengestelde elementen elkaar versterken: zout in kaas "
            "maakt zoetheid in Port aantrekkelijker, vet wordt doorgesneden door alcohol, "
            "en umami in rijpe kazen vindt een tegenhanger in de concentratie van Port.\n\n"
            "Drie principes sturen elke succesvolle pairing. Eerst: zout plus zoet — blauwe "
            "kaas en Port zijn het schoolvoorbeeld. Tweede: vet plus alcohol — alcohol maakt "
            "de mond frisser na een romige hap. Derde: intensiteit moet kloppen — lichte kaas "
            "met zware Port of omgekeerd laat één van beide verdwijnen.\n\n"
            "De klassieker is Stilton met Vintage Port: zout, romigheid en kracht tegen fruit, "
            "tannine en lengte. Aged Gouda met 20 Years Tawny spiegelt kristallen, zout en "
            "karamel in de kaas met noten en oxidatie in de wijn. Manchego met White Port is "
            "ondergewaardeerd: frisheid en amandel tegen zout en nootachtige vet. LBV werkt "
            "vaak beter dan Vintage bij blauwe kaas voor wie toegankelijkheid zoekt. Serveer "
            "kaas altijd op kamertemperatuur — koude kaas maakt pairing vlak."
        ),
        "Wist-je-dat": (
            "De Britse traditie van Stilton met Vintage Port bestaat al meer dan tweehonderd "
            "jaar en werd populair toen Engelse handelshuizen zowel Port als blauwe kaas "
            "importeerden en aan tafel combineerden."
        ),
        "Samenvatting": (
            "- Port en kaas: zout + zoet, vet + alcohol, intensiteitsmatch\n"
            "- Klassieker: Vintage + Stilton; Tawny + oude Gouda\n"
            "- Manchego + White Port en Brie + Rosé als moderne alternatieven\n"
            "- Kaas op kamertemperatuur; Port in klein glas op juiste temperatuur\n"
            "- Intensiteit van kaas en Port moet gelijk oplopen"
        ),
        "Food pairing": (
            "### Beste pairing\n\n"
            "Vintage + Stilton; Tawny 20 Years + oude Gouda; White Port + Manchego.\n\n"
            "### Waarom dit werkt\n\n"
            "Zout versterkt zoetheid, vet wordt doorgesneden door alcohol en oxidatieve "
            "noten in Tawny spiegelen karamel en kristallen in gerijpte harde kaas.\n\n"
            "### Vermijd\n\n"
            "Lichte White Port bij krachtige Roquefort, of zoete Ruby bij milde Brie — "
            "de intensiteit klopt dan niet."
        ),
        "Pro insight": (
            "Serveer nooit kaas rechtstreeks uit de koelkast — plan dertig tot zestig minuten "
            "op kamertemperatuur. Laat gasten eerst kaas proeven, dan Port; die volgorde "
            "maakt de balans duidelijker dan omgekeerd."
        ),
        "Praktijkopdracht": (
            "### Opdracht\n\n"
            "Maak thuis een mini pairing-flight met drie combinaties:\n\n"
            "- White Port + Manchego\n"
            "- Ruby of LBV + blauwe kaas\n"
            "- Tawny (10 of 20 Years) + oude Gouda\n\n"
            "Noteer per combinatie: balans, contrast, intensiteitsmatch en favoriet.\n\n"
            "### Checklist\n\n"
            "- [ ] Ik begrijp het principe zout + zoet\n"
            "- [ ] Ik herken intensiteitsbalans tussen kaas en Port\n"
            "- [ ] Ik heb minimaal twee pairings fysiek getest\n"
            "- [ ] Ik serveerde kaas op kamertemperatuur"
        ),
        "Quiz": (
            "### Vraag 1\n\n"
            "Welke pairing is de klassieker?\n\n"
            "A. Rosé + Brie\n"
            "B. Vintage + Stilton ✅\n"
            "C. White + Cheddar\n"
            "D. Ruby + Mozzarella\n\n"
            "### Vraag 2\n\n"
            "Waarom werkt zout goed met Port?\n\n"
            "A. Minder smaak\n"
            "B. Versterkt zoetheidsperceptie ✅\n"
            "C. Verlaagt alcohol\n"
            "D. Minder vet\n\n"
            "### Vraag 3\n\n"
            "Wat past vaak goed bij Aged Tawny?\n\n"
            "A. Jonge geitenkaas\n"
            "B. Oude Gouda ✅\n"
            "C. Mozzarella\n"
            "D. Feta\n\n"
            "### Vraag 4\n\n"
            "Waarom moet kaas op kamertemperatuur?\n\n"
            "A. Mooier op het bord\n"
            "B. Meer aroma en textuur ✅\n"
            "C. Minder zout\n"
            "D. Minder vet\n\n"
            "### Vraag 5\n\n"
            "Welke stijl is vaak toegankelijk bij blauwe kaas?\n\n"
            "A. White\n"
            "B. LBV ✅\n"
            "C. Rosé\n"
            "D. Colheita"
        ),
        "Quiz-feedback": (
            "Sterk. Je begrijpt nu waarom Port en kaas één van de krachtigste gastronomische "
            "combinaties zijn — en hoe je die met argumenten kunt adviseren."
        ),
    },
    37: {
        "Leerdoel": PERFECT_LEERDOELEN[37],
        "Theorie": (
            "Port en chocolade zijn een klassieke combinatie — maar alleen wanneer je op "
            "structuur matcht, niet op zoetheid alleen. Pure chocolade (70% cacao of meer) "
            "vraagt fruit, bitters en tannine om de cacao-bitterheid te dragen; daar blinken "
            "Ruby en LBV uit met zwart fruit en lengte. Melkchocolade vraagt zachtere "
            "integratie: vet en lactose temperen bitterheid, en een Tawny met karamel en "
            "noten sluit daar eleganter op aan.\n\n"
            "De veelgemaakte fout is te oude Tawny bij pure chocolade: dubbele oxidatie en "
            "dubbele bitterheid kunnen hard botsen in plaats van harmonieus te bouwen. "
            "Match eerst intensiteit en textuur — dan pas suiker. Een romige ganache vraagt "
            "andere Port dan een krokante tablet; flavor bridging werkt wanneer cacao-tonen "
            "in Ruby de bitterheid in pure chocolade spiegelen, of wanneer karamel in Tawny "
            "melkchocolade versterkt.\n\n"
            "Hoe donkerder de chocolade, hoe meer structuur je nodig hebt — niet automatisch "
            "meer zoetheid. Bij een chocoladeflight: begin met melkchocolade en Ruby, "
            "eindig met pure cacao en LBV of jonge Vintage."
        ),
        "Wist-je-dat": (
            "Premium-chocolatiers filteren bij Portpairings eerst op cacao-percentage — "
            "niet op suikergehalte — omdat bitterheid en vet de Portkeuze sturen."
        ),
        "Samenvatting": (
            "- Pure chocolade vraagt Ruby of LBV: fruit, bitters en structuur\n"
            "- Melkchocolade past vaker bij Tawny: zachtere oxidatieve integratie\n"
            "- Match op intensiteit en textuur vóór zoetheid\n"
            "- Te oude Tawny bij pure cacao kan hard botsen\n"
            "- Donkerder chocolade = meer structuur, niet per se zoeter Port"
        ),
        "Food pairing": (
            "### Beste pairing\n\n"
            "Ruby Reserve of LBV met pure chocolade (minimaal 70% cacao).\n\n"
            "### Waarom dit werkt\n\n"
            "Zwart fruit, cacao-tonen en tannine in Ruby dragen de bitterheid en het vet "
            "in pure chocolade — de wijn blijft levendig terwijl de chocolade niet plakkerig "
            "of te zoet aanvoelt.\n\n"
            "### Vermijd\n\n"
            "40 Years Tawny bij pure bittere chocolade — oxidatie en cacao-bitter kunnen "
            "elkaar versterken tot een harde, eenzijdige indruk."
        ),
        "Pro insight": (
            "Hoe donkerder de chocolade, hoe meer structuur je nodig hebt — niet automatisch "
            "meer zoet. Proef het dessert eerst en kies Port op intensiteit; bij twijfel "
            "wint Ruby Reserve boven een oude Tawny bij pure cacao."
        ),
        "Praktijkopdracht": (
            "### Opdracht\n\n"
            "Maak thuis twee pairings en noteer je bevindingen:\n\n"
            "- Ruby of LBV met pure chocolade (min. 70% cacao)\n"
            "- Tawny 10 of 20 Years met melkchocolade of karamelpraline\n\n"
            "Beoordeel per combinatie: zoetheidsbalans, intensiteit, textuur en favoriet.\n\n"
            "### Checklist\n\n"
            "- [ ] Ik heb structuur vóór zoetheid als criterium gebruikt\n"
            "- [ ] Ik kan uitleggen waarom pure cacao Ruby/LBV vraagt\n"
            "- [ ] Ik heb minimaal één pairing fysiek getest\n"
            "- [ ] Ik kan de Tawny-fout bij pure chocolade benoemen"
        ),
    },
    38: {
        "Leerdoel": PERFECT_LEERDOELEN[38],
        "Theorie": (
            "Notendesserts en Tawny Port spreken dezelfde oxidatieve taal: walnoot, hazelnoot, "
            "karamel en toffee zitten vaak al in de wijn vóór ze op het bord staan. Dat maakt "
            "spiegeling — flavor bridging via overlappende aroma-families — tot het sterkste "
            "principe bij deze pairing.\n\n"
            "Ruby werkt hier meestal minder goed: primair fruit en tannine missen de notige "
            "aansluiting die geroosterde noten en boter in het dessert vragen. Een 10 of "
            "20 Years Tawny brengt precies die gelaagdheid: oxidatie, zachtheid en "
            "karamelachtige diepte die pecantaart, hazelnootschuim of amandelkrokant versterken "
            "in plaats van overstemmen.\n\n"
            "Textuur telt mee: krokant notenkorstje vraagt andere balans dan romige "
            "notenmousse. Serveer Tawny licht gekoeld (12–14°C) zodat zoetheid niet plakkerig "
            "wordt naast rijke desserts. De zoetheidsregel blijft gelden: de Port moet "
            "minstens even zoet aanvoelen als het dessert."
        ),
        "Wist-je-dat": (
            "Veel topchefs bouwen notendesserts rondom Tawny Port in plaats van andersom — "
            "de wijn wordt het startpunt van het gerecht, niet de bijzaak na de maaltijd."
        ),
        "Samenvatting": (
            "- Notendesserts vragen Tawny: oxidatieve aroma-spiegeling\n"
            "- Walnoot, karamel en toffee in wijn en dessert versterken elkaar\n"
            "- Ruby mist vaak de oxidatieve aansluiting bij noten\n"
            "- Textuur en zoetheidsbalans bepalen de finale harmonie\n"
            "- Lichte koeling houdt Tawny fris naast rijke desserts"
        ),
        "Food pairing": (
            "### Beste pairing\n\n"
            "20 Years Tawny met pecannotentaart of hazelnootkrokant.\n\n"
            "### Waarom dit werkt\n\n"
            "Geroosterde noten in het dessert en oxidatieve noten in de Tawny bouwen "
            "dezelfde smaakfamilies op — de wijn voelt logisch in plaats van toevallig zoet.\n\n"
            "### Vermijd\n\n"
            "Jonge Ruby bij pure notentaart — fruit en tannine domineren waar oxidatie "
            "en karamel de brug moeten slaan."
        ),
        "Pro insight": (
            "Tawny is de meest dessertvriendelijke Portcategorie: breed inzetbaar bij noten, "
            "karamel en room — met weinig risico zolang je op zoetheidsbalans let. "
            "Bij twijfel: 20 Years Tawny is de veiligste gastronomische keuze."
        ),
        "Praktijkopdracht": (
            "### Opdracht\n\n"
            "Proef Tawny 10 of 20 Years naast een notendessert (pecantaart, nougatine of "
            "hazelnootijs). Noteer:\n\n"
            "- welke aroma's spiegelen tussen wijn en dessert\n"
            "- of de zoetheidsbalans klopt\n"
            "- of textuur (krokant vs. romig) de pairing beïnvloedt\n\n"
            "### Checklist\n\n"
            "- [ ] Ik kan oxidatieve spiegeling uitleggen\n"
            "- [ ] Ik heb Tawny gekozen boven Ruby met motivatie\n"
            "- [ ] Ik heb zoetheidsbalans beoordeeld\n"
            "- [ ] Ik kan een alternatief notendessert benoemen"
        ),
        "Quiz": (
            "### Vraag 1\n\n"
            "Welke Portstijl past het best bij notendesserts?\n\n"
            "A. White Port\n"
            "B. Tawny ✅\n"
            "C. Rosé Port\n"
            "D. Jonge Ruby\n\n"
            "### Vraag 2\n\n"
            "Waarom past Tawny sterk bij notendesserts?\n\n"
            "A. Hoge tannine\n"
            "B. Oxidatieve aroma-spiegeling ✅\n"
            "C. Lage alcohol\n"
            "D. Geen restsuiker\n\n"
            "### Vraag 3\n\n"
            "Waarom werkt Ruby hier minder goed?\n\n"
            "A. Te weinig alcohol\n"
            "B. Te veel primair fruit, te weinig oxidatieve aansluiting ✅\n"
            "C. Te veel zuur\n"
            "D. Te weinig zoetheid\n\n"
            "### Vraag 4\n\n"
            "Welke pairing is een klassieker?\n\n"
            "A. Ruby + citroentaart\n"
            "B. 20 Years Tawny + pecantaart ✅\n"
            "C. White + chocolade\n"
            "D. Vintage + sorbet\n\n"
            "### Vraag 5\n\n"
            "Wat is het kernprincipe bij notendesserts?\n\n"
            "A. Altijd de zoetste Port kiezen\n"
            "B. Spiegeling van aroma-families en textuur ✅\n"
            "C. Altijd decanteren\n"
            "D. Zo hoog mogelijke serveertemperatuur"
        ),
        "Quiz-feedback": (
            "Sterk. Je begrijpt nu waarom Tawny en notendesserts via oxidatie logisch aan "
            "elkaar vastzitten — en waarom Ruby hier zelden de beste keuze is."
        ),
    },
    39: {
        "Leerdoel": PERFECT_LEERDOELEN[39],
        "Theorie": (
            "Port bij vlees is niche, maar wanneer de match klopt, is hij uitzonderlijk "
            "overtuigend. Het verschil met droge rode wijn is restsuiker: Port is niet "
            "breed inzetbaar bij elke biefstuk, maar gericht bij wild, eend en rijke "
            "sauzen waar fruit, tannine en concentratie eiwit en umami dragen.\n\n"
            "Vintage Port past bij hert, wildzwijn en krachtige wildgerechten: stevige "
            "tannine, diepte en lengte tegen gamey tonen en vet. Ruby en LBV werken bij "
            "eend, rijke roderechten en sauzen met fruitcomponent — de zoetheid moet dan "
            "bewust gebalanceerd zijn door zout, bitter of umami in het gerecht. Tawny "
            "is zelden de eerste keuze bij vlees: te weinig grip en te veel oxidatieve "
            "finesse voor eiwitrijke hoofdgerechten.\n\n"
            "In de keuken blinkt Port vooral als reductie: Ruby of LBV reduceert tot "
            "fruitige, krachtige saus bij wild of eend — suiker karamelliseert, alcohol "
            "verdampt, concentratie blijft. Gebruik Port bij vlees als sauscomponent of "
            "finale pairing, niet als standaard tafelwijn naast een biefstuk."
        ),
        "Wist-je-dat": (
            "Portreductie is één van de meest gebruikte luxe sauzen in klassieke Franse "
            "keuken — een traditie die teruggaat tot de negentiende eeuw toen Britse Port "
            "in continentale keukens populair werd."
        ),
        "Samenvatting": (
            "- Port bij vlees: niche, maar sterk bij wild, eend en rijke sauzen\n"
            "- Vintage voor game; Ruby/LBV voor eend en fruitige sauzen\n"
            "- Restsuiker beperkt brede inzet bij standaard rood vlees\n"
            "- Portreductie met Ruby/LBV is de klassieke keukentoepassing\n"
            "- Tawny zelden eerste keuze bij eiwitrijke hoofdgerechten"
        ),
        "Food pairing": (
            "### Beste pairing\n\n"
            "Vintage Port met hert of wildzwijn; LBV-reductie bij eendenborst.\n\n"
            "### Waarom dit werkt\n\n"
            "Tannine en concentratie in Vintage dragen gamey eiwit en vet; een Ruby-reductie "
            "karamelliseert en versterkt umami zonder het gerecht zoet te maken.\n\n"
            "### Vermijd\n\n"
            "Tawny als standaard tafelwijn bij biefstuk — te weinig structuur en te veel "
            "oxidatieve zachtheid voor neutraal rood vlees."
        ),
        "Pro insight": (
            "Gebruik Port bij vlees vooral als sauscomponent of finale pairing — niet als "
            "vervanger van droge rode wijn. Houd een betaalbare Ruby of LBV apart als "
            "kook-Port; reduceer op laag vuur tot de helft en proef na zout in het gerecht."
        ),
        "Praktijkopdracht": (
            "### Opdracht\n\n"
            "Bedenk twee vleesgerechten waarbij Port logisch past:\n\n"
            "- één als reductie (welke stijl en waarom)\n"
            "- één als glas pairing (welk vlees en welke Port)\n\n"
            "Motivere per keuze op structuur, umami en zoetheidsbalans.\n\n"
            "### Checklist\n\n"
            "- [ ] Ik kan uitleggen waarom Port niet breed bij rood vlees past\n"
            "- [ ] Ik kies Vintage of Ruby/LBV met onderbouwing\n"
            "- [ ] Ik begrijp Port als reductie-ingrediënt\n"
            "- [ ] Ik kan Tawny bij vlees bewust afwijzen"
        ),
        "Quiz": (
            "### Vraag 1\n\n"
            "Welke Port past vaak bij wild?\n\n"
            "A. White Port\n"
            "B. Vintage ✅\n"
            "C. Rosé Port\n"
            "D. Tawny 40 Years\n\n"
            "### Vraag 2\n\n"
            "Waarom is Port minder breed inzetbaar bij rood vlees?\n\n"
            "A. Minder kleur\n"
            "B. Restsuiker kan balans verstoren ✅\n"
            "C. Minder alcohol\n"
            "D. Geen tannine\n\n"
            "### Vraag 3\n\n"
            "Welke stijl wordt vaak gebruikt in reducties?\n\n"
            "A. Ruby of LBV ✅\n"
            "B. White Port\n"
            "C. Garrafeira\n"
            "D. Tawny 40 Years\n\n"
            "### Vraag 4\n\n"
            "Waarom past Tawny zelden bij vlees?\n\n"
            "A. Te veel tannine\n"
            "B. Te weinig grip voor eiwitrijke gerechten ✅\n"
            "C. Te veel fruit\n"
            "D. Te hoge zuur\n\n"
            "### Vraag 5\n\n"
            "Wat is de beste professionele inzet van Port bij vlees?\n\n"
            "A. Altijd als tafelwijn\n"
            "B. Sauscomponent of gerichte finale pairing ✅\n"
            "C. Alleen bij vis\n"
            "D. Nooit in de keuken"
        ),
        "Quiz-feedback": (
            "Goed. Je ziet nu waarom Port bij vlees selectief werkt — en hoe reductie en "
            "wildpairing de sterkste toepassingen zijn."
        ),
    },
    40: {
        "Leerdoel": PERFECT_LEERDOELEN[40],
        "Theorie": (
            "In professionele gastronomie is Port geen alleen digestief: het is een instrument "
            "voor pairing, reductie en smaakversterking op meerdere momenten in een menu. "
            "Door suiker, alcohol, concentratie en aromatische diepte kan Port meer dan "
            "gewone wijn — als aperitief, bij tussengerecht, in de hoofdgang, bij kaas "
            "en in desserts.\n\n"
            "Als aperitief blinken White Port, White Port & Tonic en Rosé Port uit. "
            "Bij hoofdgerecht is Port minder gebruikelijk maar krachtig: wild met LBV, "
            "eend met Ruby, hert met Vintage — rijke eiwitten dragen de alcohol. Als "
            "ingrediënt is Port vooral waardevol in reducties: Ruby of LBV reduceert tot "
            "fruitige saus; Tawny in desserts geeft notigheid; White Port in lichte "
            "marinades is subtieler.\n\n"
            "Veelgemaakte fouten: te zoete Port in hartige saus, Vintage koken, White bij "
            "zware pure chocolade, Tawny bij zeer zure desserts. Gebruik de stijl bewust: "
            "Ruby voor fruitcomponent, Tawny voor oxidatieve diepte, White voor aromatische lift."
        ),
        "Wist-je-dat": (
            "Portreductie is één van de meest gebruikte luxe sauzen in klassieke Franse keuken "
            "— een traditie die teruggaat tot de negentiende eeuw toen Britse Port in "
            "continentale keukens populair werd."
        ),
        "Samenvatting": (
            "- Port als aperitief (White/Rosé), pairing (kaas, wild) én ingrediënt (reductie)\n"
            "- Ruby/LBV voor hartige sauzen; Tawny voor desserts; White voor lichte keuken\n"
            "- Nooit Vintage koken; wel kook-Port apart houden\n"
            "- Umami-versterker in kleine dosering bij paddenstoelen en wild\n"
            "- Stijlkeuze volgt functie in het gerecht, niet gewoonte"
        ),
        "Food pairing": (
            "### Beste pairing\n\n"
            "Portreductie met wild of eend; Tawny in karameldessert.\n\n"
            "### Waarom dit werkt\n\n"
            "Concentratie en suikers in gereduceerde Port bouwen sausdiepte; Tawny voegt "
            "oxidatieve noten toe die in het dessert landen in plaats van ernaast te staan.\n\n"
            "### Vermijd\n\n"
            "Vintage in de pan — te kostbaar en te complex voor keukengebruik."
        ),
        "Pro insight": (
            "Reduceer Port op laag vuur tot de helft of een derde; suiker concentreert snel "
            "en kan verbranden. Houd een betaalbare Ruby of LBV apart als kook-Port — "
            "dat voorkomt dat je per ongeluk je drinkvoorraad in de pan gooit."
        ),
        "Praktijkopdracht": (
            "### Opdracht\n\n"
            "Ontwerp een viergangenmenu met Port op elk moment:\n\n"
            "- aperitief (White of Rosé)\n"
            "- gerecht (Ruby/LBV — pairing of reductie)\n"
            "- kaas (Vintage of Tawny)\n"
            "- dessert (Tawny of Ruby)\n\n"
            "Motivere per gang: stijl, temperatuur en pairing-principe.\n\n"
            "### Checklist\n\n"
            "- [ ] Ik begrijp Port als pairing én als ingrediënt\n"
            "- [ ] Ik kan per stijl een gerecht koppelen\n"
            "- [ ] Ik weet waarom Vintage zelden in de keuken hoort\n"
            "- [ ] Ik heb minimaal één reductie of pairing bedacht met concrete stijl"
        ),
        "Quiz": (
            "### Vraag 1\n\n"
            "Welke stijl past het best bij een notige sausreductie?\n\n"
            "A. Ruby\n"
            "B. Tawny ✅\n"
            "C. White\n"
            "D. Rosé\n\n"
            "### Vraag 2\n\n"
            "Waarom werkt Port in de keuken?\n\n"
            "A. Door hoge zuur\n"
            "B. Als smaakversterker en reductiebasis ✅\n"
            "C. Alleen als dessert\n"
            "D. Geen alcohol\n\n"
            "### Vraag 3\n\n"
            "White Port in sabayon geeft vooral:\n\n"
            "A. Bitterheid\n"
            "B. Frisse aromatische lift ✅\n"
            "C. Tannine\n"
            "D. Depot\n\n"
            "### Vraag 4\n\n"
            "Gastronomische Port vraagt eerst:\n\n"
            "A. Prijs\n"
            "B. Functie in het gerecht ✅\n"
            "C. Etiketkleur\n"
            "D. Jaartal\n\n"
            "### Vraag 5\n\n"
            "Beste moment voor culinaire Port?\n\n"
            "A. Alleen digestief\n"
            "B. Wanneer structuur het gerecht ondersteunt ✅\n"
            "C. Alleen bij vis\n"
            "D. Nooit in keuken"
        ),
        "Quiz-feedback": (
            "Uitstekend. Je begrijpt nu dat Port in gastronomie veel breder inzetbaar is dan "
            "alleen na het dessert — en hoe je dat professioneel kunt adviseren."
        ),
    },
}

PRO_INSIGHT_OVERRIDES: dict[int, str] = {
    1: (
        "Een gast die zegt: *\"Ik drink normaal geen Port, want dat is te zoet\"* heeft vaak "
        "alleen basis-Ruby geproefd. Dan ligt jouw kans om White Port of een oudere Tawny "
        "te adviseren. Professioneel adviseren begint met herinterpreteren."
    ),
    3: (
        "Uniek betekent niet altijd beter — maar in Port betekent uniek: terroir + methode + "
        "geschiedenis. Dat is bijna niet kopieerbaar. Vraag in elk advies: welke van die "
        "drie factoren proef je terug in het glas?"
    ),
    5: (
        "De fout van beginners: Port kiezen op leeftijd. Professionals kiezen Port op moment. "
        "Niet: \"Wat is de oudste?\" Maar: \"Wat past nu?\""
    ),
    6: (
        "Vraag niet: \"Welke druif proef ik?\" Vraag: \"Welke rol speelt deze druif?\" "
        "Dat is hoe professionals proeven."
    ),
    12: (
        "Vraag bij elke slok: wat blijft hangen — zoetheid, alcohol of tannine? "
        "Dat vertelt je waar de wijn op gebouwd is."
    ),
    13: (
        "Aroma-herkenning is geen talent; het is herhaling. Train op families: fruit, "
        "kruiden, noten en oxidatie — niet op losse woorden."
    ),
    16: (
        "Vraag altijd: \"Waar komt deze Port exact vandaan?\" Niet alleen: \"Welke stijl is het?\" "
        "Locatie vertelt vaak meer dan het label."
    ),
}

FOOD_PAIRING_WAAROM_OVERRIDES: dict[int, str] = {
    9: (
        "Karamel in het dessert en karamel in de Tawny spiegelen elkaar; oxidatie in de wijn "
        "en geroosterd suikerwerk in crème brûlée bouwen dezelfde smaakfamilies op."
    ),
}
