import React from 'react';
import { fetchTrackLessons } from '../lib/academy';
import { ACADEMY_TRACKS, academyCategoryPath, type BeverageCategory } from '../navigation';
import { fetchMyProfile, saveDisplayName } from '../lib/profile';
import { getSupabaseAuth } from '../lib/supabase';
import { config } from '../config';
import { useSession } from '../hooks/useSession';

function displayNameFromEmail(email: string | null | undefined): string {
  if (!email) return 'Proever';
  return email.split('@')[0] ?? 'Proever';
}

export function ProfielPage() {
  const { userId, email } = useSession();
  const [displayName, setDisplayName] = React.useState('');
  const [trackProgress, setTrackProgress] = React.useState<
    { title: string; completed: number; total: number; href: string }[]
  >([]);
  const [loading, setLoading] = React.useState(true);
  const [saving, setSaving] = React.useState(false);
  const [error, setError] = React.useState<string | null>(null);
  const [info, setInfo] = React.useState<string | null>(null);

  React.useEffect(() => {
    if (!userId) return;
    void Promise.all([
      fetchMyProfile(userId),
      ...Object.entries(ACADEMY_TRACKS).map(async ([category, track]) => {
        const lessons = await fetchTrackLessons(userId, track.trackSlug);
        return {
          title: track.title,
          completed: lessons.filter((l) => l.progress?.status === 'completed').length,
          total: lessons.length,
          href: academyCategoryPath(category as BeverageCategory),
        };
      }),
    ])
      .then(([profile, ...tracks]) => {
        setDisplayName(profile?.display_name ?? '');
        setTrackProgress(tracks);
      })
      .catch((e: Error) => setError(e.message))
      .finally(() => setLoading(false));
  }, [userId]);

  async function handleSaveName(e: React.FormEvent) {
    e.preventDefault();
    if (!userId) return;
    setSaving(true);
    setError(null);
    setInfo(null);
    try {
      await saveDisplayName(userId, displayName);
      setInfo('Naam opgeslagen.');
    } catch (e) {
      setError(e instanceof Error ? e.message : 'Opslaan mislukt');
    } finally {
      setSaving(false);
    }
  }

  async function logout() {
    await getSupabaseAuth().auth.signOut();
  }

  if (loading) {
    return <p className="muted">Profiel laden…</p>;
  }

  const greetingName = displayName.trim() || displayNameFromEmail(email);

  return (
    <div className="profiel-page">
      <section className="card profiel-hero">
        <p className="profiel-greeting">Hoi {greetingName}</p>
        <p className="muted">Academy-account · zelfde login als Way of tasting</p>
      </section>

      <section className="card">
        <h2 className="section">Academy-voortgang</h2>
        {trackProgress.map((track) => (
          <p key={track.title} className="profiel-stat">
            <strong>
              {track.completed}/{track.total}
            </strong>
            <span className="muted">
              {' '}
              · {track.title} —{' '}
              <a href={track.href} className="profiel-track-link">
                bekijk track
              </a>
            </span>
          </p>
        ))}
      </section>

      <section className="card">
        <h2 className="section">Weergavenaam</h2>
        <p className="muted">Wordt gebruikt in de Academy (los van kelder-profiel).</p>
        <form onSubmit={(e) => void handleSaveName(e)} className="form profiel-form">
          <label>
            Naam
            <input
              type="text"
              value={displayName}
              onChange={(e) => setDisplayName(e.target.value)}
              placeholder={displayNameFromEmail(email)}
              maxLength={80}
            />
          </label>
          <button type="submit" disabled={saving}>
            {saving ? 'Opslaan…' : 'Naam opslaan'}
          </button>
        </form>
        {info ? <p className="profiel-info">{info}</p> : null}
        {error ? <p className="err">{error}</p> : null}
      </section>

      <section className="card">
        <h2 className="section">Account</h2>
        <p className="muted">{email ?? '—'}</p>
        <p className="muted profiel-hint">
          Smaakvoorkeuren, huishouden en kelder-instellingen beheer je in de hoofdapp.
        </p>
        <a className="btn-secondary profiel-kelder-link" href={`${config.kelderAppUrl}/profiel`}>
          Open kelder-profiel
        </a>
        <button type="button" className="btn-logout" onClick={() => void logout()}>
          Uitloggen
        </button>
      </section>
    </div>
  );
}
