# Content pipeline

Tussenbestanden voor herbouw via `build_*` en `polish_*` scripts. **Niet** leidend voor seeds.

| Bestand | Rol |
|---------|-----|
| `{TRACK}_PIPELINE_CONTENT.md` | Build-output (voorheen `*_GOLD_MASTER.md`) |
| `{TRACK}_LOCKED_CONTENT.md` | Locked polish-tussenstap (wijn, mousserend) |
| `{TRACK}_FINAL_PIPELINE_CONTENT.md` | Final vóór lock (bier) |

Canoniek eindpunt: `content/{TRACK}_FINAL_CONTENT.md` → `rebuild_*` → `supabase/seed/`
