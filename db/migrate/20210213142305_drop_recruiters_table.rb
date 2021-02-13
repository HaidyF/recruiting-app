class DropRecruitersTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :recruiters
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
