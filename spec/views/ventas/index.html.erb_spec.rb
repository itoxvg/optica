require 'rails_helper'

RSpec.describe "ventas/index", type: :view do

  let(:cliente) { create :cliente }
  let(:vendedor) { create :vendedor }

  before(:each) do
    assign(:ventas, [
      Venta.create!(
        folio: "Folio1",
        observaciones: "MyText",
        saldada: false,
        descuento: 0,
        total: 1,
        cliente: cliente,
        usuario: vendedor
      ),
      Venta.create!(
        folio: "Folio2",
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
    assert_select "tr>td", :text => "Folio1".to_s, :count => 1
    assert_select "tr>td", :text => "Folio2".to_s, :count => 1
  end
end
