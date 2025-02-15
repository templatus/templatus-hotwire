class Views::About::Index < Views::Base
  def view_template
    render Components::PageTitle.new('About')

    render Components::About.new
  end
end
