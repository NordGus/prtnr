# frozen_string_literal: true

# CreateInventoryProducts
class CreateInventoryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_products do |t|
      t.string :type, null: false
      t.string :name, null: false

      t.timestamps

      t.index %i[type name], name: :inventory_products_type_name_index, unique: true
    end
  end
end
