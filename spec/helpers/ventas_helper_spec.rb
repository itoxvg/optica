require 'rails_helper'

RSpec.describe VentasHelper, type: :helper do
  describe "#estado_de_pago" do
    context "cuando una venta es saldada" do
      let(:venta) { create :venta, total: 100, pago: 100, saldada: true }

      it "debe ser 'PAGADO'" do
        expect(estado_de_pago(venta)).to match(/PAGADO/)
      end
    end # context cuando una venta es saldada

    context "cuando una venta es deudora" do
      let(:venta) { create :venta, total: 100, pago: 1, saldada: false }

      it "debe ser 'PENDIENTE'" do
        expect(estado_de_pago(venta)).to match(/PENDIENTE/)
      end
    end # context cuando una venta es deudora
  end # describe ".estado"
end
