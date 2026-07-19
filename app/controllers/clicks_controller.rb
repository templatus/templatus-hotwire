class ClicksController < ApplicationController
  PER_PAGE = 20
  public_constant :PER_PAGE

  def index
    @pagy, @clicks = paginated_clicks

    respond_to do |format|
      # Only the full page shows a total, so the endless-scrolling requests
      # must not pay for a COUNT(*) over the whole table.
      format.html { @clicks_count = Click.count }
      format.turbo_stream
    end
  end

  def create
    Click.create! user_agent: request.user_agent,
                  ip: anonymize(request.remote_ip)
    render_flash_update notice: t('.success')
  rescue ActiveRecord::RecordInvalid, IPAddr::InvalidAddressError
    render_flash_update alert: t('.fail'), status: :unprocessable_content
  end

  private

  # Keyset (cursor) pagination instead of OFFSET: the query time stays constant
  # no matter how far the user has scrolled, and - unlike OFFSET - the pages
  # don't shift when new clicks get broadcasted into the top of the list.
  def paginated_clicks
    pagy(
      :keyset,
      Click.order(created_at: :desc, id: :desc),
      limit: PER_PAGE,
      pre_serialize: SERIALIZE_CURSOR,
    )
  end

  # Postgres stores microseconds, but Time#as_json truncates to milliseconds.
  # Without this the cursor would silently skip clicks that were created within
  # the same millisecond as the last click of the previous page.
  SERIALIZE_CURSOR =
    lambda do |attributes|
      attributes[:created_at] = attributes[:created_at].strftime('%F %T.%6N')
    end
  private_constant :SERIALIZE_CURSOR

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
