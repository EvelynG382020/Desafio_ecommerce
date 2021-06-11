class CreateVariations < ActiveRecord::Migration[6.1]
  def change
    create_table :variations do |t|
      t.decimal :price
      t.integer :stock
      t.string :sku
      t.references :product, null: false, foreign_key: true
      t.references :color, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
