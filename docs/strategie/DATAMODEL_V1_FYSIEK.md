# Fysiek datamodel V1 — Way of tasting Academy

**Status:** klaar voor SQL-generatie (juni 2026)  
**Voorganger:** [`DATAMODEL_V1_ONTWERP.md`](DATAMODEL_V1_ONTWERP.md) (concept + keuzes)  
**Schema:** `academy` · **nog geen SQL in dit document**

Dit is het **physical model**: alle tabellen, kolommen, types, keys en constraints. Hieruit kan één migratiebestand worden gegenereerd.

---

## Terminologie (definitief)

| Term | Betekenis | Niet gebruiken |
|------|-----------|----------------|
| **track** | Specialisatie (Port, Wijn, …) | ~~course~~, ~~cursus~~ (DB) |
| **module** | Hoofdstuk binnen een track | |
| **lesson** | Les met vaste inhoudskolommen | |
| **level** | `explorer` · `specialist` · `master` op **module** | |

`academy.courses` uit de eerste migratie is **legacy** en verdwijnt bij implementatie van dit model. Geen nieuwe content onder `courses` aanmaken.

---

## Externe entiteit: `auth.users`

Beheerd door Supabase Auth. **Niet dupliceren.**

Academy-tabellen refereren via `user_id uuid → auth.users(id) on delete cascade`.

Aanvullende profieldata → `academy.user_profiles` (1:1).

---

## ERD (met attributen)

```mermaid
erDiagram
    AUTH_USERS ||--o| USER_PROFILES : "1:1"
    AUTH_USERS ||--o{ USER_LESSON_PROGRESS : "1:N"
    AUTH_USERS ||--o{ USER_QUIZ_ATTEMPTS : "1:N"

    TRACKS ||--o{ MODULES : "1:N"
    MODULES ||--o{ LESSONS : "1:N"
    LESSONS ||--o{ QUIZ_QUESTIONS : "1:N"

    LESSONS ||--o{ USER_LESSON_PROGRESS : "1:N"
    LESSONS ||--o{ USER_QUIZ_ATTEMPTS : "1:N"

    AUTH_USERS {
        uuid id PK "Supabase managed"
        text email
    }

    USER_PROFILES {
        uuid user_id PK_FK
        text display_name
        text locale
        boolean notifications_enabled
        jsonb preferences
        timestamptz created_at
        timestamptz updated_at
    }

    TRACKS {
        uuid id PK
        text slug UK
        text title
        text description
        int sort_order
        timestamptz published_at
        timestamptz created_at
        timestamptz updated_at
    }

    MODULES {
        uuid id PK
        uuid track_id FK
        text level
        text slug
        text title
        int sort_order
        timestamptz created_at
        timestamptz updated_at
    }

    LESSONS {
        uuid id PK
        uuid module_id FK
        text slug
        text title
        text learning_objective
        text theory_markdown
        text did_you_know
        text summary_markdown
        text practice_assignment_markdown
        int duration_minutes
        int sort_order
        boolean is_published
        timestamptz created_at
        timestamptz updated_at
    }

    QUIZ_QUESTIONS {
        uuid id PK
        uuid lesson_id FK
        int sort_order
        text prompt
        jsonb options
        smallint correct_index
        text explanation
        timestamptz created_at
        timestamptz updated_at
    }

    USER_LESSON_PROGRESS {
        uuid user_id PK_FK
        uuid lesson_id PK_FK
        text status
        smallint best_quiz_score_percent
        boolean practice_completed
        uuid context_bottle_id
        timestamptz completed_at
        timestamptz created_at
        timestamptz updated_at
    }

    USER_QUIZ_ATTEMPTS {
        uuid id PK
        uuid user_id FK
        uuid lesson_id FK
        jsonb answers
        smallint score_percent
        timestamptz created_at
    }
```

---

## Tabelspecificaties

### `academy.user_profiles`

**Doel:** Academy-specifieke profieldata; auth blijft bron voor identiteit/login.

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `user_id` | `uuid` | NO | | ✓ | `auth.users(id)` ON DELETE CASCADE | | 1:1 met auth-user |
| 2 | `display_name` | `text` | YES | | | | | Weergavenaam (naam) |
| 3 | `locale` | `text` | NO | `'nl'` | | | | Taal (`nl`, `en`, …) |
| 4 | `notifications_enabled` | `boolean` | NO | `true` | | | | Notificaties aan/uit |
| 5 | `preferences` | `jsonb` | NO | `'{}'` | | | | Voorkeuren (thema, units, …) |
| 6 | `created_at` | `timestamptz` | NO | `now()` | | | | |
| 7 | `updated_at` | `timestamptz` | NO | `now()` | | | | |

**Check constraints:** geen op MVP.

**`preferences` (voorbeeldkeys, app-level, niet in DB afgedwongen):**

```json
{
  "experience_level": "explorer",
  "theme": "system"
}
```

**Certificeringsniveau** (behaald Explorer/Specialist/Master) komt later uit voortgang/certificaten — niet in `user_profiles` dupliceren.

