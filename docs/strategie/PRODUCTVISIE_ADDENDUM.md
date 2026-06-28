# Addendum — productvisie (implementatie & open punten)

**Datum:** juni 2026 (bijgewerkt na strategie v2 / onderwijsmodel 1.1)  
**Bij:** [`PRODUCTVISIE.md`](PRODUCTVISIE.md) en Word-bronnen in [`strategie/`](strategie/)

Dit addendum legt vast hoe de visie aansluit op de repo, welke beslissingen open staan, en hoe we gefaseerd bouwen. Bij tegenstrijdigheid tussen dit addendum en een besluit van Romuald: het besluit wint.

**Bronbestanden (alleen Word):** zie [`strategie/README.md`](strategie/README.md).

---

## 1. Naamgeving — vastgelegd (optie B)

**Besluit (juni 2026):** overal **Way of tasting Academy** — strategie, repo, app en documentatie.

| Context | Naam |
|---------|------|
| Product, strategie, repo, app, Netlify | **Way of tasting Academy** |
| Moeder-ecosysteem (kelder, proeverij, scan) | **Way of tasting** |

**Terminologie specialisaties:** tracks binnen de Academy (Port, Wijn, Bier). Gamification-titels: Tasting Expert, Tasting Connoisseur, Master Tasting Professional, Master of Tasting.

---

## 2. Strategie v2 — wat verandert voor ontwikkeling

### Nieuw in onderwijsmodel 1.1

- **Curriculum Framework 2.0:** acht pijlers (Fundament → Expert).
- Leerprincipes herschikt; “progressieve complexiteit” vervangt expliciet “van eenvoudig naar complex” als apart principe (inhoudelijk gelijk aan vijf leerstappen).

### Nieuw in certificering v2

Certificaten zijn gekoppeld aan **pijlers**, niet alleen aan “alle lessen in niveau X”:

| Certificaat | Vereiste pijlers |
|-------------|------------------|
| Explorer | Fundament + Productie + Stijlen + basis Regio's |
| Specialist | Service + Pairing + verdieping |
| Master | Expert + praktijkportfolio + advies |

### Huidige Port-track vs framework (juni 2026)

| Module (seed) | `level` in DB | Pijler (framework) | Opmerking |
|---------------|---------------|-------------------|-----------|
| Introductie Port | explorer | Fundament (+ deels Productie) | ✓ |
| Portstijlen | explorer | Stijlen (+ Productie) | ✓ |
| Proeven | explorer | — | Nog geen vaste pijler; inhoud past bij Fundament/Proeven |
| De oorsprong van Port | explorer | Regio's | ✓ |
| Port in de praktijk | explorer | **Service + Pairing** | Volgens v2 **Specialist**-pijlers — herindeling wenselijk |
| Explorer afronding | explorer | Toets / certificaat | ✓ |
| Portstijlen verdiept | specialist | Specialist (verdieping) | ✓ |
| Madeira | specialist | Specialist / Expert | Besluit: eigen track of specialist-module |

**Geen acute code-refactor nodig** voor MVP (lessen, quiz, voortgang). Wel **content-architectuur** bijsturen vóór certificeringslogica v2.

### Open besluit: pijler in datamodel

Voor certificering v2 waarschijnlijk nodig:

- Kolom `pillar` op `academy.modules` (enum of text), of
- Mappingtabel pijler ↔ module

*Niet implementeren in MVP; wel niet blokkeren.*

---

## 3. Afstemming met technische scope (MVP)

[`BESLUIT_STACK.md`](BESLUIT_STACK.md) beperkt **v1** bewust:

| Wel in v1 (gebouwd of bezig) | Nog niet in v1 (north star) |
|------------------------------|----------------------------|
| Track, modules, lessen | Pijler-gebaseerde certificaten |
| Quiz + voortgang (📖 / 🧠, ≥70%) | Academy Points, badges, ranks |
| `level`: explorer / specialist / master op modules | Digitaal diploma |
| Zelfde Supabase-login als kelder | Master-portfolio |
| Lesstructuur volgens model 1.1 | AI-beoordeling proefnotities |
| Module-UI met inklapbare groepen | Hall of Achievement |

**DB-niveaus:** `academy.modules.level` gebruikt `explorer` · `specialist` · `master` (migratie `20260625140000`). Sluit aan op strategietaal.

---

## 4. Praktijkopdrachten — ontwerpkeuze

| Vraag | Richting (voorstel) |
|-------|---------------------|
| Wie beoordeelt vrije proefnotities? | Eerst zelfbeoordeling + checklist; later optioneel AI-feedback |
| Kelder-koppeling? | Les verwijst naar fles uit voorraad — [`INTEGRATIE.md`](INTEGRATIE.md) |
| Wat telt als “voltooid”? | `practice_completed` + optioneel proeflog in kelder |

*Actie:* uitwerken bij MVP+ (praktijk in les-UI).

---

## 5. Toegankelijkheid en leeftijd

Strategie v2 (missie): toegankelijk **binnen wettelijke leeftijdsgrenzen**.

- Alcohol-tracks: **18+** (of lokaal minimum), disclaimer in UI.
- Alcoholvrije tracks (fase 3): geen leeftijdsbarrière.

Opnemen in gebruiksvoorwaarden en track-intro bij livegang.

---

## 6. Academy Points — economie

Puntenverdeling uit cert v2 ongewijzigd. Bij implementatie:

- **Inflatie:** praktijk-AP en examens zwaarder laten meetellen dan alleen lezen.
- **Fraude:** punten alleen bij geverifieerde events.
- **Ranks vs. certificaat:** “Explorer” als AP-rang ≠ “Explorer-certificaat” per track — in UI scheiden.

AP-drempels per rank staan in `PRODUCTVISIE.md` (uit eerdere volledige uitwerking; v2 noemt alleen rangnamen).

---

## 7. Hall of Achievement

Vereist één profiel over alle tracks, regels voor combinaties, later `user_credentials` / `user_achievements`. Architectuur niet blokkeren (`auth.users`, schema `academy`).

---

## 8. AI-ondersteuning

Volgorde: vaste quiz → optionele AI-feedback (learn-only) → hybride Master-portfolio. v1: **geen** AI-beoordeling vrije tekst.

---

## 9. Aanbevolen bouwvolgorde

| Fase | Product | Sluit aan op visie |
|------|---------|-------------------|
| **MVP** ✓ | Login, track, les, quiz, voortgang, module-UI | Lesstructuur, leerstappen 1–2 |
| **MVP+** | Praktijk in UI, kelder-link | Leerstap 3–4, 30% praktijk |
| **v2** | Pijler-mapping, Explorer-certificaat (digitaal) | Certificering v2 Explorer |
| **v3** | AP, badges, ranks | Gamification |
| **v4** | Specialist/Master, portfolio, Hall of Achievement | Volledige structuur |

---

## 10. Content-start

Port-track (41 lessen) valideert lesstructuur in de praktijk. Bij herstructurering: modules hernoemen/herordenen naar Framework 2.0 zonder lesinhoud te verliezen. Zie [`CONTENT.md`](CONTENT.md) en `supabase/seed/academy_port.sql`.

---

## Wijzigingslog addendum

| Datum | Wijziging |
|-------|-----------|
| 2026-06-25 | Naamgeving vastgelegd: optie B — overal Way of tasting Academy |
| 2026-06-25 | Eerste versie — review na plaatsing strategiedocumenten |
| 2026-06-26 | Sync met strategie v2, onderwijsmodel 1.1, Framework 2.0; alleen Word als bron; Port-track mapping; PDF’s verwijderd |
