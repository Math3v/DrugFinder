require "spec_helper"

describe HoldersController do
  describe "routing" do

    it "routes to #index" do
      get("/holders").should route_to("holders#index")
    end

    it "routes to #new" do
      get("/holders/new").should route_to("holders#new")
    end

    it "routes to #show" do
      get("/holders/1").should route_to("holders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/holders/1/edit").should route_to("holders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/holders").should route_to("holders#create")
    end

    it "routes to #update" do
      put("/holders/1").should route_to("holders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/holders/1").should route_to("holders#destroy", :id => "1")
    end

  end
end
