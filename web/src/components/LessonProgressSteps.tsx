import type { UserLessonProgress } from '@way-of-tasting/academy-shared';
import { LessonProgressPills } from './LessonProgressPills';

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
  const practiceDone = !practiceRequired || progress?.practice_completed === true;
  const tested = progress?.best_quiz_score_percent != null;
  const done = quizRequired
    ? read && practiceDone && tested && (progress?.best_quiz_score_percent ?? 0) >= 70
    : read && progress?.status === 'completed';

  return (
    <LessonProgressPills
      progress={progress}
      quizRequired={quizRequired}
      practiceRequired={practiceRequired}
      showCompletionPill={done}
      completionLabel={quizRequired ? 'Les afgerond' : 'Certificaat behaald'}
    />
  );
}
