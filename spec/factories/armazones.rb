FactoryBot.define do
  factory :armazon do
    sequence(:nombre) { |n| "az#{n}" }
    sequence(:codigo) { |n| "a#{n}" }
    descripcion { "MyText" }
    precio_venta { 1 }
    precio_compra { 1 }
    existencia { 1 }
    tipo { ['ranurado', 'sobrepuesto'].sample }
  end
end
