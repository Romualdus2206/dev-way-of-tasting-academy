# Way of Tasting — Gamification System v1

## Status

Reference document (Tier-1)

Version: 1.0
Owner: L’hiver
Platform: Way of Tasting Academy

---

# Doel

Dit document definieert het volledige gamification-systeem van Way of Tasting Academy.

Het doel van dit systeem is:

* leerretentie verhogen
* dagelijkse terugkeer stimuleren
* completion-ratio verhogen
* identiteit opbouwen
* emotionele binding creëren
* progressie zichtbaar maken
* verzamelgedrag activeren

Way of Tasting is niet alleen een educatieplatform.

Way of Tasting is:

**een persoonlijke drankwereld die de gebruiker steeds verder ontgrendelt**

---

# Kernfilosofie

Traditionele educatie:

Learn → Finish → Leave

Way of Tasting:

Learn → Earn → Collect → Unlock → Return

Dit verschil is fundamenteel.

---

# Behavioral Design Framework

Way of Tasting gebruikt zes gedragsprincipes:

---

## 1. Progress

Mensen willen voortgang zien.

Progress moet zichtbaar zijn op:

* lesniveau
* moduleniveau
* trackniveau
* accountniveau

Voorbeelden:

* 4/5 lessen afgerond
* 78% Explorer voltooid
* Nog 1 les tot volgende badge

Regel:

Elke actie moet progress zichtbaar beïnvloeden.

---

## 2. Completion

Mensen willen sets afmaken.

Way of Tasting gebruikt collecties.

Voorbeelden:

Port styles collection
Wine grapes collection
Beer styles collection

Open slots creëren spanning.

---

## 3. Status

Status geeft identiteit.

Gebruiker is niet:

“iemand die leert”

Gebruiker is:

Explorer
Specialist
Master
Grand Taster

Status moet zichtbaar zijn.

---

## 4. Scarcity

Niet alles is direct beschikbaar.

Beloningen moeten unlockable zijn.

Voorbeelden:

Rare badge
Limited frame
Seasonal trophy

Scarcity verhoogt waarde.

---

## 5. Streaks

Consistentie is krachtiger dan volume.

Dagelijks terugkomen is belangrijker dan lange sessies.

Streaks stimuleren consistentie.

---

## 6. Cosmetics

Cosmetics bouwen emotionele waarde.

Net als Rouvy.

Niet functioneel.

Wel psychologisch krachtig.

---

# Core Loop

De kernlus:

Start lesson
Complete lesson
Pass quiz
Earn XP
Maintain streak
Unlock reward
Fill collection
Increase level
Open next lesson
Return tomorrow

Deze lus is het hart van Way of Tasting.

---

# XP System

XP is de basisvaluta.

---

## Lesson XP

Les volledig gelezen:

10 XP

Voorwaarde:

* lesson status = completed

Max 1x per lesson.

---

## Quiz XP

Quiz succesvol afgerond:

20 XP

Voorwaarde:

* minimum pass threshold gehaald

Max 1x per lesson.

---

## Perfect First Attempt Bonus

Quiz 100% correct bij eerste poging:

15 XP

Voorwaarde:

* attempt_number = 1
* score = 100%

---

## Practice Assignment XP

Praktijkopdracht afgerond:

25 XP

Voorwaarde:

* assignment submitted

---

## Exam XP

Examen succesvol afgerond:

100 XP

Voorwaarde:

* exam passed

---

## Daily Quest XP

Volledige daily quest set afgerond:

40 XP

---

## Streak Bonus XP

3 dagen:

15 XP

7 dagen:

50 XP

14 dagen:

100 XP

30 dagen:

250 XP

100 dagen:

1000 XP

---

# Level System

Levels zijn account-wide.

Niet per track.

---

## Level Formula

Level progression is XP-based.

Recommended curve:

Level 1 = 0 XP
Level 2 = 100 XP
Level 3 = 250 XP
Level 4 = 450 XP
Level 5 = 700 XP
Level 10 = 2500 XP
Level 20 = 9000 XP
Level 50 = 50000 XP
Level 100 = 250000 XP

Curve moet exponentieel groeien.

---

## Titles

Level 1 = New Taster
Level 5 = Explorer
Level 10 = Enthusiast
Level 20 = Specialist
Level 35 = Advanced Specialist
Level 50 = Master
Level 75 = Grand Taster
Level 100 = Cellar Master

