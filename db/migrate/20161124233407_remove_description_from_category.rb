class RemoveDescriptionFromCategory < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :description, :string
  end
end
