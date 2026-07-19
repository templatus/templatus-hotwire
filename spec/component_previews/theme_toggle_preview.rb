class ThemeTogglePreview < ViewComponent::Preview
  def default
    render ThemeToggle::Component.new
  end
end
