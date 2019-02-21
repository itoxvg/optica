require 'rails_helper'

RSpec.describe Venta, type: :model do

  it { should belong_to :cliente }
  it { should belong_to :usuario }
  it { should have_many(:vendidos).dependent(:destroy) }
  it { should have_many(:productos).through :vendidos }

  it { should accept_nested_attributes_for :vendidos }
  it { should accept_nested_attributes_for :cliente }

  it { should validate_presence_of :cliente }
  it { should validate_presence_of :fecha_entrega }
  it { should validate_presence_of :pago }

  it { should_not allow_value(0).for(:total) }
  it { should_not allow_value(0).for(:pago) }

  describe "#asignar_siguiente_codigo" do
    context "when venta without codigo" do
      let(:venta) { build :venta, codigo: nil }

      it "assigns codigo" do
        expect { venta.save! }.to change { venta.codigo }
      end
    end # context when venta without codigo
  end # describe "#asignar_siguiente_codigo"

end
