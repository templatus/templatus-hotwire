class Clicks::Component < ViewComponent::Base
  LOAD_MORE_ID = 'clicks-load-more'.freeze
  public_constant :LOAD_MORE_ID

  def initialize(clicks:, count:, next_url: nil)
    super()
    @clicks = clicks
    @count = count
    @next_url = next_url
  end

  private

  attr_reader :clicks, :count, :next_url
end
