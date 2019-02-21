require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe "#codigo_de_barras" do
    context "Venta" do
      let(:venta) { create :venta }

      it "not returns an imagen" do
        expect(codigo_de_barras(venta)).not_to match(/img/)
      end

      it "returns a svg" do
        expect(codigo_de_barras(venta)).to match(/svg/)
      end
    end # context Venta
  end # describe "#codigo_de_barras"

end
