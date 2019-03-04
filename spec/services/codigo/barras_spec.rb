require 'rails_helper'

RSpec.describe Codigo::Barras do

  describe "#convertir" do
    let(:venta) { create :venta, codigo: "1000000000016" }
    let(:producto) { create :armazon, codigo: 'ARMAZON1' }

    it "debe ser un svg" do
      expect(Codigo::Barras.new(venta).convertir).to match(/svg/)
      expect(Codigo::Barras.new(producto).convertir).to match(/svg/)
    end

    it "no debe ser una imagen" do
      expect(Codigo::Barras.new(venta).convertir).to_not match(/img/)
      expect(Codigo::Barras.new(producto).convertir).to_not match(/img/)
    end

    context "ean_13" do
      it "debe contenter '1000000000016'" do
        expect(Codigo::Barras.new(venta).convertir).to match(venta.codigo)
      end
    end # context ean_13

    context "code_128" do
      it "debe contenter 'ARMAZON1'" do
        expect(Codigo::Barras.new(producto).convertir).to match(producto.codigo)
      end
    end # context code_128
  end # describe "#convertir"

end
