class Product < ActiveRecord::Base
  attr_accessible :code, :name, :weight, :price

  validates :code, :name, :weight, :price, :presence => true
  validates_numericality_of :price, :weight, :greater_than_or_equal_to => 0

end
