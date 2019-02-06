require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { should have_many :armazones }
  it { should have_many :lentes }
  it { should have_many :micas }

  it { should validate_presence_of :nombre }
  it { should validate_uniqueness_of(:nombre).case_insensitive }

  describe "#active_for_authentication?" do
    context "when activo is true" do
      let(:usuario) { create :vendedor, activo: true }

      it "must be activo" do
        expect(usuario.active_for_authentication?).to eq true
      end
    end # context when activo is true

    context "when activo is false" do
      let(:usuario) { create :vendedor, activo: false }

      it "must be desactivo" do
        expect(usuario.active_for_authentication?).to eq false
      end
    end # context when activo is false
  end # describe "#active_for_authentication?"
end
