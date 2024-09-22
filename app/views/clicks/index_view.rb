class Clicks::IndexView < ApplicationView
  def initialize(clicks:, count:)
    super()
    @clicks = clicks
    @clicks_count = count
  end

  def view_template
    div(class: 'lg:mr-64') do
      render PageTitleComponent.new('Hello, Templatus!')
    end

    render ClicksComponent.new(clicks: @clicks, count: @clicks_count)
  end
end
