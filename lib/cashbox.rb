class Cashbox < Market

  attr_reader :basket, :discount

  def initialize(discount, basket)
    super
    @discount = discount
    @basket = basket.map { |name, count| Array.new(count, name) }.flatten(1)
  end

  def grand_total
    basket.map { |key| price.values_at(key)[0].to_f }.inject(0, :+)
  end

  def run
    grand_total - discount
  end
end
