class ChangeCaseTimeType < ActiveRecord::Migration[5.0]
  def self.up
    change_table :cases do |t|
      t.change :start_time, :string
      t.change :completion, :string
    end
  end
  def self.down
    change_table :cases do |t|
      t.change :start_time, :datetime
      t.change :completion, :datetime
    end
  end
end
