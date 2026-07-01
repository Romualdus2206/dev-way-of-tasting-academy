#!/usr/bin/env python3
"""Prepare content/archive/repair/BIO_REPAIR_CONTENT.md for merge into BIO_MODULES.md."""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SOURCE_PATH = ROOT / "content/BIO_REPAIR_SOURCE.md"
REPAIR_PATH = ROOT / "content/archive/repair/BIO_REPAIR_CONTENT.md"
MODULES_PATH = ROOT / "content/archive/legacy/BIO_MODULES.md"

# Lessons that compare the same wine on multiple day types / need calendar weeks
MULTI_DAY_LESSONS = {3, 11, 12, 13, 14, 15, 21, 37, 39}

# Titels die de repair bewust wijzigt t.o.v. oude BIO_MODULES (merge: slug/quiz meenemen)
TITLE_OVERRIDE: dict[int, str] = {
    34: "Voorraadstrategie voor topflessen",
    35: "Reserves en lange termijn denken",
    36: "Vertical tasting en biodynamiek",
    37: "Blindproeven en timing",
    38: "Grote flessen en biodynamiek",
    39: "Pairing en dagtypes",
    40: "Je eigen biodynamische systeem bouwen",
    41: "Het perfecte drinkmoment herkennen",
    42: "Timing versus kwaliteit",
    43: "Jouw persoonlijke voorkeurspatronen",
    44: "Open examen",
    45: "Biodynamisch meesterschap",
}

