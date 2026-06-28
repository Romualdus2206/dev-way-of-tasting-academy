-- Praktijkopdracht: checklist + reflectie; theorie gelezen apart van praktijk afgerond

alter table academy.user_lesson_progress
  add column if not exists theory_read boolean not null default false,
  add column if not exists practice_checklist jsonb not null default '[]'::jsonb,
  add column if not exists practice_reflection text;

comment on column academy.user_lesson_progress.theory_read is
  'Gebruiker heeft theorie (en overige lesinhoud) als gelezen gemarkeerd.';

comment on column academy.user_lesson_progress.practice_completed is
  'Praktijkopdracht afgerond (checklist + reflectie indien van toepassing).';

comment on column academy.user_lesson_progress.practice_checklist is
  'Checklist-voortgang als JSON-array van booleans (zelfde volgorde als parsed checklist).';

comment on column academy.user_lesson_progress.practice_reflection is
  'Antwoord op de reflectievraag van de praktijkopdracht.';

-- Bestaande voortgang: "gelezen" was voorheen practice_completed
update academy.user_lesson_progress
set theory_read = practice_completed
where theory_read = false and practice_completed = true;
