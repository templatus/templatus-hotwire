class Components::About < Components::Base
  def view_template
    div(class: 'mt-20 space-y-24') { FEATURES.each { |item| group(item) } }
  end

  private

  def group(item)
    div(class: 'lg:grid lg:grid-cols-3 lg:gap-x-8') do
      div do
        h2(
          class: 'text-base font-semibold tracking-wide uppercase text-primary',
        ) { item[:slogan] }

        p(class: 'mt-2 text-3xl font-extrabold text-gray-900') { item[:name] }
      end

      div(class: 'mt-12 lg:col-span-2 lg:mt-0') do
        dl(
          class:
            'space-y-10 sm:grid sm:grid-cols-2 sm:gap-x-6 lg:gap-x-8 sm:gap-y-10 sm:space-y-0',
        ) { item[:items].each { |i| feature(i) } }
      end
    end
  end

  def feature(item)
    div(class: 'relative') do
      dt do
        render Phlex::Heroicons::Check.new(
                 variant: :solid,
                 classes: 'absolute h-6 w-6 text-accent',
               )

        p(
          class:
            'flex items-center text-lg font-medium leading-6 ml-9 text-primary',
        ) do
          link_to(
            item[:href],
            class: 'hover:underline',
            target: '_blank',
            rel: 'noopener noreferrer',
          ) { item[:name] }

          if (v = version(item))
            span(
              class:
                'inline-flex items-center py-0.5 px-2.5 ml-2 text-xs font-medium text-black bg-tertiary rounded-full',
            ) { v }
          end
        end
      end

      dd(class: 'mt-2 text-base text-gray-600 ml-9') do
        plain item[:description]

        sidekiq_link if item[:gem] == 'sidekiq'
      end
    end
  end

  def sidekiq_link
    p(class: 'mt-2 text-xs') do
      plain ' → '

      a(
        href: sidekiq_web_path,
        class: 'font-medium uppercase hover:underline',
        data: {
          turbo: false,
        },
      ) { 'Admin frontend' }
    end
  end

  FEATURES = [
    {
      name: 'The backend',
      slogan: 'Server side',
      items: [
        {
          name: 'Ruby',
          href: 'https://www.ruby-lang.org/',
          description:
            'A dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.',
        },
        {
          name: 'Ruby on Rails',
          gem: 'rails',
          href: 'https://rubyonrails.org/',
          description:
            'Rails is a web application development framework written in the Ruby programming language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started.',
        },
        {
          name: 'PostgreSQL',
          href: 'https://www.postgresql.org/',
          description:
            'PostgreSQL is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.',
        },
        {
          name: 'Puma',
          gem: 'puma',
          href: 'https://puma.io/',
          description:
            'Puma is a simple, fast, multi-threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications.',
        },
        {
          name: 'Redis',
          href: 'https://redis.io/',
          description:
            'Redis is an open source, in-memory data structure store, used as a database, cache, and message broker.',
        },
        {
          name: 'Sidekiq',
          gem: 'sidekiq',
          href: 'https://sidekiq.org/',
          description: 'Simple, efficient background processing for Ruby',
        },
      ],
    },
    {
      name: 'The frontend',
      slogan: 'Client side',
      items: [
        {
          name: 'Hotwire',
          gem: 'turbo-rails',
          href: 'https://hotwired.dev/',
          description:
            'Hotwire is an alternative approach to building modern web applications without using much JavaScript by sending HTML instead of JSON over the wire',
        },
        {
          name: 'Phlex',
          gem: 'phlex-rails',
          href: 'https://phlex.fun/',
          description:
            'An object-oriented alternative to ActionView for Ruby on Rails.',
        },
        {
          name: 'TypeScript',
          href: 'https://www.typescriptlang.org/',
          description:
            'TypeScript is an open-source language which builds on JavaScript, one of the world’s most used tools, by adding static type definitions.',
        },
        {
          name: 'Tailwind CSS 4',
          href: 'https://tailwindcss.com/',
          description:
            'A utility-first CSS framework packed with classes that can be composed to build any design, directly in your markup.',
        },
        {
          name: 'Heroicons',
          href: 'https://heroicons.com/',
          description:
            'Beautiful hand-crafted SVG icons, by the makers of Tailwind CSS.',
        },
        {
          name: 'Vite',
          href: 'https://vitejs.dev/',
          description: "Next generation frontend tooling. It's fast!",
        },
      ],
    },
    {
      name: 'Development',
      slogan: 'Developer happiness',
      items: [
        {
          name: 'Prettier',
          href: 'https://prettier.io/',
          description:
            'Auto-formatting JavaScript and Ruby code in Visual Studio Code',
        },
        {
          name: 'Lookbook',
          href: 'https://github.com/allmarkedup/lookbook',
          description: 'A native development UI for ViewComponent',
        },
      ],
    },
    {
      name: 'Testing',
      slogan: 'Quality insurance',
      items: [
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
          name: 'ESLint',
          href: 'https://eslint.org/',
          description:
            'ESLint statically analyzes your code to quickly find problems',
        },
        {
          name: 'GitHub Actions',
          href: 'https://github.com/features/actions',
          description: 'Test, build and deliver on every push to GitHub',
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
          href: 'https://alpinelinux.org/',
          description:
            'Alpine Linux is an independent, non-commercial, general purpose Linux distribution designed for power users who appreciate security, simplicity and resource efficiency.',
        },
        {
          name: 'Docker',
          href: 'https://www.docker.com/',
          description: 'Dockerized using an optimized base image.',
        },
        {
          name: 'Plausible',
          href: 'https://plausible.io/',
          description:
            'Plausible is lightweight and open source web analytics. No cookies and fully compliant with GDPR, CCPA and PECR.',
        },
      ],
    },
  ].freeze
  private_constant :FEATURES

  def version(feature)
    external_version(feature[:name]) || gem_version(feature[:gem])
  end

  def alpine_version
    return if RUBY_PLATFORM.exclude?('linux')

    # :nocov:
    `cat /etc/alpine-release 2>/dev/null`.chomp.presence
    # :nocov:
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

  def gem_version(name)
    Gem.loaded_specs[name]&.version&.to_s if name
  end

  def external_version(name)
    @external_version ||=
      Rails
        .cache
        .fetch('versions', expires_in: 1.hour) do
          {
            'Alpine Linux' => alpine_version,
            'PostgreSQL' => postgres_version,
            'Redis' => redis_version,
            'Ruby' => ruby_version,
          }
        end

    @external_version[name]
  end
end
