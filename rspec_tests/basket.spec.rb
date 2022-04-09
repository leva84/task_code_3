require_relative 'spec_helper'

describe Basket do
  describe 'Basket.new #basket' do
    it 'returns the hash class empty' do
      basket = Basket.new

      expect(basket.basket.class).to eql(Hash)
      expect(basket.basket.empty?).to eql(true)
    end
  end

  describe '#filling_basket' do
    it 'fills the basket. Hash class, not empty' do
      basket = Basket.new
      basket.filling_basket('a', 2)

      expect(basket.basket.class).to eql(Hash)
      expect(basket.basket.empty?).to eql(false)
    end
  end

  describe '#show_basket' do
    it 'return array strings products' do
      basket = Basket.new
      basket.filling_basket('d', 3)

      expect(basket.show_basket.class).to eql(Array)
      expect(basket.show_basket[0].class).to eql(String)
      expect(basket.show_basket[0]).to eql("d кол-во 3")
    end
  end
end
