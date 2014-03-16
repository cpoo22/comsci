require "spec_helper"

describe PostalCostsController do
  describe "routing" do

    it "routes to #index" do
      get("/postal_costs").should route_to("postal_costs#index")
    end

    it "routes to #new" do
      get("/postal_costs/new").should route_to("postal_costs#new")
    end

    it "routes to #show" do
      get("/postal_costs/1").should route_to("postal_costs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/postal_costs/1/edit").should route_to("postal_costs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/postal_costs").should route_to("postal_costs#create")
    end

    it "routes to #update" do
      put("/postal_costs/1").should route_to("postal_costs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/postal_costs/1").should route_to("postal_costs#destroy", :id => "1")
    end

  end
end
