import { Application } from '@hotwired/stimulus';
import Honeybadger from '@honeybadger-io/js';
import { metaContent } from '../utils/metaContent';

const honeybadgerApiKey = metaContent('honeybadger-api-key');
if (honeybadgerApiKey) {
  const gitCommitVersion = metaContent('git-commit-version');

  Honeybadger.configure({
    apiKey: honeybadgerApiKey,
    environment: 'production',
    revision: gitCommitVersion,
  });
}

// Start Stimulus application
const application = Application.start();

// Set up error handler
if (honeybadgerApiKey) {
  application.handleError = (error, message, detail) => {
    console.warn(message, detail);
    Honeybadger.notify(error);
  };
}

// Configure Stimulus development experience
application.warnings = true;
application.debug = false;
window.Stimulus = application;

export { application };
