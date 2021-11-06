# frozen_string_literal: true

module Diet
  module Menu
    # Diet::Menu::Item
    class Item < ApplicationRecord
      belongs_to :recipe, class_name: 'Cookbook::Recipe', inverse_of: :menu_items, foreign_key: :recipe_id

      validates :date, presence: true
      validates :portions, presence: true, numericality: { greater_than: 0 }
    end
  end
end
