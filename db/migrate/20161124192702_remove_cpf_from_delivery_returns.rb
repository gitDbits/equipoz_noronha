class RemoveCpfFromDeliveryReturns < ActiveRecord::Migration[5.0]
  def change
    remove_column :delivery_returns, :cpf, :string
  end
end
