# Supabase — gedeeld project met kelder-app

Academy gebruikt **hetzelfde** Supabase-project als Way of tasting. Alleen het **schema** `academy` is nieuw.

---

## Project

| | |
|---|---|
| **Ref (kelder)** | `migoblpyknayqfljihoa` |
| **Kelder-schema** | `public` |
| **Academy-schema** | `academy` |

---

## Migraties in deze repo

| Bestand | Inhoud |
|---------|--------|
| `supabase/migrations/20260620120000_academy_schema.sql` | Schema + tabellen + RLS |
| `supabase/migrations/20260625140000_academy_v1_tracks.sql` | Tracks V1 |
| `supabase/migrations/20260625150000_academy_schema_grants.sql` | Grants voor Data API |

## Seeds (`supabase/seed/`)

| Bestand | Track slug | App-chip |
|---------|------------|----------|
| `academy_wine_foundation.sql` | `wine-foundation` | `wine` |
| `academy_red_wine.sql` | `red-wine` | `red-wine` |
| `academy_white_wine.sql` | `white-wine` | `white-wine` |
| `academy_rose_wine.sql` | `rose-wine` | `rose-wine` |
| `academy_sparkling.sql` | `sparkling` | `champagne` |
| `academy_beer.sql` | `beer` | `beer` |
| `academy_beer_zero.sql` | `beer-zero` | `beer-zero` |
| `academy_port.sql` | `port` | `port` |
| `academy_cocktails.sql` | `cocktails` | `cocktails` |
| `academy_biodynamic.sql` | `biodynamic` | `biodynamic` |

Rebuild vanuit markdown: `python3 scripts/rebuild_<track>_track.py` (zie [`content/README.md`](../content/README.md)).

**Regel:** geen wijzigingen aan `public.*` vanuit Academy-repo. Zie [`INTEGRATIE.md`](INTEGRATIE.md).

---

## Uitvoeren

### Via Supabase CLI (aanbevolen)

```bash
cd ~/Development/Ecosysteem-drank/dev-way-of-tasting-academy
supabase link --project-ref migoblpyknayqfljihoa   # eenmalig
supabase db query --linked -f supabase/migrations/20260620120000_academy_schema.sql
supabase db query --linked -f supabase/migrations/20260625150000_academy_schema_grants.sql
supabase db query --linked -f supabase/seed/academy_biodynamic.sql   # of andere track-seed
```

### Via SQL Editor

1. Dashboard → SQL → New query  
2. Plak migratiebestand → Run  
3. Herhaal voor seed

---

## Controleren

```sql
select table_schema, table_name
from information_schema.tables
where table_schema = 'academy'
order by table_name;
```

Verwacht o.a.: `courses`, `lessons`, `modules`, `quiz_questions`, `user_lesson_progress`, `user_quiz_attempts`.

---

## API: schema `academy` exposen

De web-client gebruikt `db: { schema: 'academy' }`. In Supabase Dashboard:

1. **Project Settings** → **Integrations** → **Data API** → tab **Settings** → **Exposed schemas**
2. Voeg `academy` toe naast `public` (eenmalig per project)
3. Draai grants-migratie: `supabase/migrations/20260625150000_academy_schema_grants.sql`  
   (zonder grants krijg je `permission denied for schema academy`)

Zonder deze stap geeft de client een schema-fout bij `.from('courses')`.

---

## RLS test (twee testaccounts)

1. User A voltooit een les → rij in `user_lesson_progress`  
2. User B mag die rij **niet** zien (alleen eigen voortgang)

---

## Storage (later)

Bucket `academy-assets` voor afbeeldingen in lessen — **nog niet** in v1-migratie. Etiketfoto’s blijven in `label-photos` (kelder).

---

## Edge Functions (later)

Optioneel `academy-quiz-hint` — apart van `scan-label` / `lookup-barcode`. Niet nodig voor MVP.
