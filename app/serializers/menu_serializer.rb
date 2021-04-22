class MenuSerializer
  include JSONAPI::Serializer
  attributes :category, :description, :category_items
end
