require 'rails_helper'

RSpec.describe VentasHelper, type: :helper do
  describe "#estado_de_pago" do
    context "cuando una venta es saldada" do
      let(:pago) { build_list :pago, 1, efectivo: 100, anticipo: 100 }
      let(:venta) { create :venta, pagos: pago, total: 100, saldada: true }

      it "debe ser 'PAGADO'" do
        expect(estado_de_pago(venta)).to match(/PAGADO/)
      end
    end # context cuando una venta es saldada

    context "cuando una venta es deudora" do
      let(:pago) { build_list :pago, 1, efectivo: 1, anticipo: 1 }
      let(:venta) { create :venta, pagos: pago, total: 100, saldada: false }

      it "debe ser 'PENDIENTE'" do
        expect(estado_de_pago(venta)).to match(/PENDIENTE/)
      end
    end # context cuando una venta es deudora
  end # describe ".estado"
end
