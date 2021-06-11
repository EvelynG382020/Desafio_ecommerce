class Category < ApplicationRecord
  has_many :children_categories, class_name: "Category",
  foreign_key: "category_id"
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id'


  has_and_belongs_to_many :products

  def self.bring_all_the_child_categories
    children_categories = []
    self.children_categories.each do |child_category|
        children_categories << child_category.name
    end
    children_categories
  end

  def self.parent_category
    self.parent_category.name
  end

end
