class AddCategoriesToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :category, foreign_key: true
  end
end
