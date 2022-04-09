require 'market'
require 'basket'
require 'discount'
require 'cashbox'

class App
  PROMPT = '>> '

  attr_reader :view_price, :basket

  def initialize
    market = Market.new
    @view_price = market.view_price
    @basket = Basket.new
  end

  def instruction
    <<~HEREDOC
      - Ввыберете товар и введите его название в командную строку, и нажмите 'Enter'
      - Затем введите желаемое колличество товара, и нажмите 'Enter'
    HEREDOC
  end

  def instruction_pay
    <<~HEREDOC
      - перейти к оплате : введите 'pay'
      - или нажмите 'Enter', что бы продолжить покупки
    HEREDOC
  end

  def output_discount(discount)
    <<~HEREDOC
      - ваша скидка составила: #{discount}$
    HEREDOC
  end

  def output_cashbox(cashbox)
    <<~HEREDOC
      - финальная цена: #{cashbox}$
    HEREDOC
  end

  def input
    print PROMPT
    gets.chomp.downcase
  end

  def start
    loop do
      print view_price
      puts
      puts instruction
      basket.filling_basket(input, input)
      puts basket.show_basket
      puts instruction_pay
      break if input == 'pay'
    end

    bask = basket.basket
    discount = Discount.new(bask).run
    cashbox = Cashbox.new(discount, bask).run

    puts output_discount(discount)
    puts output_cashbox(cashbox)
  end

  def self.start
    new.start
  end
end
