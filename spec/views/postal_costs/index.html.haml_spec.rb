require 'spec_helper'

describe "postal_costs/index" do
  before(:each) do
    assign(:postal_costs, [
      stub_model(PostalCost,
        :code => "Code",
        :weight => 1.5,
        :cost => 1.5
      ),
      stub_model(PostalCost,
        :code => "Code",
        :weight => 1.5,
        :cost => 1.5
      )
    ])
  end

  it "renders a list of postal_costs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
