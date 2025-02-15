class ApplicationController < ActionController::Base
  layout -> { ApplicationLayout }

  def render_flash_update(notice: nil, alert: nil, status: :ok)
    render turbo_stream:
             turbo_stream.update(
               'flash',
               Components::AppFlash.new(notice:, alert:),
             ),
           status:
  end
end
