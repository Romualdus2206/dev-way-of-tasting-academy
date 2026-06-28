# Datamodel ontwerp V1 — Way of tasting Academy

**Status:** concept goedgekeurd → **fysiek model beschikbaar**  
**Scope:** MVP alleen  
**Schema:** Postgres `academy` op gedeeld Supabase-project  

| Document | Inhoud |
|----------|--------|
| **Dit bestand** | Concept, keuzes, beperkingen, integratie |
| [`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md) | **Physical model** — alle attributen, constraints, RLS; basis voor SQL |

**Nog geen SQL** tot expliciete opdracht om migratie te schrijven.

---

## Ontwerpkeuzes (samenvatting)

| Keuze | Besluit | Reden |
|-------|---------|-------|
| Hiërarchie | **Track → Module → Les** | Specialisatie Port; geen aparte “Academy”-tabel |
| Terminologie | **`track` is definitief** | Geen `courses`; legacy-tabel verdwijnt bij migratie |
| Niveaus | `level` op **module** | MVP-eenvoud; zie beperking §2 |
| Profiel | **`user_profiles`** (minimaal) | Auth niet dupliceren; wel naam, taal, notificaties, voorkeuren |
| Lesinhoud | Vaste kolommen | Goed voor MVP-UI; AI-flexibiliteit later (§3) |
| Publicatie | `published_at` op **track** | Hele Port-track aan/uit |
| Voortgang | `user_lesson_progress` + `user_quiz_attempts` | Status vs. quiz-historie |
| Kelder | `context_bottle_id` zonder FK | [`INTEGRATIE.md`](INTEGRATIE.md) |
| Buiten MVP | Badges, AP, certificaten, portfolio, AI | Additief later |

---

## 1. Diagrammen

Het eerste ontwerp was een **concept map** (relaties zonder volledige attributen). Dat is voor de ideeënfase voldoende maar **niet** direct SQL-genereerbaar.

**Physical model V1** (volledig ERD + kolomspecificaties): [`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md)

Kernstructuur:

```
auth.users (Supabase, extern)
    │
    ├── user_profiles (1:1)
    ├── user_lesson_progress ──► lessons ──► modules ──► tracks
    └── user_quiz_attempts ────► lessons ──► quiz_questions
```

**7 tabellen** in `academy` (was 6; `user_profiles` toegevoegd op feedback).

---

## 2. Level op module — bewuste beperking

`level` (`explorer` · `specialist` · `master`) staat op **module**, niet op een aparte laag.

| Voordeel (MVP) | Nadeel (later) |
|----------------|----------------|
| Eenvoudig model en queries | Module **niet herbruikbaar** over niveaus |
| Duidelijke Port-structuur per niveau | Zelfde inhoud op Explorer én Specialist = dubbele module |

**Acceptabel voor MVP.** Als hergebruik nodig wordt: later `learning_paths(track_id, level)` tussen track en module, of content-templates — zonder bestaande `lesson_id`-voortgang te breken.

---

## 3. Lesinhoud in kolommen — tradeoff

| | Vaste kolommen (V1) | JSON-blob / varianten |
|--|---------------------|------------------------|
| MVP UI & seed | ✓ eenvoudig | ✗ complexer |
| AI-gegenereerde varianten | ✗ minder flexibel | ✓ flexibel |
| Type safety in app | ✓ | ✗ |

**Besluit:** vaste kolommen voor V1. Uitweg later: nullable `content_variants jsonb` of `lesson_content_versions` — additief, geen breuk.

---

## 4. `user_profiles` — waarom nu al minimaal

Supabase `auth.users` blijft leidend voor login. Academy breidt uit met **één rij per user**:

| Kolom | Toekomstig gebruik |
|-------|-------------------|
| `display_name` | Naam in UI |
| `locale` | Taal |
| `notifications_enabled` | Notificaties |
| `preferences` (jsonb) | Overige voorkeuren, optioneel `experience_level` |

**Certificeringsniveau** (behaald Explorer/Specialist/Master) komt uit voortgang/certificaten — niet in profiel dupliceren.

Details: [`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md) § `user_profiles`.

---

## 5. Supabase (samenvatting)

Zie fysiek model voor indexes en RLS per tabel.

- Schema **`academy`**, RLS overal
- Curriculum: read-only voor `authenticated` + gepubliceerde track
- `user_profiles`, voortgang, quiz: alleen `auth.uid() = user_id`
- Curriculum schrijven: service role / seed

---

## 6. Migratie — definitief `track`, geen conceptuele drift

**Besluit:** `track` is de enige term. `academy.courses` (eerste migratie) is **legacy**.

| Regel | |
|-------|---|
| Geen nieuwe content onder `courses` | Alles onder `tracks` |
| Eén migratiestap | `tracks` aanmaken, data eventueel migreren, `courses` droppen |
| Geen parallelle concepten | Code, seed, docs: overal `track` |

Details en volgorde: [`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md) § “Migratie van legacy courses”.

### Toekomstige features (additief)

| Feature | Aanpak |
|---------|--------|
| Certificaten | `certificates`, `user_certificates` |
| Badges | `badges`, `user_badges` |
| Academy Points | `user_point_ledger` (append-only) |
| Portfolio | `user_portfolio_items` |
| AI-feedback | `ai_feedback_sessions` |
| AI-content varianten | `content_variants` of versioning-tabel op `lessons` |

---

## 7. Integratie — L'hiver / Way of tasting

- **Auth:** gedeeld `auth.users`; profiel in `academy.user_profiles`
- **Kelder:** `context_bottle_id` zonder FK; deep links later
- **L'hiver-breed profiel:** optioneel later in apart schema; Academy blijft master van `academy.*`

Zie [`INTEGRATIE.md`](INTEGRATIE.md) en §5 in eerdere versie (ongewijzigd qua principes).

---

## 8. MVP Port — voorbeeld

```
track: port (published_at gezet wanneer klaar)
  ├── [explorer] intro-port → lessons + quiz
  ├── [explorer] ruby-port
  ├── [specialist] tawny-vs-ruby
  └── [master] port-adviseren
```

---

## 9. Volgende stap

1. ~~Physical model V1~~ → [`DATAMODEL_V1_FYSIEK.md`](DATAMODEL_V1_FYSIEK.md) ✓  
2. SQL-migratie schrijven  
3. `DATAMODEL.md` + Port-seed bijwerken  
4. Types `academy-shared` + UI  

---

## Wijzigingslog

| Datum | Wijziging |
|-------|-----------|
| 2026-06-25 | Feedback verwerkt: profiles, physical model, track definitief, beperkingen gedocumenteerd |
| 2026-06-25 | Eerste concept V1 |
