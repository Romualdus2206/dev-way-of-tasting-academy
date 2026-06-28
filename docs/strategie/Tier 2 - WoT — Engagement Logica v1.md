# Way of Tasting — Engagement Logica v1

## Status

Referentiedocument (Tier-2)

Versie: 1.0
Eigenaar: L’hiver
Platform: Way of Tasting Academy

---

# Doel

Dit document bepaalt alle activatie-, belonings- en gedragslogica binnen Way of Tasting Academy.

Waar de Beloningscatalogus bepaalt **wat** er bestaat, bepaalt dit document **wanneer** iets gebeurt.

Dit document is leidend voor:

* backend logica
* Supabase triggers
* reward engine
* progress engine
* streak engine
* XP engine

Geen beloningsactie mag buiten deze logica plaatsvinden.

---

# Hoofdprincipe

Elke actie moet één van deze vijf dingen doen:

1. voortgang verhogen
2. XP toekennen
3. streak onderhouden
4. collectie uitbreiden
5. beloning controleren

Elke gebruikersactie wordt dus onderdeel van de engagement-loop.

---

# Event Engine

Way of Tasting werkt op events.

Hoofdevents:

LESSON_STARTED
LESSON_COMPLETED
QUIZ_STARTED
QUIZ_COMPLETED
QUIZ_PASSED
QUIZ_PERFECT
MODULE_COMPLETED
TRACK_COMPLETED
EXAM_STARTED
EXAM_COMPLETED
EXAM_PASSED
DAILY_QUEST_COMPLETED
COLLECTION_COMPLETED
STREAK_UPDATED
LEVEL_UP

Deze events zijn de basis van alle logica.

---

# Leslogica

---

## Event: LESSON_STARTED

Trigger:

Gebruiker opent les.

Acties:

* status = in_progress
* last_active_at updaten

Geen XP.

Geen rewards.

Doel:

engagement starten.

---

## Event: LESSON_COMPLETED

Trigger:

Gebruiker markeert les als voltooid.

Voorwaarden:

* status was niet completed

Acties:

* status = completed
* +10 XP
* streak controleren
* collectie controleren
* module-progress herberekenen
* track-progress herberekenen
* badges controleren

Belangrijk:

Les XP slechts 1x.

---

# Quizlogica

---

## Event: QUIZ_STARTED

Trigger:

Gebruiker start quiz.

Acties:

* quiz attempt registreren

Geen XP.

---

## Event: QUIZ_COMPLETED

Trigger:

Quiz afgerond.

Acties:

* score opslaan
* poging registreren

Nog geen XP.

---

## Event: QUIZ_PASSED

Trigger:

Score >= minimum threshold.

Acties:

* +20 XP
* mastery badges controleren

Max 1x per les.

---

## Event: QUIZ_PERFECT

Trigger:

Score = 100%
EN attempt_number = 1

Acties:

* +15 bonus XP
* perfect badge controleren

Belangrijk:

Alleen eerste poging telt.

---

# Praktijkopdrachtlogica

---

## Event: PRACTICE_COMPLETED

Trigger:

Praktijkopdracht afgerond.

Acties:

* +25 XP
* praktijk badge controleren

Max 1x per opdracht.

---

# Examenlogica

---

## Event: EXAM_STARTED

Trigger:

Examen geopend.

Acties:

* exam attempt aanmaken

---

## Event: EXAM_COMPLETED

Trigger:

Examen afgerond.

Acties:

* resultaat opslaan

Nog geen XP.

---

## Event: EXAM_PASSED

Trigger:

Examen succesvol.

Acties:

* +100 XP
* exam badges controleren
* mastery level verhogen

Max 1x per examen.

---

# Modulelogica

---

## Event: MODULE_COMPLETED

Trigger:

Alle lessen completed.

Acties:

* module status = completed
* module badge controleren
* * bonus XP (optioneel later)

Belangrijk:

Alleen complete modules tellen.

---

# Tracklogica

---

## Event: TRACK_COMPLETED

Trigger:

Alle modules completed.

Acties:

* track status = completed
* track badge ontgrendelen
* trophy controleren
* collectie controleren
* * track completion bonus

Track bonus:

250 XP

---

# Collectielogica

Collecties zijn gekoppeld aan lessen.

---

## Event: COLLECTION_ITEM_UNLOCKED

Trigger:

Specifieke les voltooid.

Voorbeeld:

Les Ruby Port afgerond

Acties:

* Ruby toegevoegd aan Port collection

Belangrijk:

Geen duplicaten.

---

## Event: COLLECTION_COMPLETED

Trigger:

Alle items verzameld.

Acties:

* collectie badge ontgrendelen
* bonus XP

Collection bonus:

75 XP

---

# Streaklogica

---

## Dagdefinitie

Streak werkt per kalenderdag.

Minimaal:

1 completed lesson per dag.

---

## Event: STREAK_UPDATED

Trigger:

Eerste completed lesson van de dag.

Acties:

* streak +1

---

## Streak milestones

Dag 3:

+15 XP

Dag 7:

Badge unlock

Dag 14:

+100 XP

Dag 30:

Golden Flame unlock

Dag 100:

Cellar Legend unlock

---

## Streak reset

Trigger:

Geen lesson completion op kalenderdag.

Acties:

* streak = 0

Belangrijk:

Quiz alleen telt niet.

Alleen lessons.

---

# Leveling logica

---

## Event: XP_CHANGED

Trigger:

Elke XP-mutatie.

Acties:

* total_xp herberekenen
* level herberekenen

---

## Event: LEVEL_UP

Trigger:

Nieuw level bereikt.

Acties:

* level reward controleren
* cosmetic reward controleren
* celebratie tonen

---

# Daily Quest logica

---

## Quest generatie

Elke dag om 00:00.

Genereer:

3 quests

Types:

* lesson completion
* quiz perfection
* pairing challenge
* tasting challenge

---

## Event: DAILY_QUEST_COMPLETED

Trigger:

Alle quests voltooid.

Acties:

* +40 XP
* reward drop triggeren

---

# Reward Drop logica

Random reward systeem.

---

## Trigger momenten

Na:

* daily quest completion
* exam pass
* 7-day streak
* track completion

---

## Drop rates

Common = 70%

Rare = 20%

Epic = 8%

Legendary = 2%

---

# Trophy logica

---

## FIRST_TRACK_COMPLETE

Trigger:

1 completed track

---

## FIVE_TRACKS_COMPLETE

Trigger:

5 completed tracks

---

## TEN_TRACKS_COMPLETE

Trigger:

10 completed tracks

---

## ALL_TRACKS_COMPLETE

Trigger:

Alle beschikbare tracks completed

---

# Prioriteitsregels

Volgorde van afhandeling:

1. Lesson completion
2. XP mutation
3. Streak update
4. Collection update
5. Badge check
6. Level check
7. Trophy check
8. Reward drop check

Deze volgorde is verplicht.

---

# Anti-abuse regels

Voorkom exploitatie:

* XP per lesson max 1x
* quiz XP max 1x
* exam XP max 1x
* collection unlock max 1x
* badge unlock max 1x
* streak update max 1x per dag

No duplicates.

No farming.

---

# Niet toegestaan

Niet belonen voor:

* alleen openen van lessen
* quiz opnieuw spelen
* scrollen zonder completion
* refreshen
* pagina verlaten

Beloning vereist echte progress.

---

# Kernprincipe

Way of Tasting beloont:

leren
begrijpen
volhouden
verzamelen
terugkomen

Nooit:

klikken zonder waarde
