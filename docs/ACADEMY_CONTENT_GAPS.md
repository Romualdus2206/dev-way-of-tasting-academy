# Academy — openstaande content

**Laatste audit:** 2026-06-28 (`python3 scripts/audit_academy_gaps.py`)

Gecombineerd overzicht. **Per dranksoort:** [`docs/gaps/README.md`](gaps/README.md).

| Dranksoort | Gap-document |
|------------|--------------|
| Wijn (Wine Foundation) | [`gaps/WIJN_GAPS.md`](gaps/WIJN_GAPS.md) |
| Rode wijn | [`gaps/ROOD_GAPS.md`](gaps/ROOD_GAPS.md) |
| Witte wijn | [`gaps/WIT_GAPS.md`](gaps/WIT_GAPS.md) |
| Rosé | [`gaps/ROSE_GAPS.md`](gaps/ROSE_GAPS.md) |
| Cocktails | [`gaps/COCK_GAPS.md`](gaps/COCK_GAPS.md) |
| Port | [`gaps/PORT_GAPS.md`](gaps/PORT_GAPS.md) |
| Mousserend | [`gaps/MOUS_GAPS.md`](gaps/MOUS_GAPS.md) |
| Bier | [`gaps/BIER_GAPS.md`](gaps/BIER_GAPS.md) |
| Bier 0.0 | [`gaps/BIER_0_0_GAPS.md`](gaps/BIER_0_0_GAPS.md) |
| Biodynamisch Proeven | [`gaps/BIO_GAPS.md`](gaps/BIO_GAPS.md) |

---

## Wijn (Wine Foundation) (`wine-foundation`)

**Track slug:** `wine-foundation` · **App-chip:** `wine`
**Bron:** `content/WIJN_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_wine_foundation.sql` · **Rebuild:** `scripts/rebuild_wine_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 40/40 | 0 | 100% |
| Quiz-feedback | 40/40 (40 bij quiz-lessen) | 0 | 100% |
| Kernbegrippen | 40/40 | 0 | 100% |
| Praktijkopdracht | 40/40 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | Productie | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Proeven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 4 | Structuur | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Druivenrassen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Klimaat & Terroir | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 3 | 3/3 | 3/3 | 3/3 | 3/3 |
| 9 | Blindproeven & Examen | 3 | 3/3 | 3/3 | 3/3 | 3/3 |

## Rode wijn (`red-wine`)

**Track slug:** `red-wine` · **App-chip:** `red-wine`
**Bron:** `content/ROOD_MODULES.md` · **Lessen:** 40
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

## Witte wijn (`white-wine`)

**Track slug:** `white-wine` · **App-chip:** `white-wine`
**Bron:** `content/WIT_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_white_wine.sql` · **Rebuild:** `scripts/rebuild_white_wine_track.py`

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
| 4 | Frisse witte druiven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Rijke witte druiven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Aromatische witte druiven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 3 | 3/3 | 3/3 | 3/3 | 3/3 |
| 9 | Blindproeven & Examen | 3 | 2/3 | 3/3 | 3/3 | 3/3 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 3 | `proeven-white-wine:mini-toets-witte-wijn` | Mini-toets witte wijn |
| 9 | `examen-white-wine:white-final-exam` | Theorie- en praktijkexamen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-white-wine:white-final-exam` — feedback: ja

Mini-toets — vaak praktijk/blind; MC-quiz optioneel.

- `proeven-white-wine:mini-toets-witte-wijn` — feedback: ja

## Rosé (`rose-wine`)

**Track slug:** `rose-wine` · **App-chip:** `rose-wine`
**Bron:** `content/ROSE_MODULES.md` · **Lessen:** 43
**Seed:** `supabase/seed/academy_rose_wine.sql` · **Rebuild:** `scripts/rebuild_rose_wine_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 42/43 | 1 | 98% |
| Quiz-feedback | 43/43 (42 bij quiz-lessen) | 0 | 100% |
| Kernbegrippen | 43/43 | 0 | 100% |
| Praktijkopdracht | 43/43 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | Productie | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Proeven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 4 | Klassieke stijlen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Druivenrassen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Stijl & Gastronomie | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 6 | 6/6 | 6/6 | 6/6 | 6/6 |
| 9 | Blindproeven & Examen | 3 | 2/3 | 3/3 | 3/3 | 3/3 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 9 | `examen-rose-wine:theorie-praktijkexamen` | Theorie- en praktijkexamen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-rose-wine:theorie-praktijkexamen` — feedback: ja

