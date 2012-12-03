require "spec_helper"

describe StickersController do
  describe "routing" do

    it "routes to #index" do
      get("/stickers").should route_to("stickers#index")
    end

    it "routes to #new" do
      get("/stickers/new").should route_to("stickers#new")
    end

    it "routes to #show" do
      get("/stickers/1").should route_to("stickers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stickers/1/edit").should route_to("stickers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stickers").should route_to("stickers#create")
    end

    it "routes to #update" do
      put("/stickers/1").should route_to("stickers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stickers/1").should route_to("stickers#destroy", :id => "1")
    end

  end
end
