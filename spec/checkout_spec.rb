# frozen_string_literal: true

require_relative '../classes/checkout'

describe Checkout do
  before(:each) do
    @lavender_heart = Item.new('001', 'Lavender heart', 925)
    @personalised_cufflinks = Item.new('002', 'Personalised cufflinks', 4500)
    @kids_t_shirt = Item.new('003', 'Kids T-shirt', 1995)
  end

  before(:all) do
    @lavender_heart_discount = { item: ItemDiscount.new('001', 2, 850), type: 'basket_item' }
    @cart_percentage_discount = { item: TotalDiscount.new(10, 6000), type: 'basket_total' }
  end

  describe '#total' do
    it 'When checkout total is 0' do
      @co = Checkout.new([@lavender_heart_discount, @cart_percentage_discount])
      expect(@co.total).to eq(0)
    end

    it 'When checkout qualifies for percentage discount 001,002,003' do
      @co = Checkout.new([@lavender_heart_discount, @cart_percentage_discount])
      @co.scan(@lavender_heart)
      @co.scan(@personalised_cufflinks)
      @co.scan(@kids_t_shirt)
      expect(@co.total).to eq(6678)
    end

    it 'When checkout qualifies for item promotion 001,003,001' do
      @co = Checkout.new([@lavender_heart_discount, @cart_percentage_discount])
      @co.scan(@lavender_heart)
      @co.scan(@kids_t_shirt)
      @co.scan(@lavender_heart)
      expect(@co.total).to eq(3695)
    end

    it 'When checkout qualifies for discount and percentage promotion 001,002,001,003' do
      @co = Checkout.new([@lavender_heart_discount, @cart_percentage_discount])
      @co.scan(@lavender_heart)
      @co.scan(@lavender_heart)
      @co.scan(@personalised_cufflinks)
      @co.scan(@kids_t_shirt)
      expect(@co.total).to eq(7376)
    end
  end
end
