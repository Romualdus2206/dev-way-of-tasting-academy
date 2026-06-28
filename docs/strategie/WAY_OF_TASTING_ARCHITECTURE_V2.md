# WAY_OF_TASTING_ARCHITECTURE_V2.md

# Way of Tasting — Productarchitectuur v2

## Status
Definitieve functionele hoofdstructuur (juni 2026)

---

# Visie

Way of Tasting ontwikkelt zich niet als een losse dranken-app, maar als een geïntegreerd intelligent ecosysteem waarin voorraadbeheer, timing, pairing, educatie, proeverijen, community en AI samenkomen.

De kernfilosofie:

**Weten wat je hebt → weten wanneer → weten waarom → weten waarmee → samen beleven**

Dit document legt de definitieve productarchitectuur vast.

---

# Hoofdstructuur (Bottom Navigation)

## 1. 🍷 Drank
**Asset Engine**

Doel:
alles rondom bezit, aankoopintentie, voorraadbeheer en individuele evaluatie.

### Onderdelen:

### Voorraad
- wijn
- mousserend
- bier
- bier 0.0
- port
- cocktailingrediënten

Doel:
zicht op actuele collectie.

---

### Wensenlijst
Doel:
producten bewaren voor toekomstige aankoop.

Toekomst:
- prijsalerts
- beschikbaarheid
- favorieten

---

### Boodschappenlijst
Doel:
drank en pairing-items verzamelen voor aankopen.

Gebruik:
- diners
- proeverijen
- evenementen
- cocktails

---

### Beoordelingen
Doel:
persoonlijke tasting notes en smaakontwikkeling.

Data:
- score
- notities
- herkoopintentie
- favorieten
- persoonlijke smaakprofielen

---

### Scan
Functie:
inputmechanisme voor snelle toevoeging.

Gebruik:
- toevoegen aan voorraad
- toevoegen aan wensenlijst
- toevoegen aan boodschappenlijst
- directe herkenning

Belangrijk:
Scan is geen hoofdonderdeel, maar onderdeel van Drank.

---

---

## 2. 🌙 Moment
**Timing Intelligence Engine**

Doel:
bepalen wanneer een drank optimaal is.

Input:
- biodynamische kalender
- maanritme
- weersomstandigheden
- luchtdruk
- luchtvochtigheid
- temperatuur

Output:
- optimale drinkmomenten
- openadvies
- serveeradvies
- decanteeradvies
- beste keuze uit voorraad

Belangrijk:
“Moment” is de live intelligence layer.

---

---

## 3. 🍽 Pairing
**Context Engine**

Doel:
bepalen waarmee een drank optimaal gecombineerd wordt.

Scope:
- wijn & food
- bier & food
- port & food
- mousserend & food
- cocktails & bites

Toekomst:
- AI pairing suggesties
- persoonlijke voorkeurspatronen
- groepspairings

---

---

## 4. 🍷 Proeverij
**Event Engine**

Doel:
proeverijen organiseren, begeleiden en analyseren.

### Onderdelen:

### Organiseren
- thema kiezen
- deelnemers uitnodigen
- flessen selecteren
- volgorde bepalen
- blind tasting instellen

---

### Live begeleiding
- proefvolgorde
- serveertemperatuur
- glasadvies
- decanteermoment
- biodynamische context

---

### Beoordelen
- individuele scores
- groepsscores
- vergelijking per deelnemer

---

### Historie
- vorige proeverijen
- deelnemers
- resultaten
- favoriete flessen

---

### AI Sommelier
- analyse groepsvoorkeuren
- verschillen in smaakprofiel
- aanbevelingen volgende sessies

Belangrijk:
Proeverij is een zelfstandige event-engine.

---

---

## 5. 🎓 Academy
**Knowledge Engine**

Doel:
educatie, certificering en verdieping.

Structuur:

Track → Module → Les

### Huidige tracks:
- Wijn Fundamentals
- Rode wijn
- Witte wijn
- Rosé
- Mousserend
- Bier
- Bier 0.0
- Port
- Cocktails

---

### Biodynamiek Academy
Belangrijk:
de biodynamische opleiding is geen vervanging van de Moment-engine.

Rol:
uitleggen waarom de Moment-engine bepaalde adviezen geeft.

Dus:

Moment = toepassen  
Academy = begrijpen

---

### Toekomst:
- blind tasting mastery
- service mastery
- kelderbeheer
- advanced pairing
- masterclasses

---

---

## 6. 👥 Community
**Social Engine**

Doel:
ervaringen, ideeën en kennis delen.

Structuur:

Gebruikers kunnen lid zijn van meerdere groepen.

Voorbeelden:
- familie
- wijnvrienden
- biergroep
- cocktailgroep

---

### Functionaliteiten:
- groepsfeed
- gedeelde proefnotities
- gezamenlijke proeverijen
- challenges
- gedeelde boodschappenlijsten
- groepspairings

---

### Virtuele vriend (AI)
Rol:
digitale groepssommelier.

Taken:
- samenvatten groepsvoorkeuren
- voorstellen nieuwe proeverijen
- analyseren smaakverschillen
- pairing suggesties geven

Belangrijk:
AI is ondersteunend, niet dominant.

---

# Profiel (Topbar)

Profiel wordt géén onderdeel van de bottom navigation.

Reden:
profiel is ondersteunend en geen primaire actie.

Plaatsing:
topbar rechts (avatar).

Inhoud:

- profiel
- certificaten
- XP
- levels
- achievements
- smaak-DNA
- favorieten
- instellingen
- groepen
- abonnement
- sync/backup

---

# Productlogica

## Functionele keten

Drank = wat heb ik  
Moment = wanneer drink ik  
Pairing = waarmee drink ik  
Academy = waarom kies ik dit  
Proeverij = hoe beleef ik dit  
Community = met wie beleef ik dit

---

# AI-integratie

AI wordt een ondersteunende laag over alle engines:

## Drank
- persoonlijke aanbevelingen

## Moment
- optimale drinkvensters

## Pairing
- contextuele combinaties

## Proeverij
- groepsanalyse

## Academy
- persoonlijke leerbegeleiding

## Community
- virtuele vriend

---

# Strategische positionering

Way of Tasting is geen wijn-app.

Way of Tasting is:

**een intelligent smaak-ecosysteem**

Pijlers:

1. Asset Intelligence
2. Timing Intelligence
3. Context Intelligence
4. Event Intelligence
5. Knowledge Intelligence
6. Social Intelligence
7. Artificial Intelligence

Samen vormen zij het volledige Way of Tasting platform.

---

# Status

Deze architectuur is per juni 2026 vastgesteld als leidend model voor verdere ontwikkeling.