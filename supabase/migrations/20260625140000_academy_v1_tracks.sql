-- Way of tasting Academy — V1 physical model (tracks, user_profiles)
-- Bron: docs/DATAMODEL_V1_FYSIEK.md
-- Vervangt legacy academy.courses-structuur uit 20260620120000_academy_schema.sql

create schema if not exists academy;

-- ─── Legacy opruimen (demo-safe; geen productie-curriculum onder courses) ───

drop table if exists academy.user_quiz_attempts cascade;
drop table if exists academy.user_lesson_progress cascade;
drop table if exists academy.quiz_questions cascade;
drop table if exists academy.lessons cascade;
drop table if exists academy.modules cascade;
drop table if exists academy.courses cascade;
drop table if exists academy.user_profiles cascade;
drop table if exists academy.tracks cascade;

-- ─── Shared triggers ───

create or replace function academy.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

comment on function academy.set_updated_at() is
  'Maintains updated_at op mutable rijen. Niet op append-only tabellen (user_quiz_attempts).';

-- ─── user_profiles (1:1 auth.users, geen auth-duplicatie) ───

create table academy.user_profiles (
  user_id uuid primary key references auth.users (id) on delete cascade,
  display_name text,
  locale text not null default 'nl',
  notifications_enabled boolean not null default true,
  preferences jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table academy.user_profiles is
  'Academy-profiel 1:1 met auth.users. Login blijft in Supabase Auth; certificeringsniveau zit hier niet (komt uit voortgang).';

comment on column academy.user_profiles.preferences is
  'App-voorkeuren (jsonb). Voorbeeld: experience_level, theme. Niet schema-afgedwongen in MVP.';

create trigger user_profiles_set_updated_at
  before update on academy.user_profiles
  for each row execute function academy.set_updated_at();

-- ─── tracks (definitieve term; geen courses) ───

create table academy.tracks (
  id uuid primary key default gen_random_uuid(),
  slug text not null,
  title text not null,
  description text,
  sort_order int not null default 0,
  published_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint tracks_slug_key unique (slug)
);

comment on table academy.tracks is
  'Specialisatie binnen Way of tasting Academy (bijv. port). Term track is definitief — legacy courses is verwijderd.';

comment on column academy.tracks.published_at is
  'Catalogus-niveau publicatie. Les-zichtbaarheid voor RLS gebruikt lessons.is_published (denormalized).';

create trigger tracks_set_updated_at
  before update on academy.tracks
  for each row execute function academy.set_updated_at();

-- ─── modules (level op module — bekende MVP-beperking) ───

create table academy.modules (
  id uuid primary key default gen_random_uuid(),
  track_id uuid not null references academy.tracks (id) on delete cascade,
  level text not null,
  slug text not null,
  title text not null,
  sort_order int not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint modules_level_check check (
    level in ('explorer', 'specialist', 'master')
  ),
  constraint modules_track_id_slug_key unique (track_id, slug)
);

comment on table academy.modules is
  'Hoofdstuk binnen een track. level (explorer/specialist/master) zit op module: modules zijn NIET herbruikbaar over niveaus (MVP-bewuste beperking).';

comment on column academy.modules.level is
  'Certificeringsniveau op module-niveau. Zelfde inhoud op twee niveaus vereist twee module-rijen.';

create index modules_track_id_idx on academy.modules (track_id);

create index modules_track_level_sort_idx on academy.modules (track_id, level, sort_order);

create trigger modules_set_updated_at
  before update on academy.modules
  for each row execute function academy.set_updated_at();

-- ─── lessons (vaste inhoudskolommen; is_published voor RLS) ───

create table academy.lessons (
  id uuid primary key default gen_random_uuid(),
  module_id uuid not null references academy.modules (id) on delete cascade,
  slug text not null,
  title text not null,
  learning_objective text,
  theory_markdown text,
  did_you_know text,
  summary_markdown text,
  practice_assignment_markdown text,
  duration_minutes int,
  sort_order int not null default 0,
  is_published boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint lessons_module_id_slug_key unique (module_id, slug)
);

comment on table academy.lessons is
  'Les met vaste kolommen (MVP). is_published voor RLS. Kernbegrippen: geen key_terms text[] — later lesson_key_terms (vertalingen, relaties, search).';

comment on column academy.lessons.is_published is
  'Denormalized publicatie-flag voor RLS (geen multi-join). Alleen true zetten als parent track gepubliceerd is en les inhoudelijk klaar is.';

create index lessons_module_id_idx on academy.lessons (module_id);

create index lessons_is_published_idx on academy.lessons (id) where is_published = true;

create trigger lessons_set_updated_at
  before update on academy.lessons
  for each row execute function academy.set_updated_at();

-- ─── quiz_questions ───

create table academy.quiz_questions (
  id uuid primary key default gen_random_uuid(),
  lesson_id uuid not null references academy.lessons (id) on delete cascade,
  sort_order int not null default 0,
  prompt text not null,
  options jsonb not null,
  correct_index smallint not null,
  explanation text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint quiz_questions_correct_index_check check (correct_index >= 0)
);

comment on column academy.quiz_questions.sort_order is
  'Vaste volgorde van quizvragen (doel: 5 per les). UI sorteert hierop; shuffle is app-logica, niet DB.';

create index quiz_questions_lesson_id_idx on academy.quiz_questions (lesson_id);

create index quiz_questions_lesson_sort_idx on academy.quiz_questions (lesson_id, sort_order);

create trigger quiz_questions_set_updated_at
  before update on academy.quiz_questions
  for each row execute function academy.set_updated_at();

-- ─── user_lesson_progress (state-based: één rij per user+les, geen history) ───

create table academy.user_lesson_progress (
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references academy.lessons (id) on delete cascade,
  status text not null default 'not_started',
  best_quiz_score_percent smallint,
  practice_completed boolean not null default false,
  context_bottle_id uuid,
  completed_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  primary key (user_id, lesson_id),
  constraint user_lesson_progress_status_check check (
    status in ('not_started', 'in_progress', 'completed')
  ),
  constraint user_lesson_progress_best_quiz_score_check check (
    best_quiz_score_percent is null
    or (best_quiz_score_percent >= 0 and best_quiz_score_percent <= 100)
  )
);

comment on table academy.user_lesson_progress is
  'Huidige voortgang per gebruiker per les (state-based). Geen history — wijzigingen overschrijven dezelfde rij. Quiz-pogingen zitten in user_quiz_attempts.';

comment on column academy.user_lesson_progress.context_bottle_id is
  'no FK: external integration (Way of Tasting / public.bottles). Bewust los hangend; validatie in app-laag (INTEGRATIE.md).';

create index user_lesson_progress_user_id_idx on academy.user_lesson_progress (user_id);

create trigger user_lesson_progress_set_updated_at
  before update on academy.user_lesson_progress
  for each row execute function academy.set_updated_at();

-- ─── user_quiz_attempts (append-only: alleen created_at, geen updated_at) ───

create table academy.user_quiz_attempts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users (id) on delete cascade,
  lesson_id uuid not null references academy.lessons (id) on delete cascade,
  answers jsonb not null default '{}'::jsonb,
  score_percent smallint not null,
  created_at timestamptz not null default now(),
  constraint user_quiz_attempts_score_percent_check check (
    score_percent >= 0 and score_percent <= 100
  )
);