## Cocktails (`cocktails`)

**Track slug:** `cocktails` · **App-chip:** `cocktails`
**Bron:** `content/COCK_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_cocktails.sql` · **Rebuild:** `scripts/rebuild_cocktails_track.py`

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
| 2 | Technieken | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Ingrediënten | 5 | 4/5 | 5/5 | 5/5 | 5/5 |
| 4 | Klassieke Cocktails | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Sour Family | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Highballs & Longdrinks | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 3 | 3/3 | 3/3 | 3/3 | 3/3 |
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

## Port (`port`)

**Track slug:** `port` · **App-chip:** `port`
**Bron:** `content/PORT_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_port.sql` · **Rebuild:** `scripts/rebuild_port_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 39/40 | 1 | 98% |
| Quiz-feedback | 40/40 (39 bij quiz-lessen) | 0 | 100% |
| Kernbegrippen | 40/40 | 0 | 100% |
| Praktijkopdracht | 40/40 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | Productie | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Proeven | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 4 | Regio's van Port | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Portstijlen | 6 | 6/6 | 6/6 | 6/6 | 6/6 |
| 6 | Portstijlen verdiept | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 7 | Colheita & Garrafeira | 2 | 2/2 | 2/2 | 2/2 | 2/2 |
| 8 | Service, Pairing & Praktijk | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 9 | Blindproeven & Examen | 4 | 3/4 | 4/4 | 4/4 | 4/4 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 9 | `examen-port:theorie-examen-port` | Theorie-examen Port Academy |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-port:theorie-examen-port` — feedback: ja

## Mousserend (`sparkling`)

**Track slug:** `sparkling` · **App-chip:** `champagne`
**Bron:** `content/MOUS_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_sparkling.sql` · **Rebuild:** `scripts/rebuild_mous_track.py`

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
| 4 | Champagne | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Wereldstijlen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Suiker & Stijl | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 3 | 3/3 | 3/3 | 3/3 | 3/3 |
| 9 | Blindproeven & Examen | 3 | 2/3 | 3/3 | 3/3 | 3/3 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 3 | `proeven-sparkling:mini-toets-explorer` | Mini-toets Explorer |
| 9 | `examen-sparkling:theorie-praktijkexamen` | Theorie- en praktijkexamen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-sparkling:theorie-praktijkexamen` — feedback: ja

Mini-toets — vaak praktijk/blind; MC-quiz optioneel.

- `proeven-sparkling:mini-toets-explorer` — feedback: ja

## Bier (`beer`)

**Track slug:** `beer` · **App-chip:** `beer`
**Bron:** `content/BIER_MODULES.md` · **Lessen:** 40
**Seed:** `supabase/seed/academy_beer.sql` · **Rebuild:** `scripts/rebuild_beer_track.py`

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
| 4 | Klassieke stijlen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Belgische stijlen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Moderne stijlen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Service | 4 | 4/4 | 4/4 | 4/4 | 4/4 |
| 8 | Pairing & Gastronomie | 3 | 3/3 | 3/3 | 3/3 | 3/3 |
| 9 | Blindproeven & Examen | 3 | 2/3 | 3/3 | 3/3 | 3/3 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 3 | `proeven-beer:mini-toets-bier` | Mini-toets bier |
| 9 | `examen-beer:theorie-praktijk-examen` | Theorie- en praktijkexamen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-beer:theorie-praktijk-examen` — feedback: ja

Mini-toets — vaak praktijk/blind; MC-quiz optioneel.

- `proeven-beer:mini-toets-bier` — feedback: ja

## Bier 0.0 (`beer-zero`)

