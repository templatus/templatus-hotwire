class AppHeader::Component < ViewComponent::Base
  def initialize(css_class: nil)
    super()
    @css_class = css_class
  end

  private

  attr_reader :css_class
end
