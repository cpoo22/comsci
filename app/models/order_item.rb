class OrderItem < ActiveRecord::Base
  belongs_to :order
  attr_accessible :discount, :product_code, :product_name, :quantity, :weight, :unit_price, :items_price

  validates :discount, :product_code, :product_name, :quantity, :weight, :unit_price, :items_price, :presence => true

  validates_numericality_of :discount, :unit_price, :items_price, :weight, :greater_than_or_equal_to => 0

  def calc_item_total
    self.items_price = (((self.quantity||0) * (self.unit_price||0))/100 * (100 - (self.discount||0)))
  end

  def update_product
    product = Product.find_by_code self.product_code
    if product
      self.product_name = product.name
      self.unit_price = product.price
      self.weight = product.weight
    end
  end

end
