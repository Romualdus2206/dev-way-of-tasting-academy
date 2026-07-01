import React from 'react';
import {
  findNextKeyConceptIntroduction,
  normalizeKeyConceptTerm,
} from '@way-of-tasting/academy-shared';
import { glossaryDefinition, glossaryPattern } from '../lib/glossaryTerms';

type ProseBlock =
  | { type: 'paragraph'; lines: string[] }
  | { type: 'list'; items: string[] };

type InlinePart = { kind: 'text'; value: string } | { kind: 'bold'; value: string };

function parseProseBlocks(text: string): ProseBlock[] {
  const blocks: ProseBlock[] = [];
  const chunks = text.trim().split(/\n\s*\n/);

  for (const chunk of chunks) {
    const lines = chunk
      .split('\n')
      .map((line) => line.trim())
      .filter(Boolean);
    if (!lines.length) continue;

    if (lines.every((line) => line.startsWith('- '))) {
      blocks.push({ type: 'list', items: lines.map((line) => line.slice(2).trim()) });
      continue;
    }

    let paragraph: string[] = [];
    let list: string[] = [];

    const flush = () => {
      if (paragraph.length) {
        blocks.push({ type: 'paragraph', lines: paragraph });
        paragraph = [];
      }
      if (list.length) {
        blocks.push({ type: 'list', items: list });
        list = [];
      }
    };

    for (const line of lines) {
      if (line.startsWith('- ')) {
        if (paragraph.length) flush();
        list.push(line.slice(2).trim());
      } else {
        if (list.length) flush();
        paragraph.push(line);
      }
    }
    flush();
  }

  return blocks;
}

function parseBoldParts(line: string): InlinePart[] {
  const parts: InlinePart[] = [];
  const re = /\*\*(.+?)\*\*/g;
  let last = 0;
  let match: RegExpExecArray | null;

  while ((match = re.exec(line))) {
    if (match.index > last) {
      parts.push({ kind: 'text', value: line.slice(last, match.index) });
    }
    parts.push({ kind: 'bold', value: match[1] });
    last = match.index + match[0].length;
  }

  if (last < line.length) {
    parts.push({ kind: 'text', value: line.slice(last) });
  }

  return parts.length ? parts : [{ kind: 'text', value: line }];
}

function renderGlossaryText(text: string, highlightGlossary: boolean, keyPrefix: string) {
  if (!highlightGlossary) {
    return [<span key={keyPrefix}>{text}</span>];
  }

  const parts = text.split(glossaryPattern());
  return parts.map((part, i) => {
    const definition = glossaryDefinition(part);
    if (definition) {
      return (
        <span key={`${keyPrefix}-${i}`} className="term-badge" title={definition}>
          {part}
        </span>
      );
    }
    return <span key={`${keyPrefix}-${i}`}>{part}</span>;
  });
}

function renderPlainSegment(
  segment: string,
  highlightGlossary: boolean,
  keyConceptTerms: string[],
  introduced: Set<string>,
  keyPrefix: string
): React.ReactNode[] {
  if (!segment) return [];

  const nodes: React.ReactNode[] = [];
  let cursor = 0;
  let partIdx = 0;

  while (cursor < segment.length) {
    const nextIntro = findNextKeyConceptIntroduction(
      segment.slice(cursor),
      keyConceptTerms,
      introduced
    );

    if (nextIntro) {
      if (nextIntro.index > 0) {
        nodes.push(
          ...renderGlossaryText(
            segment.slice(cursor, cursor + nextIntro.index),
            highlightGlossary,
            `${keyPrefix}-g-${partIdx++}`
          )
        );
      }

      nodes.push(
        <strong key={`${keyPrefix}-intro-${partIdx++}`} className="term-intro">
          {segment.slice(cursor + nextIntro.index, cursor + nextIntro.index + nextIntro.length)}
        </strong>
      );
      introduced.add(normalizeKeyConceptTerm(nextIntro.term));
      cursor += nextIntro.index + nextIntro.length;
      continue;
    }

    nodes.push(
      ...renderGlossaryText(segment.slice(cursor), highlightGlossary, `${keyPrefix}-g-${partIdx++}`)
    );
    break;
  }

  return nodes;
}

function renderInlineLine(
  line: string,
  highlightGlossary: boolean,
  keyConceptTerms: string[],
  introduced: Set<string>,
  keyPrefix: string
): React.ReactNode[] {
  const parts = parseBoldParts(line);
  const nodes: React.ReactNode[] = [];

  for (const [partIndex, part] of parts.entries()) {
    const prefix = `${keyPrefix}-p-${partIndex}`;
    if (part.kind === 'bold') {
      nodes.push(<strong key={prefix}>{part.value}</strong>);
      continue;
    }
    nodes.push(
      ...renderPlainSegment(
        part.value,
        highlightGlossary,
        keyConceptTerms,
        introduced,
        prefix
      )
    );
  }

  return nodes;
}

export function HighlightedProse({
  text,
  highlightGlossary = false,
  keyConceptTerms = [],
}: {
  text: string;
  highlightGlossary?: boolean;
  keyConceptTerms?: string[];
}) {
  const blocks = parseProseBlocks(text);
  const sortedConceptTerms = React.useMemo(
    () => [...keyConceptTerms].sort((a, b) => b.length - a.length),
    [keyConceptTerms]
  );
  const introduced = new Set<string>();

  return (
    <div className="prose">
      {blocks.map((block, blockIndex) => {
        if (block.type === 'list') {
          return (
            <ul key={`list-${blockIndex}`} className="prose-bullets">
              {block.items.map((item, itemIndex) => (
                <li key={`item-${blockIndex}-${itemIndex}`}>
                  {renderInlineLine(
                    item,
                    highlightGlossary,
                    sortedConceptTerms,
                    introduced,
                    `li-${blockIndex}-${itemIndex}`
                  )}
                </li>
              ))}
            </ul>
          );
        }

        return (
          <div key={`para-${blockIndex}`} className="prose-lines">
            {block.lines.map((line, lineIndex) => (
              <p key={`line-${blockIndex}-${lineIndex}`}>
                {renderInlineLine(
                  line,
                  highlightGlossary,
                  sortedConceptTerms,
                  introduced,
                  `p-${blockIndex}-${lineIndex}`
                )}
              </p>
            ))}
          </div>
        );
      })}
    </div>
  );
}
