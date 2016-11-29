class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :customer
      t.string :delivery_address
      t.string :rental_period
      t.string :total_amount
      t.string :discount
      t.string :equipment
      t.string :contact

      t.timestamps
    end
  end
end
