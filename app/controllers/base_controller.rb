class BaseController < ApplicationController
  def index
    @currency_pairs = Kraken.currency_pairs
  end
end
