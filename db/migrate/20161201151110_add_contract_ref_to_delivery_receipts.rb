class AddContractRefToDeliveryReceipts < ActiveRecord::Migration[5.0]
  def change
    add_reference :delivery_receipts, :contract, foreign_key: true
  end
end
