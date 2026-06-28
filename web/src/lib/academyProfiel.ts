import { fetchTrackLessons } from './academy';
import {
  ACADEMY_TRACKS,
  academyCategoryPath,
  type BeverageCategory,
} from '../navigation';

export type AcademyTrackProgress = {
  title: string;
  completed: number;
  total: number;
  href: string;
};

const TRACK_ENTRIES = Object.entries(ACADEMY_TRACKS) as [
  BeverageCategory,
  (typeof ACADEMY_TRACKS)[BeverageCategory],
][];

async function fetchTrackProgress(
  userId: string,
  category: BeverageCategory,
  track: (typeof ACADEMY_TRACKS)[BeverageCategory]
): Promise<AcademyTrackProgress | null> {
  if (!track) {
    return { title: '', completed: 0, total: 0, href: academyCategoryPath(category) };
  }
  const lessons = await fetchTrackLessons(userId, track.trackSlug);
  return {
    title: track.title,
    completed: lessons.filter((l) => l.progress?.status === 'completed').length,
    total: lessons.length,
    href: academyCategoryPath(category),
  };
}

/** Max. 3 tracks tegelijk — voorkomt tientallen parallelle Supabase-calls. */
export async function fetchAcademyTrackProgress(userId: string): Promise<AcademyTrackProgress[]> {
  const out: AcademyTrackProgress[] = [];
  const batchSize = 3;

  for (let i = 0; i < TRACK_ENTRIES.length; i += batchSize) {
    const batch = TRACK_ENTRIES.slice(i, i + batchSize);
    const settled = await Promise.allSettled(
      batch.map(([category, track]) => fetchTrackProgress(userId, category, track))
    );
    for (const result of settled) {
      if (result.status === 'fulfilled' && result.value?.title) {
        out.push(result.value);
      }
    }
  }

  return out;
}
