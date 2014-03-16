require 'spec_helper'

describe "postal_costs/edit" do
  before(:each) do
    @postal_cost = assign(:postal_cost, stub_model(PostalCost,
      :code => "MyString",
      :weight => 1.5,
      :cost => 1.5
    ))
  end

  it "renders the edit postal_cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => postal_costs_path(@postal_cost), :method => "post" do
      assert_select "input#postal_cost_code", :name => "postal_cost[code]"
      assert_select "input#postal_cost_weight", :name => "postal_cost[weight]"
      assert_select "input#postal_cost_cost", :name => "postal_cost[cost]"
    end
  end
end
