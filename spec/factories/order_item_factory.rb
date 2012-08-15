FactoryGirl.define do
  factory :order_item do
    unit_price 1.5
    product_code "5000"
    quantity 2
    discount 1.5
    weight 1
    product_name "Becks Silver Zapper"
    items_price 3
    order
  end
end
