class RenameRecordOfAudit < ActiveRecord::Migration[5.0]
  def change
  	rename_column :audits, :record, :details
  end
end
