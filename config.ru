require './app'
require './middlewares/ticker_backend'

use Ticker::Backend

run Ticker::App