**Track slug:** `beer-zero` · **App-chip:** `beer-zero`
**Bron:** `content/BIER_0_0_MODULES.md` · **Lessen:** 45
**Seed:** `supabase/seed/academy_beer_zero.sql` · **Rebuild:** `scripts/rebuild_beer_zero_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 44/45 | 1 | 98% |
| Quiz-feedback | 45/45 (44 bij quiz-lessen) | 0 | 100% |
| Kernbegrippen | 45/45 | 0 | 100% |
| Praktijkopdracht | 45/45 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | Module 2 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Module 3 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 4 | Module 4 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Module 5 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Module 6 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Module 7 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 8 | Module 8 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 9 | Module 9 | 5 | 4/5 | 5/5 | 5/5 | 5/5 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 9 | `examen-beer-zero:theorie-examen` | Theorie-examen |

## Examen & mini-toets (geen MC-quiz)

Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.

- `examen-beer-zero:theorie-examen` — feedback: ja

## Biodynamisch Proeven (`biodynamic`)

**Track slug:** `biodynamic` · **App-chip:** `biodynamic`
**Bron:** `content/BIO_MODULES.md` · **Lessen:** 45
**Seed:** `supabase/seed/academy_biodynamic.sql` · **Rebuild:** `scripts/rebuild_bio_track.py`

## Samenvatting

| Onderdeel | Aanwezig | Ontbreekt | % |
|-----------|----------|-----------|---|
| Quiz (`## Quiz`) | 41/45 | 4 | 91% |
| Quiz-feedback | 41/45 (41 bij quiz-lessen) | 0 | 91% |
| Kernbegrippen | 45/45 | 0 | 100% |
| Praktijkopdracht | 45/45 | 0 | 100% |

## Per module

| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |
|-----|--------|--------|------|----------|------|----------|
| 1 | Fundament | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 2 | De kalender begrijpen | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 3 | Proeven per dagtype | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 4 | Weer & atmosfeer | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 5 | Wijnstijlen & dagtypes | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 6 | Bier, cocktails & 0.0 | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 7 | Voorraad & drinkstrategie | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 8 | Persoonlijke tasting intelligence | 5 | 5/5 | 5/5 | 5/5 | 5/5 |
| 9 | Praktijkexamen | 5 | 1/5 | 1/5 | 5/5 | 5/5 |

## Geen quiz-sectie

| Mod | Les-key | Titel |
|-----|---------|-------|
| 9 | `examen-biodynamic:praktijkproef-worteldag` | Praktijkproef op Worteldag |
| 9 | `examen-biodynamic:praktijkproef-vruchtdag` | Praktijkproef op Vruchtdag |
| 9 | `examen-biodynamic:vergelijking-en-analyse` | Vergelijking en analyse |
| 9 | `examen-biodynamic:eindassessment-biodynamic-intelligence` | Eindassessment Biodynamic Intelligence |

---

## Seed / app status

| Track | Seed | App | Gap-doc |
|-------|------|-----|---------|
| Wijn (Wine Foundation) | `supabase/seed/academy_wine_foundation.sql` | `wine` | [`gaps/WIJN_GAPS.md`](gaps/WIJN_GAPS.md) |
| Rode wijn | `supabase/seed/academy_red_wine.sql` | `red-wine` | [`gaps/ROOD_GAPS.md`](gaps/ROOD_GAPS.md) |
| Witte wijn | `supabase/seed/academy_white_wine.sql` | `white-wine` | [`gaps/WIT_GAPS.md`](gaps/WIT_GAPS.md) |
| Rosé | `supabase/seed/academy_rose_wine.sql` | `rose-wine` | [`gaps/ROSE_GAPS.md`](gaps/ROSE_GAPS.md) |
| Cocktails | `supabase/seed/academy_cocktails.sql` | `cocktails` | [`gaps/COCK_GAPS.md`](gaps/COCK_GAPS.md) |
| Port | `supabase/seed/academy_port.sql` | `port` | [`gaps/PORT_GAPS.md`](gaps/PORT_GAPS.md) |
| Mousserend | `supabase/seed/academy_sparkling.sql` | `champagne` | [`gaps/MOUS_GAPS.md`](gaps/MOUS_GAPS.md) |
| Bier | `supabase/seed/academy_beer.sql` | `beer` | [`gaps/BIER_GAPS.md`](gaps/BIER_GAPS.md) |
| Bier 0.0 | `supabase/seed/academy_beer_zero.sql` | `beer-zero` | [`gaps/BIER_0_0_GAPS.md`](gaps/BIER_0_0_GAPS.md) |
| Biodynamisch Proeven | `supabase/seed/academy_biodynamic.sql` | `biodynamic` | [`gaps/BIO_GAPS.md`](gaps/BIO_GAPS.md) |
