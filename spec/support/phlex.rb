module PhlexTesting
  def render(...)
    view_context.render(...)
  end

  delegate :view_context, to: :controller

  def controller
    @controller ||= ActionView::TestCase::TestController.new
  end
end

RSpec.configure { |config| config.include PhlexTesting, type: :component }
