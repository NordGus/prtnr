module Cookbook
  class Recipe < ApplicationRecord
    has_rich_text :preparation
    has_one_attached :cover_image

    validates :name, presence: true, uniqueness: true, allow_blank: false
    validates :description, length: { within: 0..200 }
    validates :portions, numericality: { greater_than: 0 }
  end
end
