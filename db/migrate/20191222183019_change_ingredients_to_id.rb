class ChangeIngredientsToId < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :ingredients, :string
    add_column :lists, :ingredient_id, :integer
  end
end
