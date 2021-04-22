class Api::V1::MenuController < ApplicationController
    def index
        menu = MenuCategory.all.map do |menu_cat|
            Menu.new(menu_cat)
        end
        
        render json: MenuSerializer.new(menu)
    end
end