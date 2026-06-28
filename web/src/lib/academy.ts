import type {
  AcademyLesson,
  AcademyModule,
  AcademyQuizQuestion,
  LessonListItem,
  UserLessonProgress,
} from '@way-of-tasting/academy-shared';
import {
  canCompletePractice,
  computeLessonStatus,
  lessonCompletionRules,
  parsePracticeAssignment,
} from '@way-of-tasting/academy-shared';
import { getSupabase } from './supabase';

const PORT_SLUG = 'port';

function mapChecklist(value: unknown): boolean[] {
  if (!Array.isArray(value)) return [];
  return value.map((item) => item === true);
}

function mapProgressRow(row: Record<string, unknown>): UserLessonProgress {
  return {
    user_id: row.user_id as string,
    lesson_id: row.lesson_id as string,
    status: row.status as UserLessonProgress['status'],
    best_quiz_score_percent: (row.best_quiz_score_percent as number | null) ?? null,
    theory_read: row.theory_read === true,
    practice_completed: row.practice_completed === true,
    practice_checklist: mapChecklist(row.practice_checklist),
    practice_reflection: (row.practice_reflection as string | null) ?? null,
    context_bottle_id: (row.context_bottle_id as string | null) ?? null,
    completed_at: (row.completed_at as string | null) ?? null,
    created_at: row.created_at as string,
    updated_at: row.updated_at as string,
  };
}

async function fetchTrackSlugForLesson(lessonId: string): Promise<string | null> {
  const { data, error } = await getSupabase()
    .from('lessons')
    .select('module:modules(track:tracks(slug))')
    .eq('id', lessonId)
    .maybeSingle();

  if (error) throw error;
  const row = data as { module?: { track?: { slug?: string } } } | null;
  return row?.module?.track?.slug ?? null;
}

export async function fetchTrackLessons(
  userId: string,
  trackSlug: string
): Promise<LessonListItem[]> {
  const supabase = getSupabase();

  const { data: track, error: trackErr } = await supabase
    .from('tracks')
    .select('id')
    .eq('slug', trackSlug)
    .maybeSingle();

  if (trackErr) throw trackErr;
  if (!track) return [];

  const { data: modules, error: modErr } = await supabase
    .from('modules')
    .select('id, slug, title, level, sort_order')
    .eq('track_id', track.id)
    .order('sort_order');

  if (modErr) throw modErr;
  if (!modules?.length) return [];

  const moduleMap = new Map(modules.map((m) => [m.id, m as AcademyModule]));
  const moduleIds = modules.map((m) => m.id);

  const { data: lessons, error: lesErr } = await supabase
    .from('lessons')
    .select('*')
    .in('module_id', moduleIds)
    .eq('is_published', true)
    .order('sort_order');

  if (lesErr) throw lesErr;
  if (!lessons?.length) return [];

  const lessonIds = lessons.map((l) => l.id);

  const { data: progressRows, error: progErr } = await supabase
    .from('user_lesson_progress')
    .select('*')
    .eq('user_id', userId)
    .in('lesson_id', lessonIds);

  if (progErr) throw progErr;

  const progressMap = new Map(
    (progressRows ?? []).map((p) => [
      p.lesson_id as string,
      mapProgressRow(p as Record<string, unknown>),
    ])
  );

  const items: LessonListItem[] = (lessons as AcademyLesson[])
    .map((lesson) => {
      const mod = moduleMap.get(lesson.module_id);
      if (!mod) return null;
      return {
        ...lesson,
        module: {
          id: mod.id,
          slug: mod.slug,
          title: mod.title,
          level: mod.level,
          sort_order: mod.sort_order,
        },
        progress: progressMap.get(lesson.id) ?? null,
      };
    })
    .filter((x): x is LessonListItem => x !== null);

  items.sort((a, b) => {
    const modDiff = a.module.sort_order - b.module.sort_order;
    if (modDiff !== 0) return modDiff;
    return a.sort_order - b.sort_order;
  });

  return items.map((item, index) => ({ ...item, track_order: index + 1 }));
}

/** @deprecated gebruik fetchTrackLessons(userId, 'port') */
export async function fetchPortLessons(userId: string): Promise<LessonListItem[]> {
  return fetchTrackLessons(userId, PORT_SLUG);
}

export async function fetchLesson(
  lessonId: string
): Promise<
  (AcademyLesson & { module?: Pick<AcademyModule, 'slug'> & { track?: Pick<{ slug: string }, 'slug'> } }) | null
