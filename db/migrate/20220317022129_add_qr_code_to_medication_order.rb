class AddQrCodeToMedicationOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :medication_orders, :qr_code, :string
  end
end
