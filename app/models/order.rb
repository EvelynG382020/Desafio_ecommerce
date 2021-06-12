class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items
  has_many :payments
  has_many :variations

  validates :number, uniqueness: true

  def total_in_cents #metodo indica el total de la order utilizado en carts controller
    total * 100
  end

  def set_state_completed #metodo para indicar el estado de la order completado
    update_attributes(state: 'completed')
  end

  def add_product(product_id, quantity)
    product = Product.find(product_id)
    if product.variations.first && product.variations.first.stock > 0
      order_items.create(product_id: product.id, quantity: quantity, price: product.variations.first.price)
      compute_total
    end
  end

  def compute_total
    sum = 0
    order_items.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end
end
