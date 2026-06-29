# Cocktails — content gaps

**Laatste audit:** 2026-06-29

Wat nog ontbreekt in de bron-markdown voordat deze track op 10/10 staat.
Bijwerken: `python3 scripts/audit_academy_gaps.py`

---

**Track slug:** `cocktails` · **App-chip:** `cocktails`
**Bron:** `content/COCK_MODULES.md` · **Lessen:** 41
**Seed:** `supabase/seed/academy_cocktails.sql` · **Rebuild:** `scripts/rebuild_cocktails_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 39/41 | 2 | 95% |
| Quiz-feedback | 41/41 (39 bij quiz-lessen) | 0 | 100% |
| Kernbegrippen | 41/41 | 0 | 100% |
| Praktijkopdracht | 41/41 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | Technieken | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Ingrediënten | 5 | 4/5 | 5/5 | 5/5 | 5/5 |
| 4 | Klassieke Cocktails | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Sour Family | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Highballs & Longdrinks | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 9 | Blindproeven & Examen | 3 | 2/3 | 3/3 | 3/3 | 3/3 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 3 | `ingredienten-cocktails:mini-toets-cocktails` | Mini-toets Cocktails |
| 9 | `examen-cocktails:theorie-praktijkexamen` | Theorie- en praktijkexamen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-cocktails:theorie-praktijkexamen` — feedback: ja

Mini-toets — vaak praktijk/blind; MC-quiz optioneel.

- `ingredienten-cocktails:mini-toets-cocktails` — feedback: ja
