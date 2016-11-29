class AddContractsRefToDeliveryReturn < ActiveRecord::Migration[5.0]
  def change
    add_reference :delivery_returns, :contract, foreign_key: true
  end
end
