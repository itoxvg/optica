require 'rails_helper'

RSpec.describe "ventas/show", type: :view do

  let(:cliente) { create :cliente }
  let(:vendedor) { create :vendedor }

  before(:each) do
    @venta = assign(:venta, Venta.create!(
      folio: "Folio1",
      observaciones: "MyText",
      saldada: false,
      descuento: 0,
      total: 1,
      cliente: cliente,
      usuario: vendedor
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Folio1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/0/)
    expect(rendered).to match(/1/)
  end
end
