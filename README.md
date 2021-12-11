[![Build Status](https://github.com/ledermann/templatus/workflows/CI/badge.svg)](https://github.com/ledermann/templatus/actions)
[![Cypress](https://img.shields.io/endpoint?url=https://dashboard.cypress.io/badge/simple/5d6bqs&style=flat-square&logo=cypress)](https://dashboard.cypress.io/projects/5d6bqs/runs)
[![DeepSource](https://deepsource.io/gh/ledermann/templatus.svg/?label=active+issues&show_trend=true)](https://deepsource.io/gh/ledermann/templatus/?ref=repository-badge)

# Templatus

Templatus is an opinionated template to build web applications with Ruby on Rails and Vue.js 3. It simplifies the process of setting up a new application while following best practices.

Live demo available at https://templatus.ledermann.dev

## Features / Technology stack

### Backend

- [Ruby](https://www.ruby-lang.org/de/) 3
- [Ruby on Rails](https://rubyonrails.org/) 7.0
- [ActionCable](https://guides.rubyonrails.org/action_cable_overview.html) for WebSocket communication
- [PostgreSQL](https://www.postgresql.org/) for using as SQL database
- [Sidekiq](https://sidekiq.org/) for background processing
- [Redis](https://redis.io/) for Caching, ActionCable, and Sidekiq

### Frontend

- [esbuild](https://esbuild.github.io/) for bundling JavaScript
- [Vue 3](https://v3.vuejs.org/) as frontend framework
- [Vue Router 4](https://next.router.vuejs.org/) for frontend routing
- [Pinia](https://pinia.esm.dev/) for frontend state management
- [Tailwind CSS 3](https://tailwindcss.com/) to not have to write CSS at all
- [HeadlessUI](https://headlessui.dev/) unstyled, fully accessible UI components designed to integrate with Tailwind CSS
- [Heroicons](https://heroicons.com/) for SVG icons as Vue components
- [Rails Request.JS](https://github.com/rails/request.js) for AJAX requests with default headers

### Development

- [Puma-dev](https://github.com/puma/puma-dev) for using .test-domain and HTTPS in development
- [Foreman](https://github.com/ddollar/foreman) for starting up the application locally
- [dotenv](https://github.com/bkeepers/dotenv) to load environment variables from .env into ENV
- [TypeScript](https://www.typescriptlang.org/) for writing strongly-typed JavaScript
- [Prettier](https://prettier.io/) for auto-formatting JavaScript and Ruby code in Visual Studio Code

### Linting and testing

- [RuboCop](https://rubocop.org/) for Ruby static code analysis
- [ESLint](https://eslint.org/) for JavaScript static code analysis
- [RSpec](https://rspec.info/) for Ruby testing
- [Jest](https://jestjs.io/) for JavaScript unit testing
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

This template is developed with optimized performance and security in mind. The following benchmarks are performed against the demo installation on production. It uses an inexpensive virtual server on the [Hetzner Cloud](https://www.hetzner.com/de/cloud) behind a [Traefik](https://traefik.io/traefik/) setup.

### Lighthouse site performance

100% in all categories.

![Lighthouse](docs/lighthouse.png)

### Security headers

[![Security headers](docs/security-headers.png)](https://securityheaders.com/?q=templatus.ledermann.dev&followRedirects=on)

What's the red _Permissions-Policy_ badge? This seems to be fixed with one of the next Rails update:
https://github.com/rails/rails/pull/41994

### Mozilla Observatory

[![Mozilla Observatory](docs/mozilla-observatory.png)](https://observatory.mozilla.org/analyze/templatus.ledermann.dev)

### WebPageTest

[![WebPageTest](docs/web-page-test.png)](https://webpagetest.org/result/211031_BiDcEW_766a9f225f0ae81c9bc42bdff4f726c3/)

### GTmetrix

[![GTmetrix](docs/GTmetrix.png)](https://gtmetrix.com/reports/templatus.ledermann.dev/e5RxS9Iq/)

### Check-your-website

[![Check-your-website](docs/check-your-website.png)](https://check-your-website.server-daten.de/?q=templatus.ledermann.dev)

### JavaScript size

152 KB of compiled JavaScript (minified, uncompressed). The largest parts are:

- Vue.js + Vue Router (80 KB)
- Headless UI (10 KB)
- Honeybadger (22 KB)
- Pinia (6 KB)
- ActionCable (10 KB)

```
$ yarn build
yarn run v1.22.17
$ node esbuild.config.js

  ../assets/builds/application.js                                                                                       151.7kb  100.0%
   ├ ../../node_modules/@vue/runtime-core/dist/runtime-core.esm-bundler.js                                               37.5kb   24.7%
   ├ ../../node_modules/vue-router/dist/vue-router.esm-bundler.js                                                        22.2kb   14.6%
   ├ ../../node_modules/@honeybadger-io/js/dist/browser/honeybadger.js                                                   21.1kb   13.9%
   ├ ../../node_modules/@vue/reactivity/dist/reactivity.esm-bundler.js                                                    9.0kb    5.9%
   ├ ../../node_modules/@vue/runtime-dom/dist/runtime-dom.esm-bundler.js                                                  9.0kb    5.9%
   ├ ../../node_modules/@rails/actioncable/app/assets/javascripts/actioncable.esm.js                                      8.7kb    5.7%
   ├ ../../node_modules/pinia/dist/pinia.esm-browser.js                                                                   5.8kb    3.8%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/pages/About.vue?type=script                        4.0kb    2.6%
   ├ ../../node_modules/@headlessui/vue/dist/components/tabs/tabs.esm.js                                                  3.9kb    2.5%
   ├ ../../node_modules/@vue/shared/dist/shared.esm-bundler.js                                                            2.8kb    1.9%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/App.vue?type=template                            2.3kb    1.5%
   ├ ../../node_modules/@rails/request.js/src/fetch_request.js                                                            2.1kb    1.4%
   ├ ../../node_modules/register-service-worker/index.js                                                                  1.7kb    1.2%
   ├ ../../node_modules/@headlessui/vue/dist/utils/render.esm.js                                                          1.7kb    1.1%
   ├ ../../node_modules/@headlessui/vue/dist/utils/focus-management.esm.js                                                1.6kb    1.1%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/pages/About.vue?type=template                    1.5kb    1.0%
   ├ ../../node_modules/@rails/request.js/src/fetch_response.js                                                           1.4kb    0.9%
   ├ ../../node_modules/@headlessui/vue/dist/_virtual/_rollupPluginBabelHelpers.js                                        1.2kb    0.8%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/components/ClickButton.vue?type=template         1.1kb    0.7%
   ├ ../../node_modules/@honeybadger-io/vue/dist/honeybadger-vue.umd.js                                                   973b     0.6%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/components/ClickList.vue?type=template           855b     0.6%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/pages/Home.vue?type=template                     824b     0.5%
   ├ application.ts                                                                                                       772b     0.5%
   ├ ../../node_modules/timeago.js/esm/utils/date.js                                                                      667b     0.4%
   ├ ../../node_modules/@rails/request.js/src/lib/utils.js                                                                577b     0.4%
   ├ src/stores/click.ts                                                                                                  506b     0.3%
   ├ ../../node_modules/timeago.js/esm/realtime.js                                                                        409b     0.3%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/components/LoadingAnimation.vue?type=template    403b     0.3%
   ├ ../../node_modules/@headlessui/vue/dist/utils/match.esm.js                                                           396b     0.3%
   ├ ../../node_modules/@headlessui/vue/dist/hooks/use-resolve-button-type.esm.js                                         373b     0.2%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/App.vue?type=script                                337b     0.2%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/pages/Home.vue?type=script                         286b     0.2%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/components/ClickButton.vue?type=script             282b     0.2%
   ├ src/use/online-offline.ts                                                                                            279b     0.2%
   ├ ../../node_modules/@headlessui/vue/dist/keyboard.esm.js                                                              277b     0.2%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/components/GitVersion.vue?type=script              270b     0.2%
   ├ ../../node_modules/@heroicons/vue/outline/esm/CheckIcon.js                                                           252b     0.2%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/pages/NotFound.vue?type=template                 229b     0.1%
   ├ ../../node_modules/timeago.js/esm/lang/zh_CN.js                                                                      220b     0.1%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/components/GitVersion.vue?type=template          202b     0.1%
   ├ ../../node_modules/timeago.js/esm/lang/en_US.js                                                                      197b     0.1%
   ├ src/router.ts                                                                                                        188b     0.1%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/components/ClickList.vue?type=script               164b     0.1%
   ├ ../../node_modules/timeago.js/esm/utils/dom.js                                                                       158b     0.1%
   ├ sfc-template:/Users/ledermann/Projects/templatus/app/javascript/src/components/PageTitle.vue?type=template           158b     0.1%
   ├ sfc-script:/Users/ledermann/Projects/templatus/app/javascript/src/pages/NotFound.vue?type=script                     136b     0.1%
   ├ ../../node_modules/@rails/request.js/src/request_interceptor.js                                                      129b     0.1%
   ├ ../../node_modules/@rails/request.js/src/verbs.js                                                                    117b     0.1%
   ├ ../../node_modules/vue-demi/lib/index.mjs                                                                            114b     0.1%
   ├ src/components/LoadingAnimation.vue                                                                                   96b     0.1%
   ├ src/utils/metaContent.ts                                                                                              92b     0.1%
   ├ src/components/PageTitle.vue                                                                                          89b     0.1%
   ├ ../../node_modules/@headlessui/vue/dist/utils/dom.esm.js                                                              88b     0.1%
   ├ src/components/ClickButton.vue                                                                                        81b     0.1%
   ├ src/components/GitVersion.vue                                                                                         80b     0.1%
   ├ src/components/ClickList.vue                                                                                          79b     0.1%
   ├ ../../node_modules/timeago.js/esm/register.js                                                                         75b     0.0%
   ├ src/pages/NotFound.vue                                                                                                73b     0.0%
   ├ src/pages/About.vue                                                                                                   70b     0.0%
   ├ src/pages/Home.vue                                                                                                    69b     0.0%
   ├ src/App.vue                                                                                                           62b     0.0%
   ├ ../../node_modules/@headlessui/vue/dist/hooks/use-id.esm.js                                                           60b     0.0%
   └ ../../node_modules/timeago.js/esm/index.js                                                                            30b     0.0%

✨  Done in 0.62s.
```

### Network transfer

Small footprint: The demo application transfers only **72 KB** of data on the first visit.

![Network](docs/network.png)

### Docker build time

With multi-stage building and using [DockerRailsBase](https://github.com/ledermann/docker-rails-base) the build of the Docker image takes very little time. Currently, the build job requires about 1,5 minutes on GitHub Actions (see https://github.com/ledermann/templatus/actions)

### Docker image size

The Docker image is based on Alpine Linux and is optimized for minimal size (currently **116 MB** uncompressed disk size). It includes just the bare minimum - no build tools like Node.js, no JS sources (just the compiled assets), no tests.

```
$ container-diff analyze ghcr.io/ledermann/templatus -n

-----Size-----

Analysis for ghcr.io/ledermann/templatus:
IMAGE                              DIGEST         SIZE
ghcr.io/ledermann/templatus        sha256:...   116.3M
```

## Getting started

### Install for development

1. Clone the repo locally:

```bash
git clone git@github.com:ledermann/templatus.git
cd templatus
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

Then open https://templatus.test in your browser.

### Running linters

RuboCop:

```
bin/rubocop
```

ESLint:

```
bin/yarn lint
```

TypeScript compiler:

```
bin/yarn tsc
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
