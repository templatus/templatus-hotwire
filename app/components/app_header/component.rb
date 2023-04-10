class AppHeader::Component < ViewComponent::Base
  def initialize(class: nil)
    @class = binding.local_variable_get(:class)
    super
  end

  def tabs
    [{ text: 'Home', href: root_path }, { text: 'About', href: about_path }]
  end
end
