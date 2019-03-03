require 'rails_helper'

RSpec.describe "armazones/show", type: :view do

  let(:vendedor) { create :vendedor }

  before(:each) do
    @armazon = assign(:armazon, Armazon.create!(
      nombre: "armazon 2",
      codigo: "AZ2",
      descripcion: "descripción del armazones 2",
      precio_venta: 100,
      precio_compra: 0,
      existencia: 10,
      tipo: "sobrepuesto",
      usuario: vendedor
    ))
  end

  it "muestra los atributos" do
    render
    expect(rendered).to match(/armazon 2/)
    expect(rendered).to match(/AZ2/)
    expect(rendered).to match(/sobrepuesto/)
  end
end
