class RemoveDiscountFromContract < ActiveRecord::Migration[5.0]
  def change
    remove_column :contracts, :discount, :string
  end
end
