class CoinApiWebSocketJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CoinApiService.start
  end
end
