class HotnessModToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :tags, :hotness_mod, :float
  end
end
