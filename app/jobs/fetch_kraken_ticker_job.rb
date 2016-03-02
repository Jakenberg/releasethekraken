class FetchKrakenTickerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later

    Kraken.currency_pairs.each do |k,v|
            # request = EM::HttpRequest.new("https://api.kraken.com/0/public/Ticker").get(query: {"pair" => v["altname"]})

      end


  end

end
