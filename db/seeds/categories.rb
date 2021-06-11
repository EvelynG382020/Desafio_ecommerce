Category.destroy_all

categories = [ 'Smartphones', 'Shoes', 'Accesories']

categories.each do |category|
    Category.create(name: category)
end