export type QuizPhase = 'intro' | 'question' | 'result';

export type QuizSessionState = {
  phase: QuizPhase;
  questionIndex: number;
  answers: Record<string, number>;
  revealed: boolean;
  activeQuestionIds: string[];
  isRetry: boolean;
  resultPercent: number | null;
};

const KEY_PREFIX = 'academy-quiz-session';

export function quizSessionKey(lessonId: string, userId: string): string {
  return `${KEY_PREFIX}:${userId}:${lessonId}`;
}

export function loadQuizSession(lessonId: string, userId: string): QuizSessionState | null {
  try {
    const raw = sessionStorage.getItem(quizSessionKey(lessonId, userId));
    if (!raw) return null;
    return JSON.parse(raw) as QuizSessionState;
  } catch {
    return null;
  }
}

export function saveQuizSession(
  lessonId: string,
  userId: string,
  state: QuizSessionState
): void {
  sessionStorage.setItem(quizSessionKey(lessonId, userId), JSON.stringify(state));
}

export function clearQuizSession(lessonId: string, userId: string): void {
  sessionStorage.removeItem(quizSessionKey(lessonId, userId));
}
