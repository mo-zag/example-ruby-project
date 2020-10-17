# frozen_string_literal: true

# Checkout class for basket checkout items
class Checkout
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @items_basket = {}
    @total_sum = 0
  end

  def scan(item)
    @items_basket[item.code] ||= { item: item, count: 0 }
    @items_basket[item.code][:count] += 1
  end

  def total
    basket_item
    basket_total
    @total_sum
  end

  def basket
    @items_basket
  end

  private

  def basket_total
    @total_sum = basket_sum unless @items_basket.nil?
    @promotional_rules.each do |promotion_rule|
      @total_sum = promotion_rule[:item].apply_promotion(@total_sum) if promotion_rule[:type] == 'basket_total'
    end
  end

  def basket_sum
    @items_basket.each.sum { |_key, product| product[:item].price * product[:count] }
  end

  def basket_item
    @promotional_rules.each do |promotion_rule|
      @items_basket = promotion_rule[:item].apply_promotion(@items_basket) if promotion_rule[:type] == 'basket_item'
    end
  end
end
