class DropPrescriptionsTable < ActiveRecord::Migration[6.1]
  def up
    drop_table :prescriptions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
