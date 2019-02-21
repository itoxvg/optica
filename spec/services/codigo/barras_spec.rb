require 'rails_helper'

RSpec.describe Codigo::Barras do

  describe "convert codigo to svg" do
    context "Venta" do
      let(:venta) { create :venta, codigo: "1000000000016" }

      it "most be a svg" do
        expect(Codigo::Barras.new(venta).convertir).to match(/svg/)
      end

      it "returns content '1000000000016'" do
        expect(Codigo::Barras.new(venta).convertir).to match(venta.codigo)
      end
    end # context Venta
  end # describe "parse codigo to svg"

end
