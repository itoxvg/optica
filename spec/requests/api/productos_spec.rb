require 'rails_helper'

RSpec.describe "Productos", type: :request do

  let(:vendedor) { create :vendedor }

  before :each do
    sign_in vendedor
  end

  describe "GET /api/productos" do
    it "returns productos list" do
      get api_productos_path, params: { format: :json }
      expect(response).to have_http_status 200
    end
  end # describe "GET /api/productos"
end
