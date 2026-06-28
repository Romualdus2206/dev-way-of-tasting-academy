# Pending release — Way of tasting Academy

## Huidige status (juni 2026)

**Huidige release:** **v0.1.0** (documentatie + schema)  
**Versiebron:** [`version.json`](version.json)  
**Supabase:** **gedeeld** met kelder-app — project `migoblpyknayqfljihoa` · schema `academy`  
**Status:** lokaal startklaar; nog geen Netlify

| Bestand | Doel |
|---------|------|
| `CHANGELOG.md` | Release notes |
| `docs/INTEGRATIE.md` | Contract met kelder-app |
| `docs/BESLUIT_STACK.md` | Stack |
| `docs/EERSTE_STAP.md` | Eerste setup |

---

## 1. Supabase (gedeeld project)

Zie [`docs/SUPABASE.md`](docs/SUPABASE.md).

| # | Bestand |
|---|---------|
| 1 | `supabase/migrations/20260620120000_academy_schema.sql` |
| 2 | `supabase/seed/academy_demo.sql` (optioneel) |

**Let op:** draai alleen academy-migraties vanuit deze repo — geen wijzigingen aan `public.*` zonder kelder-repo.

---

## 2. Lokaal

```bash
cd ~/Development/dev-way-of-tasting-academy
npm install
cp web/.env.example web/.env   # zelfde keys als kelder web/.env
npm run dev
```

---

## 3. Netlify (nog niet)

- Nieuwe site koppelen aan `dev-way-of-tasting-academy` repo
- Build: `npm install && npm run build --workspace=web`
- Publish: `web/dist`
- Env: `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`

---

## 4. Integratie kelder-app (fase 2)

- [ ] Link “Opleiding” in kelder-web
- [ ] Link “Terug naar kelder” in academy
- [ ] Optioneel `context_bottle_id` in voortgang

Zie [`docs/INTEGRATIE.md`](docs/INTEGRATIE.md).

---

## Smoke-test (na MVP-UI)

- [ ] Login met bestaand kelder-account
- [ ] Cursus “Wijn basis” zichtbaar
- [ ] Les openen + quiz
- [ ] Voortgang opgeslagen in `academy.user_lesson_progress`
- [ ] User B ziet niet voortgang van user A
