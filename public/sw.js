self.addEventListener('install', (_event) => {
  // console.log('sw.js: Service worker has been installed.', event);
});

self.addEventListener('activate', (_event) => {
  // console.log('sw.js: Service worker has been activated.', event);
});

self.addEventListener('fetch', (_event) => {
  // console.log('sw.js: Service worker is fetching', event);
});
