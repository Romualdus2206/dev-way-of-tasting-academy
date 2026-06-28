# Vastgelegd besluit — Way of tasting Academy

**Datum:** juni 2026  
**Status:** goedgekeurd voor start  
**Ontwikkelmap:** `~/Development/dev-way-of-tasting-academy`  
**Productnaam:** **Way of tasting Academy** (sommelier-opleiding)  
**Productvisie:** [`PRODUCTVISIE.md`](PRODUCTVISIE.md)

---

## 1. Scope

| Wel | Niet (v1) |
|-----|-----------|
| Web-SPA: cursussen, modules, lessen | Native app (Expo) — web-first |
| Quiz / meerkeuze + uitleg | AI-beoordeling vrije tekst |
| Voortgang per gebruiker | Certificaten / betaald LMS |
| **Zelfde Supabase + login** als kelder-app | Aparte auth-provider of tweede user-tabel |
| Later: koppeling “oefen met fles uit kelder” | Nu al volledige kelder-UI in deze app |

---

## 2. Gekozen scenario: gedeeld Supabase-project

| Onderdeel | Technologie | Waarom |
|-----------|-------------|--------|
| **Frontend** | Vite + React + TypeScript | Zelfde patroon als `dev-way-of-wine-exploring-app/web/` |
| **Backend** | **Supabase** (zelfde project als kelder) | Eén login, RLS, geen tweede backend |
| **Datamodel** | Postgres schema **`academy`** | Scheiding van `public.bottles` zonder tweede database |
| **Gedeeld package** | `packages/academy-shared/` | Types + quiz-logica; geen kelder-code kopiëren |
| **Hosting** | **Netlify** (eigen site) | Los deployen van kelder-web |
| **Content** | DB + `content/` (Markdown/JSON) | Cursus beheren via importscript of SQL seed |

**Niet gekozen:** apart Supabase-project (zou dubbele auth vereisen), WordPress/LMS, eigen Express-server.

Zie [`INTEGRATIE.md`](INTEGRATIE.md) voor het formele contract.

---

## 3. MVP-volgorde

1. Documentatie + migratie `academy` schema op bestaand Supabase-project
2. Vite-skeleton: login, cursusoverzicht, lesdetail, eenvoudige quiz
3. Seed: één demo-cursus (“Wijn basis” of “Sommelier start”)
4. Voortgang opslaan (`user_lesson_progress`)
5. Netlify-deploy (aparte URL)
6. **Later:** tab/deeplink in kelder-app · koppeling les ↔ fles uit voorraad

---

## 4. Relatie kelder-app

| Overnemen (patronen) | Niet kopiëren |
|----------------------|---------------|
| Theme-kleuren (burgundy/goud) | `bottles`, scan, barcode |
| Supabase client-setup | `@way-of-tasting/shared` als dependency (fase 2) |
| Release-protocol (versie, geen push zonder opdracht) | Edge Functions van kelder-app |

Fase 2 integratie: optioneel types delen via npm workspace link of gepubliceerd `@way-of-tasting/shared` — niet vereist voor MVP.

---

## 5. Versie

Bron: [`version.json`](../version.json) · start **0.1.0** (academy los van kelder `0.4.x`).
