# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class KrakenTickerChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    Rails.logger.debug "KrakenTickerChannel subscribed"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    Rails.logger.debug "KrakenTickerChannel unsubscribed"
  end
end