comment on table academy.user_quiz_attempts is
  'Append-only quizpogingen. Alleen created_at (geen updated_at): rijen worden nooit gewijzigd. Geen UPDATE/DELETE policies voor authenticated.';

create index user_quiz_attempts_user_lesson_idx on academy.user_quiz_attempts (user_id, lesson_id);

-- ─── Profiel bij nieuwe auth-user (1:1) ───

create or replace function academy.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = academy
as $$
begin
  insert into academy.user_profiles (user_id)
  values (new.id)
  on conflict (user_id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created_academy_profile on auth.users;

create trigger on_auth_user_created_academy_profile
  after insert on auth.users
  for each row execute function academy.handle_new_user();

-- ─── RLS ───

alter table academy.user_profiles enable row level security;
alter table academy.tracks enable row level security;
alter table academy.modules enable row level security;
alter table academy.lessons enable row level security;
alter table academy.quiz_questions enable row level security;
alter table academy.user_lesson_progress enable row level security;
alter table academy.user_quiz_attempts enable row level security;

-- user_profiles
create policy user_profiles_select_own
  on academy.user_profiles for select to authenticated
  using (auth.uid() = user_id);

create policy user_profiles_insert_own
  on academy.user_profiles for insert to authenticated
  with check (auth.uid() = user_id);

create policy user_profiles_update_own
  on academy.user_profiles for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- curriculum (read-only authenticated; schrijven via service role)
create policy tracks_select_published
  on academy.tracks for select to authenticated
  using (published_at is not null);

create policy modules_select_published
  on academy.modules for select to authenticated
  using (
    exists (
      select 1
      from academy.tracks t
      where t.id = track_id
        and t.published_at is not null
    )
  );

-- lessons + quiz: denormalized is_published (geen multi-join RLS)
create policy lessons_select_published
  on academy.lessons for select to authenticated
  using (is_published = true);

create policy quiz_questions_select_published
  on academy.quiz_questions for select to authenticated
  using (
    exists (
      select 1
      from academy.lessons l
      where l.id = lesson_id
        and l.is_published = true
    )
  );

-- user_lesson_progress (state-based; geen delete in MVP)
create policy user_lesson_progress_select_own
  on academy.user_lesson_progress for select to authenticated
  using (auth.uid() = user_id);

create policy user_lesson_progress_insert_own
  on academy.user_lesson_progress for insert to authenticated
  with check (auth.uid() = user_id);

create policy user_lesson_progress_update_own
  on academy.user_lesson_progress for update to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- user_quiz_attempts (append-only)
create policy user_quiz_attempts_select_own
  on academy.user_quiz_attempts for select to authenticated
  using (auth.uid() = user_id);

create policy user_quiz_attempts_insert_own
  on academy.user_quiz_attempts for insert to authenticated
  with check (auth.uid() = user_id);

comment on schema academy is
  'Way of tasting Academy V1 — track → module → lesson. Zie docs/DATAMODEL_V1_FYSIEK.md';

-- ─── API grants (vereist naast Exposed schemas in Data API) ───

grant usage on schema academy to postgres, anon, authenticated, service_role;

grant all on all tables in schema academy to postgres, service_role;
grant select, insert, update, delete on all tables in schema academy to authenticated;
grant select on all tables in schema academy to anon;

grant all on all routines in schema academy to postgres, service_role;
grant execute on all functions in schema academy to authenticated, service_role;

alter default privileges for role postgres in schema academy
  grant all on tables to postgres, service_role;

alter default privileges for role postgres in schema academy
  grant select, insert, update, delete on tables to authenticated;

alter default privileges for role postgres in schema academy
  grant select on tables to anon;
