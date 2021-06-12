class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :variations, dependent: :destroy 
  has_many :colors, through: :variations
  has_many :size, through: :variations

  has_many :order_items
  has_many :orders, through: :order_items
  accepts_nested_attributes_for :variations, reject_if: :all_blank, allow_destroy: true



  def self.products_with_stock
    products_with_stock = []
    self.all.each do |product|
      if product.variations.first && product.variations.first.stock > 0
        products_with_stock << product
      end
    end
    products_with_stock
  end

end
