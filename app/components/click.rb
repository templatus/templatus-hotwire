class Components::Click < Components::Base
  def initialize(click:, will_animate: false)
    super()
    @click = click
    @will_animate = will_animate
  end

  def view_template
    li(
      class: ['py-5', @will_animate ? 'hidden' : nil],
      data: {
        transition_enter: 'transition duration-200 ease-out',
        transition_enter_start: 'scale-0 bg-secondary',
        transition_enter_end: 'scale-100',
        transition_leave: 'transition duration-200 ease-out',
        transition_leave_start: 'opacity-100',
        transition_leave_end: 'opacity-0',
      },
    ) do
      p do
        span(
          class: 'px-2 py-1 font-mono bg-gray-900 rounded-sm text-tertiary',
        ) { @click.ip.to_s }
        span(class: 'px-1 ml-2 font-medium text-gray-900') do
          @click.created_at.to_fs(:long)
        end
      end

      code(class: 'block mt-4 text-gray-500 font-extralight') do
        @click.user_agent
      end
    end
  end
end
