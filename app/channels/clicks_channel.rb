class ClicksChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'clicks_channel'
  end

  def unsubscribed
    stop_all_streams
  end
end
