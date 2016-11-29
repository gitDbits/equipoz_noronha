class AddDiscountToContract < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :discount, :float
  end
end
