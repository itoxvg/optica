require 'rails_helper'

RSpec.describe "empresas/show", type: :view do
  before(:each) do
    @empresa = assign(:empresa, Empresa.create!(
      nombre: "Nombre",
      rfc: "Rfc",
      eslogan: "Eslogan",
      logotipo: FactoryBotHelpers.subir_archivo(nombre: 'opticajj.jpg', formato: 'jpg')
    ))
  end

  it "se muestran los atributos" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Rfc/)
    expect(rendered).to match(/Eslogan/)
  end
end
