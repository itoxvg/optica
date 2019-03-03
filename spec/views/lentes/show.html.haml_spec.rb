require 'rails_helper'

RSpec.describe "lentes/show", type: :view do

  let(:vendedor) { create :vendedor }

  before(:each) do
    @lente = assign(:lente, Lente.create!(
      nombre: "lente 2",
      codigo: "LN2",
      descripcion: "descripción del lente 2",
      precio_venta: 100,
      precio_compra: 0,
      existencia: 10,
      tipo: "polarizado",
      usuario: vendedor
    ))
  end

  it "muestra los atributos" do
    render
    expect(rendered).to match(/lente 2/)
    expect(rendered).to match(/LN2/)
    expect(rendered).to match(/polarizado/)
  end
end
