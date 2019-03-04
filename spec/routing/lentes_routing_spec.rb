require "rails_helper"

RSpec.describe LentesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lentes").to route_to("lentes#index")
    end

    it "routes to #new" do
      expect(get: "/lentes/new").to route_to("lentes#new")
    end

    it "routes to #show" do
      expect(get: "/lentes/1").to route_to("lentes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get: "/lentes/1/edit").to route_to("lentes#edit", :id => "1")
    end


    it "routes to #create" do
      expect(post: "/lentes").to route_to("lentes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lentes/1").to route_to("lentes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lentes/1").to route_to("lentes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lentes/1").to route_to("lentes#destroy", :id => "1")
    end
  end
end
