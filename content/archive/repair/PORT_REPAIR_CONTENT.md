# PORT_REPAIR_CONTENT.md

> **Status:** samengevoegd in [`PORT_MODULES.md`](PORT_MODULES.md) (premium repair juni 2026).  
> **Merge:** `python3 scripts/apply_port_premium_repair.py`

## Wat is gewijzigd

- Theorie: doorlopende proza-alinea’s (~700–1500 tekens per les; gemiddeld ~1077)
- Praktijk: concrete opdrachten met checklist en reflectievraag
- Kernbegrippen: Nederlandse termen die in de theorie voorkomen (bold in UI)
- App-koppelingen: Advies (pairing), Drank/voorraad, biodynamische kalender (Vruchtdag bij Vintage Port)
- LES 33–36: Food pairing + Pro insight (in theorie via import)
- LES 15 mini-toets + LES 40 theorie-examen: geen MC-quiz (feedback only / open examen)
- Dubbele slugs (bijv. `druiven-van-port` in productie én oorsprong): verschillende invalshoek per module

## Opnieuw draaien

```bash
python3 scripts/apply_port_premium_repair.py
python3 scripts/align_port_key_concepts.py --check
```

Repair-data: `scripts/port_repair_m1_3.py` … `port_repair_m10.py` (40 lessen, keys 1–40).

Seed: `supabase/seed/academy_port.sql` (via rebuild in apply-script).

## Bestaande Supabase-database

Seed begint met `delete from academy.tracks where slug = 'port'` — volledige seed opnieuw laden wist Port-voortgang (CASCADE). Voor productie zonder wipe: aparte content-migratie nodig.
