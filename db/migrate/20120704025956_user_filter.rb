class UserFilter < ActiveRecord::Migration[6.0]
  def up
    create_table :tag_filters do |t|
      t.timestamps :null => false
      t.integer :user_id
      t.integer :tag_id
    end
  end

  def down
  end
end