**Aanmaak:** lazy upsert bij eerste login of via trigger op signup (implementatiekeuze in SQL-stap).

---

### `academy.tracks`

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `id` | `uuid` | NO | `gen_random_uuid()` | ✓ | | | |
| 2 | `slug` | `text` | NO | | | | ✓ | `port`, `wijn`, … |
| 3 | `title` | `text` | NO | | | | | |
| 4 | `description` | `text` | YES | | | | | |
| 5 | `sort_order` | `int` | NO | `0` | | | | |
| 6 | `published_at` | `timestamptz` | YES | | | | | NULL = concept |
| 7 | `created_at` | `timestamptz` | NO | `now()` | | | | |
| 8 | `updated_at` | `timestamptz` | NO | `now()` | | | | |

---

### `academy.modules`

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `id` | `uuid` | NO | `gen_random_uuid()` | ✓ | | | |
| 2 | `track_id` | `uuid` | NO | | | `tracks(id)` ON DELETE CASCADE | | |
| 3 | `level` | `text` | NO | | | | | Zie enum hieronder |
| 4 | `slug` | `text` | NO | | | | | Uniek per track |
| 5 | `title` | `text` | NO | | | | | |
| 6 | `sort_order` | `int` | NO | `0` | | | | Binnen track+level |
| 7 | `created_at` | `timestamptz` | NO | `now()` | | | | |
| 8 | `updated_at` | `timestamptz` | NO | `now()` | | | | |

**Unique:** `(track_id, slug)`

**Check:** `level IN ('explorer', 'specialist', 'master')`

**Bekende beperking:** `level` zit op module → **geen hergebruik** van dezelfde module over niveaus. Acceptabel voor MVP; later eventueel `levels` koppeltabel of `level` op aparte `learning_paths`-entiteit.

---

### `academy.lessons`

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `id` | `uuid` | NO | `gen_random_uuid()` | ✓ | | | |
| 2 | `module_id` | `uuid` | NO | | | `modules(id)` ON DELETE CASCADE | | |
| 3 | `slug` | `text` | NO | | | | | Uniek per module |
| 4 | `title` | `text` | NO | | | | | |
| 5 | `learning_objective` | `text` | YES | | | | | Leerdoel |
| 6 | `theory_markdown` | `text` | YES | | | | | Theorie |
| 7 | `key_concepts_markdown` | `text` | YES | | | | | Kernbegrippen (markdown) |
| 8 | `did_you_know` | `text` | YES | | | | | Wist-je-dat |
| 9 | `summary_markdown` | `text` | YES | | | | | Samenvatting |
| 10 | `practice_assignment_markdown` | `text` | YES | | | | | Praktijkopdracht |
| 11 | `duration_minutes` | `int` | YES | | | | | Indicatie 5–10 min |
| 12 | `sort_order` | `int` | NO | `0` | | | | |
| 13 | `is_published` | `boolean` | NO | `false` | | | | Denormalized RLS-flag |
| 14 | `created_at` | `timestamptz` | NO | `now()` | | | | |
| 15 | `updated_at` | `timestamptz` | NO | `now()` | | | | |

**Unique:** `(module_id, slug)`

**`is_published`:** alleen `true` als parent track gepubliceerd is én les klaar is. RLS op `lessons` en `quiz_questions` gebruikt deze kolom (geen multi-join).

**Kernbegrippen:** `key_concepts_markdown` (markdown per les). Interactieve woordenlijst in de app (`glossaryTerms`) blijft apart; later optioneel `lesson_key_terms` voor vertalingen en zoeken.

---

### `academy.quiz_questions`

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `id` | `uuid` | NO | `gen_random_uuid()` | ✓ | | | |
| 2 | `lesson_id` | `uuid` | NO | | | `lessons(id)` ON DELETE CASCADE | | |
| 3 | `sort_order` | `int` | NO | `0` | | | | Vaste volgorde (5 vragen) |
| 4 | `prompt` | `text` | NO | | | | | |
| 5 | `options` | `jsonb` | NO | | | | | JSON-array van strings |
| 6 | `correct_index` | `smallint` | NO | | | | | ≥ 0 |
| 7 | `explanation` | `text` | YES | | | | | |
| 8 | `created_at` | `timestamptz` | NO | `now()` | | | | |
| 9 | `updated_at` | `timestamptz` | NO | `now()` | | | | |

**Check:** `correct_index >= 0`

---

### `academy.user_lesson_progress`

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `user_id` | `uuid` | NO | | ✓ | `auth.users(id)` ON DELETE CASCADE | | |
| 2 | `lesson_id` | `uuid` | NO | | ✓ | `lessons(id)` ON DELETE CASCADE | | |
| 3 | `status` | `text` | NO | `'not_started'` | | | | Zie enum |
| 4 | `best_quiz_score_percent` | `smallint` | YES | | | | | 0–100 |
| 5 | `practice_completed` | `boolean` | NO | `false` | | | | |
| 6 | `context_bottle_id` | `uuid` | YES | | | | | **no FK:** external integration (Way of Tasting) |
| 7 | `completed_at` | `timestamptz` | YES | | | | | |
| 8 | `created_at` | `timestamptz` | NO | `now()` | | | | |
| 9 | `updated_at` | `timestamptz` | NO | `now()` | | | | |

