require "rails_helper"

RSpec.describe Api::ClientesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/clientes").to route_to("api/clientes#index")
    end
  end
end

