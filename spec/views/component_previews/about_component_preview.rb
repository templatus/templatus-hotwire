class AboutComponentPreview < ViewComponent::Preview
  def with_default
    render(AboutComponent.new)
  end
end