LEERDOEL: dict[int, str] = {
    1: "Na deze les kun jij uitleggen wat biodynamisch proeven is, waarom timing relevant kan zijn en hoe je observatie centraal zet — zonder het als geloof te framen.",
    2: "Na deze les begrijp jij Maria Thuns bijdrage en waarom haar kalender vandaag nog wordt gebruikt om drinkmomenten strategisch te kiezen.",
    3: "Na deze les kun jij de vier dagtypen benoemen, herkennen en hun effect op wijnstructuur en fruit inschatten.",
    4: "Na deze les begrijp jij hoe aarde, water, lucht en vuur de vier dagtypen verklaren en hoe je dat toepast per drankcategorie.",
    5: "Na deze les begrijp jij waarom sommeliers en wijnmakers biodynamische timing inzetten voor topflessen, blends en belangrijke diners.",
    6: "Na deze les herken jij wanneer een Worteldag analytisch waardevoller is dan charmant, en wat dat betekent voor structuur en bewaarpotentieel.",
    7: "Na deze les begrijp jij hoe Bladdagen frisheid en vegetale tonen versterken en wanneer dat minder ideaal is voor topwijnen.",
    8: "Na deze les begrijp jij waarom Bloemdagen finesse en aromatische elegantie naar voren brengen.",
    9: "Na deze les begrijp jij waarom Vruchtdagen vaak de meest open en harmonieuze proefmomenten geven.",
    10: "Na deze les kun jij zelfstandig de biodynamische kalender lezen en dagtypes vooruit plannen.",
    11: "Na deze les herken jij hoe wijn zich op een Worteldag gedraagt: meer structuur, minder open fruit.",
    12: "Na deze les herken jij hoe Bladdagen wijn frisser en soms groener laten overkomen.",
    13: "Na deze les herken jij aromatische finesse en elegantie op Bloemdagen.",
    14: "Na deze les herken jij maximale fruitexpressie en balans op Vruchtdagen.",
    15: "Na deze les kun jij een eerste vergelijkproef op verschillende dagtypes zelfstandig opzetten en documenteren.",
    16: "Na deze les begrijp jij hoe buitentemperatuur smaakwaarneming beïnvloedt, los van serveertemperatuur.",
    17: "Na deze les begrijp jij hoe luchtdruk aromatische helderheid kan beïnvloeden en waarom proevers daar rekening mee houden.",
    18: "Na deze les begrijp jij hoe luchtvochtigheid geur en mondgevoel kan veranderen.",
    19: "Na deze les begrijp jij waarom weersomslagen instabiele proefmomenten geven en wanneer wachten slimmer is.",
    20: "Na deze les begrijp jij het verschil tussen vandaag-advies (Dynamic Advice) en vooruitplanning (Strategic Advice) in de kelder-app.",
    21: "Na deze les begrijp jij hoe rode wijn per dagtype verschilt in tannine, fruit en drinkbaarheid.",
    22: "Na deze les begrijp jij hoe witte wijn per dagtype verschilt in mineraliteit, finesse en frisheid.",
    23: "Na deze les begrijp jij hoe rosé het sterkst reageert op Vrucht- en Bloemdagen.",
    24: "Na deze les begrijp jij hoe mousserende wijn per dagtype verschilt in finesse, mousse en spanning.",
    25: "Na deze les begrijp jij hoe Port per dagtype verschilt in zoetheid, structuur en rijpingsexpressie.",
    26: "Na deze les begrijp jij hoe bier anders kan overkomen op biodynamische dagtypes.",
    27: "Na deze les begrijp jij waarom alcoholvrije bieren soms extra gevoelig zijn voor timing.",
    28: "Na deze les begrijp jij hoe cocktails en dagtypes samenhangen in balans en frisheid.",
    29: "Na deze les begrijp jij hoe barrel-aged dranken reageren op structuur- versus fruitdagen.",
    30: "Na deze les begrijp jij hoe je alcoholvrije momenten strategisch kiest op basis van dagtype en context.",
    31: "Na deze les kun jij bepalen welke fles het best past bij welk moment in je voorraad.",
    32: "Na deze les kun jij inschatten wanneer wachten beter is dan openen.",
    33: "Na deze les kun jij drinkvensters koppelen aan biodynamische dagtypes voor optimale timing.",
    34: "Na deze les kun jij topflessen in je voorraad strategisch markeren en vooruit plannen.",
    35: "Na deze les kun jij reserveflessen en lange-termijn openingsmomenten bewust plannen.",
    36: "Na deze les begrijp jij hoe vertical tastings en dagtypes samenwerken bij jaargangsvergelijking.",
    37: "Na deze les begrijp jij hoe timing blindproefresultaten kan beïnvloeden en waarom je dagtype noteert.",
    38: "Na deze les begrijp jij hoe grote formaten anders rijpen en waarom timing bij Magnums extra belangrijk is.",
    39: "Na deze les begrijp jij hoe food pairing verandert door dagtype en expressie van de wijn.",
    40: "Na deze les kun jij een persoonlijk biodynamisch observatiesysteem opbouwen op basis van eigen data.",
    41: "Na deze les herken jij wanneer dagtype, weer, drinkvenster en context samenkomen in een topmoment.",
    42: "Na deze les begrijp jij dat timing kwaliteit ontsluit — niet vervangt.",
    43: "Na deze les herken jij je persoonlijke voorkeurspatronen per dagtype en wijnstijl.",
    44: "Na deze les voer je een open integratie-analyse uit over alle geleerde lagen van biodynamisch proeven.",
    45: "Na deze les formuleer jij je persoonlijke biodynamische drinkstrategie als actieve proever.",
}

SAMENVATTING: dict[int, list[str]] = {
    1: [
        "Smaakbeleving is niet constant; timing kan expressie veranderen",
        "Biodynamisch proeven = observatie en patroonherkenning, geen geloof",
        "Complexe wijnen (Bourgogne, Barolo, Vintage Port) lijken gevoelig voor ritme",
        "In de app: tab Advies helpt beoordelen of vandaag een slim openingsmoment is",
    ],
    20: [
        "Vandaag-advies (Dynamic): dagtype + weer → wat drink ik nu?",
        "Vooruitblik (Strategic): kalender + drinkvenster → wanneer open ik deze fles?",
        "Spontane keuzes en lange-termijnplanning versterken elkaar",
        "In de app: Advies-dashboard combineert beide lagen",
    ],
}

