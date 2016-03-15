# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class StatusChannel < ApplicationCable::Channel

  attr_accessor :username

  def subscribed
    stream_from "status_channel"
    self.username = "user_#{rand 999}"
    ActionCable.server.broadcast "status_channel", status: "connected", username: username
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    ActionCable.server.broadcast "status_channel", status: "disconnected", username: username
  end
end
