require 'rails_helper'

RSpec.describe Vendedor, type: :model do

  describe ".recientes_primero" do
    let!(:vendedor_ayer) { create :vendedor, created_at: 1.day.ago }
    let!(:vendedor_hoy) { create :vendedor, created_at: Date.current }

    it "debe mostrar el último vendedor creado, primero" do
      expect(Vendedor.recientes_primero).to eq [vendedor_hoy, vendedor_ayer]
    end
  end # describe ".recientes_primero"

end
