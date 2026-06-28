import React from 'react';
import { AcademyProfielSections } from '../components/AcademyProfielSections';
import { fetchAcademyTrackProgress } from '../lib/academyProfiel';
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
    Awaited<ReturnType<typeof fetchAcademyTrackProgress>>
  >([]);
  const [tracksLoading, setTracksLoading] = React.useState(true);
  const [tracksLoaded, setTracksLoaded] = React.useState(false);
  const [saving, setSaving] = React.useState(false);
  const [error, setError] = React.useState<string | null>(null);
  const [info, setInfo] = React.useState<string | null>(null);

  React.useEffect(() => {
    if (!userId) return;
    setTracksLoading(true);
    setTracksLoaded(false);
    void Promise.all([fetchMyProfile(userId), fetchAcademyTrackProgress(userId)])
      .then(([profile, tracks]) => {
        setDisplayName(profile?.display_name ?? '');
        setTrackProgress(tracks);
      })
      .catch((e: Error) => setError(e.message))
      .finally(() => {
        setTracksLoading(false);
        setTracksLoaded(true);
      });
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

  if (tracksLoading && !tracksLoaded) {
    return <p className="muted">Profiel laden…</p>;
  }

  const greetingName = displayName.trim() || displayNameFromEmail(email);

  return (
    <div className="profiel-page">
      <AcademyProfielSections
        greetingName={greetingName}
        trackProgress={trackProgress}
        tracksLoading={tracksLoading}
        tracksLoaded={tracksLoaded}
        displayName={displayName}
        onDisplayNameChange={setDisplayName}
        onSaveName={handleSaveName}
        savingName={saving}
        namePlaceholder={displayNameFromEmail(email)}
        info={info}
        error={error}
      />

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
