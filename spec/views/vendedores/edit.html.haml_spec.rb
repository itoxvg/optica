require 'rails_helper'

RSpec.describe "vendedores/edit", type: :view do
  before(:each) do
    @vendedor = assign(:vendedor, Vendedor.create!(
      nombre: "Nombre",
      telefono: "Telefono",
      email: "email@gmail.com",
      password: "123123123",
      password_confirmation: "123123123",
    ))
  end

  it "muestra el formulario de editar vendedor" do
    render

    assert_select "form[action=?][method=?]", vendedor_path(@vendedor), "post" do

      assert_select "input[name=?]", "vendedor[nombre]"

      assert_select "input[name=?]", "vendedor[telefono]"

      assert_select "input[name=?]", "vendedor[email]"

      assert_select "input[name=?]", "vendedor[password]"

      assert_select "input[name=?]", "vendedor[password_confirmation]"
    end
  end
end
