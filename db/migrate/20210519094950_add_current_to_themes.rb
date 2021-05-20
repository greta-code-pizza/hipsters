class AddCurrentToThemes < ActiveRecord::Migration[6.0]
  def change
    add_column :themes, :current, :boolean, default: false
  end
end
