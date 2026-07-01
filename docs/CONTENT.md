# Cursusinhoud — schrijven en laden

Curriculum staat primair in **Postgres** (`academy.*`). Optioneel beheer je bronbestanden in `content/` en importeer je naar de database.

---

## Bronbestanden

| Methode | Wanneer |
|---------|---------|
| **`{TRACK}_FINAL_CONTENT.md`** | Leidende versie per track — canon voor `rebuild_*` |
| **`content/pipeline/`** | Herbouw-tussenstappen (`build_*`, `polish_*`) |
| **`content/archive/legacy/`** | Legacy `*_MODULES.md` (alleen voor herbouw) |
| **SQL seed** | Demo + productie-import (`supabase/seed/`) |
| **`ADD_*` / repair** | Archief in `content/archive/` |
| **Dashboard + service role** | Snelle fixes, niet voor dagelijks schrijven |

Zie [`content/README.md`](../content/README.md) en `scripts/content_paths.py`.

De browser-app **leest** alleen gepubliceerde rijen (`published_at is not null` op course).

---

## Mappenstructuur (voorstel)

```
content/
  wijn-basis/
    course.json          # metadata
    01-intro/
      01-wat-is-wijn.md
      02-quiz.json
    02-druiven/
      01-chardonnay.md
```

`course.json` voorbeeld:

```json
{
  "slug": "wijn-basis",
  "title": "Wijn basis",
  "level": "basis",
  "modules": [
    {
      "slug": "intro",
      "title": "Introductie",
      "lessons": [
        { "slug": "wat-is-wijn", "title": "Wat is wijn?", "file": "01-wat-is-wijn.md" }
      ]
    }
  ]
}
```

**Importscript** (`scripts/import-content.mjs`) — nog te bouwen; tot die tijd: handmatig SQL seed uitbreiden.

---

## Les-types

| `content_type` | Inhoud |
|----------------|--------|
| `text` | `body_markdown` |
| `video` | `video_url` + korte intro in markdown |
| `quiz` | gekoppelde rijen in `quiz_questions` |

---

## Quiz JSON (seed-voorbeeld)

```json
{
  "prompt": "Welke druif hoort bij Bourgogne wit?",
  "options": ["Chardonnay", "Sauvignon Blanc", "Riesling", "Chenin Blanc"],
  "correct_index": 0,
  "explanation": "Bourgogne wit is vrijwel altijd Chardonnay (uitzonderingen zoals Aligoté)."
}
```

---

## Publiceren

Cursus zichtbaar voor gebruikers wanneer:

```sql
update academy.courses
set published_at = now()
where slug = 'wijn-basis';
```

Concept: `published_at = null`.

---

## Koppeling kelder (later)

In les-Markdown kun je al verwijzen naar concepten (druif, regio). Optioneel veld `context_bottle_id` in voortgang wanneer de gebruiker een praktijkopdracht met eigen fles afrondt — zie [`INTEGRATIE.md`](INTEGRATIE.md).
