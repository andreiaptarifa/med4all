class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :units
      t.references :medication, null: false, foreign_key: true
      t.references :pharmacy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
