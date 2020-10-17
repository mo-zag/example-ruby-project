# frozen_string_literal: true

require_relative '../classes/item_discount'

describe ItemDiscount do
  describe '#itemDiscount' do
    it 'Apply discount with two items 001' do
      item_discount = ItemDiscount.new('001', 2, 850)
      @lavender_heart_discount = { item: item_discount, type: 'basket_item' }
      @lavender_heart = Item.new('001', 'Lavender heart', 925)
      @co = Checkout.new([@lavender_heart_discount])
      @co.scan(@lavender_heart)
      @co.scan(@lavender_heart)
      item_discount.apply_promotion(@co.basket)
      expect(@co.basket['001'][:item].price).to eq(850)
    end

    it 'No discount with applied for items 001' do
      item_discount = ItemDiscount.new('001', 2, 850)
      @lavender_heart_discount = { item: item_discount, type: 'basket_item' }
      @lavender_heart = Item.new('001', 'Lavender heart', 925)
      @personalised_cufflinks = Item.new('002', 'Personalised cufflinks', 4500)
      @co = Checkout.new([@lavender_heart_discount])
      @co.scan(@personalised_cufflinks)
      @co.scan(@lavender_heart)
      item_discount.apply_promotion(@co.basket)
      expect(@co.basket['001'][:item].price).to eq(925)
    end
  end
end
