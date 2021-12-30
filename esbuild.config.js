const esbuild = require('esbuild');
const rails = require('esbuild-rails');
const path = require('path');

(async () => {
  const result = await esbuild.build({
    entryPoints: ['application.js'],
    bundle: true,
    minify: true,
    metafile: true,
    outdir: path.join(process.cwd(), 'app/assets/builds'),
    absWorkingDir: path.join(process.cwd(), 'app/javascript'),
    plugins: [rails()],
  });

  const text = await esbuild.analyzeMetafile(result.metafile);
  console.log(text);
})();
