class AboutComponentPreview < ViewComponent::Preview
  def with_default
    render(About::Component.new)
  end
end
