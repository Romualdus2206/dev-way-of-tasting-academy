# Strategiedocumenten — Way of Tasting

**Doel:** productvisie, architectuur en implementatierichting voor het **Way of Tasting**-ecosysteem (dranken-app + Academy + Moment/kalender).

**Leidraad voor bouwen & integratie:** [`STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md`](STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md) — audit t.o.v. code, multi-repo, volgorde van werk.

**Technisch integratiecontract (2 repos):** [`../INTEGRATIE.md`](../INTEGRATIE.md)

---

## Leesvolgorde

1. **Ecosysteem** — [`WAY_OF_TASTING_ARCHITECTURE_V2.md`](WAY_OF_TASTING_ARCHITECTURE_V2.md)
2. **Tier 1 — Principes** — missie, onderwijs, certificering, gamification-basis
3. **Tier 2 — Implementatie** — engagement, beloningen, UI-plaatsing
4. **Tier 3 — Later** — leaderboards, community, events, economy
5. **Data & stack** — datamodel, BESLUIT_STACK

---

## Tier 1 — Principes (v2)

| Document | Inhoud |
|----------|--------|
| [`Tier 1 - WoT — Missie en visie v2.md`](Tier%201%20-%20WoT%20—%20Missie%20en%20visie%20v2.md) | Missie, visie, kernwaarden, ecosysteem |
| [`Tier 1 - WoT — Productvisie v2.md`](Tier%201%20-%20WoT%20—%20Productvisie%20v2.md) | Productscope Academy binnen WoT |
| [`Tier 1 - WoT — Onderwijsmodel v2.md`](Tier%201%20-%20WoT%20—%20Onderwijsmodel%20v2.md) | Framework 2.0, lesstructuur, leerprincipes |
| [`Tier 1 - WoT — Certificerings- en Puntensysteem v2.md`](Tier%201%20-%20WoT%20—%20Certificerings-%20en%20Puntensysteem%20v2.md) | Explorer/Specialist/Master, Academy Points, ranks |
| [`Tier 1 - WoT — Gamification System v1.md`](Tier%201%20-%20WoT%20—%20Gamification%20System%20v1.md) | XP, loops, gedragsprincipes, collecties |

---

## Tier 2 — Implementatie (v1)

| Document | Inhoud | Leidend voor |
|----------|--------|--------------|
| [`Tier 2 - WoT — Engagement Logica v1.md`](Tier%202%20-%20WoT%20—%20Engagement%20Logica%20v1.md) | Events, triggers, streaks, XP-regels | Backend, Supabase, progress engine |
| [`Tier 2 - WoT — Beloningscatalogus v1.md`](Tier%202%20-%20WoT%20—%20Beloningscatalogus%20v1.md) | Badges, cosmetics, trophies | Reward-definities |
| [`Tier 2 - WoT — UI Gamification Plaatsing v1.md`](Tier%202%20-%20WoT%20—%20UI%20Gamification%20Plaatsing%20v1.md) | Waar XP/streak/badges in UI staan | Frontend kelder + Academy |

---

## Tier 3 — Uitbreiding (v1, later)

| Document | Inhoud |
|----------|--------|
| [`Tier 3 - WoT — Leaderboard System v1.md`](Tier%203%20-%20WoT%20—%20Leaderboard%20System%20v1.md) | Rankings, reset, vrienden/event/global |
| [`Tier 3 - WoT — Community System v1.md`](Tier%203%20-%20WoT%20—%20Community%20System%20v1.md) | Groepen, feed, gedeelde proeverijen |
| [`Tier 3 - WoT — Seasonal Events v1.md`](Tier%203%20-%20WoT%20—%20Seasonal%20Events%20v1.md) | Seizoensevents, kalender |
| [`Tier 3 - WoT — Economy Balancing v1.md`](Tier%203%20-%20WoT%20—%20Economy%20Balancing%20v1.md) | Balans XP, schaarste, inflatie |

**Niet bouwen vóór Tier 2 MVP** (progress + basis-beloningen) stabiel is.

---

## Architectuur & data

| Document | Inhoud |
|----------|--------|
| [`WAY_OF_TASTING_ARCHITECTURE_V2.md`](WAY_OF_TASTING_ARCHITECTURE_V2.md) | Tab-structuur WoT: Drank, Moment, Pairing, Proeverij, Academy, Community |
| [`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md) | Fysiek DB-model Academy (tracks, modules, progress) |
| [`DATAMODEL_V1_ONTWERP.md`](DATAMODEL_V1_ONTWERP.md) | Conceptueel datamodel |
| [`DATAMODEL.md`](DATAMODEL.md) | Overzicht / historie |
| [`BESLUIT_STACK.md`](BESLUIT_STACK.md) | Tech stack-besluiten |

---

## Implementatie & visie (repo-specifiek)

| Document | Inhoud |
|----------|--------|
| [`PRODUCTVISIE.md`](PRODUCTVISIE.md) | Samenvatting productvisie |
| [`PRODUCTVISIE_ADDENDUM.md`](PRODUCTVISIE_ADDENDUM.md) | Repo-afstemming, Port vs framework, open punten |

**Content-gaps (Academy):** [`../gaps/README.md`](../gaps/README.md)

---

## Word-bronnen (archief)

Oudere Word-exporten blijven beschikbaar als archief; **markdown in deze map is leidend** voor ontwikkeling.

| Onderwerp | Word (archief) |
|-----------|----------------|
| Missie & visie | `Missie_en_Visie_Way_of_Tasting_Academy.docx` |
| Onderwijsmodel 1.1 | `Onderwijsmodel_1_1_Way_of_Tasting_Academy.docx` |
| Certificering & AP v2 | `Certificerings_en_Puntensysteem_Way_of_Tasting_Academy_v2.docx` |

**Naamgeving:** overal **Way of Tasting Academy** binnen het ecosysteem **Way of Tasting** (besluit juni 2026).

---

## Repo’s in het ecosysteem

Lokaal: allemaal onder **`~/Development/Ecosysteem-drank/`** (juni 2026).

| Map | Rol | Schema / scope |
|-----|-----|----------------|
| **`dev-way-of-wine-exploring-app`** | Hoofdapp (Drank, kelder, scan, profiel) — **host** | `public.*` |
| **`dev-way-of-tasting-academy`** | Academy (content, seeds, LMS-web) | `academy.*` |
| **`biodynamische-kalender`** | Moment-engine (timing, dagtypes, weer) | TBD — tab 🌙 in host |

**Parent map:** [`../../../README.md`](../../../README.md) · **Cursor:** [`../../../Way-of-Tasting.code-workspace`](../../../Way-of-Tasting.code-workspace)

Zie [`STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md`](STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md) §4.
