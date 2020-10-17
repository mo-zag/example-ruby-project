# frozen_string_literal: true

require_relative '../classes/item'

describe Item do
  describe '#Item object' do
    it 'Expect item code to be 001' do
      item = Item.new('001', 'Lavender heart', 925)
      expect(item.code).to eq('001')
    end

    it 'Expect item price to be 925' do
      item = Item.new('001', 'Lavender heart', 925)
      expect(item.price).to eq(925)
    end

    it 'Expect item name to be Lavender heart' do
      item = Item.new('001', 'Lavender heart', 925)
      expect(item.name).to eq('Lavender heart')
    end
  end
end
