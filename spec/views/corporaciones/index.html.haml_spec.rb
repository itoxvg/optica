require 'rails_helper'

RSpec.describe "corporaciones/index", type: :view do
  before(:each) do
    assign(:corporaciones, Kaminari.paginate_array([
      Corporacion.create!(
        nombre: "Nombre",
        rfc: "Rfc",
        eslogan: "Eslogan",
        logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
      ),
      Corporacion.create!(
        nombre: "Nombre",
        rfc: "Rfc",
        eslogan: "Eslogan",
        logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
      )
    ]).page(1))
  end

  it "muestra la lista de corporaciones" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Rfc".to_s, count: 2
  end
end
