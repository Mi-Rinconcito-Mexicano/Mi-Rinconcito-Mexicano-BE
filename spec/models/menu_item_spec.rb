require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe 'Relationships' do
    it { should belong_to :menu_category }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :price }
    it { should validate_presence_of :menu_category_id }
  end
end
