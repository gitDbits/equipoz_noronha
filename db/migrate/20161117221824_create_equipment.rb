class CreateEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment do |t|
      t.string :description
      t.string :category
      t.string :serial_number
      t.date :acquisition_date
      t.decimal :replacement_value
      t.integer :usage_limit

      t.timestamps
    end
  end
end
