import { glossaryDefinition, glossaryPattern } from '../lib/glossaryTerms';

export function HighlightedProse({ text }: { text: string }) {
  const parts = text.split(glossaryPattern());

  return (
    <div className="prose">
      {parts.map((part, i) => {
        const definition = glossaryDefinition(part);
        if (definition) {
          return (
            <span key={i} className="term-badge" title={definition}>
              {part}
            </span>
          );
        }
        return <span key={i}>{part}</span>;
      })}
    </div>
  );
}
