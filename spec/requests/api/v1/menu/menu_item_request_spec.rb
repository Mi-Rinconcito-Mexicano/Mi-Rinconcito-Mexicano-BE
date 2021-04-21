require 'rails_helper'

describe 'Menu API' do
    before(:each) do
        combo_cat_id = MenuCategory.create(name: 'Combinaciones / Combos').id
        @combination = MenuItem.create(name: 'Combination 1',
            description: 'Testing',
            price: 11.95,
            menu_category_id: combo_cat_id,
            extra: [{info: 'Half or Whole beef', price: 2}, {info: 'Any Change', price: 1}])
            
        require 'pry'; binding.pry 
        taco_cat_id = MenuCategory.create(name: 'Tacos', description: 'Order of three corn tortillas with onions and cilantro').id
        @chicken_taco = MenuItem.create(name: 'Pollo / Chicken', price: 5.95, menu_category_id: taco_cat_id)

        appetizer_cat_id = MenuCategory.create(name: 'Appetizers').id
        guacamole_picante = MenuItem.create(name: 'Guacamole Picante', price: 7.50, tags: ['vegeterian', 'hot', 'vegan'], menu_category_id: appetizer_cat_id)
    end

    it 'can send all menu items' do
      get '/api/vi/menu'

      expect(response).to be_successfull

      menu_items = JSON.parse(response.body, symbolize_names: true)

      expect(menu_items.count).to eq(3) 
    end
end