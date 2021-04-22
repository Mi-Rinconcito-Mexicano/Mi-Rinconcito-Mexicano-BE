class MenuFacade
    class << self
        def fetch_menu
            MenuCategory.all.map do |menu_cat|
                Menu.new(menu_cat, menu_cat.menu_items)
            end
        end
    end
end