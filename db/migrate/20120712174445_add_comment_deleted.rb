class AddCommentDeleted < ActiveRecord::Migration[6.0]
  def up
    add_column "comments", "is_deleted", :boolean, :default => false
    add_column "comments", "is_moderated", :boolean, :default => false
  end

  def down
  end
end