WOT_BY_LESSON: dict[int, str | None] = {
    1: "Tab **Advies** in de kelder-app: hero en dagscore helpen bepalen of vandaag een slim openingsmoment is.",
    2: "In **Advies → vooruitblik** zie je komende Vrucht- en Worteldagen om flessen vooraf te koppelen.",
    3: None,
    4: "Dagtype in Advies bepaalt mede welke stijlen worden aanbevolen bij warm of koel weer.",
    5: "Voorraad, pairing en educatie komen samen in kelder **Drank** + **Advies**.",
    10: "Open de maandkalender via Advies voor het volledige dagdetail per datum.",
    15: "Noteer proefmomenten in je eigen journal; koppel later aan Advies-scores.",
    20: "**Advies** = vandaag-advies; **vooruitblik** = Strategic planning voor topflessen.",
    34: "Markeer topflessen in Drank en plan openingsdagen via de kalender in Advies.",
    40: "Bouw je profiel op via herhaalde observaties — Advies wordt persoonlijker naarmate je meer proeft.",
    41: None,
    44: None,
    45: "Je persoonlijke strategie gebruik je dagelijks via Advies, voorraad en Academy-voortgang.",
}

PRACTIJK_OVERRIDES: dict[int, tuple[str, list[str]]] = {
    15: (
        """Voer één gecontroleerd vergelijkexperiment uit met dezelfde fles op vier dagtypes.

Kies één fles en proef deze op:
- Worteldag
- Bladdag
- Bloemdag
- Vruchtdag

Noteer telkens:
- fruit
- structuur
- openheid
- balans
- drinkbaarheid

*Plan dit over minimaal twee weken; houd glas, temperatuur en context gelijk.*""",
        [],
    ),
    42: (
        """Vergelijk:
- een topwijn op een minder gunstig moment
- een goede wijn op een sterk moment

Analyseer:
- balans
- plezier
- expressie
- memorabiliteit""",
        [],
    ),
}


def parse_modules_titles() -> dict[int, str]:
    text = MODULES_PATH.read_text(encoding="utf-8")
    titles: dict[int, str] = {}
    for m in re.finditer(r"^# LES (\d+) — (.+)$", text, re.M):
        titles[int(m.group(1))] = m.group(2).strip()
    return titles


def extract_section(body: str, name: str) -> str:
    m = re.search(rf"^## {re.escape(name)}\s*\n(.*?)(?=\n## |\Z)", body, re.M | re.S)
    if not m:
        return ""
    text = m.group(1).strip()
    text = re.sub(r"(?:\n---\s*)+$", "", text)
    return text.strip()


def extract_subsection(block: str, name: str) -> str:
    m = re.search(rf"^### {re.escape(name)}\s*\n(.*?)(?=^### |\Z)", block, re.M | re.S)
    if not m:
        return ""
    text = m.group(1).strip()
    text = re.sub(r"(?:\n---\s*)+$", "", text)
    return text.strip()


def parse_bullets(text: str) -> list[str]:
    bullets: list[str] = []
    for ln in text.splitlines():
        ln = ln.strip()
        if re.match(r"^[-*]\s+", ln):
            bullets.append(re.sub(r"^[-*]\s+", "", ln).strip())
    return bullets


SETUP_MARKERS = (
    "een ",
    "één ",
    "twee ",
    "drie ",
    "vier ",
    "vijf ",
    "jong",
    "op dronk",
    "rijp",
    "huidige",
    "actief",
    "warme",
    "koelere",
    "hoge ",
    "lage ",
    "rode wijn",
    "witte wijn",
    "mousserend",
    "bier",
    "favoriete dagtype",
    "één fles voor",
    "een topwijn",
    "een goede wijn",
    "ideale openingsperiode",
    "verwachte piek",
    "volgende ",
    "stabielste",
    "eventuele",
    "wisselmomenten",
)

