-- LES 37 — Aperol Spritz als aperitief (Module 8 Pairing & Gastronomie)
-- Repair voor Advies-tab routing: cock-module-08 / cock-037

insert into academy.lessons (
  module_id,
  slug,
  title,
  learning_objective,
  theory_markdown,
  key_concepts_markdown,
  did_you_know,
  summary_markdown,
  practice_assignment_markdown,
  duration_minutes,
  sort_order,
  is_published
)
select
  m.id,
  'aperol-spritz',
  'Aperol Spritz als aperitief',
  'Na deze les begrijp jij waarom Aperol Spritz één van de belangrijkste moderne aperitiefcocktails is en waarom deze cocktail perfect werkt bij warm weer.',
  'De Aperol Spritz is één van de bekendste aperitiefcocktails ter wereld.

Structuur:

- prosecco
- Aperol
- bruiswater

Klassieke verhouding:

3 - 2 - 1

Dit betekent:

- 3 delen prosecco
- 2 delen Aperol
- 1 deel bruiswater

De cocktail werkt door balans tussen:

- bitterheid
- frisheid
- lichte zoetheid
- carbonatie

Waarom werkt dit goed?

Bitter stimuleert de eetlust.

Carbonatie maakt de cocktail lichter.

Lage alcohol maakt hem toegankelijk.

Bij warm weer voelt dit fris en energiek.

Daarom is Aperol Spritz een schoolvoorbeeld van aperitiefdenken.',
  '- aperol spritz
- aperitif
- bitterness
- carbonation
- prosecco
- warm weather
- summer drinking',
  'De Spritz ontstond in Noord-Italië en groeide uit tot wereldwijd aperitiefsymbool.',
  '- Aperol Spritz is een aperitiefcocktail
- Bitterheid opent de eetlust
- Carbonatie zorgt voor frisheid
- Warm weer versterkt de drinkbaarheid
- Structuur is simpel maar precies',
  '### Opdracht

Maak of observeer een Aperol Spritz.

### Checklist

- Ik herken de 3-2-1 structuur
- Ik proef bitterheid
- Ik proef carbonatie
- Ik begrijp het aperitiefeffect

### Reflectievraag

Waarom werkt bitter beter vóór een maaltijd dan tijdens dessert?',
  8,
  4,
  true
from academy.modules m
join academy.tracks t on t.id = m.track_id
where t.slug = 'cocktails'
  and m.slug = 'pairing-cocktails'
  and not exists (
    select 1
    from academy.lessons l
    where l.module_id = m.id
      and l.slug = 'aperol-spritz'
  );

-- Quizvragen
insert into academy.quiz_questions (lesson_id, sort_order, prompt, options, correct_index, explanation)
select l.id, v.sort_order, v.question, v.options::jsonb, v.correct_index, v.explanation
from academy.lessons l
join academy.modules m on m.id = l.module_id
join academy.tracks t on t.id = m.track_id
cross join (values
  (1, 'Wat is de klassieke verhouding?', '["2-2-2", "3-2-1", "1-3-2", "4-1-1"]', 1, 'Correct: 3-2-1'),
  (2, 'Welke component geeft bitterheid?', '["Aperol", "Prosecco", "Soda", "IJs"]', 0, 'Correct: Aperol'),
  (3, 'Waarom werkt bitter als aperitief?', '["Stimuleert eetlust", "Verhoogt alcohol", "Verlaagt temperatuur", "Verhoogt suiker"]', 0, 'Correct: Stimuleert eetlust'),
  (4, 'Welke component geeft bruis?', '["Prosecco + soda", "Aperol", "Sinaasappel", "IJs"]', 0, 'Correct: Prosecco + soda'),
  (5, 'Wanneer werkt Aperol Spritz vaak het best?', '["Warm weer", "Koude winteravond", "Na dessert", "Bij zware stoofschotel"]', 0, 'Correct: Warm weer')
) as v(sort_order, question, options, correct_index, explanation)
where t.slug = 'cocktails'
  and m.slug = 'pairing-cocktails'
  and l.slug = 'aperol-spritz'
  and not exists (
    select 1
    from academy.quiz_questions q
    where q.lesson_id = l.id
  );
