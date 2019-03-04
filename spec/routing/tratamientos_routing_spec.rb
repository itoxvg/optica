require "rails_helper"

RSpec.describe TratamientosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tratamientos").to route_to("tratamientos#index")
    end

    it "routes to #new" do
      expect(get: "/tratamientos/new").to route_to("tratamientos#new")
    end

    it "routes to #show" do
      expect(get: "/tratamientos/1").to route_to("tratamientos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get: "/tratamientos/1/edit").to route_to("tratamientos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(post: "/tratamientos").to route_to("tratamientos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tratamientos/1").to route_to("tratamientos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tratamientos/1").to route_to("tratamientos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tratamientos/1").to route_to("tratamientos#destroy", :id => "1")
    end
  end
end
