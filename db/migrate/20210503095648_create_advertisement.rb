class CreateAdvertisement < ActiveRecord::Migration[6.0]
  
  def self.up
    create_table :advertisements do |t|
      t.string :title
      t.text :content
      t.string :tag
      t.timestamp :created_at
      t.integer :vote, :default => 0
    end
  end

  def self.down
    drop_table :advertisements
  end
end
