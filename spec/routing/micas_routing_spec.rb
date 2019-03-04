require "rails_helper"

RSpec.describe MicasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/micas").to route_to("micas#index")
    end

    it "routes to #new" do
      expect(get: "/micas/new").to route_to("micas#new")
    end

    it "routes to #show" do
      expect(get: "/micas/1").to route_to("micas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get: "/micas/1/edit").to route_to("micas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(post: "/micas").to route_to("micas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/micas/1").to route_to("micas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/micas/1").to route_to("micas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/micas/1").to route_to("micas#destroy", :id => "1")
    end
  end
end
