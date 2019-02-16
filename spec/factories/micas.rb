FactoryBot.define do
  factory :mica do
    sequence(:nombre) { |n| "mi#{n}" }
    sequence(:codigo) { |n| "m#{n}" }
    descripcion { "MyText" }
    precio_venta { 1 }
    precio_compra { 1 }
    existencia { 1 }
    tipo { ['policarbonato', 'monofocal'].sample }
  end
end
