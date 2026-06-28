import React from 'react';
import { Link, useNavigate, useParams } from 'react-router-dom';
import { scoreQuizAnswers, type AcademyQuizQuestion } from '@way-of-tasting/academy-shared';
import {
  fetchLesson,
  fetchLessonProgress,
  fetchLessonTrackOrder,
  fetchNextLessonId,
  fetchQuizQuestions,
  submitQuizAttempt,
} from '../lib/academy';
import { quizFeedbackForLesson, quizResultLabel } from '../lib/quizFeedback';
import { ACADEMY_HOME, academyCategoryPath, isAcademyCategory, lessonPath } from '../navigation';
import {
  clearQuizSession,
  loadQuizSession,
  saveQuizSession,
  type QuizPhase,
  type QuizSessionState,
} from '../lib/quizSession';
import { useSession } from '../hooks/useSession';

type QuizStep = 'loading' | QuizPhase;

function countCorrect(questions: AcademyQuizQuestion[], answers: Record<string, number>): number {
  return questions.filter((q) => answers[q.id] === q.correct_index).length;
}

function questionsByIds(all: AcademyQuizQuestion[], ids: string[]): AcademyQuizQuestion[] {
  const map = new Map(all.map((q) => [q.id, q]));
  return ids.map((id) => map.get(id)).filter((q): q is AcademyQuizQuestion => q != null);
}

function buildSessionSnapshot(
  phase: QuizPhase,
  questionIndex: number,
  answers: Record<string, number>,
  revealed: boolean,
  activeQuestionIds: string[],
  isRetry: boolean,
  resultPercent: number | null
): QuizSessionState {
  return {
    phase,
    questionIndex,
    answers,
    revealed,
    activeQuestionIds,
    isRetry,
    resultPercent,
  };
}

