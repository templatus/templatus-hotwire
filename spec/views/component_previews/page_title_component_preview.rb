class PageTitleComponentPreview < ViewComponent::Preview
  def with_default
    render(PageTitleComponent.new('Example component default'))
  end
end
