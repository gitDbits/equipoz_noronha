class CreateDeliveryReceipts < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_receipts do |t|

      t.timestamps
    end
  end
end
