import { getSupabase } from './supabase';

export type AcademyUserProfile = {
  user_id: string;
  display_name: string | null;
  locale: string;
  notifications_enabled: boolean;
};

export async function fetchMyProfile(userId: string): Promise<AcademyUserProfile | null> {
  const { data, error } = await getSupabase()
    .from('user_profiles')
    .select('user_id, display_name, locale, notifications_enabled')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) throw error;
  return (data as AcademyUserProfile) ?? null;
}

export async function saveDisplayName(userId: string, displayName: string): Promise<AcademyUserProfile> {
  const trimmed = displayName.trim();
  const { data, error } = await getSupabase()
    .from('user_profiles')
    .upsert(
      {
        user_id: userId,
        display_name: trimmed || null,
      },
      { onConflict: 'user_id' }
    )
    .select('user_id, display_name, locale, notifications_enabled')
    .single();

  if (error) throw error;
  return data as AcademyUserProfile;
}
