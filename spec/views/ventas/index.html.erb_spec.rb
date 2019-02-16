require 'rails_helper'

RSpec.describe "ventas/index", type: :view do

  let(:cliente) { create :cliente }
  let(:vendedor) { create :vendedor }

  before(:each) do
    assign(:ventas, [
      Venta.create!(
        observaciones: "MyText",
        saldada: false,
        descuento: 0,
        total: 1,
        cliente: cliente,
        usuario: vendedor
      ),
      Venta.create!(
        observaciones: "MyText",
        saldada: false,
        descuento: 0,
        total: 1,
        cliente: cliente,
        usuario: vendedor
      )
    ])
  end

  it "renders a list of ventas" do
    render
    assert_select "tr>td", :text => cliente.nombre, :count => 2
  end
end
