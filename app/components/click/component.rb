class Click::Component < ViewComponent::Base
  def initialize(click:, will_animate: false)
    super()
    @click = click
    @will_animate = will_animate
  end

  private

  attr_reader :click, :will_animate
end
