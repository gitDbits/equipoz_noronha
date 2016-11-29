class RemoveDescriptionFromEquipment < ActiveRecord::Migration[5.0]
  def change
    remove_column :equipment, :description, :string
  end
end
