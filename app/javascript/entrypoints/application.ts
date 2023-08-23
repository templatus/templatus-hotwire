import '@hotwired/turbo-rails';
import.meta.glob('../channels/**/*_channel.ts', { eager: true });

import '../utils/setupServiceWorker.ts';
import '../utils/setupHoneybadger.ts';
import '../utils/setupPlausible.ts';
import '../utils/setupStimulus.ts';
