import '@hotwired/turbo-rails';
import.meta.globEager('../channels/**/*_channel.js');

import '../utils/setupServiceWorker.js';
import '../utils/setupHoneybadger.js';
import '../utils/setupPlausible.js';
import '../utils/setupStimulus.js';
