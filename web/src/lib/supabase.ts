import { createClient } from '@supabase/supabase-js';
import { config } from '../config';

export function getSupabase() {
  if (!config.supabaseUrl || !config.supabaseAnonKey) {
    throw new Error('VITE_SUPABASE_URL en VITE_SUPABASE_ANON_KEY ontbreken in web/.env');
  }
  return createClient(config.supabaseUrl, config.supabaseAnonKey, {
    db: { schema: 'academy' },
  });
}

/** Auth + public schema (auth.users) — aparte client zonder academy schema. */
export function getSupabaseAuth() {
  if (!config.supabaseUrl || !config.supabaseAnonKey) {
    throw new Error('VITE_SUPABASE_URL en VITE_SUPABASE_ANON_KEY ontbreken in web/.env');
  }
  return createClient(config.supabaseUrl, config.supabaseAnonKey);
}
