require 'rails_helper'

RSpec.describe Vendedor, type: :model do

  describe "#establecer_cargo" do
    context "with cargo 'admin'" do
      let(:vendedor) { create :vendedor, cargo: 'admin' }

      it "must be 'vendedor'" do
        expect(vendedor.cargo).to eq 'vendedor'
      end
    end # context with cargo 'admin'

    context "without cargo" do
      let(:vendedor) { create :vendedor, cargo: nil }

      it "must be 'vendedor'" do
        expect(vendedor.cargo).to eq 'vendedor'
      end
    end # context without cargo
  end # describe "#establecer_cargo"

end
