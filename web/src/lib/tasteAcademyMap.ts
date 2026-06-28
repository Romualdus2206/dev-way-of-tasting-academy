import type { BeverageCategory } from '../navigation';

/** Kelder profiel-tab → Academy tracks (prioriteit volgorde). */
export const TASTE_TO_ACADEMY: Record<string, BeverageCategory[]> = {
  red_wine: ['red-wine', 'wine'],
  white_wine: ['white-wine', 'wine'],
  rose: ['rose-wine'],
  sparkling: ['champagne'],
  port: ['port'],
  beer: ['beer', 'beer-zero'],
};

export const ACADEMY_TO_TASTE: Partial<Record<BeverageCategory, string>> = {
  wine: 'white_wine',
  'red-wine': 'red_wine',
  'white-wine': 'white_wine',
  'rose-wine': 'rose',
  champagne: 'sparkling',
  port: 'port',
  beer: 'beer',
  'beer-zero': 'beer',
};

export function tasteCategoryForAcademy(category: BeverageCategory): string | null {
  return ACADEMY_TO_TASTE[category] ?? null;
}

export function academyCategoriesForTaste(tasteCategory: string): BeverageCategory[] {
  return TASTE_TO_ACADEMY[tasteCategory] ?? [];
}
