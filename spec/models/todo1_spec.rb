require 'rails_helper'

RSpec.describe Todo1, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      todo = Todo1.new(title: 'Test Todo', status: false)
      expect(todo).to be_valid
    end

    it 'is not valid without a title' do
      todo = Todo1.new(title: nil, status: false)
      expect(todo).not_to be_valid
    end

    it 'is not valid without status' do
      todo = Todo1.new(title: 'Incomplete todo', status: nil)
      expect(todo).not_to be_valid
    end
  end
end
