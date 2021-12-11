const esbuild = require('esbuild');
const rails = require('esbuild-rails');
const pluginVue = require('esbuild-plugin-vue3');
const path = require('path');

(async () => {
  const result = await esbuild.build({
    entryPoints: ["application.ts"],
    bundle: true,
    minify: true,
    metafile: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: path.join(process.cwd(), "app/javascript"),
    plugins: [rails(), pluginVue()],
    loader: {
      ".svg": "file"
    },
    publicPath: '/assets/',
  });

  const text = await esbuild.analyzeMetafile(result.metafile);
  console.log(text);
})();
