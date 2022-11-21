import '@hotwired/turbo-rails';
import.meta.glob('../channels/**/*_channel.js', { eager: true });

import '../utils/setupServiceWorker.js';
import '../utils/setupHoneybadger.js';
import '../utils/setupPlausible.js';
import '../utils/setupStimulus.js';
