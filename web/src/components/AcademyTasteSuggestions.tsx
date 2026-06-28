import React from 'react';
import { Link } from 'react-router-dom';
import { isIntegratedApp } from '../config';
import {
  fetchAcademyTasteRecommendations,
  type AcademyTasteRecommendation,
} from '../lib/integratedRecommendations';
import { useSession } from '../hooks/useSession';

const TASTE_LABELS: Record<string, string> = {
  red_wine: 'rode wijn',
  white_wine: 'witte wijn',
  rose: 'rosé',
  sparkling: 'mousserend',
  port: 'port',
  beer: 'bier',
};

export function AcademyTasteSuggestions() {
  const { userId } = useSession();
  const [items, setItems] = React.useState<AcademyTasteRecommendation[]>([]);
  const [loading, setLoading] = React.useState(false);

  React.useEffect(() => {
    if (!isIntegratedApp || !userId) {
      setItems([]);
      return;
    }
    setLoading(true);
    void fetchAcademyTasteRecommendations(userId)
      .then(setItems)
      .catch(() => setItems([]))
      .finally(() => setLoading(false));
  }, [userId]);

  if (!isIntegratedApp || loading || !items.length) return null;

  return (
    <section className="card academy-taste-suggestions">
      <h2 className="section">Op basis van jouw smaakprofiel</h2>
      <p className="muted academy-taste-suggestions-intro">
        Tracks die passen bij wat je in je profiel hebt aangegeven —{' '}
        <Link to="/profiel#taste-preferences" className="btn-link">
          smaak bewerken
        </Link>
      </p>
      <ul className="academy-taste-suggestions-list">
        {items.map((item) => (
          <li key={item.category}>
            <Link to={item.href} className="academy-taste-suggestion-link">
              <strong>{item.title}</strong>
              <span className="muted">
                {' '}
                · {item.completed}/{item.total} · past bij{' '}
                {TASTE_LABELS[item.tasteCategory] ?? item.tasteCategory}
              </span>
            </Link>
          </li>
        ))}
      </ul>
    </section>
  );
}
