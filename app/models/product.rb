class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :variations, dependent: :destroy 
  has_many :colors, through: :variations
  has_many :size, through: :variations

  has_many :order_items
  has_many :orders, through: :order_items
  accepts_nested_attributes_for :variations, reject_if: :all_blank, allow_destroy: true

  # def variations_size
  #     variations.pluck(:size)
  # end

  # def variations_color
  #     variations.pluck(:color)
  # end

  # def variations_stock
  #     variations.pluck(:stock)
  # end


end
