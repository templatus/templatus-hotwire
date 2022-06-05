import Plausible from 'plausible-tracker';
import { metaContent } from './metaContent';

const plausibleUrl = metaContent('plausible-url');
if (plausibleUrl) {
  window.plausible = Plausible({
    domain: metaContent('app-host'),
    apiHost: plausibleUrl,
  });

  window.plausible.enableAutoOutboundTracking();

  document.addEventListener('turbo:load', () =>
    window.plausible.trackPageview(),
  );
}
