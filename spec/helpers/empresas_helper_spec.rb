require 'rails_helper'

RSpec.describe EmpresasHelper, type: :helper do

  describe "#empresa_actual" do
    context "cuando existe empresa" do
      let!(:empresa) { create :empresa }

      it "debe ser de tipo Empresa" do
        expect(empresa_actual).to be_an Empresa
      end

      it "debe regresar la primer empresa" do
        expect(empresa_actual).to eq empresa
      end
    end # context cuando existe empresa

    context "cuando no existe empresa" do
      it "debe ser de tipo NilClass" do
        expect(empresa_actual).to be_a NilClass
      end

      it "debe regresar nil" do
        expect(empresa_actual).to be_nil
      end
    end # context cuando no existe empresa
  end # describe "#empresa_actual"

end
