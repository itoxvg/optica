require 'rails_helper'

RSpec.describe CorporacionPolicy, type: :policy do

  let(:vendedor) { create :vendedor }
  let(:admin) { create :administrador }
  let(:registro) { create :corporacion }

  subject { described_class }

  permissions :index? do
    it "debe acceder cuando es vendedor" do
      expect(subject).to permit(vendedor, registro)
    end

    it "debe acceder cuando es administrador" do
      expect(subject).to permit(admin, registro)
    end
  end

  permissions :new?, :create? do
    it "debe acceder cuando es vendedor" do
      expect(subject).to permit(vendedor, registro)
    end

    it "debe acceder cuando es administrador" do
      expect(subject).to permit(admin, registro)
    end
  end

  permissions :show?, :edit?, :update?, :destroy? do
    it "debe acceder cuando es vendedor" do
      expect(subject).to permit(vendedor, registro)
    end

    it "debe acceder cuando es administrador" do
      expect(subject).to permit(admin, registro)
    end
  end

end
