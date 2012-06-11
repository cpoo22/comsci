FactoryGirl.define do
  factory :order_item do
    price 1.5
    product_code "5000"
    quantity 1
    discount 1.5
    weight 1
    product_name "Becks Silver Zapper"
  end
end
