class CreatePharmacies < ActiveRecord::Migration[6.1]
  def change
    create_table :pharmacies do |t|
      t.string :pharmacy_address
      t.string :pharmacy_name
      t.references :medication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
