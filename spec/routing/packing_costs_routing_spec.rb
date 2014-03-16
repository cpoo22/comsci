require "spec_helper"

describe PackingCostsController do
  describe "routing" do

    it "routes to #index" do
      get("/packing_costs").should route_to("packing_costs#index")
    end

    it "routes to #new" do
      get("/packing_costs/new").should route_to("packing_costs#new")
    end

    it "routes to #show" do
      get("/packing_costs/1").should route_to("packing_costs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/packing_costs/1/edit").should route_to("packing_costs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/packing_costs").should route_to("packing_costs#create")
    end

    it "routes to #update" do
      put("/packing_costs/1").should route_to("packing_costs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/packing_costs/1").should route_to("packing_costs#destroy", :id => "1")
    end

  end
end
