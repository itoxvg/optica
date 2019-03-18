require 'rails_helper'

RSpec.describe "tiendas/new", type: :view do
  before(:each) do
    assign(:tienda, Tienda.new(
      nombre: "Nombre",
      rfc: "Rfc",
      eslogan: "Eslogan",
      logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
    ))
  end

  it "muestra el formulario de la tienda" do
    render

    assert_select "form[action=?][method=?]", tiendas_path, "post" do
      assert_select "input[name=?]", "tienda[nombre]"
      assert_select "input[name=?]", "tienda[rfc]"
      assert_select "input[name=?]", "tienda[eslogan]"
      assert_select "input[name=?]", "tienda[logotipo]"
    end
  end
end
