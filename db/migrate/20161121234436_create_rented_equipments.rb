class CreateRentedEquipments < ActiveRecord::Migration[5.0]
  def change
    create_table :rented_equipments do |t|
      t.references :contract, foreign_key: true
      t.references :equipment, foreign_key: true
      t.date :delivery_date
      t.date :return_date

      t.timestamps
    end
  end
end
