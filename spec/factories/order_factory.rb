FactoryGirl.define do
  factory :order do
    total_price 1.5
    total_weight 1
    order_date Time.now
    discount 1.5
    customer
  end
end