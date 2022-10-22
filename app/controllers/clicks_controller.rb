class ClicksController < ApplicationController
  def index
    @clicks = Click.order(created_at: :desc).limit(5).load_async
    @clicks_count = Click.count
  end

  def create
    Click.create! user_agent: request.user_agent,
                  ip: anonymize(request.remote_ip)
    flash.now[:notice] = 'Click was successfully recorded.'
  rescue StandardError
    flash.now[:alert] = 'Click recording failed!'
    render status: :unprocessable_entity
  end

  private

  def anonymize(ip)
    addr = IPAddr.new(ip.to_s)
    if addr.ipv4?
      # set last octet to 0
      addr.mask(24)
    else
      # set last 80 bits to zeros
      addr.mask(48)
    end
  end
end
