class CreatePartyRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :party_recipes do |t|
      t.integer :party_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
