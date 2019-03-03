require 'rails_helper'

RSpec.describe "vendedores/new", type: :view do
  before(:each) do
    assign(:vendedor, Vendedor.new(
      nombre: "Nombre",
      telefono: "Telefono",
      email: "email@gmail.com",
      password: "123123123",
      password_confirmation: "123123123",
    ))
  end

  it "muestra el formulario de nuevo vendedor" do
    render

    assert_select "form[action=?][method=?]", vendedores_path, "post" do

      assert_select "input[name=?]", "vendedor[nombre]"

      assert_select "input[name=?]", "vendedor[telefono]"

      assert_select "input[name=?]", "vendedor[email]"

      assert_select "input[name=?]", "vendedor[password]"

      assert_select "input[name=?]", "vendedor[password_confirmation]"
    end
  end
end