---

# Track Progression

Elke track heeft eigen voortgang.

Bijvoorbeeld:

Port = 32 lessons
Beer = 40 lessons
Wine Fundamentals = 40 lessons

Track progress:

completed_lessons / total_lessons

---

# Badge System

Badges zijn prestatiebeloningen.

Badges zijn permanent.

---

## Badge Types

### Completion badges

Voor afronden.

Voorbeeld:

Port Pioneer

---

### Skill badges

Voor inhoudelijke mastery.

Voorbeeld:

Fortification Specialist

---

### Speed badges

Voor efficiënt leren.

Voorbeeld:

Perfect 5

---

### Streak badges

Voor consistentie.

Voorbeeld:

7 Day Flame

---

### Collection badges

Voor complete verzamelingen.

Voorbeeld:

Ruby Collector

---

# Badge Rarity

Badges hebben rarity.

Common
Rare
Epic
Legendary

Rarity beïnvloedt presentatie.

Niet functionaliteit.

---

# Collections System

Collections zijn essentieel.

Elke track heeft collecties.

---

## Port collections

Styles:

Ruby
Tawny
LBV
Vintage
White Port
Colheita
Crusted

---

## Wine collections

Grapes:

Cabernet Sauvignon
Merlot
Pinot Noir
Syrah
Nebbiolo
Chardonnay
Riesling

---

## Beer collections

Styles:

Pilsner
IPA
Stout
Porter
Tripel
Saison
Lambic

---

# Collection Rules

Item unlocks when:

* corresponding lesson completed
  OR
* exam validates mastery

Preferred MVP:

lesson completion unlocks

---

# Streak System

Streak = daily learning continuity.

---

## Valid streak action

At least 1 lesson completed in a calendar day.

---

## Streak loss

No lesson completed today.

Reset to 0.

---

## Future feature

Streak freeze.

Not MVP.

---

# Daily Quests

Every day:

3 quests generated.

Examples:

Complete 1 lesson
Score 100% on 1 quiz
Complete 1 pairing challenge

Reward:

40 XP

1 reward drop

---

# Reward Drops

Randomized rewards.

Possible:

XP bonus
Badge
Cosmetic
Collection boost

Probability:

Common 70%
Rare 20%
Epic 8%
Legendary 2%

---

# Cosmetics System

Cosmetics are identity layers.

No functional impact.

---

## Categories

Profile frames
Icons
Themes
Achievement borders

---

## Examples

Frames:

Bronze Cork
Silver Cork
Gold Cork
Ruby Crystal
Cellar Black

Icons:

Wine glass
Golden glass
Rosé glass
Champagne saber
Barrel icon

Themes:

Cellar Dark
Rosé Pink
Champagne Gold
Forest Green

---

# Trophy Room

Personal achievement dashboard.

Contains:

Current level
Total XP
Current streak
Badges
Collections
Track completion
Rare items

This is the emotional center of the system.

---

# UI Placement Rules

---

## Lesson page

Show:

XP reward
Current streak
Next reward

---

## Module page

Show:

Completion %
Badges available

---

## Track page

Show:

Track progress
Track badges
Collections progress

---

## Academy home

Show:

Total XP
Current level
Current streak

---

## Profile page

Show:

Trophy room

---

# Database Model

Required tables:

academy.user_xp
academy.user_levels
academy.user_streaks
academy.badges
academy.user_badges
academy.collections
academy.user_collections
academy.daily_quests
academy.user_daily_quests
academy.cosmetics
academy.user_cosmetics
academy.reward_drops

---

# Priority Roadmap

## Phase 1

Required:

XP
Levels
Streaks
Basic badges

---

## Phase 2

Collections
Trophy room
Daily quests

---

## Phase 3

Cosmetics
Reward drops
Rare badges
Seasonal rewards

---

## Phase 4

Leaderboards
Team tastings
Community challenges
Live events
Partner rewards

---

# Non-Negotiables

Gamification must always:

reward progress
show progress
preserve progress
build identity
create desire to return

Never:

punish experimentation
hide rewards
create randomness without logic

---

# Final Principle

Way of Tasting is not a course.

Way of Tasting is:

a lifelong tasting journey.

Everything in this system must reinforce that.
