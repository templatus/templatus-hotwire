import Honeybadger from '@honeybadger-io/js';
import { metaContent } from './metaContent';

const honeybadgerApiKey = metaContent('honeybadger-api-key');
if (honeybadgerApiKey) {
  const gitCommitVersion = metaContent('git-commit-version');

  Honeybadger.configure({
    apiKey: honeybadgerApiKey,
    environment: 'production',
    revision: gitCommitVersion,
  });
}
