require 'rails_helper'

RSpec.describe "Boletos", type: :request do

  let!(:tienda) { create :tienda }
  let(:vendedor) { create :vendedor }

  before { sign_in vendedor }

  describe "GET /api/boletos/:id/ventas" do
    let(:venta) { create :venta, usuario: vendedor }

    it "debe regresar el boleto de venta" do
      get ventas_api_boleto_path venta
      expect(response).to have_http_status 200
    end
  end # describe "GET /api/boletos/:id/ventas"
end
