class AppFlash::Component < ViewComponent::Base
  def initialize(alert: nil, notice: nil)
    super()
    @alert = alert
    @notice = notice
  end

  private

  attr_reader :alert, :notice

  def alert_class
    notice ? 'alert alert-success' : 'alert alert-error'
  end

  def text
    notice || alert
  end

  def icon_class
    notice ? 'icon-[lucide--circle-check]' : 'icon-[lucide--circle-alert]'
  end
end
