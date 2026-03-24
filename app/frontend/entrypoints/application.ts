import '@hotwired/turbo-rails';
import.meta.glob('../channels/**/*_channel.ts', { eager: true });

import '../utils/setupServiceWorker';
import '../utils/setupHoneybadger';
import '../utils/setupPlausible';
import '../utils/setupStimulus';
import '../utils/setupViewTransitions';
