require 'rails_helper'

RSpec.describe ClientePolicy, type: :policy do

  let(:vendedor) { create :vendedor }
  let(:admin) { create :administrador }
  let(:registro) { create :cliente }

  subject { described_class }

  permissions :index? do
    it "debe acceder cuando es vendedor" do
      expect(subject).to permit(vendedor, registro)
    end

    it "debe acceder cuando es administrador" do
      expect(subject).to permit(admin, registro)
    end
  end

  permissions :new?, :create?, :show? do
    it "debe acceder cuando es vendedor" do
      expect(subject).to permit(vendedor, registro)
    end

    it "debe acceder cuando es administrador" do
      expect(subject).to permit(admin, registro)
    end
  end

  permissions :edit?, :update? do
    it "no debe acceder cuando es vendedor" do
      expect(subject).not_to permit(vendedor, registro)
    end

    it "debe acceder cuando es administrador" do
      expect(subject).to permit(admin, registro)
    end
  end

end
