# Versiebeheer — Way of tasting Academy

## Bron

**`version.json`** in de repo-root:

```json
{ "appVersion": "0.1.3" }
```

- UI: `APP_VERSION` uit `packages/academy-shared`
- `web/package.json` workspace semver — gelijk trekken

Academy-versie is **onafhankelijk** van kelder-app (`0.4.x`).

## Bij elke upload

1. Patch verhogen in `version.json`
2. `web/package.json` + `packages/academy-shared/package.json` gelijk trekken
3. Bullet in `CHANGELOG.md` onder Unreleased
4. `npm run version:check`

## Kelder-app

Geen gekoppelde release: Academy-deploy triggert niet automatisch kelder Netlify en omgekeerd. Zie [`INTEGRATIE.md`](INTEGRATIE.md) §8.
