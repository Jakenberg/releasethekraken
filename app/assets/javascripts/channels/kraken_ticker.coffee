App.kraken_ticker = App.cable.subscriptions.create "KrakenTickerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    data = JSON.parse(data["data"])

    tickerKeys = [
      'ask-price'
      'ask-volume'
      'bid-price'
      'bid-volume'
      'last-price'
      'last-volume'
      'price-24h'
      'volume-24h'
      'low-24h'
      'high-24h'
    ]

    for tickerKey in tickerKeys
      valueSpan = $("div[data-ticker-name='#{data.name}'] span[data-ticker-#{tickerKey}]")
      previousValue = valueSpan.data("ticker-previous-#{tickerKey}")
      currentValue = valueSpan.text()

      newValue = data[tickerKey]

      valueSpan.text newValue

      if newValue == previousValue
      else
        valueSpan.data "ticker-previous-#{tickerKey}", currentValue
        if newValue > previousValue
          valueSpan.css 'color', 'green'
        else if newValue < previousValue
          valueSpan.css 'color', 'red'
        else
          valueSpan.css 'color', 'black'

  update: ->
    @perform "update"
