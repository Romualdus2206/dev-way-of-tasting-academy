import { isIntegratedApp } from '../config';
import { getSupabaseAuth } from './supabase';

export type IntegratedTasteCategoryPref = {
  axes?: Record<string, number | null | undefined>;
  notes?: string | null;
};

export type IntegratedTasteProfile = {
  v?: number;
  byCategory?: Record<string, IntegratedTasteCategoryPref>;
};

export async function fetchIntegratedTasteProfile(
  userId: string
): Promise<IntegratedTasteProfile | null> {
  if (!isIntegratedApp || !userId) return null;

  const { data, error } = await getSupabaseAuth()
    .from('user_taste_profiles')
    .select('taste_axes')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) {
    if (error.message.includes('user_taste_profiles')) return null;
    throw error;
  }

  const raw = data?.taste_axes;
  if (!raw || typeof raw !== 'object') return null;
  return raw as IntegratedTasteProfile;
}

export function hasIntegratedTasteCategory(
  profile: IntegratedTasteProfile | null | undefined,
  tasteCategory: string
): boolean {
  const pref = profile?.byCategory?.[tasteCategory];
  if (!pref) return false;
  if (pref.notes?.trim()) return true;
  const axes = pref.axes;
  if (!axes) return false;
  return Object.values(axes).some((v) => typeof v === 'number' && Number.isFinite(v));
}
