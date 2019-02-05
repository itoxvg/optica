FactoryBot.define do
  factory :producto do
    nombre { "MyString" }
    sequence(:codigo) { |n| "#{n}234" }
    descripcion { "MyText" }
    precio_venta { 1 }
    precio_compra { 1 }
    existencia { 1 }
  end

  trait :armazon do
    type { 'Armazon' }
    tipo { ['ranurado', 'sobrepuesto'].sample }
  end

  trait :lente do
    type { 'Lente' }
    tipo { ['polarizado', 'filtro uv'].sample }
  end

  trait :mica do
    type { 'Mica' }
    tipo { ['policarbonato', 'bifocal'].sample }
  end

end
