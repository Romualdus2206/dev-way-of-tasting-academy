import { Link, Navigate, useNavigate, useParams } from 'react-router-dom';
import { AcademyTrackCurriculum } from '../components/AcademyTrackCurriculum';
import { AcademyCategoryNav } from '../components/AcademyCategoryNav';
import { AcademyTasteSuggestions } from '../components/AcademyTasteSuggestions';
import { config, isIntegratedApp } from '../config';
import {
  ACADEMY_HOME,
  ACADEMY_TRACKS,
  BEVERAGE_CATEGORIES,
  isBeverageCategory,
  type BeverageCategory,
} from '../navigation';

function KelderBridge({ category }: { category: BeverageCategory }) {
  const meta = BEVERAGE_CATEGORIES.find((c) => c.id === category)!;

  return (
    <section className="kelder-bridge card">
      <p className="kelder-bridge-emoji" aria-hidden="true">
        {meta.emoji}
      </p>
      <h2 className="section">{meta.label}</h2>
      <p className="muted">{meta.hint}</p>
      <p className="kelder-bridge-copy">
        Je voorraad, wensen en scores voor {meta.label.toLowerCase()} beheer je in de hoofdapp Way
        of tasting.
      </p>
      <a className="btn-kelder" href={`${config.kelderAppUrl}/drank`}>
        Open in Way of tasting
      </a>
    </section>
  );
}

export function DrankPage() {
  const { category: categoryParam } = useParams<{ category?: string }>();
  const navigate = useNavigate();

  if (categoryParam && !isBeverageCategory(categoryParam)) {
    return <Navigate to={ACADEMY_HOME} replace />;
  }

  const category = categoryParam && isBeverageCategory(categoryParam) ? categoryParam : null;

  if (!category) {
    return (
      <div className="drank-page">
        <AcademyTasteSuggestions />
        <AcademyCategoryNav onSelect={(next) => navigate(`/academy/${next}`)} />
        <p className="academy-pick-hint muted">Kies een opleiding om de lessen te starten.</p>
      </div>
    );
  }

  const track = ACADEMY_TRACKS[category];

  return (
    <div className="drank-page drank-page--track">
      <Link to={ACADEMY_HOME} className="back-link academy-back-link">
        ← Alle opleidingen
      </Link>

      {track ? (
        <AcademyTrackCurriculum
          category={category}
          trackSlug={track.trackSlug}
          trackTitle={track.title}
          trackDescription={track.description}
        />
      ) : !isIntegratedApp ? (
        <KelderBridge category={category} />
      ) : null}
    </div>
  );
}
