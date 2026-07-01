# Way of tasting Academy

**Academy is onderdeel van de kelder-monorepo** sinds juli 2026 (kelder v0.5.5).

Deze repo is **gearchiveerd**: alleen redirect naar de geïntegreerde app.

---

## Productie

| Wat | Waar |
|-----|------|
| **App (UI)** | [way-of-tasting.netlify.app/academy](https://way-of-tasting.netlify.app/academy) |
| **Broncode** | [`dev-way-of-wine-exploring-app`](https://github.com/Romualdus2206/way-of-wine-exploring) |
| **Content & seeds** | `content/academy/`, `scripts/academy/`, `supabase/seed/` in kelder-repo |
| **Strategie & docs** | `docs/strategie/`, `docs/academy/` in kelder-repo |

---

## Deze repo (redirect-only)

Netlify bouwt alleen een **301-redirect** naar de kelder-host:

```bash
node scripts/generate-kelder-redirect.mjs academy
```

Oude bookmarks naar een Academy-Netlify-URL blijven werken.

---

## Migratie

Zie kelder [`docs/ACADEMY.md`](https://github.com/Romualdus2206/way-of-wine-exploring/blob/main/docs/ACADEMY.md) en [`docs/academy/ARCHIVE.md`](https://github.com/Romualdus2206/way-of-wine-exploring/blob/main/docs/academy/ARCHIVE.md).

**Niet meer gebruiken:** `npm run dev` in deze repo, content/scripts hier, aparte Academy-versie (`0.1.x`).
