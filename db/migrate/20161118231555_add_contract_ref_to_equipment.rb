class AddContractRefToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_reference :equipment, :contract, foreign_key: true
  end
end
