# frozen_string_literal: true

# CreateInventoryUnits
class CreateInventoryUnits < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_units do |t|
      t.string :type, null: false
      t.string :name, null: false

      t.timestamps

      t.index %i[type name], name: :inventory_units_type_name_index, unique: true
    end
  end
end
