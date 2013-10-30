require "spec_helper"

describe DeliveryMenController do
  describe "routing" do

    it "routes to #index" do
      get("/delivery_men").should route_to("delivery_men#index")
    end

    it "routes to #new" do
      get("/delivery_men/new").should route_to("delivery_men#new")
    end

    it "routes to #show" do
      get("/delivery_men/1").should route_to("delivery_men#show", :id => "1")
    end

    it "routes to #edit" do
      get("/delivery_men/1/edit").should route_to("delivery_men#edit", :id => "1")
    end

    it "routes to #create" do
      post("/delivery_men").should route_to("delivery_men#create")
    end

    it "routes to #update" do
      put("/delivery_men/1").should route_to("delivery_men#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/delivery_men/1").should route_to("delivery_men#destroy", :id => "1")
    end

  end
end
