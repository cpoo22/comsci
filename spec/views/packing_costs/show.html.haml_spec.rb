require 'spec_helper'

describe "packing_costs/show" do
  before(:each) do
    @packing_cost = assign(:packing_cost, stub_model(PackingCost,
      :Code => "Code",
      :Description => "Description",
      :packing_cost => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Description/)
    rendered.should match(/1.5/)
  end
end
