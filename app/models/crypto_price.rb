class CryptoPrice < ApplicationRecord
  validates :symbol, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  after_update :broadcast_price

  private

  def broadcast_price
    ActionCable.server.broadcast 'crypto_price_channel', self
    # Transmite el precio actualizado a todos los suscriptores del canal
  end
end
