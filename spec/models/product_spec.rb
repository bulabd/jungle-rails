require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(name: "Bushes")
    end
    
    it "should save a product with all four fields set" do
      @product = Product.new(name: "Bush", price: 25.00, quantity: 34, category: @category)
      expect(@product).to be_valid
    end

    it "should not save a product with the name field empty" do
      @product = Product.new(name: nil, price: 25.00, quantity: 34, category: @category)
      expect(@product).to_not be_valid
    end

    it "should not save a product with the price field empty" do
      @product = Product.new(name: "Bush", price: "", quantity: 34, category: @category)
      expect(@product).to_not be_valid
    end

    it "should not save a product with the quantity field empty" do
      @product = Product.new(name: "Bush", price: 25.00, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end

    it "should not save a product with the category field empty" do
      @product = Product.new(name: "Bush", price: 25.00, quantity: 34, category: nil)
      expect(@product).to_not be_valid
    end

  end
end
