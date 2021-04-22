require 'rails_helper'

describe 'Menu Facade' do
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

    it 'returns an array of Menu poro objects' do
        menu = MenuFacade.fetch_menu

        expect(menu).to be_a(Array)
        expect(menu.count).to eq(3)
        expect(menu.first).to be_a_instance_of(Menu)
        expect(menu.last).to be_a_instance_of(Menu)

        expect(menu[0].category).to eq(@combo_cat.category)
        expect(menu[0].description).to eq(@combo_cat.description)
        expect(menu[0].category_items).to eq([@combination_1, @combination_2])

        expect(menu[-1].category).to eq(@appetizer_cat.category)
        expect(menu[-1].description).to eq(@appetizer_cat.description)
        expect(menu[-1].category_items).to eq([@guacamole_picante])
    end
end