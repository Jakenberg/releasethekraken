App.messages_channel = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when new data is pushed to the client
    $('.messages button').after $("<p>#{data.message}</p>")
