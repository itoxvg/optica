require 'rails_helper'

RSpec.describe CorporacionesController, type: :controller do

  let(:vendedor) { create :vendedor }
  let(:domicilio) { attributes_for :domicilio }
  let(:valid_attributes) { attributes_for :corporacion, domicilio_attributes: domicilio }
  let(:invalid_attributes) { attributes_for :corporacion, nombre: nil }

  before { sign_in vendedor }

  describe "GET #index" do
    it "debe regresar una respuesta exitosa" do
      Corporacion.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "debe regresar una respuesta exitosa" do
      corporacion = Corporacion.create! valid_attributes
      get :show, params: {id: corporacion.to_param}
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
      corporacion = Corporacion.create! valid_attributes
      get :edit, params: {id: corporacion.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "con atributos validos" do
      it "debe crear una nueva Corporacion" do
        expect {
          post :create, params: {corporacion: valid_attributes}
        }.to change(Corporacion, :count).by(1)
      end

      it "debe crear un nuevo Domicilio" do
        expect {
          post :create, params: {corporacion: valid_attributes}
        }.to change(Domicilio, :count).by(1)
      end

      it "redirige a la corporacion creada" do
        post :create, params: {corporacion: valid_attributes}
        expect(response).to redirect_to(Corporacion.last)
      end
    end

    context "con atributos invalidos" do
      it "debe mostrar la vista new" do
        post :create, params: {corporacion: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "con atributos validos" do
      let(:new_attributes) { { nombre: "nuevo nombre" } }

      it "actualiza la corporacion solicitada" do
        corporacion = Corporacion.create! valid_attributes
        put :update, params: {id: corporacion.to_param, corporacion: new_attributes}
        corporacion.reload
        expect(corporacion.nombre).to eq "nuevo nombre"
      end

      it "redirige a la corporacion editada" do
        corporacion = Corporacion.create! valid_attributes
        put :update, params: {id: corporacion.to_param, corporacion: valid_attributes}
        expect(response).to redirect_to(corporacion)
      end
    end

    context "con atributos invalidos" do
      it "debe mostrar la vista edit" do
        corporacion = Corporacion.create! valid_attributes
        put :update, params: {id: corporacion.to_param, corporacion: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "debe eliminar la corporacion solicitada" do
      corporacion = Corporacion.create! valid_attributes
      expect {
        delete :destroy, params: {id: corporacion.to_param}
      }.to change(Corporacion, :count).by(-1)
    end

    it "debe mostrar la lista de corporaciones" do
      corporacion = Corporacion.create! valid_attributes
      delete :destroy, params: {id: corporacion.to_param}
      expect(response).to redirect_to(corporaciones_url)
    end
  end

end
