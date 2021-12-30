[![Build Status](https://github.com/ledermann/templatus-hotwire/workflows/CI/badge.svg)](https://github.com/ledermann/templatus-hotwire/actions)
[![Cypress](https://img.shields.io/endpoint?url=https://dashboard.cypress.io/badge/simple/5d6bqs&style=flat-square&logo=cypress)](https://dashboard.cypress.io/projects/5d6bqs/runs)
[![DeepSource](https://deepsource.io/gh/ledermann/templatus-hotwire.svg/?label=active+issues&show_trend=true&token=P_LIyx8VyJ9JkU_9Qcnf1nwX)](https://deepsource.io/gh/ledermann/templatus-hotwire/?ref=repository-badge)

# Templatus-Hotwire

Templatus-Hotwire is an opinionated template to build web applications with Ruby on Rails and Hotwire. It simplifies the process of setting up a new application while following best practices.

Live demo available at https://templatus-hotwire.ledermann.dev

## Features / Technology stack

### Backend

- [Ruby](https://www.ruby-lang.org/de/) 3
- [Ruby on Rails](https://rubyonrails.org/) 7.0
- [ActionCable](https://guides.rubyonrails.org/action_cable_overview.html) for WebSocket communication
- [PostgreSQL](https://www.postgresql.org/) for using as SQL database
- [Sidekiq](https://sidekiq.org/) for background processing
- [Redis](https://redis.io/) for Caching, ActionCable, and Sidekiq

### Frontend

- [Hotwire](https://hotwire.io/) for building the frontend without using much JavaScript by sending HTML instead of JSON over the wire
- [ViewComponent](https://viewcomponent.org/) for creating reusable, testable & encapsulated view components
- [Slim](http://slim-lang.com/) for writing templates instead of ERB
- [Tailwind CSS 3](https://tailwindcss.com/) to not have to write CSS at all
- [Heroicons](https://heroicons.com/) for beautiful hand-crafted SVG icons
- [Rails Request.JS](https://github.com/rails/request.js) for AJAX requests with default headers
- [esbuild](https://esbuild.github.io/) for bundling JavaScript

### Development

- [Puma-dev](https://github.com/puma/puma-dev) for using .test-domain and HTTPS in development
- [Foreman](https://github.com/ddollar/foreman) for starting up the application locally
- [dotenv](https://github.com/bkeepers/dotenv) to load environment variables from .env into ENV
- [Prettier](https://prettier.io/) for auto-formatting JavaScript and Ruby code in Visual Studio Code
- [Lookbook](https://github.com/allmarkedup/lookbook) as development UI for ViewComponent
- Live reloading

### Linting and testing

- [RuboCop](https://rubocop.org/) for Ruby static code analysis
- [ESLint](https://eslint.org/) for JavaScript static code analysis
- [RSpec](https://rspec.info/) for Ruby testing
- [Cypress](https://www.cypress.io/) for E2E testing

### Deployment

- [Docker](https://www.docker.com/) for production deployment, NOT for development
- [DockerRailsBase](https://github.com/ledermann/docker-rails-base) for fast building an optimized Docker image based on Alpine Linux
- [GitHub Actions](https://docs.github.com/en/actions) for testing, linting, and building Docker image
- [Dependabot](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically/about-dependabot-version-updates) configuration for updating dependencies (with auto-merge)
- Ready for serving assets via CDN like CloudFront
- [Honeybadger](https://www.honeybadger.io/) for error tracking in Ruby and JavaScript

### Production

- [Lograge](https://github.com/roidrage/lograge) for single-line logging
- Gzip and Brotli compression of all responses (HTML, JSON, assets) using [Rack::Deflater](https://github.com/rack/rack/blob/master/lib/rack/deflater.rb), [Rack::Brotli](https://github.com/marcotc/rack-brotli) and [Sprockets::ExportersPack](https://github.com/hansottowirtz/sprockets-exporters_pack)
- Fine-tuned Content Security Policy (CSP)
- Ready for PWA (manifest, service-worker)

## Metrics

This template is developed with optimized performance and security in mind. The following benchmarks are
performed against the demo installation on production. It uses an inexpensive virtual server on the [Hetzner Cloud](https://www.hetzner.com/de/cloud) behind a [Traefik](https://traefik.io/traefik/) setup.

### Lighthouse site performance

100% in all categories.

![Lighthouse](docs/lighthouse.png)

### Security headers

[![Security headers](docs/security-headers.png)](https://securityheaders.com/?q=templatus-hotwire.ledermann.dev&followRedirects=on)

What's the red _Permissions-Policy_ badge? This seems to be fixed with one of the next Rails update:
https://github.com/rails/rails/pull/41994

### Mozilla Observatory

[![Mozilla Observatory](docs/mozilla-observatory.png)](https://observatory.mozilla.org/analyze/templatus-hotwire.ledermann.dev)

### WebPageTest

[![WebPageTest](docs/web-page-test.png)](https://webpagetest.org/result/211213_AiDcS0_a690602e1bbcc6121d478fbd94f323b2/)

### GTmetrix

[![GTmetrix](docs/GTmetrix.png)](https://gtmetrix.com/reports/templatus-hotwire.ledermann.dev/wEwahJmQ/)

### Check-your-website

[![Check-your-website](docs/check-your-website.png)](https://check-your-website.server-daten.de/?q=templatus-hotwire.ledermann.dev)

### JavaScript size

132 KB of compiled JavaScript (minified, uncompressed). The largest parts are:

- Turbo with ActionCable (71 KB)
- Stimulus (32 KB)
- Honeybadger (22 KB)

```
$ yarn build
yarn run v1.22.17
$ node esbuild.config.js

  ../assets/builds/application.js                                                                        132.4kb  100.0%
   ├ ../../node_modules/@hotwired/turbo/dist/turbo.es2017-esm.js                                          62.5kb   47.2%
   ├ ../../node_modules/@hotwired/stimulus/dist/stimulus.js                                               31.8kb   24.0%
   ├ ../../node_modules/@honeybadger-io/js/dist/browser/honeybadger.js                                    21.1kb   16.0%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/connection.js            2.8kb    2.1%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/connection_monitor.js    2.3kb    1.7%
   ├ ../../node_modules/register-service-worker/index.js                                                   1.7kb    1.3%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/subscriptions.js        1021b     0.8%
   ├ ../../node_modules/el-transition/index.js                                                             805b     0.6%
   ├ ../../node_modules/timeago.js/esm/utils/date.js                                                       659b     0.5%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/consumer.js              585b     0.4%
   ├ controllers/online_status_controller.js                                                               568b     0.4%
   ├ ../../node_modules/@hotwired/turbo-rails/app/javascript/turbo/cable_stream_source_element.js          522b     0.4%
   ├ utils/setupServiceWorker.js                                                                           519b     0.4%
   ├ ../components/clicks/component_controller.js                                                          480b     0.4%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/index.js                 468b     0.3%
   ├ ../../node_modules/timeago.js/esm/realtime.js                                                         409b     0.3%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/subscription.js          400b     0.3%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/internal.js              365b     0.3%
   ├ ../../node_modules/@hotwired/turbo-rails/app/javascript/turbo/cable.js                                256b     0.2%
   ├ ../../node_modules/timeago.js/esm/lang/zh_CN.js                                                       220b     0.2%
   ├ ../../node_modules/timeago.js/esm/lang/en_US.js                                                       197b     0.1%
   ├ ../../node_modules/timeago.js/esm/utils/dom.js                                                        158b     0.1%
   ├ utils/setupHoneyBadger.js                                                                             157b     0.1%
   ├ rails:/Users/ledermann/Projects/templatus-hotwire/app/javascript/controllers/**/*_controller.js       151b     0.1%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/logger.js                108b     0.1%
   ├ controllers/timeago_controller.js                                                                     104b     0.1%
   ├ rails:/Users/ledermann/Projects/templatus-hotwire/app/components/**/*_controller.js                    96b     0.1%
   ├ utils/metaContent.js                                                                                   92b     0.1%
   ├ utils/setupStimulus.js                                                                                 78b     0.1%
   ├ ../../node_modules/timeago.js/esm/register.js                                                          75b     0.1%
   ├ ../components/index.js                                                                                 68b     0.1%
   ├ controllers/index.js                                                                                   68b     0.1%
   ├ ../../node_modules/@hotwired/turbo-rails/node_modules/@rails/actioncable/src/adapters.js               67b     0.0%
   └ ../../node_modules/timeago.js/esm/index.js                                                             30b     0.0%

✨  Done in 0.30s.
```

### Network transfer

Small footprint: The demo application transfers only **52 KB** of data on the first visit.

![Network](docs/network.png)

### Docker build time

With multi-stage building and using [DockerRailsBase](https://github.com/ledermann/docker-rails-base) the build of the Docker image takes very little time. Currently, the build job requires about 1,5 minutes on GitHub Actions (see https://github.com/ledermann/templatus-hotwire/actions)

### Docker image size

The Docker image is based on Alpine Linux and is optimized for minimal size (currently **130 MB** uncompressed disk size). It includes just the bare minimum - no build tools like Node.js, no JS sources (just the compiled assets), no tests.

```
$ container-diff analyze ghcr.io/ledermann/templatus-hotwire -n

-----Size-----

Analysis for ghcr.io/ledermann/templatus-hotwire:
IMAGE                                      DIGEST       SIZE
ghcr.io/ledermann/templatus-hotwire        sha256:...   130.1M
```

## Getting started

### Install for development

1. Clone the repo locally:

```bash
git clone git@github.com:ledermann/templatus-hotwire.git
cd templatus-hotwire
```

2. Install PostgreSQL, Redis, and puma-dev (if not already present). On a Mac with HomeBrew, run this to install from the `Brewfile`:

```bash
brew bundle
```

3. Install and set up [puma-dev](https://github.com/puma/puma-dev) to use HTTPS for development. Do this on macOS:

```bash
sudo puma-dev -setup
puma-dev -install
puma-dev link
```

4. Setup the application to install gems and NPM packages and create the database:

```bash
bin/setup
```

5. Start the application locally:

```bash
bin/dev
```

Then open https://templatus-hotwire.test in your browser.

### Preview components in LookBook

```bash
bin/dev
```

Then open https://templatus-hotwire.test/lookbook/ in your browser.

### Running linters

RuboCop:

```
bin/rubocop
```

ESLint:

```
bin/yarn lint
```

### Running tests locally

Ruby tests:

```
bin/rspec
open coverage/index.html
```

JavaScript unit tests:

```
bin/yarn test
```

E2E tests with Cypress:

```
bin/cypress open
```

This opens Cypress and starts Rails in `development` environment, but with `CYPRESS=true`, so the `test` database is used. This allows code editing without class reloading and recompiling assets.

To run Cypress in headless mode:

```
bin/cypress run
```

### Test deployment locally

```
docker network create public
docker-compose up
```
