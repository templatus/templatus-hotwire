class AppFlash::Component < ViewComponent::Base
  def initialize(alert: nil, notice: nil)
    super()
    @alert = alert
    @notice = notice
  end

  private

  attr_reader :alert, :notice

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
