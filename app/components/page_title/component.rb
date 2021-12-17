class PageTitle::Component < ViewComponent::Base
  def initialize(title)
    @title = title
    super
  end
end
