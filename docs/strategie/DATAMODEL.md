# Datamodel — schema `academy`

> **Legacy (v0.1):** dit document beschrijft de **eerste migratie** met `courses`. Vervangen door **[`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md)** (`tracks`, `user_profiles`, uitgebreide lessons). Geen nieuwe content onder `courses` aanmaken.

Curriculum en voortgang leven in Postgres schema **`academy`**, op het **zelfde** Supabase-project als de kelder-app (`public`).

Migratie: [`supabase/migrations/20260620120000_academy_schema.sql`](../supabase/migrations/20260620120000_academy_schema.sql)

---

## Overzicht

```
courses
  └── modules
        └── lessons
              └── quiz_questions (optioneel, als lesson.content_type = 'quiz')

user_course_enrollment (optioneel)
user_lesson_progress
user_quiz_attempts
```

---

## Tabellen

### `academy.courses`

| Kolom | Type | Toelichting |
|-------|------|-------------|
| `id` | uuid | PK |
| `slug` | text | uniek, URL-vriendelijk (`wijn-basis`) |
| `title` | text | Weergavenaam |
| `subtitle` | text | Korte tagline |
| `description` | text | Intro |
| `level` | text | `basis` · `gevorderd` · `sommelier` |
| `sort_order` | int | Volgorde in catalogus |
| `published_at` | timestamptz | null = concept |
| `created_at` / `updated_at` | timestamptz | |

### `academy.modules`

| Kolom | Type |
|-------|------|
| `id` | uuid |
| `course_id` | uuid → `courses` |
| `slug` | text |
| `title` | text |
| `sort_order` | int |

Uniek: `(course_id, slug)`.

### `academy.lessons`

| Kolom | Type | Toelichting |
|-------|------|-------------|
| `id` | uuid | |
| `module_id` | uuid → `modules` |
| `slug` | text | |
| `title` | text | |
| `content_type` | text | `text` · `video` · `quiz` |
| `body_markdown` | text | Lesinhoud (Markdown) |
| `video_url` | text | Optioneel embed-URL |
| `duration_minutes` | int | Indicatie |
| `sort_order` | int | |

### `academy.quiz_questions`

| Kolom | Type |
|-------|------|
| `id` | uuid |
| `lesson_id` | uuid → `lessons` |
| `sort_order` | int |
| `prompt` | text |
| `options` | jsonb | `["Antwoord A","Antwoord B",…]` |
| `correct_index` | smallint | 0-based |
| `explanation` | text | Uitleg na beantwoorden |

### `academy.user_lesson_progress`

| Kolom | Type |
|-------|------|
| `user_id` | uuid → `auth.users` |
| `lesson_id` | uuid → `lessons` |
| `status` | text | `not_started` · `in_progress` · `completed` |
| `score_percent` | smallint | 0–100 (quiz) |
| `context_bottle_id` | uuid | **Optioneel**, geen FK — kelderfles bij praktijkles |
| `completed_at` | timestamptz |
| `updated_at` | timestamptz |

PK: `(user_id, lesson_id)`.

### `academy.user_quiz_attempts`

| Kolom | Type |
|-------|------|
| `id` | uuid |
| `user_id` | uuid |
| `lesson_id` | uuid |
| `answers` | jsonb | `{ "question_id": selected_index }` |
| `score_percent` | smallint |
| `created_at` | timestamptz |

---

## RLS (samenvatting)

| Tabel | SELECT | INSERT/UPDATE/DELETE |
|-------|--------|----------------------|
| `courses`, `modules`, `lessons`, `quiz_questions` | Ingelogd + `published_at` niet null (cursus) | Alleen service role (seed/import) |
| `user_lesson_progress` | Eigen `user_id` | Eigen `user_id` |
| `user_quiz_attempts` | Eigen `user_id` | Eigen `user_id` |

Curriculum schrijven: SQL seed, importscript, of Supabase dashboard met service role — **niet** vanuit de browser (v1).

---

## Seed / demo

Zie [`CONTENT.md`](CONTENT.md) en [`supabase/seed/academy_demo.sql`](../supabase/seed/academy_demo.sql) (na eerste migratie).

---

## Relatie kelder-app

Zie [`INTEGRATIE.md`](INTEGRATIE.md) §3. `context_bottle_id` is bewust **zonder foreign key** naar `public.bottles`.
