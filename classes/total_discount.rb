# frozen_string_literal: true

# TotalDiscount class used to add discounts can be
# percentage or overall cost
class TotalDiscount
  attr_reader :precentage, :price

  def initialize(precentage, price)
    @precentage = precentage
    @price = price
  end

  def percentage_discount(total)
    discount = 0
    discount = total * @precentage / 100 if total > @price
    total - discount
  end

  def apply_promotion(total)
    percentage_discount(total)
  end
end
