Product.destroy_all

category_1 = Category.find_by(name: "Smartphones")

p_01 = Product.create(name: "iPhone XS", description: "Super retina screen")
p_01.categories << category_1

p_02 = Product.create(name: "Xiaomi Mi Mix 3", description: "Borderless, powerful, super camera")
p_02.categories << category_1

p_03 = Product.create(name: "Xiaomi Pocophone", description: "The best phone for millenials")
p_03.categories << category_1

p_04 = Product.create(name: "Samsung S10", description: "Beautiful, elegant, powerful phone")
p_04.categories << category_1

category_2 = Category.find_by(name: "Shoes")

p_05 = Product.create(name: "Zico Beach Sandal", description: "The best sandal ever")
p_05.categories << category_2

p_06 = Product.create(name: "Adidas Superstart", description: "The old school sneakers")
p_06.categories << category_2

p_07 = Product.create(name: "Timberland Premium", description: "The classic yellow boots")
p_07.categories << category_2

category_3 = Category.find_by(name: "Accesories")

p_08 = Product.create(name: "Men Wallet", description: "Waterproof leather wallet")
p_08.categories << category_3

p_09 = Product.create(name: "Keychain", description: "Keep your keys together. Safe.")
p_09.categories << category_3

p_10 = Product.create(name: "Casio L12 Watch", description: "Never be late again, arrive on time")
p_10.categories << category_3


