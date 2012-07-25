class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items, :dependent => :destroy
  #accepts_nested_attributes_for :order_items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :order_items, :allow_destroy => true

  attr_accessible :discount, :order_date, :total_price, :total_weight, :order_items_attributes
end
