"""Rosé Wine Track V2 — Premium Gold Master repair data.

Lessen 11–25 (Modules 3–5):
- Module 3 — Proeven (11–15)
- Module 4 — Klassieke stijlen (16–20): Provence, Tavel, Rosado (Spanje),
  Rosato (Italië), Nieuwe Wereld rosé
- Module 5 — Druivenrassen (21–25): Grenache, Cinsault, Syrah, Mourvèdre,
  Tempranillo rosado

Structuur per les (zelfde patroon als de red_v2/wit_v2/wine_v2 m3_m5
repair-data):
- theorie, samenvatting, pro_insight, reflectievraag, kernbegrippen (5 items)
- food_pairing (alleen 16–25) via fp()
- LES 15 is de integratie-toets van Module 3 en bevat aanvullend een
  volledige praktijkopdracht (praktijk), een volledig vervangen quiz
  (quiz_full, 10 vragen) en quiz_feedback

Rosé wordt hier consequent als eigen specialistische categorie behandeld —
niet als "lichte rode wijn": kleur (tint + intensiteit) i.p.v. rand-en-kern,
primaire aromadominantie i.p.v. drielagenmodel, en zuur als hoofdas met
optionele fenolische textuur i.p.v. tannine als vaste structuuras.
"""

from __future__ import annotations


def fp(best: str, waarom: str, vermijd: str) -> str:
    return (
        f"### Beste pairing\n\n{best}\n\n"
        f"### Waarom dit werkt\n\n{waarom}\n\n"
        f"### Vermijd\n\n{vermijd}"
    )


