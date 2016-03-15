App.status_channel = App.cable.subscriptions.create "StatusChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.messages button').after $("<p class='status #{data.status}'>#{data.username} #{data.status}</p>")
