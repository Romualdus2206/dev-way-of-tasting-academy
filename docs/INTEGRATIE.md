# Integratiecontract — Way of Tasting ecosysteem

**Versie:** 1.2 · juni 2026  
**Status:** bindend voor alle repo’s onder `~/Development/Ecosysteem-drank/` tot wijziging in dit document

Dit contract beschrijft hoe **dev-way-of-tasting-academy**, **dev-way-of-wine-exploring-app** en **biodynamische-kalender** samenwerken zonder elkaars releases te blokkeren.

**Ecosysteem-map:** [`../../README.md`](../../README.md) · **Leidraad:** [`strategie/STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md`](strategie/STRATEGIE_IMPLEMENTATIE_LEIDRAAD.md)

---

## 0. Lokale mapstructuur

```
~/Development/Ecosysteem-drank/
├── dev-way-of-wine-exploring-app/   ← host (Way of Tasting)
├── dev-way-of-tasting-academy/      ← Academy (dit contract, academy.*)
├── biodynamische-kalender/          ← Moment-engine (integratie in host)
└── Way-of-Tasting.code-workspace    ← Cursor multi-repo
```

---

## 1. Principes

1. **Eén identiteit** — één Supabase Auth-gebruiker per persoon; geen aparte Academy-accounts.
2. **Gescheiden schema’s** — kelder in `public.*`, opleiding in `academy.*`.
3. **Eén productie-web** — kelder-host op Netlify; Academy/Moment standalone-sites redirecten (301). Losse repo-deploys alleen voor content/migraties.
4. **Geen harde FK over domeinen** — Academy verwijst naar kelder alleen via `uuid` + app-logica, niet via `references public.bottles` (voorkomt migratie-knoop).
5. **RLS overal** — curriculum leesbaar voor ingelogden; voortgang alleen eigen rijen.

---

## 2. Gedeelde infrastructuur

| Resource | Waarde / afspraak |
|----------|-------------------|
| **Supabase project** | `migoblpyknayqfljihoa` (zelfde als kelder-app) |
| **Auth** | Supabase Auth — e-mail/wachtwoord (zelfde als kelder) |
| **User-id** | `auth.users.id` = `user_id` in alle `academy.*` voortgangstabellen |
| **Env web kelder** | `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY` |
| **Env web academy** | **Identieke** URL + anon key in `web/.env` |
| **Storage** | Kelder: bucket `label-photos`. Academy (later): bucket `academy-assets` — **niet** delen met etiketfoto’s |

---

## 3. Datagrens

```
┌─────────────────────────────────────────────────────────────┐
│                    Supabase (één project)                    │
├──────────────────────────┬──────────────────────────────────┤
│  schema public           │  schema academy                   │
│  · bottles               │  · courses, modules, lessons      │
│  · wine_list_items       │  · quiz_questions                 │
│  · drink_log, tasting    │  · user_lesson_progress           │
│  · beer_catalog (read)   │  · user_quiz_attempts             │
│  · household             │  · (later) user_certificates      │
└──────────────────────────┴──────────────────────────────────┘
         ▲                              ▲
         │                              │
   kelder-app web/mobile          academy web
```

### Wat Academy **wel** mag (lezen, via RLS)

| Bron | Gebruik in opleiding |
|------|---------------------|
| `auth.users` | Huidige gebruiker |
| `academy.*` | Volledige curriculum + eigen voortgang |
| `public.bottles` | **Later** — “koppel les aan fles uit jouw kelder” (optioneel `bottle_id` in progress, geen FK) |

### Wat Academy **niet** mag (v1)

| Verboden | Reden |
|----------|--------|
| `INSERT/UPDATE/DELETE` op `public.bottles` | Kelder-app blijft eigenaar |
| Schrijven naar `beer_catalog` | Alleen service role / kelder-edge |
| Kelder Edge Functions aanroepen vanuit Academy UI | Scheiding; later eventueel dedicated `academy-*` functions |

---

## 4. API-surface (logisch — geen aparte REST-server)

| Operatie | Implementatie |
|----------|----------------|
| Login / logout | `@supabase/supabase-js` `auth` (zelfde sessie-localStorage key **niet** delen tussen sites op hetzelfde domein — zie §5) |
| Cursussen laden | `select` op `academy.courses` (+ joins modules/lessons) |
| Voortgang | `upsert` op `academy.user_lesson_progress` waar `user_id = auth.uid()` |
| Quiz indienen | `insert` `academy.user_quiz_attempts` |