> {
  const { data, error } = await getSupabase()
    .from('lessons')
    .select('*, module:modules(slug, track:tracks(slug))')
    .eq('id', lessonId)
    .eq('is_published', true)
    .maybeSingle();

  if (error) throw error;
  return (data as AcademyLesson) ?? null;
}

export async function fetchLessonProgress(
  userId: string,
  lessonId: string
): Promise<UserLessonProgress | null> {
  const { data, error } = await getSupabase()
    .from('user_lesson_progress')
    .select('*')
    .eq('user_id', userId)
    .eq('lesson_id', lessonId)
    .maybeSingle();

  if (error) throw error;
  if (!data) return null;
  return mapProgressRow(data as Record<string, unknown>);
}

async function upsertProgress(
  userId: string,
  lessonId: string,
  lesson: AcademyLesson,
  patch: Partial<UserLessonProgress>
): Promise<UserLessonProgress> {
  const existing = await fetchLessonProgress(userId, lessonId);
  const rules = lessonCompletionRules(lesson.slug, lesson.practice_assignment_markdown);

  const merged = {
    theory_read: patch.theory_read ?? existing?.theory_read ?? false,
    practice_completed: patch.practice_completed ?? existing?.practice_completed ?? false,
    best_quiz_score_percent:
      patch.best_quiz_score_percent !== undefined
        ? patch.best_quiz_score_percent
        : (existing?.best_quiz_score_percent ?? null),
    completed_at: patch.completed_at ?? existing?.completed_at ?? null,
  };

  const { status, completed_at } = computeLessonStatus(merged, rules);

  const { data, error } = await getSupabase()
    .from('user_lesson_progress')
    .upsert(
      {
        user_id: userId,
        lesson_id: lessonId,
        theory_read: merged.theory_read,
        practice_completed: merged.practice_completed,
        practice_checklist: patch.practice_checklist ?? existing?.practice_checklist ?? [],
        practice_reflection:
          patch.practice_reflection !== undefined
            ? patch.practice_reflection
            : (existing?.practice_reflection ?? null),
        best_quiz_score_percent: merged.best_quiz_score_percent,
        status,
        completed_at,
      },
      { onConflict: 'user_id,lesson_id' }
    )
    .select('*')
    .single();

  if (error) throw error;
  return mapProgressRow(data as Record<string, unknown>);
}

/** Markeert theorie als gelezen. */
export async function markTheoryRead(
  userId: string,
  lessonId: string
): Promise<UserLessonProgress> {
  const lesson = await fetchLesson(lessonId);
  if (!lesson) throw new Error('Les niet gevonden');
  return upsertProgress(userId, lessonId, lesson, { theory_read: true });
}

export async function savePracticeDraft(
  userId: string,
  lessonId: string,
  draft: { checklist: boolean[]; reflection: string }
): Promise<void> {
  const lesson = await fetchLesson(lessonId);
  if (!lesson) throw new Error('Les niet gevonden');
  const existing = await fetchLessonProgress(userId, lessonId);

  const { error } = await getSupabase().from('user_lesson_progress').upsert(
    {
      user_id: userId,
      lesson_id: lessonId,
      practice_checklist: draft.checklist,
      practice_reflection: draft.reflection || null,
      theory_read: existing?.theory_read ?? false,
      practice_completed: existing?.practice_completed ?? false,
      best_quiz_score_percent: existing?.best_quiz_score_percent ?? null,
      status: existing?.status ?? 'in_progress',
    },
    { onConflict: 'user_id,lesson_id' }
  );

  if (error) throw error;
}

export async function completePracticeAssignment(
  userId: string,
  lessonId: string,
  payload: { checklist: boolean[]; reflection: string }
): Promise<UserLessonProgress> {
  const lesson = await fetchLesson(lessonId);
  if (!lesson) throw new Error('Les niet gevonden');

  const parsed = parsePracticeAssignment(lesson.practice_assignment_markdown);
  const validation = canCompletePractice(parsed, payload.checklist, payload.reflection);
  if (!validation.ok) {
    throw new Error(validation.message);
  }

  return upsertProgress(userId, lessonId, lesson, {
    practice_checklist: payload.checklist,
    practice_reflection: payload.reflection.trim() || null,
    practice_completed: true,
  });
}

/** @deprecated Gebruik markTheoryRead */
export async function markLessonRead(userId: string, lessonId: string): Promise<void> {
  await markTheoryRead(userId, lessonId);
}

