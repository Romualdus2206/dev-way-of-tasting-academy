# Biodynamisch Proeven Academy — curriculumoverzicht

**Doel:** leren hoe biodynamische ritmes, dagtypen, weersomstandigheden en atmosferische invloeden de proefervaring, fleskeuze en het optimale drinkmoment kunnen beïnvloeden.

**Totaal:** 1 track (`biodynamic`) · 9 modules · 45 lessen

**Bronnen:**
- [`content/BIO_MODULES.md`](BIO_MODULES.md) — bron-markdown
- [`supabase/seed/academy_biodynamic.sql`](../supabase/seed/academy_biodynamic.sql) — lessen en quiz
- [`web/src/lib/quizFeedback.ts`](../web/src/lib/quizFeedback.ts) — quiz-feedback
- [`docs/gaps/BIO_GAPS.md`](../docs/gaps/BIO_GAPS.md) — content-audit

**Tooling:**
```bash
python3 scripts/merge_academy_add.py --track bio --rebuild --audit   # ADD-reparaties
python3 scripts/rebuild_bio_track.py                                 # seed + feedback
python3 scripts/audit_academy_gaps.py                                # gap-rapport
supabase db query --linked -f supabase/seed/academy_biodynamic.sql   # deploy
```

**Contentstatus (2026-06-28):** quiz 41/45 · feedback 41/45 · kernbegrippen 100% · praktijk 100%.  
Lessen zonder MC-quiz (bewust): 42–45 (open praktijkexamen). Reparaties: [`ADD_BIO_MODULES.md`](ADD_BIO_MODULES.md) (gemerged).

---

# Inhoudsopgave

## Module 1 — Fundament (Explorer)

1. Wat is biodynamisch proeven?
2. Maria Thun en de oorsprong
3. De vier dagtypen
4. Aarde, water, lucht en vuur
5. Waarom gebruiken sommeliers en wijnmakers dit?

---

## Module 2 — De kalender begrijpen (Explorer)

6. Worteldagen uitgelegd
7. Bladdagen uitgelegd
8. Bloemdagen uitgelegd
9. Vruchtdagen uitgelegd
10. Hoe lees je de biodynamische kalender?

---

## Module 3 — Proeven per dagtype (Explorer)

11. Wijn op een Worteldag
12. Wijn op een Bladdag
13. Wijn op een Bloemdag
14. Wijn op een Vruchtdag
15. Eerste proefexperiment

---

## Module 4 — Weer & atmosfeer (Specialist)

16. Temperatuur en smaakbeleving
17. Luchtdruk en expressie
18. Luchtvochtigheid en perceptie
19. Weersomslag en proefmomenten
20. Dynamic vs Strategic Advice

---

## Module 5 — Wijnstijlen & dagtypes (Specialist)

21. Rode wijn per dagtype
22. Witte wijn per dagtype
23. Rosé per dagtype
24. Mousserende wijn per dagtype
25. Port per dagtype

---

## Module 6 — Bier, cocktails & 0.0 (Specialist)

26. Bier en biodynamische dagen
27. Bier 0.0 en timing
28. Cocktails en dagtypes
29. Barrel-aged dranken
30. Alcoholvrij en proefmomenten

---

## Module 7 — Voorraad & drinkstrategie (Master)

31. De juiste fles op het juiste moment
32. Wanneer openen en wanneer wachten?
33. Drinkvensters en dagtypes
34. Slim voorraadbeheer met kalender
35. Strategic opening planning

---

## Module 8 — Persoonlijke tasting intelligence (Master)

36. Tasting journal gebruiken
37. Patronen herkennen
38. Je eigen smaakprofiel bouwen
39. Data en persoonlijke voorkeuren
40. Jouw persoonlijke drinkintelligentie

---

## Module 9 — Praktijkexamen (Master)

41. Theorie-examen Biodynamisch Proeven
42. Praktijkproef op Worteldag
43. Praktijkproef op Vruchtdag
44. Vergelijking en analyse
45. Eindassessment Biodynamic Intelligence

---

# Niveau-opbouw

## Explorer

De gebruiker begrijpt de basisprincipes van biodynamisch proeven, de kalender en de vier dagtypen.

---

## Specialist

De gebruiker kan biodynamische ritmes, weersinvloeden en drankstijlen praktisch combineren.

---

## Master

De gebruiker kan strategisch plannen, voorraad slim beheren en persoonlijke tasting data analyseren voor optimale drinkmomenten.

---

# Integratie met Way of Tasting

Deze track koppelt direct aan:

- Biodynamic Calendar
- Daily Advice Engine
- Weather & Pressure Logic
- Cellar Matching
- Tasting Journal
- Pairing Intelligence
- Academy Gamification

---

# Doel van deze track

De gebruiker leert niet alleen:

**wat hij drinkt**

maar vooral:

**wanneer hij het optimaal drinkt**

En uiteindelijk:

**waarom dat moment ertoe doet**