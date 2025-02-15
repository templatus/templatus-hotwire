class Views::Clicks::Index < Views::Base
  def initialize(clicks:, count:)
    super()
    @clicks = clicks
    @clicks_count = count
  end

  def view_template
    div(class: 'lg:mr-64') do
      render Components::PageTitle.new('Hello, Templatus!')
    end

    render Components::Clicks.new(clicks: @clicks, count: @clicks_count)
  end
end
