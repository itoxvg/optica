require 'rails_helper'

RSpec.describe "ventas/new", type: :view do

  let(:cliente) { create :cliente }
  let(:vendedor) { create :vendedor }

  before(:each) do
    assign(:venta, Venta.new(
      observaciones: "MyText",
      saldada: false,
      descuento: 0,
      total: 1,
      cliente: cliente,
      usuario: vendedor
    ))
  end

  it "renders new venta form" do
    render

    assert_select "form[action=?][method=?]", ventas_path, "post" do

      assert_select "textarea[name=?]", "venta[observaciones]"

      assert_select "input[name=?]", "venta[descuento]"

      assert_select "input[name=?]", "venta[total]"
    end
  end
end
