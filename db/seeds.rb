# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Customer.create(  :title => 'Mr',
                  :first_name => 'Chris',
                  :last_name => 'Chris',
                  :address_line_1  => '2 Hewly Close',
                  :address_line_2 => 'Fumblton',
                  :address_line_3 => 'Edgware',
                  :town => 'Brighton',
                  :county => 'West Sussex',
                  :country => 'UK',
                  :postcode => 'BN1 1AL',
                  :telephone_number => '01273 456789',
                  :mobile_number => '07789987654',
                  :email => 'test@testing.com')

Customer.create(  :title => 'Miss',
                  :first_name => 'Chras',
                  :last_name => 'Chras',
                  :address_line_1  => '4 Hewly Close',
                  :address_line_2 => 'Fumblton',
                  :address_line_3 => 'Edgware',
                  :town => 'Brighton',
                  :county => 'West Sussex',
                  :country => 'UK',
                  :postcode => 'BN1 2AL',
                  :telephone_number => '01273 456789',
                  :mobile_number => '07789987654',
                  :email => 'test@testing.com')

Customer.create(  :title => 'Mr',
                  :first_name => 'Chris',
                  :last_name => 'Chross',
                  :address_line_1  => '5 Hewly Close',
                  :address_line_2 => 'Fumblton',
                  :address_line_3 => 'Edgware',
                  :town => 'Brighton',
                  :county => 'West Sussex',
                  :country => 'UK',
                  :postcode => 'RX1 1AL',
                  :telephone_number => '01273 456789',
                  :mobile_number => '07789987654',
                  :email => 'test@testing.com')


Product.create(:code => '5000',
        :name => 'Becks',
        :weight => 1,
        :price => 10)

Product.create(:code => '5001',
        :name => 'Silver',
        :weight => 2,
        :price => 17.54)