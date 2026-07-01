# Way of tasting Academy — Changelog

---

## Unreleased

_(Bij upload: patch bump in `version.json` + bullet hier — zie [`docs/VERSIE.md`](docs/VERSIE.md).)_

---

## v0.1.6 — Seed SQL escaping + Supabase deploy

*Juni 2026.*

- **Fix:** quiz `options` JSON via `json.dumps` + `sql_str()` in import-scripts (apostrofs zoals `kilo's`, `pit` braken Port/Wine-seeds)
- **Seeds** herbouwd en alle 10 tracks gedeployed naar Supabase (`migoblpyknayqfljihoa`)
- Migraties live: `academy_lessons_key_concepts`, `academy_practice_progress`, `academy_bio_key_concepts_nl`
- Smoke-checklist: [`docs/ACADEMY_SMOKE_CHECKLIST.md`](docs/ACADEMY_SMOKE_CHECKLIST.md)

---

## v0.1.5 — Final Content canon + Global QA repair

*Juli 2026.*

- **Content-structuur:** leidende bron per track is `{TRACK}_FINAL_CONTENT.md`; pipeline in `content/pipeline/`; legacy/repair in `content/archive/`; paden via `scripts/content_paths.py`
- **Specialist tracks (Gold Master → LOCKED):** Wit, Rood, Rosé — `*_FINAL_CONTENT.md` + rebuild-seeds
- **Global QA repair** (rapport `Way_of_Tasting_Academy_QA_Rapport.pdf`): Rosé LES 41–43 hernummering; 12 quizvragen naar 4 opties (Mous/Wine/Rosé); Port schema-gelijktrekking + LES 41–45; Wine LES 21; Bier 0.0 LES 1 regelgeving; Bio quiz-feedback hedging; Cocktail module-structuur gevalideerd
- Scripts: `apply_qa_global_repair.py`, `qa_repair_data.py`, `migrate_content_paths.py`, build/polish/rebuild per track
- **Alle 10 track-seeds** herbouwd uit `*_FINAL_CONTENT.md`
- **App:** quiz-feedback parsing, praktijk-checklist UI, kernbegrippen-vet (`keyConcepts.ts`), les-voortgang pills
- Migratie: `20260626190000_academy_bio_key_concepts_nl.sql` (BIO kernbegrippen NL in DB)

---

## v0.1.4 — BIO track premium repair

*Juni 2026.*

- Alle 45 BIO-lessen herschreven en samengevoegd in `BIO_MODULES.md` (premium theorie, Wist-je-dat, samenvatting, praktijk)
- LES 34–45: nieuw curriculum (titels, slugs); theorie-examen verplaatst naar LES 44 (open examen)
- Scripts: `prepare_bio_repair_content.py`, `merge_bio_repair_content.py`
- Seed `academy_biodynamic.sql` herbouwd; quiz-feedback bijgewerkt

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
