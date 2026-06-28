# Web — lokaal draaien (Academy)

## Vereisten

- Node 20+
- Zelfde Supabase-project als kelder-app
- Academy-migratie gedraaid ([`SUPABASE.md`](SUPABASE.md))

---

## Setup

```bash
cd ~/Development/dev-way-of-tasting-academy
npm install
cp web/.env.example web/.env
```

Vul in `web/.env` (zelfde waarden als kelder `web/.env`):

```
VITE_SUPABASE_URL=https://migoblpyknayqfljihoa.supabase.co
VITE_SUPABASE_ANON_KEY=<anon key uit dashboard>
```

---

## Starten

```bash
npm run dev
```

- Mac: http://localhost:5173  
- iPhone (zelfde wifi): `http://<mac-ip>:5173`

---

## Scripts

| Commando | Doel |
|----------|------|
| `npm run dev` | Vite dev server |
| `npm run build` | Productie-build `web/dist` |
| `npm run typecheck` | TypeScript check |
| `npm run version:check` | Versies gelijk trekken |

---

## Inloggen

Gebruik een account dat al in Supabase Auth bestaat (bijv. je kelder-login). Academy maakt **geen** aparte users aan.

---

## Troubleshooting

| Probleem | Oplossing |
|----------|-----------|
| Lege lessenlijst | Migratie V1 + seed: `supabase/seed/academy_port.sql` |
| `permission denied for schema academy` | Migratie + RLS opnieuw controleren |
| `relation academy.courses does not exist` | Migratie nog niet uitgevoerd |
| Login werkt, geen data | `published_at` op cursus moet gezet zijn (seed doet dit) |

---

## Pariteit kelder-web

Zie kelder: `dev-way-of-wine-exploring-app/docs/WEB_DEV.md` — zelfde `.env`-patroon, andere app-code.
