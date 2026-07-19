class ThemeToggle::Component < ViewComponent::Base
  # Icon classes have to be spelled out completely, otherwise Tailwind's source
  # scan cannot find them and no CSS is emitted for them.
  MODES = {
    'light' => { label: 'Light', icon: 'icon-[lucide--sun]' },
    'dark' => { label: 'Dark', icon: 'icon-[lucide--moon]' },
    'auto' => { label: 'System', icon: 'icon-[lucide--monitor]' },
  }.freeze
  private_constant :MODES

  private

  def modes
    MODES
  end

  def icon_modes
    MODES.except('auto')
  end
end
