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

export async function fetchAcademyTrackProgress(userId: string): Promise<AcademyTrackProgress[]> {
  const trackEntries = Object.entries(ACADEMY_TRACKS) as [
    BeverageCategory,
    (typeof ACADEMY_TRACKS)[BeverageCategory],
  ][];

  const tracks = await Promise.all(
    trackEntries.map(async ([category, track]) => {
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
    })
  );

  return tracks.filter((t) => t.title);
}
