# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :packing_cost do
    Code "MyString"
    Description "MyString"
    packing_cost 1.5
  end
end
