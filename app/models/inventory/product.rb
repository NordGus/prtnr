# frozen_string_literal: true

module Inventory
  # Inventory::Product
  module Product
    def self.table_name_prefix
      'inventory_product_'
    end
  end
end
