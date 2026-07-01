#!/usr/bin/env python3
"""Audit Academy module MD and write docs/ACADEMY_CONTENT_GAPS.md."""

from __future__ import annotations

import importlib.util
import re
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "docs/ACADEMY_CONTENT_GAPS.md"
GAPS_DIR = ROOT / "docs/gaps"

# Per-track metadata for individual gap documents (filename without path).
TRACK_META: dict[str, dict[str, str]] = {
    "port": {
        "gap_file": "PORT_GAPS.md",
        "seed": "supabase/seed/academy_port.sql",
        "app_category": "port",
        "rebuild": "scripts/rebuild_port_track.py",
    },
    "wine-foundation": {
        "gap_file": "WIJN_GAPS.md",
        "seed": "supabase/seed/academy_wine_foundation.sql",
        "app_category": "wine",
        "rebuild": "scripts/rebuild_wine_track.py",
    },
    "red-wine": {
        "gap_file": "ROOD_GAPS.md",
        "seed": "supabase/seed/academy_red_wine.sql",
        "app_category": "red-wine",
        "rebuild": "scripts/rebuild_red_wine_track.py",
    },
    "white-wine": {
        "gap_file": "WIT_GAPS.md",
        "seed": "supabase/seed/academy_white_wine.sql",
        "app_category": "white-wine",
        "rebuild": "scripts/rebuild_white_wine_track.py",
    },
    "rose-wine": {
        "gap_file": "ROSE_GAPS.md",
        "seed": "supabase/seed/academy_rose_wine.sql",
        "app_category": "rose-wine",
        "rebuild": "scripts/rebuild_rose_wine_track.py",
    },
    "cocktails": {
        "gap_file": "COCK_GAPS.md",
        "seed": "supabase/seed/academy_cocktails.sql",
        "app_category": "cocktails",
        "rebuild": "scripts/rebuild_cocktails_track.py",
    },
    "sparkling": {
        "gap_file": "MOUS_GAPS.md",
        "seed": "supabase/seed/academy_sparkling.sql",
        "app_category": "champagne",
        "rebuild": "scripts/rebuild_mous_track.py",
    },
    "beer": {
        "gap_file": "BIER_GAPS.md",
        "seed": "supabase/seed/academy_beer.sql",
        "app_category": "beer",
        "rebuild": "scripts/rebuild_beer_track.py",
    },
    "beer-zero": {
        "gap_file": "BIER_0_0_GAPS.md",
        "seed": "supabase/seed/academy_beer_zero.sql",
        "app_category": "beer-zero",
        "rebuild": "scripts/rebuild_beer_zero_track.py",
    },
    "biodynamic": {
        "gap_file": "BIO_GAPS.md",
        "seed": "supabase/seed/academy_biodynamic.sql",
        "app_category": "biodynamic",
        "rebuild": "scripts/rebuild_bio_track.py",
    },
}

