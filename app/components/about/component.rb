class About::Component < ViewComponent::Base # rubocop:disable Metrics/ClassLength
  def features # rubocop:disable Metrics/MethodLength
    [
      {
        name: 'The backend',
        slogan: 'Server side',
        items: [
          {
            name: 'Ruby',
            version: ruby_version,
            href: 'https://www.ruby-lang.org/',
            description:
              'A dynamic, open source programming language with a focus on simplicity and productivity.
               It has an elegant syntax that is natural to read and easy to write.',
          },
          {
            name: 'Ruby on Rails',
            version: rails_version,
            href: 'https://rubyonrails.org/',
            description:
              'Rails is a web application development framework written in the Ruby programming language.
               It is designed to make programming web applications easier by making assumptions about
               what every developer needs to get started.',
          },
          {
            name: 'PostgreSQL',
            version: postgres_version,
            href: 'https://www.postgresql.org/',
            description:
              'PostgreSQL is a powerful, open source object-relational database system with over 30 years of
               active development that has earned it a strong reputation for reliability, feature robustness,
               and performance.',
          },
          {
            name: 'Puma',
            version: puma_version,
            href: 'https://puma.io/',
            description:
              'Puma is a simple, fast, multi-threaded, and highly concurrent HTTP 1.1 server
               for Ruby/Rack applications.',
          },
          {
            name: 'Redis',
            version: redis_version,
            href: 'https://redis.io/',
            description:
              'Redis is an open source, in-memory data structure store, used as a database, cache,
               and message broker.',
          },
          {
            name: 'Sidekiq',
            version: sidekiq_version,
            href: 'https://sidekiq.org/',
            description:
              'Simple, efficient background processing for Ruby
               <p class="mt-2 text-xs">
                 →
                 <a class="font-medium uppercase hover:underline" href="/sidekiq" data-turbo="false">
                   Admin frontend
                 </a>
               </p>',
          },
        ],
      },
      {
        name: 'The frontend',
        slogan: 'Client side',
        items: [
          {
            name: 'Hotwire',
            href: 'https://hotwired.dev/',
            description:
              'Hotwire is an alternative approach to building modern web applications without using much JavaScript by
               sending HTML instead of JSON over the wire',
          },
          {
            name: 'ViewComponent',
            version: view_component_version,
            href: 'https://viewcomponent.org/',
            description:
              'A framework for creating reusable, testable & encapsulated view components, built to integrate seamlessly
               with Ruby on Rails.',
          },
          {
            name: 'Tailwind CSS 3',
            href: 'https://tailwindcss.com/',
            description:
              'A utility-first CSS framework packed with classes that can be composed to build any design, directly in
               your markup.',
          },
          {
            name: 'Heroicons',
            href: 'https://heroicons.com/',
            description:
              'Beautiful hand-crafted SVG icons, by the makers of Tailwind CSS.',
          },
          {
            name: 'esbuild',
            href: 'https://esbuild.github.io/',
            description:
              'An extremely fast JavaScript and CSS bundler and minifier',
          },
        ],
      },
      {
        name: 'Continuous integration',
        slogan: 'Quality insurance',
        items: [
          {
            name: 'GitHub Actions',
            href: 'https://github.com/features/actions',
            description: 'Test, build and deliver on every push to GitHub',
          },
          {
            name: 'RSpec',
            href: 'https://rspec.info/',
            description:
              'Behaviour Driven Development for Ruby. Making TDD Productive and Fun.',
          },
          {
            name: 'RuboCop',
            href: 'https://rubocop.org/',
            description: 'The Ruby Linter/Formatter that Serves and Protects',
          },
          {
            name: 'Jest',
            href: 'https://jestjs.io/',
            description:
              'Jest is a delightful JavaScript Testing Framework with a focus on simplicity',
          },
          {
            name: 'ESLint',
            href: 'https://eslint.org/',
            description:
              'ESLint statically analyzes your code to quickly find problems',
          },
          {
            name: 'Cypress',
            href: 'https://cypress.io/',
            description:
              'Fast, easy and reliable testing for anything that runs in a browser.',
          },
        ],
      },
      {
        name: 'Deployment',
        slogan: 'Ship it!',
        items: [
          {
            name: 'Alpine Linux',
            version: alpine_version,
            href: 'https://alpinelinux.org/',
            description:
              'Alpine Linux is an independent, non-commercial, general purpose Linux distribution designed for
               power users who appreciate security, simplicity and resource efficiency.',
          },
          {
            name: 'Docker',
            href: 'https://www.docker.com/',
            description: 'Dockerized using an optimized base image.',
          },
        ],
      },
    ]
  end

  private

  def alpine_version
    `cat /etc/alpine-release 2>/dev/null`.chomp
  end

  def postgres_version
    ActiveRecord::Base.connection.select_value('SHOW server_version;')
  end

  def redis_version
    Redis.new.info['redis_version']
  end

  def ruby_version
    RUBY_VERSION
  end

  def puma_version
    Gem.loaded_specs['puma'].version
  end

  def rails_version
    Gem.loaded_specs['rails'].version
  end

  def sidekiq_version
    Gem.loaded_specs['sidekiq'].version
  end

  def view_component_version
    Gem.loaded_specs['view_component'].version
  end
end
