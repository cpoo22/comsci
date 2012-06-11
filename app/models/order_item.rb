class OrderItem < ActiveRecord::Base
  attr_accessible :discount, :price, :product_code, :product_name, :quantity, :weight
end
