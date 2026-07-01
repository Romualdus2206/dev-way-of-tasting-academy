import React from 'react';
import { Link, useParams } from 'react-router-dom';
import { academyCategoryPath, isAcademyCategory, lessonPath, quizPath } from '../navigation';
import {
  fetchLesson,
  fetchLessonProgress,
  fetchLessonTrackNav,
  type LessonTrackNav,
  markTheoryRead,
} from '../lib/academy';
import { useSession } from '../hooks/useSession';
import type { AcademyLesson, UserLessonProgress } from '@way-of-tasting/academy-shared';
import {
  isLessonWorkflowComplete,
  lessonCompletionRules,
  parseKeyConceptTerms,
  practiceContentRequired,
} from '@way-of-tasting/academy-shared';
import { HighlightedProse } from '../components/HighlightedProse';
import { LessonProgressSteps } from '../components/LessonProgressSteps';
import { PracticeAssignmentCard } from '../components/PracticeAssignmentCard';

function Section({
  title,
  body,
  highlightGlossary = false,
  keyConceptTerms,
}: {
  title: string;
  body: string | null;
  highlightGlossary?: boolean;
  keyConceptTerms?: string[];
}) {
  if (!body?.trim()) return null;
  return (
    <section className="lesson-section">
      <h3>{title}</h3>
      <HighlightedProse
        text={body}
        highlightGlossary={highlightGlossary}
        keyConceptTerms={keyConceptTerms}
      />
    </section>
  );
}

function LessonNavButton({
  direction,
  lessonId,
  category,
  disabled,
}: {
  direction: 'prev' | 'next';
  lessonId: string | null;
  category: string;
  disabled?: boolean;
}) {
  const label = direction === 'prev' ? '← Vorige' : 'Volgende →';
  const className = `btn-lesson lesson-detail-nav-btn ${
    direction === 'next' ? 'btn-lesson-primary' : 'btn-lesson-secondary'
  }${disabled ? ' lesson-detail-nav-btn--disabled' : ''}`;

  if (disabled || !lessonId || !isAcademyCategory(category)) {
    return (
      <span className={className} aria-disabled="true">
        {label}
      </span>
    );
  }

  return (
    <Link to={lessonPath(category, lessonId)} className={className}>
      {label}
    </Link>
  );
}

export function LessonDetailPage() {
  const { lessonId, category } = useParams<{ lessonId: string; category: string }>();
  const { userId } = useSession();
  const [lesson, setLesson] = React.useState<AcademyLesson | null>(null);
  const [trackNav, setTrackNav] = React.useState<LessonTrackNav | null>(null);
  const [progress, setProgress] = React.useState<UserLessonProgress | null>(null);
  const [error, setError] = React.useState<string | null>(null);
  const [saving, setSaving] = React.useState(false);

  React.useEffect(() => {
    if (!lessonId || !userId) return;
    void Promise.all([
      fetchLesson(lessonId),
      fetchLessonProgress(userId, lessonId),
      fetchLessonTrackNav(lessonId),
    ])
      .then(([l, p, nav]) => {
        setLesson(l);
        setProgress(p);
        setTrackNav(nav);
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

  const keyConceptTerms = React.useMemo(
    () => parseKeyConceptTerms(lesson?.key_concepts_markdown),
    [lesson?.key_concepts_markdown]
  );

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
  const glossaryActive = category === 'port';
  const trackOrder = trackNav?.trackOrder ?? null;

  return (
    <main className="lesson-detail lesson-detail--sticky">
      <div className="lesson-detail-sticky">
        <Link to={academyCategoryPath(category)} className="back-link">
          ← Academy
        </Link>
        <h2 className="section lesson-detail-title">
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
        {trackNav && trackNav.trackTotal > 0 ? (
          <p className="lesson-detail-position muted">
            Les {trackNav.trackOrder ?? '?'} van {trackNav.trackTotal}
          </p>
        ) : null}
        <nav className="lesson-detail-nav" aria-label="Les navigatie">
          <LessonNavButton
            direction="prev"
            lessonId={trackNav?.prevLessonId ?? null}
            category={category}
            disabled={!trackNav?.prevLessonId}
          />
          <LessonNavButton
            direction="next"
            lessonId={trackNav?.nextLessonId ?? null}
            category={category}
            disabled={!trackNav?.nextLessonId}
          />
        </nav>
      </div>

      <div className="lesson-detail-body">
        <div className="lesson-content-card card">
          {lesson.learning_objective ? (
            <div className="objective">
              <strong>Leerdoel</strong>
              <HighlightedProse text={lesson.learning_objective} highlightGlossary={glossaryActive} />
            </div>
          ) : null}

          <Section
            title="Theorie"
            body={lesson.theory_markdown}
            highlightGlossary={glossaryActive}
            keyConceptTerms={keyConceptTerms}
          />
          <Section title="Wist je dat?" body={lesson.did_you_know} highlightGlossary={glossaryActive} />
          <Section
            title="Samenvatting"
            body={lesson.summary_markdown}
            highlightGlossary={glossaryActive}
          />
        </div>

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

        <div className={`lesson-actions card${isCertificate ? ' lesson-actions--single' : ''}`}>
          <button
            type="button"
            className={`btn-lesson ${theoryRead ? 'btn-lesson--done' : 'btn-lesson-secondary'}`}
            disabled={saving || theoryRead}
            onClick={() => void handleMarkRead()}
          >
            {theoryRead
              ? '✓ Gelezen'
              : saving
                ? 'Opslaan…'
                : isCertificate
                  ? 'Bevestig certificaat'
                  : 'Markeer als gelezen'}
          </button>
          {!isCertificate ? (
            theoryRead ? (
              <Link to={quizPath(category, lesson.id)} className="btn-lesson btn-lesson-primary">
                Start quiz
              </Link>
            ) : (
              <span className="btn-lesson btn-lesson-primary btn-lesson--disabled" aria-disabled="true">
                Start quiz
              </span>
            )
          ) : null}
        </div>
      </div>
    </main>
  );
}
