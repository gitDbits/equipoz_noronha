class AddDocumentToDeliveryReturns < ActiveRecord::Migration[5.0]
  def change
    add_column :delivery_returns, :document, :string
  end
end
