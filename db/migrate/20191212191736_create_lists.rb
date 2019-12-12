class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.integer :party_id
      t.string :ingredients

      t.timestamps
    end
  end
end