export async function fetchQuizQuestions(lessonId: string): Promise<AcademyQuizQuestion[]> {
  const { data, error } = await getSupabase()
    .from('quiz_questions')
    .select('*')
    .eq('lesson_id', lessonId)
    .order('sort_order');

  if (error) throw error;

  return (data ?? []).map((row) => ({
    ...(row as AcademyQuizQuestion),
    options: Array.isArray(row.options) ? (row.options as string[]) : [],
  }));
}

export async function submitQuizAttempt(
  userId: string,
  lessonId: string,
  answers: Record<string, number>,
  scorePercent: number
): Promise<void> {
  const supabase = getSupabase();
  const lesson = await fetchLesson(lessonId);
  if (!lesson) throw new Error('Les niet gevonden');

  const { error: attemptErr } = await supabase.from('user_quiz_attempts').insert({
    user_id: userId,
    lesson_id: lessonId,
    answers,
    score_percent: scorePercent,
  });

  if (attemptErr) throw attemptErr;

  const existing = await fetchLessonProgress(userId, lessonId);
  const best = Math.max(existing?.best_quiz_score_percent ?? 0, scorePercent);

  await upsertProgress(userId, lessonId, lesson, {
    best_quiz_score_percent: best,
    theory_read: existing?.theory_read ?? false,
    practice_completed: existing?.practice_completed ?? false,
    practice_checklist: existing?.practice_checklist,
    practice_reflection: existing?.practice_reflection ?? null,
  });
}

/** Volgende gepubliceerde les in dezelfde track (module + sort_order). */
export async function fetchNextLessonId(currentLessonId: string): Promise<string | null> {
  const supabase = getSupabase();
  const trackSlug = await fetchTrackSlugForLesson(currentLessonId);
  if (!trackSlug) return null;

  const { data: track, error: trackErr } = await supabase
    .from('tracks')
    .select('id')
    .eq('slug', trackSlug)
    .maybeSingle();

  if (trackErr) throw trackErr;
  if (!track) return null;

  const { data: modules, error: modErr } = await supabase
    .from('modules')
    .select('id, sort_order')
    .eq('track_id', track.id)
    .order('sort_order');

  if (modErr) throw modErr;
  if (!modules?.length) return null;

  const moduleIds = modules.map((m) => m.id);
  const moduleOrder = new Map(modules.map((m) => [m.id, m.sort_order]));

  const { data: lessons, error: lesErr } = await supabase
    .from('lessons')
    .select('id, module_id, sort_order')
    .in('module_id', moduleIds)
    .eq('is_published', true)
    .order('sort_order');

  if (lesErr) throw lesErr;
  if (!lessons?.length) return null;

  const ordered = lessons.slice().sort((a, b) => {
    const modDiff =
      (moduleOrder.get(a.module_id) ?? 0) - (moduleOrder.get(b.module_id) ?? 0);
    if (modDiff !== 0) return modDiff;
    return a.sort_order - b.sort_order;
  });

  const idx = ordered.findIndex((l) => l.id === currentLessonId);
  if (idx < 0 || idx >= ordered.length - 1) return null;
  return ordered[idx + 1].id;
}

/** Volgnummer van de les binnen de track (1-based). */
export async function fetchLessonTrackOrder(lessonId: string): Promise<number | null> {
  const supabase = getSupabase();
  const trackSlug = await fetchTrackSlugForLesson(lessonId);
  if (!trackSlug) return null;

  const { data: track, error: trackErr } = await supabase
    .from('tracks')
    .select('id')
    .eq('slug', trackSlug)
    .maybeSingle();

  if (trackErr) throw trackErr;
  if (!track) return null;

  const { data: modules, error: modErr } = await supabase
    .from('modules')
    .select('id, sort_order')
    .eq('track_id', track.id)
    .order('sort_order');

  if (modErr) throw modErr;
  if (!modules?.length) return null;

  const moduleIds = modules.map((m) => m.id);
  const moduleOrder = new Map(modules.map((m) => [m.id, m.sort_order]));

  const { data: lessons, error: lesErr } = await supabase
    .from('lessons')
    .select('id, module_id, sort_order')
    .in('module_id', moduleIds)
    .eq('is_published', true)
    .order('sort_order');

  if (lesErr) throw lesErr;
  if (!lessons?.length) return null;

  const ordered = lessons.slice().sort((a, b) => {
    const modDiff =
      (moduleOrder.get(a.module_id) ?? 0) - (moduleOrder.get(b.module_id) ?? 0);
    if (modDiff !== 0) return modDiff;
    return a.sort_order - b.sort_order;
  });

  const idx = ordered.findIndex((l) => l.id === lessonId);
  return idx >= 0 ? idx + 1 : null;
}
