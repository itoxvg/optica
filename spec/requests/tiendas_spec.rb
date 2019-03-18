require 'rails_helper'

RSpec.describe "Tiendas", type: :request do

  let(:administrador) { create :administrador }

  before { sign_in administrador }

  describe "GET /tiendas" do
    it "debe regresar una respuesta exitosa" do
      get tiendas_path
      expect(response).to have_http_status(200)
    end
  end # describe "GET /tiendas"

  describe "GET /tiendas/:id" do
    let(:tienda) { create :tienda }

    it "debe regresar una respuesta exitosa" do
      get tienda_path tienda
      expect(response).to have_http_status(200)
    end
  end # describe "GET /tiendas/:id"

  describe "GET /tiendas/new" do
    it "debe regresar una respuesta exitosa" do
      get new_tienda_path
      expect(response).to have_http_status(200)
    end
  end # describe "GET /tiendas/new"

  describe "POST /tiendas" do
    context "con atributos validos" do
      let(:tienda) { attributes_for :tienda }

      it "redirige a la tienda creada" do
        post tiendas_path, params: { tienda: tienda }
        expect(response).to have_http_status(302)
      end
    end # context con atributos validos

    context "con atributos invalidos" do
      let(:tienda) { attributes_for :tienda, nombre: nil }

      it "debe regresar una respuesta exitosa" do
        post tiendas_path, params: { tienda: tienda }
        expect(response).to have_http_status(200)
      end
    end # context con attributos invalidos
  end # describe "POST /tiendas"

  describe "GET /tiendas/:id/edit" do
    let(:tienda) { create :tienda }

    it "debe regresar una respuesta exitosa" do
      get edit_tienda_path tienda
      expect(response).to have_http_status(200)
    end
  end # describe "GET /tiendas/:id/edit"

end
