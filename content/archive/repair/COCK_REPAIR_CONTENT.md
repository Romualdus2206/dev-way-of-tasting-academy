# COCK_REPAIR_CONTENT.md

> **Status:** samengevoegd in [`COCK_MODULES.md`](COCK_MODULES.md) (premium repair + ADD merge juni 2026).  
> **Merge:** `python3 scripts/merge_cock_add_repair.py` (na `apply_cock_premium_repair.py`)

## Wat is gewijzigd

- Theorie: doorlopende proza-alinea’s (premium niveau, vergelijkbaar met BIO)
- Praktijk: concrete opdrachten met checklist en reflectievraag
- Kernbegrippen: Nederlandse termen die in de theorie voorkomen (bold in UI)
- App-koppelingen: Moment (cocktailcatalogus, aperitief) en Advies (Spritz, weer)

## Opnieuw draaien

```bash
python3 scripts/apply_cock_premium_repair.py
python3 scripts/align_cock_key_concepts.py --check
```

Seed: `supabase/seed/academy_cocktails.sql` (via rebuild in apply-script).

## Bestaande Supabase-database

Voor een database die al cocktail-lessen bevat: seed opnieuw laden of een content-migratie draaien. Fresh seed bevat alle premium-inhoud.
