import React from 'react';
import { Link, useParams } from 'react-router-dom';
import { academyCategoryPath, isAcademyCategory, quizPath } from '../navigation';
import { isIntegratedApp } from '../config';
import {
  fetchLesson,
  fetchLessonProgress,
  fetchLessonTrackOrder,
  markTheoryRead,
} from '../lib/academy';
import { useSession } from '../hooks/useSession';
import type { AcademyLesson, UserLessonProgress } from '@way-of-tasting/academy-shared';
import {
  isLessonWorkflowComplete,
  lessonCompletionRules,
  practiceContentRequired,
} from '@way-of-tasting/academy-shared';
import { HighlightedProse } from '../components/HighlightedProse';
import { LessonProgressSteps } from '../components/LessonProgressSteps';
import { PracticeAssignmentCard } from '../components/PracticeAssignmentCard';

function Section({ title, body }: { title: string; body: string | null }) {
  if (!body?.trim()) return null;
  return (
    <section className="lesson-section">
      <h3>{title}</h3>
      <HighlightedProse text={body} />
    </section>
  );
}

export function LessonDetailPage() {
  const { lessonId, category } = useParams<{ lessonId: string; category: string }>();
  const { userId } = useSession();
  const [lesson, setLesson] = React.useState<AcademyLesson | null>(null);
  const [trackOrder, setTrackOrder] = React.useState<number | null>(null);
  const [progress, setProgress] = React.useState<UserLessonProgress | null>(null);
  const [error, setError] = React.useState<string | null>(null);
  const [saving, setSaving] = React.useState(false);

  React.useEffect(() => {
    if (!lessonId || !userId) return;
    void Promise.all([
      fetchLesson(lessonId),
      fetchLessonProgress(userId, lessonId),
      fetchLessonTrackOrder(lessonId),
    ])
      .then(([l, p, order]) => {
        setLesson(l);
        setProgress(p);
        setTrackOrder(order);
        if (!l) setError('Les niet gevonden.');
      })
      .catch((e: Error) => setError(e.message));
  }, [lessonId, userId]);

  async function handleMarkRead() {
    if (!userId || !lessonId || !lesson) return;
    setSaving(true);
    setError(null);
    try {
      const updated = await markTheoryRead(userId, lessonId);
      setProgress(updated);
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Opslaan mislukt');
    } finally {
      setSaving(false);
    }
  }

  if (!lesson && !error) {
    return <p className="muted">Les laden…</p>;
  }

  if (!lesson || !userId || !lessonId || !isAcademyCategory(category)) {
    return (
      <main>
        <p className="err">{error ?? 'Les niet gevonden.'}</p>
        <Link to={academyCategoryPath('port')}>← Terug</Link>
      </main>
    );
  }

  const rules = lessonCompletionRules(lesson.slug, lesson.practice_assignment_markdown);
  const theoryRead = progress?.theory_read === true;
  const isCertificate = lesson.slug === 'explorer-certificaat';
  const hasPractice =
    !isCertificate && practiceContentRequired(lesson.practice_assignment_markdown);
  const lessonComplete = isLessonWorkflowComplete(progress, rules);

  return (
    <main className="lesson-detail">
      <Link to={academyCategoryPath(category)} className="back-link">
        ← Academy
      </Link>
      <h2 className="section">
        {trackOrder != null ? (
          <span className="lesson-number">Les {trackOrder} · </span>
        ) : null}
        {lesson.title}
      </h2>
      <LessonProgressSteps
        progress={progress}
        quizRequired={rules.quizRequired}
        practiceRequired={rules.practiceRequired}
      />
      {lesson.learning_objective ? (
        <div className="objective">
          <strong>Leerdoel:</strong> <HighlightedProse text={lesson.learning_objective} />
        </div>
      ) : null}

      <Section title="Theorie" body={lesson.theory_markdown} />
      <Section title="Kernbegrippen" body={lesson.key_concepts_markdown} />
      <Section title="Wist je dat?" body={lesson.did_you_know} />
      <Section title="Samenvatting" body={lesson.summary_markdown} />

      {hasPractice ? (
        <PracticeAssignmentCard
          lessonId={lessonId}
          userId={userId}
          markdown={lesson.practice_assignment_markdown}
          progress={progress}
          onProgressChange={setProgress}
        />
      ) : null}

      {isCertificate && lessonComplete ? (
        <p className="quiz-lesson-complete">🏅 Explorer Certificaat behaald</p>
      ) : null}

      {error ? <p className="err">{error}</p> : null}

      {isIntegratedApp && category === 'biodynamic' ? (
        <p className="cross-app-links">
          <Link
            to={`/moment?date=${new Date().toISOString().slice(0, 10)}`}
            className="btn-link"
          >
            🌙 Open kalender vandaag
          </Link>
        </p>
      ) : null}

      <div className="actions">
        <button type="button" disabled={saving || theoryRead} onClick={() => void handleMarkRead()}>
          {theoryRead
            ? '📖 Gelezen'
            : saving
              ? 'Opslaan…'
              : isCertificate
                ? 'Bevestig certificaat'
                : 'Markeer als gelezen'}
        </button>
        {!isCertificate ? (
          <Link to={quizPath(category, lesson.id)} className="btn-link btn-start-quiz">
            Start quiz
          </Link>
        ) : null}
      </div>
    </main>
  );
}
