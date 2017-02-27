class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.references :personnel, foreign_key: true
      t.string :case_id
      t.datetime :start
      t.datetime :completion
      t.integer :C1_id
      t.integer :C2_id

      t.timestamps
    end
  end
end
