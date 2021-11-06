# frozen_string_literal: true

module Inventory
  module Unit
    # Inventory::Unit::Base
    class Base < ::ApplicationRecord
      self.table_name = :inventory_units

      before_save :underscore_name, if: :name_present?

      after_initialize :titleize_name

      validates :type, presence: true, allow_blank: false
      validates :name, presence: true, allow_blank: false

      has_many :recipe_ingredients, class_name: 'Cookbook::RecipeIngredient', as: :unit, dependent: :destroy

      def self.options_for_select
        options = {}

        order(:name).all.each do |unit|
          type = unit.type.split('::').last

          if options[type].present?
            options[type] << unit.option_for_select
          else
            options[type] = [unit.option_for_select]
          end
        end

        options
      end

      def self.select_prompt
        'Select Unit'
      end

      def option_for_select
        [name, option_for_select_value]
      end

      def option_for_select_value
        "#{type}#id=#{id}"
      end

      private

      def name_present?
        name.present?
      end

      def underscore_name
        self.name = name.underscore
      end

      def titleize_name
        self.name = name.titleize if name.present?
      end
    end
  end
end
