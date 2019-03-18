require 'rails_helper'

RSpec.describe "clientes/edit", type: :view do

  let(:corporacion) { create :corporacion }

  before(:each) do
    @cliente = assign(:cliente, Cliente.create!(
      nombre: "Nombre",
      rfc: "Rfc",
      telefono: "Telefono",
      corporacion_id: corporacion.id
    ))
  end

  it "muestra el formulario de editar cliente" do
    render

    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do
      assert_select "input[name=?]", "cliente[nombre]"
      assert_select "input[name=?]", "cliente[rfc]"
      assert_select "input[name=?]", "cliente[telefono]"
      assert_select "select[name=?]", "cliente[corporacion_id]"
    end
  end
end
