require 'rails_helper'

RSpec.describe "clientes/show", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!(
      nombre: "Nombre",
      rfc: "Rfc",
      telefono: "telefono",
    ))
  end

  it "muestra los atributos" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Rfc/)
    expect(rendered).to match(/telefono/)
  end
end
