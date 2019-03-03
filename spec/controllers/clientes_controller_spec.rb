require 'rails_helper'

RSpec.describe ClientesController, type: :controller do

  let(:vendedor) { create :vendedor }

  let(:domicilio) { attributes_for :domicilio }
  let(:valid_attributes) do
    attributes_for :cliente, domicilio_attributes: domicilio
  end
  let(:invalid_attributes) { attributes_for :cliente, nombre: nil }

  before :each do
    sign_in vendedor
  end

  describe "GET #index" do
    it "debe regresar una respuesta exitosa" do
      Cliente.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end # describe "GET #index"

  describe "GET #show" do
    it "debe regresar una respuesta exitosa" do
      cliente = Cliente.create! valid_attributes
      get :show, params: { id: cliente.to_param }
      expect(response).to be_successful
    end
  end # describe "GET #show"

  describe "GET #new" do
    it "debe regresar una respuesta exitosa" do
      get :new
      expect(response).to be_successful
    end
  end # describe "GET #new"

  describe "POST #create" do
    context "con atributos validos" do
      it "debe crear un nuevo Cliente" do
        expect {
          post :create, params: {cliente: valid_attributes, format: :json}
        }.to change(Cliente, :count).by(1)
      end

      it "debe crear un nuevo Domicilio" do
        expect {
          post :create, params: {cliente: valid_attributes, format: :json}
        }.to change(Domicilio, :count).by(1)
      end
    end
  end
end
