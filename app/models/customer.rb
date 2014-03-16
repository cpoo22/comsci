class Customer < ActiveRecord::Base
  has_many :orders, :dependent => :destroy
  attr_accessible :title,
                  :first_name,
                  :surname,
                  :address_1,
                  :address_2,
                  :address_3,
                  :town,
                  :county,
                  :country,
                  :postcode,
                  :daytel,
                  :hometel,
                  :email_address
  validates       :title,
                  :first_name,
                  :surname,
                  :address_1,
                  :town,
                  :county,
                  :country,
                  :postcode, :presence => true
end
