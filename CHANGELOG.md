# Way of tasting Academy — Changelog

---

## Unreleased

_(Bij upload: patch bump in `version.json` + bullet hier — zie [`docs/VERSIE.md`](docs/VERSIE.md).)_

---

## v0.1.3 — Canonieke MODULES + Aperol Spritz

*Juni 2026.*

- Alle `ADD_*_MODULES.md`-patches samengevoegd in `*_MODULES.md` (10 tracks, 285 lessen)
- Cocktails: LES 38 Aperol Spritz; seed `academy_cocktails.sql` herbouwd (41 lessen)
- Migratie `20260625180000_academy_aperol_spritz_lesson.sql` voor bestaande databases
- Gap-audit bijgewerkt; quiz-feedback op 100% voor de meeste tracks
- `merge_academy_add.py`: examen-praktijk koppelt aan les met “praktijkexamen” in titel

---

## v0.1.2 — Academy-voortgang batching

*Juni 2026.*

- `fetchAcademyTrackProgress`: max 3 tracks parallel (Profiel laadt sneller in kelder-host)

---

## v0.1.1 — Gedeeld profiel-UI

*Juni 2026.*

- `AcademyProfielSections`: hero, voortgang en weergavenaam herbruikbaar in kelder-host
- `fetchAcademyTrackProgress` voor gedeelde Academy-voortgang

---

## v0.1.0 — Documentatie + schema start

*Juni 2026.*

- Repo-structuur, stack-besluit, integratiecontract met kelder-app
- Supabase schema `academy` + demo-seed `wijn-basis`
- Vite-skeleton (placeholder UI)
