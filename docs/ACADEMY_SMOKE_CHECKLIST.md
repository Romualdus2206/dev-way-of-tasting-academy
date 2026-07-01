# Academy smoke-checklist

**Doel:** valideren dat content (Supabase) en UI (kelder `/academy`) na een release correct werken.

**Productie-URL:** [way-of-tasting.netlify.app](https://way-of-tasting.netlify.app)  
**Database:** Supabase `migoblpyknayqfljihoa`, schema `academy`  
**Standalone Academy-repo:** redirect-only → zelfde host `/academy`

Laatste content-release: Academy **v0.1.6** · Kelder **v0.5.4**

---

## 1. Globale smoke-test (~15 min)

**Vooraf:** inloggen met een testaccount.

### Navigatie & integratie

- [ ] `/drank` — voorraad laadt
- [ ] `/academy` — track-overzicht met 10 chips
- [ ] `/advies` — kalender + dashboard
- [ ] `/profiel` — Academy-voortgang zichtbaar (kan leeg zijn na seed-reset)
- [ ] Oude standalone Academy-URL → 301 naar `/academy` op kelder-host

### Auth & data

- [ ] Inloggen werkt (zelfde account als kelder)
- [ ] Geen `permission denied for schema academy`
- [ ] Voortgang opslaan: les openen → theorie gelezen → pill/stap verandert

### Les-pagina (één willekeurige les)

- [ ] Theorie rendert (koppen, lijsten)
- [ ] **Kernbegrippen** vet gemarkeerd in tekst
- [ ] Wist-je-dat + samenvatting zichtbaar
- [ ] Praktijk-checklist werkt (aanvinken + opslaan)

### Quiz (één willekeurige les met quiz)

- [ ] Precies **4 antwoordopties**
- [ ] Fout antwoord → feedbacktekst (niet leeg)
- [ ] Goed antwoord → les als voltooid

---

## 2. Per track — content-validatie

Per track: open track → controleer **lesaantal** → steekproef **eerste + laatste les** + **één quiz**.

| Track | Slug | Lessen | Steekproef-lessen | Extra check (QA-repair) |
|-------|------|--------|-------------------|-------------------------|
| Wine Foundation | `wine-foundation` | **40** | LES 1, LES 21, LES 40 | LES 21: `grassig` / Pinot Grigio-checklist |
| Red Wine | `red-wine` | **40** | LES 1, LES 20, examen-les | — |
| White Wine | `white-wine` | **40** | LES 1, LES 39, examen | Chardonnay/Chenin-vergelijking |
| Rosé | `rose-wine` | **43** | LES 41, 42, 43 | Geen dubbele nummering in curriculum |
| Mousserend | `sparkling` | **40** | LES 1, willekeurige quiz | Quiz met 4 opties |
| Bier | `beer` | **40** | LES 1, examen | — |
| Bier 0.0 | `beer-zero` | **45** | LES 1, LES 45 | LES 1: EU-regelgeving |
| Port | `port` | **45** | LES 1, LES 41–45 | 9 modules; samenvatting/wist-je-dat/praktijk op eindlessen |
| Cocktails | `cocktails` | **41** | LES 38 (Aperol Spritz), module 8–9 | 9 modules zichtbaar |
| Bio | `biodynamic` | **45** | LES 1, LES 34–45, LES 44 | Kernbegrippen NL; quiz-feedback niet te stellig |

### Snelle DB-controle (Supabase SQL Editor)

```sql
-- Lessen per track
select t.slug, count(l.id) as lessons
from academy.tracks t
join academy.modules m on m.track_id = t.id
join academy.lessons l on l.module_id = m.id
group by t.slug
order by t.slug;

-- Quiz met ≠4 opties (moet 0 rijen zijn)
select t.slug, l.slug, qq.sort_order, jsonb_array_length(qq.options) as opts
from academy.quiz_questions qq
join academy.lessons l on l.id = qq.lesson_id
join academy.modules m on m.id = l.module_id
join academy.tracks t on t.id = m.track_id
where jsonb_array_length(qq.options) <> 4;
```

Verwachte lesaantallen: wine/red/white/sparkling/beer **40** · rose **43** · beer-zero/port/bio **45** · cocktails **41**.

---

## 3. Rosé deep-dive (QA P0)

- [ ] Curriculum toont **43 lessen** (niet 40)
- [ ] Module 9 “Blindproeven & Examen”: LES 41 Provence vs Tavel
- [ ] LES 42 rosé vs lichte rode wijn
- [ ] LES 43 integratie-examen (open structuur, geen MC-quiz)
- [ ] Geen dubbele `sort_order` in module-overzicht

---

## 4. Port deep-dive (QA P0/P1)

- [ ] **9 modules** in curriculum (Fundament → Integratie & Mastery)
- [ ] LES 41–45 hebben samenvatting + wist-je-dat + praktijk
- [ ] Quiz LES `klimaat-en-terroir`: optie met `kilo's` werkt (geen lege quiz)
- [ ] Module-slugs kloppen (`intro-port`, `productie-port`, … `examen-port`)

---

## 5. Advies → Academy deeplink (kelder)

- [ ] `/advies` → cocktail van vandaag → **Quick Learn**
- [ ] Quick Learn → knop naar Academy-les
- [ ] Deeplink `/academy/cocktails/module/cock-module-08/lesson/cock-037` resolveert naar echte UUID
- [ ] Geen “lesson not found” na redirect

---

## 6. Na seed-deploy — verwacht gedrag

| Item | Verwachting |
|------|-------------|
| Voortgang per track | Gereset (seed doet `delete from academy.tracks where slug = '…'`) |
| Lessentekst & quiz | Direct live via Supabase — geen aparte app-deploy nodig |
| Quiz-feedback in UI | Vereist kelder-deploy met actuele `quizFeedback.ts` |
| iPhone-app (TestFlight) | Geen Academy-tab; Academy zit in webversie |

---

## 7. Deploy-volgorde (referentie)

1. Academy-repo: rebuild seeds → `supabase db query --linked -f supabase/seed/academy_*.sql`
2. Academy-repo: migraties indien nieuw
3. Kelder-repo: sync `quizFeedback.ts` vanuit Academy → patch bump → push (Netlify)
4. Deze checklist doorlopen op productie

Zie ook [`SUPABASE.md`](SUPABASE.md) en [`INTEGRATIE.md`](INTEGRATIE.md).
