class RemoveCommentsDragon < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :is_dragon
  end
end
