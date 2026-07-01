import React from 'react';
import { Link } from 'react-router-dom';
import type { AcademyLevel, LessonListItem } from '@way-of-tasting/academy-shared';
import { lessonCompletionRules } from '@way-of-tasting/academy-shared';
import { isIntegratedApp } from '../config';
import { fetchTrackLessons } from '../lib/academy';
import { tasteCategoryForAcademy } from '../lib/tasteAcademyMap';
import { lessonPath, type BeverageCategory } from '../navigation';
import { useSession } from '../hooks/useSession';
import { LessonProgressPills } from './LessonProgressPills';

const LEVEL_LABEL: Record<AcademyLevel, string> = {
  explorer: 'Explorer',
  specialist: 'Specialist',
  master: 'Master',
};

type ModuleGroup = {
  id: string;
  slug: string;
  title: string;
  level: AcademyLevel;
  sort_order: number;
  lessons: LessonListItem[];
};

type Props = {
  category: BeverageCategory;
  trackSlug: string;
  trackTitle: string;
  trackDescription: string;
};

function statusLabel(
  status: string | undefined,
  theoryRead: boolean,
  practiceDone: boolean,
  tested: boolean,
  quizScore: number | null | undefined
): string {
  if (status === 'completed') return 'Afgerond';
  if (theoryRead && practiceDone && tested) return `Bezig · quiz ${quizScore}%`;
  if (theoryRead && practiceDone) return 'Praktijk klaar';
  if (theoryRead) return 'Gelezen';
  if (tested) return `Quiz · ${quizScore}%`;
  if (status === 'in_progress') return 'Bezig';
  return 'Nog niet gestart';
}

function isMilestoneLesson(slug: string): boolean {
  return /examen|toets|praktijkexamen|theorie-examen|theorie-praktijk/.test(slug);
}

function groupByModule(lessons: LessonListItem[]): ModuleGroup[] {
  const groups: ModuleGroup[] = [];
  for (const lesson of lessons) {
    const last = groups[groups.length - 1];
    if (last?.id === lesson.module.id) {
      last.lessons.push(lesson);
    } else {
      groups.push({
        id: lesson.module.id,
        slug: lesson.module.slug,
        title: lesson.module.title,
        level: lesson.module.level,
        sort_order: lesson.module.sort_order,
        lessons: [lesson],
      });
    }
  }
  return groups;
}

function moduleProgress(lessons: LessonListItem[]): { completed: number; total: number } {
  const completed = lessons.filter((l) => l.progress?.status === 'completed').length;
  return { completed, total: lessons.length };
}

function expandedStorageKey(trackSlug: string): string {
  return `academy-module-expanded:${trackSlug}`;
}

function defaultExpandedModuleIds(groups: ModuleGroup[]): Set<string> {
  const firstIncomplete = groups.findIndex((g) => {
    const { completed, total } = moduleProgress(g.lessons);
    return completed < total;
  });

  if (firstIncomplete === -1) {
    const last = groups[groups.length - 1];
    return last ? new Set([last.id]) : new Set();
  }

  return new Set([groups[firstIncomplete].id]);
}

function loadExpandedModuleIds(trackSlug: string, groups: ModuleGroup[]): Set<string> {
  const validIds = new Set(groups.map((g) => g.id));
  try {
    const raw = sessionStorage.getItem(expandedStorageKey(trackSlug));
    if (raw) {
      const stored = JSON.parse(raw) as string[];
      const expanded = new Set(stored.filter((id) => validIds.has(id)));
      if (expanded.size > 0) return expanded;
    }
  } catch {
    /* ignore */
  }
  return defaultExpandedModuleIds(groups);
}

function saveExpandedModuleIds(trackSlug: string, ids: Set<string>): void {
  sessionStorage.setItem(expandedStorageKey(trackSlug), JSON.stringify([...ids]));
}