REPAIRS: dict[int, dict] = {
    # ------------------------------------------------------------------
    # Module 3 — Proeven (11–15) — GEEN food_pairing
    # ------------------------------------------------------------------
    11: {
        "theorie": (
            "Het proefprotocol voor rosé volgt dezelfde basisvolgorde als bij elke wijn — "
            "visueel, neus, mond, conclusie — maar rosé vraagt een eigen leesstrategie omdat "
            "de categorie tussen wit en rood in staat zonder de vaste ankers van beide: er is "
            "meestal geen dominante tannine-as zoals bij rood en geen dominante schaal van "
            "citrus-tot-tropisch zoals bij wit. Wie het protocol klakkeloos overneemt van rood "
            "of wit, mist precies de signalen die rosé specifiek maken.\n\n"
            "Visueel is bij rosé het meest informatiedichte moment van de hele proef: de tint "
            "(bleek zalm tot cerise tot lichte ui-schil-oranje) en de intensiteit verraden "
            "direct de productiemethode — korte huidcontacttijd bij directe pers versus "
            "langere maceratie of saignée — nog vóór je iets geroken hebt. Werk daarom altijd "
            "tegen een witte achtergrond met consistent licht, en beschrijf tint en intensiteit "
            "als twee aparte variabelen in plaats van één vage kleurindruk.\n\n"
            "Bij de neus ruik je bij voorkeur direct na het inschenken, zonder lang te wachten: "
            "de meeste rosé is jong, ongehout en primair fruitgedreven, waardoor de meest "
            "bepalende aroma's vluchtig zijn en snel verdampen. Swirlen blijft nuttig om esters "
            "te openen, maar het tweefasen-ruiken dat bij rood essentieel is (om "
            "tanninegebonden aroma's los te maken) is bij rosé minder kritiek omdat er "
            "simpelweg minder gebonden aromastof aanwezig is.\n\n"
            "In de mond verschuift de volgorde ten opzichte van rood: eerst zuur (de dominante "
            "structuuras bij vrijwel elke rosé), dan een lichte fenolische grip als die "
            "aanwezig is (afkomstig van langere schilcontacttijd, nooit vanzelfsprekend zoals "
            "bij rood), dan alcohol, dan body, en pas daarna lengte en conclusie. Behandel die "
            "fenolische grip nadrukkelijk als optioneel signaal, niet als vaste as — anders ga "
            "je onterecht op zoek naar tannine die er simpelweg niet is."
        ),
        "samenvatting": (
            "- Protocol blijft visueel, neus, mond, conclusie — rosé heeft geen vaste tannine- "
            "of intensiteitsas zoals rood of wit\n"
            "- Tint en intensiteit zijn twee aparte variabelen die samen de productiemethode "
            "verraden\n"
            "- Ruik direct na inschenken: primaire aroma's bij jonge, ongehoute rosé zijn "
            "vluchtig\n"
            "- Mondvolgorde: eerst zuur, dan optionele fenolische grip, dan alcohol, dan body\n"
            "- Behandel fenolische grip als uitzondering, niet als vaste structuuras zoals "
            "tannine bij rood"
        ),
        "pro_insight": (
            "Noteer tint en intensiteit als twee losse observaties vóórdat je aan de neus "
            "begint — die twee variabelen alleen al geven je een eerste, onderbouwde "
            "hypothese over de productiemethode."
        ),
        "kernbegrippen": [
            "roséproefprotocol",
            "tint-intensiteit-scheiding",
            "primair-aromavolatiliteit",
            "optionele-fenolische-grip",
            "productiehypothese-vooraf",
        ],
        "reflectievraag": (
            "Betrap jij jezelf er weleens op dat je bij rosé automatisch naar tannine zoekt "
            "zoals bij rood, of naar een fruitschaal zoals bij wit — in plaats van de "
            "categorie op haar eigen merites te proeven?"
        ),
    },
    12: {
        "theorie": (
            "Kleur is bij rosé het meest diagnostische signaal van het hele glas, maar ook het "
            "signaal dat het makkelijkst wordt gemanipuleerd — en dat onderscheid moet je als "
            "specialist scherp maken. Lees kleur daarom altijd als twee aparte variabelen: "
            "tint (de kleurtoon zelf, van bleek zalm via framboos naar cerise en zelfs licht "
            "ui-schil-oranje) en intensiteit (hoe diep of licht die tint is), in plaats van als "
            "één vage indruk.\n\n"
            "Tint en intensiteit correleren sterk met productiemethode: directe pers met "
            "minimale huidcontacttijd geeft vrijwel altijd de bleekste, meest zalmkleurige "
            "resultaten, terwijl saignée (afgetapt sap van een rode-wijnvergisting) doorgaans "
            "een dieper, roder resultaat oplevert omdat het sap al langer met de schillen in "
            "contact is geweest vóór aftapping. Blending van witte en rode wijn — buiten "
            "Champagne wettelijk verboden voor stille rosé in de EU, maar elders wél "
            "toegestaan — kan een vergelijkbaar dieper resultaat geven zonder de bijbehorende "
            "schilcontact-aromatiek.\n\n"
            "Belangrijk: extreme bleekheid is tegenwoordig vaak een bewuste marketingkeuze — "
            "vooral in commerciële Provence-stijl rosé — en geen garantie voor kwaliteit of "
            "concentratie. Sommige producenten passen actieve ontkleuring toe "
            "(koolstoffiltratie, bentonietbehandeling) om een nog bleker resultaat te bereiken "
            "dan de natuurlijke extractie zou opleveren. Vertrouw kleur dus als eerste "
            "hypothese over productiemethode en stijl, nooit als eindoordeel over kwaliteit.\n\n"
            "Beoordeel de rand van het glas apart van de kern, net als bij rood en wit: bij "
            "jonge rosé is er nauwelijks verschil tussen rand en kern, maar een merkbare "
            "verkleuring richting oranje aan de rand kan wijzen op beginnende oxidatie — een "
            "signaal dat bij rosé, door de beperkte hoeveelheid beschermende antocyanen, "
            "sneller optreedt dan bij rood."
        ),
        "samenvatting": (
            "- Kleur bij rosé bestaat uit twee aparte variabelen: tint en intensiteit\n"
            "- Bleke, zalmkleurige rosé wijst meestal op directe pers; dieper roze op saignée "
            "of langere maceratie\n"
            "- Extreme bleekheid is vaak een bewuste marketingkeuze, geen garantie voor "
            "kwaliteit\n"
            "- Actieve ontkleuring (filtratie, bentoniet) kan de natuurlijke extractie "
            "overstemmen\n"
            "- Een oranje verkleuring aan de rand wijst bij rosé sneller op oxidatie dan bij "
            "rood"
        ),
        "pro_insight": (
            "Vraag jezelf bij een extreem bleke rosé altijd af of dat natuurlijke extractie is "
            "of bewuste ontkleuring — proef de intensiteit van het fruit in de mond om dat "
            "verschil te toetsen, want ontkleurde rosé toont vaak minder fruitconcentratie dan "
            "de kleur doet vermoeden."
        ),
        "kernbegrippen": [
            "tint-intensiteitmodel",
            "saignée-versus-directe-pers",
            "bewuste-ontkleuring",
            "commerciële-bleekheidstrend",
            "vroege-oxidatiesignalen",
        ],
        "reflectievraag": (
            "Welke rosé op jouw kaart zou je nu opnieuw beoordelen door je af te vragen of de "
            "bleekheid natuurlijk is, of het resultaat van een bewuste stijlkeuze?"
        ),
    },
    13: {
        "theorie": (
            "Bij rosé is de aromalaag bijna uitsluitend primair: doordat de meeste rosé binnen "
            "het jaar na de oogst wordt gebotteld en verkocht, zonder houtrijping en meestal "
            "zonder malolactische gisting, ontbreken de secundaire en tertiaire lagen die bij "
            "rood en gerijpt wit zo bepalend zijn. Wie bij rosé naar leer, boter of honing "
            "zoekt, proeft de verkeerde categorie — het ontbreken van die lagen is zelf al een "
            "diagnostisch signaal.\n\n"
            "Primaire aroma's vallen grofweg in vier families: rood fruit (aardbei, framboos, "
            "rode bes, kers) dat wijst op rijp, zongerijpt schilcontact; citrus (grapefruit, "
            "citroen, sinaasappelzest) dat wijst op een koeler klimaat of kortere "
            "schilcontacttijd; bloemen (roos, viooltjes) die vaak samen met rood fruit "
            "optreden bij Grenache-gedomineerde blends; en kruidigheid (witte peper, "
            "Provençaalse garrigue-kruiden) die wijst op de aanwezigheid van Syrah of "
            "Mourvèdre in de blend.\n\n"
            "De verhouding tussen deze vier families is het belangrijkste diagnostische "
            "signaal, niet de aanwezigheid van één losse descriptor: een rosé die overwegend "
            "citrus en bloemen toont zonder veel kruidigheid wijst eerder op een Cinsault- of "
            "Provence-georiënteerde stijl, terwijl een rosé met nadrukkelijke rood fruit én "
            "kruidigheid wijst op een Grenache-Syrah- of Tavel-achtige, meer body-rijke "
            "stijl.\n\n"
            "Let ook op de afwezigheid van secundaire/tertiaire signalen als kwaliteitscheck: "
            "een lichte vanilletoon kan wijzen op kort houtcontact (soms bewust toegepast bij "
            "premium Rioja rosado of sommige Provence-cuvées), maar een uitgesproken boter- of "
            "gistige toon bij een jonge, goedkope rosé wijst eerder op een productiefout dan op "
            "stijl."
        ),
        "samenvatting": (
            "- Rosé-aroma is bijna uitsluitend primair; secundaire en tertiaire lagen ontbreken "
            "doorgaans\n"
            "- Vier hoofdfamilies: rood fruit, citrus, bloemen, kruidigheid\n"
            "- De verhouding tussen deze families stuurt je druiven- en stijlhypothese\n"
            "- Citrus en bloemen wijzen eerder op Cinsault/Provence, rood fruit met kruiden op "
            "Grenache-Syrah/Tavel\n"
            "- Een onverwachte secundaire toon (boter, gist) bij jonge rosé wijst eerder op een "
            "fout dan op stijl"
        ),
        "pro_insight": (
            "Beoordeel bewust de verhouding tussen de vier aromafamilies in plaats van losse "
            "descriptors op te sommen — die verhouding alleen al brengt je dichter bij de "
            "druivensamenstelling dan een lijst met geïsoleerde geuren."
        ),
        "kernbegrippen": [
            "primaire-aromadominantie-rose",
            "vier-aromafamilies",
            "citrus-bloemen-signatuur",
            "kruidigheid-als-syrah-signaal",
            "afwezigheid-als-diagnostiek",
        ],
        "reflectievraag": (
            "Welke rosé zou jij nu opnieuw beoordelen door te letten op de verhouding tussen "
            "rood fruit, citrus, bloemen en kruidigheid, in plaats van op losse geuren?"
        ),
    },
    14: {
        "theorie": (
            "Structuur bij rosé draait primair om zuur, met een sterk variabele, optionele "
            "fenolische textuur als tweede as — een fundamenteel ander uitgangspunt dan bij "
            "rood, waar tannine de vaste centrale as is. Zuur bepaalt bij vrijwel elke rosé de "
            "frisheid en de lengte van de afdronk, en het niveau ervan hangt sterk af van "
            "klimaat: koelere gebieden (noordelijke Rhône-invloeden, sommige hooggelegen "
            "Provence-percelen) geven hogere zuren dan warme, vlakke terroirs.\n\n"
            "Fenolische textuur — een lichte, tastbare grip op tandvlees en tong — ontstaat "
            "alleen bij langere schilcontacttijd of extractie, zoals bij Tavel of sommige "
            "Bandol-achtige, Mourvèdre-gedomineerde stijlen. Bij kortstondige directe pers, "
            "zoals de meeste Provence-rosé, is deze textuur vrijwel afwezig en blijft de mond "
            "zuiver zuurgedreven. Verwar deze textuur nooit met tannine in de red-wijnzin: de "
            "intensiteit en de rol in de balans zijn wezenlijk kleiner en dienen als aanvullend "
            "signaal, niet als hoofdas.\n\n"
            "Alcohol en body volgen uit rijpheid en klimaat: warme-klimaat-rosé "
            "(Zuid-Frankrijk in warme jaargangen, Nieuwe Wereld) toont vaak hoger alcohol en "
            "meer body dan rosé uit koelere, hooggelegen percelen. Sommige stijlen, vooral "
            "buiten Europa, bevatten ook meetbare restsuiker, wat de indruk van body en "
            "zoetheid samen verandert — een vierde variabele die je apart moet benoemen naast "
            "zuur, textuur en alcohol.\n\n"
            "Beoordeel lengte als laatste stap: een korte afdronk wijst vaak op een eenvoudige, "
            "vroeg-drinkbare rosé, terwijl een lange, zuurgedreven afdronk met een subtiele "
            "fenolische nasleep wijst op een gastronomisch geambieerde stijl zoals Tavel of "
            "premium Bandol-rosé."
        ),
        "samenvatting": (
            "- Zuur is de dominante structuuras bij rosé; fenolische textuur is optioneel en "
            "variabel\n"
            "- Fenolische grip ontstaat alleen bij langere schilcontacttijd, zoals bij Tavel of "
            "Mourvèdre-stijlen\n"
            "- Verwar fenolische textuur nooit met tannine in de rode-wijnzin — de rol is "
            "wezenlijk kleiner\n"
            "- Alcohol en body hangen sterk samen met klimaat; restsuiker is een vierde, "
            "aparte variabele\n"
            "- Lengte van de afdronk onderscheidt eenvoudige van gastronomisch geambieerde "
            "stijlen"
        ),
        "pro_insight": (
            "Vraag jezelf bij elke rosé af of de textuur die je proeft echt fenolische grip "
            "is, of gewoon viscositeit door alcohol en (rest)suiker — die drie worden vaak "
            "verward maar hebben elk een andere oorzaak."
        ),
        "kernbegrippen": [
            "zuur-als-hoofdas-rose",
            "optionele-fenolische-textuur",
            "klimaatgedreven-alcoholopbouw",
            "restsuiker-als-vierde-variabele",
            "afdronklengte-als-stijlsignaal",
        ],
        "reflectievraag": (
            "Zou jij nu het verschil kunnen uitleggen tussen fenolische grip, viscositeit door "
            "alcohol, en een indruk van zoetheid door restsuiker, als iemand je dat aan tafel "
            "vraagt?"
        ),
    },
    15: {
        "theorie": (
            "Deze mini-toets bundelt alles wat rosé proeftechnisch uniek maakt: kleur als "
            "productie-hypothese, de vier primaire aromafamilies, en zuur als hoofdas met een "
            "optionele fenolische textuur als tweede laag. Elk van deze elementen vertelt een "
            "ander deel van hetzelfde verhaal, en pas samen leveren ze een betrouwbare "
            "stijlhypothese op — vóór je aan een specifieke regio of druif denkt.\n\n"
            "Kleur lees je als twee aparte variabelen: tint (bleek zalm tot cerise tot lichte "
            "oranje) en intensiteit, die samen een eerste hypothese geven over "
            "productiemethode (directe pers versus saignée of langere maceratie) en over "
            "eventuele bewuste ontkleuring. Onthoud dat extreme bleekheid tegenwoordig vaak "
            "een marketingkeuze is en geen garantie voor concentratie of kwaliteit.\n\n"
            "Aroma is bij rosé bijna uitsluitend primair: rood fruit, citrus, bloemen en "
            "kruidigheid, waarbij de onderlinge verhouding — niet losse descriptors — je "
            "dichter bij de druivensamenstelling brengt. Het ontbreken van secundaire of "
            "tertiaire lagen is zelf een diagnostisch signaal, geen tekortkoming.\n\n"
            "Structuur draait om zuur als hoofdas, met fenolische textuur, alcohol, body en "
            "eventuele restsuiker als aanvullende, apart te beoordelen variabelen. Het blinde "
            "protocol brengt dit samen in vaste volgorde: kleur (tint, intensiteit), aroma "
            "(primaire families en hun onderlinge verhouding), structuur (zuur, textuur, "
            "alcohol, body, restsuiker, lengte), en pas daarna een stijlhypothese. Documenteer "
            "die hypothese vóór de onthulling — dat is de enige manier om objectief te toetsen "
            "of je protocol standhoudt zonder etiket, en het fundament waarop Module 4 en 5 "
            "straks voortbouwen."
        ),
        "samenvatting": (
            "- Kleur (tint, intensiteit) geeft de eerste hypothese over productiemethode, geen "
            "kwaliteitsoordeel\n"
            "- Aroma is bijna uitsluitend primair: rood fruit, citrus, bloemen, kruidigheid, en "
            "hun onderlinge verhouding\n"
            "- Zuur is de hoofdas van de structuur; fenolische textuur, alcohol, body en "
            "restsuiker zijn aanvullend\n"
            "- Het blinde protocol volgt vaste volgorde: kleur, aroma, structuur, "
            "stijlhypothese\n"
            "- Documenteer je hypothese altijd vóór de onthulling van het etiket"
        ),
        "pro_insight": (
            "Documenteer bij elke blinde rosé eerst je stijlhypothese — mediterraan en "
            "zuurgedreven, of structuurrijker en body-rijk — vóór je nadenkt over een "
            "specifieke regio of druif. Dat voorkomt dat je te snel naar een naam raadt zonder "
            "de onderliggende opbouw te checken."
        ),
        "kernbegrippen": [
            "kleur-als-productiehypothese",
            "vier-aromafamilies-verhouding",
            "zuur-textuur-alcohol-body-model",
            "blind-roséprotocol",
            "stijlhypothese-vóór-onthulling",
        ],
        "reflectievraag": (
            "Welk van de drie elementen — kleur, aroma of structuur — vergeet jij het vaakst "
            "mee te wegen vóór je een conclusie trekt over een rosé?"
        ),
        "praktijk": (
            "### Opdracht\n\n"
            "Proef één rosé volledig blind (laat het etiket door iemand anders verbergen). "
            "Doorloop het volledige protocol zonder te gokken op een merknaam: beschrijf eerst "
            "tint en intensiteit apart, dan de aroma's volgens de vier families (rood fruit, "
            "citrus, bloemen, kruidigheid) en hun onderlinge verhouding, dan structuur (zuur, "
            "eventuele fenolische textuur, alcohol, body, eventuele restsuiker, lengte), en "
            "formuleer pas daarna een stijlhypothese — mediterraan en zuurgedreven of "
            "structuurrijker en body-rijk — inclusief een vermoeden over de productiemethode. "
            "Onthul de wijn pas na het opschrijven van je hypothese.\n\n"
            "### Checklist\n\n"
            "- Ik heb tint en intensiteit apart beschreven vóór ik aan de productiemethode "
            "dacht\n"
            "- Ik heb de vier aromafamilies apart benoemd en hun onderlinge verhouding "
            "vastgesteld\n"
            "- Ik heb zuur en eventuele fenolische textuur apart beoordeeld, niet als één "
            "geheel\n"
            "- Ik heb expliciet gecheckt op restsuiker als aparte variabele naast alcohol en "
            "body\n"
            "- Ik heb mijn stijlhypothese opgeschreven vóór de onthulling\n"
            "- Ik heb achteraf mijn grootste denkfout in één zin vastgelegd"
        ),
        "quiz_full": (
            "### Vraag 1\n\n"
            "Waarom is het proefprotocol voor rosé niet simpelweg een kopie van het protocol "
            "voor rode wijn?\n\n"
            "A. Omdat rosé geen zuur bevat\n"
            "B. Omdat tannine bij rosé geen vaste, dominante structuuras is zoals bij rood ✅\n"
            "C. Omdat rosé nooit blind geproefd mag worden\n"
            "D. Omdat rosé altijd gehout wordt\n\n"
            "### Vraag 2\n\n"
            "Wat vertelt de tint en intensiteit van een rosé je het eerst?\n\n"
            "A. Het exacte alcoholpercentage\n"
            "B. Een hypothese over de productiemethode ✅\n"
            "C. De exacte druif\n"
            "D. De prijs van de fles\n\n"
            "### Vraag 3\n\n"
            "Bleke, zalmkleurige rosé wijst meestal op:\n\n"
            "A. Saignée met lange schilcontacttijd\n"
            "B. Directe pers met korte schilcontacttijd ✅\n"
            "C. Houtrijping\n"
            "D. Oxidatie\n\n"
            "### Vraag 4\n\n"
            "Waarom is extreme bleekheid geen garantie voor kwaliteit?\n\n"
            "A. Bleke rosé is altijd goedkoop\n"
            "B. Bleekheid kan het resultaat zijn van bewuste ontkleuring, los van concentratie "
            "✅\n"
            "C. Bleke rosé bevat altijd meer suiker\n"
            "D. Bleekheid duidt altijd op oxidatie\n\n"
            "### Vraag 5\n\n"
            "Welke vier aromafamilies vormen de kern van primaire rosé-aromatiek?\n\n"
            "A. Boter, honing, toast, vanille\n"
            "B. Rood fruit, citrus, bloemen, kruidigheid ✅\n"
            "C. Leer, tabak, aarde, paddenstoel\n"
            "D. Tropisch fruit, steenfruit, noten, kruidnagel\n\n"
            "### Vraag 6\n\n"
            "Wat zegt de afwezigheid van secundaire of tertiaire aroma's bij een jonge rosé?\n\n"
            "A. Dat de wijn een fout heeft\n"
            "B. Dat dit normaal is voor het merendeel van de categorie ✅\n"
            "C. Dat de wijn te oud is\n"
            "D. Dat de druif onrijp was\n\n"
            "### Vraag 7\n\n"
            "Wat is de dominante structuuras bij vrijwel elke rosé?\n\n"
            "A. Tannine\n"
            "B. Zuur ✅\n"
            "C. Restsuiker\n"
            "D. Alcohol\n\n"
            "### Vraag 8\n\n"
            "Wanneer ontstaat een merkbare fenolische textuur (grip) in rosé?\n\n"
            "A. Bij elke rosé, ongeacht productie\n"
            "B. Alleen bij langere schilcontacttijd of extractie, zoals bij Tavel ✅\n"
            "C. Alleen bij houtrijping\n"
            "D. Alleen bij rosé met restsuiker\n\n"
            "### Vraag 9\n\n"
            "Waarom moet je restsuiker apart benoemen naast alcohol en body?\n\n"
            "A. Omdat restsuiker de wettelijke classificatie bepaalt\n"
            "B. Omdat restsuiker de indruk van body en zoetheid samen kan veranderen, los van "
            "alcohol ✅\n"
            "C. Omdat restsuiker altijd op het etiket staat\n"
            "D. Omdat restsuiker gelijk staat aan lage kwaliteit\n\n"
            "### Vraag 10\n\n"
            "Blind: bleek zalmkleurig, citrus en bloemen dominant, hoog zuur, nauwelijks "
            "fenolische textuur, laag-medium alcohol. Welke stijlhypothese past het beste?\n\n"
            "A. Structuurrijke, Mourvèdre-gedomineerde Tavel-achtige stijl\n"
            "B. Mediterrane, kortstondig geperste stijl in Provence-richting ✅\n"
            "C. Zoete, Nieuwe-Wereld White Zinfandel-stijl\n"
            "D. Gerijpte, houtgedreven rosado\n\n"
        ),
        "quiz_feedback": (
            "Sterk gewerkt. Je hebt nu de kern van rosé geïntegreerd: kleur als "
            "productiehypothese, de vier primaire aromafamilies en hun onderlinge verhouding, "
            "en zuur als hoofdas met fenolische textuur, alcohol, body en restsuiker als "
            "aanvullende variabelen. Dat fundament gebruik je in Module 4 en 5 om klassieke "
            "stijlen en druivenrassen blind van elkaar te onderscheiden."
        ),
    },
    # ------------------------------------------------------------------
    # Module 4 — Klassieke stijlen (16–20) — food_pairing verplicht
    # ------------------------------------------------------------------
    16: {
        "theorie": (
            "Provence is het referentiepunt van moderne, mediterrane rosé: de hete, droge "
            "zomers rond de Côtes de Provence worden getemperd door de mistral, de koude "
            "noordenwind die 's nachts voor afkoeling zorgt en zo de zuurgraad in de druiven "
            "behoudt ondanks de hitte overdag. Kalksteen- en schisterbodems, samen met "
            "percelen op hoogte, versterken dat frisse profiel verder.\n\n"
            "Extractie is bij klassieke Provence-rosé minimaal: druiven worden snel en zacht "
            "geperst (directe pers), vaak bij lage temperatuur, met slechts enkele uren "
            "huidcontact of soms zelfs vrijwel geen bewuste maceratie. Die korte extractietijd "
            "is de directe verklaring voor de extreem bleke, zalmkleurige tot bijna "
            "ui-schil-achtige kleur waar de regio wereldwijd om bekendstaat — een kleur die "
            "inmiddels ook een commerciële norm is geworden waar producenten bewust naar "
            "streven.\n\n"
            "Blindproefmarkers zijn: een zeer bleke kleur, citrus (grapefruit, citroenzest), "
            "witte perzik, en de kenmerkende Provençaalse garrigue-kruidigheid (tijm, laurier) "
            "op de achtergrond, gecombineerd met een zoute, minerale afdronk. Textuurmatig is "
            "Provence-rosé vrijwel zuiver zuurgedreven: fenolische grip is nagenoeg afwezig en "
            "het lichaam blijft bewust laag, wat de wijn direct herkenbaar maakt tegenover "
            "structuurrijkere stijlen.\n\n"
            "Het grootste verwarringsgevaar ligt bij Tavel: beide zijn Franse rosé met "
            "Grenache als basis, maar Provence blijft aanzienlijk bleker, lichter van lichaam "
            "en zuiverder zuurgedreven, terwijl Tavel dieper van kleur is en een merkbare "
            "fenolische textuur toont. Verwar Provence ook niet met Bandol, de meer "
            "body-rijke, Mourvèdre-gedomineerde sub-appellatie binnen Provence zelf: "
            "Bandol-rosé is dieper van kleur, structuurrijker en heeft doorgaans meer "
            "bewaarpotentieel dan de doorsnee Côtes de Provence-stijl, ook al vallen beide "
            "onder de bredere Provence-noemer.\n\n"
            "Serveer Provence-rosé zeer koel (8–10°C) in een smal, hooggebouwd glas dat de "
            "subtiele citrus- en kruidentonen concentreert zonder het alcohol te benadrukken — "
            "bij een hogere temperatuur verdwijnt de precisie snel."
        ),
        "samenvatting": (
            "- Mistral en kalksteen-/schisterbodems geven Provence hitte overdag én "
            "zuurbehoud 's nachts\n"
            "- Minimale extractie via directe pers verklaart de extreem bleke, zalmkleurige "
            "kleur\n"
            "- Blindproefmarkers: zeer bleke kleur, citrus, witte perzik, garrigue-kruidigheid, "
            "zoute afdronk\n"
            "- Textuur is vrijwel zuiver zuurgedreven; fenolische grip is nagenoeg afwezig\n"
            "- Grootste verwarringsgevaar is Tavel; Bandol is de dieper gekleurde, "
            "structuurrijkere Provence-sub-appellatie"
        ),
        "food_pairing": fp(
            "Provence-rosé bij een bouillabaisse, gegrilde loup de mer, of een salade niçoise "
            "met ansjovis en olijven.",
            "De hoge zuur en de zoute, minerale afdronk van Provence-rosé sluiten direct aan "
            "bij de zilte, mediterrane zoutbalans van deze gerechten, terwijl de citrustonen "
            "de visgerechten opfrissen zonder te domineren.",
            "Provence-rosé bij zware, romige of sterk gekruide gerechten — de lichte body en "
            "subtiele aromatiek verdwijnen volledig tegen die intensiteit.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Provence en Tavel: kijk eerst naar de kleurdiepte en proef dan "
            "direct op fenolische textuur. Blijft de mond zuiver zuurgedreven zonder enige "
            "grip, dan is het Provence; voel je een lichte, tastbare structuur, dan is het "
            "waarschijnlijk Tavel."
        ),
        "kernbegrippen": [
            "Provence",
            "mistral-koeling",
            "commerciële-bleekheidsnorm",
            "garrigue-kruidigheid",
            "Provence-Tavel-verwarring",
        ],
        "reflectievraag": (
            "Zou jij Bandol-rosé nu anders classificeren dan een gemiddelde Côtes de Provence, "
            "ondanks dat beide onder dezelfde brede regio vallen?"
        ),
    },
    17: {
        "theorie": (
            "Tavel is de enige Franse AOC die uitsluitend rosé produceert — er bestaat geen "
            "witte of rode Tavel — en die exclusiviteit weerspiegelt de ambitie van de "
            "appellatie om rosé als een volwaardige, structuurrijke categorie te positioneren "
            "in plaats van een licht bijproduct. De ronde rivierkeien (galets roulés), bekend "
            "van het naburige Châteauneuf-du-Pape, slaan overdag warmte op en geven die 's "
            "nachts af, wat de druiven in dit warme zuidelijke Rhône-klimaat tot volledige "
            "fenolische rijpheid brengt.\n\n"
            "Extractie is bij Tavel traditioneel aanzienlijk intensiever dan bij Provence: "
            "producenten gebruiken vaak langere schilcontacttijd, soms in combinatie met "
            "saignée, en de blend — overwegend Grenache aangevuld met Cinsault, Clairette, "
            "Syrah en Mourvèdre — wordt bewust dichter bij de wijnmaakfilosofie van een lichte "
            "rode wijn gebracht dan bij een klassieke, kort geperste rosé. Dat verklaart "
            "waarom Tavel weleens 'de rosé die zich gedraagt als een rode wijn' wordt "
            "genoemd.\n\n"
            "Blindproefmarkers zijn: een merkbaar diepere, koraal- tot lichtrode kleur, rijper "
            "rood fruit met kruidige, soms peperige tonen, een voller lichaam, hoger alcohol, "
            "en — het belangrijkste onderscheid — een tastbare fenolische textuur die je bij "
            "Provence nauwelijks tegenkomt. Die textuur is subtieler dan tannine bij rode "
            "wijn, maar wel degelijk aanwezig en herkenbaar als lichte grip op tandvlees en "
            "wangen.\n\n"
            "Het grootste verwarringsgevaar is Provence: beide zijn Franse, "
            "Grenache-gedomineerde rosé, maar Tavel is aanzienlijk dieper van kleur, voller "
            "van lichaam en toont die kenmerkende fenolische grip, terwijl Provence bleker, "
            "lichter en zuiver zuurgedreven blijft. Test daarom nooit op kleur alleen: proef "
            "de textuur apart — Provence blijft glad, Tavel toont grip.\n\n"
            "Serveer Tavel iets minder koud dan Provence (10–12°C) in een breder glas dat het "
            "vollere lichaam en de kruidige tonen ruimte geeft; bij aanhoudende "
            "Provence-temperatuur (8°C) blijft de structuur van Tavel onderbelicht."
        ),
        "samenvatting": (
            "- Tavel is de enige Franse AOC die uitsluitend rosé produceert\n"
            "- Galets roulés slaan warmte op en brengen de druiven tot volledige fenolische "
            "rijpheid\n"
            "- Langere schilcontacttijd/saignée geeft een dieper, structuurrijker resultaat "
            "dan Provence\n"
            "- Blindproefmarkers: koraal-/lichtrode kleur, kruidig rood fruit, tastbare "
            "fenolische grip\n"
            "- Grootste verwarringsgevaar is Provence; test op textuur, niet op kleur alleen"
        ),
        "food_pairing": fp(
            "Tavel bij gegrilde lamskoteletten, een stevige ratatouille met geroosterd vlees, "
            "of gevogelte met een kruidige jus.",
            "De fenolische textuur en het volle lichaam van Tavel matchen textuurlijk met het "
            "vet en de eiwitten van geroosterd vlees, terwijl de kruidige, peperige tonen de "
            "mediterrane kruidenmix in het gerecht spiegelen.",
            "Tavel bij delicate, rauwe visgerechten — de textuur en het body-gewicht "
            "overweldigen de subtiliteit van rauwe vis volledig.",
        ),
        "pro_insight": (
            "Proef bij een onbekende, dieper gekleurde rosé altijd expliciet op fenolische "
            "grip vóór je aan Tavel denkt — zonder die tastbare textuur is de kans groter dat "
            "je met een geblende, kunstmatig verdiepte rosé te maken hebt in plaats van een "
            "authentieke Tavel."
        ),
        "kernbegrippen": [
            "Tavel",
            "galets-roulés-warmteopslag",
            "saignée-georiënteerde-extractie",
            "tastbare-fenolische-grip",
            "Tavel-Provence-textuurtest",
        ],
        "reflectievraag": (
            "Zou jij Tavel nu serveren als een lichte rode wijn qua temperatuur en glaskeuze, "
            "in plaats van als een klassieke, koud geserveerde rosé?"
        ),
    },
    18: {
        "theorie": (
            "Rosado uit Spanje wordt van oudsher gedomineerd door Garnacha (de Spaanse naam "
            "voor Grenache), vooral in Navarra en delen van Rioja, waar een continentaal "
            "klimaat met hete dagen en koude nachten rijp fruit combineert met behoud van "
            "voldoende zuurgraad. Historisch produceerde de regio aanzienlijk dieper gekleurde "
            "rosado dan de moderne, internationaal geïnspireerde stijl — een stijlverschil dat "
            "nog steeds zichtbaar is tussen traditionele en eigentijdse producenten.\n\n"
            "Extractie was traditioneel langer dan bij Provence, wat de klassieke, dieper roze "
            "tot licht oranje kleur verklaart die je nog steeds bij oudere-stijl "
            "Navarra-rosado aantreft. De laatste decennia is een duidelijke verschuiving "
            "zichtbaar richting kortere, koelere directe pers naar internationale, blekere "
            "stijl — deels als reactie op de commerciële dominantie van de Provence-stijl "
            "wereldwijd. Daarnaast experimenteert een groeiend aantal Rioja-producenten met "
            "vatgefermenteerde of kort op hout gerijpte rosado (rosado fermentado en barrica), "
            "wat een subtiele vanille- en roostertoon toevoegt die je bij Provence of Tavel "
            "vrijwel nooit tegenkomt.\n\n"
            "Blindproefmarkers zijn: rijp rood fruit (aardbei, rode bes), een ronder "
            "mondgevoel dan Franse rosé, gematigd tot hoog alcohol, en bij vatgerijpte "
            "versies een lichte vanille- of roostertoon. De kleur varieert sterk van bleek "
            "(moderne stijl) tot duidelijk dieper roze-oranje (traditionele stijl), wat kleur "
            "bij Spaanse rosado tot een minder betrouwbare stijlindicator maakt dan bij "
            "Provence of Tavel.\n\n"
            "Het grootste verwarringsgevaar is Italiaanse rosato: beide landen kennen een "
            "enorme interne stijlvariatie, maar Spaanse rosado neigt naar een ronder, rijper "
            "fruitprofiel met soms een houttoon, terwijl Italiaanse rosato vaker een "
            "directere, minerale zuurlijn toont zonder houtinvloed. Vertrouw bij twijfel niet "
            "op kleur — die overlapt sterk tussen beide landen — maar op de aanwezigheid van "
            "ronde, rijpe zoetheid en eventuele houttonen als signaal voor Spanje.\n\n"
            "Serveer moderne, bleke rosado zoals Provence (8–10°C); serveer vatgerijpte of "
            "traditionele, dieper gekleurde rosado iets warmer (11–13°C) in een breder glas "
            "dat de extra structuur en houttonen ruimte geeft."
        ),
        "samenvatting": (
            "- Navarra en Rioja combineren een continentaal klimaat met van oudsher "
            "Garnacha-gedomineerde rosado\n"
            "- Traditionele stijl is dieper gekleurd; moderne stijl schuift op naar bleker, "
            "internationaler\n"
            "- Vatgefermenteerde rosado (fermentado en barrica) voegt vanille- en roostertonen "
            "toe\n"
            "- Blindproefmarkers: rijp rood fruit, ronder mondgevoel, variabele kleurdiepte\n"
            "- Grootste verwarringsgevaar is Italiaanse rosato; ronde zoetheid en houttonen "
            "wijzen op Spanje"
        ),
        "food_pairing": fp(
            "Rosado bij jamón ibérico, gegrilde chorizo, of een paella met zeevruchten en "
            "chorizo.",
            "Het rijpe fruit en de ronde structuur van rosado matchen de vetbalans van cured "
            "vlees en zeevruchten, terwijl het zuur van de wijn tegen dat vet in werkt en de "
            "rijkdom van de paella-bouillon in evenwicht houdt.",
            "Rosado bij zeer delicate, rauwe schaaldieren — het rondere, rijpere fruitprofiel "
            "overweldigt de subtiliteit van rauwe zeevruchten.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Spaanse rosado en Italiaanse rosato: negeer de kleur en zoek "
            "naar ronde, rijpe zoetheid of een lichte houttoon. Vind je die, dan proef je "
            "waarschijnlijk rosado; blijft de zuurlijn direct en mineraal zonder houtinvloed, "
            "dan is het eerder rosato."
        ),
        "kernbegrippen": [
            "rosado",
            "Navarra-Garnacha",
            "traditionele-versus-moderne-kleurstijl",
            "vatgefermenteerde-rosado-crianza",
            "rosado-rosato-verwarring",
        ],
        "reflectievraag": (
            "Zou jij een vatgerijpte Rioja-rosado nu anders serveren dan een moderne, bleke "
            "rosado uit dezelfde regio?"
        ),
    },
    19: {
        "theorie": (
            "Italiaanse rosato kent geen uniforme stijl — in tegenstelling tot de vrij "
            "consistente bleekheid van Provence toont Italië een extreme interne bandbreedte, "
            "van de bleke, delicate Chiaretto van het Gardameer tot de opvallend diep "
            "kersrode Cerasuolo d'Abruzzo. Wie 'Italiaanse rosato' als één categorie "
            "behandelt, mist precies de regionale signalen die deze categorie specialistisch "
            "maken.\n\n"
            "Bardolino Chiaretto, gemaakt van Corvina en Rondinella rond het Gardameer, wordt "
            "tegenwoordig overwegend via korte, directe pers geproduceerd en toont een bleke, "
            "delicate kleur vergelijkbaar met moderne Provence-stijl, met rood fruit en "
            "citrustonen en een hoge zuurgraad dankzij het gematigde meerklimaat. Cerasuolo "
            "d'Abruzzo daarentegen, gemaakt van Montepulciano, wordt traditioneel met langere "
            "schilcontacttijd geproduceerd en resulteert in een opvallend diepe, bijna "
            "kersrode kleur — zo diep dat de wijn soms voor een lichte rode wijn wordt "
            "aangezien bij oppervlakkige beoordeling.\n\n"
            "Blindproefmarkers verschillen dus sterk per stijl: Chiaretto toont rood fruit, "
            "citrus en bloemen met een lichte, zuivere structuur; Cerasuolo toont sappige, "
            "licht wrange zure kers, kruidigheid en een merkbare fenolische textuur die de "
            "diepe kleur ondersteunt. Negroamaro-rosato uit Salento (Puglia) voegt daar nog "
            "een derde profiel aan toe: donkerder fruit, een koperachtige kleurtoon en een "
            "licht rustieke, aardse structuur.\n\n"
            "Het verwarringsgevaar met Spaanse rosado is reëel bij de diepere Italiaanse "
            "stijlen: zowel Cerasuolo als sommige traditionele Spaanse rosado tonen "
            "aanzienlijke kleurdiepte, maar Cerasuolo behoudt een scherpere, kersachtige "
            "zuurlijn die dichter bij Sangiovese-achtige zuurstructuren ligt, terwijl Spaanse "
            "rosado ronder en minder scherp zuurgedreven blijft. Verwar Cerasuolo bovendien "
            "nooit met een lichte rode wijn puur op kleurdiepte: proef altijd het zuur en de "
            "textuur samen om de categorie te bevestigen.\n\n"
            "Serveer Chiaretto koel (8–10°C) in een smal glas; serveer Cerasuolo iets warmer "
            "(11–13°C) in een breder glas dat de extra structuur en de kruidigheid ruimte "
            "geeft."
        ),
        "samenvatting": (
            "- Italiaanse rosato is geen uniforme stijl: interne bandbreedte van bleke "
            "Chiaretto tot diepe Cerasuolo\n"
            "- Chiaretto (Corvina/Rondinella, Gardameer) is bleek en zuiver; Cerasuolo "
            "(Montepulciano) is diep en structuurrijker\n"
            "- Negroamaro-rosato uit Puglia voegt een derde, donkerder en aardser profiel toe\n"
            "- Verwarringsgevaar met Spaanse rosado bij diepere stijlen; Cerasuolo behoudt een "
            "scherpere, kersachtige zuurlijn\n"
            "- Cerasuolo nooit puur op kleurdiepte als lichte rode wijn beoordelen"
        ),
        "food_pairing": fp(
            "Cerasuolo d'Abruzzo bij arrosticini (geroosterde lamsspiesjes) of andere "
            "geroosterde Abruzzese vleesgerechten; Chiaretto bij gegrilde meervis uit het "
            "Gardameer.",
            "De sappige kersachtige zuurlijn en fenolische textuur van Cerasuolo geven "
            "voldoende tegenwicht aan de grilltonen van geroosterd lamsvlees, terwijl de "
            "lichtere, frissere Chiaretto de delicate zoetwatervis niet overweldigt.",
            "Cerasuolo bij zeer delicate, rauwe gerechten — de kleurdiepte en textuur zijn "
            "daarvoor te uitgesproken; Chiaretto bij zwaar gekruide, vette gerechten — de "
            "lichte structuur verdwijnt volledig.",
        ),
        "pro_insight": (
            "Behandel 'Italiaanse rosato' nooit als één stijl: vraag jezelf bij elk glas eerst "
            "af of je met een Chiaretto-achtige, bleke stijl te maken hebt of met een "
            "Cerasuolo-achtige, dieper gekleurde stijl — de verwachtingen voor zuur, textuur "
            "en food-pairing verschillen wezenlijk."
        ),
        "kernbegrippen": [
            "rosato",
            "Chiaretto-Gardameer",
            "Cerasuolo-d'Abruzzo",
            "interne-stijldiversiteit-Italië",
            "kersachtige-zuurlijn",
        ],
        "reflectievraag": (
            "Zou jij Cerasuolo d'Abruzzo nu op tafel presenteren als rosé, of zou je overwegen "
            "hem eerst als 'bijna-rode-wijn' te introduceren aan een gast?"
        ),
    },
    20: {
        "theorie": (
            "Nieuwe-Wereld-rosé — uit Californië (Central Coast, Sonoma), Australië, "
            "Zuid-Afrika en Chili — ontstaat in aanmerkelijk warmere klimaten dan de "
            "klassieke Franse referenties, met meer zonuren en hogere gemiddelde "
            "temperaturen die de druiven tot rijpere suikerniveaus en dus vaak hoger alcohol "
            "brengen. Die warmte-opbouw is de belangrijkste verklarende factor achter het "
            "bredere, rijpere fruitspectrum dat deze stijl kenmerkt.\n\n"
            "De categorie kent twee duidelijk gescheiden ontwikkelingslijnen: een "
            "historische, off-dry lijn die teruggaat op de Amerikaanse White "
            "Zinfandel-stijl, waarbij de gisting bewust vroegtijdig wordt gestopt om "
            "meetbare restsuiker te behouden naast een relatief laag alcohol; en een "
            "moderne, drogere lijn die bewust de bleke, zuurgedreven Provence-stijl "
            "imiteert om aan te sluiten bij de internationale marktvraag naar 'droge, "
            "mediterrane' rosé.\n\n"
            "Blindproefmarkers verschillen daardoor sterk per lijn: de off-dry stijl toont "
            "expliciete zoetheid, rijp rood fruit (aardbeienjam) en een rondere, soms iets "
            "stroperige textuur door de combinatie van restsuiker en alcohol; de moderne, "
            "droge imitatiestijl toont een bleke kleur vergelijkbaar met Provence, maar "
            "verraadt zich vaak door een rijper, explicieter fruitprofiel (meloen, "
            "tropische ondertonen) dat de subtielere citrus- en kruidentonen van "
            "authentieke Provence mist.\n\n"
            "Het belangrijkste verwarringsgevaar is dus niet regionaal maar structureel: "
            "een bleke Nieuwe-Wereld-rosé kan visueel bijna niet van Provence te "
            "onderscheiden zijn, terwijl de onderliggende rijpheid, het alcoholniveau en de "
            "afwezigheid van garrigue-kruidigheid wél degelijk verschillen. Proef daarom "
            "altijd door de kleur heen: rijpheid van het fruit en de aanwezigheid (of "
            "afwezigheid) van kruidige, mediterrane ondertonen zijn betrouwbaardere "
            "signalen dan tint alleen.\n\n"
            "Serveer droge Nieuwe-Wereld-rosé zoals Provence (8–10°C); serveer off-dry "
            "stijlen iets kouder (6–8°C) om de zoetheid te temperen, in een neutraal, medium "
            "glas dat geen van beide stijlen overdreven concentreert."
        ),
        "samenvatting": (
            "- Warmere klimaten (Californië, Australië, Zuid-Afrika, Chili) geven rijper "
            "fruit en vaak hoger alcohol\n"
            "- Twee lijnen: historische off-dry (White Zinfandel-erfenis) en moderne, droge "
            "Provence-imitatie\n"
            "- Blindproefmarkers verschillen sterk per lijn: expliciete zoetheid versus rijper "
            "fruit zonder kruidigheid\n"
            "- Het verwarringsgevaar is structureel, niet regionaal: kleur kan bijna "
            "identiek zijn aan Provence\n"
            "- Proef door de kleur heen op fruitrijpheid en garrigue-kruidigheid om de stijl "
            "te bevestigen"
        ),
        "food_pairing": fp(
            "Droge Nieuwe-Wereld-rosé bij een zomerse BBQ met gegrilde kip of garnalen; "
            "off-dry stijlen bij pittige Aziatische of Mexicaanse gerechten.",
            "De rijpe fruitzoetheid van deze stijlen matcht de gekarameliseerde grilltonen; "
            "bij off-dry stijlen verzacht de zoetheid, gecombineerd met een net iets koudere "
            "serveertemperatuur, de kruidigheid van pittige gerechten effectief, terwijl een "
            "te warme temperatuur die zoetheid juist opdringerig zou maken.",
            "Off-dry Nieuwe-Wereld-rosé bij zoute, zuurgedreven mediterrane gerechten — de "
            "zoetheid conflicteert dan met de zoutbalans in plaats van die te ondersteunen.",
        ),
        "pro_insight": (
            "Proef bij een bleke, Provence-achtige rosé altijd door de kleur heen: zoek naar "
            "rijpheid van het fruit en de aan- of afwezigheid van garrigue-kruidigheid. Een "
            "bleke kleur met expliciet rijp, tropisch fruit en zonder kruidigheid wijst eerder "
            "op een Nieuwe-Wereld-imitatie dan op authentieke Provence."
        ),
        "kernbegrippen": [
            "Nieuwe-Wereld-rosé",
            "White-Zinfandel-erfenis",
            "droge-versus-off-dry-lijn",
            "Provence-stijlimitatie",
            "rijpheid-als-onderscheidend-signaal",
        ],
        "reflectievraag": (
            "Zou jij een bleke, Provence-achtige rosé nu blind kunnen onderscheiden van een "
            "Nieuwe-Wereld-imitatie, puur op basis van fruitrijpheid en kruidigheid?"
        ),
    },
    # ------------------------------------------------------------------
    # Module 5 — Druivenrassen (21–25) — food_pairing verplicht
    # ------------------------------------------------------------------
    21: {
        "theorie": (
            "Grenache is de ruggengraat van vrijwel elke klassieke Europese rosé — van "
            "Provence tot Tavel tot Spaanse rosado — en die dominantie komt niet toevallig: "
            "de druif heeft van nature een relatief lage antocyaanconcentratie in de schil, "
            "wat betekent dat zelfs bij substantieel schilcontact de kleur mild en beheersbaar "
            "blijft in plaats van meteen diep en donker te worden, zoals bij dikschillige "
            "druiven het geval zou zijn.\n\n"
            "Grenache accumuleert bovendien snel suiker tijdens de rijping, wat resulteert in "
            "relatief hoog alcohol, terwijl het natuurlijke zuurniveau laag blijft — dezelfde "
            "eigenschap die de druif bij rode wijn tot een blendpartner maakt (in de "
            "GSM-blend) is bij rosé de reden waarom oogsttiming extreem precies moet zijn: te "
            "laat geoogst wordt de rosé plat en alcoholrijk, te vroeg geoogst mist het de "
            "karakteristieke rijpe rood-fruittoon.\n\n"
            "Blindproefmarkers zijn: rood fruit (aardbei, rode bes, framboos), een rijp, rond "
            "mondgevoel, relatief hoog alcohol voor de categorie, en een bloemige ondertoon "
            "(rozenblad) die vaak samen met het fruit optreedt. De kleur varieert van medium "
            "zalm tot dieper roze, afhankelijk van schilcontacttijd, maar blijft door de lage "
            "antocyaanconcentratie zelden extreem donker.\n\n"
            "Het grootste verwarringsgevaar is Cinsault, waarmee Grenache in vrijwel elke "
            "klassieke Provence- of Tavel-blend wordt gecombineerd: Grenache levert het "
            "rijpere fruit en het hogere alcohol, terwijl Cinsault een lichtere, bloemiger, "
            "minder geconcentreerde laag toevoegt. In een blend proef je Grenache als de "
            "rijpere, warmere onderlaag die het fruit draagt, terwijl Cinsault de opfrissende "
            "bovenlaag vormt.\n\n"
            "Serveer Grenache-gedomineerde rosé bij 9–11°C — iets minder koud dan een zuiver "
            "Cinsault-gedreven stijl, omdat te lage temperaturen het rijpe fruit en de "
            "bloemige ondertoon onderdrukken."
        ),
        "samenvatting": (
            "- Grenache heeft van nature een lage antocyaanconcentratie, wat de kleur mild en "
            "beheersbaar houdt\n"
            "- Snelle suikeraccumulatie en laag zuur vragen om extreem precieze oogsttiming\n"
            "- Blindproefmarkers: rood fruit, rijp mondgevoel, relatief hoog alcohol, bloemige "
            "ondertoon\n"
            "- Grootste verwarringsgevaar is Cinsault; Grenache levert de rijpere, warmere "
            "fruitonderlaag\n"
            "- Serveer iets minder koud dan Cinsault-gedreven stijlen om het fruit tot zijn "
            "recht te laten komen"
        ),
        "food_pairing": fp(
            "Grenache-gedomineerde rosé bij een lamstajine met gedroogd fruit, of gegrilde "
            "lamskoteletten met rozemarijn.",
            "Het rijpe rood fruit en het hogere alcohol van Grenache matchen de vetrijkdom van "
            "lamsvlees, terwijl de bloemige rozentoon de kruidig-zoete elementen van een "
            "tajine spiegelt.",
            "Grenache-gedomineerde rosé bij zeer lichte, rauwe visgerechten — het rijpere "
            "fruit en alcohol overweldigen de subtiliteit volledig.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Grenache en Cinsault in een blend: zoek naar de rijpere, "
            "warmere fruitonderlaag. Is die duidelijk aanwezig naast een lichtere, bloemige "
            "bovenlaag, dan proef je de klassieke Grenache-Cinsault-verhouding van Provence en "
            "Tavel."
        ),
        "kernbegrippen": [
            "Grenache",
            "lage-antocyaanconcentratie",
            "precieze-oogsttiming",
            "Grenache-Cinsault-verhouding",
            "rijpe-fruitonderlaag",
        ],
        "reflectievraag": (
            "Zou jij nu in een Provence-blend actief kunnen proeven welk deel van het "
            "fruitprofiel van Grenache komt en welk deel van Cinsault?"
        ),
    },
    22: {
        "theorie": (
            "Cinsault is historisch een van de belangrijkste roosédruiven van Zuid-Frankrijk, "
            "en die rol is geen toeval: de druif is van nature dunschillig en laag in "
            "tannine, zelfs in de warme klimaten van de Languedoc en zuidelijke Rhône waar hij "
            "van oorsprong vandaan komt. Die combinatie van warmte-tolerantie en dunne schil "
            "levert een paradoxaal licht, bloemig resultaat op ondanks de hitte waarin de "
            "druif meestal groeit.\n\n"
            "Cinsault heeft van nature een hoge opbrengst, wat historisch de reden was dat de "
            "druif veel werd aangeplant voor bulkproductie, maar diezelfde eigenschappen — "
            "lage tannine, gematigd zuur, een uitgesproken bloemige aromatiek (viooltjes, "
            "rozenblad) — maken hem bij bewust laag opbrengstbeheer juist zeer geschikt voor "
            "kwaliteitsrosé. Buiten Frankrijk krijgt oude-stok Cinsault (Swartland, "
            "Zuid-Afrika) en Cinsault uit de Bekaa-vallei (Libanon) inmiddels aandacht als op "
            "zichzelf staande, hoogwaardige roosédruif.\n\n"
            "Blindproefmarkers zijn: een lichte kleur, lage tannine, uitgesproken bloemigheid, "
            "rood fruit dat subtieler is dan bij Grenache, en een soepel, direct mondgevoel "
            "zonder de hogere alcoholopbouw die Grenache kenmerkt. In blends fungeert Cinsault "
            "typisch als de opfrissende, minder geconcentreerde laag die het rijpere "
            "Grenache-fruit in balans houdt.\n\n"
            "Het verwarringsgevaar met Grenache speelt zich vooral af binnen blends: waar "
            "Grenache het rijpe fruit en het alcohol levert, blijft Cinsault de lichtere, "
            "bloemiger onderlaag — een onderscheid dat je het best test door te letten op de "
            "intensiteit van de bloemige noot en het alcoholgevoel: hoe uitgesprokener de "
            "bloemigheid en hoe lichter het alcohol aanvoelt, hoe groter het aandeel Cinsault "
            "waarschijnlijk is.\n\n"
            "Serveer varietale Cinsault-rosé goed gekoeld (8–10°C) in een smal glas dat de "
            "bloemige lichtheid concentreert zonder het beperkte alcohol te benadrukken."
        ),
        "samenvatting": (
            "- Cinsault is warmteminnend maar van nature dunschillig, met een paradoxaal licht "
            "resultaat\n"
            "- Hoge opbrengst maakt de druif geschikt voor bulk, maar bij lage opbrengst juist "
            "voor kwaliteitsrosé\n"
            "- Oude-stok Cinsault uit Zuid-Afrika en de Bekaa-vallei krijgt aandacht als "
            "zelfstandige druif\n"
            "- Blindproefmarkers: lichte kleur, lage tannine, uitgesproken bloemigheid, subtiel "
            "rood fruit\n"
            "- Verwarringsgevaar met Grenache in blends; test op de intensiteit van de "
            "bloemige noot"
        ),
        "food_pairing": fp(
            "Cinsault-gedomineerde rosé bij oesters, gegrilde garnalen, of een mezeplank met "
            "olijven en tapenade.",
            "De lage tannine en de bloemige lichtheid laten Cinsault ongewoon goed samengaan "
            "met schaal- en schelpdieren zoals oesters en garnalen, zonder de subtiele zilte "
            "smaak te overweldigen.",
            "Cinsault-gedomineerde rosé bij rijke, romige of sterk gekruide gerechten — de "
            "lichte, bloemige structuur verdwijnt volledig tegen die intensiteit.",
        ),
        "pro_insight": (
            "Proef in elke Grenache-Cinsault-blend actief op de intensiteit van de bloemige "
            "noot: hoe sterker die aanwezig is naast een lichter alcoholgevoel, hoe groter het "
            "aandeel Cinsault in de blend."
        ),
        "kernbegrippen": [
            "Cinsault",
            "dunschillige-warmteparadox",
            "oude-stok-Cinsault-Zuid-Afrika",
            "bloemige-onderlaag",
            "Grenache-Cinsault-blendtest",
        ],
        "reflectievraag": (
            "Zou jij oude-stok Cinsault uit Zuid-Afrika nu als een serieuze, op zichzelf "
            "staande roosédruif behandelen, in plaats van als een blendpartner voor Grenache?"
        ),
    },
    23: {
        "theorie": (
            "Syrah speelt in roséblends een andere rol dan in rode wijn: waar de druif bij "
            "rood vaak de hoofdrol vertolkt, fungeert Syrah in Provence- en Rhône-rosé meestal "
            "als een kleine, gerichte toevoeging (doorgaans niet meer dan tien tot twintig "
            "procent van de blend) die kleurdiepte en kruidigheid toevoegt zonder de "
            "lichtvoetigheid van Grenache en Cinsault te overschaduwen.\n\n"
            "De dikkere schil van Syrah levert, zelfs in kleine percentages, merkbaar meer "
            "kleurdiepte dan Grenache of Cinsault alleen zouden geven, en de karakteristieke "
            "zwarte-peperspecerij van de druif — afkomstig van het aromacomponent rotundone — "
            "blijft ook bij kortstondig schilcontact goed herkenbaar. Sommige producenten, "
            "vooral in Nieuwe-Wereld-gebieden met een koeler klimaat (bepaalde delen van "
            "Australië, Chili), bottelen ook varietale Syrah-rosé, wat de druif meer op "
            "zichzelf laat proeven dan de klassieke Franse blendrol toelaat.\n\n"
            "Blindproefmarkers zijn: een merkbaar diepere kleur dan een pure "
            "Grenache-Cinsault-rosé, een expliciete zwarte-peper- of kruidnagelspecerij, "
            "viooltjesbloemigheid, en een iets stevigere structuur dan de rest van de blend. "
            "In een blind glas verraadt Syrah zich meestal het eerst via de neus, niet via de "
            "kleur: de peperspecerij is herkenbaarder dan de kleurbijdrage.\n\n"
            "Het grootste verwarringsgevaar is Mourvèdre, de andere structuurdruif in "
            "klassieke Provence- en Tavel-blends: Syrah geeft een frissere, meer bloemige "
            "zwarte-peperspecerij, terwijl Mourvèdre een zwaardere, aardse, bijna "
            "wild-hartige garrigue-toon toevoegt met meer tastbare fenolische grip. Proef "
            "daarom het verschil tussen 'peperig-bloemig' (Syrah) en 'aards-wild' (Mourvèdre) "
            "om de twee uit elkaar te houden in een GSM-achtige roséblend.\n\n"
            "Serveer Syrah-geaccentueerde rosé bij 10–12°C in een middelgroot glas dat zowel "
            "de kruidige top als de iets stevigere structuur ruimte geeft."
        ),
        "samenvatting": (
            "- Syrah is in roséblends een kleine, gerichte toevoeging voor kleurdiepte en "
            "kruidigheid\n"
            "- De dikkere schil geeft merkbaar meer kleur; rotundone geeft de karakteristieke "
            "zwarte-peperspecerij\n"
            "- Sommige Nieuwe-Wereld-producenten bottelen varietale Syrah-rosé\n"
            "- Blindproefmarkers: diepere kleur, zwarte peper/kruidnagel, viooltjesbloemigheid, "
            "steviger structuur\n"
            "- Grootste verwarringsgevaar is Mourvèdre; test op peperig-bloemig versus "
            "aards-wild"
        ),
        "food_pairing": fp(
            "Syrah-geaccentueerde rosé bij gegrilde worst met zwarte peper, of een pepersteak "
            "van varkenshaas.",
            "De zwarte-peperspecerij van Syrah in de rosé spiegelt direct de kruidigheid van "
            "de peperkorrel in het gerecht, een klassieke aroma-op-aroma-match die bij "
            "lichtere Grenache-Cinsault-rosé zou ontbreken.",
            "Syrah-geaccentueerde rosé bij zeer delicate, ongekruide visgerechten — de "
            "kruidigheid overweldigt de subtiliteit.",
        ),
        "pro_insight": (
            "Ruik bewust op zwarte peper vóórdat je de kleur van een rosé beoordeelt — die "
            "specerij verraadt de aanwezigheid van Syrah in een blend vaak eerder en "
            "betrouwbaarder dan de kleurdiepte zelf."
        ),
        "kernbegrippen": [
            "Syrah",
            "rotundone-peperspecerij",
            "kleine-blendpercentages",
            "Syrah-Mourvèdre-verwarring",
            "peperig-versus-aards-onderscheid",
        ],
        "reflectievraag": (
            "Zou jij nu in een GSM-geïnspireerde roséblend actief op zoek gaan naar de "
            "zwarte-peperspecerij van Syrah, los van de kleurdiepte van de wijn?"
        ),
    },
    24: {
        "theorie": (
            "Mourvèdre is de structuurdruif bij uitstek binnen roséblends, en nergens is die "
            "rol wettelijk zo vastgelegd als in Bandol: de appellatie eist een minimumaandeel "
            "Mourvèdre van doorgaans rond de vijftig procent in de rosé, precies omdat de "
            "druif de body en het bewaarpotentieel levert die de lichtere Provence-stijl "
            "elders in de regio mist.\n\n"
            "Mourvèdre is een laatrijpende, warmteminnende druif met een relatief dikke schil, "
            "wat zelfs bij de kortere schilcontacttijd van rosévinificatie meetbaar meer "
            "kleurdiepte en fenolische structuur oplevert dan Grenache of Cinsault. De druif "
            "heeft bovendien een uitgesproken aardse, wild-hartige aromatiek — vaak omschreven "
            "als garrigue, leer of zelfs een lichte wildtoon — die in rode wijn nog "
            "explicieter is maar ook in rosé duidelijk herkenbaar blijft.\n\n"
            "Blindproefmarkers zijn: een diepere kleur dan een gemiddelde Provence-rosé, een "
            "merkbare fenolische grip, aardse en kruidige (garrigue) tonen, en een voller, "
            "structuurrijker mondgevoel met doorgaans hoger bewaarpotentieel dan de meeste "
            "andere roséstijlen. Bandol-rosé kan, in tegenstelling tot de meeste rosé die "
            "binnen het jaar wordt gedronken, enkele jaren positief evolueren dankzij deze "
            "Mourvèdre-structuur.\n\n"
            "Het verwarringsgevaar met Syrah is het spiegelbeeld van wat je bij Syrah leerde: "
            "Mourvèdre geeft een zwaardere, aardse, bijna wild-hartige garrigue-toon met meer "
            "tastbare grip, terwijl Syrah frisser, bloemiger en explicieter zwarte-peperig "
            "blijft. Proef bij twijfel altijd de textuur samen met de aromatiek: Mourvèdre "
            "voelt structuurrijker en aardser aan, Syrah lichter en kruidiger.\n\n"
            "Serveer Mourvèdre-gedomineerde rosé (zoals Bandol) bij 12–14°C — merkbaar warmer "
            "dan een klassieke Provence-rosé — in een breder glas dat de extra structuur en "
            "de aardse diepgang ruimte geeft."
        ),
        "samenvatting": (
            "- Bandol eist wettelijk een Mourvèdre-minimumaandeel van rond de vijftig procent "
            "in de rosé\n"
            "- Late rijping en dikkere schil geven meer kleurdiepte en fenolische structuur\n"
            "- Blindproefmarkers: diepere kleur, fenolische grip, aardse garrigue-tonen, "
            "voller mondgevoel\n"
            "- Bandol-rosé kan, anders dan de meeste rosé, enkele jaren positief evolueren\n"
            "- Grootste verwarringsgevaar is Syrah; test op structuurrijk-aards versus "
            "licht-kruidig"
        ),
        "food_pairing": fp(
            "Mourvèdre-gedomineerde rosé (Bandol) bij gegrilde inktvis met chorizo, geroosterd "
            "konijn, of een stevige Provençaalse groentetajine.",
            "De fenolische grip en aardse garrigue-toon van Mourvèdre geven voldoende "
            "tegenwicht aan de umami en de rokerige intensiteit van gegrild eiwit, iets waar "
            "een lichte Provence-rosé tekortschiet.",
            "Mourvèdre-gedomineerde rosé bij lichte, frisse zomersalades zonder eiwit — de "
            "structuur en diepgang zijn daarvoor te uitgesproken.",
        ),
        "pro_insight": (
            "Bij twijfel tussen Syrah- en Mourvèdre-invloed in een blend: proef eerst de "
            "textuur. Voel je duidelijke fenolische grip naast aardse, wild-hartige tonen, dan "
            "overheerst Mourvèdre; blijft de structuur lichter met een frissere, peperige top, "
            "dan overheerst Syrah."
        ),
        "kernbegrippen": [
            "Mourvèdre",
            "Bandol-minimumaandeel",
            "aardse-garrigue-diepgang",
            "Mourvèdre-Syrah-textuurtest",
            "bewaarpotentieel-via-Mourvèdre",
        ],
        "reflectievraag": (
            "Zou jij een Bandol-rosé nu bewust een of twee jaar laten liggen, wetend dat de "
            "Mourvèdre-structuur daar positief op kan reageren?"
        ),
    },
    25: {
        "theorie": (
            "Tempranillo is naast Garnacha de tweede pijler van Spaanse rosado, en de druif "
            "brengt een wezenlijk ander profiel mee: waar Garnacha (Grenache) van nature laag "
            "zuur en hoog alcohol geeft, behoudt Tempranillo een steviger zuurniveau en een "
            "directere, rood-fruitige structuur, wat rosado op basis van deze druif doorgaans "
            "gestructureerder en gastronomischer maakt dan een pure Garnacha-rosado.\n\n"
            "De druif is bovendien de enige van de twee met een sterke, historisch verankerde "
            "affiniteit met houtrijping: in Rioja en Ribera del Duero wordt een deel van de "
            "Tempranillo-rosado bewust kort op hout gerijpt of zelfs vergist (rosado "
            "fermentado en barrica), wat een subtiele vanille- of roostertoon toevoegt die je "
            "bij Garnacha-gedomineerde rosado zelden aantreft. Deze stijl positioneert "
            "Tempranillo-rosado nadrukkelijk als een gastronomisch, structuurrijker "
            "alternatief binnen het Spaanse rosado-aanbod.\n\n"
            "Blindproefmarkers zijn: rood fruit (rode bes, kers) met een directere, minder "
            "rijpe zoetheid dan Garnacha, een steviger zuurniveau, medium lichaam, en bij "
            "vatgerijpte versies een lichte vanille- of roostertoon. De kleur is doorgaans "
            "medium-diep roze, minder extreem bleek dan moderne Provence-imitaties maar ook "
            "minder donker dan traditionele Navarra-stijl.\n\n"
            "Het onderscheid met Garnacha-gedomineerde Spaanse rosado zit vooral in de "
            "zuur-fruitbalans: Tempranillo blijft directer en zuurgedrevener, terwijl Garnacha "
            "ronder en rijper aanvoelt met meer alcoholgevoel. In blends van beide druiven — "
            "veel voorkomend in Rioja en Navarra — proef je Tempranillo als de scherpere, "
            "structurerende laag onder het rondere Garnacha-fruit.\n\n"
            "Serveer Tempranillo-rosado bij 10–12°C; vatgerijpte versies profiteren van een "
            "iets hogere temperatuur (12–14°C) in een breder glas dat de houttonen en de extra "
            "structuur laat ontplooien."
        ),
        "samenvatting": (
            "- Tempranillo is naast Garnacha de tweede pijler van Spaanse rosado, met een "
            "steviger zuurniveau\n"
            "- Sterke affiniteit met houtrijping levert vatgerijpte rosado (fermentado en "
            "barrica) op\n"
            "- Blindproefmarkers: directer rood fruit, steviger zuur, medium lichaam, "
            "eventuele vanille/roostertoon\n"
            "- Onderscheid met Garnacha zit in de zuur-fruitbalans: directer versus ronder en "
            "rijper\n"
            "- In blends proef je Tempranillo als de structurerende laag onder het "
            "Garnacha-fruit"
        ),
        "food_pairing": fp(
            "Tempranillo-rosado bij gegrilde chorizo, patatas bravas, of een lichte "
            "lamsstoofpot.",
            "Het stevigere zuur en de directere roodfruitstructuur van Tempranillo-rosado "
            "matchen de kruidige, licht vette intensiteit van chorizo en gegrilde tapas, "
            "terwijl vatgerijpte versies extra weerklank vinden in geroosterde, "
            "houtskoolgegrilde gerechten.",
            "Tempranillo-rosado bij zeer lichte, delicate visgerechten — de stevigere "
            "structuur en eventuele houttoon overweldigen de subtiliteit.",
        ),
        "pro_insight": (
            "Proef in een Spaanse Tempranillo-Garnacha-rosadoblend eerst het zuur apart van "
            "het fruit: een scherpere, directere zuurlijn wijst op een groter aandeel "
            "Tempranillo, terwijl een rondere, alcoholrijkere indruk wijst op een groter "
            "aandeel Garnacha."
        ),
        "kernbegrippen": [
            "Tempranillo-rosado",
            "vatgerijpte-rosado-fermentado-en-barrica",
            "zuur-fruitbalans-Tempranillo-Garnacha",
            "gastronomische-structuurpositionering",
            "medium-diepe-kleurband",
        ],
        "reflectievraag": (
            "Zou jij een vatgerijpte Tempranillo-rosado nu voorstellen als serieus "
            "gastronomisch alternatief voor een lichte rode wijn bij tafel?"
        ),
    },
}
