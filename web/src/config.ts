import { APP_VERSION } from '@way-of-tasting/academy-shared';

export const config = {
  appVersion: APP_VERSION,
  supabaseUrl: import.meta.env.VITE_SUPABASE_URL as string,
  supabaseAnonKey: import.meta.env.VITE_SUPABASE_ANON_KEY as string,
  kelderAppUrl: import.meta.env.VITE_KELDER_APP_URL ?? 'https://way-of-tasting.netlify.app',
  momentAppUrl: import.meta.env.VITE_MOMENT_APP_URL ?? 'http://localhost:5175',
};

/** True when Academy UI is embedded in the kelder app (same origin). */
export const isIntegratedApp = import.meta.env.VITE_INTEGRATED === 'true';
