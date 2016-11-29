class AddTotalAmountToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :total_amount, :float
  end
end
