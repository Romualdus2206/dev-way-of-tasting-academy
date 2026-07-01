# Port Track V2 — leidende versie (locked)

**Truth source:** [`PORT_TRACK_V2_GOLD_MASTER.md`](PORT_TRACK_V2_GOLD_MASTER.md)  
**Pipeline:** Referentiemodel → PERFECT → Gold Master

## Architectuur

| | |
|---|---|
| Track | `port` |
| Modules | 9 |
| Lessen | 45 |
| Explorer | Module 1–3 |
| Specialist | Module 4–6 |
| Master | Module 7–9 |

## Opnieuw genereren

```bash
python3 scripts/build_port_track_v2_final.py         # → Referentiemodel
python3 scripts/polish_port_track_v2_perfect.py      # → PERFECT
python3 scripts/polish_port_track_v2_gold_master.py   # → GOLD_MASTER
python3 scripts/rebuild_port_track.py
python3 scripts/audit_academy_gaps.py
```

## Module 6 correctie

White (26), Rosé (27), Tawny met geïntegreerde leeftijden (28), Colheita (29), Garrafeira (30) — geen aparte 10/20/30/40-lessen.

## Examen-lessen

- LES 15 — mini-toets: praktijk, geen MC-quiz
- LES 42 — blindproef examen: praktijk, geen MC-quiz
- LES 45 — eindintegratie: open examen, geen MC-quiz

## Legacy

`PORT_MODULES.md` (40 lessen, dubbele slugs) is **niet meer canon**. Niet mergen met V2.

## Supabase

Seed `academy_port.sql` begint met `delete from academy.tracks where slug = 'port'` — volledige reload wist Port-voortgang.
