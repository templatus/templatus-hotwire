## Sentinel at the end of an endlessly scrolling list.
#
# When it scrolls into view, the Stimulus controller fetches `url` as a Turbo
# Stream, which appends the next batch and replaces this sentinel with a fresh
# one. Passing `url: nil` renders an inert sentinel, which ends the scrolling.
class LoadMore::Component < ViewComponent::Base
  def initialize(id:, url: nil)
    super()
    @id = id
    @url = url
  end

  private

  attr_reader :id, :url
end
