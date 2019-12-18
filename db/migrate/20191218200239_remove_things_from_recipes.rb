class RemoveThingsFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :image_urls, :string
    remove_column :recipes, :servings, :integer
    remove_column :recipes, :time, :string
    remove_column :recipes, :cuisine, :cuisine
  end
end
