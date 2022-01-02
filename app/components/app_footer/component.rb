class AppFooter::Component < ViewComponent::Base
  def initialize(class: nil)
    @class = binding.local_variable_get(:class)
    super
  end
end
