import { fetchTrackLessons } from './academy';
import {
  fetchIntegratedTasteProfile,
  hasIntegratedTasteCategory,
  type IntegratedTasteProfile,
} from './integratedTaste';
import { academyCategoriesForTaste } from './tasteAcademyMap';
import {
  ACADEMY_TRACKS,
  academyCategoryPath,
  type BeverageCategory,
} from '../navigation';

export type AcademyTasteRecommendation = {
  category: BeverageCategory;
  title: string;
  href: string;
  completed: number;
  total: number;
  tasteCategory: string;
  reason: 'taste_match' | 'in_progress';
};

async function trackProgress(
  userId: string,
  category: BeverageCategory
): Promise<{ completed: number; total: number; title: string } | null> {
  const track = ACADEMY_TRACKS[category];
  if (!track) return null;
  const lessons = await fetchTrackLessons(userId, track.trackSlug);
  if (!lessons.length) return null;
  return {
    title: track.title,
    completed: lessons.filter((l) => l.progress?.status === 'completed').length,
    total: lessons.length,
  };
}

function tasteCategoriesWithData(profile: IntegratedTasteProfile): string[] {
  const cats = profile.byCategory ? Object.keys(profile.byCategory) : [];
  return cats.filter((cat) => hasIntegratedTasteCategory(profile, cat));
}

export async function fetchAcademyTasteRecommendations(
  userId: string,
  limit = 4
): Promise<AcademyTasteRecommendation[]> {
  const taste = await fetchIntegratedTasteProfile(userId);
  if (!taste) return [];

  const tasteCats = tasteCategoriesWithData(taste);
  if (!tasteCats.length) return [];

  const seen = new Set<BeverageCategory>();
  const items: AcademyTasteRecommendation[] = [];

  for (const tasteCat of tasteCats) {
    for (const category of academyCategoriesForTaste(tasteCat)) {
      if (seen.has(category)) continue;
      seen.add(category);

      const progress = await trackProgress(userId, category);
      if (!progress || progress.completed >= progress.total) continue;

      items.push({
        category,
        title: progress.title,
        href: academyCategoryPath(category),
        completed: progress.completed,
        total: progress.total,
        tasteCategory: tasteCat,
        reason: progress.completed > 0 ? 'in_progress' : 'taste_match',
      });
    }
  }

  items.sort((a, b) => {
    if (a.reason === 'in_progress' && b.reason !== 'in_progress') return -1;
    if (b.reason === 'in_progress' && a.reason !== 'in_progress') return 1;
    const aRatio = a.total ? a.completed / a.total : 0;
    const bRatio = b.total ? b.completed / b.total : 0;
    return aRatio - bRatio;
  });

  return items.slice(0, limit);
}
