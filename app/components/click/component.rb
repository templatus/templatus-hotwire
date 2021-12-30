class Click::Component < ViewComponent::Base
  with_collection_parameter :click

  def initialize(click:)
    super
    @click = click
  end

  attr_reader :click
end
