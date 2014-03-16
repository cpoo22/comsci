# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(  :title => 'Mr',
                  :first_name => 'Chris',
                  :surname => 'Chris',
                  :address_1  => '2 Hewly Close',
                  :address_2 => 'Fumblton',
                  :address_3 => 'Edgware',
                  :town => 'Brighton',
                  :county => 'West Sussex',
                  :country => 'UK',
                  :postcode => 'BN1 1AL',
                  :daytel => '01273 456789',
                  :hometel => '07789987654',
                  :email_address => 'test@testing.com')

Customer.create(  :title => 'Miss',
                  :first_name => 'Chras',
                  :surname => 'Chras',
                  :address_1  => '4 Hewly Close',
                  :address_2 => 'Fumblton',
                  :address_3 => 'Edgware',
                  :town => 'Brighton',
                  :county => 'West Sussex',
                  :country => 'UK',
                  :postcode => 'BN1 2AL',
                  :daytel => '01273 456789',
                  :hometel => '07789987654',
                  :email_address => 'test@testing.com')

Customer.create(  :title => 'Mr',
                  :first_name => 'Chris',
                  :surname => 'Chross',
                  :address_1  => '5 Hewly Close',
                  :address_2 => 'Fumblton',
                  :address_3 => 'Edgware',
                  :town => 'Brighton',
                  :county => 'West Sussex',
                  :country => 'UK',
                  :postcode => 'RX1 1AL',
                  :daytel => '01273 456789',
                  :hometel => '07789987654',
                  :email_address => 'test@testing.com')


Product.create(:code => '5000',
        :name => 'Becks',
        :weight => 1,
        :price => 10)

Product.create(:code => '5001',
        :name => 'Silver',
        :weight => 2,
        :price => 17.54)

PostalCost.create( code: '1st', weight: 1.1, cost: 2.1)
PostalCost.create( code: '2nd', weight: 1.2, cost: 2.2)
PostalCost.create( code: '3rd', weight: 1.3, cost: 2.3)
