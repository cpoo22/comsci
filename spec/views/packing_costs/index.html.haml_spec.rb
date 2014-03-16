require 'spec_helper'

describe "packing_costs/index" do
  before(:each) do
    assign(:packing_costs, [
      stub_model(PackingCost,
        :Code => "Code",
        :Description => "Description",
        :packing_cost => 1.5
      ),
      stub_model(PackingCost,
        :Code => "Code",
        :Description => "Description",
        :packing_cost => 1.5
      )
    ])
  end

  it "renders a list of packing_costs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