export function QuizPage() {
  const { lessonId, category } = useParams<{ lessonId: string; category: string }>();
  const navigate = useNavigate();
  const { userId } = useSession();

  const [step, setStep] = React.useState<QuizStep>('loading');
  const [title, setTitle] = React.useState('');
  const [trackOrder, setTrackOrder] = React.useState<number | null>(null);
  const [lessonSlug, setLessonSlug] = React.useState('');
  const [moduleSlug, setModuleSlug] = React.useState('');
  const [questions, setQuestions] = React.useState<AcademyQuizQuestion[]>([]);
  const [activeQuestions, setActiveQuestions] = React.useState<AcademyQuizQuestion[]>([]);
  const [answers, setAnswers] = React.useState<Record<string, number>>({});
  const [questionIndex, setQuestionIndex] = React.useState(0);
  const [revealed, setRevealed] = React.useState(false);
  const [selectedOption, setSelectedOption] = React.useState<number | null>(null);
  const [resultPercent, setResultPercent] = React.useState<number | null>(null);
  const [lessonCompleted, setLessonCompleted] = React.useState(false);
  const [nextLessonId, setNextLessonId] = React.useState<string | null>(null);
  const [isRetry, setIsRetry] = React.useState(false);
  const [error, setError] = React.useState<string | null>(null);
  const [submitting, setSubmitting] = React.useState(false);

  const persistRef = React.useRef({
    step: 'loading' as QuizStep,
    questionIndex: 0,
    answers: {} as Record<string, number>,
    revealed: false,
    activeQuestionIds: [] as string[],
    isRetry: false,
    resultPercent: null as number | null,
  });

  React.useEffect(() => {
    persistRef.current = {
      step,
      questionIndex,
      answers,
      revealed,
      activeQuestionIds: activeQuestions.map((q) => q.id),
      isRetry,
      resultPercent,
    };
  }, [step, questionIndex, answers, revealed, activeQuestions, isRetry, resultPercent]);

  const persistSession = React.useCallback(() => {
    if (!lessonId || !userId) return;
    const s = persistRef.current;
    if (s.step === 'loading') return;
    if (s.step === 'result' && s.resultPercent !== null) {
      saveQuizSession(
        lessonId,
        userId,
        buildSessionSnapshot(
          'result',
          s.questionIndex,
          s.answers,
          s.revealed,
          s.activeQuestionIds,
          s.isRetry,
          s.resultPercent
        )
      );
      return;
    }
    if (s.step === 'intro' || s.step === 'question') {
      saveQuizSession(
        lessonId,
        userId,
        buildSessionSnapshot(
          s.step,
          s.questionIndex,
          s.answers,
          s.revealed,
          s.activeQuestionIds,
          s.isRetry,
          null
        )
      );
    }
  }, [lessonId, userId]);

  React.useEffect(() => {
    if (!lessonId || !userId) return;

    void Promise.all([
      fetchLesson(lessonId),
      fetchQuizQuestions(lessonId),
      fetchNextLessonId(lessonId),
      fetchLessonProgress(userId, lessonId),
      fetchLessonTrackOrder(lessonId),
    ])
      .then(([lesson, qs, nextId, progress, order]) => {
        setTitle(lesson?.title ?? 'Quiz');
        setTrackOrder(order);
        setLessonSlug(lesson?.slug ?? '');
        setModuleSlug(lesson?.module?.slug ?? '');
        setQuestions(qs);
        setNextLessonId(nextId);

        if (!qs.length) {
          setError('Geen quizvragen voor deze les.');
          setStep('intro');
          return;
        }

        const saved = loadQuizSession(lessonId, userId);
        if (saved && saved.activeQuestionIds.length) {
          const active = questionsByIds(qs, saved.activeQuestionIds);
          if (active.length) {
            setActiveQuestions(active);
            setAnswers(saved.answers);
            setQuestionIndex(saved.questionIndex);
            setRevealed(saved.revealed);
            setIsRetry(saved.isRetry);
            const current = active[saved.questionIndex];
            if (current && saved.revealed && saved.answers[current.id] !== undefined) {
              setSelectedOption(saved.answers[current.id]);
            }
            if (saved.phase === 'result' && saved.resultPercent !== null) {
              setResultPercent(saved.resultPercent);
              setStep('result');
              setLessonCompleted(saved.resultPercent >= 70 && progress?.status === 'completed');
            } else {
              setStep(saved.phase);
            }
            return;
          }
        }

        setActiveQuestions(qs);
        setStep('intro');
      })
      .catch((e: Error) => setError(e.message));
  }, [lessonId, userId]);

  React.useEffect(() => {
    persistSession();
  }, [step, questionIndex, answers, revealed, activeQuestions, isRetry, resultPercent, persistSession]);

  React.useEffect(() => {
    const onLeave = () => persistSession();
    window.addEventListener('beforeunload', onLeave);
    return () => {
      window.removeEventListener('beforeunload', onLeave);
      onLeave();
    };
  }, [persistSession]);

  function startQuiz(retry = false, retryQuestions?: AcademyQuizQuestion[]) {
    const active = retryQuestions ?? questions;
    setActiveQuestions(active);
    if (!retry) setAnswers({});
    setQuestionIndex(0);
    setRevealed(false);
    setSelectedOption(null);
    setResultPercent(null);
    setIsRetry(retry);
    setStep('question');
    setError(null);
  }

  function handleConfirm() {
    const q = activeQuestions[questionIndex];
    if (!q || selectedOption === null) return;

    const nextAnswers = { ...answers, [q.id]: selectedOption };
    setAnswers(nextAnswers);
    setRevealed(true);
  }

  async function finishQuiz(finalAnswers: Record<string, number>) {
    if (!userId || !lessonId) return;

    setSubmitting(true);
    setError(null);

    const merged = { ...answers, ...finalAnswers };
    const score = scoreQuizAnswers(questions, merged);

    try {
      await submitQuizAttempt(userId, lessonId, merged, score);
      const progress = await fetchLessonProgress(userId, lessonId);
      setLessonCompleted(progress?.status === 'completed');
      setResultPercent(score);
      setAnswers(merged);
      setStep('result');
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Indienen mislukt');
    } finally {
      setSubmitting(false);
    }
  }

  async function handleNext() {
    const q = activeQuestions[questionIndex];
    if (!q) return;

    const isLast = questionIndex >= activeQuestions.length - 1;
    if (isLast) {
      await finishQuiz(answers);
      return;
    }

    setQuestionIndex((i) => i + 1);
    setRevealed(false);
    setSelectedOption(null);
  }

  function handleRetryWrong() {
    const wrong = questions.filter((q) => answers[q.id] !== q.correct_index);
    if (!wrong.length) return;
    startQuiz(true, wrong);
  }

  function handleStartFresh() {
    if (lessonId && userId) clearQuizSession(lessonId, userId);
    startQuiz(false, questions);
  }

  const currentQuestion = activeQuestions[questionIndex];
  const totalActive = activeQuestions.length;
  const correctCount =
    resultPercent !== null ? countCorrect(questions, answers) : 0;
  const wrongCount = questions.length - correctCount;
  const resultLabel =
    resultPercent !== null ? quizResultLabel(correctCount, questions.length) : '';
  const confidenceClass =
    resultLabel === 'Uitstekend'
      ? 'confidence-uitstekend'
      : resultLabel === 'Goed bezig'
        ? 'confidence-goed-bezig'
        : 'confidence-nog-oefenen';

  if (step === 'loading') {
    return (
      <main className="quiz-page">
        <p className="muted">Quiz laden…</p>
      </main>
    );
  }

  return (
    <main className="quiz-page">
      <Link to={isAcademyCategory(category) ? lessonPath(category, lessonId!) : ACADEMY_HOME} className="back-link">
        ← Terug naar les
      </Link>

      {error ? <p className="err">{error}</p> : null}

      {step === 'intro' ? (
        <div className="quiz-panel card" key="intro">
          <h2 className="section">Quiz</h2>
          {trackOrder != null ? <p className="lesson-number-inline">Les {trackOrder}</p> : null}
          <p className="muted">{title}</p>
          <p className="quiz-intro-count">
            {questions.length} {questions.length === 1 ? 'vraag' : 'vragen'}
          </p>
          <p className="muted quiz-intro-hint">Beantwoord elke vraag en krijg direct feedback.</p>
          <button type="button" onClick={() => handleStartFresh()}>
            Start
          </button>
        </div>
      ) : null}

      {step === 'question' && currentQuestion ? (
        <div className="quiz-panel card" key={`q-${currentQuestion.id}-${questionIndex}`}>
          <p className="quiz-progress">
            Vraag {questionIndex + 1} van {totalActive}
            {isRetry ? <span className="quiz-retry-badge"> · herhaling</span> : null}
          </p>
          <h2 className="quiz-prompt">{currentQuestion.prompt}</h2>

          <div className="quiz-options" role="radiogroup" aria-label={currentQuestion.prompt}>
            {currentQuestion.options.map((opt, idx) => {
              const isSelected = selectedOption === idx;
              const isCorrect = idx === currentQuestion.correct_index;
              let optionClass = 'quiz-option-card';
              if (revealed) {
                if (isCorrect) optionClass += ' quiz-option-correct';
                else if (isSelected) optionClass += ' quiz-option-wrong';
                else optionClass += ' quiz-option-muted';
              } else if (isSelected) {
                optionClass += ' quiz-option-selected';
              }

              return (
                <label key={idx} className={optionClass}>
                  <input
                    type="radio"
                    name={currentQuestion.id}
                    checked={isSelected}
                    disabled={revealed}
                    onChange={() => setSelectedOption(idx)}
                  />
                  <span>{opt}</span>
                </label>
              );
            })}
          </div>

          {revealed ? (
            <div className="quiz-feedback-block">
              <p
                className={
                  answers[currentQuestion.id] === currentQuestion.correct_index
                    ? 'quiz-verdict quiz-verdict-ok'
                    : 'quiz-verdict quiz-verdict-fail'
                }
              >
                {answers[currentQuestion.id] === currentQuestion.correct_index
                  ? '✓ Correct'
                  : '✗ Niet correct'}
              </p>
              {currentQuestion.explanation ? (
                <p className="quiz-explanation">{currentQuestion.explanation}</p>
              ) : null}
              <button type="button" disabled={submitting} onClick={() => void handleNext()}>
                {submitting
                  ? 'Opslaan…'
                  : questionIndex >= totalActive - 1
                    ? 'Bekijk resultaat'
                    : 'Volgende vraag'}
              </button>
            </div>
          ) : (
            <button
              type="button"
              disabled={selectedOption === null}
              onClick={handleConfirm}
            >
              Bevestig antwoord
            </button>
          )}
        </div>
      ) : null}

      {step === 'result' && resultPercent !== null ? (
        <div className="quiz-panel card quiz-result" key="result">
          <h2 className="section">Resultaat</h2>
          <p className="quiz-score">
            <strong>
              {correctCount}/{questions.length}
            </strong>
            <span className="muted"> ({resultPercent}%)</span>
          </p>
          <p className={`confidence ${confidenceClass}`}>{resultLabel}</p>
          <p className="quiz-feedback">{quizFeedbackForLesson(lessonSlug, resultPercent, moduleSlug || undefined)}</p>

          {lessonCompleted ? (
            <p className="quiz-lesson-complete">✓ Les afgerond</p>
          ) : (
            <p className="muted">
              {resultPercent >= 70
                ? 'Markeer de les als gelezen om af te ronden.'
                : '70% = geslaagd. Markeer ook de les als gelezen.'}
            </p>
          )}

          <div className="quiz-result-actions">
            {wrongCount > 0 ? (
              <button type="button" className="btn-secondary" onClick={handleRetryWrong}>
                Herhaal fout beantwoorde vragen
              </button>
            ) : null}
            {nextLessonId ? (
              <button
                type="button"
                onClick={() => {
                  if (lessonId && userId) clearQuizSession(lessonId, userId);
                  navigate(isAcademyCategory(category) ? lessonPath(category, nextLessonId) : ACADEMY_HOME);
                }}
              >
                Volgende les
              </button>
            ) : (
              <Link
                to={isAcademyCategory(category) ? academyCategoryPath(category) : ACADEMY_HOME}
                className="btn-link"
                onClick={() => {
                  if (lessonId && userId) clearQuizSession(lessonId, userId);
                }}
              >
                Naar overzicht
              </Link>
            )}
          </div>
        </div>
      ) : null}
    </main>
  );
}
