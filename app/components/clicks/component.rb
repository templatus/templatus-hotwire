class Clicks::Component < ViewComponent::Base
  def initialize(clicks:, count:)
    super()
    @clicks = clicks
    @count = count
  end

  private

  attr_reader :clicks, :count
end
