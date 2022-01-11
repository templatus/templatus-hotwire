#!/usr/bin/env node

// Live reloading with Ruby on Rails and esbuild
// Inspired by:
// https://www.colby.so/posts/live-reloading-with-esbuild-and-rails
// and
// https://gorails.com/episodes/live-reload-esbuild-rails

// Esbuild is configured with 3 modes:
//
// `yarn build` - Build JavaScript (for production) and exit
// `yarn build --watch` - Rebuild JavaScript on change (using esbuild's watch option)
// `yarn build --reload` - Reloads page when views, JavaScript, or stylesheets change (using chokidar and HTTP server)
//
// Sourcemaps are enabled in non-production environments

const esbuild = require('esbuild');
const rails = require('esbuild-rails');
const path = require('path');

const clients = [];
const entryPoints = ['application.js'];
const watchDirectories = [
  './app/**/*.html.*',
  './app/components/**/*.js',
  './app/javascript/**/*.js',
  './app/assets/builds/**/*.css',
];
const config = {
  absWorkingDir: path.join(process.cwd(), 'app/javascript'),
  bundle: true,
  entryPoints,
  outdir: path.join(process.cwd(), 'app/assets/builds'),
  plugins: [rails()],
  sourcemap: process.env.RAILS_ENV != 'production',
};

// Build and watch (by chokidar) with reload (for development)
async function buildAndReload() {
  const chokidar = require('chokidar');
  const http = require('http');

  // Reload uses an HTTP server as an event stream to reload the browser
  http
    .createServer((req, res) =>
      clients.push(
        res.writeHead(200, {
          'Content-Type': 'text/event-stream',
          'Cache-Control': 'no-cache',
          'Access-Control-Allow-Origin': '*',
          Connection: 'keep-alive',
        }),
      ),
    )
    .listen(8082);

  const result = await esbuild.build({
    ...config,
    incremental: true,
    banner: {
      // Use puma-dev proxy so we can use https (=> no mixed content)
      js: ' (() => new EventSource("https://esbuild.templatus-hotwire.test").onmessage = () => location.reload())();',
    },
  });

  chokidar.watch(watchDirectories).on('all', (_event, path) => {
    if (path.endsWith('.js')) {
      result.rebuild();
    }
    clients.forEach((res) => res.write('data: update\n\n'));
    clients.length = 0;
  });
}

// Build and watch using esbuild's watch option
function buildAndWatch() {
  esbuild
    .build({
      ...config,
      watch: {
        onRebuild(error) {
          if (error) console.error('[watch] build failed', error);
          else console.log('[watch] build finished');
        },
      },
    })
    .catch(() => process.exit(1));
}

// Build (for production) and exit
async function build() {
  const result = await esbuild
    .build({
      ...config,
      minify: true,
      metafile: true,
    })
    .catch(() => process.exit(1));

  const text = await esbuild.analyzeMetafile(result.metafile);
  console.log(text);
}

if (process.argv.includes('--watch')) {
  buildAndWatch();
} else if (process.argv.includes('--reload')) {
  buildAndReload();
} else {
  build();
}
