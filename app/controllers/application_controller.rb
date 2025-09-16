class ApplicationController < ActionController::Base
  def render_flash_update(notice: nil, alert: nil, status: :ok)
    render turbo_stream:
             turbo_stream.update(
               'flash',
               render_to_string(AppFlash::Component.new(notice:, alert:)),
             ),
           status:
  end
end
