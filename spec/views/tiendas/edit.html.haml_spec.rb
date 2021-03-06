require 'rails_helper'

RSpec.describe "tiendas/edit", type: :view do
  before(:each) do
    @tienda = assign(:tienda, Tienda.create!(
      nombre: "Nombre",
      rfc: "Rfc",
      eslogan: "Eslogan",
      logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
    ))
  end

  it "muestra el formulario de tienda" do
    render

    assert_select "form[action=?][method=?]", tienda_path(@tienda), "post" do
      assert_select "input[name=?]", "tienda[nombre]"
      assert_select "input[name=?]", "tienda[rfc]"
      assert_select "input[name=?]", "tienda[eslogan]"
      assert_select "input[name=?]", "tienda[logotipo]"
    end
  end
end
