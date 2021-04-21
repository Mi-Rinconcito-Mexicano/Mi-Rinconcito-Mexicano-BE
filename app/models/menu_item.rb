class MenuItem < ApplicationRecord
  belongs_to :menu_category
  validates_presence_of :name, :price, :menu_category_id
  serialize :tags, Array
  serialize :extra, Array
end
