class RemoveMedicationFromPharmacy < ActiveRecord::Migration[6.1]
  def change
    remove_reference :pharmacies, :medication, null: false, foreign_key: true
  end
end
