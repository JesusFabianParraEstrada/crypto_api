class CryptoPriceChannel < ApplicationCable::Channel
  def subscribed
   stream_from "crypto_price_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
