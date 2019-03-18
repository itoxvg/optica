require "rails_helper"

RSpec.describe TiendasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/tiendas").to route_to("tiendas#index")
    end

    it "routes to #new" do
      expect(:get => "/tiendas/new").to route_to("tiendas#new")
    end

    it "routes to #show" do
      expect(:get => "/tiendas/1").to route_to("tiendas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tiendas/1/edit").to route_to("tiendas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/tiendas").to route_to("tiendas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tiendas/1").to route_to("tiendas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tiendas/1").to route_to("tiendas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tiendas/1").to route_to("tiendas#destroy", :id => "1")
    end
  end
end
