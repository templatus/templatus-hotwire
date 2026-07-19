class Tabs::Component < ViewComponent::Base
  renders_many :tabs, 'TabComponent'

  class TabComponent < ViewComponent::Base
    def initialize(text:, href:)
      super()
      @text = text
      @href = href
    end

    def call
      link_to text,
              href,
              class: css_classes,
              aria: {
                current: ('page' if current_page?(href)),
              },
              data: {
                turbo_action: 'replace',
              }
    end

    private

    attr_reader :text, :href

    def css_classes
      ['tab', ('tab-active' if current_page?(href))].compact
    end
  end
end
