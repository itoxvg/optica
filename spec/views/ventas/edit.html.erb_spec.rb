require 'rails_helper'

RSpec.describe "ventas/edit", type: :view do

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

  it "renders the edit venta form" do
    render

    assert_select "form[action=?][method=?]", venta_path(@venta), "post" do

      assert_select "input[name=?]", "venta[folio]"

      assert_select "textarea[name=?]", "venta[observaciones]"

      assert_select "input[name=?]", "venta[saldada]"

      assert_select "input[name=?]", "venta[descuento]"

      assert_select "input[name=?]", "venta[total]"

      assert_select "input[name=?]", "venta[cliente_id]"

      assert_select "input[name=?]", "venta[usuario_id]"
    end
  end
end
