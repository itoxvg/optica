require 'rails_helper'

RSpec.describe "Ventas", type: :request do

  let(:vendedor) { create :vendedor }

  before :each do
    sign_in vendedor
  end

  describe "GET /api/ventas/:id" do
    let(:venta) { create :venta }

    it "debe regresar una respuesta exitosa" do
      get api_venta_path venta, params: { format: :json }
      expect(response).to have_http_status 200
    end
  end # describe "GET /api/ventas/:id"
end
