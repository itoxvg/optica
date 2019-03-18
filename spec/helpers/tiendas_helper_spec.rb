require 'rails_helper'

RSpec.describe TiendasHelper, type: :helper do

  describe "#tienda_actual" do
    context "cuando existe la tienda" do
      let!(:tienda) { create :tienda }

      it "debe ser de tipo Tienda" do
        expect(tienda_actual).to be_a Tienda
      end

      it "debe regresar la primer tienda" do
        expect(tienda_actual).to eq tienda
      end
    end # context cuando existe empresa

    context "cuando no existe la tienda" do
      it "debe ser de tipo NilClass" do
        expect(tienda_actual).to be_a NilClass
      end

      it "debe regresar nil" do
        expect(tienda_actual).to be_nil
      end
    end # context cuando no existe tienda
  end # describe "#tienda_actual"

end
