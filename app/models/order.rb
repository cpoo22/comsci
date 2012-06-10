class Order < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :total_price, :discount, :order_date, :total_weight
end