TRACKS: dict[str, dict] = {
    "wine-foundation": {
        "title": "Wijn (Wine Foundation)",
        "source": "content/archive/legacy/WIJN_MODULES.md",
        "registry": {
            1: "intro-wine",
            2: "productie-wine",
            3: "proeven-wine",
            4: "structuur-wine",
            5: "druivenrassen-wine",
            6: "klimaat-terroir-wine",
            7: "service-wine",
            8: "pairing-wine",
            9: "examen-wine",
        },
    },
    "red-wine": {
        "title": "Rode wijn",
        "source": "content/archive/legacy/ROOD_MODULES.md",
        "registry": {
            1: "intro-red-wine",
            2: "productie-red-wine",
            3: "proeven-red-wine",
            4: "lichte-druiven-red-wine",
            5: "medium-druiven-red-wine",
            6: "krachtige-druiven-red-wine",
            7: "service-red-wine",
            8: "pairing-red-wine",
            9: "examen-red-wine",
        },
    },
    "white-wine": {
        "title": "Witte wijn",
        "source": "content/archive/legacy/WIT_MODULES.md",
        "registry": {
            1: "intro-white-wine",
            2: "productie-white-wine",
            3: "proeven-white-wine",
            4: "frisse-druiven-white-wine",
            5: "rijke-druiven-white-wine",
            6: "aromatische-druiven-white-wine",
            7: "service-white-wine",
            8: "pairing-white-wine",
            9: "examen-white-wine",
        },
    },
    "rose-wine": {
        "title": "Rosé",
        "source": "content/archive/legacy/ROSE_MODULES.md",
        "registry": {
            1: "intro-rose-wine",
            2: "productie-rose-wine",
            3: "proeven-rose-wine",
            4: "klassieke-stijlen-rose-wine",
            5: "druivenrassen-rose-wine",
            6: "stijl-gastronomie-rose-wine",
            7: "service-rose-wine",
            8: "pairing-rose-wine",
            9: "examen-rose-wine",
        },
    },
    "cocktails": {
        "title": "Cocktails",
        "source": "content/pipeline/COCK_PIPELINE_CONTENT.md",
        "registry": {
            1: "intro-cocktails",
            2: "technieken-cocktails",
            3: "ingredienten-cocktails",
            4: "klassiek-cocktails",
            5: "sour-family-cocktails",
            6: "highballs-cocktails",
            7: "service-cocktails",
            8: "pairing-cocktails",
            9: "examen-cocktails",
        },
    },
    "port": {
        "title": "Port",
        "source": "content/archive/legacy/PORT_MODULES.md",
        "registry": {
            1: "intro-port",
            2: "productie-port",
            3: "proeven-port",
            4: "oorsprong-port",
            5: "portstijlen",
            6: "portstijlen-verdiept",
            7: "port-premium",
            8: "praktijk-port",
            9: "examen-port",
        },
    },
    "sparkling": {
        "title": "Mousserend",
        "source": "content/archive/legacy/MOUS_MODULES.md",
        "registry": {
            1: "intro-sparkling",
            2: "productie-sparkling",
            3: "proeven-sparkling",
            4: "champagne-sparkling",
            5: "wereldstijlen-sparkling",
            6: "suiker-stijl-sparkling",
            7: "service-sparkling",
            8: "pairing-sparkling",
            9: "examen-sparkling",
        },
    },
    "beer": {
        "title": "Bier",
        "source": "content/BIER_FINAL_CONTENT.md",
        "registry": {
            1: "intro-beer",
            2: "productie-beer",
            3: "proeven-beer",
            4: "klassieke-stijlen-beer",
            5: "belgische-stijlen-beer",
            6: "moderne-stijlen-beer",
            7: "service-beer",
            8: "pairing-beer",
            9: "examen-beer",
        },
    },
    "beer-zero": {
        "title": "Bier 0.0",
        "source": "content/BIER_0_0_FINAL_CONTENT.md",
        "registry": {
            1: "intro-beer-zero",
            2: "productie-beer-zero",
            3: "proeven-beer-zero",
            4: "klassieke-stijlen-beer-zero",
            5: "markt-innovatie-beer-zero",
            6: "gezondheid-beer-zero",
            7: "service-beer-zero",
            8: "pairing-beer-zero",
            9: "examen-beer-zero",
        },
    },
    "biodynamic": {
        "title": "Biodynamisch Proeven",
        "source": "content/BIO_FINAL_CONTENT.md",
        "registry": {
            1: "intro-biodynamic",
            2: "kalender-biodynamic",
            3: "proeven-biodynamic",
            4: "weer-biodynamic",
            5: "stijlen-biodynamic",
            6: "cross-biodynamic",
            7: "voorraad-biodynamic",
            8: "intelligence-biodynamic",
            9: "examen-biodynamic",
        },
    },
}


