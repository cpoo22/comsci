class Customer < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  attr_accessible :title, :first_name, :last_name, :address_line_1, :address_line_2, :address_line_3, :town, :county, :country, :postcode, :telephone_number, :mobile_number, :email
end
