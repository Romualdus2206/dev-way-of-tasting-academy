# Rode wijn — content gaps

**Laatste audit:** 2026-06-30

Wat nog ontbreekt in de bron-markdown voordat deze track op 10/10 staat.
Bijwerken: `python3 scripts/audit_academy_gaps.py`

---

**Track slug:** `red-wine` · **App-chip:** `red-wine`
**Bron:** `content/archive/legacy/ROOD_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_red_wine.sql` · **Rebuild:** `scripts/rebuild_red_wine_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 38/40 | 2 | 95% |
| Quiz-feedback | 40/40 (38 bij quiz-lessen) | 0 | 100% |
| Kernbegrippen | 40/40 | 0 | 100% |
| Praktijkopdracht | 40/40 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | Productie | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Proeven | 5 | 4/5 | 5/5 | 5/5 | 5/5 |
| 4 | Lichte Rode Druiven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Medium Body Druiven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Krachtige Rode Druiven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 3 | 3/3 | 3/3 | 3/3 | 3/3 |
| 9 | Blindproeven & Examen | 3 | 2/3 | 3/3 | 3/3 | 3/3 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 3 | `proeven-red-wine:mini-toets-rode-wijn` | Mini-toets Rode Wijn |
| 9 | `examen-red-wine:red-wine-final-exam` | Theorie- en praktijkexamen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-red-wine:red-wine-final-exam` — feedback: ja

Mini-toets — vaak praktijk/blind; MC-quiz optioneel.

- `proeven-red-wine:mini-toets-rode-wijn` — feedback: ja
