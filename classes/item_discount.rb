# frozen_string_literal: true

# ItemDiscount class used to add discounts to basket items in cart checkout
class ItemDiscount
  attr_reader :code, :num, :price

  def initialize(code, num, price)
    @code = code
    @num = num
    @price = price
  end

  def apply_promotion(basket)
    basket.map do |_key, product|
      product[:item].price = @price if product[:item].code == @code && product[:count] >= @num
    end
    basket
  end
end
