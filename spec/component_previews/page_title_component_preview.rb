class PageTitleComponentPreview < ViewComponent::Preview
  def with_default
    render(PageTitle::Component.new('Example component default'))
  end
end
