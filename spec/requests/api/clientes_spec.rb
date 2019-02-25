require 'rails_helper'

RSpec.describe "Clientes", type: :request do

  let(:vendedor) { create :vendedor }

  before :each do
    sign_in vendedor
  end

  describe "GET /api/clientes.json" do
    it "debe regresar una lista de clientes" do
      get api_clientes_path, params: { format: :json }
      expect(response).to have_http_status 200
    end
  end # describe "GET /api/clientes"
end
