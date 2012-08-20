FactoryGirl.define do
  factory :order do
    total_price 1.5
    total_weight 1
    order_date Time.now
    discount 1.5
    customer

    #factory :order_with_items do
    #  ignore do
    #      items_count 5
    #  end
    #
    #  after(:create) do |order, evaluator|
    #    FactoryGirl.create_list(:order_item, evaluator.items_count, order: order)
    #  end
    #
    #end
  end
end