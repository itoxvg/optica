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
