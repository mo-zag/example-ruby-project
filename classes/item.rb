# frozen_string_literal: true

# Item class used to add discounts to basket total
class Item
  attr_reader :code, :name
  attr_accessor :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
  end
end
