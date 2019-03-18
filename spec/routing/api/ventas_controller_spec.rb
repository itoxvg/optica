require "rails_helper"

RSpec.describe Api::VentasController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/api/ventas/1").to route_to("api/ventas#show", id: "1")
    end
  end
end

