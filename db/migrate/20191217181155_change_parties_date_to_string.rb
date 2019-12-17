class ChangePartiesDateToString < ActiveRecord::Migration[6.0]
  def change
    change_column :parties, :date, :string
  end
end
