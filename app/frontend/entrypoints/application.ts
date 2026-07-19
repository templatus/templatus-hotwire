import '@hotwired/turbo-rails';
import.meta.glob('../channels/**/*_channel.ts', { eager: true });

// Emit static images into the build manifest, so they can be referenced
// from ERB via `vite_asset_path('images/...')`
import.meta.glob('../images/**', { eager: true });

import '../utils/setupServiceWorker';
import '../utils/setupHoneybadger';
import '../utils/setupPlausible';
import '../utils/setupStimulus';
import '../utils/setupViewTransitions';
