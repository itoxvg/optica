require 'rails_helper'

RSpec.describe "vendedores/index", type: :view do

  before(:each) do
    assign(:vendedores, Kaminari.paginate_array([
      Vendedor.create!(
        nombre: "Nombre",
        telefono: "Telefono",
        email: "email@gmail.com",
        password: "123123123",
        password_confirmation: "123123123",
      ),
      Vendedor.create!(
        nombre: "Nombre dos",
        telefono: "Telefono",
        email: "email_dos@gmail.com",
        password: "123123123",
        password_confirmation: "123123123",
      )
    ]).page(1))
  end

  it "muestra la lista de vendedores" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 1
    assert_select "tr>td", :text => "vendedor".to_s, :count => 2
  end
end
