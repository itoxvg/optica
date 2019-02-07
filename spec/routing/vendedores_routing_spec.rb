require "rails_helper"

RSpec.describe VendedoresController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/vendedores").to route_to("vendedores#index")
    end

    it "routes to #new" do
      expect(:get => "/vendedores/new").to route_to("vendedores#new")
    end

    it "routes to #show" do
      expect(:get => "/vendedores/1").to route_to("vendedores#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/vendedores/1/edit").to route_to("vendedores#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vendedores").to route_to("vendedores#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vendedores/1").to route_to("vendedores#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vendedores/1").to route_to("vendedores#update", :id => "1")
    end

  end
end
