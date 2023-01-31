require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    it 'passes when all fields are correctly entered' do
      @category = Category.create(name: "Test1")
      @product = Product.create(name: "June Tree", price_cents: 2000, quantity: 5, category: @category)
      expect(@product.errors.full_messages).to be_empty
    end
    it 'fails with correct error message when name is nill' do
      @category = Category.create(name: "Test2")
      @product = Product.create(name: nil, price_cents: 2000, quantity: 5, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it 'fails correct error message when price is nill' do
      @category = Category.create(name: "Test3")
      @product = Product.create(name: "Blue Tree", price_cents: nil, quantity: 5, category: @category)
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end
    it 'fails with correct error message when price is nill' do
      @category = Category.create(name: "Test4")
      @product = Product.create(name: "Blue Tree", price_cents: 2000, quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'fails with correct error message when category is nill' do
      @product = Product.create(name: "Blue Tree", price_cents: 2000, quantity: nil, category: nil)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    

  end

end
