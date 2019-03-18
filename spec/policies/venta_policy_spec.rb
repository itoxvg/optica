require 'rails_helper'

RSpec.describe VentaPolicy, type: :policy do
  let(:admin) { create :administrador }
  let(:vendedor) { create :vendedor }

  subject { described_class }

  permissions :deuda? do
    context "cuando la venta es saldada" do
      let(:registro) { create :venta, saldada: true }

      it "no debe acceder cuando es administrador" do
        expect(subject).to permit(admin, registro)
      end

      it "no debe acceder cuando es vendedor" do
        expect(subject).to permit(vendedor, registro)
      end
    end # context cuando la venta es saldada

    context "cuando la venta no es saldada" do
      let(:registro) { create :venta, saldada: false }

      it "debe accerder cuando es administrador" do
        expect(subject).to permit(admin, registro)
      end

      it "debe accerder cuando es vendedor" do
        expect(subject).to permit(vendedor, registro)
      end
    end # context cuando la venta no es saldada
  end

end
