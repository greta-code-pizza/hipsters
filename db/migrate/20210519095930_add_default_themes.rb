class AddDefaultThemes < ActiveRecord::Migration[6.0]
  def change
    change_column_default :themes, :current, false
  end
end
