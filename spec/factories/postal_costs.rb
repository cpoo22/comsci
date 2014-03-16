# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :postal_cost do
    code "MyString"
    weight 1.5
    cost 1.5
  end
end
