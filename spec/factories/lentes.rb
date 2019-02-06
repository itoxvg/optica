FactoryBot.define do
  factory :lente do
    sequence(:nombre) { |n| "lt#{n}" }
    sequence(:codigo) { |n| "l#{n}" }
    descripcion { "MyText" }
    precio_venta { 1 }
    precio_compra { 1 }
    existencia { 1 }
    tipo { ['polarizado', 'filtro uv'].sample }
  end
end
