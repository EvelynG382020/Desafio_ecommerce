class AddReferencesToOrderItem < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_items, :variation, foreign_key: true
  end
end
