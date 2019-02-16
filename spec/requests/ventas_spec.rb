require 'rails_helper'

RSpec.describe "Ventas", type: :request do

  let(:cliente) { create :cliente }
  let(:vendedor) { create :vendedor }
  let(:ventas) { create_list :venta, 2, cliente: cliente, usuario: vendedor }
  let(:venta) { create :venta, cliente: cliente, usuario: vendedor }

  before :each do
    sign_in vendedor
  end

  describe "GET /ventas" do
    it "returns ventas list" do
      ventas
      get ventas_path
      expect(response).to have_http_status(200)
    end
  end # describe "GET /ventas"

  describe "GET /ventas/:id" do
    it "returns venta show" do
      get venta_path venta.to_param
      expect(response).to have_http_status(200)
    end
  end # describe "GET /ventas/:id"

  describe "GET /ventas/new" do
    it "returns venta new" do
      get new_venta_path
      expect(response).to have_http_status(200)
    end
  end # describe "GET /ventas/new"

  describe "GET /ventas/:id/edit" do
    it "returns venta edit" do
      get edit_venta_path venta.to_param
      expect(response).to have_http_status(200)
    end
  end # describe "GET /ventas/:id/edit"

end
