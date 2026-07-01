# Cursusinhoud (bron)

Markdown en JSON voor import naar `academy.*`.

Zie [`docs/CONTENT.md`](../docs/CONTENT.md).

## Structuur

```
content/
  {TRACK}_FINAL_CONTENT.md    ← leidende versie (canon)
  pipeline/                     ← herbouw-tussenstappen
  archive/                      ← legacy, repair, intermediate
```

| Term | Wanneer |
|------|---------|
| **Final Content** | Canoniek bestand per track — `rebuild_*` leest dit |
| **Pipeline** | Tussenoutput van `build_*` / `polish_*` (niet voor productie) |
| **Archief** | Legacy `*_MODULES.md`, ADD/repair-notities, oude Port-versies |

Paden centraal: `scripts/content_paths.py`

## Academy-tracks (bron → seed)

| Track | Final Content | Rebuild | Seed |
|-------|---------------|---------|------|
| Wijn Fundamentals | `WINE_FINAL_CONTENT.md` | `rebuild_wine_track.py` | `academy_wine_foundation.sql` |
| Rode wijn | `RED_FINAL_CONTENT.md` | `rebuild_red_wine_track.py` | `academy_red_wine.sql` |
| Witte wijn | `WHITE_FINAL_CONTENT.md` | `rebuild_white_wine_track.py` | `academy_white_wine.sql` |
| Rosé | `ROSE_FINAL_CONTENT.md` | `rebuild_rose_wine_track.py` | `academy_rose_wine.sql` |
| Mousserend | `MOUS_FINAL_CONTENT.md` | `rebuild_mous_track.py` | `academy_sparkling.sql` |
| Bier | `BIER_FINAL_CONTENT.md` | `rebuild_beer_track.py` | `academy_beer.sql` |
| Bier 0.0 | `BIER_0_0_FINAL_CONTENT.md` | `rebuild_beer_zero_track.py` | `academy_beer_zero.sql` |
| Port | `PORT_FINAL_CONTENT.md` | `rebuild_port_track.py` | `academy_port.sql` |
| Cocktails | `COCK_FINAL_CONTENT.md` | `rebuild_cocktails_track.py` | `academy_cocktails.sql` |
| Biodynamisch | `BIO_FINAL_CONTENT.md` | `rebuild_bio_track.py` | `academy_biodynamic.sql` |

### Herbouwpipeline (voorbeeld wit/rood/rosé)

```bash
# 1. Legacy → pipeline
python3 scripts/build_white_track_v2_gold_master.py
# 2. Pipeline → final
python3 scripts/polish_white_gold_master_locked.py
# 3. Final → seed
python3 scripts/rebuild_white_wine_track.py
```

## Praktijkopdracht (markdown)

Gebruik vaste subkoppen voor interactieve UI:

```markdown
### Opdracht
Tekst van de opdracht.

### Checklist
- Eerste stap
- Tweede stap

### Reflectievraag
Welke vraag stel je aan de student?
```

Zonder deze structuur wordt de tekst als platte praktijkopdracht getoond met alleen een afrond-knop.

Gap-overzicht: [`docs/gaps/README.md`](../docs/gaps/README.md).

Demo-data: [`supabase/seed/academy_demo.sql`](../supabase/seed/academy_demo.sql).
