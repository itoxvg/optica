require 'rails_helper'

RSpec.describe "ventas/index", type: :view do

  let(:cliente) { create :cliente }
  let(:vendedor) { create :vendedor }

  before(:each) do
    assign(:ventas, Kaminari.paginate_array([
      Venta.create!(
        observaciones: "MyText",
        saldada: true,
        fecha_entrega: "2019-02-27 00:00:00",
        total: 1,
        forma_de_pago: '01',
        cliente: cliente,
        usuario: vendedor
      ),
      Venta.create!(
        observaciones: "MyText",
        saldada: true,
        fecha_entrega: "2019-02-27 00:00:00",
        total: 1,
        forma_de_pago: '02',
        cliente: cliente,
        usuario: vendedor
      )
    ]).page(1))
  end

  it "mostrar la lista de ventas" do
    render
    assert_select "tr>td", :text => "$1.00".to_s, :count => 4
  end
end
