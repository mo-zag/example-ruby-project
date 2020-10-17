# frozen_string_literal: true

require_relative '../classes/total_discount'

describe TotalDiscount do
  describe '#apply_discount' do
    it '10 percent discount' do
      item_discount = TotalDiscount.new(10, 6000)
      expect(item_discount.apply_promotion(7420)).to eq(6678)
    end

    it 'No percent discount' do
      item_discount = TotalDiscount.new(10, 6000)
      expect(item_discount.apply_promotion(5000)).to eq(5000)
    end
  end
end
