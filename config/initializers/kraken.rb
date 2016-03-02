require "json"
require "net/https"

task = Concurrent::TimerTask.new(run_now: true, execution_interval: 5) do |task|

  Kraken.currency_pairs.each do |k,v|
    Concurrent::Future.execute do 
      uri = URI("https://api.kraken.com/0/public/Ticker?pair=#{v['altname']}")
      response = Net::HTTP.get(uri)
      json = JSON.parse response
      data = Kraken.parse_ticker json["result"]
      ActionCable.server.broadcast "kraken_ticker_channel", data: JSON.generate(data)
    end
  end

end
task.execute