OBSERVATION_HINTS = (
    "fruit",
    "tannine",
    "balans",
    "lengte",
    "mineral",
    "zuur",
    "openheid",
    "finesse",
    "structuur",
    "complexiteit",
    "mousse",
    "geur",
    "spanning",
    "frisheid",
    "groenheid",
    "vegetale",
    "bitter",
    "zoet",
    "body",
    "harmonie",
    "plezier",
    "expressie",
    "memorabiliteit",
    "drinkbaarheid",
    "herkenbaarheid",
    "precisie",
    "focus",
    "alcohol",
    "hout",
    "decanteer",
    "temperatuur",
    "moment",
    "openingsstrategie",
    "bewaar",
    "aromatische",
    "fruitintensiteit",
    "tanninestructuur",
    "mondgevoel",
    "hoparoma",
    "zoetheid",
    "waarom",
    "pairing",
)


def reconcile_opdracht_checklist(opdracht: str, checklist: list[str]) -> tuple[str, list[str]]:
    if not checklist:
        return opdracht.strip(), []

    opdracht = re.sub(
        r"(?:\n\*Plan dit (?:experiment )?over[^*]+\*)+",
        "",
        opdracht,
        flags=re.I,
    ).strip()

    for marker in ("noteer", "analyseer"):
        if checklist and re.search(rf"\b{marker}:\s*\n", opdracht, re.I):
            if not re.search(r"Vergelijk:\s*\n\s*-", opdracht):
                m = re.search(rf"(\b{marker}:\s*\n)", opdracht, re.I)
                if m:
                    bullets = "\n".join(f"- {b}" for b in checklist) + "\n"
                    opdracht = opdracht[: m.end()] + bullets + opdracht[m.end() :]
                    return opdracht.strip(), []

    if re.search(r"(noteer|analyseer|Noteer telkens):\s*$", opdracht):
        merged = opdracht + "\n" + "\n".join(f"- {b}" for b in checklist)
        return merged.strip(), []

    split_idx = 0
    for i, item in enumerate(checklist):
        low = item.lower()
        if any(low.startswith(m) or m in low for m in SETUP_MARKERS):
            split_idx = i + 1
        elif any(h in low for h in OBSERVATION_HINTS):
            break
        else:
            split_idx = i + 1

    setup = checklist[:split_idx]
    obs = checklist[split_idx:]

    if setup:
        opdracht = opdracht.rstrip() + "\n" + "\n".join(f"- {b}" for b in setup)

    if obs:
        if re.search(r"(Vergelijk|Analyseer|Plan voor beide|Bepaal voor elke fles|noteer telkens):\s*$", opdracht, re.I):
            opdracht = opdracht.rstrip() + "\n" + "\n".join(f"- {b}" for b in obs)
            obs = []
        elif not setup and re.search(r":\s*$", opdracht):
            opdracht = opdracht.rstrip() + "\n" + "\n".join(f"- {b}" for b in obs)
            obs = []

    return opdracht.strip(), obs


def dedupe_lines(text: str) -> str:
    seen: set[str] = set()
    out: list[str] = []
    for ln in text.splitlines():
        key = ln.strip()
        if key.startswith("*Plan dit") and key in seen:
            continue
        if key and key in seen and not key.startswith("- "):
            continue
        if key:
            seen.add(key)
        out.append(ln)
    return "\n".join(out).strip()


def parse_praktijk_structured(body: str) -> tuple[str, list[str], str]:
    block = extract_section(body, "Praktijkopdracht")
    if not block or "### Opdracht" not in block:
        return "", [], ""

    opdracht = dedupe_lines(extract_subsection(block, "Opdracht"))
    checklist = parse_bullets(extract_subsection(block, "Checklist"))
    reflectie = extract_subsection(block, "Reflectievraag").strip()
    if not reflectie:
        reflectie = extract_section(body, "Reflectievraag").strip()

    opdracht, checklist = reconcile_opdracht_checklist(opdracht, checklist)
    return opdracht, checklist, reflectie


