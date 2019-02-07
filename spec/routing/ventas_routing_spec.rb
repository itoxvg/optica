require "rails_helper"

RSpec.describe VentasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/ventas").to route_to("ventas#index")
    end

    it "routes to #new" do
      expect(:get => "/ventas/new").to route_to("ventas#new")
    end

    it "routes to #show" do
      expect(:get => "/ventas/1").to route_to("ventas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ventas/1/edit").to route_to("ventas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ventas").to route_to("ventas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ventas/1").to route_to("ventas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ventas/1").to route_to("ventas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ventas/1").to route_to("ventas#destroy", :id => "1")
    end
  end
end
