class CreateMedicationOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :medication_orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :medication, null: false, foreign_key: true
      t.references :pharmacy, null: false, foreign_key: true
      t.integer :units

      t.timestamps
    end
  end
end
