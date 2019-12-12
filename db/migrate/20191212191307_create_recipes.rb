class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :api_id
      t.string :image
      t.string :image_urls
      t.integer :servings
      t.datetime :time 
      t.string :cuisine

      t.timestamps
    end
  end
end
