require 'spec_helper'

describe "packing_costs/new" do
  before(:each) do
    assign(:packing_cost, stub_model(PackingCost,
      :Code => "MyString",
      :Description => "MyString",
      :packing_cost => 1.5
    ).as_new_record)
  end

  it "renders new packing_cost form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => packing_costs_path, :method => "post" do
      assert_select "input#packing_cost_Code", :name => "packing_cost[Code]"
      assert_select "input#packing_cost_Description", :name => "packing_cost[Description]"
      assert_select "input#packing_cost_packing_cost", :name => "packing_cost[packing_cost]"
    end
  end
end
