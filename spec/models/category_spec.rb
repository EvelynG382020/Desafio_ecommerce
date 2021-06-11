require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'can create categories' do
    category = Category.create(name: 'smartphone')
    expect(category).to be_instance_of(Category)
  end

  it 'cant create categories with same name' do
    category1 = Category.create(name: 'Smartphone')
    category2 = Category.create(name: 'smartphone')
    expect(category2).to_not be true
  end

  it 'cant create categories with blank name' do
    category = Category.create(name: '')
    expect(category).to_not be true
  end

  it 'category can have many children categories' do
    category_father = Category.create(id: 1, name: 'the father')
    children1 = Category.create(name: 'son', category_id: '1')
    children2 = Category.create(name: 'another son', category_id: '1')

    expect(category_father.children_categories.count).to eq(2)
  end

  it 'category can have one parent category' do
    category_father = Category.create(id: 1, name: 'the father')
    children1 = Category.create(name: 'son', category_id: '1')

    expect(children1.parent_category.name).to eq('the father')
  end

end

