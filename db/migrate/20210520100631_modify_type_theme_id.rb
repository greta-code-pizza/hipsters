class ModifyTypeThemeId < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :theme_id, :bigint
    add_foreign_key :users, :themes
  end
end
