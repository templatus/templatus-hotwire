class About::IndexView < ApplicationView
  def view_template
    render PageTitleComponent.new('About')

    render AboutComponent.new
  end
end
