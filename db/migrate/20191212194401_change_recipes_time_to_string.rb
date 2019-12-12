class ChangeRecipesTimeToString < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :time, :string
  end
end
