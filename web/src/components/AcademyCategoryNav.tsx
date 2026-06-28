import { ACADEMY_CATEGORY_GROUPS, type BeverageCategory } from '../navigation';

type Props = {
  onSelect: (value: BeverageCategory) => void;
};

export function AcademyCategoryNav({ onSelect }: Props) {
  return (
    <nav className="academy-cat-nav" aria-label="Opleidingen">
      <div className="academy-cat-panel card">
        {ACADEMY_CATEGORY_GROUPS.map((group, index) => (
          <section
            key={group.id}
            className="academy-cat-row"
            aria-labelledby={`academy-group-${group.id}`}
          >
            <h3 className="academy-cat-row-label" id={`academy-group-${group.id}`}>
              <span className="academy-cat-row-emoji" aria-hidden="true">
                {group.emoji}
              </span>
              {group.label}
            </h3>
            <div className="academy-cat-chips" role="group" aria-label={group.label}>
              {group.tracks.map((track) => (
                <button
                  key={track.category}
                  type="button"
                  className="academy-cat-chip"
                  aria-label={track.label}
                  title={track.label}
                  onClick={() => onSelect(track.category)}
                >
                  {track.shortLabel}
                </button>
              ))}
            </div>
            {index < ACADEMY_CATEGORY_GROUPS.length - 1 ? (
              <div className="academy-cat-divider" aria-hidden="true" />
            ) : null}
          </section>
        ))}
      </div>
    </nav>
  );
}
