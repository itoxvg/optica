require 'rails_helper'

RSpec.describe Venta, type: :model do

  it { should belong_to :cliente }
  it { should belong_to :usuario }
  it { should have_many(:vendidos).dependent(:destroy) }
  it { should have_many(:productos).through :vendidos }
  it { should have_many(:pagos).dependent(:destroy) }

  it { should accept_nested_attributes_for :vendidos }
  it { should accept_nested_attributes_for :pagos }

  it { should validate_presence_of :cliente }
  it { should validate_presence_of :fecha_entrega }

  it { should_not allow_value(0).for(:total) }

  describe ".recientes_primero" do
    let!(:venta_de_ayer) { create :venta, created_at: 1.day.ago }
    let!(:venta_de_hoy) { create :venta, created_at: Date.current }

    it "debe mostrar la última venta creada primero" do
      expect(Venta.recientes_primero).to eq [venta_de_hoy, venta_de_ayer]
    end
  end # describe ".recientes_primero"

  describe "#suma_precios_venta" do
    context "suma el precio_venta de los vendidos" do
      let(:pago) do
        build_list :pago, 1, efectivo: 1000, anticipo: 800, cambio: 200
      end
      let(:venta) do
        create :venta, :con_dos_armazones, :con_dos_micas,
          pagos: pago, total: 800
      end

      it "debe ser 900" do
        expect(venta.suma_precios_venta).to eq 900
      end
    end # context suma el precio_venta de los vendidos
  end # describe "#suma_precios_venta"

  describe "#suma_descuentos" do
    context "suma el descuento de los vendidos" do
      let(:pago) do
        build_list :pago, 1, efectivo: 1000, anticipo: 800, cambio: 200
      end
      let(:venta) do
        create :venta, :con_dos_armazones, :con_dos_micas,
          pagos: pago, total: 800
      end

      it "debe ser 100" do
        expect(venta.suma_descuentos).to eq 100
      end
    end # context suma el descuento de los vendidos
  end # describe "#suma_descuentos"

  describe "#asignar_siguiente_codigo" do
    context "when venta without codigo" do
      let(:venta) { build :venta, codigo: nil }

      it "assigns codigo" do
        expect { venta.save! }.to change { venta.codigo }
      end
    end # context when venta without codigo
  end # describe "#asignar_siguiente_codigo"

end
