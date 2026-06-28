-- Kernbegrippen per les (markdown, zoals theorie/samenvatting)

alter table academy.lessons
  add column if not exists key_concepts_markdown text;

comment on column academy.lessons.key_concepts_markdown is
  'Kernbegrippen van de les (markdown). Los van woordenlijst-hover in de app; vaste termen + korte uitleg per les.';

comment on table academy.lessons is
  'Les met vaste kolommen (MVP). is_published voor RLS. Kernbegrippen: key_concepts_markdown; interactieve woordenlijst blijft in de app (glossaryTerms).';
