/** Kernbegrippen — langste termen eerst voor correcte matching. */
export const GLOSSARY_TERMS: { term: string; definition: string }[] = [
  {
    term: 'Tinta Negra',
    definition:
      'Meest aangeplante druif op Madeira (75–85%); kan in alle zoetheidsstijlen — vroeger werkpaard, tegenwoordig ook prestigieuze bottelingen.',
  },
  {
    term: 'Malmsey',
    definition:
      'Engelse naam voor Malvasia — de zoetste klassieke Madeira-stijl.',
  },
  {
    term: 'Special Reserve',
    definition:
      'Madeira-kwaliteitsniveau: minimaal 10 jaar rijping; vaak volgens de Canteiro-methode.',
  },
  {
    term: 'Extra Reserve',
    definition:
      'Madeira-kwaliteitsniveau: minimaal 15 jaar rijping; zeldzaam en zeer complex.',
  },
  {
    term: 'Frasqueira',
    definition:
      'Hoogste Madeira-categorie (Vintage Madeira): één oogstjaar, min. 20 jaar Canteiro-rijping; kan eeuwen oud worden.',
  },
  {
    term: 'Cuba de Calor',
    definition:
      'Meest gebruikte Estufagem-systeem: Madeira verwarmd via leidingen of warm water in tanks.',
  },
  {
    term: 'Estufagem',
    definition:
      'Versnelde Madeira-productie: kunstmatige verhitting (ca. 45–50°C, min. 3 maanden) om zeereis-effect na te bootsen.',
  },
  {
    term: 'Canteiro',
    definition:
      'Traditionele Madeira-rijping: vaten jarenlang op warme zolders; natuurlijke verhitting, hoogste kwaliteit.',
  },
  {
    term: 'Vinho da Roda',
    definition:
      'Madeira die een zeereis maakte; hitte en schommelen verbeterden de wijn — voorloper van moderne hittebehandeling.',
  },
  {
    term: 'Malvasia',
    definition:
      'Druif voor de zoetste klassieke Madeira-stijl; ook wel Malmsey genoemd.',
  },
  {
    term: 'Madeira',
    definition:
      'Versterkte wijn van het eiland Madeira; uniek door bewuste hittebehandeling en oxidatie — extreem houdbaar na openen.',
  },
  {
    term: 'Verdelho',
    definition: 'Druif voor halfdroge Madeira — tussen Sercial en Bual in zoetheid.',
  },
  {
    term: 'Sercial',
    definition: 'Droogste klassieke Madeira-stijl, gemaakt van de Sercial-druif.',
  },
  {
    term: 'Bual',
    definition: 'Druif voor halfzoete Madeira; ook wel Boal geschreven.',
  },
  {
    term: 'Garrafeira Port',
    definition:
      'Zeldzame officiële Portstijl van één oogstjaar: lang op hout, daarna jarenlang in grote glazen flessen (demijohns); bekend van Niepoort.',
  },
  {
    term: 'Aged Tawny',
    definition:
      'Tawny Port met leeftijdsaanduiding (10/20/30/40 Years) — blend van jaargangen, lang op hout; de leeftijd is smaakprofiel, niet exacte leeftijd.',
  },
  {
    term: 'Colheita',
    definition:
      'Versterkte wijn van één oogstjaar, lang gerijpt; bij Port Tawny-stijl, bij Madeira min. 5 jaar — oogstjaar op het etiket.',
  },
  {
    term: 'Single Quinta Vintage Port',
    definition:
      'Vintage Port van één specifiek Douro-domein (quinta), vaak bij een Second Declaration.',
  },
  {
    term: 'Second Declaration',
    definition:
      'Single Quinta Vintage in een jaar waarin geen volledige Vintage Declaration volgt.',
  },
  {
    term: 'Quinta',
    definition: 'Wijndomein of landgoed in de Douro-vallei.',
  },
  {
    term: 'Vintage Declaration',
    definition:
      'Officiële erkenning door een producent dat een oogstjaar uitzonderlijk genoeg is voor Vintage Port.',
  },
  {
    term: 'Vintage Port',
    definition:
      'Port van één oogstjaar; kort op vat (18–24 mnd), daarna lang ongefilterd op fles — de prestigieusste stijl.',
  },
  {
    term: 'Crusted Port',
    definition:
      'Blend van meerdere oogstjaren, ongefilterd gebotteld; vormt depot (crust) en rijpt verder op fles.',
  },
  {
    term: 'Late Bottled Vintage',
    definition:
      'Port van één oogstjaar dat 4–6 jaar op vat rijpt voordat hij wordt gebotteld; verkort als LBV.',
  },
  {
    term: 'LBV',
    definition:
      'Late Bottled Vintage — één oogstjaar, langere vatrijping dan Vintage, vaak direct drinkbaar.',
  },
  {
    term: 'Rosé Port',
    definition:
      'Jongste Portstijl met korte schilweking; roze, fruitig en ideaal gekoeld of in cocktails.',
  },
  {
    term: 'White Port',
    definition:
      'Port gemaakt van witte druiven, verkrijgbaar in droge tot zoete stijlen en geproduceerd via fortificatie.',
  },
  {
    term: 'fortificatie',
    definition: 'Toevoegen van druivenalcohol tijdens gisting om restsuiker en fruit te behouden.',
  },
];

export function glossaryPattern(): RegExp {
  const escaped = GLOSSARY_TERMS.map((t) => t.term.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'));
  return new RegExp(`(${escaped.join('|')})`, 'gi');
}

export function glossaryDefinition(matched: string): string | undefined {
  const lower = matched.toLowerCase();
  return GLOSSARY_TERMS.find((t) => t.term.toLowerCase() === lower)?.definition;
}
