class AddDefaultValueCurrentToThemesTwo < ActiveRecord::Migration[6.0]
  def change
    change_column :themes, :current, :boolean, :default => false
  end
end
