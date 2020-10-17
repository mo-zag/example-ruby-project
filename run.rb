# frozen_string_literal: true

require_relative './classes/checkout'
require_relative './classes/item'
require_relative './classes/item_discount'
require_relative './classes/total_discount'

lavender_heart = Item.new('001', 'Lavender heart', 925)
personalised_cufflinks = Item.new('002', 'Personalised cufflinks', 4500)
kids_t_shirt = Item.new('003', 'Kids T-shirt', 1995)
lavender_heart_discount = { item: ItemDiscount.new('001', 2, 850), type: 'basket_item' }
cart_percentage_discount = { item: TotalDiscount.new(10, 6000), type: 'basket_total' }

checkout = Checkout.new([lavender_heart_discount, cart_percentage_discount])
puts checkout.total

checkout = Checkout.new([lavender_heart_discount, cart_percentage_discount])
checkout.scan(lavender_heart)
checkout.scan(personalised_cufflinks)
checkout.scan(kids_t_shirt)
puts checkout.total

checkout = Checkout.new([lavender_heart_discount, cart_percentage_discount])
checkout.scan(lavender_heart)
checkout.scan(kids_t_shirt)
checkout.scan(lavender_heart)
puts checkout.total

checkout = Checkout.new([lavender_heart_discount, cart_percentage_discount])
checkout.scan(lavender_heart)
checkout.scan(lavender_heart)
checkout.scan(personalised_cufflinks)
checkout.scan(kids_t_shirt)
puts checkout.total
