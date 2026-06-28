import type { LessonProgressStatus } from './index';

export type LessonCompletionRules = {
  quizRequired: boolean;
  practiceRequired: boolean;
};

export function lessonCompletionRules(
  lessonSlug: string,
  practiceMarkdown: string | null | undefined
): LessonCompletionRules {
  if (lessonSlug === 'explorer-certificaat') {
    return { quizRequired: false, practiceRequired: false };
  }
  return {
    quizRequired: true,
    practiceRequired: Boolean(practiceMarkdown?.trim()),
  };
}

export function computeLessonStatus(
  fields: {
    theory_read?: boolean;
    practice_completed?: boolean;
    best_quiz_score_percent?: number | null;
    completed_at?: string | null;
  },
  rules: LessonCompletionRules
): { status: LessonProgressStatus; completed_at: string | null } {
  const theory = fields.theory_read === true;
  const practice = !rules.practiceRequired || fields.practice_completed === true;
  const quizOk =
    !rules.quizRequired || (fields.best_quiz_score_percent ?? 0) >= 70;
  const done = theory && practice && quizOk;
  const started =
    theory ||
    fields.practice_completed === true ||
    fields.best_quiz_score_percent != null;

  return {
    status: done ? 'completed' : started ? 'in_progress' : 'not_started',
    completed_at: done ? fields.completed_at ?? new Date().toISOString() : null,
  };
}

export function isLessonWorkflowComplete(
  progress: {
    theory_read?: boolean;
    practice_completed?: boolean;
    best_quiz_score_percent?: number | null;
    completed_at?: string | null;
  } | null,
  rules: LessonCompletionRules
): boolean {
  if (!progress) return false;
  const { status } = computeLessonStatus(progress, rules);
  return status === 'completed';
}
