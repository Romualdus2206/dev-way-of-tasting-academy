# Cursor-overdracht — Way of tasting Academy

**Doel van dit bestand:** snelle start in een **nieuwe Cursor-chat** na openen van de Academy-map of het ecosysteem-workspace.

**Workspace (aanbevolen):** `~/Development/Ecosysteem-drank/Way-of-Tasting.code-workspace`

---

## Wat dit project is

Aparte **sommelier-opleiding** (web), gekoppeld aan de kelder-app via **hetzelfde Supabase-project**.

| | Academy (deze repo) | Kelder-app | Kalender |
|---|---------------------|------------|----------|
| **Map** | `~/Development/Ecosysteem-drank/dev-way-of-tasting-academy` | `~/Development/Ecosysteem-drank/dev-way-of-wine-exploring-app` | `~/Development/Ecosysteem-drank/biodynamische-kalender` |
| **Schema** | `academy` | `public` | TBD (Moment) |
| **Live** | nog niet | [way-of-tasting.netlify.app](https://way-of-tasting.netlify.app) | lokaal |

**Integratiecontract (verplicht lezen):** [`docs/INTEGRATIE.md`](INTEGRATIE.md) v1.1  
**Ecosysteem-leidraad:** [`docs/strategie/STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md`](strategie/STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md)  
**Productrichting:** [`docs/PRODUCTVISIE.md`](PRODUCTVISIE.md) · open punten: [`docs/PRODUCTVISIE_ADDENDUM.md`](PRODUCTVISIE_ADDENDUM.md)

---

## Huidige stand (v0.1.0)

- Documentatie compleet (`docs/`, `PENDING_RELEASE.md`)
- Supabase-migratie + demo-seed **klaar in repo**, nog **niet** uitgevoerd op productie tenzij jij dat al deed
- Vite-skeleton in `web/` — login + cursuslijst (placeholder MVP)
- `packages/academy-shared/` — types + quiz-scoring
- **Geen git** geïnitialiseerd in deze map (tenzij jij dat intussen deed)
- **Geen Netlify** — nog niet live

---

## Eerste taken (aanbevolen volgorde)

1. `npm install` + `cp web/.env.example web/.env` (zelfde `VITE_SUPABASE_*` als kelder `web/.env`)
2. Migratie + seed — zie [`docs/SUPABASE.md`](SUPABASE.md)
3. Dashboard: **API → Exposed schemas** → `academy` toevoegen
4. `npm run dev` → http://localhost:5173 → inloggen met **kelder-account**
5. Verwacht: **5 Port-lessen** na seed `academy_port.sql`

**Daarna (MVP):** lesdetail, quiz-UI, voortgang (`user_lesson_progress`) — zie [`docs/WEB_PLAN.md`](WEB_PLAN.md).

---

## Belangrijke bestanden

| Bestand | Waarom |
|---------|--------|
| [`docs/PRODUCTVISIE.md`](PRODUCTVISIE.md) | Missie, onderwijsmodel, certificering (samenvatting) |
| [`docs/EERSTE_STAP.md`](EERSTE_STAP.md) | Setup-stappen |
| [`docs/INTEGRATIE.md`](INTEGRATIE.md) | Contract met kelder — geen FK naar `public.bottles` |
| [`docs/DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md) | Fysiek datamodel V1 (`track`, `user_profiles`) |
| [`docs/DATAMODEL.md`](DATAMODEL.md) | Legacy tabellen (wordt vervangen) |
| [`supabase/migrations/20260620120000_academy_schema.sql`](../supabase/migrations/20260620120000_academy_schema.sql) | Schema + RLS |
| [`web/src/App.tsx`](../web/src/App.tsx) | Huidige placeholder-UI |
| [`PENDING_RELEASE.md`](../PENDING_RELEASE.md) | Deploy-checklist |

Kelder verwijst hierheen via `~/Development/Ecosysteem-drank/dev-way-of-wine-exploring-app/docs/ACADEMY.md`.

---

## Regels (Romuald)

- **Geen `git push`** tenzij expliciet gevraagd (`uploaden`, `nu commit + push`)
- Na codewijziging: **`Status: NOG NIET UPLOADEN`** (default) of **`Status: KLAAR VOOR RELEASE`**
- **Geen wijzigingen** aan `public.*` in Supabase vanuit deze repo
- Versie: `version.json` + [`docs/VERSIE.md`](VERSIE.md) + `CHANGELOG.md`

---

## Prompt voor nieuwe chat (kopieer/plak)

```
Workspace: ~/Development/Ecosysteem-drank/Way-of-Tasting.code-workspace
Focus: dev-way-of-tasting-academy (Way of tasting Academy).
Lees docs/CURSOR_START.md, docs/INTEGRATIE.md en docs/strategie/STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md.
Volgende stap: [bijv. migratie draaien / MVP les+quiz / git init + eerste commit].
Geen push tenzij ik het vraag.
```

---

*Aangemaakt juni 2026 — bij grote wijzigingen dit bestand kort bijwerken.*
