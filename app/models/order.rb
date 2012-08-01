class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items, :dependent => :destroy
  #accepts_nested_attributes_for :order_items, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :order_items, :allow_destroy => true

  validates :order_date, :total_price, :total_weight, :presence => true

  validates_numericality_of :total_price, :total_weight, :greater_than_or_equal_to => 0

  attr_accessible :discount, :order_date, :total_price, :total_weight, :order_items_attributes

  def calc_order_price
    self.total_price = 0
    self.order_items.each do |item|
      self.total_price += item.items_price
    end
  end

  def calc_order_weight
    self.total_weight = 0
    self.order_items.each do |item|
      self.total_weight += item.weight * item.quantity
    end
  end

  def tot_me_up
    self.calc_order_price
    self.calc_order_weight
  end
end
