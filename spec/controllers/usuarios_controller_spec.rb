require 'rails_helper'

RSpec.describe UsuariosController, type: :controller do

  let(:admin) { create :usuario, :admin }

  let(:valid_attributes) { attributes_for :usuario, :vendedor }
  let(:invalid_attributes) { attributes_for :usuario, nombre: nil }

  before { sign_in admin }

  describe "GET #index" do
    it "returns a success response" do
      Usuario.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end # describe "GET #index"

  describe "GET #show" do
    it "returns a success response" do
      usuario = Usuario.create! valid_attributes
      get :show, params: { id: usuario.to_param }
      expect(response).to be_successful
    end
  end # describe "GET #show"

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end # describe "GET #new"

  describe "GET #edit" do
    it "returns a success response" do
      usuario = Usuario.create! valid_attributes
      get :edit, params: { id: usuario.to_param }
      expect(response).to be_successful
    end
  end # describe "GET #edit"

  describe "POST #post" do
    context "with valid params" do
      it "creates a new Usuario" do
        expect {
          post :create, params: { usuario: valid_attributes }
        }.to change(Usuario, :count).by(1)
      end

      it "redirects to the created usuario" do
        post :create, params: { usuario: valid_attributes }
        expect(response).to redirect_to(Usuario.last)
      end
    end # context with valid params

    context "with invalid params" do
      it "displays the 'new' template" do
        post :create, params: { usuario: invalid_attributes }
        expect(response).to be_successful
      end
    end # context with invalid params
  end # describe "POST #post"

  describe "POST #update" do
    context "with valid params" do
      let(:new_attributes) do
        { nombre: 'nuevo' }
      end

      it "updates the requested usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, params: { id: usuario.to_param, usuario: new_attributes }
        usuario.reload
        expect(usuario.nombre).to eq 'nuevo'
      end

      it "redirects to the usuario" do
        usuario = Usuario.create! valid_attributes
        put :update, params: { id: usuario.to_param, usuario: new_attributes }
        expect(response).to redirect_to usuario
      end
    end # context with valid params

    context "with invalid params" do
      it "display the 'edit' template" do
        usuario = Usuario.create! valid_attributes
        put :update, params: { id: usuario.to_param, usuario: invalid_attributes }
        expect(response).to be_successful
      end
    end # context with invalid params
  end # describe "POST #update"

end
