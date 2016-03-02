# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class KrakenTickerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "kraken_ticker_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update
    ActionCable.server.broadcast "kraken_ticker_channel", message: "testtest"
  end
end
