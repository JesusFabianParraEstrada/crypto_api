class CoinApiWebSocketJob < ApplicationJob
  queue_as :default

  def perfom(*args)
    CoinApiWebSocket.connect
  end
end