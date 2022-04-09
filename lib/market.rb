class Market
  attr_reader :price

  def initialize(*)
    product_list = File.readlines("#{Dir.pwd}/lib/date/product_list.txt")
    normalized_product_list = product_list.map { |string| string.chomp.downcase.split(' ') }
    @price = Hash.new
    normalized_product_list.map { |string_arr| @price[string_arr[0]] = string_arr[1].to_i }
  end

  def view_price
    price.map { |key, value| "#{key} стоит #{value}$" }
  end
end
