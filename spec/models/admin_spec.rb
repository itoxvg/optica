require 'rails_helper'

RSpec.describe Admin, type: :model do

  describe "#establecer_cargo" do
    context "with cargo 'vendedor'" do
      let(:admin) { create :admin, cargo: 'vendedor' }

      it "must be 'admin'" do
        expect(admin.cargo).to eq 'admin'
      end
    end # context with cargo 'vendedor'

    context "without cargo" do
      let(:admin) { create :admin, cargo: nil }

      it "must be 'admin'" do
        expect(admin.cargo).to eq 'admin'
      end
    end # context without cargo
  end # describe "#establecer_cargo"

end
