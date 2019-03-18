require 'rails_helper'

RSpec.describe "corporaciones/new", type: :view do
  before(:each) do
    assign(:corporacion, Corporacion.new(
      nombre: "Nombre",
      rfc: "Rfc",
      eslogan: "Eslogan",
      logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
    ))
  end

  it "muestra el formulario de Corporacion" do
    render

    assert_select "form[action=?][method=?]", corporaciones_path, "post" do
      assert_select "input[name=?]", "corporacion[nombre]"
      assert_select "input[name=?]", "corporacion[rfc]"
      assert_select "input[name=?]", "corporacion[eslogan]"
      assert_select "input[name=?]", "corporacion[logotipo]"
    end
  end
end
