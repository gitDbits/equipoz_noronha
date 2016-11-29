class RemoveAdressFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :adress, :string
  end
end
