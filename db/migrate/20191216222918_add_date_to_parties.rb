class AddDateToParties < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :date, :datetime
  end
end
