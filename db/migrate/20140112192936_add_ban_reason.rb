class AddBanReason < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banned_at, :datetime
    add_column :users, :banned_by_user_id, :integer
    add_column :users, :banned_reason, :string, :limit => 200
  end
end
