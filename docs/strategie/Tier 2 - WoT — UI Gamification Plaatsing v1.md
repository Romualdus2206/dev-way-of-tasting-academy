# Way of Tasting — UI Gamification Plaatsing v1

## Status

Referentiedocument (Tier-2)

Versie: 1.0
Eigenaar: L’hiver
Platform: Way of Tasting Academy

---

# Doel

Dit document bepaalt waar alle gamification-elementen visueel worden geplaatst binnen Way of Tasting Academy.

Gamification werkt alleen als het zichtbaar is.

Onzichtbare progress = geen motivatie.

Dit document voorkomt:

* visuele chaos
* inconsistente plaatsing
* dubbele informatie
* overbelasting
* vergeten rewards

Dit document is leidend voor:

* UX design
* frontend development
* mobile UI
* web UI

---

# Hoofdregel

Gamification moet altijd:

zichtbaar
begrijpelijk
licht
motiverend
niet storend

zijn.

Gamification ondersteunt leren.

Gamification mag leren nooit overschreeuwen.

---

# Academy Home

Dit is het hoofddashboard.

Doel:

grote voortgang tonen.

---

## Bovenste header

Altijd tonen:

Level
Totaal XP
Streak

Structuur:

Level 12 — Specialist
1240 XP
🔥 14 dagen

Plaatsing:

direct onder paginatitel

Volgorde is vast.

---

## Opleidingscards

Elke opleiding toont:

* voortgang %
* aantal afgeronde lessen
* aantal badges
* collectievoortgang

Voorbeeld:

Port
22/32 lessen
68% voltooid
🏅 4 badges
🍷 5/7 collecties

---

## Daily Quest widget

Altijd zichtbaar op home.

Plaatsing:

boven opleidingen

Inhoud:

Vandaag:

☐ Rond 1 les af
☐ Scoor 100% op 1 quiz
☐ Voltooi 1 pairing challenge

Reward:

+40 XP

---

## Trophy shortcut

Plaatsing:

rechtsboven of onder header

Label:

Mijn Trophy Room

Altijd zichtbaar.

---

# Opleidingspagina

Voorbeeld:

Port Academy

Doel:

diepteprogress tonen.

---

## Header

Toon:

opleidingstitel
totale opleiding voortgang
volgende badge

Voorbeeld:

Port Academy
68% voltooid
Nog 2 lessen tot PORT_MASTER

---

## Collectieblok

Direct onder header.

Toon:

Styles Collection

☑ Ruby
☑ Tawny
☐ Vintage
☐ LBV
☐ Colheita

Doel:

completion trigger.

Altijd zichtbaar.

---

## Module cards

Elke module toont:

module naam
voortgang
badge-status

Voorbeeld:

Explorer — Fundament
4/5 lessen
🏅 PORT_PIONEER unlocked

---

# Modulepagina

Doel:

microprogress tonen.

---

## Bovenaan

Toon:

module progress bar

Voorbeeld:

Explorer
80% voltooid
████████░░

---

## Module rewards

Toon:

te verdienen badges

Voorbeeld:

Beschikbaar:

🏅 PORT_PIONEER
🏅 FORTIFICATION_SPECIALIST

---

## Lessenlijst

Elke les toont:

status
XP
collection item

Voorbeeld:

☑ Wat is Port?
+10 XP
🍷 Ruby unlocked

Of:

○ Vintage Port
+10 XP

---

# Lespagina

Belangrijkste engagementzone.

---

## Topbar

Altijd tonen:

Current streak
XP reward
Lesson number

Voorbeeld:

🔥 14
+10 XP
Les 18/32

Compact.

Niet dominant.

---

## Mid-lesson

Niet tonen.

Geen gamification in theorie-content.

Rust bewaren.

---

## Onderzijde

Voor quiz:

Toon:

Quiz reward

Voorbeeld:

Voltooi quiz:

+20 XP
+15 XP perfect bonus

---

# Quizpagina

Doel:

prestatie-focus.

---

## Header

Toon:

vraagnummer
score
perfect bonus indicator

Voorbeeld:

Vraag 3/5
Score: 2 goed
Perfect bonus actief

---

## Resultaatscherm

Na quiz:

Toon:

XP verdiend
perfect bonus
badge unlock
nieuwe collectie unlock

Voorbeeld:

+20 XP
+15 Perfect Bonus
🏅 Ruby Master unlocked
🍷 Vintage toegevoegd

Volgorde is vast.

---

# Lesson Completion Modal

Kritische dopamine-moment.

Moet altijd verschijnen.

---

## Structuur

1. Lesson complete
2. XP gained
3. Streak update
4. Collection unlock
5. Badge unlock
6. Next lesson CTA

Voorbeeld:

Les voltooid

+10 XP

🔥 Streak: 15 dagen

🍷 Vintage toegevoegd aan collectie

🏅 TAWNY_EXPERT unlocked

Volgende les →

Volgorde verplicht.

---

# Level Up Modal

Volledige overlay.

Alleen bij level-up.

---

## Structuur

LEVEL UP

Level 13 bereikt

Nieuwe titel:

Advanced Specialist

Beloning:

🎨 Nieuw thema unlocked

Knop:

Ga verder

---

# Track Completion Modal

Hoogste visuele beloning.

Groot moment.

---

## Structuur

Track voltooid

Port Academy afgerond

+250 XP

🏅 PORT_MASTER unlocked

🏆 Bronze Trophy unlocked

Nieuwe track starten →

---

# Trophy Room

Persoonlijk achievement center.

---

## Bovenaan

Toon:

Level
Total XP
Current streak

---

## Badges sectie

Grid view.

Filter:

Common
Rare
Epic
Legendary

---

## Collecties sectie

Per track.

Voorbeeld:

Port Collection
5/7 compleet

---

## Trophies sectie

Chronologische volgorde.

---

## Cosmetics sectie

Unlocked cosmetics.

Altijd zichtbaar.

---

# Streak Warning

Urgency mechaniek.

Toon alleen wanneer:

vandaag nog geen lesson completed.

Plaatsing:

Academy home
Opleidingspagina

Voorbeeld:

Nog 1 les vandaag om je streak te behouden

Niet agressief.

Wel zichtbaar.

---

# Reward Drop Modal

Compact.

Nooit fullscreen.

Voorbeeld:

🎁 Reward Drop

Rare:

Golden Glass unlocked

---

# Animatieregels

Gebruik subtiele animaties voor:

XP gains
Badge unlocks
Collection unlocks
Level up

Geen zware animaties.

Geen vertragingen.

Snappy.

---

# Kleurgebruik

Common:

neutraal

Rare:

blauw

Epic:

paars

Legendary:

goud

Consistent in hele app.

---

# Mobile First regels

Prioriteit op mobiel:

1. Streak
2. XP
3. Progress
4. Next reward

Nooit meer dan 4 gamification-items tegelijk boven de fold.

Rust bewaren.

---

# Verboden UI-fouten

Niet doen:

* badges midden in theorie
* te veel popups
* te veel iconen tegelijk
* progress bars op elke plek
* dubbele XP-weergave
* verborgen rewards
* reward spam

---

# Kernprincipe

De gebruiker moet altijd weten:

waar sta ik
wat verdien ik
wat komt hierna
wat kan ik verzamelen
wat verlies ik als ik stop

Dat is de visuele basis van engagement.
