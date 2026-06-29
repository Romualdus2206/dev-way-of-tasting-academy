import type { BeverageCategory } from '../navigation';

/** Kelder profiel-tab → Academy tracks (prioriteit volgorde; fundamentals altijd eerst). */
export const TASTE_TO_ACADEMY: Record<string, BeverageCategory[]> = {
  red_wine: ['wine', 'red-wine'],
  white_wine: ['wine', 'white-wine'],
  rose: ['wine', 'rose-wine'],
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
