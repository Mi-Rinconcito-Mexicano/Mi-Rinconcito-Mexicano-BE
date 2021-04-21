require 'rails_helper'

RSpec.describe MenuCategory, type: :model do
  describe 'Relationships' do
    it {should have_many :menu_items}
  end

  describe 'Validations' do
    it {should validate_presence_of :name}
  end
end
