# frozen_string_literal: true

# CreateInventoryProducts
class CreateInventoryProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :inventory_products do |t|
      t.string :type, null: false
      t.string :name, null: false

      t.timestamps
    end

    add_index :inventory_products, %i[type name], unique: true, name: :index_inventory_product_type_name_uniqueness
  end
end
