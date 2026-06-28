export type BeverageCategory =
  | 'wine'
  | 'red-wine'
  | 'white-wine'
  | 'rose-wine'
  | 'champagne'
  | 'beer'
  | 'beer-zero'
  | 'port'
  | 'cocktails'
  | 'biodynamic';

export type AcademyTrackConfig = {
  trackSlug: string;
  title: string;
  description: string;
};

export type AppTab = {
  id: string;
  label: string;
  icon: string;
  href: string;
  external?: boolean;
  disabled?: boolean;
};

export type AcademyCategoryGroup = {
  id: string;
  label: string;
  emoji: string;
  tracks: {
    category: BeverageCategory;
    label: string;
    shortLabel: string;
  }[];
};

export const ACADEMY_CATEGORY_GROUPS: AcademyCategoryGroup[] = [
  {
    id: 'wijn',
    label: 'Wijn',
    emoji: '🍷',
    tracks: [
      { category: 'wine', label: 'Wijn Fundamentals', shortLabel: 'Fundamentals' },
      { category: 'red-wine', label: 'Rode wijn', shortLabel: 'Rode wijn' },
      { category: 'white-wine', label: 'Witte wijn', shortLabel: 'Witte wijn' },
      { category: 'rose-wine', label: 'Rosé', shortLabel: 'Rosé' },
    ],
  },
  {
    id: 'mousserend',
    label: 'Mousserend',
    emoji: '🍾',
    tracks: [{ category: 'champagne', label: 'Mousserende wijn', shortLabel: 'Mousserende wijn' }],
  },
  {
    id: 'bier',
    label: 'Bier',
    emoji: '🍺',
    tracks: [
      { category: 'beer', label: 'Bier', shortLabel: 'Bier' },
      { category: 'beer-zero', label: 'Bier 0.0', shortLabel: 'Bier 0.0' },
    ],
  },
  {
    id: 'versterkt',
    label: 'Versterkt',
    emoji: '🍷',
    tracks: [{ category: 'port', label: 'Port', shortLabel: 'Port' }],
  },
  {
    id: 'mixologie',
    label: 'Mixologie',
    emoji: '🍸',
    tracks: [{ category: 'cocktails', label: 'Cocktails', shortLabel: 'Cocktails' }],
  },
  {
    id: 'biodynamisch',
    label: 'Biodynamisch',
    emoji: '🌙',
    tracks: [{ category: 'biodynamic', label: 'Biodynamisch Proeven', shortLabel: 'Kalender' }],
  },
];

const ACADEMY_TRACKS_FLAT: Partial<Record<BeverageCategory, AcademyTrackConfig>> = {
  wine: {
    trackSlug: 'wine-foundation',
    title: 'Wijn Fundamentals',
    description:
      'Van Fundament tot Master — productie, proeven, structuur, druiven, terroir, service en examen.',
  },
  'red-wine': {
    trackSlug: 'red-wine',
    title: 'Rode wijn',
    description:
      'Van Fundament tot Master — productie, proeven, druivenrassen, service, pairing en examen.',
  },
  'white-wine': {
    trackSlug: 'white-wine',
    title: 'Witte wijn',
    description:
      'Van Fundament tot Master — productie, proeven, druivenrassen, service, pairing en examen.',
  },
  'rose-wine': {
    trackSlug: 'rose-wine',
    title: 'Rosé',
    description:
      'Van Fundament tot Master — productie, proeven, stijlen, druiven, service, pairing en examen.',
  },
  champagne: {
    trackSlug: 'sparkling',
    title: 'Mousserende wijn',
    description:
      'Van Fundament tot Master — bubbels, productie, Champagne, stijlen, service en examen.',
  },
  port: {
    trackSlug: 'port',
    title: 'Port',
    description: 'Van Fundament tot Master — productie, proeven, regio\'s, stijlen, service en examen.',
  },
  beer: {
    trackSlug: 'beer',
    title: 'Bier',
    description:
      'Van Fundament tot Master — productie, proeven, stijlen, service, pairing en examen.',
  },
  'beer-zero': {
    trackSlug: 'beer-zero',
    title: 'Bier 0.0',
    description:
      'Van Fundament tot Master — alcoholvrij bier, productie, proeven, stijlen, markt en examen.',
  },
  cocktails: {
    trackSlug: 'cocktails',
    title: 'Cocktails',
    description:
      'Van Fundament tot Master — technieken, ingrediënten, klassiekers, service, pairing en examen.',
  },
  biodynamic: {
    trackSlug: 'biodynamic',
    title: 'Biodynamisch Proeven',
    description:
      'Van Fundament tot Master — kalender, dagtypes, weer, stijlen, voorraad, timing en examen.',
  },
};

export const ACADEMY_TRACKS = ACADEMY_TRACKS_FLAT;

export const ACADEMY_HOME = '/academy';
export const MOMENT_HOME = '/moment';

export const BEVERAGE_CATEGORIES: {
  id: BeverageCategory;
  label: string;
  emoji: string;
  hint: string;
  groupId: string;
}[] = ACADEMY_CATEGORY_GROUPS.flatMap((group) =>
  group.tracks.map((track) => ({
    id: track.category,
    label: track.label,
    emoji: group.emoji,
    groupId: group.id,
    hint: ACADEMY_TRACKS_FLAT[track.category]?.description ?? '',
  }))
);

export function findAcademyCategoryGroup(category: BeverageCategory): AcademyCategoryGroup | undefined {
  return ACADEMY_CATEGORY_GROUPS.find((group) =>
    group.tracks.some((track) => track.category === category)
  );
}

export function academyCategoryPath(category: BeverageCategory): string {
  return `/academy/${category}`;
}

export function lessonPath(category: BeverageCategory, lessonId: string): string {
  return `/academy/${category}/lessons/${lessonId}`;
}

export function quizPath(category: BeverageCategory, lessonId: string): string {
  return `/academy/${category}/lessons/${lessonId}/quiz`;
}

export function isBeverageCategory(value: string | undefined): value is BeverageCategory {
  return BEVERAGE_CATEGORIES.some((c) => c.id === value);
}

export function isAcademyCategory(value: string | undefined): value is BeverageCategory {
  return isBeverageCategory(value) && value in ACADEMY_TRACKS;
}

/** @deprecated gebruik lessonPath(category, id) */
export const LESSON_PATH = '/academy/port/lessons';
