require_relative 'spec_helper'

describe Cashbox do
  describe '#initialize' do
    it 'create discount(integer) and basket(array)' do
      basket = Basket.new
      basket.filling_basket('a', 3)
      discount = 0
      cashbox = Cashbox.new(discount, basket.basket)

      expect(cashbox.discount).to eql(0)
      expect(cashbox.basket).to eql(['a', 'a', 'a'])
    end
  end

  describe '#grand_total' do
    it 'return full price(Float) of the cart without discount' do
      basket = Basket.new
      basket.filling_basket('b', 3)
      basket.filling_basket('a', 3)

      discount = Discount.new(basket.basket).run
      cashbox = Cashbox.new(discount, basket.basket)

      expect(cashbox.grand_total).to eql(75.0)
      expect(cashbox.grand_total.class).to eql(Float)
    end
  end
end
