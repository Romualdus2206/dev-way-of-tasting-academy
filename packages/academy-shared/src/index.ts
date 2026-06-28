export { APP_VERSION } from './version';

export type AcademyLevel = 'explorer' | 'specialist' | 'master';

export type LessonProgressStatus = 'not_started' | 'in_progress' | 'completed';

export type AcademyTrack = {
  id: string;
  slug: string;
  title: string;
  description: string | null;
  sort_order: number;
  published_at: string | null;
};

export type AcademyModule = {
  id: string;
  track_id: string;
  level: AcademyLevel;
  slug: string;
  title: string;
  sort_order: number;
};

export type AcademyLesson = {
  id: string;
  module_id: string;
  slug: string;
  title: string;
  learning_objective: string | null;
  theory_markdown: string | null;
  key_concepts_markdown: string | null;
  did_you_know: string | null;
  summary_markdown: string | null;
  practice_assignment_markdown: string | null;
  duration_minutes: number | null;
  sort_order: number;
  is_published: boolean;
};

export type AcademyQuizQuestion = {
  id: string;
  lesson_id: string;
  sort_order: number;
  prompt: string;
  options: string[];
  correct_index: number;
  explanation: string | null;
};

export type UserLessonProgress = {
  user_id: string;
  lesson_id: string;
  status: LessonProgressStatus;
  best_quiz_score_percent: number | null;
  theory_read: boolean;
  practice_completed: boolean;
  practice_checklist: boolean[];
  practice_reflection: string | null;
  context_bottle_id: string | null;
  completed_at: string | null;
  created_at: string;
  updated_at: string;
};

export type LessonListItem = AcademyLesson & {
  module: Pick<AcademyModule, 'id' | 'slug' | 'title' | 'level' | 'sort_order'>;
  progress: UserLessonProgress | null;
  track_order: number;
};

/** Quiz-score uit antwoorden (0–100). */
export function scoreQuizAnswers(
  questions: Pick<AcademyQuizQuestion, 'id' | 'correct_index'>[],
  answers: Record<string, number>
): number {
  if (!questions.length) return 0;
  let correct = 0;
  for (const q of questions) {
    if (answers[q.id] === q.correct_index) correct += 1;
  }
  return Math.round((correct / questions.length) * 100);
}

export {
  parsePracticeAssignment,
  practiceContentRequired,
  normalizeChecklistState,
  canCompletePractice,
} from './practiceAssignment';
export type {
  PracticeAssignmentParsed,
  PracticeAssignmentStructured,
  PracticeAssignmentPlain,
  PracticeAssignmentEmpty,
} from './practiceAssignment';

export {
  lessonCompletionRules,
  computeLessonStatus,
  isLessonWorkflowComplete,
} from './lessonProgress';
export type { LessonCompletionRules } from './lessonProgress';
