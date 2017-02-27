class AddResultToAudit < ActiveRecord::Migration[5.0]
  def change
    add_column :audits, :result, :boolean
  end
end
