class DropSessionsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :sessions if table_exists?(:sessions)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
