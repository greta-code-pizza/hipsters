class AddIndexThemeToUser < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [ :theme_id ]
  end
end
