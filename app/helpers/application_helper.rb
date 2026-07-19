module ApplicationHelper
  THEMES = { 'light' => 'templatus', 'dark' => 'templatus-dark' }.freeze
  private_constant :THEMES

  # Mirrors the mapping in the theme Stimulus controller, which writes the
  # cookie. Returns nil for the system mode, so no theme is forced and the CSS
  # follows the OS preference.
  def theme
    THEMES[cookies[:theme]]
  end
end
