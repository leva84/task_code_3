# frozen_string_literal: true

class Discount < Market
  PROMO_DISCOUNT_A_B = ['a', 'b', 0.1]
  PROMO_DISCOUNT_D_E = ['d', 'e', 0.05]
  PROMO_DISCOUNT_E_F_G = ['e', 'f', 'g', 0.05]
  PROMO_DISCOUNT_A_K = ['a', 'k', 0.05]
  PROMO_DISCOUNT_A_L = ['a', 'l', 0.05]
  PROMO_DISCOUNT_A_M = ['a', 'm', 0.05]
  NO_DISCOUNT_PRODUCT = %w[a c]

  attr_reader :discount, :basket_collection

  def initialize(basket)
    super
    @basket_collection = basket.map { |name, count| Array.new(count, name) }.flatten(1)
    @discount = 0
  end

  def run
    promo_sets_calculation
    discount
  end

  private

  def discount_percentage
    quant = basket_collection.uniq.count
    if quant == 3
      0.05
    elsif quant == 4
      0.1
    elsif quant >= 5
      0.2
    end
  end

  def remove_product_from_basket(template)
    template.map { |item| basket_collection.delete(item) }
  end

  def discount_calculation(arr, percentage)
    arr.map { |key| price.values_at(key)[0] * percentage }.inject(0, :+)
  end

  def promo_check(promo_const)
    promo_const.map do |product|
      basket_collection.include?(product) ? product : nil
    end.compact.count + 1 == promo_const.count
  end

  def promo_calculation(promo_const)
    promo = promo_const
    promo_percentage = promo.pop

    promo_sets = promo.map { |product| basket_collection.count(product) }
    remove_product_from_basket(promo)
    @discount += discount_calculation(promo, promo_percentage) * promo_sets.min
  end

  def promo_sets_calculation
    promo_calculation(PROMO_DISCOUNT_A_B) if promo_check(PROMO_DISCOUNT_A_B)
    promo_calculation(PROMO_DISCOUNT_D_E) if promo_check(PROMO_DISCOUNT_D_E)
    promo_calculation(PROMO_DISCOUNT_E_F_G) if promo_check(PROMO_DISCOUNT_E_F_G)
    promo_calculation(PROMO_DISCOUNT_A_K) if promo_check(PROMO_DISCOUNT_A_K)
    promo_calculation(PROMO_DISCOUNT_A_L) if promo_check(PROMO_DISCOUNT_A_L)
    promo_calculation(PROMO_DISCOUNT_A_M) if promo_check(PROMO_DISCOUNT_A_M)
    remove_product_from_basket(NO_DISCOUNT_PRODUCT)
    discount_calculation(basket_collection, discount_percentage) unless discount_percentage.nil?
  end
end
