require "rails_helper"

RSpec.describe ArmazonesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/armazones").to route_to("armazones#index")
    end

    it "routes to #new" do
      expect(get: "/armazones/new").to route_to("armazones#new")
    end

    it "routes to #show" do
      expect(get: "/armazones/1").to route_to("armazones#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get: "/armazones/1/edit").to route_to("armazones#edit", :id => "1")
    end


    it "routes to #create" do
      expect(post: "/armazones").to route_to("armazones#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/armazones/1").to route_to("armazones#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/armazones/1").to route_to("armazones#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/armazones/1").to route_to("armazones#destroy", :id => "1")
    end
  end
end
