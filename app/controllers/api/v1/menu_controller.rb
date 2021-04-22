class Api::V1::MenuController < ApplicationController
    def index
        render json: MenuSerializer.new(MenuFacade.fetch_menu)
    end
end