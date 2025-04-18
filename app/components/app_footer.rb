class Components::AppFooter < Components::Base
  def initialize(class:)
    super()
    @class = binding.local_variable_get(:class)
  end

  def view_template
    footer(
      class: [
        'flex flex-wrap justify-between items-center px-4 space-y-2 text-sm text-white sm:px-6 lg:px-0',
        @class,
      ],
    ) do
      github
      online_status
      author
    end
  end

  private

  def github
    div(class: 'flex items-center w-full space-x-2 sm:w-auto') do
      a(
        class: 'hover:underline',
        target: '_blank',
        rel: 'noopener noreferrer',
        href: 'https://github.com/templatus/templatus-hotwire',
      ) do
        svg(class: 'w-6 h-6', viewBox: '0 0 24 24', fill: 'currentColor') do |s|
          s.title { 'GitHub' }
          s.path(
            d:
              'M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12',
          )
        end
      end

      render Components::GitVersion.new commit_version:
                                          Rails
                                            .configuration
                                            .x
                                            .git
                                            .commit_version,
                                        commit_time:
                                          Rails.configuration.x.git.commit_time
    end
  end

  def online_status
    div(class: 'w-full sm:w-auto', data: { controller: 'online-status' }) do
      span(
        class:
          'hidden px-1 py-px font-bold tracking-wide text-red-700 uppercase bg-white rounded-sm',
        data: {
          'online-status-target': 'indicator',
        },
      ) { 'You are offline' }
    end
  end

  def author
    div(class: 'flex items-center w-full sm:w-auto') do
      link_to(
        'https://ledermann.dev',
        class: 'hover:underline',
        target: '_blank',
        rel: 'noopener noreferrer',
      ) do
        svg(
          class: 'inline w-6 h-6',
          viewBox: '0 0 276 276',
          fill: 'currentColor',
        ) do |s|
          s.title { 'ledermann.dev' }
          s.path(
            d:
              'M0 137l138 138 138-138-84-82-84 82 31 30 53-52 25 22-79 77-78-77L166 29 138 1',
          )
        end
        span(class: 'ml-1 font-mono') { 'ledermann.dev' }
      end
    end
  end
end
