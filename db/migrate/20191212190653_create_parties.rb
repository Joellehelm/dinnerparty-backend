class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :host_id
      t.string :address
      t.string :details

      t.timestamps
    end
  end
end