def load_port_importer():
    spec = importlib.util.spec_from_file_location(
        "import_port_module_md", ROOT / "scripts/import_port_module_md.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_bio_importer():
    spec = importlib.util.spec_from_file_location(
        "import_bio_module_md", ROOT / "scripts/import_bio_module_md.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_importer():
    spec = importlib.util.spec_from_file_location(
        "import_module_md", ROOT / "scripts/import_module_md.py"
    )
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def load_parts(track_slug: str) -> list[str]:
    if track_slug == "port":
        raise ValueError("port uses audit_port_track()")
    text = (ROOT / TRACKS[track_slug]["source"].split()[0]).read_text(encoding="utf-8")
    if track_slug == "sparkling":
        return [p.strip() for p in re.split(r"# MOUS_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "beer-zero":
        if re.search(r"^### Module \d+ — ", text, re.M):
            parts = re.split(r"(?=\n### Module \d+ — )", text)
            return [p.strip() for p in parts if re.match(r"### Module \d+", p.strip())]
        return [p.strip() for p in re.split(r"# ZERO_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "wine-foundation":
        return [p.strip() for p in re.split(r"# WINE_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "red-wine":
        return [p.strip() for p in re.split(r"# RED_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "white-wine":
        return [p.strip() for p in re.split(r"# WHITE_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "rose-wine":
        return [p.strip() for p in re.split(r"# ROSE_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "cocktails":
        return [p.strip() for p in re.split(r"# COCK_MODULE_\d+\.md\s*\n", text) if p.strip()]
    if track_slug == "biodynamic":
        return [p.strip() for p in re.split(r"# BIO_MODULE_\d+\.md\s*\n", text) if p.strip()]
    return [p.strip() for p in re.split(r"(?=\n### Module \d+ — )", text) if re.match(r"### Module \d+", p.strip())]


PORT_MODULE_TITLES = {
    1: "Fundament",
    2: "Productie",
    3: "Proeven",
    4: "Regio's van Port",
    5: "Portstijlen",
    6: "Portstijlen verdiept",
    7: "Colheita & Garrafeira",
    8: "Service, Pairing & Praktijk",
    9: "Blindproeven & Examen",
}


def audit_port_track() -> dict:
    cfg = TRACKS["port"]
    port_imp = load_port_importer()
    text = (ROOT / "content/archive/legacy/PORT_MODULES.md").read_text(encoding="utf-8")
    grouped = port_imp.split_port_track(text)
    rows = []
    for num in sorted(grouped):
        module_slug = cfg["registry"][num]
        module_title = PORT_MODULE_TITLES[num]
        for les in grouped[num]:
            rows.append(
                {
                    "module": num,
                    "module_title": module_title,
                    "module_slug": module_slug,
                    "slug": les["slug"],
                    "title": les["title"],
                    "has_quiz": bool(les["quiz"]),
                    "quiz_count": len(les["quiz"]),
                    "has_feedback": bool(les["quiz_feedback"]),
                    "has_key_concepts": bool(les["key_concepts"].strip()),
                    "has_practice": bool(les["practice"].strip()),
                }
            )
    return {"cfg": cfg, "rows": rows}


def audit_track(imp, track_slug: str) -> dict:
    if track_slug == "port":
        return audit_port_track()
    if track_slug == "biodynamic":
        imp = load_bio_importer()
    cfg = TRACKS[track_slug]
    parts = load_parts(track_slug)
    rows = []
    for num, part in enumerate(parts, 1):
        module_slug = cfg["registry"][num]
        data = imp.parse_module_text(part, module_slug)
        title_m = re.search(r"### Module \d+ — (.+)", part)
        module_title = title_m.group(1).strip() if title_m else f"Module {num}"
        for les in data["lessons"]:
            rows.append(
                {
                    "module": num,
                    "module_title": module_title,
                    "module_slug": module_slug,
                    "slug": les["slug"],
                    "title": les["title"],
                    "has_quiz": bool(les["quiz"]),
                    "quiz_count": len(les["quiz"]),
                    "has_feedback": bool(les["quiz_feedback"]),
                    "has_key_concepts": bool(les["key_concepts"].strip()),
                    "has_practice": bool(les["practice"].strip()),
                }
            )
    return {"cfg": cfg, "rows": rows}


def lesson_row(r: dict) -> str:
    return f"| {r['module']} | `{r['module_slug']}:{r['slug']}` | {r['title']} |"


def track_gap_sections(track_slug: str, result: dict) -> list[str]:
    """Build markdown sections for one track (used by combined + per-track docs)."""
    cfg = result["cfg"]
    rows = result["rows"]
    total = len(rows)
    with_quiz = sum(1 for r in rows if r["has_quiz"])
    with_fb = sum(1 for r in rows if r["has_feedback"])
    with_fb_quiz = sum(1 for r in rows if r["has_quiz"] and r["has_feedback"])

    no_quiz = [r for r in rows if not r["has_quiz"]]
    quiz_no_fb = [r for r in rows if r["has_quiz"] and not r["has_feedback"]]
    no_key = [r for r in rows if not r["has_key_concepts"]]
    no_practice = [r for r in rows if not r["has_practice"]]

    meta = TRACK_META[track_slug]
    pct_quiz = round(100 * with_quiz / total) if total else 0
    pct_fb = round(100 * with_fb / total) if total else 0
    pct_key = round(100 * (total - len(no_key)) / total) if total else 0
    pct_practice = round(100 * (total - len(no_practice)) / total) if total else 0

    lines = [
        f"**Track slug:** `{track_slug}` · **App-chip:** `{meta['app_category']}`",
        f"**Bron:** `{cfg['source']}` · **Lessen:** {total}",
        f"**Seed:** `{meta['seed']}` · **Rebuild:** `{meta['rebuild']}`",
        "",
        "## Samenvatting",
        "",
        "| Onderdeel | Aanwezig | Ontbreekt | % |",
        "|-----------|----------|-----------|---|",
        f"| Quiz (`## Quiz`) | {with_quiz}/{total} | {len(no_quiz)} | {pct_quiz}% |",
        f"| Quiz-feedback | {with_fb}/{total} ({with_fb_quiz} bij quiz-lessen) | {len(quiz_no_fb)} | {pct_fb}% |",
        f"| Kernbegrippen | {total - len(no_key)}/{total} | {len(no_key)} | {pct_key}% |",
        f"| Praktijkopdracht | {total - len(no_practice)}/{total} | {len(no_practice)} | {pct_practice}% |",
        "",
    ]

    # Per-module breakdown
    lines += ["## Per module", "", "| Mod | Module | Lessen | Quiz | Feedback | Kern | Praktijk |", "|-----|--------|--------|------|----------|------|----------|"]
    for mod_num in sorted({r["module"] for r in rows}):
        mod_rows = [r for r in rows if r["module"] == mod_num]
        title = mod_rows[0]["module_title"] if mod_rows else f"Module {mod_num}"
        n = len(mod_rows)
        q = sum(1 for r in mod_rows if r["has_quiz"])
        f = sum(1 for r in mod_rows if r["has_feedback"])
        k = sum(1 for r in mod_rows if r["has_key_concepts"])
        p = sum(1 for r in mod_rows if r["has_practice"])
        lines.append(f"| {mod_num} | {title} | {n} | {q}/{n} | {f}/{n} | {k}/{n} | {p}/{n} |")
    lines.append("")

    if no_quiz:
        lines += ["## Geen quiz-sectie", "", "| Mod | Les-key | Titel |", "|-----|---------|-------|"]
        lines += [lesson_row(r) for r in no_quiz]
        lines.append("")

    if quiz_no_fb:
        lines += [
            "## Quiz wel, feedback ontbreekt",
            "",
            "| Mod | Les-key | Titel |",
            "|-----|---------|-------|",
        ]
        lines += [lesson_row(r) for r in quiz_no_fb]
        lines.append("")

    if no_key:
        lines += ["## Kernbegrippen ontbreken", "", "| Mod | Les-key | Titel |", "|-----|---------|-------|"]
        lines += [lesson_row(r) for r in no_key]
        lines.append("")

    if no_practice:
        lines += ["## Praktijkopdracht ontbreekt", "", "| Mod | Les-key | Titel |", "|-----|---------|-------|"]
        lines += [lesson_row(r) for r in no_practice]
        lines.append("")

    exam = [r for r in no_quiz if "examen" in r["slug"] or "examen" in r["title"].lower()]
    mini = [r for r in no_quiz if "mini-toets" in r["slug"] or "mini-toets" in r["title"].lower()]
    if exam or mini:
        lines += ["## Examen & mini-toets (geen MC-quiz)", ""]
        if exam:
            lines.append("Open examen — geen meerkeuze-quiz in MD; feedback kan wel aanwezig zijn.")
            lines.append("")
            for r in exam:
                fb = "ja" if r["has_feedback"] else "nee"
                lines.append(f"- `{r['module_slug']}:{r['slug']}` — feedback: {fb}")
            lines.append("")
        if mini:
            lines.append("Mini-toets — vaak praktijk/blind; MC-quiz optioneel.")
            lines.append("")
            for r in mini:
                fb = "ja" if r["has_feedback"] else "nee"
                lines.append(f"- `{r['module_slug']}:{r['slug']}` — feedback: {fb}")
            lines.append("")

    return lines


def write_track_doc(track_slug: str, result: dict, today: str) -> Path:
    cfg = result["cfg"]
    meta = TRACK_META[track_slug]
    path = GAPS_DIR / meta["gap_file"]

    lines = [
        f"# {cfg['title']} — content gaps",
        "",
        f"**Laatste audit:** {today}",
        "",
        "Wat nog ontbreekt in de bron-markdown voordat deze track op 10/10 staat.",
        "Bijwerken: `python3 scripts/audit_academy_gaps.py`",
        "",
        "---",
        "",
    ]
    lines += track_gap_sections(track_slug, result)
    path.write_text("\n".join(lines), encoding="utf-8")
    return path


def write_index(results: dict[str, dict], today: str) -> None:
    index_path = GAPS_DIR / "README.md"
    lines = [
        "# Academy — gaps per dranksoort",
        "",
        f"**Laatste audit:** {today} (`python3 scripts/audit_academy_gaps.py`)",
        "",
        "Per track een apart gap-document. Gecombineerd overzicht: [`ACADEMY_CONTENT_GAPS.md`](../ACADEMY_CONTENT_GAPS.md).",
        "",
        "| Dranksoort | Track | Lessen | Quiz | Feedback | Kern | Bestand |",
        "|------------|-------|--------|------|----------|------|---------|",
    ]
    for track_slug, result in results.items():
        cfg = result["cfg"]
        rows = result["rows"]
        total = len(rows)
        quiz = sum(1 for r in rows if r["has_quiz"])
        fb = sum(1 for r in rows if r["has_feedback"])
        key = sum(1 for r in rows if r["has_key_concepts"])
        gap_file = TRACK_META[track_slug]["gap_file"]
        lines.append(
            f"| {cfg['title']} | `{track_slug}` | {total} | {quiz}/{total} | {fb}/{total} | "
            f"{key}/{total} | [{gap_file}]({gap_file}) |"
        )
    lines.append("")
    index_path.write_text("\n".join(lines), encoding="utf-8")


def write_doc(results: dict[str, dict]) -> None:
    today = date.today().isoformat()
    GAPS_DIR.mkdir(parents=True, exist_ok=True)

    lines = [
        "# Academy — openstaande content",
        "",
        f"**Laatste audit:** {today} (`python3 scripts/audit_academy_gaps.py`)",
        "",
        "Gecombineerd overzicht. **Per dranksoort:** [`docs/gaps/README.md`](gaps/README.md).",
        "",
        "| Dranksoort | Gap-document |",
        "|------------|--------------|",
    ]
    for track_slug, result in results.items():
        cfg = result["cfg"]
        gap_file = TRACK_META[track_slug]["gap_file"]
        lines.append(f"| {cfg['title']} | [`gaps/{gap_file}`](gaps/{gap_file}) |")
    lines += ["", "---", ""]

    for track_slug, result in results.items():
        cfg = result["cfg"]
        lines += [f"## {cfg['title']} (`{track_slug}`)", ""]
        lines += track_gap_sections(track_slug, result)

    lines += [
        "---",
        "",
        "## Seed / app status",
        "",
        "| Track | Seed | App | Gap-doc |",
        "|-------|------|-----|---------|",
    ]
    for track_slug in results:
        cfg = TRACKS[track_slug]
        meta = TRACK_META[track_slug]
        lines.append(
            f"| {cfg['title']} | `{meta['seed']}` | `{meta['app_category']}` | "
            f"[`gaps/{meta['gap_file']}`](gaps/{meta['gap_file']}) |"
        )
    lines.append("")

    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUT.relative_to(ROOT)}")

    for track_slug, result in results.items():
        path = write_track_doc(track_slug, result, today)
        print(f"Wrote {path.relative_to(ROOT)}")

    write_index(results, today)
    print(f"Wrote {GAPS_DIR.relative_to(ROOT)}/README.md")


def main() -> None:
    imp = load_importer()
    results = {slug: audit_track(imp, slug) for slug in TRACKS}
    write_doc(results)


if __name__ == "__main__":
    main()
