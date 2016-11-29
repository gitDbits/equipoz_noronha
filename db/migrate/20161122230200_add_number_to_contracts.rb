class AddNumberToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :number, :string
  end
end
