class Tabs::Component < ViewComponent::Base
  renders_many :tabs, 'Tab'

  class Tab < ViewComponent::Base
    def initialize(text:, href:)
      super
      @text = text
      @href = href
    end

    attr_reader :text, :href
  end
end
