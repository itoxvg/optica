require "rails_helper"

RSpec.describe Api::ProductosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/productos").to route_to("api/productos#index")
    end
  end
end

