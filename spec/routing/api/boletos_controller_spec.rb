require "rails_helper"

RSpec.describe Api::BoletosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/boletos/1/ventas").to route_to("api/boletos#ventas", id: "1")
    end
  end
end

