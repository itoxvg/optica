require 'rails_helper'

RSpec.describe "lentes/new", type: :view do
  let(:vendedor) { create :vendedor }

  before(:each) do
    assign(:lente, Lente.new(
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

  it "muestra el formulario de nuevo lente" do
    render

    assert_select "form[action=?][method=?]", lentes_path, "post" do

      assert_select "input[name=?]", "lente[nombre]"

      assert_select "input[name=?]", "lente[codigo]"

      assert_select "textarea[name=?]", "lente[descripcion]"

      assert_select "input[name=?]", "lente[precio_venta]"

      assert_select "input[name=?]", "lente[precio_compra]"

      assert_select "input[name=?]", "lente[existencia]"

      assert_select "select[name=?]", "lente[tipo]"
    end
  end
end
