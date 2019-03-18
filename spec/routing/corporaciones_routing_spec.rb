require "rails_helper"

RSpec.describe CorporacionesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/corporaciones").to route_to("corporaciones#index")
    end

    it "routes to #new" do
      expect(:get => "/corporaciones/new").to route_to("corporaciones#new")
    end

    it "routes to #show" do
      expect(:get => "/corporaciones/1").to route_to("corporaciones#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/corporaciones/1/edit").to route_to("corporaciones#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/corporaciones").to route_to("corporaciones#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/corporaciones/1").to route_to("corporaciones#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/corporaciones/1").to route_to("corporaciones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/corporaciones/1").to route_to("corporaciones#destroy", :id => "1")
    end
  end
end

