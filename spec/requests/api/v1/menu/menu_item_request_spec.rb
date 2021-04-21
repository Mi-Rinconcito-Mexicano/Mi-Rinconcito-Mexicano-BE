require 'rails_helper'

describe 'Menu API' do
    before(:each) do
        combo_cat_id = MenuCategory.create(name: 'Combinaciones / Combos').id
        @combination = MenuItem.create(name: 'Combination 1',
            description: 'Testing',
            price: 11.95,
            menu_category_id: combo_cat_id,
            extra: [{info: "Half or Whole beef", price: 2}, {info: 'Any Change', price: 1}])

        taco_cat_id = MenuCategory.create(name: 'Tacos', description: 'Order of three corn tortillas with onions and cilantro').id
        @chicken_taco = MenuItem.create(name: 'Pollo / Chicken', price: 5.95, menu_category_id: taco_cat_id)

        appetizer_cat_id = MenuCategory.create(name: 'Appetizers').id
        @guacamole_picante = MenuItem.create(name: 'Guacamole Picante', price: 7.50, tags: ['vegeterian', 'hot', 'vegan'], menu_category_id: appetizer_cat_id)
    end

    it 'can send all menu items' do
        get '/api/v1/menu'

        expect(response).to be_successful
        menu_items = JSON.parse(response.body, symbolize_names: true)

        expect(menu_items.count).to eq(3)
        expect(menu_items[0][:id]).to eq(@combination.id)
        expect(menu_items[1][:id]).to eq(@chicken_taco.id) 
        expect(menu_items[2][:id]).to eq(@guacamole_picante.id) 
    end

    it 'extras and tags are arrays' do
        get '/api/v1/menu'

        expect(response).to be_successful
        menu_items = JSON.parse(response.body, symbolize_names: true)

        expect(menu_items[0][:extra]).to be_a(Array)
        expect(menu_items[0][:tags]).to be_a(Array)
        expect(menu_items[0][:extra][0]).to be_a(Hash)
        expect(menu_items[1][:extra]).to be_a(Array)
        expect(menu_items[1][:tags]).to be_a(Array)
        expect(menu_items[2][:extra]).to be_a(Array)
        expect(menu_items[2][:tags]).to be_a(Array)
    end
end