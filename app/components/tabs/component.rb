class Tabs::Component < ViewComponent::Base
  renders_many :tabs, 'TabComponent'

  class TabComponent < ViewComponent::Base
    def initialize(text:, href:)
      super()
      @text = text
      @href = href
    end

    def call
      link_to text, href, class: css_classes, data: { turbo_action: 'replace' }
    end

    private

    attr_reader :text, :href

    def css_classes
      base_classes = ['rounded-md px-2 py-1 transition lg:shadow-sm']

      base_classes << if current_page?(href)
        'bg-white text-primary lg:bg-primary lg:text-white'
      else
        'bg-transparent text-white hover:scale-105 lg:bg-white lg:text-primary'
      end

      base_classes
    end
  end
end
