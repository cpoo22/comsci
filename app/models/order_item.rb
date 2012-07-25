class OrderItem < ActiveRecord::Base
  belongs_to :order
  attr_accessible :discount, :product_code, :product_name, :quantity, :weight, :unit_price, :items_price
end
