require "rails_helper"

RSpec.describe Api::CorporacionesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/corporaciones").to route_to("api/corporaciones#index")
    end
  end
end

