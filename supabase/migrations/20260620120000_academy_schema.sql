-- Way of tasting Academy — schema academy (gedeeld Supabase-project met kelder-app)
-- Zie docs/INTEGRATIE.md — wijzigt NIET public.*

create schema if not exists academy;

-- ─── Curriculum (read-only voor ingelogde users via RLS) ───

create table if not exists academy.courses (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  subtitle text,
  description text,
  level text not null default 'basis'
    check (level in ('basis', 'gevorderd', 'sommelier')),
  sort_order int not null default 0,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists academy.modules (
  id uuid primary key default gen_random_uuid(),
  course_id uuid not null references academy.courses (id) on delete cascade,
  slug text not null,
  title text not null,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  unique (course_id, slug)
);

create index if not exists academy_modules_course_id_idx on academy.modules (course_id);

create table if not exists academy.lessons (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references academy.modules (id) on delete cascade,
  slug text not null,
  title text not null,
  content_type text not null default 'text'
    check (content_type in ('text', 'video', 'quiz')),
  body_markdown text,
  video_url text,
  duration_minutes int,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (module_id, slug)
);

create index if not exists academy_lessons_module_id_idx on academy.lessons (module_id);

create table if not exists academy.quiz_questions (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references academy.lessons (id) on delete cascade,
  sort_order int not null default 0,
  prompt text not null,
  options jsonb not null,
  correct_index smallint not null check (correct_index >= 0),
  explanation text,
  created_at timestamptz not null default now()
);

create index if not exists academy_quiz_questions_lesson_id_idx on academy.quiz_questions (lesson_id);

-- ─── Voortgang (per user) ───

create table if not exists academy.user_lesson_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references academy.lessons (id) on delete cascade,
  status text not null default 'not_started'
    check (status in ('not_started', 'in_progress', 'completed')),
  score_percent smallint check (score_percent is null or (score_percent >= 0 and score_percent <= 100)),
  context_bottle_id uuid,
  completed_at timestamptz,
  updated_at timestamptz not null default now(),
  primary key (user_id, lesson_id)
);

create index if not exists academy_user_lesson_progress_user_id_idx
  on academy.user_lesson_progress (user_id);

create table if not exists academy.user_quiz_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references academy.lessons (id) on delete cascade,
  answers jsonb not null default '{}',
  score_percent smallint not null check (score_percent >= 0 and score_percent <= 100),
  created_at timestamptz not null default now()
);

create index if not exists academy_user_quiz_attempts_user_id_idx
  on academy.user_quiz_attempts (user_id);

-- ─── RLS ───

alter table academy.courses enable row level security;
alter table academy.modules enable row level security;
alter table academy.lessons enable row level security;
alter table academy.quiz_questions enable row level security;
alter table academy.user_lesson_progress enable row level security;
alter table academy.user_quiz_attempts enable row level security;

-- Curriculum: alleen gepubliceerde cursussen, ingelogd
create policy "academy_courses_select_published"
  on academy.courses for select to authenticated
  using (published_at is not null);

create policy "academy_modules_select_published"
  on academy.modules for select to authenticated
  using (
    exists (
      select 1 from academy.courses c
      where c.id = course_id and c.published_at is not null
    )
  );

create policy "academy_lessons_select_published"
  on academy.lessons for select to authenticated
  using (
    exists (
      select 1 from academy.modules m
      join academy.courses c on c.id = m.course_id
      where m.id = module_id and c.published_at is not null
    )
  );

create policy "academy_quiz_questions_select_published"
  on academy.quiz_questions for select to authenticated
  using (
    exists (
      select 1 from academy.lessons l
      join academy.modules m on m.id = l.module_id
      join academy.courses c on c.id = m.course_id
      where l.id = lesson_id and c.published_at is not null
    )
  );

-- Voortgang: eigen rijen
create policy "academy_progress_select_own"
  on academy.user_lesson_progress for select to authenticated
  using (auth.uid() = user_id);

create policy "academy_progress_insert_own"
  on academy.user_lesson_progress for insert to authenticated
  with check (auth.uid() = user_id);

create policy "academy_progress_update_own"
  on academy.user_lesson_progress for update to authenticated
  using (auth.uid() = user_id);

create policy "academy_quiz_attempts_select_own"
  on academy.user_quiz_attempts for select to authenticated
  using (auth.uid() = user_id);

create policy "academy_quiz_attempts_insert_own"
  on academy.user_quiz_attempts for insert to authenticated
  with check (auth.uid() = user_id);

comment on schema academy is 'Way of tasting Academy — curriculum + voortgang (gedeeld Supabase-project)';
