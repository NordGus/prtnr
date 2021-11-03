# frozen_string_literal: true

module Inventory
  module Product
    # Inventory::Product::Base
    class Base < ::ApplicationRecord
      self.table_name = :products

      validates :type, presence: true, allow_blank: false
      validates :name, presence: true, allow_blank: false
    end
  end
end
