require "open-uri"

class Kraken
  def self.currency_pairs
    @@pairs ||= JSON.parse(open("https://api.kraken.com/0/public/AssetPairs").read)["result"]
  end

  def self.parse_ticker data
    data.map do |k,v|
      {"type" => "ticker", 
       "name" => k,
       "ask-price" => v["a"].first,
       "ask-volume" => v["a"].last,
       "bid-price" => v["b"].first,
       "bid-volume" => v["b"].last,
       "last-price" => v["c"].first,
       "last-volume" => v["c"].last,
       "price-24h" => v["p"].last,
       "volume-24h" => v["t"].last,
       "low-24h" => v["l"].last,
       "high-24h" => v["h"].last
      }
    end.first
  end
end
