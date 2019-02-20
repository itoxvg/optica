require 'rails_helper'

RSpec.describe "Boletos", type: :request do

  let(:vendedor) { create :vendedor }

  before :each do
    sign_in vendedor
  end

  describe "GET /api/boletos/:id/ventas" do
    let(:venta) { create :venta, usuario: vendedor }

    it "returns a venta's boleto" do
      get ventas_api_boleto_path venta
      expect(response).to have_http_status 200
    end
  end # describe "GET /api/boletos/:id/ventas"
end
