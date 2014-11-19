require 'sinatra/base'
require_relative 'lib/kraken'

module Ticker
  class App < Sinatra::Base
    get "/" do
      @currency_pairs = Kraken.currency_pairs
      erb :"index.html"
    end

    get "/assets/js/application.js" do
      content_type :js
      @scheme = ENV['RACK_ENV'] == "production" ? "wss://" : "ws://"
      erb :"application.js"
    end
  end
end
