require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:all) do
    @category = Category.find_or_create_by name: 'Trees'
    @product = @category.products.create({
      name: 'Giant Tea',
      description: "test",
      image: 'plante_1.jpg',
      quantity: 0,
      price: 64.99
      })
    end

  describe 'Validations' do
    it 'returns true Product includes name, price, quantity & category' do
      expect(@product.name).to be_truthy
      expect(@product.price).to be_truthy
      expect(@product.quantity).to be_truthy
      expect(@product.category).to be_truthy
    end
    it 'returns true Product includes name' do
      expect(@product.name).to be_truthy
    end
    it 'returns true Product includes price' do
      expect(@product.price).to be_truthy
    end
    it 'returns true Product includes quantity' do
      expect(@product.quantity).to be_truthy
    end
    it 'returns true Product includes category' do
      expect(@product.category).to be_truthy
    end
  end
end

