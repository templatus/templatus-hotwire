// Live reloading with Ruby on Rails and esbuild
// https://www.colby.so/posts/live-reloading-with-esbuild-and-rails

const path = require('path');
const chokidar = require('chokidar');
const http = require('http');
const rails = require('esbuild-rails');

const clients = [];

http.createServer((req, res) =>
  clients.push(
    res.writeHead(200, {
      "Content-Type": "text/event-stream",
      "Cache-Control": "no-cache",
      "Access-Control-Allow-Origin": "*",
      Connection: "keep-alive",
    }),
  )
).listen(8082);

async function builder() {
  let result = await require("esbuild").build({
    entryPoints: ["application.js"],
    bundle: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: path.join(process.cwd(), "app/javascript"),
    incremental: true,
    plugins: [rails()],
    banner: {
      js: ' (() => new EventSource("http://localhost:8082").onmessage = () => location.reload())();',
    },
  });
  chokidar.watch(
    [
      './app/**/*.html.*',
      './app/**/*.rb',
      './app/components/**/*.js',
      './app/javascript/**/*.js',
      "./app/assets/stylesheets/*.css"
    ]).on('all', (_event, path) => {
      if (path.endsWith(".js")) {
        result.rebuild();
      }
      clients.forEach((res) => res.write('data: update\n\n'));
      clients.length = 0;
    });
}
builder();
