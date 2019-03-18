require 'rails_helper'

RSpec.describe TiendasController, type: :controller do

  let(:administrador) { create :administrador }
  let(:domicilio) { attributes_for :domicilio }
  let(:valid_attributes) { attributes_for :tienda, domicilio_attributes: domicilio }
  let(:invalid_attributes) { attributes_for :tienda, nombre: nil }

  before { sign_in administrador }

  describe "GET #index" do
    it "debe regresar una respuesta exitosa" do
      Tienda.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "debe regresar una respuesta exitosa" do
      tienda = Tienda.create! valid_attributes
      get :show, params: {id: tienda.to_param}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "debe regresar una respuesta exitosa" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "debe regresar una respuesta exitosa" do
      tienda = Tienda.create! valid_attributes
      get :edit, params: {id: tienda.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "con atributos validos" do
      it "debe crear una nueva Tienda" do
        expect {
          post :create, params: {tienda: valid_attributes}
        }.to change(Tienda, :count).by(1)
      end

      it "debe crear un nuevo Domicilio" do
        expect {
          post :create, params: {tienda: valid_attributes}
        }.to change(Domicilio, :count).by(1)
      end

      it "redirige a la tienda creada" do
        post :create, params: {tienda: valid_attributes}
        expect(response).to redirect_to(Tienda.last)
      end
    end

    context "con atributos invalidos" do
      it "debe mostrar la vista new" do
        post :create, params: {tienda: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "con atributos validos" do
      let(:new_attributes) { { nombre: "nuevo nombre" } }

      it "actualiza la tienda solicitada" do
        tienda = Tienda.create! valid_attributes
        put :update, params: {id: tienda.to_param, tienda: new_attributes}
        tienda.reload
        expect(tienda.nombre).to eq "nuevo nombre"
      end

      it "redirige a la tienda editada" do
        tienda = Tienda.create! valid_attributes
        put :update, params: {id: tienda.to_param, tienda: valid_attributes}
        expect(response).to redirect_to(tienda)
      end
    end

    context "con atributos invalidos" do
      it "debe mostrar la vista edit" do
        tienda = Tienda.create! valid_attributes
        put :update, params: {id: tienda.to_param, tienda: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "debe eliminar la empresa solicitada" do
      tienda = Tienda.create! valid_attributes
      expect {
        delete :destroy, params: {id: tienda.to_param}
      }.to change(Tienda, :count).by(-1)
    end

    it "debe mostrar la lista de tienda" do
      tienda = Tienda.create! valid_attributes
      delete :destroy, params: {id: tienda.to_param}
      expect(response).to redirect_to(tiendas_url)
    end
  end

end
