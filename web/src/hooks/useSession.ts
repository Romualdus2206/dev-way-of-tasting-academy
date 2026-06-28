import React from 'react';
import type { Session } from '@supabase/supabase-js';
import { getSupabaseAuth } from '../lib/supabase';

export function useSession() {
  const [session, setSession] = React.useState<Session | null>(null);
  const [loading, setLoading] = React.useState(true);

  React.useEffect(() => {
    const auth = getSupabaseAuth();
    void auth.auth.getSession().then(({ data }) => {
      setSession(data.session);
      setLoading(false);
    });
    const { data: sub } = auth.auth.onAuthStateChange((_e, next) => {
      setSession(next);
      setLoading(false);
    });
    return () => sub.subscription.unsubscribe();
  }, []);

  return { session, loading, userId: session?.user.id ?? null, email: session?.user.email ?? null };
}
