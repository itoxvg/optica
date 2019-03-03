require 'rails_helper'

RSpec.describe Cliente, type: :model do

  it { should have_many :ventas }
  it { should have_one(:domicilio).dependent(:destroy) }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of(:nombre).case_insensitive }
  it { should accept_nested_attributes_for(:domicilio).allow_destroy(true) }

  describe ".recientes_primero" do
    let!(:cliente_ayer) { create :cliente, created_at: 1.day.ago }
    let!(:cliente_hoy) { create :cliente, created_at: Date.current }

    it "debe mostrar el último vendedor creado, primero" do
      expect(Cliente.recientes_primero).to eq [cliente_hoy, cliente_ayer]
    end
  end # describe ".recientes_primero"

end
