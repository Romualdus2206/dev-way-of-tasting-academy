import React from 'react';
import {
  canCompletePractice,
  normalizeChecklistState,
  parsePracticeAssignment,
  type UserLessonProgress,
} from '@way-of-tasting/academy-shared';
import { completePracticeAssignment, savePracticeDraft } from '../lib/academy';
import { HighlightedProse } from './HighlightedProse';

type Props = {
  lessonId: string;
  userId: string;
  markdown: string | null;
  progress: UserLessonProgress | null;
  onProgressChange: (progress: UserLessonProgress) => void;
};

function draftStorageKey(userId: string, lessonId: string): string {
  return `academy-practice-draft:${userId}:${lessonId}`;
}

type Draft = {
  checklist: boolean[];
  reflection: string;
};

function readDraft(userId: string, lessonId: string): Draft | null {
  try {
    const raw = sessionStorage.getItem(draftStorageKey(userId, lessonId));
    if (!raw) return null;
    const parsed = JSON.parse(raw) as Draft;
    if (!Array.isArray(parsed.checklist) || typeof parsed.reflection !== 'string') {
      return null;
    }
    return parsed;
  } catch {
    return null;
  }
}

function writeDraft(userId: string, lessonId: string, draft: Draft): void {
  sessionStorage.setItem(draftStorageKey(userId, lessonId), JSON.stringify(draft));
}

function clearDraft(userId: string, lessonId: string): void {
  sessionStorage.removeItem(draftStorageKey(userId, lessonId));
}

export function PracticeAssignmentCard({
  lessonId,
  userId,
  markdown,
  progress,
  onProgressChange,
}: Props) {
  const parsed = React.useMemo(() => parsePracticeAssignment(markdown), [markdown]);
  const checklistLength =
    parsed.kind === 'structured' ? parsed.checklist.length : 0;

  const [checklist, setChecklist] = React.useState<boolean[]>(() =>
    normalizeChecklistState(checklistLength, progress?.practice_checklist)
  );
  const [reflection, setReflection] = React.useState(progress?.practice_reflection ?? '');
  const [error, setError] = React.useState<string | null>(null);
  const [completing, setCompleting] = React.useState(false);
  const saveTimer = React.useRef<ReturnType<typeof setTimeout> | null>(null);

  const practiceDone = progress?.practice_completed === true;

  React.useEffect(() => {
    const fromDb = normalizeChecklistState(checklistLength, progress?.practice_checklist);
    const draft = readDraft(userId, lessonId);
    if (draft && !practiceDone) {
      setChecklist(normalizeChecklistState(checklistLength, draft.checklist));
      setReflection(draft.reflection || progress?.practice_reflection || '');
    } else {
      setChecklist(fromDb);
      setReflection(progress?.practice_reflection ?? '');
    }
  }, [
    checklistLength,
    lessonId,
    userId,
    practiceDone,
    progress?.practice_checklist,
    progress?.practice_reflection,
  ]);

  const persistDraft = React.useCallback(
    (nextChecklist: boolean[], nextReflection: string) => {
      writeDraft(userId, lessonId, {
        checklist: nextChecklist,
        reflection: nextReflection,
      });
    },
    [lessonId, userId]
  );

  const scheduleSave = React.useCallback(
    (nextChecklist: boolean[], nextReflection: string) => {
      persistDraft(nextChecklist, nextReflection);
      if (practiceDone) return;
      if (saveTimer.current) clearTimeout(saveTimer.current);
      saveTimer.current = setTimeout(() => {
        void savePracticeDraft(userId, lessonId, {
          checklist: nextChecklist,
          reflection: nextReflection,
        }).catch(() => {
          /* draft blijft in sessionStorage */
        });
      }, 400);
    },
    [lessonId, userId, practiceDone, persistDraft]
  );

  React.useEffect(() => {
    return () => {
      if (saveTimer.current) clearTimeout(saveTimer.current);
    };
  }, []);

  if (parsed.kind === 'empty') {
    return null;
  }

  function handleChecklistToggle(index: number) {
    if (practiceDone) return;
    const next = checklist.map((v, i) => (i === index ? !v : v));
    setChecklist(next);
    scheduleSave(next, reflection);
  }

  function handleReflectionChange(value: string) {
    if (practiceDone) return;
    setReflection(value);
    scheduleSave(checklist, value);
  }

  async function handleComplete() {
    const validation = canCompletePractice(parsed, checklist, reflection);
    if (!validation.ok) {
      setError(validation.message);
      return;
    }
    setError(null);
    setCompleting(true);
    try {
      const updated = await completePracticeAssignment(userId, lessonId, {
        checklist,
        reflection,
      });
      clearDraft(userId, lessonId);
      onProgressChange(updated);
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Opslaan mislukt');
    } finally {
      setCompleting(false);
    }
  }

  return (
    <section className="lesson-section practice-card card">
      <h3>Praktijkopdracht</h3>

      {parsed.kind === 'structured' ? (
        <>
          {parsed.assignment ? (
            <div className="practice-block">
              <HighlightedProse text={parsed.assignment} />
            </div>
          ) : null}

          {parsed.checklist.length > 0 ? (
            <div className="practice-block">
              <p className="practice-label">Checklist</p>
              <ul className="practice-checklist">
                {parsed.checklist.map((item, index) => (
                  <li key={index}>
                    <label className="practice-check">
                      <input
                        type="checkbox"
                        checked={checklist[index] === true}
                        disabled={practiceDone}
                        onChange={() => handleChecklistToggle(index)}
                      />
                      <span>{item}</span>
                    </label>
                  </li>
                ))}
              </ul>
            </div>
          ) : null}

          {parsed.reflectionPrompt ? (
            <div className="practice-block">
              <label className="practice-reflection">
                <span className="practice-label">{parsed.reflectionPrompt}</span>
                <textarea
                  rows={4}
                  value={reflection}
                  disabled={practiceDone}
                  onChange={(e) => handleReflectionChange(e.target.value)}
                  placeholder="Jouw antwoord…"
                />
              </label>
            </div>
          ) : null}
        </>
      ) : (
        <div className="practice-block">
          <HighlightedProse text={parsed.body} />
        </div>
      )}

      {error ? <p className="err practice-error">{error}</p> : null}

      {practiceDone ? (
        <p className="practice-done muted">✓ Praktijkopdracht afgerond</p>
      ) : (
        <button
          type="button"
          className="practice-complete-btn"
          disabled={completing}
          onClick={() => void handleComplete()}
        >
          {completing ? 'Opslaan…' : 'Praktijkopdracht afronden'}
        </button>
      )}
    </section>
  );
}
