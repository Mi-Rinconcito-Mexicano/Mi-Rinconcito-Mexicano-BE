class Menu
    attr_reader :id, :category, :description, :category_items
    def initialize(menu_category)
        @id = menu_category.id
        @category = menu_category.category
        @description = menu_category.description
        @category_items = menu_category.menu_items
    end
end