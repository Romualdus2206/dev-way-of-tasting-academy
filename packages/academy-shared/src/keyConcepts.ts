/** Termen uit key_concepts_markdown (bulletlijst in DB). */
export function parseKeyConceptTerms(markdown: string | null | undefined): string[] {
  if (!markdown?.trim()) return [];

  const terms: string[] = [];
  for (const line of markdown.split('\n')) {
    const trimmed = line.trim();
    const bullet = trimmed.match(/^[-*•]\s*(.+)$/);
    if (!bullet) continue;
    const term = bullet[1].trim();
    if (term) terms.push(term);
  }
  return terms;
}

export function normalizeKeyConceptTerm(term: string): string {
  return term.trim().toLowerCase();
}

function escapeRegex(value: string): string {
  return value.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

function isWordChar(char: string): boolean {
  return /[\p{L}\p{N}_-]/u.test(char);
}

/** Eerste woordgrens-match van term in text (case-insensitive). */
export function findFirstTermMatch(
  text: string,
  term: string
): { index: number; length: number; matched: string } | null {
  if (!text || !term.trim()) return null;

  const pattern = new RegExp(escapeRegex(term.trim()), 'giu');
  let match: RegExpExecArray | null;

  while ((match = pattern.exec(text))) {
    if (match.index === undefined) continue;
    const matched = match[0];
    const before = match.index > 0 ? text[match.index - 1] : '';
    const after = text[match.index + matched.length] ?? '';
    if (!isWordChar(before) && !isWordChar(after)) {
      return { index: match.index, length: matched.length, matched };
    }
  }

  return null;
}

export type KeyConceptMatch = {
  index: number;
  length: number;
  term: string;
  matched: string;
};

/** Vroegste introductie-match onder nog niet geïntroduceerde termen. */
export function findNextKeyConceptIntroduction(
  text: string,
  terms: string[],
  introduced: ReadonlySet<string>
): KeyConceptMatch | null {
  let best: KeyConceptMatch | null = null;

  for (const term of terms) {
    const key = normalizeKeyConceptTerm(term);
    if (introduced.has(key)) continue;

    const match = findFirstTermMatch(text, term);
    if (!match) continue;

    if (
      !best ||
      match.index < best.index ||
      (match.index === best.index && match.length > best.length)
    ) {
      best = { ...match, term };
    }
  }

  return best;
}
