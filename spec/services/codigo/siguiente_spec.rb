require 'rails_helper'

RSpec.describe Codigo::Siguiente do

  describe "#asignar" do
    context "Venta" do
      let(:venta) { create :venta }
      let(:nueve_ventas) { create_list :venta, 9 }
      let(:cuarenta_y_nueve_ventas) { create_list :venta, 49 }

      it "returns '1000000000016' if is venta one" do
        expect(venta.codigo).to eq '1000000000016'
      end

      it "returns '1000000000108' if is venta ten" do
        nueve_ventas
        expect(venta.codigo).to eq '1000000000108'
      end

      it "returns '1000000000504' if is venta fifty" do
        cuarenta_y_nueve_ventas
        expect(venta.codigo).to eq '1000000000504'
      end
    end # context "Venta"
  end # describe #asignar
end
