"""Wine Track V2 Gold Master — lessons 1-10 (Modules 1-2: Fundament & Productie)."""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    1: {
        "theorie": (
            "Wijn begrijpen begint niet bij smaak, maar bij definitie: wijn is een alcoholische drank "
            "die ontstaat doordat gist druivensuikers omzet in alcohol en koolzuur. Dat ene biologische "
            "proces — fermentatie — is meteen het onderscheid met bier (gemaakt uit graan) en "
            "gedistilleerde drank (verhit na gisting). Wie deze kern mist, verwart later categorieën, "
            "productiemethodes en kwaliteitsniveaus door elkaar.\n\n"
            "Het mechanisme zelf vraagt geen kunstgreep: een gistcultuur — van nature aanwezig op de "
            "druif of bewust toegevoegd in de kelder — eet de druivensuikers op en laat alcohol en "
            "koolzuur achter. Niets wordt kunstmatig samengesteld om die alcohol te creëren; ze zit al "
            "potentieel besloten in de druif zodra suikerniveau en gistactiviteit samenkomen. Dat maakt "
            "wijn in de kern een agrarisch product met een biologische omzetting, geen industrieel "
            "recept.\n\n"
            "Hoe je dat gebruikt: bij elk etiket of elke wijnkaart kun je nu de vraag stellen welke "
            "keuzes die fermentatie hebben gestuurd — welke druif, welk klimaat, welke gistkeuze, welke "
            "stop- of doorzettingsbeslissing. Dat verandert je blik van 'vind ik dit lekker of niet' "
            "naar 'ik herken een productieketen van beslissingen die tot dit glas hebben geleid'. Die "
            "keten begint in de wijngaard en eindigt pas bij het etiket in je hand.\n\n"
            "Je gebruikt deze definitie elke keer dat je moet uitleggen waarom wijn complex aanvoelt "
            "ondanks de simpele basisformule suiker-naar-alcohol: complexiteit zit in de duizenden "
            "kleine beslissingen rond dat ene proces, niet in het proces zelf. Zodra je dat onderscheid "
            "scherp hebt, wordt elke volgende les in deze track een uitbreiding van diezelfde "
            "productieketen."
        ),
        "samenvatting": (
            "- Wijn ontstaat door fermentatie: gist zet druivensuikers om in alcohol en koolzuur\n"
            "- Niets wordt kunstmatig toegevoegd om alcohol te creëren — het is een biologisch proces\n"
            "- Wijn is in de kern een agrarisch product, geen industrieel recept\n"
            "- Complexiteit ontstaat uit de keuzes rond dat ene proces, niet uit het proces zelf\n"
            "- Elk etiket vertelt een stukje van de productieketen die tot het glas leidde"
        ),
        "pro_insight": (
            "Gasten die wijn 'ingewikkeld' vinden, denken vaak dat er een verborgen recept achter zit. "
            "Leg uit dat de basis één biologisch proces is — fermentatie — en dat complexiteit ontstaat "
            "uit keuzes, niet uit chemie; dat verlaagt drempelangst sneller dan een opsomming van "
            "druivenrassen."
        ),
        "reflectievraag": (
            "Een gast vraagt of wijn 'kunstmatig' wordt aangemaakt — met welke twee zinnen leg jij "
            "fermentatie uit als natuurlijk proces zonder technisch te worden?"
        ),
        "kernbegrippen": ["fermentatie", "druivensuikers", "gistcultuur", "agrarisch product", "productieketen"],
        "quiz_patches": (
            "### Vraag 4\n\n"
            "Een gast beweert dat wijn 'modern bedacht' is en pas een paar honderd jaar bestaat. Wat is "
            "het beste weerwoord?\n\n"
            "A. Wijn bestaat hooguit duizend jaar en is dus relatief modern\n"
            "B. Wijncultuur gaat meer dan zesduizend jaar terug, tot ver vóór geschreven geschiedenis ✅\n"
            "C. Wijn bestaat pas sinds de uitvinding van de glazen fles\n"
            "D. Wijn is pas ontstaan na de Romeinse tijd\n\n"
        ),
    },
    2: {
        "theorie": (
            "Begrijpen hoe wijn ontstaat is de ruggengraat van deze hele track: zonder die basisvolgorde "
            "kun je straks geen enkele keuze over druiven, gisting of hout in de juiste context "
            "plaatsen. Elke latere les bouwt voort op de stappen die hier worden gelegd.\n\n"
            "Het proces loopt in een vaste keten: oogst, persing, fermentatieproces, rijpingskeuze en "
            "bottelen. Oogsttiming bepaalt hoeveel suiker en zuur de druif heeft op het moment dat hij "
            "wordt geplukt; persing bepaalt hoeveel sap — de most — uit de druif vrijkomt en hoeveel "
            "contact dat sap met schillen krijgt.\n\n"
            "Hoe je dat gebruikt: proef je een wijn die fris en direct aanvoelt, dan vermoed je een "
            "vroege oogsttiming en een kort, gecontroleerd fermentatieproces; proef je rijkdom en "
            "structuur, dan vermoed je een latere oogst en een bewustere rijpingskeuze na de gisting.\n\n"
            "Je valt op deze keten terug zodra je een onbekende wijn moet plaatsen zonder volledige "
            "productie-informatie: de basisvolgorde — oogst, persing, most, fermentatieproces, "
            "rijpingskeuze — vertelt je waar in het proces de stijl waarschijnlijk is bepaald."
        ),
        "samenvatting": (
            "- Wijn ontstaat via een vaste keten: oogst, persing, fermentatieproces, rijpingskeuze, bottelen\n"
            "- Oogsttiming bepaalt suiker- en zuurniveau van de druif\n"
            "- Persing levert de most op, met meer of minder schilcontact\n"
            "- Elke stap in de keten is een bewust beslissingsmoment, geen automatisme\n"
            "- De basisvolgorde helpt je een onbekende wijn te plaatsen zonder volledige productie-info"
        ),
        "pro_insight": (
            "Wanneer een gast vraagt waarom twee wijnen van dezelfde druif zo verschillend smaken, wijs "
            "dan niet alleen naar de druif maar naar de keten: oogsttiming en rijpingskeuze verklaren "
            "vaak meer dan het etiket laat zien."
        ),
        "reflectievraag": (
            "Welke stap in de productieketen — oogst, persing, fermentatieproces of rijpingskeuze — zou "
            "jij als eerste vraag stellen aan een producent om snel een wijnstijl te voorspellen?"
        ),
        "kernbegrippen": ["oogsttiming", "persing", "most", "fermentatieproces", "rijpingskeuze"],
        "quiz_patches": (
            "### Vraag 4\n\n"
            "Een gast wil weten waarom 'oogstjaar' zoveel invloed heeft op de uiteindelijke wijn. Wat is "
            "het beste antwoord?\n\n"
            "A. Oogsttiming bepaalt suiker- en zuurniveau van de druif vóór elke volgende stap ✅\n"
            "B. Het jaar bepaalt alleen het etiket, niet de smaak\n"
            "C. Oogstjaar verandert enkel de flesvorm\n"
            "D. Oogsttiming heeft geen invloed zolang er maar wordt geperst\n\n"
        ),
    },
    3: {
        "theorie": (
            "Je moet de drie hoofdfamilies van wijn foutloos kunnen onderscheiden vóór je dieper een "
            "van die werelden induikt — anders mis je het overkoepelende kader waarin Mousserend en "
            "Port straks passen binnen Way of Tasting.\n\n"
            "Stille wijn ondergaat één fermentatie zonder verdere ingreep op koolzuur of alcohol. "
            "Mousserende wijn krijgt een tweede gisting of toevoeging die koolzuur vastlegt in de fles "
            "of tank. Versterkte wijn krijgt extra alcohol toegevoegd, vaak om de gisting te "
            "onderbreken en restsuiker te bewaren.\n\n"
            "Hoe je dat herkent op etiket of in het glas: bubbels wijzen op die tweede gisting; een "
            "hoger alcoholpercentage — vaak rond achttien tot twintig procent — gecombineerd met "
            "merkbare restsuiker wijst op versterkte wijn; de afwezigheid van beide wijst op stille "
            "wijn, wereldwijd de meest voorkomende categorie.\n\n"
            "Deze driedeling is een startpunt, geen eindpunt: zodra je een van deze categorieën wilt "
            "verdiepen — de methode achter de bubbels of de fortificatielogica van versterkte wijn — "
            "schakel je over naar de bijbehorende subtrack, waar productie in volle diepte wordt "
            "behandeld."
        ),
        "samenvatting": (
            "- Stille wijn: één fermentatie, geen extra ingreep op koolzuur of alcohol\n"
            "- Mousserend: tweede gisting legt koolzuur vast\n"
            "- Versterkt: extra toegevoegde alcohol, vaak met behoud van restsuiker\n"
            "- Etiket en glas geven snel hints: bubbels, alcoholpercentage, zoetheid\n"
            "- Verdieping van elke categorie volgt in de aparte subtracks binnen Way of Tasting"
        ),
        "pro_insight": (
            "Een gast die zegt 'ik hou niet van wijn' heeft vaak maar één van de drie categorieën "
            "geproefd. Vraag door op stille, mousserende of versterkte wijn vóór je een fles aanraadt — "
            "dat voorkomt dat je dezelfde afwijzing herhaalt."
        ),
        "reflectievraag": (
            "Welke van de drie hoofdcategorieën heb jij zelf het minst geproefd, en welke fles zou je "
            "deze week kiezen om dat gat te dichten?"
        ),
        "kernbegrippen": ["stille wijn", "tweede gisting", "koolzuur", "versterkte wijn", "restsuiker"],
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een gast aan de bar wil 'iets zonder bubbels, maar wel met wat extra pit'. Welke categorie "
            "stel jij voor?\n\n"
            "A. Mousserende wijn\n"
            "B. Stille of versterkte wijn, afhankelijk van hoeveel 'pit' gewenst is ✅\n"
            "C. Altijd Champagne\n"
            "D. Een wijn zonder alcohol\n\n"
        ),
    },
    4: {
        "theorie": (
            "Wijngeschiedenis is geen trivia maar een verklaring: ze laat zien waarom huidige "
            "wijnwetgeving, klassieke regio's en eeuwenoude tradities zijn zoals ze nu zijn. Wie die "
            "lijn niet kent, ziet 'oude wijngaarden' als marketing in plaats van als verklaring.\n\n"
            "De oudste sporen van wijnbouw komen uit Georgië, waar kleivaten — qvevri — al duizenden "
            "jaren worden gebruikt om druivensap te laten vergisten en rijpen. Vanuit het Middellandse "
            "Zeegebied verspreidden de Grieken wijncultuur via handel en kolonisatie; de Romeinse "
            "wijnbouw professionaliseerde aanplant en infrastructuur door bijna heel Europa.\n\n"
            "In de middeleeuwen bewaarde de kloostertraditie wijnkennis toen veel andere structuren "
            "wegvielen: monniken legden wijngaarden aan, documenteerden methodes en bouwden de "
            "kennisbasis die latere generaties overnamen.\n\n"
            "Je gebruikt deze geschiedenis als contextlaag bij elk gesprek over 'traditie': zodra je een "
            "wijnregio in Frankrijk, Italië, Spanje of Portugal ziet, weet je dat de wortels vaak "
            "teruggaan op Romeinse wijnbouw en kloostertraditie — dat verklaart waarom precies deze "
            "landen de klassieke wetgeving en classificatiesystemen hebben opgebouwd."
        ),
        "samenvatting": (
            "- De oudste sporen van wijnbouw komen uit Georgië, met kleivaten (qvevri)\n"
            "- Grieken verspreidden wijncultuur via handel en kolonisatie\n"
            "- Romeinse wijnbouw professionaliseerde aanplant en infrastructuur in Europa\n"
            "- Kloostertraditie bewaarde wijnkennis tijdens de middeleeuwen\n"
            "- Klassieke wijnlanden bouwen vandaag nog voort op die historische lijn"
        ),
        "pro_insight": (
            "Verkoop 'oude wijngaarden' niet als marketingtaal maar als historisch feit: leg uit dat "
            "Romeinse wijnbouw en kloostertraditie de basis legden voor de wetgeving die vandaag nog "
            "regio's beschermt."
        ),
        "reflectievraag": (
            "Welk land associeer jij zelf als eerste met wijn, en hoeveel van die associatie komt "
            "daadwerkelijk uit Romeinse wijnbouw of kloostertraditie?"
        ),
        "kernbegrippen": ["Georgië", "qvevri", "Romeinse wijnbouw", "kloostertraditie", "wijngeschiedenis"],
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een gast zegt dat wijn 'gewoon landbouw' is zonder culturele waarde. Wat is het sterkste "
            "weerwoord?\n\n"
            "A. Wijn is uitsluitend landbouw, cultuur speelt geen rol\n"
            "B. Wijngeschiedenis toont dat landbouw en cultuur al duizenden jaren samen optrekken, van "
            "Georgië tot de kloostertraditie ✅\n"
            "C. Wijn is pas cultuur geworden na de twintigste eeuw\n"
            "D. Cultuur en landbouw hebben nooit iets met elkaar te maken gehad\n\n"
        ),
    },
    5: {
        "theorie": (
            "Voor je dieper in druiven, structuur en service duikt, moet je de zes hoofdcategorieën "
            "foutloos kunnen plaatsen — elke volgende module in deze track bouwt voort op deze indeling "
            "per wijncategorie.\n\n"
            "Witte wijn ontstaat doorgaans zonder lang schilcontact en is daardoor meestal frisser en "
            "lichter van kleur. Rode wijn vergist juist mét de schillen mee, waardoor kleurstoffen en "
            "tannine tijdens de gisting worden geëxtraheerd. Rosé krijgt kort schilcontact of een "
            "lichte, vroege pers — rosévinificatie zit smaaktechnisch tussen wit en rood in.\n\n"
            "Mousserend voegt koolzuur toe via een tweede proces; versterkt krijgt extra alcohol; zoete "
            "wijn behoudt bewust restsuiker via late oogst, edelrot of een onderbroken gisting. Elke "
            "keuze is een bewuste stijlbeslissing, geen toeval.\n\n"
            "Bij een onbekende fles kijk je eerst naar kleur en etiket, dan naar stijlaanduidingen zoals "
            "droog of zoet, mousserend of stil, om de wijncategorie te bepalen vóór je verder denkt over "
            "druif of regio — categorie is je eerste filter, niet je laatste, en bepaalt direct "
            "serveertemperatuur en glaskeuze."
        ),
        "samenvatting": (
            "- Wit: doorgaans weinig schilcontact, fris en licht\n"
            "- Rood: schilcontact tijdens gisting geeft kleur en tannine\n"
            "- Rosé: kort schilcontact, smaak tussen wit en rood\n"
            "- Mousserend en versterkt zijn methode-gedreven categorieën, zoete wijn is een bewuste "
            "restsuikerkeuze\n"
            "- Wijncategorie is je eerste filter bij elk advies, vóór druif of regio"
        ),
        "pro_insight": (
            "Bouw een wijnkaart eerst op wijncategorie, dan op druif of regio — gasten kiezen sneller "
            "wanneer ze eerst stijl herkennen in plaats van een lijst druivenrassen te moeten "
            "doorworstelen."
        ),
        "reflectievraag": (
            "Welke van de zes categorieën schenk jij zelf het minst, en wat zou je moeten proeven om "
            "daar zelfverzekerder over te kunnen adviseren?"
        ),
        "kernbegrippen": ["schilcontact", "tannine", "rosévinificatie", "restsuiker", "wijncategorie"],
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een gast wil een lichte wijn als aperitief, zonder veel tannine of alcohol. Welke categorie "
            "ligt het meest voor de hand?\n\n"
            "A. Versterkte wijn\n"
            "B. Witte wijn ✅\n"
            "C. Tawny-stijl wijn\n"
            "D. Zware rode wijn met lange houtlagering\n\n"
        ),
    },
    6: {
        "theorie": (
            "Nu je de categorieën kent, moet je het complete basisproces van druif tot fles kunnen "
            "reconstrueren — die productiestappen zijn de ruggengraat van elke verdiepende module die "
            "hierna volgt.\n\n"
            "Na de oogst volgen selectie en ontsteling: de stelen worden verwijderd om bittere, groene "
            "tonen te vermijden. Daarna komt persing, waarbij sap vrijkomt. Bij witte wijn wordt dat sap "
            "meestal snel van de schillen gescheiden zodat kleur en tannine beperkt blijven.\n\n"
            "Bij rode wijn vergist het sap juist mee met de schillen: schilcontact tijdens de gisting "
            "zorgt voor extractie van kleurstoffen en tannine. Dat verklaart meteen waarom rode wijn "
            "vrijwel altijd meer kleur en grip heeft dan witte wijn, los van het druivenras.\n\n"
            "Je valt op deze productiestappen terug zodra een gast vraagt waarom rode wijn anders is "
            "dan witte: het antwoord zit niet alleen in de druif, maar vooral in het moment waarop "
            "schilcontact stopt of net begint."
        ),
        "samenvatting": (
            "- Na de oogst volgen selectie, ontsteling en persing\n"
            "- Bij witte wijn wordt het sap snel van de schillen gescheiden\n"
            "- Bij rode wijn vergist het sap mee met de schillen: extractie van kleur en tannine\n"
            "- Schilcontact, niet alleen het druivenras, verklaart het verschil tussen wit en rood\n"
            "- Elke productiestap is een apart beslissingsmoment voor stijl en kwaliteit"
        ),
        "pro_insight": (
            "Als een gast vraagt waarom rode wijn 'zwaarder' aanvoelt dan wit van dezelfde druif, wijs "
            "naar schilcontact en extractie — niet naar de druif alleen. Dat antwoord klopt vaker en "
            "klinkt overtuigender."
        ),
        "reflectievraag": (
            "Bij welke productiestap — ontsteling, persing of schilcontact — zou een kleine wijziging "
            "volgens jou het grootste verschil maken in het eindresultaat?"
        ),
        "kernbegrippen": ["ontsteling", "schilcontact", "extractie", "persing", "productiestappen"],
        "quiz_patches": (
            "### Vraag 2\n\n"
            "Twee wijnen van dezelfde druif: één wit, één rood. Beide zijn geperst. Wat verklaart het "
            "grootste smaakverschil hierna?\n\n"
            "A. Het soort fles waarin ze worden gebotteld\n"
            "B. Of het sap wel of niet met de schillen blijft vergisten ✅\n"
            "C. De kleur van het etiket\n"
            "D. De hoeveelheid water die wordt toegevoegd\n\n"
        ),
    },
    7: {
        "theorie": (
            "Gisting is de enige stap waar alcohol daadwerkelijk ontstaat — zonder dit proces te "
            "begrijpen kun je geen stijlverschil verklaren tussen wijnen die qua druif en regio verder "
            "identiek zouden moeten zijn.\n\n"
            "Gistcellen zetten suiker om in alcohol, koolzuur en warmte; die koolzuurontwikkeling is "
            "hetzelfde mechanisme dat bij mousserende wijn bewust wordt vastgehouden. "
            "Fermentatietemperatuur stuurt het resultaat sterk: koel vergisten — vaker bij witte wijn — "
            "bewaart fris fruit en aroma, warmer vergisten — vaker bij rode wijn — geeft meer extractie "
            "en structuur.\n\n"
            "Gisting stopt op twee manieren: vanzelf, wanneer alle suiker is omgezet, of door een "
            "bewuste gistingsstop — via koeling, filtratie of, bij versterkte stijlen, door toevoeging "
            "van alcohol. Beide routes zijn legitiem; het verschil bepaalt of er restsuiker overblijft.\n\n"
            "Je gebruikt deze kennis bij elke vraag over alcoholpercentage of zoetheid: beide zijn "
            "rechtstreeks het resultaat van hoever en hoe snel die ene gisting is doorgelopen vóór de "
            "gistingsstop intrad."
        ),
        "samenvatting": (
            "- Gistcellen zetten suiker om in alcohol, koolzuur en warmte\n"
            "- Fermentatietemperatuur stuurt frisheid (koel) versus structuur (warm)\n"
            "- Koolzuurontwikkeling tijdens gisting is dezelfde basis als bij mousserende wijn\n"
            "- Gisting stopt vanzelf of via een bewuste gistingsstop\n"
            "- Restsuiker is het directe gevolg van wanneer en hoe gisting wordt onderbroken"
        ),
        "pro_insight": (
            "Proef je restsuiker in een wijn die niet als 'zoet' wordt verkocht, ga dan uit van een "
            "bewuste gistingsstop, geen fout. Leg dat zo aan gasten uit — het voorkomt onterechte "
            "twijfel over kwaliteit."
        ),
        "reflectievraag": (
            "Stel je een gisting voor die een dag te vroeg wordt gestopt — wat verandert er volgens jou "
            "aan alcohol én restsuiker in het eindresultaat?"
        ),
        "kernbegrippen": [
            "gistcellen",
            "fermentatietemperatuur",
            "koolzuurontwikkeling",
            "gistingsstop",
            "restsuiker",
        ],
        "quiz_patches": (
            "### Vraag 5\n\n"
            "Een gast proeft duidelijke restsuiker in een wijn die als 'droog' op de kaart staat. Wat is "
            "de meest waarschijnlijke verklaring?\n\n"
            "A. De fles is bedorven\n"
            "B. De gistingsstop kwam eerder dan verwacht, vóór alle suiker was omgezet ✅\n"
            "C. Er is achteraf suiker toegevoegd\n"
            "D. De druif bevatte van nature geen suiker\n\n"
        ),
    },
    8: {
        "theorie": (
            "Houtlagering is een van de meest zichtbare stijlkeuzes op een etiket — 'gerijpt op eik' — "
            "en je moet weten wat dat daadwerkelijk doet vóór je het automatisch als kwaliteitskeurmerk "
            "leest.\n\n"
            "Eikenhout geeft houtaroma zoals vanille, toost, rook en kruiden, afhankelijk van het "
            "vattype en de vatleeftijd: hoe vaker een vat al gebruikt is, hoe minder uitgesproken smaak "
            "het nog afgeeft. Daarnaast laat hout langzaam zuurstof door — die zuurstofdoorlaat "
            "ondersteunt tanninezachting en helpt de wijn integreren.\n\n"
            "Nieuw hout geeft veel directe smaak; oud, al meermaals gebruikt hout geeft vooral textuur "
            "zonder dominante houtaroma. Geen van beide is per definitie beter — het is een stijlkeuze "
            "die past bij het beoogde resultaat.\n\n"
            "Hoe je dat herkent: proef je sterke vanille en toost, dan is relatief nieuw eikenhout "
            "waarschijnlijk; proef je vooral een rondere, zachtere structuur zonder uitgesproken "
            "houtaroma, dan wijst dat op hogere vatleeftijd. Niet elke wijn heeft hout nodig — dat "
            "verdiep je verder in de productie- en stijlsubtracks."
        ),
        "samenvatting": (
            "- Eikenhout geeft houtaroma zoals vanille, toost, rook en kruiden\n"
            "- Zuurstofdoorlaat via hout ondersteunt tanninezachting\n"
            "- Vatleeftijd bepaalt hoeveel houtaroma nog wordt afgegeven\n"
            "- Nieuw hout geeft veel smaak; oud hout geeft vooral textuur\n"
            "- Niet elke wijn heeft houtlagering nodig — het is een stijlkeuze"
        ),
        "pro_insight": (
            "Vraag bij 'gerijpt op eik' op het etiket altijd door naar vatleeftijd, niet alleen "
            "houtsoort — een oud vat geeft een heel ander resultaat dan een nieuw, ook al staat er "
            "dezelfde tekst."
        ),
        "reflectievraag": (
            "Bij welke wijn op je lijst zou jij verwachten dat nieuw eikenhout is gebruikt, en bij "
            "welke juist ouder hout — en waarom?"
        ),
        "kernbegrippen": ["eikenhout", "houtaroma", "tanninezachting", "zuurstofdoorlaat", "vatleeftijd"],
        "quiz_patches": (
            "### Vraag 4\n\n"
            "Een gast proeft twee houtgerijpte wijnen: de ene heeft sterke vanille en toost, de andere "
            "vooral een zachte, ronde structuur zonder uitgesproken houtsmaak. Wat is de meest logische "
            "verklaring?\n\n"
            "A. Beide zijn gerijpt in exact hetzelfde vat\n"
            "B. Het verschil in vatleeftijd: relatief nieuw hout versus al vaker gebruikt hout ✅\n"
            "C. Eén wijn heeft helemaal geen houtcontact gehad\n"
            "D. Het verschil komt alleen door de druif, niet door het hout\n\n"
        ),
    },
    9: {
        "theorie": (
            "Zuurstof is een van de stuurinstrumenten die een wijnmaker bewust inzet of net vermijdt — "
            "het verschil tussen oxidatieve wijnmaking en reductieve wijnmaking verklaart waarom twee "
            "wijnen van dezelfde druif totaal anders kunnen ruiken.\n\n"
            "Bij oxidatieve wijnmaking krijgt de wijn bewust zuurstofcontact, wat fruit langzaam "
            "verschuift richting notige aroma's, karamel en rijpere, gedroogde tonen. Bij reductieve "
            "wijnmaking wordt zuurstofcontact juist zo veel mogelijk vermeden — vaak via inerte tanks "
            "of vroege botteling — om primair fruit en frisheid te bewaren.\n\n"
            "Hoe je dat herkent: ruik je notige aroma's, gedroogd fruit of karamel, dan wijst dat op "
            "oxidatieve invloed, vaak gecombineerd met houtlagering of langere tankrijping. Ruik je "
            "vooral fris, primair fruit en weinig rijpingstonen, dan wijst dat op een reductieve "
            "aanpak.\n\n"
            "Je gebruikt dit onderscheid telkens wanneer je moet verklaren waarom een wijn 'ouder' of "
            "'notiger' ruikt zonder dat de fles per se oud is — vaak is het een bewuste productiekeuze, "
            "geen leeftijdskenmerk."
        ),
        "samenvatting": (
            "- Oxidatieve wijnmaking geeft bewust zuurstofcontact\n"
            "- Reductieve wijnmaking vermijdt zuurstofcontact om fruit en frisheid te bewaren\n"
            "- Notige aroma's en karamel wijzen op oxidatieve invloed\n"
            "- Primair fruit en frisheid wijzen op een reductieve aanpak\n"
            "- Het onderscheid is een productiekeuze, geen toevalligheid of fout"
        ),
        "pro_insight": (
            "Leer gasten dat 'oud ruikend' niet altijd 'oud' betekent: oxidatieve wijnmaking kan al bij "
            "een jonge wijn notige tonen geven. Dat voorkomt verwarring tussen productiestijl en "
            "daadwerkelijke leeftijd."
        ),
        "reflectievraag": (
            "Bij welke wijn die je kent, twijfel je nog of de notige tonen door oxidatieve wijnmaking "
            "komen of door pure leeftijd — en hoe zou je dat verschil checken?"
        ),
        "kernbegrippen": [
            "oxidatieve wijnmaking",
            "reductieve wijnmaking",
            "zuurstofcontact",
            "notige aroma's",
            "primair fruit",
        ],
        "quiz_patches": (
            "### Vraag 3\n\n"
            "Je ruikt aan twee jonge wijnen van hetzelfde jaar: de ene ruikt fris en fruitig, de andere "
            "al naar noten en karamel. Wat is de meest logische verklaring?\n\n"
            "A. De notige wijn is per ongeluk bedorven\n"
            "B. De notige wijn kreeg bewust meer zuurstofcontact tijdens de wijnmaking ✅\n"
            "C. Beide wijnen zijn identiek geproduceerd\n"
            "D. Fris ruiken betekent altijd een hogere kwaliteit\n\n"
        ),
    },
    10: {
        "theorie": (
            "Je moet kunnen voorspellen wat tijd met een wijn doet — niet elke fles wordt automatisch "
            "beter, en die inschatting is een kernvaardigheid voor advies en bewaaradvies aan gasten.\n\n"
            "Tijdens rijping wordt primair fruit minder dominant, integreren zuren beter en verzachten "
            "tannines — die tanninezachting maakt structuur ronder. Tegelijk ontstaan nieuwe, tertiaire "
            "aroma's zoals leer, tabak, honing of gedroogd fruit, die er bij een jonge wijn nog niet "
            "waren.\n\n"
            "Dat proces verloopt geleidelijk en hangt af van de structuurbalans waarmee de wijn begon: "
            "voldoende zuur, tannine of concentratie is nodig om verandering te kunnen dragen zonder "
            "uit elkaar te vallen.\n\n"
            "Hoe je dat inschat: een wijn met hoge zuur, stevige tannine of concentratie heeft meer "
            "bewaarpotentieel dan een lichte, fruitgedreven wijn die vooral gemaakt is om jong gedronken "
            "te worden. Vraag bij twijfel altijd of de structuurbalans sterk genoeg is om jaren te "
            "overbruggen, vóór je een fles wegzet."
        ),
        "samenvatting": (
            "- Tijdens rijping wordt primair fruit minder dominant\n"
            "- Tanninezachting maakt structuur ronder en geïntegreerder\n"
            "- Tertiaire aroma's zoals leer, tabak en honing ontstaan door tijd\n"
            "- Structuurbalans bij aanvang bepaalt hoeveel een wijn kan rijpen\n"
            "- Niet elke wijn wordt beter met leeftijd — balans is bepalend, niet tijd alleen"
        ),
        "pro_insight": (
            "Geef nooit bewaaradvies op basis van prijs of reputatie alleen — check eerst "
            "structuurbalans: zuur, tannine en concentratie voorspellen bewaarpotentieel veel beter dan "
            "het etiket."
        ),
        "reflectievraag": (
            "Zou jij een fles uit je eigen voorraad nog vijf jaar laten liggen? Welk structuurelement "
            "gebruik je om dat te beslissen?"
        ),
        "kernbegrippen": [
            "primair fruit",
            "tertiaire aroma's",
            "tanninezachting",
            "bewaarpotentieel",
            "structuurbalans",
        ],
        "quiz_patches": (
            "### Vraag 4\n\n"
            "Een gast vraagt of een lichte, fruitgedreven wijn met laag zuur tien jaar kan worden "
            "bewaard. Wat is het beste advies?\n\n"
            "A. Ja, alle wijn wordt automatisch beter met leeftijd\n"
            "B. Waarschijnlijk niet — onvoldoende structuurbalans om de verandering te dragen ✅\n"
            "C. Alleen als de fles duur was\n"
            "D. Alleen als het een witte wijn is\n\n"
        ),
    },
}
