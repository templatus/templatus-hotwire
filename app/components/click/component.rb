class Click::Component < ViewComponent::Base
  with_collection_parameter :click

  def initialize(click:, will_animate: false)
    super
    @click = click
    @will_animate = will_animate
  end

  attr_reader :click, :will_animate
end
