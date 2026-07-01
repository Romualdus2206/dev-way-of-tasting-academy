"""Beer Track V2 — Gold Master QA data (reflectie, pairing, pro insight, theorie)."""

from __future__ import annotations

import re

TERMINOLOGY_REPLACEMENTS: list[tuple[str, str]] = [
    (r"\bjij\b", "je"),
    (r"\bJouw\b", "Je"),
    (r"\bjouw\b", "je"),
]

_CITE = r"\s*:contentReference\[oaicite:\d+\]\{index=\d+\}\.?"

ARTIFACT_REPLACEMENTS: list[tuple[str, str]] = [
    (
        rf"De stijl ontstond in 1842 in{_CITE}",
        "De stijl ontstond in 1842 in Pilsen (Bohemen).",
    ),
    (
        rf"{_CITE} bracht Witbier",
        "Pierre Celis bracht witbier",
    ),
    (
        rf"De oorsprong van Bock ligt in{_CITE}",
        "De oorsprong van Bock ligt in Einbeck (Nedersaksen).",
    ),
    (
        rf"{_CITE} speelde een grote rol in de ontwikkeling van Dubbel",
        "De abdij van Westmalle speelde een grote rol in de ontwikkeling van Dubbel",
    ),
    (
        rf"{_CITE} wordt gezien als de bakermat van de moderne Tripel",
        "De abdij van Westmalle wordt gezien als de bakermat van de moderne Tripel",
    ),
    (
        rf"{_CITE} gebruikte als eerste officieel de naam Quadrupel",
        "Brouwerij De Koningshoeven (La Trappe) gebruikte als eerste officieel de naam Quadrupel",
    ),
    (
        rf"Saison ontstond als boerenbier in{_CITE}",
        "Saison ontstond als boerenbier in Henegouwen (Wallonië).",
    ),
    (
        rf"De officiële organisatie heet{_CITE}",
        "De officiële organisatie heet de International Trappist Association (ITA).",
    ),
    (
        rf"Porter is een klassieke donkere bierstijl uit{_CITE}",
        "Porter is een klassieke donkere bierstijl uit Londen (Engeland).",
    ),
    (
        rf"{_CITE} is wereldwijd het bekendste stoutmerk",
        "Guinness is wereldwijd het bekendste stoutmerk",
    ),
]

_LESSON_ORIGIN_FIXES: dict[int, str] = {
    26: "De stijl ontstond in Engeland, als exportbier voor Brits-India.",
    27: "De stijl ontstond in Vermont (New England, VS).",
}


def fix_artifacts(text: str, lesson_num: int | None = None) -> str:
    if lesson_num in _LESSON_ORIGIN_FIXES:
        text = re.sub(
            rf"De stijl ontstond in{_CITE}",
            _LESSON_ORIGIN_FIXES[lesson_num],
            text,
            count=1,
        )
    for pat, repl in ARTIFACT_REPLACEMENTS:
        text = re.sub(pat, repl, text)
    text = re.sub(_CITE, "", text)
    return text


