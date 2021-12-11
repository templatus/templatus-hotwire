import { createApp } from 'vue';
import { createPinia } from 'pinia';
import { metaContent } from '@/utils/metaContent';
import router from '@/router';
import App from '@/App.vue';
import HoneybadgerVue from '@honeybadger-io/vue';
import { register } from 'register-service-worker';

register('/sw.js', {
  registrationOptions: { scope: './' },
  ready(_registration: ServiceWorkerRegistration) {
    console.log('Service worker is active.');
  },
  registered(_registration: ServiceWorkerRegistration) {
    console.log('Service worker has been registered.');
  },
  cached(_registration: ServiceWorkerRegistration) {
    console.log('Content has been cached for offline use.');
  },
  updatefound(_registration: ServiceWorkerRegistration) {
    console.log('New content is downloading.');
  },
  updated(_registration: ServiceWorkerRegistration) {
    console.log('New content is available; please refresh.');
  },
  offline() {
    console.log(
      'No internet connection found. App is running in offline mode.',
    );
  },
  error(error) {
    console.error('Error during service worker registration:', error);
  },
});

document.addEventListener('DOMContentLoaded', () => {
  const app = createApp(App);

  const honeybadgerApiKey = metaContent('honeybadger-api-key');
  if (honeybadgerApiKey) {
    const gitCommitVersion = metaContent('git-commit-version');

    app.use(HoneybadgerVue, {
      apiKey: honeybadgerApiKey,
      environment: 'production',
      revision: gitCommitVersion,
    });
  }

  app.use(router);
  app.use(createPinia());
  app.mount('#vue-app');
});