export function AcademyTrackCurriculum({
  category,
  trackSlug,
  trackTitle,
  trackDescription,
}: Props) {
  const { userId } = useSession();
  const [lessons, setLessons] = React.useState<LessonListItem[]>([]);
  const [error, setError] = React.useState<string | null>(null);
  const [loading, setLoading] = React.useState(true);

  const moduleGroups = React.useMemo(() => groupByModule(lessons), [lessons]);
  const [expandedModules, setExpandedModules] = React.useState<Set<string>>(() => new Set());
  const groupsInitialized = React.useRef(false);

  React.useEffect(() => {
    groupsInitialized.current = false;
    setExpandedModules(new Set());
    setLessons([]);
    setLoading(true);
  }, [trackSlug]);

  React.useEffect(() => {
    if (!moduleGroups.length || groupsInitialized.current) return;
    setExpandedModules(loadExpandedModuleIds(trackSlug, moduleGroups));
    groupsInitialized.current = true;
  }, [moduleGroups, trackSlug]);

  const toggleModule = React.useCallback(
    (moduleId: string) => {
      setExpandedModules((prev) => {
        const next = new Set(prev);
        if (next.has(moduleId)) next.delete(moduleId);
        else next.add(moduleId);
        saveExpandedModuleIds(trackSlug, next);
        return next;
      });
    },
    [trackSlug]
  );

  React.useEffect(() => {
    if (!userId) return;
    void fetchTrackLessons(userId, trackSlug)
      .then(setLessons)
      .catch((e: Error) => setError(e.message))
      .finally(() => setLoading(false));
  }, [userId, trackSlug]);

  if (loading) {
    return <p className="muted">Lessen laden…</p>;
  }

  const trackProgress = moduleProgress(lessons);

  return (
    <div className="academy-curriculum">
      <div className="academy-track-card card">
        <p className="academy-track-kicker">Way of tasting Academy</p>
        <h2 className="academy-track-title">{trackTitle}</h2>
        <p className="muted academy-track-desc">{trackDescription}</p>
        <p className="academy-track-progress">
          <strong>
            {trackProgress.completed}/{trackProgress.total}
          </strong>
          <span className="muted"> lessen afgerond</span>
        </p>
        {isIntegratedApp && tasteCategoryForAcademy(category) ? (
          <p className="academy-track-taste-link">
            <Link to={`/profiel#taste-${tasteCategoryForAcademy(category)}`}>
              Bekijk jouw smaakprofiel voor {trackTitle.toLowerCase()}
            </Link>
          </p>
        ) : null}
      </div>

      {error ? <p className="err">{error}</p> : null}
      {!lessons.length && !error ? (
        <p className="muted">
          Geen lessen gevonden. Draai seed <code>supabase/seed/academy_{trackSlug}.sql</code>.
        </p>
      ) : null}

      <div className="lesson-modules">
        {moduleGroups.map((group, index) => {
          const showPhase = index === 0 || moduleGroups[index - 1].level !== group.level;
          const progress = moduleProgress(group.lessons);
          const isExpanded = expandedModules.has(group.id);
          const panelId = `module-panel-${group.id}`;

          return (
            <React.Fragment key={group.id}>
              {showPhase ? (
                <p className="phase-label" aria-hidden="true">
                  {LEVEL_LABEL[group.level]}
                </p>
              ) : null}

              <section className={`module-group${isExpanded ? ' module-group--expanded' : ''}`}>
                <button
                  type="button"
                  className="module-header"
                  id={`module-${group.id}`}
                  aria-expanded={isExpanded}
                  aria-controls={panelId}
                  onClick={() => toggleModule(group.id)}
                >
                  <span className="module-chevron" aria-hidden="true" />
                  <span className="module-header-text">
                    <span className="module-title">{group.title}</span>
                    <span className="module-progress muted">
                      {progress.completed}/{progress.total} afgerond
                    </span>
                  </span>
                </button>

                {isExpanded ? (
                  <ul className="lesson-list" id={panelId}>
                    {group.lessons.map((lesson) => {
                      const theoryRead = lesson.progress?.theory_read === true;
                      const practiceDone = lesson.progress?.practice_completed === true;
                      const tested = lesson.progress?.best_quiz_score_percent != null;
                      const quizScore = lesson.progress?.best_quiz_score_percent;
                      const milestone = isMilestoneLesson(lesson.slug);
                      const rules = lessonCompletionRules(
                        lesson.slug,
                        lesson.practice_assignment_markdown
                      );

                      return (
                        <li key={lesson.id}>
                          <Link
                            to={lessonPath(category, lesson.id)}
                            className={`lesson-card${milestone ? ' lesson-card--milestone' : ''}`}
                          >
                            <div className="lesson-card-head">
                              <strong>
                                <span className="lesson-number">Les {lesson.track_order}</span>
                                {lesson.title}
                              </strong>
                              <span
                                className={`status status-${lesson.progress?.status ?? 'not_started'}`}
                              >
                                {statusLabel(
                                  lesson.progress?.status,
                                  theoryRead,
                                  practiceDone,
                                  tested,
                                  quizScore
                                )}
                              </span>
                            </div>
                            <p className="muted lesson-meta">
                              {lesson.duration_minutes ?? '?'} min
                              {milestone ? ' · Examen' : null}
                            </p>
                            <LessonProgressPills
                              progress={lesson.progress}
                              quizRequired={rules.quizRequired}
                              practiceRequired={rules.practiceRequired}
                              className="progress-steps progress-steps--card"
                            />
                          </Link>
                        </li>
                      );
                    })}
                  </ul>
                ) : null}
              </section>
            </React.Fragment>
          );
        })}
      </div>
    </div>
  );
}
