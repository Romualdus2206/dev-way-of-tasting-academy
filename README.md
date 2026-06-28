# Way of tasting Academy

**Sommelier-opleiding** als aparte web-app — later geïntegreerd in [Way of tasting](https://github.com/Romualdus2206/way-of-wine-exploring) (kelder, proeverij, scan).

| | Kelder-app | Academy (deze repo) |
|---|------------|---------------------|
| **Repo** | `dev-way-of-wine-exploring-app` | `dev-way-of-tasting-academy` |
| **Doel** | Voorraad, scan, proeverij | Cursussen, lessen, quiz, voortgang |
| **Supabase** | Zelfde project, schema `public` | Zelfde project, schema `academy` |
| **Auth** | Zelfde gebruikers (`auth.users`) | Zelfde login — geen tweede account |

## Documentatie (start hier)

| Bestand | Inhoud |
|---------|--------|
| [`docs/PRODUCTVISIE.md`](docs/PRODUCTVISIE.md) | **Productvisie** (missie, onderwijsmodel, certificering) |
| [`docs/BESLUIT_STACK.md`](docs/BESLUIT_STACK.md) | Vastgelegde stack |
| [`docs/INTEGRATIE.md`](docs/INTEGRATIE.md) | **Integratiecontract** met kelder-app |
| [`docs/EERSTE_STAP.md`](docs/EERSTE_STAP.md) | Eerste setup (Supabase-migratie, `.env`, dev server) |
| [`docs/CURSOR_START.md`](docs/CURSOR_START.md) | **Overdracht nieuwe Cursor-chat** |
| [`docs/DATAMODEL_V1_ONTWERP.md`](docs/DATAMODEL_V1_ONTWERP.md) | Datamodel concept V1 |
| [`docs/DATAMODEL_V1_FYSIEK.md`](docs/DATAMODEL_V1_FYSIEK.md) | **Fysiek model V1** (klaar voor SQL) |
| [`docs/DATAMODEL.md`](docs/DATAMODEL.md) | Legacy — eerste migratie (`courses`); wordt vervangen |
| [`docs/WEB_PLAN.md`](docs/WEB_PLAN.md) | Architectuur web-SPA |
| [`docs/WEB_DEV.md`](docs/WEB_DEV.md) | Lokaal draaien |
| [`docs/CONTENT.md`](docs/CONTENT.md) | Cursusinhoud schrijven en importeren |
| [`docs/SUPABASE.md`](docs/SUPABASE.md) | Migraties op gedeeld project |
| [`docs/VERSIE.md`](docs/VERSIE.md) | Versiebeheer |
| [`CHANGELOG.md`](CHANGELOG.md) | Wijzigingen |
| [`PENDING_RELEASE.md`](PENDING_RELEASE.md) | Deploy-checklist |

## Stack (kort)

- **Web:** Vite + React + TypeScript (`web/`)
- **Gedeeld:** `packages/academy-shared/` (types, utils — geen UI)
- **Backend:** **Zelfde Supabase** als Way of tasting (`migoblpyknayqfljihoa`)
- **Hosting:** Geïntegreerd in kelder — [way-of-tasting.netlify.app/academy](https://way-of-tasting.netlify.app/academy).  
  Aparte Netlify-site (indien aanwezig) → 301-redirect naar host.
- **Content:** Postgres (`academy.*`) + optioneel Markdown in `content/`

## Snel starten

**Productie:** via kelder-host — `/academy` op [way-of-tasting.netlify.app](https://way-of-tasting.netlify.app).

**Lokaal (optioneel — standalone dev):**

```bash
cd ~/Development/Ecosysteem-drank/dev-way-of-tasting-academy
npm install
cp web/.env.example web/.env   # zelfde URL + anon key als kelder-web
# Migratie academy-schema: zie docs/SUPABASE.md
npm run dev
```

Open http://localhost:5174

**Dagelijks web-werk:** start kelder (`npm run web:dev` in `dev-way-of-wine-exploring-app`) — Academy zit daar al in.

## Gerelateerde repo

Kelder-app: `~/Development/dev-way-of-wine-exploring-app` · live web: [way-of-tasting.netlify.app](https://way-of-tasting.netlify.app)
