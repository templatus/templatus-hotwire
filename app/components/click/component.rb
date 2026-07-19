class Click::Component < ViewComponent::Base
  def initialize(click:, will_animate: false)
    super()
    @click = click
    @will_animate = will_animate
  end

  private

  attr_reader :click, :will_animate

  def agent
    @agent ||= ::UserAgent.parse(click.user_agent)
  end

  # "Chrome 150" instead of the full version quadruple: the major version is
  # what tells browsers apart, the rest is noise in a list.
  def browser_label
    name = agent.browser.presence || 'Unknown browser'
    major = agent.version.to_s.split('.').first.presence

    [name, major].compact.join(' ')
  end

  # Every current Mac reports the frozen "OS X 10.15.7", so the version says
  # nothing and only the platform name is worth showing.
  def platform_label
    os = agent.os.presence

    return 'macOS' if os&.start_with?('OS X')

    os || agent.platform.presence
  end
end