def _fp(beste: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{beste}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


LEERDOELEN: dict[int, str] = {
    1: (
        "Na deze les kun je uitleggen wat bier is, welke vier ingrediënten de basis vormen "
        "en waarom gisting het karakter van elke stijl bepaalt."
    ),
    2: (
        "Na deze les kun je elk basisingrediënt koppelen aan zijn rol in smaak, structuur "
        "en productie — en dat in één heldere uitleg geven."
    ),
    3: (
        "Na deze les kun je uitleggen hoe alcoholische gisting werkt en welke factoren "
        "alcoholgehalte, koolzuur en smaakprofiel sturen."
    ),
    4: (
        "Na deze les kun je ondergisting en bovengisting onderscheiden op temperatuur, "
        "giststam en typisch smaakprofiel."
    ),
    5: (
        "Na deze les kun je de belangrijkste biercategorieën herkennen en koppelen aan "
        "smaak, productie en serveermoment."
    ),
    6: (
        "Na deze les kun je uitleggen wat mouten doet met graan en hoe moutkleur en "
        "moutprofiel het bier bepalen."
    ),
    7: (
        "Na deze les kun je het maischproces beschrijven en uitleggen hoe suikers "
        "vrijkomen voor de gisting."
    ),
    8: (
        "Na deze les kun je hop koppelen aan bitterheid, aroma en balans — en IBU "
        "in context plaatsen."
    ),
    9: (
        "Na deze les kun je uitleggen hoe gist smaak en aroma vormt en waarom "
        "giststam en temperatuur doorslaggevend zijn."
    ),
    10: (
        "Na deze les kun je uitleggen waarom lagering en rijping smaak stabiliseren "
        "en wanneer dat cruciaal is voor kwaliteit."
    ),
    11: (
        "Na deze les kun je een gestructureerde bierproef uitvoeren en objectief "
        "notities maken van uiterlijk tot afdronk."
    ),
    12: (
        "Na deze les kun je schuim analyseren op stabiliteit, textuur en kwaliteit "
        "als signaal van brouwtechniek."
    ),
    13: (
        "Na deze les kun je bieraroma's herkennen in families (mout, hop, gist, esters) "
        "en benoemen zonder te gissen."
    ),
    14: (
        "Na deze les kun je structuur en mondgevoel beoordelen op body, koolzuur, "
        "bitterheid en balans."
    ),
    15: (
        "Na deze les toets je geïntegreerde kennis uit fundament, productie en proeven "
        "en herken je waar je nog scherpte nodig hebt."
    ),
    16: (
        "Na deze les kun je Pilsner herkennen en uitleggen waarom deze stijl technisch "
        "veeleisend is ondanks zijn eenvoudige imago."
    ),
    17: (
        "Na deze les kun je Blond herkennen op gistprofiel, moutzoetheid en typische "
        "Belgische balans."
    ),
    18: (
        "Na deze les kun je Weizen herkennen op gistkarakter, banaan/kruidnagel-esters "
        "en troebele presentatie."
    ),
    19: (
        "Na deze les kun je Witbier herkennen op tarwe, koriander en fris, licht "
        "zurend profiel."
    ),
    20: (
        "Na deze les kun je Bockbier herkennen op moutzoetheid, alcohol en seizoenslogica."
    ),
    21: (
        "Na deze les kun je Dubbel herkennen op donkere mout, karamel en abdijtraditie."
    ),
    22: (
        "Na deze les kun je Tripel herkennen op hoge attenuatie, kruidige gist en droge afdronk."
    ),
    23: (
        "Na deze les kun je Quadrupel herkennen op intensiteit, diepte en rijpe mouttonen."
    ),
    24: (
        "Na deze les kun je Saison herkennen op droogheid, kruidigheid en boerse oorsprong."
    ),
    25: (
        "Na deze les kun je Trappist en abdijbier onderscheiden op certificering, "
        "productie en positionering."
    ),
    26: (
        "Na deze les kun je IPA herkennen op hopbitterheid, aroma-intensiteit en moderne evolutie."
    ),
    27: (
        "Na deze les kun je NEIPA herkennen op troebelheid, juicy hoparoma en zachte bitterheid."
    ),
    28: (
        "Na deze les kun je Porter herkennen op geroosterde mout, chocolade en historische context."
    ),
    29: (
        "Na deze les kun je Stout herkennen op roast, body en het verschil met Porter."
    ),
    30: (
        "Na deze les kun je Barleywine herkennen op alcohol, moutzoetheid en rijpingspotentieel."
    ),
    31: (
        "Na deze les kun je serveertemperatuur koppelen aan stijl, aroma en mondgevoel."
    ),
    32: (
        "Na deze les kun je glaswerk kiezen op basis van stijl, schuim en aroma-ontwikkeling."
    ),
    33: (
        "Na deze les kun je correct schenken voor optimaal schuim, koolzuur en presentatie."
    ),
    34: (
        "Na deze les kun je bier bewaren en rijpen op temperatuur, licht en stijllogica."
    ),
    35: (
        "Na deze les kun je bier en kaas paireren op intensiteit, vet, zout en koolzuur."
    ),
    36: (
        "Na deze les kun je bier en vlees paireren op eiwit, vet, roodheid en sausstructuur."
    ),
    37: (
        "Na deze les kun je bier en dessert paireren op zoetheid, bitterheid en textuur."
    ),
    38: (
        "Na deze les kun je blind Lager en Ale onderscheiden op aroma, gist en mondgevoel."
    ),
    39: (
        "Na deze les kun je blind IPA en Stout onderscheiden op hop, roast en structuur."
    ),
    40: (
        "Na deze les toon je aan dat je Beer Academy beheerst: theorie, proeven, service, "
        "pairing en blindanalyse."
    ),
}

REFLECTIEVRAGEN: dict[int, str] = {
    1: (
        "Welk ingrediënt — water, mout, hop of gist — zou je als eerste benoemen om een "
        "wijndrinker te laten begrijpen waarom bier zo veel stijlen kent?"
    ),
    2: (
        "Stel: je mag één ingrediënt wijzigen in een standaardrecept. Welke keuze verandert "
        "het glas het meest — en waarom?"
    ),
    3: (
        "Bij gelijke startmost: wat bepaalt of het eindbier 4% of 8% alcohol wordt — "
        "en welke productiekeuze zie je terug in het mondgevoel?"
    ),
    4: (
        "Je proeft fruitigheid maar weinig esters: wed je op ondergisting of bovengisting — "
        "en welke temperatuurcue gebruik je om dat te onderbouwen?"
    ),
    5: (
        "Een gast vraagt 'iets fris maar niet waterig': welke categorie kies je eerst — "
        "Lager, Wheat of IPA — en welk compromis leg je uit?"
    ),
    6: (
        "Lichtere mout of donkerdere mout in hetzelfde recept: welke verandering proef je "
        "het eerst — kleur, zoetheid of bitterheid?"
    ),
    7: (
        "Wat gebeurt er met body als maischen te kort duurt — en hoe herken je dat in "
        "een blindglas zonder het etiket te zien?"
    ),
    8: (
        "Twee bieren met gelijke IBU proef je verschillend bitter: welke factor — hopsoort, "
        "moutzoetheid of koolzuur — verklaart dat verschil?"
    ),
    9: (
        "Je ruikt banaan in een bier zonder tarwe: is dat gist, hop of fout — "
        "en welke stijl zou je daarop wedden?"
    ),
    10: (
        "Wanneer is korte lagering beter dan lange rijping — en welke stijl verliest "
        "het meest aan te vroege consumptie?"
    ),
    11: (
        "Welke stap in je proefnotitie geeft je nu de minste zekerheid — uiterlijk, neus, "
        "mondgevoel of conclusie — en wat oefen je daar concreet op?"
    ),
    12: (
        "Schuim valt binnen dertig seconden in: wijst dat op glas, brouwtechniek of "
        "serveerfout — en welke test doe je als eerste?"
    ),
    13: (
        "Je ruikt karamel maar ook citrus: welke aroma-familie weegt zwaarder voor "
        "je stijlconclusie — mout of hop?"
    ),
    14: (
        "Bij gelijke alcohol proef je één bier als 'zwaarder': welke structuurcomponent — "
        "body, bitterheid of koolzuur — beslist voor jou?"
    ),
    15: (
        "Waar ging je te snel naar conclusie in je integratieproef — en welke observatie "
        "had je eerder moeten vastleggen?"
    ),
    16: (
        "Waarom is een 'simpele' Pils technisch zo veeleisend — en welke fout in service "
        "maakt dat direct zichtbaar?"
    ),
    17: (
        "Blond of Dubbel bij dezelfde alcohol: welke cue — gist, mout of bitterheid — "
        "geeft je de snelste stijlzekerheid?"
    ),
    18: (
        "Weizen zonder banaan/kruidnagel: is dat jeugdig, verkeerd geschenken of "
        "een andere stijl — en hoe toets je dat?"
    ),
    19: (
        "Witbier of Weizen blind: vertrouw je eerst op koriander, troebelheid of zuurgraad — "
        "en welke cue heeft je het vaakst misleid?"
    ),
    20: (
        "Bock in de zomer serveren: wanneer werkt dat culinair — en wanneer is het "
        "een servicefout ongeacht smaak?"
    ),
    21: (
        "Dubbel of Quadrupel bij kaas: welke moutintensiteit kies je en welk argument "
        "over zout en zoetheid gebruik je?"
    ),
    22: (
        "Tripel proeft 'zwaar' maar eindigt droog: welke productieverwachting — "
        "attenuatie of hop — leg je aan een gast uit?"
    ),
    23: (
        "Quadrupel of Barleywine bij hetzelfde alcohol: welke structuurcue — moutdiepte "
        "of hop — beslist blind voor jou?"
    ),
    24: (
        "Saison met te weinig koolzuur: serveerfout of stijlvariant — en welke temperatuur "
        "corrigeer je als eerste?"
    ),
    25: (
        "Een bier heet 'abdijbier' maar draagt geen hexagon: welke vraag stel je vóór "
        "je authenticiteit beoordeelt?"
    ),
    26: (
        "IPA met weinig bitterheid maar veel aroma: moderne stijl of verkeerde categorie — "
        "en welke hopfase verklaart het verschil?"
    ),
    27: (
        "NEIPA na drie weken: nog representatief of past prime — en welke aroma's "
        "verwacht je te verliezen?"
    ),
    28: (
        "Porter of Stout bij stoofvlees: welke roastintensiteit kies je en waarom "
        "werkt koolzuur hier anders dan bij wijn?"
    ),
    29: (
        "Stout zonder koffie-aroma: verwacht je dat bij elke stijl — of is dat "
        "merk- versus stijlkenmerk?"
    ),
    30: (
        "Barleywine nu drinken of bewaren: welke drie signalen aan mout, alcohol "
        "en oxidatie bepalen je advies?"
    ),
    31: (
        "Een gast klaagt dat het bier 'te koud' smaakt: welke stijl staat op tafel — "
        "en welke twee graden verander je als eerste?"
    ),
    32: (
        "Waarom schenk je Weizen in een hoog glas en Stout in een tulip — "
        "en wanneer zou je bewust afwijken?"
    ),
    33: (
        "Schuim over de rand: techniek of glas — en welke schenkcorrectie "
        "doe je zonder het bier te verliezen?"
    ),
    34: (
        "IPA in de koelkast een jaar: welke kwaliteitsverandering verwacht je — "
        "en welke stijl zou je wél lang koel bewaren?"
    ),
    35: (
        "Blauwe kaas met Pils of Tripel: welke structuurargumenten — zout, vet, "
        "koolzuur — beslissen je keuze?"
    ),
    36: (
        "Biefstuk met IPA of Dubbel: wanneer kies je bitterheid boven moutzoetheid — "
        "en welke saus bepaalt dat?"
    ),
    37: (
        "Chocoladedessert met Stout of Quadrupel: waarom werkt contrast soms beter "
        "dan spiegeling — en wanneer niet?"
    ),
    38: (
        "Bij twijfel Lager/Ale blind: vertrouw je eerst op esters, koolzuur of afdronk — "
        "en welke cue leidde bijna tot een verkeerde conclusie?"
    ),
    39: (
        "IPA of Stout met gelijke kleur: welke observatie na de eerste slok "
        "is voor jou doorslaggevend?"
    ),
    40: (
        "Na het examen: waar ligt je grootste kracht — stijlkennis, proeven of pairing — "
        "en welk onderdeel oefen je het eerst verder?"
    ),
}

PRO_INSIGHTS: dict[int, str] = {
    1: (
        "Gasten die bier 'te bitter' vinden, hebben vaak alleen massamarkt-lager geproefd. "
        "Vraag naar moment en gerecht vóór je stijl noemt — moutzoetheid en koolzuur "
        "openen vaak de deur naar verkoop."
    ),
    2: (
        "Leg ingrediënten niet als recept maar als smaakcontract: water bepaalt textuur, "
        "mout zoetheid, hop balans, gist karakter. Dat voorkomt discussies over 'speciale' bieren."
    ),
    3: (
        "Gisting is geen detail maar het smaakmoment. Leg in één zin uit dat gist suiker "
        "omzet in alcohol én aroma — dat maakt blindproeven voorspelbaarder."
    ),
    4: (
        "Vraag niet 'welke gist?' maar 'welke temperatuur en welk profiel?' — "
        "onder- versus bovengisting is hoe professionals stijlen elimineren."
    ),
    5: (
        "Beginners kiezen bier op kleur; professionals op structuur en moment. "
        "Vraag niet 'licht of donker?' maar 'fris, fruitig of geroosterd?'"
    ),
    6: (
        "Mout is de smaakmotor van bier. Wie moutkleur kan lezen, voorspelt body en "
        "zoetheid vóór de eerste slok — essentieel in service en blindproeven."
    ),
    7: (
        "Maischen klinkt technisch maar verklaart doordrinkbaarheid: te weinig suiker "
        "betekent dun bier; te veel restsuiker betekent zoet en zwaar."
    ),
    8: (
        "IBU is geen bitterheidswedstrijd. Leg uit dat moutzoetheid bitterheid maskeert — "
        "daarmee verklaar je waarom een Dubbel en IPA anders 'bijten'."
    ),
    9: (
        "Gistaroma is vaak het eerste wat je blind herkent. Train esters en fenolen apart — "
        "dat scheelt tussen Weizen, Saison en Belgisch blond."
    ),
    10: (
        "Jong bier direct op tap is niet altijd beter. Leg uit wanneer lagering rust "
        "brengt — gasten waarderen dat als vakmanschap, niet als oude voorraad."
    ),
    11: (
        "Een proefnotitie is geen smaakverslag maar een beslisboom. Wie observaties "
        "vóór conclusies zet, wint bij blindproeven en examens."
    ),
    12: (
        "Schuim is kwaliteitsbewijs. In service: een kroes die instort wijst vaak op "
        "glas, temperatuur of bierstaat — niet op 'slecht bier' zonder check."
    ),
    13: (
        "Train aroma in families, niet in merken. Mout, hop, gist en oxidatie "
        "geven sneller stijlzekerheid dan 'dit ruikt naar X-brouwerij'."
    ),
    14: (
        "Body en bitterheid zijn los van alcohol. Dat inzicht voorkomt dat je een "
        "zware Tripel verwart met een lichte Barleywine op percentage alleen."
    ),
    15: (
        "Integratie is waar kennis zichtbaar wordt. Noteer per proef één zwakke schakel — "
        "dat is je trainingsplan voor de Specialist-fase."
    ),
    16: (
        "Pils op kamertemperatuur is een veelgemaakte servicefout. Schenk koud, "
        "glas schoon, en leg uit waarom frisheid hier geen smaak is maar de stijl zelf."
    ),
    17: (
        "Blond verkoopt op toegankelijkheid maar differentieer op gist en afdronk — "
        "daarmee onderscheid je massamarkt van abdijkwaliteit."
    ),
    18: (
        "Weizen zonder schuimkraag mist vaak de pointe. Schenk met hef in het glas "
        "alleen als de gast dat wil — anders verlies je esterprofiel in presentatie."
    ),
    19: (
        "Witbier is seizoensbier bij uitstek. Op de kaart: koppel citrus en kruid "
        "aan gerecht vóór je 'fris alternatief voor wijn' zegt."
    ),
    20: (
        "Bock is seizoensverhaal met smaak. Verkoop niet alleen op alcohol maar op "
        "moutwarmte — dat maakt pairing met kaas en stoof logisch."
    ),
    21: (
        "Dubbel is de instap naar Belgische complexiteit. Adviseer op moutdiepte, "
        "niet op kleur — donker betekent niet automatisch zwaar."
    ),
    22: (
        "Tripel misleidt op alcohol: droge afdronk is het kenmerk. Waarschuw gasten "
        "voor snelheid, niet voor zoetheid."
    ),
    23: (
        "Quadrupel vraagt kleiner glas en rustiger tempo. In verkoop: positioneer "
        "als digestief, niet als tweede pint."
    ),
    24: (
        "Saison is gastronomisch sterker dan zijn populariteit. Farm-to-table en "
        "droge afdronk maken het een sommelier-lieveling bij kruidige gerechten."
    ),
    25: (
        "Trappist is certificering, geen smaakgarantie. Leg ITA-regels uit — "
        "authenticiteit en verhaal verkopen beter dan mythe."
    ),
    26: (
        "IPA is geen bitterheidswedstrijd meer. Vraag gasten of ze citrus, pine "
        "of juicy willen — dan kies je substijl in plaats van 'de hoppigste'."
    ),
    27: (
        "NEIPA heeft een houdbaarheidsvenster. Adviseer vers drinken; oxidatie "
        "geeft sinaasappel-marmelade — niet altijd slecht, wel anders dan bedoeld."
    ),
    28: (
        "Porter is underdog bij gastronomie. Chocolade en geroosterde mout maken "
        "het een stille winnaar bij stoof en desserts met cacao."
    ),
    29: (
        "Niet elke donkere pint is Guinness. Leer roast-niveaus — dat maakt blind "
        "Stout versus Porter haalbaar."
    ),
    30: (
        "Barleywine is wijnlogica in bier. Schenk klein, temperatuur iets hoger, "
        "en praat over rijping — gasten die port liefhebben, snappen dit snel."
    ),
    31: (
        "Te koud maskeert aroma; te warm maakt bier plakkerig. Houd een "
        "temperatuurkaart achter de bar — dat is professioneler dan gissen."
    ),
    32: (
        "Glas is geen decoratie maar aromatraining. Eén zin over opening en "
        "schuim ondersteunt upsell naar speciaalbier."
    ),
    33: (
        "Schenktechniek bepaalt marge: te veel schuim is weggegooid bier. "
        "Train 'twee fasen schenken' — gasten zien vakmanschap, jij behoudt volume."
    ),
    34: (
        "Bier is geen wijn in de kelder, maar sommige stijlen rijpen wel. "
        "Wees eerlijk over IPA (drink jong) versus Barleywine (bewaar)."
    ),
    35: (
        "Bier-kaas wint vaak van wijn door koolzuur. Gebruik dat in verkoop: "
        "niet 'bier bij kaas kan ook', maar 'koolzuur snijdt door vet beter'."
    ),
    36: (
        "Bij vlees: match roodheid van gerecht met roast van bier. IPA bij burger, "
        "Porter bij lam — structuur eerst, merk daarna."
    ),
    37: (
        "Dessertpairing met bier vraagt zoetheidsmanagement. Te zoet bier + te zoet "
        "dessert = plat; contrast of spiegeling bewust kiezen."
    ),
    38: (
        "Blind Lager/Ale: esters zijn je snelste cue. Vertrouw niet op kleur — "
        "veel modern bier breekt visuele regels."
    ),
    39: (
        "IPA versus Stout blind: hopbitter versus roastbitter voelt anders op de tong. "
        "Train dat onderscheid apart van alcoholwarmte."
    ),
    40: (
        "Certificering is begin, geen eindpunt. Noteer één zwak examenonderdeel en "
        "één sterk punt — dat wordt je vervolgplan in de praktijk."
    ),
}

FOOD_PAIRING: dict[int, str] = {
    1: _fp(
        "Gezouten pretzels, milde Goudse kaas en mosselen.",
        "Koolzuur en bitterheid snijden door zout en vet; lichte moutzoetheid vangt umami "
        "in schelpdieren zonder het bier zwaar te maken.",
        "Zoete desserts of agressief zure sauzen bij een neutraal instapbier.",
    ),
    2: _fp(
        "Vers brood met boter, jonge kaas en lichte vis.",
        "Mout en gist leveren broodachtige tonen die kaas en boter spiegelen; koolzuur "
        "houdt vet fris en maakt hopbitterheid niet scherp.",
        "Zware BBQ-sauzen die een specifiek hopprofiel vereisen.",
    ),
    3: _fp(
        "Pizza margherita, pasta met tomatensaus en gegrilde groenten.",
        "Alcohol en koolzuur dragen tomatenzuur; moutzoetheid balanceert basilicum en "
        "olie zonder dat het bier zoet wordt.",
        "Delicate sashimi zonder zout of structuurcontrast.",
    ),
    4: _fp(
        "Duitse worst, kipsaté en lichte salade met vinaigrette.",
        "Lager: koolzuur en schone afdronk bij vet en zout; ale-varianten: esters "
        "tegen kruidige marinades.",
        "Zware stoof zonder roast-contrast bij een te lichte ale.",
    ),
    5: _fp(
        "Pils met bitterballen, Weizen met Weißwurst, Stout met chocoladetaart.",
        "Elke categorie heeft eigen structuur: frisheid (lager), zachte esters (tarwe), "
        "roast en bitter (donker) — pairing volgt die logica.",
        "Eén categorie forceren op alle gerechten.",
    ),
    6: _fp(
        "Geroosterde kip, notenbrood en oude kaas.",
        "Moutkaramel en broodtonen spiegelen rooster en rijping; bitterheid en koolzuur "
        "houden vet in balans.",
        "Te lichte salades zonder vet of umami.",
    ),
    7: _fp(
        "Stoofvlees, aardappelpuree en paddenstoelentoast.",
        "Maischen-zoetheid en body dragen romige en umami-rijke gerechten; koolzuur "
        "voorkomt dat stoof plakkerig aanvoelt.",
        "Rauwe citrusgerechten die alleen zuur zoeken.",
    ),
    8: _fp(
        "IPA bij spicy taco's, Pils bij fish and chips, Blond bij kip met kruiden.",
        "Hopbitterheid temt capsaïcine; koolzuur snijdt door frituurvet; kruidige gist "
        "spiegelt mediterrane kruiden.",
        "Subtiele witvis zonder zout of vet.",
    ),
    9: _fp(
        "Weizen met Hefezopf, Saison met geitenkaas, Dubbel met stoof.",
        "Gistesters (banaan, kruidnagel, peper) spiegelen brood en kruid; donkere gist "
        "tonen passen bij karamel uit stoof.",
        "Gerechten waar gistfouten dominant worden (te zoet dessert).",
    ),
    10: _fp(
        "Gerijpte cheddar, braadkip en notentaart.",
        "Gelagerd bier: rondere mout, minder ruwe alcohol; structuur matcht vet en "
        "rijpe smaken zonder scherpe randen.",
        "Zeer delicate gerechten die jeugdig, knisperend bier vereisen.",
    ),
    11: _fp(
        "Het bier dat je proeft, met een neutraal crackersbord.",
        "Neutrale pairing isoleert observatie: zout activeert smaak zonder het profiel "
        "te domineren — ideaal voor proeftraining.",
        "Sterk gekruide snacks tijdens een structuurproef.",
    ),
    12: _fp(
        "Frituur, lichte bitterballen en zoute noten.",
        "Schuim en koolzuur reinigen het palet; zout versterkt bitterheid en maakt "
        "schuimkwaliteit zichtbaar in combinatie.",
        "Roomachtige sauzen die schuim direct laten inzakken.",
    ),
    13: _fp(
        "Gerecht dat past bij het aroma-profiel van je proefbier.",
        "Spiegel pairing (mout bij karamel, hop bij citrus) traint herkenning; contrast "
        "test of je aroma-families echt begrijpt.",
        "Parfum of rokerige gerechten die neusproef verstoren.",
    ),
    14: _fp(
        "Ribeye, romige pasta en gekarameliseerde ui.",
        "Body en koolzuur dragen vet; bitterheid snijdt door rijke sauzen; balans "
        "tussen mondgevoel en gerecht is hier de test.",
        "Te lichte gerechten bij een zwaar, zoet bier.",
    ),
    15: _fp(
        "Drie gangen: salade, stoof, kaas — elk met passend bier.",
        "Integratiepairing test of je structuur (fris, mout, roast) kunt koppelen aan "
        "zout, vet en umami over een heel menu.",
        "Alleen dessertbier door het hele menu.",
    ),
    16: _fp(
        "Haring, bitterballen en lichte geitenkaas.",
        "Pils: hoge koolzuur en strakke bitterheid bij zout en frituur; droge afdronk "
        "reset vet zonder zoetheid.",
        "Blauwschimmelkaas of chocolade — te weinig body en mout.",
    ),
    17: _fp(
        "Kip met kruidenboter, mosselen en jonge Gouda.",
        "Belgische blond: moutzoetheid en kruidige gist bij boter en zeevruchten; "
        "alcohol draagt zonder plakkerig te worden.",
        "Zware chocolade of espresso-dessert.",
    ),
    18: _fp(
        "Weißwurst, pretzel en lichte apfelstrudel.",
        "Weizen-esters spiegelen banaan en kruid in Duitse keuken; zachte body en "
        "koolzuur bij vet van worst.",
        "Zeer hoppige of roasty gerechten.",
    ),
    19: _fp(
        "Geitenkaas, salade met citrus en lichte vis.",
        "Tarwe-zachtheid en koriander bij citrus en zout; frisse zuurgraad maakt "
        "vet van kaas licht.",
        "Zware stoof of agressieve BBQ.",
    ),
    20: _fp(
        "Ham, oude kaas en peperkoek.",
        "Bock-moutzoetheid en alcohol bij gezouten vlees en karameltonen; body "
        "matcht winterse intensiteit.",
        "Lichte zomersalade als hoofdgerecht.",
    ),
    21: _fp(
        "Stoofvlees, abdijkaas en bruine boterkoek.",
        "Dubbel: karamelmout en donkere fruittonen bij stoof en rijpe kaas; bitterheid "
        "temt zoetheid van gebak.",
        "Te delicate witvis zonder saus.",
    ),
    22: _fp(
        "Gevogelte met kruiden, oude kaas en asperges met hollandaise.",
        "Tripel: droge afdronk en kruidige gist bij eiwit en vet; alcohol draagt "
        "sauzen zonder zoet te worden.",
        "Zoet fruitdessert zonder contrast.",
    ),
    23: _fp(
        "Wild, blauwschimmelkaas en chocoladefondant.",
        "Quadrupel: diepe mout, rijp fruit en alcohol bij gamey vlees en intense kaas; "
        "zoetheid balanceert pure cacao.",
        "Lichte salade of crudo.",
    ),
    24: _fp(
        "Geitenkaas, kruidige worst en gegrilde groenten.",
        "Saison: droge afdronk en peperige gist bij kruid en zout; koolzuur maakt "
        "vet van kaas fris.",
        "Zoete toetjes zonder bitter- of zuurcontrast.",
    ),
    25: _fp(
        "Abdijkaas, notenbrood en stoof.",
        "Trappist/dubbel-quadrupel ladder: moutdiepte en alcohol bij abdijkaas en "
        "umami; broodtonen spiegelen gist.",
        "Pils bij alles — mist structuur voor zware gerechten.",
    ),
    26: _fp(
        "Spicy burger, curry en gegrilde chorizo.",
        "IPA-hopbitterheid en alcohol temmen capsaïcine; citrusaroma spiegelt "
        "tropische marinades.",
        "Subtiele witvis of crème-desserts.",
    ),
    27: _fp(
        "Fried chicken, poke bowl en softe geitenkaas.",
        "NEIPA: juicy hop en lage bitterheid bij vet en umami; tropisch aroma "
        "spiegelt moderne Aziatische keuken.",
        "Zware roast-gerechten die bitter-chocolade vragen.",
    ),
    28: _fp(
        "Biefstuk, braad en brownies.",
        "Porter-roast en chocolade-mout bij gegrild vlees en cacao; koolzuur "
        "snijdt door vet van braad.",
        "Lichte citrusdesserts.",
    ),
    29: _fp(
        "Oesters, Irish stew en chocoladetaart.",
        "Stout: roast en koffie-tonen bij stoof en dessert; umami van schelpdieren "
        "bij milde zoetheid en bitter.",
        "Te lichte salade als hoofdmaaltijd.",
    ),
    30: _fp(
        "Blauwschimmelkaas, sticky toffee pudding en notentaart.",
        "Barleywine: moutzoetheid en alcohol bij rijpe kaas en karamel; complexiteit "
        "matcht gelaagde desserts.",
        "Frisse sorbet zonder structuur.",
    ),
    31: _fp(
        "Het bier dat je serveert, op de juiste temperatuur.",
        "Correcte temperatuur laat aroma en koolzuur werken: te koud = vlak; te warm = "
        "zoet en plakkerig — pairing begint bij service.",
        "Eén temperatuur voor alle stijlen.",
    ),
    32: _fp(
        "Stijl-passend gerecht in het juiste glas.",
        "Glasvorm concentreert aroma: Weizen hoog voor esters, tulip voor IPA/Stout — "
        "pairing slaagt wanneer neus en mond hetzelfde profiel krijgen.",
        "Pils in wijnglas — verliest koolzuur en schuim.",
    ),
    33: _fp(
        "Tapbier met perfecte kroes bij frituur of borrel.",
        "Correct geschonken schuim beschermt koolzuur en bitterheid; zout in snacks "
        "versterkt frisheid zonder oxidatie.",
        "Bier lang laten staan voor schenken.",
    ),
    34: _fp(
        "Gerijpt bier met oude kaas of stoof (indien stijl past).",
        "Bewaard bier: geïntegreerde smaken bij umami en vet; oxidatie en mout "
        "ontwikkeling vragen rijpe, rustige gerechten.",
        "NEIPA of hoppig IPA lang bewaren en bij lichte salade serveren.",
    ),
    35: _fp(
        "Tripel met oude Gouda, Dubbel met blauwschimmel, Weizen met geitenkaas.",
        "Koolzuur snijdt door vet; bitterheid balanceert zout; moutzoetheid matcht "
        "rijping van kaas — intensiteit moet gelijk lopen.",
        "Pils bij blauwschimmel; Quadrupel bij jonge mozzarella.",
    ),
    36: _fp(
        "IPA met burger, Porter met lam, Dubbel met stoof.",
        "Roast van bier spiegelt roodheid van vlees; hopbitter of mout temt vet; "
        "koolzuur reset vette sauzen.",
        "Zware Quadrupel bij lichte kipfilet zonder saus.",
    ),
    37: _fp(
        "Stout met chocoladetaart, Quadrupel met brownie, Blond met crème brûlée.",
        "Roast-bitter of moutzoetheid balanceert cacao; alcohol draagt room; "
        "contrast (bitter bier, zoet dessert) of spiegeling bewust kiezen.",
        "Zoet dessert + zoet fruitbier zonder zuurcontrast.",
    ),
    38: _fp(
        "Blind: kies pairing na stijlconclusie.",
        "Lager bij zout/frituur; ale bij kruid en esters — blindpairing test of "
        "stijlkennis en gastronomie samenkomen.",
        "Pairing kiezen vóór je stijl vastlegt.",
    ),
    39: _fp(
        "Blind: roast-gerecht bij donker, hop bij licht gekruid vlees.",
        "IPA versus Stout pairing volgt bitterheidstype: hop bij spice, roast bij "
        "chocolade en braad.",
        "Alleen kleur als pairingcriterium.",
    ),
    40: _fp(
        "Drie gangen examenmenu: kaas, vlees, dessert met passend bier.",
        "Examenpairing integreert zout, vet, umami, zoetheid en bitter over het "
        "hele menu — structuur per gang bewust kiezen.",
        "Eén bier voor alle drie examenpairings.",
    ),
}

GOLD_KEY_CONCEPTS: dict[int, list[str]] = {
    1: ["bier", "fermentatie", "vier ingrediënten", "alcohol", "CO2"],
    2: ["water", "mout", "hop", "gist", "smaakcontract"],
    3: ["gisting", "suiker", "alcohol", "koolzuur", "attenuatie"],
    4: ["ondergisting", "bovengisting", "temperatuur", "estervorming", "lager vs ale"],
    5: ["lager", "ale", "tarwebier", "donker bier", "IPA"],
    6: ["mouten", "moutkleur", "enzymen", "broodtonen", "kleur"],
    7: ["maischen", "suikers", "wort", "temperatuur", "body"],
    8: ["hop", "bitterheid", "IBU", "aroma", "balans"],
    9: ["giststam", "esters", "fenolen", "fermentatie", "aroma"],
    10: ["lagering", "rijping", "stabilisatie", "balans", "drinkbaarheid"],
    11: ["proefnotitie", "uiterlijk", "neus", "mondgevoel", "afdronk"],
    12: ["schuim", "koolzuur", "textuur", "stabiliteit", "kwaliteit"],
    13: ["aroma-families", "mout", "hop", "gist", "herkenning"],
    14: ["body", "bitterheid", "koolzuur", "balans", "structuur"],
    15: ["integratie", "fundament", "productie", "proeven", "toets"],
    16: ["pilsner", "ondergisting", "frisheid", "bitterheid", "doordrinkbaarheid"],
    17: ["blond", "Belgisch", "gistprofiel", "moutzoetheid", "balans"],
    18: ["weizen", "tarwe", "esters", "troebele", "banaan"],
    19: ["witbier", "tarwe", "koriander", "frisheid", "zuurgraad"],
    20: ["bock", "moutzoetheid", "seizoen", "alcohol", "donker"],
    21: ["dubbel", "abdij", "karamelmout", "donker fruit", "Belgisch"],
    22: ["tripel", "hoge attenuatie", "kruidig", "droge afdronk", "alcohol"],
    23: ["quadrupel", "intensiteit", "rijpe mout", "alcohol", "digestief"],
    24: ["saison", "droog", "kruidig", "boerenbier", "koolzuur"],
    25: ["trappist", "abdijbier", "ITA", "certificering", "authenticiteit"],
    26: ["IPA", "hopbitterheid", "aroma", "Engeland", "craft"],
    27: ["NEIPA", "troebele", "juicy", "zachte bitterheid", "houdbaarheid"],
    28: ["porter", "roast", "chocolade", "Londen", "donker"],
    29: ["stout", "roast", "koffie", "body", "Guinness"],
    30: ["barleywine", "moutzoetheid", "alcohol", "rijping", "digestief"],
    31: ["serveertemperatuur", "aroma", "koolzuur", "stijl", "service"],
    32: ["glaswerk", "aroma", "schuim", "presentatie", "stijl"],
    33: ["schenktechniek", "schuim", "koolzuur", "tap", "fles"],
    34: ["bewaren", "rijping", "licht", "temperatuur", "houdbaarheid"],
    35: ["kaas", "koolzuur", "zout", "vet", "intensiteit"],
    36: ["vlees", "roast", "eiwit", "vet", "saus"],
    37: ["dessert", "zoetheid", "bitterheid", "cacao", "balans"],
    38: ["blindproeven", "lager", "ale", "esters", "afdronk"],
    39: ["blindproeven", "IPA", "stout", "hop", "roast"],
    40: ["examen", "integratie", "certificering", "pairing", "blindanalyse"],
}

THEORY_OVERRIDES: dict[int, str] = {
    1: (
        "Bier is een alcoholische drank gebrouwen uit vier basisingrediënten: water, mout, "
        "hop en gist. Vergisting zet suikers uit het mout om in alcohol en koolzuur — "
        "dat proces is de motor achter elke stijl, van de lichtste Pils tot de zwaarste Barleywine.\n\n"
        "De basis is overal vergelijkbaar, maar kleine verschillen in water, moutkeuze, "
        "hoptiming en giststam produceren duizenden smaakprofielen. Bier kan fris of zwaar, "
        "bitter of moutzoet, troebel of glashelder zijn. Die veelzijdigheid maakt het "
        "één van de meest gastronomische dranken ter wereld — en cultureel één van de oudste."
    ),
    5: (
        "Bier wordt in de praktijk vaak ingedeeld in hoofdgroepen die productie en smaak "
        "samenvatten. Lager — ondergistend en koud gefermenteerd — is typisch strak, fris "
        "en doordrinkbaar. Ale — bovengistend en warmer gefermenteerd — is fruitiger, "
        "voller en vaak expressiever in esters.\n\n"
        "Tarwebieren zoals Weizen en Witbier voegen zachtheid en kruid toe; donkere stijlen "
        "als Porter en Stout bouwen op geroosterde mout voor chocolade en koffie. IPA "
        "plaatst hop centraal: bitterheid én aroma. Deze vijf ankers vormen de fundering "
        "voor elke stijlles die volgt."
    ),
    10: (
        "Na de hoofdgisting is veel bier nog ruw: jonge alcohol, scherpe randen, onrustige "
        "aroma's. Lagering — van het Duitse lagern, bewaren — geeft het bier tijd om "
        "smaken te stabiliseren. Ongewenste verbindingen vallen weg; mout en hop smelten "
        "samen tot een ronder geheel.\n\n"
        "Bij een Pils kan dat weken duren; bij zware bieren maanden of langer. Het resultaat "
        "is niet alleen rust, maar betere balans en doordrinkbaarheid. Wie begrijpt waarom "
        "brouwers lagering niet overslaan, begrijpt waarom 'vers van de tank' niet altijd "
        "beter is."
    ),
    15: (
        "Deze mini-toets integreert drie pijlers: fundament, productie en proeven. Je "
        "combineert wat bier is, hoe het gemaakt wordt en hoe je het objectief analyseert — "
        "het eerste echte integratiemoment van Beer Explorer.\n\n"
        "Je toont dat je ingrediënten, gisting en proefstructuur met elkaar verbindt. "
        "Zwakke schakels hier zijn waardevol: ze wijzen precies waar je in de "
        "Specialist-fase scherper moet worden."
    ),
    35: (
        "Bier en kaas vormen een van de sterkste klassieke pairings — vaak makkelijker "
        "dan wijn door koolzuur, bitterheid en moutzoetheid in één glas. Koolzuur snijdt "
        "door vet; bitterheid balanceert zout; moutzoetheid spiegelt rijping en caramelisatie "
        "in kaas.\n\n"
        "Tripel bij oude kaas, Dubbel bij blauwschimmel, Weizen bij jonge geitenkaas, "
        "Stout bij gerijpte cheddar: het patroon is intensiteit. Zware kaas vraagt "
        "structuur; lichte kaas vraagt frisheid. Wie dat begrijpt, pairt niet op merk "
        "maar op zout, vet en umami."
    ),
    36: (
        "Bier en vlees pairt op roodheid, vet en saus. Gegrild vlees roept roast en "
        "bitterheid op — Porter en Stout spiegelen dat. Vet vlees vraagt koolzuur en "
        "bitter om niet plakkerig te worden; IPA en Dubbel werken hier anders maar "
        "even effectief.\n\n"
        "Saus is de beslissende factor: romige saus vraagt moutzoetheid; tomatensaus "
        "vraagt frisheid en bitter. Match intensiteit van bier met intensiteit van "
        "gerecht — niet kleur alleen."
    ),
    37: (
        "Dessertpairing met bier draait om zoetheidsmanagement en textuur. Te zoet bier "
        "bij te zoet dessert maakt het geheel plat; contrast (bitter Stout bij chocolade) "
        "of spiegeling (Quadrupel bij brownie) werkt wanneer je bewust kiest.\n\n"
        "Cacao-bitterheid vraagt roast of moutdiepte; room vraagt alcohol die draagt "
        "zonder te domineren. Fruitdesserts vragen zuur en frisheid — hier passen Witbier "
        "of Saison beter dan zware Quadrupel."
    ),
    40: (
        "Dit examen integreert alle negen modules van Beer Academy. Explorer levert "
        "fundament, productie en proeven; Specialist bouwt klassieke, Belgische en "
        "moderne stijlen; Master voegt service, gastronomie en blindanalyse toe.\n\n"
        "Je toont kennis, stijlherkenning, service, pairing en analytisch proeven — "
        "theorie én praktijk. Dit is het certificeringsmoment: geen losse feiten, "
        "maar vakmanschap in samenhang."
    ),
}

QUIZ_PATCHES: dict[int, str] = {
    1: """### Vraag 1

Een gast vraagt wat bier fundamenteel anders maakt dan wijn. Wat is je kernantwoord?

A. Bier gebruikt druiven
B. Bier wordt gebrouwen uit graan met hop en gist ✅
C. Bier is altijd koolzuurhoudend
D. Bier bevat geen alcohol

""",
    4: """### Vraag 3

Je proeft sterke banaan en kruidnagel zonder donkere mout. Welke gisting past het best?

A. Ondergisting bij 8°C
B. Bovengisting met Weizen-gist ✅
C. Spontane gisting
D. Mixed fermentation zonder esters

""",
    8: """### Vraag 2

Twee bieren hebben IBU 40. Eén proef je veel bitterder. Wat verklaart dat het vaakst?

A. Hoger alcohol
B. Minder moutzoetheid ✅
C. Meer koolzuur
D. Donkerdere kleur

""",
    14: """### Vraag 3

Blind proef je hoog alcohol maar licht mondgevoel. Welke stijl past het best?

A. Barleywine
B. Tripel ✅
C. Imperial Stout
D. Bock

""",
    35: """### Vraag 2

Een gast bestelt blauwschimmelkaas. Welke pairing adviseer je het meest?

A. Pils
B. Dubbel of Quadrupel ✅
C. Licht witbier zonder body
D. NEIPA met weinig bitterheid

""",
    38: """### Vraag 1

Blind: frisse afdronk, weinig esters, strak koolzuur. Wat wed je?

A. Belgische Tripel
B. Pils of Lager ✅
C. Weizen
D. Barleywine

""",
    39: """### Vraag 1

Blind: donkere kleur, koffie en roast, weinig hoparoma. Wat wed je?

A. IPA
B. NEIPA
C. Stout of Porter ✅
D. Pils

""",
}
