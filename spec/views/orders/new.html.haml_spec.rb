require 'spec_helper'

describe "orders/new.html.haml" do

  it "should have one order item line" do
    @customer = FactoryGirl.create(:customer)
    assign(:customer, @customer)
    assign(:order, @customer.orders.build)

    render

    rendered.should match("New order")
  end
end
