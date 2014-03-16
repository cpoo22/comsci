require 'spec_helper'

describe "postal_costs/show" do
  before(:each) do
    @postal_cost = assign(:postal_cost, stub_model(PostalCost,
      :code => "Code",
      :weight => 1.5,
      :cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
