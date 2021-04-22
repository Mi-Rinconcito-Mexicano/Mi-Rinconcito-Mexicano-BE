# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

combo_cat_id = MenuCategory.create(category: 'Combinaciones / Combos').id
MenuItem.create(name: 'Combination 1',
                               description: 'Testing',
                               price: 11.95,
                               menu_category_id: combo_cat_id,
                               extra: [{info: 'Half or Whole beef', price: 2}, {info: 'Any Change', price: 1}])

MenuItem.create(name:'Combination 2',
                description: 'test', 
                price:12.95, 
                menu_category_id:combo_cat_id, 
                extra:[{info:'Half or whole beef', price:2},{info:'Any change',price:1}])

taco_cat_id = MenuCategory.create(category: 'Tacos', description: 'Order of three corn tortillas with onions and cilantro').id
MenuItem.create(name: 'Pollo / Chicken', price: 5.95, menu_category_id: taco_cat_id)

appetizer_cat_id = MenuCategory.create(category: 'Appetizers').id
MenuItem.create(name: 'Guacamole Picante', price: 7.50, tags: ['vegeterian', 'hot', 'vegan'], menu_category_id: appetizer_cat_id)