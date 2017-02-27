class RenameC1C2 < ActiveRecord::Migration[5.0]
  def change
  	rename_column :cases, :C1_id, :c1_id
  	rename_column :cases, :C2_id, :c2_id
  end
end
