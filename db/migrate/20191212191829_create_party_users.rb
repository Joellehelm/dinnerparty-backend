class CreatePartyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :party_users do |t|
      t.integer :user_id
      t.integer :party_id

      t.timestamps
    end
  end
end
