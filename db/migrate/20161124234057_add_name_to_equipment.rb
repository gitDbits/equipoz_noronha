class AddNameToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment, :name, :string
  end
end
