require 'rails_helper'

RSpec.describe "Corporaciones", type: :request do
  let(:vendedor) { create :vendedor }

  before { sign_in vendedor }

  describe "GET /api/corporaciones.json" do
    it "debe regresar una lista de clientes" do
      get api_corporaciones_path, params: { format: :json }
      expect(response).to have_http_status 200
    end
  end # describe "GET /api/corporaciones.json"

end
