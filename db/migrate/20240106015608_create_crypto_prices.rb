class CreateCryptoPrices < ActiveRecord::Migration[7.1]
  def change
    create_table :crypto_prices do |t|
      t.string :symbol
      t.decimal :price

      t.timestamps
    end
    add_index :crypto_prices, :symbol, unique: true
  end
end
