# Cursusinhoud (bron)

Markdown en JSON voor import naar `academy.*`.

Zie [`docs/CONTENT.md`](../docs/CONTENT.md).

## Canonieke bron

**`*_MODULES.md` is altijd de actuele versie** van een track. Werk nieuwe of gerepareerde lessen daar in; merge daarna `ADD_*` / `COCK_REPAIR_*` patches terug en verwijder dubbele inhoud uit die patch-bestanden waar mogelijk.

| Wat | Rol |
|-----|-----|
| `WIJN_MODULES.md`, `COCK_MODULES.md`, … | Enige bron om te raadplegen voor volledige inhoud |
| `ADD_*_MODULES.md` | Archief na merge; patches zitten in `*_MODULES.md` |
| `COCK_REPAIR_*.md` | Ontwerp/repair-notities; na merge alleen nog referentie |
| `*_CURRICULUM_OVERZICHT.md` | Inhoudsopgave op basis van `*_MODULES.md` |

## Academy-tracks (bron → seed)

| Track | Bron | ADD-reparaties | Rebuild | Seed |
|-------|------|----------------|---------|------|
| Wijn Fundamentals | `WIJN_MODULES.md` | `ADD_WIJN_MODULES.md` *(archief)* | `rebuild_wine_track.py` | `academy_wine_foundation.sql` |
| Rode wijn | `ROOD_MODULES.md` | `ADD_ROOD_MODULES.md` *(archief)* | `rebuild_red_wine_track.py` | `academy_red_wine.sql` |
| Witte wijn | `WIT_MODULES.md` | `ADD_WIT_MODULES.md` *(archief)* | `rebuild_white_wine_track.py` | `academy_white_wine.sql` |
| Rosé | `ROSE_MODULES.md` | `ADD_ROSE_MODULES.md` *(archief)* | `rebuild_rose_wine_track.py` | `academy_rose_wine.sql` |
| Mousserend | `MOUS_MODULES.md` | `ADD_MOUS_MODULES.md` *(archief)* | `rebuild_mous_track.py` | `academy_sparkling.sql` |
| Bier | `BIER_MODULES.md` | `ADD_BIER_MODULES.md` *(archief)* | `rebuild_beer_track.py` | `academy_beer.sql` |
| Bier 0.0 | `BIER_0_0_MODULES.md` | `ADD_BIER_0_0_MODULES.md` *(archief)* | `rebuild_beer_zero_track.py` | `academy_beer_zero.sql` |
| Port | `PORT_MODULES.md` | `ADD_PORT_MODULES.md` *(archief)* | `rebuild_port_track.py` | `academy_port.sql` |
| Cocktails | `COCK_MODULES.md` | `ADD_COCK_MODULES.md` *(archief)* | `rebuild_cocktails_track.py` | `academy_cocktails.sql` |
| Biodynamisch | `BIO_MODULES.md` | `ADD_BIO_MODULES.md` *(archief)* | `rebuild_bio_track.py` | `academy_biodynamic.sql` |

Merge + rebuild + audit per track:

```bash
python3 scripts/merge_academy_add.py --track bio --rebuild --audit
```

Gap-overzicht: [`docs/gaps/README.md`](../docs/gaps/README.md).

### Praktijkopdracht (markdown)

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

## Module-review (Port)

Lever per module een bestand `content/PORT_MODULE_XX.md` (zie `PORT_MODULE_01.md` als voorbeeld). Import naar seed:

```bash
python3 scripts/apply_port_module.py content/PORT_MODULE_02.md
```

Voorbeeldstructuur (nog leeg):

```
content/
  wijn-basis/
    course.json
    modules/
      ...
```

Demo-data staat al in [`supabase/seed/academy_demo.sql`](../supabase/seed/academy_demo.sql).
