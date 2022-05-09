require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before(:all) do
    @category = Category.find_or_create_by name: 'Trees'
    @product = @category.products.create({
      name: 'Giant Tea',
      description: "test",
      image: 'plante_1.jpg',
      quantity: 0,
      price_cents: 64.99
      })    
  end
  
  describe 'Validations' do
    it 'returns true Product includes name, price, quantity & category' do
      expect(@product.valid?).to be_truthy
    end

    it 'returns nil when Product does not include name' do
      @product.name = nil
      @product.save
      expect(@product.name).to be(nil)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'returns nil when Product does not include price' do
      @product.price_cents = nil
      @product.save
      expect(@product.price_cents).to be(nil)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'returns nil when Product does not include quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.quantity).to be(nil)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it 'returns true Product includes category' do
      expect(@product.category).to be_truthy
    end
  end
end

