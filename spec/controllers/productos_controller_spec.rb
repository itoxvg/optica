require 'rails_helper'

RSpec.describe ProductosController, type: :controller do

  let(:vendedor) { create :usuario, :vendedor }

  let(:valid_attributes) { attributes_for :producto, usuario: vendedor }
  let(:invalid_attributes) { attributes_for :producto, nombre: nil }

  before { sign_in vendedor }

  describe "GET #index" do
    it "returns a success response" do
      Producto.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end # describe "GET #index"

  describe "GET #show" do
    it "returns a success response" do
      producto = Producto.create! valid_attributes
      get :show, params: { id: producto.id }
      expect(response).to be_successful
    end
  end # describe "GET #new"

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end # describe "GET #new"

  describe "GET #edit" do
    it "returns a success response" do
      producto = Producto.create! valid_attributes
      get :edit, params: { id: producto.to_param }
      expect(response).to be_successful
    end
  end # describe "GET #new"

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Producto" do
        expect {
          post :create, params: { producto: valid_attributes }
        }.to change(Producto, :count).by(1)
      end

      it "redirects to the created producto" do
        post :create, params: { producto: valid_attributes }
        expect(response).to redirect_to(Producto.last)
      end
    end # context with valid params

    context "with invalid params" do
      it "displays the 'new' template" do
        post :create, params: { producto: invalid_attributes }
        expect(response).to be_successful
      end
    end # context with invalid params
  end # describe "GET #new"

  describe "POST #update" do
    context "with valid params" do
      let(:new_attributes) do
        { nombre: 'nuevo' }
      end

      it "updates the requested producto" do
        producto = Producto.create! valid_attributes
        put :update, params: { id: producto.to_param, producto: new_attributes }
        producto.reload
        expect(producto.nombre).to eq 'nuevo'
      end

      it "redirects to the producto" do
        producto = Producto.create! valid_attributes
        put :update, params: { id: producto.to_param, producto: new_attributes }
        expect(response).to redirect_to producto
      end
    end # context with valid params

    context "with invalid params" do
      it "displays the 'edit' template" do
        producto = Producto.create! valid_attributes
        put :update, params: { id: producto.to_param, producto: invalid_attributes }
        expect(response).to be_successful
      end
    end # context with invalid params
  end # describe "POST #update"

end