def recover_praktijk_reflectie(body: str) -> tuple[str, list[str], str]:
    reflectie = ""
    for m in re.finditer(
        r"### Reflectievraag\s*\n+(.+?)(?=\n---|\n# |\n## |\Z)",
        body,
        re.S,
    ):
        t = re.sub(r"\s+", " ", m.group(1).strip())
        if t and "volgende proefmoment" not in t.lower() and len(t) > 12:
            reflectie = t
            break

    opdracht, checklist, structured_reflectie = parse_praktijk_structured(body)
    if structured_reflectie:
        reflectie = structured_reflectie
    if opdracht:
        return opdracht, checklist, reflectie

    legacy = extract_section(body, "Praktijkopdracht Repair") or extract_section(body, "Praktijkopdracht")
    return legacy, [], reflectie


def parse_repair_lessons(text: str) -> list[dict]:
    chunks = re.split(r"(?=^# LES \d+ — )", text, flags=re.M)
    lessons: list[dict] = []
    for chunk in chunks:
        if not chunk.strip().startswith("# LES"):
            continue
        header = re.match(r"^# LES (\d+) — (.+)$", chunk, re.M)
        if not header:
            continue
        num = int(header.group(1))
        body = chunk[header.end() :]

        if "Theorie Repair" in body or "Sommelier Insight" in body:
            def section(name: str) -> str:
                m = re.search(
                    rf"^## {re.escape(name)}\s*\n(.*?)(?=^## |\Z)",
                    body,
                    re.M | re.S,
                )
                return m.group(1).strip() if m else ""

            praktijk_raw = section("Praktijkopdracht Repair") or section("Praktijkopdracht")
            opdracht, checklist, reflectie = split_praktijk_legacy(praktijk_raw)
            lessons.append(
                {
                    "num": num,
                    "theorie": section("Theorie Repair") or section("Theorie"),
                    "wist": section("Sommelier Insight") or section("Wist-je-dat"),
                    "wot_old": section("Way of Tasting Link"),
                    "opdracht": opdracht,
                    "checklist": checklist,
                    "reflectie": reflectie or section("Reflectievraag Repair") or section("Reflectievraag"),
                }
            )
        else:
            opdracht, checklist, reflectie = parse_praktijk_structured(body)
            if not opdracht:
                opdracht, checklist, reflectie = recover_praktijk_reflectie(body)
            lessons.append(
                {
                    "num": num,
                    "theorie": extract_section(body, "Theorie"),
                    "wist": extract_section(body, "Wist-je-dat"),
                    "wot_old": "",
                    "opdracht": opdracht,
                    "checklist": checklist,
                    "reflectie": reflectie,
                }
            )
    return lessons


def split_praktijk_legacy(raw: str) -> tuple[str, list[str], str]:
    if not raw.strip():
        return "", [], ""
    if "### Opdracht" in raw:
        fake_body = f"## Praktijkopdracht\n\n{raw}"
        return parse_praktijk_structured(fake_body)
    opdracht, checklist = split_praktijk(raw)
    return opdracht, checklist, ""


def split_praktijk(raw: str) -> tuple[str, list[str]]:
    lines = [ln.strip() for ln in raw.strip().splitlines() if ln.strip()]
    opdracht_parts: list[str] = []
    bullets: list[str] = []
    for ln in lines:
        if re.match(r"^[-*]\s+", ln):
            bullets.append(re.sub(r"^[-*]\s+", "", ln).strip())
        else:
            opdracht_parts.append(ln)
    if opdracht_parts:
        opdracht = opdracht_parts[0]
        if len(opdracht_parts) > 1:
            opdracht += "\n\n" + "\n".join(opdracht_parts[1:])
    elif bullets:
        opdracht = bullets[0]
        bullets = bullets[1:]
    else:
        opdracht = ""
    return opdracht, bullets


