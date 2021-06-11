class HomeController < ApplicationController
  def index
    @products = Product.products_with_stock
  end
end
