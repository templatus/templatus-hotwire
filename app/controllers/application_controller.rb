class ApplicationController < ActionController::Base
  include Pagy::Method

  # Turbo, Vite's build target and the CSS this app ships all assume a current
  # browser. Without this, an old one renders a subtly broken page instead of
  # the explanatory public/406-unsupported-browser.html.
  allow_browser versions: :modern

  def render_flash_update(notice: nil, alert: nil, status: :ok)
    render turbo_stream:
             turbo_stream.update(
               'flash',
               render_to_string(AppFlash::Component.new(notice:, alert:)),
             ),
           status:
  end
end
