class PageTitlePreview < ViewComponent::Preview
  def with_default
    render(Components::PageTitle.new('Example component default'))
  end
end
