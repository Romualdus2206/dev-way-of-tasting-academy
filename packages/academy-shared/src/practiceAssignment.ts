export type PracticeAssignmentStructured = {
  kind: 'structured';
  assignment: string;
  checklist: string[];
  reflectionPrompt: string;
};

export type PracticeAssignmentPlain = {
  kind: 'plain';
  body: string;
};

export type PracticeAssignmentEmpty = {
  kind: 'empty';
};

export type PracticeAssignmentParsed =
  | PracticeAssignmentStructured
  | PracticeAssignmentPlain
  | PracticeAssignmentEmpty;

function sectionBody(markdown: string, heading: string): string {
  const re = new RegExp(
    `###\\s+${heading}\\s*\\n([\\s\\S]*?)(?=\\n###\\s+|$)`,
    'i'
  );
  const match = markdown.match(re);
  return match?.[1]?.trim() ?? '';
}

function parseChecklistItems(raw: string): string[] {
  return raw
    .split('\n')
    .map((line) => line.replace(/^\s*[-*]\s+/, '').trim())
    .filter(Boolean);
}

/** Parse practice_assignment_markdown naar opdracht / checklist / reflectie. */
export function parsePracticeAssignment(
  markdown: string | null | undefined
): PracticeAssignmentParsed {
  const text = markdown?.trim() ?? '';
  if (!text) return { kind: 'empty' };

  const structured =
    /###\s+Opdracht/i.test(text) ||
    /###\s+Checklist/i.test(text) ||
    /###\s+Reflectievraag/i.test(text);

  if (!structured) {
    return { kind: 'plain', body: text };
  }

  const assignment = sectionBody(text, 'Opdracht');
  const checklist = parseChecklistItems(sectionBody(text, 'Checklist'));
  const reflectionPrompt = sectionBody(text, 'Reflectievraag');

  return {
    kind: 'structured',
    assignment,
    checklist,
    reflectionPrompt,
  };
}

export function practiceContentRequired(markdown: string | null | undefined): boolean {
  const parsed = parsePracticeAssignment(markdown);
  return parsed.kind !== 'empty';
}

export function normalizeChecklistState(
  checklistLength: number,
  stored: unknown
): boolean[] {
  if (!Array.isArray(stored)) {
    return Array.from({ length: checklistLength }, () => false);
  }
  return Array.from({ length: checklistLength }, (_, i) => stored[i] === true);
}

export function canCompletePractice(
  parsed: PracticeAssignmentParsed,
  checklist: boolean[],
  reflection: string
): { ok: true } | { ok: false; message: string } {
  if (parsed.kind === 'empty') {
    return { ok: false, message: 'Geen praktijkopdracht beschikbaar.' };
  }
  if (parsed.kind === 'plain') {
    return { ok: true };
  }

  if (parsed.checklist.length > 0) {
    const allChecked = parsed.checklist.every((_, i) => checklist[i] === true);
    if (!allChecked) {
      return { ok: false, message: 'Vink alle checklist-items af.' };
    }
  }

  if (parsed.reflectionPrompt.trim() && !reflection.trim()) {
    return { ok: false, message: 'Beantwoord de reflectievraag.' };
  }

  return { ok: true };
}