**Check:** `status IN ('not_started', 'in_progress', 'completed')`  
**Check:** `best_quiz_score_percent IS NULL OR (best_quiz_score_percent BETWEEN 0 AND 100)`

---

### `academy.user_quiz_attempts`

| # | Kolom | Type | Null | Default | PK | FK | UK | Toelichting |
|---|-------|------|------|---------|----|----|-----|-------------|
| 1 | `id` | `uuid` | NO | `gen_random_uuid()` | ✓ | | | |
| 2 | `user_id` | `uuid` | NO | | | `auth.users(id)` ON DELETE CASCADE | | |
| 3 | `lesson_id` | `uuid` | NO | | | `lessons(id)` ON DELETE CASCADE | | |
| 4 | `answers` | `jsonb` | NO | `'{}'` | | | | `{question_id: index}` |
| 5 | `score_percent` | `smallint` | NO | | | | | 0–100 |
| 6 | `created_at` | `timestamptz` | NO | `now()` | | | | Append-only: geen `updated_at` |

**Check:** `score_percent BETWEEN 0 AND 100`

---

## Indexes

| Naam | Tabel | Kolommen | Type |
|------|-------|----------|------|
| `tracks_slug_key` | `tracks` | `slug` | UNIQUE |
| `modules_track_id_idx` | `modules` | `track_id` | BTREE |
| `modules_track_level_sort_idx` | `modules` | `track_id`, `level`, `sort_order` | BTREE |
| `modules_track_id_slug_key` | `modules` | `track_id`, `slug` | UNIQUE |
| `lessons_module_id_idx` | `lessons` | `module_id` | BTREE |
| `lessons_module_id_slug_key` | `lessons` | `module_id`, `slug` | UNIQUE |
| `quiz_questions_lesson_id_idx` | `quiz_questions` | `lesson_id` | BTREE |
| `quiz_questions_lesson_sort_idx` | `quiz_questions` | `lesson_id`, `sort_order` | BTREE |
| `lessons_is_published_idx` | `lessons` | `id` WHERE `is_published` | PARTIAL |
| `user_lesson_progress_user_id_idx` | `user_lesson_progress` | `user_id` | BTREE |
| `user_quiz_attempts_user_lesson_idx` | `user_quiz_attempts` | `user_id`, `lesson_id` | BTREE |

---

## RLS (physical policies)

| Tabel | Policy | Operatie | Expressie |
|-------|--------|----------|-----------|
| `user_profiles` | `select_own` | SELECT | `auth.uid() = user_id` |
| `user_profiles` | `insert_own` | INSERT | `auth.uid() = user_id` |
| `user_profiles` | `update_own` | UPDATE | `auth.uid() = user_id` |
| `tracks` | `select_published` | SELECT | `published_at IS NOT NULL` |
| `modules` | `select_published` | SELECT | parent track gepubliceerd |
| `lessons` | `select_published` | SELECT | `is_published = true` |
| `quiz_questions` | `select_published` | SELECT | parent les `is_published = true` (één join) |
| `user_lesson_progress` | `*_own` | SELECT, INSERT, UPDATE | `auth.uid() = user_id` |
| `user_quiz_attempts` | `select_own` | SELECT | `auth.uid() = user_id` |
| `user_quiz_attempts` | `insert_own` | INSERT | `auth.uid() = user_id` |

Curriculum INSERT/UPDATE/DELETE: **service role** only (geen policy voor `authenticated`).

---

## Migratie van legacy `courses`

**Eén definitieve stap** — geen parallelle termen.

| Situatie | Actie |
|----------|--------|
| Alleen demo-seed, geen productie-content | Nieuwe migratie: `tracks` + rest aanmaken, `courses` + oude kolommen **droppen**, nieuwe Port-seed |
| Bestaande demo-data behouden | Eenmalig `INSERT INTO tracks SELECT … FROM courses`, `modules.course_id` → `track_id`, daarna `courses` droppen |

**Vanaf nu:** alle documentatie, seed en code gebruiken **track** — niet `course`.

---

## Tabeltelling V1

| # | Tabel |
|---|--------|
| 1 | `user_profiles` |
| 2 | `tracks` |
| 3 | `modules` |
| 4 | `lessons` |
| 5 | `quiz_questions` |
| 6 | `user_lesson_progress` |
| 7 | `user_quiz_attempts` |

**7 tabellen** in schema `academy`.

---

## Volgende stap

→ SQL-migratiebestand genereren op basis van dit document.

---

## Wijzigingslog

| Datum | Wijziging |
|-------|-----------|
| 2026-06-25 | Feedback: is_published RLS, timestamps, sort_order index, context_bottle_id comment |
| 2026-06-25 | Physical model V1 — feedback Romuald (profiles, attributen, track definitief) |
