FactoryBot.define do
  factory :venta do
    sequence(:folio) { |n| "#{n}" }
    observaciones { "MyText" }
    saldada { true }
    fecha_entrega { "2019-02-06 18:04:16" }
    descuento { 0 }
    total { 1 }
    cliente { nil }
    usuario { nil }
  end
end
