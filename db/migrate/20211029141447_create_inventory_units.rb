# frozen_string_literal: true

# CreateInventoryUnits
class CreateInventoryUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_units do |t|
      t.string :type, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :inventory_units, %i[type name], unique: true, name: :index_inventory_unit_type_name_uniqueness
  end
end
