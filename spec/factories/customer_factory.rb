FactoryGirl.define do
  factory :customer do
    title "Mr"
    first_name "John"
    last_name  "Doe"
    address_line_1 "22 Sharon Lane"
    address_line_2 "Poopy Green"
    town "Creepy"
    county "Kent"
    country "UK"
    postcode "TH78 6YH"
    telephone_number "01454 576476"
    mobile_number "08898 898874"
    email "poopy@poopy.com"
  end
end