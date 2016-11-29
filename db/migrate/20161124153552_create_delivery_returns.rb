class CreateDeliveryReturns < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_returns do |t|
      t.string :name
      t.string :cpf

      t.timestamps
    end
  end
end