Geen custom JWT; geen service role in de browser.

---

## 5. Navigatie (geïntegreerd — Fase 5)

| Kelder | Academy | Mechanisme |
|-----|------|------------|
| Kelder | Academy | Tab **Academy** → `/academy` (zelfde origin) |
| Kelder | Advies | Tab **Advies** → `/advies` |
| Advies | Cocktail Quick Learn | `/advies/cocktail/:cocktailId` |
| Advies | Academy les (cocktail) | `/academy/cocktails/module/:moduleId/lesson/:lessonId` → resolve → `/academy/cocktails/lessons/:uuid` |
| Kelder | Moment | Redirect `/moment` → `/advies` |
| Academy track | Smaakprofiel | `/profiel#taste-{category}` |
| Flesdetail | Academy / Moment | Kruislinks in kelder UI |
| Oude standalone-URL | Host | 301 → `way-of-tasting.netlify.app` + pad |

**Sessie:** één origin = **één Supabase-sessie** in de browser.

Zie kelder [`NETLIFY_INTEGRATED.md`](../../dev-way-of-wine-exploring-app/docs/NETLIFY_INTEGRATED.md).

---

## 6. Gedeelde concepten (semantisch, niet technisch gekoppeld)

Deze termen **betekenen hetzelfde** in beide apps (voor toekomstige UI):

| Concept | Kelder-app veld | Academy les-thema |
|---------|-----------------|-------------------|
| Druif | `grape` | Module “Druivenkunde” |
| Regio | `region`, `country` | Module “Regio’s” |
| Smaakassen | `flavor_axes` | Quiz / smaaktraining |
| Proeverij | `tasting` | Praktijkopdracht “organiseer proeverij” |

Geen automatische sync — alleen inhoudelijke afstemming in cursusontwerp.

---

## 7. Migraties — wie doet wat

| Repo | Verantwoordelijkheid |
|------|---------------------|
| **Kelder-app** (`dev-way-of-wine-exploring-app`) | `supabase/migrations/*` voor `public` + edge functions |
| **Academy** (`dev-way-of-tasting-academy`) | `supabase/migrations/*` voor `academy` schema alleen |
| **Kalender** (`biodynamische-kalender`) | Moment-schema (TBD) — afstemmen vóór migraties |
| **Uitvoering** | Alle migraties op **hetzelfde** gekoppelde project (`supabase db push` of SQL Editor) |

**Regel:** Academy-migraties mogen **nooit** `drop` of `alter` op `public.*` zonder expliciet akkoord in beide repos.

---

## 8. Versies en releases

| App | Versiebron | Onafhankelijk |
|-----|------------|---------------|
| Kelder | `Ecosysteem-drank/dev-way-of-wine-exploring-app/version.json` | ja |
| Academy | `Ecosysteem-drank/dev-way-of-tasting-academy/version.json` | ja |
| Kalender | `Ecosysteem-drank/biodynamische-kalender/` (indien version.json) | ja |

Academy-release triggert **geen** kelder Netlify-build en omgekeerd.

---

## 9. Toekomstige uitbreidingen (buiten v1)

- [ ] `academy.lessons.related_bottle_hints` — tekst, geen FK
- [ ] `user_lesson_progress.context_bottle_id` — optionele uuid naar kelderfles
- [ ] Gedeeld `@way-of-tasting/shared` package (types `BeverageCategory`, `FlavorAxes`)
- [ ] Edge Function `academy-quiz-feedback` (AI-uitleg bij fout antwoord)
- [ ] Eén domein + gedeelde sessie

Wijzigingen op dit contract: PR + update versienummer bovenaan dit bestand.

---

## 10. Contactpunten in code (checklist bij start bouw)

- [ ] `web/.env` — zelfde Supabase URL/key als kelder `web/.env`
- [ ] Migratie `20260620120000_academy_schema.sql` gedraaid op project
- [ ] RLS getest: user A ziet niet user B voortgang
- [ ] Netlify env vars gezet (`VITE_SUPABASE_*`)
- [ ] Link “Kelder” / “Academy” in beide apps (wanneer UI klaar)
