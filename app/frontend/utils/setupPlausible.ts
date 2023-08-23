import Plausible from 'plausible-tracker';
import { metaContent } from './metaContent';

const plausibleUrl = metaContent('plausible-url');
if (plausibleUrl) {
  const plausible = Plausible({
    domain: metaContent('app-host') || window.location.host,
    apiHost: plausibleUrl,
  });

  plausible.enableAutoOutboundTracking();

  document.addEventListener('turbo:load', () => plausible.trackPageview());
}
