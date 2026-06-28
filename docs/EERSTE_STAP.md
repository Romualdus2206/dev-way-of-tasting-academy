# Eerste stap — Academy opstarten

Volgorde om van lege repo naar werkende lokale web-app te gaan.

---

## Stap 1 — Repo & dependencies

```bash
cd ~/Development/Ecosysteem-drank/dev-way-of-tasting-academy
npm install
```

---

## Stap 2 — Supabase (zelfde project als kelder)

Gebruik **dezelfde** Project URL en anon key als in `~/Development/Ecosysteem-drank/dev-way-of-wine-exploring-app/web/.env`.

```bash
cp web/.env.example web/.env
# Vul VITE_SUPABASE_URL en VITE_SUPABASE_ANON_KEY
```

| Waarde | Waar te vinden |
|--------|----------------|
| Project URL | Supabase → Settings → API |
| anon key | Zelfde als kelder-web |

Project-ref kelder: `migoblpyknayqfljihoa` (controleer in dashboard).

---

## Stap 3 — Academy-schema migreren

Zie [`SUPABASE.md`](SUPABASE.md). Kort:

```bash
# Optie A: Supabase CLI (als gekoppeld aan zelfde project)
supabase db query --linked -f supabase/migrations/20260625140000_academy_v1_tracks.sql
supabase db query --linked -f supabase/seed/academy_port.sql

# Optie B: SQL Editor — plak beide bestanden en Run
```

> Heb je alleen de oude migratie (`20260620120000`) gedraaid? Draai daarna `20260625140000` — die vervangt `courses` door `tracks`.

Controle: Table Editor → schema **academy** → tabellen zichtbaar.

**API:** schema `academy` exposen + grants — zie [`SUPABASE.md`](SUPABASE.md) § “schema academy exposen”.

---

## Stap 4 — Lokaal draaien

```bash
npm run dev
```

Open http://localhost:5173 · log in met **bestaand kelder-account** (zelfde e-mail/wachtwoord).

---

## Stap 5 — Netlify (later)

Aparte Netlify-site; env vars `VITE_SUPABASE_URL` + `VITE_SUPABASE_ANON_KEY` (zelfde waarden).

Zie [`PENDING_RELEASE.md`](../PENDING_RELEASE.md).

---

## Wat daarna (MVP bouw)

1. Login-pagina (Supabase Auth)
2. Cursusoverzicht (`academy.courses`)
3. Module/les-navigatie
4. Quiz-component + `user_quiz_attempts`
5. Voortgangsbalk (`user_lesson_progress`)

UI-patronen: burgundy/goud theme (align met kelder `web/src/index.css`).

---

## Documenten gelezen?

- [`INTEGRATIE.md`](INTEGRATIE.md) — **verplicht** vóór eerste productie-deploy
- [`BESLUIT_STACK.md`](BESLUIT_STACK.md)
- [`DATAMODEL.md`](DATAMODEL.md)

**Geen git push** tenzij je expliciet vraagt (zelfde protocol als kelder-app).
