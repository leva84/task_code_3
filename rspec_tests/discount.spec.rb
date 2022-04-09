# frozen_string_literal: true

require_relative 'spec_helper'

describe Cashbox do
  describe '#initialize' do
    it 'create discount(integer) and basket_collection(array) and price' do
      market = Market.new
      basket = Basket.new
      discount = Discount.new(basket.basket)

      expect(discount.price).to eql(market.price)
      expect(discount.basket_collection).to eql([])
      expect(discount.discount).to eql(0)
    end
  end

  describe '#basket_collection' do
    it 'return array' do
      Market.new
      basket = Basket.new
      basket.filling_basket('b', 3)
      basket.filling_basket('a', 3)
      discount = Discount.new(basket.basket)

      expect(discount.basket_collection).to eql(%w[b b b a a a])
    end
  end
end
