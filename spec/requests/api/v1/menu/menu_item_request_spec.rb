require 'rails_helper'

describe 'Menu API' do
    before(:each) do
        @combo_cat = MenuCategory.create(category: 'Combinaciones / Combos')
        @combination_1 = MenuItem.create(name: 'Combination 1',
                                         description: 'Testing',
                                         price: 11.95,
                                         menu_category_id: @combo_cat.id,
                                         extra: [{info: "Half or Whole beef", price: 2}, {info: 'Any Change', price: 1}])
        
        @combination_2 = MenuItem.create(name:'Combination 2',
                                         description: 'test', 
                                         price:12.95, 
                                         menu_category_id:@combo_cat.id, 
                                         extra:[{info:'Half or whole beef', price:2},{info:'Any change',price:1}])

        @taco_cat = MenuCategory.create(category: 'Tacos', description: 'Order of three corn tortillas with onions and cilantro')
        @chicken_taco = MenuItem.create(name: 'Pollo / Chicken', price: 5.95, menu_category_id: @taco_cat.id)

        @appetizer_cat = MenuCategory.create(category: 'Appetizers')
        @guacamole_picante = MenuItem.create(name: 'Guacamole Picante', price: 7.50, tags: ['vegeterian', 'hot', 'vegan'], menu_category_id: @appetizer_cat.id)
    end

    it 'can fetch all menu categories' do
        get '/api/v1/menu'

        expect(response).to be_successful
        menu_items = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(menu_items[0][:type]).to eq('menu')
        expect(menu_items[0][:attributes][:category]).to eq(@combo_cat.category)
        expect(menu_items[0][:attributes][:description]).to eq(@combo_cat.description)

        expect(menu_items[1][:type]).to eq('menu')
        expect(menu_items[1][:attributes][:category]).to eq(@taco_cat.category)
        expect(menu_items[1][:attributes][:description]).to eq(@taco_cat.description)

        expect(menu_items[2][:type]).to eq('menu')
        expect(menu_items[2][:attributes][:category]).to eq(@appetizer_cat.category)
        expect(menu_items[2][:attributes][:description]).to eq(@appetizer_cat.description)        
    end

    it 'extras and tags are arrays with objects' do
        get '/api/v1/menu'

        expect(response).to be_successful
        menu_items = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(menu_items[0][:attributes][:category_items]).to be_a(Array)
        expect(menu_items[0][:attributes][:category_items].count).to eq(2)

        expect(menu_items[0][:attributes][:category_items][0][:name]).to eq(@combination_1.name)
        expect(menu_items[0][:attributes][:category_items][0][:description]).to eq(@combination_1.description)
        expect(menu_items[0][:attributes][:category_items][0][:price]).to eq(@combination_1.price)
        expect(menu_items[0][:attributes][:category_items][0][:extra]).to be_a(Array)
        expect(menu_items[0][:attributes][:category_items][0][:extra]).to eq(@combination_1.extra)
        expect(menu_items[0][:attributes][:category_items][0][:tags]).to be_a(Array)
        expect(menu_items[0][:attributes][:category_items][0][:tags]).to eq(@combination_1.tags)
        expect(menu_items[0][:attributes][:category_items][1][:name]).to eq(@combination_2.name)
        expect(menu_items[0][:attributes][:category_items][1][:description]).to eq(@combination_2.description)
        expect(menu_items[0][:attributes][:category_items][1][:price]).to eq(@combination_2.price)
        expect(menu_items[0][:attributes][:category_items][1][:extra]).to be_a(Array)
        expect(menu_items[0][:attributes][:category_items][1][:extra]).to eq(@combination_2.extra)
        expect(menu_items[0][:attributes][:category_items][1][:tags]).to be_a(Array)
        expect(menu_items[0][:attributes][:category_items][1][:tags]).to eq(@combination_2.tags)
        
        expect(menu_items[1][:attributes][:category_items]).to be_a(Array)
        expect(menu_items[1][:attributes][:category_items].count).to eq(1)

        expect(menu_items[1][:attributes][:category_items][0][:name]).to eq(@chicken_taco.name)
        expect(menu_items[1][:attributes][:category_items][0][:description]).to eq(@chicken_taco.description)
        expect(menu_items[1][:attributes][:category_items][0][:price]).to eq(@chicken_taco.price)
        expect(menu_items[1][:attributes][:category_items][0][:extra]).to be_a(Array)
        expect(menu_items[1][:attributes][:category_items][0][:extra]).to eq(@chicken_taco.extra)
        expect(menu_items[1][:attributes][:category_items][0][:tags]).to be_a(Array)
        expect(menu_items[1][:attributes][:category_items][0][:tags]).to eq(@chicken_taco.tags)

        expect(menu_items[2][:attributes][:category_items]).to be_a(Array)
        expect(menu_items[2][:attributes][:category_items].count).to eq(1)

        expect(menu_items[2][:attributes][:category_items][0][:name]).to eq(@guacamole_picante.name)
        expect(menu_items[2][:attributes][:category_items][0][:description]).to eq(@guacamole_picante.description)
        expect(menu_items[2][:attributes][:category_items][0][:price]).to eq(@guacamole_picante.price)
        expect(menu_items[2][:attributes][:category_items][0][:extra]).to be_a(Array)
        expect(menu_items[2][:attributes][:category_items][0][:extra]).to eq(@guacamole_picante.extra)
        expect(menu_items[2][:attributes][:category_items][0][:tags]).to be_a(Array)
        expect(menu_items[2][:attributes][:category_items][0][:tags]).to eq(@guacamole_picante.tags)
    end
end