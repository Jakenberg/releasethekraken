require 'faye/websocket'
require 'thread'
require 'json'
require 'erb'
require "em-http-request"

module Ticker
  class Backend
    KEEPALIVE_TIME = 15 # in seconds
    CHANNEL        = "ticker"

    def initialize(app)
      @app     = app
      @clients = []

      EM::next_tick do
        Kraken.currency_pairs.each do |k,v|
          EM.add_periodic_timer(5) do 
            request = EM::HttpRequest.new("https://api.kraken.com/0/public/Ticker").get(query: {"pair" => v["altname"]})

            request.error do
              # Not much to do
            end

            request.callback do
              data = JSON.parse request.response
              data = Kraken.parse_ticker(data["result"])
              broadcast_data JSON.generate(data)
            end

          end
        end
      end
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        Faye::WebSocket.load_adapter('thin')
        ws = Faye::WebSocket.new(env, nil, {ping: KEEPALIVE_TIME })
        ws.on :open do |event|
          @clients << ws
        end

        ws.on :message do |event|
          broadcast_data(sanitize(event.data))
        end

        ws.on :close do |event|
          @clients.delete(ws)
          ws = nil
        end

        ws.rack_response

      else
        @app.call(env)
      end
    end

    def broadcast_data data
      @clients.each {|ws| ws.send(data) }
    end

    private
    def sanitize(message)
      json = JSON.parse(message)
      json.each {|key, value| json[key] = ERB::Util.html_escape(value) }
      JSON.generate(json)
    end
  end
end
