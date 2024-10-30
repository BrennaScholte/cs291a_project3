class DropSessionsTable < ActiveRecord::Migration[7.2]
  def up
    drop_table :sessions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
