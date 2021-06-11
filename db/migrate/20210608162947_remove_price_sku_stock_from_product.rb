class RemovePriceSkuStockFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :price
    remove_column :products, :stock
    remove_column :products, :sku
  end
end
