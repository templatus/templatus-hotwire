import { init, track } from '@plausible-analytics/tracker';
import { metaContent } from './metaContent';

const plausibleUrl = metaContent('plausible-url');
if (plausibleUrl) {
  init({
    domain: metaContent('app-host') || globalThis.location.host,
    endpoint: plausibleUrl,
    autoCapturePageviews: false,
    outboundLinks: true,
  });

  document.addEventListener('turbo:load', () => track('pageview', {}));
}
