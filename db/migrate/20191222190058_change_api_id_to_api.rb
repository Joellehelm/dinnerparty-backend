class ChangeApiIdToApi < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :api_id, :api
  end
end
