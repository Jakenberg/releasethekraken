require "json"
# require "net/https"

task = Concurrent::TimerTask.new(run_now: true, execution_interval: 5) do |task|

  ActionCable.server.broadcast "messages_channel", message: "Heloo"

end
# task.execute
