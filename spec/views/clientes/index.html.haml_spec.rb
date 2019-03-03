require 'rails_helper'

RSpec.describe "clientes/index", type: :view do
  let(:domicilio) { attributes_for :domicilio }

  before(:each) do
    assign(:clientes, Kaminari.paginate_array([
      Cliente.create!(
        :nombre => "Nombre",
        :rfc => "Rfc",
        :telefono => "Telefono",
        :domicilio_attributes => domicilio
      ),
      Cliente.create!(
        :nombre => "Nombre 2",
        :rfc => "Rfc",
        :telefono => "Telefono",
        :domicilio_attributes => domicilio
      )
    ]).page(1))
  end

  it "muestra la lista de clientes" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 1
    assert_select "tr>td", :text => "Rfc".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
  end
end
