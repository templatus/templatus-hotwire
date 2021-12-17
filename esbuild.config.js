const esbuild = require('esbuild');
const rails = require('esbuild-rails');
const path = require('path');

esbuild.build({
  entryPoints: ["application.js"],
  bundle: true,
  minify: true,
  outdir: path.join(process.cwd(), "app/assets/builds"),
  absWorkingDir: path.join(process.cwd(), "app/javascript"),
  plugins: [rails()],
}).catch(() => process.exit(1));
