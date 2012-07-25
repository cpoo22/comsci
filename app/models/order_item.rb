class OrderItem < ActiveRecord::Base
  belongs_to :order
  attr_accessible :discount, :price, :product_code, :product_name, :quantity, :weight
end
