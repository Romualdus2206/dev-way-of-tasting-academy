import React from 'react';
import { Link } from 'react-router-dom';
import { ACADEMY_HOME } from '../navigation';
import type { AcademyTrackProgress } from '../lib/academyProfiel';

export type AcademyProfielSectionsProps = {
  greetingName: string;
  trackProgress: AcademyTrackProgress[];
  tracksLoading: boolean;
  tracksLoaded: boolean;
  displayName: string;
  onDisplayNameChange: (value: string) => void;
  onSaveName: (e: React.FormEvent) => void | Promise<void>;
  savingName: boolean;
  namePlaceholder?: string;
  info?: string | null;
  error?: string | null;
};

/** Gedeelde Academy-profiel UI — kelder + standalone Academy. */
export function AcademyProfielSections({
  greetingName,
  trackProgress,
  tracksLoading,
  tracksLoaded,
  displayName,
  onDisplayNameChange,
  onSaveName,
  savingName,
  namePlaceholder,
  info,
  error,
}: AcademyProfielSectionsProps) {
  return (
    <>
      <section className="card profiel-hero">
        <p className="profiel-greeting">Hoi {greetingName}</p>
        <p className="muted">Academy-account · zelfde login als Way of tasting</p>
      </section>

      <section className="card">
        <h2 className="section">Academy-voortgang</h2>
        {trackProgress.length ? (
          trackProgress.map((track) => (
            <p key={track.title} className="profiel-stat">
              <strong>
                {track.completed}/{track.total}
              </strong>
              <span className="muted">
                {' '}
                · {track.title} —{' '}
                <Link to={track.href} className="profiel-track-link">
                  bekijk track
                </Link>
              </span>
            </p>
          ))
        ) : tracksLoaded && !tracksLoading ? (
          <p className="profile-hint profile-hint-first">
            Voortgang laden mislukt of nog geen tracks.{' '}
            <Link to={ACADEMY_HOME} className="profiel-track-link">
              Start in Academy
            </Link>
          </p>
        ) : (
          <p className="muted">{tracksLoading ? 'Academy-voortgang laden…' : null}</p>
        )}
      </section>

      <section className="card">
        <h2 className="section">Weergavenaam</h2>
        <p className="muted">Wordt gebruikt in de Academy (los van kelder-profiel).</p>
        <form onSubmit={(e) => void onSaveName(e)} className="form profiel-form">
          <label>
            Naam
            <input
              type="text"
              value={displayName}
              onChange={(e) => onDisplayNameChange(e.target.value)}
              placeholder={namePlaceholder}
              maxLength={80}
            />
          </label>
          <button type="submit" disabled={savingName}>
            {savingName ? 'Opslaan…' : 'Naam opslaan'}
          </button>
        </form>
        {info ? <p className="profiel-info">{info}</p> : null}
        {error ? <p className="err">{error}</p> : null}
      </section>
    </>
  );
}
