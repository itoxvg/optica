require 'rails_helper'

RSpec.describe DomiciliosHelper, type: :helper do

  describe "#opciones_de_estados" do
    it "no debe estar vacia" do
      expect(opciones_de_estados).to_not be_empty
    end

    it "debe tener el estado 'Oaxaca'" do
      expect(opciones_de_estados).to include "Oaxaca"
    end
  end # describe "#opciones_de_estados"

end
