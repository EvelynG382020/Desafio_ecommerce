class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

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
