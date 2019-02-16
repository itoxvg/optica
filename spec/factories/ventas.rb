FactoryBot.define do
  factory :venta do
    codigo { nil }
    observaciones { "MyText" }
    saldada { true }
    fecha_entrega { "2019-02-06 18:04:16" }
    descuento { 0 }
    total { 1 }
    cliente { nil }
    usuario { nil }
  end
end
