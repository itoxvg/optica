require 'rails_helper'

RSpec.describe ProductosController, type: :controller do

  let(:valid_attributes) { attributes_for :producto }
  let(:invalid_attributes) { attributes_for :producto, nombre: nil }

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

end