def guess_samenvatting(num: int, theorie: str, wot: str | None) -> list[str]:
    if num in SAMENVATTING:
        return SAMENVATTING[num]
    bullets: list[str] = []
    for sent in re.split(r"(?<=[.!?])\s+", theorie.replace("\n", " ")):
        s = sent.strip()
        if len(s) < 25 or len(s) > 120:
            continue
        if any(
            kw in s.lower()
            for kw in (
                "biodynam",
                "dagtype",
                "wortel",
                "blad",
                "bloem",
                "vrucht",
                "timing",
                "proef",
                "wijn",
                "structuur",
                "fruit",
                "weer",
                "voorraad",
                "pairing",
            )
        ):
            bullets.append(s.rstrip("."))
        if len(bullets) >= 3:
            break
    fillers = [
        "Observatie en vergelijking zijn belangrijker dan vaste regels",
        "Timing kan expressie versterken of afzwakken",
        "Noteer dagtype en weer bij elke serieuze proef",
    ]
    for f in fillers:
        if len(bullets) >= 3:
            break
        if f not in bullets:
            bullets.append(f)
    if wot and len(bullets) < 4:
        bullets.append(wot if wot.startswith("In de app") or wot.startswith("Tab") else f"In de app: {wot}")
    return bullets[:4]


def wot_for_lesson(num: int, old: str) -> str | None:
    if num in WOT_BY_LESSON:
        return WOT_BY_LESSON[num]
    if num >= 26 and num % 3 != 0:
        return None
    patterns = [
        "Tab **Advies**: dagscore en weer helpen deze les in de praktijk te toetsen.",
        "Koppel je voorraad in **Drank** aan het huidige dagtype via Advies.",
        "Gebruik **vooruitblik** om het juiste dagtype voor deze fles te kiezen.",
        "Het dagdetail (via Bekijk dagadvies) toont weer en wijnadvies per tijdvak.",
    ]
    if old and "Strategic" in old:
        return "Plan topmomenten via **vooruitblik** in Advies — niet alleen op gevoel."
    if old and "Dynamic" in old:
        return "Vandaag-advies in **Advies** combineert dagtype met actueel weer."
    return patterns[num % len(patterns)]


def shorten_wot(text: str | None) -> str | None:
    if not text:
        return None
    text = text.replace("Way of Tasting", "de kelder-app").replace("Way of Tasting Link", "").strip()
    text = re.sub(r"\s+", " ", text)
    if len(text) > 140:
        text = text[:137].rstrip() + "…"
    return text


