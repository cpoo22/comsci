class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_items, :dependent => :destroy
  accepts_nested_attributes_for :order_items, :reject_if => lambda { |a| a[:product_code].blank? }, :allow_destroy => true

  validates :order_date, :total_price, :total_weight, :presence => true

  validates_numericality_of :total_price, :total_weight, :greater_than_or_equal_to => 0

  attr_accessible :discount, :order_date, :total_price, :total_weight, :order_items_attributes, :postage, :postage_type

  def calc_order_price
    self.total_price = 0
    self.order_items.each do |item|
      item.calc_item_total
      self.total_price += (item.items_price || 0)
    end
    self.total_price = self.total_price/100*(100 - discount) if discount
    self.total_price = self.total_price + self.postage if self.postage
  end

  def calc_order_weight
    self.total_weight = 0
    self.order_items.each do |item|
      self.total_weight += (item.weight || 0) * (item.quantity || 0)
    end
  end

  def tot_me_up
    self.calc_order_price
    self.calc_order_weight
    self.postage = PostalCost.order("weight ASC").where("code = '#{self.postage_type}' and weight >= ?", self.total_weight).first.cost

  end

  def update_products
    self.order_items.each {|item| item.update_product }
  end


end
