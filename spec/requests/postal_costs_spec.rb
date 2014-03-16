require 'spec_helper'

describe "PostalCosts" do
  describe "GET /postal_costs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get postal_costs_path
      response.status.should be(200)
    end
  end
end
