import type { UserLessonProgress } from '@way-of-tasting/academy-shared';

type StepPillProps = {
  done: boolean;
  label: string;
  suffix?: string;
};

function StepPill({ done, label, suffix }: StepPillProps) {
  return (
    <li className={done ? 'step-done' : 'step-pending'}>
      <span className="step-icon" aria-hidden>
        {done ? '✓' : '×'}
      </span>
      {label}
      {suffix ?? ''}
    </li>
  );
}

type Props = {
  progress: UserLessonProgress | null;
  quizRequired?: boolean;
  practiceRequired?: boolean;
  showCompletionPill?: boolean;
  completionLabel?: string;
  className?: string;
};

export function LessonProgressPills({
  progress,
  quizRequired = true,
  practiceRequired = true,
  showCompletionPill = false,
  completionLabel = 'Les afgerond',
  className = 'progress-steps',
}: Props) {
  const read = progress?.theory_read === true;
  const practiceDone = !practiceRequired || progress?.practice_completed === true;
  const tested = progress?.best_quiz_score_percent != null;
  const done = quizRequired
    ? read && practiceDone && tested && (progress?.best_quiz_score_percent ?? 0) >= 70
    : read && progress?.status === 'completed';

  return (
    <ul className={className} aria-label="Voortgang les">
      <StepPill done={read} label="Gelezen" />
      {practiceRequired ? <StepPill done={practiceDone} label="Praktijk" /> : null}
      {quizRequired ? (
        <StepPill
          done={tested}
          label="Quiz"
          suffix={tested ? ` (${progress!.best_quiz_score_percent}%)` : ''}
        />
      ) : null}
      {showCompletionPill && done ? (
        <li className="step-done step-complete">
          <span className="step-icon" aria-hidden>
            ✓
          </span>
          {completionLabel}
        </li>
      ) : null}
    </ul>
  );
}
