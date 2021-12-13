const esbuild = require('esbuild');
const rails = require('esbuild-rails');
const gzip = require('@luncheon/esbuild-plugin-gzip');
const path = require('path');

esbuild.build({
  entryPoints: ["application.js"],
  bundle: true,
  sourcemap: true,
  minify: true,
  write: false, // write must be false for gzip() to work
  outdir: path.join(process.cwd(), "app/assets/builds"),
  absWorkingDir: path.join(process.cwd(), "app/javascript"),
  watch: process.argv.includes("--watch"),
  plugins: [gzip(), rails()],
}).catch(() => process.exit(1));
