class Order < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :discount, :order_date, :total_price, :total_weight
end
