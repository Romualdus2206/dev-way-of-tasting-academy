# Web-plan — Way of tasting Academy

**Status:** startdocumentatie (juni 2026)  
**Bindend:** [`BESLUIT_STACK.md`](BESLUIT_STACK.md) · [`INTEGRATIE.md`](INTEGRATIE.md)

---

## Doel

Web-SPA voor sommelier-opleiding, **los gedeployed**, **zelfde data-laag** als kelder-app.

| Wel | Niet (v1) |
|-----|-----------|
| Cursussen, lessen, quiz | Mobiele app |
| Voortgang per user | Apart Supabase-project |
| Zelfde login als kelder | Expo / react-native-web |
| Netlify static hosting | Eigen Node-server |

---

## Architectuur

```
┌─────────────────────────────┐
│  web/ (Vite + React + TS)   │
│  Academy UI                 │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────┐
│  packages/academy-shared/   │
│  types · quiz · progress      │
└──────────────┬──────────────┘
               │
               ▼
┌─────────────────────────────────────────────┐
│  Supabase (migoblpyknayqfljihoa)            │
│  schema academy.*  +  auth.users (gedeeld)  │
└─────────────────────────────────────────────┘
               ▲
               │ (zelfde project, schema public)
┌──────────────┴──────────────┐
│  kelder-app web/mobile       │
└─────────────────────────────┘
```

---

## Mappen

```
dev-way-of-tasting-academy/
  web/                    # Vite SPA
  packages/academy-shared/  # Gedeelde types/utils
  content/                # Markdown-bron (optioneel, import naar DB)
  supabase/
    migrations/
    seed/
  docs/
```

---

## Pagina’s (MVP)

| Route | Functie |
|-------|---------|
| `/login` | Supabase Auth |
| `/` | Dashboard: mijn cursussen + voortgang |
| `/cursus/:slug` | Module-lijst |
| `/cursus/:slug/:module/:lesson` | Les + quiz |
| `/profiel` | Voortgangsoverzicht (optioneel v1) |

---

## Styling

Hergebruik visuele taal kelder-app:

- `--app: #5c2438` (burgundy)
- `--accent: #b8860b` (goud)
- Tabs/kaarten vergelijkbaar met `KelderListCard`-patroon

Kopieer later selectief CSS uit kelder `web/src/index.css` — geen dependency op kelder-repo in v1.

---

## Netlify

| Site | Repo | Build |
|------|------|-------|
| Kelder | `way-of-wine-exploring` | `web/` in monorepo kelder |
| Academy | `way-of-tasting-academy` (nieuw) | `web/` in deze repo |

Build command (voorstel):

```bash
npm install && npm run build --workspace=web
```

Publish directory: `web/dist`

Env: `VITE_SUPABASE_URL`, `VITE_SUPABASE_ANON_KEY`

---

## Fase 2 — integratie in kelder-UI

- Tab of menu-item “Opleiding” → externe of interne link
- Optioneel: iframe/subpath — zie [`INTEGRATIE.md`](INTEGRATIE.md) §5
