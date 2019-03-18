require 'rails_helper'

RSpec.describe "clientes/new", type: :view do

  let(:corporacion) { create :corporacion }

  before(:each) do
    assign(:cliente, Cliente.new(
      nombre: "Nombre",
      rfc: "Rfc",
      telefono: "Telefono",
      corporacion_id: corporacion.id
    ))
  end

  it "muestra el formulario de nuevo cliente" do
    render

    assert_select "form[action=?][method=?]", clientes_path, "post" do
      assert_select "input[name=?]", "cliente[nombre]"
      assert_select "input[name=?]", "cliente[rfc]"
      assert_select "input[name=?]", "cliente[telefono]"
      assert_select "select[name=?]", "cliente[corporacion_id]"
    end
  end
end
