class AboutPreview < ViewComponent::Preview
  def with_default
    render(Components::About.new)
  end
end
