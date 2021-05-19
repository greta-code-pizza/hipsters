class AddUnreadToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :unread, :boolean, :default => true
  end
end
