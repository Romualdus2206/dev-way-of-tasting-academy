import { readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const expected = JSON.parse(readFileSync(join(root, 'version.json'), 'utf8')).appVersion as string;

const checks: { label: string; ok: boolean }[] = [];

function readJson(path: string) {
  return JSON.parse(readFileSync(join(root, path), 'utf8')) as { version?: string };
}

const shared = readJson('packages/academy-shared/package.json');
const web = readJson('web/package.json');

checks.push({ label: 'packages/academy-shared/package.json', ok: shared.version === expected });
checks.push({ label: 'web/package.json', ok: web.version === expected });

let failed = false;
for (const c of checks) {
  const mark = c.ok ? '✓' : '✗';
  console.log(`${mark} ${c.label}`);
  if (!c.ok) failed = true;
}

if (failed) {
  console.error(`\nVersie mismatch — verwacht ${expected} overal`);
  process.exit(1);
}

console.log(`\nAlle checks OK — appVersion ${expected}`);
