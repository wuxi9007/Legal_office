class RenameCaseStart < ActiveRecord::Migration[5.0]
  def change
  	rename_column :cases, :start, :start_time
  end
end
