class Clicks::Component < ViewComponent::Base
  include Turbo::FramesHelper
  include Turbo::StreamsHelper

  def initialize(clicks:, count:)
    super
    @clicks = clicks
    @count = count
  end

  attr_reader :clicks, :count
end
