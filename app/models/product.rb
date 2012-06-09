class Product < ActiveRecord::Base
  attr_accessible :code, :name, :weight, :price
end
