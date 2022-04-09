class Basket < Market

  attr_reader :basket

  def initialize
    super
    @basket = Hash.new
  end

  def filling_basket(product, count)
    basket[product] = count.to_i if price.has_key?(product)
  end

  def show_basket
    basket.map { |key, value| "#{key} кол-во #{value}" }
  end
end
