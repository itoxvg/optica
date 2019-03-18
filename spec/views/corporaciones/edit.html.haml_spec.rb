require 'rails_helper'

RSpec.describe "corporaciones/edit", type: :view do
  before(:each) do
    @corporacion = assign(:corporacion, Corporacion.create!(
      nombre: "Nombre",
      rfc: "Rfc",
      eslogan: "Eslogan",
      logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
    ))
  end

  it "muestra el formulario de corporacion" do
    render

    assert_select "form[action=?][method=?]", corporacion_path(@corporacion), "post" do
      assert_select "input[name=?]", "corporacion[nombre]"
      assert_select "input[name=?]", "corporacion[rfc]"
      assert_select "input[name=?]", "corporacion[eslogan]"
      assert_select "input[name=?]", "corporacion[logotipo]"
    end
  end
end
