class DropFalseColumnThemesId < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :themes_id
  end
end
