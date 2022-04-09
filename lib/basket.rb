# frozen_string_literal: true

class Basket < Market
  attr_reader :basket

  def initialize
    super
    @basket = {}
  end

  def filling_basket(product, count)
    basket[product] = count.to_i if price.key?(product)
  end

  def show_basket
    basket.map { |key, value| "#{key} кол-во #{value}" }
  end
end
