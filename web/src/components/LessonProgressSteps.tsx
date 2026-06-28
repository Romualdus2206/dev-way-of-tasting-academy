import type { UserLessonProgress } from '@way-of-tasting/academy-shared';

type Props = {
  progress: UserLessonProgress | null;
  quizRequired?: boolean;
  practiceRequired?: boolean;
};

export function LessonProgressSteps({
  progress,
  quizRequired = true,
  practiceRequired = true,
}: Props) {
  const read = progress?.theory_read === true;
  const practiceDone =
    !practiceRequired || progress?.practice_completed === true;
  const tested = progress?.best_quiz_score_percent != null;
  const done = quizRequired
    ? read && practiceDone && tested && (progress?.best_quiz_score_percent ?? 0) >= 70
    : read && progress?.status === 'completed';

  return (
    <ul className="progress-steps" aria-label="Voortgang les">
      <li className={read ? 'step-done' : 'step-pending'}>
        <span className="step-icon" aria-hidden>
          📖
        </span>
        Gelezen
      </li>
      {practiceRequired ? (
        <li className={practiceDone ? 'step-done' : 'step-pending'}>
          <span className="step-icon" aria-hidden>
            ✓
          </span>
          Praktijk
        </li>
      ) : null}
      {quizRequired ? (
        <li className={tested ? 'step-done' : 'step-pending'}>
          <span className="step-icon" aria-hidden>
            🧠
          </span>
          Getest
          {tested ? ` (${progress!.best_quiz_score_percent}%)` : ''}
        </li>
      ) : null}
      {done ? (
        <li className="step-done step-complete">
          <span className="step-icon" aria-hidden>
            ✓
          </span>
          {quizRequired ? 'Les afgerond' : 'Certificaat behaald'}
        </li>
      ) : null}
    </ul>
  );
}
