class ClicksComponent < ApplicationComponent
  include Phlex::Rails::Helpers::TurboFrameTag
  include Phlex::Rails::Helpers::TurboStreamFrom

  def initialize(clicks:, count:)
    super()
    @clicks = clicks
    @count = count
  end

  attr_reader :clicks, :count

  def view_template
    turbo_stream_from 'clicks'

    div(data: { controller: 'clicks', 'clicks-count-value': count }) do
      div(
        class:
          'flex flex-col w-full mt-5 lg:absolute lg:-top-5 lg:-right-10 lg:p-3 lg:mt-0 lg:w-56 lg:bg-linear-to-br lg:from-slate-100 lg:to-white lg:rounded-sm lg:shadow-sm',
      ) do
        div(class: 'h-12') do
          div(
            id: 'counter',
            class: 'text-5xl font-bold text-center',
            data: {
              'clicks-target': 'counter',
              'transition-enter': 'transition-transform duration-200 ease-out',
              'transition-enter-start': 'scale-0',
              'transition-enter-end': 'scale-100',
              'transition-leave': 'transition-transform duration-200 ease-in',
              'transition-leave-start': 'scale-100',
              'transition-leave-end': 'scale-0',
              'turbo-permanent': '',
            },
          ) do
            ' ' # Non-breaking space
          end
        end

        div(class: 'py-1 text-center uppercase') { 'Clicks' }

        button_to 'Click me!',
                  clicks_path,
                  class:
                    'mt-3 w-full rounded-sm bg-tertiary py-2 font-medium text-black transition hover:bg-secondary hover:text-white active:outline-hidden active:ring-2 active:ring-secondary active:ring-offset-1'

        p(class: 'hidden mt-3 text-xs text-center text-gray-600 sm:block') do
          'Tip: Open two browser windows in parallel and see what happens.'
        end
      end

      h2(
        class:
          'mt-20 text-xl font-medium tracking-wide text-center uppercase text-primary sm:text-left',
      ) { 'Latest clicks' }

      turbo_frame_tag 'clicks',
                      data: {
                        action:
                          'turbo:before-stream-render@document->clicks#receive',
                      } do
        ul(
          id: 'list',
          class: 'text-sm md:text-base',
          data: {
            'clicks-target': 'list',
            'transition-enter': 'transition duration-200 ease-in',
            'transition-enter-start': 'translate-y-0',
            'transition-enter-end': 'translate-y-32',
          },
        ) { @clicks.each { |click| render ClickComponent.new(click:) } }
      end
    end
  end
end
