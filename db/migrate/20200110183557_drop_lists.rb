class DropLists < ActiveRecord::Migration[6.0]
  def change
    drop_table :lists
  end
end
