#!/usr/bin/env node
/**
 * Genereer statische redirect-site naar geïntegreerde kelder-host.
 * Usage: node scripts/generate-kelder-redirect.mjs academy|moment
 */
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const mode = process.argv[2];
if (mode !== 'academy' && mode !== 'moment') {
  console.error('Usage: node scripts/generate-kelder-redirect.mjs academy|moment');
  process.exit(1);
}

const host = (process.env.KELDER_HOST ?? 'https://way-of-tasting.netlify.app').replace(/\/$/, '');
const homePath = mode === 'academy' ? '/academy' : '/moment';
const outDir = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../redirect-static');

fs.mkdirSync(outDir, { recursive: true });

fs.writeFileSync(
  path.join(outDir, 'index.html'),
  `<!DOCTYPE html>
<html lang="nl">
<head>
  <meta charset="utf-8">
  <meta http-equiv="refresh" content="0;url=${host}${homePath}">
  <title>Way of Tasting</title>
</head>
<body>
  <p>Je wordt doorverwezen naar <a href="${host}${homePath}">Way of Tasting</a>.</p>
</body>
</html>
`
);

const redirects = [`/  ${host}${homePath}  301!`, `/*  ${host}/:splat  301!`].join('\n') + '\n';
fs.writeFileSync(path.join(outDir, '_redirects'), redirects);

console.log(`Redirect ${mode} → ${host} (publish: redirect-static/)`);
