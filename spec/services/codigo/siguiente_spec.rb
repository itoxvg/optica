require 'rails_helper'

RSpec.describe Codigo::Siguiente do
  describe "Venta" do
    let(:vendedor) { create :vendedor }
    let(:cliente) { create :cliente }
    let(:venta_uno) do
      create :venta, cliente: cliente, usuario: vendedor
    end
    let(:nueve_ventas) do
      create_list :venta, 9, cliente: cliente, usuario: vendedor
    end
    let(:venta) do
      create :venta, cliente: cliente, usuario: vendedor
    end

    context "#asignar" do
      it "returns 'V0000001'" do
        expect(venta.codigo).to eq 'V0000001'
      end

      it "returns 'V0000002'" do
        venta_uno
        expect(venta.codigo).to eq 'V0000002'
      end

      it "returns 'V0000010'" do
        nueve_ventas
        expect(venta.codigo).to eq 'V0000010'
      end
    end # context #asignar
  end # describe "Venta"
end
