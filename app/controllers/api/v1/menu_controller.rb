class Api::V1::MenuController < ApplicationController
    def index
        render json: MenuItem.all
    end
end