def format_lesson(num: int, title: str, data: dict) -> str:
    theorie = data["theorie"]
    wist = data["wist"]
    wot = shorten_wot(wot_for_lesson(num, data.get("wot_old", "")))
    samenvatting = guess_samenvatting(num, theorie, wot)
    opdracht = dedupe_lines(data.get("opdracht", ""))
    checklist = data.get("checklist") or []
    if not opdracht and data.get("praktijk"):
        opdracht, checklist = split_praktijk(data["praktijk"])
    reflectie = data.get("reflectie", "")

    planning_note = ""
    if num in MULTI_DAY_LESSONS:
        planning_note = "*Plan dit experiment over 2–4 weken zodat je elk dagtype onder vergelijkbare omstandigheden proeft.*"
    if num == 15:
        planning_note = "*Plan dit over minimaal twee weken; houd glas, temperatuur en context gelijk.*"

    if planning_note and planning_note not in opdracht:
        opdracht = (opdracht + "\n\n" + planning_note).strip()

    if num == 15 and not opdracht.lower().startswith("voer één gecontroleerd"):
        opdracht = (
            "Voer één gecontroleerd vergelijkexperiment uit met dezelfde fles op vier dagtypes.\n\n"
            + opdracht
        ).strip()

    if num in PRACTIJK_OVERRIDES:
        opdracht, checklist = PRACTIJK_OVERRIDES[num]

    if num == 20:
        theorie = re.sub(
            r" \(vandaag-advies in de app\)(?: \(vandaag-advies in de app\))*",
            " (vandaag-advies in de app)",
            theorie,
        )
        theorie = re.sub(
            r" \(vooruitblik / langetermijnplanning\)(?: \(vooruitblik / langetermijnplanning\))*",
            " (vooruitblik / langetermijnplanning)",
            theorie,
        )
        if "vandaag-advies" not in theorie:
            theorie = theorie.replace(
                "Dynamic Advice",
                "Dynamic Advice (vandaag-advies in de app)",
            ).replace(
                "Strategic Advice",
                "Strategic Advice (vooruitblik / langetermijnplanning)",
            )

    lines = [
        f"# LES {num} — {title}",
        "",
        "## Leerdoel",
        "",
        LEERDOEL.get(num, f"Na deze les pas je de inhoud van les {num} toe in je eigen proefpraktijk."),
        "",
        "---",
        "",
        "## Theorie",
        "",
        theorie,
        "",
        "---",
        "",
        "## Wist-je-dat",
        "",
        wist or "Ervaren proevers noteren dagtype en weer naast elke serieuze proefnotitie.",
        "",
        "---",
        "",
        "## Samenvatting",
        "",
    ]
    for b in samenvatting:
        lines.append(f"- {b}")
    lines.extend(["", "---", "", "## Praktijkopdracht", "", "### Opdracht", "", opdracht or "Pas deze les toe op één fles uit je voorraad.", ""])
    if checklist:
        lines.extend(["### Checklist", ""])
        for item in checklist:
            lines.append(f"- {item}")
        lines.append("")
    lines.extend(["### Reflectievraag", "", reflectie or "Wat neem je mee naar je volgende proefmoment?", ""])
    return "\n".join(lines)


def main() -> int:
    input_path = SOURCE_PATH if SOURCE_PATH.exists() else REPAIR_PATH
    raw = input_path.read_text(encoding="utf-8")
    titles = parse_modules_titles()
    lessons = parse_repair_lessons(raw)
    if len(lessons) != 45:
        raise SystemExit(f"Expected 45 lessons, found {len(lessons)}")

    header = """# BIO_REPAIR_CONTENT.md

> **Status:** samengevoegd in [`BIO_MODULES.md`](BIO_MODULES.md) (45 lessen).  
> **Bron voorbereiding:** `scripts/prepare_bio_repair_content.py`  
> **Merge:** `scripts/merge_bio_repair_content.py`

## Opmerking curriculum (LES 34–45)

Deze repair bevat vernieuwde inhoud voor module 7–9. **LES 34–45** hebben nieuwe titels t.o.v. de oude `BIO_MODULES.md`; bij merge worden slugs en quizzen daarop afgestemd.

## Herbruikbaarheid

Bewaar je ruwe rewrite als `BIO_REPAIR_SOURCE.md` (formaat `Theorie Repair` / `Sommelier Insight`).  
Draai `python3 scripts/prepare_bio_repair_content.py` alleen op dat bronbestand — niet op dit merge-klare bestand.

## Sectiestructuur (Academy-formaat)

| Sectie | Bron |
|--------|------|
| `## Leerdoel` | Bijgewerkt, specifieker |
| `## Theorie` | Premium rewrite |
| `## Wist-je-dat` | Sommelier Insight |
| `## Samenvatting` | 3–4 bullets + optionele app-link |
| `## Praktijkopdracht` | Opdracht + Checklist + Reflectievraag |

Quiz, quiz-feedback en kernbegrippen blijven bij merge uit bestaande `BIO_MODULES.md`.

---

"""

    parts = [header]
    for les in sorted(lessons, key=lambda x: x["num"]):
        num = les["num"]
        title = TITLE_OVERRIDE.get(num, titles.get(num, f"Les {num}"))
        parts.append(format_lesson(num, title, les))
        parts.append("\n")

    REPAIR_PATH.write_text("\n".join(parts).rstrip() + "\n", encoding="utf-8")
    print(f"Prepared {len(lessons)} lessons → {REPAIR_PATH.name}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
