class AppFlash::Component < ViewComponent::Base
  def initialize(alert: nil, notice: nil)
    super
    @alert = alert
    @notice = notice
  end

  attr_reader :alert, :notice

  def icon_name
    if notice
      'check-circle'
    elsif alert
      'exclamation-circle'
    end
  end

  def background_class
    if notice
      'bg-green-50 border-green-500'
    elsif alert
      'bg-red-50 border-red-500'
    end
  end

  def text_class
    if notice
      'text-green-800'
    elsif alert
      'text-red-800'
    end
  end

  def icon_class
    if notice
      'text-green-400'
    elsif alert
      'text-red-400'
    end
  end

  def text
    notice || alert
  end
end
