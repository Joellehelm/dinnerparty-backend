class AddPartyIdToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :party_id, :integer
  end
end
