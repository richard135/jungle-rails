require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have the parameters name, price, quantity and category' do
      @category = Category.new({name: 'Anything'})
      @category.save
      @product = Product.new({
        name: 'name',
        price: 21,
        quantity: 12,
        category_id: @category.id })
      expect(@product.save).to be true
    end
  end

  describe 'Validation without name' do
    it 'should not save this product' do
      @category = Category.new ({name:'Anything'})
      @category.save
      @product = Product.new({
        name: nil,
        price: 21,
        quantity: 12,
        category_id: @category.id
        })
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
  end

  describe 'Validation without price' do
    it 'should not save this product' do
      @category = Category.new ({name:'Anything'})
      @category.save
      @product = Product.new({
        name: 'Rich',
        price: nil,
        quantity: 12,
        category_id: @category.id
        })
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  end

  describe 'Validation without quantity' do
    it 'should not save this product' do
      @category = Category.new ({name:'Anything'})
      @category.save
      @product = Product.new({
        name: 'Rich',
        price: 21,
        quantity: nil,
        category_id: @category.id
        })
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
  describe 'Validation without category' do
    it 'should not save this category' do
      @category = Category.new ({name:'Anything'})
      @category.save
      @product = Product.new({
        name: 'Rich',
        price: nil,
        quantity: 12,
        category_id: nil
        })
      expect{@product.save!}.to raise_error(ActiveRecord::RecordInvalid)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  end
end

