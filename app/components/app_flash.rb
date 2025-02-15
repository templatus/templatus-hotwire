class Components::AppFlash < Components::Base
  def initialize(alert: nil, notice: nil)
    super()
    @alert = alert
    @notice = notice
  end

  attr_reader :alert, :notice

  def view_template
    div(
      class: background_class,
      data: {
        controller: 'app-flash',
        transition_enter: 'transition duration-500 ease-out',
        transition_enter_start: 'translate-y-32',
        transition_enter_end: 'translate-y-0',
        transition_leave: 'transition duration-500 ease-in',
        transition_leave_start: 'translate-y-0',
        transition_leave_end: 'translate-y-32',
        turbo_temporary: true,
      },
    ) do
      div(class: 'flex justify-center items-center mx-auto') do
        render icon_component.new(variant: :solid, classes: icon_class)

        p(class: text_class) { text }
      end
    end
  end

  private

  def icon_component
    return Phlex::Heroicons::CheckCircle if notice
    return Phlex::Heroicons::ExclamationCircle if alert

    nil
  end

  def background_class
    base = 'z-50 fixed bottom-0 inset-x-0 border-t-4 p-8 hidden'

    if notice
      "#{base} bg-green-50 border-green-500"
    elsif alert
      "#{base} bg-red-50 border-red-500"
    end
  end

  def text_class
    base = 'text-base font-medium ml-2'

    if notice
      "#{base} text-green-800"
    elsif alert
      "#{base} text-red-800"
    end
  end

  def icon_class
    base = 'h-8 w-8'

    if notice
      "#{base} text-green-400"
    elsif alert
      "#{base} text-red-400"
    end
  end

  def text
    notice || alert
  end
end
